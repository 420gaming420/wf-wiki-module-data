--- '''Synthesis''' retrieves and displays Synthesis targets data from [[Synthesis]].<br/>
--
--  On this Wiki, Synthesis is used in:
--  * [[Synthesis]]
--
--  @module      synthesis
--  @alias       p
--  @author      [[User:evilflora|Evilflora]]
--  @require     [[Module:Synthesis/data]]
--  @require     [[Module:Codex/data]]
--  @require     [[Module:Missions/data]]
--  @require     [[Module:Version]]
--  @require     [[Module:Table]]
--  @release     beta
--  

local p = {}

-- mw.loadData caches the returned table read-only, which is why we resolve
-- the nested "real" table once here instead of re-checking on every call.
local RawData = mw.loadData('Module:Synthesis/data')
local SynthesisData = RawData.Synthesis or RawData.Targets or RawData
local CodexRaw = mw.loadData('Module:Codex/data')
local CodexData = CodexRaw.Enemy or CodexRaw.Codex or CodexRaw
local MissionsData = mw.loadData('Module:Missions/data')
local Version = require('Module:Version')
local Table = require('Module:Table')

--- Number of item columns per row in the compact grid view.
-- Kept as a named constant so the layout can be tuned in one place.
local GRID_CHUNK_SIZE = 6

--- Map of columns with their keys and display headers (order is preserved).
local COLUMN_HEADERS = {
    { key = "NAME",    label = "Name" },
    { key = "PLANET",  label = "Planet" },
    { key = "NODE",    label = "Node" },
    { key = "MISSION", label = "Mission Type" },
    { key = "NOTE",    label = "Note" },
}

--- Strips a wiki-unfriendly name down to something usable as a file name fragment.
-- @param name string target name, e.g. "Kavu Larva (Example)"
-- @return string cleaned name with spaces, dashes and parentheses removed
local function _cleanFileName(name)
    if type(name) ~= "string" then
        return "Default"
    end
    return (name:gsub("[ %-%(%)()]", ""))
end

--- Resolves planet, node link and mission link text for a single location string.
-- Centralised here because both buildSynthesisGrid and buildSynthesisTable need
-- the exact same Planet/Node/Mission resolution, and keeping two copies is how
-- the "MissionData vs MissionsData" typo bug slipped in and stayed silent.
-- @param locName string trimmed location/node name
-- @return string planet display text, or "&nbsp;" if unknown
-- @return string node wikilink text
-- @return string mission display text (plain, not a link), or "" if unknown
local function _resolveLocationInfo(locName)
    local planet = "&nbsp;"
    local node = "[[" .. locName .. "]]"
    local missionText = ""

    local nodeEntry = MissionsData and MissionsData.by and MissionsData.by.Name
        and MissionsData.by.Name[locName] and MissionsData.by.Name[locName][1]

    if nodeEntry then
        planet = "[[" ..nodeEntry.Planet .. "]]" or "&nbsp;"
        node = "[[" .. (nodeEntry.Name or locName) .. "]]"

        local mType = nodeEntry.Type
        local mInfo = mType and MissionsData.MissionTypes and MissionsData.MissionTypes[mType]
        missionText = mInfo and (mInfo.Name or mType) or (mType or "")
    end

    return planet, node, missionText
end

--- Gets a specific piece of data about a Synthesis target.
-- @param frame frame object; args[1] = Synthesis target name, args[2] = value name to retrieve
-- @return string the resolved and preprocessed value, or raises an error if not found
function p.getValue(frame)
    local synthesisName = frame.args[1]
    local valName = frame.args[2]

    if synthesisName == nil or synthesisName == "" then
        error('p.getValue(frame): No Synthesis target specified')
    elseif valName == nil or valName == "" then
        error('p.getValue(frame): No value specified for Synthesis target "' .. mw.text.nowiki(synthesisName) .. '"')
    end

    local entryTable = SynthesisData[synthesisName]
    if entryTable == nil then
        error('p.getValue(frame): No such Synthesis target "' .. mw.text.nowiki(synthesisName) .. '" found')
    end

    local valNameUpper = string.upper(valName)
    local rawResult = ""
    if valNameUpper == "NAME" then
        rawResult = synthesisName
    elseif valNameUpper == "PLANET" or valNameUpper == "NODE" or valNameUpper == "MISSION" or valNameUpper == "NOTE" then
        rawResult = "[[" .. (entryTable.Link or synthesisName) .. "]]"
    else
        rawResult = entryTable[valName] or ""
    end

    return frame:preprocess(tostring(rawResult))
end

--- Gets the total Synthesis count matching the given filters.
-- @param frame frame object; named args "imprint", "size", "scanpoints" (default "All" = no filter)
-- @return number total count of matching Synthesis entries
function p.getSynthesisCount(frame)
    local imprint    = frame.args["imprint"]    or "All"
    local size       = frame.args["size"]       or "All"
    local scanpoints = frame.args["scanpoints"] or "All"
    local total = 0

    for _, entry in pairs(SynthesisData) do
        -- _IgnoreEntry marks placeholder/meta rows in the data table that should never be counted
        if type(entry) == "table" and not entry._IgnoreEntry then
            local matchesImprint    = (imprint    == "All" or tostring(entry.IsImprint) == tostring(imprint))
            local matchesSize       = (size       == "All" or entry.Size       == size)
            local matchesScanpoints = (scanpoints == "All" or tostring(entry.ScanPoints) == tostring(scanpoints))

            if matchesImprint and matchesSize and matchesScanpoints then
                total = total + 1
            end
        end
    end

    return total
end

--- Builds a sorted list of all Synthesis names displayed across a given number of columns.
-- @param frame frame object; args["columns"] or args[1] = number of columns (default 1)
-- @return string wikitext for a single bullet list (1 column) or a multi-column wikitable
function p.simpleSynthesisNameList(frame)
    local columns = tonumber(frame.args["columns"] or frame.args[1]) or 1
    if not SynthesisData then
        return "ERROR: SynthesisData is nil."
    end

    local resultList = {}
    for name, entry in pairs(SynthesisData) do
        if type(entry) == "table" and not entry._IgnoreEntry then
            table.insert(resultList, name)
        end
    end
    table.sort(resultList)

    local totalItems = #resultList
    if totalItems == 0 then
        return ""
    end

    if columns <= 1 then
        local lines = {}
        for _, name in ipairs(resultList) do
            local entry = SynthesisData[name]
            local imprintText = entry.IsImprint and " (imprint)" or "" -- flag imprint targets inline since they have no separate column here
            table.insert(lines, "*[[" .. name .. "]]" .. imprintText)
        end
        local html = table.concat(lines, "\n")
        if frame and type(frame.preprocess) == "function" then
            return frame:preprocess(html)
        end
        return html
    end

    -- Multi-column layout: split the sorted list into `columns` chunks of equal size
    local itemsPerCol = math.ceil(totalItems / columns)
    local html = '{|\n'
    for c = 1, columns do
        html = html .. '|\n'
        local startIndex = (c - 1) * itemsPerCol + 1
        local endIndex = math.min(c * itemsPerCol, totalItems)

        if startIndex <= totalItems then
            for i = startIndex, endIndex do
                local name = resultList[i]
                local entry = SynthesisData[name]
                local imprintText = entry.IsImprint and " (imprint)" or ""
                html = html .. '*[[' .. name .. ']]' .. imprintText .. '\n' -- fixed: stray "&" before name produced a broken wikilink
            end
        end
    end
    html = html .. '|}'

    if frame and type(frame.preprocess) == "function" then
        return frame:preprocess(html)
    end
    return html
end

--- Builds a compact grid displaying Synthesis targets with their image on top and mission locations below.
-- @param frame frame object; args["imprint"] = "true"/"false" to filter imprint-only or non-imprint-only targets
-- @return string wikitext for the grid wikitable
function p.buildSynthesisGrid(frame)
    local status, result = pcall(function()
        local imprintFilter = frame and frame.args and frame.args["imprint"] or nil
        if not SynthesisData then
            return "ERROR: SynthesisData is nil."
        end
        if not CodexData then
            return "ERROR: CodexData is nil."
        end

        local sortedNames = {}
        for name, entry in pairs(SynthesisData) do
            if type(entry) == "table" then
                table.insert(sortedNames, name)
            end
        end
        table.sort(sortedNames)

        local headerCells = {}
        local missionCells = {}

        for _, name in ipairs(sortedNames) do
            local entry = SynthesisData[name]
            local codexEntry = CodexData and CodexData[name] or nil

            if entry and not entry._IgnoreEntry then
                local skip = (imprintFilter == "true" and not entry.IsImprint)
                    or (imprintFilter == "false" and entry.IsImprint)

                if not skip then
                    local cleanName = _cleanFileName(name)
                    local img = entry.Image or (codexEntry and codexEntry.Image) or (cleanName .. "DE.png")
                    local displayName = (name or "Unknown") .. (entry.IsImprint and " (Imprint)" or "")
                    table.insert(headerCells, string.format('[[File:%s|110px]]<br/>%s', img, displayName))

                    local locationLines = {}
                    if type(entry.Locations) == "table" then
                        for _, loc in ipairs(entry.Locations) do
                            if type(loc) == "string" then
                                local cleanLoc = loc:match("^%s*(.-)%s*$")
                                if cleanLoc ~= "" then
                                    -- Was reading the undefined global "MissionData" (missing the "s"),
                                    -- which is always nil, so this branch never ran and no mission
                                    -- info was ever appended. Now uses the shared resolver.
                                    local planet, nodeLink, missionName = _resolveLocationInfo(cleanLoc)
                                    local missionTypeText = ""
                                    if planet ~= "&nbsp;" and missionName ~= "" then
                                        missionTypeText = string.format(" (%s %s)", planet, missionName)
                                    elseif missionName ~= "" then
                                        missionTypeText = string.format(" (%s)", missionName)
                                    end
                                    table.insert(locationLines, nodeLink .. missionTypeText)
                                end
                            end
                        end
                    end

                    local locationsStr = (#locationLines > 0) and table.concat(locationLines, "<br/>") or "&nbsp;"
                    table.insert(missionCells, locationsStr)
                end
            end
        end

        if #headerCells == 0 then
            return "DEBUG: Items list is empty."
        end

        local html = '{| class="wikitable" style="width: 100%;border-spacing:1px;border-collapse:separate;text-align:center"\n'
        local totalItems = #headerCells
        for i = 1, totalItems, GRID_CHUNK_SIZE do
            local rowEnd = math.min(i + GRID_CHUNK_SIZE - 1, totalItems)

            html = html .. '|-\n'
            for j = i, rowEnd do
                html = html .. '| ' .. headerCells[j] .. '\n'
            end

            html = html .. '|-\n'
            for j = i, rowEnd do
                html = html .. '| ' .. missionCells[j] .. '\n'
            end
        end
        html = html .. '|}'

        if frame and type(frame.preprocess) == "function" then
            return frame:preprocess(html)
        end
        return html
    end)

    if not status then
        return "LUA ERROR: " .. tostring(result)
    end
    return result
end

--- Builds a detailed, sortable table listing Synthesis targets, locations and notes with dynamic rowspans.
-- @param frame frame object containing template arguments
-- @return string wikitext for the full sortable table
function p.buildSynthesisTable(frame)
    local status, result = pcall(function()
        if not SynthesisData then
            return "ERROR: SynthesisData is nil."
        end
        if not CodexData then
            return "ERROR: CodexData is nil."
        end

        local html = '{{CustomCollapsible|Synthesis Target Full List|Synthesis}}\n'
        html = html .. '{| class="wikitable sortable" style="width: 100%;border-spacing:1px;border-collapse:separate;text-align:center"\n'
        html = html .. '|-\n'
        for _, col in ipairs(COLUMN_HEADERS) do
            html = html .. string.format('! width="20%%" |\'\'\'%s\'\'\'\n', col.label)
        end

        local sortedNames = {}
        for name, entry in pairs(SynthesisData) do
            if type(entry) == "table" then
                table.insert(sortedNames, name)
            end
        end
        table.sort(sortedNames)

        for _, name in ipairs(sortedNames) do
            local entry = SynthesisData[name]
            if entry and not entry._IgnoreEntry then
                local codexEntry = CodexData and CodexData[name] or nil
                local cleanName = _cleanFileName(name)
                local img = entry.Image or (codexEntry and codexEntry.Image) or (cleanName .. "DE.png")
                local displayName = name .. (entry.IsImprint and " (imprint target)" or "")

                local locations = {}
                if type(entry.Locations) == "table" then
                    for _, loc in ipairs(entry.Locations) do
                        if type(loc) == "string" then
                            local cleanLoc = loc:match("^%s*(.-)%s*$")
                            if cleanLoc ~= "" then
                                table.insert(locations, cleanLoc)
                            end
                        end
                    end
                end
                local locCount = #locations

                local noteStr = entry.Note or ""
                if entry.Standing or entry.Size then
                    -- Standing/Endo cost tables are derived rules, not free-text notes,
                    -- so they're generated here rather than duplicated in the data file.
                    local parts = {}
                    if entry.Standing then
                        local standingDisplay = (entry.Standing < 0) and "Unknown" or entry.Standing
                        table.insert(parts, "[[Standing]]：" .. standingDisplay .. " + 30 * level")
                    end
                    if entry.Size == "Small" then
                        table.insert(parts, "[[Endo]]：" .. "2 = 250, 3 = 350, 4 = 500")
                    else
                        table.insert(parts, "[[Endo]]：" .. "2 = 400, 3 = 560, 4 = 800")
                    end
                    noteStr = table.concat(parts, "<br/>")
                end
                if noteStr == "" then
                    noteStr = "&nbsp;"
                end

                if locCount == 0 then
                    html = html .. '|-\n'
                    html = html .. string.format('| [[File:%s|200px]]<br/>%s\n| &nbsp;\n| &nbsp;\n| &nbsp;\n| %s\n', img, displayName, noteStr)
                else
                    for i, locName in ipairs(locations) do
                        html = html .. '|-\n'
                        if i == 1 then
                            html = html .. string.format('| rowspan="%d" | [[File:%s|200px]]<br/>%s\n', locCount, img, displayName)
                        end

                        local planet, node, missionName = _resolveLocationInfo(locName)
                        local mType = MissionsData and MissionsData.by and MissionsData.by.Name
                            and MissionsData.by.Name[locName] and MissionsData.by.Name[locName][1]
                            and MissionsData.by.Name[locName][1].Type
                        local mInfo = mType and MissionsData.MissionTypes and MissionsData.MissionTypes[mType]
                        local mission = "&nbsp;"
                        if mInfo then
                            mission = "[[" .. (mInfo.Link or mInfo.Name or mType) .. "|" .. (mInfo.Name or mType) .. "]]"
                        elseif missionName ~= "" then
                            mission = missionName
                        end

                        html = html .. string.format('| %s\n| %s\n| %s\n', planet, node, mission)
                        if i == 1 then
                            if locCount > 1 then
                                html = html .. string.format('| rowspan="%d" | %s\n', locCount, noteStr)
                            else
                                html = html .. string.format('| %s\n', noteStr)
                            end
                        end
                    end
                end
            end
        end

        html = html .. '|}\n{{CustomCollapsible/End}}'
        if frame and type(frame.preprocess) == "function" then
            return frame:preprocess(html)
        end
        return html
    end)

    if not status then
        return "LUA ERROR: " .. tostring(result)
    end
    return result
end

return p
