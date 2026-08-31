---
title: "Module:Enemies/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Enemies/infobox"
wiki_timestamp: "2026-08-17T03:58:15Z"
---

Creates the infobox for enemies for use on [Template:EnemyInfobox](/w/Template:EnemyInfobox "Template:EnemyInfobox") and [Template:EnemyInfoboxHorizontal](/w/Template:EnemyInfoboxHorizontal "Template:EnemyInfoboxHorizontal"). This infobox is more complex than other infoboxes on the wiki since it has an interactive [Enemy Level Scaling](/w/Enemy_Level_Scaling "Enemy Level Scaling") slider that utilizes [MediaWiki:Gadget-enemyinfoboxslider.js](/w/MediaWiki:Gadget-enemyinfoboxslider.js "MediaWiki:Gadget-enemyinfoboxslider.js"). The module determines the necessary parameters that the slider will use and embeds them in the HTML source of the infobox.

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
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • M:Enemies/infobox • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

---

```lua
--	
local Math = require([[Module:Math]])
local Tooltip = require([[Module:Tooltips]])
local Version = require([[Module:Version]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local DropData = mw.loadData([[Module:DropTables/data]])
local WeaponData = require([[Module:Weapons/data]])
local EnemyData = require([[Module:Enemies/data]])
local DamageTypesData = mw.loadData([[Module:DamageTypes/data]])
local DamageTypes = require([[Module:DamageTypes]])
local Table = require([[Module:Table]])
local Text = require([[Module:Text]])

-- TODO: Move these values to their respective /data pages
local health_vals = {
	["Default"] = {
		f1_coef = 0.0150,
		f1_expo = 2.00,
		f2_coef = 10.7332,
		f2_expo = 0.5,
	},
	["Grineer"] = {
		f1_coef = 0.0150,
		f1_expo = 2.12,
		f2_coef = 10.7332,
		f2_expo = 0.72,
	},
	["Corpus"] = {
		f1_coef = 0.0150,
		f1_expo = 2.12,
		f2_coef = 13.4165,
		f2_expo = 0.55,
	},
	["Infestation"] = {
		f1_coef = 0.0225,
		f1_expo = 2.12,
		f2_coef = 16.100,
		f2_expo = 0.72,
	},
	["Orokin"] = {
		f1_coef = 0.0150,
		f1_expo = 2.10,
		f2_coef = 10.7332,
		f2_expo = 0.685,
	},
	["Scaldra"] = {
		f1_coef = 0.0150,
		f1_expo = 2.12,
		f2_coef = 10.7332,
		f2_expo = 0.72,
	},
	["Techrot"] = {
		f1_coef = 0.02,
		f1_expo = 2.12,
		f2_coef = 15.0998,
		f2_expo = 0.7,
	},
	["Anarchs"] = {
		f1_coef = 0.0150,
		f1_expo = 2.10,
		f2_coef = 10.7332,
		f2_expo = 0.685,
	},
}
health_vals["Kuva Grineer"] = health_vals["Grineer"]
health_vals["Corpus Amalgam"] = health_vals["Corpus"]
health_vals["Infested"] = health_vals["Infestation"]
health_vals["Infested Deimos"] = health_vals["Infestation"]
-- This is the default case
setmetatable(health_vals, {
	__index = function () return {
		f1_coef = 0.0150,
		f1_expo = 2.00,
		f2_coef = 10.7332,
		f2_expo = 0.5,
	} end
})

local shield_vals = {
	["Default"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 1.6000,
		f2_expo = 0.75,
	},
	["Corpus"] = {
		f1_coef = 0.0200,
		f1_expo = 1.76,
		f2_coef = 2.0000,
		f2_expo = 0.76,
	},
	["Corrupted"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 2.0000,
		f2_expo = 0.75,
	},
	["Techrot"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 3.5,
		f2_expo = 0.76,
	},
	["Anarchs"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 2.0000,
		f2_expo = 0.75,
	},
}
shield_vals["Kuva Grineer"] = shield_vals["Grineer"]
shield_vals["Corpus Amalgam"] = shield_vals["Corpus"]
shield_vals["Infested"] = shield_vals["Infestation"]
shield_vals["Infested Deimos"] = shield_vals["Infestation"]
setmetatable(shield_vals, {
	__index = function () return {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 1.6000,
		f2_expo = 0.75,
	} end
})

local armor_vals = {
	["Default"] = {
		f1_coef = 0.0050,
		f1_expo = 1.75,
		f2_coef = 0.4000,
		f2_expo = 0.75,
	},
}
setmetatable(armor_vals, {
	__index = function () return {
		f1_coef = 0.0050,
		f1_expo = 1.75,
		f2_coef = 0.4000,
		f2_expo = 0.75,
	} end
})

local overguard_vals = {
	["Default"] = {
		f1_coef = 0.0015,
		f1_expo = 4.00,
		f2_coef = 260.00,
		f2_expo = 0.90,
	},
}
setmetatable(overguard_vals, {
	__index = function () return {
		f1_coef = 0.0015,
		f1_expo = 4.00,
		f2_coef = 260.00,
		f2_expo = 0.90,
	} end
})

local function concatif(stat, str)
	return stat and stat..str
end

---	Builds infobox group for enemy attacks.
--	@function		Infobox:attackGroup
--	@param			{InfoboxBuilder} Infobox InfoboxBuilder object reference
--	@param			{table} enemy Enemy entry as seen in M:Enemies/data
local function attackGroup(Infobox, enemy)
	-- for i, attackData in ipairs(enemy.Stats.Attacks or {}) do
	-- 	local attack = 'Attack'..i

	-- 	local elems = {}
	-- 	local highestDmgDistr = -1
	-- 	local highestDmgDistrType
	-- 	for damageType, distr in pairs(attackData.DamageDistribution) do
	-- 		if highestDmgDistr < distr then
	-- 			highestDmgDistr = distr
	-- 			highestDmgDistrType = damageType
	-- 		end
	-- 		if damageType ~= 'Impact' and damageType ~= 'Puncture' and damageType ~= 'Slash' then
	-- 			table.insert(elems, damageType)
	-- 		end
	-- 	end
		
	-- 	local total = attackData.TotalDamage
	-- 	local multishot = attackData.Multishot or 1

	-- 	Infobox=Infobox
	-- 	:group():header(attackData.AttackName)
	-- 		:hgroup()
	-- 			:row(attack..'Impact', nil, attackData.DamageDistribution.Impact and 
	-- 				Tooltip.icon('Impact', 'DamageTypes', true)..Math.formatnum(attackData.DamageDistribution.Impact * total), 'impact')
	-- 			:row(attack..'Puncture', nil, attackData.DamageDistribution.Puncture and 
	-- 				Tooltip.icon('Puncture', 'DamageTypes', true)..Math.formatnum(attackData.DamageDistribution.Puncture * total), 'puncture')
	-- 			:row(attack..'Slash', nil, attackData.DamageDistribution.Slash and 
	-- 				Tooltip.icon('Slash', 'DamageTypes', true)..Math.formatnum(attackData.DamageDistribution.Slash * total), 'slash')

	-- 			for _, elem in ipairs(elems) do Infobox=Infobox
	-- 			:row(attack..elem, nil, attackData.DamageDistribution[elem] and 
	-- 				Tooltip.icon(elem, 'DamageTypes', true)..Math.formatnum(attackData.DamageDistribution[elem] * total), elem)
	-- 			end Infobox=Infobox
	-- 		:done()
	-- 		:row(attack..'Total', '[[Damage|%s]]',
	-- 			highestDmgDistr == 1 and Math.formatnum(total * multishot)..'[[Category:'..highestDmgDistrType..' Damage Enemies]]'
	-- 			or ('%s (%s%s%%)[[Category:%s Damage Enemies]]'):format(
	-- 				Math.formatnum(total * multishot),
	-- 				Tooltip.icon(highestDmgDistrType,'DamageTypes', true),
	-- 				Math.round(100 * highestDmgDistr, 0.01),
	-- 				highestDmgDistrType
	-- 			), 'total-damage')
	-- 		:row(attack..'BurstCount', '%s', attackData.BurstCount, 'burst-count')
	-- 		:row(attack..'ChargeTime', '[[Fire Rate#Charged Weapons|%s]]', concatif(attackData.ChargeTime, ' s'), 'charge-time')
	-- 		-- As of 35.0.9, enemies no longer deal critical damage. 
	-- 		--:row(attack..'CritChance', '[[Critical Hit|%s]]', attackData.CritChance and Math.round(100 * attackData.CritChance, 0.01)..'%', 'crit-chance')
	-- 		--:row(attack..'CritMultiplier', '[[Critical Hit|%s]]', concatif(attackData.CritMultiplier, 'x'), 'crit-multiplier')
	-- 		:row(attack..'Falloff', '[[Damage Falloff|%s]]', attackData.Falloff and ('100%% damage up to %s m  
%.0f%% damage at %s m  
%.0f%% max reduction'):format(attackData.Falloff.StartRange, 100 * (1 - (attackData.Falloff.Reduction or 1)), attackData.Falloff.EndRange, 100 * (attackData.Falloff.Reduction or 1)), 'damage-falloff')
	-- 		:row(attack..'Multishot', '[[Multishot|%s]]', attackData.Multishot and ('%d (%s damage per projectile)'):format(attackData.Multishot, Math.round(total, 0.01)), 'multishot')
	-- 		:row(attack..'Range', '%s', concatif(attackData.Range, ' m'), 'range')
	-- 		:row(attack..'Magazine', '[[Ammo#Magazine Capacity|%s]]', attackData.Magazine, 'magazine-size')
	-- 		:row(attack..'Reload', '[[Reload|%s]]', concatif(attackData.Reload, ' s'), 'reload-time')
	-- 		:row(attack..'StatusChance', '[[Status Chance|%s]]', attackData.StatusChance and Math.round(100*attackData.StatusChance, 0.01)..'%', 'status-chance')
	-- 		:row(attack..'ShotSpeed', '[[Projectile Speed|%s]]', concatif(attackData.ShotSpeed, ' m/s'), 'projectile-speed')
	-- 		:row(attack..'ShotType', '%s', attackData.ShotType, 'projectile-type')
	-- 	:done()
	-- end
end

return {
buildInfobox = function(frame)
	local args = frame.args
	local name = mw.text.decode(args['Name'] or mw.title.getCurrentTitle().text)

	-- In the case of Stalker, error occurred because its name was same as the faction name
	local enemy
	if name ~= "Stalker" then
		-- is the copying necessary?
		-- TODO: make the titlecaser unnecessary
		enemy = Table.deepCopy(EnemyData[name] or EnemyData[name:lower():gsub('^',' '):gsub('%W%w',string.upper):gsub('^ ','')])
	else
		enemy = EnemyData.stalker["Stalker"]
	end

	-- if not enemy then error('No enemy data for name "'..(name or '')..'" found in [[Module:Enemies/data]]/*') end
	if not enemy then enemy={General={},Stats={}}end

	-- TODO: Move all the prep before constructing a new Infobox object into a separate local helper function
	-- TODO: Not sure if missionNames should have an equivalent key in the enemy data. Adding this new table since
	-- some usages of T:Enemy uses mission arg for the mission name instead of mission type for assassination targets.
	local planets, tileSets, missionNames, missions, weapons, abilities, multis, procs = {}, {}, {}, {}, {}, {}, {}, {}

	for _, planet in ipairs(enemy.General.Planets or {}) do
		table.insert(planets, '[['..planet..']]')
	end
	for _, tileSet in ipairs(enemy.General.TileSets or {}) do
		table.insert(tileSets, '[['..tileSet..']]')
	end
	for _, mission in ipairs(enemy.General.Missions or {}) do
		table.insert(missions, '[['..mission..']]')
	end
	for _, weapon in ipairs(enemy.General.Weapons or {}) do
		table.insert(weapons, WeaponData[weapon] and Tooltip.full(weapon, 'Weapons') or weapon)
	end
	for _, ability in ipairs(enemy.General.Abilities or {}) do
		table.insert(abilities, '[['..ability..']]')
	end
	for _, multi in ipairs(enemy.Stats.Multis or {}) do
		table.insert(multis, multi)
	end
	for _, proc in ipairs(enemy.Stats.ProcResists or {}) do
		table.insert(procs, Tooltip.full(proc, 'DamageTypes'))
	end
	table.sort(planets)
	table.sort(tileSets)
	table.sort(missions)
	table.sort(weapons)
	table.sort(abilities)
	table.sort(multis)
	table.sort(procs)

	local faction, overguard, shield, health, armor, affinity, baseLevel, spawnLevel, steelPathHealthBonus, steelPathShieldBonus, archimedeaHealthBonus
	local eximusAffinity, eximusShield, eximusHealth, eximusArmor, eximusOverguard
	local isOverguardEnemy, eximusDefault, steelPathDefault, empoweredDefault, factionScaling
	
	-- Retrieve arguments from input, if any.
	shield = (args['Shields'] or ''):gsub(',', '')
	health = (args['Health'] or ''):gsub(',', '')
	armor = (args['Armor'] or ''):gsub(',', '')
	affinity = (args['Affinity'] or ''):gsub(',', '')
	steelPathHealthBonus = (args['SteelPathHealthBonus'] or ''):gsub(',', '')
	steelPathShieldBonus = (args['SteelPathShieldBonus'] or ''):gsub(',', '')
	archimedeaHealthBonus = (args['ArchimedeaHealthBonus'] or ''):gsub(',', '')
	
	overguard = (args['Overguard'] or ''):gsub(',', '')	-- TODO: Replace thousands delimiter replacement once we add all enemy data to M:Enemies/data
	if tonumber(overguard) or enemy.Stats.Overguard then
		isOverguardEnemy = true
	end
	
	eximusOverguard = (args['EximusOverguard'] or ''):gsub(',', '')
	eximusShield = (args['EximusShields'] or ''):gsub(',', '')
	eximusHealth = (args['EximusHealth'] or ''):gsub(',', '')
	eximusArmor = (args['EximusArmor'] or ''):gsub(',', '')
	eximusAffinity = (args['EximusAffinity'] or ''):gsub(',', '')

	-- Fallback to default values in [[Module:Enemies/data]] if input not provided.
	faction = args['Faction'] ~= '' and args['Faction'] or enemy.General.Faction
	shield = tonumber(shield) or enemy.Stats.Shield
	health = tonumber(health) or enemy.Stats.Health
	armor = tonumber(armor) or enemy.Stats.Armor
	overguard = tonumber(overguard) or enemy.Stats.Overguard or 0 -- Add 0 as fallback value to force overguard row to always appear.
	affinity = tonumber(affinity) or enemy.Stats.Affinity
	baseLevel = tonumber(args['BaseLevel']) or enemy.Stats.BaseLevel or 1
	spawnLevel = tonumber(args['SpawnLevel']) or enemy.Stats.SpawnLevel
	steelPathHealthBonus = tonumber(steelPathHealthBonus) or enemy.Stats.SteelPathHealthBonus
	steelPathShieldBonus = tonumber(steelPathShieldBonus) or enemy.Stats.SteelPathShieldBonus
	archimedeaHealthBonus = tonumber(archimedeaHealthBonus) or enemy.Stats.ArchimedeaHealthBonus
	
	eximusOverguard = tonumber(eximusOverguard) or enemy.Stats.EximusOverguard
	eximusShield = tonumber(eximusShield) or enemy.Stats.EximusShield
	eximusHealth = tonumber(eximusHealth) or enemy.Stats.EximusHealth
	eximusArmor = tonumber(eximusArmor) or enemy.Stats.EximusArmor
	eximusAffinity = tonumber(eximusAffinity) or enemy.Stats.EximusAffinity
	
	eximusDefault = enemy.General.EximusDefault
	steelPathDefault = enemy.General.SteelPathDefault
	empoweredDefault = enemy.General.EmpoweredDefault
	factionScaling = (enemy.Stats.FactionScaling) or faction

	-- [[MediaWiki:Gadget-enemyinfoboxslider.js]] will try to update all ids at once so adding
	-- hidden empty rows
	local vals = {
		(not(faction) or faction == '') and '' or '',
		(not(affinity) or affinity == 0) and '0' or '',
		(not(overguard) or overguard == 0) and '0' or '',
		(not(shield) or shield == 0) and '0' or '',
		(not(health) or health == 0) and '0' or '',
		(not(armor) or armor == 0) and '0' or '',
		(not(armor) or armor == 0) and '0' or '',
		(not(baseLevel) or baseLevel == 0) and '0' or '',
		(not(spawnLevel) or spawnLevel == 0 or spawnLevel == baseLevel) and '0' or '',
		'500',
		(not(steelPathHealthBonus) or steelPathHealthBonus == 0) and '0' or '',
		(not(steelPathShieldBonus) or steelPathShieldBonus == 0) and '0' or '',
		(not(archimedeaHealthBonus) or archimedeaHealthBonus == 0) and '0' or '',
		
		''.. (eximusAffinity and eximusAffinity or 0) ..'',
		''.. (eximusOverguard and eximusOverguard or 0) ..'',
		''.. (eximusShield and eximusShield or 0) ..'',
		''.. (eximusHealth and eximusHealth or 0) ..'',
		''.. (eximusArmor and eximusArmor or 0) ..'',

		''..health_vals[factionScaling].f1_coef..'',
		''..health_vals[factionScaling].f1_expo..'',
		''..health_vals[factionScaling].f2_coef..'',
		''..health_vals[factionScaling].f2_expo..'',

		''..shield_vals[factionScaling].f1_coef..'',
		''..shield_vals[factionScaling].f1_expo..'',
		''..shield_vals[factionScaling].f2_coef..'',
		''..shield_vals[factionScaling].f2_expo..'',

		''..armor_vals[factionScaling].f1_coef..'',
		''..armor_vals[factionScaling].f1_expo..'',
		''..armor_vals[factionScaling].f2_coef..'',
		''..armor_vals[factionScaling].f2_expo..'',

		''..overguard_vals[factionScaling].f1_coef..'',
		''..overguard_vals[factionScaling].f1_expo..'',
		''..overguard_vals[factionScaling].f2_coef..'',
		''..overguard_vals[factionScaling].f2_expo..'',
		
		''..(eximusDefault and '1' or '0')..'',
		''..(steelPathDefault and '1' or '0')..'',
		''..(empoweredDefault and '1' or '0')..'',
	}

	local mods, resources, relics, blueprints, missionDrops, sigils, items, pigments, others = {}, {}, {}, {}, {}, {}, {}, {}, {}
	local enemyDrops = DropData.Enemies[name]

	-- Proliferating drop lists from each possible drop table that an enemy can have
	-- TODO: Refactor drop list builder in a local function
	-- TODO: This can be refactored into Module:DropTables since that module contains definitions of
	-- item table entries via constants (e.g. ITEM_CHANCE_COL)
	if (enemyDrops and not enemyDrops._IgnoreEntry) then
		-- Item type to module name (e.g. 'Mod' to 'Mods' for Module:Mods)
		local itemTypeModuleMap = {
			Mod = 'Mods',
			Resource = 'Resources',
			Arcane = 'Arcane',
			Relic = 'Void',
			Sigil = 'Sigils',
			Blueprint = 'Blueprints',
		}
		for _, mod in ipairs(enemyDrops.Mods or {}) do
			local tooltip = Tooltip.full(mod[1], itemTypeModuleMap[mod[2]])
			table.insert(mods, ('%s %0.2f%%'):format(
				mod[4] and mod[4]..' '..tooltip or tooltip,
				enemyDrops.ModChance * mod[3] / 100
			))
		end
		for _, resource in ipairs(enemyDrops.Resources or {}) do
			table.insert(resources, ('%s%s %0.2f%%'):format(
				resource[4] and resource[4]..' ' or '',
				require('Module:Tooltips/icon')['Resources'](resource[1]) and Tooltip.full(resource[1], 'Resources') or '[['..resource[1]..']]',
				enemyDrops.ResourceChance * resource[3] / 100
			))
		end
		for _, relic in ipairs(enemyDrops.Relics or {}) do
			table.insert(relics, ('%s %0.2f%%'):format(
				Tooltip.full(relic[1], 'Void'),
				enemyDrops.RelicChance * relic[3] / 100
			))
		end
		for _, blueprint in ipairs(enemyDrops.Blueprints or {}) do
			local itemName = blueprint[1]:gsub(" Blueprint", "")
			local text = blueprint[1]
			for _, category in ipairs({"Weapons", "Resources"}) do
				if Tooltip._getIndex(itemName, category) then
					text = Tooltip.full{itemName, category, r=blueprint[1]}
					break
				end
			end
			table.insert(blueprints, ('%s %0.2f%%'):format(
				text,
				enemyDrops.BlueprintChance * blueprint[3] / 100
			))
		end
		for _, sigil in ipairs(enemyDrops.Sigils or {}) do
			table.insert(sigils, ('%s %0.2f%%'):format(
				Tooltip.full(sigil[1], itemTypeModuleMap[sigil[2]]) or sigil[1],
				enemyDrops.SigilChance * sigil[3] / 100
			))
		end
		for _, item in ipairs(enemyDrops.Items or {}) do
			table.insert(items, ('%s %0.2f%%'):format(
				item[2]~='Item' and Tooltip.full(item[1], itemTypeModuleMap[item[2]]) or item[1],
				enemyDrops.ItemChance * item[3] / 100
			))
		end
		for _, pigment in ipairs(enemyDrops.Pigments or {}) do
			table.insert(pigments, ('%sx %s %0.2f%%'):format(
				pigment[4],
				pigment[2]~='Item' and Tooltip.full(pigment[1], itemTypeModuleMap[pigment[2]]) or pigment[1],
				enemyDrops.PigmentChance * pigment[3] / 100
			))
		end
	end

	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json', 'WARFRAME Wiki:L10n/weapons.json'):addClass('type-enemyBox')
		:title(name)
		:wikitext('[[Category:Enemies]]')
		:image(enemy.General.Image or 'UnidentifiedItem.png', 'Image')
		:group()
			:caption('CodexSecret', enemy.General.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
		:done()
		:group():header('%s', 'description')
			:caption('Description', enemy.General.Description)
		:done()
		:group():header('%s', 'general-information')
			:srow('Faction', '[[Faction|%s]]', 'faction', faction,
				enemy.General.Faction and enemy.General.Faction~='' and '[[Category:'..enemy.General.Faction..']]', 'faction')
			:row('Planets', '[[Star Chart|Planet(s)]]', (planets and planets[1]) and table.concat(planets, '  
'))
			:row('MissionNames', '[[Mission|Mission Name(s)]]', (missionNames and missionNames[1]) and table.concat(missionNames, '  
'))
			:row('Missions', '[[Mission|Mission Type(s)]]', (missions and missions[1]) and table.concat(missions, '  
'))
			:row('TileSets', '[[Tile Sets|Tile Set(s)]]', (tileSets and tileSets[1]) and table.concat(tileSets, '  
'))
			:row('Type', '%s', enemy.General.Type, 'type', enemy.General.Type and '[[Category:'..enemy.General.Type..' Enemies]]')
			:row('Weapons', 'Weapon(s)', (weapons and weapons[1]) and table.concat(weapons, '  
'))
			:row('Abilities', 'Abilities', (abilities and abilities[1]) and table.concat(abilities, '  
'))
		:done()
	
	local overguardHealthMod = DamageTypes.healthMod('Overguard') or ''
	local overguardCategoryWikitext = isOverguardEnemy and ' [[Category:Overguard Enemies]]' or ''
	overguardHealthMod = overguardHealthMod .. overguardCategoryWikitext

	Infobox:group():header('Statistics')
			:srow('Resists', '[[Damage Type Modifier]]s', 'resists', DamageTypes.healthMod(enemy.General.FactionDamageOverride or enemy.General.Faction or ''))
			-- :caption('Resists', DamageTypes.healthMod(enemy.General.FactionDamageOverride or enemy.General.Faction or ''))
			
			:srow('Affinity', '[[Affinity#Enemy Affinity Scaling|Affinity]]', 'affinity', affinity)
			:srow('Shield', '[[Shield]]', 'shield', shield)
			:srow('Health', '[[Health]]', 'health', health)
			:srow('Armor', '[[Armor]]', 'armor', armor)
			:srow('DmgReduction', '[[Damage Reduction|Dmg. Reduction]]', 'damage_redux', armor and Math.round(math.sqrt(3 * armor), 0.01), '%')
			:srow('Overguard', '[[Overguard]]', 'overguard', overguard, overguardHealthMod)
			-- :caption('OverguardT', overguard and overguard ~= 0 and DamageTypes.healthMod('Overguard', 'span') or nil)

			:row('Bleedout', '[[Bleedout]]', concatif(enemy.Stats.Bleedout,' s'))
			:row('BodyMultis', '[[Enemy Body Parts|Body Multipliers]]', (multis and multis[1]) and table.concat(multis, '  
'))
			:row('ProcResists', '[[Proc|Proc Immunity]]', (procs and procs[1]) and table.concat(procs, '  '))
			:srow('BaseLevel', '[[Enemy Level Scaling#Scaling of Fundamental Stats|Base Level]]', 'base_level', baseLevel)
			:srow('SpawnLevel', '[[Enemy Level Scaling#Scaling of Fundamental Stats|Spawn Level]]', 'spawn_level', (spawnLevel and baseLevel ~= spawnLevel) and spawnLevel or 0)
			
			:srow('SteelPathHealthBonus', '[[The Steel Path|SP]] [[Health]] Bonus', 'steel_path_health_bonus', steelPathHealthBonus)
			:srow('SteelPathShieldBonus', '[[The Steel Path|SP]] [[Shield]] Bonus', 'steel_path_shield_bonus', steelPathShieldBonus)
			:srow('ArchimedeaHealthBonus', '[[Archimedea|Arch.]] [[Health]] Bonus', 'archimedea_health_bonus', archimedeaHealthBonus)
			
			:srow('EHP', Text._text('Effective Hit Points (EHP)', { hoverText='Effective amount of hit points, taking health, armor and shields into account.', cursor='help' }), 'out_ehp', '––')
		:done()

	attackGroup(Infobox, enemy)

	Infobox:group():header('[[Enemy Level Scaling|Level Scaling]]')
			:caption('Slider', table.concat(vals)..'

JavaScript not loaded. Please make sure the ⧼gadget-enemyinfoboxslider⧽ is enabled and refresh your browser using Ctrl+F5 on PC or Shift+R on Mac.

')
			:srow('SelectedLevel', Text._text('Selected Level', { hoverText = 'For higher enemy levels input the value manually.', cursor='help' }), 'out_lvl', '––', '')
			:srow('IsEximus', '[[Eximus]]', 'is_eximus', '––')
			:srow('IsSteelPath', '[[Steel Path]]', 'is_steel_path', '––')
			:srow('IsEmpowered', '[[Empowered Enemies]]', 'is_empowered', '––')
			:srow('PlayerCount', Text._text('Player Count', { hoverText = 'If Empowered Enemies is enabled, the Health and Shields of enemies will multiply depending on how many players are in a squad. 1 Player: 2.5x, 2 Players: 3.0x, 3 Players: 3.5x, 4 Players: 4.0x.', cursor='help' }), 'player_count', '––')
		:done()

		:group():header('%s', 'miscellaneous')
			:row('CodexScans', '[[Codex|Codex Scans]]', enemy.General.Scans)
			:row('VA', 'Voice Actor', enemy.General.Actor)
			:row('Introduced', '%s', enemy.General.Introduced and Version._getVersionLink(enemy.General.Introduced), 'introduced', enemy.General.Introduced and Version._getVersionCategory(enemy.General.Introduced))
		:done()

		:group():header('%s', 'drops')
			:caption('NoDrops', true
				and not next(mods)
				and not next(resources)
				and not next(relics)
				and not next(blueprints)
				and not next(missionDrops)
				and not next(sigils)
				and not next(items)
				and not next(others)
				and 'None[[Category:Enemies With No Drops]]' or nil)
			:row('ModDrops', '[[File:Mod TT 20px.png|x12px|link=]] [[Mod|Mod Drops]]', table.concat(mods, '  
'))
			:row('ResourceDrops', '[[Resources|Resource Drops]]', table.concat(resources, '  
'))
			:row('RelicDrops', '[[Void Relic|Relic Drops]]', table.concat(relics, '  
'))
			:row('BPDrops', '[[Foundry|Blueprint/Item Drops]]', table.concat(blueprints, '  
'))
			:row('ItemDrops', 'Additional Item Drops', table.concat(items, '  
'))
			:row('MissionDrops', '[[Mission|Mission Drops]]', table.concat(missionDrops, '  
'))
			:row('SigilDrops', '[[Sigils|Sigil Drops]]', table.concat(sigils, '  
'))
			:row('PigmentDrops', '[[Pigment|Pigment Drops]]', table.concat(pigments, '  
'))
			-- Editor override on articles; these drops are not listed in M:DropTables/data
			:row('OtherDrops', 'Other Drops', table.concat(others, '  
'))
		:done()
		:group():header('%s', 'official-drop-tables')
			:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
		:done()
		:group():header('%s', 'maintenance')
			:caption('UpdateInfoboxData', '[[Module:Enemies/data|📝 %s]]', 'update-infobox-data')
		:done()
		
	return Infobox:_dump(enemy)
end,

-- Horizontal variant of enemy infobox
buildInfoboxHorizontal = function(frame)
	local args = frame.args
	local name = mw.text.decode(args['name'] or mw.title.getCurrentTitle().text)
	
	-- In the case of Stalker, error occurred because its name was same as the faction name
	local enemy
	if name ~= "Stalker" then
		-- is the copying necessary?
		-- TODO: make the titlecaser unnecessary
		enemy = Table.deepCopy(EnemyData[name] or EnemyData[name:lower():gsub('^',' '):gsub('%W%w',string.upper):gsub('^ ','')])
	else
		enemy = EnemyData.stalker["Stalker"]
	end
	
	-- if not enemy then error('No enemy data for name "'..(name or '')..'" found in [[Module:Enemies/data]]/*') end
	if not enemy then enemy={General={},Stats={}}end

	-- TODO: Move all the prep before constructing a new Infobox object into a separate local helper function
	-- TODO: Not sure if missionNames should have an equivalent key in the enemy data. Adding this new table since
	-- some usages of T:Enemy uses mission arg for the mission name instead of mission type for assassination targets.
	local planets, tileSets, missionNames, missions, weapons, abilities, multis, procs = {}, {}, {}, {}, {}, {}, {}, {}

	for _, planet in ipairs(enemy.General.Planets or {}) do
		table.insert(planets, '[['..planet..']]')
	end
	for _, tileSet in ipairs(enemy.General.TileSets or {}) do
		table.insert(tileSets, '[['..tileSet..']]')
	end
	for _, mission in ipairs(enemy.General.Missions or {}) do
		table.insert(missions, '[['..mission..']]')
	end
	for _, weapon in ipairs(enemy.General.Weapons or {}) do
		table.insert(weapons, WeaponData[weapon] and Tooltip.full(weapon, 'Weapons') or weapon)
	end
	for _, ability in ipairs(enemy.General.Abilities or {}) do
		table.insert(abilities, '[['..ability..']]')
	end
	for _, multi in ipairs(enemy.Stats.Multis or {}) do
		table.insert(multis, multi)
	end
	for _, proc in ipairs(enemy.Stats.ProcResists or {}) do
		table.insert(procs, Tooltip.full(proc, 'DamageTypes'))
	end
	table.sort(planets)
	table.sort(tileSets)
	table.sort(missions)
	table.sort(weapons)
	table.sort(abilities)
	table.sort(multis)
	table.sort(procs)
	
	local faction, overguard, shield, health, armor, affinity, baseLevel, spawnLevel, steelPathHealthBonus, steelPathShieldBonus, archimedeaHealthBonus
	local eximusAffinity, eximusShield, eximusHealth, eximusArmor, eximusOverguard
	local isOverguardEnemy, eximusDefault, steelPathDefault, empoweredDefault, factionScaling

	-- Fallback to default values in [[Module:Enemies/data]] if input not provided.
	faction = enemy.General.Faction
	shield = enemy.Stats.Shield
	health = enemy.Stats.Health
	armor = enemy.Stats.Armor
	overguard = enemy.Stats.Overguard or 0 -- Add 0 as fallback value to force overguard row to always appear.
	affinity = enemy.Stats.Affinity
	baseLevel = enemy.Stats.BaseLevel or 1
	spawnLevel = enemy.Stats.SpawnLevel
	steelPathHealthBonus = enemy.Stats.SteelPathHealthBonus
	steelPathShieldBonus = enemy.Stats.SteelPathShieldBonus
	archimedeaHealthBonus = enemy.Stats.ArchimedeaHealthBonus
	
	eximusOverguard = enemy.Stats.EximusOverguard
	eximusShield = enemy.Stats.EximusShield
	eximusHealth = enemy.Stats.EximusHealth
	eximusArmor = enemy.Stats.EximusArmor
	eximusAffinity = enemy.Stats.EximusAffinity
	
	eximusDefault = enemy.General.EximusDefault
	steelPathDefault = enemy.General.SteelPathDefault
	empoweredDefault = enemy.General.EmpoweredDefault
	factionScaling = (enemy.Stats.FactionScaling) or faction

	-- [[MediaWiki:Gadget-enemyinfoboxslider.js]] will try to update all ids at once so adding
	-- hidden empty rows
	local vals = {
		(not(faction) or faction == '') and '' or '',
		(not(affinity) or affinity == 0) and '0' or '',
		(not(overguard) or overguard == 0) and '0' or '',
		(not(shield) or shield == 0) and '0' or '',
		(not(health) or health == 0) and '0' or '',
		(not(armor) or armor == 0) and '0' or '',
		(not(armor) or armor == 0) and '0' or '',
		(not(baseLevel) or baseLevel == 0) and '0' or '',
		(not(spawnLevel) or spawnLevel == 0 or spawnLevel == baseLevel) and '0' or '',
		'500',
		(not(steelPathHealthBonus) or steelPathHealthBonus == 0) and '0' or '',
		(not(steelPathShieldBonus) or steelPathShieldBonus == 0) and '0' or '',
		(not(archimedeaHealthBonus) or archimedeaHealthBonus == 0) and '0' or '',
		
		''.. (eximusAffinity and eximusAffinity or 0) ..'',
		''.. (eximusOverguard and eximusOverguard or 0) ..'',
		''.. (eximusShield and eximusShield or 0) ..'',
		''.. (eximusHealth and eximusHealth or 0) ..'',
		''.. (eximusArmor and eximusArmor or 0) ..'',

		''..health_vals[factionScaling].f1_coef..'',
		''..health_vals[factionScaling].f1_expo..'',
		''..health_vals[factionScaling].f2_coef..'',
		''..health_vals[factionScaling].f2_expo..'',

		''..shield_vals[factionScaling].f1_coef..'',
		''..shield_vals[factionScaling].f1_expo..'',
		''..shield_vals[factionScaling].f2_coef..'',
		''..shield_vals[factionScaling].f2_expo..'',

		''..armor_vals[factionScaling].f1_coef..'',
		''..armor_vals[factionScaling].f1_expo..'',
		''..armor_vals[factionScaling].f2_coef..'',
		''..armor_vals[factionScaling].f2_expo..'',

		''..overguard_vals[factionScaling].f1_coef..'',
		''..overguard_vals[factionScaling].f1_expo..'',
		''..overguard_vals[factionScaling].f2_coef..'',
		''..overguard_vals[factionScaling].f2_expo..'',
		
		''..(eximusDefault and '1' or '0')..'',
		''..(steelPathDefault and '1' or '0')..'',
		''..(empoweredDefault and '1' or '0')..'',
	}
	
	local mods, resources, relics, blueprints, missionDrops, sigils, items, pigments, others = {}, {}, {}, {}, {}, {}, {}, {}, {}
	local enemyDrops = DropData.Enemies[name]

	-- Proliferating drop lists from each possible drop table that an enemy can have
	-- TODO: Refactor drop list builder in a local function
	-- TODO: This can be refactored into Module:DropTables since that module contains definitions of
	-- item table entries via constants (e.g. ITEM_CHANCE_COL)
	if (enemyDrops and not enemyDrops._IgnoreEntry) then
		-- Item type to module name (e.g. 'Mod' to 'Mods' for Module:Mods)
		local itemTypeModuleMap = {
			Mod = 'Mods',
			Resource = 'Resources',
			Arcane = 'Arcane',
			Relic = 'Void',
			Sigil = 'Sigils',
			Blueprint = 'Blueprints',
		}
		for _, mod in ipairs(enemyDrops.Mods or {}) do
			local tooltip = Tooltip.full(mod[1], itemTypeModuleMap[mod[2]])
			table.insert(mods, ('%s %0.2f%%'):format(
				mod[4] and mod[4]..' '..tooltip or tooltip,
				enemyDrops.ModChance * mod[3] / 100
			))
		end
		for _, resource in ipairs(enemyDrops.Resources or {}) do
			table.insert(resources, ('%s%s %0.2f%%'):format(
				resource[4] and resource[4]..' ' or '',
				require('Module:Tooltips/icon')['Resources'](resource[1]) and Tooltip.full(resource[1], 'Resources') or '[['..resource[1]..']]',
				enemyDrops.ResourceChance * resource[3] / 100
			))
		end
		for _, relic in ipairs(enemyDrops.Relics or {}) do
			table.insert(relics, ('%s %0.2f%%'):format(
				Tooltip.full(relic[1], 'Void'),
				enemyDrops.RelicChance * relic[3] / 100
			))
		end
		for _, blueprint in ipairs(enemyDrops.Blueprints or {}) do
			local itemName = blueprint[1]:gsub(" Blueprint", "")
			local text = blueprint[1]
			for _, category in ipairs({"Weapons", "Resources"}) do
				if Tooltip._getIndex(itemName, category) then
					text = Tooltip.full{itemName, category, r=blueprint[1]}
					break
				end
			end
			table.insert(blueprints, ('%s %0.2f%%'):format(
				text,
				enemyDrops.BlueprintChance * blueprint[3] / 100
			))
		end
		for _, sigil in ipairs(enemyDrops.Sigils or {}) do
			table.insert(sigils, ('%s %0.2f%%'):format(
				Tooltip.full(sigil[1], itemTypeModuleMap[sigil[2]]) or sigil[1],
				enemyDrops.SigilChance * sigil[3] / 100
			))
		end
		for _, item in ipairs(enemyDrops.Items or {}) do
			table.insert(items, ('%s %0.2f%%'):format(
				item[2]~='Item' and Tooltip.full(item[1], itemTypeModuleMap[item[2]]) or item[1],
				enemyDrops.ItemChance * item[3] / 100
			))
		end
		for _, pigment in ipairs(enemyDrops.Pigments or {}) do
			table.insert(pigments, ('%sx %s %0.2f%%'):format(
				pigment[4],
				pigment[2]~='Item' and Tooltip.full(pigment[1], itemTypeModuleMap[pigment[2]]) or pigment[1],
				enemyDrops.PigmentChance * pigment[3] / 100
			))
		end
	end

	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json', 'WARFRAME Wiki:L10n/weapons.json'):addClass('type-enemyBox')
		:column()
		:title(name)
		:wikitext('[[Category:Enemies]]')
		:image(enemy.General.Image or 'UnidentifiedItem.png', 'Image')
		:group()
			:caption('CodexSecret', enemy.General.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
		:done()
		:group():header('%s', 'description')
			:caption('Description', enemy.General.Description)
		:done()
		:column()
			:group():header('%s', 'general-information')
				:srow('Faction', '[[Faction|%s]]', 'faction', faction,
					enemy.General.Faction and enemy.General.Faction~='' and '[[Category:'..enemy.General.Faction..']]', 'faction')
				:row('Planets', '[[Star Chart|Planet(s)]]', (planets and planets[1]) and table.concat(planets, '  
'))
				:row('MissionNames', '[[Mission|Mission Name(s)]]', (missionNames and missionNames[1]) and table.concat(missionNames, '  
'))
				:row('Missions', '[[Mission|Mission Type(s)]]', (missions and missions[1]) and table.concat(missions, '  
'))
				:row('TileSets', '[[Tile Sets|Tile Set(s)]]', (tileSets and tileSets[1]) and table.concat(tileSets, '  
'))
				:row('Type', '%s', enemy.General.Type, 'type', enemy.General.Type and '[[Category:'..enemy.General.Type..' Enemies]]')
				:row('Weapons', 'Weapon(s)', (weapons and weapons[1]) and table.concat(weapons, '  
'))
				:row('Abilities', 'Abilities', (abilities and abilities[1]) and table.concat(abilities, '  
'))
			:done()
			:group():header('%s', 'miscellaneous')
				:row('CodexScans', '[[Codex|Codex Scans]]', enemy.General.Scans)
				:row('VA', 'Voice Actor', enemy.General.Actor)
				:row('Introduced', '%s', enemy.General.Introduced and Version._getVersionLink(enemy.General.Introduced), 'introduced', enemy.General.Introduced and Version._getVersionCategory(enemy.General.Introduced))
			:done()
			:group():header('%s', 'official-drop-tables')
				:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
			:done()
			:group():header('%s', 'maintenance')
				:caption('UpdateInfoboxData', '[[Module:Enemies/data|📝 %s]]', 'update-infobox-data')
			:done()
	
	local overguardHealthMod = DamageTypes.healthMod('Overguard') or ''
	local overguardCategoryWikitext = isOverguardEnemy and ' [[Category:Overguard Enemies]]' or ''
	overguardHealthMod = overguardHealthMod .. overguardCategoryWikitext

	Infobox:column()
		:group():header('Statistics')
			:srow('Resists', '[[Damage Type Modifier]]s', 'resists', DamageTypes.healthMod(enemy.General.FactionDamageOverride or enemy.General.Faction or ''))
			-- :caption('Resists', DamageTypes.healthMod(enemy.General.FactionDamageOverride or enemy.General.Faction or ''))
			
			:srow('Affinity', '[[Affinity#Enemy Affinity Scaling|Affinity]]', 'affinity', affinity)
			:srow('Shield', '[[Shield]]', 'shield', shield)
			:srow('Health', '[[Health]]', 'health', health)
			:srow('Armor', '[[Armor]]', 'armor', armor)
			:srow('DmgReduction', '[[Damage Reduction|Dmg. Reduction]]', 'damage_redux', armor and Math.round(math.sqrt(3 * armor), 0.01), '%')
			:srow('Overguard', '[[Overguard]]', 'overguard', overguard, overguardHealthMod)
			-- :caption('OverguardT', overguard and overguard ~= 0 and DamageTypes.healthMod('Overguard', 'span') or nil)

			:row('Bleedout', '[[Bleedout]]', concatif(enemy.Stats.Bleedout,' s'))
			:row('BodyMultis', '[[Enemy Body Parts|Body Multipliers]]', (multis and multis[1]) and table.concat(multis, '  
'))
			:row('ProcResists', '[[Proc|Proc Immunity]]', (procs and procs[1]) and table.concat(procs, '  '))
			:srow('BaseLevel', '[[Enemy Level Scaling#Scaling of Fundamental Stats|Base Level]]', 'base_level', baseLevel)
			:srow('SpawnLevel', '[[Enemy Level Scaling#Scaling of Fundamental Stats|Spawn Level]]', 'spawn_level', (spawnLevel and baseLevel ~= spawnLevel) and spawnLevel or 0)
			
			:srow('SteelPathHealthBonus', '[[The Steel Path|SP]] [[Health]] Bonus', 'steel_path_health_bonus', steelPathHealthBonus)
			:srow('SteelPathShieldBonus', '[[The Steel Path|SP]] [[Shield]] Bonus', 'steel_path_shield_bonus', steelPathShieldBonus)
			:srow('ArchimedeaHealthBonus', '[[Archimedea|Arch.]] [[Health]] Bonus', 'archimedea_health_bonus', archimedeaHealthBonus)
			
			:srow('EHP', Text._text('Effective Hit Points (EHP)', { hoverText='Effective amount of hit points, taking health, armor and shields into account.', cursor='help' }), 'out_ehp', '––')
		:done()

	Infobox:column()
		:group():header('[[Enemy Level Scaling|Level Scaling]]')
			:caption('Slider', table.concat(vals)..'

JavaScript not loaded. Please make sure the ⧼gadget-enemyinfoboxslider⧽ is enabled and refresh your browser using Ctrl+F5 on PC or Shift+R on Mac.

')
			:srow('SelectedLevel', Text._text('Selected Level', { hoverText = 'For higher enemy levels input the value manually.', cursor='help' }), 'out_lvl', '––', '')
			:srow('IsEximus', '[[Eximus]]', 'is_eximus', '––')
			:srow('IsSteelPath', '[[Steel Path]]', 'is_steel_path', '––')
			:srow('IsEmpowered', '[[Empowered Enemies]]', 'is_empowered', '––')
			:srow('PlayerCount', Text._text('Player Count', { hoverText = 'If Empowered Enemies is enabled, the Health and Shields of enemies will multiply depending on how many players are in a squad. 1 Player: 2.5x, 2 Players: 3.0x, 3 Players: 3.5x, 4 Players: 4.0x.', cursor='help' }), 'player_count', '––')
		:done()
	
	Infobox:column()
		:group():header('%s', 'drops')
			:caption('NoDrops', true
				and not next(mods)
				and not next(resources)
				and not next(relics)
				and not next(blueprints)
				and not next(missionDrops)
				and not next(sigils)
				and not next(items)
				and not next(others)
				and 'None[[Category:Enemies With No Drops]]' or nil)
			:row('ModDrops', '[[File:Mod TT 20px.png|x12px|link=]] [[Mod|Mod Drops]]', table.concat(mods, '  
'))
			:row('ResourceDrops', '[[Resources|Resource Drops]]', table.concat(resources, '  
'))
			:row('RelicDrops', '[[Void Relic|Relic Drops]]', table.concat(relics, '  
'))
			:row('BPDrops', '[[Foundry|Blueprint/Item Drops]]', table.concat(blueprints, '  
'))
			:row('ItemDrops', 'Additional Item Drops', table.concat(items, '  
'))
			:row('MissionDrops', '[[Mission|Mission Drops]]', table.concat(missionDrops, '  
'))
			:row('SigilDrops', '[[Sigils|Sigil Drops]]', table.concat(sigils, '  
'))
			:row('PigmentDrops', '[[Pigment|Pigment Drops]]', table.concat(pigments, '  
'))
		:done()
	
	Infobox:done():done():done():done():done()	-- Closing the columns
	
	return Infobox:_dump(enemy)
end
}
```

