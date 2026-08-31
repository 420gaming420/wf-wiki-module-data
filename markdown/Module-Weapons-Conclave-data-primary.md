---
title: "Module:Weapons/Conclave/data/primary"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/Conclave/data/primary"
wiki_timestamp: "2026-06-13T20:57:13Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Primary Weapons](/w/Primary_Weapon "Primary Weapon") in [Conclave](/w/Conclave "Conclave") (PvP).

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/Conclave/data/doc](/w/Module:Weapons/Conclave/data/doc "Module:Weapons/Conclave/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/doc?action=edit).*

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Conclave](/w/Conclave "Conclave") weapon stat data.

Google docs on Conclave weapon stats: <https://docs.google.com/spreadsheets/d/1q2BcFDKtIz_P5RC1b0cH0JUVP_UEgyDasjQq9Ck4kV0/edit?usp=sharing>

:   *Last updated: Sat, 13 Jun 2026 20:57:13 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/Conclave/data/primary?diff=0))*

## Contents

* [1 Horizontal Partitions (and where to update data)](#Horizontal_Partitions_(and_where_to_update_data))
* [2 Attack Data Schema](#Attack_Data_Schema)
* [3 Gun Entry Schema](#Gun_Entry_Schema)
* [4 Melee Entry Schema](#Melee_Entry_Schema)
* [5 For Module Use](#For_Module_Use)
* [6 Weapon Data](#Weapon_Data)

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Weapons/Conclave/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* Module:Weapons/Conclave/data/primary - primary guns
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

---

```lua
return {
	Amprex = {
		Accuracy = 12.5,
		AmmoMax = 120,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Electricity = 16.94 },
				FireRate = 12,
				HeadshotMultiplier = 1,
				PvPDamageMultiplier = 0.77,
				Range = 10,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Amprex",
		Magazine = 40,
		Reload = 2.6,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Arca Plasmor"] = {
		Accuracy = 9.1,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Radiation = 160 },
				Falloff = { EndRange = 20, Reduction = 0.6667, StartRange = 10 },
				FireRate = 1.1,
				HeadshotMultiplier = 1,
				PvPDamageMultiplier = 0.2667,
				Range = 15,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Arca Plasmor",
		Magazine = 6,
		Reload = 2.8,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Argonak = {
		Accuracy = 28.6,
		AmmoMax = 63,
		Attacks = {
			{
				AttackName = "Semi-Auto Mode",
				Damage = { Impact = 24.51, Puncture = 6.27, Slash = 26.22 },
				FireRate = 4.33,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			},
			{
				AttackName = "Full Auto Mode",
				Damage = { Impact = 20.8335, Puncture = 5.3295, Slash = 22.287 },
				FireRate = 6,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.85,
				ShotType = "Hit-Scan",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Argonak",
		Magazine = 21,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Auto / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Artemis Bow"] = {
		Accuracy = 100,
		Attacks = {
			{
				Damage = { Impact = 14.7, Puncture = 84, Slash = 6.3 },
				FireRate = 1,
				HeadshotMultiplier = 1.2,
				IsSilent = true,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 50,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 1,
				Damage = { Impact = 14.7, Puncture = 84, Slash = 6.3 },
				FireRate = 1,
				HeadshotMultiplier = 1.2,
				IsSilent = true,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 50,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Artemis Bow",
		Magazine = 1,
		Reload = 0.9,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Astilla = {
		Accuracy = 25,
		AmmoMax = 24,
		Attacks = {
			{
				AttackName = "Slug Impact",
				Damage = { Impact = 40 },
				FireRate = 4.33,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Glass Explosion",
				Damage = { Puncture = 12, Slash = 18 },
				Falloff = { EndRange = 1.5, Reduction = 0, StartRange = 0 },
				FireRate = 4.33,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.25,
				ShotType = "AoE" 
			} 
		},
		Link = "Conclave:Astilla",
		Magazine = 8,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Attica = {
		Accuracy = 40,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 4.28, Puncture = 64.2, Slash = 17.12 },
				FireRate = 3.67,
				HeadshotMultiplier = 1.5,
				IsSilent = true,
				PvPDamageMultiplier = 1.07,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Attica",
		Magazine = 20,
		Reload = 2.8,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Baza = {
		Accuracy = 80,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 5.9904, Puncture = 6.9888, Slash = 3.6608 },
				Falloff = { EndRange = 34, Reduction = 0.5, StartRange = 22 },
				FireRate = 16.67,
				HeadshotMultiplier = 1.2,
				IsSilent = true,
				PvPDamageMultiplier = 1.04,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Baza",
		Magazine = 40,
		Reload = 1.4,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Boar = {
		Accuracy = 5,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 6.05, Puncture = 1.65, Slash = 3.3 },
				Falloff = { EndRange = 25, Reduction = 0.5, StartRange = 15 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.2,
				Multishot = 8,
				PvPDamageMultiplier = 0.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Boar",
		Magazine = 20,
		Reload = 2.7,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Boar Prime"] = {
		Accuracy = 5,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 6.24, Puncture = 1.44, Slash = 1.92 },
				Falloff = { EndRange = 25, Reduction = 0.7, StartRange = 18 },
				FireRate = 4.67,
				HeadshotMultiplier = 1.2,
				Multishot = 8,
				PvPDamageMultiplier = 0.24,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Boar Prime",
		Magazine = 20,
		Reload = 2.75,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Boltor = {
		Accuracy = 25,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 3.65, Puncture = 29.2, Slash = 3.65 },
				FireRate = 8.75,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.46,
				ShotSpeed = 85,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Boltor",
		Magazine = 30,
		Reload = 2.6,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Boltor Prime"] = {
		Accuracy = 50,
		AmmoMax = 144,
		Attacks = {
			{
				Damage = { Impact = 3.22, Puncture = 28.98 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.7,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Boltor Prime",
		Magazine = 36,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Braton = {
		Accuracy = 28.6,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 10.9296, Puncture = 10.9296, Slash = 11.2608 },
				FireRate = 8.75,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.38,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Braton",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Braton Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 140,
		Attacks = {
			{
				Damage = { Impact = 1.4875, Puncture = 10.4125, Slash = 17.85 },
				FireRate = 9.58,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.85,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Braton Prime",
		Magazine = 35,
		Reload = 2.2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Braton Vandal"] = {
		Accuracy = 33.3,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Impact = 13.23, Puncture = 1.89, Slash = 22.68 },
				FireRate = 7.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.08,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Braton Vandal",
		Magazine = 30,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Burston = {
		Accuracy = 25,
		AmmoMax = 120,
		Attacks = {
			{
				BurstCount = 3,
				BurstDelay = 0.061,
				BurstFireRate = 5,
				Damage = { Impact = 11.682, Puncture = 11.682, Slash = 11.682 },
				FireRate = 7.83,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 1.18,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Burston",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Burston Prime"] = {
		Accuracy = 25,
		AmmoMax = 120,
		Attacks = {
			{
				BurstCount = 3,
				BurstDelay = 0.04,
				BurstFireRate = 10,
				Damage = { Impact = 6.48, Puncture = 6.48, Slash = 8.64 },
				FireRate = 13.64,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.6,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Burston Prime",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Buzlok = {
		Accuracy = 13.3,
		AmmoMax = 100,
		Attacks = {
			{
				Damage = { Impact = 30, Puncture = 24, Slash = 6 },
				FireRate = 6.25,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotSpeed = 80,
				ShotType = "Projectile",
				Trigger = "Auto" 
			},
			{
				Accuracy = 16.7,
				AttackName = "Beacon",
				Damage = { Puncture = 10 },
				FireRate = 1.67,
				HeadshotMultiplier = 1.2,
				IsSilent = true,
				PvPDamageMultiplier = 3.333,
				ShotSpeed = 200,
				ShotType = "Projectile",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Buzlok",
		Magazine = 20,
		Reload = 3,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Cernos = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 80.1, Puncture = 4.5, Slash = 4.5 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.4684,
				ShotSpeed = 105,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 131.4, Puncture = 7.3, Slash = 7.3 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.3842,
				ShotSpeed = 130,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Cernos",
		Magazine = 1,
		Reload = 0.6,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	["Cernos Prime"] = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot (Horizontal)",
				Damage = { Impact = 34.5, Puncture = 2.3, Slash = 9.2 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				Multishot = 3,
				IsSilent = true,
				PvPDamageMultiplier = 0.1667,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot (Horizontal)",
				ChargeTime = 0.5,
				Damage = { Impact = 76.5, Puncture = 4.3, Slash = 4.3 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				Multishot = 3,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.15416667,
				ShotSpeed = 95,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Uncharged Shot (Vertical)",
				Damage = { Impact = 34.5, Puncture = 2.3, Slash = 9.2 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				Multishot = 3,
				PvPDamageMultiplier = 0.1667,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot (Vertical)",
				ChargeTime = 0.5,
				Damage = { Impact = 76.5, Puncture = 4.3, Slash = 4.3 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				Multishot = 3,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.15416667,
				ShotSpeed = 95,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Cernos Prime",
		Magazine = 1,
		Reload = 1,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Corinth = {
		Accuracy = 9.1,
		AmmoMax = 22,
		Attacks = {
			{
				AttackName = "Buckshot",
				Damage = { Impact = 7.56, Puncture = 11.34, Slash = 8.1 },
				Falloff = { EndRange = 36, Reduction = 0.33, StartRange = 18 },
				FireRate = 1.17,
				HeadshotMultiplier = 1.2,
				Multishot = 6,
				PvPDamageMultiplier = 0.3,
				ShotType = "Hit-Scan" 
			},
			{
				AttackName = "Air Burst Projectile",
				Damage = { Impact = 160 },
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Air Burst Explosion",
				Damage = { Blast = 220 },
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				Range = 3.5 
			} 
		},
		Link = "Conclave:Corinth",
		Magazine = 5,
		Reload = 2.3,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Daikyu = {
		Accuracy = 16.7,
		AmmoMax = 15,
		Attacks = {
			{
				AttackName = "Charged Shot",
				ChargeTime = 1,
				Damage = { Impact = 55.8, Puncture = 74.4, Slash = 55.8 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 4,
				IsSilent = true,
				PunchThrough = 3,
				PvPDamageMultiplier = 0.265714285714,
				ShotSpeed = 180,
				ShotType = "Projectile" 
			},
			{
				AttackName = "With Spring-Loaded Broadhead (15m away)",
				ChargeTime = 1,
				Damage = { Impact = 78.1, Puncture = 104.16, Slash = 78.1 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 4,
				IsSilent = true,
				PunchThrough = 3,
				PvPDamageMultiplier = 0.265714285714,
				ShotSpeed = 180,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Daikyu",
		Magazine = 1,
		Reload = 0.6,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Dera = {
		Accuracy = 100,
		AmmoMax = 100,
		Attacks = {
			{
				Damage = { Impact = 6.12, Puncture = 22.95, Slash = 1.53 },
				FireRate = 11.25,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.02,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Dera",
		Magazine = 25,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dera Vandal"] = {
		Accuracy = 100,
		AmmoMax = 140,
		Attacks = {
			{
				Damage = { Impact = 5.888, Puncture = 22.08, Slash = 1.472 },
				FireRate = 11.25,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.92,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Dera Vandal",
		Magazine = 35,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dex Sybaris"] = {
		Accuracy = 28.6,
		AmmoMax = 56,
		Attacks = {
			{
				BurstCount = 2,
				BurstDelay = 0.09,
				BurstFireRate = 3.33,
				Damage = { Impact = 16.875, Puncture = 14.0625, Slash = 25.3125 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.75,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Dex Sybaris",
		Magazine = 14,
		Reload = 1.5,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Drakgoon = {
		Accuracy = 1.4,
		AmmoMax = 21,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 1.44, Puncture = 1.44, Slash = 11.52 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.2,
				Multishot = 10,
				PunchThrough = 1.5,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 1.44, Puncture = 1.44, Slash = 11.52 },
				HeadshotMultiplier = 1.2,
				Multishot = 10,
				PunchThrough = 2,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Drakgoon",
		Magazine = 7,
		Reload = 2.3,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Dread = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 3.1, Puncture = 3.1, Slash = 55.8 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.369047619048,
				ShotSpeed = 95,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 6.2, Puncture = 6.2, Slash = 111.6 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				PunchThrough = 2.5,
				PvPDamageMultiplier = 0.369047619048,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Dread",
		Magazine = 1,
		Reload = 0.7,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Ferrox = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 13.125, Puncture = 91.875, Slash = 26.25 },
				FireRate = 1.33,
				HeadshotMultiplier = 1.5,
				PunchThrough = 1.5,
				PvPDamageMultiplier = 0.375,
				ShotType = "Hit-Scan",
				Trigger = "Charge" 
			},
			{
				AttackName = "Charged Spear Throw",
				ChargeTime = 0.5,
				Damage = { Impact = 105, Puncture = 22.5, Slash = 22.5 },
				FireRate = 1,
				PvPDamageMultiplier = 1,
				ShotSpeed = 90,
				ShotType = "Projectile",
				Trigger = "Charge" 
			} 
		},
		Link = "Conclave:Ferrox",
		Magazine = 10,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Flux Rifle"] = {
		Accuracy = 100,
		AmmoMax = 20,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Puncture = 4.4, Slash = 15.6 },
				FireRate = 12,
				HeadshotMultiplier = 1.2,
				PunchThrough = 0.5,
				Range = 20,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Flux Rifle",
		Magazine = 20,
		Reload = 1,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Glaxion = {
		Accuracy = 100,
		AmmoMax = 120,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Cold = 18 },
				FireRate = 12,
				HeadshotMultiplier = 1.2,
				Range = 12,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Glaxion",
		Magazine = 30,
		Reload = 2.2,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Gorgon = {
		Accuracy = 12.5,
		AmmoMax = 180,
		Attacks = {
			{
				Damage = { Impact = 22.875, Puncture = 4.575, Slash = 3.05 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.22,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Gorgon",
		Magazine = 60,
		Reload = 4.2,
		Slot = "Primary",
		Spool = 15,
		SpoolFireRateStart = 0.2,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Gorgon Wraith"] = {
		Accuracy = 16.7,
		AmmoMax = 180,
		Attacks = {
			{
				Damage = { Impact = 21.114, Puncture = 2.484, Slash = 1.242 },
				FireRate = 13.3,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.92,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Gorgon Wraith",
		Magazine = 60,
		Reload = 3,
		Slot = "Primary",
		Spool = 10,
		SpoolFireRateStart = 0.2,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Grakata = {
		Accuracy = 28.6,
		AmmoMax = 160,
		Attacks = {
			{
				Damage = { Impact = 7.04, Puncture = 5.808, Slash = 4.6933 },
				FireRate = 20,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.6,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Grakata",
		Magazine = 40,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Grinlok = {
		Accuracy = 44.4,
		AmmoMax = 27,
		Attacks = {
			{
				Damage = { Impact = 46.75, Puncture = 9.35, Slash = 37.4 },
				FireRate = 1.67,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Grinlok",
		Magazine = 9,
		Reload = 1.7,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Harpak = {
		AmmoMax = 135,
		Attacks = {
			{
				Accuracy = 18.2,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.1,
				BurstFireRate = 5,
				Damage = { Impact = 4.95, Puncture = 37.125, Slash = 7.425 },
				FireRate = 6,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.99,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{
				Accuracy = 100,
				AttackName = "Harpoon",
				Damage = { Impact = 40, Puncture = 50, Slash = 10 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				Range = 40,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			} 
		},
		BurstFireRate = 5,
		Link = "Conclave:Harpak",
		Magazine = 45,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Hek = {
		Accuracy = 9.1,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 2.925, Puncture = 12.675, Slash = 3.9 },
				Falloff = { EndRange = 20, Reduction = 0.2, StartRange = 10 },
				FireRate = 2.17,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				PvPDamageMultiplier = 0.26,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Hek",
		Magazine = 4,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Hema = {
		Accuracy = 20,
		AmmoMax = 42,
		Attacks = {
			{
				BurstCount = 3,
				BurstDelay = 0.1,
				BurstFireRate = 5,
				Damage = { Viral = 45 },
				FireRate = 6,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotSpeed = 150,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Hema",
		Magazine = 42,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Hind = {
		AmmoMax = 120,
		Attacks = {
			{
				Accuracy = 33.3,
				AttackName = "Burst Mode",
				BurstCount = 5,
				BurstDelay = 0.12,
				BurstFireRate = 5,
				Damage = { Impact = 9.6, Puncture = 9.6, Slash = 19.2 },
				FireRate = 6.25,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.28,
				ShotType = "Hit-Scan",
				Trigger = "Burst" 
			},
			{
				Accuracy = 28.6,
				AttackName = "Semi-Auto Mode",
				Damage = { Impact = 12, Puncture = 12, Slash = 36 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotType = "Hit-Scan",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Hind",
		Magazine = 40,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Ignis = {
		Accuracy = 100,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Heat = 24 },
				FireRate = 8,
				HeadshotMultiplier = 1,
				Range = 8,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Ignis",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Ignis Wraith"] = {
		Accuracy = 100,
		AmmoMax = 120,
		Attacks = {
			{
				Damage = { Heat = 22 },
				FireRate = 8,
				HeadshotMultiplier = 1,
				Range = 10,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Ignis Wraith",
		Magazine = 40,
		Reload = 1.7,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Javlok = {
		AmmoMax = 18,
		Attacks = {
			{
				Accuracy = 100,
				AttackName = "Projectile Impact",
				ChargeTime = 0.3,
				Damage = { Heat = 160 },
				FireRate = 3.33,
				HeadshotMultiplier = 1,
				PvPDamageMultiplier = 1,
				ShotSpeed = 150,
				ShotType = "Projectile",
				Trigger = "Charge" 
			},
			{
				AttackName = "Projectile Explosion",
				Damage = { Heat = 132 },
				Falloff = { EndRange = 1.6, Reduction = 1, StartRange = 0 },
				PvPDamageMultiplier = 1,
				Range = 1.6,
				ShotType = "AoE" 
			},
			{
				Accuracy = 16.7,
				AttackName = "Charged Spear Throw",
				ChargeTime = 0.5,
				Damage = { Impact = 45, Puncture = 75, Slash = 30 },
				FireRate = 1,
				PvPDamageMultiplier = 1,
				ShotSpeed = 90,
				ShotType = "Projectile",
				Trigger = "Charge" 
			},
			{
				AttackName = "Charged Spear Explosion",
				Damage = { Heat = 300 },
				Falloff = { EndRange = 4, Reduction = 1, StartRange = 0 },
				FireRate = 1,
				PvPDamageMultiplier = 1,
				Range = 4,
				ShotType = "AoE" 
			} 
		},
		Link = "Conclave:Javlok",
		Magazine = 6,
		Reload = 1.9,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Karak = {
		Accuracy = 28.6,
		AmmoMax = 80,
		Attacks = {
			{
				Damage = { Impact = 14.094, Puncture = 9.396, Slash = 7.83 },
				FireRate = 11.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultipler = 1.08,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Karak",
		Magazine = 20,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Karak Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 140,
		Attacks = {
			{
				Damage = { Impact = 12.1365, Puncture = 8.091, Slash = 6.7425 },
				FireRate = 11.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.87,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Karak Wraith",
		Magazine = 35,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Lanka = {
		Accuracy = 100,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				ChargeTime = 1,
				Damage = { Electricity = 46 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				PvPDamageMultiplier = 0.23,
				ShotSpeed = 200,
				ShotType = "Projectile",
				Trigger = "Semi-Auto" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 1,
				Damage = { Electricity = 120.75 },
				HeadshotMultiplier = 2,
				PunchThrough = 5,
				PvPDamageMultiplier = 0.23,
				ShotSpeed = 250,
				ShotType = "Projectile",
				Trigger = "Charge" 
			} 
		},
		Link = "Conclave:Lanka",
		Magazine = 10,
		Reload = 2,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 6,
		Trigger = "Charge",
		Zoom = {
			"3x (+20% Critical Chance)",
			"5x (+30% Critical Chance)",
			"8x (+50% Critical Chance)" 
		},
		_TooltipAttackDisplay = 1 
	},
	Latron = {
		Accuracy = 28.6,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 9.9, Puncture = 46.2, Slash = 9.9 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 1.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Latron",
		Magazine = 15,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Latron Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 5.85, Puncture = 46.8, Slash = 5.85 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.65,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Latron Prime",
		Magazine = 15,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Latron Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 13.35, Puncture = 37.38, Slash = 2.67 },
				FireRate = 5.42,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.89,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Latron Wraith",
		Magazine = 15,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Lenz = {
		Accuracy = 16.7,
		AmmoMax = 3,
		Attacks = {
			{
				AttackName = "Charged Shot",
				ChargeTime = 1.2,
				Damage = { Impact = 20 },
				FireRate = 1,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Initial Burst",
				Damage = { Cold = 10 },
				HeadshotMultiplier = 1.5,
				Range = 3 
			},
			{ AttackName = "Bubble Collapse", Damage = { Blast = 170 }, Range = 5 } 
		},
		Link = "Conclave:Lenz",
		Magazine = 1,
		Reload = 1,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Braton"] = {
		Accuracy = 40,
		AmmoMax = 100,
		Attacks = {
			{
				Damage = { Impact = 9.45, Puncture = 9.45, Slash = 18.9 },
				FireRate = 7.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 2.1,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Mk1-Braton",
		Magazine = 25,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Paris"] = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 3.15, Puncture = 47.65, Slash = 12.7 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.552173913043,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 6.3, Puncture = 95.3, Slash = 25.4 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 6,
				IsSilent = true,
				PunchThrough = 2,
				PvPDamageMultiplier = 0.552173913043,
				ShotSpeed = 85,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Mk1-Paris",
		Magazine = 1,
		Reload = 0.6,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	["Mk1-Strun"] = {
		Accuracy = 4,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 9.504, Puncture = 2.592, Slash = 5.184 },
				Falloff = { EndRange = 25, Reduction = 0.5, StartRange = 15 },
				FireRate = 2.08,
				HeadshotMultiplier = 1.2,
				Multishot = 10,
				PvPDamageMultiplier = 0.96,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Mk1-Strun",
		Magazine = 6,
		Reload = 3.8,
		ReloadStyle = "ByRound",
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Miter = {
		Accuracy = 100,
		AmmoMax = 20,
		AmmoType = "Sniper",
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 4.05, Puncture = 4.05, Slash = 72.45 },
				FireRate = 2.5,
				HeadshotMultiplier = 2,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.75,
				Damage = { Impact = 8.1, Puncture = 8.1, Slash = 144.9 },
				HeadshotMultiplier = 2,
				PunchThrough = 2.5,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Miter",
		Magazine = 10,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Mutalist Cernos"] = {
		Accuracy = 16.7,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 36, Puncture = 3, Slash = 3 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				PvPDamageMultiplier = 0.19512195122,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 72, Puncture = 4, Slash = 4 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				PvPDamageMultiplier = 0.19512195122,
				ShotSpeed = 85,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Mutalist Cernos",
		Magazine = 1,
		Reload = 0.6,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Ogris = {
		Accuracy = 100,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Rocket Impact",
				ChargeTime = 0.3,
				Damage = { Blast = 180 },
				FireRate = 1.5,
				HeadshotMultiplier = 1,
				ShotSpeed = 60,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Rocket Explosion",
				Damage = { Blast = 180 },
				HeadshotMultiplier = 1,
				Range = 4.75 
			} 
		},
		Link = "Conclave:Ogris",
		Magazine = 5,
		Reload = 2.5,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Opticor = {
		Accuracy = 100,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Charged Shot",
				ChargeTime = 2,
				Damage = { Impact = 23.2, Puncture = 197.2, Slash = 11.6 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Opticor",
		Magazine = 5,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	["Opticor Vandal"] = {
		Accuracy = 100,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.6,
				Damage = { Impact = 25.8, Puncture = 51.5, Slash = 14.7 },
				FireRate = 2,
				HeadshotMultiplier = 2,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Opticor Vandal",
		Magazine = 8,
		Reload = 1.4,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 1 
	},
	Panthera = {
		Accuracy = 100,
		AmmoMax = 120,
		Attacks = {
			{
				AmmoCost = 2,
				Damage = { Impact = 19.2, Puncture = 9.6, Slash = 67.2 },
				FireRate = 3,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.96,
				ShotSpeed = 60,
				ShotType = "Projectile",
				Trigger = "Auto" 
			},
			{
				AmmoCost = 1,
				Damage = { Impact = 5, Puncture = 5, Slash = 40 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.5,
				Range = 3,
				ShotType = "Discharge",
				Trigger = "Held" 
			} 
		},
		Link = "Conclave:Panthera",
		Magazine = 40,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto / Held",
		_TooltipAttackDisplay = 1 
	},
	Paris = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 3.9, Puncture = 62.4, Slash = 11.7 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.4875,
				ShotSpeed = 105,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 7.8, Puncture = 124.8, Slash = 23.4 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				PunchThrough = 2,
				PvPDamageMultiplier = 0.4875,
				ShotSpeed = 140,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Paris",
		Magazine = 1,
		Reload = 0.7,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	["Paris Prime"] = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 2.4, Puncture = 76.8, Slash = 16.8 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.466666666667,
				ShotSpeed = 110,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				Damage = { Impact = 4.2, Puncture = 134.4, Slash = 29.4 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				PunchThrough = 3,
				PvPDamageMultiplier = 0.466666666667,
				ShotSpeed = 140,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Paris Prime",
		Magazine = 1,
		Reload = 0.7,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Penta = {
		Accuracy = 100,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Grenade Impact",
				Damage = { Blast = 157.5, Impact = 14 },
				FireRate = 1,
				HeadshotMultiplier = 1,
				ShotSpeed = 20,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Grenade Detonation",
				Damage = { Blast = 157.5 },
				Range = 3.5,
				ShotType = "AoE",
				Trigger = "Active" 
			} 
		},
		Link = "Conclave:Penta",
		Magazine = 5,
		Reload = 2.5,
		Slot = "Primary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	Phantasma = {
		Accuracy = 100,
		AmmoMax = 28,
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = { Impact = 1.5, Radiation = 3 },
				FireRate = 12,
				HeadshotMultiplier = 1.2,
				Multishot = 6,
				PvPDamageMultiplier = 0.3,
				Range = 9.5,
				ShotType = "Discharge",
				Trigger = "Held" 
			},
			{
				AmmoCost = 7,
				AttackName = "Plasma Bomb Impact",
				ChargeTime = 0.64,
				Damage = { Impact = 10 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.6667,
				ShotType = "Projectile",
				Trigger = "Charge" 
			},
			{
				AmmoCost = 7,
				AttackName = "Plasma Bomb Explosion",
				ChargeTime = 0.64,
				Damage = { Radiation = 26 },
				Falloff = { EndRange = 4.8, Reduction = 0.5, StartRange = 0 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.3562,
				Range = 4.8,
				ShotType = "AoE" 
			} 
		},
		Link = "Conclave:Phantasma",
		Magazine = 7,
		Reload = 0.5,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Gorgon"] = {
		Accuracy = 20,
		AmmoMax = 240,
		Attacks = {
			{
				Damage = { Impact = 17.25, Puncture = 3.45, Slash = 2.3 },
				FireRate = 14.17,
				HeadshotMultiplier = 1.2,
				PvPDamageMultipler = 1,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Prisma Gorgon",
		Magazine = 80,
		Reload = 3,
		Slot = "Primary",
		Spool = 12,
		SpoolStartFireRate = 0.2,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Grakata"] = {
		Accuracy = 28.6,
		AmmoMax = 200,
		Attacks = {
			{
				Damage = { Impact = 6, Puncture = 4.9999, Slash = 4 },
				FireRate = 21.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Prisma Grakata",
		Magazine = 50,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Grinlok"] = {
		Accuracy = 44.4,
		AmmoMax = 42,
		Attacks = {
			{
				Damage = { Impact = 37.4, Puncture = 9.35, Slash = 46.75 },
				FireRate = 1.67,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.5,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Prisma Grinlok",
		Magazine = 21,
		Reload = 1.7,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Tetra"] = {
		Accuracy = 18.2,
		AmmoMax = 160,
		Attacks = {
			{
				Damage = { Impact = 9.12, Puncture = 36.48 },
				FireRate = 7.08,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.2,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Prisma Tetra",
		Magazine = 40,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Quartakk = {
		Accuracy = 90.9,
		AmmoMax = 208,
		Attacks = {
			{
				BurstCount = 4,
				BurstDelay = 0,
				BurstFireRate = 1.5833,
				Damage = { Impact = 9.4276, Puncture = 7.3892, Slash = 8.6632 },
				FireRate = 6.33,
				HeadshotMultiplier = 1.2,
				PunchThrough = 0.5,
				PvPDamageMultiplier = 0.52,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Quartakk",
		Magazine = 52,
		Reload = 1.7,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Rakta Cernos"] = {
		Accuracy = 16.7,
		AmmoMax = 20,
		Attacks = {
			{
				AttackName = "Uncharged Shot",
				Damage = { Impact = 38.25, Puncture = 2.15, Slash = 2.15 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				IsSilent = true,
				PvPDamageMultiplier = 0.181063829787,
				ShotSpeed = 70,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Charged Shot",
				ChargeTime = 0.25,
				Damage = { Impact = 76.5, Puncture = 4.3, Slash = 4.3 },
				FireRate = 1,
				HeadshotMultiplier = 2,
				HoldTime = 5,
				IsSilent = true,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.181063829787,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Rakta Cernos",
		Magazine = 1,
		Reload = 0.6,
		Slot = "Primary",
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Rubico = {
		Accuracy = 13.3,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 88.56, Puncture = 16.605, Slash = 5.535 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 2.67,
				HeadshotMultiplier = 2,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.615,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Rubico",
		Magazine = 5,
		Reload = 2.4,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "3.5x (+100% Headshot Damage)", "6x (+100% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	["Rubico Prime"] = {
		Accuracy = 13.3,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 61.336, Puncture = 11.5005, Slash = 3.8335 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 3.67,
				HeadshotMultiplier = 2,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.41,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Rubico Prime",
		Magazine = 5,
		Reload = 2,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+100% Headshot Damage)", "5.0x (+100% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	["Sancti Tigris"] = {
		Accuracy = 6.5,
		AmmoMax = 14,
		Attacks = {
			{
				Damage = { Impact = 9, Puncture = 9, Slash = 72 },
				Falloff = { EndRange = 20, Reduction = 0.429, StartRange = 8 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				Multishot = 6,
				PvPDamageMultiplier = 0.75,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Sancti Tigris",
		Magazine = 2,
		Reload = 1.5,
		Slot = "Primary",
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	},
	Scourge = {
		AmmoMax = 24,
		Attacks = {
			{
				Accuracy = 100,
				AttackName = "Projectile Impact",
				Damage = { Corrosive = 70 },
				FireRate = 2.67,
				HeadshotMultiplier = 1,
				PvPDamageMultiplier = 1,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			},
			{
				AttackName = "Projectile Explosion",
				Damage = { Corrosive = 55 },
				FireRate = 2.67,
				PvPDamageMultiplier = 1,
				ShotType = "AoE" 
			},
			{
				Accuracy = 16.7,
				AttackName = "Charged Spear Throw",
				ChargeTime = 0.5,
				Damage = { Impact = 105, Puncture = 22.5, Slash = 22.5 },
				FireRate = 1,
				HeadshotMultiplier = 1,
				PvPDamageMultiplier = 1,
				Trigger = "Charge" 
			} 
		},
		Link = "Conclave:Scourge",
		Magazine = 12,
		Reload = 2.5,
		Slot = "Primary",
		Trigger = "Auto / Charge",
		_TooltipAttackDisplay = 1 
	},
	["Secura Penta"] = {
		Accuracy = 100,
		AmmoMax = 14,
		Attacks = {
			{
				AttackName = "Grenade Impact",
				Damage = { Blast = 139.4, Impact = 16.4 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 25,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Grenade Detonation",
				Damage = { Blast = 139.4 },
				HeadshotMultiplier = 1,
				Range = 3.5,
				ShotType = "AoE",
				Trigger = "Active" 
			} 
		},
		Link = "Conclave:Secura Penta",
		Magazine = 7,
		Reload = 2.5,
		Slot = "Primary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	Simulor = {
		Accuracy = 100,
		AmmoMax = 10,
		Attacks = {
			{
				AttackName = "Orb Damage",
				Damage = { Impact = 13, Puncture = 13, Slash = 13 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				Range = 12,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Orb Explosion",
				Damage = { Electricity = 41 },
				HeadshotMultiplier = 1,
				Range = 1,
				ShotType = "AoE" 
			},
			{ AttackName = "Orb Merge", Damage = { Magnetic = 50 } } 
		},
		Link = "Conclave:Simulor",
		Magazine = 10,
		Reload = 3,
		Slot = "Primary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	Snipetron = {
		Accuracy = 13.3,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 13.212, Puncture = 105.696, Slash = 13.212 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 2,
				HeadshotMultiplier = 1.4,
				PunchThrough = 2.5,
				PvPDamageMultiplier = 0.734,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Snipetron",
		Magazine = 4,
		Reload = 3.5,
		Slot = "Primary",
		SniperComboMin = 3,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+130% Headshot Damage)", "6x (+150% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	["Snipetron Vandal"] = {
		Accuracy = 13.3,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 5.25, Puncture = 94.5, Slash = 5.25 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 2,
				HeadshotMultiplier = 1.4,
				PunchThrough = 3,
				PvPDamageMultiplier = 0.525,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Snipetron Vandal",
		Magazine = 6,
		Reload = 2,
		Slot = "Primary",
		SniperComboMin = 3,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+130% Headshot Damage)", "6x (+150% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	Sobek = {
		Accuracy = 9.1,
		AmmoMax = 40,
		Attacks = {
			{
				Damage = { Impact = 13.65, Puncture = 2.275, Slash = 2.275 },
				Falloff = { EndRange = 30, Reduction = 0.5, StartRange = 20 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.2,
				Multishot = 5,
				PvPDamageMultiplier = 0.26,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Sobek",
		Magazine = 20,
		Reload = 2.7,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Soma = {
		Accuracy = 28.6,
		AmmoMax = 200,
		Attacks = {
			{
				Damage = { Impact = 2.064, Puncture = 8.256, Slash = 10.32 },
				FireRate = 15,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.72,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Soma",
		Magazine = 50,
		Reload = 3,
		Slot = "Primary",
		Spool = 10,
		SpoolStartFireRate = 0.25,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Soma Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 210,
		Attacks = {
			{
				Damage = { Impact = 1.872, Puncture = 7.488, Slash = 9.36 },
				FireRate = 15,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.56,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Soma Prime",
		Magazine = 70,
		Reload = 3,
		Slot = "Primary",
		Spool = 5,
		SpoolStartFireRate = 0.25,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Stradavar = {
		AmmoMax = 120,
		Attacks = {
			{
				Accuracy = 14.3,
				AttackName = "Full Auto Mode",
				Damage = { Impact = 10.486, Puncture = 10.486, Slash = 8.988 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.07,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			},
			{
				Accuracy = 28.6,
				AttackName = "Semi-Auto Mode",
				Damage = { Impact = 7.5, Puncture = 30, Slash = 12.5 },
				FireRate = 5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotType = "Hit-Scan",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Stradavar",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Stradavar Prime"] = {
		AmmoMax = 120,
		Attacks = {
			{
				Accuracy = 25,
				AttackName = "Full Auto Mode",
				Damage = { Impact = 9.18, Puncture = 9.18, Slash = 8.1 },
				FireRate = 10,
				HeadshotMultipier = 1.2,
				PvPDamageMultiplier = 0.9,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			},
			{
				Accuracy = 66.7,
				AmmoCost = 2,
				AttackName = "Semi-Auto Mode",
				Damage = { Impact = 6.72, Puncture = 20.16, Slash = 40.32 },
				FireRate = 3.33,
				HeadshotMultiplier = 1.2,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.84,
				ShotType = "Hit-Scan",
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Stradavar Prime",
		Magazine = 40,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Strun = {
		Accuracy = 4,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 7.5625, Puncture = 2.0625, Slash = 4.125 },
				Falloff = { EndRange = 25, Reduction = 0.6, StartRange = 12 },
				FireRate = 2.5,
				HeadshotMultiplier = 1.2,
				Multishot = 12,
				PvPDamageMultiplier = 0.55,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Strun",
		Magazine = 6,
		Reload = 3.8,
		ReloadStyle = "ByRound",
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Strun Wraith"] = {
		Accuracy = 6.7,
		AmmoMax = 30,
		Attacks = {
			{
				Damage = { Impact = 8.06, Puncture = 1.86, Slash = 2.48 },
				Falloff = { EndRange = 30, Reduction = 0.5, StartRange = 15 },
				FireRate = 2.5,
				ForcedProcs = { "Stagger" },
				HeadshotMultiplier = 1.2,
				Multishot = 10,
				PvPDamageMultiplier = 0.31,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Strun Wraith",
		Magazine = 10,
		Reload = 5,
		ReloadStyle = "ByRound",
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Supra = {
		Accuracy = 14.3,
		AmmoMax = 240,
		Attacks = {
			{
				Damage = { Impact = 2.56, Puncture = 19.2, Slash = 3.84 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.64,
				ShotSpeed = 110,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Supra",
		Magazine = 80,
		Reload = 3,
		Slot = "Primary",
		Spool = 8,
		SpoolStartFireRate = 0.1,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Supra Vandal"] = {
		Accuracy = 26.6,
		AmmoMax = 200,
		Attacks = {
			{
				Damage = { Impact = 2.16, Puncture = 16.2, Slash = 3.24 },
				FireRate = 12.5,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.54,
				ShotSpeed = 110,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Supra Vandal",
		Magazine = 100,
		Reload = 3,
		Slot = "Primary",
		Spool = 8,
		SpoolStartFireRate = 0.2,
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Sybaris = {
		Accuracy = 28.6,
		AmmoMax = 50,
		Attacks = {
			{
				BurstCount = 2,
				BurstDelay = 0.105,
				BurstFireRate = 3.33,
				Damage = { Impact = 21.648, Puncture = 21.648, Slash = 22.304 },
				FireRate = 3.98,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.82,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Sybaris",
		Magazine = 10,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Sybaris Prime"] = {
		Accuracy = 25,
		AmmoMax = 48,
		Attacks = {
			{
				BurstCount = 2,
				BurstDelay = 0.062,
				BurstFireRate = 3.33,
				Damage = { Impact = 18.876, Puncture = 18.876, Slash = 19.448 },
				FireRate = 4.72,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.65,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Sybaris Prime",
		Magazine = 16,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Synapse = {
		Accuracy = 100,
		AmmoMax = 100,
		Attacks = {
			{
				AmmoCost = 0.5,
				Damage = { Corrosive = 18 },
				FireRate = 12,
				HeadshotMultiplier = 1.2,
				Range = 15,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Synapse",
		Magazine = 25,
		Reload = 1.5,
		Slot = "Primary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Synoid Simulor"] = {
		Accuracy = 100,
		AmmoMax = 15,
		Attacks = {
			{
				AttackName = "Orb Damage",
				Damage = { Impact = 13, Puncture = 13, Slash = 13 },
				FireRate = 2.67,
				HeadshotMultiplier = 1.5,
				ShotSpeed = 80,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Orb Explosion",
				Damage = { Electricity = 41 },
				HeadshotMultiplier = 1,
				Range = 1,
				ShotType = "AoE" 
			},
			{ AttackName = "Orb Merge", Damage = { Magnetic = 50 } } 
		},
		Link = "Conclave:Synoid Simulor",
		Magazine = 15,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	["Telos Boltor"] = {
		Accuracy = 25,
		AmmoMax = 168,
		Attacks = {
			{
				Damage = { Impact = 3.3, Puncture = 29.7 },
				FireRate = 9.33,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.1,
				ShotSpeed = 90,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Telos Boltor",
		Magazine = 42,
		Reload = 2.4,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Tenora = {
		Accuracy = 12.5,
		AmmoMax = 280,
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = { Impact = 7.92, Puncture = 10.56, Slash = 7.92 },
				FireRate = 11.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.1,
				ShotType = "Hit-Scan",
				Trigger = "Auto-Spool" 
			},
			{
				AmmoCost = 10,
				AttackName = "Charged Shot",
				ChargeTime = 0.8,
				Damage = { Impact = 26.15, Puncture = 78.5, Slash = 26.15 },
				FireRate = 10,
				HeadshotMultiplier = 1.2,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.545,
				ShotType = "Hit-Scan",
				Trigger = "Charge" 
			} 
		},
		Link = "Conclave:Tenora",
		Magazine = 70,
		Reload = 2.5,
		Slot = "Primary",
		Spool = 16,
		SpoolStartFireRate = 0.4,
		Trigger = "Auto-Spool / Charge",
		_TooltipAttackDisplay = 1 
	},
	Tetra = {
		Accuracy = 18.2,
		AmmoMax = 160,
		Attacks = {
			{
				Damage = { Impact = 9.856, Puncture = 39.424 },
				FireRate = 6.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1.54,
				ShotSpeed = 100,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Tetra",
		Magazine = 40,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Tiberon = {
		Accuracy = 33.3,
		AmmoMax = 84,
		Attacks = {
			{
				BurstCount = 3,
				BurstDelay = 0.06,
				BurstFireRate = 6.667,
				Damage = { Impact = 6.29, Puncture = 12.58, Slash = 6.29 },
				FireRate = 9.09,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.74,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Tiberon",
		Magazine = 21,
		Reload = 2.3,
		Slot = "Primary",
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Tiberon Prime"] = {
		Accuracy = 33.3,
		AmmoMax = 60,
		Attacks = {
			{
				AttackName = "Burst",
				BurstCount = 3,
				BurstDelay = 0.08,
				BurstFireRate = 6,
				Damage = { Impact = 8.349, Puncture = 11.132, Slash = 8.349 },
				FireRate = 7.38,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.605,
				ShotType = "Hit-Scan",
				Trigger = "Burst" 
			},
			{
				AttackName = "Semi",
				Damage = { Impact = 9.936, Puncture = 13.248, Slash = 9.936 },
				FireRate = 6,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.72,
				ShotType = "Hit-Scan",
				Trigger = "Semi-Auto" 
			},
			{
				AttackName = "Auto",
				Damage = { Impact = 8.694, Puncture = 11.592, Slash = 8.694 },
				FireRate = 8.33,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.63,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			} 
		},
		Link = "Conclave:Tiberon Prime",
		Magazine = 30,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Burst / Semi-Auto / Auto",
		_TooltipAttackDisplay = 1 
	},
	Tigris = {
		Accuracy = 9.1,
		AmmoMax = 14,
		Attacks = {
			{
				Damage = { Impact = 2.94, Puncture = 2.94, Slash = 23.52 },
				Falloff = { EndRange = 20, Reduction = 0.476, StartRange = 10 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				Multishot = 5,
				PvPDamageMultiplier = 0.14,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Tigris",
		Magazine = 2,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	},
	["Tigris Prime"] = {
		Accuracy = 9.1,
		AmmoMax = 14,
		Attacks = {
			{
				Damage = { Impact = 1.8525, Puncture = 1.8525, Slash = 14.82 },
				Falloff = { EndRange = 20, Reduction = 0.514, StartRange = 10 },
				FireRate = 2,
				HeadshotMultiplier = 1.2,
				Multishot = 8,
				PvPDamageMultiplier = 0.095,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Tigris Prime",
		Magazine = 2,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	},
	Tonkor = {
		Accuracy = 100,
		AmmoMax = 8,
		Attacks = {
			{
				AttackName = "Grenade Impact",
				Damage = { Puncture = 12.4 },
				FireRate = 2,
				HeadshotMultiplier = 1,
				ShotSpeed = 45,
				ShotType = "Projectile" 
			},
			{ AttackName = "Grenade Explosion", Damage = { Blast = 189.1 }, Range = 3 } 
		},
		Link = "Conclave:Tonkor",
		Magazine = 2,
		Reload = 2,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vaykor Hek"] = {
		Accuracy = 9.1,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 2.25, Puncture = 9.75, Slash = 3 },
				Falloff = { EndRange = 25, Reduction = 0.267, StartRange = 10 },
				FireRate = 3,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				PvPDamageMultiplier = 0.2,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vaykor Hek",
		Magazine = 8,
		Reload = 2.3,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Vectis = {
		Accuracy = 13.3,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 44.1, Puncture = 38.5875, Slash = 27.5625 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.4,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.49,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vectis",
		Magazine = 1,
		Reload = 1,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "3x Zoom (+130% Headshot Damage)", "4.5x Zoom (+150% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	["Vectis Prime"] = {
		Accuracy = 13.3,
		AmmoMax = 20,
		Attacks = {
			{
				Damage = { Impact = 43.12, Puncture = 48.51, Slash = 16.17 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 2.67,
				HeadshotMultiplier = 1.4,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.308,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vectis Prime",
		Magazine = 2,
		Reload = 0.9,
		Slot = "Primary",
		SniperComboMin = 5,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = { "3.5x (+140% Headshot Damage)", "6x (+160% Headshot Damage)" },
		_TooltipAttackDisplay = 1 
	},
	Veldt = {
		Accuracy = 32,
		AmmoMax = 66,
		Attacks = {
			{
				Damage = { Impact = 17.316, Puncture = 17.316, Slash = 31.968 },
				FireRate = 3.67,
				HeadshotMultiplier = 1.5,
				PvPDamageMultiplier = 0.74,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Veldt",
		Magazine = 26,
		Reload = 1.8,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Vulkar = {
		Accuracy = 13.3,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 81, Puncture = 15.1875, Slash = 5.0625 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 1.5,
				HeadshotMultiplier = 1.4,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.45,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vulkar",
		Magazine = 6,
		Reload = 3,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = {
			"2.5x zoom (+35% Headshot Damage)",
			"4x zoom (+55% Headshot Damage)",
			"8x zoom (+70% Headshot Damage)" 
		},
		_TooltipAttackDisplay = 1 
	},
	["Vulkar Wraith"] = {
		Accuracy = 13.3,
		AmmoMax = 24,
		Attacks = {
			{
				Damage = { Impact = 88.452, Puncture = 9.828 },
				Falloff = { EndRange = 600, StartRange = 400 },
				FireRate = 2,
				HeadshotMultiplier = 1.4,
				PunchThrough = 1,
				PvPDamageMultiplier = 0.36,
				ShotType = "Hit-Scan" 
			} 
		},
		Link = "Conclave:Vulkar Wraith",
		Magazine = 8,
		Reload = 3,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 2,
		Trigger = "Semi-Auto",
		Zoom = {
			"2.5x zoom (+35% Headshot Damage)",
			"4x zoom (+55% Headshot Damage)",
			"8x zoom (+70% Headshot Damage)" 
		},
		_TooltipAttackDisplay = 1 
	},
	Zarr = {
		AmmoMax = 12,
		Attacks = {
			{
				Accuracy = 100,
				AttackName = "Cannon Mode Projectile",
				Damage = { Impact = 25 },
				FireRate = 1.67,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				ShotSpeed = 40,
				ShotType = "Projectile" 
			},
			{
				AttackName = "Cannon Mode Explosion",
				Damage = { Blast = 137.5 },
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 1,
				Range = 5,
				ShotType = "AoE" 
			},
			{
				AttackName = "Cannon Mode Cluster Bombs",
				Damage = { Blast = 137.5 },
				HeadshotMultiplier = 1.2,
				Multishot = 6,
				PvPDamageMultiplier = 1,
				ShotType = "AoE" 
			},
			{
				Accuracy = 1.4,
				AttackName = "Barrage Mode",
				Damage = { Impact = 12, Puncture = 20, Slash = 8 },
				FireRate = 3,
				HeadshotMultiplier = 1.2,
				Multishot = 7,
				PunchThrough = 1.6,
				PvPDamageMultiplier = 0.5,
				Range = 10,
				ShotSpeed = 120,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Zarr",
		Magazine = 3,
		Reload = 2.3,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Zenith = {
		Accuracy = 33.3,
		AmmoMax = 100,
		Attacks = {
			{
				AttackName = "Full Auto Mode",
				Damage = { Impact = 4.23, Puncture = 5.64, Slash = 18.33 },
				FireRate = 10.83,
				HeadshotMultiplier = 1.2,
				PvPDamageMultiplier = 0.94,
				ShotType = "Hit-Scan",
				Trigger = "Auto" 
			},
			{
				AmmoCost = 5,
				AttackName = "Semi-Auto Mode",
				Damage = { Impact = 10.8, Puncture = 86.4, Slash = 10.8 },
				FireRate = 3,
				HeadshotMultiplier = 1.2,
				PunchThrough = 99999,
				PvPDamageMultiplier = 0.72,
				Trigger = "Semi-Auto" 
			} 
		},
		Link = "Conclave:Zenith",
		Magazine = 20,
		Reload = 1.6,
		Slot = "Primary",
		Trigger = "Auto / Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Zhuge = {
		Accuracy = 40,
		AmmoMax = 60,
		Attacks = {
			{
				Damage = { Impact = 4.2, Puncture = 63, Slash = 16.8 },
				FireRate = 4.17,
				HeadshotMultiplier = 1.2,
				IsSilent = true,
				PvPDamageMultiplier = 0.84,
				ShotSpeed = 90,
				ShotType = "Projectile" 
			} 
		},
		Link = "Conclave:Zhuge",
		Magazine = 20,
		Reload = 2.5,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	} 
}
```

