---	Outputs a CSV text based on data in Module:Mods/data. See [[Mod/CSV]]
--	for sample output.
--	
--	@module		mods/csv
--	@alias		p
--	@author		
--	@require	[[Module:Version]]
--	@require	[[Module:Mods/data]]
--	@release	stable
--	

local p = {}

local Version = require('Module:Version')
local ModData = mw.loadData('Module:Mods/data')["Mods"]

---	Generic CSV builder for mods.
--	@function		p._csvModTable
--	@param			{table} columnDefinition Table of column keys that directly map to key names in [[Module:Mods/data]]
--	@return			{string} Preformatted text of CSV text
function p._csvModTable(columnDefinition)
	local tableEntryTemplate = {}	-- Would look like '%s,%s,%s'
	
	for i, _ in ipairs(columnDefinition) do table.insert(tableEntryTemplate, '%s,') end
	tableEntryTemplate[#tableEntryTemplate] = '%s'	-- Last column
	tableEntryTemplate = table.concat(tableEntryTemplate)
	
	local csvResult = {}
	table.insert(csvResult, string.format(tableEntryTemplate, unpack(columnDefinition)))
	
	for _, modEntry in pairs(ModData) do
		local tableEntryValues = {}
		
		for _, keyName in ipairs(columnDefinition) do
			local v
			-- IntroducedDate doesn't actually exist in M:Mods/data
			-- TODO: Update M:Mods to support derived key getters similar to M:Weapons
			if (keyName == 'IntroducedDate') then
				v = Version._getVersionDate(modEntry['Introduced'] or "999")
			else
				v = modEntry[keyName]
				-- Serializing table to a string
				if (type(v) == 'table') then
					v = table.concat(v, '|')
				end
			end
			table.insert(tableEntryValues, tostring(v))
		end
		
		local tableEntry = string.format(tableEntryTemplate, unpack(tableEntryValues))
		table.insert(csvResult, tableEntry)
	end
	
	return table.concat(csvResult, '\n')
end
	
---	Builds a CSV table of all WARFRAME's mods.
--	@function		p._csvModComparisonTable
--	@returns		{string} Preformatted text of CSV text
function p._csvModComparisonTable()
	-- Header names will also be key names in Module:Mods/data
	-- Update this if you want more CSV columns
	local tableHeader = { 
		'Introduced',
		'IntroducedDate',
		'Name',
		}
	
	return p._csvModTable(tableHeader)
end

---	Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
--	@function		p.csvModTable
--	@returns		{string} Preformatted text of CSV text
function p.csvModTable(frame)
	return '<pre>'..p._csvModComparisonTable()..'</pre>'
end

return p
