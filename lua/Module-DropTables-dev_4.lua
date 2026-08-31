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
--	@require	[[Module:Math]]
--	@require	[[Module:Table]]
--	@require	[[Module:Void]]
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
local MISSION_NAME_COL = 1	-- Name of the drop
local MISSION_TYPE_COL = 2	-- Type of thing dropped (IE Mod, Endo, Credits)
local MISSION_CHANCE_COL = 3	-- Chance for the thing to drop
local MISSION_COUNT_COL = 4	-- Number of things dropped. If empty, default to 1
--	in DropData["Enemies"].Mods
local MOD_NAME_COL = 1	-- Name of the mod
local MOD_CHANCE_COL = 2	-- The chance of a mod dropping
local MOD_COUNT_COL = 3	-- If empty, default to 1. Normally only different for Endo

local p = {}

local DropData = mw.loadData('Module:DropTables/data')
local RelicData = mw.loadData('Module:Void/data')['RelicData']
local MissionData = mw.loadData('Module:Missions/data')
local ModsData = mw.loadData('Module:Mods/data')
local Icon = require('Module:Icon')
local String = require('Module:String')
local Math = require('Module:Math')
local Table = require('Module:Table')
local Void = require('Module:Void')
local Tooltip = require('Module:Tooltips')

---	Looks through a drop table and appends drop source to list if drop table
--	contains specified item.
--	@function		addDropFromDropTable
--	@param			{string} itemName Item name to be searched
--	@param			{table} dropTable Enemy drop table entry as as seen in <code>/data</code>
--	@param			{string} subTableName Name of drop table w/o "s" (e.g. "Resource" or "Sigil")
--	@param			{table} dropSourceList List of drop sources of item in the format:
--							{ Name = drop table name, Link = article link, Chance = drop chance, Count = Number of drops }
local function addDropFromDropTable(itemName, dropTable, subTableName, dropSourceList)
	for _, drop in ipairs(dropTable[subTableName..'s'] or {}) do
		if (drop[1] == itemName) then
			table.insert(dropSourceList, {
					Name = dropTable.Name,
					Link = dropTable.Link or dropTable.Name,	-- TODO: Use name as fallback until M:Enemies/data is populated, afterwards remove the fallback
					Chance = dropTable[subTableName..'Chance'] * drop[2] / 100,
					Count = drop[3]	-- Do not add a fallback value like in the case of some region resources with varying drop amounts
				} )
			-- Breaking early despite there being the possibility that there can be two same entries in the same drop table
			break
		end
	end
end

---	Gets mission drop table by Alias.
--	@function		p._getMission
--	@param			{string} missionAlias Alias key value as seen in <code>/data</code>
--	@return			{table} Mission drop table entry from <code>/data</code>
function p._getMission(missionAlias)
	assert(missionAlias ~= nil, 'p._getMission(missionAlias): missionAlias cannot be a nil value')
	return DropData["Missions"][missionAlias] or error('p._getMission(missionAlias): "'..missionAlias..'" does not exist in [[Module:DropTables/data]]')
end

---	Basically pretending to be semi-object oriented
--	Calling this whenever I'm pulling drops from enemies and passing them around
--	NOTE: As of writing, this assumes enemies don't have Blueprint or other drops listed.
--	TODO: buildEnemyDrop(), buildMissionDrop(), buildSyndicateDrop(), buildResourceDrop(),
--	and etc. can probably be in a single buildDrop function that passes in a table/function
--	argument telling how to format drops
--	@function		buildEnemyDrop
local function buildEnemyDrop(Enemy, Mod)
	local drop = { }
	drop.EnemyName = Enemy.Name
	drop.ItemName = Mod[MOD_NAME_COL]
	drop.Chance = (Enemy.ModChance * Mod[MOD_CHANCE_COL]) / 100
	drop.Count = Mod[MOD_COUNT_COL] ~= nil and Mod[MOD_COUNT_COL] or 1
	if (drop.ItemName == 'Endo') then drop.Type = 'Endo' else drop.Type = 'Mod' end
	return drop
end

---	Returns a table of a single drop from a mission's drop table.
--	@function		buildMissionDrop
--	@param			{table} missionDropTable Mission drop table entry as seen in <code>/data</code>
--	@param			{string} rotation Rotation name (e.g. "A", "B", or "C")
--	@param			{table} itemTable A single item drop entry within a drop table (e.g. { "Endo", 25, 15 })
--	@return			{table} A table containing a single item from a mission drop table
local function buildMissionDrop(missionDropTable, rotation, itemTable)
	local drop = { }
	drop.MissionType = missionDropTable.Type
	drop.MissionTier = missionDropTable.Alias
	drop.Rotation = rotation
	drop.ItemName = itemTable[MISSION_NAME_COL]
	drop.Chance = itemTable[MISSION_CHANCE_COL]
	drop.Count = itemTable[MISSION_COUNT_COL] ~= nil and itemTable[MISSION_COUNT_COL] or 1
	drop.Type = itemTable[MISSION_TYPE_COL]
	-- Just go ahead and tag this on because who knows what we'll need from it
	drop.Mission = missionDropTable
	return drop
end

---	Like above, but for Syndicate Offerings
--	@function		buildSyndicateDrop
local function buildSyndicateDrop(theSyndicate, Item)
	local drop = { }
	drop.SyndicateName = theSyndicate.Name
	drop.ItemName = Item[SYNDICATE_NAME_COL]
	drop.Type = Item[SYNDICATE_TYPE_COL]
	drop.Cost = Item[SYNDICATE_COST_COL]
	drop.Rank = Item[SYNDICATE_RANK_COL]
	return drop
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
		if (r1.Chance == r2.Chance) then
			if (r1.Type == r2.Type) then
				if (r1.ItemName == r2.ItemName) then
					return r1.Count < r2.Count
				else
					return r1.ItemName < r2.ItemName
				end
			else
				return r1.Type < r2.Type
			end
		else
			return r1.Chance > r2.Chance
		end
	end

	table.sort(theTable, sorter)
end

---	Custom table sort for Enemy tables
--	Rules:
--	Sort first by Drop Chance, then alphabetically within Drop Chance with Endo being last
--	@function		enemyTableSort
local function enemyTableSort(theTable)
	local function sorter(r1, r2)
		if (r1.Chance == r2.Chance) then
			if (r1.Count == r2.Count) then
				return r1.ItemName < r2.ItemName
			else
				return r1.Count < r2.Count
			end
		else
			return r1.Chance > r2.Chance
		end
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
		iconText = Tooltip.getFullTooltip(drop.ItemName, "Resources")
	elseif (dropType == "Arcane") then
		iconText = Tooltip.getFullTooltip(drop.ItemName, "Arcane")
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
		iconText = Tooltip.getFullTooltip(drop.ItemName, "Mods")
	elseif (dropType == "Relic") then
		local relicName = drop.ItemName
		-- Mimicing frame object in order to replace displayed text with "<relic_name> (Radiant)"
		local frame = { args = { string.gsub(relicName, " %(Radiant%)", ""), "Void", r = relicName } }
		iconText = Tooltip.getFullTooltip(frame)
	elseif (dropType == "Credits") then
		iconText = Icon._Item("Credits", nil, nil)
		result = result.."[[Credit Cache]]"
	elseif (dropType == "Blueprint") then
		local pieces = String.split(drop.ItemName, "%s")
		local BPType = pieces[2]
		local BPName = pieces[1]
		local linkString = String.split(drop.ItemName, "%s")[1]
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
		elseif (pieces[2] == "Wraith" or pieces[2] == "Vandal" or pieces[1] == "Carmine") then
			--Now a workaround for Wraith & Vandal things to link them properly. U29.10 > now works with carmine penta
			--In theory works for any Wraith/Vandal item
			linkString = pieces[1].." "..pieces[2]
			if(pieces[3] ~= "Blueprint") then
				if (BPName == "Spectra" and pieces[Table.size(pieces)] == "Chassis") then
					--a workaround for displaying proper icons for Spectra parts
					iconText = Icon._Item("Stock", nil, nil)
				elseif (BPName == "Spectra" and pieces[Table.size(pieces)] == "Handle") then   
					--because Spectra has oddly named parts
					iconText = Icon._Item("Receiver", nil, nil)
				else
				iconText = Icon._Item(pieces[Table.size(pieces)], nil, nil)
				end
			else
				iconText = Icon._Item("Blueprint", nil, nil)
			end
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
	elseif (dropType == "Item") then
		if (string.find(drop.ItemName,"Sigil")~=nil) then
			--iconText = Icon._Item(drop.ItemName)
			result = result.."[[Sigils|"..drop.ItemName.."]]"
		else
			iconText = Icon._Item(drop.ItemName)
			result = result.."[["..drop.ItemName.."]]"
		end
		
	else
		result = result..drop.ItemName
	end
	
	if (drop.Count > 1) then
		result = "x"..drop.Count.." "..result
	end
	
	result = iconText.." "..result.." || "..drop.Chance.."%"
	
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
--	@param			{string} missionAlias
--	@return			{table} List of mission nodes with the specified drop table
function p._getMissionTable(missionAlias)
	local data = {}
	for _, m in Table.skpairs(MissionData["MissionDetails"]) do
		if (m.DropTableAlias == missionAlias) then
			table.insert(data, m)
		end
	end
	return data
end
 
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
				local mData = { Node = m.Node, Planet = m.Planet, Type = m.Type, IsDarkSector = m.IsDarkSector, Tileset = m.Tileset, Enemy = m.Enemy, MinLevel = m.MinLevel, MaxLevel = m.MaxLevel, DropTableAlias = m.DropTableAlias, Pic = m.Pic }
				-- TODO: Combine both of these if statements
				if (planet == 'Earth') and (n.Type == 'Cetus Bounty' or n.Type == 'Cetus Bounty (Steel Path)' or n.Type == 'Ghoul Bounty') and (n.Ignore ~= true) then
					mData.Type = n.Type; mData.DropTableAlias = n.DropTableAlias; mData.MinLevel = n.Name
				elseif (planet == 'Venus') and (n.Type == 'Orb Vallis Bounty' or n.Type == 'Orb Vallis Bounty (Steel Path)') and (n.Ignore ~= true) then
					mData.Type = n.Type; mData.DropTableAlias = n.DropTableAlias; mData.MinLevel = n.Name
				end
				mData.DropTableAlias = n.Alias
				table.insert(missions, mData)
			end
		elseif (m.Planet == planet and m.DropTableAlias ~= nil) then
			table.insert(missions, m)
		end
	end
 
	return missions
end

---	Returns the rewards for the A tier only for a mission
--	Handy for missions like Capture that have a single reward
--	Returns as rows for a table with two columns
--	See the existing Capture rewards section for an example
--	Used on [[Template:Rewards]]
--	@function		p.getSingleRotationRewards
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of a single row in a wikitable 
function p.getSingleRotationRewards(frame)
	local missionAlias = frame.args ~= nil and frame.args[1]
	local result = ""
	
	local mission = p._getMission(missionAlias)
	local data = getRewardsForMission(mission)
	
	if (data ~= nil and Table.size(data) > 0) then
		local firstKey = nil
		for k in pairs(data) do 
			if (firstKey == nil) then 
				firstKey = k
			end
		end
		for i, drop in pairs(data[firstKey]) do
			result = result.."\n|-\n| "..formatDropString(drop)
		end
	end
	
	return result
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
	local missionAlias = frame.args ~= nil and frame.args[1]
	local mission = p._getMission(missionAlias) or 
			error('p.getRewardTable(frame): Could find reward table alias "'..missionAlias..'" in [[Module:DropTables/data]]')

	local data = getRewardsForMission(mission)
	local dropTableA = data["A"] or error('p.getRewardTable(frame): Must have a drop table mapped to "A" key')
	local dropTableB = data["B"] or {}
	local dropTableC = data["C"] or {}
	local result = {}
	
	assert(Table.size(dropTableA) > 0, 'p.getRewardTable(frame): Drop table A cannot be an empty table')
	
	-- TODO: Depreciate p.getSingleRotationRewards(frame)? This code branch is basically the same
	-- as that function
	-- Building a reward table with a single drop table
	if (Table.size(dropTableB) == 0 and Table.size(dropTableC) == 0) then
		table.insert(result, [=[
{|class="article-table" style="width:40%; text-align:right; margin:auto" border="0"
! colspan="2" style="text-align:center;" | Rewards
]=])
		for _, drop in pairs(dropTableA) do
			table.insert(result, "|-\n| "..formatDropString(drop))
		end
	
	-- Building a reward table with three drop tables (A, B, C)
	else
		table.insert(result, [=[{| class="article-table" style="width:100%" border="0"
|-
! colspan="2" style="width:33%; text-align:center;" | [[Mission Rewards|A]]
! colspan="2" style="width:34%; text-align:center;" | [[Mission Rewards|B]]
! colspan="2" style="width:33%; text-align:center;" | [[Mission Rewards|C]]
]=])
		--Goes through all three rotations to find which one has the most items
		local maxLen = Table.size(dropTableA)
		local dropTableBItemCount = Table.size(dropTableB)
		if (dropTableBItemCount > maxLen) then
			maxLen = dropTableBItemCount
		end
		local dropTableCItemCount = Table.size(dropTableC)
		if (dropTableCItemCount > maxLen) then
			maxLen = dropTableCItemCount
		end
		
		-- We need as many rows as the longest list has items
		-- So if any lists are shorter then after their last row the columns are just blank
		for i = 1, maxLen, 1 do
			table.insert(result, "|-")
			table.insert(result, (dropTableA[i] ~= nil) and '| align="right" | '..formatDropString(dropTableA[i]) or "| || ")
			table.insert(result, (dropTableB[i] ~= nil) and '| align="right" | '..formatDropString(dropTableB[i]) or "| || ")
			table.insert(result, (dropTableC[i] ~= nil) and '| align="right" | '..formatDropString(dropTableC[i]) or "| || ")
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
	local result = {}
	local missionRecord = p._getMission(missionAlias)
	local missions = p._getMissionTable(missionRecord['Alias'])
	
	for _, m in pairs(missions) do
		table.insert(result, "* "..m.Node..", [["..m.Planet.."]]")
	end
	
	return table.concat(result,'\n')
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
		if (mission.Rewards ~= nil and not mission.Ignore) then
			--... then for each rotation in the mission...
			for key, dropTable in Table.skpairs(mission.Rewards) do
				--... for each drop in the rotation...
				for _, drop in pairs(dropTable) do
					-- ... if the drop is the right item, add it to the list
					if (drop[MISSION_NAME_COL] == itemName) then
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
		if not(enemy.Ignore) then
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
			if (not m.Ignore) then
				table.insert(missions, m)
			end
		end
	else
		missions = p.getMissionsForPlanet(planetName)
	end
	
	local tableRows = {}
	local Relics = { ["Lith"] = {}, ["Meso"] = {}, ["Neo"] = {}, ["Axi"] = {}, ["Requiem"] = {} }
	
	-- Now for the 'fun' part: Getting the list
	for i, m in ipairs(missions) do
		-- For each mission, the first thing we're doing is setting up what it's called
		-- Or more accurately, what it appears as in the chart
		local rowName = ""
		local mission = nil
		if (planetName == nil) then
			rowName = "[["..m.Link.."|"..m.Type.."]] ("..m.Name..")"
			mission = m
		else
			local placeName = m.Node
			
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
			mission = p._getMission(m.DropTableAlias)
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
					if (d.Chance < 5) then
						relicTextColor = "red"
						icon = "'"
					elseif (d.Chance < 10) then
						relicTextColor = "orange"
						icon = "^"
					end
					thisRow[RelicText] = ('<b><span style="color:%s;" title="Drop rate: %s%%">%s%s</span></b>')
							:format(relicTextColor, d.Chance, thisRow[RelicText], icon)
					
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
	result = { '{| class="wikitable" style="width:100%; border=1px; text-align:center; font-size:11px;"\n|-' }
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
				table.insert(headerRow, Tooltip.getFullTooltip(tier.." "..rNum, "Void"))
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
		if (mission.Rewards ~= nil and mission.Ignore ~= true) then
			
			for rot, dropTable in Table.skpairs(mission.Rewards) do
				for _, drop in pairs(dropTable) do
					--When we find a relic drop, make sure it's for the right tier
					if (drop[MISSION_TYPE_COL] == "Relic") then
						--Example: {"Lith", "A1"}
						local RelicBits = String.split(drop[MISSION_NAME_COL], "%s")
						--Example: "Lith"
						local RTier = RelicBits[1]
						--Example: "A1"
						local RName = RelicBits[2]
			
						--Then if it is for the right tier, it needs to be added to our table of data
						if (RTier == tier) then
							--Create an entry for this relic if we don't have one yet
							if (relicData[RName] == nil) then
								relicData[RName] = { Drops = {}, Rewards = RelicData[RTier..' '..RName]['Drops'] }
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
{| class="article-table" border="0" cellpadding="1" cellspacing="1" style="width: 100%;"
! Relic Name
! Drop locations]] }

	local rHeader = [[
{| cellpadding="2" cellspacing="0" class="sortable" style="width:100%;border:1px solid black; text-align:right;font-size:12px;"
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
]=]):format(d.MissionType, d.Mission['Link'], d.Mission['Name'], d.Rotation, d.Chance))
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
	
	local relicData = { Drops = {}, Rewards = RelicData[relicName]['Drops'] }
	local missionData = {}
	
	--As with most of my functions, breaking this into two parts:
	--First, gather all the data for each relic by going through missions
	--We're looking through all drops for all missions to find relic drops
	for _, mission in pairs(DropData["Missions"]) do
		if (mission.Rewards ~= nil and mission.Ignore ~= true) then
			for rot, dropTable in Table.skpairs(mission.Rewards) do
				for _, drop in pairs(dropTable) do
					--When relic drop found, make sure it's for the right relic
					if (drop[MISSION_TYPE_COL] == "Relic") then
						--Then if it is for the right tier, it needs to be added to our table of data
						if (drop[MISSION_NAME_COL] == relicName or 
								string.gsub(drop[MISSION_NAME_COL], "%s%(Radiant%)", "") == relicName) then
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
{| cellpadding="0" cellspacing="0" class="wikitable sortable" style="width:100%; border:1px solid black; text-align:left; font-size:12px; margin:12px 0 0 0;"
|-
! Mission Type
! Source
! [[Star Chart]] Nodes
! [[Mission_Rewards#Mission_Rotations|Rotations]]
! data-sort-type="numeric" | Chances]=] }
	
	table.sort(relicData.Drops, function (d1, d2)
		if(d1.MissionType == d2.MissionType) then
			if (d1.Mission['Name'] == d2.Mission['Name']) then
				return d1.Rotation < d2.Rotation
			else
				return d1.Mission['Name'] < d2.Mission['Name']
			end
		else
			return d1.MissionType < d2.MissionType
		end
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
		rotations[i] = d.Rotation
		chances[i] = d.Chance.."%"
	end
	
	for i = 1, Table.size(relicData.Drops), 1 do
		-- TOOD: I do not understand why this is needed. Duplicate entries? Why not use a set then?
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
			frame.args = { dropTableAlias[i] }	-- Reusing frame object passed in to use its functions
			local status, missionNodeList = pcall(p.getMissionList, frame)
			if (not status) then
				error(mw.dumpObject(dropTableAlias))
			end
			
			local mType = types[i]
			mType = string.gsub(mType, " %(Steel Path%)", "<br />%(Steel Path%)")
			
			-- A quick hack to have the correct link to the mission type, instead of to the mod
			if mType == "Rush" then
				mType = "Rush (Archwing)|Rush"
			elseif mType == "Orphix" then
				mType = "Orphix (Mission)|Orphix"
			end
			
			table.insert(result, '|-\n| style="padding:10px;" | [['..mType..']]')
			table.insert(result, '| style="padding:10px;" | '..dropTableNames[i])
			table.insert(result, '| style="padding:10px;" |\n'..missionNodeList)
			table.insert(result, '| style="padding:10px;" | '..rotations[i])
			table.insert(result, '| style="padding:10px;" data-sort-value="'..highchance..'" | '..chances[i])
		end
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
	local itemName = frame.args ~= nil and frame.args[1] or error('p.getItemByMissionTable(frame): Must pass in an argument, the name of an item')
	
	local missionDropLocations = getDropMissions(itemName)
	table.sort(missionDropLocations, function (d1, d2) return d1.MissionType < d2.MissionType end)
	
	local result = { [=[
{| cellpadding="0" cellspacing="0" class="wikitable sortable" style="width:100%; border:1px solid black; text-align:left; font-size:12px; margin:12px 0 0 0;"
|-
! Mission Type
! Source
! [[Star Chart]] Nodes
! [[Mission_Rewards#Mission_Rotations|Rotations]]
! data-sort-type="numeric" | Chances
|-
]=] }
	
	for i, d in pairs(missionDropLocations) do
		table.insert(result, ([=[
| [[%s]] || %s
|
%s
| %s || %s%%
|-
]=]):format(d.MissionType, d.Mission['Name'], p.getMissionList({ args = { d.Mission['Alias'] }}), d.Rotation, d.Chance))
		-- TODO: Replace p.getMissionList(frame) with p._getMissionList(dropTableAlias) once it is implemented
	end
	
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

---	Returns a wikitable of enemies that drop a particular item.
--	Used in [[Template:DropLocations]]
--	@function		p.getItemByEnemyTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.getItemByEnemyTable(frame)
	local itemName = frame.args ~= nil and frame.args[1] or error('p.getItemByEnemyTable(frame): Must pass in an argument, the name of an item')
	
	local enemyDropLocations = getDropEnemies(itemName)
	table.sort(enemyDropLocations, function (d1, d2) return d1.Name < d2.Name end)
	
	local result = { [=[{| cellpadding="2" cellspacing="0" class="wikitable sortable" style="border:1px solid black; font-size:12px;"
! Enemy
! Chance
]=] }
	
	for _, drop in pairs(enemyDropLocations) do
		table.insert(result, ([=[
|-
| [[%s|%s]] || %s%%
]=]):format(drop.Link, drop.Name, drop.Chance))
	end
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

---	Returns the list of drop locations used in [[Template:Component]]
--	TODO: Break up this function into smaller functions
--	TODO: Remove this function since infobox submodules use p._buildDropTableSourceStrings()
--	and build the lists in their own submodules (blocked by pages that use T:Component)
--	@function		p.getItemDropList
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant list
function p.getItemDropList(frame)
	local theDrop = frame.args ~= nil and frame.args[1] or frame
	
	-- First, get all the missions that drop this
	local Drops = getDropMissions(theDrop)
	table.sort(Drops, function (d1, d2) return d1.MissionType < d2.MissionType end)
	
	local checked = {}
	local result = ""
	local space = " "
	
	if (Table.size(Drops) > 0) then
		local finalTable = {}
		result = "'''Missions:'''" -- Voided to add more mods (example Syndicates)
		--Going through and grouping the drops by Type
		for i, Drop in pairs(Drops) do
			local Alias = Drop.Mission['Alias']
			local MissionName = Drop.Mission['ShortName']
			
			--This check prevents duplicating rows if the same item appears in multiple rotations of the same mission
			if (checked[Alias] == nil) then
				checked[Alias] = { Drop }
				if (finalTable[Drop.MissionType] == nil) then
					finalTable[Drop.MissionType] = {}
				end
				table.insert(finalTable[Drop.MissionType], Alias)
			else
				table.insert(checked[Alias], Drop)
			end
		end
		
		table.sort(finalTable, function (r1, r2) return r1 < r2	end)
		
		--This is where all the items are put into the list
		--Each mission type gets its own row, with the relevant tiers in parentheses
		--For example "Spy (T1, T2, Lua)" or "Survival (DS1, DS2)"
		for mType, item in pairs(finalTable) do
			table.sort(item)
			
			result = result.."<br/>"..mType
			
			local tierList = ""
			for j, alias in pairs(item) do
				local drop1 = checked[alias][1]
				local shortName = drop1.Mission['ShortName'] or drop1.Mission['Name']
				if shortName ~= "" then
					local ttip = drop1.Mission['Name']
					
					for k, thisDrop in pairs(checked[alias]) do
						ttip = ttip..'\\nRotation '..thisDrop.Rotation
						if (thisDrop.Chance ~= nil) then
							ttip = ttip..': '..Math.percentage(thisDrop.Chance / 100)
						end
					end
					
					if j > 1 then tierList = tierList..', ' end
					tierList = tierList..'<span style="border-bottom: 1px dotted;" class="basic-tooltip" title="'..ttip..'">'..shortName..'</span>'
				end
			end
			if tierList ~= "" then result = result.." ("..tierList..")" end
		end
	end

	--Then all the enemies are added to the list if there are any
	if (ModsData.Mods[theDrop] ~= nil) then --Skip if not a mod (getDropEnemies only check mods anyway)
		Drops = getDropEnemies(theDrop)
		if (Table.size(Drops) > 0) then
			table.sort(Drops, function (d1, d2) return (d1.EnemyName or "") < (d2.EnemyName or "") end)
			
			if (string.len(result) > 0) then result = result.."<br/>" end
			result = result.."'''Enemies:'''"
			for i, Drop in pairs(Drops) do
				result = result.."<br/>"..linkEnemy(Drop.EnemyName)..space
				result = result..Math.percentage(Drop.Chance  / 100)
			end
		end
	end
	
	return result
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
	local enemyName = frame.args ~= nil and frame.args[1] or frame
	
	--	@function		getAllModDrops
	local function getAllModDrops(enemyName)
		local drops = {}
		local Enemy = DropData["Enemies"][enemyName] or {}
		for j, Mod in pairs(Enemy.Mods or {}) do
			local drop = buildEnemyDrop(Enemy, Mod)
			table.insert(drops, drop)
		end
		return drops
	end
	
	local Drops = getAllModDrops(enemyName)
	
	if (Table.size(Drops) == 0) then
		return
	end
	
	enemyTableSort(Drops)
	local space = " "
	local result = ""
	for i, Drop in pairs(Drops) do
		if i > 1 then result = result.."<br/>" end
		if (Drop.ItemName == "Endo") then
			if (Drop.Count < 10) then
				result = result.."[[Endo]]"
			else
				result = result..Drop.Count.." [[Endo]]"
			end
		else
			result = result..Tooltip.getFullTooltip(Drop.ItemName, "Mods")
		end
		result = result..space..Drop.Chance.."%"
	end
	return result
end

---	Builds lists of sources with drop table(s) where an item can be dropped from.
--	Used in infobox builders such as [[Module:Mods/infobox]]
--	@function		p._buildDropTableSourceStrings
--	@param			{string} name Name of item
--	@return			{string} List of mission sources in wikitext
--	@return			{string} List of enemy sources in wikitext
--	@return			{string} List of container sources in wikitext
function p._buildDropTableSourceStrings(name)
	local missions, missionList = {}, {}
	local enemies, enemyList = {}, {}
	local containers, containerList = {}, {}
	
	for _, dropSourceEntry in ipairs(DropData.Rewards[name] or {}) do
		local dropTableEntry = dropSourceEntry.Source
		if not(dropTableEntry.Ignore) then
			
			if (dropSourceEntry[1] == "Missions") then
				local missionType = dropTableEntry.Type
				local missionTier = dropTableEntry.Tier
				
				if not missions[missionType] then
					missions[missionType] = {}
				end
				if not missions[missionType][missionTier] then
					missions[missionType][missionTier] = {}
				end
				
				table.insert(missions[missionType][missionTier], 
						{ 
							Rot = dropSourceEntry[3],
							Chance = dropSourceEntry[4],
							Count = dropSourceEntry[5] and drop[5]..'x&nbsp;' or ''
						} )
			
			else
				local temp
				if (dropSourceEntry[1] == "Enemies") then
					temp = enemies
				elseif (dropSourceEntry[1] == "Containers") then
					temp = containers
				end
				table.insert(temp, {
					Name = dropSourceEntry[2],
					Link = dropSourceEntry.Link or dropSourceEntry[2],	-- TODO: Use name as fallback until M:Enemies/data is populated, afterwards remove the fallback
					Chance = dropSourceEntry.Probability,
					Count = dropSourceEntry[5]	-- Do not add a fallback value like in the case of some region resources with varying drop amounts
				} )
			end
		end
	end
	
	-- Building missionList
	for missionType, tiers in Table.skpairs(missions) do
		-- Need to store reward rotation and mission tier data for a particular mission type
		local tierList = {}
		for tier, rots in Table.skpairs(tiers) do
			local rotList = {}
			table.sort(rots, function(a, b) return a.Rot < b.Rot end)
			
			for _, v in ipairs(rots) do
				table.insert(rotList, v.Count..'Rotation '..v.Rot..':&nbsp;'..Math.percentage(v.Chance  / 100))
			end
			
			table.insert(tierList, ('<span style="border-bottom: 1px dotted;" class="basic-tooltip" title="%s">%s</span>')
					:format(table.concat(rotList, '\\n'), tier:gsub('<br />', ': '):gsub(' ', '&nbsp;')))
		end
		-- TODO: Article link can be fetched from M:Missions/data instead
		-- A quick hack to have the correct link to the missiontype, instead of to the mod
		if missionType == "Rush" then
			table.insert(missionList, '[[Rush (Archwing)|Rush]] ('..table.concat(tierList, ', ')..')')
		elseif missionType == "Orphix" then
			table.insert(missionList, '[[Orphix (Mission)|Orphix]] ('..table.concat(tierList, ', ')..')')
		else
			table.insert(missionList, '[['..missionType..']] ('..table.concat(tierList, ', ')..')')
		end
	end
	
	-- Building enemyList
	table.sort(enemies, function(a, b)
			if a.Chance * (a.Count or 1) == b.Chance * (b.Count or 1) then
				return a.Name < b.Name
			end
			return a.Chance * (a.Count or 1) > b.Chance * (b.Count or 1)
		end)
	
	for _, enemy in ipairs(enemies) do
		table.insert(enemyList, (enemy.Count and enemy.Count..'x&nbsp;' or '')..'[['..enemy.Name..']]&nbsp;'..Math.percentage(enemy.Chance  / 100))
	end
	
	-- Building containerList
	table.sort(containers, function(a, b)
			if a.Chance * (a.Count or 1) == b.Chance * (b.Count or 1) then
				return a.Name < b.Name
			end
			return a.Chance * (a.Count or 1) > b.Chance * (b.Count or 1)
		end)
	
	for _, container in ipairs(containers) do
		table.insert(containerList, '[['..container.Link..'|'..container.Name..']]&nbsp;'..Math.percentage(container.Chance  / 100))
	end
	
	return table.concat(missionList, '<br />'), table.concat(enemyList, '<br />'), table.concat(containerList, '<br />')
end

return p
