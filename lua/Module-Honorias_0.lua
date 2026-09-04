--- '''Honorias''' retrieves and stores Honoria title data of [[WARFRAME]].<br/>
--  
--  On this Wiki, Honorias is used in:
--  * [[Honoria]]
--  
--  @module     honorias
--  @alias      p
--  @author     [[User:evilflora|Evilflora]]
--  @require    [[Module:Honorias/data]]
--  @require    [[Module:Version]]
--  @require    [[Module:Table]]
--  @release    alpha
--  

local p = {}

-- Load data from sub-module
local RawData = mw.loadData('Module:Honorias/data')
local HonoriaData = RawData.Honorias or RawData

local Version = require('Module:Version')
local Table = require('Module:Table')

--- Map of column keys to display headers
local COLUMN_HEADERS = {
    ["NAME"] = "Name",
    ["DESCRIPTION"] = "Description",
    ["POSITION"] = "Position",
    ["INTRODUCED"] = "Introduced",
    ["TAGS"] = "Tags",
    ["PRICE"] = "Price",
    ["REQUIREMENT"] = "Requirement"
}

--- Internal concat to format Tags 
local function safeConcat(tbl, separator)
    if not tbl then return "" end
    local copy = {}
    for _, v in pairs(tbl) do
        table.insert(copy, v)
    end
    return table.concat(copy, separator)
end

--- Internal helper to format the price of an entry
local function getFormattedPrice(entry, separator)
    if not entry or not entry.Price then return "" end
    separator = separator or "<br/>"

    local prices = {}
    for res, amount in pairs(entry.Price) do
        local resLower = string.lower(res)
        if resLower == "cc" or resLower == "sc" then
            table.insert(prices, string.format("{{%s|%s}}", resLower, amount))
        else
            table.insert(prices, string.format("%s {{Resource|%s}}", amount, res))
        end
    end
    return table.concat(prices, separator)
end

--- Internal helper to format cell content based on column name
local function formatCell(colKey, name, entry)
    if colKey == "NAME" then
        return entry.Name or "MISSING_DATA"
    elseif colKey == "DESCRIPTION" then
        return entry.Description or ""
    elseif colKey == "REQUIREMENT" then
        if entry.Description and entry.Description ~= "" then
            return entry.Description
        end
        return getFormattedPrice(entry, "<br/>")
    elseif colKey == "POSITION" then
        return entry.Position or ""
    elseif colKey == "INTRODUCED" then
        return entry.Introduced or ""
	elseif colKey == "TAGS" then
	    return entry.Tags and safeConcat(entry.Tags, ", ") or ""
    elseif colKey == "PRICE" then
        return getFormattedPrice(entry, "<br/>")
    end
    return ""
end

--- Gets a specific piece of data about a Honoria.
function p.getValue(frame)
    local honoriaName = frame.args[1]
    local valName = frame.args[2]

    if honoriaName == nil or honoriaName == "" then
        error('p.getValue(frame): No Honoria title specified')
    elseif valName == nil or valName == "" then
        error('p.getValue(frame): No value specified for Honoria "' .. mw.text.nowiki(honoriaName) .. '"')
    end

    local entryTable = HonoriaData[honoriaName]
    if entryTable == nil then
        error('p.getValue(frame): No such Honoria "' .. mw.text.nowiki(honoriaName) .. '" found')
    end

    local valNameUpper = string.upper(valName)
    local rawResult = ""

    if valNameUpper == "NAME" then
        rawResult = entryTable.Name or honoriaName
    elseif valNameUpper == "LINK" then
        rawResult = "[[" .. (entryTable.Link or honoriaName) .. "]]"
    elseif valNameUpper == "POSITION" then
        rawResult = entryTable.Position or "Unknown"
    elseif valNameUpper == "INTRODUCED" then
        if entryTable.Introduced ~= nil then
            local ver = Version._getVersion(entryTable.Introduced)
            if ver ~= nil then return Version.getVersionLink(entryTable.Introduced) end
            return "Update " .. entryTable.Introduced
        end
        rawResult = "Unknown update"
    elseif valNameUpper == "DESCRIPTION" then
        rawResult = entryTable.Description or ""
    elseif valNameUpper == "REQUIREMENT" then
        if entryTable.Description and entryTable.Description ~= "" then
            rawResult = entryTable.Description
        else
            rawResult = getFormattedPrice(entryTable, ", ")
        end
    elseif valNameUpper == "INTERNALNAME" then
        rawResult = entryTable.InternalName or ""
    elseif valNameUpper == "TAGS" then
        rawResult = entryTable.Tags and safeConcat(entryTable.Tags, ", ") or ""
    elseif valNameUpper == "PRICE" then
        if entryTable.Price then
            rawResult = getFormattedPrice(entryTable, ", ")
        else
            rawResult = "N/A"
        end
    else
        rawResult = entryTable[valName] or ""
    end

    -- Process any wikitext templates inside strings (e.g. {{cc|100,000}})
    return frame:preprocess(tostring(rawResult))
end

--- Gets the total Honoria count.
function p.getHonoriaCount(frame)
    local position = frame.args["position"] or "All"
    local tag = frame.args["tag"] or "All"
    local total = 0

    for _, entry in pairs(HonoriaData) do
        if not entry._IgnoreEntry then
            local matchesPosition = (position == "All" or entry.Position == position)
            local matchesTag = (tag == "All")

            if tag ~= "All" and entry.Tags then
                for _, entryTag in ipairs(entry.Tags) do
                    if entryTag == tag then
                        matchesTag = true
                        break
                    end
                end
            end

            if matchesPosition and matchesTag then
                total = total + 1
            end
        end
    end

    return total
end

--- Builds a simple sorted list of all Honoria names.
function p.simpleHonoriaNameList(frame)
    local resultList = {}
    for name, entry in pairs(HonoriaData) do
        if not entry._IgnoreEntry then table.insert(resultList, name) end
    end
    table.sort(resultList)
    return table.concat(resultList, "<br/>")
end

--- Builds a Wikitable listing all Honorias filtered and with customizable columns.
--  @param[opt] {string} columns Comma-separated list of columns (e.g. "Name, Description, Position, Introduced, Tags, Price, Requirement")
--  @param[opt] {string} position Filter by Position
--  @param[opt] {string} tag Filter by Tag
--  @param[opt] {string} introduced Filter by Introduced version
--  @param[opt] {string} checklist Add "true" to enable checklist data attributes and styles
--  @param[opt] {string} tableid Custom ID for the checklist table state saving (Default: "Honoria Checklist")
function p.buildHonoriaTable(frame)
    local filterPosition = frame.args["position"] or "All"
    local filterTag = frame.args["tag"] or "All"
    local filterIntroduced = frame.args["introduced"] or "All"
    local enableChecklist = (frame.args["checklist"] == "true")
    local tableId = frame.args["tableid"] or "Honoria Checklist"
    
    -- Parse selected columns
    local rawColumns = frame.args["columns"] or "Name, Description, Position, Introduced, Tags, Price"
    local selectedColumns = {}

    for col in string.gmatch(rawColumns, '([^,]+)') do
        local cleanCol = string.upper(mw.text.trim(col))
        if COLUMN_HEADERS[cleanCol] ~= nil then
            table.insert(selectedColumns, cleanCol)
        end
    end

    -- Filter entries
    local sortedNames = {}
    for name, entry in pairs(HonoriaData) do
        if not entry._IgnoreEntry then
            local keep = true

            if filterPosition ~= "All" and entry.Position ~= filterPosition then keep = false end
            if filterIntroduced ~= "All" and tostring(entry.Introduced) ~= filterIntroduced then keep = false end
            if filterTag ~= "All" then
                local hasTag = false
                if entry.Tags then
                    for _, tag in ipairs(entry.Tags) do
                        if tag == filterTag then hasTag = true; break end
                    end
                end
                if not hasTag then keep = false end
            end

            if keep then table.insert(sortedNames, name) end
        end
    end

    table.sort(sortedNames)

    -- Build Header
    local headerCells = {}
    for _, colKey in ipairs(selectedColumns) do
        table.insert(headerCells, COLUMN_HEADERS[colKey])
    end

    local tableClass = enableChecklist and 'listtable sortable lighttable store-table' or 'wikitable sortable'
    local tableAttr = enableChecklist and string.format(' class="%s" data-tableid="%s"', tableClass, tableId) or string.format(' class="%s"', tableClass)

    local wikitable = {
        '{|' .. tableAttr,
        '! ' .. table.concat(headerCells, ' !! ')
    }

    -- Build Rows
    for _, name in ipairs(sortedNames) do
        local entry = HonoriaData[name]
        local rowCells = {}

        for _, colKey in ipairs(selectedColumns) do
            table.insert(rowCells, formatCell(colKey, name, entry))
        end

        local rowPrefix = enableChecklist and string.format('|- data-rowid="%s" id="%s"', name, name) or '|-'
        table.insert(wikitable, rowPrefix .. '\n| ' .. table.concat(rowCells, ' || '))
    end

    table.insert(wikitable, '|}')

    -- Preprocess result to parse templates inside table contents
    return frame:preprocess(table.concat(wikitable, '\n'))
end

return p
