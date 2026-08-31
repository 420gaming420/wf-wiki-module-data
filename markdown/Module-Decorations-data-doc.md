---
title: "Module:Decorations/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Decorations/data/doc"
wiki_timestamp: "2025-02-17T02:33:26Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Decorations/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Add [Dormizone](/w/Dormizone "Dormizone") decorations here

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Decorations](/w/Decorations "Decorations").

## Decoration Entry Schema

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=1 "Edit section's source code: Decoration Entry Schema")]

```lua
	["Decoration Name"] = {
		Name = "Decoration Name",
		Image = "DecoDecorationName.png",
		Description = "Description",
		Cost = {
			Capacity = 5,
			Time = 24,
			Credits = 500,
			Resources = {
				{ Count = 300, Name = "Ferrite" },
				{ Count = 200, Name = "Salvage" },
				{ Count = 100, Name = "Polymer Bundle" },
				{ Count = 0.07, Name = "Control Module" }
			}
		}
	},
```

| Key/Column Name | [Public Export](/w/Public_Export "Public Export") Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- |
| `Cost` | N/A | Table (of key-value pairs) | ✔️ | Cost data of decoration | See [#Cost Table Schema](#Cost_Table_Schema) |
| `Description` | `description` | String | ✔️ | Description of decoration as seen in-game | `"Changes the entry point for Tenno arriving in the Dojo. Only one Arrival Gate can be placed in a Dojo."` |
| `Image` | `textureLocation` | String | ✔️ | Image file name of the decoration as uploaded to the wiki | `"DecoArrivalGate.png"` |
| `InternalName` | `uniqueName` | String | ❌ | The full unique name of a decoration formatted as a file path | `"/Lotus/Types/Recipes/WarframeRecipes/MummyBlueprint"` |
| `Introduced` | N/A | String | ❌ | The game version in which the decoration was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Name` | `name` | String | ✔️ | Name of decoration | `"Beacon"` |

### Cost Subtable Schema

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=2 "Edit section's source code: Cost Subtable Schema")]

```lua
		Cost = {
			Capacity = 5,
			Time = 24,
			Credits = 500,
			Resources = {
				{ Count = 300, Name = "Ferrite" },
				{ Count = 200, Name = "Salvage" },
				{ Count = 100, Name = "Polymer Bundle" },
				{ Count = 0.07, Name = "Control Module" }
			}
		}
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Capacity` | Number (int) | ✔️ | The room capacity cost for placing decoration | `5` |
| `Credits` | Number (int) | ✔️ | The [Credits](/w/Credits "Credits") cost for crafting the decoration | `25000` |
| `Resources` | Table (of tables) | ✔️ | A table containing the crafting components used to build the decoration and the amounts required at Ghost Clan rank | ```lua { 	{ Count = 4, Name = "Neurodes" }, 	{ Count = 1200, Name = "Alloy Plate" }, 	{ Count = 700, Name = "Ferrite" }, 	{ Count = 1000, Name = "Polymer Bundle" }  } ``` |
| `Time` | Number (int) | ✔️ | The time in hours to build an item | `24` |

## Data

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=3 "Edit section's source code: Data")]

