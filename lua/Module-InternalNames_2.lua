---	Simple module to generate a CSV list of items' known uniqueNames for debuggging purposes.
--	
--	@module		internalnames
--	@alias		p
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Arcane/data]]
--	@require	[[Module:Focus/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Enemies/data]]
--	@require	[[Module:DropTables/data]]
--	@require	[[Module:Missions/data]]
--	@require	[[Module:Blueprints/data]]
--	@release	stable
--	
local WeaponData = require('Module:Weapons/data')
local PowersuitData = mw.loadData('Module:Warframes/data')
local WarframeData = PowersuitData['Warframes']
local ArchwingData = PowersuitData['Archwings']
local NecramechData = PowersuitData['Necramechs']
local AbilityData = mw.loadData('Module:Ability/data')['Ability']
local ModData = mw.loadData('Module:Mods/data')['Mods']
local ArcaneData = mw.loadData('Module:Arcane/data')['Arcanes']
local FocusData = mw.loadData('Module:Focus/data')
local FocusSchoolData = FocusData['Schools']
local FocusNodeData = FocusData['Ways']
local ItemData = mw.loadData('Module:Resources/data')['Resources']
-- local EnemyData = mw.loadData('Module:Enemies/data') TODO: Has a metatable, need to require() like M:Weapons/data b/c horizontal partitioning
local MissionDropTableData = mw.loadData('Module:DropTables/data')['Missions']
local MissionData = mw.loadData('Module:Missions/data').by.Name
local BlueprintsData = mw.loadData('Module:Blueprints/data').Blueprints

local tablesToIterate = {
	Weapon = WeaponData,
	Warframe = WarframeData,
	Archwing = ArchwingData,
	Necramech = NecramechData,
	Ability = AbilityData,
	Mod = ModData,
	Arcane = ArcaneData,
	FocusSchool = FocusSchoolData,
	FocusNode = FocusNodeData,
	Item = ItemData,
	-- Enemy = EnemyData,
	MissionDropTable = MissionDropTableData,
	Mission = MissionData,
	-- Blueprint = BlueprintsData
}

local p = {}

---	Entry point to invoke module. Generates a CSV list of item internal names mapped to their localized name.
--	@param		{table} frame Frame object
--	@return		{string} Wikitext of resultant CSV list
function p.main(frame)
	local resultHeader = '<pre>\nInternal name, Localized name\n'
	local result = {}
	for name, db in pairs(tablesToIterate) do
		-- TODO: Can be refactored
		if (name == 'Enemy') then
			for _, entry in pairs(db) do
				-- Keys are in a different location for enemy entries
				local internalName = entry['General'].InternalName
				local localizedName = entry['General'].Name
				if (internalName ~= nil and internalName ~= '') then
					table.insert(result, '"'..internalName..'", "'..localizedName..'"')
				end
			end
		elseif (name == 'MissionDropTable') then
			for _, entry in pairs(db) do
				local internalName = entry.InternalName
				local localizedName = entry.Name
				if (internalName ~= nil and internalName ~= '') then
					-- How we store drop tables on the wiki are not the same as how the game stores certain drop tables like
					-- bounty rotations which is why there are multiple InternalNames associated with a single drop table entry
					if (type(internalName) == 'table') then
						for rotationLetter, uniqueName in pairs(internalName) do
							table.insert(result, '"'..uniqueName..'", "'..localizedName..' Rotation '..rotationLetter..'"')
						end
					else
						table.insert(result, '"'..internalName..'", "'..localizedName..'"')
					end
				end
			end
		else
			for _, entry in pairs(db) do
				local internalName = entry.InternalName
				local localizedName = entry.Name or "nil"
				if (internalName ~= nil and internalName ~= '') then
					table.insert(result, '"'..internalName..'", "'..localizedName..'"')
				end
			end
		end
	end
	table.sort(result)
	table.insert(result, '</pre>')
	return resultHeader..table.concat(result, '\n')
end

---	Generates a CSV list of item names that have unknown internal names.
--	@param		{table} frame Frame object
--	@return		{string} Wikitext of resultant CSV list
function p.findMissingInternalNames(frame)
	local result = { }
	for _, db in ipairs(tablesToIterate) do
		for _, entry in pairs(db) do
			local internalName = entry.InternalName
			local localizedName = entry.Name
			if (internalName == nil or internalName == '') then
				table.insert(result, localizedName and '"'..localizedName..'"' or mw.dumpObject(entry))
			end
		end
	end
	table.sort(result)
	table.insert(result, '</pre>')
	return '<pre>\n'..table.concat(result, '\n')
end

return p
