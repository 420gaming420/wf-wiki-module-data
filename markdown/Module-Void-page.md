---
title: "Module:Void/page"
wiki_url: "https://wiki.warframe.com/w/Module/Void/page"
wiki_timestamp: "2026-08-21T19:17:37Z"
---

**Void/page** creates infoboxes, message boxes, and drop tables for [Void Relic](/w/Void_Relic "Void Relic") pages. On this Wiki, Void/page is used in:

* [Template:RelicPage](/w/Template:RelicPage "Template:RelicPage")

## Contents

* [1 About](#About)
* [2 Usage](#Usage)
  + [2.1 Template](#Template)
* [3 Notes](#Notes)
* [4 Documentation](#Documentation)
  + [4.1 Package items](#Package_items)
* [5 See Also](#See_Also)
* [6 Code](#Code)

## About

Since all individual [Void Relic](/w/Void_Relic "Void Relic") articles follow the same format and require frequent updates to its drop locations whenever a new [Prime Access](/w/Prime_Access "Prime Access") is released (every fiscal quarter), we can port their contents to a Lua module for semi-automation based on changes to [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data"), [Module:Void/data](/w/Module:Void/data "Module:Void/data") (Void Relic rewards), [Module:Missions/data](/w/Module:Missions/data "Module:Missions/data") (mission nodes and mission types), [Module:Warframes/data](/w/Module:Warframes/data "Module:Warframes/data") (Prime Warframes), [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data") (Prime weapons), [Module:Companions/data](/w/Module:Companions/data "Module:Companions/data") (Prime companions), and [Module:Resources/data](/w/Module:Resources/data "Module:Resources/data") (misc resources like [![](/images/thumb/Forma.png/32px-Forma.png?c7d01)](/w/Forma "Forma") [Forma](/w/Forma "Forma")) data stores. This allows scaling of content generation without the help of a bot editor and allows for consistency in how content are structured. Message localization is also possible if done this way, but is not fully implemented.

Normally editors wouldn't need to edit this module but beware of script errors occurring if one decides to update how Void Relic articles are formatted. The module's main function `p.buildRelicPage()` outputs the wikitext that is used to render the article's content. You can view the raw wikitext/HTML output by invoking the function on [Special:ExpandTemplates](/w/Special:ExpandTemplates "Special:ExpandTemplates").

## Usage

### Template

In template: `{{#invoke:Void/infobox|buildRelicPage}}`  
In articles: `{{RelicPage}}`

## Notes

* Successor of [Template:RelicInfobox](/w/Template:RelicInfobox "Template:RelicInfobox"), [Template:RelicTable](/w/Template:RelicTable "Template:RelicTable"), and [Template:RelicTable/Check](/w/Template:RelicTable/Check "Template:RelicTable/Check"); saves around 0-0.1 seconds and 3-6 MB of memory of Lua scripts running on relic pages
* If you want to edit the wikitext output, go to `p.buildRelicInfobox()` and `p.buildRelicDropTable()`

## Documentation

### Package items

`void.Resurgence(relicName)` (function)
:   Returns relic's Prime Resurgence (Varzia) status.
:   **Parameter**: `relicName` Name of the relic (string)
:   **Returns**: true or false (boolean)

`void.buildRelicInfobox(frame)` (function)
:   Builds relic infobox, adds a message box (if needed), and the categories.
:   **Parameter**: `frame` Frame object with 'name' argument for relic name (table)
:   **Returns**: Wikitext of infobox (string)

`void.buildRelicDropTable(frame)` (function)
:   Builds relic drop table as seen on [Template:RelicTable](/w/Template:RelicTable "Template:RelicTable").
:   **Parameter**: `frame` Frame object with 'name' argument for relic name (table)
:   **Returns**: Wikitext of wikitable (string)

`void.buildRelicDropLocations(frame)` (function)
:   Returns the missions and sources where the relic itself can be dropped from.
:   **Parameter**: `frame` Frame object with 'name' argument for relic name (table)
:   **Returns**: Wikitext of mission wikitable and other text (string)

`void.buildRelicPage(frame)` (function)
:   Builds a relic page, adding an infobox, a message box (if needed), the relic's drop table, and update category.
:   **Parameter**: `frame` Frame object with 'name' argument for relic name (table)
:   **Returns**: Wikitext of the entire relic page (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Void/page/doc](/w/Module:Void/page/doc "Module:Void/page/doc")

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
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • M:Void/page • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
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
--- '''Void/page''' creates infoboxes, message boxes, and drop tables for [[Void Relic]] pages.
--	
--	On this Wiki, Void/page is used in:
--	* [[Template:RelicPage]]
--	
--	@module		void
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Flaicher|Flaicher]] ([[MediaWiki:RelicTable.js]])
--	@image		VoidProjectionsIronD.png
--	@require	[[Module:Void/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Companions/data]]
--	@require	[[Module:Vendors/data]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Baro]]
--	@require	[[Module:Void]]
--	@require	[[Module:Version]]
--	@require	[[Module:DropTables]]
--	@require	[[Module:InfoboxBuilder]]
--	@require	[[Module:Math]]
--	@require	[[Module:Text]]
--	@require	[[MediaWiki:RelicTable.js]] (script for relic refinement buttons)
--	@release	stable
--	

local p = {}

local VoidData = mw.loadData('Module:Void/data')
local WeaponData = require('Module:Weapons/data')
local WarframeData = mw.loadData('Module:Warframes/data')['Warframes']
local ArchwingData = mw.loadData('Module:Warframes/data')['Archwings']
local ResourceData = mw.loadData('Module:Resources/data')['Resources']
local CompanionData = mw.loadData('Module:Companions/data')['Companions']
local ModData = mw.loadData('Module:Mods/data')['Mods']
local VendorsData = mw.loadData('Module:Vendors/data')['Vendors']
local Math = require('Module:Math')
local Text = require('Module:Text')

local RelicData = VoidData['RelicData']
local PrimeData = VoidData['PrimeData']

local Vendor = require('Module:Vendors')
local Baro = require('Module:Baro')
local Void = require('Module:Void')
local Version = require('Module:Version')
local DropTable = require('Module:DropTables')
local InfoboxBuilder = require('Module:InfoboxBuilder')

-- Note that this table ID is used by [[MediaWiki:RelicTable.js]] to change rarity 
-- drop chance elements for different refinements of relics (e.g. Intact vs. Radiant relics).
-- This is used in p.buildRelicDropTable(frame)
local RELIC_TABLE_ID = '72656C6963table'
local ICON_SIZE = '38'	-- Used in getRelicDrops(relic); icon size in pixels

local IMAGE_MAP = {
	Lith = 'LithRelicIntact.png',
	Meso = 'MesoRelicIntact.png',
	Neo  = 'NeoRelicIntact.png',
	Axi  = 'AxiRelicIntact.png',
	Requiem = 'RequiemRelicIntact.png',
	Vanguard = 'AxiRelicIntact.png',
}

-- As of 2026-05-17, these are not available through Void Relic Packs or Endless Void Fissures
-- Only obtainable from Empyrean [[Abandoned Derelict Caches]]
local EMPYREAN_VOID_RELIC_EXCEPTIONS = {
	-- Nyx Prime and Valkyr Prime permanent unvaulting relics
	["Lith C7"] = true,
	["Meso N11"] = true,
	["Neo V9"] = true,
	["Axi S8"] = true,
	["Axi V10"] = true
}

--- Returns relic's Prime Resurgence (Varzia) status.
--	@function		p.Resurgence
--	@param			{string} relicName Name of the relic
--	@return			{boolean} true or false
function p.Resurgence(relicName)
	if type(relicName) == 'table' then relicName = relicName.args[1] end
	return p._Resurgence(relicName)
end
function p._Resurgence(relicName)
	for _, offer in ipairs(VendorsData['Varzia'].Offerings) do
		if offer[1] == relicName .. ' Relic' then
			return true
		end
	end
	return false
end
local isVarzia = p._Resurgence

--- Returns the appropriate message box for relic page.
--	@function		getMessageBox
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of message box
local function getMessageBox(relic)
	if relic['IsBaro'] then
		return [=[
{{ambox
| image = Voidtraderplaceholderthumb.png
| link = Baro Ki'Teer
| quote = Maybe next time.
| type = This [[Void Relic]] is exclusive to the [[Baro Ki'Teer|Void Trader's]] offerings and may not be available for purchase at this time. Players can still [[Trading|trade]] for it, however.
}}]=]
	elseif isVarzia(relic.Name) then
		return [=[
{{ambox
| image = Varzia.png
| link = Prime Resurgence
| quote = Rumours were true. The vault of history is open.
| type = This [[Void Relic]] is obtainable from [[Prime Resurgence]] offerings for a limited time. Players can still [[Trading|trade]] for it, however.
}}]=]
	elseif relic['Vaulted'] then
		-- TODO: Can't we just return "{{Vaulted}}" instead? The module will preprocesses the frame so it should still render properly
			return [=[
{{ambox
| image = AladVPortrait_d.png
| link = Alad V
| quote = Market forces dictate that you need to evolve or die.
| type = This [[Void Relic]] is no longer obtainable from the [[Drop Tables]]. However, vaulted relics can still be opened or [[Trading|traded]] if they are in player inventories.
}}]=]
	else
		return ''
	end
end

--- Returns the relic status.
--	@function		getRelicStatus
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of infobox image caption
local function getRelicStatus(relic) 
	if relic['IsBaro'] then
		return [=[

'''[[Baro Ki'Teer|Baro Ki'Teer Exclusive]]'''

]=]
	elseif isVarzia(relic.Name) then
		return [=[

'''[[Prime Resurgence|Prime Resurgence Available]]'''

]=]
	elseif relic['Vaulted'] then
		return [=[

]=] .. Text._text("'''VAULTED'''", { color='var(--negative-text-color)' }) .. [=[

]=]
	else
		return [=[

]=] .. Text._text("'''AVAILABLE'''", { color='var(--positive-text-color)' }) .. [=[

]=]
	end
end

--- Returns the relic's related categories.
--	@function		getRelicCategories
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of category links
local function getRelicCategories(relic)
	local categories = { '[[Category:Relic]]' }
	if relic['Vaulted'] then
		table.insert(categories, '[[Category:Vaulted Relics]]')
	end
	if relic['IsBaro'] then
		table.insert(categories, '[[Category:Baro_Ki\'Teer_Offering]][[Category:Removed]]')
	end
	if isVarzia(relic.Name) then
		table.insert(categories, '[[Category:Prime Resurgence Offering]]')
	end
	table.insert(categories, '[[Category:'..relic['Tier']..']]')
	table.insert(categories, Version._getVersionCategory(relic['Introduced']))
	return table.concat(categories)
end

--- Returns interwiki links to wikias with separate relic pages
--	@function		getnterwikiLinks
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext containing interwiki links
local function getInterwikiLinks(relic)
	--returns nothing if RelicData contains not enough data
	if type(relic.Name) ~= 'string' or type(relic.Tier) ~= 'string' or
			not relic.Name:find(' %w') then
		return ''
	end
	--separating Tier from Name
	local relicName = relic.Name:gsub('.+ ','')
	local interwikis = {}
	local iTemplate = '[[%s:%s %s]]'
	-- TODO: Could move localization to [[MediaWiki:Custom-VoidRelics/i18n.json]]
	-- TODO: Missing "Vanguard" localization
	local eligibleWikias = {
		--true value for wikias with identical relic page names
		fr = true,
		es = true,
		ja = true,
		--tables value for wikias with localised relic page names
		['ru'] = {
			Lith = 'Лит',
			Meso = 'Мезо',
			Neo = 'Нео',
			Axi = 'Акси',
			Requiem = 'Реквием',
		},
		['uk'] = {
			Lith = 'Літ',
			Meso = 'Мезо',
			Neo = 'Нео',
			Axi = 'Аксі',
			Requiem = 'Реквієм',
		},
	}
	--generating interwiki links
	for lang, translate in pairs(eligibleWikias) do
		if	translate == true then
			table.insert(interwikis, iTemplate:format(lang,relic.Tier, relicName))
		elseif type(translate) == 'table' and translate[relic.Tier] then
			table.insert(interwikis, iTemplate:format(lang,translate[relic.Tier], relicName))
		end
	end
	return table.concat(interwikis)
end

--- Builds relic infobox, adds a message box (if needed), and the categories.
--	@function		p.buildRelicInfobox
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of infobox
function p.buildRelicInfobox(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicInfobox(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicInfobox(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(relicName)
		:image(IMAGE_MAP[relic['Tier']])
		:caption('relic-status', getRelicStatus(relic))
		:caption('tradable', '[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|' .. Text._text('%s', { color = 'var(--positive-text-color)'} ) .. ']][[Category:Tradeable]]', 'tradable')
		:group():header('%s', 'general-information')
			:row('release-date', '%s', Version._getVersionLink(relic['Introduced']), 'introduced')
			:row('latest-vaulting', '%s', relic['Vaulted'] ~= nil and Version._getVersionLink(relic['Vaulted']) or '', 'latest-vaulting')
		:done()

	local vendorStr = Vendor._buildVendorSourceStrings(relicName .. ' Relic')
	local baroStr = Baro._buildBaroSourceStrings(relicName .. ' Relic')
	
	Infobox:group():header('%s', 'vendor-sources')
		:value('

'..frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		)..'

', 'Offerings')
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	:group():header('%s', 'update-infobox-data')
		:caption('update-infobox-data', '[[Module:Void/data]] / [[Module:DropTables/data]]', 'update-infobox-data')
	:done()
		
	return frame:preprocess(getMessageBox(relic)..tostring(Infobox))..getRelicCategories(relic)..getInterwikiLinks(relic)
end

--- Returns a table of the images, links, and ducat values of drops from a relic.
--	@function		getRelicDrops
--	@param			{table} relic Relic entry in /data
--	@return			{table} Table containing image, links, and ducat values of each item corresponding by index
local function getRelicDrops(relic)
	-- Index will correspond to the entries; i.e. prime part represented by
	-- ImageLinks[1] will have the corresponding ducat value in DucatValues[1]
	local relicDrops = { ImageLinks = {}, DucatValues = {} }
	
	-- Assuming drops are in order of rarity (common to rare)
	for _, drop in pairs(relic['Drops']) do
		local itemName = drop['Item']
		local imageName
		local itemCount = drop['ItemCount'] and Math.formatnum(drop['ItemCount'])..' X ' or ''
		-- TODO: Should fetch these image names from a appropriate data store instead of hardcoding them here
		-- (e.g. M:Resources/data or M:Companions/data)
		if itemName == 'Kavasa Prime' then
			imageName = 'KavasaPrimeKubrowCollar.png'
		else
			imageName = WeaponData[itemName] and WeaponData[itemName]['Image'] or 
					WarframeData[itemName] and WarframeData[itemName]['Image'] or 
					ArchwingData[itemName] and ArchwingData[itemName]['Image'] or 
					ResourceData[itemName] and ResourceData[itemName]['Image'] or
					CompanionData[itemName] and CompanionData[itemName]['Image'] or
					ModData[itemName] and ModData[itemName]['Image'] or
					'UnidentifiedItem.png'
		end
		local itemImageAndLink = string.format('[[File:%s|%spx]] %s[[%s|%s %s]]', 
			imageName,
			ICON_SIZE,
			itemCount,
			itemName,
			itemName,
			Void._getPartName(drop['Part'])
		)
		
		table.insert(relicDrops['ImageLinks'], itemImageAndLink)
		table.insert(relicDrops['DucatValues'], PrimeData[drop['Item']]['Parts'][drop['Part']]['DucatValue'])
	end
	
	return relicDrops
end

--- Builds relic drop table as seen on [[Template:RelicTable]].
--	@function		p.buildRelicDropTable
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of wikitable
function p.buildRelicDropTable(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicDropTable(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicInfobox(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local relicDrops = getRelicDrops(relic)
	
	-- Note that if you want to add % signs in the below string, you have to add %%
	if	relicName == 'Requiem Eterna' then
		local resultTable = string.format([=[
		The '''%s''' [[Relic]] contains the following [[Requiem Mods]]:
		{| class="wikitable" id="%s" style="text-align: center;"
		|-
		! style="width:60%%;"| Component
		! style="width:20%%;"| Ducat Value
		! style="width:20%%;"| Rarity (Chance)
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="8" style="position:relative;"| [[File:IconCommon.png|class=icon]]Common  
(100%%)		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		|}
		]=], 
			relicName,
			RELIC_TABLE_ID,
			-- drops in order of rarity
			relicDrops['ImageLinks'][1],	-- first drop image and link
			relicDrops['DucatValues'][1],	-- first drop ducat value
			relicDrops['ImageLinks'][2],
			relicDrops['DucatValues'][2],
			relicDrops['ImageLinks'][3],
			relicDrops['DucatValues'][3],
			relicDrops['ImageLinks'][4],
			relicDrops['DucatValues'][4],
			relicDrops['ImageLinks'][5],
			relicDrops['DucatValues'][5],
			relicDrops['ImageLinks'][6],
			relicDrops['DucatValues'][6],
			relicDrops['ImageLinks'][7],	-- Additional Drops
			relicDrops['DucatValues'][7],
			relicDrops['ImageLinks'][8],
			relicDrops['DucatValues'][8]
		)
		return frame:preprocess(resultTable)
	else
		local resultTable = string.format([=[
		The '''%s''' [[Relic]] contains the following [[Prime]] components and blueprints:
		{| class="wikitable" id="%s" style="text-align: center;"
		|-
		! style="width:60%%;"| Component
		! style="width:20%%;"| Ducat Value
		! style="width:20%%;"| Rarity (Chance)
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="3" style="position:relative;"| [[File:IconCommon.png|class=icon]]Common  
(25.33%%)		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="2" style="position:relative;"| [[File:IconUncommon.png|class=icon]]Uncommon  
(11%%)		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| style="position:relative;"| [[File:IconRare.png|class=icon]]Rare (2%%)		|-
		| colspan=3 | Intact Exceptional Flawless Radiant
		|-
		|}
		]=], 
			relicName,
			RELIC_TABLE_ID,
			-- drops in order of 3 common, 2 uncommon, and 1 rare
			relicDrops['ImageLinks'][1],	-- first drop image and link
			relicDrops['DucatValues'][1],	-- first drop ducat value
			relicDrops['ImageLinks'][2],
			relicDrops['DucatValues'][2],
			relicDrops['ImageLinks'][3],
			relicDrops['DucatValues'][3],
			relicDrops['ImageLinks'][4],
			relicDrops['DucatValues'][4],
			relicDrops['ImageLinks'][5],
			relicDrops['DucatValues'][5],
			relicDrops['ImageLinks'][6],
			relicDrops['DucatValues'][6]
		)
		return frame:preprocess(resultTable)
		end
end

--- Returns the missions and sources where the relic itself can be dropped from.
--	@function		p.buildRelicDropLocations
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of mission wikitable and other text
function p.buildRelicDropLocations(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicDropLocations(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicDropLocations(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local missionData = 'None'
	local otherSources = ''
	
	-- If relic is not vaulted and is not a Baro-exclusive, add a mission table 
	-- on where players can get it below relic drop table
	if relic['IsBaro'] then
		otherSources = [=[
*May be available as a random [[Baro Ki'Teer]] offering during one of his biweekly visits to [[Relay]]s
]=]
	elseif isVarzia(relicName) then
		otherSources = "*Offered by [[Varzia]] at the cost of 1 [[Aya]]."
	elseif relic['Tier'] == 'Requiem' then
		if relicName == 'Requiem Eterna' then
			missionData = DropTable.getSingleRelicByLocation(frame)
			otherSources = "*[[Kuva Thrall]]s and [[Hound]]s have a 5% chance to drop a Requiem relic."
		else
			otherSources = "*Offered by [[Palladino]] up to 10 per week for a cost of 10 [[Riven Sliver]]."
		end
	elseif relic['Vaulted'] then
		otherSources = "*This relic is presently vaulted and does not drop in game\n"
	else
		missionData = DropTable.getSingleRelicByLocation(frame)
		otherSources = not EMPYREAN_VOID_RELIC_EXCEPTIONS[relicName] and [=[
*[[Relic Pack]]s
*Endless [[Void Fissure]] missions every fifth rotation reward
]=] or ""
	end
	
	return ([=[
==Mission Drop Locations==
%s
==Other Sources==
*[[Trading]] with other players
%s
]=]):format(missionData, otherSources)
end

--- Builds a relic page, adding an infobox, a message box (if needed), 
--	the relic's drop table, and update category.
--	@function		p.buildRelicPage
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of the entire relic page
function p.buildRelicPage(frame)
	return p.buildRelicInfobox(frame)..
			p.buildRelicDropTable(frame)..'__TOC__\n'..
			p.buildRelicDropLocations(frame)..
			-- Modifying the frame passed in so Void.relicsTable(frame) displays all unvaulted relics
			-- TODO: This is kinda hacky, may need to break up Void.relicsTable(frame) into two functions, one for #invoke
			-- and one for module use
			Void.relicsTable((function() frame.args[1] = nil; return frame end)())
end

return p
```

