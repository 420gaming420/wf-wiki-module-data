---
title: "Module:AnexeraTest1"
wiki_url: "https://wiki.warframe.com/w/Module/AnexeraTest1"
wiki_timestamp: "2026-10-23T15:41:38Z"
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
	list = type(list) == 'table' and list or {list}
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
			local collapsibleId = id or 'collapsibleList'
			return string.format(
				'

%s ▼

%s

',
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
-- * '''item''' 			(table|string): Single ItemEntry/ItemName, or an array of them (optional if extraDates is provided)
--								All dates will be merged and deduplicated into a single list
-- * '''platform'''			(string): Filter platform, e.g., 'All', 'PC', 'Consoles', 'SharedOnly', 'PcOnly', 'ConsolesOnly' (default: 'PC')
-- * '''mode'''				(string): Output mode, 'table', 'list', 'tooltip', 'collapsible', or 'wikitable' (default: 'table')
-- * '''limit'''			(number): Maximum number of elements to fetch (optional)
-- * '''asc'''				(boolean): Sorting order, true for ASC, false for DESC (optional, default: true)
-- * '''platformLabel'''	(boolean): Whether to append platform names as suffixes to dates (optional, default: false)
-- * '''tennocon'''			(boolean): Whether to include TennoCon dates (optional)
-- * '''extraDates'''		(table|string): Additional comma-separated string or array of dates (optional if item is provided)
-- * '''caption'''			(string): Display title or label for 'tooltip', 'collapsible', or 'wikitable' modes header (optional)
-- * '''id'''				{string}: Wikitext element ID for 'collapsible' mode (recommended)
-- @return					{table|string} Table array of dates or formatted HTML/plain text based on mode
local function _getItemDates(options)
	-- Normalize optional parameters
	local itemInput		= options.item
	local platform		= options.platform or "PC"
	local limit			= options.limit
	local asc			= options.asc ~= false
	local platformLabel	= options.platformLabel == true
	local extraDates	= options.extraDates
	assert(itemInput or extraDates, '_getItemDates(options): item or extraDates cannot be nil')

	-- Merge dates
	local isArray		= type(itemInput) == "table" and itemInput[1] ~= nil
	local dates			= {}
	local mergeCount	= 0

	for i=1, isArray and #itemInput or 1 do
		if not itemInput then break end
		local item			= isArray and itemInput[i] or itemInput
		local entry			= type(item) == 'table' and item or BaroItems[item]
		assert(entry, string.format('_getItemDates(options): "%s" does not exist in [[Module:Baro/data]].', tostring(item)))
		assert(entry.Name, '_getItemDates(options): Invalid ItemEntry object structure (missing "Name").')

		local dateKey	= entry.IsAlways and 'Introduced' or 'OfferingDates'
		if platform == 'All' or platform == 'PC' or platform == 'PcOnly' then
			mergeData(entry['Pc' .. dateKey], dates, limit, asc, platformLabel and ' (PC only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'Consoles' or platform == 'ConsolesOnly' then
			mergeData(entry['Console' .. dateKey], dates, limit, asc, platformLabel and ' (Consoles only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'PC' or platform == 'Consoles' or platform == 'SharedOnly' then
			mergeData(entry[dateKey], dates, limit, asc); mergeCount = mergeCount + 1
		end
		if options.tennocon == true or platform == 'TennoCon' then
			mergeData(entry.TennoConOfferingDates, dates, limit, asc); mergeCount = mergeCount + 1
		end
		assert(mergeCount > 0, string.format('_getItemDates(options): Invalid platform "%s"', platform))
	end

	-- Merge extraDates
	if extraDates then
		mergeData(extraDates, dates, nil, asc); mergeCount = mergeCount + 5
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

	return formatDataList(dates, options.mode or "table", options.caption, options.id)
end

--- Internal function to calculate totals from an array of item entries.
--	@function		_getTotal
--	@param			{table} entries Array of item entries
--	@param			{boolean|string} returnString Controls the return format: (optional)
--		- true: Returns the default formatted string
--		- string: Acts as a custom template for the formatted string
--		- false/nil: Returns the raw hash table
--	@return			{string|table} A formatted string, or the raw totals table
local function _getTotal(entries, returnString)
	local count, credits, ducats = 0, 0, 0

	for _, entry in ipairs(entries) do
		if entry.Image then -- Lightweight check for a valid entry
			count = count + 1; credits = credits + (entry.CreditCost or 0); ducats = ducats + (entry.DucatCost or 0)
		end
	end

	local res = { count = count, credit = credits, ducat = ducats,
		creditIcon = Tooltip.icon('Credits', 'Resources'), ducatIcon = Tooltip.icon('Orokin Ducats', 'Resources')
	}

	if returnString then
		local default = 'Total Items: {count} | Cost: {creditIcon} {credit} + {ducatIcon} {ducat}'
		local template = type(returnString) == 'string' and returnString or default
		local function fmtVal(k) return type(res[k]) == 'number' and Lang:formatNum(res[k]) or res[k] end

		return (template:gsub("{([%w_]+)}", fmtVal))
	else
		return res
	end
end

---	Builds offerings display in a custom gallery format.
--	@function		p.buildGallery
--	@param			{table} entries Array of item entries, case sensitive; assuming no duplicate values
--	@return			{string} Wikitext of gallery
local function buildGallery(entries)
	local galleryUl			= '

%s
'
	local labelSpan 		= '%s'
	local tooltipSpan		= '%s'
	local costTemplate		= '

[[File:%s|x20px|link=%s|class=textSelect]] %%s

'
	local creditTemplate	= costTemplate:format('credit', 'Credits64.png', 'Credits')
	local ducatTemplate 	= costTemplate:format('ducat', 'OrokinDucats.png', 'Ducats')
	local galleryBoxes		= {}

	for _, entry in ipairs(entries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local tooltipModule	= (TypeConfigs[entry.Type] or {}).TooltipModule
		local displayName	= entry.Image and
			(itemLink ~= itemName and ('[[%s|%s]]'):format(itemLink, itemName) or ('[[%s]]'):format(itemName)) or
			('"%s" does not exist in [[Module:Baro/data]].'):format(itemName)

		local file			= ('[[File:%s|120x120px|link=%s]]'):format(entry.Image or 'UnidentifiedItem.png', itemLink)
		local label			= entry.Condition and labelSpan:format(entry.Condition)
		local tooltip		= tooltipModule and tooltipSpan:format(itemLink, tooltipModule, itemName, file)

		local name			=  ('

%s

'):format(displayName)
		local credit		= creditTemplate:format(Lang:formatNum(entry.CreditCost or 0))
		local ducat			= ducatTemplate:format(Lang:formatNum(entry.DucatCost or 0))

		local thumb			= ('

%s

'):format(label and ((tooltip or file) .. label) or (tooltip or file))
		local profile		= ('

%s

'):format(name .. ducat .. credit)
		table.insert(galleryBoxes, ('- %s
'):format(thumb .. profile))
	end

	return _getTotal(entries, true) .. '\n' .. galleryUl:format('\n' .. table.concat(galleryBoxes, '\n'))
end

---	Renders a sortable store table from a array of item entries.
--	@function				buildTable
--	@param					{table} entries Array of item entries:
--	* entries.tabName	{string} (Metadata) Current tab name
--	* entries.itemDates	{table} Map of item names to their respective history date arrays
--	@return 				{string} Wikitext of table
local function buildTable(entries)
	local tabName		= entries.tabName
	local itemDates		= entries.itemDates
	local tableRows	= { ([=[Toggle Image
{| class="wikitable sortable lighttable store-table stickyHeader" style="width: 100%%; margin-left: auto; margin-right: auto; text-align: center;" data-tableid="%s"
|-
! style="width: 24%%;" | Item
! style="width: 18%%;" | Type
! style="width: 12%%;" | %s Credit
! style="width: 12%%;" | %s Ducat
! style="width: 17%%;" | Introduced
! style="width: 17%%;" | Date(s) Offered
|-]=]):format('BaroTable', Tooltip.icon('Credits', 'Resources'), Tooltip.icon('Orokin Ducats', 'Resources')) }

	local rowTemplate	= [=[
|- data-rowid="%s"
| %s
| %s
| data-store-currency="Credit" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| data-store-currency="Ducat" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| %s
| %s]=]

	local tooltipSpan	= '%s'

	for _, entry in ipairs(entries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local credit		= entry.CreditCost or 0
		local ducat			= entry.DucatCost or 0
		local dates			= itemDates[entry]
		local tooltipModule	= (TypeConfigs[entry.Type] or {}).TooltipModule
		local item			= ('[[File:%s|150x220px|link=%s]]  
%s')
			:format(entry.Image or 'UnidentifiedItem.png', itemLink, itemLink ~= itemName and ('[[%s|%s]]'):format(itemLink, itemName) or ('[[%s]]'):format(itemName))

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

	return _getTotal(entries, true) .. '\n' .. table.concat(tableRows, '\n') .. '\n|}'
end

---	Organizes items into categories and builds a tabber display using a provided configuration object.
--	@function		buildTabbers
--	@param			{table} ItemEntries Array of item entries to be categorized
--	@param			{table} config Configuration object containing tabs, getItemCat, and render functions
--	@return			{string} Wikitext of the nested tabber containing categorized content and summaries
local function buildTabbers(entries, config)
	mw.log(string.format('T+%.4fs |   buildTabbers()', os.clock() - startTime))
	local cats = {}
	for _, catName in ipairs(config.tabs) do cats[catName] = {} end

	for _, entry in ipairs(entries) do
		if entry.IsDiscont and cats['Discontinued'] then
			table.insert(cats['Discontinued'], entry)
		else
			local itemCat = config.getItemCat(entry) or 'Unknown'
			if cats['All'] then table.insert(cats['All'], entry) end
			if cats[itemCat] then table.insert(cats[itemCat], entry) end
		end
	end

	local tabberParts = {}
	for _, catName in ipairs(config.tabs) do
		local data = cats[catName]
		if #data > 0 then
			data.tabName = catName
			data.itemDates = entries.itemDates
			mw.log(string.format('T+%.4fs |     building content for %s', os.clock() - startTime, catName))
			local content = config.render(data, config.args and unpack(config.args))
			table.insert(tabberParts, string.format("%s=\n%s", catName, content))
		end
	end
	assert(#tabberParts > 0, 'buildTabbers(): No matched items')

	return '\n|-|' .. table.concat(tabberParts, '\n|-|') .. '\n'
end

local function castArgs(args)
	local function parseTable(str)
		local matchedStr = string.match(str, '^{%s*(.-)[%s,]*}$')
		return matchedStr and (matchedStr == '' and {} or mw.text.split(matchedStr, '%s*,%s*')) or str
	end

	local function cast(v)
		v = tonumber(v) or (v == 'true' and true) or (v ~= 'false' and (v ~= 'nil' and parseTable(v) or nil))
		if type(v) == "table" then
			for k, innerV in pairs(v) do v[k] = cast(innerV) end
		end
		return v
	end

	local cleanArgs = {}
	for k, v in pairs(args) do cleanArgs[k] = type(v) ~= "string" and v or cast(v) end

	return cleanArgs
end

---	Template entry point for #invoke. Standardizes frame arguments.
--	@function		p.getItemDates
--	@param			{table} frame Frame object
--	@return			{string} formatted plain text based on mode
--	@see			_getItemDates
function p.getItemDates(frame)
	local args = castArgs(Args.getArgs(frame))
	if args.mode == 'table' then args.mode = 'wikitable' end

	return _getItemDates(args)
end

function p.buildOfferings(frame)
	mw.log(string.format('T+%.4fs | p.buildOfferings()', os.clock() - startTime))
	local args = castArgs(Args.getArgs(frame))
	local platform, discontinued, seasonal = args.platform, args.discontinued, args.seasonal
	local tabs, cat = args.tabs, args.cat

	local platformKey = ({ All = 'All', PC = "Pc", Consoles = "Console", TennoCon = 'TennoCon' })[platform]
	local renderFunc = ({ gallery = buildGallery, table = buildTable, cost = _getTotal})[args.render]
	assert(not platform or platformKey, string.format('p.buildOfferings(frame): Invalid platform "%s"', tostring(platform)))
	assert(renderFunc, string.format('p.buildOfferings(frame): Invalid render function "%s"', tostring(args.render)))

	local datesCfg = { platform = platform, asc = false, platformLabel = true }
	local itemDates = {}
	setmetatable(itemDates, {
		__index = function(t, entry)
			datesCfg.item = entry
			local computedDates = _getItemDates(datesCfg)
			rawset(t, entry, computedDates)
			return computedDates
		end
	})

	local items = { itemDates = itemDates }
	-- Filter Items
	if platform or discontinued or seasonal or args.name or args.type or args.date or args.credit or args.ducat then
		-- Filter preprocessing
		mw.log(string.format('T+%.4fs |   preparing filter', os.clock() - startTime))
		local function newMatcher(pattern)
			if not pattern then return end
			local t = type(pattern) == 'table' and pattern or {pattern}
			return function(s) for i=1, #t do local res = s:find(tostring(t[i])) if res then return res end end end
		end

		local function newComparator(pattern, isRawStr, targetPos)
			if not pattern then return end
			-- Parsing operator and value for filter arguments {date, credit, ducat}
			local op, val = tostring(pattern):match('^([<>=]*)%s*(.*)$')
			local v1, v2 = val:match('^(.-)%s*%.%.%s*(.*)$')
			op = (v1 and '') or (op == '' and '=') or op
			if not isRawStr then val, v1, v2 = tonumber(val), tonumber(v1), tonumber(v2) end
			local eq, gt, lt = op:find('=') and val, v1 or (op:find('>') and val), v2 or (op:find('<') and val)

			return function (vals)
				local arrLen = type(vals) == 'table' and #vals
				if not vals or arrLen == 0 then return end
				for i = (targetPos == 'first' and arrLen or 1), (targetPos ~= 'last' and arrLen or 1) do -- assume array is descending
					local v = arrLen and vals[i] or vals
					local isEq = eq and (isRawStr and v:sub(1, #eq) or v) == eq
					local res = isEq or ((gt or lt) and (not gt or v > gt) and (not lt or v < lt))
					if res then return res end
				end
			end
		end

		local dateKey = platform and platformKey .. 'OfferingDates'
		local matchName, matchType = newMatcher(args.name), newMatcher(args.type)
		local compareCredit, compareDucat = newComparator(args.credit), newComparator(args.ducat)
		local compareDate = newComparator(args.date, true, args.date_target)
		discontinued, seasonal = discontinued ~= 'include' and discontinued, seasonal ~= 'include' and seasonal

		-- Start filtering
		mw.log(string.format('T+%.4fs |   processing filter items', os.clock() - startTime))
		for _, v in pairs(BaroItems) do
			if
				(not discontinued or (discontinued == 'only' and v.IsDiscontinued) or (discontinued == 'exclude' and not v.IsDiscontinued)) and
				(not seasonal or (seasonal == 'only' and v.IsSeasonal) or (seasonal == 'exclude' and not v.IsSeasonal)) and
				(not platform or platform == 'All' or (platform ~= 'TennoCon' and v.OfferingDates) or v[dateKey] or v.IsAlways) and
				(not matchName or matchName(v.Name)) and
				(not matchType or matchType(v.Type)) and
				(not compareCredit or compareCredit(v.CreditCost or 0)) and
				(not compareDucat or compareDucat(v.DucatCost or 0)) and
				(not compareDate or compareDate(itemDates[v]))
			then
				table.insert(items, v)
			end
		end
		table.sort(items, function(a, b) return a.Type == b.Type and a.Name < b.Name or a.Type < b.Type end)
	end
	-- Manual Items
	mw.log(string.format('T+%.4fs |   processing manual items', os.clock() - startTime))
	for _, item in ipairs(args) do
		table.insert(items, BaroItems[item] or { Name = item })
	end
	-- Extra Items
	if args.extraItems then
		mw.log(string.format('T+%.4fs |   Processing extra items', os.clock() - startTime))
		for _, item in ipairs(args.extraItems) do
			table.insert(items, BaroData.ExtraItems[item])
		end
	end
	assert(#items > 0, 'p.buildOfferings(frame): No matched items')

	if not cat then
		local result = renderFunc(items, args.args and unpack(args.args))
		mw.log(string.format('T+%.4fs |   finish', os.clock() - startTime))
		return result
	end

	-- Category Configuration
	local buildTabs, getCat
	if cat == 'Year' then
		buildTabs = function(t) for y = os.date('!*t').year, 2014 , -1 do table.insert(t, tostring(y)) end end
		getCat = function(e) local d = itemDates[e] return #d > 0 and string.sub(d[#d], 1, 4) end
	elseif cat == 'Type' then
		buildTabs = function(t) for k in pairs(TypeConfigs) do table.insert(t, k) end end
		getCat = function(e) return e.Type end
	else
		buildTabs = function(t) for _, v in pairs(TypeConfigs) do mergeData(v[cat], t) end end
		getCat = function(e) return (TypeConfigs[e.Type] or {})[cat] end
		assert(TypeConfigs.Glyph[cat], string.format('p.buildOfferings(frame): Invalid category "%s"', tostring(cat)))
	end
	assert(not tabs or type(tabs) == "table", 'p.buildOfferings(frame): Argument.tabs must be a table')

	if not tabs or #tabs == 0 then
		tabs = tabs or {}
		buildTabs(tabs)
		if cat ~= 'Year' then table.sort(tabs) end
	end

	local tabCfg = { tabs = tabs, getItemCat = getCat, render = renderFunc, args = args.args}
	local wikiText = buildTabbers(items, tabCfg)
	mw.log(string.format('T+%.4fs |   framePreprocessing', os.clock() - startTime))
	local result = frame:preprocess(wikiText)
	mw.log(string.format('T+%.4fs |   finish', os.clock() - startTime))

	return result
end

local warframes = mw.loadData([[Module:Warframes/data]])
local modularWeapons = mw.loadData([[Module:Weapons/data/modular]])
local companions = mw.loadData([[Module:Companions/data]]).Companions
local archwingWeapons = mw.loadData([[Module:Weapons/data/archwing]])

local function _filterEntry(k, v, t)
	if not v._IgnoreEntry and not v._IgnoreInMasteryCount then
		if not t then return true end

		for i=1, #t, 2 do
			local result = v[t[i]] == t[i+1]
			if result then return result end
		end
	end
end

local function getTooltipsModule(entry)
	if entry.Slot then return 'Weapons' end
	if entry.Abilities then return 'Warframes' end
	if entry.Category == 'Sentinels' or entry.Category == 'Pets' then return 'Companions' end
end

local data = {
	Warframe	= { entries = warframes.Warframes },
	Primary		= { entries = mw.loadData([[Module:Weapons/data/primary]]) },
	Secondary	= { entries = mw.loadData([[Module:Weapons/data/secondary]]) },
	Melee		= { entries = mw.loadData([[Module:Weapons/data/melee]]) },

	Kitgun		= { entries = modularWeapons, conditions = {'Class','Pistol'} },
	Zaw			= { entries = modularWeapons, conditions = {'Slot','Melee'} },
	Amp			= { entries = modularWeapons, conditions = {'Class','Amp'} },

	Sentinel	= { entries = companions, conditions = {'Category','Sentinels'} },
	MOA			= { entries = companions, conditions = {'Type','MOA'} },
	Hound		= { entries = companions, conditions = {'Type','Hound'} },
	Beast		= { entries = companions, conditions = {'Type','Kubrow', 'Type','Kavat', 'Type','Predasite', 'Type','Vulpaphyla'} },

	-- non-robotic companion weapons are all ignored already for mastery counting
	Robotic		= { entries = mw.loadData([[Module:Weapons/data/companion]]) },

	Archwing	= { entries = warframes.Archwings },
	Archgun		= { entries = archwingWeapons, conditions = {'Class','Archgun'}},
	Archmelee	= { entries = archwingWeapons, conditions = {'Class','Archmelee'}},
	Necramech	= { entries = warframes.Necramechs },

	Railjack	= { entries = { Plexus = {} } },
	["K-Drive"]	= { entries = {
		["Bad Baby"]	= {},
		Feverspine		= {},
		Flatbelly		= {},
		Needlenose		= {},
		Runway			= {}
	}}
}

data["Founders"]	= { entries = {
	["Excalibur Prime"]	= data.Warframe.entries["Excalibur Prime"],
	["Lato Prime"]		= data.Secondary.entries["Lato Prime"],
	["Skana Prime"]		= data.Melee.entries["Skana Prime"]
}}
data["FoundersCN"]	= { entries = {
	["Excalibur Umbra Prime"] = { Abilities = '' }
}}

function p.buildRankedChecklist(frame)
	local args			= frame.args
	local entryType		= args.entryType
	local template		= args.template
	local tableID		= args.tableID or entryType
	local subheading	= args.subheading or "[[" .. tableID .. "]]"
	local doublePoints = args.doublePoints

	local checklist = {}
	local listMap = {}
	local header = ([=[
| class="dataTable" |

==%s==
{| class="listtable sortable lighttable store-table mw-collapsible stickyHeader" data-tableid="%s Mastery Rank Checklist"
|+ %s Checklist
! Item !! Mastery
]=]):format(entryType, tableID, subheading)

	local rowTemplate = [=[
|- data-rowid="%s"
| %s [%d]
| data-store-currency="Mastery Point" data-store-value="%d" data-sort-value="%d" class="sell-col" | %s
]=]

	local typeData = data[entryType]
	local founders = data['Founders'].entries
	for Name, entry in pairs(typeData.entries) do
		if entryType == 'Founders' or
			(not founders[Name] and _filterEntry(Name, entry, typeData.conditions))
		then
			local tooltipsModule = template or getTooltipsModule(entry)
			local rank = entry.MaxRank or 30
			local points = rank * 100
			if doublePoints or tooltipsModule == 'Warframes' or tooltipsModule == 'Companions' then
				points = points * 2
			end

			local display = Name:sub(1, (Name:find(' (', 1, true) or 0) - 1)
			local item
			if not tooltipsModule then
				item = '[['.. Name ..']]'
			elseif Name == display then
				item = Tooltip.full(Name, tooltipsModule)
			else
				item = Tooltip.full({ Name, tooltipsModule, r = display })
			end

			local row = rowTemplate:format(display, item, rank, points, points, Lang:formatNum(points))
			table.insert(checklist, Name)
			listMap[Name] = row
		end
	end

	table.sort(checklist)
	for i=1, #checklist do
		checklist[i] = listMap[checklist[i]]
	end

	return header .. table.concat(checklist) .. '|}

\n'
end

p.__main = Entrypoint(p);

return p
```

