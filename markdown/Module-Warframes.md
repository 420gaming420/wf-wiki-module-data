---
title: "Module:Warframes"
wiki_url: "https://wiki.warframe.com/w/Module/Warframes"
wiki_timestamp: "2026-06-19T20:35:00Z"
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

* [Warframes/Conclave/data](/w/Module:Warframes/Conclave/data "Module:Warframes/Conclave/data")
* [Warframes/Conclave/data/doc](/w/Module:Warframes/Conclave/data/doc "Module:Warframes/Conclave/data/doc")
* [Warframes/data](/w/Module:Warframes/data "Module:Warframes/data")
* [Warframes/data/doc](/w/Module:Warframes/data/doc "Module:Warframes/data/doc")
* [Warframes/doc](/w/Module:Warframes/doc "Module:Warframes/doc")
* [Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox")
* [Warframes/testcases](/w/Module:Warframes/testcases "Module:Warframes/testcases")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • M:Warframes ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
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

---

```lua
---	'''Warframes''' retrieves and stores [[Warframes|Warframe]] data of [[WARFRAME]].  

--	
--	On this Wiki, Warframes is used in:
--  * {{t|EquipmentUnlock}}
--  * {{t|WF}}
--	* {{t|WarframeNavVisual}}
--  * {{t|WarframeNav}}
--	
--	@module		warframes
--	@alias		p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|gigamicro]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@image		IconWarframe.png
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Warframes/Conclave/data]]
--	@require	[[Module:Version]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:StatObject]]
--	@release	stable
--	

local p = {}

local delayRequire = require([[Module:Shared]]).delayRequire
local WarframeData = delayRequire([[Module:Warframes/data]], true)
local ConclaveData = delayRequire([[Module:Warframes/Conclave/data]], true)
local Version = delayRequire([[Module:Version]])--getVersionLink, _getVersionDate
local Polarity = delayRequire([[Module:Polarity]])--_pols, _polarity
local Table = delayRequire([[Module:Table]])--skpairs
local Tooltip = require([[Module:Tooltips]])('Warframes')('icontext')
local StatObject = require([[Module:StatObject]])
table.unpack = table.unpack or unpack

p.__StatObject = StatObject
p._statRead = StatObject.statRead
p._statFormat = StatObject.statFormat
StatObject.default = {
-- Abilities={{}},
Armor = 0,
ArmorRank30 = function(wf)
	return wf.ArmorRank30 or p._statRead(wf, 'Armor')
end,
ArmorReduct = function(wf)
	return (p._statRead(wf, 'Armor') + 300) / 300
end,
ArmorReductRank30 = function(wf)
	return (p._statRead(wf, 'ArmorRank30') + 300) / 300
end,
AuraPolarity = { 'None', StatObject.meta.passes(Polarity._polarity) },
BaseName = function(wf)
	-- TODO: This will break the moment database localization is implemented since in other languages the variant name is not always after the base name
	local name = p._statRead(wf, 'Name')
	return (name:match('%S+'))
end,
CodeName = function(wf)
	-- Extracting code name from InternalName (not localized so can treat as enum)
	return wf.InternalName:match('^/Lotus/Powersuits/([^/]+)')
end,
Conclave = false,
EffectiveHealth = function(wf)
	-- Health gets damage reduction from armor; Shields get flat 50% damage reduction
	local ehp = p._statRead(wf, 'Health') * p._statRead(wf, 'ArmorReduct') + p._statRead(wf, 'Shield') / (1 - 0.5)
	return StatObject.pucacheIn(wf, 'EffectiveHealth', ehp - ehp % 0.01)
end,
EffectiveHealthRank30 = function(wf)
	local ehp = p._statRead(wf, 'HealthRank30') * p._statRead(wf, 'ArmorReductRank30') + p._statRead(wf, 'ShieldRank30') / (1 - 0.5)
	return StatObject.pucacheIn(wf, 'EffectiveHealthRank30', ehp - ehp % 0.01)
end,
EffectiveHealthWithOvershields = function(wf)
	return p._statRead(wf, 'EffectiveHealth') + (p._statRead(wf, 'Overshield') / (1 - 0.5))
end,
EffectiveHealthWithOvershieldsRank30 = function(wf)
	return p._statRead(wf, 'EffectiveHealthRank30') + (p._statRead(wf, 'Overshield') / (1 - 0.5))
end,
Energy = 1,
EnergyRank30 = function(wf)
	return wf.EnergyRank30 or p._statRead(wf, 'Energy') + 50
end,
ExilusPolarity = { 'None', StatObject.meta.passes(Polarity._polarity) },
Gender = StatObject.meta.gets('Sex'),
Health = 10,
HealthRank30 = function(wf)
	return wf.HealthRank30 or p._statRead(wf, 'Health') + 100
end,
Image = { 'Panel.png', '[[File:%s|link=]]' },
InitialEnergy = 0,
Introduced = { 'U999.0.0', StatObject.meta.passes(Version.getVersionLink) },
IsPrime = function(wf) return (wf.InternalName:find('Prime')) and true or false end,
IsUmbra = function(wf) return (wf.InternalName:find('Umbra')) and true or false end,
Mastery = { 0, '[[File:MasteryAffinity64.png|class=icon]]%s' },
Name = '',
Overshield = function(wf)
	-- Not sure about overshield values for Operators
	if (wf.Shield == 0) then
		return 0
	end
	-- Harrow gets double overshield cap due to passive
	if (wf.InternalName == '/Lotus/Powersuits/Priest/Priest' or
			wf.InternalName == '/Lotus/Powersuits/Priest/HarrowPrime') then
		return 2400
	end
	return 1200
end,
Polarities = { nil, StatObject.meta.passes(Polarity._pols) },
Portrait = { 'Panel.png', '[[File:%s|link=]]' },
Progenitor = 'True',
ReleaseDate = function(wf) return Version._getVersionDate(p._statRead(wf, 'Introduced')) end,
Sex = 'Androgyne',
Shield = 0,
ShieldRank30 = function(wf)
	return wf.ShieldRank30 or p._statRead(wf, 'Shield') + 100
end,
Sprint = 1,
Subsumed = {''--[[,StatObject.meta.passes(Tooltips'Abilities''icontext')]]},
-- Themes='',
Variant = function(wf)
	-- Treat variant strings as enums for development
	-- Ignoring edge case for Excalibur Umbra Prime, would consider that as Prime first over Umbra
	if p._statRead(wf, 'IsPrime') then
		return 'Prime'
	elseif p._statRead(wf, 'IsUmbra') then
		return 'Umbra'
	end
	return 'Base'
end,
Vaulted = { false, function(self, v) return v and 'Vaulted' or 'Unvaulted' end },
}

local function getValue(wf, key, formatted)
	if wf == nil then
		return nil
	end
	return (formatted and p._statFormat or p._statRead)(wf, key)
end

---	Returns a subset of Warframe entries as stored in /data or /Conclave/data.
--	@function		p._getWarframes
--	@param			{function} validateFunction Function to filter data by that returns a boolean value
--	@param[opt]		{boolean} ignoreSpecialWarframes If true, ignores special Warframes like Sevagoth's Shadow or Excalibur Umbra Prime
--	@param[opt]		{boolean} useConclaveData If true, uses /Conclave/data, otherwise uses /data
--	@return			{table} List of Warframe entries
function p._getWarframes(validateFunction, useIgnore, useConclaveData)
	return StatObject.getObjects(
		(useConclaveData and ConclaveData or WarframeData)["Warframes"],
		useIgnore and function(wf) return not wf._IgnoreEntry and validateFunction(wf) end or validateFunction,
		false)
end

---	Same as p._getWarframes, but uses /Conclave/data.
--	@function		p._getConclaveWarframes
--	@param			{function} validateFunction Function to filter data by that returns a boolean value
--	@return			{table} List of Warframe entries
function p._getConclaveWarframes(validateFunction, useIgnore)
	return p._getWarframes(validateFunction, useIgnore, true)
end

--- Variant adapter for shortLinkList
local function variantOf(wf)
	local full, var, base = wf.Name, getValue(wf, 'Variant')
	-- base = full:sub(1,-7)
	base = full:gsub(' Prime',''):gsub(' Umbra','')
	-- mw.log('I think '..full..' is a '..var..' version of '..base)
	return var, base, full
end

---	Lists each warframe as Tooltip(frame)..' ('..Tooltip(frame..' Prime')..')' or '[['..frame..']] ([['..frame..' Prime]])'
--	@function		p._linkList
--	@param			{table} wfs List of Warframes entries as seen in /data
--	@param			{boolean} doTooltip If true, Warframe names will have tooltips, otherwise 
--							  they will be normal article links
--	@return			{table} Resultant list of formatted Warframe name strings
function p._linkList(wfs, tooltip)
	return StatObject.shortLinkList(wfs, variantOf, tooltip and 'Warframes')
end

--- Groups a set of warframes into N groups based on the first letter of their name
--  @function       p._groupAtoZ
--  @param          {table} wfs List of Warframes entries as seen in /data
--  @param          {number} nGroups Number of groups to create
--  @return         {table} Ordered list of groups, each having .name and .members
function p._groupAtoZ(wfs, nGroups)
	-- Programmer's note:
	-- This algorithm can technically produce fewer than nGroups, but only if
	-- boundary letters are overloaded enough to cause total group overrun of
	-- more than targetGroupSize. Warframes tend to be evenly distributed in
	-- alphabet space so hopefully this never happens :pray:.
	table.sort(wfs, function(a, b) return a.Name < b.Name end)
	if nGroups < 1 then
		nGroups = 1
	end
	local targetGroupSize = #wfs / nGroups
	local groups = {}
	local wfIndex = 1
	while wfIndex <= #wfs do
		local startLetter = string.sub(wfs[wfIndex].Name, 1, 1)
		local endLetter = startLetter
		local groupMembers = {}
		repeat
			table.insert(groupMembers, wfs[wfIndex])
			endLetter = string.sub(wfs[wfIndex].Name, 1, 1)
			wfIndex = wfIndex + 1
		until
			wfIndex > #wfs or
			(#groupMembers >= targetGroupSize and string.sub(wfs[wfIndex].Name, 1, 1) > endLetter)
		table.insert(groups, {
			name = startLetter == endLetter and startLetter or startLetter .. '-' .. endLetter,
			members = groupMembers
		})
	end
	return groups
end

---	Builds a wikitable row to list all Warframes as used on [[Template:WarframeNav]]
--	@function		p.nav
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of wikitable row
function p.nav(frame)
	local doPrime, doUmbra = (frame.args.prime or 'y') == 'y', (frame.args.umbra or 'y') == 'y'
	local wfs = p._getWarframes(
		function(wf)
			return (doPrime or not getValue(wf, 'IsPrime')) and (doUmbra or not getValue(wf, 'IsUmbra'))
		end,
		true
	)
	
	local groups = p._groupAtoZ(wfs, 4)
	
	local navTextRows = {}
	for _, group in ipairs(groups) do
		table.insert(navTextRows,
			'|class="navboxgroup"|' .. group.name ..
			'||' .. table.concat(p._linkList(group.members, true), ' • ')
		)
	end
	return table.concat(navTextRows, '\n|-\n')
end

--- Builds visual navigation bar for Warframes as seen on [[Template:WarframeNavVisual]].
--	@function		p.buildWarframeVisualNav
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of navigation bar
function p.navVisual(frame)
	local conclave = frame.args['conclave']
	conclave = conclave and conclave ~= '' or false

	local wfs, prime = {}, {}
	for k, wf in StatObject.objIter(WarframeData.Warframes, conclave and function(wf) return wf.Conclave end or nil) do
		local v, b, f = variantOf(wf)
		if v ~= 'Base' then
			prime[b] = wf
			-- prime[select(2,variantOf(wf))]=wf
		else
			table.insert(wfs,wf)
		end
	end

	table.sort(wfs, function(a, b) return a.Name < b.Name end)
	
	local ret = { '

' }
	for _, wf in ipairs(wfs) do
		local primeWF = prime[wf.Name]
		local link = conclave and 'Conclave:'..wf.Link or wf.Link
		table.insert(ret, (
			'

'..
				'

%s

'..
				'[[File:%s|64px|link=%s|class=notpageimage]]

'..
				'[[%s|%s]]'..
				(primeWF and '

[[File:%s|64px|link=%s|class=notpageimage]]

' or '')..
			'

'
		):format(
			primeWF and '⭐' or '',
			primeWF and ' class="WarframeNavBoxImage"' or '', wf.Portrait, link,
			link, primeWF and 'gold' or 'white', wf.Name,
			primeWF and primeWF.Portrait, link
		))
	end
	table.insert(ret, '
```

')
 return table.concat(ret)
end
p.buildWarframeVisualNav = p.navVisual
local function getWarframeComparisonRow(warframeEntry, useRank30)
 if (useRank30 == nil) then
 useRank30 = false
 end
 local addOn = (useRank30) and "Rank30" or ""
 local td = '|| style = "" |'
 local result = { ('\n|-\n|[[%s]]'):format(warframeEntry.Name) }
 local attributes = {
 "Health"..addOn,
 "Shield"..addOn,
 "Overshield",
 "Armor"..addOn,
 "EffectiveHealth"..addOn,
 "EffectiveHealthWithOvershields"..addOn,
 "Energy"..addOn,
 "InitialEnergy",
 "Sprint"
 }
 for \_, attribute in ipairs(attributes) do
 table.insert(result, td..tostring(getValue(warframeEntry, attribute, false)))
 end
 return table.concat(result, '')
end
local function getWarframeComparisonTable(Warframes, useRank30)
 local tHeader = ([=[{| data-sort-type="number" class="wikitable sortable"
! data-sort-type="string"|Name
! [[Health]]
! [[Shields]]
! Max [[Overshields]]
! [[Armor]]
! Effective Health
! Effective Health w/  
Max Overshields
! [[Energy Capacity]]
! Energy At Spawn
! [[Sprint Speed|Sprint]]]=])
 local tRows = ""
 for i, wframe in Table.skpairs(Warframes) do
 if (not wframe.\_IgnoreEntry) then
 local rowStr = getWarframeComparisonRow(wframe, useRank30)
 tRows = tRows..rowStr
 end
 end
 return tHeader..tRows.."\n|}[[Category:Automatic Comparison Table]]"
end
--- Builds a Warframe comparison wikitable of rank 0 stats as seen on [[Warframes Comparison/Stats]].
-- @function p.getWarframeComparisonTable
-- @param {table} frame Frame object
-- @return {string} Resultant wikitext of wikitable
function p.getWarframeComparisonTable(frame)
 return getWarframeComparisonTable(WarframeData["Warframes"])
end
--- Builds a Warframe comparison wikitable of rank 30 stats as seen on [[Warframes Comparison/Stats]].
-- @function p.getWarframeRank30ComparisonTable
-- @param {table} frame Frame object
-- @return {string} Resultant wikitext of wikitable
function p.getWarframeRank30ComparisonTable(frame)
 return getWarframeComparisonTable(WarframeData["Warframes"], true)
end
--- Builds a Warframe comparison wikitable of rank 0 PvP stats.
-- @function p.getConclaveWarframeComparisonTable
-- @param {table} frame Frame object
-- @return {string} Resultant wikitext of wikitable
function p.getConclaveWarframeComparisonTable(frame)
 return getWarframeComparisonTable(ConclaveData["Warframes"])
end
--- Builds a Warframe comparison wikitable of rank 30 PvP stats.
-- @function p.getConclaveWarframeRank30ComparisonTable
-- @param {table} frame Frame object
-- @return {string} Resultant wikitext of wikitable
function p.getConclaveWarframeRank30ComparisonTable(frame)
 return getWarframeComparisonTable(ConclaveData["Warframes"], true)
end
--- Returns a wikitable of all armor values of Warframes as seen on [[Armor#Warframe Armor and Effective Health]].
-- @function p.getArmorChart
-- @return {string} Wikitext of resultant wikitable
function p.getArmorChart()
 --bucket armor values
 local t = {}
 for \_, wf in Table.skpairs(WarframeData["Warframes"]) do
 if not wf.\_IgnoreEntry then
 local link = Tooltip(wf.Name)
 if wf.ArmorRank30 then
 t[wf.ArmorRank30] = t[wf.ArmorRank30] or {}
 table.insert(t[wf.ArmorRank30], link..' (Max Rank)')
 link=link..' (Unranked)'
 end
 t[wf.Armor] = t[wf.Armor] or {}
 table.insert(t[wf.Armor], link)
 end
 end
 --sort
 local keys = {}
 for armor, \_ in pairs(t) do
 table.insert(keys, armor)
 end
 table.sort(keys)
 --format
 --ascending buckets of 10% each
 local colors={
 'E4BAD2','C4ADCF','9ECFF6','98E5DA','D0F7BD',
 'FFFFB3','FFC7A3','F9AD81','FF8878','F26C4F',
 }
 local content = {}
 for \_, armor in ipairs(keys) do
 local DR = (100 \* armor / (armor + 300)) -- as percent
 -- Colors disabled because they where unreadable with new darkmode theme
 -- local interval = '|style="background-color:#'..colors[math.floor(DR/10)+1]..';"|'
 local interval = '|'
 wfs = t[armor]
 table.insert(content,
 interval..armor..'|'..
 interval..math.floor(DR+.5)..'%|'..
 interval.. .1\*math.floor(.5+(1000/(100-DR)))..'x|'..
 interval..table.concat(wfs, ', ')
 )
 end
 return [=[
{| class="wikitable armortable sortable"
|+ Warframe Armor Stats (from [[Module:Warframes/data]])
|-
! Armor
! Damage Reduction
! EHP Multiplier
! Warframe(s)
|-
]=]..table.concat(content, '\n|-\n')..'\n|}'
end
--- Gets the total count of Warframes in the game. Used on [[Warframes#Overview]]
-- @function p.getWarframeCount
-- @param {table} frame Frame object with first argument being the subtable from which to count
-- @return {number} Number of Warframes in the game, including variants
function p.getWarframeCount(frame)
 local count = 0
 for \_, wfEntry in pairs(WarframeData[frame.args and frame.args[1] or "Warframes"]) do
 if not wfEntry.\_IgnoreEntry then
 count = count + 1
 end
 end
 return count
end
--- Returns a list of Warframes that have a particular Mastery Rank unlock as seen on
-- [[Mastery Rank#Mastery Rank Benefits]].
-- @function p.getMasteryShortList
-- @param {table} frame Frame object with the first argument being the Mastery Rank to filter by
-- @return {string} List of Warframes separated by ' • '
function p.getMasteryShortList(frame)
 local masteryRank = tonumber(frame.args[1])
 return table.concat(p.\_linkList(p.\_getWarframes(function(wf)
 return (wf.Mastery or 0) == masteryRank
 end, true), true), " • ")
end
--- Returns a list of Warframes that are playable in [[Conclave]].
-- Used on [[PvP#Limitations]]
-- @function p.getConclaveList
-- @return {string} Wikitext of bulleted list of Warframes
function p.getConclaveList()
 return "\*"..table.concat(p.\_linkList(p.\_getWarframes(function(wf) return true end, false, true), true), "\n\*")
end
--- Builds a wikitable of the release dates of each Warframe as seen on
-- [[Warframes Comparison/Release Dates]]
-- @function p.getReleaseDateTable
-- @param {table} frame
-- @return {string} Wikitext of wikitable
function p.getReleaseDateTable(frame)
 local category = string.lower(frame.args and frame.args[1] or frame)
 local validator = ({
 original = function(wf) return not getValue(wf, 'IsPrime') and not wf.\_IgnoreEntry end,
 prime = function(wf) return getValue(wf, 'IsPrime') and not wf.\_IgnoreEntry end,
 female = function(wf) return (wf.Sex == "Female") and not wf.\_IgnoreEntry end,
 male = function(wf) return (wf.Sex == "Male") and not wf.\_IgnoreEntry end,
 ["non-binary"] = function(wf) return (wf.Sex == "Non-binary") and not wf.\_IgnoreEntry end,
 })[category] or function(wf) return not wf.\_IgnoreEntry end
 local warframes = {}
 for \_, wf in StatObject.objIter(WarframeData.Warframes, validator) do
 table.insert(warframes, wf)
 end
 table.sort(warframes, function(a, b)
 local dateA = getValue(a, 'ReleaseDate') or ''
 local dateB = getValue(b, 'ReleaseDate') or ''
 if dateA ~= dateB then
 return dateA > dateB
 end
 return (a.Name or '') > (b.Name or '')
 end)
 local result = {[=[
{| class="wikitable listtable sortable stickyHeader" style="width:100%; white-space:nowrap;" align="center"'
|+ Warframe Release Dates (from [[Module:Warframes/data]])
|-
! data-sort-type="text" | Warframe Name
! data-sort-type="text" | Gender
! data-sort-type="isoDate" | Release Date (*yyyy-mm-dd*)
! data-sort-type="text" | Update Version
]=]..(category=='prime' and '! data-sort-type="text" | [[Vaulted]] Status' or '')}
 for \_, warframe in ipairs(warframes) do
 table.insert(result, ('|-\n| [[%s]] || %s || %s || data-sort-value="%s" | %s%s'):format(
 warframe.Name,
 getValue(warframe, 'Gender'),
 getValue(warframe, 'ReleaseDate'),
 p.\_statRead(warframe, 'Introduced'),
 p.\_statFormat(warframe, 'Introduced'),
 category == 'prime' and ' || '..p.\_statFormat(warframe, 'Vaulted') or '',
 nil))
 end
 table.insert(result, '|}')
 return table.concat(result, '\n')
end
--- Returns a wikitable of all sprint speed values of Warframes as seen on [[Sprint Speed]].
-- @function p.getSprintList
-- @param {table} frame Frame object
-- @return {string} Wikitext of resultant wikitable
function p.getSprintList(frame)
 --bucket sprint speeds
 local t = {}
 for \_, wf in Table.skpairs(WarframeData["Warframes"]) do
 if wf.Sprint and not wf.\_IgnoreEntry then
 t[wf.Sprint] = t[wf.Sprint] or {}
 table.insert(t[wf.Sprint], Tooltip(wf.Name))
 end
 end
 --sort
 local keys = {}
 for speed, \_ in pairs(t) do
 table.insert(keys, speed)
 end
 table.sort(keys)
 --format
 local sprintTable = {[=[
{| class="wikitable sortable"
|+ Warframe Sprint Speeds (from [[Module:Warframes/data]])
|-
! style="white-space:nowrap; data-sort-type="number" | Sprint Speed !! Warframes]=]}
 for \_, speed in ipairs(keys) do
 wfs = t[speed]
 table.insert(sprintTable, '|-\n|'..speed..'||'..table.concat(wfs, ', '))
 end
 table.insert(sprintTable, '|}')
 return table.concat(sprintTable, '\n')
end
--- Builds a wikitable for all Warframe's energy capacity.
-- For use on [[Energy Capacity]] article.
-- @function p.getEnergyTable
-- @param {table} frame Frame object
-- @return {string} Wikitext of resultant wikitable
function p.getEnergyTable(frame)
 local result = { [=[
{| class="wikitable sortable"
|+ Warframe Energy Capacities (from [[Module:Warframes/data]])
|-
! Warframe
! Starting Energy  
(energy on spawn)
! Rank 0 Energy Capacity  
(base capacity)
! Rank 30 Energy Capacity  
(after ranking bonus applied)
|-]=]
 }
 for k, wfEntry in Table.skpairs(WarframeData.Warframes) do
 if (not wfEntry.\_IgnoreEntry) then
 table.insert(result, ('|-\n| %s || %s || %s || %s'):format(
 Tooltip(k, wfEntry),
 wfEntry.InitialEnergy,
 wfEntry.Energy,
 wfEntry.EnergyRank30 and wfEntry.EnergyRank30 or wfEntry.Energy + 50
 ) )
 end
 end
 table.insert(result, '|}')
 return table.concat(result, '\n')
end
--- Returns a wikitable of Rank-Up Exceptions of Warframes as seen on [[Warframes]].
-- @function p.getRankUpExceptionTable
-- @return {string} Wikitext of resultant wikitable
function p.getRankUpExceptionTable()
 local result = { [=[
{| class="wikitable emodtable"
|+ Warframe Rank Up Exceptions (from [[Module:Warframes/data]])
! Warframe
! Health
! Shield
! Armor
! Energy
|-]=]
 }
 local health, shield, armor, energy
 for \_, wf in Table.skpairs(WarframeData.Warframes) do
 if not wf.\_IgnoreEntry then
 health = (wf.HealthRank30 or wf.Health + 100) - wf.Health
 shield = (wf.ShieldRank30 or wf.Shield + 100) - wf.Shield
 armor = (wf.ArmorRank30 or wf.Armor ) - wf.Armor
 energy = (wf.EnergyRank30 or wf.Energy + 50 ) - wf.Energy
 if (health ~= 100 or shield ~= 100 or armor ~= 0 or energy ~= 50) then
 table.insert(result, ('|-\n| %s || %s || %s || %s || %s'):format(
 Tooltip(wf.Name),
 health == 100 and '*100*' or '**'..health..'**',
 shield == 100 and '*100*' or '**'..shield..'**',
 armor == 0 and '*0*' or '**'..armor..'**',
 energy == 50 and '*50*' or '**'..energy..'**'
 ) )
 end
 end
 end
 table.insert(result, '|}')
 return table.concat(result, '\n')
end
--- Returns a wikitable of Progenitor Bonus of Warframes as seen on [[Adversary System/Progenitor]].
-- @function p.getProgenitorTable
-- @return {string} Wikitext of resultant wikitable
function p.getProgenitorTable()
 local DTooltip = require([[Module:Tooltips]])('DamageTypes')('full')
 local order = { "Impact", "Heat", "Cold", "Electricity", "Toxin", "Magnetic", "Radiation" }
 local Elements = { Impact = {}, Heat = {}, Cold = {}, Electricity = {}, Toxin = {}, Magnetic = {}, Radiation = {} }
 local result = { [=[
{| class="wikitable" style="width:100%;text-align:center;"
|+ Warframe Progenitor Bonus Element (from [[Module:Warframes/data]])
|-
!Element
!Progenitor Warframe\*]=]
 }
 for \_, wf in Table.skpairs(WarframeData.Warframes) do
 if getValue(wf, 'Variant') == 'Base' and not wf.\_IgnoreEntry then
 table.insert(Elements[wf.Progenitor], Tooltip(wf.Name))
 end
 end
 for \_, element in ipairs(order) do
 table.insert(result, ('|-\n|%s||%s'):format(
 DTooltip(element),
 table.concat(Elements[element], ' • ')
 ))
 end
 table.insert(result, '|}\n\*Note that the [[Prime]]d or Umbra version of a Warframe share the same element')
 return table.concat(result, '\n')
end
return p

