---
title: "Module:Conservation/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Conservation/infobox"
wiki_timestamp: "2025-09-14T20:46:37Z"
---

Builds an infobox for a conservation animal page.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package function](#Package_function)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package function

`p.buildInfobox(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds an infobox for a conservation animal page.
:   **Parameter**: `frame` Frame object or animal name if calling within other modules ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of infobox element ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Conservation/infobox/doc](/w/Module:Conservation/infobox/doc "Module:Conservation/infobox/doc")

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
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • M:Conservation/infobox • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
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
local ConservationData = require('Module:Conservation/data')

local Infobox = require('Module:InfoboxBuilder')
local Version = require('Module:Version')
local Tooltip = require('Module:Tooltips')
local Math = require('Module:Math')
local DropData = mw.loadData([[Module:DropTables/data]])

return {
---	Builds an infobox for a conservation animal page.
--	@function		p.buildInfobox
--	@param			{table} frame Frame object or animal name if calling within other modules
--	@returns		{string} Resultant wikitext of infobox element
buildInfobox = function(frame)
	local animalName = frame.args and frame.args[1] or frame
	assert(animalName, 'p.buildInfoBox(frame): empty frame arguments')
	local animal = ConservationData['Animals'][animalName] or
			error('p.buildInfoBox(frame): "'..animalName..'" does not exist in [[Module:Conservation/data]]')
	
	local image = ''
	do
		local images = { animal.FullImg, animal.CodexImg, animal.InGameImg, animal.OtherImg }
		local imagesize = 0
		for i, v in pairs(images) do
			imagesize = imagesize + 1
		end
		if imagesize > 1 then
			local map = { 'Full', 'Codex', 'In-game', 'Other' }
			image = { '' }
			for i, v in pairs(images) do
				table.insert(image, ('%s|%s'):format(v,map[i]))
			end
			table.insert(image, '')
			image = table.concat(image, '\n')
		else
			if imagesize == 1 then
				for i, v in pairs(images) do
					image = v
					break
				end
			end
		end
	end

	local age = ('%d year%s %d month%s -   
%d year%s %d month%s')
		:format(
			animal.MinAge.Year,	animal.MinAge.Year	== 1 and '' or 's',
			animal.MinAge.Month, animal.MinAge.Month == 1 and '' or 's',
			animal.MaxAge.Year,	animal.MaxAge.Year	== 1 and '' or 's',
			animal.MaxAge.Month, animal.MaxAge.Month == 1 and '' or 's',
		nil)
	
	local tag = Tooltip.icon(animalName..' Tag', 'Resources')
	local standingTT = Tooltip.icon('Standing', 'Resources')
	local capture = ('%s3 %s, %s%s (Perfect)  
2 %s, %s%s (Good)  
1 %s, %s%s (Bad)')
		:format(
			(animal.Reward ~= nil and animal.Reward ~= '') and ('[[%s]] [[Standing]]  
'):format(animal.Reward:gsub(' Standing$', '')) or '',
			tag, standingTT, Math.formatnum((animal.Standing or 0) * 2  ),
			tag, standingTT, Math.formatnum((animal.Standing or 0) * 1.5),
			tag, standingTT, Math.formatnum((animal.Standing or 0)      )
		)

	local resources, others = {}, {}
	local animalDrops = DropData.Enemies[animalName]

	-- Proliferating drop lists from each possible drop table that an animal can have
	-- TODO: Refactor drop list builder in a local function
	-- TODO: This can be refactored into Module:DropTables since that module contains definitions of
	-- item table entries via constants (e.g. ITEM_CHANCE_COL)
	if (animalDrops and not animalDrops._IgnoreEntry) then
		-- Item type to module name (e.g. 'Mod' to 'Mods' for Module:Mods)
		local itemTypeModuleMap = {
			Resource = 'Resources',
		}
		for _, resource in ipairs(animalDrops.Resources or {}) do
			table.insert(resources, ('%s%s %0.2f%%'):format(
				resource[4] and resource[4]..' ' or '',
				require('Module:Tooltips/icon')['Resources'](resource[1]) and Tooltip.full(resource[1], 'Resources') or '[['..resource[1]..']]',
				animalDrops.ResourceChance * resource[3] / 100
			))
		end
	end

	local infobox = Infobox('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(animalName)
	:image(image or 'Panel.png')
	:group()
		:caption('UpdateInfoboxData', '[[Module:Conservation/data|📝 %s]]', 'update-infobox-data')
	:done()
	:header('%s', 'general-information')
	:row('Origin', 'Origin', animal.Origin or 'Unknown')
	:row('Faction',	'%s', animal.Faction or 'Wild', 'faction')
	:row('Rarity', '[[Rarity]]', animal.Rarity)
	:row('TranqsNeeded', 'Tranq Shots Needed', animal.TranqsNeeded or 1)
	:group():header('%s', 'statistics')
		:row('Health', '[[Health]]', animal.Health or '?')
		:row('Armor', '[[Armor]]', animal.Armor or '?')
		:row('ArmorDR', 'Dmg. Reduction', ('%.0f%%'):format(100 * (animal.Armor / (animal.Armor + 300) ) ) )
		:row('Weight', 'Weight', animal.MinWeight..' kg - '..animal.MaxWeight..' kg')
		:row('Age', 'Age', age)
	:done()
	
	:group():header('%s', 'miscellaneous')
		:row('Reward', 'Capture Reward', capture)
		:row('CodexScans', '[[Codex]] Scan', animal.CodexScans or '?')
		:row('Introduced', '%s', Version.getVersionLink(animal.Introduced)..Version._getVersionCategory(animal.Introduced) or '?', 'introduced')
		:header(animal.Call and 'Call')
		:caption('CallFile', animal.Call and '[[File:'..animal.Call..']]' or 'N/A')
	:done()
	
	:group():header('%s', 'drops')
		:caption('NoDrops', true
			and not next(resources)
			and not next(others)
			and 'None[[Category:Enemies With No Drops]]' or nil)
		:row('ResourceDrops', '[[Resources|Resource Drops]]', table.concat(resources, '  
'))
		-- Editor override on articles; these drops are not listed in M:DropTables/data
		:row('OtherDrops', 'Other Drops', table.concat(others, '  
'))
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	
	return infobox
end
}
```

