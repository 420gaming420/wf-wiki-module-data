---
title: "Module:Weapons"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons"
wiki_timestamp: "2026-07-10T01:17:55Z"
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
* [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") - unit test suite for Module:Weapons

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [Module:StatObject](/w/Module:StatObject "Module:StatObject") as OOP paradigm | Dev | Planning | Low |  | Currently our usage of [Module:StatObject](/w/Module:StatObject "Module:StatObject") is as a static class with `statRead` and `statFormat` functions. Update Module:Weapons and [Module:StatObject](/w/Module:StatObject "Module:StatObject") so we can 'instantiate' an actual StatObject object that takes in a weapon table entry as an argument. This way we can just do:  ```lua local StatObject = require('Module:StatObject') -- Base class local WeaponData = require('Module:Weapons/data')  -- Doing some metaprogramming to extend functionality of StatObject class StatObject.default = {     Name = { nil, 'Weapon Name: %s' },  -- Sample definition for Name field getter/formatter     ... }  local BratonStatObject = StatObject(WeaponData['Braton'])  -- Get raw Name value "Braton" instead of StatObject.statRead(WeaponData['Braton'], 'Name') local name = BratonStatObject.Name -- Get formatted Name value "Weapon Name: Braton" (as defined in StatObject.default) instead of StatObject.statFormat(WeaponData['Braton'], 'Name') print(BratonStatObject.Name) mw.log(BratonStatObject.Name) local formattedName = tostring(BratonStatObject.Name) -- If the above is not possible in Lua then maybe add a __call metamethod to Name key to return its formatted value formattedName = BratonStatObject.Name() -- Or add a format() function to instantiated StatObject's metatable, passing in key name as argument formattedName = BratonStatObject:format('Name') ``` | 22:01, 5 December 2022 (UTC) |  |
| Include attack name/context in [Module:Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata") | Dev | Planning | Low |  | Update [Module:Weapons/ppdata/seeder](/w/Module:Weapons/ppdata/seeder "Module:Weapons/ppdata/seeder") to add attack names associated with the respective stats used for comparing so that [Module:Weapons/characteristics](/w/Module:Weapons/characteristics "Module:Weapons/characteristics") can add additional context to the stat comparisons. See <https://warframe.fandom.com/wiki/Quassus?commentId=4400000000003635575>. For  [Quassus](/w/Quassus "Quassus")'s case,  [Jat Kusar](/w/Jat_Kusar "Jat Kusar") has a base 35% crit chance, but since we are comparing against non-normal attacks,  [Quassus](/w/Quassus "Quassus")'s Ethereal Daggers will have second highest crit chance (30%) behind  [Tenet Exec](/w/Tenet_Exec "Tenet Exec")'s slam shockwaves (38%). | 22:09, 5 August 2022 (UTC) |  |
| Weapon and Attack classes | Refactor and Dev | Planning | Low |  | * Create a new Weapon and Attack class that can be instantiated by passing in a weapon table entry and attack table entry respectively. Each of these classes should contain a `statRead()` and `statFormat()` function that can be called to return an particular weapon stat, aggregate data, or computed stat based on `/data` contents. | 21:18, 18 January 2022 (UTC) |  |
| `ExplosionDelay` key | Refactor | Planning | Low |  | * Update this to store a table with two values: shortest delay time and longest delay time. This is to support  [Kompressa](/w/Kompressa "Kompressa")'s variable delay time. For weapons that have a single delay time, use the same value for both table elements. | 22:10, 6 January 2022 (UTC) |  |
| `Reload` key | Refactor | Planning | Low |  | * Move `Reload` key to attack tables? Nagantaka and Ambassador have two different reload times depending on attack.  * 21:35, 19 January 2022 (UTC) update: [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro") suggests that any duplicate keys nested in Attack table entries should 'override' the base values for the weapon. In this case, add a another `Reload` key under the appropriate attack that has a different value than the `Reload` key in the main weapon entry. |  |  |
| Augments in `/data` | Refactor | New | Low |  | * Remove weapon augments list from `/data` and use [Module:Mods](/w/Module:Mods "Module:Mods") and/or [Module:Mods/data](/w/Module:Mods/data "Module:Mods/data") instead to fetch augment mods data.   + Would require dev work in M:Mods/data too to index by mod type. | 01:37, 31 May 2021 (UTC) |  |
| Data validation | Dev/database | Active | Medium |  | Create `Module:Weapons/data/validate` subpage of `/data` for data validation functions   * Include type checking for each column/attribute * Include checking if a table entry has the required keys (the minimum number of keys needed to support basic features in Module:Weapons) * Include boundary checking for stat values (e.g. `CritChance` cannot be negative) | 01:37, 31 May 2021 (UTC) | 23:33, 1 August 2021 (UTC) |
| Error handling | Clean up | New | Medium |  | Change all return statements with "ERROR" to either `assert()` or `error()` to standardize error handling.   * Error messages should be in the form of "functionName(argument names): argument value 1 is not a valid number". | 01:37, 31 May 2021 (UTC) |  |
| Update database schema | Database | Active | Medium | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Reworking how attacks are stored in tables for flexibility. Should have one Attack column that contains multiple tables, each representing a unique attack for that weapon. Would probably improve/simplify [Weapon Comparison](/w/Weapon_Comparison "Weapon Comparison") and [Template:WeaponInfoboxAutomatic](/w/Template:WeaponInfoboxAutomatic "Template:WeaponInfoboxAutomatic") in displaying multiple attacks of a weapon. Right now we are hacking the use of `ChargeAttack` and `SecondaryAttack` for some attacks that are not necessarily charged or alt-fire (see [Deconstructor](/w/Deconstructor "Deconstructor")'s entry in the database). Also include forced proc data for all possible attacks (e.g. Glaives, some forced Impact weapons, etc.).  23:33, 1 August 2021 (UTC) update: There are lots of changes to these tables as I slowly create validation functions to check what keys-value pairs are needed or not, see documentation in [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc") for possible key-value pairs. Right now, attacks are stored in generic `Attack1`, `Attack2`, ... keys when we were changing the names of attack keys (e.g. `NormalAttack` became `Attack1`).  21:18, 18 January 2022 (UTC) update: [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro") implemented a new `attack` key (should be named `Attacks` to match key naming convention) that points to an array of attack tables. `Attack1` to `Attack9` keys are still in the data, just we now have a new way of indexing the same attack data by reference.  21:35, 19 January 2022 (UTC) update: `Attack1` to `Attack9` are now depreciated and removed from data tables. All optional keys are now explicitly stored in database (but are still optional b/c we set default values for getter functions in Module:Weapons. Some error clean up is still needed but for the most part, all weapon submodules and weapon tooltips should properly use `Attacks` table. | 01:50, 31 May 2021 (UTC) | 21:35, 19 January 2022 (UTC) |
| Unit tests | Testing | Archived | High | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Add unit tests in [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") for each function in Module:Weapons. See [Module:Math/testcases](/w/Module:Math/testcases "Module:Math/testcases") for examples and <https://dev.fandom.com/wiki/Global_Lua_Modules/Testharness> for documentation on how to format tests.  20:29, 31 July 2021 (UTC) update: Do not feel like it is appropriate to add unit tests using [Module:TestHarness](/w/Module:TestHarness "Module:TestHarness") to most of the functions in this module since they mostly pertain to building wikitext to display to the reader. We can add a [Module:Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases") subpage for visual tests to ensure rendered wikitext is not broken. Otherwise, I think it is more important to validate the data in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data") which are being formatted and displayed to the reader. | 02:01, 31 May 2021 (UTC) | 20:29, 31 July 2021 (UTC) |

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

* [Weapons/Conclave/data](/w/Module:Weapons/Conclave/data "Module:Weapons/Conclave/data")
* [Weapons/Conclave/data/doc](/w/Module:Weapons/Conclave/data/doc "Module:Weapons/Conclave/data/doc")
* [Weapons/Conclave/data/melee](/w/Module:Weapons/Conclave/data/melee "Module:Weapons/Conclave/data/melee")
* [Weapons/Conclave/data/melee/doc](/w/Module:Weapons/Conclave/data/melee/doc "Module:Weapons/Conclave/data/melee/doc")
* [Weapons/Conclave/data/primary](/w/Module:Weapons/Conclave/data/primary "Module:Weapons/Conclave/data/primary")
* [Weapons/Conclave/data/primary/doc](/w/Module:Weapons/Conclave/data/primary/doc "Module:Weapons/Conclave/data/primary/doc")
* [Weapons/Conclave/data/secondary](/w/Module:Weapons/Conclave/data/secondary "Module:Weapons/Conclave/data/secondary")
* [Weapons/Conclave/data/secondary/doc](/w/Module:Weapons/Conclave/data/secondary/doc "Module:Weapons/Conclave/data/secondary/doc")
* [Weapons/characteristics](/w/Module:Weapons/characteristics "Module:Weapons/characteristics")
* [Weapons/characteristics/doc](/w/Module:Weapons/characteristics/doc "Module:Weapons/characteristics/doc")
* [Weapons/compare](/w/Module:Weapons/compare "Module:Weapons/compare")
* [Weapons/compare/doc](/w/Module:Weapons/compare/doc "Module:Weapons/compare/doc")
* [Weapons/comptable](/w/Module:Weapons/comptable "Module:Weapons/comptable")
* [Weapons/comptable/doc](/w/Module:Weapons/comptable/doc "Module:Weapons/comptable/doc")
* [Weapons/csv](/w/Module:Weapons/csv "Module:Weapons/csv")
* [Weapons/csv/doc](/w/Module:Weapons/csv/doc "Module:Weapons/csv/doc")
* [Weapons/data](/w/Module:Weapons/data "Module:Weapons/data")
* [Weapons/data/archwing](/w/Module:Weapons/data/archwing "Module:Weapons/data/archwing")
* [Weapons/data/archwing/doc](/w/Module:Weapons/data/archwing/doc "Module:Weapons/data/archwing/doc")
* [Weapons/data/companion](/w/Module:Weapons/data/companion "Module:Weapons/data/companion")
* [Weapons/data/companion/doc](/w/Module:Weapons/data/companion/doc "Module:Weapons/data/companion/doc")
* [Weapons/data/credits](/w/Module:Weapons/data/credits "Module:Weapons/data/credits")
* [Weapons/data/credits/doc](/w/Module:Weapons/data/credits/doc "Module:Weapons/data/credits/doc")
* [Weapons/data/dev](/w/Module:Weapons/data/dev "Module:Weapons/data/dev")
* [Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc")
* [Weapons/data/melee](/w/Module:Weapons/data/melee "Module:Weapons/data/melee")
* [Weapons/data/melee/doc](/w/Module:Weapons/data/melee/doc "Module:Weapons/data/melee/doc")
* [Weapons/data/misc](/w/Module:Weapons/data/misc "Module:Weapons/data/misc")
* [Weapons/data/misc/doc](/w/Module:Weapons/data/misc/doc "Module:Weapons/data/misc/doc")
* [Weapons/data/modular](/w/Module:Weapons/data/modular "Module:Weapons/data/modular")
* [Weapons/data/modular/doc](/w/Module:Weapons/data/modular/doc "Module:Weapons/data/modular/doc")
* [Weapons/data/primary](/w/Module:Weapons/data/primary "Module:Weapons/data/primary")
* [Weapons/data/primary/doc](/w/Module:Weapons/data/primary/doc "Module:Weapons/data/primary/doc")
* [Weapons/data/railjack](/w/Module:Weapons/data/railjack "Module:Weapons/data/railjack")
* [Weapons/data/railjack/doc](/w/Module:Weapons/data/railjack/doc "Module:Weapons/data/railjack/doc")
* [Weapons/data/secondary](/w/Module:Weapons/data/secondary "Module:Weapons/data/secondary")
* [Weapons/data/secondary/doc](/w/Module:Weapons/data/secondary/doc "Module:Weapons/data/secondary/doc")
* [Weapons/data/validate](/w/Module:Weapons/data/validate "Module:Weapons/data/validate")
* [Weapons/data/validate/doc](/w/Module:Weapons/data/validate/doc "Module:Weapons/data/validate/doc")
* [Weapons/dev](/w/Module:Weapons/dev "Module:Weapons/dev")
* [Weapons/dev/doc](/w/Module:Weapons/dev/doc "Module:Weapons/dev/doc")
* [Weapons/doc](/w/Module:Weapons/doc "Module:Weapons/doc")
* [Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox")
* [Weapons/infobox/doc](/w/Module:Weapons/infobox/doc "Module:Weapons/infobox/doc")
* [Weapons/nav](/w/Module:Weapons/nav "Module:Weapons/nav")
* [Weapons/nav/doc](/w/Module:Weapons/nav/doc "Module:Weapons/nav/doc")
* [Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")
* [Weapons/ppdata/doc](/w/Module:Weapons/ppdata/doc "Module:Weapons/ppdata/doc")
* [Weapons/ppdata/seeder](/w/Module:Weapons/ppdata/seeder "Module:Weapons/ppdata/seeder")
* [Weapons/ppdata/seeder/doc](/w/Module:Weapons/ppdata/seeder/doc "Module:Weapons/ppdata/seeder/doc")
* [Weapons/preprocess](/w/Module:Weapons/preprocess "Module:Weapons/preprocess")
* [Weapons/preprocess/doc](/w/Module:Weapons/preprocess/doc "Module:Weapons/preprocess/doc")
* [Weapons/sandbox](/w/Module:Weapons/sandbox "Module:Weapons/sandbox")
* [Weapons/testcases](/w/Module:Weapons/testcases "Module:Weapons/testcases")
* [Weapons/testcases/doc](/w/Module:Weapons/testcases/doc "Module:Weapons/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • M:Weapons ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
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
---	'''Weapons''' contains all of [[WARFRAME]]'s [[Weapons|weapon]] data.  

--	
--	@module			weapons
--	@alias			p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@image		IconPrimaryWeaponRifle.png
--	@require	[[Module:StatObject]]
--	@require	[[Module:DamageTypes]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Math]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Version]]
--	@require	[[Module:Stances/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Weapons/Conclave/data]]
--	@release	stable
--	

-- TODO: Add LuaDoc style comments to new functions
local p = {}

local Delay = require([[Module:Delay]])
local WeaponData = Delay.require([[Module:Weapons/data]])
local WarframeData = Delay.require([[Module:Warframes/data]]) -- for use in p.getListWithWarframes
local ConclaveData = Delay.require([[Module:Weapons/Conclave/data]])
local Tooltip = Delay.require([[Module:Tooltips]]) -- full, icon
local Version = Delay.require([[Module:Version]]) -- _getVersion, _getVersionDate, _getVersionCategory
local Polarity = Delay.require([[Module:Polarity]]) -- _pols, _polarity
local Math = Delay.require([[Module:Math]]) -- formatnum
local Table = Delay.require([[Module:Table]]) -- size, skpairs
local iterationOrderArray = require([[Module:DamageTypes]]).iterationOrderArray

-- TODO: Should decouple from localized names for internationalization
local VARIANT_LIST = {
	"Prime", "Prisma", "Wraith", "Vandal", "Vaykor", "Synoid", "Telos", "Secura",
	"Sancti", "Rakta", "Mara", "Carmine", "Ceti", "Dex", "Mk1", "Kuva", "Tenet", "Coda"
}

table.unpack = table.unpack or unpack

local StatObject = require [[Module:StatObject]]
p.__StatObject = StatObject
local statRead = StatObject.statRead
local statFormat = StatObject.statFormat
local statFormatIf = StatObject.statFormatIf

local indexes = StatObject.meta.indexes
local ors = StatObject.meta.ors
local unpacks = StatObject.meta.unpacks

local passes = StatObject.meta.passes
local percent = StatObject.meta.percent
local percents = StatObject.meta.percents

---	Gets the attack entry from weapon entry.
--	@function		p._getAttack
--	@param			{table} weap Weapon entry
--	@param[opt]		{number|table} atk Attacks table index or Attack entry
--	@return			{table} A single weapon+attack struct
local function getWeaponAttack(weap, atk)
	if type(atk) == 'number' then return StatObject.getStruct2(weap,weap.Attacks[atk]) end
	if weap.AttackName then return weap end
	if type(atk) == 'table' then return StatObject.getStruct2(weap,atk) end
	local key = atk or weap['_TooltipAttackDisplay'] or 1
	if weap.Attacks == nil then
		error('p._getWeaponAttack(weap, atk): Attacks table is nil in '..mw.dumpObject(weap))
	end
	return StatObject.getStruct2(weap,weap.Attacks[key])
end
p._getAttack = getWeaponAttack
p._getWeaponAttack = getWeaponAttack

function p._statRead(w, a, ...)
	return statRead(getWeaponAttack(w, a), ...)
end
function p._statFormat(w, a, ...)
	return statFormat(getWeaponAttack(w, a), ...)
end
function p._statFormatIf(w, a, ...)
	return statFormatIf(getWeaponAttack(w, a), ...)
end
function p.stat(frame)
	return p._statFormat(p._getWeapon(frame.args[1] or 'Skana Prime'), nil, frame.args[2] or 'Name')
end

-- Defining getters/attributes whose names match the associated database key or some custom derived attribute.
-- Index key will be name of getter function and can be mapped to a single value (getter definition) 
-- or a table with two values (getter and format function definitions)

-- Cheatsheet on adding new keys:
-- StatName = default value -> Get raw value with the same StatName from M:Weapons/data and with no additional formatting (aka default formatting)
-- StatName = function(self) return self.StatName + 1 end -> Define custom getter function and use default formatting
-- StatName = { default value, '%.2f' } -> Get raw value value with same StatName from M:Weapons/data and use format string for formatting
-- StatName = { function(self) return ... end, '%.2f' } -> Define custom getter function and use format string for formatting
-- StatName = { function(self) return ... end, function(self, returnValue1, returnValue2, ...) return tostring(returnValue) end } - > Define custom getter and format functions
-- (Note that format function will pass in return value(s) from getter as well as object self)

-- TODO: Put StatObject keys in alphabetical order for navigation
StatObject.default = {
AttackName = 'Normal Attack',
AmmoCost = nil,
AmmoPickup = function(weapAtk)
	return weapAtk['AmmoPickup'] or
		weapAtk['Slot'] == 'Primary' and 80 or 
		weapAtk['Slot'] == 'Secondary' and 40 or 
		weapAtk['Slot'] == 'Archgun (Atmosphere)' and 1000 or
		0
end,
DamageBias = {
	function(weapAtk)
		if not weapAtk.Damage then
			error('DamageBias: no Attack.Damage')
			return 0, 0, 0
		end
		local total, bestdmg, bestdt = 0, 0, nil
		for dt, dmg in pairs(weapAtk.Damage) do
			local dmg = dmg
			if dmg >= bestdmg then
				bestdmg, bestdt = dmg, dt
			end
			total = total + dmg
		end
		return StatObject.ucacheIn(weapAtk, 'DamageBias', { bestdmg / total, bestdt, total })
	end,
	{ percent, passes(function(damageType)
		return Tooltip.full(damageType, 'DamageTypes')
	end), '' }
},
BiasPortion = { indexes('DamageBias', 1), percent },
BiasType = { indexes('DamageBias', 2), function(self, biasType) return Tooltip.icon(biasType, 'DamageTypes') end },
BaseDamage = { indexes('DamageBias', 3), '%.2f' },
-- More precise damage values to 4 decimal places for PvP since PvP damage is calculated
-- based on a floating-point scalar. Damage quantization is more relevant in PvP so more
-- precise numbers needed.
BaseDamageWithProgenBonus = { function(weapAtk)
	return statRead(weapAtk, 'BaseDamage') * (statRead(weapAtk, 'IsLichWeapon') and 1.6 or 1)
end, passes(Math.formatnum)
},
PvPBaseDamage = { indexes('DamageBias', 3), '%.4f' },
TotalDamage = { function(weapAtk)
	return statRead(weapAtk, 'BaseDamage') * statRead(weapAtk, 'Multishot')
end, passes(Math.formatnum)
},
-- Including max +60% Progenitor bonus for Kuva/Tenet weapons
TotalDamageWithProgenBonus = { function(weapAtk)
	return statRead(weapAtk, 'TotalDamage') * (statRead(weapAtk, 'IsLichWeapon') and 1.6 or 1)
end, passes(Math.formatnum)
},
ChargeTime = { 0, '%.2f s' },
ExplosionDelay = { 0, '%.2f s' },
ExtraHeadshotDmg = { 0, percents('+%.2f%%') },
Falloff = {
	function(weapAtk)
		local fo = weapAtk['Falloff'] or {}
		-- min damage at max falloff distance = base damage * (1 - max damage reduction from falloff) 
		local minBaseDmg = statRead(weapAtk, 'BaseDamage') * (1 - (fo.Reduction or 0))
		return
			fo.StartRange or 0,	-- falloff start distance
			fo.EndRange or math.huge,	-- falloff end distance
			1 - (fo.Reduction or 0),	-- % of original damage at max falloff
			minBaseDmg	-- flat scalar of min damage at max falloff
	end,
	function(self, startRange, endRange, maxReduction, minBaseDmg)
		local maxReductionPercent = Math.percentage(maxReduction)
		local baseDmg = minBaseDmg / maxReduction
		return ([[
No Damage Falloff: below %.1f m (100%%, %1.0f damage)  

Linear Falloff: between %.1f m and %.1f m (100%% - %s)  

Max Damage Falloff: over %.1f m (%s, %1.0f damage)
		]]):format(startRange, baseDmg,
				startRange, endRange, maxReductionPercent,
				endRange, maxReductionPercent, minBaseDmg
			)
	end
},
FalloffStart = { indexes('Falloff', 1), '%.1f m' },
FalloffEnd = { indexes('Falloff', 2), '%.1f m' },
-- Damage at the edge of falloff
FalloffMinDamage = { function(weapAtk)
	local fo = weapAtk['Falloff'] or {}
	local minBaseDmg = statRead(weapAtk, 'BaseDamage') * (1 - (fo.Reduction or 0))
	return minBaseDmg
	end, passes(Math.formatnum)
},
-- Damage reduction from falloff instead of damage multiplier
FalloffReduction = { function(weapAtk)
	local _, _, falloff = statRead(weapAtk, 'Falloff')
	return 1 - falloff
end, percent
},
FalloffRate = { function(weapAtk)
	local startdist, enddist, endpercent = statRead(weapAtk, 'Falloff')
	return -(enddist-startdist) / (endpercent-1)
end, '%.1fm/%%'
},
HeadshotMultiplier = { 1, '%.1fx' },
IncarnonCharges = 0,
Multishot = 1,
PunchThrough = { 0, '%.1f m' },
ShotSpeed = { nil, function(self, shotSpeed)
	if shotSpeed == nil then
		return 'N/A'
	end
	return ('%.1f m/s'):format(shotSpeed)
end
},
BurstDelay = { 0, '%.4f s' },
BurstReloadDelay = { 0, '%.2f s' },
BurstsPerSec = { function(weapAtk)
	-- There is no delay after last shot in burst
	return 1 / ( (1 / statRead(weapAtk, 'FireRate') ) + statRead(weapAtk, 'BurstDelay') * ( statRead(weapAtk, 'BurstCount') - 1) )
end, '%.2f bursts/sec' },
CritChance = { 0, percent },
CritMultiplier = { 1, '%.2fx' },
ForcedProcs = { {}, function(s, procs)
	if procs[1] == nil then
		return 'No forced procs'
	end
	local result = {}
	for _, proc in ipairs(procs) do
		table.insert(result, Tooltip.full(proc, 'DamageTypes'))
	end
	return table.concat(result, ', ')
end
},
Radius = { 0, '%.1f m' },
StatusChance = { 0, percent },
Disposition = {
	function(weap)
		local dispo = weap['Disposition']
		-- Returning a categorical bin value of 1, 2, 3, 4, or 5 based on where disposition value
		-- is on the continuous scale of 0.5-1.55. If disposition value is nil then return 0
		return dispo or 0, type(dispo)=='number' and math.floor(5* (dispo - .3 + .009 * (dispo < 1 and 1 or -1))) or 0
	end,
	function(s, dispoVal, dispoClass)
		return StatObject.default.Dispo[2](s, dispoClass)..(' (%.2fx)'):format(dispoVal)
	end
},
Dispo = { indexes('Disposition', 2), function(s, d)
	if d and d == d and d > 0 then
		return ('●'):rep(math.min(d, 5))..('○'):rep(5 - d)
	end
	return '×××××' -- '●○×' --> E2978F E2978B C397
end },
Introduced = { function(weap)
	return weap['Introduced'] and Version._getVersion(weap['Introduced'])['Name'] or 'N/A'
end, passes(Version._getVersionLink)
},
IntroducedDate = function(weap)
	return weap['Introduced'] and Version._getVersionDate(weap['Introduced']) or 'N/A'
end,
IsLichWeapon = function(weap)
	return weap['IsLichWeapon'] and true or false
end,
Mastery = 0,
Link = { nil, '[[%s]]' },
Name = { nil, function(s, v) return Tooltip.full(v, 'Weapons') end },
IncarnonChargeGain = 0,
IncarnonDuration = { 0, '%s s' },
InternalName = '',
NameLink = { function(weap) return weap.Link, weap.Name end, '[[%s|%s]]' },
Polarities = { nil, passes(Polarity._pols) },
Traits = { unpacks('Traits'), { sep = ', ' } },
UniqueTrait = {
	function(weap)
		local trait = weap.UniqueTrait
		if not trait then return nil, nil, nil end
		return trait.Image, trait.Name, trait.Description
	end,
	function(self, image, name, description)
		if not image and not name and not description then return '' end
		return ([=[

|  |  |
| --- | --- |
| %s | Unique Trait |
| %s |

%s]=])
			:format('[[File:'..(image or 'PassiveAbility.png')..'|32xpx]]', name or '', description)
	end
},
-- Default nil b/c some attacks don't have an associated accuracy/spread value (like AoE explosions)
Accuracy = { nil, function(self, value)
	return value or 'N/A'
end
},
AccuracyBucket = {function(weapAtk)
	local minSpread = statRead(weapAtk, 'MinSpread')
	if not minSpread then
		return
	elseif minSpread <= 1 then
		return 1
	elseif minSpread <= 3 then
		return 2
	elseif minSpread <= 6 then
		return 3
	elseif minSpread <= 10 then
		return 4
	else -- minSpread > 10
		return 5
	end
end, function(self, bucket)
	-- TODO: Localize accuracy strings (e.g. 'Very High') instead of hard-coding
	return ({
		'Very High',
		'High',
		'Medium',
		'Low',
		'Very Low',
	})[bucket] or 'N/A'
end},
-- Inverse of accuracy. Spread of 1 equates to no spread.
-- Alternatively, it can be calculated by the average of min and max spread, see AvgSpread getter.
Spread = { function(weapAtk)
	local accuracy = statRead(weapAtk, 'Accuracy')
	return (accuracy == nil) and nil or 100 / accuracy
end, function(self, value)
	if (value == nil) then
		return 'N/A'
	end
	return value
end
},
AmmoType = function(weapAtk)
	return weapAtk['AmmoType'] or ({
		['Archgun (Atmosphere)'] = 'Heavy',
		['Secondary'] = 'Secondary',
		['Primary'] = 'Primary'
	})[weapAtk['Slot']] or 'None'
end,
-- Not all weapons have an Exilus slot so default to nil
ExilusPolarity = { nil, function(self, exilusPolarity)
	if (exilusPolarity == nil) then
		return 'N/A'
	end
	return Polarity._polarity(exilusPolarity)
end
},
Magazine = 1,
AmmoMax = { function(weapAtk)
	if statRead(weapAtk, 'IsMelee') then
		return nil
	end
	return weapAtk['AmmoMax'] or math.huge
end, passes(Math.formatnum)
},
Range = { function(weapAtk)
	return weapAtk['Range'] or statRead(weapAtk, 'ShotType') == 'Hit-Scan' and 300 or 0
end, '%.1f m'
},
Reload = { ors('Reload', 'RechargeTime', 0), '%.2f s' },
RechargeTime = { function(weapAtk)
	return statRead(weapAtk, 'ReloadStyle'):find'[Rr]egen' and statRead(weapAtk, 'Magazine') / statRead(weapAtk, 'ReloadRate') or nil
end, '%.2f s'
},
ReloadRate = { 0, '%.2f rounds/sec' },	-- Used for rechargeable weapons; not necessarily inverse of reload time b/c of presence of reload delay
ReloadDelay = { function(weapAtk)
	return weapAtk['ReloadDelay'] or 0
end, '%.2f s'
},
ReloadDelayEmpty = { ors('ReloadDelayEmpty', 'ReloadDelay'), '%.2f s' },
-- Reload speed will be calculated as the inverse of reload time for purposes
-- of keeping how we rank stats consistent for [[Module:Weapons/preprocess]]
-- (larger number = higher stat; a short reload time can be expressed as fast reload 
-- speed which would be a larger value in magnitude)
ReloadSpeed = { function(weapAtk)
	return 1 / statRead(weapAtk, 'Reload')
end, function(str, reloadSpeed)
	return string.format('%.2f%% reload progress per second', reloadSpeed * 100)
end },
ReloadStyle = 'Magazine',
Spool = { 0, '%d rounds' },
SpoolStartFireRate = { 0, '%.1fx' },	-- scalar that is applied to fire rate stat for auto-spool weapons
AvgSpread = { function(weapAtk)
	local minSpread = statRead(weapAtk, 'MinSpread')
	local maxSpread = statRead(weapAtk, 'MaxSpread')
	return minSpread and (minSpread + maxSpread) / 2
end, function(self, value)
	return value and ('%.2f°'):format(value) or 'N/A'
end},
-- Default nil b/c some attacks don't have an associated accuracy/spread value (like AoE explosions)
MinSpread = { nil, function(self, value)
	return value and ('%.2f°'):format(value) or 'N/A'
end},
MaxSpread = { nil, function(self, value)
	return value and ('%.2f°'):format(value) or 'N/A'
end},
Trigger = 'N/A',
BlockAngle = { 0, '%d°' },
ComboDur = { 0, '%.1f s' },
FollowThrough = { 0, '%.1fx' },
HeavyAttack = { 0, passes(Math.formatnum) },
HeavySlamAttack = { 0, passes(Math.formatnum) },
HeavySlamElement = { nil, function(self, value)
	return value ~= nil and Tooltip.full(value, 'DamageTypes') or 'Same damage type distribution as normal attack'
end
},
HeavySlamForcedProcs = { nil, function(self, proc)
	if type(proc)=='table' then
		local result = {}
		for _, elem in ipairs(proc) do
			table.insert(result, Tooltip.full(elem, 'DamageTypes'))
		end
		return table.concat(result, '  
')
	else
		return 'N/A'
	end
end
},
HeavySlamRadius = { 0, '%.1f m' },
MeleeRange = { 0, '%.2f m' },
SlamAttack = { 0, passes(Math.formatnum) },
SlamElement = { nil, function(self, value)
	return value ~= nil and Tooltip.full(value, 'DamageTypes') or 'Same damage type distribution as Normal Attack'
end
},
-- Slam attack forced proc(s)
SlamForcedProcs = { nil, function(self, proc)
	if type(proc)=='table' then
		local result = {}
		for _, elem in ipairs(proc) do
			table.insert(result, Tooltip.full(elem, 'DamageTypes'))
		end
		return table.concat(result, '  
')
	else
		return 'N/A'
	end
end
},
SlamRadius = { 0, '%.1f m' },
SlideAttack = { function(weapAtk)
	return weapAtk.SlideAttack or 0, statRead(weapAtk, 'SlideElement')
end, function(self, dmg, elem)
	if elem then
		return Tooltip.icon(elem, 'DamageTypes')..' '..Math.formatnum(dmg)
	end
	return Math.formatnum(dmg)
end
},
SlideElement = { nil, function(self, value)
	return value ~= nil and Tooltip.full(value, 'DamageTypes') or 'Same damage type distribution as Normal Attack'
end
},
--[[Stances = function(weapAtk)
	if not statRead(weapAtk, 'IsMelee') then return end
	return Stances._getAllStancesSameType(statRead(weapAtk, "Class"))
	--			 ^ currently a local function
end,--]]
-- Not all weapons have an Stance slot so default to nil
StancePolarity = { nil, function(self, stancePolarity)
	if (stancePolarity == nil) then
		return 'N/A'
	end
	return Polarity._polarity(stancePolarity)
end
},
SweepRadius = { 0, '%.2f m' },
WindUp = { 0, '%.1f s' },
BurstCount = 1,
-- Average crit/proc count from a single attack input
AvgCritCount = function(weapAtk)
	return statRead(weapAtk, 'CritChance') * statRead(weapAtk, 'Multishot')
end,
AvgCritPerSec = function(weapAtk)
	return statRead(weapAtk, 'AvgCritCount') * statRead(weapAtk, 'EffectiveFireRate')
end,
AvgProcCount = function(weapAtk)
	return ( statRead(weapAtk, 'StatusChance') + Table.size(weapAtk['ForcedProcs'] or {}) ) * statRead(weapAtk, 'Multishot')
end,
AvgProcPerSec = function(weapAtk)
	return statRead(weapAtk, 'AvgProcCount') * statRead(weapAtk, 'EffectiveFireRate')
end,
InterShotTime = function(weapAtk)
	local v = statRead(weapAtk, 'Magazine') == 1 and statRead(weapAtk, 'Reload') + statRead(weapAtk, 'ReloadDelayEmpty') or 0
	if v == 0 then v = 1 / statRead(weapAtk, 'FireRate') end
	return v
end,
EffectiveFireRate = function(weapAtk)
	return 1 / ( statRead(weapAtk, 'ChargeTime') + statRead(weapAtk, 'InterShotTime') )
end,
ShotsPerMag = function(weapAtk)
	-- Default to 1 "ammo cost" even if attack does not directly consume ammo (e.g. AoE hits, speargun throws, etc.)
	return math.floor(statRead(weapAtk, 'Magazine') / (statRead(weapAtk, 'AmmoCost') or 1))
end,
FireRate = { function(weapAtk)
	local dataFireRate = weapAtk['FireRate']
	if dataFireRate then return dataFireRate end
	-- TODO: Think we can safely remove this calculation of FireRate from BurstFireRate, BurstDelay, and BurstCount
	-- for burst-fire attacks since FireRate is also included for those
	mw.log('calculating FireRate from Burst stats for '..statRead(weapAtk, 'Name'))
	local count = statRead(weapAtk, 'BurstCount')
	local fireRate = count / (1 / statRead(weapAtk, 'BurstFireRate') + count * statRead(weapAtk, 'BurstDelay'))
	return fireRate
end, '%.2f attacks/sec'	-- Note: that some fire rate values go to 3 decimal places as internally stored
},
BurstFireRate = { function(weapAtk)
	return 1 / statRead(weapAtk, 'BurstDelay')
end, '%.2f attacks/sec'
},
--[[
Describing what happens when a gun in WARFRAME is fired using player-made terminology:

A particular gun consumes a set number of ammo in order to fire a set number of shots
on a single player input for a particular attack.

A single player input is defined as:
* a single attack button press for semi-auto and burst trigger weapons
* the moment the next shot is being fired when the attack button is being held for automatic/held trigger weapons
* the action of holding the attack button for charge trigger weapons
* for duplex-fire trigger weapons, the hold and release of the attack button counts as two inputs

A shot is defined as the base unit of attack of a weapon when unmodded.
* A single attack input can launch several shots as in the case of burst-fire weapons.
* A single shot can shoot more than one projectile, affected by the multishot stat, as in the case of shotguns.
* A single shot can consume more than one unit of ammo (e.g. Tenora's alt-fire) or 
less than one unit of ammo (e.g. Ignis and most continuous weapons).

A gun can have multiple attacks which can be triggered using different buttons 
and/or types of button inputs (e.g. pressing vs. holding)
]]--
CalcDamage = function(weapAtk)
	local weapon, attack = weapAtk, weapAtk
	-- Count
	-- How many shots are fired in a single player input
	local tapShots = statRead(weapAtk, 'BurstCount')
	-- How many individual player inputs can occur before depleting a magazine
	local magTaps = statRead(weapAtk, 'ShotsPerMag')
	-- How many additional projectiles are fired per ammo
	local multishot = statRead(weapAtk, 'Multishot')
	-- How much ammo is contained in the magazine
	local magazine = statRead(weapAtk, 'Magazine')
	-- How much ammo can be drawn from reserves (or?, how much ammo can be used without picking up more)
	local ammoMax = statRead(weapAtk, 'AmmoMax')

	-- Time^-1
	local fireRate = statRead(weapAtk, 'FireRate')
	-- Time
	local shotTime = statRead(weapAtk, 'InterShotTime')
	local chargeTime = statRead(weapAtk, 'ChargeTime')
	local burstDelayTime = statRead(weapAtk, 'BurstDelay')
	local reloadDelayTime = statRead(weapAtk, 'ReloadDelayEmpty')
	local reloadTime = statRead(weapAtk, 'Reload')
	local tapTime = chargeTime + (tapShots - 1) * burstDelayTime
	-- tapTime: The time between the last shot fired and the next valid attack input
	-- (omitting latency of course).
	-- Note that first shot of any non-charge trigger attack is instantenous
	local magDepletionTime = magTaps * tapTime
	if magDepletionTime == 0 then -- If attack is a charged attack
		if shotTime == 0 then
			shotTime = 1 / fireRate
		end
		magDepletionTime = magTaps / fireRate
	end
	local shotDelayTime = math.max(0, shotTime - tapTime)

	-- Multiplier
	local maxProgenitorBonus = statRead(weapAtk, 'IsLichWeapon') and 1.6 or 1
	local avgCritMult = 1 + (statRead(weapAtk, 'CritMultiplier') - 1) * statRead(weapAtk, 'CritChance')
	-- Damage
	local biasPortion, biasType, hitDamage = statRead(weapAtk, 'DamageBias')
	
	-- TODO: Not accounting for Railjack MkII, MkIII, and MkIV turret max bonuses in Fire Rate or Elemental Damage
	local avgDmgOnTap = hitDamage * avgCritMult * multishot * tapShots * maxProgenitorBonus
	-- TODO: Not accurate for Incarnon Form b/c using Magazine not IncarnonCharges
	local avgDmgPerMag = avgDmgOnTap * magTaps
	
	-- 1 is needed b/c one whole magazine is not included in reserve ammo count
	-- If there is no reserve ammo, that means that weapon can deal an infinite amount of damage theoretically
	local avgLifetimeDmg = (ammoMax ~= nil) and avgDmgPerMag * (1 + (ammoMax / magazine)) or math.huge
	
	-- Damage / Time
	local baseDps = hitDamage * multishot / shotTime
	local avgSustainedDps = avgDmgPerMag / (magDepletionTime + reloadDelayTime + reloadTime) / tapShots
	local avgBurstDps = avgDmgOnTap / (tapTime + shotDelayTime) / tapShots
	-- Note that burst DPS can also be calculated as such:
	-- local avgBurstDps = (hitDamage * avgCritMults * maxProgenitorBonus) * multishot / shotTime
	-- local avgBurstDps = avgDmgPerMag / magDepletionTime
	
	return StatObject.ucacheIn(weapAtk, 'CalcDamage',
			{ hitDamage, avgDmgOnTap, avgBurstDps, avgSustainedDps, avgLifetimeDmg, baseDps, avgDmgPerMag }
	)
end,
ShotDmg = indexes('CalcDamage', 1),	-- Total damage per projectile
AvgShotDmg = indexes('CalcDamage', 2), AvgTapDmg = indexes('CalcDamage', 2),	-- Average total damage per each input button
BurstDps = indexes('CalcDamage', 3),	-- Average burst damage per second/DPS w/o reloading
SustainedDps = indexes('CalcDamage', 4),	-- Average sustained damage per second/DPS w/ reloading
LifetimeDmg = indexes('CalcDamage', 5),	-- Average total damage from entire ammo pool
BaseDps = indexes('CalcDamage', 6),	-- Base damage per second w/ multishot w/o crit
MagDmg = indexes('CalcDamage', 7),	-- Average total damage per magazine
-- Average damage scaled by melee attack speed multiplier (numerator of melee DPS w/o accounting for stances and animation time)
AvgDmgWithAnimSpeedMulti = function(weapAtk)
	if statRead(weapAtk, 'IsMelee') then
		return statRead(weapAtk, 'BurstDps')
	end
	return 0
end,
AttackSpeed = { --[[ors('AttackSpeed', 'FireRate')]]function(weapAtk)
	if not statRead(weapAtk, 'IsMelee') then
		error('AttackSpeed: Cannot get AttackSpeed attribute for a non-melee weapon; use p.statRead(weapAtk, "FireRate") instead')
	end
	return statRead(weapAtk, 'FireRate')
end, '%.3fx animation speed'
},
IsArchwing = function(weapAtk) return statRead(weapAtk, 'Slot'):find('Archmelee') or statRead(weapAtk, 'Slot'):find('Archgun') ~= nil end,
IsMelee = function(weapAtk) return statRead(weapAtk, 'Slot'):find('Melee') or statRead(weapAtk, 'Slot'):find('melee') ~= nil end,
IsSilent = ors('IsSilent', 'IsMelee', false),
-- Note: NoiseLevel may not be binary state in-game (maybe concept of ranged noise levels)
NoiseLevel = function(weapAtk)
	local isSilent = statRead(weapAtk, 'IsSilent')
	if isSilent == true then
		return 'SILENT'
	elseif isSilent == false then
		return 'ALARMING'
	else
		return 'UNKNOWN'
	end
end,
HasAoEAttack = function(weap)
	for i, attackEntry in pairs(weap['Attacks']) do
		if attackEntry['ShotType'] == 'AoE' then
			return true
		end
	end
	return false
end,
Conclave = false,
Image = { 'Panel.png', '[[File:%s|link=]]' },
Attacks = ors('Attacks', p._getAttack, {}),
Family = nil,
FamilyList = { function(weapAtk)
	local family = statRead(weapAtk, 'Family')
	-- assert(family, 'i have no Family :\'(')
	if not family then return {weapAtk} end
	-- return family, statRead(weapAtk, 'Slot')
	local slot = statRead(weapAtk, 'Slot')
	local result = {}
	for _, w in pairs(WeaponData[slot] or error('FamilyList: no weapondata for slot '..(slot or ''))) do
		if w.Family == family then
			table.insert(result, w)
		end
	end
	table.sort(result, function(a,b) return a.Name	return result
end, function(self, result)
	for i,w in ipairs(result) do
		result[i]=Tooltip.full(w.Name, 'Weapons', w)
	end
	return table.concat(result, '  
')
end
},
BaseName = function(weapAtk) return weapAtk['BaseName'] or ({p._getVariant(statRead(weapAtk, 'Name'))})[3] end,
-- TODO: Add comments to Explosion function for readability
-- TODO: Do not rely on attack name to determine what AoE component is attached to which main direct hit component
---^i suggest an explosion key with either the attack number of any corresponding explosion, nested attack tables, or some other way to make a tree
-- TODO: Use ShotType = "AoE" to determine if attack entry is AoE
Explosion = function(weapAtk)
	local weap, atk = weapAtk, weapAtk
	-- tbh this is a mess
	local explosion = weapAtk['Explosion'] or statRead(weapAtk, 'AttackName'):gsub(' Impact',''):gsub(' Contact','')..' Explosion'
	if type(explosion) == 'string' then
		explosion = weap.Attacks[tonumber(explosion:gsub('%D',''))] or explosion
	elseif type(explosion) == 'number' then
		explosion = weap.Attacks[explosion] or explosion
	end
	local explosions = {}
	if type(explosion) ~= 'table' then
		for i, v in ipairs(weap.Attacks) do
			if p._statRead(weapAtk, v, 'AttackName'):find 'xplosion' then
				if p._statRead(weapAtk, v, 'AttackName') == explosion then
					explosions[1] = nil
					explosion = v
					break
				end
				table.insert(explosions, v)
			end
		end
		explosion = explosions[1] or explosion
	end
	StatObject.pcacheIn(getWeaponAttack(weap, explosion), 'BaseAttack', atk)
	return StatObject.pucacheIn(weapAtk, 'Explosion', explosion)
end,
IsVariant = function(weap)
	return StatObject.pucacheIn(weap, 'IsVariant', p._isVariant(statRead(weap, 'Name')))
end,
Variant = indexes('IsVariant', 2),
BaseName = indexes('IsVariant', 3),
Categories = { function(weapAtk)
	local cats = { 'Weapons' }
	
	for ver in Version._getVersionCategory(weapAtk['Introduced']):gmatch("%[%[Category:(.-)%]%]") do
		table.insert(cats, ver)
	end
	
	local TRAIT_CATEGORY_MAP = {
		Baro = "Baro Ki'Teer Weapons",
		-- Readers were confused on how to interpret "Duviri Weapon" category; a weapon that is obtainable in Duviri vs. Duviri-themed weapons (e.g. Hespar being the latter)
		Duviri = 'Duviri-Themed Weapons',
	}
	-- Adding editor-defined traits from M:Weapons/data
	-- Note to make sure they have a proper category page associated with a trait
	for _, trait in ipairs(weapAtk.Traits or {}) do
		if (trait ~= '') then
			if (TRAIT_CATEGORY_MAP[trait] ~= nil) then
				table.insert(cats, TRAIT_CATEGORY_MAP[trait])
			else
				table.insert(cats, trait..' Weapons')
			end
		end
	end
--[=[
local CATEGORY_MAP = {
	Primary = 'Primary Weapons',
	Secondary = 'Secondary Weapons',
	Melee = 'Melee Weapons',
	['Archmelee'] = 'Archwing Melee',
	['Archgun'] = 'Archwing Gun',
	['Archgun (Atmosphere)'] = 'Archwing Gun',
	Kitgun = 'Kitgun',
	Zaw = 'Zaw',
	['Railjack Turret'] = 'Railjack',
	['Railjack Armament'] = 'Railjack',
	Gear = 'Gear',
	
	Rifle = 'Assault Rifle',
	['Sniper Rifle'] = 'Sniper Rifle',
	Shotgun = 'Shotgun',
	Pistol = 'Pistol',
	['Dual Pistols'] = 'Dual Pistols',
	Bow = 'Bow',
	Launcher = 'Launcher',
	['Arm-Cannon'] = 'Arm-Cannon',
	['Speargun'] = 'Speargun',
	Thrown = 'Thrown',
	['Shotgun Sidearm'] = 'Shotgun Sidearm',
	
	Prime = 'Prime Weapons',
	['Never Vaulted'] = 'Never Vaulted',
	Vaulted = 'Vaulted',
	Wraith = 'Wraith',
	Vandal = 'Vandal',
	['Kuva Lich'] = 'Kuva Lich',
	['Kuva Lich'] = 'Kuva',
	Prisma = 'Prisma',
	
	Grineer = 'Grineer Weapons',
	Corpus = 'Corpus Weapons',
	Infested = 'Infested Weapons',
	Tenno = 'Tenno Weapons',
	Sentient = 'Sentient Weapons',
	Entrati = 'Entrati Weapons',
	Baro = 'Baro Ki\'Teer Offering',
	Syndicate = 'Syndicate Offerings',
	['Invasion Reward'] = 'Invasion Reward',
	
	['Alt Fire'] = 'Weapons with Alt Fire',
	['AoE'] = 'Weapons with Area of Effect]][[Category:Self Interrupt Weapons',
	
}
--]=]
	local bias = p._getValue(weapAtk, "BiasType")
	table.insert(cats, bias..' Damage Weapons')
	
	-- TODO: Update this when a new weapon class is added
	local class = p._getValue(weapAtk, "Class")
	table.insert(cats, ({
		["Arm Cannon"] = class,
		["Bow"] = class,
		["Crossbow"] = "Bow",
		["Dual Pistols"] = class,
		["Dual Shotguns"] = class,
		["Exalted Weapon"] = class,
		["Launcher"] = class,
		["Pistol"] = class,
		["Rifle"] = class,
		["Shotgun Sidearm"] = class,
		["Shotgun"] = class,
		["Sniper Rifle"] = class,
		["Speargun"] = class,
		["Thrown"] = class,
		["Tome"] = class,
		["Assault Saw"] = class,
		Bayonet = class,
		["Blade and Whip"] = class,
		Claws = class,
		Dagger = class,
		["Dual Daggers"] = class,
		["Dual Nikanas"] = class,
		["Dual Swords"] = class,
		Fist = class,
		Glaive = class,
		Gunblade = class,
		Hammer = class,
		["Heavy Blade"] = class,
		["Heavy Scythe"] = class,
		Machete = class,
		Nikana = class,
		Nunchaku = class,
		Polearm = class,
		Rapier = class,
		Scythe = class,
		Sparring = class,
		Staff = class,
		Sword = class,
		["Sword and Shield"] = class,
		["Two-Handed Nikana"] = class,
		Tonfa = class,
		Warfan = class,
		Whip = class,
		["Archgun"] = 'Archwing Gun',
		["Archgun (Atmosphere)"] = 'Archwing Gun',
		["Archmelee"] = 'Archwing Melee',
		["Turret"] = 'Railjack Armaments',
		["Ordnance"] = 'Railjack Armaments',
		Amp = class
	})[class] or "Other Weapons")

	local family = p._getValue(weapAtk, "Family")
	table.insert(cats, family)
	
	local slot = p._getValue(weapAtk, "Slot")
	table.insert(cats, slot..' Weapons')
	
	-- TODO: Move all these trigger categories to be in the format "Category:Trigger Name Weapons"
	local trigger = p._getValue(weapAtk, "Trigger")
	if (trigger ~= 'N/A') then
		table.insert(cats, trigger..' Weapons')
	end
	-- TODO: remove original trigger cats? (following snippet)
	table.insert(cats,(({
		["Active"] = trigger,
		["Auto Charge"] = 'Charge',
		["Auto"] = 'Automatic',
		["Auto-Burst"] = 'Burst Fire',
		["Auto-Spool"] = 'Automatic',
		["Burst"] = 'Burst Fire',
		["Charge"] = trigger,
		["Duplex"] = 'Duplex Fire',
		["Held"] = 'Continuous Weapons',
		["Semi-Auto"] = 'Semi-Automatic',
		["N/A"] = 'Weapons With No Trigger Type'
	})[trigger]))--modes? " Weapons"?
	
	local users = p._getValue(weapAtk, "Users") or {}
	for _, user in ipairs(users) do table.insert(cats, user) end
	
	local variant = p._getValue(weapAtk, "Variant")
	table.insert(cats, variant)
	
	local infAmmo = p._getValue(weapAtk, "AmmoMax") == math.huge
	local accuracy = p._getValue(weapAtk, "Accuracy")
	local pinpoint = accuracy ~= nil and accuracy >= 100
	local regens = p._getValue(weapAtk, "ReloadRate") > 0
	local silent = weapAtk.IsSilent -- automatically includes
	local single = p._getValue(weapAtk, "Magazine") == 1 and not p._getValue(weapAtk, "IsMelee")--meh, delet?
	local spools = p._getValue(weapAtk, "Spool") > 0
	
	local isHitScan = p._getValue(weapAtk, "ShotType") == "Hit-Scan"
	local isProjectile = p._getValue(weapAtk, "ShotType") == "Projectile"
	local isAoE = p._getValue(weapAtk, "HasAoEAttack")
	local isCodexSecret = p._getValue(weapAtk, "CodexSecret")
	local isTradable = p._getValue(weapAtk, "Tradable")
	local isInConclave = p._getValue(weapAtk, "Conclave")
	
	-- Arbitrarily ordering misc categories
	if infAmmo then table.insert(cats, 'Infinite Ammo Weapons') end
	if pinpoint then table.insert(cats, 'Pinpoint Weapons') end
	if regens then table.insert(cats, 'Battery Weapons') end
	if silent then
		table.insert(cats, 'Silent Weapons')
	else
		table.insert(cats, 'Alarming Weapons')
	end
	if single then table.insert(cats, 'Single Shot Weapons') end
	if spools then table.insert(cats, 'Spooling Weapons') end
	if isHitScan then table.insert(cats, 'Hit-Scan Weapons') end
	if isProjectile then table.insert(cats, 'Projectile Weapons') end
	if isAoE then table.insert(cats, 'Weapons with Area of Effect') end
	if isCodexSecret then table.insert(cats, 'Codex Secret') end
	if isTradable then
		table.insert(cats, 'Tradeable Weapons')
	else
		table.insert(cats, 'Untradeable Weapons')
	end
	if isInConclave then table.insert(cats, 'Available In Conclave') end
	
	return StatObject.cacheIn(weapAtk, 'Categories', cats)
end, function(s, cats)
	local wikitextResult = { '' }	-- Need to prepend a newline so first asterisk is rendered as a wikitext list
	local formatStr = '*[[:Category:%s|%s]][[Category:%s]]'
	for _, category in ipairs(cats) do
		table.insert(wikitextResult, formatStr:format(category, category, category))
	end
	return table.concat(wikitextResult, '\n')
end
},
SyndicateEffect = { '', function(s, v)
	return (v == '' or type(v) ~= 'string') and '' or Tooltip.icon(({
		['blight'] = 'Red Veil',
		['entropy'] = 'Cephalon Suda',
		['justice'] = 'Steel Meridian',
		['purity'] = 'New Loka',
		['sequence'] = 'The Perrin Sequence',
		['truth'] = 'Arbiters of Hexis',
	})[v:lower()] or 'Tenno', 'Factions')
	..' '..v
end
},
MinProgenitorBonus = function(weap) return weap.IsLichWeapon and statRead(weap, 'BaseDamage') * 0.25 or 0 end,
ProgenitorBonus = function(weap) return weap.IsLichWeapon and statRead(weap, 'BaseDamage') * 0.6 or 0 end,
Class = '',
SniperComboReset = { nil, '%.1f s' },
SniperComboMin = { nil, '%d shot(s)' },
Tradable = { function(weapAtk)
	if type(weapAtk['Tradable'])=='number' then
		assert(weapAtk['Tradable']<=5,
			'Tradable: Does not support tradeability enums beyond 5; please update [[Module:Weapons/data]] and [[Module:Weapons]] to support more tradeability edge cases')
		return ({
			[0]=false,
			[1]='Unranked',
			[2]='Parts',
			[3]='Lich',
			[4]='Built Parts',
			[5]='Parent',
		})[weapAtk['Tradable']]
	end
	return weapAtk['Tradable']
end, function(s, tradable)
	return ({ 
		[false] = 'Untradeable',
		Unranked = 'Tradeable unranked w/ no Forma or Catalyst',
		Parts = 'Tradeable parts and/or blueprint only',
		Lich = 'Tradeable indirectly through [[Lich System|Lich]] trading',
		['Built Parts'] = 'Tradeable only fully built components, not blueprints',
		Parent = 'Tradeable indirectly, comes with parent companion',
	})[tradable] or 'Untradeable?'
end
},
SellPrice = { nil, function(self, sellPrice)
	if sellPrice == nil then
		return 'Cannot sell'
	end
	return Tooltip.icon('Credits', 'Resources')..' '..Math.formatnum(sellPrice)
end
},
DefaultUpgrades = { nil, function(self, upgradesArr)
	local result = {}
	for _, modIndex in ipairs(upgradesArr or {}) do
		table.insert(result, Tooltip.full(modIndex, 'Mods'))
	end
	return table.concat(result, '  
')
end
},
Users = { nil, function(self, usersArr)
	local result = { '' }
	for _, user in ipairs(usersArr or {}) do
		table.insert(result, '*[['..user..']]')
	end
	return table.concat(result, '\n')
end
},
Zoom = { unpacks('Zoom'), { sep = '  
' } },
Slot = nil,
}
-- Loops for adding to StatObject.default table
-- Damage type getters:
--  = damage type value
-- Distribution = damage type distribution as a percentage
-- PvP = damage type value with precise formatting for PvP purposes
for _, damageType in ipairs(iterationOrderArray) do
	StatObject.default[damageType] = {
		function(weapAtk) return weapAtk['Damage'][damageType] or 0 end,
		function(self, value) return Tooltip.icon(damageType, 'DamageTypes')..' '..Math.formatnum(value) end
	}
	-- Damage distribution as a percentage
	StatObject.default[damageType..'Distribution'] = {
		function(weapAtk) return weapAtk['Damage'][damageType] / statRead(weapAtk, 'BaseDamage') end,
		function(self, value) return Tooltip.icon(damageType, 'DamageTypes')..' '..Math.percentage(value) end
	}
	-- More precise damage values to 4 decimal places for PvP
	StatObject.default['PvP'..damageType] = {
		function(weapAtk) return weapAtk['Damage'][damageType] or 0 end,
		Tooltip.icon(damageType, 'DamageTypes')..' %.4f'
	}
end

-- TODO: Do not rely on localized name to determine a weapon's variant. Decouple localization from data
---	Checks if a weapon is a variant or not.
--	@function		p._isVariant
--	@param			{string} weaponName Weapon name
--	@returns		{boolean} True if weapon is a variant, false otherwise
--	@returns		{string} Weapon's variant name or "Base" if weapon is not a variant
--	@returns		{string} Weapon name, same as weaponName
function p._isVariant(weaponName)
	for i, var in pairs(VARIANT_LIST) do
		if (var ~= "Dex" or weaponName ~= "Dex Pixia") then
			if string.find(weaponName, var) then
				return true, var, (string.gsub(weaponName, " ?"..var.." ?-?", ""))
			end
		end
	end
	return false, "Base", weaponName
end

---	Builds the full name of a weapon's variant. Does not check if it exists or not.
--	@function		p._buildName
--	@param			{string} baseName Weapon's base name (e.g. "Braton")
--	@param[opt]		{string} variant Variant name (e.g. "Vandal"); if nil, returns base weapon name instead
--	@returns		{string} Weapon's variant name (e.g. "Braton Vandal")
function p._buildName(baseName, variant)
	if not variant or variant == 'Base' or variant == '' then
		return baseName
	end
	return (({
		-- Prime Laser Rifle is an edge case for Prime naming scheme (at least in EN localization)
		Prime =  baseName ~= 'Laser Rifle' and '%b %v',
		Vandal = '%b %v',
		Wraith = '%b %v',
		MK1 = '%v-%b',
	})[variant] or '%v %b'):gsub('%%v', variant):gsub('%%b', baseName)
end

---	Returns a specific weapon table entry from /data or /Conclave/data.
--	@function		p._getWeapon
--	@param			{string} weaponName Weapon name
--	@param[opt]		{boolean} pvp If true, gets PvP stats of weapon instead, false otherwise; defaults to false
--	@returns		{table} Weapon table
function p._getWeapon(weaponName, pvp)
	weaponName = mw.text.decode(weaponName)
	return (pvp and ConclaveData or WeaponData)[weaponName] or
	error('p._getWeapon(weaponName, pvp): "'..weaponName..
		'" does not exist in '..(pvp and '[[Module:Weapons/Conclave/data]]' or '[[Module:Weapons/data]]'))
end

---	Gets the raw value of a certain statistic of a weapon.
--	@function		p._getValue
--	@param			{table} Weapon Weapon table
--	@param			{string} key Name of key
--	@param[opt]		{string} attack Name of attack to search through; defaults to 'Attack1' or what '_TooltipAttackDisplay' is set to
--	@returns		{string, number} Value of statistic
function p._getValue(weap, key, atk)--, formatted)
	-- return (formatted and statFormat or statRead)(weap, atk, key)
	return p._statRead(weap, atk, key)
end

---	Gets the formatted value of a certain statistic of a weapon to be displayed
--	the wiki.
--	@function		p._getFormattedValue
--	@param			{table} Weapon Weapon table
--	@param			{string} keyName Name of key
--	@param[opt]		{string} attackName Name of attack to search through; defaults to 'Attack1'
--	@returns		{string} Value of statistic
function p._getFormattedValue(weap, key, atk)
	-- return p._getValue(Weapon, keyName, attackName, true)
	return p._statFormat(weap, atk, key)
end

--- Function that returns a simpler getter function, for multiple _stat*() calls on the same weapon/attack pair.
--	@function		p._statReader
--	@param			{table} weap Weapon entry
--	@param			{number|table} atk Attacks table index or Attack entry
--	@return			{function} Getter function
function p._statReader(weap, atk)
	return function(...) return p._statRead(weap, atk, ...) end
end

--- Function that returns a simpler getter function, for multiple _stat*() calls on the same weapon/attack pair.
--	@function		p._statFormatter
--	@param			{table} weap Weapon entry
--	@param			{number|table} atk Attacks table index or Attack entry
--	@return			{function} Getter function
function p._statFormatter(weap, atk)
	return function(...) return p._statFormat(weap, atk, ...) end
end

---	Returns a subset of /data or /Conclave/data based on a validation function.
--	@function		p._getWeapons
--	@param			{function} validateFunction Function that filters out a weapon by taking in a Weapon table argument
--	@param[opt]		{string} source Name of weapon entry to use
--	@param[opt]		{boolean} ignoreIgnore If true, ignores the _IgnoreEntry flag, false otherwise; defaults to false
--	@param[opt]		{function} sortFunc Custom comparison function; false -> no sorting; defaults to sorting in ascending order by weapon name
--	@returns		{table} Table of weapon table entries as seen in /data
function p._getWeapons(validateFunction, source, opts)
	opts=opts or {}
	local ignoreIgnore, sortFunc, pvp = opts.ignoreIgnore, opts.sortFunc, opts.pvp
	validateFunction = validateFunction or function() return true end
	local data = pvp and ConclaveData or WeaponData
	if source then
		data = data[source]
	end

	local weaps = {}
	for _, weap in pairs(data) do
		if (ignoreIgnore or not weap['_IgnoreEntry']) and validateFunction(weap) then
			table.insert(weaps, weap)
		end
	end
	if sortFunc ~= false then
		table.sort(weaps, sortFunc or function(a, b) return a.Name < b.Name end)
	end
	return weaps
end

---	Returns all melee weapons. If weapType is not nil, only grab for a specific type
--	For example, if weapType is "Nikana", only pull Nikanas.
--	@function		p._getMeleeWeapons
--	@param[opt]		{boolean} weapType
--	@param[opt]		{boolean} pvp If true, only gets melee weapons available in Conclave, false otherwise; defaults to false
--	@returns		{table} An array of melee weapon table entries as seen in /data
function p._getMeleeWeapons(weapType,pvp)
	return p._getWeapons(weapType and function(weap) return weap.Class==weapType end, 'melee',{['pvp']=pvp==true})
end

---	Main frame invokable function to access any raw/computed attribute/column/key of a weapon entry.
--	See default table in M:Weapons to see all valid computed attributes.
--	@function		p.getValue
--	@param			{string} weap Weapon name in EN locale
--	@param			{number} atk Attacks table index
--	@param			{string} k Key name
--	@return			Raw or computed value associated with k key
function p.getValue(frame)
	-- table.unpack doesn't work on the frame object which is why this is anonymous function is needed
	local weap, key, atk = (function(t) return t[1], t[2], t[3] end)(frame.args)
	weap = p._getWeapon(weap)
	return p._getValue(weap, key, atk)
end

---	Main frame invokable function to access any formatted attribute/column/key of a weapon entry.
--	See default table in M:Weapons to see all valid computed attributes.
--	@function		p.getFormattedValue
--	@param			{string} weap Weapon name in EN locale
--	@param			{number} atk Attacks table index
--	@param			{string} k Key name
--	@return			Formatted value associated with k key
function p.getFormattedValue(frame)
	local weap, key, atk = (function(t) return t[1], t[2], t[3] end)(frame.args)
	weap = p._getWeapon(weap)
	return p._getFormattedValue(weap, key, atk)
end

---	Builds a melee weapon gallery as seen on [[Template:MeleeCategory]].
--	@function		p.getMeleeWeaponGallery
--	@param			{table} frame Frame object w/ first argumenting being string meleeClass
--	@returns		{string} Resultant wikitext of gallery
function p.getMeleeWeaponGallery(frame)
	local meleeClass = frame.args[1] or ''
	local result = { "=="..meleeClass.." Weapons==", '' }
	for i, weap in ipairs(p._getMeleeWeapons(meleeClass)) do
		table.insert(result, p._statRead(weap, nil, 'Image')..'|'..p._statFormat(weap, nil, 'Name'))
	end
	table.insert(result, '')
	return frame:preprocess(table.concat(result, '\n')) -- annoying that it needs to be preprocessed
end

---	Gets the total count of weapons as used on [[Mastery Rank#Total Mastery]].
--	@function		p.getWeaponCount
--	@param			{table} frame Frame object w/ the first argument being the weaponSlot and the
--						  second argument being a boolean to getFullList
--	@returns		{number} Total count of weapons in a certain category/type
--	@returns		{table} List of weapon names that count for mastery in a particular weapon slot
function p._getWeaponCount(slot)
	slot = slot and slot:lower()
	local data = slot and WeaponData[slot] or WeaponData
	local fullList = {}
	
	for name, weapon in pairs(data) do
		if not weapon._IgnoreEntry and not weapon._IgnoreInMasteryCount then
			-- TODO: There should be a better way to determine/differentiate if a weapon is a kitgun b/c kitguns and zaws
			-- are stored in the same M:Weapons/data/modular data store; add a new "Kitgun" or "Zaw" Trait and target that?
			if (slot == 'kitgun' and weapon.Slot == 'Secondary')
				or (slot == 'zaw' and weapon.Slot == 'Melee')
				or (slot == 'robotic' and weapon.Slot ~= 'Hound')
				or (weapon.Slot:lower() == slot)
				or slot == nil then
				fullList[#fullList + 1] = name
			end
		end
	end

	return #fullList, fullList
end

---	Gets the total count of weapons as used on [[Mastery Rank#Total Mastery]].
--	@function		p.getWeaponCount
--	@param			{table} frame Frame object w/ the first argument being the weapon slot
--	@return			{number} Total number of weapons that can reward Mastery XP
function p.getWeaponCount(frame)
	return (p._getWeaponCount(frame.args and frame.args[1] or nil))
end

---	Builds wikitable of all weapons' innate polarities as seen on [[Polarity]].
--	@function		p.getPolarityTable
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.getPolarityTable(frame)
	local colNames = { 'Primary', 'Secondary', 'Melee', 'Archgun', 'Archmelee' }
	local cols = {}	-- Will look like: {['Primary']={},['Secondary']={},['Melee']={},['Archgun']={},['Archmelee']={},}
	local colOrder = {}	--{cols['Primary'],cols['Secondary'],cols['Melee'],cols['Archgun'],cols['Archmelee'],}
	local colCounts = {}

	for i, v in ipairs(colNames) do
		cols[v] = {}
		colOrder[i] = cols[v]
		colCounts[v] = 0
	end

	for _, weapon in pairs(WeaponData) do
		local pols = Table.size(weapon["Polarities"] or {})
		local slot = weapon['Slot']
		if pols > 0 and cols[slot] then
			table.insert(cols[slot], {
				'|'..p._getFormattedValue(weapon, 'NameLink'):gsub(' ?%(.*%)', '')..'||'..p._getFormattedValue(weapon, "Polarities"),
				pols
			})
			colCounts[slot] = colCounts[slot] + 1
		end
	end

	for i, v in ipairs(colNames) do
		colCounts[i] = colCounts[v]
		table.sort(cols[v], function(a, b)return a[2] > b[2] end)
	end

	local result = {[=[
{| style="width: 100%; border-collapse: collapse;" cellpadding="2" border="1"
|+ '''Weapons with Innate Polarities (ignoring Stance and Exilus slots)'''
! colspan="2" |Primaries
! colspan="2" |Secondaries
! colspan="2" |Melees
! colspan="2" |Archguns
! colspan="2" |Archmelees]=]}
	for i = 1, math.max(table.unpack(colCounts)) do --row
		table.insert(result, '|-')
		for _, col in ipairs(colOrder) do --cell
			table.insert(result,(col[i] or {'| ||'})[1])
		end
	end
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

---	Builds a table that lists out all weapons with a certain damage type
--	@function		p.buildDamageTypeTable
--	@param			{table} frame Frame object
--	@returns		{string} Wikitext of resultant wikitable
function p.buildDamageTypeTable(frame)
	local damageType = frame.args and frame.args[1] or frame
	local mostly = frame.args and (frame.args[2] or '') ~= ''

	local content = {}
	for k,weap in pairs(WeaponData) do
		local weapAtk = getWeaponAttack(weap)--could add a loop here
		local portion, biastype, damage = statRead(weapAtk, 'DamageBias')
		local typeDmg = statRead(weapAtk, damageType)
		if damage == 0 then typeDmg = weapAtk[damageType] and 1 or 0 end--modular pieces
		--Filter for
		--a. any of the damage type in any attack - former 'not mostly'
		--b. at least one majority damage type - former 'mostly'
		--c. a majority of the damage type in the display attack - 'mostly'
		--d. any of the damage type in the display attack - 'not mostly'
		if biastype == damageType or not mostly and typeDmg > 0 then
			table.insert(content, ('| %s || %s || %s || %s || %s || data-sort-value="%s" | %s'):format(
				statFormat(weapAtk, 'Name'),
				statRead(weapAtk, 'Slot'),
				statRead(weapAtk, 'Class'),
				statRead(weapAtk, 'AttackName'),
				typeDmg,
				portion, statFormat(weapAtk, 'DamageBias')
			))
		end
	end
	table.sort(content)--will sort by tooltip span key

	return ([[
{| class = "wikitable sortable mw-collapsible"
|+ '''Weapons with innate %s%s damage'''
|-
! Name !! Slot !! Class !! Attack Name !! data-sort-type="number" | %s !! data-sort-type="number" | Highest %% Damage Type
|-
]]):format(mostly and 'mostly ' or '', damageType, Tooltip.full(damageType, 'DamageTypes'))
	..table.concat(content, '\n|-\n')..'\n|}'
end

--- _isVariant adapter for p._shortLinkList
local function variantOf(weap)
	local full, _, var, base = weap.Name, p._isVariant(weap.Name)
	return var, base, full
end

---	Builds a list of weapons, with variants being next to base weapon name inside parentheses
--	(e.g. {{Weapon|Braton}} ({{Weapon|MK1-Braton|MK1}}, {{Weapon|Braton Prime|Prime}})).
--	@function		p._shortLinkList
--	@param			{table} Weapon Weapon table
--	@param			{boolean} tooltip If true, adds weapon tooltips, false otherwise; defaults to false
--	@returns		{string} Wikitext of resultant list
function p._shortLinkList(Weapons, tooltip)
	return StatObject.shortLinkList(Weapons, variantOf, tooltip and 'Weapons')
end

---	Builds a list of weapons' mastery requirements as seen on [[Template:EquipmentUnlock]],
--	[[Template:EquipmentUnlock/Primary]], [[Template:EquipmentUnlock/Secondary]], 
--	[[Template:EquipmentUnlock/Melee]], etc.
--	@function		p.getMasteryShortList
--	@param			{table} frame Frame object w/ first argument being a string weaponSlot
--	@returns		{string} Wikitext of resultant list
function p.getMasteryShortList(frame)
	local weaponSlot = frame.args[1]
	local masteryRank = tonumber(frame.args[2])
	local weapArray = p._getWeapons(function(x)
		return x.Slot == weaponSlot and x.Mastery == masteryRank
	end)
	return table.concat(StatObject.shortLinkList(weapArray, variantOf, 'Weapons'), ' • ')
end

function p.fullList()
	return table.concat(StatObject.shortLinkList(WeaponData, variantOf, 'Weapons'), ' • ')
end

---	Builds a list of PvP weapons as seen on [[PvP#Limitations]].
--	@function		p.getConclaveList
--	@param			{table} frame Frame object w/ first argument being a string weaponSlot
--	@returns		{string} Wikitext of resultant list
function p.getConclaveList(frame)
	local weaponSlot = frame.args[1] or 'All'
	local weapArray = p._getWeapons(function(weap)
		return weap.Conclave == true
	end, weaponSlot, {pvp=true})
	return '*'..table.concat(StatObject.shortLinkList(weapArray, variantOf), '\n* ')
end

function p.getListWithWarframes(frame)
	local list = {'{| class="listtable sortable" style="overflow-y:scroll; max-height:500px"', '|-', '!data-sort-type="date"| Release !! style=width:300px;" | Weapon !! Warframes'}

	local frames = {}
	local weapons = {}
	for _, warframe in pairs(WarframeData.Warframes) do
		if warframe.Introduced then
			local version = Version._getVersion(warframe.Introduced)['ShortName']
			frames[version] = frames[version] or {}
			table.insert(frames[version], Tooltip.full(_, 'Warframes', warframe))
		end
	end
	
	for _, weapon in pairs(WeaponData) do
		if weapon.Introduced then
			local version = Version._getVersion(weapon.Introduced)['ShortName']
			weapons[version] = weapons[version] or {}
			table.insert(weapons[version], Tooltip.full(_, 'Weapons', weapon))
		end
	end

	for version, weapon in pairs(weapons) do
		local warframe = frames[version] or {'N/A'}
		table.sort(warframe)
		
		local date_str = Version._getVersionDate(version)

		table.insert(list, '|-')
		table.insert(list,
			'|data-sort-value=' .. date_str:sub(6, 7) .. '.' .. date_str:sub(9, 10) .. '.' .. date_str:sub(0, 4) .. 
			'|' .. Version.getVersionLink(version) .. ' ||' .. table.concat(weapon, ', ') .. '||' .. table.concat(warframe, ', ')
		)
	end
	table.insert(list, '|}')

	return table.concat(list, '\n')
end

---	Builds a disposition wikitable as seen on [[Riven Mods/Weapon Dispos]].
--	@function		p.getRivenDispositionTable
--	@param			{table} frame Frame object w/ first argument being a string weaponSlot
--	@returns		{string} Wikitext of resultant wikitable
function p.getRivenDispositionTable(frame)
	local weaponSlot = frame.args[1]
	local result = {
		'{| class="article-table" border="0" cellpadding="1" cellspacing="1" style="width: 100%"',
		'|-',
		{'[[a| '},	-- Wikitable header row
		'|-'
	}

	-- local ranges = {'○○○○○', '●○○○○', '●●○○○', '●●●○○', '●●●●○', '●●●●●'}
	local dispo = {}

	for k, weapon in pairs(WeaponData) do
		if weapon['Disposition'] and (weaponSlot == 'All' or weapon['Slot'] == weaponSlot) then
			local disp = p._statFormat(weapon, nil, 'Dispo')
			dispo[disp] = dispo[disp] or {}
			table.insert(dispo[disp], weapon)
		end
	end

	for str, dis in Table.skpairs(dispo) do
		table.sort(dis, function(a, b) return a['Disposition'] > b['Disposition'] end)
		local col = { '| style="vertical-align:top; font-size:small" |' }
		for _, weap in ipairs(dis) do
			table.insert(col, p._statFormat(weap, nil, 'NameLink')..' ('..weap['Disposition']..')')
		end
		table.insert(result[3], str)
		table.insert(result, table.concat(col, '\n* '))
	end

	result[3] = table.concat(result[3], ']]\n! scope="col" style="text-align:center;"|[[Riven Mods#Disposition|')..']]'
	table.insert(result, '|}')
	return table.concat(result, '\n')
end

return p
```

