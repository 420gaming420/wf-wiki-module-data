---	Extension of Extension:Scribunto's HTML library for building Fandom's PortableInfoboxes.
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#HTML_library
--	* https://github.com/wikimedia/mediawiki-extensions-Scribunto/blob/master/includes/engines/LuaCommon/lualib/mw.html.lua
--	* https://community.fandom.com/wiki/Help:Infoboxes
--	
--	@classmod	InfoboxBuilder
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Table]]
--	@require	[[Module:I18n]]
--	@release	stable
--	

---	Infobox builder class that extends HTMLBuilder (alias mw.html).
--	Takes in zero to multiple string arguments, each representing the page
--	where i18n messages are stored.
--	@type		InfoboxBuilder
--	@usage		require('Module:InfoboxBuilder')('MediaWiki:Custom-General/i18n.json')
local InfoboxBuilder = {}

local Table = require([[Module:Table]])
-- Will be set to a I18n datastore instance instead once InfoboxBuilder is constructed
InfoboxBuilder.I18n = require([[Module:I18n]])

-- Original metatable
local htmlmt = getmetatable(mw.html.create())
local htmlindex = htmlmt.__index

-- Mimicking Object-oriented programming by extending HTMLBuilder 'class'
-- TODO: Figure out what to do regarding i18n. Should we pass in an I18n datastore instance (from I18n.loadMessages()) to
-- the constructor and also pass in i18nMsgKeys to functions (will need to extend these functions) or should users pass in
-- an already formatted string into InfoboxBuilder's functions (e.g. InfoboxBuilder:header(I18n:msg( { key = 'general-information' })))
setmetatable(InfoboxBuilder, {
	-- Constructor for a new InfoboxBuilder object. Singleton object
	__call = function(self, ...)
		assert(select('#', ...) > 0, 'InfoboxBuilder(...): Must have at least one string argument representing the page name for i18n messages')
		assert(self.I18n.loadMessages ~= nil, 
				'InfoboxBuilder(): InfoboxBuilder object already created in this module; must add another require("Module:InfoboxBuilder") statement if you want to make a new instance')
		self.I18n = self.I18n.loadMessages(...):useUserLang()
		return mw.html.create('infobox')
	end,
	__index = htmlindex,	-- Inheriting mw.html functions while also adding new functions below
	__tostring = htmlmt.__tostring
})

---	Builds an infobox group.
--	@function		InfoboxBuilder:group
--	@param[opt]		{string} collapse Value of collapse attribute; default is "open"
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
htmlindex.group = function(self, collapse)
	return self:tag('group'):attr('collapse', collapse or 'open')
end

---	Builds an infobox header row.
--	@function		InfoboxBuilder:header
--	@param			{string} header Wikitext of header label
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
htmlindex.header = function(self, header, i18nMsgKey)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	header = i18nMsgKey and header:format(self.I18n:msg( { key = i18nMsgKey } )) or header
	return self:tag('header'):wikitext(header):done()
end

---	Builds an normal infobox row.
--	@function		InfoboxBuilder:row
--	@param			{string} source Source attribute for infobox row
--	@param			{string} label Infobox row label
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@param[opt]		{string} category Wikitext of category link(s) (e.g. `"[[Category:Weapons]]"`)
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
htmlindex.row = function(self, source, label, default, i18nMsgKey, category)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	label = i18nMsgKey and label:format(self.I18n:msg( { key = i18nMsgKey } )) or label
	return self:tag('data'):attr('source', source)
		:tag('label'):wikitext(label):done()
		:tag('default'):wikitext(default and default..(category or '')):done()
	:done()
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
htmlindex.srow = function(self, source, label, id, default, i18nMsgKey, category)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	label = i18nMsgKey and label:format(self.I18n:msg( { key = i18nMsgKey } )) or label
	return self:tag('data'):attr('source', source)
		:tag('label'):wikitext(label):done()
		-- TODO: Remove format tag with duplicate span id once we figure out why [[MediaWiki:EnemyInfoboxSlider.js]] does not work 
		-- when it is removed when building enemy infoboxes in [[Module:Enemies/infobox]]
		:tag('format')
			:wikitext((default and default ~= 0) and ('<span id="%s">%s</span>%s'):format(id, default, category or '') or nil)
		:done()
		:tag('default')
			:wikitext((default and default ~= 0) and ('<span id="%s">%s</span>%s'):format(id, default, category or '') or nil)
		:done()
	:done()
end

---	Builds an infobox caption row with centered content and no label.
--	@function		InfoboxBuilder:caption
--	@param			{string} source Source attribute for infobox row
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of content message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
htmlindex.caption = function(self, source, default, i18nMsgKey)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	default = i18nMsgKey and default:format(self.I18n:msg( { key = i18nMsgKey } )) or default
	return self:tag('data'):attr('source', source)
		:tag('default'):wikitext(default and '<div style="text-align: center; font-size: 12px"><b>'..default..'</b></div>' or nil):done()
	:done()
end

return function() return InfoboxBuilder end
