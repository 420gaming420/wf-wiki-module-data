---
title: "Module:Enemies/infobox/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Enemies/infobox/dev"
wiki_timestamp: "2026-03-14T23:53:05Z"
---

*Documentation for this module may be created at [Module:Enemies/infobox/dev/doc](/w/Module:Enemies/infobox/dev/doc?action=edit&redlink=1 "Module:Enemies/infobox/dev/doc (page does not exist)")*

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
		f2_expo = 0.720,
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
	}
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
		f2_coef = 2.0000,
		f2_expo = 0.75,
	},
	["Grineer"] = {
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
	["Infestation"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 1.6000,
		f2_expo = 0.75,
	},
	["Techrot"] = {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 3.5,
		f2_expo = 0.76,
	}
}
shield_vals["Kuva Grineer"] = shield_vals["Grineer"]
shield_vals["Corpus Amalgam"] = shield_vals["Corpus"]
shield_vals["Infested"] = shield_vals["Infestation"]
shield_vals["Infested Deimos"] = shield_vals["Infestation"]
setmetatable(shield_vals, {
	__index = function () return {
		f1_coef = 0.0200,
		f1_expo = 1.75,
		f2_coef = 2.0000,
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

local damage_vals = {
	["Default"] = {
		f1_coef = 0.015,
		f1_expo = 1.55,
		f2_coef = 0,
		f2_expo = 0,
		final_mult = 1,
	},
	["Grineer"] = {
		f1_coef = 0.015,
		f1_expo = 1.75,
		f2_coef = 0.0075,
		f2_expo = 1.55,
		final_mult = 2,
	},
	["Corpus"] = {
		f1_coef = 0.015,
		f1_expo = 1.75,
		f2_coef = 0.0075,
		f2_expo = 1.55,
		final_mult = 2,
	},
	["Techrot"] = {
		f1_coef = 0.015,
		f1_expo = 1.75,
		f2_coef = 0.0075,
		f2_expo = 1.55,
		final_mult = 2,
	},
	["Infestation"] = {
		f1_coef = 0.015,
		f1_expo = 1.55,
		f2_coef = 0,
		f2_expo = 0,
		final_mult = 3,
	}
}
damage_vals["Kuva Grineer"] = damage_vals["Grineer"]
damage_vals["Corpus Amalgam"] = damage_vals["Corpus"]
damage_vals["Infested"] = damage_vals["Infestation"]
damage_vals["Infested Deimos"] = damage_vals["Infestation"]
setmetatable(damage_vals, {
	__index = function () return {
		f1_coef = 0.015,
		f1_expo = 1.55,
		f2_coef = 0,
		f2_expo = 0,
		final_mult = 1,
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
	if not enemy.Stats.Attacks or #enemy.Stats.Attacks == 0 then
	    return
	end
	
	Infobox=Infobox:group():header("Attacks")
	Infobox=Infobox:row('DamageMultiplier', '[[Enemy_Level_Scaling#Damage|Damage Scale]]', '--', 'damage-multiplier')
			
	for i, attackData in ipairs(enemy.Stats.Attacks or {}) do
		local attack = 'Attack'..i
		local elementOrder = {
			Impact = 1, Puncture = 2, Slash = 3, Heat = 4, Toxin = 5,
			Electricity = 6, Cold = 7, Blast = 8, Corrosive = 9, Gas = 10,
			Magnetic = 11, Radiation = 12, Viral = 13, Void = 14,
			Tau = 15, True = 16
		}
		local elems = {}
		
		local highestDmgDistr = -1
		local highestDmgDistrType
		for damageType, distr in pairs(attackData.DamageDistribution) do
			if highestDmgDistr < distr then
				highestDmgDistr = distr
				highestDmgDistrType = damageType
			-- Code to cover damage distribution bias according to elementOrder, if there's two distribution of the same value
			elseif highestDmgDistr == distr and elementOrder[damageType] < elementOrder[highestDmgDistrType] then 
				highestDmgDistrType = damageType
			end
			table.insert(elems, damageType)
		end
		
		table.sort(elems, function(a, b)
			local orderA = elementOrder[a] or 999
			local orderB = elementOrder[b] or 999
			if orderA == orderB then
				return tostring(a) < tostring(b) -- alphabetical for unlisted (or ties)
			else
				return orderA < orderB
			end
		end)
		
		local total = attackData.TotalDamage
		local multishot = attackData.Multishot or 1
		local multihit = attackData.Multihit or 1
		local note = attackData.Note or ''
		local fixedDamage = attackData.FixedDamage and 'true' or 'false'
		local attackStatistics = ''
		
		if (attackData.Multishot) then
			attackStatistics = attackStatistics .. ('  
[[Multishot]]: %d (%s DMG / Shot)'):format(
				attackData.Multishot, 
				fixedDamage,
				Math.round(total, 0.01),
				Math.round(total, 0.01)
			)
		end
		
		if (attackData.Multihit) then
			attackStatistics = attackStatistics .. ('  
[[Multihit]]: %d (%s DMG / Hit)'):format(
				attackData.Multihit, 
				fixedDamage,
				Math.round(total, 0.01),
				Math.round(total, 0.01)
			)
		end
		
		if (attackData.BurstCount) then
			attackStatistics = attackStatistics .. ('  
[[:Category:Burst Weapons|Burst Count]]: %d'):format(attackData.BurstCount)
		end
		
		if (attackData.StatusChance) then
			attackStatistics = attackStatistics .. ('  
[[Status Chance]]: %.2f%%'):format(100 * attackData.StatusChance)
		end
		
		if (fixedDamage == "true") then
			attackStatistics = attackStatistics .. '  
Damage is Fixed'
		end
		
		if (attackData.Note) then
			attackStatistics = attackStatistics .. ('  
%s'):format(attackData.Note)
		end

		Infobox=Infobox
			-- Total Damage
			:row(
				attack..'TotalDamage', 
				attackData.AttackName,
				('%s (%s%s%%)[[Category:%s Damage Enemies]]%s'):format(
					fixedDamage,
					Math.formatnum(total * multishot * multihit),
					Math.formatnum(total * multishot * multihit),
					Tooltip.icon(highestDmgDistrType,'DamageTypes', true),
					Math.round(100 * highestDmgDistr, 0.01),
					highestDmgDistrType,
					attackStatistics
				), 
				'total-damage'
			)
			
		-- Damage Distribution Breakdown
		-- if highestDmgDistr ~= 1 then
		Infobox=Infobox:hgroup()
			for _, elem in ipairs(elems) do Infobox=Infobox
				:row(
					attack..elem,
					nil, 
					attackData.DamageDistribution[elem] and Tooltip.icon(elem, 'DamageTypes', true) ..
						('%s'):format(
							fixedDamage,
							Math.formatnum(attackData.DamageDistribution[elem] * total),
							Math.formatnum(attackData.DamageDistribution[elem] * total)
						), 
					elem
				)
			end Infobox=Infobox
			:done()
		-- end
		
			-- As of 35.0.9, enemies no longer deal critical damage. 
			--:row(attack..'CritChance', '[[Critical Hit|%s]]', attackData.CritChance and Math.round(100 * attackData.CritChance, 0.01)..'%', 'crit-chance')
			--:row(attack..'CritMultiplier', '[[Critical Hit|%s]]', concatif(attackData.CritMultiplier, 'x'), 'crit-multiplier')
			-- Update 40.0.2: Temporarily hiding the stats below.
			-- :row(attack..'BurstCount', '%s', attackData.BurstCount, 'burst-count')
			-- :row(attack..'ChargeTime', '[[Fire Rate#Charged Weapons|%s]]', concatif(attackData.ChargeTime, ' s'), 'charge-time')
			-- :row(attack..'Falloff', '[[Damage Falloff|%s]]', attackData.Falloff and ('100%% damage up to %s m  
%.0f%% damage at %s m  
%.0f%% max reduction'):format(attackData.Falloff.StartRange, 100 * (1 - (attackData.Falloff.Reduction or 1)), attackData.Falloff.EndRange, 100 * (attackData.Falloff.Reduction or 1)), 'damage-falloff')
			-- :row(attack..'Multishot', '[[Multishot|%s]]', attackData.Multishot and ('%d (%s damage per projectile)'):format(attackData.Multishot, Math.round(total, 0.01)), 'multishot')
			-- :row(attack..'Range', '%s', concatif(attackData.Range, ' m'), 'range')
			-- :row(attack..'Magazine', '[[Ammo#Magazine Capacity|%s]]', attackData.Magazine, 'magazine-size')
			-- :row(attack..'Reload', '[[Reload|%s]]', concatif(attackData.Reload, ' s'), 'reload-time')
			-- :row(attack..'ShotSpeed', '[[Projectile Speed|%s]]', concatif(attackData.ShotSpeed, ' m/s'), 'projectile-speed')
			-- :row(attack..'ShotType', '%s', attackData.ShotType, 'projectile-type')
	end
	Infobox=Infobox:done()
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

	local faction, overguard, shield, health, armor, affinity, baseLevel, spawnLevel, steelPathHealthBonus, archimedeaHealthBonus
	local eximusAffinity, eximusShield, eximusHealth, eximusArmor, eximusOverguard
	local isOverguardEnemy, eximusDefault, steelPathDefault, empoweredDefault, factionScaling
	
	-- Retrieve arguments from input, if any.
	shield = (args['Shields'] or ''):gsub(',', '')
	health = (args['Health'] or ''):gsub(',', '')
	armor = (args['Armor'] or ''):gsub(',', '')
	affinity = (args['Affinity'] or ''):gsub(',', '')
	steelPathShieldBonus = (args['SteelPathHealthBonus'] or ''):gsub(',', '')
	steelPathHealthBonus = (args['SteelPathHealthBonus'] or ''):gsub(',', '')
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
	baseLevel = tonumber(args['BaseLevel']) or enemy.Stats.BaseLevel
	spawnLevel = tonumber(args['SpawnLevel']) or enemy.Stats.SpawnLevel
	steelPathShieldBonus = tonumber(steelPathShieldBonus) or enemy.Stats.SteelPathShieldBonus
	steelPathHealthBonus = tonumber(steelPathHealthBonus) or enemy.Stats.SteelPathHealthBonus
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

	-- [[MediaWiki:Gadget-enemyinfoboxslider-dev.js]] will try to update all ids at once so adding
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
		(not(steelPathShieldBonus) or steelPathShieldBonus == 0) and '0' or '',
		(not(steelPathHealthBonus) or steelPathHealthBonus == 0) and '0' or '',
		(not(archimedeaHealthBonus) or archimedeaHealthBonus == 0) and '0' or '',
		
		''.. (eximusAffinity and eximusAffinity or 0) ..'',
		''.. (eximusOverguard and eximusOverguard or 0) ..'',
		''.. (eximusShield and eximusShield or 0) ..'',
		''.. (eximusHealth and eximusHealth or 0) ..'',
		''.. (eximusArmor and eximusArmor or 0) ..'',

		''..health_vals[faction].f1_coef..'',
		''..health_vals[faction].f1_expo..'',
		''..health_vals[faction].f2_coef..'',
		''..health_vals[faction].f2_expo..'',

		''..shield_vals[faction].f1_coef..'',
		''..shield_vals[faction].f1_expo..'',
		''..shield_vals[faction].f2_coef..'',
		''..shield_vals[faction].f2_expo..'',

		''..armor_vals[faction].f1_coef..'',
		''..armor_vals[faction].f1_expo..'',
		''..armor_vals[faction].f2_coef..'',
		''..armor_vals[faction].f2_expo..'',

		''..overguard_vals[faction].f1_coef..'',
		''..overguard_vals[faction].f1_expo..'',
		''..overguard_vals[faction].f2_coef..'',
		''..overguard_vals[faction].f2_expo..'',
		
		''..damage_vals[faction].f1_coef..'',
		''..damage_vals[faction].f1_expo..'',
		''..damage_vals[faction].f2_coef..'',
		''..damage_vals[faction].f2_expo..'',
		''..damage_vals[faction].final_mult..'',
		
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

	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json', 'WARFRAME Wiki:L10n/weapons.json'):addClass('type-enemyBox-dev')
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
			
			:srow('SteelPathShieldBonus', '[[The Steel Path|SP]] [[Shield]] Bonus', 'steel_path_shield_bonus', steelPathShieldBonus)
			:srow('SteelPathHealthBonus', '[[The Steel Path|SP]] [[Health]] Bonus', 'steel_path_health_bonus', steelPathHealthBonus)
			:srow('ArchimedeaHealthBonus', '[[Archimedea|Arch.]] [[Health]] Bonus', 'archimedea_health_bonus', archimedeaHealthBonus)
			
			:srow('EHP', frame:expandTemplate{title='text',args={'','Effective Hit Points (EHP)',hover='Effective amount of hit points, taking health, armor and shields into account.',cursor='help'}}, 'out_ehp', '––')
		:done()

	attackGroup(Infobox, enemy)

	Infobox:group():header('[[Enemy Level Scaling|Level Scaling]]')
			:caption('Slider', table.concat(vals)..'

JavaScript not loaded. Please make sure the ⧼gadget-enemyinfoboxslider⧽ is enabled and refresh your browser using Ctrl+F5 on PC or Shift+R on Mac.

')
			:srow('SelectedLevel', frame:expandTemplate{title='text', args={'','Selected Level',hover='For higher enemy levels input the value manually.',cursor='help'}}, 'out_lvl', '––', '')
			:srow('IsEximus', '[[Eximus]]', 'is_eximus', '––')
			:srow('IsSteelPath', '[[Steel Path]]', 'is_steel_path', '––')
			:srow('IsEmpowered', '[[Empowered Enemies]]', 'is_empowered', '––')
			:srow('PlayerCount', frame:expandTemplate{title='text', args={'','Player Count',hover='If Empowered Enemies is enabled, the Health and Shields of enemies will multiply depending on how many players are in a squad. 1 Player: 2.5x, 2 Players: 3.0x, 3 Players: 3.5x, 4 Players: 4.0x.',cursor='help'}}, 'player_count', '––')
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

-- TODO: Implement this function based on [[Template:EnemyHoriz]] contents
buildHorizontalInfobox = function(frame)
	return error()
end
}
```

