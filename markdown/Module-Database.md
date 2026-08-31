---
title: "Module:Database"
wiki_url: "https://wiki.warframe.com/w/Module/Database"
wiki_timestamp: "2022-01-20T20:15:16Z"
---

**Database** contains helper methods for creating and maintaining `/data` subpages on the wiki that act as databases. For convention, we will use MongoDB's terminology for NoSQL-like databases and mapping them to wiki equilvalents:

* Database - a `/data` subpage containing data in the form of Lua tables
* Collection - a Lua table that contains data entries of a similar category
* Document - a Lua table entry, the basic unit of data

A database can have multiple collections and a collection can have multiple documents. Likewise, a `/data` subpage can have multiple Lua tables that can have multiple data entries.

In most cases, when viewing `/data` contents as a tree structure, a "database" refers to the Level 1 (root) table, a "collection" refers to Level 2 table(s), and a "document" refers to any tables from Level 3 and beyond (nested table entries).

For example:  `return { ["Collection 1 Name"] = { ["Document 1 Index"] = { SomeKey = 1, AnotherKey = { "Some Data" } }, ["Document 2 Index"] = { SomeKey = 2, AnotherKey = { "More Data" } } }, ["Collection 2 Name"] = { ["Document 3 Index"] = { SomeKey = 3, DifferentKey = true } } }`

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
local Database = require('Module:Database')
```

## Documentation

### Package items

`database._createIndex(database, collectionNames, indexKey)` (function)
:   Adding an index key to table entries. Key to be indexed by must exist in all table entries and not have a nil value.
:   **Parameters**:

    * `database` A Lua table in a `/data` subpage (table)
    * `collectionNames` A table of collection names to only add new indexes to; if collection does not exist, creates a new table in database (table)
    * `indexKey` Key to be indexed by; must not be a key nested within a table value in a document (string)
:   **Returns**: Updated database with new indexes (table)

`database._indexByInternalName(database, collectionNames)` (function)
:   Adding another index key that maps InternalNames to table entries for module use. Direct invokes from articles should index by localized name.
:   **Parameters**:

    * `database` A Lua table in a `/data` subpage (table)
    * `collectionNames` A table of collection names to only add new indexes to (table)
:   **Returns**: Updated database with new indexes (table)

`database._indexByLocalizedName(database, collectionNames)` (function)
:   Adding another index key that maps Names to table entries for article use.
:   **Parameters**:

    * `database` A Lua table in a `/data` subpage (table)
    * `collectionNames` A table of collection names to only add new indexes to (table)
:   **Returns**: Updated database with new indexes (table)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Database/doc](/w/Module:Database/doc "Module:Database/doc")

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
| Wiki-Unique | M:Database • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''Database''' contains helper methods for creating and maintaining /data
--	subpages on the wiki that act as databases.
--	
--	For convention, we will use MongoDB's terminology for NoSQL-like databases and
--	mapping them to wiki equilvalents:
--	* Database - a /data subpage containing data in the form of Lua tables
--	* Collection - a Lua table that contains data entries of a similar category
--	* Document - a Lua table entry, the basic unit of data
--	
--	A database can have multiple collections and a collection can have multiple documents.
--	Likewise, a /data subpage can have multiple Lua tables that can have multiple data entries.
--	
--	In most cases, when viewing /data contents as a tree structure, 
--	a "database" refers to the Level 1 (root) table, a "collection" refers to Level 2 table(s),
--	and a "document" refers to any tables from Level 3 and beyond (nested table entries).
--	
--	For example:
--	` return {
--		["Collection 1 Name"] = {
--			["Document 1 Index"] = {
--				SomeKey = 1,
--				AnotherKey = { "Some Data" }
--			},
--			["Document 2 Index"] = {
--				SomeKey = 2,
--				AnotherKey = { "More Data" }
--			}
--		},
--		["Collection 2 Name"] = {
--			["Document 3 Index"] = {
--				SomeKey = 3,
--				DifferentKey = true
--			}
--		}
--	}`
--	
--	@module			database
--	@alias			p
--	@author			[[User:Cephalon Scientia]]
--	@attribution	
--	@require		
--	@release		beta
--	

local p = {}

-- TODO: Could honestly just be used to update metatables of database tables (__index metamethod) but the issue is that
-- would require all mw.loadData() calls be replaced with require(). Or make a new database class that contains these indexes
-- and instantiate database objects in all /data subpages

---	Adding an index key to table entries. Key to be indexed by must exist in all table entries and not have a nil value.
--	@function		p._createIndex
--	@param			{table} database A Lua table in a /data subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to; 
--											if collection does not exist, creates a new table in database
--	@param			{string} indexKey Key to be indexed by; must not be a key nested within a table value in a document
--	@return			{table} Updated database with new indexes
function p._createIndex(database, collectionNames, indexKey)
	assert(database ~= nil and collectionNames ~= nil and indexKey ~= nil, 
			'p.createIndex(database, collectionNames, indexKey): all arguments must not be nil')
	assert(type(database) == "table", 'p.createIndex(database, collectionNames, indexKey): database must be a table')
	assert(type(collectionNames) == "table", 'p.createIndex(database, collectionNames, indexKey): collectionNames must be a table')
	assert(type(indexKey) == "string", 'p.createIndex(database, collectionNames, indexKey): indexKey must be a string')
	
	for _, collectionName in ipairs(collectionNames) do
		if (database[collectionName] == nil) then
			database[collectionName] = {}
		end
		for _, document in ipairs(database[collectionName]) do
			local indexValue = document[indexKey]
			assert(indexValue ~= nil, 
					'p.createIndex(database, collectionNames, indexKey): "'..indexKey..'" key missing for '..mw.dumpObject(document))
			
			-- If index key contains an array-like table value, all table elements will be valid indexes
			-- to document
			for _, value in ipairs(type(indexValue) == 'table' and indexValue or { indexValue }) do
				database[collectionName][value] = document
			end
		end
	end
	return database
end

---	Adding another index key that maps InternalNames to table entries for
--	module use. Direct invokes from articles should index by localized name.
--	@function		p._indexByInternalName
--	@param			{table} database A Lua table in a /data subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to
--	@return			{table} Updated database with new indexes
function p._indexByInternalName(database, collectionNames)
	return p._createIndex(database, collectionNames, "InternalName")
end

---	Adding another index key that maps Names to table entries for
--	article use.
--	@function		p._indexByLocalizedName
--	@param			{table} database A Lua table in a /data subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to
--	@return			{table} Updated database with new indexes
function p._indexByLocalizedName(database, collectionNames)
	return p._createIndex(database, collectionNames, "Name")
end

return p
```

