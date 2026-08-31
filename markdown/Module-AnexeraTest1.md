---
title: "Module:AnexeraTest1"
wiki_url: "https://wiki.warframe.com/w/Module/AnexeraTest1"
wiki_timestamp: "2026-08-07T11:41:39Z"
---

*Documentation for this module may be created at [Module:AnexeraTest1/doc](/w/Module:AnexeraTest1/doc?action=edit&redlink=1 "Module:AnexeraTest1/doc (page does not exist)")*

```lua
local startTime = os.clock()
local p = {}

local Args = require('Module:Arguments');
local Entrypoint = require('Module:Entrypoint');
local BaroData = mw.loadData('Module:Baro/data')
local BaroItems = BaroData['Items']
local TypeConfigs = mw.loadData('Module:Baro/data/typeConfigs')
local Table = require('Module:Table')
local Tooltip = require('Module:Tooltips')
local Lang = mw.language.getContentLanguage()

local seenPool = {}

---	Internal helper to merge, clean, and deduplicate any types of data into existing tables.
--	@function		mergeData
--	@param			{table|any} source Data to merge
--		- sequence		: Merges all indexed elements
--		- other types	: Treated as a single element fallback
--		- {}			: Skipped
--	@param			{table} target Target array table for merged and deduplicated results
--	@param			{table} seen Hash table used for fast deduplication
--	@param			{number} limit Maximum number of elements to merge (optional)
--	@param			{boolean} forward Loop direction (optional, true to loop from start, false to loop from end)
--	@param			{string|number} label Custom suffix appended to each merged item (optional)
--		NOTE: If provided, all input items must be string or number to prevent concatenation errors
--	@return			{nil}
local function mergeData(source, target, limit, forward, label)
	if source == nil then return end
	assert(type(target) == "table", "mergeData(): 'target' must be a table")

	local isTable = type(source) == 'table'
	local isArray = isTable and source[1] ~= nil
	local n = 0

	if seenPool.__lastTarget ~= target then
		for k in pairs(seenPool) do seenPool[k] = nil end
		seenPool.__lastTarget = target
	end

	if isArray then -- count array length
		for _ in ipairs(source) do n = n + 1 end
	elseif isTable then -- distinguish hash vs {}
		for _ in pairs(source) do n = 1 break end
	else -- fallback for single value
		n = 1
	end

	local startIndex, endIndex, step, count = 1, n, 1, 0
	if forward == false then startIndex, endIndex, step = n, 1, -1 end

	for i = startIndex, endIndex, step do
		local d = isArray and source[i] or source
		local cleanD = type(d) == 'string' and d:match("^%s*(.-)%s*$") or d
		if cleanD ~= '' and not seenPool[cleanD] then
			table.insert(target, label and cleanD .. label or cleanD)
			seenPool[cleanD] = true
			if limit then
				count = count + 1; if count >= limit then break end
			end
		end
	end
end

--- Formats a data list into various Wikitext components based on the specified output mode.
-- @function	formatDataList
-- @param		{table} list Array of items (strings) to be formatted and displayed
-- @param		{string} mode Output rendering type ('table', 'list', 'tooltip', 'collapsible', or 'wikitable')
-- @param		{string} caption Display title or label for the component header (optional, defaults to list[1])
-- @param		{string} id Wikitext element ID (recommended; defaults to [mode] .. 'List')
-- 						Required only for 'collapsible' mode to separate independent lists or create custom toggle groups
-- @return		{string|table} Wikitext syntax, fallback plain text, or raw table depending on the mode
local function formatDataList(list, mode, caption, id)
	if type(list) ~= 'table' then return end
	if mode == 'table' then return list end
	if mode == 'list' then return table.concat(list, '  
') end
	if mode == 'wikitable' then
		return string.format('{| class="wikitable sortable"\n!%s\n|-\n|%s\n|}',
			caption or 'Table', table.concat(list, '\n|-\n|'))
	end

	local firstItem = list[1]
	local displayLabel = caption or firstItem
	if #list > 1 or (caption and firstItem) then
		-- Ensure doesn't repeat the label if the label is the first item
		local startIndex = caption and 1 or 2

		if mode == 'tooltip' then
			local maxLen = 0; for _, v in ipairs(list) do maxLen = math.max(maxLen, #v) end
			local width = math.max(math.floor(maxLen / 2), 6)
			return string.format('%s',
				("￣"):rep(width) .. '\\n' .. table.concat(list, '\\n', startIndex), displayLabel
			)
		elseif mode == 'collapsible' then
			local collapsibleId = id or mode .. 'List'
			return string.format(
				'%s ▼  
%s',
				collapsibleId, displayLabel, collapsibleId, table.concat(list, '  
', startIndex)
			)
		end
	end

	return displayLabel or ''
end

--- Core logic to process Baro history dates and generate tooltip or plain text.
-- @function				_getItemDates
-- @param					{table} options Configuration table containing:
-- * '''item''' 			(table|string): ItemEntry array or ItemName string (supports comma-separated values). (optional if extraDates is provided)
--								All dates will be merged and deduplicated into a single list.
-- * '''platform'''			(string): Filter platform, e.g., 'All', 'PC', 'Consoles', 'SharedOnly', 'PcOnly', 'ConsolesOnly' (default: 'PC')
-- * '''mode'''				(string): Output mode, 'table' (default), 'list', 'tooltip', 'collapsible', or 'wikitable'
-- * '''limit'''			(number): Maximum number of elements to fetch (optional)
-- * '''asc'''				(boolean): Sorting order, true for ASC, false for DESC (optional, default: true)
-- * '''platformLabel'''	(boolean): Whether to append platform names as suffixes to dates (optional, default: false)
-- * '''tennocon'''	(boolean): Whether to include TennoCon dates (optional)
-- * '''extraDates'''		(table|string): Additional comma-separated string or array of dates (optional if item is provided)
-- * '''caption'''			(string): Display title or label for 'tooltip', 'collapsible', or 'wikitable' modes header (optional)
-- * '''id'''				{string}: Wikitext element ID for 'collapsible' mode (recommended)
-- @return					{table|string} Table array of dates or formatted HTML/plain text based on mode
local function _getItemDates(options)
	local itemInput		= options.item
	itemInput			= (type(itemInput) == 'string' and string.find(itemInput, ",")) and mw.text.split(itemInput, '%s*,%s*') or itemInput

	-- Normalize optional parameters
	local platform		= options.platform or "PC"
	local mode			= options.mode or "table"
	local limit			= options.limit and tonumber(options.limit)
	local asc			= options.asc ~= false and options.asc ~= 'false'
	local platformLabel	= options.platformLabel == true or options.platformLabel == 'true'
	local extraDates	= options.extraDates
	assert(itemInput or extraDates, '_getItemDates(options): item or extraDates cannot be nil')

	-- Merge dates
	local isArray		= type(itemInput) == "table" and itemInput[1] ~= nil
	local dates			= {}
	local mergeCount	= 0

	for i=1, isArray and #itemInput or 1 do
		if not itemInput then break end
		local item			= isArray and itemInput[i] or itemInput
		local ItemEntry		= type(item) == 'table' and item or BaroItems[item]
		assert(ItemEntry, string.format('_getItemDates(options): "%s" does not exist in [[Module:Baro/data]].', tostring(item)))
		assert(ItemEntry.Name, '_getItemDates(options): Invalid ItemEntry object structure (missing "Name").')

		local dateKey	= ItemEntry.IsAlways and 'Introduced' or 'OfferingDates'
		if platform == 'All' or platform == 'PC' or platform == 'PcOnly' then
			mergeData(ItemEntry['Pc' .. dateKey], dates, limit, asc, platformLabel and ' (PC only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'Consoles' or platform == 'ConsolesOnly' then
			mergeData(ItemEntry['Console' .. dateKey], dates, limit, asc, platformLabel and ' (Consoles only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'PC' or platform == 'Consoles' or platform == 'SharedOnly' then
			mergeData(ItemEntry[dateKey], dates, limit, asc); mergeCount = mergeCount + 1
		end
		if options.tennocon then
			mergeData(ItemEntry.TennoConOfferingDates, dates, limit, asc); mergeCount = mergeCount + 1
		end
		assert(mergeCount > 0, string.format('_getItemDates(options): Invalid platform %q', platform))
	end

	-- Merge extraDates
	if extraDates then
		local extraDatesArray = type(extraDates) == 'string' and mw.text.split(extraDates, '%s*,%s*') or extraDates
		mergeData(extraDatesArray, dates, nil, asc); mergeCount = mergeCount + 5
	end

	-- Sorting
	if mergeCount > 1 and asc then
		table.sort(dates, function(a, b) return tostring(a) < tostring(b) end)
	elseif mergeCount > 1 then
		table.sort(dates, function(a, b) return tostring(a) > tostring(b) end)
	end

	-- Truncate list to limit
	if limit and #dates > limit then
		for i = #dates, limit + 1, -1 do dates[i] = nil end
	end

	return formatDataList(dates, mode, options.caption, options.id)
end

---	Template entry point for #invoke. Standardizes frame arguments.
--	@function		p.getItemDates
--	@param			{table} frame Frame object
--	@return			{string} formatted plain text based on mode
--	@see			_getItemDates
function p.getItemDates(frame)
	local args = Args.getArgs(frame)
	if args.mode == 'table' then args.mode = 'wikitable' end

	return _getItemDates(args)
end

--- Internal function to calculate totals from an array of item entries.
--	@function		_getTotal
--	@param			{table} ItemEntries Array of item entries
--	@param			{boolean|nil} returnString If true, returns the formatted string
--	@return			{string|table} A formatted string, or a hash table containing the totals by default
local function _getTotal(ItemEntries, returnString)
	local count, credits, ducats = 0, 0, 0

	for _, entry in ipairs(ItemEntries) do
		if entry.Image then
			count = count + 1; credits = credits + (entry.CreditCost or 0); ducats = ducats + (entry.DucatCost or 0)
		end
	end

	if returnString then
		return string.format('Total Items: %s | Cost: %s %s + %s %s',
			Lang:formatNum(count),
			Tooltip.icon('Credits', 'Resources'), Lang:formatNum(credits),
			Tooltip.icon('Orokin Ducats', 'Resources'), Lang:formatNum(ducats)
		)
	end

	return { count = count, credit = credits, ducat = ducats }
end

--- Main entry point to get totals of Baro offerings.
-- Supports both Scribunto #invoke from wikitext and direct require() calls from other Lua modules.
-- @function		p.getTotal
-- @param			{table} frame MediaWiki frame object, or a standard arguments table for inter-module calls.
-- @param[opt]		{string} frame.args.platform Platform filter: 'PC' (default), 'Consoles', or 'All'.
-- @param[opt]		{string} frame.args.name Item name pattern (supports Lua regular expression patterns).
-- @param[opt]		{string} frame.args.type Item type pattern (supports Lua regular expression patterns).
-- @param[opt]		{string} frame.args.format Custom output format string with tokens like {count}, {credit}, {cucat}.
-- @return			{string|table} Formatted string when invoked from wikitext; Raw data hash table when called by other modules without format.
function p.getTotal(frame)
	assert(type(frame) == 'table', 'p.getTotal(frame): Argument must be a table or a frame object')
	local isInvoke = type(frame) == 'table' and type(frame.preprocess) == 'function'
	local args = isInvoke and Args.getArgs(frame) or frame
	local platform = args.platform or 'PC'
	local namePattern = args.name
	local typePattern = args.type
	local format = args.format
	local platformMap = { All = 'All', PC = "Pc", Consoles = "Console" }
	assert(platformMap[platform], 'p.getTotal(frame): Invalid platform')

	local ItemEntries = {}
	local exactItem = BaroItems[namePattern]
	if exactItem then
		ItemEntries[1] = exactItem
	else -- Filter Items
		local dateKey = platformMap[platform] .. 'OfferingDates'
		for _, v in pairs(BaroItems) do
			if platform == 'All' or v.OfferingDates or v[dateKey] or v.IsAlways then
				local matchName = not namePattern or (v.Name and string.find(v.Name, namePattern))
				local matchType = not typePattern or (v.Type and string.find(v.Type, typePattern))
				if matchType and matchName then table.insert(ItemEntries, v) end
			end
		end
	end

	local stats = _getTotal(ItemEntries, not format and isInvoke)

	if format then
		for k, v in pairs(stats) do stats[k]=Lang:formatNum(v) end
		return frame:preprocess(string.gsub(format, "{([%w_]+)}", stats))
	end

	return stats
end

---	Builds offerings display in a custom gallery format.
--	@function		p.buildGallery
--	@param			{table} ItemEntries Array of item entries, case sensitive; assuming no duplicate values
--	@return			{string} Wikitext of gallery
local function buildGallery(ItemEntries)
	local galleryUl		= '

%s
'
	local galleryBoxLi	= '- %s
'
	local thumbDiv		= '

%s

'
	local tooltipSpan	= '%%s'
	local textDiv		= '

%s

'
	local galleryBoxes	= {}
	
	for _, entry in ipairs(ItemEntries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local tooltipModule	= (TypeConfigs[entry.Type or ''] or {}).TooltipModule
		local displayName	= entry.Image and
			'[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]' or
			string.format('"%s" does not exist in [[Module:Baro/data]].', entry.Name)
	
		local thumb = thumbDiv
			:format(tooltipModule and tooltipSpan:format(itemLink, tooltipModule, itemName) or '%s')
			:format('[[File:%s|120x120px|link=%s]]')
			:format(entry.Image or 'UnidentifiedItem.png', itemLink)
	
		local text = textDiv
			:format('%s  
[[File:OrokinDucats.png|20px|link=Ducats]] %s  
[[File:Credits64.png|20px|link=Credits]] %s')
			:format(displayName, Lang:formatNum(entry.DucatCost or 0), Lang:formatNum(entry.CreditCost or 0))
	
		table.insert(galleryBoxes, galleryBoxLi:format(thumb .. text))
	end
	
	return _getTotal(ItemEntries, true) .. '\n' .. galleryUl:format('\n' .. table.concat(galleryBoxes, '\n'))
end

---	Renders a sortable store table from a array of item entries.
--	@function				buildHistoryTable
--	@param					{table} ItemEntries Array of item entries:
--	* ItemEntries.tabName	{string} (Metadata) Current tab name used for element ID
--	* ItemEntries.config	{table} (Metadata) Configuration object passed from the parent builder:
--		* ItemEntries.config.itemDates	{table} Map of item names to their respective history date arrays
--	@return 				{string} Wikitext of table
local function buildHistoryTable(ItemEntries)
	local config		= ItemEntries.config or error('buildHistoryTable(ItemEntries): missing ItemEntries.config')
	local tabName		= ItemEntries.tabName
	local itemDates		= config.itemDates
	local historyTable	= { ([=[Toggle Image
{| class="wikitable sortable lighttable store-table stickyHeader" style="width: 100%%; margin-left: auto; margin-right: auto; text-align: center;" data-tableid="%s"
|-
! style="width: 24%%;" | Item
! style="width: 18%%;" | Type
! style="width: 12%%;" | %s Credit
! style="width: 12%%;" | %s Ducat
! style="width: 17%%;" | Introduced
! style="width: 17%%;" | Date(s) Offered
|-]=]):format('BaroTable' .. (tabName == 'All' and '-All' or ''), Tooltip.icon('Credits', 'Resources'), Tooltip.icon('Orokin Ducats', 'Resources')) }

	local rowTemplate	= [=[
|- data-rowid="%s"
| %s
| %s
| data-store-currency="Credit" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| data-store-currency="Ducat" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| %s
| %s]=]

	local tooltipSpan	= '%s'

	for _, entry in ipairs(ItemEntries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local credit		= entry.CreditCost or 0
		local ducat			= entry.DucatCost or 0
		local dates			= itemDates[itemName]
		local tooltipModule	= (TypeConfigs[entry.Type or ''] or {}).TooltipModule
		local item			= ('[[File:%s|150x220px|link=%s]]  
%s')
			:format(entry.Image or 'UnidentifiedItem.png', itemLink, '[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]')

		table.insert(historyTable, string.format(rowTemplate,
			itemName,
			tooltipModule and tooltipSpan:format(itemLink, tooltipModule, itemName, item) or item,
			entry.Type or '',
			credit, credit, Lang:formatNum(credit),
			ducat, ducat, Lang:formatNum(ducat),
			string.sub(dates[#dates] or '', 1, 10),
			entry.IsAlways and 'Always Available' or
				formatDataList(dates, 'collapsible', nil, ('BaroTable-Dates-' .. itemName):gsub(" ", "_")) or ''
		))
	end

	return _getTotal(ItemEntries, true) .. '\n' .. table.concat(historyTable, '\n') .. '\n|}'
end

---	Organizes items into categories and builds a tabber display using a provided configuration object.
--	@function		buildTabbers
--	@param			{table} ItemEntries Array of item entries to be categorized
--	@param			{table} config Configuration object containing tabs, getItemCat, and render functions
--	@return			{string} Wikitext of the nested tabber containing categorized content and summaries
local function buildTabbers(ItemEntries, config)
	mw.log(string.format('T+%.4fs |   buildTabbers()', os.clock() - startTime))
	local cats = {}
	for _, catName in ipairs(config.tabs) do cats[catName] = {} end

	for _, ItemEntry in ipairs(ItemEntries) do
		if ItemEntry.IsDiscont and cats['Discontinued'] then
			table.insert(cats['Discontinued'], ItemEntry)
		else
			local itemCat = config.getItemCat(ItemEntry)
			if cats['All'] then table.insert(cats['All'], ItemEntry) end
			if cats[itemCat] then table.insert(cats[itemCat], ItemEntry) end
		end
	end

	local tabberParts = {}
	for _, catName in ipairs(config.tabs) do
		local data = cats[catName]
		if #data > 0 then
			data.tabName = catName
			data.config = config
			mw.log(string.format('T+%.4fs |     building content for %s', os.clock() - startTime, catName))
			local content = config.render(data)
			table.insert(tabberParts, string.format("%s=\n%s", catName, content))
		end
	end
	for k in pairs(seenPool) do seenPool[k] = nil end

	if #tabberParts == 0 then return 'No matched items' end
	
	return '\n|-|' .. table.concat(tabberParts, '\n|-|') .. '\n'
end

---	Builds current cross-platform offerings display in a gallery format.
--	@function		p.buildCurrentOfferings
--	@param			{table} frame Frame arguments will be the item names that Baro is offering, case sensitive
--	@return			{string} Wikitext of gallery
function p.buildCurrentOfferings(frame)
	mw.log(string.format('T+%.4fs | p.buildCurrentOfferings()', os.clock() - startTime))
	local args = frame.args--Args.getArgs(frame)
	assert(args, 'p.buildCurrentOfferings(frame): cannot have empty arguments; arguments must be item names, case sensitive')

	local buildgalleryConfig = {
		tabs = { 'All', 'Mods', 'Appearance', 'Weapons', 'Miscellaneous' },
		getItemCat = function(entry) return (TypeConfigs[entry.Type or ''] or {}).GalleryCategory or 'Unknown' end,
		render = buildGallery
	}

	mw.log(string.format('T+%.4fs |   filtering', os.clock() - startTime))
	local ItemEntries = {}
	local extraItems = { -- Always available items, not included in the API.
		{ Condition = "Requires Inaros Prime (Equipped)", CreditCost = 25000, DucatCost = 100,
		 	Image = "BaroVoid-Signal.png", Name = "Baro Void-Signal", Type = "Mission Locator" },
	}

	if args.allItems == 'true' then
		for _,  v in pairs(BaroItems) do
			if not v.IsDiscont then table.insert(ItemEntries, v) end
		end
		table.sort(ItemEntries, function(a, b) return a.Type == b.Type and a.Name < b.Name or a.Type < b.Type end)
	else
		for _, itemName in ipairs(args) do
			table.insert(ItemEntries, BaroItems[itemName:match('^%s*(.-)%s*$')] or { Name = itemName:match('^%s*(.-)%s*$') })
		end
	end

	if args.extraItems == 'true' then
		for i = 1, #extraItems do ItemEntries[#ItemEntries + 1] = extraItems[i] end
	end

	local wikiText = buildTabbers(ItemEntries, buildgalleryConfig)
	mw.log(string.format('T+%.4fs |   framePreprocessing', os.clock() - startTime))
	local result = frame:preprocess(wikiText)
	mw.log(string.format('T+%.4fs |   finish', os.clock() - startTime))

	return result
end

---	Builds Baro's offering history tabber wikitable.
--	@function			p.buildOfferingHistoryTable
--	@param				{frame} frame MediaWiki frame object containing template arguments:
--	* frame.args[1]		{string} Target platform: 'PC' (default), 'Consoles', or 'All'.
--	* frame.args[2]		{string} Categorization mode: 'HistoryCategory' (default), 'GalleryCategory', 'ItemType', 'Year'.
--	* frame.args[3]		{string} (Optional) Filter key:
--		* nil - (Default) Dynamic aggregation, loops through all categories.
--		* 'All' - Forces aggregation into a single unified 'All' tab only.
--		* 'Name' - Renders a single specific tab (e.g., 'Weapon').
--		* 'Name, Name' - Comma-separated list to render multiple specific tabs simultaneously
--	@returns		(string) Wikitext of the tabbed history tables.
function p.buildOfferingHistoryTable(frame)
	mw.log(string.format('T+%.4fs | p.buildOfferingHistoryTable()', os.clock() - startTime))
	local args = frame.args--Args.getArgs(frame)
	local platform = args[1] or 'PC'
	local cat = args[2] or 'HistoryCategory'
	local key = args[3]
	local platformMap = { All = 'All', PC = "Pc", Consoles = "Console" }
	assert(platformMap[platform], 'p.buildOfferingHistoryTable(frame): Invalid first argument')

	-- Categories Configuration
	local categories = key == nil and {} or mw.text.split(key, '%s*,%s**')
	local buildHistoryConfig = { platform = platform, tabs = categories, render = buildHistoryTable, itemDates = {}}
	local getItemDatesConfig = { platform = platform, asc = false, platformLabel = true }

	if cat == 'HistoryCategory' or cat == 'GalleryCategory' or cat == 'ItemType' then
		if key == nil then
			if cat == 'ItemType' then
				for k in pairs(TypeConfigs) do table.insert(categories, k) end
			else
				for _, v in pairs(TypeConfigs) do mergeData(v[cat], categories) end
			end
			table.sort(categories)
			table.insert(categories, 1, 'All')
			table.insert(categories, 'Discontinued')
		end
		buildHistoryConfig.getItemCat = cat == 'ItemType' and
			function(entry) return entry.Type or 'Unknown' end or
			function(entry) return (TypeConfigs[entry.Type or ''] or {})[cat] or 'Unknown' end

	elseif cat == 'Year' then
		if key == nil then
			local startYear = platform == 'Consoles' and 2015 or 2014
			for year = os.date('!*t').year, startYear , -1 do
				table.insert(categories, tostring(year))
			end
		end
		buildHistoryConfig.getItemCat = function(entry)
			local dates = buildHistoryConfig.itemDates[entry.Name]
			return #dates >0 and string.sub(dates[#dates], 1, 4) or 'Unknown'
		end
	else
		error('p.buildOfferingHistoryTable(frame): Invalid second argument')
	end

	mw.log(string.format('T+%.4fs |   filtering', os.clock() - startTime))
	-- Filter Platform
	local ItemEntries = {}
	local dateKey = platformMap[platform] .. 'OfferingDates'
	for k, v in pairs(BaroItems) do
		if platform == 'All' or v['OfferingDates'] or v[dateKey] or v.IsAlways then
			getItemDatesConfig.item = v
			buildHistoryConfig.itemDates[k] = _getItemDates(getItemDatesConfig)
			table.insert(ItemEntries, v)
		end
	end

	local wikiText = buildTabbers(ItemEntries, buildHistoryConfig)
	mw.log(string.format('T+%.4fs |   framePreprocessing', os.clock() - startTime))
	local result = frame:preprocess(wikiText)
	mw.log(string.format('T+%.4fs |   finish', os.clock() - startTime))

	return result
end

p.__main = Entrypoint(p);

return p
```

