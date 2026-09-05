---
title: "Module:Honorias/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Honorias/data/doc"
wiki_timestamp: "2026-09-04T11:02:16Z"
---

Database for all [Honorias](/w/Honoria "Honoria") in [WARFRAME](/w/WARFRAME "WARFRAME"). Preferably put new honorias in the correct alphabetical order, but it is not necessary.

:   *Last updated: Fri, 04 Sep 2026 11:02:16 +0000 (UTC) by [User:Evilflora](/w/User:Evilflora "User:Evilflora") ([change log](https://wiki.warframe.com/w/Module:Honorias/data/doc?diff=0))*

## Contents

* [1 Honoria Entry Schema](#Honoria_Entry_Schema)
* [2 Data Validation](#Data_Validation)
* [3 References](#References)
* [4 Honoria Data](#Honoria_Data)

## Honoria Entry Schema

[[edit source](/w/Module:Honorias/data/doc?action=edit&section=1 "Edit section's source code: Honoria Entry Schema")]

```lua
    ["Honoria Name"] = {
        Name = "Honoria Name",
        Link = "Honoria Name",
        Description = "How to obtain it",
        Position = "Suffix",
        Price = { ["Vainthorn"] = 70 },
        Introduced = "41",
        InternalName = "/Lotus/Types/Items/Titles/RoatheTitles/TitleDagath",
        CodexSecret = true,
        ExcludeFromCodex = true,
        Tags = { "Roathe" }
    },
```

| Key/Column Name | [Honoria](/w/Honoria "Honoria") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `_IgnoreEntry` | N/A | N/A | N/A | Boolean | ❌ | For wiki internal use, denotes entries to ignore for usage on the wiki and data validation | `true` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ❌ | Whether or not the Honoria title is hidden in the Codex prior to unlocking | `true` |
| `Description` | N/A | `description` | `description` | String | ❌ | Description or flavor text of the Honoria title | `"Awarded for beginning a relationship with..."` |
| `ExcludeFromCodex` | N/A | `excludeFromCodex` | `ExcludeFromCodex` | Boolean | ❌ | Denotes whether this title should be completely hidden/excluded from Codex tracking | `true` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ✔️ | Full internal unique name formatted as a file path | `"/Lotus/Types/Items/Titles/RoatheTitles/TitleDagath"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | Game update version in which the title was introduced in [WARFRAME](/w/WARFRAME "WARFRAME") | `"41"` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Target wiki article name for the title | `"Abyssal Thorn"` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Display name of the Honoria title | `"Abyssal Thorn"` |
| `Position` | N/A | N/A | N/A | String | ✔️ | Placement of the title relative to the player's username ("Prefix", "Suffix", or "Suffix & Prefix") | `"Suffix"` |
| `Price` | N/A | N/A | N/A | Table (dictionary) | ❌ | Cost/resources required to purchase or craft the title, formatted as resource-quantity key-value pairs | `{ ["Vainthorn"] = 70 }` |
| `Tags` | N/A | N/A | `Tags` | Table (array of strings) | ❌ | Classification tags associated with the title for filtering and categorization | `{ "Roathe" }` |
| `Rank` | N/A | N/A | N/A | Number | ❌ | Display order bypassing the alphabetical one | `1` |

## Data Validation

[[edit source](/w/Module:Honorias/data/doc?action=edit&section=2 "Edit section's source code: Data Validation")]

```lua
Checking for required keys
```

No missing required keys found in Module:Honorias/data!

---

```lua
Validating data types of values
```

All data types are valid in Module:Honorias/data!

---

```lua
Validating data types of values
```

All field values logic are valid in Module:Honorias/data!

## References

[[edit source](/w/Module:Honorias/data/doc?action=edit&section=3 "Edit section's source code: References")]

## Honoria Data

[[edit source](/w/Module:Honorias/data/doc?action=edit&section=4 "Edit section's source code: Honoria Data")]

