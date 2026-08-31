---
title: "Module:Enemies/data"
wiki_url: "https://wiki.warframe.com/w/Module/Enemies/data"
wiki_timestamp: "2026-04-09T01:56:45Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Enemies/data?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Finishing seeding database with all enemy entries

Database for all [enemies](/w/Enemy "Enemy") in [WARFRAME](/w/WARFRAME "WARFRAME"). Enemy drop tables can be updated on [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data").

Enemy damage data based on <https://docs.google.com/spreadsheets/d/1sS0OYvBXBkAsUGnlnBzyCA6GSTvLYfQzXka1plH7kxg/edit?usp=sharing> credit to [User:ArbitraryMary](/w/User:ArbitraryMary "User:ArbitraryMary").

:   *Last updated: Thu, 09 Apr 2026 01:56:45 +0000 (UTC) by [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro") ([change log](https://wiki.warframe.com/w/Module:Enemies/data?diff=0))*

## Contents

* [1 Horizontal Partitions (and where to update data)](#Horizontal_Partitions_(and_where_to_update_data))
* [2 Enemy Entry Schema](#Enemy_Entry_Schema)
  + [2.1 General Subtable Schema](#General_Subtable_Schema)
  + [2.2 Stats Subtable Schema](#Stats_Subtable_Schema)
    - [2.2.1 Attacks Subtable Schema](#Attacks_Subtable_Schema)

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Enemies/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* [Module:Enemies/data/grineer](/w/Module:Enemies/data/grineer "Module:Enemies/data/grineer") - [![](/images/thumb/IconGrineerOn%28xWhite%29.png/32px-IconGrineerOn%28xWhite%29.png?28616)](/w/Grineer "Grineer") [Grineer](/w/Grineer "Grineer") enemies
* [Module:Enemies/data/corpus](/w/Module:Enemies/data/corpus "Module:Enemies/data/corpus") - [![](/images/thumb/IconCorpusOn%28xWhite%29.png/32px-IconCorpusOn%28xWhite%29.png?9a680)](/w/Corpus "Corpus") [Corpus](/w/Corpus "Corpus") enemies
* [Module:Enemies/data/infestation](/w/Module:Enemies/data/infestation "Module:Enemies/data/infestation") - [![](/images/Infestation%28xWhite%29.svg?f34ff)](/w/Infested "Infested") [Infested](/w/Infested "Infested") enemies
* [Module:Enemies/data/orokin](/w/Module:Enemies/data/orokin "Module:Enemies/data/orokin") - [![](/images/thumb/IconOrokinOn%28xWhite%29.png/32px-IconOrokinOn%28xWhite%29.png?07e7d)](/w/Orokin "Orokin") [Orokin](/w/Orokin "Orokin") enemies
* [Module:Enemies/data/sentient](/w/Module:Enemies/data/sentient "Module:Enemies/data/sentient") - [![](/images/thumb/SentientFactionIcon%28xWhite%29.png/32px-SentientFactionIcon%28xWhite%29.png?19c23)](/w/Sentient "Sentient") [Sentient](/w/Sentient "Sentient") enemies
* [Module:Enemies/data/stalker](/w/Module:Enemies/data/stalker "Module:Enemies/data/stalker") - [![](/images/thumb/StalkerSigil%28SxWhite%29.png/32px-StalkerSigil%28SxWhite%29.png?d3bc8)](/w/Stalker "Stalker") [Stalker](/w/Stalker "Stalker") enemies
* [Module:Enemies/data/narmer](/w/Module:Enemies/data/narmer "Module:Enemies/data/narmer") - [![](/images/thumb/IconNarmer%28xWhite%29.png/32px-IconNarmer%28xWhite%29.png?1337d)](/w/Narmer "Narmer") [Narmer](/w/Narmer "Narmer") enemies
* [Module:Enemies/data/themurmur](/w/Module:Enemies/data/themurmur "Module:Enemies/data/themurmur") - [![](/images/thumb/MurmurIcon%28xWhite%29.png/32px-MurmurIcon%28xWhite%29.png?e4daf)](/w/The_Murmur "The Murmur") [The Murmur](/w/The_Murmur "The Murmur") enemies
* [Module:Enemies/data/scaldra](/w/Module:Enemies/data/scaldra "Module:Enemies/data/scaldra") - [![](/images/thumb/ScaldraIcon%28xWhite%29.png/32px-ScaldraIcon%28xWhite%29.png?55f29)](/w/Scaldra "Scaldra") [Scaldra](/w/Scaldra "Scaldra") enemies
* [Module:Enemies/data/techrot](/w/Module:Enemies/data/techrot "Module:Enemies/data/techrot") - [![](/images/thumb/TechrotIcon%28xWhite%29.png/32px-TechrotIcon%28xWhite%29.png?5b58e)](/w/Techrot "Techrot") [Techrot](/w/Techrot "Techrot") enemies
* [module:Enemies/data/anarchs](/w/Module:Enemies/data/anarchs "Module:Enemies/data/anarchs") - [![](/images/thumb/IconAnarchs%28xWhite%29.png/32px-IconAnarchs%28xWhite%29.png?f3538)](/w/Anarchs "Anarchs") [Anarchs](/w/Anarchs "Anarchs") enemies
* [Module:Enemies/data/unaffiliated](/w/Module:Enemies/data/unaffiliated "Module:Enemies/data/unaffiliated") - Enemies that don't fit into any of the previous partitions (e.g. [![](/images/thumb/IconWild%28xWhite%29.png/32px-IconWild%28xWhite%29.png?e17ff)](/w/Wild "Wild") [Wild](/w/Wild "Wild"), [![](/images/thumb/DuviriIcon.png/32px-DuviriIcon.png?f714f)](/w/Duviri "Duviri") [Duviri](/w/Duviri "Duviri"))

Please also update the corresponding [Codex](/w/Codex "Codex") entry for enemy units on [Module:Codex/data](/w/Module:Codex/data "Module:Codex/data").

## Enemy Entry Schema

[[edit source](/w/Module:Enemies/data/doc?action=edit&section=T-2 "Edit section's source code: Enemy Entry Schema")]

```lua
		["Heavy Gunner"] = {
			General = {
            	Abilities = { "Seismic Shockwave" },
				Actor = "",
				CodexSecret = false,
				Description = "High damage minigun",
				Faction = "Grineer",
				Image = "HeavyGunnerDE.png",
				Introduced = "Vanilla",
				Missions = {},
 				Planets = {},
				Scans = 3,
  				TileSets = { "Grineer Asteroid", "Grineer Galleon", "Grineer Shipyard", "Orokin Moon" },
				Type = "Ranged",
				Weapons = { "Gorgon", "Sheev" },
			},
			Stats = {
				Health = 300,
				Shield = 0,
				Armor = 500,
                Overguard = 0,
				Affinity = 500,
				BaseLevel = 8,
				SpawnLevel = 8,
				Multis = { "Head: 3.0x" },
				ProcResists = {},
			}
		},
```

### General Subtable Schema

[[edit source](/w/Module:Enemies/data/doc?action=edit&section=T-3 "Edit section's source code: General Subtable Schema")]

```lua
			General = {
				Abilities = { "Seismic Shockwave" },
				Actor = "",
				CodexSecret = false,
				Description = "Codex description of enemy",
				Faction = "Grineer",
				Missions = {},
				Image = "EnemyImage.png",
				InternalName = "",
				Introduced = "29",
				Link = "Page Name",
				Name = "Enemy Name",
 				Planets = {},
				Scans = 3,
				Type = "Ranged",
 				Weapons = { "Gorgon", "Sheev" },
			},
```

| Key/Column Name | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- |
| `Abilities` | N/A | Table (of strings) | ❌ | Array of abilities names | `{}` |
| `Actor` | N/A | String | ❌ | Voice actor of enemy | `"[DE]Rebecca"` |
| `CodexSecret` | `CodexSecret` | Boolean | ✔️ | Whether or not the enemy has an entry in the Codex before the player scans it; defaults to false | `true` |
| `Description` | `ShortDesc` | String | ❌ | Description of enemy as seen in the [Codex](/w/Codex "Codex") | `"High damage minigun"` |
| `ExcludedFromSimulacrum` | `ExcludedFromSimulacrum` | Boolean | ❌ | Whether or not the enemy cannot be spawned in the [Simulacrum](/w/Simulacrum "Simulacrum") | `true` |
| `Faction` | `Faction` | String | ✔️ | Associated [Faction](/w/Faction "Faction") | `"Corpus"` |
| `FactionDamageOverride` | N/A | String | ❌ | Override for enemies with different faction resistance value instead of that usually matches their faction. | `"Grineer"` |
| `Image` | `Icon` | String | ✔️ | Image file name of the enemy as uploaded to the wiki. | `"CrewmanTech.png"` |
| `InternalName` | N/A | String | ✔️ | The full unique name of an enemy formatted as a file path | `"/Lotus/Types/Enemies/Grineer/AIWeek/Avatars/HeavyFemaleGrineerAvatar"` |
| `Introduced` | N/A | String | ✔️ | The game version in which the enemy was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | N/A | String | ✔️ | Page/article link to the enemy on the wiki | `"Scorch"` |
| `Missions` | N/A | Table (of strings) | ❌ | [Star Chart](/w/Star_Chart "Star Chart") mission nodes/mission types that enemy can appear in | `{ "Kuva Siphon" }` |
| `Name` | `LocTag` | String | ✔️ | Name of enemy | `"Scorch"` |
| `Planets` | N/A | Table (of strings) | ✔️ | [Star Chart](/w/Star_Chart "Star Chart") regions that enemy can appear in as seen in enemy's [Codex](/w/Codex "Codex") entry | `{ "Earth", "Void", "Lua" }` |
| `Scans` | `CodexScansRequiredOverride` | Number (int) | ✔️ | Number of scans required to unlock the enemy's [Codex](/w/Codex "Codex") entry | `3` |
| `Type` | N/A | String | ✔️ | Informal enemy categorization based on common characteristics and/or mechanics (e.g. can only perform [Mercy](/w/Mercy "Mercy") finisher on "heavy" units) | `"Boss"`, `"Sniper"`, `"Heavy"`, or `"Light"` |
| `Weapons` | N/A | Table (of strings) | ❌ | Names of weapons that the enemy wields as stored in [Module:Weapons/data](/w/Module:Weapons/data "Module:Weapons/data") (i.e. player usable weapons only) | `"Grakata"` or `"Dera"` |

### Stats Subtable Schema

[[edit source](/w/Module:Enemies/data/doc?action=edit&section=T-4 "Edit section's source code: Stats Subtable Schema")]

```lua
			Stats = {
				Affinity = 500,
				Armor = 500,
				BaseLevel = 8,
				Health = 300,
				Multis = { "Head: 3.0x" },
				ProcResists = {},
				Shield = 0,
				SpawnLevel = 8,
			}
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Affinity` | Number (int) | ✔️ | Base [Affinity](/w/Affinity "Affinity") value at base level | `500` |
| `Armor` | Number (int) | ❌ | Base [Armor](/w/Armor "Armor") value at base level | `500` |
| `ArmorType` | String | ❌ (depreciated as of [Update 36.0](/w/Update_36#Update_36.0 "Update 36") (2024-06-18)) | [Armor](/w/Armor "Armor") class | `"Alloy Armor"` |
| `Attacks` | Table (of tables) | ❌ | Attack tables defining the base stats of enemy attacks |  |
| `BaseLevel` | Number (int) | ✔️ | Base enemy level used for [Enemy Level Scaling](/w/Enemy_Level_Scaling "Enemy Level Scaling") | `1` |
| `Health` | Number (int) | ✔️ | Base [Health](/w/Health "Health") value at base level | `300` |
| `HealthType` | String | ✔️ (depreciated as of [Update 36.0](/w/Update_36#Update_36.0 "Update 36") (2024-06-18)) | [Health](/w/Health "Health") class | `"Tenno Flesh"` |
| `Multis` | Table (of strings) | ❌ | Array of [Enemy Body Parts](/w/Enemy_Body_Parts "Enemy Body Parts") multipliers | `{ "Head: 3.0x" }` |
| `Overguard` | Number (int) | ❌ | Base [Overguard](/w/Overguard "Overguard") value at base level | `12` |
| `ProcResists` | Table (of strings) | ❌ | Array of [Status Effects](/w/Status_Effect "Status Effect") that cannot be applied to enemy; can use "All" as a shorthand for all procs. | `{ "Virus", "Stagger" }` |
| `Shield` | Number (int) | ❌ | Base [Shield](/w/Shield "Shield") value at base level | `0` |
| `ShieldType` | String | ❌ (depreciated as of [Update 36.0](/w/Update_36#Update_36.0 "Update 36") (2024-06-18)) | [Shield](/w/Shield "Shield") class | `"Proto Shield"` |
| `SpawnLevel` | Number (int) | ❌ | Enemy level at which enemy will first spawn at | `8` |

#### Attacks Subtable Schema

[[edit source](/w/Module:Enemies/data/doc?action=edit&section=T-5 "Edit section's source code: Attacks Subtable Schema")]

```lua
				Attacks = {
					{
						AttackName = "Normal Attack",
						CritChance = 0.3,
						CritMultiplier = 2,
						DamageDistribution = { Impact = 0.5, Puncture = 0.25, Slash = 0.25 },
						Multishot = 2,
						StatusChance = 0.3,
						BurstCount = 5,
						TotalDamage = 100,
					},
					{
						AttackName = "Melee Attack",
						CritChance = 0.3,
						CritMultiplier = 2,
						DamageDistribution = { Impact = 0.5, Puncture = 0.25, Slash = 0.25 },
						Multihit = 2,
						StatusChance = 0.3,
						BurstCount = 5,
						TotalDamage = 100,
					},
				}
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `AttackName` | String | ✔️ | Editor-defined attack name | `"Normal Attack"` |
| `CritChance` | Number (float) | ❌ | Attack's [Critical Chance](/w/Critical_Chance "Critical Chance") | `0.5` |
| `CritMultiplier` | Number (float) | ❌ | Attack's [Critical Multiplier](/w/Critical_Multiplier "Critical Multiplier") | `2` |
| `DamageDistribution` | Table (dictionary-like) | ✔️ | Distribution of [damage](/w/Damage "Damage") types as decimals | `{ Impact = 0.5, Puncture = 0.25, Slash = 0.25 }` |
| `Multishot` | Number (int) | ❌ | Attack's [Multishot](/w/Multishot "Multishot") | `2` |
| `Multihit` | Number (int) | ❌ | Attack's [Multihit](/w/Multihit "Multihit") | `2` |
| `StatusChance` | Number (float) | ❌ | Attack's [Status Chance](/w/Status_Chance "Status Chance") | `0.3` |
| `BurstCount` | Number (int) | ❌ | Attack's Burst Count | `5` |
| `Note` | String | ❌ | Editor-defined attack note | `Used when flying.` |
| `TotalDamage` | Number (int) | ✔️ | Attack's total base [damage](/w/Damage "Damage") before enemy level scaling is applied | `75` |

---

```lua
---	WARFRAME enemy database to be used on the wiki.
--	
--	@module			Enemies/data
--	@alias			data
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	Everyone who contributes to adding new data or updating existing values in database
---	@require		[[Module:LuaSerializer]]
--	@release		stable
--	

-- TODO: Since horizontal partitions are accessed programmatically, this means
-- that this module can be tailored to serve specific user localizations.
-- All we need to do is to add a locale flag in here set to mw.getCurrentFrame():preprocess('{{int:Custom-lang}}'), 
-- a separate translation table (likely JSON) for mapping canonical internal names to localized names, 
-- and replace the Name key/Trigger key/index key with the localized counterpart.
-- In theory, any database access by requiring this module should contain the 
-- proper localization based on user's interface language setting.

local data = {}

local MODULE_LOCALIZATION = mw.site.namespaces[828].name

local COOP_FACTIONS = { 'grineer', 'corpus', 'infestation', 'orokin', 'sentient', 'stalker', 'narmer', 'themurmur', 'techrot', 'scaldra', 'anarchs', 'unaffiliated' }

local FACTIONS_MAP = {
	grineer = 'grineer',
	['kuva grineer'] = 'grineer',

	corpus = 'corpus',
	['corpus amalgam'] = 'corpus',

	infestation = 'infestation',
	['infested'] = 'infestation',
	['infested deimos'] = 'infestation',

	orokin = 'orokin',
	['corrupted'] = 'orokin',

	sentient = 'sentient',
	stalker = 'stalker',
	narmer = 'narmer',
	
	themurmur = 'themurmur',
	['the murmur'] = 'themurmur',
	
	techrot = 'techrot',
	scaldra = 'scaldra',
	
	anarchs = 'anarchs',
	
	unaffiliated = 'unaffiliated',
	['duviri'] = 'unaffiliated',
	['neutral'] = 'unaffiliated',
	['predator'] = 'unaffiliated',
	['prey'] = 'unaffiliated',
	['tenno'] = 'unaffiliated',
	['unknown'] = 'unaffiliated',
}

-- Defining default metatable values
local dbMetatable = {
	-- Page title of database
	_pageName = 'Enemies/data'
}
dbMetatable._pageTitle = MODULE_LOCALIZATION..':'..dbMetatable._pageName

---	Defining custom looping behavior with pairs() to iterate over multiple 
--	partitions while acting as one database table.
--	@function		data.__pairs
--	@param			{table} self Table self-reference
--	@return			{function} Iterator function
--	@return			{table} Iterator state
dbMetatable.__pairs = function(self)
		local unpack = unpack or table.unpack
		return function(t, key)
			local i = t.index
			if not i then
				i = 1
			else
				local n = { t.next(t.inner, key) }
				if n[1] ~= nil then return unpack(n) end
				i = i + 1
			end
			t.index = i
			local name = t.names[i]
			if not name then return end
			local next, inner, key = pairs(mw.loadData(t.path..'/'..name))
			t.next = next
			t.inner = inner
			return next(inner, key)
		end, {
			--index = nil,
			names = COOP_FACTIONS,
			path = getmetatable(self)._pageTitle,
			--next = nil,
			--inner = nil,
		}, nil
	end

---	Supporting indexing by faction name (returns array of enemy entries) or enemy name
--	(returns a enemy entry).
--	@function		data.__index
--	@param			{table} self Table self-reference
--	@param			{string} key Index key
--	@return			{table}
dbMetatable.__index = function(self, key)
		if (type(key) == 'number') then return nil end
		
		-- Indexing by faction
		if key and FACTIONS_MAP[key:lower()] then
			return mw.loadData(getmetatable(self)._pageTitle..'/'..FACTIONS_MAP[key:lower()])
		end
		
		local factions = COOP_FACTIONS
		-- Indexing by enemy name
		local titlekey = (' '..key):lower():gsub('%W%w',string.upper):gsub('^ ','')
		for _, faction in ipairs(factions) do
			local data = mw.loadData(getmetatable(self)._pageTitle..'/'..faction)
			local enemy = data[key] or data[titlekey]
			if enemy then
				return enemy
			end
		end
		return nil
	end

---	For changing which type of database to pull data from.
--	If you want to switch to a different database in the same script, must require()
--	a new instance of M:Enemies/data.
--	@function		__call
--	@usage			require('Module:Enemies/data')(true)
--	@param			{table} self Table self-reference
--	@param			{table} args Argument table
--	@return			{table} Database table
dbMetatable.__call = function(self, args)
		-- Define logic for additional named arguments before the return statement
		-- TODO: We can take advantage of calling a database table by adding additional arguments
		-- for filtering out content.
		return self
	end

---	Serializes database tables into a single string with no functions and metatables.
--	@function		__tostring
--	@param			{table} self Table self-reference
--	@return			{string} Serialized database
dbMetatable.__tostring = function(self)
		return require('Module:LuaSerializer')._serialize(getmetatable(self)._pageName)
	end

setmetatable(data, dbMetatable)

return data
```

