---
title: "Module:Vendors/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Vendors/data/doc"
wiki_timestamp: "2025-12-23T21:14:45Z"
---

Database of NPC vendor offerings. Items sold through the [Market](/w/Market "Market") not included.

:   *Last updated: Tue, 23 Dec 2025 21:14:45 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Vendors/data/doc?diff=0))*

## General Offerings Schema

[[edit source](/w/Module:Vendors/data/doc?action=edit&section=1 "Edit section's source code: General Offerings Schema")]

```lua
			{
				{ "Synthesis Scanner", "Gear", { Credits = 5000 }, 25 },
				{ "Kinetic Siphon Trap", "Gear", { Credits = 5000 }, 10 },
				{ "Cephalon Simaris Sigil", "Sigil", 25000 },
				{ "Madurai Transmute Core", "Mod", 5000 },
				{ "Vazarin Transmute Core", "Mod", 5000 },
				{ "Naramon Transmute Core", "Mod", 5000 },
				{ "Exilus Adapter Blueprint", "Blueprint", 50000, 1, Prereq = "Natah (Quest)" },
				{ "Color Key Scene", "Captura", 100000, Limit = 1 },
				{ "Orokin Derelict Scene", "Captura", 100000, Limit = 1 },
				{ "Sanctuary Conduit Scene", "Captura", 100000, Limit = 1 },
				{ "Orvius Blueprint", "Blueprint", 50000, 1, Prereq = "The War Within" },
			}
```

1. First element in each table element will be the item's name as a string (required)
2. Second element in each table element will represent item type as a string (required)
   * Possible values include `"Mod", "Blueprint", "Relic", "Endo", "Resource", "Arcane", "Item", "Sigil", "Cosmetic", "Captura", "Item", "Gear", and more`
3. Third element in each table element will be the cost of item as an integer or a table of currencies mapped to its values (required)
4. Fourth element in each table element will represent item quantity (optional)

* Optional named fields:
  + `Timer` - If item is time-locked after purchasing, type in number of seconds before item is restocked in vendor
  + `Prereq` - Represents the numerical Syndicate rank it is locked behind or a string containing prerequisite content required to be completed
  + `Limit` - An integer that represents the maximum number of this item a player can purchase before the vendor locks you out from buying more

## Vendor Entry Schema

[[edit source](/w/Module:Vendors/data/doc?action=edit&section=2 "Edit section's source code: Vendor Entry Schema")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Currency` | String | ❌ | For vendors that only use one currency, the name of the currency used to purchase items | `"Standing"` |
| `Link` | String | ✔️ | Page/article link to the vendor on the wiki | `"Vox Solaris (Syndicate)"` |
| `Name` | String | ✔️ | Name of vendor | `"Necraloid"` |
| `Offerings` | Table (of table entries) | ✔️ | A table of items that can be purchased from the vendor | See [#General Offerings Schema](#General_Offerings_Schema) |
| `Ranks` | Table (array-like, 0 indexed) | ❌ | An array of Syndicate rank names in the order of progression | `{ [0] = "Neutral", "Glinty", "Whozit", "Proper Felon", "Primo", "Logical" }` |
| `Type` | String | ✔️ | Type of vendor | `"Syndicate"` |

## Vendor Data

[[edit source](/w/Module:Vendors/data/doc?action=edit&section=3 "Edit section's source code: Vendor Data")]

