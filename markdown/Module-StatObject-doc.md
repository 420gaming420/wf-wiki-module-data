---
title: "Module:StatObject/doc"
wiki_url: "https://wiki.warframe.com/w/Module/StatObject/doc"
wiki_timestamp: "2022-12-05T21:45:10Z"
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
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

