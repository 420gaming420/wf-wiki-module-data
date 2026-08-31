---
title: "Module:Arcane/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Arcane/data/doc"
wiki_timestamp: "2026-01-06T17:54:19Z"
---

Database of [Arcane Enhancements](/w/Arcane_Enhancement "Arcane Enhancement").

## Contents

* [1 Arcane Entry Schema](#Arcane_Entry_Schema)
* [2 Data Validation](#Data_Validation)
  + [2.1 Checking for required keys](#Checking_for_required_keys)
  + [2.2 Validating data types of values](#Validating_data_types_of_values)

:   *Last updated: Tue, 06 Jan 2026 17:54:19 +0000 (UTC) by [User:Headbox8424](/w/User:Headbox8424 "User:Headbox8424") ([change log](https://wiki.warframe.com/w/Module:Arcane/data/doc?diff=0))*

## Arcane Entry Schema

[[edit source](/w/Module:Arcane/data/doc?action=edit&section=1 "Edit section's source code: Arcane Entry Schema")]

```lua
	["Arcane Name"] = {
		CodexSecret = true,
		Description = "Description",
		Dissolution = 20,
		Icon = "ArcaneIcon.png",
		Image = "ArcaneImage.png",
		Introduced = "29",
		IsRefreshable = true,
		Link = "Page Name",
		MaxRank = 5,
		Name = "Arcane Name",
		Rarity = "Rare",
		Type = "Primary",
	},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ✔️ | Whether or not the Arcane has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to true | `true` |
| `CompatibilityTags` | N/A | N/A | `CompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, an item with one these tags can have this particular Arcane installed. | `{ "POWER_WEAPON" }` |
| `Description` | N/A | `levelStats` | `EnhancementTag` | String | ✔️ | Description of arcane at max rank | `"3% chance for +30% Shield Recharge for 12s"` |
| `Dissolution` | N/A | N/A | N/A | Number (integer) | ✔️ | Amount of [Vosfor](/w/Vosfor "Vosfor") for [Arcane Dissolution](/w/Arcane_Dissolution "Arcane Dissolution") | `20` |
| `Icon` | N/A | N/A | N/A | String | ✔️ | Image file name of the resized arcane image to x64 as uploaded to the wiki | `"ArcaneAegis64x.png"` |
| `Image` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the arcane as uploaded to the wiki | `"ArcaneAegis.png"` |
| `IncompatibilityTags` | N/A | N/A | `IncompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item incompatibility. In other words, items with these tags cannot have this particular Arcane installed. | `{ "OPERATOR_SUIT" }` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ❌ | The full unique name of an arcane formatted as a file path | `"/Lotus/Upgrades/CosmeticEnhancers/Offensive/LongGunSpeedOnCrit"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the arcane was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `IsRefreshable` | N/A | N/A | `CanReproc` | Boolean | ✔️ | Whether or not the arcane's effect(s) are refreshable in duration while active | `true` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Page/article link to the arcane on the wiki | `"Arcane Energize"` |
| `MaxRank` | N/A | N/A | `FusionLimit` | Number (integer) | ✔️ | Maximum rank that arcane can be upgraded to | `5` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Name of arcane | `"Arcane Energize"` |
| `Rarity` | N/A | `rarity` | `Rarity` | String | ✔️ | Rarity of the arcane | `"Legendary"` |
| `Type` | N/A | N/A | `ItemCompatibility` | String | ✔️ | The class of items that the arcane can be equipped on | `"Warframe"` |
| `UpgradeTypes` | N/A | N/A | `UpgradeType` | String | ❌ | Upgrade tags associated with the Arcane for categorization and to reflect the specific internal bonus it adds (sometimes localized description does not explain full functionality). Arcanes whose functionality are derived from Lua scripts (i.e. complex/unorthodox behavior) will not have this key set. This key is solely for Arcanes that provide simple stat bonuses. | `GAMEPLAY_FACTION_DAMAGE` |

## Data Validation

[[edit source](/w/Module:Arcane/data/doc?action=edit&section=2 "Edit section's source code: Data Validation")]

### Checking for required keys

[[edit source](/w/Module:Arcane/data/doc?action=edit&section=3 "Edit section's source code: Checking for required keys")]

**Script error: No such module "Arcane/data/validate".**

### Validating data types of values

[[edit source](/w/Module:Arcane/data/doc?action=edit&section=4 "Edit section's source code: Validating data types of values")]

**Script error: No such module "Arcane/data/validate".**

