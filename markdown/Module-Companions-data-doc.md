---
title: "Module:Companions/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Companions/data/doc"
wiki_timestamp: "2025-02-19T03:13:59Z"
---

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [companions](/w/Companions "Companions") (pets).

:   *Last updated: Wed, 19 Feb 2025 03:13:59 +0000 (UTC) by [User:Anothernico](/w/User:Anothernico?action=edit&redlink=1 "User:Anothernico (page does not exist)") ([change log](https://wiki.warframe.com/w/Module:Companions/data/doc?diff=0))*

## Companion Entry Schema

[[edit source](/w/Module:Companions/data/doc?action=edit&section=1 "Edit section's source code: Companion Entry Schema")]

```lua
	["Companion Name"] = {
		Armor = 100,
		Description = "Description",
		Health = 100,
		Image = "CompanionName.png",
		InternalName = "",
		Introduced = "29",
		Link = "Page Name",
		MaxRank = 30,
		Name = "Companion Name",
		Polarities = { "Penjaga", "Penjaga", "Penjaga", "Penjaga" },
		SellPrice = 5000,
		Shield = 100,
		SquadPortrait = "CompanionNameLargePortrait.png",
		Type = "Kubrow",
	},
```

| Key/Column Name | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- |
| `Armor` | `armor` | `ArmourRatingOverride` | Number (integer) | ✔️ | Companion's base [Armor](/w/Armor "Armor") at Rank 0 | `100` |
| `CompatibilityTags` | N/A | `CompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, items with these tags can/cannot have a particular mod installed with the same tag. | `{ "HELMINTH_MOD" }` |
| `Description` | `description` | `LocalizeDescTag` | String | ✔️ | Description of companion as seen in-game | `"Piercing eyes reflect deadly instincts."` |
| `Health` | `health` | `MaxHealthOverride` | Number (integer) | ✔️ | Companion's base [Health](/w/Health "Health") at Rank 0 | `100` |
| `Image` | `textureLocation` | `Icon` | String | ✔️ | Image file name of the companion as uploaded to the wiki | `"SmeetaKavat.png"` |
| `InternalName` | `uniqueName` | `TypeName` | String | ✔️ | The full unique name of the companion formatted as a file path | `"/Lotus/Types/Game/CatbrowPet/MirrorCatbrowPetPowerSuit"` |
| `Introduced` | N/A | N/A | String | ✔️ | The game version in which the companion was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | N/A | N/A | String | ✔️ | Page/article link to the companion on the wiki | `"Shade/Prisma"` |
| `MaxRank` | N/A | `LevelCap` | Number (integer) | ❌ | The maximum rank that they can level up to | `30` |
| `Name` | `name` | `LocalizeTag` | String | ✔️ | Name of companion | `"Prisma Shade"` |
| `Polarities` | N/A | `ArtifactSlots` | Table (array of strings) | ✔️ | Full names of the companion's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `SellPrice` | N/A | `SellingPrice` | Number (integer) | ❌ | For sellable companions, the sell price in [Credits](/w/Credits "Credits") when removed from the player's inventory | `100` |
| `Shield` | `shield` | `MaxShieldOverride` | Number (integer) | ✔️ | Companion's base [Shield](/w/Shield "Shield") at Rank 0 | `100` |
| `SquadPortrait` | N/A | N/A | String | ✔️ | Squad icon image file name of Companion/Avatar as uploaded to the wiki | `"AdarzaKavatLargePortrait.png"` |
| `Type` | N/A | N/A | String | ✔️ | The class of companion (e.g. "Kubrow", "Kavat", "MOA", "Vulpaphyla", "Predasite", "Hound") | `"Hound"` |

## Companion Data

[[edit source](/w/Module:Companions/data/doc?action=edit&section=2 "Edit section's source code: Companion Data")]

