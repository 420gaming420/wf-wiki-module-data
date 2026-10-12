---
title: "Module:Trading"
wiki_url: "https://wiki.warframe.com/w/Module/Trading"
wiki_timestamp: "2026-10-11T19:27:57Z"
---

**Trading** is a helper module for constructing wikitext tables and lists pertaining to item trading prerequisites and restrictions.

On this Wiki, Trading is used in:

* [Template:TradingTable](/w/Template:TradingTable "Template:TradingTable")
* [Template:TradingList](/w/Template:TradingList "Template:TradingList")
* [Trading](/w/Trading "Trading")

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`trading.buildTradingPerRankTable(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Generates tradable item listings grouped by Mastery Rank or item type. Supports "Weapons" (tabber per weapon slot) and "Arcanes" (Legendary arcanes by type).
:   **Parameter**: `frame` Scribunto frame object containing invocation arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Processed wikitext output ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`trading.getItemsByMR(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a formatted wikitext list of tradable items for a specific Mastery Rank. Supports type="weapons" (all slots merged) or specific slots ("primary", "secondary", "melee", "archwing").
:   **Parameter**: `frame` Scribunto frame object containing invocation arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Formatted wikitext output for the given MR ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`trading.getItemsByTradability(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a filtered wikitext list of items matching a specific tradability category.
:   **Parameter**: `frame` Scribunto frame object containing invocation arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Formatted wikitext list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Trading/doc](/w/Module:Trading/doc "Module:Trading/doc")

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
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • M:Trading • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- '''Trading''' is a helper module for constructing wikitext tables and lists pertaining to
--  item trading prerequisites and restrictions.  

--  
--  On this Wiki, Trading is used in:
--  * [[Template:TradingTable]]
--  * [[Template:TradingList]]
--  * [[Trading]]
--  
--  @module      trading
--  @alias       p
--  @author      [[User:Yazuh|Yazuh]]
--  @image       TradableIcon(xWhite).png
--  @require     [[Module:Delay]]
--  @require     [[Module:Tooltips]]
--  @require     [[Module:Weapons/data]]
--  @require     [[Module:Arcane/data]]
--  @release     stable
--  

local p = {}
local Delay = require('Module:Delay')
local Tooltip = require('Module:Tooltips')

local WeaponData = Delay.require([[Module:Weapons/data]])
local ArcaneData = Delay.require([[Module:Arcane/data]])["Arcanes"]

-- Tradable status labels mapping for sub-bullet listings
local TRADABLE_LABELS = {
    [1] = 'Unranked',
    [2] = 'Blueprints & Parts',
    [3] = 'Adversary Weapons',
    [4] = 'Crafted Components',
    [5] = 'Companion Weapons'
}

--- Formats a single MR group into wikitext (with main items and optional sub-bullets).
--  @function       formatMRGroupOutput
--  @param          {number} mr Mastery rank level
--  @param          {table} tradeGroups Table of items grouped by Tradable status key
--  @param          {string} slotLabel Optional slot name (e.g., "primary")
--  @param          {string} textArg Optional argument control ("no" to hide slot text)
--  @return         {string} Formatted wikitext lines
local function formatMRGroupOutput(mr, tradeGroups, slotLabel, textArg)
    local standardItems = tradeGroups[0]
    local hasSpecialTypes = false

    for tKey in pairs(tradeGroups) do
        if tKey > 0 then
            hasSpecialTypes = true
            break
        end
    end

	-- Build the dynamic prefix depending on slot inclusion and text config
	local prefix = ''
    if textArg ~= 'no' then
        local slotText = (slotLabel and textArg ~= 'semi') and string.format(" (%s)", slotLabel) or ''
        prefix = string.format("* MR%s%s : ", mr, slotText)
    end

    local listOutput = {}
    if not hasSpecialTypes then
        local allItems = standardItems or {}
        table.sort(allItems)
        table.insert(listOutput, prefix .. table.concat(allItems, ' • '))
    else
        local mainText = prefix
        if standardItems then
            table.sort(standardItems)
            mainText = mainText .. table.concat(standardItems, ' • ')
        end
        if mainText ~= '' then
            table.insert(listOutput, mainText)
        end

        local typeKeys = {}
        for tKey in pairs(tradeGroups) do
            if tKey > 0 then table.insert(typeKeys, tKey) end
        end
        table.sort(typeKeys)

        for _, tKey in ipairs(typeKeys) do
            local items = tradeGroups[tKey]
            table.sort(items)
            local label = TRADABLE_LABELS[tKey]
            if label then
                -- Sub-bullets always start with ** when prefix is enabled, or * if text=no
                local bullet = (textArg == 'no') and "* " or "** "
                table.insert(listOutput, bullet .. "" .. label .. " : " .. table.concat(items, ' • '))
            end
        end
    end

    return table.concat(listOutput, '\n')
end

--- Group items by Mastery Rank and Tradable status, building a structured wikitext list.
--  @function       buildListForCategory
--  @param          {table} dataCategory Sub-dataset containing item definitions
--  @param          {string} categoryName Identifier used for Tooltip rendering and logic handling
--  @return         {string} Formatted wikitext list
local function buildListForCategory(dataCategory, categoryName)
    local itemsByMR = {}
    local tooltipArg = (categoryName == 'Arcanes') and 'Arcane' or categoryName

    for name, data in pairs(dataCategory) do
        -- Exclude atmospheric archguns to avoid duplication
        if data.Slot ~= 'Archgun (Atmosphere)' then
            local mr = 0
            if categoryName == 'Arcanes' then
                if data.Rarity == 'Legendary' then mr = 11 end
            else
                mr = data.Mastery or 0
            end

            if mr > 0 then
                if not itemsByMR[mr] then itemsByMR[mr] = {} end
                
                local tradeType = data.Tradable or 0
                if not itemsByMR[mr][tradeType] then
                    itemsByMR[mr][tradeType] = {}
                end
                table.insert(itemsByMR[mr][tradeType], Tooltip.full(name, tooltipArg))
            end
        end
    end

    local mrList = {}
    for mr in pairs(itemsByMR) do table.insert(mrList, mr) end
    table.sort(mrList)

    local listOutput = {}
    for _, mr in ipairs(mrList) do
        local tradeGroups = itemsByMR[mr]

        if categoryName == 'Arcanes' then
            local allItems = {}
            for _, items in pairs(tradeGroups) do
                for _, item in ipairs(items) do table.insert(allItems, item) end
            end
            table.sort(allItems)
            table.insert(listOutput, '* MR ' .. mr .. ': ' .. table.concat(allItems, ' • '))
        else
            table.insert(listOutput, formatMRGroupOutput(mr, tradeGroups))
        end
    end

    return table.concat(listOutput, '\n')
end

--- Generates tradable item listings grouped by Mastery Rank or item type.
--  Supports "Weapons" (tabber per weapon slot) and "Arcanes" (Legendary arcanes by type).
--  @function       p.buildTradingPerRankTable
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Processed wikitext output
function p.buildTradingPerRankTable(frame)
    local weaponSlots = {
        { key = 'primary', label = 'Primary Weapons' },
        { key = 'secondary', label = 'Secondary Weapons' },
        { key = 'melee', label = 'Melee Weapons' },
        { key = 'archwing', label = 'Archwing Weapons' }
    }

    local args = frame.args
    if not args or not args.type then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local itemType = args and args.type
    local output = {}

    if itemType == 'Weapons' then
        table.insert(output, '')
        for _, slot in ipairs(weaponSlots) do
            local slotData = WeaponData[slot.key]
            if slotData then
                local list = buildListForCategory(slotData, 'Weapons')
                if list ~= '' then
                    table.insert(output, '|-|' .. slot.label .. '=\n' .. list)
                end
            end
        end
        table.insert(output, '')

    elseif itemType == 'Arcanes' then
        local arcanesByType, arcaneTypeNames = {}, {}
        for name, data in pairs(ArcaneData) do
            if data.Rarity == 'Legendary' then
                local aType = data.Type or 'Other'
                if not arcanesByType[aType] then
                    arcanesByType[aType] = {}
                    table.insert(arcaneTypeNames, aType)
                end
                table.insert(arcanesByType[aType], Tooltip.full(name, 'Arcane'))
            end
        end
        table.sort(arcaneTypeNames)

        if #arcaneTypeNames > 0 then
            table.insert(output, 'Only Legendary Arcanes require [[Mastery Rank]] 11 to be traded:')
            for _, aType in ipairs(arcaneTypeNames) do
                local items = arcanesByType[aType]
                table.sort(items)
                table.insert(output, '* ' .. aType .. ' : ' .. table.concat(items, ' • '))
            end
        end
    end

    return frame:preprocess(table.concat(output, '\n\n'))
end

--- Returns a formatted wikitext list of tradable items for a specific Mastery Rank.
--  Invocation syntax: {{#invoke:Trading|getItemsByMR|mr=1|type=primary|text=no}}
--  Supports type="weapons" (all slots merged) or specific slots ("primary", "secondary", "melee", "archwing").
--  @function       p.getItemsByMR
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Formatted wikitext output for the given MR
function p.getItemsByMR(frame)
    local args = frame.args
    if not args or not args.mr then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local targetMR = tonumber(args and args.mr)
    local filterType = (args and args.type or 'weapons'):lower()
    local textArg = (args and args.text or ''):lower()

    if not targetMR then
        return ''
    end

    local slotsToScan = {}
    local slotLabel = nil

    if filterType == 'weapons' then
        slotsToScan = { 'primary', 'secondary', 'melee', 'archwing' }
    elseif WeaponData[filterType] then
        slotsToScan = { filterType }
        slotLabel = filterType
    end

    local tradeGroups = {}
    for _, slotKey in ipairs(slotsToScan) do
        local slotData = WeaponData[slotKey]
        if slotData then
            for name, data in pairs(slotData) do
                if data.Slot ~= 'Archgun (Atmosphere)' then
                    local mr = data.Mastery or 0
                    if mr == targetMR then
                        local tradeType = data.Tradable or 0
                        if not tradeGroups[tradeType] then
                            tradeGroups[tradeType] = {}
                        end
                        table.insert(tradeGroups[tradeType], Tooltip.full(name, 'Weapons'))
                    end
                end
            end
        end
    end

    local hasItems = false
    for _ in pairs(tradeGroups) do
        hasItems = true
        break
    end

    if not hasItems then
        return ''
    end

    local result = formatMRGroupOutput(targetMR, tradeGroups, slotLabel, textArg)
    return frame:preprocess(result)
end

--- Returns a filtered wikitext list of items matching a specific tradability category.
--  Invocation syntax: {{#invoke:Trading|getItemsByTradability|type=unranked|text=no}}
--  @function       p.getItemsByTradability
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Formatted wikitext list
function p.getItemsByTradability(frame)
    local args = frame.args
    if not args or not args.type then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local targetTypeStr = (args and args.type or ''):lower()
    local targetSlot = (args and args.slot or 'weapons'):lower()
    local textArg = (args and args.text or ''):lower()

    -- Find the tradable numeric ID corresponding to the requested string label
    local targetTradableID = nil
    for id, label in pairs(TRADABLE_LABELS) do
        if label:lower() == targetTypeStr then
            targetTradableID = id
            break
        end
    end

    if not targetTradableID then
        return ''
    end

    local slotsToScan = {}
    if targetSlot == 'weapons' then
        slotsToScan = { 'primary', 'secondary', 'melee', 'archwing' }
    elseif WeaponData[targetSlot] then
        slotsToScan = { targetSlot }
    end

    -- Collect items matching the tradability criteria
    local itemsByMR = {}
    local allItemsFlat = {}

    for _, slotKey in ipairs(slotsToScan) do
        local slotData = WeaponData[slotKey]
        if slotData then
            for name, data in pairs(slotData) do
                if data.Slot ~= 'Archgun (Atmosphere)' then
                    local tradeType = data.Tradable or 0
                    if tradeType == targetTradableID then
                        local entry = Tooltip.full(name, 'Weapons')
                        if textArg == 'no' then
                            table.insert(allItemsFlat, entry)
                        else
                            local mr = data.Mastery or 0
                            if mr > 0 then
                                if not itemsByMR[mr] then
                                    itemsByMR[mr] = {}
                                end
                                table.insert(itemsByMR[mr], entry)
                            end
                        end
                    end
                end
            end
        end
    end

    -- If text=no, render a single flat list sorted alphabetically
    if textArg == 'no' then
        if #allItemsFlat == 0 then return '' end
        table.sort(allItemsFlat)
        return frame:preprocess('* ' .. table.concat(allItemsFlat, ' • '))
    end

    -- Standard behavior grouped by MR
    local mrList = {}
    for mr in pairs(itemsByMR) do table.insert(mrList, mr) end
    table.sort(mrList)

    if #mrList == 0 then
        return ''
    end

    local listOutput = {}
    for _, mr in ipairs(mrList) do
        local items = itemsByMR[mr]
        table.sort(items)
        table.insert(listOutput, string.format('* MR%s : %s', mr, table.concat(items, ' • ')))
    end

    return frame:preprocess(table.concat(listOutput, '\n'))
end

return p
```

