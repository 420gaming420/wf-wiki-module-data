---	WARFRAME Conclave weapon database to be used on the wiki.
--	
--	@module			weapons/data
--	@alias			data
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	Everyone who contributes to adding new data or updating existing values in database
--	@require		[[Module:Table]]
---	@require		[[Module:LuaSerializer]]
--	@release		stable
--	

-- TODO: Since horizontal partitions are accessed programmatically, this means
-- that this module can be tailored to serve specific user localizations.
-- All we need to do is to add a locale flag in here set to mw.getCurrentFrame():preprocess('{{int:Custom-lang}}'), 
-- a separate translation table (likely JSON) for mapping canonical internal names to localized names, 
-- and replace the Name key/Trigger key/index key with the localized counterpart.
-- In theory, any database access by requiring this module should contain the 
-- proper localization based on user's interface language setting.

local Table = require('Module:Table')

local data = {}

local MODULE_LOCALIZATION = mw.site.namespaces[828].name

local PVE_DATA_NAME = 'Weapons/data'

-- Conclave weapon entries will omit some fields that are shared with PvE counterpart.
-- Persist shared data in here when Conclave weapon entry is indexed
local SHARED_KEYS = {
	'Class', 'Conclave', 'ExilusPolarity', 'Family', 'Image', 'Introduced',
	'IsSilent', 'Mastery', 'Name', 'Polarities', 'StancePolarity', 'Slot',
	'Tradable', 'Traits'
}

local CONCLAVE_SLOTS = { 'primary', 'secondary', 'melee' }

local SLOTS_MAP = {
	primary = 'primary',
	secondary = 'secondary',
	melee = 'melee',

	-- Commented out are currently unused for Conclave
	-- archwing = 'archwing',
	-- ['arch-gun'] = 'archwing',
	-- ['arch-melee'] = 'archwing',
	-- ['arch-gun (atmosphere)'] = 'archwing',

	-- companion = 'companion',
	-- ['robotic'] = 'companion',
	-- ['hound'] = 'companion',

	-- railjack = 'railjack',
	-- ['railjack turret'] = 'railjack',
	-- ['railjack ordnance'] = 'railjack',

	-- modular = 'modular',
	-- ['amp'] = 'modular',
	-- ['kitgun'] = 'modular',
	-- ['zaw'] = 'modular',

	-- misc = 'misc',
	-- ['emplacement'] = 'misc',
	-- ['gear'] = 'misc',
	-- ['nech-melee'] = 'misc',
	-- ['unique'] = 'misc',
	-- ['vehicle'] = 'misc',
}

---	Copy of https://github.com/wikimedia/mediawiki-extensions-Scribunto/blob/master/includes/Engines/LuaCommon/lualib/mw.lua#L665
--	so that we preserve read-only access of modified Conclave weapon entries which had to 
--	add additional data from their respective PvE entry
--	TODO: Move this function to a different module for other modules to use? Like in [[Module:Table]]?
--	@param			{table} data Data to access
--	@param			{table|nil} seen Table of already-seen tables.
--	@param			{string} name Name of calling function
--	@return			table
local function dataWrapper(data, seen, name)
	local t = {}
	seen = seen or { [data] = t }

	local function pairsfunc(s, k)
		k = next(data, k)
		if k ~= nil then
			return k, t[k]
		end
		return nil
	end

	local function ipairsfunc(s, i)
		i = i + 1
		if data[i] ~= nil then
			return i, t[i]
		end
		return -- no nil to match default ipairs()
	end

	local mt = {
		mw_loadData = true,
		__index = function (tt, k)
			assert(t == tt)
			local v = data[k]
			if type( v ) == 'table' then
				seen[v] = seen[v] or dataWrapper(v, seen, name)
				return seen[v]
			end
			return v
		end,
		__newindex = function (t, k, v)
			error("table from " .. name .. " is read-only", 2)
		end,
		__pairs = function (tt)
			assert(t == tt)
			return pairsfunc, t, nil
		end,
		__ipairs = function (tt)
			assert(t == tt)
			return ipairsfunc, t, 0
		end,
	}
	-- This is just to make setmetatable() fail
	mt.__metatable = mt

	return setmetatable(t, mt)
end

-- Defining default metatable values
local dbMetatable = {
	-- Page title of database
	_pageName = 'Weapons/Conclave/data',
}
dbMetatable._pageTitle = MODULE_LOCALIZATION..':'..dbMetatable._pageName

---	Defining custom looping behavior with pairs() to iterate over multiple 
--	partitions while acting as one database table.
--	@function		data.__pairs
--	@param			{table} self Table self-reference
--	@return			{function} Iterator function
--	@return			{table} Contains key-pair values of slot names to corresponding horizontal partition
dbMetatable.__pairs = function(self)
		local temp = {}
		local slots = CONCLAVE_SLOTS
		
		for i, slot in ipairs(slots) do
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

---	Supporting indexing by slot name (returns array of weapon entries) or weapon name
--	(returns a weapon entry).
--	@function		data.__index
--	@param			{table} self Table self-reference
--	@param			{string} key Index key
--	@return			{table}
dbMetatable.__index = function(self, key)
		if (type(key) == 'number') then return nil end
		
		-- Indexing by slot
		local slot = SLOTS_MAP[key:lower()]
		if key and slot then
			local ConclaveWeaponData = require(getmetatable(self)._pageTitle..'/'..slot)
			local WeaponData = require(MODULE_LOCALIZATION..':'..PVE_DATA_NAME..'/'..slot)
			-- Adding shared key-value pairs from M:Weapons/data
			Table.copyKeyValues(ConclaveWeaponData, WeaponData, SHARED_KEYS)
			return ConclaveWeaponData
		end
		
		local slots = CONCLAVE_SLOTS
		
		-- Indexing by weapon name
		local weapon
		for _, slot in ipairs(slots) do
			weapon = require(getmetatable(self)._pageTitle..'/'..slot)[key]
			
			if weapon then
				-- Adding some shared fields from PVE entry to PVP
				-- Tables returned by require() are not read-only, unlike mw.loadData()
				coopWeaponEntry = require(MODULE_LOCALIZATION..':'..PVE_DATA_NAME..'/'..slot)[key]
				for _, sharedKey in ipairs(SHARED_KEYS) do
					-- If a shared key is explicitly present in Conclave weapon entry, assume
					-- that value is overrided; don't replace it
					if (weapon[sharedKey] == nil) then
						weapon[sharedKey] = coopWeaponEntry[sharedKey]
					end
				end
				
				return dataWrapper(weapon, nil, 'modified PvP weapon entry from [[Module:Weapons/Conclave/data]]')
			end
		end
		return nil
	end

---	For changing which type of database to pull data from.
--	If you want to switch to a different database in the same script, must require()
--	a new instance of M:Weapons/data.
--	@function		__call
--	@usage			require('Module:Weapons/data')
--	@param			{table} self Table self-reference
--	@param			{table} args Argument table
--	@return			{table} Database table
dbMetatable.__call = function(self, args)
		-- Define logic for additional named arguments before the return statement
		-- TODO: We can take advantage of calling a database table by adding additional arguments
		-- for filtering out content.
		return self
	end

---	Serializes database tables into a single string with no functions and metatables.
--	@function		__tostring
--	@param			{table} self Table self-reference
--	@return			{string} Serialized database
dbMetatable.__tostring = function(self)
		return require('Module:LuaSerializer')._serialize(getmetatable(self)._pageName)
	end

setmetatable(data, dbMetatable)

return data
