---
title: "Module:Missions"
wiki_url: "https://wiki.warframe.com/w/Module/Missions"
wiki_timestamp: "2026-03-13T02:47:07Z"
---

**Missions** stores the [Star Chart](/w/Star_Chart "Star Chart")'s node data.

On this Wiki, Missions is used in:

* [Template:MissionTable](/w/Template:MissionTable "Template:MissionTable")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
  + [1.3 Module](#Module)
  + [1.4 Product Backlog](#Product_Backlog)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Missions|function|input1|input2|...}}`

### Template

In template: `{{#invoke:Missions|function|input1|input2|...}}`  
In articles: `{{template|function|input1|input2|...}}`

### Module

```lua
local Mission = require('Module:Missions')

local function func(frame)
    return Mission.getMissions(frame)
end
```

### Product Backlog

* Add documentation 19:28, 3 July 2021 (UTC)

## Documentation

### Package items

`missions.__listVars()` (function)
:   Debug function to list out variables/keys used in `/data`
:   **Returns**: String list of keys (string)

`missions.getMissionTable(frame)` (function)
:   Builds wikitable of missions based on their node names. `{{#invoke:Missions|getMissionTable|missionname1|missionname2|...}}`
:   **Parameter**: `frame` Frame object with names of mission nodes as arguments (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`missions.auto(frame)` (function)
:   Display certain types of missions in a wikitable format based on argument passed `{{#invoke:Missions|auto|Val}}` (e. g. `{{#invoke:Missions|auto|Venus}}` for list of Venus nodes or `{{#invoke:Missions|auto|Survival}}` for list of Survival nodes)
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`missions.Select(frame)` (function)
:   Returns a wikitable with mission nodes fitting multiple search criteria. `{{#invoke:Missions|Select|Var=Val|Var2=Val2|expanded=yes|partmatch=yes}}` (e.g. `{{#invoke:Missions|Select|Type=Survival|Planet=Venus}}` returns wikitable of Survival mission nodes on Venus)
:   **Parameter**: `frame` Frame object with named arguments representing key names of entries in `/data` (table)
:   **Returns**: Resultant wikitext of wikitable (string)

`missions.all_mastery(frame)` (function)
:   Returns a highlight table with mission nodes paired with their mastery points. Single Planet: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|planet=Mercury}}` All Missions: `{{#invoke:Missions|all_mastery|tableid=All Mission Completion Checklist}}` With Table Class: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|tableclass=mw-collapsible|planet=Mercury}}`
:   **Parameter**: `frame` Frame object with named arguments representing key names of entries in `/data` (table)
:   **Returns**: Resultant wikitext of wikitable (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Missions/data](/w/Module:Missions/data "Module:Missions/data")
* [Missions/data/dev](/w/Module:Missions/data/dev "Module:Missions/data/dev")
* [Missions/data/doc](/w/Module:Missions/data/doc "Module:Missions/data/doc")
* [Missions/dev](/w/Module:Missions/dev "Module:Missions/dev")
* [Missions/doc](/w/Module:Missions/doc "Module:Missions/doc")
* [Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox")
* [Missions/page](/w/Module:Missions/page "Module:Missions/page")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • M:Missions ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
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

---

```lua
---	'''Missions''' stores the [[Star Chart]]'s node data.  

--	
--	On this Wiki, Missions is used in:
--	* [[Template:MissionTable]]
--	
--	@module		missions
--	@alias		p
--	@author		[[User:Falterfire|Falterfire]] (original)
--	@author		[[User:Gigamicro|Gigamicro]] (rework/refactor)
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Croquemorttime|Croquemorttime]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Twilight053|Twilight053]]
--	@image		StarChartU29afterHeartOfDeimosWithPath.jpg
--	@require	[[Module:Missions/data]]
--	@require	[[Module:Table]]
--	@require	[[Module:Math]]
--	@release	stable
--	

--By [[User:Gigamicro|u:gigamicro]] ([[User talk:Giga Martin|talk]]) at 23:59, September 16, 2020 (UTC)

--Use:
-- {{#invoke:Missions|getMissions|missionname1|missionname2|...}} (e.g. {{#i:M|getMissions|Tessera|Oro}} )
-- {{#i:M|Var|Val}} (e.g. {{#i:M|Planet|Venus|expanded=yes}} )
-- {{#i:M||Val}} (e.g. {{#i:M||Venus|expanded=yes}} )
-- {{#i:M|Select|Var=Val|Var2=Val2|expanded=yes|partmatch=yes}} (e.g. {{#i:M|Select|Planet=Venus|Type=Capture|expanded=yes}} )

-- possible variables (case sensitive):
-- p.__listVars() or {{#invoke:Missions|listVars}} 

local p = {}

local MissionData = mw.loadData( [[Module:Missions/data]] )
local Table = require( [[Module:Table]] )
local Math = require( [[Module:Math]] )

local function linkType(missionType)
	assert(MissionData["MissionTypes"][missionType] ~= nil, 
			'linkType(missionType): missionType "'..missionType..'" is missing from [[Module:Missions/data]]')
	return '[['..MissionData["MissionTypes"][missionType].Link..']]'
end

local function getMissions(compareFunction)
	local data = {}
	for i, m in ipairs(MissionData["MissionDetails"]) do
		if(compareFunction(m)) then
			table.insert(data, m)
		end
	end
	return data
end

---	Debug function to list out variables/keys used in /data
--	@function		p.__listVars
--	@return			{string} String list of keys
function p.__listVars()
	local result = {}
	for i, v in ipairs(MissionData.vars) do table.insert(result, v) end
	return table.concat(result, '\n')
end

---	Display missions in a wikitable format.
--	@function		Missions
--	@param			{table} data Table from /data
--	@param			{table} Header Table with mixed table entries containing wikitable 
--							column name and a cell function that formats the contents of column cells
--	@param			{string} suffix Footnote to append below wikitable
--	@return			{string} Resultant wikitext of wikitable
local function Missions(data, Header, suffix)
	if not data then error ("bad argument #1 to 'Missions' (table expected, got "..type(data)..")", 2) end
	if not Header then error ("bad argument #2 to 'Missions' (table expected, got "..type(Header)..")", 2) end
	local tHeader = '{| border="0" cellpadding="0" cellspacing="0" style="'..(Header.tablestyle or '')..'" class="wikitable sortable '..(Header.tableclass or '')..'" '..(Header.tablemeta or '')..'\n|-'
	
	for i, v in ipairs(Header) do
		tHeader = tHeader..'\n!'..v[1]
	end
	
	local tBody = ''
	for i, mission in ipairs(data) do
		tBody = tBody..'\n|-'..(Header.rowmeta and Header:rowmeta(mission) or '')..'\n'
		for ii, obj in ipairs(Header) do
			tBody = tBody..'|'..obj:cell(mission)..(#Header > ii and '|' or '')
		end
	end
	
	return tHeader..tBody..(suffix or '').."\n|}"
end

---	Display few missions in a wikitable format.
--	@function		Missions
--	@param			{table} data Table from /data
--	@param			{table} Header Table with mixed table entries containing 
--							{string} wikitable column width as a percentage, {string} column name, 
--							and a {function} cell function that formats the contents of column cells
--	@param			{string, table} properties Contains the names of wikitable properties mapped to a value
--	@return			{string} Resultant wikitext of wikitable
local function FewMissions(data, Header, properties)
	if type(data) ~= 'table' then error ("bad argument #1 to 'FewMissions()' (table expected, got "..type(data)..")", 2) end
	if type(Header) ~= 'table' then error ("bad argument #2 to 'FewMissions()' (table expected, got "..type(Header)..")", 2) end
	if type(properties) ~= 'table' then properties = { properties } end
	-- Get the value of the wikitable property as passed in by properties argument
	-- or fallback to a default value when calling properties(prop, default)
	setmetatable(properties, { __call = function(self, prop, default) return properties[prop] or default end })
	
	local tHeader = {
		'{| class="wikitable sortable '..(Header.tableclass or '')..'" style="max-width: ',
		properties('max-width', '700px'),
		'; text-align: center;" cellpadding="',
		properties('cellpadding', '3'),
		'" cellspacing="',
		properties('cellspacing', '2'),
		'" '..(Header.tablemeta or '')..' |-'
	}
	
	for i, v in ipairs(Header) do
		table.insert(tHeader,'\n! style="width:'..v[1]..'%;" | '..v[2])
	end
	
	local tBody = ''
	
	for i, mission in ipairs(data) do
		tBody = tBody..'\n|-'..(Header.rowmeta and Header:rowmeta(mission) or '')
		for ii, h in ipairs(Header) do tBody = tBody..h:cell(mission) end
	end
	
	return table.concat(tHeader)..tBody..'\n|}'
end

---	Builds wikitable of missions based on their node names.
--	`{{#invoke:Missions|getMissionTable|missionname1|missionname2|...}}`
--	@function		p.getMissionTable
--	@param			{table} frame Frame object with names of mission nodes as arguments
--	@return			{string} Resultant wikitext of wikitable
function p.getMissionTable(frame)
	local data = {}
	frame = frame:getParent() or frame
	for i, missionName in ipairs(frame.args or frame) do
		if (missionName ~= '') then
			table.insert(data, MissionData.by.Name[missionName][1])
		end
	end
	return FewMissions(data, {
		{'15', 'Target', cell = function(this, mission)
			if(mission.FactionImage) then
				return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))..'|class=dark-invert|x64px]]'
			else
				return '\n|['..'[File:Panel.png|64px]]'
			end
		end},
		{'20', 'Planet', cell = function(this, mission)
			return '\n|['..'['..mission.Planet..']]'
		end},
		{'15', 'Name', cell = function(this, mission)
			return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
		end},
		{'15', 'Type', cell = function(this, mission)
			return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'15', 'Level', cell = function(this, mission)
			return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
		end},
		{'20', 'Tile Set', cell = function(this, mission)
			return '\n|['..'['..mission.Tileset..']]'
		end},
	}, { ['max-width'] = '400px', ['cellpadding'] = '1' })
end

---	Sorts out missions for general call.
--	@function		MissionsBy
--	@param			{string} B key name of table entries as seen in /data
--	@param			{any} M value of key name
--	@return 		{string} Resultant wikitext of wikitable
local function MissionsBy(B, M)
	M = M or (( { IsArchwing = true, IsDarkSector = true, IsCrossfire = true } )[B])--val
	-- TODO: Refactor so code is more human-readable
	return Missions(MissionData.by[B][M] or {}, ({
			--put custom tables here
			Type = {
				{'Planet', cell = function(this, mission)
					return '[['..mission.Planet..']]'
				end},
				{'Mission Name', cell = function(this, mission)
					return "[["..mission.Link.."|"..mission.Name.."]]"..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
				end},
				{'Faction', cell = function(this, mission)
					local enemyTemp = {}
					for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
						table.insert(enemyTemp, '[['..enemy..']]')
					end
					return table.concat(enemyTemp, '/')
				end},
				{'[[Credit Reward]]', cell = function(this, mission)
					return mission.CreditReward and Math.formatnum(mission.CreditReward) or 0
				end},
				{'Addtional Credit Reward', cell = function(this, mission)
					return mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0
				end},
				{'Wiki\'s [[Module:DropTables/data|DropTableAlias]]', cell = function(this, mission)
					return ''..(mission.DropTableAlias or '')..'' or mission.Type
				end},
				{'data-sort-type="number"|Level', cell = function(this, mission)
					return mission.MinLevel..' - '..mission.MaxLevel
				end},
				{'Tileset', cell = function(this, mission)
					return '[['..mission.Tileset..']]'
				end},
			},
			IsDarkSector = {
				{'Planet', cell = function(this, mission)
					return '[['..mission.Planet..']]'
				end},
				{'Mission Name', cell = function(this, mission)
					return "[["..mission.Link.."|"..mission.Name.."]]"
				end},
				{'Type', cell = function(this, mission)
					return linkType(mission.Type)
				end},
				{'data-sort-type="number"|[[Credit Reward]]', cell = function(this, mission)
					return Math.formatnum(mission.CreditReward)
				end},
				{'data-sort-type="number"|Additional Credit Reward', cell = function(this, mission)
					return Math.formatnum(mission.AdditionalCreditReward)
				end},
				{'data-sort-type="number"|Level', cell = function(this, mission)
					return mission.MinLevel..' - '..mission.MaxLevel
				end},
				{'data-sort-type="number"|Resource Drop Chance Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSResourceBonus)
				end},
				{'data-sort-type="number"|Affinity Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSXPBonus)
				end},
				{'data-sort-type="number"|Weapon Affinity Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSWeaponBonus)..' on '..mission.DSWeapon
				end},
			},
		})[B] or {
			{'Planet', cell = function(this, mission)
				return '[['..mission.Planet..']]'
			end},
			{'Mission Name', cell = function(this, mission)
				return "[["..mission.Link.."|"..mission.Name.."]]"
			end},
			{'Type', cell = function(this, mission)
				return linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'Faction', cell = function(this, mission)
				local enemyTemp = {}
				for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
					table.insert(enemyTemp, '[['..enemy..']]')
				end
				return table.concat(enemyTemp, '/')
				
			end},
			{' data-sort-type="number"|Level', cell = function(this, mission)
				return mission.MinLevel..' - '..mission.MaxLevel
			end},
			{' data-sort-type="number"|Mastery', cell = function(this, mission)
				return mission.MasteryExp
			end},
		}, "\n|+There are a total of "..Table.size(MissionData.by[B][M] or {})..(({
			--['Node'] = M.." Missions.",--name
			--['Boss'] = M.." Missions.",
			--['Pic'] = M.." Missions.",--single match
			['IsArchwing'] = " [[Archwing]] Missions.",
			['IsDarkSector'] = " [[Dark Sector]] Missions.",
			['IsCrossfire'] = " [[Crossfire]] Missions.",--assume true
			
			['FighterMaxLevel'] = (' max level %s Missions.'):format(tostring(M)),
			['MaxLevel'	] = (' max level %s Missions.'):format(tostring(M)),
			['FighterMinLevel'] = (' min level %s Missions.'):format(tostring(M)),
			['MinLevel'] = (' min level %s Missions.'):format(tostring(M)),--unlikely but whatever
			
			['Enemy'] = (' Missions against the %s'):format(tostring(M)),
			['Tier'] = (' %s-tier Missions'):format(tostring(M)),
			['Planet'] = (' Missions on %s'):format(tostring(M)),
			['Tileset'] = (' Missions on the %s Tile Set'):format(tostring(M)),
			['Type'] = (' %s Missions'):format(tostring(M)),
			['Drops'] = (' Missions that drop %s'):format(tostring(M)),
			['MasteryExp'] = (' Missions worth %s xp'):format(tostring(M))
			
			--['DSWeapon'] = M.." Missions.",
			--['DSResourceBonus'] = M.." Missions.",
			--['DSXPBonus'] = M.." Missions.",
			--['DSWeaponBonus'] = M.." Missions.",--unlikely to be used (numbers)
			
			--['Other'] = M.." Missions.",--name of map variants (letters, letter/letter/letter)
		})[B] or ' '..M..' '..B..' Missions')
	)
end

---	Sorts out missions for general call.
--	@function		MissionsBy
--	@param			{string} B key name of table entries as seen in /data
--	@param			{any} M value of key name
--	@return 		{string} Resultant wikitext of wikitable
local function FewMissionsBy(B, M)
	M = M or (( { IsArchwing = true, IsDarkSector = true, IsCrossfire = true } )[B])--val
	
	local Header = ({
		--column { width%, title, cell constructor }
		Planet = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy) == 'table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'20', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', '[[Tile Set]]', cell = function(this, mission)
				return '\n||['..'['..mission.Tileset..']]'
			end},
			{'5', 'Mastery Point', cell = function(this, mission)
				return '\n|data-store-value="'..mission.MasteryExp..'" data-store-currency="Mastery Point"'
				..' class="sell-col" data-sort-value="'..mission.MasteryExp..'"|'..mission.MasteryExp
			end},
			{'20', 'Internal Name', cell = function(this, mission)
				return '\n| '..mission.InternalName..''
			end},
			{'5', 'Hidden Node', cell = function(this, mission)
				return '\n| '..(mission.IsHidden and '✔️' or '❌')
			end},
			tablemeta = 'data-tableid="missions"',
			tableclass = 'lighttable store-table',
			rowmeta = function(this, mission)
				return 'data-rowid="'..mission.InternalName..'"'
			end,
		},
		Tileset = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Planet', cell = function(this, mission)
				return '\n| ['..'['..mission.Planet..']]'
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n| ['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'25', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n| '..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n| '..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
		},
		Type = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Planet', cell = function(this, mission)
				return '\n|['..'['..mission.Planet..']]'
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', 'Tile Set', cell = function(this, mission)
				return '\n|['..'['..mission.Tileset..']]'
			end},
		},
		})[B] or 
		{
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n| ['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n| ['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'15', 'Planet', cell = function(this, mission)
				return '\n| ['..'['..mission.Planet..']]'
			end},
			{'15', 'Name', cell = function(this, mission)
				return '\n| ['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'15', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'15', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', 'Tile Set', cell = function(this, mission)
				return '\n|['..'['..mission.Tileset..']]'
			end},
		}--default
	
	-- Adding additional columns for Empyrean missions
	local proximaTable = { ['Skirmish']=true,
		['Earth Proxima']=true, ['Venus Proxima']=true,
		['Saturn Proxima']=true, ['Neptune Proxima']=true,
		['Pluto Proxima']=true, ['Veil Proxima']=true,
	}
	if proximaTable[M] then
		local b = 0
		for i, v in ipairs(Header) do
			if v[2] == 'Level' then
				b = i
				break
			end
		end
		table.insert(Header, b, {
			'10', 'Fighter Level', cell = function(this, mission)
					return '\n|'..mission.FighterMinLevel..' - '..mission.FighterMaxLevel
			end})
		--edit other section widths?
		--Header[b-1][1]=Header[b-1][1]-0 ..''
		Header[b + 1][1] = '10'--Header[b+1][1]-10 ..''
		table.insert(Header, {
			'5', 'Max Fighters', cell = function(this, mission)
					return '\n|'..mission.MaxFighters
			end})
		table.insert(Header, {
			'5', 'Max Crewships', cell = function(this, mission)
					return '\n|'..mission.MaxCrewships
			end})
		table.insert(Header, {
			'5', 'Other Objective', cell = function(this, mission)
					return '\n|'..mission.Objectives..(mission.ObjectiveDetails and ' ('..mission.ObjectiveDetails..')' or '') 
			end})
	end--railjack
	if ({ ['Assassination']=true })[M] then
		local b = 0;
		for i, v in ipairs(Header) do
			if v[2] == 'Level' then
				b = i + 1
				break
			end
			b = i
		end
		table.insert(Header, b, {
			'15', 'Rewards', cell = function(this, mission)
				local numDrops = Table.size(mission.Drops)
				local r = ''
				for i, v in ipairs(mission.Drops)do
					r = r..(numDrops == i and numDrops > 1 and '& ' or '')..'['..'['..v..']'..']'..(numDrops ~= i and numDrops > 2 and ', ' or ' ')
				end
				return '\n|'..r
			end})
		--edit other section widths?
		Header[b - 1][1] = Header[b - 1][1] - 0 ..''
		Header[b + 1][1] = Header[b + 1][1] - 0 ..''
	end--rewards
	
	return FewMissions(MissionData.by[B][M], Header)
end

-- Each key in M:Missions/data will automatically have its own invokable function that calls
-- either FewMissionsBy(key, frame.args[1]) or MissionsBy(key, frame.args[1])
-- e.g. {{#invoke:Missions|Var|Val}}
for k in pairs(MissionData.by) do
	p[k] = function(frame) 
		return (((frame.args['expanded']) and FewMissionsBy or MissionsBy))(k, frame.args[1])
	end
end

---	Display certain types of missions in a wikitable format based on argument passed
--	`{{#invoke:Missions|auto|Val}}`
--	(e.g. `{{#invoke:Missions|auto|Venus}}` for list of Venus nodes or 
--	`{{#invoke:Missions|auto|Survival}}` for list of Survival nodes)
--	@function		p.auto
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of wikitable
function p.auto(frame)
	return p[MissionData.dictionary[frame.args[1]]](frame)
	--return (((frame.args['expanded']) and FewMissionsBy or MissionsBy))(MissionData.dictionary[frame.args[1]], frame.args[1])
end

---	Returns a wikitable with mission nodes fitting multiple search criteria.
-- `{{#invoke:Missions|Select|Var=Val|Var2=Val2|expanded=yes|partmatch=yes}}`
--	(e.g. `{{#invoke:Missions|Select|Type=Survival|Planet=Venus}}` returns wikitable of Survival mission nodes on Venus)
--	@function		p.Select
--	@param			{table} frame Frame object with named arguments representing key names of entries in /data
--	@return 		{string} Resultant wikitext of wikitable
function p.Select(frame)
	local args = frame.args or frame
	local expanded = args.expanded and args.expanded ~= '' or false
	local partMatch = args.partmatch and args.partmatch ~= '' --and 'true' or 'false'
	local merge = {}
	pcall(function() local tableNames = {} end)	-- TODO: Why is this wrapped around a pcall()?
	--local gargs = {}
	for k,v in pairs(args) do
		if Table.contains(MissionData.vars, k) then
			-- Handle boolean conversion for true/false strings
			if v == 'true' or v == 'false' then
				v = (v == 'true')
			else
				pcall(function() v = v + 0 end)
			end
			table.insert(merge, MissionData.by[k][v])
			pcall(function() table.insert(tableNames, k) end)
		end
	end
	
	-- TODO: Remove mw.log()s
	--max loops: largest by-table if partmatch; smallest otherwise
	--merge = {{mission,mission},{mission,mission}}
	-- [[
	local data = {}
	do 
		--merge down
		local i = #merge
		mw.log(i, 'tables')
		while i > 1 do
			pcall(function() tableNames[i - 1] = tableNames[i]..' & '..tableNames[i - 1]
			mw.log(tableNames[i - 1] or '')end)
			
			merge[i - 1] = (function(a, b)
				--merge a and b
				local ai, bi = 1, 1
				local r = {}
				while a[ai] and b[bi] do
					--same mission? add it, increment both
					if a[ai] == b[bi] then
						mw.log(ai, bi, 'match')--,a[ai].Id,b[bi].Id)
						table.insert(r, a[ai])
						ai, bi = ai + 1, bi + 1
					else
						--catch up earlier one
						if a[ai].Id > b[bi].Id then
							mw.log(ai, bi, 'b', a[ai].Id, b[bi].Id)
							if partMatch then table.insert(r, b[bi]) end
							bi=bi+1
						else
							mw.log(ai, bi, 'a', a[ai].Id, b[bi].Id)
							if partMatch then table.insert(r, a[ai]) end
							ai = ai + 1
						end
					end
				end
				if partMatch then 
				while a[ai] do
					mw.log(ai, bi, 'a')
					table.insert(r, a[ai])
					ai = ai + 1
				end
				while b[bi] do
					mw.log(ai, bi, 'b')
					table.insert(r, b[bi])
					bi = bi + 1
				end
				end
				return r
			end)(merge[i], merge[i - 1])
			merge[i] = nil
			i = i - 1
		end
		data = merge[1]
	end
	
	return (({ [false] = function(data) return Missions(data, {
		{'Planet', cell = function(this, mission)
			return '[['..mission.Planet..']]'
		end},
		{'Mission Name', cell = function(this, mission)
			return "[["..mission.Link.."|"..mission.Name.."]]"
		end},
		{'Type', cell = function(this, mission)
			return linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'Faction', cell = function(this, mission)
			local enemyTemp = {}
			for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
				table.insert(enemyTemp, '[['..enemy..']]')
			end
			return table.concat(enemyTemp, '/')
			
		end},
		{' data-sort-type="number"|Level', cell = function(this, mission)
			return mission.MinLevel..' - '..mission.MaxLevel
		end},
		{' data-sort-type="number"|Mastery', cell = function(this, mission)
			return mission.MasteryExp
		end},
	}) end, [true] = function(data) return FewMissions(data, {
		{'15', 'Target', cell = function(this, mission)
			if(mission.FactionImage) then
				return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))..'|class=dark-invert|x64px]]'
			else
				return '\n|['..'[File:Panel.png|64px]]'
			end
		end},
		{'20', 'Planet', cell = function(this, mission)
			return '\n|['..'['..mission.Planet..']]'
		end},
		{'15', 'Name', cell = function(this, mission)
			return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
		end},
		{'15', 'Type', cell = function(this, mission)
			return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'15', 'Level', cell = function(this, mission)
			return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
		end},
		{'20', 'Tile Set', cell = function(this, mission)
			return '\n|['..'['..mission.Tileset..']]'
		end},
	}) end })[expanded])(data)
end

---	Returns a highlight table with mission nodes paired with their mastery points.
--  Single Planet: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|planet=Mercury}}`
--  All Missions: `{{#invoke:Missions|all_mastery|tableid=All Mission Completion Checklist}}`
--  With Table Class: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|tableclass=mw-collapsible|planet=Mercury}}`
--	@function		p.all_mastery
--	@param			{table} frame Frame object with named arguments representing key names of entries in /data
--	@return 		{string} Resultant wikitext of wikitable
function p.all_mastery(frame)
	local missionDetails = MissionData.MissionDetails
	local filteredMissions = {}
	
	-- Filters out hub, relays, and conclave missions by default.
	for _, mission in ipairs(missionDetails) do
		if 
			mission.Type ~= "Hub" and 
			mission.Type ~= "Relay" and 
			mission.Type ~= "Conclave" 
		then
	        table.insert(filteredMissions, mission)
	    end
	end
	missionDetails = filteredMissions
	
	-- Filter by planet if applicable
	if frame.args.planet and frame.args.planet ~= "" then
		local filteredByPlanet = {}
		
		for _, mission in ipairs(missionDetails) do
			if 
				mission.Planet == frame.args.planet and 
				mission.Type ~= "Hub" and
				mission.Type ~= "Relay" and
				mission.Type ~= "Conclave"
			then
				table.insert(filteredByPlanet, mission)
			end
		end
		
		missionDetails = filteredByPlanet
	end
	
	-- Sort mission details by name
	table.sort(missionDetails, function(a, b)
	    return a.Name < b.Name
	end)
	
	-- If planet is provided, return different table.
	return Missions(missionDetails, {
		{'Mission Name', cell = function(this, mission)
			return "[["..mission.Link.."|"..mission.Name.."]]"
		end},
		{'data-sort-type="number"|Mastery', cell = function(this, mission)
				return 'data-store-value="'..mission.MasteryExp..'" data-store-currency="Mastery Point"'
				..' class="sell-col" data-sort-value="'..mission.MasteryExp..'"|'..mission.MasteryExp
		end},
		tableclass = 'lighttable store-table '..(frame.args.tableclass or ''),
		tablestyle = (frame.args.tablestyle or ''),
		tablemeta = 'data-tableid="'..(frame.args.tableid or 'missions')..'"',
		rowmeta = function(this, mission)
			return 'data-rowid="'..mission.InternalName..'"'
		end,
	})
end

return p
```

