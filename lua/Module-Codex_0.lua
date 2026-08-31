---	'''Codex''' stores image data of all [[WARFRAME]]'s [[codex]] entries.<br />
--	
--	On this Wiki, Codex is used in:
--	* [[Codex]]
--	
--	@module		codex
--	@alias		p
--	@author		[[User:Hexciple|Hexciple]]
--	@image		Codex.jpg
--	@require	[[Module:Codex/data]]
--	@require	[[Module:Table]]
--	@release	stable
--	

local p = {}

local CodexData = mw.loadData('Module:Codex/data')
local skpairs = require('Module:Table').skpairs

---	Generates codex grid to display on articles.
--	@function		p.CodexGrid
--	@param			{table} frame
--					* {string} codex Which list to use, 'Enemy' or 'Object'
--					* {string} section The name of tab to display, 'All' is also supported
--					* {string} start Optional; Letter or number, will filter results to any entry after this, inclusive
--					* {string} finish Optional, requires start; Letter or number, will filter results to anything before this, inclusive
--	@return			{string} Wikitext of codex grid
function p.CodexGrid(frame)
    local codex = frame.args[1]
    local section = frame.args[2]
    local start = frame.args[3]
    local finish = frame.args[4]

	return p._CodexGrid(codex, section, start, finish)
end

---	Generates codex grid to display on articles.
--	@function		p._CodexGrid
--	@param			{string} codex Which list to use, 'Enemy' or 'Object'
--	@param			{string} section The name of tab to display, 'All' is also supported
--	@param[opt]		{string} start Letter or number, will filter results to any entry after this, inclusive
--	@param[opt]		{string} finish Requires start; Letter or number, will filter results to anything before this, inclusive
--	@return			{string} Wikitext of codex grid
function p._CodexGrid(codex, section, start, finish)
	local rv = ""
	local inrange = true
	if start ~= nil then
		inrange = false
	end
	for _, entry in skpairs(CodexData[codex]) do
		if entry['Name'] ~= nil then
			if not inrange and entry['Name'] >= start then
				inrange = true
			end
			if inrange and finish ~= nil and string.sub(entry['Name'], 1, 1) > finish then
				break
			end
		end
		if (inrange and (section == "All" or entry['Section'] == section)) then
			rv = rv..p._GenerateEntryMarkup(entry)
		end
	end
	return rv
end

---	Generates a single codex card to display on articles.
--	@function		p._GenerateEntryMarkup
--	@param			{table} entry Table entry of codex item as seen in <code>/data</code>
--	@return			{string} Wikitext of codex card
function p._GenerateEntryMarkup(entry)
	local name = entry['Name']
	local isEximus = false
	if name ~= nil and name:find('Eximus') ~= nil then
		name = name:gsub(' Eximus', '')
		isEximus = true
	end
	local rv = '<div style="position:relative;background:var(--template-background-color-1);border: 1px solid #80808080;height:109px;width:109px;display:inline-block;text-align:center;margin-bottom:4px;vertical-align:top;"><div'
	if entry['FlipImage'] == true then
		rv = rv..' style="transform:scaleX(-1);"'
	end
	rv = rv..'>[[File:'
	if entry['Image'] ~= nil then
		rv = rv..entry['Image']
	else
		rv = rv..'Placeholder.png'
	end
	rv = rv..'|109x109px|link='
	if entry['Link'] ~= nil then
		rv = rv..entry['Link']
	elseif name ~=nil then
		rv = rv..name
	end
	rv = rv..']]</div><div style="position:absolute;width:109px;bottom:0px;background-color:rgba(255,255,255,0.8);font-family:Roboto;text-transform:uppercase;font-weight:bold;font-size:80%;line-height:1.31em;">'
	if name ~= nil then
		rv = rv..'[['
		if entry['Link'] ~= nil then
			rv = rv..entry['Link']
		else
			rv = rv..name
		end
		rv = rv..'|<span style="color:black;">'..name..'</span>]]'
	end
	if isEximus == true then
		rv = rv..' [[Eximus|<span style="color:black;">Eximus</span>]]'
	end
	if entry['Caption'] ~= nil then
		rv = rv..' <span style="color:black;font-style:italic;">('..entry['Caption']..')</span>'
	end
	rv = rv..'</div></div>\n'
	return rv
end

return p
