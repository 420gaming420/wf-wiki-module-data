---
title: "Module:Navigation/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Navigation/dev"
wiki_timestamp: "2021-06-17T16:30:29Z"
---

*Documentation for this module may be created at [Module:Navigation/dev/doc](/w/Module:Navigation/dev/doc?action=edit&redlink=1 "Module:Navigation/dev/doc (page does not exist)")*

```lua
--- '''Navigation''' builds navigation bars for subpages of an article.  
 
--  Fork of https://danganronpa.fandom.com/wiki/Module:Navigation  

--	
--  On this Wiki, Navigation is used in:
--  * [[Template:Navigation]]
--  
--  @module		navigation
--  @alias		p
--  @author		[[User:KockaAdmiralac|KockaAdmiralac]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @image		
--  @release	stable
--  

local p = {}

local title = mw.title.getCurrentTitle()

-- TODO: May need to update Mediawiki:Wikia.css for styling
---	Adds a section div containing a link of a page's subpages to navigation bar.
--	@function		section
--	@param			{table} html HTML object
--	@param			{string} text Display text for link
--	@param			{string} link Full page name to be linked
local function section(html, text, link)
    local tag = html:tag('div')
        :addClass('article-tabs__tab')
        :wikitext('[[' .. link .. '|' .. text .. ']]')
    if title.text == link then
        tag:addClass('article-tabs__selected')
    end
    tag:done()
end

---	Adds a navigation bar for all listed subpages for a page in the order they 
--	are listed in. Only works up to single level of subpages.
--	@function		main
--	@param			{table} frame Frame object
--	@return			{string} HTML of navigation bar
function p.main(frame)
    local args = frame:getParent().args
    local html = mw.html.create('div'):addClass('article-tabs')
    
    for _, page in pairs(args) do
    	local title = mw.title.new(page)	-- getting details about a particular page
    	if (title.isSubpage) then
			section(html, title.subpageText, title.fullText)
		else
			section(html, title.fullText, title.fullText)
		end
    end
	
    return tostring(html:done())
end

return p
```

