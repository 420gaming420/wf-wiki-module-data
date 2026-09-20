---
title: "Module:Synthesis/data"
wiki_url: "https://wiki.warframe.com/w/Module/Synthesis/data"
wiki_timestamp: "2026-09-19T18:54:33Z"
---

Database for all [Synthesis](/w/Synthesis "Synthesis") targets in [WARFRAME](/w/WARFRAME "WARFRAME"). Preferably put new Synthesis targets in the correct alphabetical order, but it is not necessary.

:   *Last updated: Sat, 19 Sep 2026 18:54:33 +0000 (UTC) by [User:Evilflora](/w/User:Evilflora "User:Evilflora") ([change log](https://wiki.warframe.com/w/Module:Synthesis/data?diff=0))*

## Contents

* [1 Synthesis Entry Schema](#Synthesis_Entry_Schema)
* [2 Data Validation](#Data_Validation)
* [3 References](#References)
* [4 Synthesis Data](#Synthesis_Data)

## Synthesis Entry Schema

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=T-1 "Edit section's source code: Synthesis Entry Schema")]

```lua
    ["Ancient Disruptor"] = {
        _IgnoreEntry = false,
        Locations = { "Tikal", "Terminus", "Isos " },
        IsImprint = false,
        Size = "Big",
        ScanPoints = 4,
        Standing = 2538,
    },
```

| Key/Column Name | [Synthesis](/w/Synthesis "Synthesis") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `_IgnoreEntry` | N/A | N/A | N/A | Boolean | ❌ | For wiki internal use, denotes entries to ignore for usage on the wiki and data validation | `true` |
| `Locations` | N/A | N/A | N/A | Table (array of strings) | ✔️ | List of node names where the target can be found; used to look up Planet and Mission Type via [Module:Missions/data](/w/Module:Missions/data "Module:Missions/data") | `{ "Tikal", "Terminus", "Isos " }` |
| `IsImprint` | N/A | N/A | N/A | Boolean | ✔️ | Whether the entry is an imprint target rather than a base target | `false` |
| `Size` | N/A | N/A | N/A | String | ✔️ | Size category of the target, used to determine the Endo cost table ("Small" or "Big") | `"Big"` |
| `ScanPoints` | N/A | N/A | N/A | Number | ❌ | Number of scan points required/awarded for the target | `4` |
| `Standing` | N/A | N/A | N/A | Number | ❌ | Base standing cost/reward for the target; a negative value is treated as "Unknown" | `2538` |

## Data Validation

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=T-2 "Edit section's source code: Data Validation")]

```lua
Checking for required keys
```

No missing required keys found in Module:Synthesis/data!

---

```lua
Validating data types of values
```

All data types are valid in Module:Synthesis/data!

---

```lua
Validating field values
```

All field values logic are valid in Module:Synthesis/data!

## References

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=T-3 "Edit section's source code: References")]

## Synthesis Data

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=T-4 "Edit section's source code: Synthesis Data")]

---

```lua
--- Synthesis targets table for [[Synthesis]] targets.
-- @module Synthesis/data
-- 

local synthesisData = {
	["Ancient Disruptor"] = {
		_IgnoreEntry = false,
		Locations = { "Tikal", "Terminus", "Isos" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Ancient Healer"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4, -- unsure
		Standing = 2538, -- unsure
	},
	["Anti MOA"] = {
		_IgnoreEntry = false,
		Locations = { "Valefor", "Baal", "Zeipel" },
		IsImprint = true,
		Size = "Big",
		ScanPoints = 3,
		Standing = 2550,
	},
	["Arid Eviscerator"] = {
		_IgnoreEntry = false,
		Locations = { "Ara" },
		IsImprint = true,
		Size = "Big", -- unsure
		ScanPoints = 3, -- unsure
		Standing = -1, -- unsure
	},
	["Ballista"] = {
		_IgnoreEntry = false,
		Locations = { "Mantle", "Lex" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Boiler"] = {
		_IgnoreEntry = false,
		Locations = { "Cholistan", "Isos", "Horend" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Bombard"] = {
		_IgnoreEntry = false,
		Locations = { "Lex", "Nuovo", "Ker", "Exta", "Bode" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Brood Mother"] = {
		_IgnoreEntry = false,
		Locations = { "Tikal", "Gabii", "Assur", "Isos" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Butcher"] = {
		_IgnoreEntry = false,
		Locations = { "Caloris", "Elion", "Rusalka", "Mantle" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Charger"] = {
		_IgnoreEntry = false,
		Locations = { "Terminus", "M Prime", "Isos" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Commander"] = {
		_IgnoreEntry = false,
		Locations = { "Telesto" },
		IsImprint = false,
		Size = "Big", -- unsure 
		ScanPoints = 4, -- unsure 
		Standing = -1
		,
	},
	["Corrupted Ancient"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit", "Stribog", "Ani" },
		IsImprint = false,
		Size = "Big", 
		ScanPoints = 4,
		Standing = 2538,
	},
	["Corrupted Bombard"] = {
		_IgnoreEntry = false,
		Locations = { "Oxomoco", "Marduk", "Aten" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Corrupted Butcher"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit", "Teshub" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 3, -- unsure
		Standing = 2513,
	},
	["Corrupted Crewman"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit", "Teshub" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Corrupted Heavy Gunner"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit", "Teshub", "Ukko" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Corrupted Lancer"] = {
		_IgnoreEntry = false,
		Locations = { "Hepit", "Ukko" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Corrupted Nullifier"] = {
		_IgnoreEntry = false,
		Locations = { "Oxomoco", "Marduk" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = -1,
	},
	["Crawler"] = {
		_IgnoreEntry = false,
		Locations = { "Isos", "Tikal", "Armaros", "Brugia" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 3,
		Standing = 2509,
	},
	["Crewman"] = {
		_IgnoreEntry = false,
		Locations = { "Copernicus" },
		IsImprint = true,
		Size = "Big", -- unsure 
		ScanPoints = 4, -- unsure
		Standing = -1,
	},
	["Drahk Master"] = {
		_IgnoreEntry = false,
		Locations = { "Cassini", "Anthe" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Elite Crewman"] = {
		_IgnoreEntry = false,
		Locations = { "Copernicus", "Zeipel" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Eviscerator"] = {
		_IgnoreEntry = false,
		Locations = { "Ara", "Lex", "Ker" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Fusion MOA"] = {
		_IgnoreEntry = false,
		Locations = { "Unda", "Kokabiel", "Abaddon", "Galatea" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 3,
		Standing = 2563,
	},
	["Guardsman"] = {
		_IgnoreEntry = false,
		Locations = { "Lex", "Nuovo", "Ludi" },
		IsImprint = true,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2525,
	},
	["Heavy Gunner"] = {
		_IgnoreEntry = false,
		Locations = { "Elion", "Caloris", "Lex", "Rusalka" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Hellion"] = {
		_IgnoreEntry = false,
		Locations = { "Ara", "Lex", "Rusalka" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2563,
	},
	["Lancer"] = {
		_IgnoreEntry = false,
		Locations = { "Cambria", "Caloris", "Pantheon", "Elion", "Cassini", "Kappa" },
		IsImprint = true,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Leaper"] = {
		_IgnoreEntry = false,
		Locations = { "Isos", "Tikal" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2509,
	},
	["MOA"] = {
		_IgnoreEntry = false,
		Locations = { "Venera", "Linea", "E Gate" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 3,
		Standing = 2513,
	},
	["Napalm"] = {
		_IgnoreEntry = false,
		Locations = { "Cassini", "Selkie", "Naga" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Nullifier Crewman"] = {
		_IgnoreEntry = false,
		Locations = { "Abaddon", "Orias", "Regna" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Runner"] = {
		_IgnoreEntry = false,
		Locations = { "Saxis", "Phlegyas" },
		IsImprint = true,
		Size = "Small", -- unsure
		ScanPoints = 3, -- unsure
		Standing = -1,
	},
	["Scorch"] = {
		_IgnoreEntry = false,
		Locations = { "Cassini", "Dione", "Numa", "Anthe" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2625,
	},
	["Scorpion"] = {
		_IgnoreEntry = false,
		Locations = { "Lex", "Cassini", "Numa", "Plato" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2525,
	},
	["Seeker"] = {
		_IgnoreEntry = false,
		Locations = { "E Prime", "Lex", "Nuovo", "Kelpie" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Frontier Seeker"] = {
		_IgnoreEntry = false,
		Locations = { "E Prime", "Lex", "Nuovo", "Kelpie" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 4,
		Standing = 2538,
	},
	["Shield Lancer"] = {
		_IgnoreEntry = false,
		Locations = { "Pantheon", "Caloris", "Elion", "Cassini" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2513,
	},
	["Swarm Mutalist MOA"] = {
		_IgnoreEntry = false,
		Locations = { "Armaros", "Isos", "Brugia" },
		IsImprint = false,
		Size = "Big",
		ScanPoints = 3,
		Standing = 2538,
	},
	["Trooper"] = {
		_IgnoreEntry = false,
		Locations = { "Mantle", "E Prime", "Numa", "Cassini" },
		IsImprint = false,
		Size = "Small",
		ScanPoints = 4,
		Standing = 2525,
	},
}

return synthesisData
```

