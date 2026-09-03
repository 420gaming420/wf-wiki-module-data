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
    ["CHECKLIST"] = "",
    ["NAME"] = "Name",
    ["DESCRIPTION"] = "Description",
    ["POSITION"] = "Position",
    ["INTRODUCED"] = "Introduced",
    ["TAGS"] = "Tags",
    ["PRICE"] = "Price"
}

--- Internal helper to format cell content based on column name
local function formatCell(colKey, name, entry)
    if colKey == "CHECKLIST" then
        return 'class="checklist-cell" data-item="' .. name .. '" | <input type="checkbox" class="checklist-box" data-item="' .. name .. '"/>'
    elseif colKey == "NAME" then
        return "[[" .. (entry.Link or name) .. "]]"
    elseif colKey == "DESCRIPTION" then
        return entry.Description or ""
    elseif colKey == "POSITION" then
        return entry.Position or ""
    elseif colKey == "INTRODUCED" then
        return entry.Introduced or ""
    elseif colKey == "TAGS" then
        return entry.Tags and table.concat(entry.Tags, ", ") or ""
    elseif colKey == "PRICE" then
        if entry.Price then
            local prices = {}
            for res, amount in pairs(entry.Price) do
                table.insert(prices, string.format("%d %s", amount, res))
            end
            return table.concat(prices, "<br/>")
        end
        return ""
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

    if valNameUpper == "NAME" then
        return entryTable.Name or honoriaName
    elseif valNameUpper == "LINK" then
        return "[[" .. (entryTable.Link or honoriaName) .. "]]"
    elseif valNameUpper == "POSITION" then
        return entryTable.Position or "Unknown"
    elseif valNameUpper == "INTRODUCED" then
        if entryTable.Introduced ~= nil then
            local ver = Version._getVersion(entryTable.Introduced)
            if ver ~= nil then return Version.getVersionLink(entryTable.Introduced) end
            return "Update " .. entryTable.Introduced
        end
        return "Unknown update"
    elseif valNameUpper == "DESCRIPTION" then
        return entryTable.Description or ""
    elseif valNameUpper == "INTERNALNAME" then
        return entryTable.InternalName or ""
    elseif valNameUpper == "TAGS" then
        return entryTable.Tags and table.concat(entryTable.Tags, ", ") or ""
    elseif valNameUpper == "PRICE" then
        if entryTable.Price then
            local prices = {}
            for resource, amount in pairs(entryTable.Price) do
                table.insert(prices, string.format("%d %s", amount, resource))
            end
            return table.concat(prices, ", ")
        end
        return "N/A"
    else
        return entryTable[valName] or ""
    end
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
--  @param[opt] {string} columns Comma-separated list of columns (e.g. "Checklist, Name, Description, Position, Introduced, Tags, Price")
--  @param[opt] {string} position Filter by Position
--  @param[opt] {string} tag Filter by Tag
--  @param[opt] {string} introduced Filter by Introduced version
--  @param[opt] {string} checklist Add "true" to automatically prepand a checklist column if not specified in columns
function p.buildHonoriaTable(frame)
    local filterPosition = frame.args["position"] or "All"
    local filterTag = frame.args["tag"] or "All"
    local filterIntroduced = frame.args["introduced"] or "All"
    local enableChecklist = (frame.args["checklist"] == "true")
    
    -- Parse selected columns
    local rawColumns = frame.args["columns"] or "Name, Description, Position, Introduced, Tags, Price"
    if enableChecklist and not string.find(string.upper(rawColumns), "CHECKLIST") then
        rawColumns = "Checklist, " .. rawColumns
    end

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

    local isChecklistActive = enableChecklist or (string.find(string.upper(rawColumns), "CHECKLIST") ~= nil)
    local tableClass = 'wikitable sortable' .. (isChecklistActive and ' warframe-checklist' or '')

    local wikitable = {
        '{| class="' .. tableClass .. '"',
        '! ' .. table.concat(headerCells, ' !! ')
    }

    -- Build Rows
    for _, name in ipairs(sortedNames) do
        local entry = HonoriaData[name]
        local rowCells = {}

        for _, colKey in ipairs(selectedColumns) do
            table.insert(rowCells, formatCell(colKey, name, entry))
        end

        table.insert(wikitable, '|-\n| ' .. table.concat(rowCells, ' || '))
    end

    table.insert(wikitable, '|}')
    return table.concat(wikitable, '\n')
end

return p
