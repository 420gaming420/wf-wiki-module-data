local p = {}

local WeaponData = require('Module:Weapons/data')
local Polarity = require('Module:Polarity')
local Table = require('Module:Table')

p._REQUIRED_MELEE_STATS = {
	-- TODO: Update attack validation
	['Attacks'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Attacks' or 'Missing Attacks table'
	end,
	['BlockAngle'] = function(v)
		return (v ~= nil and v > 0 and v <= 100), (v ~= nil and v > 0 and v <= 100) and 'Valid BlockAngle' or 'Block angle must be a value between 0 exclusive and 100 inclusive'
	end,
	['Class'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Class' or 'Missing melee weapon class'
	end,
	['Disposition'] = function(v)
		return (v ~= nil and v >= 0.5 and v <= 1.55), (v ~= nil and v >= 0.5 and v <= 1.55) and 'Valid Disposition' or 'Disposition must be between 0.5-1.55; default should be 0.5'
	end,
	['FollowThrough'] = function(v)
		return (v ~= nil and v > 0 and v <= 1), (v ~= nil and v > 0 and v <= 1) and 'Valid FollowThrough' or 'Follow through must be a value between 0 exclusive and 1 exclusive'
	end,
	['HeavyAttack'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid HeavyAttack' or 'Heavy attack must be greater than 0'
	end,
	-- ['HeavySlamAttack'] = function(v)
	-- 	return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid HeavySlamAttack' or 'Heavy slam damage must be greater than 0'
	-- end,
	-- ['HeavySlamRadius'] = function(v)
	-- 	return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid HeavySlamRadius' or 'Heavy slam radius must be greater than 0'
	-- end,
	['Image'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Image' or 'Missing image'
	end,
	['InternalName'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid InternalName' or 'Missing InternalName'
	end,
	['Introduced'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Introduced' or 'Missing game version in which weapon was introduced in public build'
	end,
	['Link'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Link' or 'Missing article link of weapon'
	end,
	['Mastery'] = function(v)
		return (v ~= nil and v >= 0 and v <= 17), (v ~= nil and v >= 0 and v <= 17) and 'Valid Mastery' or 'Missing mastery rank unlock'
	end,
	['Name'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Name' or 'Missing weapon name'
	end,
	['MeleeRange'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid MeleeRange' or 'Melee range must be a value above 0'
	end,
	-- ['SlamAttack'] = function(v)
	-- 	return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid SlamAttack' or 'Slam attack must be greater than 0'
	-- end,
	-- ['SlamRadius'] = function(v)
	-- 	return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid SlamRadius' or 'Slam radius must be greater than 0'
	-- end,
	['SlideAttack'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid SlideAttack' or 'Slide attack must be greater than 0'
	end,
	['StancePolarity'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid StancePolarity' or 'Missing Stance Polarity'
	end,
	['Slot'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Slot' or 'Missing weapon slot'
	end,
	['WindUp'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid WindUp' or 'Heavy wind-up time must be above 0'
	end
}

p._REQUIRED_GUN_STATS = {
	['AmmoMax'] = function(v)
		return (v ~= nil and v >= 0), (v ~= nil and v >= 0) and 'Valid AmmoMax' or 'AmmoMax must be a value greater than or equal to 0'
	end,
	['AmmoPickup'] = function(v)
		return (v ~= nil and v >= 0), (v ~= nil and v >= 0) and 'Valid AmmoPickup' or 'AmmoPickup must be a value greater than or equal to 0'
	end,
	['Attacks'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Attacks' or 'Missing Attacks table'
	end,
	['Disposition'] = function(v)
		return (v ~= nil and v >= 0.5 and v <= 1.55), (v ~= nil and v >= 0.5 and v <= 1.55) and 'Valid Disposition' or 'Disposition must be between 0.5-1.55; default should be 0.5'
	end,
	-- Not all guns have Exilus slot
	-- ['ExilusPolarity'] = function(v)
	-- 	return (v ~= nil), (v ~= nil) and 'Valid ExilusPolarity' or 'Missing Exilus Polarity'
	-- end,
	['Image'] = function(v, entry)
		local pass = (v ~= nil and v == (entry.Name:gsub('%s', ''))..'.png')
		return pass, pass and 'Valid Image' or
				'Image should be in the form of "WeaponName.png"; current value: '..tostring(v)
	end,
	['IsSilent'] = function(v)
		return (type(v) == 'boolean' or v == nil), (type(v) == 'boolean' or v == nil) and 'Valid IsSilent' or 'IsSilent should be a boolean value or nil'
	end,
	['InternalName'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid InternalName' or 'Missing InternalName'
	end,
	['Introduced'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Introduced' or 'Missing game version in which weapon was introduced in public build'
	end,
	['Link'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Link' or 'Missing article link of weapon'
	end,
	['Magazine'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid Magazine' or 'Magazine must be a value above 0'
	end,
	['Mastery'] = function(v)
		return (v ~= nil and v >= 0 and v <= 17), (v ~= nil and v >= 0 and v <= 17) and 'Valid Mastery' or 'Missing mastery rank unlock and mastery has to between 0 and 17 inclusive'
	end,
	['Name'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Name' or 'Missing weapon name'
	end,
	['Reload'] = function(v)
		return (v ~= nil and v > 0), (v ~= nil and v > 0) and 'Valid Reload' or 'Missing reload time or reload time has to be above 0'
	end,
	['Trigger'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Trigger' or 'Missing trigger type of weapon'
	end,
	['Slot'] = function(v)
		return (v ~= nil), (v ~= nil) and 'Valid Slot' or 'Missing weapon slot'
	end
}

p._REQUIRED_ATTACK_STATS = {
--[[
	['Accuracy'] = function(attack)
		-- AoE attacks always hit enemy if they are within range
		if (attack['Type'] == 'AoE') then return true, 'AoE weapons do not need Accuracy key' end
		local result = (attack['Accuracy'] ~= nil and attack['Accuracy'] > 0)
		return result, result and 'Valid Accuracy' or 'Accuracy rating must be be a value above 0'
	end,
]]--
	['CritChance'] = function(attack)
		local result = (attack['CritChance'] ~= nil and attack['CritChance'] >= 0 and attack['CritChance'] <= 1)
		return result, result and 'Valid CritChance' or 'Missing critical chance or crit chance must be between 0 and 1 inclusive'
	end,
	['CritMultiplier'] = function(attack)
		local result = (attack['CritMultiplier'] ~= nil and attack['CritMultiplier'] >= 0)
		return result, result and 'Valid CritMultiplier' or 'Missing critical damage multiplier or crit multi has to be greater than 0'
	end,
	['Damage'] = function(attack)
		if (attack['Damage'] == nil) then
			return false, 'Missing damage table'
		end
		for damageType, value in pairs(attack['Damage']) do
			if (value < 0) then
				return false, damageType..' Damage has to be greater than or equal to 0'
			end
		end
		return true, 'Valid Damage'
	end,
	['FireRate'] = function(attack)
		local result = (attack['FireRate'] ~= nil and attack['FireRate'] >= 0)
		return result, result and 'Valid FireRate' or 'Missing fire rate or fire rate has to be greater than 0'
	end,
	['StatusChance'] = function(attack)
		local result = (attack['StatusChance'] ~= nil and attack['StatusChance'] >= 0 and attack['StatusChance'] <= 1)
		return result, result and 'Valid StatusChance' or 'Missing status chance or status chance must be between 0 and 1 inclusive'
	end,
--[[
	['Trigger'] = function(attack)
		local triggers = { 'Semi', 'Semi-Auto', 'Auto-Spool', 'Burst', 'Charge' }
		local result = (attack['Trigger'] ~= nil and Table.contains(triggers, attack['Trigger']))
		return result, result and 'Valid Trigger type' or 'Missing trigger type or trigger type not one of the following:'..table.concat(triggers, ', ')
	end,
]]--
}

-- Slot values of weapon entries that do not have Disposition values OR
-- a minimum Mastery Rank to use
local DISPOSITION_MASTERY_EXEMPTIONS_SLOTS = {
	-- True is a dummy value; treating this table as a set
	['Archmelee'] = true,
	['Railjack Turret'] = true,
	['Railjack Ordnance'] = true,
	['Amp'] = true,
	['Gear'] = true,
	['Unique'] = true,
	['Beast'] = true,
	['Hound'] = true,
	['Nech-Melee'] = true
}

-- Class values of weapon entries that do not have Disposition values OR
-- a minimum Mastery Rank to use
local DISPOSITION_MASTERY_EXEMPTIONS_CLASSES = {
	['Exalted Weapon'] = true,
	['Zaw Dagger / Staff'] = true,
	['Zaw Machete / Polearm'] = true,
	['Zaw Rapier / Polearm'] = true,
	['Zaw Scythe / Heavy Blade'] = true,
	['Zaw Sword / Polearm'] = true,
	['Zaw Sword / Staff'] = true,
	['Zaw Machete / Hammer'] = true,
	['Zaw Nikana / Staff'] = true,
	['Zaw Scythe / Staff'] = true,
	['Unique'] = true
}

local DATA_TYPE_MAP = {
	AttackName = 'string',
	Attacks = 'table',
	AmmoCost = 'number',
	BurstCount = 'number',
	BurstDelay = 'number',
	BurstFireRate = 'number',
	BurstsPerSec = 'number',
	BurstReloadDelay = 'number',
	Damage = 'table',
	ChargeTime = 'number',
	CritChance = 'number',
	CritMultiplier = 'number',
	EffectDuration = 'number',
	ExplosionDelay = 'number',
	ExtraHeadshotDmg = 'number',
	Falloff = 'table',
	FireRate = 'number',
	ForcedProcs = 'table',
	InternalName = 'string',
	IsLichWeapon = 'boolean',
	IsSilent = 'boolean',
	MaxSpread = 'number',
	MinSpread = 'number',
	Multishot = 'number',
	PunchThrough = 'number',
	Radius = 'number',
	ShotType = 'string',
	ShotSpeed = 'number',
	StatusChance = 'number',
	_IgnoreEntry = 'boolean',
	_IgnoreInCSV = 'boolean',
	_IgnoreInMasteryCount = 'boolean',
	_TooltipAttackDisplay = 'number',
	Trigger = 'string',
	Accuracy = 'number',
	AmmoMax = 'number',
	AmmoPickup = 'number',
	AmmoType = 'string',
	CodexSecret = 'boolean',
	CompatibilityTags = 'table',
	Conclave = 'boolean',
	Disposition = 'number',
	ExilusPolarity = 'string',
	Family = 'string',
	IncarnonImage = 'string',
	Image = 'string',
	Introduced = 'string',
	Link = 'string',
	Magazine = 'number',
	Mastery = 'number',
	MaxRank = 'number',
	Name = 'string',
	Polarities = 'table',
	Reload = 'number',
	ReloadDelay = 'number',
	ReloadDelayEmpty = 'number',
	ReloadRate = 'number',
	ReloadStyle = 'string',
	SellPrice = 'number',
	SniperComboMin = 'number',
	SniperComboReset = 'number',
	Spool = 'number',
	SyndicateEffect = 'string',
	Trigger = 'string',
	Traits = 'table',
	Slot = 'string',
	DefaultUpgrades = 'table',
	Users = 'table',
	Zoom = 'table',
	BlockAngle = 'number',
	Class = 'string',
	ComboDur = 'number',
	FollowThrough = 'number',
	HeavyAttack = 'number',
	HeavySlamAttack = 'number',
	HeavyRadialDmg = 'number',
	HeavySlamRadius = 'number',
	MeleeRange = 'number',
	SlamAttack = 'number',
	SlamElement = 'string',
	SlamElement = 'string',
	SlamForcedProcs = 'table',
	SlamRadius = 'number',
	HeavySlamElement = 'string',
	HeavySlamForcedProcs = 'table',
	SlideAttack = 'number',
	SlideElement = 'string',
	StancePolarity = 'string',
	SweepRadius = 'number',
	WindUp = 'number',
	Impact = 'number',
	Puncture = 'number',
	Slash = 'number',
	Cold = 'number',
	Electricity = 'number',
	Heat = 'number',
	Toxin = 'number',
	Blast = 'number',
	Corrosive = 'number',
	Gas = 'number',
	Magnetic = 'number',
	Radiation = 'number',
	Viral = 'number',
	Void = 'number',
	True = 'number',
	MinProgenitorBonus = 'number',
	Reduction = 'number',
	StartRange = 'number',
	EndRange = 'number',
	Range = 'number',
	Tradable = 'number',
	UniqueTrait = 'table',
	Description = 'string',
}

local TYPE_ERROR_MSG = '# "[[%s]]" contains a %s type instead of a %s type for <code>%s</code>'
local UNSUPPORTED_TYPE_ERROR_MSG = '# "[[%s]]" contains an unsupported key <code>%s</code>'
	
local function validateDataTypesInTable(t, weaponName, weaponErrors)
	for key, value in pairs(t) do
		-- If key is an integer that means t is an array
		-- For looping over number-indexed attack entries in Attacks tables
		if (type(key) == 'number' and key % 1 == 0) then
			validateDataTypesInTable(t[key], weaponName, weaponErrors)
		end
		if (DATA_TYPE_MAP[key] == nil) then
			table.insert(weaponErrors, string.format(UNSUPPORTED_TYPE_ERROR_MSG, weaponName, key))
		elseif (type(value) ~= DATA_TYPE_MAP[key]) then
			table.insert(weaponErrors, string.format(TYPE_ERROR_MSG, weaponName, type(value), DATA_TYPE_MAP[key], key))
		-- Recursive check of nested tables that are not arrays
		elseif (DATA_TYPE_MAP[key] == 'table' and t[key][1] == nil) then
			validateDataTypesInTable(t[key], weaponName, weaponErrors)
		end
	end
end

--- Checks if each weapon entry has correct data types for its key-value pairs.
--	@function		p.validateDataTypes
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of weapons with invalid data type values for certain keys
function p.validateDataTypes(frame)
	local weaponErrors = { '<strong class="error">p.validateDataTypes(frame): There are a total of %d key-value errors</strong>' }
	for weaponName, weapon in Table.skpairs(WeaponData) do
		validateDataTypesInTable(weapon, weaponName, weaponErrors)
	end
	weaponErrors[1] = string.format(weaponErrors[1], #weaponErrors - 1)
	return frame:preprocess(table.concat(weaponErrors, '\n'))
end

function p.checkForMissingData(frame)
	local weaponErrors = { '<strong class="error">p.checkForMissingData(frame): There are a total of %d key-value errors</strong>' }
	for key, weapon in Table.skpairs(WeaponData) do
		if (weapon.Attacks == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Attacks</code> key')
		end
		if (weapon.Attacks ~= nil and weapon.Attacks[1].Damage == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does have <code>Attacks</code> key but <code>Attacks[1].Damage</code> is nil')
		end
		-- Checking for missing attack entry keys
		for i, attack in ipairs(weapon.Attacks or {}) do
			for attackKey, _ in pairs(p._REQUIRED_ATTACK_STATS) do
				if (attack[attackKey] == nil) then
					table.insert(weaponErrors, '# "[['..key..']]" <code>Attacks['..i..'].'..attackKey..'</code> is nil')
				end
			end
		end
		if (weapon._TooltipAttackDisplay ~= nil and weapon.Attacks[weapon._TooltipAttackDisplay] == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" <code>_TooltipAttackDisplay</code> is referencing a non-existent <code>'..weapon._TooltipAttackDisplay..'</code>')
		end
		if (weapon.Class == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have a <code>Class</code> key')
		end
		if (weapon.Disposition == nil and DISPOSITION_MASTERY_EXEMPTIONS_SLOTS[weapon.Slot] == nil and DISPOSITION_MASTERY_EXEMPTIONS_CLASSES[weapon.Class] == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Disposition</code> key')
		end
		if (weapon.Image == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have an <code>Image</code> key')
		end
		if (weapon.Introduced == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Introduced</code> key')
		end
		if (weapon.Link == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Link</code> key')
		end
		if (weapon.Mastery == nil and DISPOSITION_MASTERY_EXEMPTIONS_SLOTS[weapon.Slot] == nil and DISPOSITION_MASTERY_EXEMPTIONS_CLASSES[weapon.Class] == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Mastery</code> key')
		end
		if (weapon.Name == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have <code>Name</code> key')
		end
		if (weapon.Slot == nil) then
			table.insert(weaponErrors, '# "[['..key..']]" does not have a <code>Slot</code> key')
		end
	end
	weaponErrors[1] = string.format(weaponErrors[1], #weaponErrors - 1)
	return frame:preprocess(table.concat(weaponErrors, '\n'))
end

function p.validateAttacks(frame)
	local weaponErrors = { '<strong class="error">p.validateAttacks(frame): There are a total of %d key-value errors</strong>' }
	for weaponName, weapon in Table.skpairs(WeaponData) do
		for _, attack in pairs(weapon.Attacks) do
			for key, validateFunction in pairs(p._REQUIRED_ATTACK_STATS) do
				local pass, message = pcall(validateFunction, attack)
				if (not pass) then
					table.insert(weaponErrors, '# "[['..weaponName..']]" <code>Attack'..i..'</code>: '..message)
				end
			end
		end
	end
	weaponErrors[1] = string.format(weaponErrors[1], #weaponErrors - 1)
	return frame:preprocess(table.concat(weaponErrors, '\n'))
end

function p.validateRequiredKeys(frame)
	local weaponErrors = { '<strong class="error">p.validateRequiredKeys(frame): There are a total of %d key-value errors</strong>' }
	for weaponName, weapon in Table.skpairs(WeaponData) do
		local validationFunctions = p._REQUIRED_GUN_STATS
		
		if (weapon['Slot'] == 'Archmelee' or weapon['Class']:find('Zaw') ~= nil or 
				weapon['Slot'] == 'Hound' or weapon['Class']:find('Kitgun') ~= nil or 
				weapon['Slot'] == 'Gear' or weapon['Class'] == 'Exalted Weapon') then
			validationFunctions = {}
		elseif (weapon['Slot'] == 'Melee') then
			validationFunctions = p._REQUIRED_MELEE_STATS
		end
		
		for requiredKey, validateFunction in Table.skpairs(validationFunctions) do
			-- Do not check for dispo and mastery for weapons with a Slot value in DISPOSITION_MASTERY_EXEMPTIONS_SLOTS
			if (not (DISPOSITION_MASTERY_EXEMPTIONS_SLOTS[weapon['Slot']] and (requiredKey == 'Disposition' or requiredKey == 'Mastery')) ) then
				local testPass, message = validateFunction(weapon[requiredKey], weapon)
				if (not testPass) then
					table.insert(weaponErrors, '# "[['..weaponName..']]" '..message)
				end
			end
		end
	end
	weaponErrors[1] = string.format(weaponErrors[1], #weaponErrors - 1)
	return frame:preprocess(table.concat(weaponErrors, '\n'))
end

return p
