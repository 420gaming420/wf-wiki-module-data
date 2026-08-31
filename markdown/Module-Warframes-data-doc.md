---
title: "Module:Warframes/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Warframes/data/doc"
wiki_timestamp: "2026-06-13T03:05:11Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s playable avatars which includes [Warframes](/w/Warframes "Warframes"), [Necramechs](/w/Necramech "Necramech"), [Archwings](/w/Archwing "Archwing"), and [Operators](/w/Operator "Operator").

## Contents

* [1 Warframe/Avatar Data Schema](#Warframe/Avatar_Data_Schema)
* [2 For Module Use](#For_Module_Use)
* [3 Data Sources](#Data_Sources)
* [4 Warframe/Avatar Data](#Warframe/Avatar_Data)

:   *Last updated: Sat, 13 Jun 2026 03:05:11 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Warframes/data/doc?diff=0))*

## Warframe/Avatar Data Schema

[[edit source](/w/Module:Warframes/data/doc?action=edit&section=1 "Edit section's source code: Warframe/Avatar Data Schema")]

```lua
		["Warframe Name"] = {
			_IgnoreEntry = true,
			Abilities = { "1", "2", "3", "4" },
			Armor = 100,
			AuraPolarity = "Madurai",
			Conclave = false,
			CodexSecret = false,
			Description = "In-Game Description",
			Energy = 100,
			FullImages = { { TabName = "Default", Image = "WarframeName.png" } },
			Health = 100,
			Helmet = "WarframeHelmet.png"
			Image = "WarframeName_Thumb.png"
			InitialEnergy = 50,
			InternalName = "/Lotus/Powersuits/Warframe/Warframe",
			Introduced = "30.0",
			Link = "Article Name",
			MaxRank = 30,
			Name = "Warframe Name",
			Passive = "In-game passive description",
			Polarities = { "Madurai", "Naramon" },
			Portrait = "FrameIcon272.png",
			Progenitor = "Element Name",
			Shield = 100,
			Playstyle = { "" },
			Sprint = 1.10,
			SquadPortrait = "WarframeNameLargePortrait.png",
			Themes = "Space Ninja",
			Subsumed = "Ability Name",
			Sex = "Female" 
		},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Abilities` | N/A | `abilities` | `AbilityTypes` | Table (of strings) | ✔️ | Names of the abilities in the order of unlock | `{ "Tail Wind", "Airburst", "Turbulence", "Tornado" }` |
| `Armor` | Armor | `armor` | `ArmourRatingOverride` | Number (integer) | ✔️ | Warframe/Avatar's base [Armor](/w/Armor "Armor") at Rank 0 | `100` |
| `ArmorRank30` | Armor | N/A | N/A | Number (integer) | ❌ | Warframe/Avatar's unmodded [Armor](/w/Armor "Armor") at Rank 30 (not base armor) | `300` |
| `AuraPolarity` | N/A | N/A | `ArtifactSlots` | String or Table (array of strings) | ✔️ | [Polarity](/w/Polarity "Polarity") of Aura slot | `"V"` or `"Madurai"` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ✔️ | Whether or not the Warframe/Avatar has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `false` |
| `CompatibilityTags` | N/A | N/A | `CompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, items with these tags can/cannot have a particular mod installed with the same tag. | `{ "SANDMAN" }` |
| `Conclave` | N/A | N/A | `AvailableOnPvp` | Boolean | ❌ | Whether or not the Warframe/Avatar can be used in [Conclave](/w/Conclave "Conclave") | `false` |
| `Description` | N/A | `description` | `LocalizeDescTag` | String | ✔️ | In-game description | `"Excalibur epitomizes the warrior spirit. His master swordsmanship deals high damage. He is the embodiment of martial excellence."` |
| `Energy` | Energy | `power` | `MaxEnergy` | Number (float) | ✔️ | Warframe/Avatar's base [Energy](/w/Energy "Energy") capacity at Rank 0 | `150` |
| `EnergyRank30` | Energy | N/A | N/A | Number (integer) | ❌ | Warframe/Avatar's unmodded [Energy](/w/Energy "Energy") capacity at Rank 30 (not base energy) | `300` |
| `FullImages` | N/A | N/A | N/A | Table (array of objects with key/value pairs) | ✔️ | Full body image file name(s) of the Warframe/Avatar as uploaded to the wiki (for infoboxes) in order of appearance in the infobox. `TabName` describes the avatar form associated with the image. | `{ { TabName = "Composite", Image = "Equinox.png" }, { TabName = "Day", Image = "Equinox-Day.png" }, { TabName = "Night", Image = "Equinox-Night.png" } }` |
| `Health` | Health | `health` | `MaxHealthOverride` | Number (integer) | ✔️ | Warframe/Avatar's base [Health](/w/Health "Health") at Rank 0 | `100` |
| `HealthRank30` | Health | N/A | N/A | Number (integer) | ❌ | Warframe/Avatar's unmodded [Health](/w/Health "Health") at Rank 30 (not base health) | `300` |
| `Helmet` | N/A | N/A | N/A | String | ✔️ | Image file name of the Warframe-Helmet as seen in in-game menus | `"AshHelmet.png"` |
| `Image` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the Warframe/Avatar as seen in in-game menus | `"Ash_Thumb.png"` |
| `InitialEnergy` | Starting Energy | N/A | `InitialEnergy` | Number (integer) | ✔️ | Warframe/Avatar's initial/starting energy value when spawning (not the same as base energy capacity) | `50` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ❌ | The full unique name of a Warframe/Avatar formatted as a file path | `"/Lotus/Powersuits/Ninja/Ninja"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the Warframe/Avatar was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Page/article link to the Warframe/Avatar on the wiki | `"Excalibur"` |
| `Mastery` | N/A | `masteryReq` | `RequiredLevel` | Number (integer) | ✔️ | [Mastery Rank](/w/Mastery_Rank "Mastery Rank") requirement | `5` |
| `MaxRank` | N/A | N/A | `LevelCap` | Number (integer) | ❌ | The maximum rank that they can level up to | `40` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Warframe/Avatar's name | `"Excalibur"` |
| `Passive` | N/A | `passiveDescription` | `PassiveAbilityLocTag` | String | ✔️ | In-game passive description as seen in arsenal | `"Zephyr moves faster and falls slower while airborne. Also gain 150% Critical Hit chance with weapons while airborne."` |
| `Playstyle` | N/A | N/A | N/A | Table (of strings) | ✔️ | General playstyle of Warframe/Avatar. Initial values are seeded from this spreadsheet by DE: <https://docs.google.com/document/d/13CzaOU3XeBGRDEtKU-RFu_qb4LkPqyveXl6iFcFOlKE> | `{ "Damage", "Support" }` |
| `Polarities` | N/A | N/A | `ArtifactSlots` | Table (array of strings) | ✔️ | Full names of the Warframe/Avatar's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `Portrait` | N/A | N/A | N/A | String | ✔️ | Half body image file name of Warframe/Avatar as uploaded to the wiki | `"AshIcon272.png"` |
| `Progenitor` | N/A | N/A | N/A | String | ✔️ | For the [Adversary System](/w/Adversary_System "Adversary System"), the damage type associated with using the Warframe/Avatar to generate a new lich | `"Radiation"` |
| `SellPrice` | N/A | N/A | `SellingPrice` | Number (integer) | ❌ | Warframe/Avatar's selling price in [Credits](/w/Credits "Credits") when removed from the player's inventory | `10000` |
| `Sex` | N/A | N/A | N/A | String | ✔️ | Warframe/Avatar's official sex and/or gender | `"Male"` |
| `Shield` | Shield | `shield` | `MaxShieldOverride` | Number (integer) | ✔️ | Warframe/Avatar's base [Shield](/w/Shield "Shield") at Rank 0 | `100` |
| `ShieldRank30` | Shield | N/A | N/A | Number (integer) | ❌ | Warframe/Avatar's unmodded [Shield](/w/Shield "Shield") at Rank 30 (not base shield) | `300` |
| `Sprint` | Sprint Speed | `sprintSpeed` | `MovementSpeedMultiplier` | Number (float) | ✔️ | Warframe/Avatar's base [Sprint Speed](/w/Sprint_Speed "Sprint Speed") | `1.1` |
| `SquadPortrait` | N/A | N/A | N/A | String | ✔️ | Squad icon image file name of Warframe/Avatar as uploaded to the wiki | `"AshLargePortrait.png"` |
| `Stamina` | N/A | N/A | `MaxStaminaOverride` | Number (integer) | ❌ | For [Necramechs](/w/Necramech "Necramech"), the base stamina/engine capacity at Rank 0 | `200` |
| `Subsumed` | N/A | N/A | `IsHelminth` | String | ✔️ | For the [Helminth](/w/Helminth "Helminth"), the name of the ability that is unlocked for transfer onto other Warframes/Avatars after sacrificing a base Warframe/Avatar to the Helminth | `"Shuriken"` |
| `Tactical` | N/A | N/A | N/A | String | ✔️ | The ability that can be remotely used through the Tactical Menu while on a [Railjack](/w/Railjack "Railjack"). See [Railjack/Tactical Menu#Ability Kinesis](/w/Railjack/Tactical_Menu#Ability_Kinesis "Railjack/Tactical Menu") for more details. | `"Smoke Screen"` |
| `Themes` | N/A | N/A | N/A | String | ✔️ | Warframe/Avatar's thematic inspirations and references | `"Ninja, Assassin"` |

## For Module Use

[[edit source](/w/Module:Warframes/data/doc?action=edit&section=2 "Edit section's source code: For Module Use")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | For module use, indicates that this Warframe/Avatar table entry is special and should ignored when parsing table entries | `true` |

## Data Sources

[[edit source](/w/Module:Warframes/data/doc?action=edit&section=3 "Edit section's source code: Data Sources")]

* See [Public Export](/w/Public_Export "Public Export").
* Portrait images are created by the community: [WARFRAME Wiki:Warframe Portraits](/w/WARFRAME_Wiki:Warframe_Portraits "WARFRAME Wiki:Warframe Portraits").

## Warframe/Avatar Data

[[edit source](/w/Module:Warframes/data/doc?action=edit&section=4 "Edit section's source code: Warframe/Avatar Data")]

