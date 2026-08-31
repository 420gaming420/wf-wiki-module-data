---
title: "Module:Weapons/Conclave/data/secondary/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/Conclave/data/secondary/doc"
wiki_timestamp: "2026-06-13T20:44:55Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon") in [Conclave](/w/Conclave "Conclave") (PvP).

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/Conclave/data/doc](/w/Module:Weapons/Conclave/data/doc "Module:Weapons/Conclave/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/doc?action=edit).*

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Conclave](/w/Conclave "Conclave") weapon stat data.

Google docs on Conclave weapon stats: <https://docs.google.com/spreadsheets/d/1q2BcFDKtIz_P5RC1b0cH0JUVP_UEgyDasjQq9Ck4kV0/edit?usp=sharing>

:   *Last updated: Sat, 13 Jun 2026 20:44:55 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/secondary/doc?diff=0))*

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
* [Module:Weapons/Conclave/data/melee](/w/Module:Weapons/Conclave/data/melee "Module:Weapons/Conclave/data/melee") - melee weapons

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

