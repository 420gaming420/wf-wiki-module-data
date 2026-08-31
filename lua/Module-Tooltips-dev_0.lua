---	'''Tooltips''' builds tooltip links and icons. It can be used as a static or 
--	instantiated class.<br />
--	
--	Stylesheet for tooltips and tooltip text can be found on [[MediaWiki:Tooltips.css]].
--	The JS script that enables tooltips is sourced from https://dev.fandom.com/wiki/Tooltips
--	
--	@module		tooltips
--	@author		[[User:Gigamicro|Gigamicro]]
--	@image		TooltipPic.PNG
--	@require	[[w:c:dev:MediaWiki:Tooltips.js|MediaWiki:Tooltips.js]]
--	@require	[[Module:Tooltips/icon]]
--	@require	[[Module:Tooltips/tip]]
--	@release	stable
--	

local p = {}
local dataPrep;
dataPrep = setmetatable({}, { __index = function(self, index)
	dataPrep = require[[Module:Tooltips/icon]]
	return dataPrep[index]
end })

-- Iterate through and make every number a string because jsonEncode doesn't work for non finite numbers
function p._cleanTable(data)
	local retTable = {}
	if type(data) ~= "table" then
		return data
	end
	for k, v in pairs(data) do
		if type(v) == "number" then
			retTable[k] = tostring(v)
		elseif type(v) == "table" then
			retTable[k] = p._cleanTable(v)			
		else
			retTable[k] = v
		end
	end
	return retTable
end

-- TODO: Update index table to be just a map instead of a mixed map and array.
-- Instead of index[3] (don't know what this contains at first glance), store the link in index['link'] or index['Link']

---	Returns formatted tooltip link text.
--	@function		p._getText
--	@param			{string} name Name of object entry to make a tooltip of
--	@param			{table} index Tooltip index table
--	@param			{table} rep Replacement args
--	@return			{string} Wikitext link
function p._getText(name, index, rep)
	return ('[[%s|<span style="border-bottom:1px dotted; color:%s;">%s</span>]]')
		:format(
			index[3] or name,
			rep.color ~= '' and rep.color or index.color or '',
			-- index.name is the Name key of object entries
			-- name is the index key to object entry (typically the same as Name key but not always)
			(rep.r ~= '' and rep.r or index.name or name or ' '):gsub('%s+', ' ')
		)
end

---	Returns tooltip icon.
--	@function		p._getIcon
--	@param			{string} _ Ignore; unused variable
--	@param			{table} index Tooltip index table
--	@return			{string} Image wikilink or nil
function p._getIcon(_, index)
	return index.icon ~= '' and index.icon or nil
end

---	Creates a tooltip index table for passing parameters to the tooltip builder.
--	@function		makeData
--	@param			{string} source Name of module containing object entry
--	@param			{table} frame Frame object
--	@return			{table} Tooltip index table or nil
local function makeData(source, frame)
	return (source and frame and type(frame) == 'table' and type(frame.args) == 'table' and frame.args.i) and {
		source,
		frame.args.i,
		frame.args.l,
		name = frame.args.n,
		icon = ('[[File:%s|x19px|link=%s|class=icon]]'):format(frame.args.icon, frame.args.l or ''),
		color = frame.args.color,
		overridden = true,
	} or nil
end

---	Function preprocessor.
--	@function		pp
--	@param			{function} func
--	@return			{function} tooltip span applied to return value of func
local function pp(func)
	return function(...)
		--standardise input to frame object equivalent
		--(nt,b,c)         ->(nt,b,c)
		--({args={a,b,c}}) -> (a,b,c)
		--({a,b,c})        -> (a,b,c)
		--(a,b,c)          -> (a,b,c)
		local frame = nil
			or type(...)~='table' and {args={...}}
			or (...).args         and       (...)
			or not select(2,...)  and {args=(...)}
			or true and true      and {args={...}}
		local name, source, index = (function(t) return t[1], t[2], t[3] end)(frame.args)--unpack doesn't work on the frame object
		if type(name) == 'table' then
			--({}) -> ({}.name/2,{}.1,{})
			index = name
			source = index[1]
			name = index.name or index[2]
		end
		if type(index) ~= 'table' then
			local error = '<strong class="error scribunto-error" title="%s">%s</strong>[[Category:Pages with script errors]]'
			if source == '' or not source then
				return error:format(debug.traceback('pp(func): source is '..type(source)..'. ', 2):gsub('[<>]', ''),
					'Where is '..(name and '"[['..name..']]"' or '<nil>')..'?')
			elseif name == '' or not name then
				return error:format(debug.traceback('pp(func): name is '..type(name)..'. ', 2):gsub('[<>]', ''),
					'What did you want in '..(source and '[[Module:'..source..'/data]]' or '<nil>')..'?')
			elseif not dataPrep[source] then
				return error:format(debug.traceback('pp(func): source is '..type(source)..'. ', 2):gsub('[<>]', ''),
					'Invalid source "'..source..'"')
			end
			--get the data from the source module + formatted
			--(a,b,nt) -> (dca,b,fdat)
			name = mw.text.decode(name)
			index = makeData(source, frame) or dataPrep[source](name)
			
			if not index then
				return error:format(debug.traceback('pp(func)', 1):gsub('[<>]', ''),
					(name and '"[['..name..']]"' or '<nil>')..'<small> wasn\'t found in [[Module:'..source..'/data]]</small>')
			end
		elseif not index[2] then
			--index is a data entry, get it formatted properly
			--(a,b,dat) -> (a,b,fdat)
			if not dataPrep[source] then
				error('M:Tooltips.pp()(): Missing tooltip gen script for source "'..(source or '<nil>')..'"')
			end
			index = dataPrep[source](index,name)
		end
		source = index[1]
		-- Damage tooltips are unique in that they both need invert and hue-rotate filters for colored damage icons and text
		return ('<span class="tooltip tooltip-full %s" data-param="%s" data-param2="%s" data-meta="%s">%s</span>')
			:format(
				source == 'DamageTypes' and 'damage-type-tooltip' or '',
				index[2] or mw.log('pp(func): no index[2]:', name, index[1]) or name or index[3],
				source or error('no sauce :('..mw.dumpObject(index)) or 'nil',
				mw.text.encode(mw.text.jsonEncode(p._cleanTable(index._data or {}))) or '',
				func(name, index, frame.args)
			)
	end
end

---	Get the tooltip text and icon.
--	@function		p.full
--	@param			{string} name Name of object entry to make a tooltip of (can also be used as index)
--	@param			{string} source Name of module containing object entry (nil to check if a manual index is working)
--	@param			{table} index Index entry from m:tt/icon, or data point from (source) if source is set
--	@param			{string} frame.args.r Replacement for displayed link text (nil, '' -> <name>)
--	@param			{string} frame.args.color Color replacement for displayed link text (e.g. '#ffffff')
--	@param			{string} frame.args.i Index for data replacement (will also prevent data from loading)
--	@param			{string} frame.args.l Link for data replacement
--	@param			{string} frame.args.n Name for data replacement
--	@param			{string} frame.args.icon Icon image name for data replacement (e.g. 'Ash.png')
--	@example		`p.full('Serration', 'Mods')` for mod tooltip for Serration
--	@example		`p.full( { 'Serration', 'Mods', r = 'Replacement Display Link Name' } ) for mod tooltip for serration with replacement link text
--	@return			{string} Tooltip <span> tags, icon, & link in wikitext
p.full = pp(function(...)
	local icon = p._getIcon(...)
	return icon 
		and icon..' '..p._getText(...) --&nbsp;
		or p._getText(...)
end)
p.icontext = p.full

---	Get the tooltip text with no icon.
--	@function		p.text
--	@param			{string} name Name of object entry to make a tooltip of
--	@param			{string} ... see p.full
--	@return			{string} Tooltip text in wikitext
p.text = pp(p._getText)

---	Get the tooltip icon with no text.
--	@function		p.icon
--	@param			{string} name Name of object entry to make a tooltip of
--	@param			{string} ... see p.full
--	@return			{string} Tooltip icon in wikitext
p.icon = pp(p._getIcon)
p.image = p.icon

---	Get the data index.
--	@function		p._getIndex
--	@param			{string} name Item name
--	@param			{string} source Name of source module containing object entry
--	@return			{table} index table
p._getIndex = function(name, source)
	if name == '' or not name or source == '' or not source then
		return
	end
	-- name = mw.text.decode(name)
	
	local success, index = pcall(dataPrep[source], name)
	return success and index or nil
end

---	Get the tooltip.
--	@function		p.getTip
--	@param			{string} name Name of object entry to make a tooltip of
--	@param			{string} source Name of source module containing object entry
--	@param			{string} slot Name of submodule
--	@return			{string} Tooltip
p.getTip = function(frame, ...)
	local name, source, slot = (function(t) return t[1], t[2], t[3] end)(frame.args or {frame, ...})
	assert(name and name ~= '', 'p.getTip(): No name provided')
	return (require('Module:Tooltips/tip')[source] or 
		error('M:Tooltips.getTip(): Missing tooltip gen script for source "'..(source or '<nil>')..'"'))(name, slot)
end

---	Returns a function that serves as a interface to tooltip builders.
--	Another way of thinking about this function is to treat the entire module as a class.
--	When you require(), the module, you are 'instantiating' a new instance of this class
--	and pass in the name of the database to pull data from. Then you call a 
--	tooltip function and pass in a database entry name for the desired tooltip.
--	@function		p._source
--	@param			{string} source Name of source module containing object entry
--	@return			{function} Wrapper function
p._source = function(source)
	return function(func)
		return function(name, ...)
			return p[func](name, source, ...)
			-- E.g. require('Module:Tooltips')('Warframes')('full')('Ivara') === require('Module:Tooltips').full('Ivara', 'Warframes')
		end
	end
end

-- For calling export module directly: require('Module:Tooltips')()
setmetatable(p, { __call = function(self, ...) return p._source(...) end })

return p
