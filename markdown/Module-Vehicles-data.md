---
title: "Module:Vehicles/data"
wiki_url: "https://wiki.warframe.com/w/Module/Vehicles/data"
wiki_timestamp: "2025-01-09T18:29:17Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s usable vehicles which includes the [Atomicycle](/w/Atomicycle "Atomicycle"), [K-Drive](/w/K-Drive "K-Drive") and [Kaithe](/w/Kaithe "Kaithe").

## Contents

* [1 Vehicle Data Schema](#Vehicle_Data_Schema)
* [2 For Module Use](#For_Module_Use)
* [3 Data Sources](#Data_Sources)
* [4 Vehicle Data](#Vehicle_Data)

:   *Last updated: Thu, 09 Jan 2025 18:29:17 +0000 (UTC) by [User:Taiko884](/w/User:Taiko884?action=edit&redlink=1 "User:Taiko884 (page does not exist)") ([change log](https://wiki.warframe.com/w/Module:Vehicles/data?diff=0))*

## Vehicle Data Schema

[[edit source](/w/Module:Vehicles/data/doc?action=edit&section=T-1 "Edit section's source code: Vehicle Data Schema")]

```lua
		["Vehicle Name"] = {
			Abilities = { "1", "2", "3", "4" },
			Armor = 100,
			CodexSecret = true,
			Description = "In-Game Description (if possible)",
			Energy = 100,
			HasCustomVariants = false,
			Health = 100,
			Image = "VehicleName.png",
			InternalName = "/Lotus/Powersuits/xxx (I have no idea)",
			Introduced = "38",
			IsModdable = false,
			Missions = { "Free Roam" },
			MissionNames = { "Plains of Eidolon", "Orb Vallis" },
			Name = "Vehicle Name",
			Planets = { "Höllvania" },
			Shield = 100,
			SmallPortrait = 100,
			Speed = 10,
			Sprint = 1.1,
			SummonAbility = { "SummonAbility" },
			SummonGear = { "SummonGearItem" },
			TileSets = {},
		},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Abilities` | N/A | `abilities` | `AbilityTypes` | Table (of strings) | ❌ | Names of the abilities in the order of unlock | `{ "Atomi-Boost", "Atomi-Barrage", "Atomi-Shadow", "Atomi-Bomb" }` |
| `Armor` | Armor | `armor` | `ArmourRatingOverride` | Number (integer) | ❌ | Vehicle/Avatar's base [Armor](/w/Armor "Armor") at Rank 0 | `100` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ✔️ | Whether or not the Vehicle/Avatar has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `false` |
| `Description` | N/A | `description` | `LocalizeDescTag` | String | ❌ | In-game description | `"Summons an Atomicycle for use in 1999 and free roam missions."` |
| `Energy` | Energy | `power` | `MaxEnergy` | Number (float) | ❌ | Warframe/Avatar's base [Energy](/w/Energy "Energy") capacity at Rank 0 | `150` |
| `HasCustomVariants` | N/A | N/A | N/A | Boolean | ✔️ | If the Vehicle has custom buildable versions, like K-Drives | `false` |
| `Health` | Health | `health` | `MaxHealthOverride` | Number (integer) | ❌ | Vehicle/Avatar's base [Health](/w/Health "Health") at Rank 0 | `100` |
| `Image` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the Vehicle/Avatar as seen in in-game menus | `"Atomicycle.png"` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ❌ | The full unique name of a Vehicle/Avatar formatted as a file path | `"/Lotus/Powersuits/xxxx"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the Warframe/Avatar was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"38"` |
| `IsModdable` | N/A | N/A | N/A | Boolean | ✔️ | Can the Vehicle be modded | `false` |
| `Missions` | N/A | N/A | N/A | Table (of strings) | ❌ | Missions the Vehicle can be summoned in (by type) | `"Free Roam"` |
| `MissionNames` | N/A | N/A | N/A | Table (of strings) | ❌ | Missions the Vehicle can be summoned in (by name) | `"Plains of Eidolon"` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Warframe/Avatar's name | `"Excalibur"` |
| `Planets` | N/A | N/A | N/A | Table (of strings) | ❌ | Planets the Vehicle can be summoned on | `"Höllvania"` |
| `Shield` | N/A | N/A | N/A | Number (integer) | ❌ | Vehicle's Shields (if applicable) | `100` |
| `SmallPortrait` | N/A | N/A | N/A | String | ❌ | Vehicle's (Summon) Icon, at the top of the infobox next to the name | `100` |
| `Speed` | N/A | N/A | N/A | Number (float) | ✔️ | Vehicle's base speed in m/s | `15` |
| `Boost` | N/A | N/A | N/A | Number (float) | ✔️ | Vehicle's Sprint/Boost speed in m/s | `30` |
| `SummonAbility` | N/A | N/A | N/A | Table (of strings) | ❌ | Ability with which the vehicle can be summoned | `Summon Kaithe` |
| `SummonGear` | N/A | N/A | N/A | Table (of strings) | ✔️ | Gear Item with which the vehicle can be summoned | `K-Drive Launcher` |
| `TileSets` | N/A | N/A | N/A | Table (of strings) | ❌ | Tilesets the Vehicle can be summoned in |  |

## For Module Use

[[edit source](/w/Module:Vehicles/data/doc?action=edit&section=T-2 "Edit section's source code: For Module Use")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | For module use, indicates that this Warframe/Avatar table entry is special and should ignored when parsing table entries | `true` |

## Data Sources

[[edit source](/w/Module:Vehicles/data/doc?action=edit&section=T-3 "Edit section's source code: Data Sources")]

* See [Public Export](/w/Public_Export "Public Export")

## Vehicle Data

[[edit source](/w/Module:Vehicles/data/doc?action=edit&section=T-4 "Edit section's source code: Vehicle Data")]

---

```lua
return {
		Vehicles = {
			["Atomicycle"] = {
				Abilities = { "Atomi-Boost", "Atomi-Barrage", "Atomi-Shadow", "Atomi-Bomb" },
				--Armor = {},
				CodexSecret = true,
				Description = "'''Atomicycles''' are sports bikes from the year of 1999. The currently known model, the '''1999 MK III''', is manufactured by '''ZeViLa Inc'''.",
				Energy = 100,
				HasCustomVariants = false,
				--Health = {},
				Image = "atomicycle-promo-shot.png",
				InternalName = "",
				Introduced = "38",
				IsModdable = false,
				Missions = { "Free Roam", "Star Chart" },
				MissionsExclusive = { "Archwing", "Empyrean" },
				MissionNames = {},
				Name = "Atomicycle",
				--Planets = {},
				--Shield = {},
				SmallPortrait = "AtomicycleSummon.png",
				Speed = 20,
				Boost = 30,
				SummonAbility = {},
				SummonGear = { "Atomicycle Summon" },
				TileSets = {},
			},
			["K-Drive"] = {
				--Abilities = { "1", "2", "3", "4" },
				--Armor = 100,
				CodexSecret = true,
				Description = "Summons an K-Drive for use during free roam missions.",
				--Energy = 100,
				HasCustomVariants = true,
				--Health = 100,
				Image = "Mesa_on_K-drive.jpeg",
				--InternalName = "/Lotus/Powersuits/xxx (I have no idea)",
				Introduced = "24",
				IsModdable = true,
				Missions = { "Free Roam" },
				--MissionsExclusive = {},
				MissionNames = {},
				Name = "K-Drive",
				Planets = {},
				--Shield = 100,
				SmallPortrait = "K-DriveLauncher.png",
				Speed = 18,
				Boost = 21,
				SummonAbility = {},
				SummonGear = { "K-Drive Launcher" },
				TileSets = {},
		},
		Kaithe = {
				Abilities = { "Summon Kaithe", "Guiding Hand", "Hoof Stomp", "Steadfast Dismount" },
				--Armor = 100,
				CodexSecret = true,
				Description = "Count on the loyal steeds of Duviri in peace and battle.",
				--Energy = 100,
				HasCustomVariants = false,
				--Health = 100,
				Image = "KaitheIcon.png",
				--InternalName = "/Lotus/Powersuits/xxx (I have no idea)",
				Introduced = "33",
				IsModdable = false,
				Missions = { "Free Roam", "Duviri" },
				--MissionsExclusive = {},
				MissionNames = {},
				Name = "Kaithe",
				Planets = {},
				--Shield = 100,
				SmallPortrait = "KaitheSummon.png",
				Speed = 7,
				Boost = 14,
				SummonAbility = { "Summon Kaithe" },
				SummonGear = { "Kaithe Summon" },
				TileSets = {},
		}
	}
}
```

