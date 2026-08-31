---	Navbox module to be used with [[Template:LuaNavbox]]
--	
--	Features:
--	* Fully CSS styled (inline styles possible but not default)
--	* Supports unlimited rows
--	
--	@module			navbox
--	@alias			p
--	@author			[[User:Tjcool007]] from layton.fandom.com
--	@attribution	[[User:Flaicher]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

local p = {}

local Tooltips = require [[Module:Tooltips]]

local args = {} -- Arguments passed to template
local navbox -- Actual navbox

--local working = {}
local rownums, skiprows = {}, {}
local hasrows, alt, hasData, isChild = false, false, false, false
local activeSection, sections, cimage, cimageleft
local colspan, rowspan

local showText, hideText = 'Show', 'Hide'

-- TODO: Could import [[Module:I18n]] and use a /i18n subpage as a data store for translations
local langCode = mw.getContentLanguage():getCode()
local localization = {} --localized strings table
localization['bn'] = {show = 'দেখান', hide = 'লুকান'}
localization['de'] = {show = 'Ausklappen', hide = 'Einklappen'}
localization['en'] = {show = 'Show', hide = 'Hide'}
localization['es'] = {show = 'Mostrar', hide = 'Ocultar'}
localization['fr'] = {show = 'Montrer', hide = 'Cacher'}
localization['hi'] = {show = 'दिखाएँ', hide = 'छिपाएँ'}
localization['it'] = {show = 'Mostrare', hide = 'Nascondere'}
localization['ja'] = {show = '表示', hide = '隠す'}
localization['ko'] = {show = '보이다', hide = '감추다'}
localization['nl'] = {show = 'Weergeven', hide = 'Verstoppen'}
localization['pt'] = {show = 'Mostrar', hide = 'Ocultar'}
localization['ru'] = {show = 'Показать', hide = 'Скрыть'}
localization['th'] = {show = 'แสดง', hide = 'ซ่อน'}
localization['tr'] = {show = 'Göstermek', hide = 'Gizlemek'}
localization['uk'] = {show = 'Показати', hide = 'Сховати'}
localization['vi'] = {show = 'Hiển thị', hide = 'Giấu'}
localization['zh'] = {show = '显示', hide = '隐藏'}
localization['zh-tw'] = {show = '顯示', hide = '隱藏'}
if localization[langCode] then
	showText = localization[langCode]['show']
	hideText = localization[langCode]['hide']
end

-- Title

---	Processes the VDE links in the title
--	
--	@param			{mw.html} titlecell The table cell of the title
local function processVde( titlecell )
	if not args.template then return end

	titlecell:wikitext('<span class="navbox-vde">'
		.. mw.getCurrentFrame():expandTemplate({
			title = 'vdelinks',
			args = { args.template, ['type'] = 'navbox' }
		}) .. '</span>')
end

---	Processes the main title row
--	@function		processTitle
local function processTitle()
	local titlerow = mw.html.create('tr'):addClass('navbox-title')
	local titlecell = mw.html.create('th'):attr('colspan',colspan):attr('scope','col')

	if not pcall( processVde, titlecell ) then
		titlecell:wikitext( '<b class="navbox-vde error" title="Missing Template:Vdelinks">!!!</b>' )
	end

	titlecell:wikitext( args.title or '{{{title}}}' )

	-- Padding
	local hasTemplate = args.template ~= nil
	local hasState = not args.state or args.state ~= 'plain'

	if hasTemplate ~= hasState then
		if hasTemplate then
			titlecell:addClass('navbox-title-padright')
		else
			titlecell:addClass('navbox-title-padleft')
		end
	end

	if args.titleclass then titlerow:addClass( args.titleclass ) end
	if args.titlestyle then titlecell:cssText( args.titlestyle ) end

	titlerow:node(titlecell)
	navbox:node(titlerow)
end

-- Above/Below 

---	Processes the above and below rows
--	
--	@function		processAboveBelow
--	@param			{string} rowtype Either 'above' or 'below'
local function processAboveBelow( rowtype )
	if not args[rowtype] then return end

	local abrow = mw.html.create('tr'):addClass('navbox-'..rowtype)
	local abcell = mw.html.create('td'):attr('colspan',colspan):wikitext( args[rowtype] )

	if args[rowtype .. 'class'] then abrow:addClass( args[rowtype .. 'class'] ) end
	if args[rowtype .. 'style'] then abcell:cssText( args[rowtype .. 'style'] ) end

	abrow:node( abcell )
	navbox:node( abrow )
end

-- Main Rows

---	Replaces text with its tooltip equilvalent.
--	@function		_replString
--	@param			{string} type Name of tooltip type
--	@param			{string} name Name of item
--  @param			{string} displayName Optional name to display instead of the item's full name.
--	@return			{string} Wikitext of tooltip
local function _replString(type, name, displayName)
	-- TODO: Refactor this if/else block into a function/string map once this gets too big to manage
	if type == "M" then
		return Tooltips.full{name, "Mods", r = displayName}
	elseif type == "WF" then
		return Tooltips.full{name, "Warframes", r = displayName}
	elseif type == "Resource" then
		return Tooltips.full{name, "Resources", r = displayName}
	elseif type == "Arcane" then
		return Tooltips.full{name, "Arcane", r = displayName}
	elseif type == "Weapon" then
		return Tooltips.full{name, "Weapons", r = displayName}
	elseif type == "Companion" then
		return Tooltips.full{name, "Companions", r = displayName}
	end
end
	
---	Processes the images
--	
--	@function		_processImage
--	@param			{mw.html} row Row builder node
--	@param			{string} imgtype Image type CSS class
local function _processImage(row, imgtype)
	if not args[imgtype] then return end

	local iclass = imgtype == 'image' and 'navbox-image-right' or 'navbox-image-left'

	local imagecell = mw.html.create('td'):addClass('navbox-image'):addClass(iclass)

	local image = args[imgtype]
	if image:sub(1,1) ~= '[' then
		local width = args[imgtype .. 'width'] or '100px'
		imagecell:css('width', width):wikitext('['..'[' .. image  .. '|' .. width .. '|link=' .. (args[imgtype .. 'link'] or '') .. ']]')
	else
		imagecell:css('width','0%'):wikitext(image)
	end

	if args[imgtype .. 'class'] then imagecell:addClass( args[imgtype .. 'class'] ) end
	if args[imgtype .. 'style'] then imagecell:cssText( args[imgtype .. 'style'] ) end

	row:node( imagecell )
	if imgtype == 'image' then
		cimage = imagecell
	else
		cimageleft = imagecell
	end
end

---	Closes the currently active section (if any)
--	
--	@function		_closeCurrentSection
local function _closeCurrentSection()
	if not activeSection then return end

	local row = mw.html.create('tr'):addClass('navbox-section-row')
	local cell = mw.html.create('td'):attr('colspan',2)

	if not hasrows then
		_processImage(row,'imageleft')	
	end

	cell:node(sections[activeSection])
	row:node(cell)

	local firstRow = false
	if not hasrows then
		firstRow = true
		hasrows = true
		_processImage(row,'image')	
	end

	navbox:node(row)	
	rowspan = rowspan + 1

	activeSection = false
	hasData = false
end

---	Handles alternating rows
--	
--	@function		_alternateRow
--	@return			{boolean} Alternatingly returns true or false. Always returns 
--							  false if alternating rows are disabled with "alternaterows = no"
local function _alternateRow()
	if args.alternaterows == 'no' then return false end
	if alt then
		alt = false
		return true
	else
		alt = true
		return false
	end
end

---	Process a single Header "row"
--
--	@function		processHeader
--	@param			{number} num Number of the row to be processed
local function processHeader(num)
	if not args['header'..num] then return end

	_closeCurrentSection()

	local subtable = mw.html.create('table'):addClass('navbox-section')
	local headerrow = mw.html.create('tr')
	local header = mw.html.create('th'):addClass('navbox-header'):attr('colspan',2):attr('scope','col'):wikitext( args['header'..num] )

	local collapseme = args['state'..num] or false
	local state = false

	if collapseme then
		-- Look at this one
		if collapseme ~= 'plain' then
			state = collapseme == 'expanded' and 'expanded' or 'collapsed'
		end
	else
		-- Look at default 
		local collapseall = args.defaultstate or false
		if collapseall then
			state = collapseall == 'expanded' and 'expanded' or 'collapsed'	
		end
	end

	if state then
		subtable:addClass('mw-collapsible'):attr('data-expandtext',args['expandtext'..num] or args['defaultexpandtext'] or showText):attr('data-collapsetext',args['collapsetext'..num] or args['defaultcollapsetext'] or hideText)
		if state == 'collapsed' then
			subtable:addClass('mw-collapsed')	
		end
		header:addClass('navbox-header-collapsible')
	end

	if args.headerclass then headerrow:addClass( args.headerclass ) end
	if args.headerstyle then header:cssText( args.headerstyle ) end

	headerrow:node(header)	
	subtable:node(headerrow)

	sections[num] = subtable
	activeSection = num
end

---	Processes a single list row. Anything followed by text between two underscore delimiters will
--	be treated as tooltips (e.g. "Resource_Rubedo_" is equivalent to "{{Resource|Rubedo}}").
--
--	@function		processList
--	@param			{number} num Number of the row to be processed
local function processList(num)
	if not args['list'..num] then return end

	local row = mw.html.create('tr'):addClass('navbox-row')

	if not hasrows and not activeSection then
		_processImage(row, 'imageleft')	
	end

	local listcell = mw.html.create('td'):addClass('navbox-list')
	local hlistcell = listcell:tag('div'):addClass('hlist')
	
	local data = args['list'..num]
	
	if args.handleCustom == "true" then
		data = mw.ustring.gsub(data, "([%a]+)_([%a%s'&-]+)_%+([%a%s'&-]+)%+", _replString)
		data = mw.ustring.gsub(data, "([%a]+)_([%a%s'&-]+)_", _replString)
	end
	
	if data:sub(1,1) == '*' then
		-- Add newlines to support lists properly
		hlistcell
			:newline()
			:wikitext( data )
			:newline()
	else
		hlistcell:wikitext( data )
	end

	local altRow = _alternateRow()
	if altRow then
		row:addClass( args.altrowclass or 'alt' )

		local listclass = args.altlistclass or args.listclass or false
		if listclass then listcell:addClass( listclass ) end

		local liststyle = args.altliststyle or args.liststyle or false
		if liststyle then listcell:cssText( liststyle ) end
	else
		if args.rowclass then row:addClass( args.rowclass ) end
		if args.listclass then listcell:addClass( args.listclass ) end
		if args.liststyle then listcell:cssText( args.liststyle ) end
	end

	if args['group'..num] then
		local groupText = args['group'..num]
		
		if args.handleCustom == "true" then
			groupText = mw.ustring.gsub(groupText, "([%a]+)_([%a%s'&-]+)_%+([%a%s'&-]+)%+", _replString)
			groupText = mw.ustring.gsub(groupText, "([%a]+)_([%a%s'&-]+)_", _replString)
		end
		
		local groupcell = mw.html.create('th'):addClass('navbox-group'):attr('scope','row'):wikitext(groupText)

		if altRow then
			local groupclass = args.altgroupclass or args.groupclass or false
			if groupclass then groupcell:addClass( groupclass ) end
 
			local groupstyle = args.altgroupstyle or args.groupstyle or false
			if groupstyle then groupcell:cssText( groupstyle ) end
		else	
			if args.groupclass then groupcell:addClass( args.groupclass ) end
			if args.groupstyle then groupcell:cssText( args.groupstyle ) end
		end

		row:node( groupcell )
	else
		listcell:attr('colspan',2):addClass('no-group')
	end

	row:node( listcell )

	local firstRow = false
	if not hasrows and not activeSection then
		firstRow = true
		hasrows = true
		_processImage(row, 'image')
	end

	
	if activeSection then
		local parent = sections[activeSection]
		if not isChild or not firstRow then
			if incRowspan then
				rowspan = rowspan + 1
			end
		end
		parent:node(row)
		hasData = true
	else
		if not isChild or not firstRow then
			if incRowspan then
				rowspan = rowspan + 1
			end
		end
		navbox:node( row )
		rowspan = rowspan + 1
	end
end

---	Processes all rows
--	
--	@function		processRows
local function processRows()
	sections = {}
	for i=1,#rownums do
		local num = rownums[i]
		if not skiprows[num] then
			processHeader(num)
			processList(num)
		end
	end
	_closeCurrentSection()
 
	if cimageleft then
		cimageleft:attr('rowspan',rowspan)		
	end
	if cimage then
		cimage:attr('rowspan',rowspan)
	end
end

-- ARGUMENTS PREPROCESSOR
-- * Extracts arguments from frame and stores them in args table
-- * At the same time, checks for valid row numbers

---	Preprocessor for the arguments.
--	Will fill up the args table with the parameters from the frame grouped by their type.
--	
--	@function		preProcessArgs
--	@param			{table} frame The frame passed to the Module.
local function preProcessArgs(frame)
	local tmp = {}

	if frame == mw.getCurrentFrame() then
		tmp = frame:getParent().args
	else
		tmp = frame
	end

	-- Storage tables
	local nums = {}

	-- Loop over all the args
	for k,v in pairs(tmp) do
		-- Skip empty args, which are useless
		if v ~= '' then
			local cat,num = tostring(k):match('^(%a+)([1-9]%d*)$')

			if cat == 'header' or cat == 'list' then
				nums[num] = true
			end

			args[k] = v -- Simple copy
		end
	end

	colspan = args.image and 3 or 2
	if args.imageleft then colspan = colspan + 1 end
	rowspan = 0

	if args.alternaterows == 'swap' then
		alt = true
	end

	for k, v in pairs(nums) do
		rownums[#rownums+1] = tonumber(k)
	end

	table.sort(rownums)

	-- Calculate skip rows
	local cSection, cSkip
	local showall = args.showall
	for i=1,#rownums do
		local num = rownums[i]
		if args['header'..num] then
			cSection = true
			cSkip = false
			local showme = args['show'..num]
			if showme == 'no' then
				cSkip = true
			elseif showme == 'auto' or (showme ~= 'yes' and showall ~= 'yes') then
				if not args['list'..num] then
					local nextNum = rownums[i+1]
					cSkip = not nextNum or args['header'..nextNum] -- If next has a header -> skip
				end
			end
		end
		if cSection and cSkip then
			skiprows[num] = true
		end
	end
end

-- MAIN FUNCTIONS

---	Processes the arguments to create the navbox.
--
--	@function		_navbox
--	@return			{string} A string with HTML that is the navbox.
local function _navbox()
	-- Create the root HTML element
	local trim = function(s)
		return s and mw.ustring.gsub(s, "^%s*(.-)%s*$", "%1") or ''
	end
	local border = args.border or trim(args[1])  or ''
	isChild = (border == 'child' or border == 'subgroup')

	if isChild then
		navbox = mw.html.create('table'):addClass('navbox-subgroup')
	else
		navbox = mw.html.create('table'):addClass('navbox')

		if args.state ~= 'plain' then
			navbox:addClass('mw-collapsible'):attr('data-expandtext',args['expandtext'] or args['defaultexpandtext'] or showText):attr('data-collapsetext',args['collapsetext'] or args['defaultcollapsetext'] or hideText)
			if args.state == 'collapsed' then
				navbox:addClass('mw-collapsed')
			end
		end
	end

 	if args.bodyclass then navbox:addClass(args.bodyclass) end
	if args.bodystyle then navbox:cssText(args.bodystyle) end

	-- Process...
	if not isChild then
		if args.ignoreTitle ~= "true" then
			processTitle()
		end
		processAboveBelow('above')
		processRows()
		processAboveBelow('below')

		return tostring(navbox)
	else
		processRows()

		local wrapper = mw.html.create('')
		wrapper:wikitext('</div>')
		wrapper:node(navbox)
		wrapper:wikitext('<div class="hlist">')
		return tostring(wrapper)
	end
end

---	Main module entry point.
--	To be called with `{{#invoke:navbox|main}}` or directly from another module.
--	
--	@function		p.main
--	@param			{table} frame The frame passed to the module via the #invoke. If called from another
--								  module directly, this should be a table with the parameter definition.
--	@return			{string} Preprocessed navbox wikitext
function p.main(frame)
	-- Save the arguments in a local variable so other functions can use them.
	preProcessArgs(frame)
 
	return frame:preprocess(_navbox())
end

return p
