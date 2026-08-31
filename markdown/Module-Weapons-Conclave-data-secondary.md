---
title: "Module:Weapons/Conclave/data/secondary"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/Conclave/data/secondary"
wiki_timestamp: "2026-06-13T21:01:44Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon") in [Conclave](/w/Conclave "Conclave") (PvP).

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/Conclave/data/doc](/w/Module:Weapons/Conclave/data/doc "Module:Weapons/Conclave/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/doc?action=edit).*

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Conclave](/w/Conclave "Conclave") weapon stat data.

Google docs on Conclave weapon stats: <https://docs.google.com/spreadsheets/d/1q2BcFDKtIz_P5RC1b0cH0JUVP_UEgyDasjQq9Ck4kV0/edit?usp=sharing>

:   *Last updated: Sat, 13 Jun 2026 21:01:44 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/secondary?diff=0))*

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
* Module:Weapons/Conclave/data/secondary - secondary guns
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

---

```lua
return {
	Acrid = {
		Accuracy = 100,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Toxin = 10 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 65,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Acrid",
		Magazine = 10,
		Reload = 1.2,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Afuris = {
		Accuracy = 15.4,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 2.3, Puncture = 10.5, Slash = 2.2 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Afuris",
		Magazine = 40,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Afuris Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 2.925, Puncture = 13.65, Slash = 2.925 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Afuris Prime",
		Magazine = 40,
		Reload = 1.2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Akbolto = {
		Accuracy = 28.6,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 2.8, Puncture = 25.1 },
				FireRate = 10,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 75,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Akbolto",
		Magazine = 30,
		Reload = 2.6,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akbolto Prime"] = {
		Accuracy = 26.7,
		AmmoMax = 160,
		Attacks = {
			{
				Damage = { Impact = 4, Puncture = 34.7, Slash = 1.6 },
				FireRate = 7,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Akbolto Prime",
		Magazine = 40,
		Reload = 1.3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akjagara = {
		Accuracy = 15.4,
		AmmoMax = 44,
		Attacks = {
			{
				BurstCount = 2,
				Damage = { Impact = 2.9, Puncture = 2.9, Slash = 13.3 },
				FireRate = 16.67,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akjagara",
		Magazine = 22,
		Reload = 2.3,
		Slot = "Secondary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Aklato = {
		Accuracy = 11.1,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 5.4, Puncture = 9, Slash = 21.6 },
				FireRate = 7.5,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Aklato",
		Magazine = 30,
		Reload = 2.4,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Aklex = {
		Accuracy = 9.8,
		AmmoMax = 48,
		Attacks = {
			{
				Damage = { Impact = 5.2, Puncture = 41.6, Slash = 5.2 },
				FireRate = 2,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Aklex",
		Magazine = 12,
		Reload = 3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Aklex Prime"] = {
		Accuracy = 9.8,
		AmmoMax = 32,
		Attacks = {
			{
				Damage = { Impact = 4.9, Puncture = 39.2, Slash = 4.9 },
				FireRate = 2.67,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Aklex Prime",
		Magazine = 16,
		Reload = 3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akmagnus = {
		Accuracy = 11.1,
		AmmoMax = 48,
		Attacks = {
			{
				Damage = { Impact = 16.2, Puncture = 9.9, Slash = 9.9 },
				FireRate = 6.17,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akmagnus",
		Magazine = 16,
		Reload = 2.4,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Aksomati = {
		Accuracy = 15.4,
		AmmoMax = 90,
		Attacks = {
			{
				Damage = { Impact = 3, Puncture = 12, Slash = 15 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Aksomati",
		Magazine = 30,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Akstiletto = {
		Accuracy = 23.5,
		AmmoMax = 84,
		Attacks = {
			{
				Damage = { Impact = 17.4, Puncture = 2.9, Slash = 8.7 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akstiletto",
		Magazine = 28,
		Reload = 1.1,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akstiletto Prime"] = {
		Accuracy = 23.5,
		AmmoMax = 90,
		Attacks = {
			{
				Damage = { Impact = 22.8, Puncture = 3.8, Slash = 11.4 },
				FireRate = 7.08,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akstiletto Prime",
		Magazine = 30,
		Reload = 1.1,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Akvasto = {
		Accuracy = 11.1,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 8.3, Puncture = 8.3, Slash = 16.5 },
				FireRate = 8.67,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akvasto",
		Magazine = 12,
		Reload = 1.8,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akvasto Prime"] = {
		Accuracy = 16,
		AmmoMax = 48,
		Attacks = {
			{
				Damage = { Impact = 6.3, Puncture = 6.3, Slash = 29.4 },
				FireRate = 6.33,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akvasto Prime",
		Magazine = 12,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akzani = {
		Accuracy = 16.7,
		AmmoMax = 150,
		Attacks = {
			{
				Damage = { Impact = 2.4, Puncture = 11.2, Slash = 2.4 },
				FireRate = 20,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Akzani",
		Magazine = 50,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Angstrum = {
		Accuracy = 26.7,
		AmmoMax = 9,
		Attacks = {
			{
				AttackName = "Single Rocket Impact",
				ChargeTime = 1.5,
				Damage = { Blast = 44.4 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{ AttackName = "Single Rocket Explosion", Damage = { Blast = 44.4 }, Range = 3 },
			{
				AmmoCost = 3,
				AttackName = "3-Rocket Barrage Impact",
				ChargeTime = 1.5,
				Damage = { Blast = 133.2 },
				Multishot = 3,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "3-Rocket Barrage Explosion",
				Damage = { Blast = 133.2 },
				Multishot = 3,
				Range = 3 
			} 
		},
		FireRate = 2,
		Link = "Conclave:Angstrum",
		Magazine = 3,
		Reload = 2.5,
		Slot = "Secondary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Arca Scisco"] = {
		Accuracy = 32,
		AmmoMax = 88,
		Attacks = {
			{
				Damage = { Puncture = 30.6, Slash = 20.4 },
				FireRate = 4.667,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Arca Scisco",
		Magazine = 22,
		Reload = 2.2,
		Slot = "Secondary",
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "2.0x", "4.0x" },
		_TooltipAttackDisplay = 1 
	},
	Atomos = {
		Accuracy = 12.5,
		AmmoMax = 90,
		Attacks = {
			{
				Damage = { Heat = 28 },
				FireRate = 8,
				HeadshotMultiplier = 1,
				Range = 8,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Atomos",
		Magazine = 30,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Azima = {
		Accuracy = 15.4,
		AmmoMax = 90,
		Attacks = {
			{
				Damage = { Impact = 2.4, Puncture = 6, Slash = 15.6 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			},
			{
				AmmoCost = 30,
				AttackName = "Launch Turret",
				Damage = { Blast = 24 },
				HeadshotMultiplier = 1.2 
			} 
		},
		Link = "Conclave:Azima",
		Magazine = 30,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Ballistica = {
		Accuracy = 4,
		AmmoMax = 64,
		Attacks = {
			{
				AttackName = "Burst Shot",
				BurstCount = 4,
				Damage = { Impact = 5, Puncture = 40, Slash = 5 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 1,
				Damage = { Impact = 10, Puncture = 80, Slash = 10 },
				FireRate = 3.33,
				IsSilent = true,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Ballistica",
		Magazine = 16,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Burst / Charge",
		_TooltipAttackDisplay = 1 
	},
	["Ballistica Prime"] = {
		Accuracy = 4,
		AmmoMax = 40,
		Attacks = {
			{
				AmmoCost = 4,
				AttackName = "Normal Shot",
				Damage = { Impact = 3.1, Puncture = 34.3, Slash = 24.4 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				Multishot = 4,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.8,
				Damage = { Impact = 6.2, Puncture = 68.6, Slash = 49.9 },
				Multishot = 4,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		BurstCount = 4,
		Link = "Conclave:Ballistica Prime",
		Magazine = 20,
		Reload = 1.2,
		Slot = "Secondary",
		Trigger = "Burst / Charge",
		_TooltipAttackDisplay = 1 
	},
	Bolto = {
		Accuracy = 26.7,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 4.5, Puncture = 40.5 },
				FireRate = 6.83,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 75,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Bolto",
		Magazine = 15,
		Reload = 1.3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Brakk = {
		Accuracy = 5.6,
		AmmoMax = 15,
		Attacks = {
			{
				Damage = { Impact = 4.5, Puncture = 2.5, Slash = 3 },
				Falloff = { EndRange = 22, Reduction = 0.4, StartRange = 11 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				Multishot = 10,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Brakk",
		Magazine = 5,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Bronco = {
		Accuracy = 3.7,
		AmmoMax = 10,
		Attacks = {
			{
				Damage = { Impact = 18.6, Puncture = 2.3, Slash = 2.3 },
				Falloff = { EndRange = 14, Reduction = 0.25, StartRange = 7 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Bronco",
		Magazine = 2,
		Reload = 1.05,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Bronco Prime"] = {
		Accuracy = 3.7,
		AmmoMax = 12,
		Attacks = {
			{
				Damage = { Impact = 13.6, Puncture = 1.7, Slash = 1.7 },
				Falloff = { EndRange = 18, Reduction = 0.25, StartRange = 9 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Bronco Prime",
		Magazine = 4,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Castanas = {
		Accuracy = 100,
		AmmoMax = 8,
		Attacks = {
			{
				Damage = { Electricity = 85, Impact = 25 },
				FireRate = 5,
				HeadshotMultiplier = 1,
				IsSilent = true,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Castanas",
		Magazine = 2,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	Cestra = {
		Accuracy = 33.3,
		AmmoMax = 90,
		Attacks = {
			{
				Damage = { Impact = 8, Puncture = 32 },
				FireRate = 8.33,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Cestra",
		Magazine = 30,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Cycron = {
		Accuracy = 100,
		AmmoMax = 20,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Puncture = 6.6, Radiation = 8.3, Slash = 4.1 },
				FireRate = 12,
				HeadshotMultiplier = 1.2,
				PunchThrough = 1,
				Range = 12,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Cycron",
		Magazine = 20,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Despair = {
		Accuracy = 100,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 4.4, Puncture = 70.8, Slash = 13.3 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Despair",
		Magazine = 10,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Detron = {
		Accuracy = 7.1,
		AmmoMax = 15,
		Attacks = {
			{
				Damage = { Radiation = 20 },
				Falloff = { EndRange = 22, Reduction = 0.33, StartRange = 13 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				ShotSpeed = 150,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Detron",
		Magazine = 5,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dex Furis"] = {
		Accuracy = 15.4,
		AmmoMax = 150,
		Attacks = {
			{
				Damage = { Impact = 2.1, Puncture = 9.8, Slash = 2.1 },
				FireRate = 20,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Dex Furis",
		Magazine = 50,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dex Pixia"] = {
		Accuracy = 23,
		AmmoMax = 240,
		Attacks = {
			{
				Damage = { Impact = 6.5, Puncture = 6.5, Slash = 52 },
				FireRate = 5.83,
				HeadshotMultiplier = 1,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Dex Pixia",
		Magazine = 60,
		Reload = 0.3,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dual Cestra"] = {
		Accuracy = 20,
		AmmoMax = 180,
		Attacks = {
			{
				Damage = { Impact = 5.4, Puncture = 21.6 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Dual Cestra",
		Magazine = 60,
		Reload = 3.5,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dual Toxocyst"] = {
		Accuracy = 16,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 6, Puncture = 48, Slash = 6 },
				FireRate = 1,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Dual Toxocyst",
		Magazine = 12,
		Reload = 2.3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Embolist = {
		Accuracy = 100,
		AmmoMax = 50,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Toxin = 5 },
				FireRate = 8,
				HeadshotMultiplier = 1,
				Range = 9,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Embolist",
		Magazine = 10,
		Reload = 1.3,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Euphona Prime"] = {
		Accuracy = 100,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 115.2, Puncture = 6.4, Slash = 6.4 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 180,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Alt-fire",
				Damage = { Impact = 1.15, Puncture = 4.6, Slash = 17.25 },
				Falloff = { EndRange = 12, Reduction = 0, StartRange = 6 },
				HeadshotMultiplier = 1.2,
				Multishot = 10 
			} 
		},
		Link = "Conclave:Euphona Prime",
		Magazine = 5,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Furis = {
		Accuracy = 22.2,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 3.9, Puncture = 18.2, Slash = 3.9 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Furis",
		Magazine = 20,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Fusilai = {
		Accuracy = 100,
		AmmoMax = 24,
		Attacks = {
			{
				AttackName = "Full Auto Mode",
				Damage = { Puncture = 36.9, Slash = 55.4 },
				FireRate = 2.83,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 40,
				ShotType = "Projectile" 
			},
			{
				AmmoCost = 3,
				AttackName = "Semi-Auto Mode",
				Damage = { Puncture = 68.4, Slash = 102.6 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.5,
				Multishot = 3,
				ShotSpeed = 40,
				ShotType = "Projectile",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Fusilai",
		Magazine = 6,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Gammacor = {
		Accuracy = 100,
		AmmoMax = 80,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Magnetic = 20 },
				FireRate = 12,
				HeadshotMultiplier = 1,
				Range = 14,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Gammacor",
		Magazine = 20,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Hikou = {
		Accuracy = 100,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 5.3, Puncture = 31.6, Slash = 15.8 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Hikou",
		Magazine = 20,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Hikou Prime"] = {
		Accuracy = 100,
		AmmoMax = 52,
		Attacks = {
			{
				Damage = { Impact = 5.2, Puncture = 44.1, Slash = 2.6 },
				FireRate = 5.83,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Hikou Prime",
		Magazine = 26,
		Reload = 0.5,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Knell = {
		AmmoMax = 5,
		Attacks = {
			{
				Damage = { Impact = 22.3, Puncture = 24.4, Slash = 6.4 },
				FireRate = 4,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Knell",
		Magazine = 1,
		Reload = 1,
		Slot = "Secondary",
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Kohmak = {
		Accuracy = 3.6,
		AmmoMax = 60,
		Attacks = {
			{
				AttackName = "Single Pellet",
				Damage = { Impact = 2.4, Puncture = 2.4, Slash = 7.2 },
				Falloff = { EndRange = 24, Reduction = 0.33, StartRange = 12 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				PunchThrough = 1.5,
				ShotType = "Hit-Scan" 
			},
			{
				AmmoCost = 1.67,
				AttackName = "Fully Spooled",
				Damage = { Impact = 2.4, Puncture = 2.4, Slash = 7.2 },
				Falloff = { EndRange = 24, Reduction = 0.33, StartRange = 12 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				Multishot = 5,
				PunchThrough = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Kohmak",
		Magazine = 30,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Kraken = {
		Accuracy = 16,
		AmmoMax = 42,
		Attacks = {
			{
				BurstCount = 2,
				Damage = { Impact = 45, Puncture = 7.5, Slash = 7.5 },
				FireRate = 4.42,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		BurstCount = 2,
		BurstFireRate = 2.83,
		Link = "Conclave:Kraken",
		Magazine = 14,
		Reload = 2.5,
		Slot = "Secondary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Kulstar = {
		Accuracy = 26.7,
		AmmoMax = 6,
		Attacks = {
			{
				AttackName = "Rocket Impact",
				Damage = { Impact = 91 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{ AttackName = "Rocket Explosion", Damage = { Blast = 143 }, ShotType = "AoE" },
			{
				AttackName = "Cluster Bombs",
				Damage = { Blast = 143 },
				HeadshotMultiplier = 1,
				Multishot = 3,
				ShotSpeed = 8,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Kulstar",
		Magazine = 3,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Kunai = {
		Accuracy = 100,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 8.8, Puncture = 66.2, Slash = 13.2 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Kunai",
		Magazine = 10,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Lato = {
		Accuracy = 18.2,
		AmmoMax = 45,
		Attacks = {
			{
				Damage = { Impact = 10.8, Puncture = 10.8, Slash = 21.5 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Lato",
		Magazine = 15,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Lato Prime"] = {
		Accuracy = 18.2,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 4.4, Puncture = 8.8, Slash = 30.8 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Lato Prime",
		Magazine = 20,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Lato Vandal"] = {
		Accuracy = 23,
		AmmoMax = 45,
		Attacks = {
			{
				Damage = { Impact = 8.1, Puncture = 13.5, Slash = 32.4 },
				FireRate = 5,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Lato Vandal",
		Magazine = 15,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Lex = {
		Accuracy = 16,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 10.5, Puncture = 84, Slash = 10.5 },
				FireRate = 1.08,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Lex",
		Magazine = 6,
		Reload = 2.3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Lex Prime"] = {
		Accuracy = 16,
		AmmoMax = 32,
		Attacks = {
			{
				Damage = { Impact = 7.8, Puncture = 62.4, Slash = 7.8 },
				FireRate = 2.08,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Lex Prime",
		Magazine = 8,
		Reload = 2.3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Furis"] = {
		Accuracy = 22.2,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 4.8, Puncture = 22.4, Slash = 4.8 },
				FireRate = 8.33,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Mk1-Furis",
		Magazine = 20,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Kunai"] = {
		Accuracy = 100,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 8.8, Puncture = 66, Slash = 13.2 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Mk1-Kunai",
		Magazine = 10,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Magnus = {
		Accuracy = 16,
		AmmoMax = 32,
		Attacks = {
			{
				Damage = { Impact = 26.1, Puncture = 16, Slash = 15.9 },
				FireRate = 5.83,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Magnus",
		Magazine = 8,
		Reload = 1.4,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mara Detron"] = {
		Accuracy = 13.3,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Radiation = 16 },
				Falloff = { EndRange = 30, Reduction = 0.375, StartRange = 16 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Mara Detron",
		Magazine = 8,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Marelok = {
		Accuracy = 10,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 40, Puncture = 8, Slash = 32 },
				FireRate = 2,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Marelok",
		Magazine = 6,
		Reload = 1.7,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Nukor = {
		Accuracy = 100,
		AmmoMax = 60,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Radiation = 23 },
				FireRate = 10,
				HeadshotMultiplier = 1,
				Range = 16,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Nukor",
		Magazine = 15,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Pandero = {
		Accuracy = 16,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 14, Puncture = 14, Slash = 28 },
				FireRate = 3,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			},
			{
				Accuracy = 8.2,
				AmmoCost = 8,
				Damage = { Impact = 11.3, Puncture = 11.3, Slash = 22.5 },
				FireRate = 7.69,
				Trigger = "Burst" 
			} 
		},
		Link = "Conclave:Pandero",
		Magazine = 8,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Pox = {
		Accuracy = 100,
		AmmoMax = 12,
		Attacks = {
			{
				AttackName = "Spore Impact",
				Damage = { Puncture = 3, Toxin = 36 },
				FireRate = 2.08,
				HeadshotMultiplier = 1,
				IsSilent = true,
				ShotSpeed = 30,
				ShotType = "Projectile" 
			},
			{ AttackName = "Poison Cloud", Damage = { Toxin = 36 }, Duration = 1 } 
		},
		Link = "Conclave:Pox",
		Magazine = 4,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Angstrum"] = {
		Accuracy = 26.7,
		AmmoMax = 9,
		Attacks = {
			{
				AttackName = "Single Rocket Impact",
				ChargeTime = 0.6,
				Damage = { Blast = 47 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{ AttackName = "Single Rocket Explosion", Damage = { Blast = 47 }, Range = 3 },
			{
				AmmoCost = 3,
				AttackName = "3-Rocket Barrage Impact",
				ChargeTime = 0.6,
				Damage = { Blast = 141 },
				Multishot = 3,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "3-Rocket Barrage Explosion",
				Damage = { Blast = 141 },
				Multishot = 3,
				Range = 3,
				ShotType = "AoE" 
			} 
		},
		FireRate = 2,
		Link = "Conclave:Prisma Angstrum",
		Magazine = 3,
		Reload = 1.8,
		Slot = "Secondary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Twin Gremlins"] = {
		Accuracy = 36.4,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 3.2, Puncture = 13.7, Slash = 12.2 },
				FireRate = 8.83,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 90,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Prisma Twin Gremlins",
		Magazine = 50,
		Reload = 0.9,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Pyrana = {
		Accuracy = 5,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 0.6, Puncture = 0.6, Slash = 4.9 },
				Falloff = { EndRange = 30, Reduction = 0.27, StartRange = 15 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.2,
				Multishot = 12,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Pyrana",
		Magazine = 10,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Pyrana Prime"] = {
		Accuracy = 6.1,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 0.48, Puncture = 0.48, Slash = 5.04 },
				Falloff = { EndRange = 36, Reduction = 0.27, StartRange = 18 },
				FireRate = 4,
				HeadshotMultiplier = 1.2,
				Multishot = 12,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Pyrana Prime",
		Magazine = 10,
		Reload = 1.6,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Rakta Ballistica"] = {
		Accuracy = 4,
		AmmoMax = 40,
		Attacks = {
			{
				AttackName = "Burst Shot",
				BurstCount = 4,
				Damage = { Impact = 2.5, Puncture = 44, Slash = 2.5 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 1,
				Damage = { Impact = 5, Puncture = 89.1, Slash = 5 },
				FireRate = 3.33,
				IsSilent = true,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Rakta Ballistica",
		Magazine = 20,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Burst / Charge",
		_TooltipAttackDisplay = 1 
	},
	Regulators = {
		AmmoMax = 400,
		Attacks = {
			{
				Damage = { Impact = 17, Puncture = 8.5, Slash = 8.5 },
				FireRate = 14.8,
				HeadshotMultiplier = 1,
				Multishot = 2,
				Range = 50,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Regulators",
		Magazine = 100,
		Reload = 1.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Sancti Castanas"] = {
		Accuracy = 100,
		AmmoMax = 8,
		Attacks = {
			{
				Damage = { Electricity = 85, Impact = 25 },
				FireRate = 5,
				HeadshotMultiplier = 1,
				IsSilent = true,
				Range = 3,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Sancti Castanas",
		Magazine = 2,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	["Secura Dual Cestra"] = {
		Accuracy = 20,
		AmmoMax = 180,
		Attacks = {
			{
				Damage = { Impact = 5.4, Puncture = 21.6 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Secura Dual Cestra",
		Magazine = 60,
		Reload = 3.5,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Seer = {
		Accuracy = 16,
		AmmoMax = 16,
		Attacks = {
			{
				Damage = { Blast = 40, Impact = 28.3, Puncture = 28.3, Slash = 28.3 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 200,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Seer",
		Magazine = 8,
		Reload = 2.8,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Sicarus = {
		Accuracy = 20,
		AmmoMax = 45,
		Attacks = {
			{
				BurstCount = 3,
				Damage = { Impact = 20.3, Puncture = 4.4, Slash = 4.3 },
				FireRate = 7.39,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		BurstFireRate = 3.5,
		Link = "Conclave:Sicarus",
		Magazine = 15,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Sicarus Prime"] = {
		Accuracy = 25,
		AmmoMax = 63,
		Attacks = {
			{
				BurstCount = 3,
				Damage = { Impact = 10, Puncture = 7.5, Slash = 7.5 },
				FireRate = 9.38,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		BurstFireRate = 5,
		Link = "Conclave:Sicarus Prime",
		Magazine = 21,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Sonicor = {
		Accuracy = 100,
		AmmoMax = 16,
		Attacks = {
			{
				AttackName = "Projectile Impact",
				Damage = { Impact = 0.5 },
				Falloff = { EndRange = 20, Reduction = 0.8333, StartRange = 0 },
				FireRate = 1.25,
				HeadshotMultiplier = 1,
				Range = 15,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Explosion",
				Damage = { Impact = 0.5 },
				HeadshotMultiplier = 1,
				Range = 1.5,
				ShotType = "AoE" 
			} 
		},
		Link = "Conclave:Sonicor",
		Magazine = 8,
		Reload = 3,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Spectra = {
		Accuracy = 100,
		AmmoMax = 90,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Puncture = 8, Slash = 11 },
				FireRate = 12,
				HeadshotMultiplier = 1,
				PunchThrough = 0.5,
				Range = 18,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Spectra",
		Magazine = 30,
		Reload = 1.8,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Spira = {
		Accuracy = 100,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 8.9, Puncture = 53.1, Slash = 26.6 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Spira",
		Magazine = 10,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Spira Prime"] = {
		Accuracy = 100,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 8.3, Puncture = 66.2, Slash = 8.3 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Spira Prime",
		Magazine = 12,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Staticor = {
		Accuracy = 16.7,
		AmmoMax = 45,
		Attacks = {
			{
				AttackName = "Uncharged Projectile",
				Damage = { Electricity = 43.3 },
				FireRate = 3.5,
				HeadshotMultiplier = 1,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Uncharged Explosion",
				Damage = { Electricity = 43.4 },
				Range = 8,
				ShotType = "AoE" 
			},
			{
				AmmoCost = 5,
				AttackName = "Fully Charged Projectile",
				ChargeTime = 3,
				Damage = { Electricity = 43.4 },
				ShotSpeed = 40,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Fully Charged Explosion",
				Damage = { Electricity = 43.4 },
				Range = 8,
				ShotType = "AoE" 
			} 
		},
		Link = "Conclave:Staticor",
		Magazine = 45,
		Reload = 1.5,
		Slot = "Secondary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Stubba = {
		Accuracy = 16,
		AmmoMax = 99,
		Attacks = {
			{
				Damage = { Impact = 18.1, Puncture = 4.2, Slash = 19.7 },
				FireRate = 6.33,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Stubba",
		Magazine = 33,
		Reload = 1.3,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Stug = {
		AmmoMax = 60,
		Attacks = {
			{
				AttackName = "Normal Shot",
				Damage = { Corrosive = 46 },
				FireRate = 4,
				HeadshotMultiplier = 1,
				ShotSpeed = 35,
				ShotType = "Projectile" 
			},
			{
				AmmoCost = 6,
				AttackName = "Charged Shot",
				ChargeTime = 3,
				Damage = { Corrosive = 46 },
				ShotSpeed = 35,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Stug",
		Magazine = 20,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Synoid Gammacor"] = {
		Accuracy = 100,
		AmmoMax = 80,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Magnetic = 19 },
				FireRate = 12,
				HeadshotMultiplier = 1,
				Range = 20,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Synoid Gammacor",
		Magazine = 20,
		Reload = 1.8,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Talons = {
		Accuracy = 100,
		AmmoMax = 16,
		Attacks = {
			{
				Damage = { Blast = 18.5, Impact = 1.1 },
				FireRate = 5,
				HeadshotMultiplier = 1,
				ShotSpeed = 30,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Talons",
		Magazine = 4,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	["Telos Akbolto"] = {
		Accuracy = 26.7,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 2.8, Puncture = 25.2 },
				FireRate = 10,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 75,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Telos Akbolto",
		Magazine = 30,
		Reload = 2.6,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Grakatas"] = {
		Accuracy = 28.6,
		AmmoMax = 180,
		Attacks = {
			{
				AmmoCost = 2,
				Damage = { Impact = 5.6, Puncture = 4.7, Slash = 3.7 },
				FireRate = 20,
				HeadshotMultiplier = 1.2,
				Multishot = 2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Twin Grakatas",
		Magazine = 60,
		Reload = 3,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Gremlins"] = {
		Accuracy = 16.7,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 20.5, Puncture = 20.5, Slash = 20.5 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				ShotSpeed = 90,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Twin Gremlins",
		Magazine = 30,
		Reload = 1.1,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Kohmak"] = {
		Accuracy = 3,
		AmmoMax = 120,
		Attacks = {
			{
				AttackName = "Single Pellet",
				Damage = { Impact = 2.7, Puncture = 2.7, Slash = 7.2 },
				Falloff = { EndRange = 24, Reduction = 0.33, StartRange = 12 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.2,
				PunchThrough = 1.5,
				ShotType = "Hit-Scan" 
			},
			{
				AmmoCost = 1.67,
				AttackName = "Fully Spooled",
				Damage = { Impact = 20.4, Puncture = 20.4, Slash = 70.2 },
				Multishot = 5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Twin Kohmak",
		Magazine = 40,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Twin Rogga"] = {
		Accuracy = 4.3,
		AmmoMax = 12,
		Attacks = {
			{
				Damage = { Impact = 4, Puncture = 5, Slash = 1 },
				Falloff = { EndRange = 20, Reduction = 0.21, StartRange = 10 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.2,
				Multishot = 15,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Twin Rogga",
		Magazine = 2,
		Reload = 1.5,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Vipers"] = {
		Accuracy = 15.4,
		AmmoMax = 84,
		Attacks = {
			{
				Damage = { Impact = 9, Puncture = 1.5, Slash = 4.5 },
				FireRate = 25,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Twin Vipers",
		Magazine = 28,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Vipers Wraith"] = {
		Accuracy = 11.1,
		AmmoMax = 80,
		Attacks = {
			{
				Damage = { Impact = 11.2, Puncture = 1.4, Slash = 1.4 },
				FireRate = 25,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Twin Vipers Wraith",
		Magazine = 40,
		Reload = 2,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Tysis = {
		Accuracy = 100,
		AmmoMax = 44,
		Attacks = {
			{
				Damage = { Corrosive = 45 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 75,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Tysis",
		Magazine = 11,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Vasto = {
		Accuracy = 16,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 16.3, Puncture = 16.3, Slash = 32.5 },
				FireRate = 5,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vasto",
		Magazine = 6,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vasto Prime"] = {
		Accuracy = 16,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 8.9, Puncture = 8.9, Slash = 41.3 },
				FireRate = 5.42,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vasto Prime",
		Magazine = 6,
		Reload = 1,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vaykor Marelok"] = {
		Accuracy = 10,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 43.8, Puncture = 7.3, Slash = 21.9 },
				FireRate = 2,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vaykor Marelok",
		Magazine = 10,
		Reload = 1.7,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Viper = {
		Accuracy = 15.4,
		AmmoMax = 56,
		Attacks = {
			{
				Damage = { Impact = 16.2, Puncture = 2.7, Slash = 8.1 },
				FireRate = 14.38,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Viper",
		Magazine = 14,
		Reload = 0.7,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Viper Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 20, Puncture = 2.5, Slash = 2.5 },
				FireRate = 14.38,
				HeadshotMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Viper Wraith",
		Magazine = 20,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Zakti = {
		Accuracy = 26.7,
		AmmoMax = 15,
		Attacks = {
			{
				AttackName = "Dart Impact",
				Damage = { Impact = 9.2, Puncture = 13.8 },
				FireRate = 5,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{ AttackName = "Gas Cloud", Damage = { Gas = 35 }, Range = 1.5 } 
		},
		Link = "Conclave:Zakti",
		Magazine = 3,
		Reload = 0.8,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Zylok = {
		Accuracy = 23.5,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 20.2, Puncture = 7.6, Slash = 35.3 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Zylok",
		Magazine = 8,
		Reload = 1.2,
		Slot = "Secondary",
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	} 
}
```

