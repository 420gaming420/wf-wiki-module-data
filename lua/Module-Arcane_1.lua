---	'''Arcane''' stores data about [[WARFRAME]]'s [[Arcane Enhancements]].<br />
--	
--	On this Wiki, Arcane is used in:
--	
--	@module		arcane
--	@alias		p
--	@author		[[User:Flaicher|Flaicher]]
--	@image		IconArcane.png
--	@require	[[Module:Arcane/data]]
--	@require	[[Module:String]]
--	@release	stable
--	

local p = {}

local ArcaneData = mw.loadData('Module:Arcane/data')
local String = require('Module:String')

---	Gets the specified raw value of an arcane as seen in <code>/data</code>.
--	@function		p.getValueRaw
--	@param			{table} frame
--	@return			{string, number} Raw value of arcane
function p.getValueRaw(frame)
	local arcaneName = frame.args[1]
	local valName = frame.args[2]
	return ArcaneData['Arcanes'][arcaneName][valName]
end

---	Gets the specified value of an arcane.
--	@function		p.getValue
--	@param			{table} frame
--	@return			{string, number} Arcane value
function p.getValue(frame)
	local arcaneName = frame.args ~= nil and frame.args[1] or nil
	local valName = frame.args ~= nil and frame.args[2] or nil
	
	local value = p._getValue(arcaneName, valName)
	assert(value ~= nil, 'p.getValue(frame): cannot find arcane "'..arcaneName..'" or its value "'..valName..'"')
	return value
end

---	Gets the specified value of an arcane.
--	@function		p._getValue
--	@param			{string} arcaneName Name of arcane
--	@param			{string} valName Name of value
--	@return			{string, number} Arcane value
function p._getValue(arcaneName, valName)
	assert(arcaneName ~= nil, 'p._getValue(arcaneName, valName): no arcane specified')
	assert(valName ~= nil, 'p._getValue(arcaneName, valName): no value specified for arcane "'..arcaneName..'"')
	
	arcaneName = String.trim(arcaneName)
	valName = String.trim(valName)
	
	if (ArcaneData['Arcanes'][arcaneName] == nil) then return nil end
	
	local Arcane = ArcaneData['Arcanes'][arcaneName]
	
	local upName = string.upper(valName)
	if (upName == 'NAME') then return arcaneName
	elseif(upName == 'IMAGE') then return Arcane.Image or 'Arcane Placeholder 160.png'
	elseif(upName == 'DESCRIPTION') then return Arcane.Description or 'N/A'
	elseif(upName == 'MAXRANK') then return Arcane.MaxRank or 'N/A'
	elseif ArcaneData['Arcanes'][arcaneName][valName] ~= nil then
		return ArcaneData['Arcanes'][arcaneName][valName]
	end
	error('p._getValue(arcaneName, valName): cannot find arcane "'..arcaneName..'" or value name "'..valName..'"')
end

---	Returns a wikitable of all [[Arcane Dissolution]] values of Arcanes as seen on [[Vosfor#Acquisition]].
--	@function		p.getDissolutionTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getDissolutionTable(frame)
	local Table = require('Module:Table')
	local Tooltip = require('Module:Tooltips')
	
	local t = {}
	local cannotsell = {}
	for _, arcane in Table.skpairs(ArcaneData['Arcanes']) do
		if (arcane.Dissolution ~= false) then
			t[arcane.Dissolution] = t[arcane.Dissolution] or {}
			table.insert(t[arcane.Dissolution], Tooltip.full(arcane.Name, 'Arcane'))
		else
			table.insert(cannotsell, Tooltip.full(arcane.Name, 'Arcane'))
		end
	end

	--sort
	local keys = {}
	for vosfor, _ in pairs(t) do
		table.insert(keys, vosfor)
	end
	table.sort(keys)

	local result = {[[
{| class="wikitable sortable" style="border:1px solid black; width:100%; border-collapse:collapse; text-align:center;"
|-
! style="white-space:nowrap; width:20%;" data-sort-type="number" | Vosfor !! Arcanes]]}
	table.insert(result, '|-\n|<b>Cannot Sell</b>||'..table.concat(cannotsell, ', '))
	for _, vosfor in ipairs(keys) do
		table.insert(result, '|-\n|'..Tooltip.icon('Vosfor', 'Resources')..' <b>'..vosfor..'</b>||'..table.concat(t[vosfor], ', '))
	end
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

return p
