---
title: "Module:Void/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Void/doc"
wiki_timestamp: "2025-02-16T02:45:58Z"
---

**Void** retrieves drop table data of opening [Void Relics](/w/Void_Relic "Void Relic") as well as information on where Prime parts/blueprints drop.

Includes drop tables of [Requiem Relics](/w/Requiem_Relic "Requiem Relic").

Originally built when the [Void](/w/Void "Void") rewarded [Primed](/w/Prime "Prime") parts and blueprints.

On this Wiki, Void is used in:

* [Module:DropTables](/w/Module:DropTables "Module:DropTables")
* [Module:Tooltips/icon](/w/Module:Tooltips/icon "Module:Tooltips/icon")
* [Template:PrimeTable](/w/Template:PrimeTable "Template:PrimeTable")
* [Template:RelicPage](/w/Template:RelicPage "Template:RelicPage")
* [Ducats/Prices](/w/Ducats/Prices "Ducats/Prices")
* [Void Relic](/w/Void_Relic "Void Relic")
* [Forma](/w/Forma "Forma")
* [Relic Pack](/w/Relic_Pack "Relic Pack")

## Contents

* [1 Usage](#Usage)
  + [1.1 Module](#Module)
* [2 Product Backlog](#Product_Backlog)
* [3 Finished Issues](#Finished_Issues)
* [4 Documentation](#Documentation)
  + [4.1 Package items](#Package_items)
* [5 See Also](#See_Also)
* [6 Code](#Code)

## Usage

### Module

```lua
local Void = require('Module:Void')

local function func(input)
    return Void.getRelicTotal()
end
```

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Data validation | Dev | New | Low |  | Add validation functions for `RelicData` and `PrimeData` in [Module:Void/data/validate](/w/Module:Void/data/validate "Module:Void/data/validate"). This is to ensure the accuracy of our data based on known patterns and/or rules. | 19:21, 30 June 2021 (UTC) |  |
| Refactor and clean up | Dev | Active | Medium |  | Remove unused functions and perform some refactoring, especially with triple loop situations (though not entirely clear how to optimize table accesses since when we are building wikitables, we loop through all the data)  04:28, 16 October 2021 (UTC) update: Removed `p._getItemName()` which was used to convert item names from M:Void/data from SCREAMING UPPER CASE to Title Case. This is not needed as all names are stored in Title Case to avoid extra function calls. | 21:36, 22 June 2021 (UTC) | 04:28, 16 October 2021 (UTC) |

## Finished Issues

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Completion Date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Luafy [Template:RelicInfobox](/w/Template:RelicInfobox "Template:RelicInfobox"), [Template:RelicTable](/w/Template:RelicTable "Template:RelicTable"), and [Template:RelicTable/Check](/w/Template:RelicTable/Check "Template:RelicTable/Check") | Dev & Refactor | Active | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Luafy the contents of these templates which will also remove the need for `p.getRelicDrop(frame)`, `p._getItemIconForDrop(itemName)`, and `p.getDucatValue(frame)` | 02:15, 24 June 2021 (UTC) | 18:55, 30 June 2021 (UTC) |
| Ducat values in /data | Dev | Completed | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Add a new "DucatValue" key to each prime part in the PrimeData subtable of M:Void/data. | 3:56, 23 June 2021 (UTC) | [02:11, 24 June 2021 (UTC)](https://wiki.warframe.com/w/Module:Void?oldid=2208439) |
| Documentation | Documentation | Completed | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Add LuaDoc-style documentation for all functions. |  | 21:36, 22 June 2021 (UTC) |
| Merging [Module:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") to [Module:Void](/w/Module:Void "Module:Void") | Dev | Completed | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Migrating all functions from M:VoidByReward to this module. |  | 21:36, 22 June 2021 (UTC) |
| Relic infobox | Dev | Active | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Luafy the contents of [Template:RelicInfobox](/w/Template:RelicInfobox "Template:RelicInfobox") which use parser functions to render the infobox and message boxes. |  | 21:36, 22 June 2021 (UTC) |
| Introduced and vaulted keys | Dev | Completed | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Adding `Introduced` and `Vaulted` key corresponding to the versions that they were first introduced and last vaulted for each relic table entry. |  | 21:36, 22 June 2021 (UTC) |
| Access relic data by item and part names | Dev | Completed | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Adding a new subtable part of /data that uses item and part names to get the relics that they are dropped from; think of it as the 'inverse' of the original relic data table. |  | 21:36, 22 June 2021 (UTC) |

## Documentation

### Package items

`void._getPartName(partStr, keepBlueprint)` (function)
:   Converts Prime part names in data to proper casing.
:   **Parameters**:

    * `partStr` Item name (string)
    * `keepBlueprint` If true, adds 'blueprint' to end of result, false otherwise. Default value is true. (boolean; optional)
:   **Returns**: Name of Prime part (string)

`void._getPartIconForDrop(drop)` (function)
:   Returns the part icon for a drop. For example, "Braton Prime Barrel" returns [![](/images/thumb/Primebarrel.png/38px-Primebarrel.png?ee946)](/w/File:Primebarrel.png)
:   **Parameter**: `drop` Item name (string)
:   **Returns**: Icon in the form of a wikitext link (string)

`void.item(frame)` (function)
:   Returns the relics in which the item is dropped from.
:   **Parameter**: `frame` Frame object

    * {string} itemName Item name
    * {string} itemPart Item part
    * [opt] {string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
:   (table)
:   **Returns**: Wikitext of resultant list (string)

`void._item(itemName, partName, relicTier)` (function)
:   Returns the relics in which the item is dropped from.
:   **Parameters**:

    * `itemName` Item name, case sensitive (string)
    * `partName` Item part, case sensitive (string)
    * `relicTier` Relic tier to search through; if nil looks for item in all relic tiers (string; optional)
:   **Returns**: Wikitext of resultant list (string)

`void.getRelicTotal(frame)` (function)
:   Gets the total number of relics in the game.
:   **Parameters**:

    * `frame` Frame object (table)
      + `frame.args` Options for what relic types to include are "unvaulted", "vaulted", "baro", or nil for all relics (string; optional)
:   **Returns**: The total count of all relics (number)

`void.getDucatValue(itemName, partName)` (function)
:   Gets the ducat value of a Prime part or blueprint.
:   **Parameters**:

    * `itemName` Prime item name (string)
    * `partName` Part name (string)
:   **Returns**: The ducat value of that Prime part/blueprint (number)

`void._getDucatValue(itemName, partName)` (function)
:   Gets the ducat value of a Prime part or blueprint.
:   **Parameters**:

    * `itemName` Prime item name (string)
    * `partName` Part name (string)
:   **Returns**: The ducat value of that Prime part/blueprint (number)

`void.getTotalDucats(relicTier)` (function)
:   Gets the total ducat value of all Prime parts and blueprints.
:   **Parameter**: `relicTier` Tier name if want to filter by a specific relic tier; default nil for all relic tiers (string; optional)
:   **Returns**: The total ducat value (number)

`void.ducatRelicList(relicTier, listMode, skipForma, skipRequiem)` (function)
:   Builds a table of all Prime parts, the relics they are in, and their ducat value as seen in [Ducats/Prices/Lith](/w/Ducats/Prices/Lith "Ducats/Prices/Lith").
:   **Parameters**:

    * `relicTier` Tier name if want to filter by a specific relic tier; default nil for all tiers (string; optional)
    * `listMode` If 'Vaulted' displays only vaulted items; if 'Unvaulted' displays only unvaulted items; if 'All' or nil, displays all items; default nil (string; optional)
    * `skipForma` If anything, Forma entries are skipped. (string; optional)
    * `skipRequiem` If anything, Requiem relics are skipped. (string; optional)
:   **Returns**: Wikitext of table (string)

`void.simpleRewardTable(frame)` (function)
:   Builds a wikitable for all prime parts. Used in [Void Relic/ByRewards/SimpleTable](/w/Void_Relic/ByRewards/SimpleTable "Void Relic/ByRewards/SimpleTable").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

`void.relicsTable(frame)` (function)
:   Finds all related relics and auto-generates a wikitable.
:   **Parameter**: `frame` Frame object nil or 'unvaulted' - all unvaulted relics 'vaulted' - all vaulted relics 'baro' - all Baro-exclusive relics (table)
:   **Returns**: Wikitext of wikitable (string)

`void.byReward(frame)` (function)
:   Builds a wikitable of each prime part and the relics it can be dropped from.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of table (string)

`void.byRelic(frame)` (function)
:   Builds a wikitable of each relic's drop tables.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of table (string)

`void.byDucats(frame)` (function)
:   Builds a wikitable of each relic's Ducat Values.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of table (string)

`void.byRarity(frame)` (function)
:   Builds a wikitable of all relic drops sorted by rarity.
:   **Parameter**: `frame` Frame object {string} checkTier Relic tier to filter by; default 'All' for all tiers (table)
:   **Returns**: Wikitext of table (string)

`void.buildPrimeTable(frame)` (function)
:   Builds wikitable of Void Relics in which a Prime item's parts drop from as seen on any Prime item page (e. g. [Braton Prime](/w/Braton_Prime "Braton Prime")).
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`void.buildFormaBPRelicTable()` (function)
:   Builds wikitable of Void Relics in which Forma blueprints drop from as seen on [Forma](/w/Forma "Forma").
:   **Returns**: Resultant wikitext of wikitable (string)

`void._getUnvaultedRelicCountForPart(itemName, partName, relicTier)` (function)
:   Returns the unvaulted relic count for a Prime part.
:   **Parameters**:

    * `itemName` Item name, case sensitive (string)
    * `partName` Item part, case sensitive (string)
    * `relicTier` Relic tier to search through; if nil looks for item in all relic tiers (string; optional)
:   **Returns**: Unvaulted relic count, 0 if the part is vaulted (number)

`void._getUnvaultedRelicCountForSet(itemName)` (function)
:   Returns the number of unvaulted relics for a Prime set.
:   **Parameter**: `itemName` Item name (string)
:   **Returns**: Unvaulted relic count, 0 if the set is vaulted, -1 if item is not obtainable from Void Relics (e.g. base variant weapons) (number)

`void.getUnvaultedRelicCountForSet(frame)` (function)
:   Returns the number of unvaulted relics for a Prime set.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Unvaulted relic count, 0 if the set is vaulted, -1 if item is not obtainable from Void Relics (e.g. base variant weapons) (number)

`void.RelicPack()` (function)
:   Builds a wikitable for [Relic Packs](/w/Relic_Pack "Relic Pack").
:   **Returns**: Wikitext of resultant wikitable (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

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
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

