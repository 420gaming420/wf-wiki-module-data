---	'''Text''' creates a wrapper to simplify and standardize markup for text inside <span> tags
--	for use on articles and within modules.<br />
--	
--	On this Wiki, Text is used in:
--  * [[Template:Text]]
--	
--	@module			text
--	@alias			p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		Text.png
--	@release	stable
--	

local p = {}

local function isNotEmpty(s)
  return s ~= nil and s ~= ''
end

--- Creates a <span> element with the specified attributes set.
--	@function		p._text
--	@param			{string} text Displayed text between <span> tags
--	@param[opt]		{table} args Containing optional named arguments for the below:
--	@param[opt]		{string} class CSS class for <span> element
--	@param[opt]		{string} color Color of text for color attribute
--	@param[opt]		{string} backgroundColor Background color of <span> for background-color attribute
--	@param[opt]		{string} hoverText Displayed text on hover over, title attribute value
--	@param[opt]		{string} hoverColor Color of underlined bottom border
--	@param[opt]		{boolean} noWrap Prevents text to wrap to next paragraph
--	@param[opt]		{string} cursor Cursor type on hover over
--	@param[opt]		{string} fontFamily Font family of displayed text
--	@return			{string} Output <span> element
function p._text(text, args)
	-- args = {
	-- 	class = args.class,
	-- 	color = args.color,
	-- 	backgroundColor = args.backgroundColor,
	-- 	hoverText = args.hoverText,
	-- 	hoverColor = args.hoverColor,
	-- 	noWrap = args.noWrap,
	-- 	cursor = args.cursor,
	-- 	fontFamily = args.fontFamily
	-- }
	-- Build class attribute
	local classStr = args.class or ""
	if isNotEmpty(args.hoverText) then
		classStr = classStr .. " hover-over"
	end
	-- Build style attribute
	local style = {}
	-- background-color
	if isNotEmpty(text) then
		if isNotEmpty(args.backgroundColor) then
			table.insert(style, "background-color: " .. args.backgroundColor .. ";")
		end
	end
	-- color
	if isNotEmpty(args.color) then
		table.insert(style, "color: " .. args.color .. ";")
	end
	-- nowrap
	if args.noWrap == true then
		table.insert(style, "white-space: nowrap;")
	end
	-- hover-color (border-bottom-color)
	if isNotEmpty(args.hoverColor) and isNotEmpty(args.hoverText) then
		table.insert(style, "border-bottom-color: " .. args.hoverColor .. ";")
	end
	-- cursor
	if isNotEmpty(args.cursor) then
		table.insert(style, "cursor:" .. args.cursor .. ";")
	end
	-- font-family
	if isNotEmpty(args.fontFamily) then
		table.insert(style, "font-family:" .. args.fontFamily .. ";")
	end
	-- Final style string
	local styleStr = ""
	if #style > 0 then
		styleStr = ' style="' .. table.concat(style, "") .. '"'
	end
	-- Title attribute (hover text)
	local titleStr = ""
	if isNotEmpty(args.hoverText) then
		titleStr = ' title="' .. args.hoverText .. '"'
	end
	-- Output text
	local textStr = isNotEmpty(text) and text or ""
	-- Final HTML
	return string.format( '<span class="%s"%s%s>%s</span>', classStr, styleStr, titleStr, textStr )
end

--- Invoked within templates to create formatted <span> elements.
--	@function		p.main
--	@param			{object} frame Frame object
--	@return			{string} Output <span> element
function p.main(frame)
	local args = frame:getParent().args
	local color = args[1]
	local backgroundColor = args[2] 
	local text = args[3]
	local hover = args.hover
	local hoverColor = args["hover-color"]
	local noWrap = args.nowrap and true or false	-- Except any value for nowrap as true
	local cursor = args.cursor
	local font = args.font
	
	return p._text(text, {
		class = nil, color = color, backgroundColor = backgroundColor, hoverText = hover,
		hoverColor = hoverColor, noWrap = noWrap, cursor = cursor, fontFamily = font
	})
end

return p
