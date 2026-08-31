---	LuaSerializer helps with prettifying Lua tables in this wiki's modules' <code>/data</code>
--	subpages in accordance to [[WARFRAME_Wiki:Programming_Standards]]. Uses 
--	DataDumper.lua to serialize a Lua table to a string format for prettifying.<br />
--	
--	Original source and documentation: http://lua-users.org/wiki/DataDumper
--	Note: Slightly modified from original to include extra spacing and use tab 
--	indentation when pretty printing table.
--	
--	DataDumper&#46;lua
--	http://lua-users&#46;org/wiki/DataDumper
--	Copyright (c) 2007 Olivetti-Engineering SA
--	
--	Permission is hereby granted, free of charge, to any person
--	obtaining a copy of this software and associated documentation
--	files (the "Software"), to deal in the Software without
--	restriction, including without limitation the rights to use,
--	copy, modify, merge, publish, distribute, sublicense, and/or sell
--	copies of the Software, and to permit persons to whom the
--	Software is furnished to do so, subject to the following
--	conditions:
--	
--	The above copyright notice and this permission notice shall be
--	included in all copies or substantial portions of the Software.
--	
--	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
--	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
--	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
--	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
--	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
--	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
--	OTHER DEALINGS IN THE SOFTWARE.
--	@module		luaserializer
--	@alias		p
--	@credit		Olivetti-Engineering SA
--	@copyright	Copyright (c) 2007 Olivetti-Engineering SA
--	@requires	[http://lua-users.org/wiki/DataDumper]
--	@image		
--	@release	stable
--	

-- How to use this library on your local computer for linting Lua tables on the wiki
-- (Lua binaries must be installed to run Lua programs on your computer!):
-- # Copy/paste DataDumper's code in its own Lua file
-- # Copy/paste the Lua table into a Lua file and return the table
-- # In the actual executable code, require both this module and the file that 
--	 contains the Lua table and pass it into the constructor of DataDumper 
--	 (e.g. local stringifyTable = DataDumper(require("sampleTable"))
-- # Write the serialized Lua table back to the Lua file
-- # Run the program in the terminal (e.g. lua lint_table.lua) and copy/paste 
--	 the resultant table back to the wiki

-- TODO: Newlines escape sequences are not properly serialized. String values with newlines escape sequence
-- "\n" become "\" with an invisible newline character in the resultant Lua table that is returned by this module.
-- TODO: math.huge becomes inf after going through DataDumper(). Should retain math.huge to represent infinity.

local MODULE_NAMESPACE_ID = 828
local MODULE_LOCALIZATION = mw.site.namespaces[MODULE_NAMESPACE_ID].name

local dumplua_closure = [[
local closures = {}
local function closure(t) 
	closures[#closures+1] = t
	t[1] = assert(loadstring(t[1]))
	return t[1]
end

for _,t in pairs(closures) do
	for i = 2,#t do 
		debug.setupvalue(t[1], i-1, t[i]) 
	end 
end
]]

local lua_reserved_keywords = {
	'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 
	'function', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 
	'return', 'then', 'true', 'until', 'while' }

local function keys(t)
	local res = {}
	local oktypes = { stringstring = true, numbernumber = true }
	local function cmpfct(a,b)
		if oktypes[type(a)..type(b)] then
			return a < b
		else
			return type(a) < type(b)
		end
	end
	for k in pairs(t) do
		res[#res+1] = k
	end
	table.sort(res, cmpfct)
	return res
end

-- This c_functions is unused in the context of using this library
-- to lint Lua tables on the wiki. Our Lua tables in /data subpages are very simple,
-- containing nil, boolean, number, string, and table values. No functions or metatables 
-- will be stored in exported tables since mw.loadData() limits basic data types 
-- and tables to be stored. This also helps with compatibility with other data storage
-- formats like JSON.

-- local c_functions = {}
-- for _,lib in pairs{'_G', 'string', 'table', 'math', 
-- 		'io', 'os', 'coroutine', 'package', 'debug'} do
-- 	local t = _G[lib] or {}
-- 	lib = lib .. "."
-- 	if lib == "_G." then lib = "" end
-- 	for k,v in pairs(t) do
-- 		if type(v) == 'function' and not pcall(string.dump, v) then
-- 			c_functions[v] = lib..k
-- 		end
-- 	end
-- end

function DataDumper(value, varname, fastmode, indent)
	local defined, dumplua = {}
	-- Local variables for speed optimization
	local string_format, type, string_dump, string_rep = 
				string.format, type, string.dump, string.rep
	local tostring, pairs, table_concat = 
				tostring, pairs, table.concat
	local keycache, strvalcache, out, closure_cnt = {}, {}, {}, 0
	setmetatable(strvalcache, {__index = function(t,value)
		local res = string_format('%q', value)
		t[value] = res
		return res
	end})
	local numberspecials = {
        [math.huge] = 'math.huge',
        [-math.huge] = '-math.huge',
    }
    setmetatable(numberspecials, {__index = function(t,value)
        if value ~= value then return '0/0' end -- -nan
    end})
	local fcts = {
		string = function(value) return strvalcache[value] end,
		number = function(value) return numberspecials[value] or value end,
		boolean = function(value) return tostring(value) end,
		['nil'] = function(value) return 'nil' end,
		-- Values in /data table will not be of the following data types
		-- ['function'] = function(value) 
		-- 	return string_format("loadstring(%q)", string_dump(value)) 
		-- end,
		-- userdata = function() error("Cannot dump userdata") end,
		-- thread = function() error("Cannot dump threads") end,
	}
	local function test_defined(value, path)
		if defined[value] then
			if path:match("^getmetatable.*%)$") then
				out[#out+1] = string_format("s%s, %s)\n", path:sub(2,-2), defined[value])
			else
				out[#out+1] = path .. " = " .. defined[value] .. "\n"
			end
			return true
		end
		defined[value] = path
	end
	local function make_key(t, key)
		local s
		if type(key) == 'string' and key:match('^[_%a][_%w]*$') then
			s = key .. " = "	-- Note: updated spacing in assignment of value to a key
		else
			s = "[" .. dumplua(key, 0) .. "] = "	-- Note: updated spacing
		end
		t[key] = s
		return s
	end
	for _,k in ipairs(lua_reserved_keywords) do
		keycache[k] = '["'..k..'"] = '
	end
	if fastmode then 
		fcts.table = function (value)
			-- Table value
			local numidx = 1
			out[#out+1] = "{"
			for key,val in pairs(value) do
				if key == numidx then
					numidx = numidx + 1
				else
					out[#out+1] = keycache[key]
				end
				local str = dumplua(val)
				out[#out+1] = str..","
			end
			if string.sub(out[#out], -1) == "," then
				out[#out] = string.sub(out[#out], 1, -2);
			end
			out[#out+1] = "}"
			return "" 
		end
	else 
		fcts.table = function (value, indent, path)
			if test_defined(value, path) then return "nil" end
			-- Table value
			local sep, str, numidx, totallen = " ", {}, 1, 0
			-- No metatables should exist in /data tables
			-- local meta, metastr = getmetatable(value)
			-- if meta then
			-- 	indent = indent + 1
			-- 	metastr = dumplua(meta, indent, "getmetatable("..path..")")
			-- 	totallen = totallen + #metastr + 16
			-- end
			for _,key in pairs(keys(value)) do
				local val = value[key]
				local s = ""
				local subpath = path or ""
				if key == numidx then
					subpath = subpath .. "[" .. numidx .. "]"
					numidx = numidx + 1
				else
					s = keycache[key]
					if not s:match "^%[" then subpath = subpath .. "." end
					subpath = subpath .. s:gsub("%s*=%s*$","")
				end
				s = s .. dumplua(val, indent+1, subpath)
				str[#str+1] = s
				totallen = totallen + #s + 2
			end
			if totallen > 80 then
				sep = "\n" .. string_rep("\t", indent+1)	-- Note: replaced double space with a tab for indentation
			end
			-- Note: changed the last sep:sub(1,-3) to sep:sub(1,-2) so closing
			-- curly brackets of tables than span multiple lines align
			str = "{"..sep..table_concat(str, ","..sep).." "..sep:sub(1,-2).."}" 
			if meta then
				sep = sep:sub(1,-3)
				return "setmetatable("..sep..str..","..sep..metastr..sep:sub(1,-2)..")"
			end
			return str
		end
		-- The Lua tables in /data subpages will not contain functions as values 
		-- so this can be safely omitted
		-- fcts['function'] = function (value, indent, path)
		-- 	if test_defined(value, path) then return "nil" end
		-- 	if c_functions[value] then
		-- 		return c_functions[value]
		-- 	elseif debug == nil or debug.getupvalue(value, 1) == nil then
		-- 		return string_format("loadstring(%q)", string_dump(value))
		-- 	end
		-- 	closure_cnt = closure_cnt + 1
		-- 	local res = {string.dump(value)}
		-- 	for i = 1,math.huge do
		-- 		local name, v = debug.getupvalue(value,i)
		-- 		if name == nil then break end
		-- 		res[i+1] = v
		-- 	end
		-- 	return "closure " .. dumplua(res, indent, "closures["..closure_cnt.."]")
		-- end
	end
	function dumplua(value, indent, path)
		return fcts[type(value)](value, indent, path)
	end
	if varname == nil then
		varname = "return "
	elseif varname:match("^[%a_][%w_]*$") then
		varname = varname .. " = "
	end
	if fastmode then
		setmetatable(keycache, {__index = make_key })
		out[1] = varname
		table.insert(out,dumplua(value, 0))
		return table.concat(out)
	else
		setmetatable(keycache, {__index = make_key })
		local items = {}
		for i=1,10 do items[i] = '' end
		items[3] = dumplua(value, indent or 0, "t")
		if closure_cnt > 0 then
			items[1], items[6] = dumplua_closure:match("(.*\n)\n(.*)")
			out[#out+1] = ""
		end
		if #out > 0 then
			items[2], items[4] = "local t = ", "\n"
			items[5] = table.concat(out)
			items[7] = varname .. "t"
		else
			items[2] = varname
		end
		return table.concat(items)
	end
end

-- TODO: implement a Lua lexer for abstract syntax tree to extend the functionality to lint
-- module code; this would have to use mw.title.new():getContent()
-- Sample code from Robloc: https://github.com/stravant/LuaMinify/blob/master/RobloxPlugin/Minify.lua
local p = {}

--- Returns the prettified version of the Lua table. For use within Lua modules or terminal.
--	@function		p._serializeTable
--	@param			{table} t Table to be serialized
--	@returns		{string} Preformatted text of prettified Lua table
function p._serializeTable(t)
	local stringifyTable = DataDumper(t)
	return stringifyTable
end

--- Returns the prettified version of the Lua table in a module's <code>/data</code> subpage.
--	For use within Lua modules or terminal.
--	@function		p.serialize
--	@param			{table} frame Frame object with the first argument being the name of module with a <code>/data</code> subpage
--								  or full name of module page (excluding Module namespace)
--	@returns		{string} Preformatted text of prettified Lua table
function p._serialize(moduleName)
	local pageName = moduleName.."/data"
	local title = mw.title.new(pageName, MODULE_NAMESPACE_ID)
	if (not title.exists) then
		pageName = moduleName
		title = mw.title.new(pageName, MODULE_NAMESPACE_ID)
		assert(title.exists, 'p.serialize(frame): module name "'..moduleName..'" does not exist on this wiki')
	end
	-- Always require() database instead of mw.loadData() in case of presence of metatables/metamethods
	-- Serialized table will not contain these metatables/metamethods however.
	local data = require(MODULE_LOCALIZATION..":"..pageName)
	local stringifyTable = DataDumper(data)
	return stringifyTable
end

--- Returns the prettified version of the Lua table in a module's <code>/data</code> subpage.
--	For invoking on articles.
--	@function		p.serialize
--	@param			{table} frame Frame object with the first argument being the name of module with a <code>/data</code> subpage
--								  or full name of module page (excluding Module namespace)
--	@returns		{string} Preformatted text of prettified Lua table
function p.serialize(frame)
	local moduleName = frame.args and frame.args[1] or nil
	local stringifyTable = p._serialize(moduleName)
	return frame:preprocess("<pre>\n"..stringifyTable.."\n</pre>")
end

return p
