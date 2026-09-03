---
title: "Module:Honorias"
wiki_url: "https://wiki.warframe.com/w/Module/Honorias"
wiki_timestamp: "2026-09-02T20:11:17Z"
---

**Honorias** retrieves and stores Honoria title data of [WARFRAME](/w/WARFRAME "WARFRAME").

On this Wiki, Honorias is used in:

* [Honoria](/w/Honoria "Honoria")

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Template

In template and articles: `{{#invoke:Honorias|function|input1|input2|...}}`

## Documentation

### Package items

`honorias.getValue()` (function)
:   Gets a specific piece of data about a Honoria.

`honorias.getHonoriaCount()` (function)
:   Gets the total Honoria count.

`honorias.simpleHonoriaNameList()` (function)
:   Builds a simple sorted list of all Honoria names.

`honorias.buildHonoriaTable(columns, position, tag, introduced, checklist)` (function)
:   Builds a Wikitable listing all Honorias filtered and with customizable columns.
:   **Parameters**:

    * `columns` Comma-separated list of columns (e.g. "Checklist, Name, Description, Position, Introduced, Tags, Price") (string; optional)
    * `position` Filter by Position (string; optional)
    * `tag` Filter by Tag (string; optional)
    * `introduced` Filter by Introduced version (string; optional)
    * `checklist` Add "true" to automatically prepand a checklist column if not specified in columns (string; optional)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Honorias/data](/w/Module:Honorias/data "Module:Honorias/data")
* [Honorias/data/doc](/w/Module:Honorias/data/doc "Module:Honorias/data/doc")
* [Honorias/data/validate](/w/Module:Honorias/data/validate "Module:Honorias/data/validate")
* [Honorias/data/validate/doc](/w/Module:Honorias/data/validate/doc "Module:Honorias/data/validate/doc")
* [Honorias/doc](/w/Module:Honorias/doc "Module:Honorias/doc")

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
| Cosmetics | [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • Module:Honorias ([/data](/w/Module:Honorias/data "Module:Honorias/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
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
--- '''Honorias''' retrieves and stores Honoria title data of [[WARFRAME]].  

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
        return 'class="checklist-cell" data-item="' .. name .. '" | '
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
            return table.concat(prices, "  
")
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
    return table.concat(resultList, "  
")
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
```

