---
title: "Module:Void"
wiki_url: "https://wiki.warframe.com/w/Module/Void"
wiki_timestamp: "2026-03-08T08:16:08Z"
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
| Merging [Module:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") to Module:Void | Dev | Completed | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Migrating all functions from M:VoidByReward to this module. |  | 21:36, 22 June 2021 (UTC) |
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

* [Void/data](/w/Module:Void/data "Module:Void/data")
* [Void/data/dev](/w/Module:Void/data/dev "Module:Void/data/dev")
* [Void/data/doc](/w/Module:Void/data/doc "Module:Void/data/doc")
* [Void/data/validate](/w/Module:Void/data/validate "Module:Void/data/validate")
* [Void/dev](/w/Module:Void/dev "Module:Void/dev")
* [Void/dev/doc](/w/Module:Void/dev/doc "Module:Void/dev/doc")
* [Void/doc](/w/Module:Void/doc "Module:Void/doc")
* [Void/page](/w/Module:Void/page "Module:Void/page")
* [Void/page/doc](/w/Module:Void/page/doc "Module:Void/page/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • M:Void ([/data](/w/Module:Void/data "Module:Void/data")) |
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

---

```lua
---	'''Void''' retrieves drop table data of opening [[Void Relic]]s as well as 
--	information on where Prime parts/blueprints drop.  

--	
--	Includes drop tables of [[Requiem Relic]]s.
--	
--	Originally built when the [[Void]] rewarded [[Prime]]d parts and blueprints.  

--	
--	On this Wiki, Void is used in:
--	* [[Module:DropTables]]
--	* [[Module:Tooltips/icon]]
--	* [[Template:PrimeTable]]
--	* [[Template:RelicPage]]
--	* [[Ducats/Prices]]
--	* [[Void Relic]]
--	* [[Forma]]
--	* [[Relic Pack]]
--	
--	@module			void
--	@alias			p
--	@author			[[User:ChickenBar|ChickenBar]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution	[[User:Trajos|Trajos]]
--	@image			VoidProjectionsIronD.png
--	@require		[[Module:Void/data]]
--	@require		[[Module:Weapons/data]]
--	@require		[[Module:Warframes/data]]
--	@require		[[Module:Resources/data]]
--	@require		[[Module:Companions/data]]
--	@require		[[Module:Mods/data]]
--  @require		[[Module:Icon/data]]
--  @require		[[Module:Tooltips/icon]]
--  @require		[[Module:Tooltips]]
--	@require		[[Module:Icon]]
--	@require		[[Module:String]]
--	@require		[[Module:Math]]
--	@require		[[Module:Table]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

local p = {}

local VoidData = mw.loadData('Module:Void/data')
local RelicData = VoidData['RelicData']
local PrimeData = VoidData['PrimeData']
local WeaponData = require('Module:Weapons/data')
local WarframeData = mw.loadData('Module:Warframes/data')['Warframes']
local ArchwingData = mw.loadData('Module:Warframes/data')['Archwings']
local ResourceData = mw.loadData('Module:Resources/data')['Resources']
local CompanionData = mw.loadData('Module:Companions/data')['Companions']
local ModData = mw.loadData('Module:Mods/data')['Mods']

local IconData = mw.loadData([[Module:Icon/data]]);
local TooltipsIcon = require([[Module:Tooltips/icon]]);
local Tooltips = require([[Module:Tooltips]]);
local Icon = require('Module:Icon')
local String = require('Module:String')
local Math = require('Module:Math')
local Table = require('Module:Table')

p.RELIC_TIER_ORDER = { "Lith", "Meso", "Neo", "Axi", "Requiem" }	-- For traversal
p.RADIANT = { Common = .50/3, Uncommon = .40/2, Rare = .10/1 }

---	Converts Prime part names in data to proper casing.
--	@function		p._getPartName
--	@param			{string} partStr Item name
--	@param[opt]		{boolean} keepBlueprint If true, adds 'blueprint' to end of result, false otherwise. 
--											Default value is true.
--	@return			{string} Name of Prime part 
function p._getPartName(partStr, keepBlueprint)
	-- User:Falterfire 6/19/2018:
	-- New parameter to remove ' Blueprint' if wanted
	-- IE returns 'Neuroptics' instead of 'Neuroptics Blueprint'
	if keepBlueprint == nil then keepBlueprint = true end
	local result = String.titleCase(partStr)
	if not keepBlueprint and String.contains(result, ' Blueprint') then
		result = string.gsub(result, ' Blueprint', '')
	end
	return result
end

-- TODO: Remove this function, looks to be unused; cannot find it in M:Acquisition or M:VoidByReward
-- TODO: Maybe store images of prime parts in the same or different /data subpage? That way we remove dependency from M:Icon?
---	Returns the part icon for a drop.
--	For example, "Braton Prime Barrel" returns [[File:Primebarrel.png|38px]]
--	@function		p._getPartIconForDrop
--	@param			{string} drop Item name
--	@return			{string} Icon in the form of a wikitext link
function p._getPartIconForDrop(drop)
	local itemName = drop['Item']
	local partName = drop['Part']
	local iconSize =''
	local primeToggle = 'Prime '
	if itemName == 'Forma' then
		iconSize = '43'
	else
		iconSize = '54'
	end
	
	-- Outliers for naming convention
	if (itemName == 'Odonata Prime') then
		if partName == 'Harness Blueprint' or partName == 'Systems Blueprint' or partName == 'Wings Blueprint' then
			primeToggle = 'Archwing '
		end
	elseif (partName == 'Carapace' or partName == 'Cerebrum' or partName == 'Systems') then
		primeToggle = ''
	end
	
	if (partName == 'Blueprint') then
		return Icon._Prime(String.titleCase(drop['Item']), nil, iconSize)
	elseif (itemName == 'Kavasa Prime') then
		return Icon._Prime('Kavasa', nil, iconSize)
	end
	return Icon._Item(primeToggle..partName, '', iconSize)
end

---	Returns the relics in which the item is dropped from.
--	@function		p.item
--	@param			{table} frame Frame object
--					* {string} itemName Item name
--					* {string} itemPart Item part
--					* [opt] {string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--	@return			{string} Wikitext of resultant list
function p.item(frame)
	local itemName = frame.args[1]
	local partName = frame.args[2]
	local relicTier = frame.args[3]
	
	assert(itemName ~= nil, 'p.item(frame): itemName is nil')
	assert(partName ~= nil, 'p.item(frame): itemName is nil')
	
	return p._item(itemName, partName, relicTier)
end

--- Returns the relics in which the item is dropped from.
--  @function		p._item
--  @param			{string} itemName Item name, case sensitive
--  @param			{string} partName Item part, case sensitive
--  @param[opt]		{string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--  @return			{string} Wikitext of resultant list
function p._item(itemName, partName, relicTier, tooltip)
	local relics = {}
	local vaultedRelics = {}
	
	if tooltip == nil then
		tooltip = true
	end
	
	if not PrimeData[itemName] or not PrimeData[itemName]['Parts'][partName] then
		error('p._item(itemName, partName, relicTier): Item "' .. itemName .. '" not found.')
	end
	
	for relicName, rarity in Table.skpairs(PrimeData[itemName]['Parts'][partName]['Drops']) do
		local relic = RelicData[relicName]
		if (relicTier == nil or relic['Tier'] == relicTier) then
			local relicString = rarity
			if tooltip then
				relicString = Tooltips.full(relicName, 'Void', relic)..' '..relicString
			else
				relicString = '[['..relicName..']] '..relicString
			end
			if (relic['Vaulted'] ~= nil) then
				relicString = relicString..' ([[Prime Vault|V]])'
				table.insert(vaultedRelics, relicString)
			else
				if (relic['IsBaro']) then
					relicString = relicString..' ([[Baro Ki\'Teer|B]])'
				end
				table.insert(relics, relicString)
			end
		end
	end
	
	-- Putting vaulted relics at the end of list
	for _, relicName in ipairs(vaultedRelics) do
		table.insert(relics, relicName)
	end
	
	return table.concat(relics, '  
')
end

---	Gets the total number of relics in the game.
--	@function		p.getRelicTotal
--	@param			{table} frame Frame object
--	@param[opt]		{string} frame.args Options for what relic types to include are
--							 "unvaulted", "vaulted", "baro", or nil for all relics
--	@return			{number} The total count of all relics
function p.getRelicTotal(frame)
	if (frame.args[1] == nil) then
		return Table.size(RelicData)
	end
	
	local total = 0
	local countUnvaulted = Table.contains(frame.args, 'unvaulted')
	local countVaulted = Table.contains(frame.args, 'vaulted')
	local countBaro = Table.contains(frame.args, 'baro')
	
	for _, relic in pairs(RelicData) do
		if (countUnvaulted and relic['Vaulted'] == nil) then
			total = total + 1
		end
		if (countVaulted and relic['Vaulted'] ~= nil) then
			total = total + 1
		end
		if (countBaro and relic['IsBaro']) then
			total = total + 1
		end
	end
	return total
end

---	Gets the ducat value of a Prime part or blueprint.
--	@function		p.getDucatValue
--	@param			{string} itemName Prime item name
--	@param			{string} partName Part name
--	@return			{number} The ducat value of that Prime part/blueprint
function p.getDucatValue(frame)
	local itemName = frame.args ~= nil and frame.args[1] or nil
	local partName = frame.args ~= nil and frame.args[2] or nil
	
	assert(itemName ~= nil, 'p.getDucatValue(): Item name missing')
	assert(partName ~= nil, 'p.getDucatValue(): Part name missing')
	return p._getDucatValue(itemName, partName)
end

---	Gets the ducat value of a Prime part or blueprint.
--	@function		p._getDucatValue
--	@param			{string} itemName Prime item name
--	@param			{string} partName Part name
--	@return			{number} The ducat value of that Prime part/blueprint
function p._getDucatValue(itemName, partName)
	assert(PrimeData[itemName] ~= nil, 'p._getDucatValue(itemName, partName): item "'..itemName..'" does not exist in [[Module:Void/data]]')
	assert(PrimeData[itemName]['Parts'][partName] ~= nil, 'p._getDucatValue(itemName, partName): part "'..partName..'" of item "'..itemName..'" does not exist in [[Module:Void/data]]')
	
	return PrimeData[itemName]['Parts'][partName]['DucatValue']
end

---	Gets the total ducat value of all Prime parts and blueprints.
--	@function		p.getTotalDucats
--	@param[opt]		{string} relicTier Tier name if want to filter by a specific relic tier; default nil for all relic tiers
--	@return			{number} The total ducat value
function p.getTotalDucats(frame)
	local relicTier = frame.args ~= nil and frame.args[1] or nil

	-- TODO: The following wouldn't work if filtering by certain relic tiers
	-- though I'm sure there is a way to optimize these calculations without looping through
	-- all of a data table
	-- local totalItemCount = Table.size(RelicData) * 6 -- counting all items, including duplicates
	-- number of Forma BP drops; note some relics have Forma take up two slots (e.g. only Meso D1)
	-- local numFormaDrops = Table.size(data['FORMA']['BLUEPRINT']) + 1
	
	local totalItemCount = 0	-- counting all items, including duplicates and non-prime items (e.g. Forma)
	local withoutFormaCount = 0	-- counting all items excluding forma
	local totalDucats = 0	-- all, including duplicates, itemDucats
	local weightedDucats = 0	-- all, including duplicates, itemDucats, * rarity weight for radiant relic
	local availableDucats = 0	-- total ducats for items from available relics
	local availableItems = 0	-- available items
	local availableItemsNoForma = 0	-- available items excluding forma
	local vaultedDucats = 0	-- total ducats for items from vaulted relics
	local vaultedItems = 0	-- vaulted items
	local vaultedItemsNoForma = 0	-- vaulted items excluding forma
	
	-- TODO: Refactor so it won't be triple for loop, though this may be hard
	-- to do b/c of the way the tables in /data are formatted; the best we can
	-- do is probably add some optimizations?
	for itemName, itemTable in pairs(PrimeData) do
		for partName, relicTable in pairs(itemTable['Parts']) do
			for relicName, rarity in pairs(relicTable['Drops']) do
				local relic = RelicData[relicName]
				if relicTier == nil or relic['Tier'] == relicTier then
					if relic['Vaulted'] then
						vaultedItems = vaultedItems + 1
					else
						availableItems = availableItems + 1
					end
					
					totalItemCount = totalItemCount + 1
					
					if itemName ~= 'FORMA' then
						local tempDucat = p._getDucatValue(itemName, partName)
						totalDucats = totalDucats + tempDucat
						weightedDucats = weightedDucats + tempDucat * p.RADIANT[rarity]*6
						withoutFormaCount = withoutFormaCount + 1
						
						if relic['Vaulted'] then
							vaultedDucats = vaultedDucats + tempDucat
							vaultedItemsNoForma = vaultedItemsNoForma + 1
						else
							availableDucats = availableDucats + tempDucat
							availableItemsNoForma = availableItemsNoForma + 1
						end
					end
				end
			end
		end
	end
	
	-- TODO: Average ducat value is not a helpful statistic due to the different
	-- drop rates of parts. A better statistic would be average ducat value per 
	--  relic which would account for item part drop rarity weights. 
	-- This is a more complicated problem since you would
	-- have to account for different refinement levels since the rarity weights change.
	local ducatsIcon = Tooltips.icon('Orokin Ducats', 'Resources')
	if relicTier then
		return string.format([[
'''Average Ducats Value''': %s'''%s''' (%s rewards with %s Prime parts)  

'''Weighted Average Ducats Value''': %s'''%s''' (for Radiant relics)  

'''Available''': %s'''%s''' (%s rewards with %s Prime parts)  

'''Vaulted''': %s'''%s''' (%s rewards with %s Prime parts)  
]], 
			ducatsIcon,
			Math.round(totalDucats / totalItemCount, 0.01),
			Math.formatnum(totalItemCount),
			Math.formatnum(withoutFormaCount),
			ducatsIcon,
			Math.round(weightedDucats / totalItemCount, 0.01),
			ducatsIcon,
			Math.formatnum(availableDucats),
			Math.formatnum(availableItems),
			Math.formatnum(availableItemsNoForma),
			ducatsIcon,
			Math.formatnum(vaultedDucats),
			Math.formatnum(vaultedItems),
			Math.formatnum(vaultedItemsNoForma)
		)
	else
		return string.format([[
'''Total Ducats Value''': %s'''%s''' (%s rewards with %s Prime parts)  

'''Weighted Average Ducats Value''': %s'''%s''' (for Radiant relics)  

'''Available''': %s'''%s''' (%s rewards with %s Prime parts)  

'''Vaulted''': %s'''%s''' (%s rewards with %s Prime parts)  
]], 
			ducatsIcon,
			Math.formatnum(totalDucats),
			Math.formatnum(totalItemCount),
			Math.formatnum(withoutFormaCount),
			ducatsIcon,
			Math.round(weightedDucats / totalItemCount, 0.01),
			ducatsIcon,
			Math.formatnum(availableDucats),
			Math.formatnum(availableItems),
			Math.formatnum(availableItemsNoForma),
			ducatsIcon,
			Math.formatnum(vaultedDucats),
			Math.formatnum(vaultedItems),
			Math.formatnum(vaultedItemsNoForma)
		)
	end
end

---	Returns table row for wikitable generated by p.ducatRelicList().
--	@function		ducatValueRow
--	@param			{string} itemName Item name, case sensitive
--	@param			{string} partName Item part, case sensitive
--	@param[opt]		{string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--	@return			{string} Wikitext of wikitable row
local function ducatValueRow(itemName, partName, relicTier)
	local ducatValue = p._getDucatValue(itemName, partName)
	local sortValue = ''
	
	--assert(itemName ~= nil, 'ducatValueRow(itemName, partName, relicTier): Please enter an item name')
	--assert(partName ~= nil, 'ducatValueRow(itemName, partName, relicTier): Please enter a part name')
	
	-- First cell; blueprints will appear first before other parts of the same item
	if partName == 'Blueprint' then
		sortValue = itemName..' _'..partName
	else
		sortValue = itemName..' '..partName
	end

	return string.format([[
| data-sort-value="%s"| %s
| %s
| '''%d'''
|-
]],
	sortValue,
	itemName..' '..partName,
	p._item(itemName, partName, relicTier, false),
	ducatValue
)
end

---	Builds a table of all Prime parts, the relics they are in, and their ducat value
--	as seen in [[Ducats/Prices/Lith]].
--	@function		p.ducatRelicList
--	@param[opt]		{string} relicTier Tier name if want to filter by a specific relic tier; default nil for all tiers
--	@param[opt]		{string} listMode If 'Vaulted' displays only vaulted items; if 'Unvaulted' displays only unvaulted items; 
--							 if 'All' or nil, displays all items; default nil
--	@param[opt]		{string} skipForma If anything, Forma entries are skipped.
--	@param[opt]		{string} skipRequiem If anything, Requiem relics are skipped.
--	@return			{string} Wikitext of table
function p.ducatRelicList(frame)
	local relicTier = frame.args ~= nil and frame.args['relicTier'] or nil
	-- Adding switch to choose only vaulted or unvaulted or all items to show
	local listMode = frame.args ~= nil and frame.args['listMode'] or 'ALL'
	listMode = String.titleCase(listMode)
	-- Adding a switch to skip Forma and Requiem relic entries.
	local skipForma = frame.args ~= nil and frame.args['skipForma'] or nil
	local skipRequiem = frame.args ~= nil and frame.args['skipRequiem'] or nil
	
	-- For preventing more than a single entry per item in "itemSet".
	local itemsDone = {}
	
	local itemSet = {}
	-- Note that newline at the end of table header needed so that first column 
	-- will properly show
	local result = { [[

{| style="width:100%; overflow:initial;" class="listtable sortable stickyHeader autosort=1,a" align="center"
|-
! Part
! Drop Location(s)
! data-sort-type="number" |]] }
	table.insert(result, Tooltips.icon('Orokin Ducats', 'Resources'))
	table.insert(result, [[Ducat Value
|-
]])
	-- Collecting data of all items, filtering based on relic tier
	for itemName, itemTable in Table.skpairs(PrimeData) do
		 if ( itemName ~= "Forma" or skipForma == nil ) then
			for partName, relicTable in Table.skpairs(itemTable['Parts']) do
				for relicName, dropRarity in pairs(relicTable['Drops']) do
					if itemsDone[itemName..partName] ~= true then
						local relicEntry = RelicData[relicName]
						if ( relicEntry['Tier'] ~= "Requiem" or skipRequiem == nil ) then
							if relicEntry['Tier'] == relicTier or relicTier == nil then
								if listMode == 'Vaulted' then
									if relicEntry['IsBaro'] or relicEntry['Vaulted'] then
										itemSet[{ itemName, partName }] = true
										itemsDone[itemName..partName] = true
									end
								elseif listMode == 'Unvaulted' then
									if not relicEntry['IsBaro'] and not relicEntry['Vaulted'] then
										itemSet[{ itemName, partName }] = true
										itemsDone[itemName..partName] = true
									end
								else
									itemSet[{ itemName, partName }] = true
									itemsDone[itemName..partName] = true
								end
							end
						end
					end
				end
			end
		end
	end
	-- Note: Sorting doesn't appear to work on this table.
	table.sort(itemSet)
	
	for itemTable, _ in pairs(itemSet) do
		-- Building actual table row
		table.insert(result, ducatValueRow(itemTable[1], itemTable[2], relicTier))
	end
	
	table.insert(result, '|}

  
([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  
([[Baro Ki\'Teer|B]]) Denotes [[Baro Ki\'Teer]] Exclusive Void Relics')
	return frame:preprocess(table.concat(result))
end

---	Builds a wikitable for all prime parts. Used in [[Void Relic/ByRewards/SimpleTable]].
--	@function		p.simpleRewardTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.simpleRewardTable(frame)
	local primePartTable = {}
 
	-- TODO: Replace this loop with a call to PrimeData?
	-- Collect data for each relic
	for relicName, relic in pairs(RelicData) do
		local vault = "No"
		if (relic.Vaulted ~= nil) then
			vault = "Yes"
		end
		
		-- For each relic, need each drop
		for i, drop in pairs(relic['Drops']) do
			-- Custom objects are great
			local thisObj = { Item = drop['Item'], Part = drop['Part'],
							RelicName = relicName, 
							Rarity = drop['Rarity'], Vaulted = vault }
			table.insert(primePartTable, thisObj)
		end
	end

	-- Used for sorting prime parts in ascending order alphabetically with
	-- unvaulted status being first
	local function relicComparator(relic1, relic2)
		if(relic1['Item'] == relic2['Item']) then
			if(relic1['Part'] == relic2['Part']) then
				-- Vaulted is a string "Yes" or "No" as defined in for loop prior to this function
				return relic1['Vaulted'] < relic2['Vaulted']
			else
				return relic1['Part'] < relic2['Part']
			end
		else
			return relic1['Item'] < relic2['Item']
		end
	end
			
	table.sort(primePartTable, relicComparator)
 
	local rewards = {}
	local resultTable = { [[
{| class="article-table sortable" style="width: 600px;margin: auto;" cellspacing="1" cellpadding="1" border="2"
|-'
! scope="col"|Item
! scope="col"|Part
! scope="col"|Relic Name
! scope="col"|Rarity
! scope="col"|Relic Vaulted?]] }

	for i, primePart in pairs(primePartTable) do
		local rowStr = string.format([=[
|-
| [[%s]] || %s || %s || %s || %s]=], 
			primePart['Item'],
			primePart['Part'],
			Tooltips.full(primePart['RelicName'], 'Void', RelicData[primePart['RelicName']]),
			primePart['Rarity'],
			primePart['Vaulted'])
		table.insert(resultTable, rowStr)
	end
	table.insert(resultTable, '|}')
	return table.concat(resultTable, '\n')
end

---	Finds all related relics and auto-generates a wikitable.
--	@function		p.relicsTable
--	@param			{table} frame Frame object
--					nil or 'unvaulted' - all unvaulted relics
--					'vaulted' - all vaulted relics
--					'baro' - all Baro-exclusive relics
--	@return			{string} Wikitext of wikitable
function p.relicsTable(frame)
	local filter = frame.args ~= nil and frame.args[1]
	if filter == nil then filter = 'unvaulted' end
	
	local data = {}
	-- Putting all relic names of relics of a certain tier in a single data table entry
	for _, relic in pairs(RelicData) do
		if false
			or filter=='unvaulted' and not relic['Vaulted'] and not relic['IsBaro']-- is the baro check necessary?
			or filter=='vaulted' and relic['Vaulted']
			or filter=='baro' and relic['IsBaro']
			then
			local tier = relic['Tier']
			data[tier] = data[tier] or {}
			table.insert(data[tier], relic)
		end
	end
	for _,t in pairs(data) do
		table.sort(t,function(a,b)
			return a.Name		end)
	end
	
	local resultTable = {
		'{| class="wikitable mw-collapsible" cellspacing="1" cellpadding="1" border="2" style="margin:auto"',
		('|+ %s Relics'):format(({
			unvaulted = 'Unvaulted/Available',
			vaulted = 'Vaulted/Unavailable',
			baro = 'Baro Ki\'Teer Exclusive',
		})[filter] or 'Available'),
		'|-'
	}
	-- Loop through each tier and add a header
	for _, tier in ipairs(p.RELIC_TIER_ORDER) do
		table.insert(resultTable,
			('! scope="col" style="width:20%%;text-align:center;" | %s  
(%s relics)')
			:format(tier, Table.size(data[tier] or {}))
		)
	end
	table.insert(resultTable,'|-')

	-- Loop through each tier and add all its matching relics
	for _, tier in ipairs(p.RELIC_TIER_ORDER) do
		table.insert(resultTable, '| ')
		for _, relic in ipairs(data[tier] or {}) do
			table.insert(resultTable, '*'..Tooltips.text(relic.Name,'Void', relic)..'  
')
		end
	end
	table.insert(resultTable, [=[|-
| colspan=5 style="text-align:center;" | [[Aya]] • [[Relic Pack]] • [[Void Relic]]
|-
|}]=])

	return frame:preprocess(table.concat(resultTable, '\n'))
end

---	Builds a wikitable of each prime part and the relics it can be dropped from.
--	@function		p.byReward
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of table
function p.byReward(frame)
	local filter = frame.args ~= nil and frame.args[1]
	if filter == nil then filter = 'All' end
	local resultTable = { [[
{| class="listtable"
|-
! Item Name !! Part Name !! Relics]] }
	
	for item, partTable in Table.skpairs(PrimeData) do
		local isVaulted = partTable['IsVaulted']
		
		if filter == 'All' or (filter == 'Current' and not (isVaulted)) then
			table.insert(resultTable, '|-')
			-- First column with item name and image; first column will span a number of rows
			-- that depend on how many prime parts are associated with item
			local imageName = WeaponData[item] and WeaponData[item].Image or 
					WarframeData[item] and WarframeData[item]['Image'] or 
					CompanionData[item] and CompanionData[item]['Image'] or
					ResourceData[item] and ResourceData[item]['Image'] or
					ModData[item] and ModData[item]['Image'] or
					ArchwingData[item] and ArchwingData[item]['Image'] or
					'Panel.png'
			
			local itemColumn = string.format('| rowspan="%d"|[[File:%s|200px]]  
[[%s]]', 
				Table.size(partTable['Parts']), imageName, item)
			table.insert(resultTable, itemColumn)
			
			local firstRow = true
			-- Getting relics for each prime part of an item
			for part, drops in Table.skpairs(partTable['Parts']) do
				if (firstRow) then
					firstRow = false
				else
					table.insert(resultTable, '|-')
				end
				
				local partName = p._getPartName(part)
				
				-- Second column with part name
				table.insert(resultTable, '| '..partName..' || ')
				
				local relics = {}
				local vaultedRelics = {}
				for relicName, rarity in pairs(drops['Drops']) do
					local relic = RelicData[relicName]
					local relicString = Tooltips.full(relicName, 'Void', relic).." "..rarity
					
					if (relic['Vaulted'] ~= nil) then
						relicString = relicString..' ([[Prime Vault|V]])'
						table.insert(vaultedRelics, relicString)
					else
						if (relic['IsBaro']) then
							relicString = relicString..' ([[Baro Ki\'Teer|B]])'
						end
						table.insert(relics, relicString)
					end
				end
				-- Third column with list of relics that drops a prime part;
				-- unvaulted relics will appear at the top and vaulted relics at the bottom
				if not (filter == 'Current') then
					for _, relicName in ipairs(vaultedRelics) do
						table.insert(relics, relicName)
					end
				end
				table.insert(resultTable, table.concat(relics, '  
'))
			end
		end
	end
	table.insert(resultTable, '|}')
	
	return table.concat(resultTable, '\n')
end

---	Builds a wikitable of each relic's drop tables.
--	@function		p.byRelic
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of table
function p.byRelic(frame)
	local tableStr = { [[
{| class="article-table sortable"
! Tier
! Name
! Exclusivity
! Common Rewards
! Uncommon Rewards
! Rare Rewards]] }

	local commonStr, uncommonStr, rareStr
	local itemName, partName, itemLink
 
	-- Building each table row
	for relicName, relicTable in pairs(RelicData) do
		-- First, new row indicator
		table.insert(tableStr, "|-")
		-- Tier & relic names
		table.insert(tableStr, ("| "..relicTable['Tier']))
		table.insert(tableStr, ("| [["..relicName.."|"..relicTable['Name'].."]]"))
		
		if (relicTable.isBaro) then
			table.insert(tableStr, ("| [[Baro Ki'Teer|Baro]]"))
		elseif (relicTable.Vaulted) then
			table.insert(tableStr, ("| [[Prime Vault|Vaulted]]"))
		else
			table.insert(tableStr, ("| –"))
		end
 
		commonStr = { "| " }
		uncommonStr = { "| " }
		rareStr = { "| " }
		for i, drop in ipairs(relicTable['Drops']) do
			itemName = drop['Item']
			partName = drop['Part']
			itemLink = string.format('* [[%s|%s %s]]', itemName, itemName, partName)
			if (drop['Rarity'] == 'Common') then
				table.insert(commonStr, itemLink)
			elseif (drop['Rarity'] == 'Uncommon') then
				table.insert(uncommonStr, itemLink)
			else
				table.insert(rareStr, itemLink)
			end
		end
		
		table.insert(tableStr, table.concat(commonStr, '\n'))
		table.insert(tableStr, table.concat(uncommonStr, '\n'))
		table.insert(tableStr, table.concat(rareStr, '\n'))
	end
	table.insert(tableStr, "|}")
	return table.concat(tableStr, '\n')
end

---	Builds a wikitable of each relic's Ducat Values.
--	@function		p.byDucats
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of table
function p.byDucats(frame)
	local tableStr = { [[
{| class="article-table sortable autosort=3,d"
! Name
! Exclusivity
! Total Ducats
! Intact Average
! Exceptional Average
! Flawless Average
! Radiant Average]] }

	local totalStr, intactStr, exceptionalStr, flawlessStr, radiantStr
	local value, total, intact, exceptional, flawless, radiant = 0, 0, 0, 0, 0, 0
 
	-- Building each table row
	for relicName, relicTable in pairs(RelicData) do
		table.insert(tableStr, "|-")
		table.insert(tableStr, ("| [["..relicName.."|"..relicTable['Name'].."]]"))
		
		if (relicTable.isBaro) then
			table.insert(tableStr, ("| [[Baro Ki'Teer|Baro]]"))
		elseif (relicTable.Vaulted) then
			table.insert(tableStr, ("| [[Prime Vault|Vaulted]]"))
		else
			table.insert(tableStr, ("| –"))
		end
 
		totalStr = { "| " }
		intactStr = { "| " }
		exceptionalStr = { "| " }
		flawlessStr = { "| " }
		radiantStr = { "| " }
		value, total, intact, exceptional, flawless, radiant = 0, 0, 0, 0, 0, 0
		
		for i, drop in ipairs(relicTable['Drops']) do
			value = PrimeData[drop['Item']].Parts[drop['Part']].DucatValue
			
			total = total + value
			if (drop['Rarity'] == 'Common') then
				intact = intact + 0.2533 * value
				exceptional = exceptional + 0.2333 * value
				flawless = flawless + 0.2 * value
				radiant = radiant + 0.1667 * value
			elseif (drop['Rarity'] == 'Uncommon') then
				intact = intact + 0.11 * value
				exceptional = exceptional + 0.13 * value
				flawless = flawless + 0.17 * value
				radiant = radiant + 0.2 * value
			else
				intact = intact + 0.02 * value
				exceptional = exceptional + 0.04 * value
				flawless = flawless + 0.06 * value
				radiant = radiant + 0.1 * value
			end
		end
		
		table.insert(totalStr, total)
		table.insert(intactStr, intact)
		table.insert(exceptionalStr, exceptional)
		table.insert(flawlessStr, flawless)
		table.insert(radiantStr, radiant)
		
		table.insert(tableStr, table.concat(totalStr, '\n'))
		table.insert(tableStr, table.concat(intactStr, '\n'))
		table.insert(tableStr, table.concat(exceptionalStr, '\n'))
		table.insert(tableStr, table.concat(flawlessStr, '\n'))
		table.insert(tableStr, table.concat(radiantStr, '\n'))
	end
	
	table.insert(tableStr, "|}")
	return table.concat(tableStr, '\n')
end

---	Builds a wikitable of all relic drops sorted by rarity.
--	@function		p.byRarity
--	@param			{table} frame Frame object
--					{string} checkTier Relic tier to filter by; default 'All' for all tiers
--	@return			{string} Wikitext of table
function p.byRarity(frame)
	local checkTier = frame.args ~= nil and frame.args[1] or 'All'

	local rarityOrder = { 'Common', 'Uncommon', 'Rare' }
	local rarityData = { Common = {}, Uncommon = {}, Rare = {} }
 
	-- Collect data
	for relicName, relic in pairs(RelicData) do
		local tier = relic['Tier']
		local name = relic['Name']
		-- So first make sure this row is the right tier
		if (tier == checkTier or tier == 'All') then
			for _, drop in pairs(relic['Drops']) do
				local rarity = drop['Rarity']
				local item = drop['Item']
				local part = drop['Part']
				
				-- Using '|' as a delimiter to split by
				if (rarityData[rarity][item..'|'..part] == nil) then
					-- Assigning a dummy value that will not be used so that keys
					-- can be in an unsorted set
					rarityData[rarity][item..'|'..part] = true
				end
			end
		end
	end
 
	-- Now we can actually format the table
	-- Starting with all the column headers
	local resultTable = { string.format([[
{| class="article-table"
! style="width:33%%;text-align:center;" | Common (%d rewards)
! style="width:33%%;text-align:center;" | Uncommon (%d rewards)
! style="width:33%%;text-align:center;" | Rare (%d rewards)
|-]],
	Table.size(rarityData['Common']),
	Table.size(rarityData['Uncommon']),
	Table.size(rarityData['Rare'])
) }

	-- Then go through each rarity
	-- Each rarity is the same steps:
	for _, rarity in ipairs(rarityOrder) do
		table.insert(resultTable, '|')
		--1. Loop through each item in that rarity in ascending order
		for itemStr, _ in Table.skpairs(rarityData[rarity]) do
			--2. Get the item & part
			local delimiterIndex = string.find(itemStr, '|')
			local itemName = string.sub(itemStr, 1, delimiterIndex - 1)
			local partName = p._getPartName(string.sub(itemStr, delimiterIndex + 1))
			--3. Add the appropriate link to the table
			table.insert(resultTable, string.format('* [[%s|%s %s]]', itemName, itemName, partName))
		end
	end
	table.insert(resultTable, '|}')
	return table.concat(resultTable, '\n')
end

---	Builds wikitable of Void Relics in which a Prime item's parts drop from as
--	seen on any Prime item page (e.g. [[Braton Prime]]).
--	@function		p.buildPrimeTable
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of wikitable
function p.buildPrimeTable(frame)
	local itemName = String.titleCase(mw.text.decode(frame.args['name'] or ''))
	assert(PrimeData[itemName] ~= nil, 'p.buildPrimeTable(frame): "'..itemName..'" does not exist in [[Module:Void/data]]')
	local n = 1;
	local partData = PrimeData[itemName]['Parts']
	local result = { ([=[

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki'Teer|B]]) Denotes [[Baro Ki'Teer]] Exclusive Void Relic

{| style="width: 100%%; table-layout: fixed; margin-right:0px;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left"
|+ %s's Relic Drops
|-]=]):format(itemName) }

	local partNames = {}
	for partName, _ in pairs(partData) do
		table.insert(partNames, partName)
	end
	
	-- sort Blueprint first, then alphabetically
	local function partComparator(part1, part2)
		if part1 == 'Blueprint' or part1 == 'Main Blueprint' then
			return true
		elseif part2 == 'Blueprint' or part2 == 'Main Blueprint' then
			return false
		else
			return part1 < part2
		end
	end
	
	table.sort(partNames, partComparator)

	local blueprint = ' Blueprint';
	for _, partName in ipairs(partNames) do
    	-- Use Mission for items like Forma else use Part for items that 
    	-- are crafted from multiple parts that rewarded from drop table(s)
    	local icon = '';
		local part = partName;
    	if part ~= nil and part ~= '' then
			part = mw.text.decode(part); -- Replacing HTML codes in text with their ASCII character equivalent
			part = string.gsub(" "..string.lower( part ), "%W%l", string.upper):sub(2);
			
			if part == 'Blueprint' or part == 'Main Blueprint' then
				local source = 'Warframes';
				local index = TooltipsIcon[source](itemName);
				if not index then
					source = 'Companions';
					index = TooltipsIcon[source](itemName);
				end
				if not index then
					source = 'Weapons';
					index = TooltipsIcon[source](itemName);
				end
				if index then
					icon = Tooltips.icon(itemName, source, index).." ";
				end
			else
				if string.sub(part, -#blueprint) == blueprint then
					part = string.sub(part, 1, #part - #blueprint);
				end
				
				if itemName == "Odonata Prime" then
					if IconData["Items"]["Archwing "..part..blueprint] ~= nil then
						icon = "Archwing "..part..blueprint
					end
				elseif IconData["Items"]["Prime "..part] ~= nil then
					icon = "Prime "..part
				elseif IconData["Items"]["Prime "..part..blueprint] ~= nil then
					icon = "Prime "..part..blueprint
				elseif IconData["Items"][part] ~= nil then
					icon = part
				end
				if icon ~= '' then
					icon = Icon._Item(icon, nil, nil)..' ';
				end
			end
		end
			
		table.insert(result, ('! style="text-align:center;" | %s'):format(icon..partName))
	end
	table.insert(result, '|-')
	for _, partName in ipairs(partNames) do
		table.insert(result, ('| style="text-align:center; font-size:12px;" | %s'):format(p._item(itemName, partName, nil)))
	end
	
	table.insert(result, '|}

')
	return table.concat(result, '\n')
end

---	Builds wikitable of Void Relics in which Forma blueprints drop from as
--	seen on [[Forma]].
--	@function		p.buildFormaBPRelicTable
--	@returns		{string} Resultant wikitext of wikitable
function p.buildFormaBPRelicTable()
	return ([=[{| style="width: 100%%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left"
|-
! style="text-align:center; width: 25%%" | Lith
! style="text-align:center; width: 25%%" | Meso
! style="text-align:center; width: 25%%" | Neo
! style="text-align:center; width: 25%%" | Axi
|-
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
|-
|}

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki'Teer|B]]) Denotes [[Baro Ki'Teer]] Exclusive Void Relic

]=]):format(
	p._item('Forma', 'Blueprint', 'Lith'),
	p._item('Forma', 'Blueprint', 'Meso'),
	p._item('Forma', 'Blueprint', 'Neo'),
	p._item('Forma', 'Blueprint', 'Axi')
)
end

---	Returns the unvaulted relic count for a Prime part.
--	@function		p._getUnvaultedRelicCountForPart
--	@param			{string} itemName Item name, case sensitive
--	@param			{string} partName Item part, case sensitive
--	@param[opt]		{string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--	@return			{number} Unvaulted relic count, 0 if the part is vaulted
function p._getUnvaultedRelicCountForPart(itemName, partName, relicTier)
	local result = 0

	if not PrimeData[itemName] or not PrimeData[itemName]['Parts'][partName] then
		error('p._item(itemName, partName, relicTier): Item "' .. itemName .. '" not found.')
	end
	
	for relicName, rarity in Table.skpairs(PrimeData[itemName]['Parts'][partName]['Drops']) do
		local relic = RelicData[relicName]
		if (relicTier == nil or relic['Tier'] == relicTier) then
			if not relic['Vaulted'] and not relic['IsBaro'] then
				result = result + 1
			end
		end
	end
	
	return result
end

---	Returns the number of unvaulted relics for a Prime set.
--	@function		p._getUnvaultedRelicCountForSet
--	@param			{string} itemName Item name
--	@return			{number} Unvaulted relic count, 0 if the set is vaulted, 
--							 -1 if item is not obtainable from Void Relics (e.g. base variant weapons)
function p._getUnvaultedRelicCountForSet(itemName)
	local partData = PrimeData[itemName] and PrimeData[itemName]['Parts'] or {}
	local result = PrimeData[itemName] and 0 or -1

	for partName, _ in pairs(partData) do
		result = result + p._getUnvaultedRelicCountForPart(itemName, partName, nil)
		-- TODO discarding the tables to immediately get them again in that function seems inefficient
	end
	
	return result
end

---	Returns the number of unvaulted relics for a Prime set.
--	@function		p.getUnvaultedRelicCountForSet
--	@param			{table} frame Frame object
--	@return			{number} Unvaulted relic count, 0 if the set is vaulted, 
--							 -1 if item is not obtainable from Void Relics (e.g. base variant weapons)
function p.getUnvaultedRelicCountForSet(frame)
	local itemName = String.titleCase(mw.text.decode(frame.args['name'] or ''))
	return p._getUnvaultedRelicCountForSet(itemName)
end

-- for {{ItemVault}}
-- TODO document
function p.AllVaultedForSet(frame)
	local itemName = String.titleCase(mw.text.decode(frame.args['name'] or ''))
	-- TODO short circuit this, want a quick find
	return p._getUnvaultedRelicCountForSet(itemName) == 0
end
function p.AnyResurgenceForSet(frame)
	local itemName = String.titleCase(mw.text.decode(frame.args['name'] or ''))
	local isResurgence = require 'Module:Void/page' ._Resurgence
	local partData = PrimeData[itemName] and PrimeData[itemName]['Parts'] or {}
	for partName, partTable in pairs(partData) do
		for relicName, _ in pairs(partTable['Drops']) do
			if isResurgence(relicName) then
				return true
			end
		end
	end
	return false
end

---	Builds a wikitable for [[Relic Pack]]s.
--	@function		p.RelicPack
--	@return			{string} Wikitext of resultant wikitable
function p.RelicPack()
	local Aya = Tooltips.full('Aya', 'Resources')
	local RarityMap = { Lith = 'Common', Meso = 'Common', Neo = 'Uncommon', Axi = "Rare" }
	local EmpyreanDerelictRelics = {
		["Lith C7"] = true, ["Meso N11"] = true, ["Neo V9"] = true, ["Axi S8"] = true, ["Axi V10"] = true
	}
	
	local RelicpackMap = {'Market', 'Syndicate', 'Daily Tribute'}
	local Weights = {
		Market = {
			Common = {1, 1, 1, 1, 0},
			Uncommon = {0.05, 0.25, 0.25, 0.25, 0},
			Rare = {0.01, 0.05, 0.05, 0.05, 1},
		},
		Syndicate = {
			Common = {0, 1, 1},
			Uncommon = {0.5, 0, 0},
			Rare = {0.5, 0, 0},
		},
		['Daily Tribute'] = {
			Common = {1},
			Uncommon = {0.25},
			Rare = {0.05}
		}
	}
	
	local itemsByRarity = {
		Common = {Aya}, Uncommon = {Aya}, Rare = {Aya}
	}
	local TierCount = {
		Lith = 0, Meso = 0, Neo = 0, Axi = 0
	}
	
	for name, relic in Table.skpairs(RelicData) do
		if not relic.Vaulted and not relic.IsBaro and not EmpyreanDerelictRelics[name] and RarityMap[relic.Tier] ~= nil then
			TierCount[relic.Tier] = TierCount[relic.Tier] + 1
			table.insert(itemsByRarity[RarityMap[relic.Tier]], Tooltips.full(name, 'Void', relic))
		end
	end
	
	local RarityCount = {
		Common = #itemsByRarity.Common,
		Uncommon = #itemsByRarity.Uncommon,
		Rare = #itemsByRarity.Rare
	}
	
	local result = {}
	
	table.insert(result, [=[

### Reward Pools

Each reward within a pool is equally likely. The reward list is the same for all types of relic packs.
{| class="wikitable"
! [[File:IconCommon.png|class=icon]]Common !! [[File:IconUncommon.png|class=icon]]Uncommon !! [[File:IconRare.png|class=icon]]Rare]=])
	
	for i = 1, math.max(RarityCount.Common, RarityCount.Uncommon, RarityCount.Rare) do
		table.insert(result, ('|-\n| %s || %s || %s'):format(
			itemsByRarity.Common[i] or '',
			itemsByRarity.Uncommon[i] or '',
			itemsByRarity.Rare[i] or ''
		) )
	end
	table.insert(result, ('|-\n! %d (%.2f%%) !! %d (%.2f%%) !! %d (%.2f%%)\n|}'):format(
			RarityCount.Common, 100 / RarityCount.Common,
			RarityCount.Uncommon, 100 / RarityCount.Uncommon,
			RarityCount.Rare, 100 / RarityCount.Rare
		) )
	
	for _, packType in ipairs(RelicpackMap) do
		local w = Weights[packType]
		local packSize = #w.Common
		
		table.insert(result, ([=[

### %s

These weights affect packs with %d slots, obtainable from the [[%s]].
{| class="wikitable" style="text-align: right;"]=]):format(packType, packSize, packType) )
	
		table.insert(result, '! Slot !! [[File:IconCommon.png|class=icon]]Common !! [[File:IconUncommon.png|class=icon]]Uncommon !! [[File:IconRare.png|class=icon]]Rare')
		for i = 1, packSize do
			table.insert(result, ('|-\n| %d || %.2f || %.2f || %.2f'):format(
				i,
				w.Common[i],
				w.Uncommon[i],
				w.Rare[i]
			) )
		end
		table.insert(result, '|}')
		
		local Total = { ['Aya'] = 0, ['Lith'] = 0, ['Meso'] = 0, ['Neo'] = 0, ['Axi'] = 0}
		table.insert(result, '{| class="wikitable" style="text-align: right; margin-bottom: 0px;"\n! Slot !! '..Aya..' !! Lith !! Meso !! Neo !! Axi')
		for i = 1, packSize do
			local t = w.Common[i] + w.Uncommon[i] + w.Rare[i]
			
			local commonP = w.Common[i] / t / RarityCount.Common
			local uncommonP = w.Uncommon[i] / t / RarityCount.Uncommon
			local rareP = w.Rare[i] / t / RarityCount.Rare
			
			table.insert(result, ('|-\n| %d || %.2f%% || %.2f%% || %.2f%% || %.2f%% || %.2f%%'):format(
				i,
				(commonP + uncommonP + rareP) * 100,
				commonP * TierCount.Lith * 100,
				commonP * TierCount.Meso * 100,
				uncommonP * TierCount.Neo * 100,
				rareP * TierCount.Axi * 100
			) )
			
			Total['Aya'] = Total['Aya'] + commonP + uncommonP + rareP
			Total['Lith'] = Total['Lith'] + commonP * TierCount.Lith
			Total['Meso'] = Total['Meso'] + commonP * TierCount.Meso
			Total['Neo'] = Total['Neo'] + uncommonP * TierCount.Neo
			Total['Axi'] = Total['Axi'] + rareP * TierCount.Axi
		end
		
		table.insert(result, ('|- style="font-weight: bold"\n| Total* || %.2f%% || %.2f%% || %.2f%% || %.2f%% || %.2f%%'):format(
			Total['Aya'] * 100,
			Total['Lith'] * 100,
			Total['Meso'] * 100,
			Total['Neo'] * 100,
			Total['Axi'] * 100
		) )
		table.insert(result, '|}\n*Note that Total is number of expected chances added, not a guaranteed drop.')
	end
	
	return table.concat(result, '\n')
end

return p
```

