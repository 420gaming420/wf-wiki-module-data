---
title: "Module:Synthesis/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Synthesis/data/doc"
wiki_timestamp: "2026-09-19T13:44:42Z"
---

Database for all [Synthesis](/w/Synthesis "Synthesis") targets in [WARFRAME](/w/WARFRAME "WARFRAME"). Preferably put new Synthesis targets in the correct alphabetical order, but it is not necessary.

:   *Last updated: Sat, 19 Sep 2026 13:44:42 +0000 (UTC) by [User:Evilflora](/w/User:Evilflora "User:Evilflora") ([change log](https://wiki.warframe.com/w/Module:Synthesis/data/doc?diff=0))*

## Contents

* [1 Synthesis Entry Schema](#Synthesis_Entry_Schema)
* [2 Data Validation](#Data_Validation)
* [3 References](#References)
* [4 Synthesis Data](#Synthesis_Data)

## Synthesis Entry Schema

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=1 "Edit section's source code: Synthesis Entry Schema")]

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

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=2 "Edit section's source code: Data Validation")]

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

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=3 "Edit section's source code: References")]

## Synthesis Data

[[edit page](/w/Module:Synthesis/data/doc?action=edit&section=4 "Edit section's source code: Synthesis Data")]

