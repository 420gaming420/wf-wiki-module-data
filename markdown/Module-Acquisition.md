---
title: "Module:Acquisition"
wiki_url: "https://wiki.warframe.com/w/Module/Acquisition"
wiki_timestamp: "2026-05-21T21:22:53Z"
---

**Acquisition** builds the acquisition table for Warframes, Weapons, and Arcanes. Acquisition can be invoked directly (`{{#invoke:Acquisition|buildTable|...}}`) or invoked from a template (`{{Acquisition|...}}`)

On this Wiki, Acquisition is used in:

* [Template:Acquisition](/w/Template:Acquisition "Template:Acquisition")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Acquisition|function|input1|input2|...}}`

### Template

In template: `{{#invoke:Acquisition|__main}}`  
In articles: `{{template|function|input1|input2|...}}`

## Documentation

### Package items

`acquisition.buildTable(frame)` (function)
:   Builds item acquisition wikitable with five columns: item name, drop table source, drop chance, expected number of runs, almost guaranteed number of runs
:   **Parameter**: `frame` Frame object with first argument being the item name and second argument being the description to add before wikitable (table)
:   **Returns**: Resultant wikitext of wikitable (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Acquisition/data](/w/Module:Acquisition/data "Module:Acquisition/data")
* [Acquisition/dev](/w/Module:Acquisition/dev "Module:Acquisition/dev")
* [Acquisition/doc](/w/Module:Acquisition/doc "Module:Acquisition/doc")
* [Acquisition/testcases](/w/Module:Acquisition/testcases "Module:Acquisition/testcases")
* [Acquisition/testcases/doc](/w/Module:Acquisition/testcases/doc "Module:Acquisition/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | M:Acquisition ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
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
---	'''Acquisition''' builds the acquisition table for Warframes, Weapons, and Arcanes.
--	
--	Acquisition can be invoked directly (`{{#invoke:Acquisition|buildTable|...}}`) 
--	or invoked from a template (`{{Acquisition|...}}`)
--	
--	On this Wiki, Acquisition is used in:
--	* [[Template:Acquisition]]
--	
--	@module			acquisition
--	@alias			t
--	@author			[[User:gigamicro|gigamicro]] (rewrite)
--	@attribution	[[User:FINNER|FINNER]] (original)
--	@attribution	[[User:Trajos|Trajos]]
--	@image			AcquisitionPic.png
--	@require		[[Module:DropTables/data]]
--	@require		[[Module:Blueprints/data]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

-- TODO: Add support for I18n and I10n
local DropData = mw.loadData [[Module:DropTables/data]]
local BlueprintData = mw.loadData [[Module:Blueprints/data]]
local Tooltips = require [[Module:Tooltips]]

local function join(a, sep, b)
	if a == '' then a = nil end
	if b == '' then b = nil end
	if a and b then return a..sep..b end
	return a or b or ''
end
table.unpack = table.unpack or unpack	-- for Lua 5.2. and Lua 5.3 compatibility

return (function(t)
	t.buildTable = t['']
	t.__main = t['']
	return t
end) {
---	Builds item acquisition wikitable with five columns:
--	item name, drop table source, drop chance, expected number of runs, almost guaranteed number of runs
--	@function		t.buildTable
--	@param			{table} frame Frame object with first argument being the item name
--							and second argument being the description to add before wikitable
--	@return			{string} Resultant wikitext of wikitable
[''] = function(frame, ...)
	if type(frame) ~= 'table' then
		frame = { args = {frame, ...} }
	end
	local name, desc = mw.text.decode(frame.args[1]), frame.args[2]

	-- Blueprint components
	local bpReqs
	local isWeapon = false
	if (frame.args.blueprint or '') ~= '' then
		bpReqs = { _custom = true }
		for s in frame.args.blueprint:gmatch('%a%P+%a') do--equinox :Þ
			table.insert(bpReqs, { Count=1, Name = s:gsub('^.', string.upper), Type="Item" })
		end
	elseif BlueprintData.Blueprints[name] then
		bpReqs = BlueprintData.Blueprints[name].Parts
		isWeapon = true
	else
		bpReqs = (BlueprintData.Suits[name] or {}).Parts or
			-- Default blueprint requirements (for Warframes)
			{
				{ Count = 1, Name = "Systems", Type = "Item" },
				{ Count = 1, Name = "Chassis", Type = "Item" },
				{ Count = 1, Name = "Neuroptics", Type = "Item" },
				_default = true,
			}
	end
	
	-- table.insert(bpReqs,1,{Count=1, Name="", Type="Item"})
	bpReqs = {
		{ Count = 1, Name = "", Type = "Item" },
		bpReqs[1], bpReqs[2], bpReqs[3], bpReqs[4],
		bpReqs[5], bpReqs[6], bpReqs[7], bpReqs[8],	-- Additional 4 bp requirements for base Equinox
		_default = bpReqs._default,
		_custom = bpReqs._custom,
	}
	
	-- Drop locations per component
	local source	-- module where the base item can be found
	local dropLocations = {}
	for i, item in ipairs(bpReqs) do
		-- TODO: Some of these conditions may not work with non-English localized item names, may need updating to target internal names
		if item.Count <= 2 and item.Type == 'Item' and item.Name ~= 'Forma' and item.Name ~= 'Omni Forma' then
			local itemName = join(name, ' ', item.Name)	-- For combining item name with item part name (e.g. "Ember" + "Neuroptics" = "Ember Neuroptics")
			local partName = item.Name == '' and name or item.Name
			if isWeapon and partName == "Chassis" then
				partName = "Gun Chassis"
			end
			local index = nil

			if name == 'Equinox' then
				if partName:sub(-6) == 'Aspect' then
					-- For Equinox Day/Night Aspect
					index = Tooltips._getIndex(itemName, 'Resources')
				else
					-- For Equinox Day/Night Chassis/Neuroptics/Systems
					index = Tooltips._getIndex(partName:gsub('[DN][ai][yg]h?t? ', ''), 'Resources')
				end
			else
				index =	Tooltips._getIndex(partName, 'Resources') or 
					Tooltips._getIndex(partName, 'Warframes') or 
					Tooltips._getIndex(partName, 'Arcane') or 
					Tooltips._getIndex(partName, 'Companions') or 
					Tooltips._getIndex(partName, 'Weapons') or 
					nil
			end
			
			local icon = Tooltips.icon(partName, nil, index)
			source = source or item.Name == '' and index and index[1]
			-- TODO: Unclear why we need to make an exception for Arcanes and not also include the Arcane's
			-- name. Is it b/c the arcane articles already have the name of the arcane as the page name so it is redundant?
			if source == 'Arcane' then
				dropLocations = { [itemName] = { name = '', icon = icon } }
				bpReqs._default = nil
				break
			end
			if name == 'Broken War' and item.Name ~= '' then
				itemName = 'War '..item.Name
			end
			-- TODO: Find a better solution of handling weapon components. As of 2023-02-24 we don't explicitly
			-- store individual weapon components in M:Resources/data. We have them stored as generic weapon components instead.
			
			-- Corufell has a Barrel component that uses a GenericWeaponBlade.png image so
			-- it has its own unique entry in M:Resources/data.
			-- Hacky solution right now is to use full part names for Corufell blueprint requirements
			-- in [[Module:Blueprints/data]], but you will get:
			-- itemName == "Corufell Corufell Barrel"
			-- partName == "Corufell Barrel"
			if name == 'Corufell' then
				itemName = partName
			end
			
			dropLocations[itemName] = { name = item.Name, icon = icon }--,quantity=item.Count>1 and item.Count}
			dropLocations[join(itemName, ' ', 'Blueprint')] = { name = item.Name, icon = icon, isBP = true }
		end
	end
	for itemName, dropLocation in pairs(dropLocations) do
		for _, loc in ipairs(DropData.Rewards[itemName] or {}) do
			table.insert(dropLocation, loc)
		end
	end

	-- Wikitable assembly
	local result = { desc or '', '\n

\n', [=[
{| style="width:100%; text-align:center; margin:0;" class="article-table sortable acquisition-table" cellspacing="1" cellpadding="1" border="0"
|-
! style="text-align:left  " | Item
! style="text-align:center" | Source
! style="text-align:center" | Chance
! style="text-align:center" class="unsortable" | Expected
! style="text-align:center" class="unsortable" | Nearly Guaranteed
|-
]=], [0] = [=[
|}

All drop rates data is obtained from [https://warframe.com/droptables DE's official drop tables] stored on [[Module:DropTables/data]].
See [[Mission Rewards#Standard Missions]] for definitions on reward table rotations.  

For more detailed definitions and information,
visit [[User blog:FINNER/Warframe Expected & Nearly Guaranteed Numbers - An Explanation|here]].]=]
		..(bpReqs._default and "[[Category:DefaultBlueprintData]]" or '')
		..(bpReqs._custom and "[[Category:CustomBlueprintData]]" or '')
	}
	
	for item, dropLocation in pairs(dropLocations) do
		for _, loc in ipairs(dropLocation) do
			-- Note loc[1] is category; loc[2] is sources key; loc[3] is rotation name ("A", "B", "C")
			local source = DropData[loc[1]][loc[2]]

			local link = source.Link and ('[['..source.Link..(source.Link:find('#') and '' or '#Locations')..'|'..source.Name..']]')
			or loc[1] == 'Enemies' and ('[['..(source.Name or loc[2])..']]')
			
			-- Determine localization for Expected and Nearly Guaranteed counts
			-- e.g. "Kills" when the context is enemy drops ("~200 Kills")
			-- Note: first nil is just used for code formatting so the values line up
			local event = nil
				or source.Type == 'Assassinate' and 'Kills' 	-- # of boss kills
				or loc[1] == 'Missions' and source.Type:sub(-6) == 'Bounty' and 'Stages'	-- # of bounty stages
				or type(loc[3]) == 'string' and loc[3]:sub(2)=='' and loc[3]..
					(loc[2]:sub(-6) == 'Caches' and ' Caches' or ' Rotations')	-- # of resource caches or rotations if loc[3] is a single rotation letter like "A", "B" or "C"
				or loc[1] == 'Enemies' and 'Kills'	-- # of enemy kills
				or loc[1] == 'Containers' and 'Opens'	-- # of containers opened
				or 'Runs'

			local prob = loc.Probability
			local pow = -1 / math.log10(1 - prob) -- # of runs for 10% failure or 90% probability of receiving item at least once

			table.insert(result,
				('| style="text-align:left" | %s || %s || class="AcqProb" | %.2f%% || ~ %d %s || %d ± %d %s\n|-\n'):format(
					join(dropLocation.icon, ' ', join(dropLocation.name, ' ', dropLocation.isBP and 'Blueprint')),	-- Item name
					-- Drop source; if there exists a rotation B table, then it must have two or three rotation drop tables (A and B OR A, B, C)
					join(link or source.Name, ' / ', loc[3]:sub(2) == '' and source.Rewards.B and source.Rewards.B[1] and loc[3]),
					100 * prob,	-- Base chance of dropping as %
					1 / prob,	-- Expected number of rolls before getting at least one item
					event,
					3 * pow,	-- Number of rolls a player would need to get a 99.9% probability of receiving item at least once
					-- See https://wiki.warframe.com/w/WARFRAME_Wiki:Warframe_Expected_%26_Nearly_Guaranteed_Numbers_-_An_Explanation
					pow,
					event
				)
			)
		end
	end

	if not result[6] then
		for k,t in pairs(dropLocations) do
			if not pcall(function()t.icon=nil end) then
				dropLocations[k] = {}
				for kk, v in pairs(t) do
					if kk ~= 'icon' then
						dropLocations[k][kk] = v
					end
				end
			end
		end
		mw.log(mw.dumpObject(dropLocations))
		error('t.buildTable(frame, ...): no wikitable rows made for "'..name..'". This item may be nonexistent (in [[Module:DropTables/data]] or [[Module:Blueprints/data]]) and/or upcoming.')
	end

	table.insert(result, result[0])
	return (table.concat(result):gsub('%.00%%', '%%'))
end
}
```

