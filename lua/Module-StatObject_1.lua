---	'''StatObject''' helps create a unified interface for fetching raw, computed,
--	derived, and formatted data from this wiki's /data subpages.
--	
--	Mostly used for avatar and weapon stats that are stored on this wiki's /data
--	databases.
--	
--	@module			StatObject
--	@alias			p
--	@author			[[User:Gigamicro|Gigamicro]]
--	@image		Panel.png
--	@release	stable
--	

local p = {}
table.unpack = table.unpack or unpack -- also applies to any module that require()s this module

---	Map of getter functions to specific attributes of an object.
--	Includes string formatting info for displaying stats to readers.
--	@table		p.default
p.default = {}--set this in your module

-- use after calc functions that might be repeated (cache[obj][key])
local cache = {}

--- Memoization of calculated value; value is passed through.
--	@function		p.cacheIn
--	@param			{table} obj Object entry
--	@param			{string} key Key name
--	@param			{number|string|table} val Value to be memorized
--	@return			{...} Value that is memorized
function p.cacheIn(obj, key, val)
	cache[obj] = cache[obj] or {Name={obj.Name}}
	cache[obj][key] = val or cache[obj][key]
	return cache[obj][key]
end
-- TODO: What is the distinction between p.ucacheIn(...) and p.ucacheIn(obj, key, val)?
-- Don't see the reason why to make this function a vararg b/c it is limited by p.cacheIn's code
---	Memoization of calculated value; value assumed to be a table and will return unpacked.
--	@function		p.ucachein
--	@param			{table} obj Object entry
--	@param			{string} key Key name
--	@param			{table} val Value to be memorized
--	@return			{...} Table value that is memorized but unpacked
function p.ucacheIn(...)
	return table.unpack(p.cacheIn(...))
end
---	Memoization of calculated values; values will be memorized as a table and are passed through
--	as is.
--	@function		p.pucacheIn
--	@param			{table} obj Object entry
--	@param			{string} key Key name
--	@param			{...} val Values to be memorized
--	@return			{...} Table value that is memorized but unpacked
function p.pucacheIn(obj, key, ...)
	return table.unpack(p.cacheIn(obj, key, {...}))
end
--[[local function cacheOut(obj, key)
	return (cache[obj]or{})[key]
end--]]

--	Trivial getter.
--	@function		get
--	@param			{table} obj
--	@param			{any} k Key
--	@return			{...} The value associated with k key
-- local function get(obj, k) return obj[k] end

---	Main getter function to access any raw/computed attribute/column/key of an object entry.
--	See default table in M:Weapons for examples.
--	@function		p.statRead
--	@param			{table} obj Object entry
--	@param			{string} k Key name
--	@return			{...} Return value from the appropriate attribute-getting function
function p.statRead(obj, k)
	if not obj then error('p.statRead(obj,k): obj cannot be nil',2) end
	local c = (cache[obj]or{})[k]--cacheOut(obj, k)
	if c then
		if type(c) ~= 'table' then
			error(k..' cache is '..mw.dumpObject(c))
		end
		return table.unpack(c)
	end
	if not k then k = 'Name' end
	if type(p.default[k]) ~= 'table' then
		p.default[k] = {p.default[k]}
	end
	-- local map, format = table.unpack(p.default[k])
	local map = p.default[k][1]
	p.default[k][1] = false
		or type(map) == 'function' and map 
		or type(map) == 'nil' and get 
		-- or function(...) return get(...) or map end
		or function(t, k) return t[k] or map end

	return p.default[k][1](obj, k)
end

---	Creates a format function.
--	@function		makeFormat
--	@param			{table} maps Getter function definition;
--							2nd element will contain format string; if 2nd element is nil/false
--							then makeFormat() will define a default format function
--	@return			{function} Format function
local function makeFormat(maps)
	local format = maps[2]
	if not format then
		maps.format = function(self,...)
			-- trimming
			return (table.concat({...}, ' '):gsub('(%d%.%d%d)%d+', '%1'))
		end
		maps[2] = maps
		return maps[2]
	elseif pcall(function()assert(type(format.format)=='function')end) then
		return maps[2]
	elseif type(format) == 'function' then
		-- first param using : is the table being indexed, so that's going to be the map
		-- prob completely unnecessary tbh
		maps.format = format
		maps[2] = maps
		return maps[2]
	elseif type(format) == 'table' and (format[1] or format.sep) then
		maps.format = function(self, ...)
			local t = {}
			for i, v in pairs{...} do -- ipairs can't deal with skips
				local w = format[i]
				if type(w) == 'function' then
					t[i] = w(format, v)
				elseif w == '' then -- omit
				elseif type(w) == 'string' then
					t[i] = v and w:format(v) or (w:gsub('%%%a', 'N/A'))
				else
					t[i] = v
				end
			end
			return table.concat(t, format.sep or ' ')
		end
		maps[2] = maps
		return maps[2]
	else
		-- map[2] is not: a table with a 'format' key/a string, a function, nil/false, or an array
		-- this should never happen
		error('Invalid map: '..mw.dumpObject(maps)..debug.traceback())
	end
end

---	Main getter function to access any formatted attribute/column/key of a Object entry.
--	See default table in [[Module:Weapons]] for examples.
--	@function		p.statFormat
--	@param			{table} obj Object entry
--	@param			{string} k Key name
--	@return			{string} Formatted text
function p.statFormat(obj, k)
	local value = { p.statRead(obj, k) }
	return makeFormat(p.default[k]):format(table.unpack(value))
end

---	statFormat, but only if the data exists
--	@function		p.statFormatIf
--	@param			{table} obj Object entry
--	@param			{string} k Key name
--	@param			{function} predicate Given stat read, returns true if the data is valid
--	@return			{string,nil} Formatted text if predicate
function p.statFormatIf(obj, k, predicate)
	local value = { p.statRead(obj, k) }
	if (
		predicate
		 or p.default[k].p
		 or function(v)return v end
		)( table.unpack(value) )
	then
		return makeFormat(p.default[k]):format(table.unpack(value))
	end
end

---	Contains metafunctions to return functions with certain parameters for getter maps[1].
--	@table			p.meta
p.meta = {}

---	Returns a getter function that returns the value of a particular key from an 
--	object table entry in the data.
--	@function		p.meta.gets
--	@param			{string} k Key name
--	@return			{function} Getter function
function p.meta.gets(k)
	return function(obj)
		-- return get(obj, k)
		return obj[k]
	end
end

---	Returns a function that unpacks a table value of a particular key.
--	@function		p.meta.unpacks
--	@param			{string} k Key name
--	@return			{function} Unpacking function
function p.meta.unpacks(k)
	return function(obj)
		-- local v = get(obj, k) or {}
		local v = obj[k] or {}
		-- return type(v) ~= 'table' and v or table.unpack(v)
		assert(type(v)=='table')
		return table.unpack(v)
	end
end

---	Returns a getter function that looks through multiple keys/columns/attributes until
--	a non-nil value is found.
--	ors('Key1', 'Key2')(obj) == get(obj,'Key1') or get(obj,'Key2')
--	@function		p.meta.ors
--	@param			{string} ... Names of keys stored in default table to search through
--	@return			{function} Getter function that returns the first non-nil value out of multiple keys in default table
function p.meta.ors(...)
	local t = {...}
	t = #t > 1 and t or t[1]
	return function(obj, self)
		local val
		for _, v in pairs(t) do
			if v == nil then
			elseif type(v) == 'string' then
				-- val = get(obj, v) or (self ~= v and p.statRead(obj, v)) or nil
				val = obj[v] or (self ~= v and p.statRead(obj, v)) or nil
			elseif type(v) == 'function' then
				val = v(obj, t)
			else
				return v
			end
			if val ~= nil then return val end
		end
		val = t[#t]
		return type(val) ~= 'function' and val or nil
	end
end

---	Returns a getter function that gets a single element from a table value or tuple (return statements with multiple values).
--	indexes('Key', 2)(obj) == get(obj, 'Key')[2]
--	@function		p.meta.indexes
--	@param			{string} k Key name
--	@param			{number|string} index Number or key index
--	@return			{function} Getter function that returns the specified indexed element from a table or tuple value
function p.meta.indexes(k, index)
	return function(obj, self)
		-- local v = (self == index) and { get(obj, k) } or { p.statRead(obj, k) }
		local v = (self == index) and { obj[k] } or { p.statRead(obj, k) }
		if (#v <= 1) then v = v[1] end
		if type(v) == 'function' then
			error(mw.dumpObject{ k=k, index=index, obj=obj, self=self, v=v })
		end
		-- v = #v>1 and v or v[1]
		return type(v)=='table' and v[index] or 
			error('indexes(k, index) return function given '..mw.dumpObject(v)..', asked for ['..index..']')
	end
end
---	Tuples only (also returns elements after that selected)
--	@function		p.meta.selects
--	@param			{string} k Key name
--	@param			{number|string} index Number or key index
--	@return			{function} Getter function that returns the specified indexed element from a tuple value
function p.meta.selects(k, index)
	return function(obj)--, self)
		-- if self == index then
		-- 	-- return select(index, get(obj, k))
		-- 	return select(index, obj[k])
		-- else
			return select(index, p.statRead(obj, k))
		-- end
	end
end
---	Tuples only (only returns one)
--	@function		p.meta.selects1
--	@param			{string} k Key name
--	@param			{number|string} index Number or key index
--	@return			{function} Getter function that returns the specified indexed element from a tuple value
function p.meta.selects1(k, index)
	return function(obj)--, self)
		-- if self == index then
		-- 	-- return (select(index, get(obj, k)))
		-- 	return (select(index, obj[k]))
		-- else
			return (select(index, p.statRead(obj, k)))
		-- end
	end
end
---	Tables only
--	@function		p.meta.tindexes
--	@param			{string} k Key name
--	@param			{number|string} index Number or key index
--	@return			{function} Getter function that returns the specified indexed element from a table value
function p.meta.tindexes(k, index)
	return function(obj, self)
		if self == index then
			-- return get(obj, k)[index]
			return obj[k][index]
		else
			return p.statRead(obj, k)[index]
		end
	end
end

-- Formatting functions for getter maps[2]

---	Wrapper function to match definition of maps[2] functions created by makeFormat().
--	This helps standardizes how all format functions are called by p.statFormat()
--	regardless of whether or not they are created in makeFormat().
--	@function		p.meta.passes
--	@param			{function} func Function to be wrapped
--	@return			{function} Returns the contents of the called function
function p.meta.passes(func)
	return function(self, ...)
		return func(...)
	end
end

---	Formats decimal value as a percentage.
--	@function		p.meta.percent
--	@return			{string} Formatted value as a percentage rounded to two decimal places
function p.meta.percent(self, v)
	return ('%.2f%%'):format(100 * (v or self))
end

---	More customizable percentage formatting.
--	@function		p.meta.percents
--	@param			{string} s Format string
--	@return			{function} Returns formatted value as a percentage based on format string
function p.meta.percents(s)
	return function(self, v, ...)
		return s:format(100 * v, ...)
	end
end


---	Returns a subset of data based on a validation function.
--	@function		p.getObjects
--	@param			{table} data Data table to search
--	@param[opt]		{function} validateFunc Function with which to filter (default: all but _IgnoreEntry)
--	@param[opt]		{function} sortFunc Custom comparison function; false to leave unsorted; defaults to ascending order by <code>Name</code>
--	@returns		{table} Table entries as seen in <code>/data</code>
function p.getObjects(data, validateFunc, sortFunc)
	local objs = {}
	validateFunc=validateFunc or function(obj) return not obj._IgnoreEntry end
	for _, obj in pairs(data) do
		if validateFunc(obj) then
			table.insert(objs, obj)
		end
	end
	if sortFunc~=false then
		sortFunc=sortFunc or function(a, b) return a.Name < b.Name end
		table.sort(objs, sortFunc)
	end
	return objs
end

---	Returns a structure that gets a value from any input table, in the reverse order passed. (i.e. getStruct3(a, b, c)[k] == (c[k] or b[k] or a[k]))
--	@function		p.getStruct[N23]
--	@param			{table} ... Data tables to retrieve data from
--	@returns		{table} The structure
function p.getStructN(first, ...)
	local struct = setmetatable({},{__index=first})
	for _, nth in ipairs{...} do
		local t = struct--for upvalue
		struct = setmetatable({}, { __index=function(self, i) return nth[i] or t[i] end })
	end
	return struct
end
function p.getStruct1(first)
	if not first then error 'p.getStruct1(): first is nil' end
	return setmetatable({}, { __index=first })
end
function p.getStruct2(first, second)
	if not first  then error 'p.getStruct2(): first is nil' end
	if not second then error 'p.getStruct2(): second is nil' end
	return setmetatable({}, { __index=function(self, i) return second[i] or first[i] end })
end
function p.getStruct3(first, second, third)
	if not first  then error 'p.getStruct3(): first is nil' end
	if not second then error 'p.getStruct3(): second is nil' end
	if not third  then error 'p.getStruct3(): third is nil' end
	return setmetatable({}, { __index=function(self, i) return third[i] or second[i] or first[i] end })
end

---	Iterates through a subset of data based on a validation function. (e.g. <code>for k,obj in p.objIter(data) do end</code>)
--	@function		p.objIter
--	@param			{table} data Data table to search
--	@param[opt]		{function} validateFunc Function with which to filter (default: all but _IgnoreEntry, true -> all)
--	@returns		{table} Table entries as seen in <code>/data</code>
function p.objIter(data, validateFunc)
	if not validateFunc then
		validateFunc = function(obj) return not obj._IgnoreEntry end
	elseif validateFunc == true then
		validateFunc = function() return true end
	end
	return function(t,k)
		for k, obj in t[1], t[2], k do
			if validateFunc(obj) then
				return k,obj
			end
		end
	end, {pairs(data)}, nil
end

-- TODO: Don't think this function is within the scope of this module in terms of functionality;
-- this module doesn't deal with outputing wikitext necessarily.
---	Builds a list of objects, with variants being next to base object name inside parentheses
--	(e.g. {{Weapon|Braton}} ({{Weapon|Mk1-Braton|Mk1}}, {{Weapon|Braton Prime|Prime}})).
--	(WIP)
--	@function		p.shortLinkList
--	@param			{table} objs Table of objects to list
--	@param			{function} variant A function which takes an object and returns its variant (string), base name (string), and full name (string)
--	@param			{function} linkdisplay A function which takes an object's full name, a display string, and the object, and returns wikitext displaying the object
--	@returns		{string} Wikitext of resultant list
function p.shortLinkList(objs, variant, linkdisplay)
	local baseNames = {}
	for key, obj in pairs(objs) do
		local varName, baseName, fullName = variant(obj)
		if varName == '' then varName='Base' end--reverse?
		if not baseNames[baseName] then baseNames[baseName] = {} end
		if varName=='Base' then
			baseNames[baseName].hasBase = true
		end
		-- else
			table.insert(baseNames[baseName], {var=varName,full=fullName,obj=obj})
	end

	local link = linkdisplay or 
	function(full, disp)
		disp=disp or full
		full=full:gsub('%s?%b()$','')
		return disp~=full and '[['..full..'|'..disp..']]' or '[['..full..']]'
	end
	if type(linkdisplay)=='string' then
		local Tooltips = require[[Module:Tooltips]]
		mw.log('HEY I JUST REQUIRED TOOLTIPS, IF YOU SEE MORE THAN ONE OF THIS YOU HAVE A PROBLEM\n\tLove, M:StatObject.shortLinkList')
		link = function(full, disp, obj) return Tooltips.icontext{full, linkdisplay, obj, r = disp} end
	end

	local result = {}
	for baseName, variants in require[[Module:Table]].skpairs(baseNames) do
		local thisRow = {}
		for _, metaobj in ipairs(variants) do
			if metaobj.var ~= 'Base' then
				table.insert(thisRow, link(metaobj.full, variants.hasBase and metaobj.var))
			end
		end
		local bn = variants.hasBase and link(baseName) or ''
		local vars = #thisRow > 0 and (variants.hasBase and ' (%s)' or '%s'):format(table.concat(thisRow, ', ')) or ''
		table.insert(result, variants.hasBase and link(baseName)..vars or vars)
	end
	return result
end

-- Adding function aliases
for k, v in pairs(p) do p['_'..k] = v end

return p
