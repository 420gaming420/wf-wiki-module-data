---
title: "Module:Warframes/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Warframes/doc"
wiki_timestamp: "2021-12-07T18:15:56Z"
---

**Warframes** retrieves and stores [Warframe](/w/Warframes "Warframes") data of [WARFRAME](/w/WARFRAME "WARFRAME").

On this Wiki, Warframes is used in:

* {{[EquipmentUnlock](/w/Template:EquipmentUnlock "Template:EquipmentUnlock")}}
* {{[WF](/w/Template:WF "Template:WF")}}
* {{[WarframeNavVisual](/w/Template:WarframeNavVisual "Template:WarframeNavVisual")}}
* {{[WarframeNav](/w/Template:WarframeNav "Template:WarframeNav")}}

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Module](#Module)
* [2 Product Backlog](#Product_Backlog)
* [3 Documentation](#Documentation)
  + [3.1 Package items](#Package_items)
* [4 See Also](#See_Also)
* [5 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Warframes|function|input1|input2|...}}`

### Module

```lua
local Warframe = require('Module:Warframes')

local function func(input)
    return Warframe.getWarframe(input)
end
```

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Remove the need for Portrait key | Refactor/Dev/Edit | New | Low |  | * Keep only one key related to Warframe images (e.g. `Image`) and have it set to the name of the image file of the full portrait Warframe. * Remove `Portrait` key. * Use CSS to crop full portrait image to around 50% of the height from the top in order to use in [Template:WarframeNavVisual](/w/Template:WarframeNavVisual "Template:WarframeNavVisual").   + This is done instead of saving a separate file that already crops the image to a half-body portrait. | 06:46, 6 December 2021 (UTC) |  |

## Documentation

### Package items

`warframes._getWarframes(validateFunction, ignoreSpecialWarframes, useConclaveData)` (function)
:   Returns a subset of Warframe entries as stored in `/data` or `/Conclave/data`.
:   **Parameters**:

    * `validateFunction` Function to filter data by that returns a boolean value (function)
    * `ignoreSpecialWarframes` If true, ignores special Warframes like Sevagoth's Shadow or Excalibur Umbra Prime (boolean; optional)
    * `useConclaveData` If true, uses `/Conclave/data`, otherwise uses `/data` (boolean; optional)
:   **Returns**: List of Warframe entries (table)

`warframes._getConclaveWarframes(validateFunction)` (function)
:   Same as p. \_getWarframes, but uses `/Conclave/data`.
:   **Parameter**: `validateFunction` Function to filter data by that returns a boolean value (function)
:   **Returns**: List of Warframe entries (table)

`warframes._linkList(wfs, doTooltip)` (function)
:   Lists each warframe as Tooltip(frame). .' ('..Tooltip(frame..' Prime')..')' or '['..frame..'](/w/%27..frame..%27?action=edit&redlink=1 "'..frame..' (page does not exist)") (['..frame..' Prime](/w/%27..frame..%27_Prime?action=edit&redlink=1 "'..frame..' Prime (page does not exist)"))'
:   **Parameters**:

    * `wfs` List of Warframes entries as seen in `/data` (table)
    * `doTooltip` If true, Warframe names will have tooltips, otherwise they will be normal article links (boolean)
:   **Returns**: Resultant list of formatted Warframe name strings (table)

`warframes._groupAtoZ(wfs, nGroups)` (function)
:   Groups a set of warframes into N groups based on the first letter of their name
:   **Parameters**:

    * `wfs` List of Warframes entries as seen in `/data` (table)
    * `nGroups` Number of groups to create (number)
:   **Returns**: Ordered list of groups, each having .name and .members (table)

`warframes.nav(frame)` (function)
:   Builds a wikitable row to list all Warframes as used on [Template:WarframeNav](/w/Template:WarframeNav "Template:WarframeNav")
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable row (string)

`warframes.buildWarframeVisualNav(frame)` (function)
:   Builds visual navigation bar for Warframes as seen on [Template:WarframeNavVisual](/w/Template:WarframeNavVisual "Template:WarframeNavVisual").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of navigation bar (string)

`warframes.getWarframeComparisonTable(frame)` (function)
:   Builds a Warframe comparison wikitable of rank 0 stats as seen on [Warframes Comparison/Stats](/w/Warframes_Comparison/Stats "Warframes Comparison/Stats").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`warframes.getWarframeRank30ComparisonTable(frame)` (function)
:   Builds a Warframe comparison wikitable of rank 30 stats as seen on [Warframes Comparison/Stats](/w/Warframes_Comparison/Stats "Warframes Comparison/Stats").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`warframes.getConclaveWarframeComparisonTable(frame)` (function)
:   Builds a Warframe comparison wikitable of rank 0 PvP stats.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`warframes.getConclaveWarframeRank30ComparisonTable(frame)` (function)
:   Builds a Warframe comparison wikitable of rank 30 PvP stats.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`warframes.getArmorChart()` (function)
:   Returns a wikitable of all armor values of Warframes as seen on [Armor#Warframe Armor and Effective Health](/w/Armor#Warframe_Armor_and_Effective_Health "Armor").
:   **Returns**: Wikitext of resultant wikitable (string)

`warframes.getWarframeCount(frame)` (function)
:   Gets the total count of Warframes in the game. Used on [Warframes#Overview](/w/Warframes#Overview "Warframes")
:   **Parameter**: `frame` Frame object with first argument being the subtable from which to count (table)
:   **Returns**: Number of Warframes in the game, including variants (number)

`warframes.getMasteryShortList(frame)` (function)
:   Returns a list of Warframes that have a particular Mastery Rank unlock as seen on [Mastery Rank#Mastery Rank Benefits](/w/Mastery_Rank#Mastery_Rank_Benefits "Mastery Rank").
:   **Parameter**: `frame` Frame object with the first argument being the Mastery Rank to filter by (table)
:   **Returns**: List of Warframes separated by ' • ' (string)

`warframes.getConclaveList()` (function)
:   Returns a list of Warframes that are playable in [Conclave](/w/Conclave "Conclave"). Used on [PvP#Limitations](/w/PvP#Limitations "PvP")
:   **Returns**: Wikitext of bulleted list of Warframes (string)

`warframes.getReleaseDateTable(frame)` (function)
:   Builds a wikitable of the release dates of each Warframe as seen on [Warframes Comparison/Release Dates](/w/Warframes_Comparison/Release_Dates "Warframes Comparison/Release Dates")
:   **Parameter**: `frame` (table)
:   **Returns**: Wikitext of wikitable (string)

`warframes.getSprintList(frame)` (function)
:   Returns a wikitable of all sprint speed values of Warframes as seen on [Sprint Speed](/w/Sprint_Speed "Sprint Speed").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

`warframes.getEnergyTable(frame)` (function)
:   Builds a wikitable for all Warframe's energy capacity. For use on [Energy Capacity](/w/Energy_Capacity "Energy Capacity") article.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

`warframes.getRankUpExceptionTable()` (function)
:   Returns a wikitable of Rank-Up Exceptions of Warframes as seen on [Warframes](/w/Warframes "Warframes").
:   **Returns**: Wikitext of resultant wikitable (string)

`warframes.getProgenitorTable()` (function)
:   Returns a wikitable of Progenitor Bonus of Warframes as seen on [Adversary System/Progenitor](/w/Adversary_System/Progenitor "Adversary System/Progenitor").
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

