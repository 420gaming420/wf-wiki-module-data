---
title: "Module:StatObject"
wiki_url: "https://wiki.warframe.com/w/Module/StatObject"
wiki_timestamp: "2025-12-06T09:33:04Z"
---

**StatObject** helps create a unified interface for fetching raw, computed, derived, and formatted data from this wiki's /data subpages. Mostly used for avatar and weapon stats that are stored on this wiki's /data databases.

## Contents

* [1 Usage](#Usage)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

```lua
local StatObject = require('Module:StatObject')

StatObject.default = {
	-- Getter functions:
	-- Arrays of default values and format strings
	key = { 'Default Value', '%.2f format' },
    
	-- Can generate values/formatting with functions
	-- 'val, ...' is the return from map[1]
	key = { function(obj) end, function(self, val, ...) end },
    
	-- If format is a table the return values will be passed to each function/format string
	-- in the same order they are returned (nil is a pass-through)
	key = {
		function(obj) return a, b, c, d end,
		{ function(self, val) return val end, '%s', nil, '%d', sep = '' }
	},
    
	-- Can omit second entry, can omit table
	key = 'Default Value',
    
	-- nil means default get (same as omitting)
	key = nil,
    
    -- Add additional key-value pairs below to define raw getters and format getter functions for data
    -- To use the getters use StatObject.statRead(dataEntry, key) and StatObject.statFormat(dataEntry, key)
}

local ModData = mw.loadData('Module:Mods/data')		-- Importing sample database

StatObject.statRead(ModData['Serration'], 'Name')	-- Example of getting the raw Name value of Serration mod entry
StatObject.statFormat(ModData['Serration'], 'Name')	-- Example of getting the formatted Name value of Serration mod entry
-- Can also use StatObject.default to define computed/derived fields from raw data
```

## Documentation

### Package items

`StatObject.default` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   Map of getter functions to specific attributes of an object. Includes string formatting info for displaying stats to readers.

`StatObject.cacheIn(obj, key, val)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Memoization of calculated value; value is passed through.
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `key` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `val` Value to be memorized ([number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual")|[string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual")|[table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Value that is memorized ([...](#...))

`StatObject.ucachein(obj, key, val)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Memoization of calculated value; value assumed to be a table and will return unpacked.
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `key` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `val` Value to be memorized ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Table value that is memorized but unpacked ([...](#...))

`StatObject.pucacheIn(obj, key, val, obj, key, val, obj, k)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Memoization of calculated values; values will be memorized as a table and are passed through as is.
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `key` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `val` Values to be memorized ([...](#...))
    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `key` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `val` Values to be memorized ([...](#...))
    * `obj` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `k` Key ([any](#any))
:   **Returns**:

    * Table value that is memorized but unpacked ([...](#...))
    * Table value that is memorized but unpacked ([...](#...))
    * The value associated with k key local function get(obj, k) return obj[k] end ([...](#...))

`StatObject.statRead(obj, k)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Main getter function to access any raw/computed attribute/column/key of an object entry. See default table in M:Weapons for examples.
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Return value from the appropriate attribute-getting function ([...](#...))

`StatObject.statFormat(obj, k)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Main getter function to access any formatted attribute/column/key of a Object entry. See default table in [Module:Weapons](/w/Module:Weapons "Module:Weapons") for examples.
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Formatted text ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`StatObject.statFormatIf(obj, k, predicate)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   statFormat, but only if the data exists
:   **Parameters**:

    * `obj` Object entry ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `predicate` Given stat read, returns true if the data is valid ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   **Returns**: Formatted text if predicate ([string,nil](#string,nil))

`StatObject.meta` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   Contains metafunctions to return functions with certain parameters for getter maps[1].

`StatObject.meta.gets(k)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a getter function that returns the value of a particular key from an object table entry in the data.
:   **Parameter**: `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.unpacks(k)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a function that unpacks a table value of a particular key.
:   **Parameter**: `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Unpacking function ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.ors(...)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a getter function that looks through multiple keys/columns/attributes until a non-nil value is found. ors('Key1', 'Key2')(obj) == get(obj,'Key1') or get(obj,'Key2')
:   **Parameter**: `...` Names of keys stored in default table to search through ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function that returns the first non-nil value out of multiple keys in default table ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.indexes(k, index)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a getter function that gets a single element from a table value or tuple (return statements with multiple values). indexes('Key', 2)(obj) == get(obj, 'Key')[2]
:   **Parameters**:

    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `index` Number or key index ([number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual")|[string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function that returns the specified indexed element from a table or tuple value ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.selects(k, index)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Tuples only (also returns elements after that selected)
:   **Parameters**:

    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `index` Number or key index ([number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual")|[string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function that returns the specified indexed element from a tuple value ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.selects1(k, index)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Tuples only (only returns one)
:   **Parameters**:

    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `index` Number or key index ([number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual")|[string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function that returns the specified indexed element from a tuple value ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.tindexes(k, index)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Tables only
:   **Parameters**:

    * `k` Key name ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    * `index` Number or key index ([number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual")|[string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Getter function that returns the specified indexed element from a table value ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.passes(func)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Wrapper function to match definition of maps[2] functions created by makeFormat(). This helps standardizes how all format functions are called by p.statFormat() regardless of whether or not they are created in makeFormat().
:   **Parameter**: `func` Function to be wrapped ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   **Returns**: Returns the contents of the called function ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.meta.percent()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Formats decimal value as a percentage.
:   **Returns**: Formatted value as a percentage rounded to two decimal places ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`StatObject.meta.percents(s)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   More customizable percentage formatting.
:   **Parameter**: `s` Format string ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Returns formatted value as a percentage based on format string ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))

`StatObject.getObjects(data, validateFunc, sortFunc)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a subset of data based on a validation function.
:   **Parameters**:

    * `data` Data table to search ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `validateFunc` Function with which to filter (default: all but \_IgnoreEntry) ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"); optional)
    * `sortFunc` Custom comparison function; false to leave unsorted; defaults to ascending order by `Name` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"); optional)
:   **Returns**: Table entries as seen in `/data` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

`StatObject.getStruct[... N23]` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns a structure that gets a value from any input table, in the reverse order passed. (i.e. getStruct3(a, b, c)[k] == (c[k] or b[k] or a[k]))
:   **Parameter**: `...` Data tables to retrieve data from ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: The structure ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

`StatObject.objIter(data, validateFunc)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Iterates through a subset of data based on a validation function. (e.g. `for k,obj in p.objIter(data) do end`)
:   **Parameters**:

    * `data` Data table to search ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `validateFunc` Function with which to filter (default: all but \_IgnoreEntry, true -> all) ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"); optional)
:   **Returns**: Table entries as seen in `/data` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

`StatObject.shortLinkList(objs, variant, linkdisplay)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds a list of objects, with variants being next to base object name inside parentheses (e. g. [![](/images/thumb/Braton.png/32px-Braton.png?95621)](/w/Braton "Braton") [Braton](/w/Braton "Braton") ([![](/images/thumb/Braton.png/32px-Braton.png?95621)](/w/Mk1-Braton "Mk1-Braton") [Mk1](/w/Mk1-Braton "Mk1-Braton"), [![](/images/thumb/BratonPrime.png/32px-BratonPrime.png?c49e4)](/w/Braton_Prime "Braton Prime") [Prime](/w/Braton_Prime "Braton Prime"))). (WIP)
:   **Parameters**:

    * `objs` Table of objects to list ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    * `variant` A function which takes an object and returns its variant (string), base name (string), and full name (string) ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
    * `linkdisplay` A function which takes an object's full name, a display string, and the object, and returns wikitext displaying the object ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   **Returns**: Wikitext of resultant list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [StatObject/doc](/w/Module:StatObject/doc "Module:StatObject/doc")

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
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • M:StatObject • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
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
--	@param[opt]		{function} sortFunc Custom comparison function; false to leave unsorted; defaults to ascending order by Name
--	@returns		{table} Table entries as seen in /data
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

---	Iterates through a subset of data based on a validation function. (e.g. for k,obj in p.objIter(data) do end)
--	@function		p.objIter
--	@param			{table} data Data table to search
--	@param[opt]		{function} validateFunc Function with which to filter (default: all but _IgnoreEntry, true -> all)
--	@returns		{table} Table entries as seen in /data
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
```

