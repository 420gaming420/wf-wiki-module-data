---	'''DropTables''' stores drop table data from the official WARFRAME drop table repository.<br />
--	
--	On this Wiki, DropTables is used in:
--	* [[Template:RelicTable]]
--	* [[Template:DropLocations]]
--	
--	@module		droptables
--	@alias		p
--	@author			[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Croquemorttime|Croquemorttime]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:FINNER|FINNER]]
--	@image		SampleMissionDropTable.png
--	@require	[[Module:DropTables/data]]
--	@require	[[Module:Missions/data]]
--	@require	[[Module:String]]
--	@require	[[Module:Icon]]
--	@require	[[Module:Table]]
--	@require	[[Module:Void]]
--	@require	[[Module:Math]]
--	@release	stable
--	

--Rewritten version of Module:DropTables to work with new format of data.

--NOTE: I'm currently in the process of copying over a new data format
-- It should be easier to keep up to date, but things may be a bit screwy over the next hour or two
-- Please do not revert this update without checking with me.
-- (For the fastest response, ping me on the Wiki discord)
-- User:Falterfire, 1/6/18

-- TODO: Create a new p._getMissionList(dropTableAlias) function
-- that returns a table instead of a wikitext string (for module use)

-- TODO: Update all drop chances in M:DropTables/data to be in decimal form
-- instead of being a percentage. Formatting of drop chances should be done in modules
-- not when they are stored as data. Doing so removes the need of dividing drop chances by 100
-- in here before passing into Math.percentage() for formatting.

--For reference:
--	in DropData["Missions"].Rewards
local NAME_COL = 1	-- Name of the drop
local TYPE_COL = 2	-- Type of thing dropped (IE Mod, Endo, Credits)
local CHANCE_COL = 3-- Chance for the thing to drop -- Chance of item dropping
local COUNT_COL = 4	-- Number of things dropped. If empty, default to 1. Normally only different for Endo
local CHANCE_MULTIPLIER = 1/100-- set to one when the data gets updated

local p = {}

local Delay = require[[Module:Delay]]
local DropData = Delay.mw.loadData[[Module:DropTables/data]]
local VoidData = Delay.mw.loadData[[Module:Void/data]]
local MissionData = Delay.mw.loadData[[Module:Missions/data]]
local Icon = Delay.require[[Module:Icon]] -- ._Item
local String = Delay.require[[Module:String]] -- .split
local Table = Delay.require[[Module:Table]] -- .size, .skpairs
local Void = Delay.require[[Module:Void]] -- .RELIC_TIER_ORDER
local Tooltip = Delay.require[[Module:Tooltips]] -- .full

---	Looks through a drop table and appends drop source to list if drop table
--	contains specified item.
--	@function		addDropFromDropTable
--	@param			{string} itemName Item name to be searched
--	@param			{table} dropTable Enemy drop table entry as as seen in <code>/data</code>
--	@param			{string} subTableName Name of drop table w/o "s" (e.g. "Resource" or "Sigil")
--	@param			{table} dropSourceList List of drop sources of item in the format:
--							{
--								Name = drop table name,
--								Link = article link,
--								DropTableType = drop table type (e.g. "Mod" or "Resource"),
--								DropTableChance = drop table chance,
--								ItemChance = individual item chance,
--								Chance = calculated drop chance,
--								Count = Item count rewarded on successful roll
--							}
local function addDropFromDropTable(itemName, dropTable, subTableName, dropSourceList)
	for _, drop in ipairs(dropTable[subTableName..'s'] or {}) do
		if (drop[NAME_COL] == itemName) then
			table.insert(dropSourceList, {
					Name = dropTable.Name,
					Link = dropTable.Link or dropTable.Name,	-- TODO: Use name as fallback until M:Enemies/data is populated, afterwards remove the fallback
					DropTableType = subTableName,
					-- Chances are in percentage form not decimals
					DropTableChance = dropTable[subTableName..'Chance'],
					ItemChance = drop[CHANCE_COL],
					Chance = dropTable[subTableName..'Chance'] * drop[CHANCE_COL] * CHANCE_MULTIPLIER,
					-- TODO: Somehow represent a wildcard number for region resources that have a range of values
					-- as possible drops
					-- Do not add a fallback value like in the case of some region resources with varying drop amounts
					Count = drop[COUNT_COL] or 1
				} )
			-- Breaking early despite there being the possibility that there can be two same entries in the same drop table
			break
		end
	end
end

---	Gets mission drop table by Alias.
--	@function		p._getMissionDropTable
--	@param			{string} missionAlias Alias key value as seen in <code>/data</code>
--	@return			{table} Mission drop table entry from <code>/data</code>
function p._getMissionDropTable(missionAlias)
	assert(missionAlias ~= nil, 'p._getMissionDropTable(missionAlias): missionAlias cannot be a nil value')
	return DropData["Missions"][missionAlias] or error('p._getMissionDropTable(missionAlias): "'..missionAlias..'" does not exist in [[Module:DropTables/data]]')
end

---	Basically pretending to be semi-object oriented
--	Calling this whenever I'm pulling drops from enemies and passing them around
--	NOTE: As of writing, this assumes enemies don't have Blueprint or other drops listed.
--	TODO: buildEnemyDrop(), buildMissionDrop(), buildResourceDrop(),
--	and etc. can probably be in a single buildDrop function that passes in a table/function
--	argument telling how to format drops
--	@function		buildEnemyDrop
--	@param			{table} Enemy Enemy drop table entry
--	@param			{table} Mod Mod drop entry
local function buildEnemyDrop(Enemy, Mod)
	return {
		EnemyName = Enemy.Name,
		ItemName = Mod[NAME_COL],
		Chance = (Enemy.ModChance * Mod[CHANCE_COL]) * CHANCE_MULTIPLIER,
		Count = Mod[COUNT_COL] ~= nil and Mod[COUNT_COL] or 1,
		Type = Mod[TYPE_COL]
	}
end

---	Returns a table of a single drop from a mission's drop table.
--	@function		buildMissionDrop
--	@param			{table} missionDropTable Mission drop table entry as seen in <code>/data</code>
--	@param			{string} rotation Rotation name (e.g. "A", "B", or "C")
--	@param			{table} itemTable A single item drop entry within a drop table (e.g. { "Endo", 25, 15 })
--	@return			{table} A table containing a single item from a mission drop table
local function buildMissionDrop(missionDropTable, rotation, itemTable)
	return {
		MissionType = missionDropTable.Type,
		-- Some mission types use a different article name (e.g. Rush gamemode uses "Rush (Archwing)")
		-- In the case we decouple article links from M:DropTables/data 
		-- (e.g. using Tier/Type key to map to article name instead of storing explicit Link key), 
		-- use MissionData.MissionTypes[missionDropTable.Type].Link
		MissionLink = missionDropTable.Link,
		MissionTier = missionDropTable.Alias,
		Rotation = rotation,
		ItemName = itemTable[NAME_COL],
		Chance = itemTable[CHANCE_COL],
		Count = itemTable[COUNT_COL] ~= nil and itemTable[COUNT_COL] or 1,
		Type = itemTable[TYPE_COL],
		-- Just go ahead and tag this on because who knows what we'll need from it
		Mission = missionDropTable
	}
end

local function linkEnemy(enemyName)
	if not enemyName then
		return "No name specified."
	end
	-- Cut off enemy names before parentheses while linking
	local paren = string.find(enemyName, "%(")
	local result = ""
	if (paren ~= nil) then
		result = "[["..string.sub(enemyName, 1, paren - 2).."|"..enemyName.."]]"
	elseif (enemyName == "Fissure Corrupted Enemy") then
		result = "[[Void Fissure|"..enemyName.."]]"
	elseif (enemyName == "Dargyn" or enemyName == "Carrier") then
		result = "[["..enemyName.." (Enemy)".."|"..enemyName.."]]"
	else
		result = "[["..enemyName.."]]"
	end
	return result
end

---	Custom table sort for reward tables
--	WIP, initial rules:
--	Sort first by type, then alphabetically within type, then by quantity
--	WIP try sorting first by drop chance...
--	TODO: Finish this function
--	@function		rewardTableSort
local function rewardTableSort(theTable)
	local function sorter(r1, r2)
		if r1.Chance ~= r2.Chance then
			return r1.Chance > r2.Chance
		end
		if r1.Type ~= r2.Type then
			return r1.Type < r2.Type
		end
		if r1.ItemName ~= r2.ItemName then
			return r1.ItemName < r2.ItemName
		end
		return r1.Count < r2.Count
	end

	table.sort(theTable, sorter)
end

---	Custom table sort for Enemy tables
--	Rules:
--	Sort first by Drop Chance, then alphabetically within Drop Chance with Endo being last
--	@function		enemyTableSort
local function enemyTableSort(theTable)
	local function sorter(r1, r2)
		if r1.Chance ~= r2.Chance then
			return r1.Chance > r2.Chance
		end
		if r1.Count ~= r2.Count then
			return r1.Count < r2.Count
		end
		return r1.ItemName < r2.ItemName
	end

	table.sort(theTable, sorter)
end

---	Formats a string of text for a reward table
--	(NOTE: ALWAYS USES TWO COLUMNS)
--	Format is
--	[Icon] [Quantity] [Item Name with Link] || [Drop Chance]]
--	With some slight variation based on drop type
--	Variation is mostly helpful for getting the right icon
--	TODO: Nested if/else code blocks can probably be formatted as a map
--	@function		formatDropString
local function formatDropString(drop)
	local result = ""
	local dropType = drop.Type
	local iconText = ""
	if (dropType == "Resource") then
		iconText = Tooltip.full(drop.ItemName, "Resources")
	elseif (dropType == "Arcane") then
		iconText = Tooltip.full(drop.ItemName, "Arcane")
	elseif (dropType == "Scene") then
		--iconText = Icon._Item("Scene", nil, nil)
		result = result.."[[Captura|"..drop.ItemName.."]]"
	elseif (dropType == "Endo") then
		iconText = Icon._Item("Endo", nil, nil)
		result = result.."[[Endo]]"
	elseif (dropType == "Ayatan Sculpture") then
		--iconText = Icon._Item(drop.ItemName)
		result = "[[Ayatan Sculpture|"..drop.ItemName.."]]"
	elseif (dropType == "Mod") then
		iconText = Tooltip.full(drop.ItemName, "Mods")
	elseif (dropType == "Relic") then
		local relicName = drop.ItemName
		-- Mimicking frame object in order to replace displayed text with "<relic_name> (Radiant)"
		iconText = Tooltip.full{ args = { string.gsub(relicName, " %(Radiant%)", ""), "Void", r = relicName } }
	elseif (dropType == "Credits") then
		iconText = Icon._Item("Credits", nil, nil)
		result = result.."[[Credit Cache]]"
	elseif (dropType == "Blueprint") then
		local pieces = String.split(drop.ItemName, "%s")
		local BPType = pieces[2]
		local BPName = pieces[1]
		local linkString = pieces[1]
		--Change the link for Eidolon Lenses from Eidolon to the correct page
		if linkString == 'Eidolon' then
			linkString = 'Focus Lens#Eidolon Lenses'
		end
		
		if (BPName == "Vidar" or BPName == "Lavan" or BPName == "Zetki") then
			iconText = Icon._Item("Blueprint", nil, nil)
			linkString='Railjack/Components'
		elseif (BPType == "Cerebrum") then 
			iconText = Icon._Item("Neuroptics", nil, nil) -- see below
		elseif (BPType == "Carapace") then
			iconText = Icon._Item("Chassis", nil, nil) -- fix for nautilus icons
		elseif (BPName == "Forma") then
			iconText = Icon._Item("Forma", nil, nil)
		elseif (BPName == "Miter" and BPType == "Chassis") then
			--a workaround for displaying proper icons for Miter parts
			iconText = Icon._Item("Stock", nil, nil)
		elseif (BPName == "Miter" and BPType == "Handle") then   
			--because Miter has oddly named parts
			iconText = Icon._Item("Receiver", nil, nil)
		elseif (BPName == "Shedu" and BPType == "Chassis") then
			--a workaround for displaying proper icons for Shedu parts
			iconText = Icon._Item("Stock", nil, nil)
		elseif (BPName == "Vesper" and pieces[2] == "77") then
			if pieces[3] == "Handle" then
				iconText = Icon._Item("Stock", nil, nil)
			else
				iconText = Icon._Item(pieces[3], nil, nil)
			end
			linkString = "Vesper 77"
		elseif (BPType == "Systems") then
			iconText = Icon._Item("Systems", nil, nil)
		elseif (BPType == "Chassis") then
			iconText = Icon._Item("Chassis", nil, nil)
		elseif (BPType == "Neuroptics") then
			iconText = Icon._Item("Neuroptics", nil, nil)
		elseif (BPType == "Fuselage") then
			iconText = Icon._Item("Fuselage", nil, nil)
		elseif (BPType == "Engines") then
			iconText = Icon._Item("Engines", nil, nil)
		elseif (BPType == "Avionics") then
			iconText = Icon._Item("Avionics", nil, nil)
		elseif (BPType == "Barrel") then
			iconText = Icon._Item("Barrel", nil, nil)
		elseif (BPType == "Stock") then
			iconText = Icon._Item("Stock", nil, nil)
		elseif (BPType == "Receiver") then
			iconText = Icon._Item("Receiver", nil, nil)
		elseif (BPType == "Blade") then
			iconText = Icon._Item("Blade", nil, nil)
		elseif (BPType == "Glove") then
			iconText = Icon._Item("Glove", nil, nil)
		elseif (BPType == "Gauntlet") then
			iconText = Icon._Item("Blade", nil, nil)
		elseif (BPType == "String") then
			iconText = Icon._Item("Stock", nil, nil)
		elseif (pieces[3] == "Wraith") then
			--A workaround for Twin Vipers Wraith
			linkString = pieces[1].." "..pieces[2].." "..pieces[3]
			iconText = Icon._Item(pieces[#pieces], nil, nil)
		elseif (pieces[2] == "Wraith" or pieces[2] == "Vandal" or pieces[1] == "Carmine") then
			--Now a workaround for Wraith & Vandal things to link them properly. U29.10 > now works with carmine penta
			--In theory works for any Wraith/Vandal item
			linkString = pieces[1].." "..pieces[2]
			if(pieces[3] ~= "Blueprint") then
				if (BPName == "Spectra" and pieces[#pieces] == "Chassis") then
					--a workaround for displaying proper icons for Spectra parts
					iconText = Icon._Item("Stock", nil, nil)
				elseif (BPName == "Spectra" and pieces[#pieces] == "Handle") then   
					--because Spectra has oddly named parts
					iconText = Icon._Item("Receiver", nil, nil)
				else
				iconText = Icon._Item(pieces[#pieces], nil, nil)
				end
			else
				iconText = Icon._Item("Blueprint", nil, nil)
			end
		elseif (BPType == "Handle") then
			iconText = Icon._Item("Handle", nil, nil)
		elseif (BPName=="Ancient" or BPName=="Charger" or BPName=="Clem") then
			iconText = Icon._Item("Blueprint", nil, nil)
			linkString = "Specter"
		elseif (pieces[3] == "Blueprint") then
			--a workaround for Eidolon Lens BP or Twin Gremlins BP to link proper pages
			--should work for other 3 part blueprint names as well
			linkString = pieces[1].." "..pieces[2]
			iconText = Icon._Item("Blueprint", nil, nil)
		elseif (pieces[1] == "Equinox") then
			--a workaround for Equinox's 4 piece names
			if (pieces[3] == "Systems") then
				iconText = Icon._Item("Systems", nil, nil)
			elseif (pieces[3] == "Chassis") then
				iconText = Icon._Item("Chassis", nil, nil)
			elseif (pieces[3] == "Neuroptics") then
				iconText = Icon._Item("Neuroptics", nil, nil)
			else
				iconText = Icon._Item("Blueprint", nil, nil)
			end
		elseif (pieces[3] == "Ephemera") then
			iconText = Icon._Item("Blueprint", nil, nil)
			linkString = "Ephemera"
		elseif (BPName == "Arum") then
			-- workarounf for arum spinosa 
			linkString = pieces[1].." "..pieces[2]
			if (pieces[3]=="Blueprint") then 
				iconText = Icon._Item("Blueprint", nil, nil) -- this one is superfluous 
			elseif (pieces[3]=="Guard") then 
				iconText = Icon._Item("Pouch", nil, nil)
			elseif (pieces[3]=="Rivet") then 
				iconText = Icon._Item("Link", nil, nil)
			end
		else
			iconText = Icon._Item("Blueprint", nil, nil)
		end
		result = result.."[["..linkString.."|"..drop.ItemName.."]]"
		
	elseif (dropType == "Fragments") then
	--	iconText = Icon._Item("Mutate", nil, nil)
		result = result.."[[Fragments|"..drop.ItemName.."]]"
	elseif (dropType == "Sigil") then
		result = result..Tooltip.full(drop.ItemName, "Sigils")
	elseif (dropType == "Item") then
		result = result..Tooltip.full(drop.ItemName, "Resources")
	else
		result = result..drop.ItemName
	end
	
	if (drop.Count > 1) then
		result = "x".. mw.language.getContentLanguage():formatNum(drop.Count) .." "..result
	end
	
	result = iconText.." "..result.." || "..(drop.Chance * 100 * CHANCE_MULTIPLIER).."%"
	
	return result
end

---	Returns a table of all rewards for a given mission, split by rotation.
--	@function		getRewardsForMission
--	@param			{table} mission Mission table entry as seen in <code>/data</code>
--	@return			{table} List of formatted mission rewards
local function getRewardsForMission(mission)
	local result = {}
	
	if (mission.Rewards ~= nil) then
		for key, dropTable in Table.skpairs(mission.Rewards) do
			local temp = {}
			
			for i, drop in pairs(dropTable) do
				table.insert(temp, buildMissionDrop(mission, key, drop))
			end
			
			rewardTableSort(temp)
			result[key] = temp
		end
	end
	
	return result
end
 
---	Gets the list of missions that give rewards for a specific Alias (e.g. "Defense1").
--	@function		p._getMissionTable
--	@param			{string} missionDropTableAlias
--	@return			{table} List of mission nodes with the specified drop table
function p._getMissionTable(missionDropTableAlias)
	local data = {}
	for _, m in ipairs(MissionData["MissionDetails"]) do
		if (m.DropTableAlias == missionDropTableAlias or 
				m.CacheDropTableAlias == missionDropTableAlias or
				m.ExtraDropTableAlias == missionDropTableAlias) then
			table.insert(data, m)
		end
	end
	return data
end

-- tODO: Rename this function with an underscore prepended to match convention
---	Gets a list of missions with rewards for a given planet.
--	@function		p.getMissionsForPlanet
--	@param			{string} planetName Name of planet
--	@return			{table} List of mission node table entries as seen in M:Missions/data
function p.getMissionsForPlanet(planet)
	local missions = {}
	
	for _, m in pairs(MissionData["MissionDetails"]) do
		if (m.Planet == planet and m.DropTableAlias == 'Landscape') then
			for _, n in pairs(DropData["Missions"]) do
				-- TODO: Could replace table constructor with a Table.clone()
				local mData = { Name = m.Name, Planet = m.Planet, Type = m.Type, IsDarkSector = m.IsDarkSector, Tileset = m.Tileset, Enemy = m.Enemy, MinLevel = m.MinLevel, MaxLevel = m.MaxLevel, DropTableAlias = m.DropTableAlias, Pic = m.Pic }
				-- TODO: Combine both of these if statements
				if (planet == 'Earth') and (n.Type == 'Cetus Bounty' or n.Type == 'Cetus Bounty (Steel Path)' or n.Type == 'Ghoul Bounty') and (n._IgnoreEntry ~= true) then
					mData.Type = n.Type; mData.DropTableAlias = n.DropTableAlias; mData.MinLevel = n.Name
				elseif (planet == 'Venus') and (n.Type == 'Orb Vallis Bounty' or n.Type == 'Orb Vallis Bounty (Steel Path)') and (n._IgnoreEntry ~= true) then
					mData.Type = n.Type; mData.DropTableAlias = n.DropTableAlias; mData.MinLevel = n.Name
				end
				mData.DropTableAlias = n.Alias
				table.insert(missions, mData)
			end
		elseif (m.Planet == planet and not (m.DropTableAlias == nil and m.CacheDropTableAlias == nil)) then
			table.insert(missions, m)
		end
	end
	
	return missions
end

---	Returns the rewards for a given mission/tier
--	Returns as rows for a table with six columns, two for each rotation
--	See existing Survival/Rewards/Normal_Mission for examples
--	if Tier==AllTier it will call a specific function to merge all tiers together in a single A, B, C table
--	Used on [[Template:Rewards]]
--	@function		p.getRewardTable
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of wikitable
function p.getRewardTable(frame)
	local missionAlias = frame.args and frame.args[1]
	local mission = p._getMissionDropTable(missionAlias) or 
			error('p.getRewardTable(frame): Could find reward table alias "'..missionAlias..'" in [[Module:DropTables/data]]')

	local data = getRewardsForMission(mission)
	assert(data.A, 'p.getRewardTable(frame): Must have a drop table mapped to "A" key')
	local result = {}
	
	-- Building a reward table with a single drop table
	if not (data.B or {})[1] and not (data.C or {})[1] then
		table.insert(result, [=[
{|class="article-table" style="width:40%; text-align:right; border="0"
! colspan="2" style="text-align:center;" | Rewards
]=])
		for _, drop in pairs(data.A) do
			table.insert(result, "|-\n| "..formatDropString(drop))
		end
	
	-- Building a reward table with three drop tables (A, B, C)
	else
		table.insert(result, [=[
{| class="article-table" border="0"
|-
! colspan="2" style="width:33%; text-align:center;" | [[Mission Rewards|A]]
! colspan="2" style="width:34%; text-align:center;" | [[Mission Rewards|B]]
]=])
		local rots = {'A', 'B'}
		-- Insert rot C only if it exists ([[Cambion_Drift/Rewards]] Tier 4 has only A & B rotations)
		if (data.C or {})[1] then
			table.insert(rots, 'C')
			table.insert(result, '! colspan="2" style="width:33%; text-align:center;" | [[Mission Rewards|C]]')
		end

		-- We need as many rows as the longest list has items
		-- So if any lists are shorter then after their last row the columns are just blank
		-- local done = false
		for i = 1, math.max(Table.size(data.A), Table.size(data.B or {}), Table.size(data.C or {})) do
		-- while not done do
			-- if done then error() end
			-- done=true
			table.insert(result, "|-")
			for _, k in ipairs(rots) do
				-- table.insert(result, (data[k] or {})[i] and '| align="right" | '..formatDropString((data[k] or {})[i]) or "| || ")
				if (data[k] or {})[i] then
					table.insert(result, '| align="right" | '..formatDropString(data[k][i]))
					-- done=false
				else
					table.insert(result, "| || ")
				end
			end
		end
	end
	
	table.insert(result, "|}")
	return table.concat(result, "\n")
end

---	Gets a list of all the missions for a given Alias. Used on [[Template:Rewards]] and p.getSingleRelicByLocation()
--	@function		p.getMissionList
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant list
function p.getMissionList(frame)
	local missionAlias = frame.args ~= nil and frame.args[1]
	return p._getMissionList(missionAlias)
end
function p._getMissionList(missionAlias)
	local result = {}
	local missionRecord = p._getMissionDropTable(missionAlias)
	local missions = p._getMissionTable(missionRecord['Alias'])
	
	-- If we don't find mission nodes associated with a drop table, assume that 
	-- drop table is associated with gameplay modifiers or unique gameplay objectives
	-- within a particular the mission type ("the mission/gamemode within the mission"
	-- or "the mission on top of the base mission")
	-- E.g. Arbitrations, Sorties, Bounties
	if (Table.size(missions) == 0) then
		-- M:Missions/data's MissionModifiers collection contains entries with user-contributed
		-- LocationNotes for these edge-cases since stuff like Sorties do not have a dedicated Star Chart node
		if (missionRecord['Type'] == nil) then
			error('no Type in missionRecord '..mw.dumpObject(missionRecord))
		end
		if (MissionData['MissionModifiers'][missionRecord['Type']] == nil) then
			error('no type '..missionRecord['Type']..' in MissionData.MissionModifiers')
		end
		table.insert(result, MissionData['MissionModifiers'][missionRecord['Type']]['LocationNote'])
	else
		for _, m in pairs(missions) do
			table.insert(result, '* [['..m.Link..'|'..m.Name..']], [['..m.Planet..']]')
		end
	end
	
	return table.concat(result, '\n')
end

---	Get a list of all missions that drop a given item.
--	@function		getDropMissions
--	@param			{string} itemName Name of item
--	@return			{table} List of tables each containing details of mission and drop chances
local function getDropMissions(itemName)
	local dropList = {}
	
	--For each mission...
	for _, mission in pairs(DropData["Missions"]) do
		--... if it has rewards...
		if (mission.Rewards ~= nil and not mission._IgnoreEntry) then
			--... then for each rotation in the mission...
			for key, dropTable in Table.skpairs(mission.Rewards) do
				--... for each drop in the rotation...
				for _, drop in pairs(dropTable) do
					-- ... if the drop is the right item, add it to the list
					if (drop[NAME_COL] == itemName) then
						table.insert(dropList, buildMissionDrop(mission, key, drop))
					end
				end
			end
		end
	end
	
	return dropList
end

---	Returns an EnemyDrop object for each enemy that drops a given item.
--	@function		getDropEnemies
--	@param			{string} itemName Name of item
--	@return			{table} List of tables each containing details of enemy and drop chances
local function getDropEnemies(itemName)
	local dropList = {}
	
	for _, enemy in pairs(DropData.Enemies) do
		if not(enemy._IgnoreEntry) then
			addDropFromDropTable(itemName, enemy, 'Mod', dropList)
			addDropFromDropTable(itemName, enemy, 'Resource', dropList)
			addDropFromDropTable(itemName, enemy, 'Item', dropList)
			addDropFromDropTable(itemName, enemy, 'Sigil', dropList)
		end
	end
	
	return dropList
end

---	Returns a wikitable of all mission types and the possible Void Relics they can drop.
--	Used on [[Void Relic/ByMission]]
--	Unlike p.getRewardTable(), this is just the full table with all formatting
--	This is pretty ugly, but kinda have to do it this way
--	(Unless you have a better solution, in which case by all means go ahead and fix it)
--	(I'm not exactly a Lua expert or a UI expert)
--	TODO: Break up this function into smaller functions
--	@function		p.getRelicTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getRelicTable(frame)
	-- Okay, so first up, need to know which planet this is for
	local planetName = frame.args ~= nil and frame.args[1] or error('p.getRelicTable(frame): First frame argument must be a Star Chart planet/region name')
	
	-- planetName == nil is standing in for 'all planets', so adding option to explicitly call 'all'
	if (planetName ~= nil and (planetName == "" or planetName == "All")) then
		planetName = nil
	end
	
	-- I have other functions to get the list of missions for all/planet
	-- So calling that here
	local missions = nil
	if (planetName == nil) then
		missions = {}
		for _, m in pairs(DropData["Missions"]) do
			if (not m._IgnoreEntry) then
				table.insert(missions, m)
			end
		end
	else
		missions = p.getMissionsForPlanet(planetName)
	end
	
	local tableRows = {}
	local Relics = { ["Lith"] = {}, ["Meso"] = {}, ["Neo"] = {}, ["Axi"] = {}, ["Requiem"] = {} }
	
	-- Now for the 'fun' part: Getting the list
	-- TODO: Refactor this loop for the scenario where a relic can appear in multiple drop tables associated with
	-- a single node (e.g. end-of-mission reward + resource cache reward + end-of-mission extra reward tables)
	for i, m in ipairs(missions) do
		-- For each mission, the first thing we're doing is setting up what it's called
		-- Or more accurately, what it appears as in the chart
		local rowName = ""
		local mission = nil
		if (planetName == nil) then
			rowName = "[["..m.Link.."|"..m.Type.."]] ("..m.Name..")"
			mission = m
		else
			local placeName = m.Name
			
			-- When showing a single planet, format is instead "Mission Name (Type)"
			-- For example, "Rusalka (Capture)"
			-- Mission type is still linked
			-- Dark Sector is also linked if appropriate
			if (m.IsDarkSector) then
				rowName = placeName.." ([[Dark Sector]] [["..m.Type.."]])"
			else
				local mType = m.Type
				mType = string.gsub(mType, "Cetus Bounty %(Steel Path%)", "Steel Path Cetus Bounty")
				mType = string.gsub(mType, "Orb Vallis Bounty %(Steel Path%)", "Steel Path Orb Vallis Bounty")
				rowName = placeName.." ([["..m.Type.."]])"
			end
			-- Fallback to resource cache drop table if there is no rotation/end-of-mission drop table associated
			-- with mission node
			mission = p._getMissionDropTable(m.DropTableAlias or m.CacheDropTableAlias)
		end
		local thisRow = nil
		-- This is where we get all the rewards for the mission
		local drops = getRewardsForMission(mission)
		
		-- Need to know if this is a single rotation
		-- Because if it is, just a checkmark instead of a letter
		local isSingleRot = Table.size(drops) == 1
		-- For each mission, looping each rotation
		for rot, dropTable in Table.skpairs(drops) do
			-- And each drop for each rotation
			for j, d in pairs(dropTable) do
				-- We only care if it's a relic
				if (d.Type == "Relic") then
					-- Set up the row if we don't have it yet
					-- Mission will not be added to the grid unless it drops at least one relic
					-- Avoids adding a row for something like Assassination that never gives relics
					if (thisRow == nil) then
						thisRow = {}
					end
					
					-- Example: "Lith A1"
					-- Also extracting names of Radiant relics if string contains " (Radiant)"
					local RelicText, isRadiantRelic = string.gsub(d.ItemName, "%s%(Radiant%)", "")
					isRadiantRelic = isRadiantRelic > 0
					
					-- Example: {"Lith", "A1"}
					local RelicBits = String.split(RelicText, "%s")
					-- Example: "Lith"
					local RTier = RelicBits[1]
					-- Example: "A1"
					local RName = RelicBits[2]
					
					-- Make sure the relevant entry exists
					if (thisRow[RelicText] == nil) then
						thisRow[RelicText] = ""
					end
					
					-- And then fill it in
					-- Adding checkmark to cells where there is no rotation reward A/B/C
					-- and adding asterisk for Radiant relic drops
					thisRow[RelicText] = ((isSingleRot) and "✔" or thisRow[RelicText]..rot)..((isRadiantRelic) and "*" or "")
					
					-- Adding drop rate info when hover over rotation letter or checkmark:
					-- If the drop rate is under 5%, set text color to red with "'"
					-- If the drop rate is under 10%, set text color to orange with "^"
					local relicTextColor = "inherit"
					local icon = ''
					if (d.Chance * CHANCE_MULTIPLIER < 0.05) then
						relicTextColor = "red"
						icon = "'"
					elseif (d.Chance * CHANCE_MULTIPLIER < 0.10) then
						relicTextColor = "orange"
						icon = "^"
					end
					thisRow[RelicText] = ('<b><span style="color:%s;" title="Drop rate: %s%%">%s%s</span></b>')
							:format(relicTextColor, d.Chance * 100 * CHANCE_MULTIPLIER, thisRow[RelicText], icon)
					
					-- Also gotta add the Relic to our list if we don't have it yet
					if (Relics[RTier][RName] == nil) then
						Relics[RTier][RName] = RelicText
					end
				end
			end
		end
		
		if (thisRow ~= nil) then
			tableRows[rowName] = thisRow
		end
	end
	
	local result = {}
	local headerRow = {}
	local headerFirst = true
	-- So this right here sets up the initial conditions of the table
	-- If you want to change the styling, you've gotta do it here
	result = { '{| class="wikitable" \n|-' }
	-- Slightly different text for all missions VS missions for a planet
	if (planetName == nil) then
		table.insert(result, '\n! rowspan="2" | Mission Type (Tier)')
	else
		table.insert(result, '\n! rowspan="2" | Node (Type)')
	end
	
	-- Looping through each Relic tier
	-- Doing two things here:
	-- 1. Setting up the header row with the list of relics
	-- 2. Setting up the topmost row that has the name of each relic tier
	for _, tier in ipairs(Void.RELIC_TIER_ORDER) do
		local relicCount = Table.size(Relics[tier])
		if (relicCount > 0) then
			table.insert(result, ('\n! colspan="%s" | %s'):format(relicCount, tier))
			for rNum, trash in Table.skpairs(Relics[tier]) do
				if (not headerFirst) then
					table.insert(headerRow, " || ")
				end
				headerFirst = false
				table.insert(headerRow, Tooltip.text({tier.." "..rNum, "Void", r = rNum}))
			end
		end
	end
	
	-- Then add the second row to the list
	local headerTemp = table.concat(headerRow)
	table.insert(result, "\n|-\n|"..headerTemp)
	
	-- And now, at long last, it's time to add all the good stuff
	for mName, relicRow in Table.skpairs(tableRows) do
		table.insert(result, "\n|-\n|"..mName)
		for _, tier in ipairs(Void.RELIC_TIER_ORDER) do
			for rNum, rName in Table.skpairs(Relics[tier]) do
				if(relicRow[rName] ~= nil) then
					table.insert(result, ("||"..relicRow[rName]))
				else
					table.insert(result, "|| ")
				end
			end
		end
	end
	
	table.insert(result, "\n|}")
	-- And then ship it all back
	return frame:preprocess(table.concat(result))
end

---	Returns a wikitable of each Void Relic's mission drop locations.
--	Used on [[Void Relic/DropLocationsByRelic]]
--	TODO: Break up this function into smaller functions
--	@function		p.getRelicByLocation
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getRelicByLocation(frame)
	local tier = frame.args ~= nil and frame.args[1] or frame
	local tierPieces = String.split(tier, "%s")
	
	local relicData = {}
	
	-- TODO: Refactor so there is at max 3 nested code blocks
	--As with most of my functions, breaking this into two parts:
	--First, gather all the data for each relic by going through missions
	--We're looking through all drops for all missions to find relic drops
	for _, mission in pairs(DropData["Missions"]) do
		if (mission.Rewards ~= nil and mission._IgnoreEntry ~= true) then
			
			for rot, dropTable in Table.skpairs(mission.Rewards) do
				for _, drop in pairs(dropTable) do
					--When we find a relic drop, make sure it's for the right tier
					if (drop[TYPE_COL] == "Relic") then
						--Example: {"Lith", "A1"}
						local RelicBits = String.split(drop[NAME_COL], "%s")
						--Example: "Lith"
						local RTier = RelicBits[1]
						--Example: "A1"
						local RName = RelicBits[2]
			
						--Then if it is for the right tier, it needs to be added to our table of data
						if (RTier == tier) then
							--Create an entry for this relic if we don't have one yet
							if (relicData[RName] == nil) then
								relicData[RName] = { Drops = {}, Rewards = VoidData.RelicData[RTier..' '..RName]['Drops'] }
							end
							
							--Then add this drop to the relic's table
							table.insert(relicData[RName].Drops, buildMissionDrop(mission, rot, drop))
						end
					end
				end
			end
		end
	end

	--Second, build the actual table being sent back
	local result = { [[
{| class="article-table" border="0" cellpadding="1" cellspacing="1"
! Relic Name
! Drop locations]] }

	local rHeader = [[
{| cellpadding="2" cellspacing="0" class="wikitable sortable"
! Mission Type
! Source
! Rotation
! Chance
]]

	for RName, RTable in Table.skpairs(relicData) do
		local tierLink = "\n|-\n| ".."[["..tier.." "..RName.."]]"
		table.insert(result, tierLink)
		for i, reward in pairs(RTable.Rewards) do
			local ItemName = reward.Item
			local PartName = reward.Part
			local itemLink = "\n* [["..ItemName.."|"..ItemName.." "..PartName.."]]"
			table.insert(result, itemLink)
		end

		table.insert(result, "\n|\n")
		table.insert(result, rHeader)
		
		table.sort(RTable.Drops, function (d1, d2)
			if (d1.MissionType == d2.MissionType) then
				if (d1.Mission['Name'] == d2.Mission['Name']) then
					return d1.Rotation < d2.Rotation
				else
					return d1.Mission['Name'] < d2.Mission['Name']
				end
			else
				return d1.MissionType < d2.MissionType
			end
		end)
		
		for i, d in pairs(RTable.Drops) do
			table.insert(result, ([=[
|-
| [[%s]]
| [[%s|%s]]
| %s
| %s%%
]=]):format(d.MissionType, d.Mission['Link'], d.Mission['Name'], d.Rotation, d.Chance * 100 * CHANCE_MULTIPLIER))
		end
		
		table.insert(result, "\n|}")
	end

	table.insert(result, "\n|}")
	
	-- TODO: Remove all the newlines in elements that is inserted into table.
	-- Can just concat newlines at the end here.
	return table.concat(result)
end

---	Returns a wikitable with the mission types that drop a particular Void Relic.
--	TODO: Break up this function into smaller functions
--	@function		p.getSingleRelicByLocation
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getSingleRelicByLocation(frame)
	-- Assume frame argument is a valid relic name (e.g. "Axi O5")
	local relicName = frame.args ~= nil and frame.args['name']
	
	local relicData = { Drops = {}, Rewards = VoidData.RelicData[relicName]['Drops'] }
	local missionData = {}
	
	--As with most of my functions, breaking this into two parts:
	--First, gather all the data for each relic by going through missions
	--We're looking through all drops for all missions to find relic drops
	for _, mission in pairs(DropData["Missions"]) do
		if (mission.Rewards ~= nil and mission._IgnoreEntry ~= true) then
			for rot, dropTable in Table.skpairs(mission.Rewards) do
				for _, drop in pairs(dropTable) do
					--When relic drop found, make sure it's for the right relic
					if (drop[TYPE_COL] == "Relic") then
						--Then if it is for the right tier, it needs to be added to our table of data
						if (drop[NAME_COL] == relicName or 
								string.gsub(drop[NAME_COL], "%s%(Radiant%)", "") == relicName) then
							--Then add this drop to the relic's table
							table.insert(relicData.Drops, buildMissionDrop(mission, rot, drop))
						end
					end
				end
			end
		end
	end
	
	--Second, build the actual table being sent back
	local result = { [=[
{| cellpadding="0" cellspacing="0" class="wikitable sortable"
|-
! Mission Type
! Source
! [[Mission_Rewards#Reward_Rotations|Rotations]]
! data-sort-type="numeric" | Chances
! [[Star Chart]] Nodes]=] }
	
	-- Sort entries by drop chance in descending order
	table.sort(relicData.Drops, function (d1, d2)
		if d1.Chance ~= d2.Chance then
			return d1.Chance > d2.Chance
		end
		if d1.Mission['Name'] ~= d2.Mission['Name'] then
			return d1.Mission['Name'] < d2.Mission['Name']
		end
		return d1.Rotation < d2.Rotation
	end)
	
	local types = {}	-- 1st column
	local dropTableAlias = {}	--
	local dropTableNames = {} -- 2nd column
	local rotations = {}	-- 3rd column
	local chances = {}	-- 4th column
	
	for i, d in pairs(relicData.Drops) do
		types[i] = d.MissionType
		dropTableAlias[i] = d.Mission['Alias']
		dropTableNames[i] = d.Mission['Name']
		chances[i] = (d.Chance * 100 * CHANCE_MULTIPLIER).."%"
		rotations[i] = d.Rotation
	end
	
	for i = 1, Table.size(relicData.Drops), 1 do
		-- TODO: I do not understand why this is needed. Duplicate entries? Why not use a set then?
		if types[i] == types[i + 1] then
			if dropTableAlias[i] == dropTableAlias[i + 1] then
				rotations[i + 1] = rotations[i]..",&nbsp;"..rotations[i + 1]
				chances[i + 1] = chances[i]..",&nbsp;"..chances[i + 1]
				types[i] = ''
				dropTableAlias[i] = ''
				dropTableNames[i] = ''
				rotations[i] = ''
				chances[i] = ''
			end
		end
		
		local num = string.gsub(chances[i], "%%", "")	-- Extracting the drop chance from percentage string
		local ChancesBits = String.split(num, ",&nbsp;")
		local highchance
		-- TODO: All these tonumber() conversions are so inefficient. Is there any way we can get the drop percentage as a number natively?
		if (Table.size(ChancesBits) <= 1) or (ChancesBits == nil) then
			highchance = tonumber(num)
		else
			for j = 1, Table.size(ChancesBits) - 1, 1 do
				if tonumber(ChancesBits[j]) <= tonumber(ChancesBits[j + 1]) then
					highchance = tonumber(ChancesBits[j + 1])
				else
					highchance = tonumber(ChancesBits[j])
				end
			end
		end
		
		if types[i] ~= '' then
			local status, missionNodeList = pcall(p._getMissionList, dropTableAlias[i])
			if (not status) then
				error('error getting missionNodeList from alias '..mw.dumpObject(dropTableAlias[i])..' at '..missionNodeList)
			end
			
			local mType = types[i]
			mType = string.gsub(mType, " %(Steel Path%)", "<br />%(Steel Path%)")
			
			local missionType = mType
			if (MissionData.MissionTypes[mType] ~= nil) then
				missionType = '[['..MissionData.MissionTypes[mType].Link..'|'..MissionData.MissionTypes[mType].Name..']]'
			elseif (MissionData.MissionModifiers[mType] ~= nil) then
				missionType = '[['..MissionData.MissionModifiers[mType].Link..'|'..MissionData.MissionModifiers[mType].Name..']]'
			end
			
			table.insert(result, '|-\n| style="padding:10px;" | '..missionType)
			table.insert(result, '| style="padding:10px;" | '..dropTableNames[i])
			table.insert(result, '| style="padding:10px;" | '..rotations[i])
			table.insert(result, '| style="padding:10px;" data-sort-value="'..highchance..'" | '..chances[i])
			table.insert(result, '| style="padding:10px;" |\n'..missionNodeList)
		end
	end
	
	if (Table.size(result) == 1) then
		table.insert(result, '|-\n| style="text-align:center;" colspan="5" | No mission drop tables with this Void Relic')
	end
	
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

---	Returns a wikitable of missions that drop a particular item.
--	Used in [[Template:DropLocations]]
--	@function		p.getItemByMissionTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getItemByMissionTable(frame)
	local itemName = frame.args ~= nil and mw.text.decode(frame.args[1]) or error('p.getItemByMissionTable(frame): Must pass in an argument, the name of an item')
	
	local missionDropLocations = getDropMissions(itemName)
	table.sort(missionDropLocations, function (d1, d2) return d1.MissionType < d2.MissionType end)
	
	-- Forcing horizontal scroll on wikitable content for more consistent scroll behavior especially on mobile
	-- I think readers read left to right in order of importance: mission type, rotation, drop chance, and then
	-- the mission nodes to go to for that desired farming location
	local result = { [=[<div style="overflow-x: auto">
{| cellpadding="0" cellspacing="0" class="wikitable sortable autosort=6,d"
|-
! Mission Type
! Source
! [[Mission_Rewards#Reward_Rotations|Rotations<br />or<br />Drop Table]]
! data-sort-type="numeric" | Chance<ref name="droptables-item-chance">Chance to roll item within drop table</ref>
! data-sort-type="numeric" | Quantity<ref name="droptables-quantity">Amount rewarded on successful roll</ref>
! data-sort-type="numeric" | Avg. per roll<ref name="droptables-avg">(Quantity × Chance)</ref>
! [[Star Chart]] Nodes
|-
]=] }
	
	for i, d in pairs(missionDropLocations) do
		table.insert(result, ([=[
| [[%s|%s]] || %s
| %s
| %s%% || %s || %s
|
%s
|-
]=]):format(
			d.MissionLink,
			d.MissionType,
			d.Mission['Name'],
			d.Rotation,
			d.Chance * 100 * CHANCE_MULTIPLIER,
			d.Count,
			d.Count * d.Chance * CHANCE_MULTIPLIER,
			p._getMissionList(d.Mission['Alias'])
		)
	)
		-- TODO: Replace p.getMissionList(frame) with p._getMissionList(dropTableAlias) once it is implemented
	end
	
	if (Table.size(result) == 1) then
		table.insert(result, '| style="text-align:center;" colspan="7" | No mission drop tables with this item')
	end

	table.insert(result, '|}</div>')
	return frame:preprocess(table.concat(result, '\n'))
end

---	Returns a wikitable of enemies that drop a particular item.
--	Used in [[Template:DropLocations]]
--	@function		p.getItemByEnemyTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getItemByEnemyTable(frame)
	local itemName = frame.args ~= nil and mw.text.decode(frame.args[1]) or error('p.getItemByEnemyTable(frame): Must pass in an argument, the name of an item')
	
	local enemyDropLocations = getDropEnemies(itemName)
	table.sort(enemyDropLocations, function (d1, d2) return d1.Name < d2.Name end)
	
	local result = { [=[<div style="overflow-x: auto">
{| cellpadding="2" cellspacing="0" class="wikitable sortable autosort=7,d"
! Enemy
! data-sort-type="numeric" | Drop Table Chance<ref name="droptables-drop-chance">Chance to roll drop table</ref>
! data-sort-type="numeric" | Item Chance<ref name="droptables-item-chance">Chance to roll item within drop table</ref>
! data-sort-type="numeric" | Chance<ref name="droptables-chance">(Drop Table Chance × Item Chance)</ref>
! data-sort-type="numeric" | Expected Kills<ref name="droptables-kills">(1 / Chance), see [[WARFRAME Wiki:Expected & Nearly Guaranteed Numbers]] for more details</ref>
! data-sort-type="numeric" | Quantity<ref name="droptables-quantity">Amount rewarded on successful roll</ref>
! data-sort-type="numeric" | Avg. per roll attempt<ref name="droptables-avg-attempt">(Quantity × Chance), average item quantity on a roll attempt (successful or not)</ref>
]=] }
	
	for _, drop in pairs(enemyDropLocations) do
		table.insert(result, ([=[
|-
| [[%s|%s]] || %s%% || %s%% || %s%% || %s || %s || %s
]=]):format(
			drop.Link,
			drop.Name,
			drop.DropTableChance * 100 * CHANCE_MULTIPLIER,
			drop.ItemChance * 100 * CHANCE_MULTIPLIER, 
			drop.Chance * 100 * CHANCE_MULTIPLIER,
			math.floor(.5 + 1/(drop.Chance * CHANCE_MULTIPLIER)),
			drop.Count,
			drop.Count * drop.Chance * CHANCE_MULTIPLIER)
		)
	end
	-- TODO: Move average per roll calculation to addDropFromDropTable() and store as a key-value pair
	
	if (Table.size(result) == 1) then
		table.insert(result, '|-\n| style="text-align:center;" colspan="7" | No enemy drop tables with this item')
	end

	table.insert(result, '|}</div>')
	return frame:preprocess(table.concat(result, '\n'))
end

---	Returns the number of enemies that drop a particular item.
--	@function		p.getItemByEnemyCount
--	@param			{table} frame Frame object
--	@return			{number} Number of enemies that drop a particular item
function p.getItemByEnemyCount(frame)
	local theDrop = frame.args ~= nil and frame.args[1] or frame
	
	local Drops = getDropEnemies(theDrop)
	
	return Table.size(Drops)
end

---	Returns the number of missions that drop a particular item.
--	@function		p.getItemByMissionCount
--	@param			{table} frame Frame object
--	@return			{number} Number of missions that drop a particular item
function p.getItemByMissionCount(frame)
	local theDrop = frame.args ~= nil and frame.args[1] or frame
	
	local Drops = getDropMissions(theDrop)
	
	return Table.size(Drops)
end

---	Returns a list of all enemies with a drop table as stored in <code>/data</code>
--	TODO: Remove this function once we populate [[Module:Enemies/data]]
--	@function		p.getFullEnemyList
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant list
function p.getFullEnemyList(frame)
	local result = "All Enemies: "
	local enemyNameList = {}
	for _, Enemy in pairs(DropData["Enemies"]) do
		if (Enemy.Name ~= nil) then
			table.insert(enemyNameList, Enemy.Name)
		end
	end

	table.sort(enemyNameList, function(n1, n2) return n1 < n2 end)
	for _, name in pairs(enemyNameList) do 
		result = result.."\n* "..linkEnemy(name)
	end
	return result
end

---	Returns a list of mod drops from a particular enemy. Used in [[Template:EnemyHoriz]]
--	@function		p.getEnemyModDrops
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant list
function p.getEnemyModDrops(frame)
	local enemyName = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	
	-- Item type to module name (e.g. 'Mod' to 'Mods' for Module:Mods)
	local itemTypeModuleMap = {
		Mod = 'Mods',
		Resource = 'Resources',
		Arcane = 'Arcane',
		Relic = 'Void',
	}
	
	--	@function		getAllModDrops
	local function getAllModDrops(enemyName)
		local drops = {}
		local Enemy = DropData["Enemies"][enemyName] or {}
		for _, Mod in pairs(Enemy.Mods or {}) do
			local drop = buildEnemyDrop(Enemy, Mod)
			table.insert(drops, drop)
		end
		return drops
	end
	
	local drops = getAllModDrops(enemyName)
	
	if Table.size(drops) == 0 then
		return
	end
	
	enemyTableSort(drops)
	
	local result = {}
	for i, Drop in pairs(drops) do
		table.insert(result,
			Tooltip.full(Drop.ItemName, itemTypeModuleMap[Drop.Type])
			..' '..
			(Drop.Chance * 100 * CHANCE_MULTIPLIER).."%"
		)
	end
	return table.concat(result,"<br/>")
end

return p
