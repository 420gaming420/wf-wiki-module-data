---	'''Acquisition''' builds the acquisition table for Warframes, Weapons, and Arcanes.
--	
--	Acquisition can be invoked directly (`&lbrace;{#invoke:Acquisition|buildTable|...}}`) 
--	or invoked from a template (`&lbrace;{Acquisition|...}}`)
--	
--	On this Wiki, Acquisition is used in:
--	* [[Template:Acquisition]]
--	
--	@module			acquisition
--	@alias			t
--	@author			[[User:gigamicro|gigamicro]] (rewrite)
--	@attribution	[[User:FINNER|FINNER]] (original)
--	@attribution	[[User:Trajos|Trajos]]
--	@image			AcquisitionPic.png
--	@require		[[Module:DropTables/data]]
--	@require		[[Module:Blueprints/data]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

-- TODO: Add support for I18n and I10n
local DropData = mw.loadData [[Module:DropTables/data]]
local BlueprintData = mw.loadData [[Module:Blueprints/data]]
local Tooltips = require [[Module:Tooltips]]

local function join(a, sep, b)
	if a == '' then a = nil end
	if b == '' then b = nil end
	if a and b then return a..sep..b end
	return a or b or ''
end
table.unpack = table.unpack or unpack	-- for Lua 5.2. and Lua 5.3 compatibility

return (function(t)
	t.buildTable = t['']
	t.__main = t['']
	return t
end) {
---	Builds item acquisition wikitable with five columns:
--	item name, drop table source, drop chance, expected number of runs, almost guaranteed number of runs
--	@function		t.buildTable
--	@param			{table} frame Frame object with first argument being the item name
--							and second argument being the description to add before wikitable
--	@return			{string} Resultant wikitext of wikitable
[''] = function(frame, ...)
	if type(frame) ~= 'table' then
		frame = { args = {frame, ...} }
	end
	local name, desc = mw.text.decode(frame.args[1]), frame.args[2]

	-- Blueprint components
	local bpReqs
	local isWeapon = false
	if (frame.args.blueprint or '') ~= '' then
		bpReqs = { _custom = true }
		for s in frame.args.blueprint:gmatch('%a%P+%a') do--equinox :Þ
			table.insert(bpReqs, { Count=1, Name = s:gsub('^.', string.upper), Type="Item" })
		end
	elseif BlueprintData.Blueprints[name] then
		bpReqs = BlueprintData.Blueprints[name].Parts
		isWeapon = true
	else
		bpReqs = (BlueprintData.Suits[name] or {}).Parts or
			-- Default blueprint requirements (for Warframes)
			{
				{ Count = 1, Name = "Systems", Type = "Item" },
				{ Count = 1, Name = "Chassis", Type = "Item" },
				{ Count = 1, Name = "Neuroptics", Type = "Item" },
				_default = true,
			}
	end
	
	-- table.insert(bpReqs,1,{Count=1, Name="", Type="Item"})
	bpReqs = {
		{ Count = 1, Name = "", Type = "Item" },
		bpReqs[1], bpReqs[2], bpReqs[3], bpReqs[4],
		bpReqs[5], bpReqs[6], bpReqs[7], bpReqs[8],	-- Additional 4 bp requirements for base Equinox
		_default = bpReqs._default,
		_custom = bpReqs._custom,
	}
	
	-- Drop locations per component
	local source	-- module where the base item can be found
	local dropLocations = {}
	for i, item in ipairs(bpReqs) do
		-- TODO: Some of these conditions may not work with non-English localized item names, may need updating to target internal names
		if item.Count <= 2 and item.Type == 'Item' and item.Name ~= 'Forma' and item.Name ~= 'Omni Forma' then
			local itemName = join(name, ' ', item.Name)	-- For combining item name with item part name (e.g. "Ember" + "Neuroptics" = "Ember Neuroptics")
			local partName = item.Name == '' and name or item.Name
			if isWeapon and partName == "Chassis" then
				partName = "Gun Chassis"
			end
			local index = nil

			if name == 'Equinox' then
				if partName:sub(-6) == 'Aspect' then
					-- For Equinox Day/Night Aspect
					index = Tooltips._getIndex(itemName, 'Resources')
				else
					-- For Equinox Day/Night Chassis/Neuroptics/Systems
					index = Tooltips._getIndex(partName:gsub('[DN][ai][yg]h?t? ', ''), 'Resources')
				end
			else
				index =	Tooltips._getIndex(partName, 'Resources') or 
					Tooltips._getIndex(partName, 'Warframes') or 
					Tooltips._getIndex(partName, 'Arcane') or 
					Tooltips._getIndex(partName, 'Companions') or 
					Tooltips._getIndex(partName, 'Weapons') or 
					nil
			end
			
			local icon = Tooltips.icon(partName, nil, index)
			source = source or item.Name == '' and index and index[1]
			-- TODO: Unclear why we need to make an exception for Arcanes and not also include the Arcane's
			-- name. Is it b/c the arcane articles already have the name of the arcane as the page name so it is redundant?
			if source == 'Arcane' then
				dropLocations = { [itemName] = { name = '', icon = icon } }
				bpReqs._default = nil
				break
			end
			if name == 'Broken War' and item.Name ~= '' then
				itemName = 'War '..item.Name
			end
			-- TODO: Find a better solution of handling weapon components. As of 2023-02-24 we don't explicitly
			-- store individual weapon components in M:Resources/data. We have them stored as generic weapon components instead.
			
			-- Corufell has a Barrel component that uses a GenericWeaponBlade.png image so
			-- it has its own unique entry in M:Resources/data.
			-- Hacky solution right now is to use full part names for Corufell blueprint requirements
			-- in [[Module:Blueprints/data]], but you will get:
			-- itemName == "Corufell Corufell Barrel"
			-- partName == "Corufell Barrel"
			if name == 'Corufell' then
				itemName = partName
			end
			
			dropLocations[itemName] = { name = item.Name, icon = icon }--,quantity=item.Count>1 and item.Count}
			dropLocations[join(itemName, ' ', 'Blueprint')] = { name = item.Name, icon = icon, isBP = true }
		end
	end
	for itemName, dropLocation in pairs(dropLocations) do
		for _, loc in ipairs(DropData.Rewards[itemName] or {}) do
			table.insert(dropLocation, loc)
		end
	end

	-- Wikitable assembly
	local result = { desc or '', '\n<div style="', (frame.fullwidth and frame.fullwidth ~= '') and '' or 'overflow-x:auto;', '">\n', [=[
{| style="width:100%; text-align:center; margin:0;" class="article-table sortable acquisition-table" cellspacing="1" cellpadding="1" border="0"
|-
! style="text-align:left  " | Item
! style="text-align:center" | Source
! style="text-align:center" | Chance
! style="text-align:center" class="unsortable" | Expected
! style="text-align:center" class="unsortable" | Nearly Guaranteed
|-
]=], [0] = [=[
|}</div>
<small>All drop rates data is obtained from [https://warframe.com/droptables DE's official drop tables] stored on [[Module:DropTables/data]].
See [[Mission Rewards#Standard Missions]] for definitions on reward table rotations.<br />
<sup style="font-style:italic">For more detailed definitions and information,
visit [[User blog:FINNER/Warframe Expected & Nearly Guaranteed Numbers - An Explanation|here]].</sup></small>]=]
		..(bpReqs._default and "[[Category:DefaultBlueprintData]]" or '')
		..(bpReqs._custom and "[[Category:CustomBlueprintData]]" or '')
	}
	
	for item, dropLocation in pairs(dropLocations) do
		for _, loc in ipairs(dropLocation) do
			-- Note loc[1] is category; loc[2] is sources key; loc[3] is rotation name ("A", "B", "C")
			local source = DropData[loc[1]][loc[2]]

			local link = source.Link and ('[['..source.Link..(source.Link:find('#') and '' or '#Locations')..'|'..source.Name..']]')
			or loc[1] == 'Enemies' and ('[['..(source.Name or loc[2])..']]')
			
			-- Determine localization for Expected and Nearly Guaranteed counts
			-- e.g. "Kills" when the context is enemy drops ("~200 Kills")
			-- Note: first nil is just used for code formatting so the values line up
			local event = nil
				or source.Type == 'Assassinate' and 'Kills' 	-- # of boss kills
				or loc[1] == 'Missions' and source.Type:sub(-6) == 'Bounty' and 'Stages'	-- # of bounty stages
				or type(loc[3]) == 'string' and loc[3]:sub(2)=='' and loc[3]..
					(loc[2]:sub(-6) == 'Caches' and ' Caches' or ' Rotations')	-- # of resource caches or rotations if loc[3] is a single rotation letter like "A", "B" or "C"
				or loc[1] == 'Enemies' and 'Kills'	-- # of enemy kills
				or loc[1] == 'Containers' and 'Opens'	-- # of containers opened
				or 'Runs'

			local prob = loc.Probability
			local pow = -1 / math.log10(1 - prob) -- # of runs for 10% failure or 90% probability of receiving item at least once

			table.insert(result,
				('| style="text-align:left" | %s || %s || class="AcqProb" | %.2f%% || ~ %d %s || %d ± %d %s\n|-\n'):format(
					join(dropLocation.icon, '&nbsp;', join(dropLocation.name, ' ', dropLocation.isBP and 'Blueprint')),	-- Item name
					-- Drop source; if there exists a rotation B table, then it must have two or three rotation drop tables (A and B OR A, B, C)
					join(link or source.Name, ' / ', loc[3]:sub(2) == '' and source.Rewards.B and source.Rewards.B[1] and loc[3]),
					100 * prob,	-- Base chance of dropping as %
					1 / prob,	-- Expected number of rolls before getting at least one item
					event,
					3 * pow,	-- Number of rolls a player would need to get a 99.9% probability of receiving item at least once
					-- See https://wiki.warframe.com/w/WARFRAME_Wiki:Warframe_Expected_%26_Nearly_Guaranteed_Numbers_-_An_Explanation
					pow,
					event
				)
			)
		end
	end

	if not result[6] then
		for k,t in pairs(dropLocations) do
			if not pcall(function()t.icon=nil end) then
				dropLocations[k] = {}
				for kk, v in pairs(t) do
					if kk ~= 'icon' then
						dropLocations[k][kk] = v
					end
				end
			end
		end
		mw.log(mw.dumpObject(dropLocations))
		error('t.buildTable(frame, ...): no wikitable rows made for "'..name..'". This item may be nonexistent (in [[Module:DropTables/data]] or [[Module:Blueprints/data]]) and/or upcoming.')
	end

	table.insert(result, result[0])
	return (table.concat(result):gsub('%.00%%', '%%'))
end
}
