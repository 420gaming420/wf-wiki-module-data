local p = {}

local Table = require("Module:Table")
local WeapData = Table.deepCopy(mw.loadData("Module:Weapons/data").Weapons)

---	Inserts weapon into appropriate subtable
--	@function		insert
--	@param			{table} t Table to insert into
--	@param			{string} key What subtable to insert into
--	@param			{string} name Weapon name
--	@param			{number} val Weapon stat value
--	@returns		{table} t New table
local function insertWeapon(t, key, name, val)
	local exist = false
	
	for _, v in ipairs(t[key]) do
		if v[1] == val then
			table.insert(v[2], name)
			exist = true
			break
		end
	end
	if not exist then
		table.insert(t[key], {val, {name}})
	end
	
	return t
end

---	Gets the top percentile and top 3 stats of a specified category of weapons.
--	@function		getWeaponStats
--	@param			{string} slot Weapon slot (primary, secondary, etc.)
--	@param			{string} classes Weapon class
--	@param			{string} triggers Weapon trigger type
--	@param			{number} att Weapon attack number as stored in <code>/data</code> (1 for "Attack1", 2 for "Attack2", etc.)
--	@param			{number} max Maximum number of Attack keys
--	@returns		{table} vals3 Table of percentiles
--	@returns		{table} top3 Table of top 3 weapons for each stat
--	@returns		{number} count Number of weapons that fit specified category
--	@returns		{table} Weapons Weapons that fit specified cat
local function getWeaponStats(slot, classes, triggers, att, max)
	local attacks = { 'Normal Attack', 'Secondary Attack', 'Charge Attack', 
		'Charge Area Attack', 'Area Attack', 'Secondary Charge Attack', 
		'Secondary Area Attack', 'Charged Throw Attack', 'Throw Attack' }
	local count, temp, i, specific = 0, 0, 0
	local vals, vals2, vals3, top3, stats
	local Weapons = {}
	
	if slot == 'Melee' or slot == 'Arch-Melee' or slot == 'Arch-Gun' then
		vals = { Damage = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, MeleeRange = {}, Disposition = {} }
		vals2 = { Damage = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, MeleeRange = {}, Disposition = {} }
		vals3 = { Damage = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, MeleeRange = {}, Disposition = {} }
		top3 = { Damage = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, MeleeRange = {}, Disposition = {} }
		stats = { 'Damage', 'CritChance', 'CritMultiplier',
			'StatusChance', 'FireRate', 'MeleeRange', 'Disposition' }
	else
		vals = { Damage = {}, Multishot = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, Magazine = {}, MaxAmmo = {}, Reload = {}, Disposition = {} }
		vals2 = { Damage = {}, Multishot = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, Magazine = {}, MaxAmmo = {}, Reload = {}, Disposition = {} }
		vals3 = { Damage = {}, Multishot = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, Magazine = {}, MaxAmmo = {}, Reload = {}, Disposition = {} }
		top3 = { Damage = {}, Multishot = {}, CritChance = {}, CritMultiplier = {},
			StatusChance = {}, FireRate = {}, Magazine = {}, MaxAmmo = {}, Reload = {}, Disposition = {} }
		stats = { 'Damage', 'Multishot', 'CritChance', 'CritMultiplier',
			'StatusChance', 'FireRate', 'Magazine', 'MaxAmmo', 'Reload', 'Disposition' }
	end
	
	for name, weapon in pairs(WeapData) do
		specific = not weapon.Class:find('Kitgun')
		if classes then specific = Table.contains(classes, weapon.Class) end
		if triggers then specific = specific and Table.contains(triggers, weapon.Trigger) end
		if not(weapon._IgnoreEntry) and weapon.Slot == slot and specific then
			table.insert(Weapons, {Name = name, Family = weapon.Family or name, Image = weapon.Image or "Panel.png"})
			if weapon['Attack'..att] and not((weapon['Attack'..att].AttackName or attacks[att]):lower():find('aoe')) then
				count = count + 1
				for _, stat in ipairs(stats) do
					temp = 0
					if stat == 'Damage' then
						for _, damage in pairs(weapon['Attack'..att].Damage) do
							temp = temp + damage
						end
						temp = temp * (weapon['Attack'..att].Multishot or weapon.Multishot or 1)
					else
						temp = weapon['Attack'..att][stat] or weapon[stat] or 1
					end
					if stat == 'Reload' then temp = 1 / temp end
					top3 = insertWeapon(top3, stat, name, temp)
					
					i = '"'..temp..'"'
					if not vals[stat][i] then vals[stat][i] = 0 end
					vals[stat][i] = vals[stat][i] + 1
				end
			end
			if att == max then WeapData[name] = nil end
		end
	end
	
	for _, stat in ipairs(stats) do
		for val, c in pairs(vals[stat]) do
			i = val:gsub('"', '')
			table.insert(vals2[stat], { tonumber(i), c / count })
		end
		table.sort(vals2[stat], function(a, b) return a[1] < b[1] end)
		
		for i, val in ipairs(vals2[stat]) do
			if i > 1 then val[2] = val[2] + vals2[stat][i - 1][2] end
		end
		table.sort(vals2[stat], function(a, b) return a[1] > b[1] end)
	
		i = 0
		-- 0.9, 0.75, 0.6, 0.525, 0.45, 0.3, 0.15
		-- Comparing a specific stat of a weapon against the same state of different weapons
		-- of the same class and trigger type
		for j, val in ipairs(vals2[stat]) do
			if ({0.9, 0.75, 0.6, 0.525, 0.45, 0.3, 0.15})[i + 1] - val[2] > 0 then table.insert(vals3[stat], vals2[stat][j - 1][1]); i = i + 1 end
			--if 0.9 - val[2] - i/8 > 0 then table.insert(vals3[stat], vals2[stat][j - 1][1]); i = i + 1 end
			if i > 6 then break; end
		end
		
		i = #vals3[stat]
		for j = 1, math.ceil((7 - i) / 2) do
			table.insert(vals3[stat], 1, "math.huge")
		end
		for j = 1, math.floor((7 - i) / 2) do
			table.insert(vals3[stat], "-math.huge")
		end
	end
	vals = nil
	vals2 = nil
	
	for _, v in pairs(top3) do
		table.sort(v, function(a, b) return a[1] > b[1] end)
		for i = #v, 4, -1 do
			table.remove(v, i)
		end
	end
	if top3.Reload and top3.Reload[1] then top3.Reload[1][1] = 1 / top3.Reload[1][1] end
	if top3.Reload and top3.Reload[2] then top3.Reload[2][1] = 1 / top3.Reload[2][1] end
	if top3.Reload and top3.Reload[3] then top3.Reload[3][1] = 1 / top3.Reload[3][1] end
	
	return vals3, top3, count, Weapons
end

---	Dumps a preprocessed table of weapon stats and info to copy into M:Weapons/ppdata.
--	Invoked on [[Module:Weapons/ppdata/doc]].
--	@function		p.ppData
--	@param			{table} frame Frame object
--	@returns		{string} ppdata preprocessed wikitext string in Lua table formatting
function p.ppData(frame)
	-- Defining how we structure resultant table for sorting weapons by slot, class, and trigger types
	local subData = {
		Primary = {
			{	Type = 'Arm Cannons',
				Classes = {'Arm Cannon'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Assault Rifles',
				Classes = {'Rifle'},
				Triggers = {
					{	Name = 'Active',
						{'Active'},
						Weapons = {},
					},
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Auto-Burst',
						{'Auto Burst'},
						Weapons = {},
					},
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Burst',
						{'Burst'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Held',
						{'Held'},
						Weapons = {},
					},
					{	Name = 'Hybrid',
						{'Auto / Semi', 'Burst / Semi', 'Burst / Semi / Auto', 'Auto / Charge'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Bows',
				Classes = {'Bow', 'Crossbow', 'Exalted Weapon'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Hybrid',
						{'Semi / Burst'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Launchers',
				Classes = {'Launcher'},
				Triggers = {
					{	Name = 'Active',
						{'Active'},
						Weapons = {},
					},
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Shotguns',
				Classes = {'Shotgun'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Duplex',
						{'Duplex'},
						Weapons = {},
					},
					{	Name = 'Held',
						{'Held'},
						Weapons = {},
					},
					{	Name = 'Hybrid',
						{'Auto / Semi'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Sniper Rifles',
				Classes = {'Sniper Rifle'},
				Triggers = {
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Spearguns',
				Classes = {'Speargun'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Auto Charge', 'Charge'},
						Weapons = {},
					},
				},
			},
		},

		Secondary = {
			{	Type = 'Crossbows',
				Classes = {'Crossbow'},
				Triggers = {
					{	Name = 'Hybrid',
						{'Burst / Charge'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Dual Pistols',
				Classes = {'Dual Pistols', 'Exalted Weapon'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Burst',
						{'Burst'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Dual Shotguns',
				Classes = {'Dual Shotguns'},
				Triggers = {
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Pistols',
				Classes = {'Pistol', 'Exalted Weapon'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Burst',
						{'Burst'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Duplex',
						{'Duplex'},
						Weapons = {},
					},
					{	Name = 'Held',
						{'Held'},
						Weapons = {},
					},
					{	Name = 'Hybrid',
						{'Auto / Burst', 'Semi / Charge'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Shotgun Sidearms',
				Classes = {'Shotgun Sidearm'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Thrown',
				Classes = {'Thrown'},
				Triggers = {
					{	Name = 'Active',
						{'Active'},
						Weapons = {},
					},
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Hybrid',
						{'Auto / Semi'},
						Weapons = {},
					},
				},
			},
		},

		Melee = {
			{	Type = 'Brawler',
				Classes = {
					{	Name = 'Claws',
						{'Claws'},
						Weapons = {},
					},
					{	Name = 'Fist',
						{'Fist'},
						Weapons = {},
					},
					{	Name = 'Sparring',
						{'Sparring'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Daggers',
				Classes = {
					{	Name = 'Dagger',
						{'Dagger'},
						Weapons = {},
					},
					{	Name = 'Dual Daggers',
						{'Dual Daggers'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Heavies',
				Classes = {
					{	Name = 'Heavy Blade',
						{'Heavy Blade'},
						Weapons = {},
					},
					{	Name = 'Hammer',
						{'Hammer'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Ranged',
				Classes = {
					{	Name = 'Blade and Whip',
						{'Blade and Whip'},
						Weapons = {},
					},
					{	Name = 'Glaive',
						{'Glaive'},
						Weapons = {},
					},
					{	Name = 'Gunblade',
						{'Gunblade'},
						Weapons = {},
					},
					{	Name = 'Whip',
						{'Whip'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Staves',
				Classes = {
					{	Name = 'Nunchaku',
						{'Nunchaku'},
						Weapons = {},
					},
					{	Name = 'Polearm',
						{'Polearm'},
						Weapons = {},
					},
					{	Name = 'Scythe',
						{'Scythe'},
						Weapons = {},
					},
					{	Name = 'Staff',
						{'Staff'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Swords',
				Classes = {
					{	Name = 'Dual Swords',
						{'Dual Swords'},
						Weapons = {},
					},
					{	Name = 'Machete',
						{'Machete'},
						Weapons = {},
					},
					{	Name = 'Nikana',
						{'Nikana'},
						Weapons = {},
					},
					{	Name = 'Rapier',
						{'Rapier'},
						Weapons = {},
					},
					{	Name = 'Sword',
						{'Sword'},
						Weapons = {},
					},
					{	Name = 'Sword and Shield',
						{'Sword and Shield'},
						Weapons = {},
					},
					{	Name = 'Two-Handed Nikana',
						{'Two-Handed Nikana'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Miscellaneous',
				Classes = {
					{	Name = 'Assault Saw',
						{'Assault Saw'},
						Weapons = {},
					},
					{	Name = 'Exalted Weapon',
						{'Exalted Weapon'},
						Weapons = {},
					},
					{	Name = 'Tonfa',
						{'Tonfa'},
						Weapons = {},
					},
					{	Name = 'Warfan',
						{'Warfan'},
						Weapons = {},
					},
				},
			},
		},

		Archwing = {
			{	Type = 'Archwing Weapons',
				Classes = {
					{	Name = 'Arch-Gun',
						{'Arch-Gun'},
						Weapons = {},
					},
					{	Name = 'Arch-Melee',
						{'Arch-Melee'},
						Weapons = {},
					},
					{	Name = 'Exalted Weapon',
						{'Exalted Weapon'},
						Weapons = {},
					},
				},
			},
		},

		Robotic = {
			{	Type = 'Assault Rifles',
				Classes = {'Rifle'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
					{	Name = 'Auto-Spool',
						{'Auto-Spool'},
						Weapons = {},
					},
					{	Name = 'Burst',
						{'Burst'},
						Weapons = {},
					},
					{	Name = 'Charge',
						{'Charge'},
						Weapons = {},
					},
					{	Name = 'Held',
						{'Held'},
						Weapons = {},
					},
					{	Name = 'Semi-Auto',
						{'Semi-Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Shotguns',
				Classes = {'Shotgun'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Sniper Rifles',
				Classes = {'Sniper Rifle'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Pistols',
				Classes = {'Pistol'},
				Triggers = {
					{	Name = 'Burst',
						{'Burst'},
						Weapons = {},
					},
				},
			},
			{	Type = 'Melee',
				Classes = {'Glaive'},
				Triggers = {
					{	Name = 'Auto',
						{'Auto'},
						Weapons = {},
					},
				},
			},
		},
	}
	-- Defining what each weapon slot falls under which tabber in T:WeaponNav wikitable
	local WEAPON_SLOTS = {
		{'Primary', 'Primary'},
		{'Secondary', 'Secondary'},
		{'Melee', 'Melee'},
		{'Arch-Melee', 'Archwing'},
		{'Arch-Gun', 'Archwing'},
		{'Robotic', 'Robotic'},
	}
	local str = {'<pre>'}
	local percentiles, top3, count, data
	local breakLoops = false
	
	-- TODO: Refactor into smaller functions, I see a lot of repeated code
	for _, weapSlot in ipairs(WEAPON_SLOTS) do
		if weapSlot[1] == 'Melee' or weapSlot[1] == 'Arch-Melee' then
			percentiles, top3, count = getWeaponStats(weapSlot[1], nil, nil, 1, 2)
			if count >= 3 then
				subData[weapSlot[2]].Attack1 = {}
				subData[weapSlot[2]].Attack1.Percentiles = percentiles
				subData[weapSlot[2]].Attack1.Top3 = top3
			end
			for i, v in ipairs(subData[weapSlot[2]]) do
				for j, classes in ipairs(v.Classes) do
					mw.log('In Melee/Arch-Gun branch of p.ppData()')
					percentiles, top3, count, weaps = getWeaponStats(weapSlot[1], classes[1], nil, 1, 1)
					mw.logObject(weaps)
					if count >= 3 then
						subData[weapSlot[2]][i].Classes[j].Attack1 = {}
						subData[weapSlot[2]][i].Classes[j].Attack1.Percentiles = percentiles
						subData[weapSlot[2]][i].Classes[j].Attack1.Top3 = top3
					end
					classes.Weapons = weaps
				end
			end
		elseif weapSlot[1] == 'Arch-Gun' then
			for i = 1, 7 do
				percentiles, top3, count = getWeaponStats(weapSlot[1], nil, nil, i, 8)
				if count >= 3 then
					subData[weapSlot[2]]['Attack'..i] = {}
					subData[weapSlot[2]]['Attack'..i].Percentiles = percentiles
					subData[weapSlot[2]]['Attack'..i].Top3 = top3
				end
			end
			for i, v in ipairs(subData[weapSlot[2]]) do
				for j, classes in ipairs(v.Classes) do
					for k = 1, 7 do
						mw.log('In Arch-Gun branch of p.ppData()')
						percentiles, top3, count, weaps = getWeaponStats(weapSlot[1], classes[1], nil, k, 7)
						mw.logObject(weaps)
						if count >= 3 then
							subData[weapSlot[2]][i].Classes[j]['Attack'..k] = {}
							subData[weapSlot[2]][i].Classes[j]['Attack'..k].Percentiles = percentiles
							subData[weapSlot[2]][i].Classes[j]['Attack'..k].Top3 = top3
						end
					end
					-- table.insert(weaps, {Name = 'Arquebex', Family = 'Arquebex', Image = 'ArquebexFixed.png'})
					classes.Weapons = weaps
				end
			end
		else
			for i = 1, 7 do
				percentiles, top3, count = getWeaponStats(weapSlot[1], nil, nil, i, 8)
				if count >= 3 then
					subData[weapSlot[2]]['Attack'..i] = {}
					subData[weapSlot[2]]['Attack'..i].Percentiles = percentiles
					subData[weapSlot[2]]['Attack'..i].Top3 = top3
				end
			end
			for i, v in ipairs(subData[weapSlot[2]]) do
				for j, triggers in ipairs(v.Triggers) do
					for k = 1, 7 do
						mw.log('In else branch of p.ppData()')
						percentiles, top3, count, weaps = getWeaponStats(weapSlot[1], v.Classes, triggers[1], k, 7)
						mw.logObject(weaps)
						if count >= 3 then
							subData[weapSlot[2]][i].Triggers[j]['Attack'..k] = {}
							subData[weapSlot[2]][i].Triggers[j]['Attack'..k].Percentiles = percentiles
							subData[weapSlot[2]][i].Triggers[j]['Attack'..k].Top3 = top3
						end
					end
					triggers.Weapons = weaps
				end
			end
		end
	end
	
	data = mw.dumpObject(subData):gsub('table#%d+ %{', '%{'):gsub('%["', '')
	-- Replacing string outputs with Lua code equilvalent for script execution
	data = data:gsub('"%]', ''):gsub('-nan', 'nil'):gsub('  ', '	'):gsub('inf', 'math.huge')
	data = data:gsub('"math.huge"', 'math.huge'):gsub('"%-math.huge"', '%-math.huge')
	table.insert(str, 'return '..data..'\n')
	table.insert(str, '</pre>')
	
	return frame:preprocess(table.concat(str, '\n'))
end

return p
