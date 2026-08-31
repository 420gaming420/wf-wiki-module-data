---
title: "Module:Weapons/Conclave/data/melee"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/Conclave/data/melee"
wiki_timestamp: "2026-06-13T21:20:27Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Melee Weapons](/w/Melee_Weapon "Melee Weapon") in [Conclave](/w/Conclave "Conclave") (PvP).

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/Conclave/data/doc](/w/Module:Weapons/Conclave/data/doc "Module:Weapons/Conclave/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/doc?action=edit).*

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Conclave](/w/Conclave "Conclave") weapon stat data.

Google docs on Conclave weapon stats: <https://docs.google.com/spreadsheets/d/1q2BcFDKtIz_P5RC1b0cH0JUVP_UEgyDasjQq9Ck4kV0/edit?usp=sharing>

:   *Last updated: Sat, 13 Jun 2026 21:20:27 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/melee?diff=0))*

## Contents

* [1 Horizontal Partitions (and where to update data)](#Horizontal_Partitions_(and_where_to_update_data))
* [2 Attack Data Schema](#Attack_Data_Schema)
* [3 Gun Entry Schema](#Gun_Entry_Schema)
* [4 Melee Entry Schema](#Melee_Entry_Schema)
* [5 For Module Use](#For_Module_Use)
* [6 Weapon Data](#Weapon_Data)

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* [Module:Weapons/Conclave/data/primary](/w/Module:Weapons/Conclave/data/primary "Module:Weapons/Conclave/data/primary") - primary guns
* [Module:Weapons/Conclave/data/secondary](/w/Module:Weapons/Conclave/data/secondary "Module:Weapons/Conclave/data/secondary") - secondary guns
* Module:Weapons/Conclave/data/melee - melee weapons

## Attack Data Schema

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-2 "Edit section's source code: Attack Data Schema")]

```lua
	{
		AttackName = "Normal Attack",
		AmmoCost = 0.5,
		BurstCount = 1,
		Damage = { Impact = 1, Puncture = 1, Slash = 1 },
		FireRate = 1.0,
		Falloff = { StartRange = 400, EndRange = 600, Reduction = 0.2 },
		ShotType = "Hit-Scan",
		ShotSpeed = 80,
		Trigger = "Semi-Auto"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `AttackName` | String | ❌ | Name of attack; defaults to "Normal Attack" | `"Normal Attack"` or `"AoE Explosion"` |
| `AmmoCost` | Number (float) | ❌ | Ammo consumed on a single attack input; defaults to 1 | `0.5` or `10` |
| `AmmoType` | String | ❌ | Type of ammo pickups that replenishes ammo reserves; "None" for battery weapons and "Energy" for those that use Warframe energy | `"Sniper"` |
| `BurstCount` | Number (integer) | ❌ | For burst-fire weapons, the number of shots per burst; for attacks that shoot bursts that scale off magazine size (e.g  [Pandero](/w/Pandero "Pandero")), use the base magazine amount as the burst count | `4` |
| `BurstDelay` | Number (float) | ❌ | For burst-fire weapons, the time in seconds between each burst; omit this for attacks that shoot bursts that scale off magazine size as reload time is the delay effectively | `0.04` |
| `BurstFireRate` | Number (float) | ❌ | For burst-fire weapons, the [fire rate](/w/Fire_Rate "Fire Rate") of weapon during burst | `9.09` |
| `Damage` | Table (map of floats) | ✔️ | Table of [damage](/w/Damage "Damage") types that the weapon deals and their individual damage values. Possible keys: Impact, Puncture, Slash, Cold, Electricity, Heat, Toxin, Blast, Corrosive, Gas, Magnetic, Radiation, Viral, Void, and MinProgenitorBonus (random element for Kuva/Tenet weapons) | `{ Impact = 100, Puncture = 25, Slash = 30 }` |
| `ChargeTime` | Number (float) | ❌ | For charged attacks, the base charge time for a fully charged attack | `0.5` |
| `EffectDuration` | Number (float) | ❌ | For special attacks, the time in seconds that a special effect lasts for (e.g.  [Pox](/w/Pox "Pox")'s toxin clouds or  [Zenistar](/w/Zenistar "Zenistar")'s disc) | `5` |
| `ExplosionDelay` | Number (float) | ❌ | For AoE attacks, the time in seconds between initial shot and explosion; the same as "Embedded Delay" stat in-game | `0.5` |
| `Falloff` | Table (map of floats) | ❌ | Attack's base [Damage Falloff](/w/Damage_Falloff "Damage Falloff") stats; includes starting distance in meters when falloff multiplier comes into play, ending distance in meters when falloff multipler is at max reduction, and the maximum damage reduction as a decimal | `{ StartRange = 0, EndRange = 5, Reduction = 0.5 }` |
| `FireRate` | Number (float) | ✔️ | Attack's base [Fire Rate](/w/Fire_Rate "Fire Rate") or [Attack Speed](/w/Attack_Speed "Attack Speed") | `6.5` |
| `ForcedProcs` | Table (array of strings) | ❌ | Attack's forced procs, if any | `{ "Impact", "Slash" }` |
| `IsSilent` | Boolean | ❌ | Whether or not an attack has a silent [Noise Level](/w/Noise_Level "Noise Level"); defaults to false | `true` |
| `Multishot` | Number (integer) | ❌ | Attack's base [Multishot](/w/Multishot "Multishot") value; defaults to 1 | `10` |
| `PunchThrough` | Number (float) | ❌ | Attack's base [Punch Through](/w/Punch_Through "Punch Through") value in meters; defaults to 0 | `1.5` |
| `Radius` | Number (float) | ❌ | For AoE attacks, the base radius of area of effect in meters | `5` |
| `Range` | Number (float) | ❌ | For maximum range of a particular attack in meters | `40` |
| `ShotType` | String | ✔️ | Attack's shot type (e.g. "Hit-Scan", "Projectile", "Discharge" for beam/continuous weapons, and "AoE" for area of effects) | `Projectile` |
| `ShotSpeed` | Number (integer) | ❌ | For projectile attacks, attack's [projectile speed](/w/Projectile_Speed "Projectile Speed") | `50` |
| `Trigger` | String | ❌ | For weapons with multiple [Trigger Types](/w/Trigger_Type "Trigger Type"), attack's trigger type | `"Semi-Auto"` |

## Gun Entry Schema

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-3 "Edit section's source code: Gun Entry Schema")]

```lua
["Long Gun Weapon Name"] = {
	Accuracy = 100,
    Attacks = {
		{
			AttackName = "Normal",
			AmmoCost = 0.5,
			BurstCount = 1,
			Damage = { Impact = 1, Puncture = 1, Slash = 1 },
			FireRate = 1.0,
			Falloff = { StartRange = 400, EndRange = 600, Reduction = 0.2 },
			HeadshotMultiplier = 2,
			ShotType = "Hit-Scan",
			ShotSpeed = 100,
			Trigger = "Semi-Auto"
 		}
	},
	Introduced = "",
    Link = "Page Name",
	Magazine = 1,
	MaxAmmo = 540,
	Reload = 1,
	ReloadStyle = "Regenerate",
	SniperComboMin = 1,
	SniperComboReset = 1,
	Spool = 5,
	Trigger = "Semi-Auto",
	Traits = { "Grineer" },
	Users = { },
	Zoom = { "2.0x", "4.0x" }
},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Accuracy` | Number (float) | ✔️ | Gun's base [Accuracy](/w/Accuracy "Accuracy") value | `100` |
| `Attacks` | Table | ✔️ | Contains attack data for the weapon | See [#Attack Data Schema](#Attack_Data_Schema) |
| `Class` | String | ❌ | Weapon class for modding or a subclass of the weapon in its equip slot; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just "Exalted Weapon" | `"Sniper Rifle"` |
| `ExilusPolarity` | String | ❌ | Polarity on Exilus slot | `"Madurai"` |
| `Family` | String | ❌ | Weapon family that it belongs to, corresponding to the [Riven Mod](/w/Riven_Mods "Riven Mods") compatibility | `"Latron"` |
| `HeadshotMultiplier` | Number (float) | ✔️ | Damage multiplier on headshots | `2` |
| `Image` | String | ❌ | Image file name of the weapon as uploaded to the wiki | `CrpBFG.png` |
| `Introduced` | String | ❌ | The game version in which the weapon was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ✔️ | Page/article link to the weapon on the wiki | `"Conclave:Artemis Bow (Weapon)"` |
| `Magazine` | Number (integer) | ✔️ | Gun's base magazine size | `45` |
| `Mastery` | Number (integer) | ❌ | [Mastery Rank](/w/Mastery_Rank "Mastery Rank") requirement | `5` |
| `MaxAmmo` | Number (integer) | ✔️ | Gun's base maximum reserve ammo (this excludes magazine size) | `210` |
| `Name` | String | ❌ | Weapon's name | `"Primary Vermisplicer Chamber"` |
| `Polarities` | Table (array of strings) | ❌ | Full names of the weapon's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `Reload` | Number (float) | ✔️ | Gun's base [reload](/w/Reload "Reload") time in seconds | `3.5` |
| `ReloadDelay` | Number (float) | ❌ | For rechargeable/battery weapons, the time in seconds after firing before magazine 'recharges' or is replenished | `0.5` |
| `ReloadRate` | Number (float) | ❌ | For rechargeable/battery weapons, the rate at which magazine 'recharges' or is replenished per second | `40` |
| `ReloadStyle` | String | ❌ | Gun's unique reload type for weapons like  [Cycron](/w/Cycron "Cycron") or  [Corinth](/w/Corinth "Corinth") | `"Regenerate"` or `"ByRound"` |
| `Slot` | String | ❌ | The weapon slot that the weapon can be equipped on; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just their modding class | `"Primary"` |
| `SniperComboMin` | Number (integer) | ❌ | For sniper rifles, the minimum number of hits to gain combo bonus | `1` |
| `SniperComboReset` | Number (integer) | ❌ | For sniper rifles, the number of seconds after last hit before combo number goes down | `3` |
| `Spool` | Number (integer) | ❌ | For auto-spool weapons, number of shots until weapon reaches max [fire rate](/w/Fire_Rate "Fire Rate") | `5` |
| `Trigger` | String | ✔️ | Gun's [Trigger Type](/w/Trigger_Type "Trigger Type") | `"Auto"` or `"Auto / Burst"` |
| `Traits` | Table (array of strings) | ❌ | Gun's categorical traits | `{ "Grineer", "Wraith" }` |
| `Zoom` | Table (array of strings) | ❌ | The levels of zoom that the gun offers | `{ "2.0x", "4.5x" }` |

## Melee Entry Schema

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-4 "Edit section's source code: Melee Entry Schema")]

```lua
["Melee Weapon Name"] = {
	Attacks = {
    	{
			Damage = { Impact = 1, Puncture = 1, Slash = 1 },
			FireRate = 1
		}
	},
	FollowThrough = 0.7,
	HeavyAttack = 1284,
	HeavySlamAttack = 1070,
	HeavyRadialDmg = 1070,
	HeavySlamRadius = 8,
	Introduced = "",
	MeleeRange = 3,
	SlamAttack = 642,
	SlamElement = "Heat",
	SlamRadialDmg = 214,
	SlamRadialElement = "Heat",
	SlamRadialProcs = { "Heat" },
	SlamRadius = 7,
	SlideAttack = 1,
	StancePolarity = "V",
	Traits = { "Tenno" },
},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Attacks` | Table | ✔️ | Contains attack data for the weapon | See [#Attack Data Schema](#Attack_Data_Schema) |
| `Class` | String | ❌ | Weapon class for modding or a subclass of the weapon in its equip slot; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just "Exalted Weapon" | `"Nikana"` |
| `Family` | String | ❌ | Weapon family that it belongs to, corresponding to the [Riven Mod](/w/Riven_Mods "Riven Mods") compatibility | `"Machete"` |
| `FollowThrough` | Number (float) | ✔️ | Melee's base follow through multiplier as a decimal | `0.6` |
| `HeavyAttack` | Number (float) | ✔️ | Melee's base heavy attack damage | `1284` |
| `HeavySlamAttack` | Number (float) | ✔️ | Melee's base heavy slam direct hit damage | `1070` |
| `HeavyRadialDmg` | Number (float) | ✔️ | Melee's base heavy slam radial attack damage | `1070` |
| `HeavySlamRadius` | Number (integer) | ✔️ | Melee's base heavy slam radius in meters | `8` |
| `Image` | String | ❌ | Image file name of the weapon as uploaded to the wiki | `CrpBFG.png` |
| `Introduced` | String | ❌ | The game version in which the weapon was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ✔️ | Page/article link to the weapon on the wiki | `"Exalted Blade (Weapon)"` |
| `Mastery` | Number (integer) | ❌ | [Mastery Rank](/w/Mastery_Rank "Mastery Rank") requirement | `5` |
| `MeleeRange` | Number (float) | ✔️ | Melee's base attack range in meters | `2` |
| `Name` | String | ❌ | Weapon's name | `"Galatine Prime"` |
| `Polarities` | Table (array of strings) | ❌ | Full names of the weapon's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `SlamAttack` | Number (float) | ✔️ | Melee's base normal slam direct hit damage | `642` |
| `SlamElement` | String | ❌ | Melee's base normal slam direct hit damage type | `"Heat"` |
| `SlamRadialDmg` | Number (float) | ✔️ | Melee's base normal slam radial damage | `214` |
| `SlamRadialElement` | String | ❌ | Melee's base normal slam radial attack damage type | `"Heat"` |
| `SlamRadialProcs` | Table (array of strings) | ❌ | Melee's base normal slam radial attack forced proc(s) | `{ "Heat" }` |
| `SlamRadius` | Number (integer) | ✔️ | Melee's base normal slam radius in meters | `7` |
| `SlideAttack` | Number (float) | ✔️ | Melee's base slide attack damage | `100` |
| `SlamElement` | String | ❌ | Melee's base slide attack damage type | `"Toxin"` |
| `Slot` | String | ❌ | The weapon slot that the weapon can be equipped on; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just their modding class | `"Melee"` |
| `StancePolarity` | String | ❌ | Polarity on [Stance](/w/Stance "Stance") slot | `"Madurai"` |
| `Traits` | Table (array of strings) | ❌ | Gun's categorical traits | `{ "Grineer", "Wraith" }` |

## For Module Use

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-5 "Edit section's source code: For Module Use")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | For module use, indicates that this weapon table entry is special and should ignored when parsing table entries | `true` |
| `_IgnoreInCSV` | Boolean | ❌ | For module use, indicates that this weapon table entry should be ignored when outputting CSV (via [Module:Weapons/csv](/w/Module:Weapons/csv "Module:Weapons/csv")) | `true` |
| `_TooltipAttackDisplay` | Number | ❌ | For module use, tells what table entry in `Attack` table to use when processing weapon tooltips and comparing weapon variants in Comparison sections; `1` will be used if no value is assigned | `4` |

## Weapon Data

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-6 "Edit section's source code: Weapon Data")]

---

```lua
return {
	["Ack & Brunt"] = {
		Attacks = { { Damage = { Impact = 6.8, Puncture = 6.8, Slash = 54.4 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 68,
		Link = "Conclave:Ack & Brunt",
		SlideAttack = 68,
		Slot = "Melee",
		WallAttack = 68,
		_TooltipAttackDisplay = 1 
	},
	Amphis = {
		Attacks = { { Damage = { Impact = 43.4, Puncture = 9.3, Slash = 9.3 }, IsSilent = true, FireRate = 1.25 } },
		BlockAngle = 90,
		JumpAttack = 62,
		JumpRadius = 5,
		Link = "Conclave:Amphis",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Anku = {
		Attacks = { { Damage = { Impact = 9.3, Puncture = 49.6, Slash = 3.1 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Anku",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Ankyros = {
		Attacks = { { Damage = { Impact = 45.5, Puncture = 9.8, Slash = 9.7 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 65,
		Link = "Conclave:Ankyros",
		SlideAttack = 65,
		Slot = "Melee",
		WallAttack = 65,
		_TooltipAttackDisplay = 1 
	},
	["Ankyros Prime"] = {
		Attacks = { { Damage = { Impact = 43.4, Puncture = 9.3, Slash = 9.3 }, IsSilent = true, FireRate = 1.25 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Ankyros Prime",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	["Arca Titron"] = {
		Attacks = { { Damage = { Impact = 67.1, Slash = 36.1 }, IsSilent = true, FireRate = 0.733 } },
		BlockAngle = 90,
		JumpAttack = 103.2,
		Link = "Conclave:Arca Titron",
		SlideAttack = 103.2,
		Slot = "Melee",
		WallAttack = 103.2,
		_TooltipAttackDisplay = 1 
	},
	Atterax = {
		Attacks = { { Damage = { Impact = 2.7, Puncture = 2.7, Slash = 47.7 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 53.1,
		Link = "Conclave:Atterax",
		SlideAttack = 53.1,
		Slot = "Melee",
		WallAttack = 53.1,
		_TooltipAttackDisplay = 1 
	},
	Bo = {
		Attacks = { { Damage = { Impact = 69.3, Puncture = 7.7 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 77,
		Link = "Conclave:Bo",
		SlideAttack = 77,
		Slot = "Melee",
		WallAttack = 77,
		_TooltipAttackDisplay = 1 
	},
	["Bo Prime"] = {
		Attacks = { { Damage = { Impact = 59.4, Puncture = 6.6 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Bo Prime",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Boltace = {
		Attacks = { { Damage = { Impact = 6.3, Puncture = 50.4, Slash = 6.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 63,
		Link = "Conclave:Boltace",
		SlideAttack = 63,
		Slot = "Melee",
		WallAttack = 63,
		_TooltipAttackDisplay = 1 
	},
	["Broken Scepter"] = {
		Attacks = { { Damage = { Impact = 39.9, Puncture = 5.7, Slash = 11.4 }, IsSilent = true, FireRate = 1.25 } },
		BlockAngle = 90,
		JumpAttack = 57,
		Link = "Conclave:Broken Scepter",
		SlideAttack = 57,
		Slot = "Melee",
		WallAttack = 57,
		_TooltipAttackDisplay = 1 
	},
	["Broken War"] = {
		Attacks = { { Damage = { Impact = 6.3, Puncture = 6.3, Slash = 50.4 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 63,
		Link = "Conclave:Broken War",
		SlideAttack = 63,
		Slot = "Melee",
		WallAttack = 63,
		_TooltipAttackDisplay = 1 
	},
	Cassowar = {
		Attacks = { { Damage = { Impact = 9.9, Puncture = 15.3, Slash = 19.8 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 45,
		Link = "Conclave:Cassowar",
		SlideAttack = 45,
		Slot = "Melee",
		WallAttack = 45,
		_TooltipAttackDisplay = 1 
	},
	Caustacyst = {
		Attacks = {
			{
				Damage = { Corrosive = 19.8, Impact = 3.3, Puncture = 13.7, Slash = 13.3 },
				FireRate = 1,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 50.1,
		JumpElement = "Corrosive",
		Link = "Conclave:Caustacyst",
		SlideAttack = 50.1,
		SlideElement = "Corrosive",
		Slot = "Melee",
		WallAttack = 50.1,
		WallElement = "Corrosive",
		_TooltipAttackDisplay = 1 
	},
	["Ceramic Dagger"] = {
		Attacks = { { Damage = { Impact = 4.6, Puncture = 41.4 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 46,
		Link = "Conclave:Ceramic Dagger",
		SlideAttack = 46,
		Slot = "Melee",
		WallAttack = 46,
		_TooltipAttackDisplay = 1 
	},
	Cerata = {
		Attacks = {
			{
				Damage = { Impact = 1.6, Puncture = 3, Slash = 4.3, Toxin = 6.2 },
				FireRate = 1,
				HeadshotMultiplier = 1,
				ShotSpeed = 35,
				ShotType = "Thrown" 
			},
			{
				Damage = { Impact = 18, Puncture = 144, Slash = 18 },
				HeadshotMultiplier = 1,
				PunchThrough = 1 
			},
			{ Damage = { Impact = 38, Puncture = 72, Slash = 104, Toxin = 152 } } 
		},
		BlockAngle = 90,
		JumpAttack = 15.1,
		JumpElement = "Toxin",
		Link = "Conclave:Cerata",
		SlideAttack = 15.1,
		SlideElement = "Toxin",
		Slot = "Melee",
		WallAttack = 15.1,
		WallElement = "Toxin",
		_TooltipAttackDisplay = 1 
	},
	Cronus = {
		Attacks = { { Damage = { Impact = 19.8, Puncture = 9.9, Slash = 36.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Cronus",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	["Dakra Prime"] = {
		Attacks = { { Damage = { Impact = 6.2, Puncture = 6.2, Slash = 49.6 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Dakra Prime",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	["Dark Dagger"] = {
		Attacks = {
			{ Damage = { Puncture = 25.2, Radiation = 26.1, Slash = 15.7 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 67,
		JumpElement = "Radiation",
		Link = "Conclave:Dark Dagger",
		SlideAttack = 67,
		SlideElement = "Radiation",
		Slot = "Melee",
		WallAttack = 67,
		WallElement = "Radiation",
		_TooltipAttackDisplay = 1 
	},
	["Dark Split-Sword (Dual Swords)"] = {
		Attacks = {
			{ Damage = { Puncture = 49.2, Radiation = 28.1, Slash = 24.6 }, IsSilent = true, FireRate = 1.17 } 
		},
		BlockAngle = 90,
		JumpAttack = 101.9,
		Link = "Conclave:Dark Split-Sword (Dual Swords)",
		SlideAttack = 101.9,
		Slot = "Melee",
		WallAttack = 101.9,
		_TooltipAttackDisplay = 1 
	},
	["Dark Split-Sword (Heavy Blade)"] = {
		Attacks = {
			{ Damage = { Puncture = 32.6, Radiation = 41.7, Slash = 21.7 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 96,
		Link = "Conclave:Dark Split-Sword (Heavy Blade)",
		SlideAttack = 96,
		Slot = "Melee",
		WallAttack = 96,
		_TooltipAttackDisplay = 1 
	},
	["Dark Sword"] = {
		Attacks = {
			{ Damage = { Puncture = 36.9, Radiation = 24.6, Slash = 18.5 }, IsSilent = true, FireRate = 0.833 } 
		},
		BlockAngle = 90,
		JumpAttack = 80,
		JumpElement = "Radiation",
		JumpRadius = 3,
		Link = "Conclave:Dark Sword",
		SlideAttack = 80,
		SlideElement = "Radiation",
		Slot = "Melee",
		WallAttack = 80,
		WallElement = "Radiation",
		_TooltipAttackDisplay = 1 
	},
	Destreza = {
		Attacks = { { Damage = { Impact = 1.4, Puncture = 45.9, Slash = 6.8 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 54.1,
		Link = "Conclave:Destreza",
		SlideAttack = 54.1,
		Slot = "Melee",
		WallAttack = 54.1,
		_TooltipAttackDisplay = 1 
	},
	["Destreza Prime"] = {
		Attacks = { { Damage = { Impact = 6.4, Puncture = 37.1, Slash = 9.5 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 53,
		Link = "Conclave:Destreza Prime",
		SlideAttack = 53,
		Slot = "Melee",
		WallAttack = 53,
		_TooltipAttackDisplay = 1 
	},
	["Dex Dakra"] = {
		Attacks = { { Damage = { Impact = 6.6, Puncture = 6.6, Slash = 52.8 }, IsSilent = true, FireRate = 0.883 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Dex Dakra",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Diwata = {
		Attacks = { { Damage = { Impact = 24, Puncture = 120, Slash = 16 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		Link = "Conclave:Diwata",
		SlideAttack = 160,
		Slot = "Melee",
		WallAttack = 160,
		_TooltipAttackDisplay = 1 
	},
	["Dragon Nikana"] = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 6.5, Slash = 55.3 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 65.1,
		Link = "Conclave:Dragon Nikana",
		SlideAttack = 65.1,
		Slot = "Melee",
		WallAttack = 65.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Cleavers"] = {
		Attacks = {
			{ Damage = { Impact = 10.1, Puncture = 10.1, Slash = 46.9 }, IsSilent = true, FireRate = 0.833 } 
		},
		BlockAngle = 90,
		JumpAttack = 67.1,
		Link = "Conclave:Dual Cleavers",
		SlideAttack = 67.1,
		Slot = "Melee",
		WallAttack = 67.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Ether"] = {
		Attacks = { { Damage = { Impact = 8.9, Puncture = 8.9, Slash = 41.3 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 59.1,
		Link = "Conclave:Dual Ether",
		SlideAttack = 59.1,
		Slot = "Melee",
		WallAttack = 59.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Heat Swords"] = {
		Attacks = { { Damage = { Impact = 9, Puncture = 9, Slash = 42 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 60,
		JumpElement = "Heat",
		JumpRadius = 5,
		Link = "Conclave:Dual Heat Swords",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	["Dual Ichor"] = {
		Attacks = {
			{
				Damage = { Impact = 2.3, Puncture = 1.4, Slash = 5.5, Toxin = 5.8 },
				FireRate = 1.08,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 15,
		JumpElement = "Toxin",
		Link = "Conclave:Dual Ichor",
		SlideAttack = 15,
		SlideElement = "Toxin",
		Slot = "Melee",
		WallAttack = 15,
		WallElement = "Toxin",
		_TooltipAttackDisplay = 1 
	},
	["Dual Kamas"] = {
		Attacks = { { Damage = { Impact = 2.9, Puncture = 5.7, Slash = 48.5 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 57.1,
		Link = "Conclave:Dual Kamas",
		SlideAttack = 57.1,
		Slot = "Melee",
		WallAttack = 57.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Kamas Prime"] = {
		Attacks = { { Damage = { Impact = 2.9, Puncture = 11.4, Slash = 42.8 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 57.1,
		Link = "Conclave:Dual Kamas Prime",
		SlideAttack = 57.1,
		Slot = "Melee",
		WallAttack = 57.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Keres"] = {
		Attacks = { { Damage = { Impact = 6.7, Puncture = 16.8, Slash = 32.5 }, IsSilent = true, FireRate = 1.25 } },
		BlockAngle = 90,
		JumpAttack = 56,
		Link = "Conclave:Dual Keres",
		SlideAttack = 56,
		Slot = "Melee",
		WallAttack = 56,
		_TooltipAttackDisplay = 1 
	},
	["Dual Raza"] = {
		Attacks = { { Damage = { Impact = 5.6, Puncture = 16.8, Slash = 33.6 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 56,
		Link = "Conclave:Dual Raza",
		SlideAttack = 56,
		Slot = "Melee",
		WallAttack = 56,
		_TooltipAttackDisplay = 1 
	},
	["Dual Skana"] = {
		Attacks = {
			{ Damage = { Impact = 10.4, Puncture = 10.4, Slash = 48.3 }, IsSilent = true, FireRate = 0.833 } 
		},
		BlockAngle = 90,
		JumpAttack = 69.1,
		Link = "Conclave:Dual Skana",
		SlideAttack = 69.1,
		Slot = "Melee",
		WallAttack = 69.1,
		_TooltipAttackDisplay = 1 
	},
	["Dual Zoren"] = {
		Attacks = { { Damage = { Impact = 3, Puncture = 3, Slash = 53.1 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 59.1,
		Link = "Conclave:Dual Zoren",
		SlideAttack = 59.1,
		Slot = "Melee",
		WallAttack = 59.1,
		_TooltipAttackDisplay = 1 
	},
	Endura = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 46.2, Slash = 16.5 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Endura",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	["Ether Daggers"] = {
		Attacks = { { Damage = { Impact = 9.8, Puncture = 9.8, Slash = 45.5 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 65.1,
		Link = "Conclave:Ether Daggers",
		SlideAttack = 65.1,
		Slot = "Melee",
		WallAttack = 65.1,
		_TooltipAttackDisplay = 1 
	},
	["Ether Reaper"] = {
		Attacks = { { Damage = { Impact = 9.8, Puncture = 9.8, Slash = 45.5 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 65.1,
		Link = "Conclave:Ether Reaper",
		SlideAttack = 65.1,
		Slot = "Melee",
		WallAttack = 65.1,
		_TooltipAttackDisplay = 1 
	},
	["Ether Sword"] = {
		Attacks = { { Damage = { Impact = 9.5, Puncture = 9.5, Slash = 44.1 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 63.1,
		Link = "Conclave:Ether Sword",
		SlideAttack = 63.1,
		Slot = "Melee",
		WallAttack = 63.1,
		_TooltipAttackDisplay = 1 
	},
	["Exalted Blade"] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = { Impact = 13.2, Puncture = 13.2, Slash = 61.6 },
				FireRate = 0.833,
				IsSilent = true,
			},
			{
				AttackName = "Energy Wave",
				Damage = { Impact = 13.2, Puncture = 13.2, Slash = 61.6 },
				FireRate = 0.833,
				HeadshotMultiplier = 1,
				Range = 16,
				ShotSpeed = 30 
			} 
		},
		BlockAngle = 90,
		JumpAttack = 88,
		JumpRadius = 5,
		Link = "Conclave:Exalted Blade",
		SlideAttack = 88,
		Slot = "Melee",
		WallAttack = 88,
		_TooltipAttackDisplay = 1 
	},
	Fang = {
		Attacks = { { Damage = { Impact = 9.2, Puncture = 42.7, Slash = 9.1 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 61,
		Link = "Conclave:Fang",
		SlideAttack = 61,
		Slot = "Melee",
		WallAttack = 61,
		_TooltipAttackDisplay = 1 
	},
	["Fang Prime"] = {
		Attacks = { { Damage = { Impact = 8.9, Puncture = 41.3, Slash = 8.8 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 59,
		Link = "Conclave:Fang Prime",
		SlideAttack = 59,
		Slot = "Melee",
		WallAttack = 59,
		_TooltipAttackDisplay = 1 
	},
	Fragor = {
		Attacks = { { Damage = { Impact = 65.1, Puncture = 14, Slash = 13.9 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 93,
		Link = "Conclave:Fragor",
		SlideAttack = 93,
		Slot = "Melee",
		WallAttack = 93,
		_TooltipAttackDisplay = 1 
	},
	["Fragor Prime"] = {
		Attacks = { { Damage = { Impact = 64.4, Puncture = 13.8, Slash = 13.8 }, IsSilent = true, FireRate = 0.8 } },
		BlockAngle = 90,
		JumpAttack = 92,
		Link = "Conclave:Fragor Prime",
		SlideAttack = 92,
		Slot = "Melee",
		WallAttack = 92,
		_TooltipAttackDisplay = 1 
	},
	Furax = {
		Attacks = { { Damage = { Impact = 47.6, Puncture = 10.2, Slash = 10.2 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 68,
		Link = "Conclave:Furax",
		SlideAttack = 68,
		Slot = "Melee",
		WallAttack = 68,
		_TooltipAttackDisplay = 1 
	},
	["Furax Wraith"] = {
		Attacks = { { Damage = { Impact = 43.4, Puncture = 9.3, Slash = 9.3 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Furax Wraith",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Galatine = {
		Attacks = { { Damage = { Impact = 2, Puncture = 2, Slash = 76 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 80,
		JumpRadius = 5,
		Link = "Conclave:Galatine",
		SlideAttack = 80,
		Slot = "Melee",
		WallAttack = 80,
		_TooltipAttackDisplay = 1 
	},
	["Galatine Prime"] = {
		Attacks = { { Damage = { Impact = 2, Puncture = 2, Slash = 76 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 80,
		Link = "Conclave:Galatine Prime",
		SlideAttack = 80,
		Slot = "Melee",
		WallAttack = 80,
		_TooltipAttackDisplay = 1 
	},
	["Gazal Machete"] = {
		Attacks = { { Damage = { Impact = 6.1, Puncture = 9.2, Slash = 45.8 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 61.1,
		Link = "Conclave:Gazal Machete",
		SlideAttack = 61.1,
		Slot = "Melee",
		WallAttack = 61.1,
		_TooltipAttackDisplay = 1 
	},
	Glaive = {
		Attacks = {
			{
				Damage = { Impact = 6.6, Puncture = 6.6, Slash = 30.8 },
				FireRate = 1,
				HeadshotMultiplier = 1,
				Range = 30,
				ShotSpeed = 20,
				ShotType = "Thrown" 
			},
			{
				Damage = { Blast = 60, Impact = 37.2, Puncture = 37.2, Slash = 173.6 },
				HeadshotMultiplier = 1,
				PunchThrough = 1 
			},
			{ Damage = { Blast = 315, Impact = 22.4, Puncture = 22.4, Slash = 104.3 } } 
		},
		BlockAngle = 90,
		JumpAttack = 44,
		Link = "Conclave:Glaive",
		SlideAttack = 44,
		Slot = "Melee",
		WallAttack = 44,
		_TooltipAttackDisplay = 1 
	},
	["Glaive Prime"] = {
		Attacks = {
			{
				Damage = { Impact = 5.9, Puncture = 5.9, Slash = 27.3 },
				FireRate = 1.25,
				HeadshotMultiplier = 1,
				Range = 30,
				ShotSpeed = 45,
				ShotType = "Thrown" 
			},
			{ Damage = { Blast = 50, Slash = 197 }, HeadshotMultiplier = 1, PunchThrough = 1 },
			{ Damage = { Blast = 40, Impact = 17.7, Puncture = 17.7, Slash = 82.6 } } 
		},
		BlockAngle = 90,
		JumpAttack = 39.1,
		Link = "Conclave:Glaive Prime",
		SlideAttack = 39.1,
		Slot = "Melee",
		WallAttack = 39.1,
		_TooltipAttackDisplay = 1 
	},
	Gram = {
		Attacks = { { Damage = { Impact = 13.1, Puncture = 13.1, Slash = 60.9 }, IsSilent = true, FireRate = 0.95 } },
		BlockAngle = 90,
		JumpAttack = 87.1,
		Link = "Conclave:Gram",
		SlideAttack = 87.1,
		Slot = "Melee",
		WallAttack = 87.1,
		_TooltipAttackDisplay = 1 
	},
	["Gram Prime"] = {
		Attacks = { { Damage = { Impact = 18, Puncture = 4.5, Slash = 67.5 }, IsSilent = true, FireRate = 0.8 } },
		BlockAngle = 90,
		JumpAttack = 90,
		Link = "Conclave:Gram Prime",
		SlideAttack = 90,
		Slot = "Melee",
		WallAttack = 90,
		_TooltipAttackDisplay = 1 
	},
	Guandao = {
		Attacks = { { Damage = { Impact = 15.3, Puncture = 3, Slash = 42.7 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 61,
		Link = "Conclave:Guandao",
		SlideAttack = 61,
		Slot = "Melee",
		WallAttack = 61,
		_TooltipAttackDisplay = 1 
	},
	Halikar = {
		Attacks = {
			{
				Damage = { Impact = 5.6, Puncture = 44.8, Slash = 5.6 },
				FireRate = 1.17,
				Range = 23,
				ShotSpeed = 30,
				ShotType = "Thrown" 
			},
			{
				Damage = { Blast = 40, Impact = 18, Puncture = 144, Slash = 18 },
				PunchThrough = 1 
			},
			{ Damage = { Blast = 30, Impact = 10.8, Puncture = 86.4, Slash = 10.8 } } 
		},
		BlockAngle = 90,
		JumpAttack = 56,
		JumpElement = "Magnetic",
		Link = "Conclave:Halikar",
		SlideAttack = 56,
		Slot = "Melee",
		WallAttack = 56,
		_TooltipAttackDisplay = 1 
	},
	Hate = {
		Attacks = {
			{ Damage = { Impact = 10.7, Puncture = 10.7, Slash = 49.7 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 71.1,
		Link = "Conclave:Hate",
		SlideAttack = 71.1,
		Slot = "Melee",
		WallAttack = 71.1,
		_TooltipAttackDisplay = 1 
	},
	["Heat Dagger"] = {
		Attacks = {
			{
				Damage = { Heat = 16.1, Impact = 3.6, Puncture = 19.7, Slash = 14.5 },
				FireRate = 0.75,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 53.9,
		JumpElement = "Heat",
		Link = "Conclave:Heat Dagger",
		SlideAttack = 53.9,
		Slot = "Melee",
		WallAttack = 53.9,
		_TooltipAttackDisplay = 1 
	},
	["Heat Sword"] = {
		Attacks = { { Damage = { Impact = 6.6, Puncture = 6.6, Slash = 52.8 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 66,
		JumpElement = "Heat",
		Link = "Conclave:Heat Sword",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Heliocor = {
		Attacks = { { Damage = { Impact = 78.2, Puncture = 9.2, Slash = 4.6 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		ChannelCost = 1,
		JumpAttack = 93,
		Link = "Conclave:Heliocor",
		SlideAttack = 93,
		Slot = "Melee",
		WallAttack = 93,
		_TooltipAttackDisplay = 1 
	},
	Hirudo = {
		Attacks = { { Damage = { Impact = 8.4, Puncture = 44.8, Slash = 2.8 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 56,
		Link = "Conclave:Hirudo",
		SlideAttack = 56,
		Slot = "Melee",
		WallAttack = 56,
		_TooltipAttackDisplay = 1 
	},
	["Iron Staff"] = {
		Attacks = { { Damage = { Impact = 122.4, Puncture = 21.6 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		Link = "Conclave:Iron Staff",
		SlideAttack = 144,
		Slot = "Melee",
		_TooltipAttackDisplay = 1 
	},
	["Jat Kittag"] = {
		Attacks = { { Damage = { Impact = 45.6, Puncture = 8.6, Slash = 2.8 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 57,
		JumpElement = "Blast",
		JumpRadius = 10,
		Link = "Conclave:Jat Kittag",
		SlideAttack = 57,
		Slot = "Melee",
		WallAttack = 57,
		_TooltipAttackDisplay = 1 
	},
	["Jat Kusar"] = {
		Attacks = {
			{
				Damage = { Heat = 25.6, Impact = 25, Puncture = 4.1, Slash = 14.2 },
				FireRate = 0.833,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 68.9,
		JumpElement = "Heat",
		JumpRadius = 10,
		Link = "Conclave:Jat Kusar",
		SlideAttack = 68.9,
		SlideElement = "Heat",
		Slot = "Melee",
		WallAttack = 68.9,
		WallElement = "Heat",
		_TooltipAttackDisplay = 1 
	},
	["Jaw Sword"] = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 13.2, Slash = 49.5 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Jaw Sword",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Kama = {
		Attacks = { { Damage = { Impact = 8.9, Puncture = 8.9, Slash = 41.3 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 59.1,
		Link = "Conclave:Kama",
		SlideAttack = 59.1,
		Slot = "Melee",
		WallAttack = 59.1,
		_TooltipAttackDisplay = 1 
	},
	Karyst = {
		Attacks = {
			{
				Damage = { Impact = 1.6, Puncture = 4.6, Slash = 4, Toxin = 4.8 },
				FireRate = 0.75,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 15,
		JumpElement = "Toxin",
		Link = "Conclave:Karyst",
		SlideAttack = 15,
		SlideElement = "Toxin",
		Slot = "Melee",
		WallAttack = 15,
		WallElement = "Toxin",
		_TooltipAttackDisplay = 1 
	},
	Kesheg = {
		Attacks = { { Damage = { Impact = 24, Puncture = 6, Slash = 30 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Kesheg",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	Kestrel = {
		Attacks = {
			{
				Damage = { Impact = 37.1, Puncture = 8, Slash = 7.9 },
				FireRate = 1.08,
				Range = 23,
				ShotSpeed = 30,
				ShotType = "Thrown" 
			},
			{
				Damage = { Blast = 30, Impact = 72, Puncture = 9, Slash = 9 },
				PunchThrough = 0 
			},
			{ Damage = { Blast = 20, Impact = 43.2, Puncture = 5.4, Slash = 5.4 } } 
		},
		BlockAngle = 90,
		JumpAttack = 53,
		Link = "Conclave:Kestrel",
		SlideAttack = 53,
		Slot = "Melee",
		WallAttack = 53,
		_TooltipAttackDisplay = 1 
	},
	Kogake = {
		Attacks = { { Damage = { Impact = 43.4, Puncture = 9.3, Slash = 9.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Kogake",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	["Kogake Prime"] = {
		Attacks = { { Damage = { Impact = 43.4, Puncture = 9.3, Slash = 9.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Kogake Prime",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Korrudo = {
		Attacks = { { Damage = { Impact = 35.9, Puncture = 1.9, Slash = 24.8 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Korrudo",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Krohkur = {
		Attacks = { { Damage = { Impact = 8, Puncture = 12.1, Slash = 46.9 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 67,
		Link = "Conclave:Krohkur",
		SlideAttack = 67,
		Slot = "Melee",
		WallAttack = 67,
		_TooltipAttackDisplay = 1 
	},
	Kronen = {
		Attacks = { { Damage = { Impact = 5.9, Puncture = 5.9, Slash = 47.2 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 59,
		Link = "Conclave:Kronen",
		SlideAttack = 59,
		Slot = "Melee",
		WallAttack = 59,
		_TooltipAttackDisplay = 1 
	},
	["Kronen Prime"] = {
		Attacks = { { Damage = { Impact = 5, Puncture = 5, Slash = 40 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 50,
		Link = "Conclave:Kronen Prime",
		SlideAttack = 50,
		Slot = "Melee",
		WallAttack = 50,
		_TooltipAttackDisplay = 1 
	},
	Lacera = {
		Attacks = {
			{
				Damage = { Electricity = 27.3, Impact = 3.3, Puncture = 10.4, Slash = 18 },
				FireRate = 0.917,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 59,
		JumpElement = "Electricity",
		Link = "Conclave:Lacera",
		SlideAttack = 59,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 59,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	Lecta = {
		Attacks = { { Damage = { Electricity = 21.6, Impact = 7.7, Slash = 9.7 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 39,
		JumpElement = "Electricity",
		Link = "Conclave:Lecta",
		SlideAttack = 39,
		Slot = "Melee",
		WallAttack = 39,
		_TooltipAttackDisplay = 1 
	},
	Lesion = {
		Attacks = { { Damage = { Impact = 7.2, Puncture = 1.8, Slash = 27 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 36,
		Link = "Conclave:Lesion",
		SlideAttack = 36,
		Slot = "Melee",
		WallAttack = 36,
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Bo"] = {
		Attacks = { { Damage = { Impact = 62.1, Puncture = 6.9 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 69,
		Link = "Conclave:Mk1-Bo",
		SlideAttack = 69,
		Slot = "Melee",
		WallAttack = 69,
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Furax"] = {
		Attacks = { { Damage = { Impact = 47.6, Puncture = 10.2, Slash = 10.2 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 68,
		Link = "Conclave:Mk1-Furax",
		SlideAttack = 68,
		Slot = "Melee",
		WallAttack = 68,
		_TooltipAttackDisplay = 1 
	},
	Machete = {
		Attacks = {
			{ Damage = { Impact = 10.4, Puncture = 10.4, Slash = 48.3 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 69.1,
		Link = "Conclave:Machete",
		SlideAttack = 69.1,
		Slot = "Melee",
		WallAttack = 69.1,
		_TooltipAttackDisplay = 1 
	},
	["Machete Wraith"] = {
		Attacks = { { Damage = { Impact = 9.5, Puncture = 9.5, Slash = 44.1 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 63.1,
		Link = "Conclave:Machete Wraith",
		SlideAttack = 63.1,
		Slot = "Melee",
		WallAttack = 63.1,
		_TooltipAttackDisplay = 1 
	},
	Magistar = {
		Attacks = { { Damage = { Impact = 72.8, Puncture = 13.7, Slash = 4.5 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 91,
		Link = "Conclave:Magistar",
		SlideAttack = 91,
		Slot = "Melee",
		WallAttack = 91,
		_TooltipAttackDisplay = 1 
	},
	Mios = {
		Attacks = { { Damage = { Impact = 18, Puncture = 15, Slash = 27 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Mios",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	Mire = {
		Attacks = {
			{
				Damage = { Impact = 8.2, Puncture = 8.2, Slash = 16.7, Toxin = 23 },
				FireRate = 1.08,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 56.1,
		JumpElement = "Toxin",
		Link = "Conclave:Mire",
		SlideAttack = 56.1,
		Slot = "Melee",
		WallAttack = 56.1,
		_TooltipAttackDisplay = 1 
	},
	["Nami Skyla"] = {
		Attacks = { { Damage = { Impact = 9, Puncture = 9, Slash = 42 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Nami Skyla",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	["Nami Skyla Prime"] = {
		Attacks = { { Damage = { Impact = 5, Puncture = 10, Slash = 35 }, IsSilent = true, FireRate = 1.33 } },
		BlockAngle = 90,
		JumpAttack = 50,
		Link = "Conclave:Nami Skyla Prime",
		SlideAttack = 50,
		Slot = "Melee",
		WallAttack = 50,
		_TooltipAttackDisplay = 1 
	},
	["Nami Solo"] = {
		Attacks = { { Damage = { Impact = 9.9, Puncture = 9.9, Slash = 46.2 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Nami Solo",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Nikana = {
		Attacks = { { Damage = { Impact = 3.5, Puncture = 7.1, Slash = 60.4 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 71,
		Link = "Conclave:Nikana",
		SlideAttack = 71,
		Slot = "Melee",
		WallAttack = 71,
		_TooltipAttackDisplay = 1 
	},
	["Nikana Prime"] = {
		Attacks = { { Damage = { Impact = 3, Puncture = 3, Slash = 53.1 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 59.1,
		Link = "Conclave:Nikana Prime",
		SlideAttack = 59.1,
		Slot = "Melee",
		WallAttack = 59.1,
		_TooltipAttackDisplay = 1 
	},
	Ninkondi = {
		Attacks = { { Damage = { Electricity = 26.3, Impact = 23.7 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 50,
		JumpElement = "Electricity",
		Link = "Conclave:Ninkondi",
		SlideAttack = 50,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 50,
		_TooltipAttackDisplay = 1 
	},
	Obex = {
		Attacks = { { Damage = { Impact = 42, Puncture = 9, Slash = 9 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Obex",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	Ohma = {
		Attacks = {
			{ Damage = { Electricity = 29.5, Impact = 20.4, Slash = 10.2 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 60.1,
		JumpElement = "Electricity",
		Link = "Conclave:Ohma",
		SlideAttack = 60.1,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 60.1,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	Okina = {
		Attacks = { { Damage = { Impact = 2.9, Puncture = 25.6, Slash = 28.5 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 57,
		Link = "Conclave:Okina",
		SlideAttack = 57,
		Slot = "Melee",
		WallAttack = 57,
		_TooltipAttackDisplay = 1 
	},
	Orthos = {
		Attacks = { { Damage = { Impact = 8.7, Puncture = 8.7, Slash = 40.6 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 58,
		JumpRadius = 10,
		Link = "Conclave:Orthos",
		SlideAttack = 58,
		Slot = "Melee",
		WallAttack = 58,
		_TooltipAttackDisplay = 1 
	},
	["Orthos Prime"] = {
		Attacks = { { Damage = { Impact = 6.8, Puncture = 6.8, Slash = 31.5 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 45.1,
		JumpRadius = 10,
		Link = "Conclave:Orthos Prime",
		SlideAttack = 45.1,
		Slot = "Melee",
		WallAttack = 45.1,
		_TooltipAttackDisplay = 1 
	},
	Orvius = {
		Attacks = {
			{
				Damage = { Impact = 9.8, Puncture = 2.5, Slash = 36.8 },
				FireRate = 0.75,
				ShotSpeed = 35,
				ShotType = "Thrown" 
			},
			{ Damage = { Cold = 20, Impact = 42.4, Puncture = 10.6, Slash = 159 } },
			{ Damage = { Cold = 40, Impact = 25.4, Puncture = 6.3, Slash = 95.3 } } 
		},
		BlockAngle = 90,
		JumpAttack = 49.1,
		Link = "Conclave:Orvius",
		SlideAttack = 49.1,
		Slot = "Melee",
		WallAttack = 49.1,
		_TooltipAttackDisplay = 1 
	},
	["Pangolin Sword"] = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 9.9, Slash = 52.8 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Pangolin Sword",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Paracesis = {
		Attacks = { { Damage = { Impact = 15.2, Puncture = 5.5, Slash = 48.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 69,
		Link = "Conclave:Paracesis",
		SlideAttack = 69,
		Slot = "Melee",
		WallAttack = 69,
		_TooltipAttackDisplay = 1 
	},
	["Plasma Sword"] = {
		Attacks = {
			{
				Damage = { Electricity = 51, Impact = 8.7, Puncture = 3.1, Slash = 22.4 },
				FireRate = 0.667,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 51,
		Link = "Conclave:Plasma Sword",
		SlideAttack = 51,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 51,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Dual Cleavers"] = {
		Attacks = { { Damage = { Impact = 4, Puncture = 4, Slash = 32 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 40,
		Link = "Conclave:Prisma Dual Cleavers",
		SlideAttack = 40,
		Slot = "Melee",
		WallAttack = 40,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Obex"] = {
		Attacks = { { Damage = { Impact = 36.4, Puncture = 7.8, Slash = 7.8 }, IsSilent = true, FireRate = 1.33 } },
		BlockAngle = 90,
		JumpAttack = 52,
		Link = "Conclave:Prisma Obex",
		SlideAttack = 52,
		Slot = "Melee",
		WallAttack = 52,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Skana"] = {
		Attacks = { { Damage = { Impact = 9.5, Puncture = 9.5, Slash = 44.1 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 63.1,
		Link = "Conclave:Prisma Skana",
		SlideAttack = 63.1,
		Slot = "Melee",
		WallAttack = 63.1,
		_TooltipAttackDisplay = 1 
	},
	Prova = {
		Attacks = { { Damage = { Electricity = 28.5, Impact = 19.5 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 48,
		JumpElement = "Electricity",
		Link = "Conclave:Prova",
		SlideAttack = 48,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 48,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	["Prova Vandal"] = {
		Attacks = { { Damage = { Electricity = 29.8, Impact = 20.2 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 50,
		JumpElement = "Electricity",
		Link = "Conclave:Prova Vandal",
		SlideAttack = 50,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 50,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	Pupacyst = {
		Attacks = { { Damage = { Impact = 8.3, Toxin = 8.7 }, IsSilent = true, FireRate = 0.833 } },
		BlockAngle = 90,
		JumpAttack = 17,
		Link = "Conclave:Pupacyst",
		SlideAttack = 17,
		Slot = "Melee",
		WallAttack = 17,
		_TooltipAttackDisplay = 1 
	},
	["Rakta Dark Dagger"] = {
		Attacks = { { Damage = { Puncture = 19.3, Radiation = 21.1, Slash = 13.6 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 54,
		Link = "Conclave:Rakta Dark Dagger",
		SlideAttack = 54,
		Slot = "Melee",
		WallAttack = 54,
		_TooltipAttackDisplay = 1 
	},
	["Reaper Prime"] = {
		Attacks = { { Damage = { Impact = 9.8, Puncture = 9.8, Slash = 45.5 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 65.1,
		Link = "Conclave:Reaper Prime",
		SlideAttack = 65.1,
		Slot = "Melee",
		WallAttack = 65.1,
		_TooltipAttackDisplay = 1 
	},
	Ripkas = {
		Attacks = { { Damage = { Impact = 3.5, Puncture = 7, Slash = 59.5 }, IsSilent = true, FireRate = 0.883 } },
		BlockAngle = 90,
		JumpAttack = 70,
		Link = "Conclave:Ripkas",
		SlideAttack = 70,
		Slot = "Melee",
		WallAttack = 70,
		_TooltipAttackDisplay = 1 
	},
	["Sancti Magistar"] = {
		Attacks = { { Damage = { Impact = 57.6, Puncture = 10.8, Slash = 3.6 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 72,
		Link = "Conclave:Sancti Magistar",
		SlideAttack = 72,
		Slot = "Melee",
		WallAttack = 72,
		_TooltipAttackDisplay = 1 
	},
	Scindo = {
		Attacks = { { Damage = { Impact = 9.3, Puncture = 9.3, Slash = 74.4 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 93,
		Link = "Conclave:Scindo",
		SlideAttack = 93,
		Slot = "Melee",
		WallAttack = 93,
		_TooltipAttackDisplay = 1 
	},
	["Scindo Prime"] = {
		Attacks = { { Damage = { Impact = 8.3, Puncture = 8.3, Slash = 66.4 }, IsSilent = true, FireRate = 0.967 } },
		BlockAngle = 90,
		JumpAttack = 83,
		Link = "Conclave:Scindo Prime",
		SlideAttack = 83,
		Slot = "Melee",
		WallAttack = 83,
		_TooltipAttackDisplay = 1 
	},
	Scoliac = {
		Attacks = { { Damage = { Impact = 6.6, Puncture = 6.6, Slash = 30.8 }, IsSilent = true, FireRate = 1.25 } },
		BlockAngle = 90,
		JumpAttack = 44,
		JumpElement = "Toxin",
		Link = "Conclave:Scoliac",
		SlideAttack = 44,
		Slot = "Melee",
		WallAttack = 44,
		_TooltipAttackDisplay = 1 
	},
	["Secura Lecta"] = {
		Attacks = {
			{ Damage = { Electricity = 14.5, Puncture = 5.5, Slash = 12 }, IsSilent = true, FireRate = 1.25 } 
		},
		BlockAngle = 90,
		JumpAttack = 32,
		JumpElement = "Electricity",
		Link = "Conclave:Secura Lecta",
		SlideAttack = 32,
		SlideElement = "Electricity",
		Slot = "Melee",
		WallAttack = 32,
		WallElement = "Electricity",
		_TooltipAttackDisplay = 1 
	},
	Serro = {
		Attacks = { { Damage = { Electricity = 27.7, Slash = 19.3 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 47,
		Link = "Conclave:Serro",
		SlideAttack = 47,
		Slot = "Melee",
		WallAttack = 47,
		_TooltipAttackDisplay = 1 
	},
	Shaku = {
		Attacks = { { Damage = { Impact = 60, Puncture = 0, Slash = 0 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Shaku",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	Sheev = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 3.3, Slash = 59.4 }, IsSilent = true, FireRate = 0.667 } },
		BlockAngle = 90,
		JumpAttack = 66,
		Link = "Conclave:Sheev",
		SlideAttack = 66,
		Slot = "Melee",
		WallAttack = 66,
		_TooltipAttackDisplay = 1 
	},
	Sibear = {
		Attacks = {
			{
				Damage = { Cold = 66, Impact = 19.2, Puncture = 5.5, Slash = 13.7 },
				FireRate = 1,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 74,
		Link = "Conclave:Sibear",
		SlideAttack = 74,
		Slot = "Melee",
		WallAttack = 74,
		_TooltipAttackDisplay = 1 
	},
	["Sigma & Octantis"] = {
		Attacks = { { Damage = { Impact = 17.2, Puncture = 12.5, Slash = 48.4 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 78.1,
		Link = "Conclave:Sigma & Octantis",
		SlideAttack = 78.1,
		Slot = "Melee",
		WallAttack = 78.1,
		_TooltipAttackDisplay = 1 
	},
	["Silva & Aegis"] = {
		Attacks = { { Damage = { Heat = 60 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 60,
		JumpElement = "Heat",
		JumpRadius = 4,
		Link = "Conclave:Silva & Aegis",
		SlideAttack = 60,
		SlideElement = "Heat",
		Slot = "Melee",
		WallAttack = 60,
		WallElement = "Heat",
		_TooltipAttackDisplay = 1 
	},
	["Silva & Aegis Prime"] = {
		Attacks = { { Damage = { Heat = 71 }, IsSilent = true, FireRate = 0.75 } },
		BlockAngle = 90,
		JumpAttack = 71,
		JumpElement = "Heat",
		JumpRadius = 4,
		Link = "Conclave:Silva & Aegis Prime",
		SlideAttack = 71,
		SlideElement = "Heat",
		Slot = "Melee",
		WallAttack = 71,
		WallElement = "Heat",
		_TooltipAttackDisplay = 1 
	},
	Skana = {
		Attacks = {
			{ Damage = { Impact = 10.2, Puncture = 10.2, Slash = 47.6 }, IsSilent = true, FireRate = 0.833 } 
		},
		BlockAngle = 90,
		JumpAttack = 68,
		Link = "Conclave:Skana",
		SlideAttack = 68,
		Slot = "Melee",
		WallAttack = 68,
		_TooltipAttackDisplay = 1 
	},
	["Skana Prime"] = {
		Attacks = { { Damage = { Impact = 9.5, Puncture = 9.5, Slash = 44.1 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 63.1,
		Link = "Conclave:Skana Prime",
		SlideAttack = 63.1,
		Slot = "Melee",
		WallAttack = 63.1,
		_TooltipAttackDisplay = 1 
	},
	Skiajati = {
		Attacks = { { Damage = { Impact = 7.7, Puncture = 3.6, Slash = 39.8 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 51.1,
		Link = "Conclave:Skiajati",
		SlideAttack = 51.1,
		Slot = "Melee",
		WallAttack = 51.1,
		_TooltipAttackDisplay = 1 
	},
	Sydon = {
		Attacks = { { Damage = { Impact = 2.5, Puncture = 48.5 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 51,
		Link = "Conclave:Sydon",
		SlideAttack = 51,
		Slot = "Melee",
		WallAttack = 51,
		_TooltipAttackDisplay = 1 
	},
	["Synoid Heliocor"] = {
		Attacks = { { Damage = { Impact = 51.9, Puncture = 6.1, Slash = 3 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 61,
		Link = "Conclave:Synoid Heliocor",
		SlideAttack = 61,
		Slot = "Melee",
		WallAttack = 61,
		_TooltipAttackDisplay = 1 
	},
	Tatsu = {
		Attacks = {
			{
				Damage = { Impact = 10, Puncture = 15.3, Radiation = 20.7, Slash = 18 },
				FireRate = 1,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 64,
		Link = "Conclave:Tatsu",
		SlideAttack = 64,
		Slot = "Melee",
		WallAttack = 64,
		_TooltipAttackDisplay = 1 
	},
	Tekko = {
		Attacks = { { Damage = { Impact = 14, Puncture = 7, Slash = 49 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 70,
		Link = "Conclave:Tekko",
		SlideAttack = 70,
		Slot = "Melee",
		WallAttack = 70,
		_TooltipAttackDisplay = 1 
	},
	["Telos Boltace"] = {
		Attacks = { { Damage = { Impact = 5.4, Puncture = 45.1, Slash = 2.6 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 53.1,
		Link = "Conclave:Telos Boltace",
		SlideAttack = 53.1,
		Slot = "Melee",
		WallAttack = 53.1,
		_TooltipAttackDisplay = 1 
	},
	Tipedo = {
		Attacks = { { Damage = { Impact = 5.8, Puncture = 5.8, Slash = 46.4 }, IsSilent = true, FireRate = 1.33 } },
		BlockAngle = 90,
		JumpAttack = 58,
		Link = "Conclave:Tipedo",
		SlideAttack = 58,
		Slot = "Melee",
		WallAttack = 58,
		_TooltipAttackDisplay = 1 
	},
	["Tipedo Prime"] = {
		Attacks = { { Damage = { Impact = 6.2, Puncture = 6.2, Slash = 49.6 }, IsSilent = true, FireRate = 1.17 } },
		BlockAngle = 90,
		JumpAttack = 62,
		Link = "Conclave:Tipedo Prime",
		SlideAttack = 62,
		Slot = "Melee",
		WallAttack = 62,
		_TooltipAttackDisplay = 1 
	},
	Tonbo = {
		Attacks = { { Damage = { Impact = 4.8, Puncture = 7.2, Slash = 36 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 48,
		Link = "Conclave:Tonbo",
		SlideAttack = 48,
		Slot = "Melee",
		WallAttack = 48,
		_TooltipAttackDisplay = 1 
	},
	["Twin Basolk"] = {
		Attacks = {
			{
				Damage = { Heat = 22.7, Impact = 14.7, Puncture = 4, Slash = 14.7 },
				FireRate = 1,
				IsSilent = true,
			} 
		},
		BlockAngle = 90,
		JumpAttack = 56.1,
		Link = "Conclave:Twin Basolk",
		SlideAttack = 56.1,
		Slot = "Melee",
		WallAttack = 56.1,
		_TooltipAttackDisplay = 1 
	},
	["Twin Krohkur"] = {
		Attacks = { { Damage = { Impact = 7.2, Puncture = 10.8, Slash = 42 }, IsSilent = true, FireRate = 0.917 } },
		BlockAngle = 90,
		JumpAttack = 60,
		Link = "Conclave:Twin Krohkur",
		SlideAttack = 60,
		Slot = "Melee",
		WallAttack = 60,
		_TooltipAttackDisplay = 1 
	},
	["Valkyr Talons"] = {
		Attacks = {
			{
				Damage = { Impact = 48.3, Puncture = 48.3, Slash = 48.3 },
				FireRate = 1.5,
				IsSilent = true,
				HeadshotMultiplier = 1 
			} 
		},
		BlockAngle = 90,
		JumpAttack = 145,
		JumpRadius = 5,
		Link = "Conclave:Valkyr Talons",
		SlideAttack = 145,
		Slot = "Melee",
		WallAttack = 145,
		_TooltipAttackDisplay = 1 
	},
	["Vaykor Sydon"] = {
		Attacks = { { Damage = { Impact = 2.3, Puncture = 42.8 }, IsSilent = true, FireRate = 1.08 } },
		BlockAngle = 90,
		JumpAttack = 45.1,
		Link = "Conclave:Vaykor Sydon",
		SlideAttack = 45.1,
		Slot = "Melee",
		WallAttack = 45.1,
		_TooltipAttackDisplay = 1 
	},
	Venka = {
		Attacks = { { Damage = { Impact = 3.3, Puncture = 16.3, Slash = 45.5 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 65.1,
		Link = "Conclave:Venka",
		SlideAttack = 65.1,
		Slot = "Melee",
		WallAttack = 65.1,
		_TooltipAttackDisplay = 1 
	},
	["Venka Prime"] = {
		Attacks = { { Damage = { Impact = 3.2, Puncture = 12.6, Slash = 47.3 }, IsSilent = true, FireRate = 1.05 } },
		BlockAngle = 90,
		JumpAttack = 63.1,
		Link = "Conclave:Venka Prime",
		SlideAttack = 63.1,
		Slot = "Melee",
		WallAttack = 63.1,
		_TooltipAttackDisplay = 1 
	},
	Volnus = {
		Attacks = { { Damage = { Impact = 11.2, Puncture = 16.3, Slash = 23.5 }, IsSilent = true, FireRate = 1.2 } },
		BlockAngle = 90,
		JumpAttack = 51,
		Link = "Conclave:Volnus",
		SlideAttack = 51,
		Slot = "Melee",
		WallAttack = 51,
		_TooltipAttackDisplay = 1 
	},
	War = {
		Attacks = {
			{ Damage = { Impact = 44.2, Puncture = 22.1, Slash = 25.8 }, IsSilent = true, FireRate = 0.917 } 
		},
		BlockAngle = 90,
		JumpAttack = 92.1,
		Link = "Conclave:War",
		SlideAttack = 92.1,
		Slot = "Melee",
		WallAttack = 92.1,
		_TooltipAttackDisplay = 1 
	},
	["Wolf Sledge"] = {
		Attacks = { { Damage = { Impact = 34.2, Puncture = 2, Slash = 30.8 }, IsSilent = true, FireRate = 1 } },
		BlockAngle = 90,
		JumpAttack = 67,
		Link = "Conclave:Wolf Sledge",
		SlideAttack = 67,
		Slot = "Melee",
		WallAttack = 67,
		_TooltipAttackDisplay = 1 
	},
	Zenistar = {
		Attacks = {
			{ Damage = { Heat = 41.3, Impact = 22, Slash = 18.7 }, IsSilent = true, FireRate = 0.833 },
			{
				AttackName = "Attacks while disc deployed",
				Damage = { Heat = 41.3, Impact = 22, Slash = 18.7 } 
			},
			{ AttackName = "Disc Impact", Damage = { Impact = 15 }, Range = 9 },
			{ AttackName = "Disc Explosion", Damage = { Heat = 41.3 }, Range = 4 },
			{
				AttackName = "Disc Aura",
				Damage = { Heat = 41.3 },
				Duration = 45,
				FireRate = 1.2,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		BlockAngle = 90,
		JumpAttack = 82,
		JumpElement = "Heat",
		Link = "Conclave:Zenistar",
		SlideAttack = 82,
		SlideElement = "Heat",
		Slot = "Melee",
		WallAttack = 82,
		WallElement = "Heat",
		_TooltipAttackDisplay = 1 
	} 
}
```

