---	'''Navigation''' builds navigation bars for subpages of an article.<br /> 
--	Fork of https://danganronpa.fandom.com/wiki/Module:Navigation<br />
--	
--	On this Wiki, Navigation is used in:
--	* [[Template:Navigation]]
--	
--	@module		navigation
--	@alias		p
--	@author		[[User:KockaAdmiralac|KockaAdmiralac]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:gigamicro|gigamicro]]
--	@image		
--	@require	[[Module:String]]
--	@release	stable
--	

---	Adds a section div containing a link of a page's subpages to navigation bar.
--	@function		section
--	@param			{table} html HTML object
--	@param			{string} link Full page name to be linked
--	@param			{string} text Display text for link
local currentTitle = mw.title.getCurrentTitle().text
local function section(html, link, text)
	local tag = html:tag('div')
		:addClass('article-tabs__tab')
		:wikitext('[[' .. link .. '|' .. text .. ']]')
	if link == currentTitle then
		tag:addClass('article-tabs__selected')
	end
	return tag:done()
end

local p = {}

---	Adds a navigation bar for all listed pages & subpages
--	@function		main
--	@param			{table} frame Frame object
--	@return			{string} HTML of navigation bar
function p.main(frame)
	local args = frame:getParent().args
	local html = mw.html.create('div'):addClass('article-tabs noexcerpt')
	local prefix = args.main and args.main :match '^[%s\n]*(.-)[%s\n]*$' ..'/' or ''
	for _, title in ipairs(args) do
		-- Trim whitespace in case editor adds newlines to pretty format template arguments
		title = title:match '^[%s\n]*(.-)[%s\n]*$'
		if title ~= '' then
			title = title:gsub('^/', prefix):gsub('/$', '')
			section(html, title, title:gsub('.*/',''))
		end
	end
	
	return tostring(html:done())
end
p['']=p.main

return p
