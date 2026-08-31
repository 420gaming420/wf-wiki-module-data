---
title: "Module:Weapons/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/dev"
wiki_timestamp: "2026-07-10T01:25:50Z"
---

[Edit /doc](https://wiki.warframe.com/w/Module:Weapons/dev/doc?action=edit)
Staging grounds for code that is in development.

---

```lua
-- Note: Only include the most important stats in comparison table columns so
-- that all tables can show up on [[Weapon Comparison]] w/o the need of sidescrolling
-- on desktop.
-- The more columns the longer the script execution time is, making it more likely 
-- to exceed the allocated time for script execution (7 seconds).
-- See NewPP report for script performance on articles. - User:Cephalon Scientia 2021-08-06

-- If you want to update how formatted values are being displayed for each column, update
-- the appropriate format function/string in the value getter in [[Module:Weapons]].
local p = {}

local Weapon = require('Module:Weapons')
local WeaponData = require('Module:Weapons/data')
local ConclaveWeaponData = require('Module:Weapons/Conclave/data')

-- TODO: Internationalize this module
-- local I18n = require('Module:I18n').loadMessages('MediaWiki:Custom-Weapons/i18n.json'):useUserLang();

-- TODO: Add a function to generate a table for all weapons and all their attacks?
-- Not sure if this would exceed allocated memory.

---	Simple ordered map object for defining automatic comparison wikitables.
--	No support for entry removals, only insertions in sequential order.
--	See https://stevedonovan.github.io/Penlight/api/source/orderedmap.lua.html for sample implementation
--	@table		TableDefinition
local TableDefinition  = {}

---	Adds a new table column entry.
--	@function		TableDefinition:insert
--	@param			{string} getterFuncName Getter function name corresponding to M:Weapons
--	@param			{string} headerName Displayed name of column
function TableDefinition:insert(getterFuncName, headerName)
	assert(type(getterFuncName) == "string" and type(headerName) == "string")
	self[getterFuncName] = headerName
	table.insert(getmetatable(self)._keys, getterFuncName)
	return self	-- Returning self for function chaining
end

setmetatable(TableDefinition, {
	---	Constructor for TableDefinition
	--	@function		__call
	__call = function(self)
		return setmetatable({},{
			_keys = {},
			__pairs = getmetatable(self).__pairs,
			__index = self,
		})
	end,
	
	---	Iterating over table column entries in the order they are added.
	--	@function		__pairs
	__pairs = function(self)
		local keys = getmetatable(self)._keys
		local keysIndex = {}
		-- technically more expensive than a state,
		-- but keycounts here are on the order of 'a dozen'
		for i, k in ipairs(keys) do
			keysIndex[k] = i
		end
		return function(t, k)
			local key = t.k[ (t.i[k] or 0)+1 ]
			return key, t.t[key]
		end, {i=keysIndex, k=keys, t=self}, startingkey
	end
})

---	Builds a row for comparison table as seen on [[Weapon Comparison]].
--	@function		buildCompRow
--	@param			{table} tableHeaders Wikitable's header names an the specific getter function that it will pull from
--							(e.g. { ["CritChance"] = "[[Critical Chance|Crit  
Chance]]", ["CritMultiplier"] = "[[Critical Multiplier|Crit Multi]]"} )
--	@param			{table} Weapon A weapon table entry as pulled from /data
--	@returns		{string} Wikitext of resultant wikitable row
local function buildCompRow(tableHeaders, weaponEntry)
	local result = {}
	for attackIndex, _ in ipairs(weaponEntry["Attacks"]) do
		local tableRow = {}
		for getterFuncName, _ in pairs(tableHeaders) do
			-- Protected call needed here to catch errors since if something breaks with getter function
			-- stack backtrace isn't helpful because there's a bunch of unamed tail calls
			-- between this function and M:StatObject
			local noErrors, value = pcall(Weapon._getFormattedValue, weaponEntry, getterFuncName, attackIndex)
			
			if not noErrors then
				error('buildCompRow(tableHeaders, weaponEntry): Error when trying to access "'..getterFuncName..'" attribute of '..mw.dumpObject(weaponEntry)..'\n Original error message: \n'..value)
			end
			
			table.insert(tableRow, value)
		end
		table.insert(result, table.concat(tableRow, ' || '))
	end
	return '|-\n| '..table.concat(result, '\n|-\n| ')
end

---	Builds comparison table as seen on [[Weapon Comparison]].
--	@function		buildCompTable
--	@param			{table} tableHeaders Wikitable's header names an the specific getter function that it will pull from
--							(e.g. { { "CritChance", "[[Critical Chance|Crit  
Chance]]" }, { "CritMultiplier", "[[Critical Multiplier|Crit Multi]]" } } )
--	@param			{table} weaponArray Array of weapon table entries as pulled from /data
--	@returns		{string} Wikitext of resultant wikitable
local function buildCompTable(tableHeaders, weaponArray)
	local dataSortType
	local result = {}
	local sortColumnByNumber = {
		["AttackSpeed"] = true,
		["DamageBias"] = true,
		["CritMultiplier"] = true,
		["HeadshotMultiplier"] = true,
		["AmmoMax"] = true,
		["ShotSpeed"] = true,
	}
	
	table.insert(result, '{| cellpadding="1" cellspacing="0" class="wikitable sortable stickyHeader autosort=1,a"')
	for getterFuncName, headerName in pairs(tableHeaders) do
		dataSortType = ''
		-- TODO: Should be able to imply data-sort-type based on raw unformatted value using getterFuncName
		-- (e.g. Weapons.getValue(some generic weaponEntry, 1, getterFuncName) )
		if (sortColumnByNumber[getterFuncName]) then
			dataSortType = ' data-sort-type="number"'
		end
		table.insert(result, string.format('! %s | %s', dataSortType, headerName))
	end

	for _, weaponEntry in pairs(weaponArray) do
		local rowStr = buildCompRow(tableHeaders, weaponEntry)
		table.insert(result, rowStr)
	end
	
	table.insert(result, '|}[[Category:Automatic Comparison Table]]')
	return table.concat(result, '\n')
end

---	Builds comparison table of gun stats as seen on [[Weapon Comparison]].
--	@function		p.getCompTableGuns
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableGuns(frame)
	local weaponSlot = frame.args ~= nil and frame.args[1]
	local weaponSubtype = frame.args ~= nil and frame.args[2] or nil
	local triggerType = frame.args ~= nil and frame.args[3] or nil
	if (weaponSubtype == "All") then weaponSubtype = nil end
	if (triggerType == "All") then triggerType = nil end
	
	-- Using uniqueNames for portability across multiple languages
	local rangedMelees = {
		["/Lotus/Weapons/Tenno/Melee/Hammer/ThrowingHammer"] = true,	-- Wolf Sledge
		["/Lotus/Weapons/Infested/Melee/InfWarfan/InfWarfanWeapon"] = true,	-- Arum Spinosa
		["/Lotus/Weapons/Tenno/Archwing/Melee/ExaltedArchScythe/ExaltedAWScytheWeapon"] = true,	-- Corufell
		["/Lotus/Weapons/Tenno/Melee/Warfan/TnBrokenFrameWarfan/TnBrokenFrameWarfanWeapon"] = true,	-- Quassus
		["/Lotus/Weapons/Corpus/Melee/CrpBriefcaseScythe/CrpBriefcaseScythe"] = true,	-- Tenet Grigori
		["/Lotus/Weapons/Corpus/Melee/ShieldAndSword/CrpHammerShield/CrpHammerShield"] = true,	-- Tenet Agendus
		["/Lotus/Weapons/Archon/Melee/Whip/ArchonWhipPlayerWep"] = true,	-- Verdilac
	}
	
	--- Filter table entries by a specific key-value pair
	local function filterTable(weaponArray, key, value)
		local temp = {}
		for weaponName, weaponEntry in pairs(weaponArray) do
			if (weaponEntry[key] == value and 
					(weaponSubtype == nil or weaponEntry["Class"] == weaponSubtype) and
					(triggerType == nil or weaponEntry["Trigger"] == triggerType)) then
				temp[weaponName] = weaponEntry
			end
		end
		weaponArray = temp
		return weaponArray
	end

	local weaponArray = {}
	-- TODO: Switch-like if/elses statements can be formatted into a function map
	if (weaponSlot == "Primary") then
		-- TODO: I think WeaponData["Primary"] should all have the same Slot = "Primary" key so this check is not needed
		-- (filtering by class and trigger still needed however)
		weaponArray = filterTable(WeaponData["Primary"], "Slot", "Primary")
	elseif (weaponSlot == "Secondary") then
		-- TODO: I think WeaponData["Secondary"] should all have the same Slot = "Secondary" key so this check is not needed
		-- (filtering by class and trigger still needed however)
		weaponArray = filterTable(WeaponData["Secondary"], "Slot", "Secondary")
	elseif (weaponSlot == "Archgun") then
		weaponArray = filterTable(WeaponData["Archwing"], "Slot", "Archgun")
	elseif (weaponSlot == "Archgun (Atmosphere)") then
		weaponArray = filterTable(WeaponData["Archwing"], "Slot", "Archgun (Atmosphere)")
	elseif (weaponSlot == "Robotic") then
		weaponArray = filterTable(WeaponData["Companion"], "Slot", "Robotic")
	elseif (weaponSlot == "Hound") then
		weaponArray = filterTable(WeaponData["Companion"], "Slot", "Hound")
	elseif (weaponSlot == "Beast") then
		weaponArray = filterTable(WeaponData["Companion"], "Slot", "Beast")
	elseif (weaponSlot == "Amp") then
		weaponArray = filterTable(WeaponData["Modular"], "Class", "Amp")
	elseif (weaponSlot == "Turret") then
		weaponArray = filterTable(WeaponData["Railjack"], "Class", "Turret")
	elseif (weaponSlot == "Ordnance") then
		weaponArray = filterTable(WeaponData["Railjack"], "Class", "Ordnance")
	-- Unique melee weapons that have thrown/ranged attacks
	elseif (weaponSlot == "Melee") then
		weaponArray = WeaponData["Melee"]
		local temp = {}
		for weaponName, weaponEntry in pairs(weaponArray) do
			if (rangedMelees[weaponEntry["InternalName"]] ~= nil and 
					weaponEntry["Class"] == "Gunblade" or weaponEntry["Class"] == "Glaive") then
				temp[weaponName] = weaponEntry
			end
		end
		weaponArray = temp
	-- Comparing all weapons usuable in normal missions
	elseif (weaponSlot == "All") then
		for _, partition in ipairs{ "Primary", "Secondary", "Companion", "Railjack" } do
			for weaponName, weaponEntry in pairs(WeaponData[partition]) do
				weaponArray[weaponName] = weaponEntry
			end
		end
		
		for weaponName, weaponEntry in pairs(WeaponData["Archwing"]) do
			if (weaponEntry["Slot"] == "Archgun (Atmosphere)" or weaponEntry["Slot"] == "Archgun") then
				weaponArray[weaponName] = weaponEntry
			end
		end
		
		for weaponName, weaponEntry in pairs(WeaponData["Modular"]) do
			if (weaponEntry["Class"] == "Amp") then
				weaponArray[weaponName] = weaponEntry
			end
		end
		
		for weaponName, weaponEntry in pairs(WeaponData["Melee"]) do
			if (rangedMelees[weaponEntry["InternalName"]] ~= nil and 
					weaponEntry["Class"] == "Gunblade" or weaponEntry["Class"] == "Glaive") then
				weaponArray[weaponName] = weaponEntry
			end
		end
	else
		error('p.getCompTableGuns(frame): Wrong gun/ranged weapon class'..
			'(use "Primary", "Secondary", "Archgun", "Archgun (Atmosphere)", "Robotic", "Amp", "Turret", "Ordnance", Melee", "All")'..
			'[[Category:Invalid Comp Table]]')
	end

	local tableHeaders = TableDefinition()
	tableHeaders
		:insert("NameLink", "Name")
		:insert("Class", "[[Weapons#Weapon_Type|Weapon  
Type]]")
		:insert("Trigger", "[[Fire Rate|Trigger]]")
		:insert("AttackName", "Attack")
		:insert("DamageBias", "Main  
Element")
		:insert("BaseDamage", "Base  
[[Damage|Dmg]]")
		:insert("Multishot", "[[Multishot]]")
		:insert("FireRate", "[[Fire Rate|Fire  
Rate]]")
		:insert("EffectiveFireRate", "Effective  
[[Fire Rate|Fire  
Rate]]")
		:insert("CritChance", "[[Critical Chance|Crit]]")
		:insert("CritMultiplier", "[[Critical multiplier|Crit  
Dmg]]")
		:insert("StatusChance", "[[Status Chance|Status]]")
		:insert("Reload", "[[Reload Speed|Reload]]")
		:insert("Magazine", "[[Ammo#Magazine Capacity|Mag  
Size]]")
		:insert("IncarnonCharges", "Incarnon Charges")
		:insert("AvgShotDmg", "Avg  
Shot")
		:insert("BurstDps", "Burst  
DPS")
		:insert("SustainedDps", "Sust  
DPS")
		:insert("AvgProcPerSec", "[[Status Chance|Avg. Procs]]  
per sec")
		:insert("AmmoPickup", "[[Ammo Pickup|Ammo  
Pickup]]")
		:insert("IncarnonChargeGain", "Incarnon Charge Gain")
		:insert("AmmoMax", "[[Ammo Maximum|Ammo  
Max]]")
		:insert("PunchThrough", "[[Punch Through|PT]]")
		:insert("ShotSpeed", "[[Projectile Speed|Proj. Speed]]")
		:insert("Accuracy", "[[Accuracy]]")
		:insert("AvgSpread", "Avg. [[Spread]]")
		:insert("MinSpread", "Min. Spread")
		:insert("MaxSpread", "Max. Spread")
		:insert("Range", "Range")
		:insert("Disposition", "[[Riven Mods#Disposition|Dispo]]")
		:insert("NoiseLevel", "[[Noise Level|Noise]]")
		:insert("Mastery", "[[Mastery Rank|MR]]")
		:insert("IntroducedDate", "Introduced")
	
	return buildCompTable(tableHeaders, weaponArray)
end

---	Builds comparison table of gun Conclave stats as seen on [[Weapon Comparison/Conclave]].
--	@function		p.getCompTableConclaveGuns
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableConclaveGuns(frame)
	local weaponSlot = frame.args ~= nil and frame.args[1]
	local weaponSubtype = frame.args ~= nil and frame.args[2] or nil
	local triggerType = frame.args ~= nil and frame.args[3] or nil
	if (weaponSubtype == "All") then weaponSubtype = nil end
	if (triggerType == "All") then triggerType = nil end
	
	-- TODO: Can be refactored into a local function outside of this scope since
	-- PVE tables also use the same function, just add weaponSubtype and triggerType arguments in function definition
	-- Filter table entries by a specific key-value pair
	local function filterTable(weaponArray, key, value)
		local temp = {}
		for weaponName, weaponEntry in pairs(weaponArray) do
			if (weaponEntry[key] == value and 
					(weaponSubtype == nil or weaponEntry["Class"] == weaponSubtype) and
					(triggerType == nil or weaponEntry["Trigger"] == triggerType)) then
				temp[weaponName] = weaponEntry
			end
		end
		weaponArray = temp
		return weaponArray
	end
	
	local weaponArray = {}
	if (weaponSlot == "Primary") then
		weaponArray = filterTable(ConclaveWeaponData["Primary"], "Slot", "Primary")
	elseif (weaponSlot == "Secondary") then
		weaponArray = filterTable(ConclaveWeaponData["Secondary"], "Slot", "Secondary")
	else
		error('p.getCompTableConclaveGuns(frame): Wrong gun weapon class for Conclave (use "Primary" or "Secondary")[[Category:Invalid Comp Table]]')
	end
	
	local tableHeaders = TableDefinition()
		:insert("NameLink", "Name")
		:insert("AttackName", "Attack")
		:insert("Trigger", "[[Fire Rate|Trigger]]")
		:insert("DamageBias", "Main  
Element")
		:insert("PvPBaseDamage", "Base  
[[Damage|Dmg]]")
		:insert("PvPImpact", "[[Damage/Impact Damage|Impact]]")
		:insert("PvPPuncture", "[[Damage/Puncture Damage|Puncture]]")
		:insert("PvPSlash", "[[Damage/Slash Damage|Slash]]")
		:insert("Multishot", "[[Multishot]]")
		:insert("TotalDamage", "Total Dmg")
		:insert("EffectiveFireRate", "[[Fire Rate|Fire  
Rate]]")
		:insert("BaseDps", "Base DPS")
		:insert("HeadshotMultiplier", "Headshot  
Multiplier")
		:insert("ShotType", "Shot  
Type")
		:insert("ShotSpeed", "[[Projectile Speed|Projectile  
Speed]]")
		:insert("Magazine", "[[Ammo#Magazine Capacity|Mag  
Size]]")
		:insert("AmmoMax", "[[Ammo Maximum|Ammo  
Max]]")
		:insert("Reload", "[[Reload Speed|Reload]]")
		:insert("Accuracy", "[[Accuracy]]")
		:insert("NoiseLevel", "[[Noise Level|Noise]]")
		:insert("Mastery", "[[Mastery Rank|MR]]")
		:insert("IntroducedDate", "Introduced")
	
	return buildCompTable(tableHeaders, weaponArray)
end

---	Builds comparison table of melee stats as seen on [[Weapon Comparison]].
--	@function		p.getCompTableMelees
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableMelees(frame)
	--Changed formatting, now only takes type since only class handled is Melee
	--Keeping old formatting to avoid breaking pages
	local meleeClass = frame.args ~= nil and frame.args[1] or nil
	if (meleeClass == "All") then meleeClass = nil end
	local weaponArray = {}
	weaponArray = WeaponData["Melee"]
	
	if (meleeClass ~= nil) then
		local temp = {}
		for weaponName, weaponEntry in pairs(weaponArray) do
			if (weaponEntry["Class"] == meleeClass) then
				temp[weaponName] = weaponEntry
			end
		end
		weaponArray = temp
	end
	
	local tableHeaders = TableDefinition()
		:insert("NameLink", "Name")
		:insert("Class", "Type")
		:insert("AttackName", "Attack")
		:insert("DamageBias", "Main  
Element")
		:insert("BaseDamage", "[[Damage|Normal]]")
		:insert("HeavyAttack", "[[Melee#Heavy Attack|Heavy]]")
		:insert("SlideAttack", "[[Melee#Slide Attack|Slide]]")
		:insert("MeleeRange", "[[Melee#Range|Range]]")
		:insert("SweepRadius", "[[Sweep Radius]]")
		:insert("AttackSpeed", "[[Attack Speed|Speed]]")
		:insert("CritChance", "[[Critical Chance|Crit]]")
		:insert("CritMultiplier", "[[Critical multiplier|Crit Dmg]]")
		:insert("AvgDmgWithAnimSpeedMulti", "Avg Dmg ×  
Atk Spd")
		:insert("StatusChance", "[[Status Chance|Status]]")
		:insert("Disposition", "[[Riven Mods#Disposition|Dispo]]")
		:insert("FollowThrough", "[[Melee#Follow Through|Follow  
Through]]")
		:insert("BlockAngle", "[[Blocking|Block  
Angle]]")
		:insert("ComboDur", "[[Combo Duration|Combo  
Duration]]")
		:insert("NoiseLevel", "[[Noise Level|Noise]]")
		:insert("Mastery", "[[Mastery Rank|MR]]")
		:insert("StancePolarity", "[[Stance]]")
		:insert("IntroducedDate", "Introduced")
	
	return buildCompTable(tableHeaders, weaponArray)
end

---	Builds comparison table of melee conclave stats as seen on [[Weapon Comparison/Conclave]].
--	@function		p.getCompTableConclaveMelees
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableConclaveMelees(frame)
	local meleeClass = frame.args ~= nil and frame.args[1] or nil
	if (meleeClass == "All") then meleeClass = nil end
	
	local weaponArray = ConclaveWeaponData["Melee"]
	
	-- Can be refactored into a local helper function b/c this is the same loop used
	-- in p.getCompTableMelees(frame)
	local temp = {}
	for weaponName, weaponEntry in pairs(weaponArray) do
		-- TODO: Need slot check for melee b/c Conclave /data is not partitioned yet. Remove slot check once partitioned
		-- since WeaponData["Melee"] will then properly get all melee weapons from Conclave data
		if (weaponEntry["Slot"] == "Melee" and (meleeClass == nil or weaponEntry["Class"] == meleeClass)) then
			temp[weaponName] = weaponEntry
		end
	end
	weaponArray = temp
	
	local tableHeaders = TableDefinition()
		:insert("Name", "Name")
		:insert("Class", "Type")
		:insert("PvPBaseDamage", "[[Damage|Normal]]")
		:insert("PvPImpact", "[[Damage/Impact Damage|Impact]]")
		:insert("PvPPuncture", "[[Damage/Puncture Damage|Puncture]]")
		:insert("PvPSlash", "[[Damage/Slash Damage|Slash]]")
		:insert("SlideAttack", "[[Melee#Slide Attack|Slide]]")
		:insert("AttackSpeed", "[[Attack Speed]]")
		:insert("BlockAngle", "[[Blocking|Block  
Angle]]")
		:insert("NoiseLevel", "[[Noise Level|Noise]]")
		:insert("Mastery", "[[Mastery_Rank|Mastery Rank]]")
		:insert("StancePolarity", "[[Stance]]")
		:insert("IntroducedDate", "Introduced")
	
	return buildCompTable(tableHeaders, weaponArray)
end

---	Builds comparison table of archmelee stats as seen on [[Weapon Comparison]].
--	@function		p.getCompTableArchMelees
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableArchMelees(frame)
	local weaponArray = {}
	weaponArray = Weapon._getWeapons(function(weap)
		return Weapon._getValue(weap, "Slot") == "Archmelee"
	end)
	
	local tableHeaders = TableDefinition()
		:insert("NameLink", "Name")
		:insert("DamageBias", "Main  
Element")
		:insert("BaseDamage", "[[Damage|Normal]]")
		:insert("MeleeRange", "[[Melee#Range|Range]]")
		:insert("AttackSpeed", "[[Attack Speed]]")
		:insert("CritChance", "[[Critical Chance]]")
		:insert("CritMultiplier", "[[Critical multiplier|Critical Damage]]")
		:insert("AvgDmgWithAnimSpeedMulti", "Avg Dmg × Atk Spd")
		:insert("StatusChance", "[[Status Chance]]")
		:insert("Mastery", "[[Mastery Rank]]")
		:insert("IntroducedDate", "Introduced")
	
	return buildCompTable(tableHeaders, weaponArray)
end

---	Builds comparison table of projectile flight speeds as seen on [[Projectile Speed]].
--	@function		p.getCompTableSpeedGuns
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableSpeedGuns(frame)
	local weaponSlot = frame.args ~= nil and frame.args[1]
	
	local supportedSlots = {
		Primary = true,
		Secondary = true,
		Melee = true,
		Robotic = true,
		["Archgun"] = true,
		["Archgun (Atmosphere)"] = true
	}
	assert(supportedSlots[weaponSlot] == true, 'p.getCompTableSpeedGuns(frame): Wrong gun weapon slot '..
			'(use "Primary", "Secondary", "Melee", Robotic", "Archgun", "Archgun (Atmosphere)")[[Category:Invalid Comp Table]]')
	
	local weaponList = Weapon._getWeapons(
			function(weap) 
				return Weapon._getValue(weap, "Slot") == weaponSlot
			end)
	
	-- special sorting for projectile weapons
	local projectileWeaponList = {}
	for k, weaponEntry in ipairs(weaponList) do
		local attacks = Weapon._getValue(weaponEntry, "Attacks") or {}
		local projectileAttacks = {}
		for _, attack in ipairs(attacks) do
			if attack.ShotType == "Projectile" or attack.ShotType == "Thrown" then
				table.insert(projectileAttacks, attack)
			end
		end
		if #projectileAttacks > 0 then
			local filteredEntry = {}
			for key, value in pairs(weaponEntry) do
				filteredEntry[key] = value
			end
			filteredEntry.Attacks = projectileAttacks
			table.insert(projectileWeaponList, filteredEntry)
		end
	end
	local tableHeaders = TableDefinition()
		:insert("Name", "Name")
		:insert("Class", "Class")
		:insert("AttackName", "Attack")
		:insert("ShotSpeed", "Projectile Speed")
	
	return buildCompTable(tableHeaders, projectileWeaponList)
end

---	Builds comparison table of AoE ranges as seen on [[Area of Effect]].
--	@function		p.getCompTableAoEGuns
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableAoEGuns(frame)
	local weaponSlot = frame.args ~= nil and frame.args[1]
	
	local supportedSlots = {
		Primary = true,
		Secondary = true,
		Melee = true,
		Robotic = true,
		["Archgun"] = true,
		["Archgun (Atmosphere)"] = true
	}
	assert(supportedSlots[weaponSlot] == true, 'p.getCompTableAoEGuns(frame): Wrong gun weapon slot '..
			'(use "Primary", "Secondary", "Melee", Robotic", "Archgun", "Archgun (Atmosphere)")[[Category:Invalid Comp Table]]')
	
	local weaponList = Weapon._getWeapons(
			function(weap) 
				return Weapon._getValue(weap, "Slot") == weaponSlot
			end)
	
	local AoEWeaponList = {}
	for k, weaponEntry in ipairs(weaponList) do
		local attacks = Weapon._getValue(weaponEntry, "Attacks") or {}
		local aoeAttacks = {}
		for _, attack in ipairs(attacks) do
			if attack.ShotType == "AoE" then
				table.insert(aoeAttacks, attack)
			end
		end
		if #aoeAttacks > 0 then
			local filteredEntry = {}
			for key, value in pairs(weaponEntry) do
				filteredEntry[key] = value
			end
			filteredEntry.Attacks = aoeAttacks
			table.insert(AoEWeaponList, filteredEntry)
		end
	end
	local tableHeaders = TableDefinition()
        :insert("Name", "Name")
        :insert("Class", "Weapon Class")
        :insert("AttackName", "Attack")
        :insert("Range", "Radius")
        :insert("BaseDamageWithProgenBonus", "Damage")
        :insert("FalloffReduction", "Max Damage Reduction")
        :insert("FalloffMinDamage", "Minimum AoE Damage")
	
	return buildCompTable(tableHeaders, AoEWeaponList)
end

---	Builds comparison table of damage falloff as seen on [[Damage Falloff]].
--	@function		p.getCompTableFalloff
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getCompTableFalloff(frame)
	local weaponSlot = frame.args ~= nil and frame.args[1]
	local weaponList = {}
	
	-- TODO: Refactor this function to match p.getCompTableSpeedGuns(frame)
	-- (i.e. remove switch cases + simplify logic)
	if (weaponSlot == "Primary") then
		weaponList = Weapon._getWeapons(function(weap)
			return (Weapon._getValue(weap, "Slot") == "Primary")
		end)
	elseif (weaponSlot == "Secondary") then
		weaponList = Weapon._getWeapons(function(weap)
			return (Weapon._getValue(weap, "Slot") == "Secondary")
		end)
	elseif (weaponSlot == "Robotic") then
		weaponList = Weapon._getWeapons(function(weap)
			return Weapon._getValue(weap, "Slot") == "Robotic"
		end)
	elseif (weaponSlot == "Archgun") then
		weaponList = Weapon._getWeapons(function(weap)
			return Weapon._getValue(weap, "Slot") == "Archgun"
		end)
	else
		error('p.getCompTableFalloff(frame): Wrong gun weapon class '..
			'(use "Primary", "Secondary", "Robotic", or "Archgun")[[Category:Invalid Comp Table]]')
	end

	local tableHeaders = TableDefinition()
		:insert("Name", "Name")
		:insert("Class", "Class")
		:insert("FalloffStart", "Falloff Start")
		:insert("FalloffEnd", "Falloff End")
		:insert("FalloffReduction", "Max Damage  
Reduction")
	
	return buildCompTable(tableHeaders, weaponList)
end

return p
```

