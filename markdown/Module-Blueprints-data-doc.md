---
title: "Module:Blueprints/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Blueprints/data/doc"
wiki_timestamp: "2026-08-03T22:27:25Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Blueprints/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Database for blueprint recipes. Includes crafting requirements for [Railjack](/w/Railjack "Railjack") armaments. Used on [Template:BuildRequire](/w/Template:BuildRequire "Template:BuildRequire") and [Template:BuildAutomatic](/w/Template:BuildAutomatic "Template:BuildAutomatic") through [Module:Tooltips](/w/Module:Tooltips "Module:Tooltips").

Costs for Dojo [Decorations](/w/Decorations "Decorations") can be found in [Module:Decorations/data](/w/Module:Decorations/data "Module:Decorations/data") instead.

:   *Last updated: Mon, 03 Aug 2026 22:27:25 +0000 (UTC) by [User:~2026-HamsterBcozofCorrupted39482](/w/User:~2026-HamsterBcozofCorrupted39482?action=edit&redlink=1 "User:~2026-HamsterBcozofCorrupted39482 (page does not exist)") ([change log](https://wiki.warframe.com/w/Module:Blueprints/data/doc?diff=0))*

## Contents

* [1 Blueprint Entry Schema](#Blueprint_Entry_Schema)
* [2 Templates](#Templates)
  + [2.1 Generic Item](#Generic_Item)
  + [2.2 New Warframe](#New_Warframe)
  + [2.3 New Prime Warframe](#New_Prime_Warframe)
* [3 Collections](#Collections)
* [4 Data](#Data)

## Blueprint Entry Schema

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=1 "Edit section's source code: Blueprint Entry Schema")]

```lua
	["Item Name"] = {
		Credits = 25000,
		InternalName = "/Lotus/Types/Recipes/ItemNameBlueprint",
		MarketCost = 240,
		Name = "Blueprint Name",
		Parts = {
			{ Count = 5, Name = "Neurodes", Type = "Resource" },
			{ Count = 2000, Name = "Hexenon", Type = "Resource" },
			{ Count = 925, Name = "Plastids", Type = "Resource" },
			{ Count = 8000, Name = "Nano Spores", Type = "Resource" } 
		},
		Result = "Item Name",
		Rush = 10,
		Time = 6 
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `BPCost` | Number (int) | ❌ | The [Credits](/w/Credits "Credits") cost for buying the blueprint from the [Market](/w/Market "Market") | `35000` |
| `Credits` | Number (int) | ✔️ | The [Credits](/w/Credits "Credits") cost for crafting the item | `25000` |
| `InternalName` | String | ❌ | The full unique name of a blueprint formatted as a file path | `"/Lotus/Types/Recipes/WarframeRecipes/MummyBlueprint"` |
| `Introduced` | String | ❌ | The game version in which the blueprint was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME"). Optional since other item databases may include that information. | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ❌ | Page/article link to the blueprint on the wiki | `"Ack & Brunt"` |
| `MarketCost` | Number (int) | ❌ | The [Platinum](/w/Platinum "Platinum") cost of buying the item directly from the [Market](/w/Market "Market") | `500` |
| `Name` | String | ✔️ | Name of blueprint | `"Ack & Brunt Blueprint"` |
| `Parts` | Table (of tables) | ✔️ | A table containing the crafting components used to build the item | ```lua { 	{ Count = 4, Name = "Neurodes", Type = "Resource" }, 	{ Count = 1200, Name = "Alloy Plate", Type = "Resource" }, 	{ Count = 700, Name = "Ferrite", Type = "Resource" }, 	{ Count = 1000, Name = "Polymer Bundle", Type = "Resource" }  } ``` |
| `Result` | String | ✔️ | Name of item that the blueprint is for | `"Ack & Brunt"` |
| `Rush` | Number (int) | ✔️ | The base [Platinum](/w/Platinum "Platinum") cost to skip the build time | `35` |
| `Time` | Number (int) | ✔️ | The time in seconds to build an item. Some important values for quick reference:  * 60 = 1 minute * 300 = 5 minutes * 3600 = 1 hour * 43200 = 12 hours * 82800 = 23 hours * 86400 = 24 hours * 259200 = 72 hours (3 days) | `60` |
| `Type` | String | ✔️ | The item's category | `"Warframe"` |

## Templates

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=2 "Edit section's source code: Templates")]

For copying and pasting:

### Generic Item

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=3 "Edit section's source code: Generic Item")]

```lua
		["Item Name"] = {
			Name = "Item Name Blueprint",
			Result = "Item Name",
			Credits = 35000,
			Parts = {
				{ Count = 1, Name = "Morphics", Type = "Resource" },
				{ Count = 1, Name = "Neural Sensors", Type = "Resource" },
				{ Count = 1, Name = "Neurodes", Type = "Resource" },
				{ Count = 1, Name = "Orokin Cell", Type = "Resource" }
			},
			Rush = 10,
			Time = 82800 
		},
```

### New Warframe

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=4 "Edit section's source code: New Warframe")]

```lua
		Warframe = {
			BPCost = 35000,
			Credits = 25000,
			MarketCost = 275,
			Name = "Warframe Blueprint",
			Parts = {
				{ Count = 1, Name = "Neuroptics", Type = "Item" },
				{ Count = 1, Name = "Chassis", Type = "Item" },
				{ Count = 1, Name = "Systems", Type = "Item" },
				{ Count = 1, Name = "Orokin Cell", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe",
			Rush = 50,
			Time = 259200 
		},
		["Warframe Chassis"] = {
			Credits = 15000,
			Name = "Warframe Chassis Blueprint",
			Parts = {
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 900, Name = "Nano Spores", Type = "Resource" },
				{ Count = 50, Name = "Rubedo", Type = "Resource" },
				{ Count = 1, Name = "Orokin Cell", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Chassis",
			Rush = 25,
			Time = 43200 
		},
		["Warframe Neuroptics"] = {
			Credits = 15000,
			Name = "Warframe Neuroptics Blueprint",
			Parts = {
				{ Count = 150, Name = "Circuits", Type = "Resource" },
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 200, Name = "Polymer Bundle", Type = "Resource" },
				{ Count = 500, Name = "Salvage", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Neuroptics",
			Rush = 25,
			Time = 43200 
		},
		["Warframe Systems"] = {
			Credits = 15000,
			Name = "Warframe Systems Blueprint",
			Parts = {
				{ Count = 1, Name = "Control Module", Type = "Resource" },
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 500, Name = "Polymer Bundle", Type = "Resource" },
				{ Count = 400, Name = "Plastids", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Systems",
			Rush = 25,
			Time = 43200 
		},
```

### New Prime Warframe

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=5 "Edit section's source code: New Prime Warframe")]

```lua
		["Warframe Prime"] = {
			Credits = 25000,
			Name = "Warframe Prime Blueprint",
			Parts = {
				{ Count = 1, Name = "Prime Neuroptics", Type = "Item" },
				{ Count = 1, Name = "Prime Chassis", Type = "Item" },
				{ Count = 1, Name = "Prime Systems", Type = "Item" },
				{ Count = 5, Name = "Orokin Cell", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Prime",
			Rush = 50,
			Time = 259200 
		},
		["Warframe Prime Chassis"] = {
			Credits = 15000,
			Name = "Warframe Prime Chassis Blueprint",
			Parts = {
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 900, Name = "Nano Spores", Type = "Resource" },
				{ Count = 50, Name = "Rubedo", Type = "Resource" },
				{ Count = 1, Name = "Orokin Cell", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Prime Chassis",
			Rush = 25,
			Time = 43200 
		},
		["Warframe Prime Neuroptics"] = {
			Credits = 15000,
			Name = "Warframe Prime Neuroptics Blueprint",
			Parts = {
				{ Count = 150, Name = "Circuits", Type = "Resource" },
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 200, Name = "Polymer Bundle", Type = "Resource" },
				{ Count = 500, Name = "Salvage", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Prime Neuroptics",
			Rush = 25,
			Time = 43200 
		},
		["Warframe Prime Systems"] = {
			Credits = 15000,
			Name = "Warframe Prime Systems Blueprint",
			Parts = {
				{ Count = 1, Name = "Control Module", Type = "Resource" },
				{ Count = 200, Name = "Oxium", Type = "Resource" },
				{ Count = 500, Name = "Polymer Bundle", Type = "Resource" },
				{ Count = 400, Name = "Plastids", Type = "Resource" } 
			},
			ProductCategory = "Suits",
			Result = "Warframe Prime Systems",
			Rush = 25,
			Time = 43200 
		},
```

## Collections

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=6 "Edit section's source code: Collections")]

Data store has two collections:

* `Suits` - Warframe blueprints and component blueprints
* `Blueprints` - everything else

## Data

[[edit source](/w/Module:Blueprints/data/doc?action=edit&section=7 "Edit section's source code: Data")]

