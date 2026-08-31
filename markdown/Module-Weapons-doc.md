---
title: "Module:Weapons/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/doc"
wiki_timestamp: "2022-12-05T22:11:21Z"
---

**Weapons** contains all of [WARFRAME](/w/WARFRAME "WARFRAME")'s [weapon](/w/Weapons "Weapons") data.

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Navigation](#Navigation)
* [3 Product Backlog](#Product_Backlog)
* [4 Finished Issues](#Finished_Issues)
* [5 Forked Repos](#Forked_Repos)
* [6 Documentation](#Documentation)
  + [6.1 Package items](#Package_items)
* [7 See Also](#See_Also)
* [8 Code](#Code)

## Usage

### Template

In template and articles: `{{#invoke:Weapons|function|input1|input2|...}}`

## Navigation

Quick navigation to submodules:

* [Module:Weapons/Conclave/data](/w/Module:Weapons/Conclave/data "Module:Weapons/Conclave/data") - data store for [Conclave](/w/Conclave "Conclave")-specific weapon stats
* [Module:Weapons/characteristics](/w/Module:Weapons/characteristics "Module:Weapons/characteristics") - for generating advantage/disadvantage text under Characteristic sections of weapon articles based on stored data in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data")
* [Module:Weapons/compare](/w/Module:Weapons/compare "Module:Weapons/compare") - for generating text for side-by-side comparison between two weapons
* [Module:Weapons/comptable](/w/Module:Weapons/comptable "Module:Weapons/comptable")
* [Module:Weapons/csv](/w/Module:Weapons/csv "Module:Weapons/csv") - for generating CSV output of a subset of weapon stats as stored in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data")
* [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data") - main submodule for weapon data store
  + [Module:Weapons/data/credits](/w/Module:Weapons/data/credits "Module:Weapons/data/credits") - in-progress data store for mapping weapons to their development credits
  + [Module:Weapons/data/dev](/w/Module:Weapons/data/dev "Module:Weapons/data/dev") - sandbox page for data store
* [Module:Weapons/data/validate](/w/Module:Weapons/data/validate "Module:Weapons/data/validate") - data validation scripts
* [Module:Weapons/dev](/w/Module:Weapons/dev "Module:Weapons/dev") - sandbox page
* [Module:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") - builds weapon infoboxes
* [Module:Weapons/nav](/w/Module:Weapons/nav "Module:Weapons/nav") - builds weapon navigation box as seen at the bottom of weapon articles
* [Module:Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata") - preprocessed weapon data containing statistical
  + [Module:Weapons/preprocess](/w/Module:Weapons/preprocess "Module:Weapons/preprocess") - script for seeding ppdata
  + [Module:Weapons/ppdata/seeder](/w/Module:Weapons/ppdata/seeder "Module:Weapons/ppdata/seeder") - archived script for seeding ppdata
* [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") - unit test suite for [Module:Weapons](/w/Module:Weapons "Module:Weapons")

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [Module:StatObject](/w/Module:StatObject "Module:StatObject") as OOP paradigm | Dev | Planning | Low |  | Currently our usage of [Module:StatObject](/w/Module:StatObject "Module:StatObject") is as a static class with `statRead` and `statFormat` functions. Update [Module:Weapons](/w/Module:Weapons "Module:Weapons") and [Module:StatObject](/w/Module:StatObject "Module:StatObject") so we can 'instantiate' an actual StatObject object that takes in a weapon table entry as an argument. This way we can just do:  ```lua local StatObject = require('Module:StatObject') -- Base class local WeaponData = require('Module:Weapons/data')  -- Doing some metaprogramming to extend functionality of StatObject class StatObject.default = {     Name = { nil, 'Weapon Name: %s' },  -- Sample definition for Name field getter/formatter     ... }  local BratonStatObject = StatObject(WeaponData['Braton'])  -- Get raw Name value "Braton" instead of StatObject.statRead(WeaponData['Braton'], 'Name') local name = BratonStatObject.Name -- Get formatted Name value "Weapon Name: Braton" (as defined in StatObject.default) instead of StatObject.statFormat(WeaponData['Braton'], 'Name') print(BratonStatObject.Name) mw.log(BratonStatObject.Name) local formattedName = tostring(BratonStatObject.Name) -- If the above is not possible in Lua then maybe add a __call metamethod to Name key to return its formatted value formattedName = BratonStatObject.Name() -- Or add a format() function to instantiated StatObject's metatable, passing in key name as argument formattedName = BratonStatObject:format('Name') ``` | 22:01, 5 December 2022 (UTC) |  |
| Include attack name/context in [Module:Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata") | Dev | Planning | Low |  | Update [Module:Weapons/ppdata/seeder](/w/Module:Weapons/ppdata/seeder "Module:Weapons/ppdata/seeder") to add attack names associated with the respective stats used for comparing so that [Module:Weapons/characteristics](/w/Module:Weapons/characteristics "Module:Weapons/characteristics") can add additional context to the stat comparisons. See <https://warframe.fandom.com/wiki/Quassus?commentId=4400000000003635575>. For  [Quassus](/w/Quassus "Quassus")'s case,  [Jat Kusar](/w/Jat_Kusar "Jat Kusar") has a base 35% crit chance, but since we are comparing against non-normal attacks,  [Quassus](/w/Quassus "Quassus")'s Ethereal Daggers will have second highest crit chance (30%) behind  [Tenet Exec](/w/Tenet_Exec "Tenet Exec")'s slam shockwaves (38%). | 22:09, 5 August 2022 (UTC) |  |
| Weapon and Attack classes | Refactor and Dev | Planning | Low |  | * Create a new Weapon and Attack class that can be instantiated by passing in a weapon table entry and attack table entry respectively. Each of these classes should contain a `statRead()` and `statFormat()` function that can be called to return an particular weapon stat, aggregate data, or computed stat based on `/data` contents. | 21:18, 18 January 2022 (UTC) |  |
| `ExplosionDelay` key | Refactor | Planning | Low |  | * Update this to store a table with two values: shortest delay time and longest delay time. This is to support  [Kompressa](/w/Kompressa "Kompressa")'s variable delay time. For weapons that have a single delay time, use the same value for both table elements. | 22:10, 6 January 2022 (UTC) |  |
| `Reload` key | Refactor | Planning | Low |  | * Move `Reload` key to attack tables? Nagantaka and Ambassador have two different reload times depending on attack.  * 21:35, 19 January 2022 (UTC) update: [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro") suggests that any duplicate keys nested in Attack table entries should 'override' the base values for the weapon. In this case, add a another `Reload` key under the appropriate attack that has a different value than the `Reload` key in the main weapon entry. |  |  |
| Augments in `/data` | Refactor | New | Low |  | * Remove weapon augments list from `/data` and use [Module:Mods](/w/Module:Mods "Module:Mods") and/or [Module:Mods/data](/w/Module:Mods/data "Module:Mods/data") instead to fetch augment mods data.   + Would require dev work in M:Mods/data too to index by mod type. | 01:37, 31 May 2021 (UTC) |  |
| Data validation | Dev/database | Active | Medium |  | Create `Module:Weapons/data/validate` subpage of `/data` for data validation functions   * Include type checking for each column/attribute * Include checking if a table entry has the required keys (the minimum number of keys needed to support basic features in [Module:Weapons](/w/Module:Weapons "Module:Weapons")) * Include boundary checking for stat values (e.g. `CritChance` cannot be negative) | 01:37, 31 May 2021 (UTC) | 23:33, 1 August 2021 (UTC) |
| Error handling | Clean up | New | Medium |  | Change all return statements with "ERROR" to either `assert()` or `error()` to standardize error handling.   * Error messages should be in the form of "functionName(argument names): argument value 1 is not a valid number". | 01:37, 31 May 2021 (UTC) |  |
| Update database schema | Database | Active | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Reworking how attacks are stored in tables for flexibility. Should have one Attack column that contains multiple tables, each representing a unique attack for that weapon. Would probably improve/simplify [Weapon Comparison](/w/Weapon_Comparison "Weapon Comparison") and [Template:WeaponInfoboxAutomatic](/w/Template:WeaponInfoboxAutomatic "Template:WeaponInfoboxAutomatic") in displaying multiple attacks of a weapon. Right now we are hacking the use of `ChargeAttack` and `SecondaryAttack` for some attacks that are not necessarily charged or alt-fire (see [Deconstructor](/w/Deconstructor "Deconstructor")'s entry in the database). Also include forced proc data for all possible attacks (e.g. Glaives, some forced Impact weapons, etc.).  23:33, 1 August 2021 (UTC) update: There are lots of changes to these tables as I slowly create validation functions to check what keys-value pairs are needed or not, see documentation in [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc") for possible key-value pairs. Right now, attacks are stored in generic `Attack1`, `Attack2`, ... keys when we were changing the names of attack keys (e.g. `NormalAttack` became `Attack1`).  21:18, 18 January 2022 (UTC) update: [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro") implemented a new `attack` key (should be named `Attacks` to match key naming convention) that points to an array of attack tables. `Attack1` to `Attack9` keys are still in the data, just we now have a new way of indexing the same attack data by reference.  21:35, 19 January 2022 (UTC) update: `Attack1` to `Attack9` are now depreciated and removed from data tables. All optional keys are now explicitly stored in database (but are still optional b/c we set default values for getter functions in [Module:Weapons](/w/Module:Weapons "Module:Weapons"). Some error clean up is still needed but for the most part, all weapon submodules and weapon tooltips should properly use `Attacks` table. | 01:50, 31 May 2021 (UTC) | 21:35, 19 January 2022 (UTC) |
| Unit tests | Testing | Archived | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Add unit tests in [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") for each function in [Module:Weapons](/w/Module:Weapons "Module:Weapons"). See [Module:Math/testcases](/w/Module:Math/testcases "Module:Math/testcases") for examples and <https://dev.fandom.com/wiki/Global_Lua_Modules/Testharness> for documentation on how to format tests.  20:29, 31 July 2021 (UTC) update: Do not feel like it is appropriate to add unit tests using [Module:TestHarness](/w/Module:TestHarness "Module:TestHarness") to most of the functions in this module since they mostly pertain to building wikitext to display to the reader. We can add a [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") subpage for visual tests to ensure rendered wikitext is not broken. Otherwise, I think it is more important to validate the data in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data") which are being formatted and displayed to the reader. | 02:01, 31 May 2021 (UTC) | 20:29, 31 July 2021 (UTC) |

## Finished Issues

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Completion Date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Advantages/disadvantages | Refactor | Completed | Low | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | * Move advantages/disadvantages builder to a new submodule page for organization. | 06:05, 3 October 2021 (UTC) | 17:47, 2 November 2021 (UTC) |
| Railjack Weapons | Dev/Edit/Database | Long-term support | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | * Officially support Railjack weapons being in database. This allows Railjack weapons to make use of our infobox builder and do automatic comparisons. * Update `/data` with current user-contributed data in [Railjack/Armaments](/w/Railjack/Armaments "Railjack/Armaments")   02:32, 6 September 2021 (UTC) update: Added most Railjack turrets and ordnances to `/data`. Missing Zetki Photor MK II, Zetki Carcinnox MK II, and Zetki Apoc MK I. First two are not obtainable in-game at this time since they are missing from drop tables, but are still in players' inventories.  00:12, 29 September 2021 (UTC) update: Added Zetki Photor MK II, Zetki Carcinnox MK II, and Zetki Apoc MK I stats according to the [Mobile Export](/w/Mobile_Export "Mobile Export"). | 22:17, 2 August 2021 (UTC) | 00:12, 29 September 2021 (UTC) |
| Update Conclave database schema | Database | Long-term support | Low | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Remove keys that represent PvE stats as they are irrelevant to PvP. Most other key-value pairs (except those in attack tables) are shared with `/data` and can be looped through to add shared key-value pairs. | 06:18, 10 August 2021 (UTC) | 03:10, 16 August 2021 (UTC) |
| Clean up | Clean up | Completed | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | * Remove unused functions. Also remove redundant functions that can be otherwise be used as as simple condition check (e.g. `HasAttack()` and `DoNotHasAttack()`). * Standardize styling to [WARFRAME Wiki:Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards"). | 01:37, 31 May 2021 (UTC) | 06:20, 10 August 2021 (UTC) |
| Refactoring | Refactor | Long-term support | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Refactor these functionalities for code reuse, better performance, better maintainability, and etc.:   * ~~Weapon comparison tables (see [Weapon Comparison](/w/Weapon_Comparison "Weapon Comparison"))~~ ✔️   + ~~Includes [Conclave](/w/Conclave "Conclave")~~ ✔️   + 00:19, 7 August 2021 (UTC) update: Weapon comparison tables are moved to [Module:Weapons/comptable](/w/Module:Weapons/comptable "Module:Weapons/comptable") submodule for seperations of concerns design * ~~Polarity table (see [Polarity](/w/Polarity "Polarity"))~~ ✔️ * ~~Mastery table (see [Mastery Rank](/w/Mastery_Rank "Mastery Rank"))~~ ✔️ * ~~Highest physical damage type table (see [Damage/Impact Damage](/w/Damage/Impact_Damage "Damage/Impact Damage"))~~ ✔️ * ~~Getter function(s) for weapon statistics/properties~~ ✔️ * ~~Weapon gallery~~ ✔️ | 17:43, 3 June 2021 (UTC) | 00:19, 7 August 2021 (UTC) |
| Documentation | Documentation | New | High |  | Add LuaDoc-style documentation for all functions. | 01:37, 31 May 2021 (UTC) | 06:35, 31 July 2021 (UTC) |
| Comparison tables and comparing two weapons | Refactor | Completed | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Refactor `BuildCompRow()`, `BuildCompTable()`, `BuildGunComparisonString`, and their sister functions.   * `BuildCompRow()` should have at max 2 nested if/else blocks * Do not remove functions such as `getCompTableGuns(frame)` and `p.getCompTableArchGuns(frame)` as those will be exposed to articles. ~~Do not think there is a way to pass in table arguments in `{{#invoke:}}` calls so we could not have a single table builder function.~~ Not true, can pass a multitude of named arguments and use `frame.args['argName']` to get those arguments.   20:53, 29 July 2021 (UTC) update: We now use `getValue(Weapon, keyName, attackName)` and dictionaries (e.g. `GUN_KEY_MAP`) that contain simple getter functions to get specific weapon stat values. No more complicated nested if/else blocks. | 01:37, 31 May 2021 (UTC) | 20:53, 29 July 2021 (UTC) |
| `getAttackValue()` | Refactor | Completed | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Refactor `getAttackValue(Weapon, Attack, ValName, giveDefault, asString, forTable)`.   * If/else blocks can be converted into a dictionary or objects that can be constructed through the use of tables and metatables.   20:53, 29 July 2021 (UTC) update: `getAttackValue()` has been removed and its functionality is moved to `getValue(Weapon, keyName, attackName)` using dictionaries (e.g. `GUN_KEY_MAP`) that contain simple getter functions. | 01:37, 31 May 2021 (UTC) | 20:53, 29 July 2021 (UTC) |
| `p.getRivenDispositionTable()` | Refactor | Completed | Low |  | * Optimized `p.getRivenDispositionTable()` so we don't literally have to perform over a thousand loops through each exact possible Disposition value to find weapons with that exact Disposition. * Remove `p.getRivenDispositionList()` since it is not invoked by itself on pages and was used by old `p.getRivenDispositionTable()`. | 3:42, 21 July 2021 (UTC) | 4:49, 21 July 2021 (UTC) |
| `p.buildDamageTypeTable(frame)` | Refactor | Completed | Low |  | * Use multi-line strings for table building. * Updated validate function to only get non-Kitgun weapons and only display damage type distribution of `Attack1` or the attack listed in `TooltipAttackDisplay`. * Refactored to modern programming standards. | 01:37, 31 May 2021 (UTC) | 21:54, 20 July 2021 (UTC) |
| `p.buildAutoboxCategories(frame)` | Refactor | Completed | Medium |  | Implement a map/dictionary for mapping traits and trigger types to category link. | 01:37, 31 May 2021 (UTC) | 21:54, 20 July 2021 (UTC) |
| Weapon nav | Dev | Completed | Medium | [User:FINNER](/w/User:FINNER "User:FINNER") | Add a new function that constructs the same navbox as [Template:WeaponNav](/w/Template:WeaponNav "Template:WeaponNav"). Goal is to reduce memory used by calling [Template:Weapon](/w/Template:Weapon "Template:Weapon") 400+ times on every weapon page as well as automating navbox updates whenever a new weapon is added. Right now, [Template:Weapon](/w/Template:Weapon "Template:Weapon") uses ~11MB, sometimes ~20MB on pages like [Volnus Prime](/w/Volnus_Prime "Volnus Prime").  Weapon navigation box generator resides in [Module:Weapons/nav](/w/Module:Weapons/nav "Module:Weapons/nav"). | 03:24, 5 June 2021 (UTC) | [6:07, 7 June 2021 (UTC)](https://warframe.fandom.com/wiki/Module:Weapons/nav) |
| Weapon infobox | Dev | Completed | Medium | [User:FINNER](/w/User:FINNER "User:FINNER") | Migrate wikitext from [Template:WeaponInfoboxAutomatic](/w/Template:WeaponInfoboxAutomatic "Template:WeaponInfoboxAutomatic") into a infobox builder function.   * This will probably remove the need for `getValue()` and their equilvalents.   Weapon infobox generator resides in [Module:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox"). | 01:37, 31 May 2021 (UTC) | [22:14, 8 June 2021 (UTC)](https://warframe.fandom.com/wiki/Module:Weapons/infobox?oldid=2206329) |
| High lua memory usage | Dev/Debugging | Completed | High | [User:FINNER](/w/User:FINNER "User:FINNER") | Some weapon pages have unusually high memory usage for Lua scripts, this will be problematic the moment we add new weapons to [Template:WeaponNav](/w/Template:WeaponNav "Template:WeaponNav"):   * [Latron Prime](/w/Latron_Prime "Latron Prime"): 43.13 MB/50 MB * [Astilla Prime](/w/Astilla_Prime "Astilla Prime"): 50 MB/50 MB * [Volnus Prime](/w/Volnus_Prime "Volnus Prime"): 45.11 MB/50 MB * [Rubico Prime](/w/Rubico_Prime "Rubico Prime"): 50 MB/50 MB * [Soma Prime](/w/Soma_Prime "Soma Prime"): 49.63 MB/50 MB   Normally, memory usage is ~37 MB which is why this is odd.  This issue has been fixed when we now generate [Template:WeaponNav](/w/Template:WeaponNav "Template:WeaponNav") using this module, instead of calling [Template:Weapon](/w/Template:Weapon "Template:Weapon") 400+ times per page. | 02:04, 1 June 2021 (UTC) | 18:03, 7 June 2021 (UTC) |

## Forked Repos

* <https://warframe.fandom.com/fr/wiki/Module:Weapons>
* <https://warframe.fandom.com/es/wiki/M%C3%B3dulo:Weapons>
* <https://warframe.fandom.com/it/wiki/Modulo:Weapons>
* <https://warframe.fandom.com/de/wiki/Modul:Weapons>
* <https://warframe.fandom.com/pt-br/wiki/M%C3%B3dulo:Weapons>
* <https://warframe.fandom.com/zh-tw/wiki/%E6%A8%A1%E7%B5%84:Weapons>
* <https://warframe.huijiwiki.com/wiki/%E6%A8%A1%E5%9D%97:Weapons#>

## Documentation

### Package items

`weapons._isVariant(weaponName)` (function)
:   Checks if a weapon is a variant or not.
:   **Parameter**: `weaponName` Weapon name (string)
:   **Returns**:

    * True if weapon is a variant, false otherwise (boolean)
    * Weapon's variant name or "Base" if weapon is not a variant (string)
    * Weapon name, same as weaponName (string)

`weapons._buildName(baseName, variant)` (function)
:   Builds the full name of a weapon's variant. Does not check if it exists or not.
:   **Parameters**:

    * `baseName` Weapon's base name (e.g. "Braton") (string)
    * `variant` Variant name (e.g. "Vandal"); if nil, returns base weapon name instead (string; optional)
:   **Returns**: Weapon's variant name (e.g. "Braton Vandal") (string)

`weapons._getWeapon(weaponName, pvp)` (function)
:   Returns a specific weapon table entry from `/data` or `/Conclave/data`.
:   **Parameters**:

    * `weaponName` Weapon name (string)
    * `pvp` If true, gets PvP stats of weapon instead, false otherwise; defaults to false (boolean; optional)
:   **Returns**: Weapon table (table)

`weapons._getValue(Weapon, key, attack)` (function)
:   Gets the raw value of a certain statistic of a weapon.
:   **Parameters**:

    * `Weapon` Weapon table (table)
    * `key` Name of key (string)
    * `attack` Name of attack to search through; defaults to 'Attack1' or what '\_TooltipAttackDisplay' is set to (string; optional)
:   **Returns**: Value of statistic (string, number)

`weapons._getFormattedValue(Weapon, keyName, attackName)` (function)
:   Gets the formatted value of a certain statistic of a weapon to be displayed the wiki.
:   **Parameters**:

    * `Weapon` Weapon table (table)
    * `keyName` Name of key (string)
    * `attackName` Name of attack to search through; defaults to 'Attack1' (string; optional)
:   **Returns**: Value of statistic (string)

`weapons._statReader(weap, atk)` (function)
:   Function that returns a simpler getter function, for multiple \_stat\*() calls on the same weapon/attack pair.
:   **Parameters**:

    * `weap` Weapon entry (table)
    * `atk` Attacks table index or Attack entry (number|table)
:   **Returns**: Getter function (function)

`weapons._statFormatter(weap, atk)` (function)
:   Function that returns a simpler getter function, for multiple \_stat\*() calls on the same weapon/attack pair.
:   **Parameters**:

    * `weap` Weapon entry (table)
    * `atk` Attacks table index or Attack entry (number|table)
:   **Returns**: Getter function (function)

`weapons._getWeapons(validateFunction, source, ignoreIgnore, sortFunc)` (function)
:   Returns a subset of `/data` or `/Conclave/data` based on a validation function.
:   **Parameters**:

    * `validateFunction` Function that filters out a weapon by taking in a Weapon table argument (function)
    * `source` Name of weapon entry to use (string; optional)
    * `ignoreIgnore` If true, ignores the \_IgnoreEntry flag, false otherwise; defaults to false (boolean; optional)
    * `sortFunc` Custom comparison function; false -> no sorting; defaults to sorting in ascending order by weapon name (function; optional)
:   **Returns**: Table of weapon table entries as seen in `/data` (table)

`weapons._getMeleeWeapons(weapType, pvp)` (function)
:   Returns all melee weapons. If weapType is not nil, only grab for a specific type For example, if weapType is "Nikana", only pull Nikanas.
:   **Parameters**:

    * `weapType` (boolean; optional)
    * `pvp` If true, only gets melee weapons available in Conclave, false otherwise; defaults to false (boolean; optional)
:   **Returns**: An array of melee weapon table entries as seen in `/data` (table)

`weapons.getValue(weap, atk, k)` (function)
:   Main frame invokable function to access any raw/computed attribute/column/key of a weapon entry. See default table in M:Weapons to see all valid computed attributes.
:   **Parameters**:

    * `weap` Weapon name in EN locale (string)
    * `atk` Attacks table index (number)
    * `k` Key name (string)
:   **Returns**: Raw or computed value associated with k key

`weapons.getFormattedValue(weap, atk, k)` (function)
:   Main frame invokable function to access any formatted attribute/column/key of a weapon entry. See default table in M:Weapons to see all valid computed attributes.
:   **Parameters**:

    * `weap` Weapon name in EN locale (string)
    * `atk` Attacks table index (number)
    * `k` Key name (string)
:   **Returns**: Formatted value associated with k key

`weapons.getMeleeWeaponGallery(frame)` (function)
:   Builds a melee weapon gallery as seen on [Template:MeleeCategory](/w/Template:MeleeCategory "Template:MeleeCategory").
:   **Parameter**: `frame` Frame object w/ first argumenting being string meleeClass (table)
:   **Returns**: Resultant wikitext of gallery (string)

`weapons.getWeaponCount(frame)` (function)
:   Gets the total count of weapons as used on [Mastery Rank#Total Mastery](/w/Mastery_Rank#Total_Mastery "Mastery Rank").
:   **Parameter**: `frame` Frame object w/ the first argument being the weaponSlot and the second argument being a boolean to getFullList (table)
:   **Returns**:

    * Total count of weapons in a certain category/type (number)
    * List of weapon names that count for mastery in a particular weapon slot (table)

`weapons.getWeaponCount(frame)` (function)
:   Gets the total count of weapons as used on [Mastery Rank#Total Mastery](/w/Mastery_Rank#Total_Mastery "Mastery Rank").
:   **Parameter**: `frame` Frame object w/ the first argument being the weapon slot (table)
:   **Returns**: Total number of weapons that can reward Mastery XP (number)

`weapons.getPolarityTable(frame)` (function)
:   Builds wikitable of all weapons' innate polarities as seen on [Polarity](/w/Polarity "Polarity").
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

`weapons.buildDamageTypeTable(frame)` (function)
:   Builds a table that lists out all weapons with a certain damage type
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

`weapons._shortLinkList(Weapon, tooltip)` (function)
:   Builds a list of weapons, with variants being next to base weapon name inside parentheses (e. g. [![](/images/thumb/Braton.png/32px-Braton.png?95621)](/w/Braton "Braton") [Braton](/w/Braton "Braton") (**[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: "[MK1-Braton](/w/MK1-Braton "MK1-Braton")" wasn't found in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data")**, [![](/images/thumb/BratonPrime.png/32px-BratonPrime.png?c49e4)](/w/Braton_Prime "Braton Prime") [Prime](/w/Braton_Prime "Braton Prime"))).
:   **Parameters**:

    * `Weapon` Weapon table (table)
    * `tooltip` If true, adds weapon tooltips, false otherwise; defaults to false (boolean)
:   **Returns**: Wikitext of resultant list (string)

`weapons.getMasteryShortList(frame)` (function)
:   Builds a list of weapons' mastery requirements as seen on [Template:EquipmentUnlock](/w/Template:EquipmentUnlock "Template:EquipmentUnlock"), [Template:EquipmentUnlock/Primary](/w/Template:EquipmentUnlock/Primary "Template:EquipmentUnlock/Primary"), [Template:EquipmentUnlock/Secondary](/w/Template:EquipmentUnlock/Secondary "Template:EquipmentUnlock/Secondary"), [Template:EquipmentUnlock/Melee](/w/Template:EquipmentUnlock/Melee "Template:EquipmentUnlock/Melee"), etc.
:   **Parameter**: `frame` Frame object w/ first argument being a string weaponSlot (table)
:   **Returns**: Wikitext of resultant list (string)

`weapons.getConclaveList(frame)` (function)
:   Builds a list of PvP weapons as seen on [PvP#Limitations](/w/PvP#Limitations "PvP").
:   **Parameter**: `frame` Frame object w/ first argument being a string weaponSlot (table)
:   **Returns**: Wikitext of resultant list (string)

`weapons.getRivenDispositionTable(frame)` (function)
:   Builds a disposition wikitable as seen on [Riven Mods/Weapon Dispos](/w/Riven_Mods/Weapon_Dispos "Riven Mods/Weapon Dispos").
:   **Parameter**: `frame` Frame object w/ first argument being a string weaponSlot (table)
:   **Returns**: Wikitext of resultant wikitable (string)

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

