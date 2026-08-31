---	'''Baro''' stores [[Baro Ki'Teer]]'s offering history.<br />
--	
--	On this Wiki, Baro is used in:
--	* [[Template:BaroCurrentOfferings]]
--	* [[Template:BaroOfferingsHistoryTable]]
--	* [[Template:BaroItemDates]]
--	* [[Module:Weapons/infobox]]
--	* [[Module:Mods/infobox]]
--	* [[Module:Void/page]]
--	
--	@module		baro
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Anexera|Anexera]]
--	@attribution	[[User:FINNER|FINNER]]
--	@image		PrismaSigil.png
--	@require	[[Module:Arguments]]
--	@require	[[Module:Entrypoint]]
--	@require	[[Module:Baro/data]]
--	@require	[[Module:Baro/data/typeConfigs]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@release	stable
--	

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
--	@note			Optimized for MediaWiki/Scribunto. It uses a persistent `seenPool` container to avoid repeated table allocation and GC pressure.
--						The pool automatically flushes itself when a new `target` is detected.
--	@param			{table|any} source Data to merge
--		- sequence		: Merges all indexed elements
--		- other types	: Treated as a single element fallback
--		- {}			: Skipped
--	@param			{table} target Target array table for merged and deduplicated results
--	@param			{number} limit Maximum number of elements to merge (optional)
--	@param			{boolean} forward Loop direction (optional, true to loop from start, false to loop from end)
--	@param			{string|number} label Custom suffix appended to each merged item (optional)
--		NOTE: If provided, all input items must be string or number to prevent concatenation errors
--	@return			{nil}
local function mergeData(source, target, limit, forward, label)
	if source == nil then return end
	assert(type(target) == "table", "mergeData(source, target): 'target' must be a table")

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
-- @param		{string} id Wikitext element ID (recommended; defaults to 'collapsibleList')
-- 						Required only for 'collapsible' mode to separate independent lists or create custom toggle groups
-- @return		{string|table} Wikitext syntax, fallback plain text, or raw table depending on the mode
local function formatDataList(list, mode, caption, id)
	list = type(list) == 'table' and list or {list}
	if mode == 'table' then return list end
	if mode == 'list' then return table.concat(list, '<br />') end
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
			return string.format('<span class="basic-tooltip" title="%s">%s</span>',
				("￣"):rep(width) .. '\\n' .. table.concat(list, '\\n', startIndex), displayLabel
			)
		elseif mode == 'collapsible' then
			local collapsibleId = id or 'collapsibleList'
			return string.format(
				'<span class="mw-customtoggle-%s">%s ▼</span><span class="mw-collapsible mw-collapsed" id="mw-customcollapsible-%s"><br />%s</span>',
				collapsibleId, displayLabel, collapsibleId, table.concat(list, '<br />', startIndex)
			)
		end
	end

	return displayLabel or ''
end

---	Formats the item display with appropriate links or tooltip.
--	@function		formatItemName
--	@param			{table} ItemEntry The item object containing Name, Type, and Link
--	@return			{string} Formatted output (Wikitext link or Tooltip HTML)
local function formatItemName(ItemEntry)
	local moduleName = (TypeConfigs[ItemEntry.Type or ''] or {}).TooltipModule
	local itemName = ItemEntry.Name
	local itemLink = ItemEntry.Link or itemName

	local condition = ItemEntry.Condition and
		('<div style="position: relative; width: 100%%;"><span style="position: absolute; bottom: 0px; ' ..
		'background-color: rgba(0,0,0,0.7); text-align: center; color: #ffbc00; font-weight: bold; ' ..
		'overflow-wrap: break-word; padding: 2px 0;">%s</span></div>🔒 '):format(ItemEntry.Condition) or ''

	if moduleName then
		return condition .. Tooltip.full({ itemLink, moduleName, r = itemName })
	else
		return condition .. '[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]' 
	end
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
-- * '''tennocon'''			(boolean): Whether to include TennoCon dates (optional)
-- * '''extraDates'''		(table|string): Additional comma-separated string or array of dates (optional if item is provided)
-- * '''caption'''			(string): Display title or label for 'tooltip', 'collapsible', or 'wikitable' modes header (optional)
-- * '''id'''				{string}: Wikitext element ID for 'collapsible' mode (recommended)
-- @return					{table|string} Table array of dates or formatted HTML/plain text based on mode
local function _getItemDates(options)
	local itemInput		= options.item
	itemInput = (type(itemInput) == 'string' and string.find(itemInput, ",")) and mw.text.split(itemInput, '%s*,%s*') or itemInput

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
	local dates	= {}
	local mergeCount	= 0

	for i=1, isArray and #itemInput or 1 do
		if not itemInput then break end
		local item			= isArray and itemInput[i] or itemInput
		local ItemEntry		= type(item) == 'table' and item or BaroItems[item]
		assert(ItemEntry, string.format('_getItemDates(options): "%s" does not exist in [[Module:Baro/data]].', tostring(item)))
		assert(ItemEntry.Name, '_getItemDates(options): Invalid ItemEntry object structure (missing "Name").')

		local dateKeyType	= ItemEntry.IsAlways and 'Introduced' or 'OfferingDates'
		if platform == 'All' or platform == 'PC' or platform == 'PcOnly' then
			mergeData(ItemEntry['Pc' .. dateKeyType], dates, limit, asc, platformLabel and ' (PC only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'Consoles' or platform == 'ConsolesOnly' then
			mergeData(ItemEntry['Console' .. dateKeyType], dates, limit, asc, platformLabel and ' (Consoles only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'PC' or platform == 'Consoles' or platform == 'SharedOnly' then
			mergeData(ItemEntry[dateKeyType], dates, limit, asc); mergeCount = mergeCount + 1
		end
		if options.tennocon == true or options.tennocon == 'true' then
			mergeData(ItemEntry.TennoConOfferingDates, dates, limit, asc); mergeCount = mergeCount + 1
		end
		assert(mergeCount > 0, string.format('_getItemDates(options): Invalid platform %q', platform))
	end

	-- Merge extraDates
	if extraDates then
		local extraList = type(extraDates) == 'string' and mw.text.split(extraDates, '%s*,%s*') or extraDates
		mergeData(extraList, dates, nil, asc); mergeCount = mergeCount + 5
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
		return string.format('Total Items: <b>%s</b> &#124; Cost: %s <b>%s</b> + %s <b>%s</b>',
			Lang:formatNum(count),
			Tooltip.icon('Credits', 'Resources'), Lang:formatNum(credits),
			Tooltip.icon('Orokin Ducats', 'Resources'), Lang:formatNum(ducats)
		)
	end

	return { count = count, credit = credits, ducat = ducats }
end

---	Builds current offerings display in a gallery format using gallery tags.
--	@function		p.buildGallery
--	@param			{table} ItemEntries Array of item entries that Baro is offering, case sensitive; assuming no duplicate values
--	@return			{string} Wikitext of gallery
local function buildGallery(ItemEntries)
	local container = mw.html.create('div')
	local gallery = mw.html.create('gallery')
	local galInner = { '' }

	gallery:attr({
		['captionposition'] = 'below',
		['captionalign'] = 'center',
		['hideaddbutton'] = 'true',
		['spacing'] = 'small',
		['position'] = 'center',
		['bordersize'] = 'none',
		['widths'] = '125px',
	})

	for _, entry in ipairs(ItemEntries) do
		local displayName = entry.Image and formatItemName(entry) or
			string.format('<span style="color:red; font-weight:bold;">"%s" does not exist in [[Module:Baro/data]].</span>', entry.Name)

		table.insert(galInner, string.format('%s|link=%s|%s<br />%s <b>%s</b><br />%s <b>%s</b>',
			entry.Image or 'UnidentifiedItem.png',
			entry.Link or entry.Name,
			displayName,
			'[[File:OrokinDucats.png|x20px|link=Ducats]]', Lang:formatNum(entry.DucatCost or 0),
			'[[File:Credits64.png|x20px|link=Credits]]', Lang:formatNum(entry.CreditCost or 0)
		))
	end

	galInner = table.concat(galInner, '\n')
	gallery:wikitext(galInner .. '\n')
	container:node(gallery)
	return _getTotal(ItemEntries, true) .. '\n' .. tostring(container)
end

---	Renders a sortable store table from a array of item entries.
--	@function				buildHistoryTable
--	@param					{table} ItemEntries Array of item entries:
--	* ItemEntries.tabName	{string} (Metadata) Current tab name used for element ID
--	* ItemEntries.config	{table} (Metadata) Configuration object passed from the parent builder:
--		* ItemEntries.config.platform	{string} Current platform name
--		* ItemEntries.config.mode		{string} Current categorization mode
--		* ItemEntries.config.itemDates	{table} Map of item names to their respective history date arrays
--	@return 				{string} Wikitext of table
local function buildHistoryTable(ItemEntries)
	local config = ItemEntries.config or error('buildHistoryTable(ItemEntries): missing ItemEntries.config')
	local platform = config.platform
	local itemDates = config.itemDates
	local id = ItemEntries.tabName and ('-' .. platform .. '-' .. config.mode .. '-' .. ItemEntries.tabName):gsub(" ", "_") or ''
	local tableRows = { ([=[<span class="mw-customtoggle-BaroTable-Image mw-ui-button" style="float: right;">Toggle Image</span>
{| class="wikitable sortable lighttable store-table stickyHeader" style="width: 100%%; margin-left: auto; margin-right: auto; text-align: center;" data-tableid="%s"
|-
! style="width: 24%%;" | Item
! style="width: 18%%;" | Type
! style="width: 12%%;" | %s Credit
! style="width: 12%%;" | %s Ducat
! style="width: 17%%;" | Introduced
! style="width: 17%%;" | Date(s) Offered
|-]=]):format('BaroTable' .. id, Tooltip.icon('Credits', 'Resources'), Tooltip.icon('Orokin Ducats', 'Resources')) }

	local rowTemplate = [=[
|- data-rowid="%s"
| %s
| %s
| data-store-currency="Credit" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| data-store-currency="Ducat" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| %s
| %s]=]

	local tooltipSpan = '<span class="tooltip tooltip-full" data-param-name="%s" data-param-source="%s" aria-label="Tooltip for %s">%s</span>'

	for _, entry in ipairs(ItemEntries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local credit		= entry.CreditCost or 0
		local ducat			= entry.DucatCost or 0
		local dates			= itemDates[itemName]
		local tooltipModule	= (TypeConfigs[entry.Type or ''] or {}).TooltipModule
		local item			= ('<span class="mw-collapsible" id="mw-customcollapsible-BaroTable-Image">[[File:%s|150x220px|link=%s]]<br /></span>%s')
			:format(entry.Image or 'UnidentifiedItem.png', itemLink, '[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]')

		table.insert(tableRows, string.format(rowTemplate,
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

	return _getTotal(ItemEntries, true) .. '\n' .. table.concat(tableRows, '\n') .. '\n|}'
end

---	Organizes items into categories and builds a tabber display using a provided configuration object.
--	@function		buildTabbers
--	@param			{table} ItemEntries Array of item entries to be categorized
--	@param			{table} config Configuration object containing tabs, getItemCat, and render functions
--	@return			{string} Wikitext of the nested tabber containing categorized content and summaries
local function buildTabbers(ItemEntries, config)
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
			local content = config.render(data)
			table.insert(tabberParts, string.format("%s=\n%s", catName, content))
		end
	end
	if #tabberParts == 0 then return '<strong class="error">No matched items</strong>' end

	return '<tabber>\n|-|' .. table.concat(tabberParts, '\n|-|') .. '\n</tabber>'
end

---	Builds current cross-platform offerings display in a gallery format.
--	@function				p.buildCurrentOfferings
--	@param					{table} frame MediaWiki frame object containing template arguments:
--	* frame.args.allItems	{string} (optional) If 'true', includes all non-discontinued Baro items.
--	* frame.args.extraItems	{string} (optional) If 'true', appends special extra items to the gallery.
--	* frame.args[number]	{string} Case-sensitive item names to be offered by Baro.
--	@return					{string} Wikitext of gallery
function p.buildCurrentOfferings(frame)
	local args = Args.getArgs(frame.args)
	assert(args, 'p.buildCurrentOfferings(frame): cannot have empty arguments; arguments must be item names, case sensitive')

	local buildgalleryConfig = {
		tabs = { 'All', 'Mods', 'Appearance', 'Weapons', 'Miscellaneous' },
		getItemCat = function(entry) return (TypeConfigs[entry.Type or ''] or {}).GalleryCategory or 'Unknown' end,
		render = buildGallery
	}

	local ItemEntries = {}
	local extraItems = { -- Always available items, not included in the API.
		 { Condition = "Requires Inaros Prime (Equipped)", CreditCost = 25000, DucatCost = 100,
		 	Image = "BaroVoid-Signal.png", Name = "Baro Void-Signal", Type = "Mission Locator" },
	}

	if args.allItems == 'true' then
		for _, v in pairs(BaroItems) do
			if not v.IsDiscont then table.insert(ItemEntries, v) end
		end
		table.sort(ItemEntries, function(a, b) return a.Type == b.Type and a.Name < b.Name or a.Type < b.Type end)
	else
		for _, itemName in ipairs(args) do
			table.insert(ItemEntries, BaroItems[itemName] or { Name = itemName })
		end
	end

	if args.extraItems == 'true' then
		for i = 1, #extraItems do ItemEntries[#ItemEntries + 1] = extraItems[i] end
	end

	return frame:preprocess(buildTabbers(ItemEntries, buildgalleryConfig))
end

---	Builds Baro's offering history tabber wikitable.
--	@function			p.buildOfferingHistoryTable
--	@param				{frame} frame MediaWiki frame object containing template arguments:
--	* frame.args[1]		{string} Target platform: 'PC' (default), 'Consoles', or 'All'.
--	* frame.args[2]		{string} Categorization mode: 'HistoryCategory', 'GalleryCategory', 'ItemType', 'Year'.
--	* frame.args[3]		{string} (Optional) Filter key:
--		* nil - (Default) Dynamic aggregation, loops through all categories.
--		* 'All' - Forces aggregation into a single unified 'All' tab only.
--		* 'Name' - Renders a single specific tab (e.g., 'Weapon').
--		* 'Name, Name' - Comma-separated list to render multiple specific tabs simultaneously
--	@returns		(string) Wikitext of the tabbed history tables.
function p.buildOfferingHistoryTable(frame)
	local args = Args.getArgs(frame)
	local platform = args[1] or 'PC'
	local cat = args[2]
	local key = args[3]
	local platformMap = { All = 'All', PC = "Pc", Consoles = "Console" }
	assert(platformMap[platform], 'p.buildOfferingHistoryTable(frame): Invalid first argument')

	-- Categories Configuration
	local categories = key == nil and {} or mw.text.split(key, '%s*,%s**')
	local buildHistoryConfig = { platform = platform, tabs = categories, render = buildHistoryTable, itemDates = {}, mode = cat }
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
	end

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

	if 	buildHistoryConfig.getItemCat then
		return frame:preprocess(buildTabbers(ItemEntries, buildHistoryConfig))
	else
		ItemEntries.config = buildHistoryConfig
		return buildHistoryTable(ItemEntries)
	end
end

---	Gets total credit cost of buying all Baro's offerings at least once.
--	@function		p.getTotalCreditCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total credit cost
--	@deprecated		Use _getTotal instead.
function p.getTotalCreditCost(frame)
	local platform = frame.args[1]
	local dateKey = nil
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalCreditCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	local total = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			total = total + ((ItemEntry.CreditCost == nil and 0) or ItemEntry.CreditCost)
		end
	end
	return total
end

---	Gets total ducat cost of buying all Baro's offerings at least once.
--	@function		p.getTotalDucatCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total ducat cost
--	@deprecated		Use _getTotal instead.
function p.getTotalDucatCost(frame)
	local platform = frame.args[1]
	local dateKey = nil
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalDucatCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	local total = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			total = total + ((ItemEntry.DucatCost == nil and 0) or ItemEntry.DucatCost)
		end
	end
	return total
end

---	Gets total credit and ducat cost of buying all Baro's offerings at least once.
--	@function		p.getTotalCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{string} Total credit and ducat cost with additional formatting
--	@deprecated		Use _getTotal instead.
function p.getTotalCost(frame)
	return frame:preprocess(Tooltip.icon('Credits', 'Resources') .." '''" .. Lang:formatNum(p.getTotalCreditCost(frame)) ..
		"''' + " .. Tooltip.icon('Orokin Ducats', 'Resources') .. " '''" .. Lang:formatNum(p.getTotalDucatCost(frame)) .. "'''"
	)
end

---	Gets total count of all Baro's offerings.
--	@function		p.getItemCount
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total count
--	@deprecated		Use _getTotal instead.
function p.getItemCount(frame)
	local platform = frame.args[1]
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalDucatCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	-- TODO: Can be optimized probably by iterating over an already filtered dataset
	local count = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			count = count + 1
		end
	end
	return count
end

---	Builds a list of dates when an item was able to be purchased from Baro (ignores
--	evergreen items which are always available regardless of visit since their release).
--	Used in infobox builders such as [[Module:Mods/infobox]]
--	@function		p._buildBaroSourceStrings
--	@param			{string} name Name of item
--	@return			{string} List of dates in wikitext or an empty string if Baro never sold this particular item
function p._buildBaroSourceStrings(name)
	local ItemEntry = BaroItems[name]
	if (ItemEntry == nil) or (ItemEntry.IsDiscont == true) then return '' end

	local currencyStr = ('%s%s%s<br />'):format(
		ItemEntry.DucatCost and Tooltip.icon('Orokin Ducats', 'Resources') .. ' ' .. Lang:formatNum(ItemEntry.DucatCost) or '',
		(ItemEntry.DucatCost and ItemEntry.CreditCost) and ' + ' or '',
		ItemEntry.CreditCost and Tooltip.icon('Credits', 'Resources') .. ' ' .. Lang:formatNum(ItemEntry.CreditCost) or ''
	)

	-- Assumes dates are ordered in data
	-- Need to deepCopy b/c tables have metatable that prevents reassignment or modification.
	local pcDateList = Table.deepCopy(ItemEntry.PcOfferingDates or {})
	local consoleDateList = Table.deepCopy(ItemEntry.ConsoleOfferingDates or {})
	local allPlatformsDateList = Table.deepCopy(ItemEntry.OfferingDates or {})
	if #pcDateList == 0 and #consoleDateList == 0 and #allPlatformsDateList == 0 then return '' end

	return ([=[
{| class="wikitable" style="margin: 1em auto;"
|+ [[Baro Ki'Teer]]<br />%s
! PC Only<br />Dates !! Console Only<br />Dates !! All Platforms
|-
| %s || %s || %s
|-
|}
[[Category:Baro Ki'Teer Offering]]
]=]):format(currencyStr, table.concat(pcDateList, '<br />'), table.concat(consoleDateList, '<br />'), table.concat(allPlatformsDateList, '<br />'))
end

p._getItemDates = _getItemDates

p.__main = Entrypoint(p);

return p
