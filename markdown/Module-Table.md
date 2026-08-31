---
title: "Module:Table"
wiki_url: "https://wiki.warframe.com/w/Module/Table"
wiki_timestamp: "2026-05-16T05:20:42Z"
---

**Table** is an extension of the `table` STL, containing additional functionality and support.

Table can only be used within other modules. It is not recommended to invoke these functions within articles or templates.

All table STL objects can be accessed directly, e.g. `table.concat()`.

## Contents

* [1 Usage](#Usage)
  + [1.1 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Module

```lua
local p = {}
local table = require('Module:Table')

local function func(t)
    return table.size(t)
end
```

On this Wiki, Table is used in:

---

## Documentation

### Package items

`table.invertIndex(t, keyName)` (function)
:   Inverts a table to be indexed by a specified first-depth key.
:   { t1 = { Value = "Some value", NestedTable = { NestedValue = "Another value" } } } becomes the following if using Value as inverted key { ["Some value"] = { Value = "Some value", NestedTable = { NestedValue = "Another value" } }
:   **Parameters**:

    * `t` Input table with table values or keys that map to table values (unmodified) (string)
    * `keyName` Name of key to use as inverted index (string)
:   **Returns**: Resultant table (table)

`table.loadData(t)` (function)
:   Loads a copy of a data table. Being a copy, it is no longer readonly.
:   **Parameter**: `t` Location of data table ([[Module:<Module>/data]] usually) (string)
:   **Returns**: Copy of data table (table)

`table.sort(t, f)` (function)
:   Sorts an array.
:   **Parameters**:

    * `t` Array-like table to be sorted (table)
    * `f` Comparator function that takes in two arguments and returns a boolean; if omitted, uses default less-than operation when comparing two values (function; optional)
:   **Returns**: Sorted table for function chaining or tail call (table)

`table.copyKeyValues(targetTable, refTable, keyTable)` (function)
:   Copying key-value pairs to target table from reference table. Assumes that tables only contain table entries. Keys that are already in target table will not be overrided with data from reference table.
:   **Parameters**:

    * `targetTable` Table to be modified (table)
    * `refTable` Reference table (table)
    * `keyTable` Table of key names to copy within each table entry (table)
:   **Returns**: Modified target table (table)

`table.skpairs(t, sortType)` (function)
:   Iterator sorted by keys.   
     For example, a table that looked something like  
     `data = {["Cat"] = 5, ["Bat"] = 4, ["Hat"] = 7 }`  
     then  
     `for k, v in skpairs(data) do`  
     would loop through:  
     k="Bat" v=4;  
     k="Cat" v=5;  
     k="Hat" v=7   
     redone by [user:gigamicro](/w/User:Gigamicro "User:Gigamicro")
:   **Parameters**:

    * `t` A table to be sorted (table)
    * `sortType` If true, sort by descending order; ascending otherwise; can also pass a function (boolean or function; optional)
:   **Returns**:

    * For loop initialising values (function)
    * Two element table with table values, the first maps keys to their array index and the second is an array of key names (table)
    * Starting key (string)

`table.size(table)` (function)
:   Returns the number of elements/entries in a table. If you want to only get the number of number indexed elements use the '#' operator or table.indexCount().
:   **Parameter**: `table` A table with no explicit nil values (table)
:   **Returns**: The size of table, ignoring keys with nil values and nil values themselves (number)

`table.indexCount(t)` (function)
:   Returns the number of number indexed elements in a table as well as the highest number index.
:   **Parameter**: `t` A table with no explicit nil values (table)
:   **Returns**:

    * The number of indexed elements in a table; if table is not of type 'table' then return nil (number)
    * Largest index (not necessarily the same as count since tables can be non-contiguous arrays) (number)

`table.tableSort(t, sortCol, sortAscend)` (function)
:   Sorts a table based on the listed column.
:   **Parameters**:

    * `t` Table to be sorted (table)
    * `sortCol` Name of column to be sorted by (string)
    * `sortAscend` If true, sorts in ascending order by specified column; false otherwise (boolean)
:   **Returns**: Sorted table (table)

`table.contains(t, item, ignoreCase)` (function)
:   Checks if a string value is in a table, acting as an array.
:   **Parameters**:

    * `t` A table to be searched through (table)
    * `item` The element that is being searched for (string)
    * `ignoreCase` If false, search is case-sensitive; true otherwise (boolean)
:   **Returns**:

    * True if element exists in table, false otherwise (boolean)
    * The found element's index; nil if element is not found (number)
    * Value that is found, same as item; nil if element is not found (string)

`table.filter(t, search)` (function)
:   Filters tables into subsets.   
    auth: [User:gigamicro](/w/User:Gigamicro "User:Gigamicro")
:   **Parameters**:

    * `t` table in which to search (table)
    * `search` String to search in table's keys (string or function)
:   **Returns**: A subset of the original table where search(k, v, t) is true (table)

`table.pack(...)` (function)
:   Stores multiple return values into a table, similar to `table. pack` in Lua 5.2
:   **Parameter**: `...` Any number of returned values regardless of type (...)
:   **Returns**: An array-like table containing the passed in arguments in the order that they are returned (table)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Table/doc](/w/Module:Table/doc "Module:Table/doc")
* [Table/testcases](/w/Module:Table/testcases "Module:Table/testcases")
* [Table/testcases/doc](/w/Module:Table/testcases/doc "Module:Table/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • M:Table |
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
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''Table''' is an extension of the table STL, containing additional functionality 
--	and support.  

--	
--	Table can only be used within other modules. It is not recommended to invoke
--	these functions within articles or templates.
--	
--	All table STL objects can be accessed directly, e.g. table.concat().
--	
--	@module		table
--	@alias		p
--	@author		Various
--	@author		[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|User:Cephalon Scientia]]
--	@attribution	[[User:FINNER|FINNER]]
--	@image		ModuleTable.png
--	@release	beta
--	

-- TODO: May implement some useful functions from https://developer.roblox.com/en-us/api-reference/lua-docs/table

-- TODO: Add reverse mapping function for simple key-value pairs, returning a 
-- new table with key-value pairs reversed? This is to allow two-way lookup, 
-- assuming values are unique.

local function clone(t1)
	local t2 = {}
	for k, v in ipairs(t1) do
		if type(v) == "table" then t2[k] = clone(v)
		else t2[k] = v end
	end
	-- TODO: Why is there two loops for cloning?
	for k, v in pairs(t1) do
		if type(v) == "table" then t2[k] = clone(v)
		else t2[k] = v end
	end
	return t2
end

local table = {
	--  All Table STL functions  ----------------------------------------------------
	-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Table_library
	__concat = table.concat,	-- concatenate indexed values
	__insert = table.insert,	-- add element, increment higher keys
	__remove = table.remove,	-- delete item, move higher keys
	__maxn = table.maxn,	-- deprec?, largest number key
	__sort = table.sort,	-- modified merge sort
	-- Depreciated functions:
	-- table.foreach()	- use for loop with pairs() instead
	-- table.foreachi()	- use for loop with ipairs() instead
	-- table.getn()	- use length operator (#) instead or Table.size() for tables loaded through mw.loadData()
	concat = table.concat,
	insert = table.insert,
	remove = table.remove,
	-- sort = table.sort,	-- Overridden to support function chaining/tail calls
	unpack = unpack,
	
	deepCopy = function(t1)
		local mt = getmetatable(t1)
		if mt and mt.mw_loadData then
			return clone(t1)
		end
		return mw.clone(t1)
	end,
	shallowCopy = function(t) return clone(t) end
}

---	Inverts a table to be indexed by a specified first-depth key.
--

```lua
--	{
--		t1 = {
--			Value = "Some value",
--			NestedTable = {
--				NestedValue = "Another value"
--			}
--		}
--	}
--	becomes the following if using Value as inverted key
--	{
--	["Some value"] = {
--		Value = "Some value",
--		NestedTable = {
--			NestedValue = "Another value"
--		}
--	}
--	
```

--	@function		p.invertIndex
--	@param			{string} t Input table with table values or keys that map to table values (unmodified)
--	@param			{string} keyName Name of key to use as inverted index
--	@return			{table} Resultant table
function table.invertIndex(t, keyName)
	assert(type(t) == 'table', 'table.invertIndex(t, keyName): t must be a table')
	local temp = {}
	for k, v in pairs(t) do
		local keyValue = v[keyName]
		if (keyValue ~= nil) then
			if (temp[keyValue] == nil) then
				temp[keyValue] = {}
			end
			table.insert(temp[keyValue], v)
		end
	end
	return temp
end

---	Loads a copy of a data table. Being a copy, it is no longer readonly.
--	@function		p.loadData
--	@param			{string} t Location of data table ([[Module:/data]] usually)
--	@return			{table} Copy of data table
function table.loadData(t)
	return table.deepCopy(mw.loadData(t))
end

---	Sorts an array.
--	@function		p.sort
--	@param			{table} t Array-like table to be sorted
--	@param[opt]		{function} f Comparator function that takes in two arguments and returns a boolean;
--							   if omitted, uses default less-than operation when comparing two values
--	@return			{table} Sorted table for function chaining or tail call
function table.sort(t, f)
	table.__sort(t, f)
	return t
end

---	Copying key-value pairs to target table from reference table.
--	Assumes that tables only contain table entries. Keys that are already in target table
--	will not be overrided with data from reference table.
--	@function		p.copyKeyValues
--	@param			{table} targetTable Table to be modified
--	@param			{table} refTable Reference table
--	@param			{table} keyTable Table of key names to copy within each table entry
--	@return			{table} Modified target table
function table.copyKeyValues(targetTable, refTable, keyTable)
	assert(type(targetTable) == 'table' and type(refTable) == 'table' and type(keyTable) == 'table',
		'table.copyKeyValues(targetTable, refTable, keyTable): all arguments must be table types')
	for k, v in pairs(targetTable) do
		local targetTableEntry = targetTable[k]
		local refTableEntry = refTable[k]
		for _, key in ipairs(keyTable) do
			if (targetTableEntry[key] == nil) then
				if (type(refTableEntry[key]) == 'table') then
					targetTableEntry[key] = table.deepCopy(refTableEntry[key])
				else
					targetTableEntry[key] = refTableEntry[key]
				end
			end
		end
	end
	return targetTable
end

---	Iterator sorted by keys.  

--	For example, a table that looked something like  

--	`data = {["Cat"] = 5, ["Bat"] = 4, ["Hat"] = 7 }`  

--	then  

--	`for k, v in skpairs(data) do`  

--	would loop through:  

--	k="Bat" v=4;  

--	k="Cat" v=5;  

--	k="Hat" v=7   

--	redone by [[user:gigamicro]]
--	@function		table.skpairs
--	@param			{table} t A table to be sorted
--	@param[opt]		{boolean or function} sortType If true, sort by descending order; ascending otherwise; can also pass a function
--	@return			{function} For loop initialising values
--	@return			{table} Two element table with table values, the first maps keys to their array index and the second is an array of key names
--	@return			{string} Starting key
function table.skpairs(t, sortType)
	if type(t) ~= 'table' then error('table.skpairs(t[, sortTable]): t must be a table',2) end
	
	local keys = {}
	for k in pairs(t) do keys[#keys + 1] = k end
	
	if type(sortType) == 'function' then
		table.sort(keys, sortType)--custom sort (always applied to keys)
	elseif sortType then--descending
		table.sort(keys, function(a, b) return a > b end)
	else
		table.sort(keys)--implicit <, function(a, b) return a < b end)>
	end
	
	local keysIndex = {}
	for i, k in ipairs(keys) do
		keysIndex[k] = i
	end
	
	return function(t, k)
		local key = t.k[ (t.i[k] or 0)+1 ]
		return key, t.t[key]
	end, {i=keysIndex, k=keys, t=t}, startingkey
end

---	Returns the number of elements/entries in a table.
--	If you want to only get the number of number indexed elements use the '#' 
--	operator or table.indexCount().
--	@function		table.size
--	@param			{table} table A table with no explicit nil values
--	@return			{number} The size of table, ignoring keys with nil values and 
--							 nil values themselves
function table.size(t)
	assert(type(t) == 'table', 'table.size(t): t must be a table')
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
	end
	return count
end

---	Returns the number of number indexed elements in a table as well as the highest number index.
--	@function		table.indexCount
--	@param			{table} t A table with no explicit nil values
--	@return			{number} The number of indexed elements in a table; 
--							 if table is not of type 'table' then return nil
--	@return			{number} Largest index (not necessarily the same as count since tables can be non-contiguous arrays)
function table.indexCount(t)
	assert(type(t) == 'table', 'table.indexCount(t): t must be a table')
	local count, max = 0, nil
	for i in ipairs(t) do count, max = count + 1, i end
	return count, max
end

---	Sorts a table based on the listed column.
--	@function		table.tableSort
--	@param			{table} t Table to be sorted
--	@param			{string} sortCol Name of column to be sorted by
--	@param			{boolean} sortAscend If true, sorts in ascending order by specified column; false otherwise
--	@return			{table} Sorted table
function table.tableSort(t, sortCol, sortAscend)
	assert(type(t) == 'table', 'table.tableSort(t, sortCol, sortAscend): t must be a table')
	return table.sort(t, 
		sortAscend 
		and function(a, b) return a[sortCol] < b[sortCol] end
		or function(a, b) return a[sortCol] > b[sortCol] end
	)
end

---	Checks if a string value is in a table, acting as an array.
--	@function		table.contains
--	@param			{table} t A table to be searched through
--	@param			{string} item The element that is being searched for
--	@param			{boolean} ignoreCase If false, search is case-sensitive; true otherwise
--	@return			{boolean} True if element exists in table, false otherwise
--	@return			{number} The found element's index; nil if element is not found
--	@return			{string} Value that is found, same as item; nil if element is not found
function table.contains(t, item, ignoreCase)
	assert(type(t) == 'table', 'table.contains(t, item, ignoreCase): t must be a table')
	if (t == nil or item == nil) then 
		return false
	end
	for k, value in pairs(t) do
		if (value == item) or (ignoreCase and string.upper(value) == string.upper(item)) then
			return true, k, value
		end
	end
	
	return false
end

---	Filters tables into subsets.
--	  
auth: [[User:gigamicro]]
--	@function		table.filter
--	@param			{table} t table in which to search
--	@param			{string or function} search String to search in table's keys
--	@return			{table} A subset of the original table where search(k, v, t) is true
function table.filter(t, search)
	assert(type(t) == 'table', 'table.filter(t, search): t must be a table')
	search = ({
		string = function(k)
			--if type(k)~='string' then error('Key '..type(k)..' not string') end
			return string.find(k, search) and true or false
		end,
		number = nil and function(k, v, t)
			return 
		end,
		table = nil and function(k, v, t)
		end,
	})[type(search)] or search

	if type(search) ~= 'function' then return end
	
	local out = {}
	for k, v in pairs(t) do
		if search(k, v, t) then
			out[k] = v
		end
	end
	return out
end

---	Stores multiple return values into a table, similar to table.pack in Lua 5.2
--	@function		table.pack
--	@param			{...} ... Any number of returned values regardless of type
--	@return			{table} An array-like table containing the passed in arguments in the order that they are returned
function table.pack(...)
	return { n = select("#", ...), ... }
end

return table
```

