---	Extension of Extension:Scribunto's HTML library for building infoboxes.
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#HTML_library
--	* https://github.com/wikimedia/mediawiki-extensions-Scribunto/blob/master/includes/engines/LuaCommon/lualib/mw.html.lua
--	
--	@classmod		InfoboxBuilder
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:String]] .newLinesToBreaks
--	@require	[[Module:I18n]]
--	@release	stable
--	

-- TODO: Since some arguments are optional, for extendability we should redefine all
-- function definitions to use named arguments (or at the very least have all the optional
-- arguments be stored in an optional 'options' table)

-- TODO: galleries, tabbers, horzontal groups

---	Infobox builder class that extends HTMLBuilder (alias mw.html).
--	Takes in one to multiple string arguments, each representing the page
--	where i18n messages are stored.
--	@type		InfoboxBuilder
--	@usage		require('Module:InfoboxBuilder')('MediaWiki:Custom-General/i18n.json')
local InfoboxBuilder = {}

local newLinesToBreaks = require([[Module:String]]).newLinesToBreaks
-- Will be set to a I18n datastore instance instead once InfoboxBuilder is constructed
local i18n, frame, frameparent

-- Allows adding additional functions to imported InfoboxBuilder module
-- local InfoboxBuilder = require('Module:InfoboxBuilder')
-- InfoboxBuilder.obj.newFunc = function(self, param1) return self end
-- local Infobox = InfoboxBuilder('MediaWiki:Custom-General/i18n.json')
-- Infobox:newFunc() -- Infobox.newFunc is nil

do
-- Original metatable
	local htmlmt = getmetatable(mw.html.create())
	for k,v in pairs(htmlmt.__index) do
		InfoboxBuilder[k]=v
	end
	InfoboxBuilder._metatable={
		__index=InfoboxBuilder,
		__tostring=htmlmt.__tostring
	}
end

-- Mimicking Object-oriented programming by extending HTMLBuilder 'class'
setmetatable(InfoboxBuilder, {
	-- Constructor for a new InfoboxBuilder object.
	__call = function(self, ...)
		assert(select('#', ...) > 0,
		 'InfoboxBuilder(...): Must have at least one string argument representing the page name for i18n messages')
		i18n = require([[Module:I18n]]).loadMessages(...):useUserLang()
		-- TODO: args for frame and frameparent {args}? M:IB({i18n},{args},{pargs}) ?
		frame = mw.getCurrentFrame()
		frameparent = frame:getParent() or mw.log('M:InfoboxBuilder: No frameparent') or {args={}}
		local box = mw.html.create('div')
		setmetatable(box, InfoboxBuilder._metatable)
		return box:addClass('infobox')
	end
})
InfoboxBuilder.tostring = tostring
InfoboxBuilder._tag = InfoboxBuilder.tag
InfoboxBuilder.tag = function(self,...)
	local v = self:_tag(...)
	setmetatable(v,getmetatable(self))
	return v
end

local function translate(str, i18nMsgKey)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	return i18nMsgKey and (str or '%s'):format(i18n:msg{key=i18nMsgKey}) or str
end

---	Builds an infobox group.
--	@function		InfoboxBuilder:group
--	@param[opt]		{boolean} collapse Whether to collapse the section by default
--	@param[opt]		{string} id Collapse element id
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.group = function(self, collapse, id)
	id = id or ('PH_INFOBOX %x'):format(math.random()*0xffff)
	return self
	:tag('div'):addClass('button-c-pre mw-customtoggle-'..id:gsub('[ "]','_'))
		:wikitext('[[File:Expand.svg|30px|link=|Expand/Collapse '..id..'|class=rotate-c light-invert]]')
	:done()
	:tag('div'):addClass('group')
	:attr('id','mw-customcollapsible-'..id:gsub('[ "]','_')):addClass('mw-collapsible'):addClass(collapse and 'mw-collapsed' or nil)
end

InfoboxBuilder.hgroup = function(self, collapse)
	return self:tag('div'):addClass('hgroup')
end

---	Builds an infobox header row.
--	@function		InfoboxBuilder:header
--	@param			{string} header Wikitext of header label
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.header = function(self, header, i18nMsgKey)
	return self:tag('div'):addClass('header'):wikitext(translate(header,i18nMsgKey)):done() -- h2
end

InfoboxBuilder.title = function(self, title, i18nMsgKey)
	return self:tag('div'):addClass('title'):wikitext(translate(title,i18nMsgKey)):done() -- h2
end

InfoboxBuilder.label = function(self, label, i18nMsgKey)
	return self:tag('div'):addClass('label'):addClass('left'):wikitext(translate(label,i18nMsgKey)):done() -- h3
end

local function getvalue(default, source)
	local v = source and frame.args and frame.args[source]
	if not v or v == '' then v = source and frameparent.args and frameparent.args[source] end
	if not v or v == '' then v = default end
	return v~='' and v or nil
end

-- pass id to wrap in span, pass id=true to instead center & bold
InfoboxBuilder.value = function(self, default, source, id, append)
	self= self:tag('div'):addClass('value'):addClass('right')
	if id==true then self=self
		:attr('class','value caption')
	elseif type(id)=='table' then self=self
		:tag('span'):attr(id)
	elseif id then self=self
		:tag('span'):attr('id',id)
	end self=self
		:wikitext(getvalue(default,source))
	if id and id~=true then self=self
		:done():wikitext(append)
	end self=self
	:done()
	return self
end

InfoboxBuilder.image = function(self, default, source, class)
	if type(default) == 'table' and not getvalue(nil,source) then
		self=self:addClass('tabber-borderless')
		local t = {wikitext=function(self,...)
			for _,v in ipairs{...} do
				table.insert(self,v)
			end
			return self
		end,image=InfoboxBuilder.image}
		for i, v in ipairs(default) do
			t:wikitext('|-|'):wikitext(v.label):wikitext('='):image(v.image)
		end
		return self:wikitext( frame:callParserFunction('#tag:tabber', table.concat(t)) )
	end
	local v = getvalue(default,source);
	if v:find('UNIQ%-%-gallery') then return self:wikitext(v..'['..'[Category:Unconverted Infobox Gallery]]') end
	if v:find('^[ \t]*%-[ \t]*[\n|]') then -- gallery-as-string syntax is -(\nlabel=image)* and |s work as \ns
		-- TODO: move to TInfobox()
		-- some places were using <gallery>s in image args to external ib adapters like m:enemy/infobox
		local t = {}
		for label, image in v:gmatch '[\n|][ \t]*([^=\t\n|]-)[ \t]*=[ \t]*([^\n|]*)' do
			if image ~= '' then
				table.insert(t, {label=label,image=image})
			end
		end
		return self:image(t)
	end
	-- only prepend File: if the parameter doesn't have a namespace
	if not v:find('^%w+:') then
		v = 'File:' .. v
	end
	return self:wikitext('[[',v,'|300px|class=main-image ',class or '',']]')
end

---	Builds an normal infobox row.
--	@function		InfoboxBuilder:row
--	@param			{string} source Source attribute for infobox row
--	@param[opt]		{string} label Infobox row label
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@param[opt]		{string} category Wikitext of category link(s) (e.g. `"[[Category:Weapons]]"`)
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder._row = function(self)
	return self:tag('div'):addClass('row')
end
InfoboxBuilder.row = function(self, source, label, default, i18nMsgKey, category)
	return self:srow(source, label, nil, default, nil, i18nMsgKey, category)
end

---	Builds an infobox span row with a span element wrapping around content, containing
--	a unique id attribute for targeting.
--	@function		InfoboxBuilder:srow
--	@param			{string} source Source attribute for infobox row
--	@param			{string} label Infobox row label
--	@param			{string} id Id attribute
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@param[opt]		{string} category Wikitext of category link (e.g. `"[[Category:Weapons]]"`)
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.srow = function(self, source, label, id, default, append, i18nMsgKey, category)
	if not getvalue(default,source) then return self end
	return self:_row()
		:label(label, i18nMsgKey)
		:value(default, source, id, append)
		:wikitext(category)
	:done()
end

---	Builds an infobox caption row with centered content and no label.
--	@function		InfoboxBuilder:caption
--	@param			{string} source Source attribute for infobox row
--	@param[opt]		{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of content message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.caption = function(self, source, default, i18nMsgKey)
	if (default == nil or default == '') then return self end
	return self:_row()
		:value(newLinesToBreaks(translate(default,i18nMsgKey)), source, true)
	:done()
end

--- [Experimental] Starts building in a column. If we are already in a column, it adds a new column to the current column container.
-- If not, it creates a new columns container first.
-- @function		InfoboxBuilder:column
-- @return			{InfoboxBuilder} The new column builder reference
InfoboxBuilder.column = function(self)
	local parent = self._columnsContainer
	if parent then
		local col = parent:tag('div'):addClass('column')
		col._columnsContainer = parent
		return col
	else
		local columnsContainer = self:tag('div'):addClass('columns')
		local col = columnsContainer:tag('div'):addClass('column')
		col._columnsContainer = columnsContainer
		return col
	end
end

--- Stringifies and hide-dumps given extra data
-- @function InfoboxBuilder:_dump
-- @param {any} buf the extra data
-- @return {string} stringified box & dumped hidden data
InfoboxBuilder._dump = function(self, buf)
	return tostring(self)
	..'<span class="tooltip-metadata hidden navigation-not-searchable"><span class="noexcerpt">'..(function(s,v)
		return s and v or "[".."[Category:Missing Hidden Data]]"
	end)(pcall(mw.text.jsonEncode,buf))..'</span></span>'
end

--- Builds an infobox from an {{#invoke:}}</nowiki call
-- @function InfoboxBuilder.TInfobox
-- @param {frame} frame accepts class, title, image, caption, header, 1..2n for n=rows
function InfoboxBuilder.TInfobox(frame)
	local args = {}
	for k,v in pairs(frame.args) do
		if not v:match('^%s*$') then
			args[k]=v
		end
	end
	
    --------------------------------------------------------------------
	-- TABBER SUPPORT
	--------------------------------------------------------------------
	-- {{#invoke:InfoboxBuilder|TInfobox
	--  |tab-1 = Stats
	--  |tab-1-content =
	--   class = foo
	--   title = Weapon Stats
	--   1 = Damage
	--   2 = 100
	--  |tab-2 = Drops
	--  |tab-2-content =
	--   class = foo
	--   title = Drop Locations
	--   1 = Boss
	--   2 = Lech Kril
	-- }}
	-- local tabs = {}
	-- for k, v in pairs(args) do
	-- 	if type(k) == "string" then
	-- 	    -- Match only: tab-1, tab-2, tab-3, etc.
	-- 		local base = k:match('^tab%-(%d+)$')
	-- 	    if base then
	-- 	        local label = v
	-- 	        local content = args['tab-'..base..'-content']
	
	-- 	        if content then
	-- 	            table.insert(tabs, {label = label, content = content})
	
	-- 	            -- Remove tab args so they don't interfere with normal rows
	-- 	            args[k] = nil
	-- 	            args['tab-'..base..'-content'] = nil
	-- 	        end
	-- 	    end
	-- 	end
	-- end

	-- -- If tabs exist, build a tabber instead of a single infobox
	-- if #tabs > 0 then
	--     local tabberParts = {}

	--     for _, tab in ipairs(tabs) do
	--         -- Build each tab as its own infobox
	--         local box = InfoboxBuilder('WARFRAME Wiki:L10n/general.json')

	--         -- Treat tab content as a mini-infobox definition
	--         local subframe = mw.getCurrentFrame():newChild{
	--             args = mw.text.split(tab.content, '\n')
	--         }

	--         local html = InfoboxBuilder.TInfobox(subframe)
	--         table.insert(tabberParts, '|-' .. tab.label .. '=' .. html)
	--     end

	--     return frame:callParserFunction('#tag:tabber', table.concat(tabberParts))
	-- end
	-- --------------------------------------------------------------------

	local box = InfoboxBuilder('WARFRAME Wiki:L10n/general.json')
	if args.class then box=box:addClass(args.class) end
	if args.title then box=box:title(args.title) end
	if args.image then box=box:image(args.image) end
	if args.caption then box=box:caption('caption',args.caption) end
	if args.header then box=box:header(args.header) end
	local i = 1
	while args[i] do
		if (args[i] or ''):find'^%s*%-%s*$' then
			box=box:caption(nil,args[i+1])
		elseif (args[i+1] or ''):find'^%s*%-%s*$' then
			box=box:header(args[i])
		else
			box=box:row(nil, args[i], args[i+1])
		end
		i = i + 2
	end
	return box:tostring()
end

return InfoboxBuilder
