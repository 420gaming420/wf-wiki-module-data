---
title: "Module:Cost"
wiki_url: "https://wiki.warframe.com/w/Module/Cost"
wiki_timestamp: "2026-07-22T00:53:17Z"
---

**Cost** is a module for constructing manufacturing requirements wikitables.

On this Wiki, Cost is used in:

* [Template:BuildAutomatic](/w/Template:BuildAutomatic "Template:BuildAutomatic")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Cost|function|input1|input2|...}}`

## Documentation

### Package items

`cost.buildWeaponCostBox(frame)` (function)
:   Builds weapon manufacturing requirements table.
:   **Parameter**: `frame` (table)
:   **Returns**: Resultant table in wikitext (string)

`cost.buildWarframeCostBox(frame)` (function)
:   Builds Warframe manufacturing requirements table.
:   **Parameter**: `frame` (table)
:   **Returns**: Resultant table in wikitext (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Cost/doc](/w/Module:Cost/doc "Module:Cost/doc")

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
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • M:Cost • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
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
---	'''Cost''' is a module for constructing manufacturing requirements wikitables.  

--	
--	On this Wiki, Cost is used in:
--	* [[Template:BuildAutomatic]]
--	
--	@module			cost
--	@alias			p
--	@author			[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@image			IconBuild.png
--	@require		[[Module:Tooltips]]
--	@require		[[Module:Icon]]
--	@require		[[Module:Table]]
--	@require		[[Module:String]]
--	@require		[[Module:Math]]
--	@require		[[Module:Research/data]]
--	@require		[[Module:Blueprints/data]]
--	@release		stable
--	

local p = {}

local Tooltip = require('Module:Tooltips')
local Icon = require('Module:Icon')
local Table = require('Module:Table')
local String = require('Module:String')
local Math = require('Module:Math')
local ResearchData = mw.loadData('Module:Research/data')
local BlueprintData = mw.loadData('Module:Blueprints/data')

-- TODO: I18n this module

---	Finding the smallest denomination of time that can express a duration value (in seconds)
--	as a whole number.
--	@function		formatSeconds
--	@param			{number} seconds Number of seconds for build time
--	@return			{number} Duration value for a particular unit
--	@return			{string} Unit name
--	@local
local function formatSeconds(seconds)
	local unitOrder = { 'Day', 'Hour', 'Minute', 'Second' }
	local unitSecondsMap = {
		Day = 86400,
		Hour = 3600,
		Minute = 60,
		Second = 1,
	}
	for _, unit in ipairs(unitOrder) do
		local t = unitSecondsMap[unit]
		if (seconds % t == 0) then
			return seconds / t, unit..'(s)'
		end
	end
	error('formatSeconds(seconds): Unknown time denomination')
end

local function getLabLink(factionName)
	if (ResearchData["Labs"][factionName] == nil) then
		return "[[Research]]"
	else
		local labName = ResearchData["Labs"][factionName].Name
		return "[[Research#"..labName.."|"..labName.." Research]]"
	end
end

local function getResearch(itemName)
	return ResearchData["Research"][itemName]
end

local function buildItemText(Item)
	if (Item == nil) then
		return " "
	end

	local itemText, name, link
	local count = Math.formatnum(Item.Count)

	if (Item.Type == "WarframePart") then
		local split = String.split(Item.Name)
		link = split[1]
		name = split[2]
	else
		name = Item.Name
	end

	if (Item.Type == "Resource" or Item.Type == nil) then
		itemText = Tooltip.full(name, 'Resources').."  
"
	elseif (Item.Type == "Item") then
		itemText = Icon._Item(name, nil, 'x32').."  
"
	elseif (Item.Type == "PrimePart") then
		itemText = Icon._Item("Prime "..name, nil, 'x32').."  
"
	elseif (Item.Type == "WarframePart") then
		itemText = Icon._Item(name, nil, 'x32').."  
"
	elseif (Item.Type == "Weapon") then
		itemText = Tooltip.full(name, 'Weapons')..'  
'
	end

	if (Item.Type == "WarframePart") then
		itemText = itemText..'[['..link..'|'..Item.Name..']]'
	else
		itemText = itemText..count
	end

	return itemText
end

---	Builds weapon manufacturing requirements table.
--	@function		p.buildWeaponCostBox
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildWeaponCostBox(frame)
	local WeaponName = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	local WeaponBlueprint = BlueprintData["Blueprints"][WeaponName]

	assert(WeaponBlueprint ~= nil, "p.buildWeaponCostBox(frame): "..WeaponName.." not found in [[Module:Blueprints/data]] or does not have resource build requirements")

	local rowStart = '\n| rowspan="2" style="height:50px; width:50px;" |'
	local smallPart = '\n| style="text-align:left; padding:0em 0.25em;" |'
	local lowRow = '\n| colspan="3" |'

	if (WeaponBlueprint.Parts ~= nil) then
		local tHead = [=[{| class="foundrytable" style="float:left;margin:auto"
! colspan=6 | [[Foundry|Manufacturing]] Requirements  
[[Module:Blueprints/data|📝 Edit blueprint requirements]]
|-]=]

		local result = {}
		table.insert(result, tHead)
		table.insert(result, rowStart)

		--Adding Credit costs
		if (WeaponBlueprint.Credits ~= nil) then
			table.insert(result, Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(WeaponBlueprint.Credits))
		else
			table.insert(result, 'N/A')
		end

		--Adding part costs
		for i = 1, 4 do
			local part = WeaponBlueprint.Parts[i] 
			if part then
				part = { Count = part.Count, Name = part.Name, Type = part.Type }
				if part.Name == "Chassis" then
					part.Name = "Gun Chassis"
				end
			end
			table.insert(result, rowStart..buildItemText(part))
		end

		--Adding the time, market, and rush cost
		table.insert(result, smallPart)
		if (WeaponBlueprint.Time ~= nil) then
			local t, unit = formatSeconds(WeaponBlueprint.Time)
			table.insert(result, "Time: "..t..' '..unit)
		else
			table.insert(result, 'N/A')
		end
		table.insert(result, '\n|-'..smallPart)
		if (WeaponBlueprint.Rush ~= nil) then
			table.insert(result, 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..WeaponBlueprint.Rush)
		else
			table.insert(result, 'N/A')
		end
		table.insert(result, '\n|-'..lowRow..Icon._Item("Market", "text", 22)..' Price: '..Tooltip.icon("Platinum", "Resources")..' ')
		if (WeaponBlueprint.MarketCost ~= nil) then
			table.insert(result, WeaponBlueprint.MarketCost)
		else
			table.insert(result, "N/A")
		end
		table.insert(result, ''..lowRow..Icon._Item("Blueprint", "text", 22)..' Price:')
		--For Ghoulsaw
		if (WeaponBlueprint.BPCost ~= nil and WeaponBlueprint.BPStanding ~= nil) then
			table.insert(result, Tooltip.icon("Standing", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPStanding)..' + ')
			table.insert(result, Tooltip.icon("Credits", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPCost))
		elseif (WeaponBlueprint.BPCost ~= nil) then
			table.insert(result, Tooltip.icon("Credits", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPCost))
		--This is for Heliocor and Simulor
		elseif (WeaponBlueprint.BPStanding ~= nil) then
			table.insert(result, Tooltip.icon("Standing", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPStanding))
		else
			table.insert(result, "N/A")
		end
		table.insert(result, '')

		-- Add weapon part component costs if needed
		for _, part in pairs(WeaponBlueprint.Parts) do
			if (part.Cost ~= nil) then
				table.insert(result, '\n|-')
				table.insert(result, '\n|colspan=6|'..part.Name)
				--Adding part acquisition cost
				--For Ghoulsaw
				if(part.Cost.BPCost ~= nil and part.Cost.BPStanding ~= nil) then
					table.insert(result, ' • '..Tooltip.icon("Standing", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPStanding)..' + ')
					table.insert(result, Tooltip.icon("Credits", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPCost))
				elseif(part.Cost.BPStanding ~= nil) then
					table.insert(result, ' • '..Tooltip.icon("Standing", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPStanding))
				end

				table.insert(result, '\n|-'..rowStart)

				--Adding Credit costs
				if (part.Cost.Credits ~= nil) then
					table.insert(result, Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(part.Cost.Credits))
				else
					table.insert(result, 'N/A')
				end

				--Adding part costs
				for i = 1, 4 do
					table.insert(result, rowStart..buildItemText(part.Cost.Parts[i]))
				end

				--Adding the time, market, and rush cost
				table.insert(result, smallPart)
				if (part.Cost.Time ~= nil) then
					local t, unit = formatSeconds(part.Cost.Time)
					table.insert(result, "Time: "..t..' '..unit)
				else
					table.insert(result, 'N/A')
				end
				table.insert(result, '\n|-'..smallPart)
				if (part.Cost.Rush ~= nil) then
					table.insert(result, 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..part.Cost.Rush)
				else
					table.insert(result, 'N/A')
				end

				--table.insert(result, '')
			end
		end

		--Adding Research costs if needed
		local weapRes = getResearch(WeaponName)
		if (weapRes) then
			table.insert(result, '\n|-\n! colspan=6| [[Category:Research]] '..getLabLink(weapRes.Lab))
			if(weapRes.Affinity ~= nil) then
				table.insert(result, '[[File:ClanAffinity64.png|class=icon]]'..Math.formatnum(weapRes.Affinity))
			end

			table.insert(result, '\n|-'..rowStart)
			--Adding Credit costs
			if (weapRes.Credits ~= nil) then
				table.insert(result, Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(weapRes.Credits))
			else
				table.insert(result, 'N/A')
			end

			--Adding part costs
			for i = 1, 4 do
				table.insert(result, rowStart..buildItemText(weapRes.Resources[i]))
			end

			--Adding the time, market, and rush cost
			table.insert(result, smallPart)
			if (weapRes.Time ~= nil) then
				local t, unit = formatSeconds(weapRes.Time)
				table.insert(result, "Time: "..t..' '..unit)
			else
				table.insert(result, 'N/A')
			end
			table.insert(result, '\n|-'..smallPart)
			if (weapRes.Prereq ~= nil) then
				table.insert(result, 'Prereq: [['..weapRes.Prereq..']]')
			else
				table.insert(result, 'Prereq: N/A')
			end

			--Adding notes about clan sizes
			local clans = '\n|-\n| colspan = 6 |Clan Research Resource Multipliers: '..
				Icon._Clan('Ghost')..' [[Clan#Clan Tier Multiplier|x1]]   '..
				Icon._Clan('Shadow')..' [[Clan#Clan Tier Multiplier|x3]]   '..
				Icon._Clan('Storm')..' [[Clan#Clan Tier Multiplier|x10]]   '..
				Icon._Clan('Mountain')..' [[Clan#Clan Tier Multiplier|x30]]   '..
				Icon._Clan('Moon')..' [[Clan#Clan Tier Multiplier|x100]]'
			table.insert(result, clans)
		end

		table.insert(result, '\n|}[[Category:Automatic Cost Table]]')

		return table.concat(result)
	end
end

-- TODO: Generalize p.buildWarframeCostBox to support non-conventional builds like multiple Neuroptics/Chassis/Systems
-- with Equinox and no Neuroptics/Chassis/Systems with Excalibur Umbra
---	Builds Warframe manufacturing requirements table.
--	@function		p.buildWarframeCostBox
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildWarframeCostBox(frame)
	local name = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	local MainBp = BlueprintData['Suits'][name] or 
			error('p.buildWarframeCostBox(frame): Main blueprint not found in [[Module:Blueprints/data]]')
	local NeuroBp = BlueprintData['Suits'][name..' Neuroptics'] or 
			error('p.buildWarframeCostBox(frame): Neuroptics blueprint not found in [[Module:Blueprints/data]]')
	local ChassisBp = BlueprintData['Suits'][name..' Chassis'] or 
			error('p.buildWarframeCostBox(frame): Chassis blueprint not found in [[Module:Blueprints/data]]')
	local SystemsBp = BlueprintData['Suits'][name..' Systems'] or 
			error('p.buildWarframeCostBox(frame): Systems blueprint not found in [[Module:Blueprints/data]]')

	-- Format strings for wikitable rows
	local rowStart = '| rowspan="2" style="height:50px; width:50px;" | %s'
	local smallPart = '| style="text-align:left; padding: 0em 0.25em;" | %s'
	local lowRow = '| colspan="3" |%s'
	
	local foundryTable = { '{| class="foundrytable" style="float:left; margin:auto;"' }
	table.insert(foundryTable, '! colspan=6 | [[Foundry|Manufacturing]] Requirements  
📝 [[Module:Blueprints/data|Edit blueprint requirements]]')
	table.insert(foundryTable, '|-')
	
	local rowContent = 'N/A'
	--Adding Credit costs
	if (MainBp.Credits ~= nil) then
		rowContent = Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(MainBp.Credits)
	end
	table.insert(foundryTable, rowStart:format(rowContent))
	
	--Adding part costs
	for i = 1, 4 do
		table.insert(foundryTable, rowStart:format(buildItemText(MainBp.Parts[i])))
	end

	-- Adding the time, market, and rush cost
	local buildTimeContent = 'N/A'
	if (MainBp.Time ~= nil) then
		local t, unit = formatSeconds(MainBp.Time)
		buildTimeContent = 'Time: '..t..' '..unit
	end
	table.insert(foundryTable, smallPart:format(buildTimeContent))
	table.insert(foundryTable, '|-')
	
	local rushCostContent = 'N/A'
	if (MainBp.Rush ~= nil) then
		rushCostContent = 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..MainBp.Rush
	end
	table.insert(foundryTable, smallPart:format(rushCostContent))
	table.insert(foundryTable, '|-')
	
	local marketCostContent = 'N/A'
	if (MainBp.MarketCost ~= nil) then
		marketCostContent = MainBp.MarketCost
	end
	table.insert(foundryTable, lowRow:format(Icon._Item("Market", "text", 22)..' Price: '..Tooltip.icon("Platinum", "Resources")..' '..marketCostContent))
	
	local blueprintCostContent = 'N/A'
	if (MainBp.BPCost ~= nil) then
		blueprintCostContent = Tooltip.icon("Credits", "Resources")
		blueprintCostContent = blueprintCostContent..Math.formatnum(MainBp.BPCost)
	--This is for Baruuk
	elseif (MainBp.BPStanding ~= nil) then
		blueprintCostContent = Tooltip.icon("Standing", "Resources")
		blueprintCostContent = blueprintCostContent..Math.formatnum(MainBp.BPStanding)
	end
	table.insert(foundryTable, lowRow:format(Icon._Item("Blueprint", "text", 22)..' Price: '..blueprintCostContent))
	
	-- Add Warframe part component costs
	for _, partBp in ipairs({ NeuroBp, ChassisBp, SystemsBp }) do
		table.insert(foundryTable, '|-')
		table.insert(foundryTable, '| colspan=6 | '..partBp.Name)
		table.insert(foundryTable, '|-')
		
		--Adding Credit costs
		local creditCostContent = 'N/A'
		if (partBp.Credits ~= nil) then
			creditCostContent = Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(partBp.Credits)
		end
		table.insert(foundryTable, rowStart:format(creditCostContent))
		
		--Adding part costs
		for i = 1, 4 do
			table.insert(foundryTable, rowStart:format(buildItemText(partBp.Parts[i])))
		end

		--Adding the time, market, and rush cost
		local componentBuildTimeContent = 'N/A'
		if (partBp.Time ~= nil) then
			local t, unit = formatSeconds(partBp.Time)
			componentBuildTimeContent = 'Time: '..t..' '..unit
		end
		table.insert(foundryTable, smallPart:format(componentBuildTimeContent))
		table.insert(foundryTable, '|-')
		
		local componentRushCostContent = 'N/A'
		if (partBp.Rush ~= nil) then
			componentRushCostContent = 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..partBp.Rush
		end
		table.insert(foundryTable, smallPart:format(componentRushCostContent))
	end

	--Adding Research costs if needed
	local wfResearch = getResearch(name)
	if (wfResearch) then
		local researchParts = {
			[1] = "Blueprint",
			[2] = "Neuroptics",
			[3] = "Chassis",
			[4] = "Systems"
		}

		table.insert(foundryTable, '|-')
		table.insert(foundryTable, '| colspan=6|

'..getLabLink(wfResearch.Lab)..'

')
		table.insert(foundryTable, '{| class="foundrytable" style="max-width:100%;')

		for _, partName in ipairs(researchParts) do
			local research
			if (partName ~= "Blueprint") then
				research = getResearch(name..' '..partName)
			else
				research = wfResearch
			end
			
			if (research.Resources ~= nil) then
				local clanResearchContent = '| colspan=6 | %s • [[File:ClanAffinity64.png|class=icon]]%s'
				local clanAffinityContent = ''
				if (research.Affinity ~= nil) then
					clanAffinityContent = Math.formatnum(research.Affinity)
				end
				table.insert(foundryTable, clanResearchContent:format(partName, clanAffinityContent))
				table.insert(foundryTable, '|-')
				
				--Adding Credit costs
				local researchCostContent = 'N/A'
				if (research.Credits ~= nil) then
					researchCostContent = Tooltip.icon("Credits", "Resources").."  
"..Math.formatnum(research.Credits)
				end
				table.insert(foundryTable, rowStart:format(researchCostContent))
				
				--Adding part costs
				for i = 1, 4 do
					table.insert(foundryTable, rowStart:format(buildItemText(research.Resources[i])))
				end
				
				--Adding the research time and prerequisite research requirements
				local researchTimeContent = 'N/A'
				if (research.Time ~= nil) then
					local t, unit = formatSeconds(research.Time)
					researchTimeContent = 'Time: '..t..' '..unit
				end
				table.insert(foundryTable, smallPart:format(researchTimeContent))
				table.insert(foundryTable, '|-')
				
				local researchPrereqContent = 'Prereq: N/A'
				if (research.Prereq ~= nil) then
					researchPrereqContent = 'Prereq: [['..research.Prereq..']]'
				end
				table.insert(foundryTable, smallPart:format(researchPrereqContent))
				table.insert(foundryTable, '|-')
			end
		end

		--Adding notes about clan sizes
		local clanSizeMultipliers = '| colspan=6 |Clan Research Resource Multipliers: %s %s %s %s %s'
		table.insert(foundryTable, clanSizeMultipliers:format(
				Icon._Clan('Ghost')..' [[Clan#Clan Tier Multiplier|x1]]',
				Icon._Clan('Shadow')..' [[Clan#Clan Tier Multiplier|x3]]',
				Icon._Clan('Storm')..' [[Clan#Clan Tier Multiplier|x10]]',
				Icon._Clan('Mountain')..' [[Clan#Clan Tier Multiplier|x30]]',
				Icon._Clan('Moon')..' [[Clan#Clan Tier Multiplier|x100]]'
		))
		table.insert(foundryTable, '|}

')
	end
	
	table.insert(foundryTable, '|}[[Category:Automatic Cost Table]]')
	return table.concat(foundryTable, '\n')
end

return p
```

