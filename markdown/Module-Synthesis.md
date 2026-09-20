---
title: "Module:Synthesis"
wiki_url: "https://wiki.warframe.com/w/Module/Synthesis"
wiki_timestamp: "2026-09-19T13:38:06Z"
---

**Synthesis** retrieves and displays Synthesis targets data from [Synthesis](/w/Synthesis "Synthesis").   
 On this Wiki, Synthesis is used in:

* [Synthesis](/w/Synthesis "Synthesis")

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Examples](#Examples)
* [3 Documentation](#Documentation)
  + [3.1 Package items](#Package_items)
* [4 See Also](#See_Also)
* [5 Code](#Code)

## Usage

### Template

In template and articles: `{{#invoke:Synthesis|function|input1|input2|...}}`

## Examples

Count Synthesis targets, optionally filtered

`{{#invoke:Synthesis|getSynthesisCount}}`

`{{#invoke:Synthesis|getSynthesisCount|imprint=true}}`

`{{#invoke:Synthesis|getSynthesisCount|size=Small}}`

`{{#invoke:Synthesis|getSynthesisCount|imprint=false|scanpoints=3}}`

List all Synthesis target names

`{{#invoke:Synthesis|simpleSynthesisNameList}}`

`{{#invoke:Synthesis|simpleSynthesisNameList|columns=3}}`

Build the compact image/mission grid

`{{#invoke:Synthesis|buildSynthesisGrid}}`

`{{#invoke:Synthesis|buildSynthesisGrid|imprint=true}}`

`{{#invoke:Synthesis|buildSynthesisGrid|imprint=false}}`

Build the full sortable details table

`{{#invoke:Synthesis|buildSynthesisTable}}`

## Documentation

### Package items

`synthesis.getValue(frame)` (function)
:   Gets a specific piece of data about a Synthesis target.
:   **Parameter**: `frame` frame object; args[1] = Synthesis target name, args[2] = value name to retrieve
:   **Returns**: string the resolved and preprocessed value, or raises an error if not found

`synthesis.getSynthesisCount(frame)` (function)
:   Gets the total Synthesis count matching the given filters.
:   **Parameter**: `frame` frame object; named args "imprint", "size", "scanpoints" (default "All" = no filter)
:   **Returns**: number total count of matching Synthesis entries

`synthesis.simpleSynthesisNameList(frame)` (function)
:   Builds a sorted list of all Synthesis names displayed across a given number of columns.
:   **Parameter**: `frame` frame object; args["columns"] or args[1] = number of columns (default 1)
:   **Returns**: string wikitext for a single bullet list (1 column) or a multi-column wikitable

`synthesis.buildSynthesisGrid(frame)` (function)
:   Builds a compact grid displaying Synthesis targets with their image on top and mission locations below.
:   **Parameter**: `frame` frame object; args["imprint"] = "true"/"false" to filter imprint-only or non-imprint-only targets
:   **Returns**: string wikitext for the grid wikitable

`synthesis.buildSynthesisTable(frame)` (function)
:   Builds a detailed, sortable table listing Synthesis targets, locations and notes with dynamic rowspans.
:   **Parameter**: `frame` frame object containing template arguments
:   **Returns**: string wikitext for the full sortable table

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Synthesis/data](/w/Module:Synthesis/data "Module:Synthesis/data")
* [Synthesis/data/doc](/w/Module:Synthesis/data/doc "Module:Synthesis/data/doc")
* [Synthesis/data/validate](/w/Module:Synthesis/data/validate "Module:Synthesis/data/validate")
* [Synthesis/data/validate/doc](/w/Module:Synthesis/data/validate/doc "Module:Synthesis/data/validate/doc")
* [Synthesis/doc](/w/Module:Synthesis/doc "Module:Synthesis/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [Module:Honorias](/w/Module:Honorias "Module:Honorias") ([/data](/w/Module:Honorias/data "Module:Honorias/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- '''Synthesis''' retrieves and displays Synthesis targets data from [[Synthesis]].  

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
-- @return string planet display text, or " " if unknown
-- @return string node wikilink text
-- @return string mission display text (plain, not a link), or "" if unknown
local function _resolveLocationInfo(locName)
    local planet = " "
    local node = "[[" .. locName .. "]]"
    local missionText = ""

    local nodeEntry = MissionsData and MissionsData.by and MissionsData.by.Name
        and MissionsData.by.Name[locName] and MissionsData.by.Name[locName][1]

    if nodeEntry then
        planet = "[[" ..nodeEntry.Planet .. "]]" or " "
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
                    table.insert(headerCells, string.format('[[File:%s|110px]]  
%s', img, displayName))

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
                                    if planet ~= " " and missionName ~= "" then
                                        missionTypeText = string.format(" (%s %s)", planet, missionName)
                                    elseif missionName ~= "" then
                                        missionTypeText = string.format(" (%s)", missionName)
                                    end
                                    table.insert(locationLines, nodeLink .. missionTypeText)
                                end
                            end
                        end
                    end

                    local locationsStr = (#locationLines > 0) and table.concat(locationLines, "  
") or " "
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
                    noteStr = table.concat(parts, "  
")
                end
                if noteStr == "" then
                    noteStr = " "
                end

                if locCount == 0 then
                    html = html .. '|-\n'
                    html = html .. string.format('| [[File:%s|200px]]  
%s\n|  \n|  \n|  \n| %s\n', img, displayName, noteStr)
                else
                    for i, locName in ipairs(locations) do
                        html = html .. '|-\n'
                        if i == 1 then
                            html = html .. string.format('| rowspan="%d" | [[File:%s|200px]]  
%s\n', locCount, img, displayName)
                        end

                        local planet, node, missionName = _resolveLocationInfo(locName)
                        local mType = MissionsData and MissionsData.by and MissionsData.by.Name
                            and MissionsData.by.Name[locName] and MissionsData.by.Name[locName][1]
                            and MissionsData.by.Name[locName][1].Type
                        local mInfo = mType and MissionsData.MissionTypes and MissionsData.MissionTypes[mType]
                        local mission = " "
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
```

