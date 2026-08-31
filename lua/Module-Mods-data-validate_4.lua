-- TODO: Add data validation to all entries in Module:Mods/data
-- This includes:
-- * Type checking for each value; all key-value pairs should be of a single type
-- * Checking mod incompatibility graph edges
local p = {}

local ModData = mw.loadData('Module:Mods/data')
local Table = require('Module:Table')

local REQUIRED_KEYS = {
	'BaseDrain',
	'Description',
	'Icon',
	'Image',
	'InternalName',
	'Introduced',
	'Link',
	'MaxRank',
	'Name',
	'Polarity',
	'Rarity',
	'Tradable',
	'Transmutable',
	'Type'
}

local DATA_TYPE_MAP = {
	_IgnoreEntry = 'boolean',
	BaseDrain = 'number',
	Class = 'string',
	CodexSecret = 'boolean',
	CompatibilityTags = 'table',
	Conclave = 'boolean',
	Description = 'string',
	Icon = 'string',
	Image = 'string',
	Incompatible = 'table',
	IncompatibilityTags = 'table',
	InternalName = 'string',
	Introduced = 'string',
	IsAbilityAugment = 'boolean',
	IsDefaultUpgrade = 'boolean',
	IsExilus = 'boolean',
	IsFlawed = 'boolean',
	IsWeaponAugment = 'boolean',
	Link = 'string',
	MaxRank = 'number',
	Name = 'string',
	NotUpgradable = 'boolean',
	NumUpgradesInSet = 'number',
	Polarity = 'string',
	Rarity = 'string',
	Set = 'string',
	Tradable = 'boolean',
	Transmutable = 'boolean',
	Type = 'string',
	UpgradeTypes = 'table'
}

--- Checks if each mod entry has the required keys.
--	@function		p.checkRequiredKeysExist
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods without certain required keys
function p.checkRequiredKeysExist(frame)
	local modErrors = { '<strong class="error">p.checkRequiredKeysExist(frame): There are a total of %d key-value errors</strong>' }
	for modName, modData in Table.skpairs(ModData['Mods']) do
		if (not modData['_IgnoreEntry']) then
			for _, requiredKey in ipairs(REQUIRED_KEYS) do
				if (modData[requiredKey] == nil) then
					local errorMsg = '# "[[%s]]" is missing <code>%s</code>'
					table.insert(modErrors, string.format(errorMsg, modName, requiredKey))	
				end
			end
		end
	end
	modErrors[1] = string.format(modErrors[1], #modErrors - 1)
	return frame:preprocess(table.concat(modErrors, '\n'))
end

--- Checks if each mod entry has correct data types for its key-value pairs.
--	@function		p.validateDataTypes
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods with invalid data type values for certain keys
function p.validateDataTypes(frame)
	local modErrors = { '<strong class="error">p.validateDataTypes(frame): There are a total of %d key-value errors</strong>' }
	for modName, modData in Table.skpairs(ModData['Mods']) do
		if (not modData['_IgnoreEntry']) then
			for key, value in pairs(modData) do
				if (DATA_TYPE_MAP[key] == nil) then
					table.insert(modErrors, '# '..modName..' contains an unsupported key <code>'..key..'</code>')
				elseif (type(value) ~= DATA_TYPE_MAP[key]) then
					local errorMsg = '# "[[%s]]" contains a %s type instead of a %s type for <code>%s</code>'
					table.insert(modErrors, string.format(errorMsg, modName, type(value), DATA_TYPE_MAP[key], key))
				end
			end
		end
	end
	modErrors[1] = string.format(modErrors[1], #modErrors - 1)
	return frame:preprocess(table.concat(modErrors, '\n'))
end

--- Checks if each mod image name is in the proper format. Valid mod image file name
--	formats: ModNameMod.png
--	@function		p.checkImageNames
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods with image names that do not follow mod image naming scheme
function p.checkImageNames(frame)
	local modErrors = { '<strong class="error">p.checkImageName(frame): There are a total of %d image names that do not follow mod image naming scheme ModNameMod.png</strong>' }
	for modName, modData in Table.skpairs(ModData['Mods']) do
		if (not modData['_IgnoreEntry']) then
			local imageName = modData['Image']
			local modNameInFile = string.gsub(modName, '%s', '')	-- Removing whitespaces in name
			local imageNameWithNoEnding = string.gsub(imageName, '%.png', '')
			-- First check if image file is a .png then validate file name
			if (string.find(imageName, '%.png') == nil or modNameInFile..'Mod' ~= imageNameWithNoEnding) then
				local errorMsg = '# "[[%s]]": "[[:File:%s|%s]]"'
				table.insert(modErrors, string.format(errorMsg, modName, imageName, imageName))
			end
		end
	end
	modErrors[1] = string.format(modErrors[1], #modErrors - 1)
	return frame:preprocess(table.concat(modErrors, '\n'))
end

--- Checks if each mod listed in a mod entry's <code>Incompatible</code> table 
--	has their own <code>Incompatible</code> table with the original mod's name 
--	as one of their contents (aka an edge if we treat this as a graph data structure).
--	In other words, we want circular references in these incompatible mod graphs.
--	@function		p.validateIncompatibilityGraphs
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods that have missing edges in <code>Incompatible</code> tables
function p.validateIncompatibilityGraphs(frame)
	local modErrors = { '<strong class="error">p.validateIncompatibilityEdges(frame): There are a total of %d <code>Incompatible</code> table errors</strong>' }
	local otherCollectionNames = { 'Sets', 'DefaultUpgrades' }
	local errorMsg = '# "[[%s]]" <code>Incompatible</code> table is missing "%s"'
	
	-- TODO: Update to support validation across collections
	-- TODO: Should be a more efficient/accurate way to validate mods across collections; too many loops
	for modName, modData in Table.skpairs(ModData['Mods']) do
		if (modData['Incompatible'] ~= nil and not modData['_IgnoreEntry']) then
			for _, edge in ipairs(modData['Incompatible']) do
				if (ModData['Mods'][edge] == nil or ModData['Mods'][edge]['Incompatible'] == nil or 
						Table.contains(ModData['Mods'][edge]['Incompatible'], modName) == false) then
					-- Check other collections in case of mod incompatability with mods stored in different collections
					for _, collection in ipairs(otherCollectionNames) do
						if (ModData[collection][edge] == nil or ModData[collection][edge]['Incompatible'] == nil or 
								Table.contains(ModData[collection][edge]['Incompatible'], modName) == false) then
							table.insert(modErrors, string.format(errorMsg, edge, modName))	
						end
					end
				end
			end
		end
	end
	modErrors[1] = string.format(modErrors[1], #modErrors - 1)
	return frame:preprocess(table.concat(modErrors, '\n'))
end

return p
