---	Outputs a CSV text based on data in Module:Weapons/data. See [[Weapon_Comparison/CSV]]
--	for sample output.
--	
--	@module		weapons/csv
--	@alias		p
--	@author		[[User:Cephalon Scientia]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@release	stable
--	

local p = {}

local Weapon = require('Module:Weapons')
local WeaponData = require('Module:Weapons/data')

getmetatable(WeaponData)._partitions = { }

-- Updating how to loop over data to optimize getting all the desired attack data
-- from all the desired weapons.
getmetatable(WeaponData).__pairs = function(self)
		local temp = {}
		for i, slot in ipairs(getmetatable(self)._partitions) do
			temp[i] = mw.loadData(getmetatable(self)._pageTitle..'/'..slot)
		end
		
		function next(t, key)
			return pairs(t)(t, key)
		end

		function __next(t, key)
			if not key then
				return next(t[1])
			else
				for i = 1, #t - 1 do
					if t[i][key] then
						if next(t[i], key) then
							return next(t[i], key)
						else
							return next(t[i + 1])
						end
					end
				end
				return next(t[#t], key)
			end
		end

		return __next, temp, nil
	end

---	Generic CSV builder for weapon stat comparison.
--	@function		p._csvWeaponComparisonTable
--	@param			{table} columnDefinition Table of column keys that directly map to getter function names in [[Module:Weapons]]
--	@param			{string} weaponSlot Name of weapon slot to include in CSV output
--	@return			{string} Preformatted text of CSV text
function p._csvWeaponComparisonTable(columnDefinition, weaponSlot)
	local tableEntryTemplate = {}	-- Would look like '%s,%s,%s'
	
	for i, _ in ipairs(columnDefinition) do table.insert(tableEntryTemplate, '%s,') end
	tableEntryTemplate[#tableEntryTemplate] = '%s'	-- Last column
	tableEntryTemplate = table.concat(tableEntryTemplate)
	
	local csvResult = {}
	table.insert(csvResult, string.format(tableEntryTemplate, unpack(columnDefinition)))
	
	for _, weaponEntry in pairs(WeaponData) do
		if (weaponEntry['Slot'] == weaponSlot and not weaponEntry['_IgnoreInCSV']) then
			-- Going through all the possible Attack keys and adding them to CSV
			for i, attackEntry in ipairs(weaponEntry['Attacks']) do
				local tableEntryValues = {}
				
				for _, keyName in ipairs(columnDefinition) do
					local v = Weapon._statRead(weaponEntry, i, keyName)
					-- Serializing table to a string
					if (type(v) == 'table') then
						v = Weapon._statFormat(weaponEntry, i, keyName)
					end
					table.insert(tableEntryValues, tostring(v))
				end
				
				local tableEntry = string.format(tableEntryTemplate, unpack(tableEntryValues))
				table.insert(csvResult, tableEntry)
			end
		end
	end
	
	return table.concat(csvResult, '\n')
end
	
---	Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
--	@function		p._csvGunComparisonTable
--	@param			{string} slot Gun slot name
--							(e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", "Amp", "Railjack Turret", "Railjack Ordnance")
--	@returns		{string} Preformatted text of CSV text
function p._csvGunComparisonTable(slot)
	-- Weapon slots allowed in resultant table, mapped to the database subpage name
	local weaponSlotFilter = {
		['Primary'] = 'primary',
		['Secondary'] = 'secondary',
		['Robotic'] = 'companion',
		['Arch-Gun'] = 'archwing',
		['Arch-Gun (Atmosphere)'] = 'archwing',
		['Amp'] = 'modular',
		['Railjack Turret'] = 'railjack',
		['Railjack Ordnance'] = 'railjack' 
	}
	
	assert(weaponSlotFilter[slot] ~= nil, 
			'p.csvGunComparisonTable(frame): Invalid slot name, must be "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", "Amp", "Railjack Turret", or "Railjack Ordnance"')
	
	-- Limiting to only loading one database partition at a time for performance
	getmetatable(WeaponData)._partitions = { weaponSlotFilter[slot] }
	
	-- Header names will also be key names to getter function maps in Module:Weapons
	-- Update this if you want more CSV columns
	local tableHeader = { 
		'Name',
		'Trigger',
		'AttackName',
		'Impact',
		'Puncture',
		'Slash',
		'Cold',
		'Electricity',
		'Heat',
		'Toxin',
		'Blast',
		'Corrosive',
		'Gas',
		'Magnetic',
		'Radiation',
		'Viral',
		'Void',
		'BaseDamage',
		'BaseDps',
		'TotalDamage',
		'CritChance',
		'CritMultiplier',
		'AvgShotDmg',
		'BurstDps',
		'SustainedDps',
		'LifetimeDmg',
		'StatusChance',
		'ForcedProcs',
		'AvgProcCount',
		'AvgProcPerSec',
		'Multishot',
		'FireRate',
		'EffectiveFireRate',
		'BurstCount',
		'BurstDelay',
		'BurstReloadDelay',
		'ChargeTime',
		'Disposition',
		'Mastery',
		'Magazine',
		'AmmoPickup',
		'AmmoMax',
		'AmmoCost',
		'Reload',
		'IncarnonCharges',
		'IncarnonChargeGain',
		'ShotType',
		'ShotSpeed',
		'PunchThrough',
		'Accuracy',
		'Introduced',
		'IntroducedDate',
		'Slot',
		'Class',
		'AmmoType',
		'Range',
		'InternalName',
		'Family',
		'FalloffStart',
		'FalloffEnd',
		'FalloffReduction',
		'AvgSpread',
		'MinSpread',
		'MaxSpread',
		'IsSilent',
		'CodexSecret'
	}
	
	return p._csvWeaponComparisonTable(tableHeader, slot)
end

---	Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
--	@function		p.csvGunComparisonTable
--	@param			{table} frame Frame object w/ first argument being gun slot name
--							(e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", or "Amp")
--	@returns		{string} Preformatted text of CSV text
function p.csvGunComparisonTable(frame)
	return '<pre>'..p._csvGunComparisonTable(frame.args[1])..'</pre>'
end

---	Builds a CSV table of all WARFRAME's melees.
--	@function		p._csvMeleeComparisonTable
--	@returns		{string} Preformatted text of CSV text
function p._csvMeleeComparisonTable()
	local dbPartitions = { 'melee', 'modular' }
	getmetatable(WeaponData)._partitions = dbPartitions
	
	-- Header names will also be key names to getter function maps in Module:Weapons
	-- Update this if you want more CSV columns
	local tableHeader = { 
		'Name',
		'AttackName',
		'Impact',
		'Puncture',
		'Slash',
		'Cold',
		'Electricity',
		'Heat',
		'Toxin',
		'Blast',
		'Corrosive',
		'Gas',
		'Magnetic',
		'Radiation',
		'Viral',
		'Void',
		'BaseDamage',
		'TotalDamage',
		'CritChance',
		'CritMultiplier',
		'AvgShotDmg',
		'StatusChance',
		'ForcedProcs',
		'AvgProcCount',
		'FireRate',
		'Disposition',
		'Mastery',
		'Introduced',
		'IntroducedDate',
		'Slot',
		'Class',
		'MeleeRange',
		'SweepRadius',
		'ComboDur',
		'InternalName',
		'Family',
	}
	
	return p._csvWeaponComparisonTable(tableHeader, 'Melee')
end

---	Builds a CSV table of all WARFRAME's melees.
--	@function		p._csvMeleeComparisonTable
--	@param			{table} frame Frame object
--	@returns		{string} Preformatted text of CSV text
function p.csvMeleeComparisonTable(frame)
	return '<pre>'..p._csvMeleeComparisonTable()..'</pre>'
end

return p
