---
title: "Module:LuaSerializer"
wiki_url: "https://wiki.warframe.com/w/Module/LuaSerializer"
wiki_timestamp: "2025-06-17T09:25:04Z"
---

**LuaSerializer** helps with prettifying Lua tables in this wiki's modules' `/data` subpages in accordance to [WARFRAME\_Wiki:Programming\_Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards"). Uses DataDumper.lua to serialize a Lua table to a string format for prettifying.

Original source and documentation: <http://lua-users.org/wiki/DataDumper> Note: Slightly modified from original to include extra spacing and use tab indentation when pretty printing table.

DataDumper.lua <http://lua-users.org/wiki/DataDumper> Copyright (c) 2007 Olivetti-Engineering SA

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:LuaSerializer|serialize|input1}}`

For example, input `{{#invoke:LuaSerializer|serialize|Acquisition}}` to [Special:ExpandTemplates](/w/Special:ExpandTemplates "Special:ExpandTemplates") in order to get the prettified version of the table returned by [Module:Acquisition/data](/w/Module:Acquisition/data "Module:Acquisition/data").

## Documentation

### Package items

`luaserializer._serializeTable(t)` (function)
:   Returns the prettified version of the Lua table. For use within Lua modules or terminal.
:   **Parameter**: `t` Table to be serialized (table)
:   **Returns**: Preformatted text of prettified Lua table (string)

`luaserializer.serialize(frame)` (function)
:   Returns the prettified version of the Lua table in a module's `/data` subpage. For use within Lua modules or terminal.
:   **Parameter**: `frame` Frame object with the first argument being the name of module with a `/data` subpage or full name of module page (excluding Module namespace) (table)
:   **Returns**: Preformatted text of prettified Lua table (string)

`luaserializer.serialize(frame)` (function)
:   Returns the prettified version of the Lua table in a module's `/data` subpage. For invoking on articles.
:   **Parameter**: `frame` Frame object with the first argument being the name of module with a `/data` subpage or full name of module page (excluding Module namespace) (table)
:   **Returns**: Preformatted text of prettified Lua table (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [LuaSerializer/dev](/w/Module:LuaSerializer/dev "Module:LuaSerializer/dev")
* [LuaSerializer/dev/doc](/w/Module:LuaSerializer/dev/doc "Module:LuaSerializer/dev/doc")
* [LuaSerializer/doc](/w/Module:LuaSerializer/doc "Module:LuaSerializer/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • M:LuaSerializer • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	LuaSerializer helps with prettifying Lua tables in this wiki's modules' /data
--	subpages in accordance to [[WARFRAME_Wiki:Programming_Standards]]. Uses 
--	DataDumper.lua to serialize a Lua table to a string format for prettifying.  

--	
--	Original source and documentation: http://lua-users.org/wiki/DataDumper
--	Note: Slightly modified from original to include extra spacing and use tab 
--	indentation when pretty printing table.
--	
--	DataDumper.lua
--	http://lua-users.org/wiki/DataDumper
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

--- Returns the prettified version of the Lua table in a module's /data subpage.
--	For use within Lua modules or terminal.
--	@function		p.serialize
--	@param			{table} frame Frame object with the first argument being the name of module with a /data subpage
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

--- Returns the prettified version of the Lua table in a module's /data subpage.
--	For invoking on articles.
--	@function		p.serialize
--	@param			{table} frame Frame object with the first argument being the name of module with a /data subpage
--								  or full name of module page (excluding Module namespace)
--	@returns		{string} Preformatted text of prettified Lua table
function p.serialize(frame)
	local moduleName = frame.args and frame.args[1] or nil
	local stringifyTable = p._serialize(moduleName)
	return frame:preprocess("

```lua
\n"..stringifyTable.."\n
```

")
end

return p
```

