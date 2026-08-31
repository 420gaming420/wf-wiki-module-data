---
title: "Module:TrajosVoid"
wiki_url: "https://wiki.warframe.com/w/Module/TrajosVoid"
wiki_timestamp: "2022-01-19T00:00:21Z"
---

*Documentation for this module may be created at [Module:TrajosVoid/doc](/w/Module:TrajosVoid/doc?action=edit&redlink=1 "Module:TrajosVoid/doc (page does not exist)")*

```lua
---	'''Void''' retrieves drop table data of opening [[Void Relic]]s as well as 
--	information on where Prime parts/blueprints drop.  

--	
--	Includes drop tables of [[Requiem Relic]]s.
--	
--	Originally built when the [[Void]] rewarded [[Prime]]d parts and blueprints.  

--	
--	On this Wiki, Void is used in:
--	* [[Module:DropTables]]
--	* [[Module:Tooltips/icon]]
--	* [[Template:PrimeTable]]
--	* [[Template:RelicPage]]
--	* [[Ducats/Prices]]
--	* [[Void Relic]]
--	* [[Forma]]
--	
--	@module			void
--	@alias			p
--	@author			[[User:ChickenBar|ChickenBar]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution	[[User:Trajos|Trajos]]
--	@image			VoidProjectionsIronD.png
--	@require		[[Module:Void/data]]
--	@require		[[Module:Weapons/data]]
--	@require		[[Module:Warframes/data]]
--	@require		[[Module:Resources/data]]
--	@require		[[Module:Companions/data]]
--  @require		[[Module:Icon/data]]
--  @require		[[Module:Tooltips/icon]]
--  @require		[[Module:Tooltips]]
--	@require		[[Module:Icon]]
--	@require		[[Module:String]]
--	@require		[[Module:Math]]
--	@require		[[Module:Table]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

local p = {}

local VoidData = mw.loadData('Module:Void/data')
local RelicData = VoidData['RelicData']
local PrimeData = VoidData['PrimeData']
local WeaponData = mw.loadData('Module:Weapons/data')['Weapons']
local WarframeData = mw.loadData('Module:Warframes/data')['Warframes']
local ResourceData = mw.loadData('Module:Resources/data')['Resources']
local CompanionData = mw.loadData('Module:Companions/data')['Companions']

local IconData = mw.loadData([[Module:Icon/data]]);
local TooltipsIcon = require([[Module:Tooltips/icon]]);
local Tooltips = require([[Module:Tooltips]]);
local Icon = require('Module:Icon')
local String = require('Module:String')
local Math = require('Module:Math')
local Table = require('Module:Table')

p.RELIC_TIER_ORDER = { "Lith", "Meso", "Neo", "Axi", "Requiem" }	-- For traversal

---	Converts Prime part names in data to proper casing.
--	@function		p._getPartName
--	@param			{string} partStr Item name
--	@param[opt]		{boolean} keepBlueprint If true, adds 'blueprint' to end of result, false otherwise. 
--											Default value is true.
--	@return			{string} Name of Prime part 
function p._getPartName(partStr, keepBlueprint)
	-- User:Falterfire 6/19/2018:
	-- New parameter to remove ' Blueprint' if wanted
	-- IE returns 'Neuroptics' instead of 'Neuroptics Blueprint'
	if keepBlueprint == nil then keepBlueprint = true end
	local result = String.titleCase(partStr)
	if not keepBlueprint and String.contains(result, ' Blueprint') then
		result = string.gsub(result, ' Blueprint', '')
	end
	return result
end

-- TODO: Remove this function, looks to be unused; cannot find it in M:Acquisition or M:VoidByReward
-- TODO: Maybe store images of prime parts in the same or different /data subpage? That way we remove dependency from M:Icon?
---	Returns the part icon for a drop.
--	For example, "Braton Prime Barrel" returns [[File:Primebarrel.png|38px]]
--	@function		p._getPartIconForDrop
--	@param			{string} drop Item name
--	@return			{string} Icon in the form of a wikitext link
function p._getPartIconForDrop(drop)
	local itemName = drop['Item']
	local partName = drop['Part']
	local iconSize =''
	local primeToggle = 'Prime '
	if itemName == 'Forma' then
		iconSize = '43'
	else
		iconSize = '54'
	end
	
	-- Outliers for naming convention
	if (itemName == 'Odonata Prime') then
		if partName == 'Harness Blueprint' or partName == 'Systems Blueprint' or partName == 'Wings Blueprint' then
			primeToggle = 'Archwing '
		end
	elseif (partName == 'Carapace' or partName == 'Cerebrum' or partName == 'Systems') then
		primeToggle = ''
	end
	
	if (partName == 'Blueprint') then
		return Icon._Prime(String.titleCase(drop['Item']), nil, iconSize)
	elseif (itemName == 'Kavasa Prime') then
		return Icon._Prime('Kavasa', nil, iconSize)
	end
	return Icon._Item(primeToggle..partName, '', iconSize)
end

---	Returns the relics in which the item is dropped from.
--	@function		p.item
--	@param			{table} frame Frame object
--					* {string} itemName Item name
--					* {string} itemPart Item part
--					* [opt] {string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--	@return			{string} Wikitext of resultant list
function p.item(frame)
	local itemName = frame.args[1]
	local partName = frame.args[2]
	local relicTier = frame.args[3]
	
	assert(itemName ~= nil, 'p.item(frame): itemName is nil')
	assert(partName ~= nil, 'p.item(frame): itemName is nil')
	
	return p._item(itemName, partName, relicTier)
end

--- Returns the relics in which the item is dropped from.
--  @function		p._item
--  @param			string} itemName Item name, case sensitive
--  @param			{string} partName Item part, case sensitive
--  @param[opt]		{string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--  @return			{string} Wikitext of resultant list
function p._item(itemName, partName, relicTier)
	local relics = {}
	local vaultedRelics = {}
	
	if not PrimeData[itemName] or not PrimeData[itemName]['Parts'][partName] then
		error('p._item(itemName, partName, relicTier): Item "' .. itemName .. '" not found.')
	end
	
	for relicName, rarity in Table.skpairs(PrimeData[itemName]['Parts'][partName]['Drops']) do
		local relic = RelicData[relicName]
		if (relicTier == nil or relic['Tier'] == relicTier) then
			local relicString = Tooltips.getFullTooltip(relicName, 'Void')..' '..rarity
			if (relic['Vaulted'] ~= nil) then
				relicString = relicString..' ([[Prime Vault|V]])'
				table.insert(vaultedRelics, relicString)
			else
				if (relic['IsBaro']) then
					relicString = relicString..' ([[Baro Ki\'Teer|B]])'
				end
				table.insert(relics, relicString)
			end
		end
	end
	
	-- Putting vaulted relics at the end of list
	for _, relicName in ipairs(vaultedRelics) do
		table.insert(relics, relicName)
	end
	
	return table.concat(relics, '  
')
end

---	Gets the total number of relics in the game.
--	@function		p.getRelicTotal
--	@param			{table} frame Frame object
--	@param[opt]		{string} frame.args Options for what relic types to include are
--							 "unvaulted", "vaulted", "baro", or nil for all relics
--	@return			{number} The total count of all relics
function p.getRelicTotal(frame)
	if (frame.args[1] == nil) then
		return Table.size(RelicData)
	end
	
	local total = 0
	local countUnvaulted = Table.contains(frame.args, 'unvaulted')
	local countVaulted = Table.contains(frame.args, 'vaulted')
	local countBaro = Table.contains(frame.args, 'baro')
	
	for _, relic in pairs(RelicData) do
		if (countUnvaulted and relic['Vaulted'] == nil) then
			total = total + 1
		end
		if (countVaulted and relic['Vaulted'] ~= nil) then
			total = total + 1
		end
		if (countBaro and relic['IsBaro']) then
			total = total + 1
		end
	end
	return total
end

---	Gets the ducat value of a Prime part or blueprint.
--	@function		p.getDucatValue
--	@param			{string} itemName Prime item name
--	@param			{string} partName Part name
--	@return			{number} The ducat value of that Prime part/blueprint
function p.getDucatValue(frame)
	local itemName = frame.args ~= nil and frame.args[1] or nil
	local partName = frame.args ~= nil and frame.args[2] or nil
	
	assert(itemName ~= nil, 'p.getDucatValue(): Item name missing')
	assert(partName ~= nil, 'p.getDucatValue(): Part name missing')
	return p._getDucatValue(itemName, partName)
end

---	Gets the ducat value of a Prime part or blueprint.
--	@function		p._getDucatValue
--	@param			{string} itemName Prime item name
--	@param			{string} partName Part name
--	@return			{number} The ducat value of that Prime part/blueprint
function p._getDucatValue(itemName, partName)
	assert(PrimeData[itemName] ~= nil, 'p._getDucatValue(itemName, partName): item "'..itemName..'" does not exist in [[Module:Void/data]]')
	assert(PrimeData[itemName]['Parts'][partName] ~= nil, 'p._getDucatValue(itemName, partName): part "'..partName..'" of item "'..itemName..'" does not exist in [[Module:Void/data]]')
	
	return PrimeData[itemName]['Parts'][partName]['DucatValue']
end

---	Gets the total ducat value of all Prime parts and blueprints.
--	@function		p.getTotalDucats
--	@param[opt]		{string} relicTier Tier name if want to filter by a specific relic tier; default nil for all relic tiers
--	@return			{number} The total ducat value
function p.getTotalDucats(frame)
	local relicTier = frame.args ~= nil and frame.args[1] or nil

	-- TODO: The following wouldn't work if filtering by certain relic tiers
	-- though I'm sure there is a way to optimize these calculations without looping through
	-- all of a data table
	-- local totalItemCount = Table.size(RelicData) * 6 -- counting all items, including duplicates
	-- number of Forma BP drops; note some relics have Forma take up two slots (e.g. only Meso D1)
	-- local numFormaDrops = Table.size(data['FORMA']['BLUEPRINT']) + 1
	
	local totalItemCount = 0	-- counting all items, including duplicates and non-prime items (e.g. Forma)
	local withoutFormaCount = 0	-- counting all items excluding forma
	local totalDucats = 0	-- all, including duplicates, itemDucats
	local availableDucats = 0	-- total ducats for items from available relics
	local availableItems = 0	-- available items
	local availableItemsNoForma = 0	-- available items excluding forma
	local vaultedDucats = 0	-- total ducats for items from vaulted relics
	local vaultedItems = 0	-- vaulted items
	local vaultedItemsNoForma = 0	-- vaulted items excluding forma
	
	-- TODO: Refactor so it won't be triple for loop, though this may be hard
	-- to do b/c of the way the tables in /data are formatted; the best we can
	-- do is probably add some optimizations?
	for itemName, itemTable in pairs(PrimeData) do
		for partName, relicTable in pairs(itemTable['Parts']) do
			for relicName, rarity in pairs(relicTable['Drops']) do
				local relic = RelicData[relicName]
				if relic['Tier'] == relicTier or relicTier == nil then
					if relic['Vaulted'] then
						vaultedItems = vaultedItems + 1
					else
						availableItems = availableItems + 1
					end
					
					totalItemCount = totalItemCount + 1
					
					if itemName ~= 'FORMA' then
						local tempDucat = p._getDucatValue(itemName, partName)
						totalDucats = totalDucats + tempDucat
						withoutFormaCount = withoutFormaCount + 1
						
						if relic['Vaulted'] ~= nil then
							vaultedDucats = vaultedDucats + tempDucat
							vaultedItemsNoForma = vaultedItemsNoForma + 1
						else
							availableDucats = availableDucats + tempDucat
							availableItemsNoForma = availableItemsNoForma + 1
						end
					end
				end
			end
		end
	end
	
	-- TODO: Average ducat value is not a helpful statistic due to the different
	-- drop rates of parts. A better statistic would be average ducat value per 
	--  relic which would account for item part drop rarity weights. 
	-- This is a more complicated problem since you would
	-- have to account for different refinement levels since the rarity weights change.
	if relicTier then
		return string.format([[
'''Average Ducats Value''': %s'''%s''' (%d rewards with %d Prime parts)  

'''Available''': %s'''%s''' (%d rewards with %d Prime parts)  

'''Vaulted''': %s'''%s''' (%d rewards with %d Prime parts)  
]], 
			Icon._Item('Ducats'),
			Math.round(totalDucats / totalItemCount, 0.01),
			totalItemCount,
			withoutFormaCount,
			Icon._Item('Ducats'),
			Math.formatnum(availableDucats),
			availableItems,
			availableItemsNoForma,
			Icon._Item('Ducats'),
			Math.formatnum(vaultedDucats),
			vaultedItems,
			vaultedItemsNoForma)
	else
		return string.format([[
'''Total Ducats Value''': %s'''%s''' (%d rewards with %d Prime parts)  

'''Available''': %s'''%s''' (%d rewards with %d Prime parts)  

'''Vaulted''': %s'''%s''' (%d rewards with %d Prime parts)  
]], 
			Icon._Item('Ducats'),
			Math.formatnum(totalDucats),
			totalItemCount,
			withoutFormaCount,
			Icon._Item('Ducats'),
			Math.formatnum(availableDucats),
			availableItems,
			availableItemsNoForma,
			Icon._Item('Ducats'),
			Math.formatnum(vaultedDucats),
			vaultedItems,
			vaultedItemsNoForma)
	end
end

---	Returns table row for wikitable generated by p.ducatRelicList().
--	@function		ducatValueRow
--	@param			{string} itemName Item name, case sensitive
--	@param			{string} partName Item part, case sensitive
--	@param[opt]		{string} relicTier Relic tier to search through; if nil looks for item in all relic tiers
--	@return			{string} Wikitext of wikitable row
local function ducatValueRow(itemName, partName, relicTier)
	local ducatValue = p._getDucatValue(itemName, partName)
	local sortValue = ''
	
	assert(itemName ~= nil, 'ducatValueRow(itemName, partName, relicTier): Please enter an item name')
	assert(partName ~= nil, 'ducatValueRow(itemName, partName, relicTier): Please enter a part name')
	
	-- First cell; blueprints will appear first before other parts of the same item
	if partName == 'Blueprint' then
		sortValue = itemName..' _'..partName
	else
		sortValue = itemName..' '..partName
	end

	return string.format([[
| data-sort-value="%s"| %s
| %s
| data-sort-value="%d"|%s'''%d'''
|-
]],
	sortValue,
	itemName..' '..partName,
	p._item(itemName, partName, relicTier),
	ducatValue,
	Icon._Item('Ducats'),
	ducatValue
)
end

---	Builds a table of all Prime parts, the relics they are in, and their ducat value
--	as seen in [[Ducats/Prices/Lith]].
--	@function		p.ducatRelicList
--	@param[opt]		{string} relicTier Tier name if want to filter by a specific relic tier; default nil for all tiers
--	@param[opt]		{string} listMode If 'Vaulted' displays only vaulted items; if 'Unvaulted' displays only unvaulted items; 
--							 if 'All' or nil, displays all items; default nil
--	@return			{string} Wikitext of table
function p.ducatRelicList(frame)
	local relicTier = frame.args ~= nil and frame.args['relicTier'] or nil
	-- Adding switch to choose only vaulted or unvaulted or all items to show
	local listMode = frame.args ~= nil and frame.args['listMode'] or 'ALL'
	listMode = String.titleCase(listMode)
	
	local itemSet = {}
	-- Note that newline at the end of table header needed so that first column 
	-- will properly show
	local result = { [[
{| style="width:100%;" class="listtable sortable" align="center"
|-
! Part
! Drop Location(s)
! data-sort-type="number" | Ducat Value
|-
]] }
	
	-- Collecting data of all items, filtering based on relic tier
	for itemName, itemTable in Table.skpairs(PrimeData) do
		for partName, relicTable in Table.skpairs(itemTable['Parts']) do
			for relicName, dropRarity in pairs(relicTable['Drops']) do
				local relicEntry = RelicData[relicName]
				if relicEntry['Tier'] == relicTier or relicTier == nil then
					if listMode == 'Vaulted' then
						if drop['IsBaro'] or relicEntry['Vaulted'] then
							itemSet[{ itemName, partName }] = true
						end
					elseif listMode == 'Unvaulted' then
						if not relicEntry['IsBaro'] and not relicEntry['Vaulted'] then
							itemSet[{ itemName, partName }] = true
						end
					else
						itemSet[{ itemName, partName }] = true
					end
				end
			end
		end
	end
	table.sort(itemSet)
	
	-- TODO: Part name is lower case when passed into ducatValueRow(); should be in Title Case
	-- see https://warframe.fandom.com/wiki/Ducats/Prices/Lith
	for itemTable, _ in pairs(itemSet) do
		-- Building actual table row
		table.insert(result, ducatValueRow(itemTable[1], itemTable[2], relicTier))
	end
	
	table.insert(result, '|}  
([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  
([[Baro Ki\'Teer|B]]) Denotes [[Baro Ki\'Teer]] Exclusive Void Relics')
	return frame:preprocess(table.concat(result))
end

---	Builds a wikitable for all prime parts. Used in [[Void Relic/ByRewards/SimpleTable]].
--	@function		p.simpleRewardTable
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.simpleRewardTable(frame)
	local primePartTable = {}
 
	-- TODO: Replace this loop with a call to PrimeData?
	-- Collect data for each relic
	for relicName, relic in pairs(RelicData) do
		local vault = "No"
		if (relic.Vaulted ~= nil) then
			vault = "Yes"
		end
		
		-- For each relic, need each drop
		for i, drop in pairs(relic['Drops']) do
			-- Custom objects are great
			local thisObj = { Item = drop['Item'], Part = drop['Part'],
							RelicName = relicName, 
							Rarity = drop['Rarity'], Vaulted = vault }
			table.insert(primePartTable, thisObj)
		end
	end

	-- Used for sorting prime parts in ascending order alphabetically with
	-- unvaulted status being first
	local function relicComparator(relic1, relic2)
		if(relic1['Item'] == relic2['Item']) then
			if(relic1['Part'] == relic2['Part']) then
				-- Vaulted is a string "Yes" or "No" as defined in for loop prior to this function
				return relic1['Vaulted'] < relic2['Vaulted']
			else
				return relic1['Part'] < relic2['Part']
			end
		else
			return relic1['Item'] < relic2['Item']
		end
	end
			
	table.sort(primePartTable, relicComparator)
 
	local rewards = {}
	local resultTable = { [[
{| class="article-table sortable" style="width: 600px;margin: auto;" cellspacing="1" cellpadding="1" border="2"
|-'
! scope="col"|Item
! scope="col"|Part
! scope="col"|Relic Name
! scope="col"|Rarity
! scope="col"|Relic Vaulted?]] }

	for i, primePart in pairs(primePartTable) do
		local rowStr = string.format([=[
|-
| [[%s]] || %s || %s || %s || %s]=], 
			primePart['Item'],
			primePart['Part'],
			Tooltips.getFullTooltip(primePart['RelicName'], 'Void'),
			primePart['Rarity'],
			primePart['Vaulted'])
		table.insert(resultTable, rowStr)
	end
	table.insert(resultTable, '|}')
	return table.concat(resultTable, '\n')
end

---	Finds all related relics and auto-generates a wikitable.
--	@function		p.relicsTable
--	@param			{table} frame Frame object
--					nil or 'unvaulted' - all unvaulted relics
--					'vaulted' - all vaulted relics
--					'baro' - all Baro-exclusive relics
--	@return			{string} Wikitext of wikitable
function p.relicsTable(frame)
	-- TODO: Hardcoding in the five types which is fine as long as somebody knows 
	-- how to fix this if DE introduces new rarities
	local data = { ["Lith"] = {}, ["Meso"] = {}, ["Neo"] = {}, ["Axi"] = {}, ["Requiem"] = {} }
	local filter = frame.args ~= nil and frame.args[1]
	
	-- Putting all relic names of relics of a certain tier in a single data table entry
	for relicName, relic in Table.skpairs(RelicData) do
		local tier = relic['Tier']
		
		if ((((filter == nil or filter == 'unvaulted') and not relic['IsBaro']) and relic['Vaulted'] == nil) or 
			(filter == 'vaulted' and relic['Vaulted'] ~= nil) or
			(filter == 'baro' and relic['IsBaro'])) then
			table.insert(data[tier], relicName)
		end
	end
	
	-- Ignoring Requiem relics as those do not drop Primed parts
	local resultTable = { ([[
{| class="article-table" cellspacing="1" cellpadding="1" border="2" style="margin:auto"
|+ Unvaulted/Available Relics
|-
! scope="col" style="width:20%%;" | Lith (%s relics)
! scope="col" style="width:20%%;" | Meso (%s relics)
! scope="col" style="width:20%%;" | Neo (%s relics)
! scope="col" style="width:20%%;" | Axi (%s relics)
! scope="col" style="width:20%%;" | Requiem (%s relics)
|-]]):format(
			Table.size(data['Lith']),
			Table.size(data['Meso']),
			Table.size(data['Neo']),
			Table.size(data['Axi']),
			Table.size(data['Requiem'])
		)
	}
 
	-- Loop through each tier and add all the relics for each one
	for _, tier in ipairs(p.RELIC_TIER_ORDER) do
		table.insert(resultTable, '| ')
		for _, relicName in ipairs(data[tier]) do
			table.insert(resultTable, '*'..Tooltips.getText(relicName, 'Void')..'  
')
		end
	end
	table.insert(resultTable, '|}')
 
	return frame:preprocess(table.concat(resultTable, '\n'))
end

---	Builds a wikitable of each prime part and the relics it can be dropped from.
--	@function		p.byReward
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of table
function p.byReward(frame)
	local resultTable = { [[
{| class="bigmodtable" style="line-height:16px; font-size:14px;"
|-
! Item Name !! Part Name !! Relics]] }
	
	for item, partTable in Table.skpairs(PrimeData) do
		table.insert(resultTable, '|-')
		-- First column with item name and image; first column will span a number of rows
		-- that depend on how many prime parts are associated with item
		local imageName = WeaponData[item] and WeaponData[item]['Image'] or 
				WarframeData[item] and WarframeData[item]['Image'] or 
				CompanionData[item] and CompanionData[item]['Image'] or
				ResourceData[item] and ResourceData[item]['Image'] or
				'Panel.png'
		
		local itemColumn = string.format('| rowspan="%d"|[[File:%s|300px]]  
[[%s]]', 
			Table.size(partTable['Parts']), imageName, item)
		table.insert(resultTable, itemColumn)
		
		local firstRow = true
		-- Getting relics for each prime part of an item
		for part, drops in Table.skpairs(partTable['Parts']) do
			if (firstRow) then
				firstRow = false
			else
				table.insert(resultTable, '|-')
			end
			
			local partName = p._getPartName(part)
			
			-- Second column with part name
			table.insert(resultTable, '| '..partName..' || ')
			
			local relics = {}
			local vaultedRelics = {}
			for relicName, rarity in pairs(drops['Drops']) do
				local relic = RelicData[relicName]
				local relicString = Tooltips.getFullTooltip(relicName, 'Void').." "..rarity
				
				if (relic['Vaulted'] ~= nil) then
					relicString = relicString..' ([[Prime Vault|V]])'
					table.insert(vaultedRelics, relicString)
				else
					if (relic['IsBaro']) then
						relicString = relicString..' ([[Baro Ki\'Teer|B]])'
					end
					table.insert(relics, relicString)
				end
			end
			-- Third column with list of relics that drops a prime part;
			-- unvaulted relics will appear at the top and vaulted relics at the bottom
			for _, relicName in ipairs(vaultedRelics) do
				table.insert(relics, relicName)
			end
			table.insert(resultTable, table.concat(relics, '  
'))
		end
	end
	table.insert(resultTable, '|}')
	
	return table.concat(resultTable, '\n')
end

---	Builds a wikitable of each relic's drop tables.
--	@function		p.byRelic
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of table
function p.byRelic(frame)
	local tableStr = { [[
{| class="article-table sortable"
! Tier
! Type
! Common Rewards
! Uncommon Rewards
! Rare Rewards]] }
 
	-- Building each table row
	for relicName, relicTable in pairs(RelicData) do
		-- First, new row indicator
		table.insert(tableStr, "|-")
		-- Tier & relic names
		table.insert(tableStr, ("| "..relicTable['Tier']))
		table.insert(tableStr, ("| [["..relicName.."|"..relicTable['Name'].."]]"))
 
		local commonStr = { "| " }
		local uncommonStr = { "| " }
		local rareStr = { "| " }
		for i, drop in ipairs(relicTable['Drops']) do
			local itemName = drop['Item']
			local partName = drop['Part']
			local itemLink = string.format('* [[%s|%s %s]]', itemName, itemName, partName)
			if (drop['Rarity'] == 'Common') then
				table.insert(commonStr, itemLink)
			elseif (drop['Rarity'] == 'Uncommon') then
				table.insert(uncommonStr, itemLink)
			else
				table.insert(rareStr, itemLink)
			end
		end
		
		table.insert(tableStr, table.concat(commonStr, '\n'))
		table.insert(tableStr, table.concat(uncommonStr, '\n'))
		table.insert(tableStr, table.concat(rareStr, '\n'))
	end
	table.insert(tableStr, "|}")
	return table.concat(tableStr, '\n')
end

---	Builds a wikitable of all relic drops sorted by rarity.
--	@function		p.byRarity
--	@param			{table} frame Frame object
--					{string} checkTier Relic tier to filter by; default 'All' for all tiers
--	@return			{string} Wikitext of table
function p.byRarity(frame)
	local checkTier = frame.args ~= nil and frame.args[1] or 'All'

	local rarityOrder = { 'Common', 'Uncommon', 'Rare' }
	local rarityData = { Common = {}, Uncommon = {}, Rare = {} }
 
	-- Collect data
	for relicName, relic in pairs(RelicData) do
		local tier = relic['Tier']
		local name = relic['Name']
		-- So first make sure this row is the right tier
		if (tier == checkTier or tier == 'All') then
			for _, drop in pairs(relic['Drops']) do
				local rarity = drop['Rarity']
				local item = drop['Item']
				local part = drop['Part']
				
				-- Using '|' as a delimiter to split by
				if (rarityData[rarity][item..'|'..part] == nil) then
					-- Assigning a dummy value that will not be used so that keys
					-- can be in an unsorted set
					rarityData[rarity][item..'|'..part] = true
				end
			end
		end
	end
 
	-- Now we can actually format the table
	-- Starting with all the column headers
	local resultTable = { string.format([[
{| class="article-table"
! style="width:33%%;text-align:center;" | Common (%d rewards)
! style="width:33%%;text-align:center;" | Uncommon (%d rewards)
! style="width:33%%;text-align:center;" | Rare (%d rewards)
|-
|]], 
	Table.size(rarityData['Common']),
	Table.size(rarityData['Uncommon']),
	Table.size(rarityData['Rare'])
) }

	-- Then go through each rarity
	-- Each rarity is the same steps:
	for _, rarity in ipairs(rarityOrder) do
		--1. Loop through each item in that rarity in ascending order
		for itemStr, _ in Table.skpairs(rarityData[rarity]) do
			--2. Get the item & part
			local delimiterIndex = string.find(itemStr, '|')
			local itemName = string.sub(itemStr, 1, delimiterIndex - 1)
			local partName = p._getPartName(string.sub(itemStr, delimiterIndex + 1))
			--3. Add the appropriate link to the table
			table.insert(resultTable, string.format('* [[%s|%s %s]]', itemName, itemName, partName))
		end
		table.insert(resultTable, '|')
	end
	table.insert(resultTable, '|}')
	return table.concat(resultTable, '\n')
end

---	Builds wikitable of Void Relics in which a Prime item's parts drop from as
--	seen on any Prime item page (e.g. [[Braton Prime]]).
--	@function		p.buildPrimeTable
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of wikitable
function p.buildPrimeTable(frame)
	local itemName = String.titleCase(mw.text.decode(frame.args['name'] or ''))
	assert(PrimeData[itemName] ~= nil, 'p.buildPrimeTable(frame): "'..itemName..'" does not exist in [[Module:Void/data]]')
	local n = 1;
	local partData = PrimeData[itemName]['Parts']
	local result = { ([=[

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki'Teer|B]]) Denotes [[Baro Ki'Teer]] Exclusive Void Relic

{| style="width: 100%%; table-layout: fixed;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left"
|+ %s
|-]=]):format(itemName..'\'s Relic Drops') }

	local blueprint = ' Blueprint';
	for partName, _ in pairs(partData) do
    	-- Use Mission for items like Forma else use Part for items that 
    	-- are crafted from multiple parts that rewarded from drop table(s)
    	local icon = '';
		local part = partName;
    	if part ~= nil and part ~= '' then
			part = mw.text.decode(part); -- Replacing HTML codes in text with their ASCII character equivalent
			part = string.gsub(" "..string.lower( part ), "%W%l", string.upper):sub(2);
			
			if part == 'Blueprint' or part == 'Main Blueprint' then
				local source = 'Warframes';
				local index = TooltipsIcon[source](itemName);
				if not index then
					source = 'Companions';
					index = TooltipsIcon[source](itemName);
				end
				if not index then
					source = 'Weapons';
					index = TooltipsIcon[source](itemName);
				end
				if index then
					icon = Tooltips.getImage(itemName, source, nil).." ";
				end
			else
        		if string.sub(part, -#blueprint) == blueprint then
        			part = string.sub(part, 1, #part - #blueprint);
        		end
        		
				if itemName == "Odonata Prime" then
					if IconData["Items"]["Archwing "..part..blueprint] ~= nil then
	        			icon = "Archwing "..part..blueprint
	        		end
				elseif IconData["Items"]["Prime "..part] ~= nil then
	        		icon = "Prime "..part
				elseif IconData["Items"]["Prime "..part..blueprint] ~= nil then
	        		icon = "Prime "..part..blueprint
				elseif IconData["Items"][part] ~= nil then
	        		icon = part
	        	end
	        	if icon ~= '' then
	        		icon = Icon._Item(icon, nil, nil)..' ';
	        	end
        	end
    	end
        	
		table.insert(result, ('! style="text-align:center;" | %s'):format(icon..partName))
	end
	table.insert(result, '|-')
	for partName, _ in pairs(partData) do
		table.insert(result, ('| style="text-align:center; font-size:12px;" | %s'):format(p._item(itemName, partName, nil)))
	end
	
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

---	Builds wikitable of Void Relics in which Forma blueprints drop from as
--	seen on [[Forma]].
--	@function		p.buildFormaBPRelicTable
--	@returns		{string} Resultant wikitext of wikitable
function p.buildFormaBPRelicTable()
	return ([=[{| style="width: 100%%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left"
|-
! style="text-align:center; width: 25%%" | Lith
! style="text-align:center; width: 25%%" | Meso
! style="text-align:center; width: 25%%" | Neo
! style="text-align:center; width: 25%%" | Axi
|-
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
| style="text-align:center; padding: 6px 0px" | %s
|-
|}

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki'Teer|B]]) Denotes [[Baro Ki'Teer]] Exclusive Void Relic

]=]):format(
	p._item('Forma', 'Blueprint', 'Lith'),
	p._item('Forma', 'Blueprint', 'Meso'),
	p._item('Forma', 'Blueprint', 'Neo'),
	p._item('Forma', 'Blueprint', 'Axi')
)
end

return p
```

