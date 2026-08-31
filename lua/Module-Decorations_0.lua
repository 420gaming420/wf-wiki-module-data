---	'''Decorations''' stores data about [[WARFRAME]]'s [[Clan Dojo]] [[decorations]].<br />
--	
--	On this Wiki, Decorations is used in:
--	* [[Decorations]]
--	
--	@module		decorations
--	@alias		p
--	@author		[[User:FINNER|FINNER]]
--	@image		
--	@require	[[Module:Decorations/data]]
--	@require	[[Module:Table]]
--	@require	[[Module:Math]]
--	@require	[[Module:Tooltips]]
--	@release	stable
--	

local p = {};

local DecorationData = mw.loadData('Module:Decorations/data');
local Table = require('Module:Table');
local Math = require('Module:Math');
local Tooltip = require('Module:Tooltips');

-- TODO: May use a map instead of an array, e.g.
--[[
local clanMultipliers = {
	Ghost = 1,
	Shadow = 3,
	Storm = 10,
	Mountain = 30,
	Moon = 100
};
]]--
local clanMultipliers = { 1, 3, 10, 30, 100 };

--- Calculates multiplied clan resource costs.
--	@function		getNum
--	@param			{number} num Base resource cost for a decoration
--	@param			{number} multiplier Resource multiplier
--	@param			{boolean} bool If true, sets multiplier to 1; does nothing otherwise
--	@return			{number} Multiplied clan resource cost
local function getNum(num, multiplier, bool)
	if bool then multiplier = 1; end

	num = math.floor((num + 0) * multiplier);

	if num < 1 then num = 1; end
	return num;
end

--- Builds a table row for a single decoration item wikitable.
--	@function		buildRow
--	@param			{table} rowData Decoration data
--	@param			{table} result Contains wikitable elements
--	@return			{table} Contains wikitable elements
local function buildRow(rowData, result)
	local costData = rowData.Cost;
	local resourceData = costData.Resources;
	local count = 1;
	for _ in ipairs(resourceData) do
		count = count + 1;
	end
	
	-- TODO: use string.format() instead of all this concantenation
	local itemCol = '\n! rowspan="'..count..'" | '..rowData.Name..'<br>[[File:'..rowData.Image..'|150px]]<br>Capacity: -'..costData.Capacity..'<br>Build Time: '..costData.Time..' hours';
	table.insert(result, itemCol);

	table.insert(result, '\n| style="font-size: 90%;" | '..Tooltip.full('Credits', "Resources"));

	local creds = costData.Credits;
	local static = rowData.Static;
	for _, multi in ipairs(clanMultipliers) do
		table.insert(result, '\n| style="font-size: 90%;" | '..Math.formatnum(getNum(creds, multi, static)));
	end

	for i, res in ipairs(resourceData) do
		local amount = res.Count;
		local backgroundColor = "none";

		table.insert(result, '\n|- style="font-size:90%; background-color:'..backgroundColor..';"');

		table.insert(result, '\n| '..Tooltip.full(res.Name, "Resources"));

		for j = 1, 5 do
			table.insert(result, '\n| '..Math.formatnum(getNum(amount, clanMultipliers[j], static)));
		end
	end
	
	table.insert(result, '\n|-\n| style="text-align:center;" colspan=7 | '..rowData.Description);
	
	return result;
end

--- Builds a wikitable of decorations for a decoration category.
--	@function		buildTable
--	@param			{string} name Decoration name
--	@return			{string} Wikitext of wikitable
local function buildTable(name)
	local DecorationEntry = DecorationData[name];

	local result = {};
	local tHead = [[
{| class="navbox" style="margin-bottom:20px;"
|- class="navboxhead"
! style="width:25%;" | Item
! style="width:20%;" | Resources
! style="width:11%;" | Ghost
! style="width:11%;" | Shadow
! style="width:11%;" | Storm
! style="width:11%;" | Mountain
! style="width:11%;" | Moon
|-]];
	
	for _, v in Table.skpairs(DecorationEntry) do
		table.insert(result, tHead);
		result = buildRow(v, result);
		table.insert(result, '\n|}\n');
	end

	return table.concat(result);
end

--- Builds a wikitable of decorations for a decoration category.
--	@function		buildTable
--	@param			{table} frame
--	@return			{string} Wikitext of wikitable
function p.buildTable(frame)
	return buildTable(frame.args[1]);
end

--- Calculates resource value based on clan dojo tier multiplier.
--	@function		p.DojoCalc
--	@param			{table} frame
--	@return			{string} Total resource value
function p.DojoCalc(frame)
	local num = frame.args ~= nil and frame.args[1] or nil
	local mult = frame.args ~= nil and frame.args[2] or nil
	
	if num == nil or mult == nil then
		return "num or mult = nil"
	end
	local tempNum = math.floor(tonumber(num)*tonumber(mult),0)
	if tempNum == 0 then
		return 1
	end
	return Math.formatnum(tempNum)
end

return p
