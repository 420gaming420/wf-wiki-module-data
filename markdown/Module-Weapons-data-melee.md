---
title: "Module:Weapons/data/melee"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/melee"
wiki_timestamp: "2026-08-27T04:18:50Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [melee](/w/Melee "Melee") [weapons](/w/Weapons "Weapons").

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/data/doc?action=edit).*

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Weapons/data/melee?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Update ExplosionDelay key to store a 2-tuple value (2-element table) for minimum delay and maximum delay.
Add a new Radius key that is distinct from Range. This is to account for projectiles with a radius. (e.g. [![](/images/thumb/Miter.png/32px-Miter.png?23f64)](/w/Miter "Miter") [Miter](/w/Miter "Miter") w/ 0.2m)

Hey! You! Here to update something that's out of date? Follow these easy steps:

1. Open the relevant [Horizontal Partition](/w/Module:Weapons/data#Horizontal_Partitions_(and_where_to_update_data) "Module:Weapons/data") and click "Edit Source" on the top right of the page.
2. Use `CTRL+F` to find the data for the weapon.
3. Find the number/string that's wrong.
4. Change the number/string and save the page.

That's it! After you've done that, the data will proliferate out to all the relevant pages.

If you're adding new data instead of just changing existing data, try to use an example of how things are entered if you're not quite sure what to do.

(Oh, order doesn't matter, but spelling and capitalization do. For example, it doesn't matter if Disposition is first or last)

Thanks, you're awesome!

[User:Falterfire](/w/User:Falterfire "User:Falterfire")

## Contents

* [1 Horizontal Partitions (and where to update data)](#Horizontal_Partitions_(and_where_to_update_data))
* [2 Attack Data Schema](#Attack_Data_Schema)
* [3 Gun Entry Schema](#Gun_Entry_Schema)
* [4 Melee Entry Schema](#Melee_Entry_Schema)
* [5 For Module Use](#For_Module_Use)
* [6 Preprocessed Data](#Preprocessed_Data)
* [7 Export Data](#Export_Data)
* [8 Weapon Edge Cases](#Weapon_Edge_Cases)
* [9 Where To Source Weapon Data](#Where_To_Source_Weapon_Data)
  + [9.1 Where To Find Weapon Metadata](#Where_To_Find_Weapon_Metadata)
* [10 Data Validation](#Data_Validation)
  + [10.1 Validate data types of key-value pairs](#Validate_data_types_of_key-value_pairs)
  + [10.2 Checking missing keys](#Checking_missing_keys)
  + [10.3 Validate Attack tables](#Validate_Attack_tables)
  + [10.4 Validate required weapon table keys](#Validate_required_weapon_table_keys)
* [11 Weapon Data](#Weapon_Data)
* [12 References](#References)

:   *Last updated: Thu, 27 Aug 2026 04:18:50 +0000 (UTC) by [User:Evilflora](/w/User:Evilflora "User:Evilflora") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/melee?diff=0))*

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* [Module:Weapons/data/primary](/w/Module:Weapons/data/primary "Module:Weapons/data/primary") - [Primary Weapons](/w/Primary_Weapon "Primary Weapon")
* [Module:Weapons/data/secondary](/w/Module:Weapons/data/secondary "Module:Weapons/data/secondary") - [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon")
* Module:Weapons/data/melee - [Melee](/w/Melee "Melee") weapons
* [Module:Weapons/data/archwing](/w/Module:Weapons/data/archwing "Module:Weapons/data/archwing") - [Archguns](/w/Archgun "Archgun") and [Archmelees](/w/Archmelee "Archmelee")
* [Module:Weapons/data/companion](/w/Module:Weapons/data/companion "Module:Weapons/data/companion") - [Companion](/w/Companion "Companion") weapons
* [Module:Weapons/data/railjack](/w/Module:Weapons/data/railjack "Module:Weapons/data/railjack") - [Railjack](/w/Railjack "Railjack") turrets and ordnances
* [Module:Weapons/data/modular](/w/Module:Weapons/data/modular "Module:Weapons/data/modular") - [Amps](/w/Amp "Amp"), [Zaws](/w/Zaw "Zaw"), and [Kitguns](/w/Kitgun "Kitgun")
* [Module:Weapons/data/misc](/w/Module:Weapons/data/misc "Module:Weapons/data/misc") - everything else

For [Conclave](/w/Conclave "Conclave") data:

* [Module:Weapons/Conclave/data/primary](/w/Module:Weapons/Conclave/data/primary "Module:Weapons/Conclave/data/primary") - Primary Weapons
* [Module:Weapons/Conclave/data/secondary](/w/Module:Weapons/Conclave/data/secondary "Module:Weapons/Conclave/data/secondary") - Secondary Weapons
* [Module:Weapons/Conclave/data/melee](/w/Module:Weapons/Conclave/data/melee "Module:Weapons/Conclave/data/melee") - Melee Weapons

## Attack Data Schema

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-2 "Edit section's source code: Attack Data Schema")]

```lua
	{
		AttackIndex = 1,
		AttackName = "Normal Attack",
		AmmoCost = 1,
		BurstCount = 1,
		Damage = { Impact = 1, Puncture = 1, Slash = 1 },
		CritChance = 0.1,
		CritMultiplier = 1,
		StatusChance = 0.1,
		FireRate = 1.0,
		Falloff = { StartRange = 400, EndRange = 600, Reduction = 0.2 },
		ShotType = "Hit-Scan",
		ShotSpeed = 1,
		Trigger = "Semi-Auto"
	},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `AttackIndex` | N/A | N/A | N/A | Number (integer) | ✔️ | Entry number for the attack | 1 |
| `AttackName` | Varies | N/A | N/A | String | ❌ | Name of attack; defaults to "Normal Attack" | `"Normal Attack"` or `"AoE Explosion"` |
| `AttackParentIndex` | N/A | N/A | N/A | Number (integer) | ❌ | Entry number for the parent attack, usually applies to AoE component of attacks | 1 |
| `AmmoCost` | N/A | N/A | `ammoRequirement` | Number (float) | ✔️ | Ammo consumed on a single attack input; defaults to nil | `0.5` or `10` |
| `AmmoType` | N/A | N/A | `ammoType` | String | ❌ | Type of ammo pickups that replenishes ammo reserves; "None" for battery weapons and "Energy" for those that use Warframe energy | `"Primary"` |
| `BurstCount` | N/A | N/A | `NumShots` | Number (integer) | ❌ | For burst-fire weapons, the number of shots per burst; omit for attacks that shoot bursts that scale off magazine size (e.g  [Pandero](/w/Pandero "Pandero")) | `4` |
| `BurstDelay` | N/A | N/A | `BurstDelay` | Number (float) | ❌ | For burst-fire weapons, the time in seconds between shooting each individual shot in a burst. | `0.061` |
| `BurstReloadDelay` | N/A | N/A | N/A | Number (float) | ❌ | Only for burst-fire attacks that scale off magazine size (e.g  [Pandero](/w/Pandero "Pandero")), the time after a burst before an automatic reload commences. This value is derived from the inverse of internal fire rates of burst attacks (1 ÷ fireRate). | `0.2` |
| `Damage` | Damage | `damagePerShot` and `totalDamage` | `AttackData` | Table (map of floats) | ✔️ | Table of [damage](/w/Damage "Damage") types that the weapon deals and their individual damage values. Possible keys: Impact, Puncture, Slash, Cold, Electricity, Heat, Toxin, Blast, Corrosive, Gas, Magnetic, Radiation, Viral, Void, and MinProgenitorBonus (random element for Kuva/Tenet weapons) | `{ Impact = 100, Puncture = 25, Slash = 30 }` |
| `ChargeTime` | Charge Rate | N/A | `ChargeTime` | Number (float) | ❌ | For charged attacks, the base charge time for a fully charged attack | `0.5` |
| `CritChance` | Critical Chance | `criticalChance` | `CriticalChance` or `criticalHitChance` | Number (float) | ✔️ | Attack's base [critical chance](/w/Critical_Hit "Critical Hit") as a decimal | `0.25` |
| `CritMultiplier` | Critical Multiplier | `criticalMultiplier` | `CriticalMultiplier` or `criticalHitDamageMultiplier` | Number (float) | ✔️ | Attack's base [critical hit multiplier](/w/Critical_Hit "Critical Hit") as a scalar | `2.2` |
| `EffectDuration` | N/A | N/A | N/A | Number (float) | ❌ | For special attacks, the time in seconds that a special effect lasts for (e.g.  [Pox](/w/Pox "Pox")'s toxin clouds or  [Zenistar](/w/Zenistar "Zenistar")'s disc) | `5` |
| `ExplosionDelay` | Embed Delay | N/A | `EmbedTime` | Number (float) | ❌ | For AoE attacks, the time in seconds between initial shot and explosion; the same as "Embed Delay" stat in-game | `0.5` |
| `ExtraHeadshotDmg` | N/A | N/A | N/A | Number (float) | ❌ | Additional bonus damage on headshots for weapons such as  [Cernos Prime](/w/Cernos_Prime "Cernos Prime") | `0.5` |
| `Falloff` | Falloff | N/A | `damageFallOff` and `damageFallOffMinDamage` or `ExplosionFallOff` and `DamageRadius` | Table (map of floats) | ❌ | Attack's base [Damage Falloff](/w/Damage_Falloff "Damage Falloff") stats; includes starting distance in meters when falloff multiplier comes into play, ending distance in meters when falloff multipler is at max reduction, and the maximum damage reduction as a decimal | `{ StartRange = 0, EndRange = 5, Reduction = 0.5 }` |
| `FireRate` | Fire Rate | `fireRate` | `fireRate` (stored as a whole number representing number shots per minute, have to divide by 60s to get arsenal Fire Rate) | Number (float) | ✔️ | Attack's base [Fire Rate](/w/Fire_Rate "Fire Rate") or [Attack Speed](/w/Attack_Speed "Attack Speed") multiplier | `6.5` |
| `ForcedProcs` | N/A | N/A | `ForcedProcs` | Table (array of strings) | ❌ | Attack's forced procs, if any | `{ "Impact", "Slash" }` |
| `IncarnonCharges` | N/A | N/A | N/A | Number (integer) | ❌ | For guns, the number of available shots while in [Incarnon Mode](/w/Incarnon_Mode "Incarnon Mode") | 160 |
| `IsSilent` | Noise | `noise` | `IsSilenced` or `SilentProjectile` | Boolean | ❌ | Whether or not an attack has a silent [Noise Level](/w/Noise_Level "Noise Level"); defaults to false | `true` |
| `MaxSpread` | Max Deviation | N/A | `AIMED_ACCURACY.Spread.SHOOTING.range[1]` | Number (float) | ❌ | Attack's maximum spread range. Arsenal accuracy is calculated as the inverse of the average spread multiplied by 100. | `16` |
| `MinSpread` | Deviation With Aim | N/A | `AIMED_ACCURACY.Spread.SHOOTING.range[0]` | Number (float) | ❌ | Attack's minimum spread range. Arsenal accuracy is calculated as the inverse of the average spread multiplied by 100. | `6` |
| `Multishot` | Multishot | `multishot` | `fireIterations` | Number (integer) | ❌ | Attack's base [Multishot](/w/Multishot "Multishot") value; defaults to 1 | `10` |
| `PunchThrough` | Punch Through | N/A | `PunctureDepth` or `tracePunctureDepth` | Number (float) | ❌ | Attack's base [Punch Through](/w/Punch_Through "Punch Through") value in meters; defaults to 0 | `1.5` |
| `Range` | Range | N/A | `traceDistance` or `DamageRadius` | Number (float) | ❌ | For maximum range of a particular attack in meters. For AoE attacks, the base radius of area of effect in meters. | `40` |
| `ShotType` | N/A | N/A | `HitType` | String | ✔️ | Attack's shot type (e.g. "Hit-Scan", "Projectile", and "AoE" for area of effects) | `Projectile` |
| `ShotSpeed` | N/A | N/A | `KinematicMaxSpeed` or `ForwardVel` | Number (integer) | ❌ | For projectile attacks, the attack's maximum [projectile speed](/w/Projectile_Speed "Projectile Speed") in meters per second (not initial or minimum speed) | `50` |
| `StatusChance` | Status | `procChance` | `ProcChance` | Number (float) | ✔️ | Attack's base [status chance](/w/Status_Effect "Status Effect") as a decimal | `0.2` |
| `SyndicateEffect` | N/A | N/A | N/A | String | ❌ | For [Syndicate](/w/Syndicate "Syndicate") weapons, the [Syndicate Radial Effect](/w/Syndicate_Radial_Effects "Syndicate Radial Effects") that it has | `"Entropy"` |
| `Trigger` | Trigger | `trigger` | `FireModes` | String | ❌ | For weapons with multiple [Trigger Types](/w/Trigger_Type "Trigger Type"), attack's trigger type | `"Semi-Auto"` |

## Gun Entry Schema

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-3 "Edit section's source code: Gun Entry Schema")]

```lua
["Long Gun Weapon Name"] = {
	_IgnoreEntry = true,
	_TooltipAttackDisplay = 1,
	Accuracy = 100,
	AmmoMax = 540,
	AmmoPickup = 80,
	AmmoType = "Primary",
	AmmoPickup = 1,
	Attacks = {
		{
			AttackIndex = 1,
			AttackName = "Normal Attack",
			AmmoCost = 0.5,
			BurstCount = 1,
			Damage = { Impact = 1, Puncture = 1, Slash = 1 },
			CritChance = 0.1,
			CritMultiplier = 1,
			StatusChance = 0.1,
			FireRate = 1.0,
			Falloff = { StartRange = 400, EndRange = 600, Reduction = 0.2 },
			MaxSpread = 0,
			MinSpread = 0,
			ShotType = "Hit-Scan",
			ShotSpeed = 100,
			Trigger = "Semi-Auto"
		}
	},
	Class = "Sniper Rifle",
	Conclave = false,
	Disposition = 0.5,
	ExilusPolarity = "Madurai",
	Family = "",
	Image = "Weapon.png",
	Introduced = "",
    Link = "Page Name",
	Magazine = 1,
	Mastery = 1,
	MaxRank = 30,
	Name = "Weapon Name",
	Polarities = { "Madurai" },
	Reload = 1,
	ReloadStyle = "Regenerate",
	SellPrice = 7500,
    Slot = "Primary",
	SniperComboMin = 1,
	SniperComboReset = 1,
	Spool = 5,
	Trigger = "Semi-Auto",
	Traits = { "Grineer" },
	Users = { },
	Zoom = { "2.0x", "4.0x" }
},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Accuracy` | Accuracy | `accuracy` | N/A | Number (float) | ✔️ | Gun's base [Accuracy](/w/Accuracy "Accuracy") value | `100` |
| `AmmoMax` | Ammo Maximum | N/A | `AmmoCapacity` | Number (integer) | ✔️ | Gun's base maximum reserve ammo (this excludes magazine size) | `210` or `0` (represents infinite ammo, for weapons that don't use ammo) |
| `AmmoPickup` | Ammo Pickup | N/A | `AmmoPickUpCount` | Number (integer) | ❌ | Amount of ammo recovered after walking over an ammo pickup | `1` |
| `Attacks` | N/A | N/A | `AttackData`, `ExplosiveAttack`, `RadialDamage`, `EmbedAttack` | Table | ✔️ | Contains attack data for the weapon | See [#Attack Data Schema](#Attack_Data_Schema) |
| `Class` | N/A | `productCategory` | `IsAbilityWeapon` for Exalted Weapons, otherwise no direct equivalent | String | ✔️ | Weapon class for modding or a subclass of the weapon in its equip slot; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just "Exalted Weapon" | `"Sniper Rifle"` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ❌ | Whether or not the weapon has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `false` |
| `CompatibilityTags` | N/A | N/A | `CompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, items with these tags can/cannot have a particular mod installed with the same tag. | `{ "POWER_WEAPON" }` |
| `Conclave` | N/A | N/A | `AvailableOnPvp` | Boolean | ❌ | Whether or not the weapon can be used in [Conclave](/w/Conclave "Conclave") | `false` |
| `DefaultUpgrades` | N/A | N/A | `DefaultUpgrades`[[1]](#cite_note-1) | Table (array of strings) | ❌ | Additional upgrades that are innate to the weapon | `{ "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" }` |
| `Disposition` | Riven Disposition | `omegaAttenuation` | `OmegaAttenuation` | Number (float) | ✔️ | [Riven Mod](/w/Riven_Mods "Riven Mods") Disposition value | `0.5` |
| `ExilusPolarity` | N/A | N/A | `ArtifactSlots` | String | ❌ | Polarity on Exilus slot | `"Madurai"` |
| `Family` | N/A | N/A | N/A | String | ❌ | Weapon family that it belongs to, corresponding to the [Riven Mod](/w/Riven_Mods "Riven Mods") compatibility | `"Latron"` |
| `IncarnonChargeGain` | N/A | N/A | N/A | Number (integer) | ❌ | For guns, the number of Incarnon shots gained by hitting a [Weak Point](/w/Weak_Point "Weak Point") | 10 |
| `IncarnonImage` | N/A | N/A | N/A | String | ❌ | Image file name of the weapon in its [Incarnon](/w/Incarnon "Incarnon") Form as uploaded to the wiki | `"Ack&BruntIncarnon.png"` |
| `Image` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the weapon as uploaded to the wiki | `"CrpBFG.png"` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ✔️ | The full unique name of a weapon formatted as a file path | `"/Lotus/Weapons/MK1Series/MK1Paris"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the weapon was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `IsLichWeapon` | N/A | N/A | `IsKuva` | Boolean | ❌ | Denotes whether or not a weapon is a [Kuva](/w/Category:Kuva_Lich_Weapons "Category:Kuva Lich Weapons") or [Tenet](/w/Category:Tenet_Weapons "Category:Tenet Weapons") weapon | `true` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Page/article link to the weapon on the wiki | `"Artemis Bow (Weapon)"` |
| `Magazine` | Magazine | `magazineSize` | `AmmoClipSize` | Number (integer) | ✔️ | Gun's base magazine size | `45` or `0` (no magazine) |
| `Mastery` | N/A | `masteryReq` | `RequiredLevel` | Number (integer) | ✔️ | [Mastery Rank](/w/Mastery_Rank "Mastery Rank") requirement | `5` |
| `MaxRank` | N/A | N/A | `LevelCap` | Number (integer) | ❌ | Weapon's maximum rank | `30` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Weapon's name | `"Primary Vermisplicer Chamber"` |
| `Polarities` | N/A | N/A | `ArtifactSlots` | Table (array of strings) | ✔️ | Full names of the weapon's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `Reload` | Reload | `reloadTime` | `reloadTime` or `reloadEndTime`, `reloadLoopTime`, `reloadStartTime` for by shell reloads | Number (float) | ✔️ | Gun's base [reload](/w/Reload "Reload") time in seconds | `3.5` |
| `ReloadDelay` | N/A | N/A | `HeavyBatteryRegenDelay` | Number (float) | ❌ | For rechargeable/battery weapons, the time in seconds after firing before magazine 'recharges' or is replenished. For  [Vectis](/w/Vectis "Vectis") and  [Exergis](/w/Exergis "Exergis"), the time in seconds after firing before reload animation starts. | `0.5` |
| `ReloadDelayEmpty` | N/A | N/A | `HeavyBatteryRegenDelayFromEmpty` | Number (float) | ❌ | For rechargeable/battery weapons, the time in seconds after fully depleting magazine before magazine 'recharges' or is replenished | `1` |
| `ReloadRate` | N/A | N/A | `HeavyBatteryRegenRate` | Number (float) | ❌ | For rechargeable/battery weapons, the rate at which magazine 'recharges' or is replenished per second | `40` |
| `ReloadStyle` | N/A | N/A | N/A | String | ❌ | Gun's unique reload type for weapons like  [Cycron](/w/Cycron "Cycron") or  [Corinth](/w/Corinth "Corinth") | `"Regenerate"` or `"ByRound"` |
| `SellPrice` | N/A | N/A | `SellingPrice` | Number (integer) | ❌ | For sellable weapons, the sell price in [Credits](/w/Credits "Credits") when removed from the player's inventory | `25000` |
| `Slot` | N/A | `slot` | `InventorySlot` | String | ✔️ | The weapon slot that the weapon can be equipped on; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just their modding class | `"Primary"` |
| `SniperComboMin` | N/A | N/A | `HitReqNextTierOperator` | Number (integer) | ❌ | For sniper rifles, the minimum number of hits to gain combo bonus | `1` |
| `SniperComboReset` | N/A | N/A | `TimeBetweenHits` | Number (integer) | ❌ | For sniper rifles, the number of seconds after last hit before combo number goes down | `3` |
| `Spool` | N/A | N/A | `ContinuousMaxShots` | Number (integer) | ❌ | For auto-spool weapons, number of shots until weapon reaches max [fire rate](/w/Fire_Rate "Fire Rate") | `5` |
| `Tradable` | N/A | N/A | `TradeCapability` | Number (integer, enum) | ❌ | Whether or not a weapon is [tradable](/w/Trading "Trading") to other players.  * 0 or nil = not tradable * 1 = weapon itself is tradable only if it is unranked with no Forma and Orokin Catalyst installed * 2 = tradable parts and/or blueprint(s) but weapon itself is not tradable * 3 = indirectly tradable through trading Kuva Liches/Sisters of Parvos ([Adversary System](/w/Adversary_System "Adversary System") in general) * 4 = only fully built components are tradable, not blueprints * 5 = for Robotic weapons that are indirectly tradable if parent companion is tradable | `2` |
| `Trigger` | Trigger | `trigger` | `FireModes` | String | ✔️ | Gun's [Trigger Type](/w/Trigger_Type "Trigger Type") | `"Auto"` or `"Auto / Burst"` |
| `Traits` | N/A | N/A | N/A | Table (array of strings) | ❌ | Gun's categorical traits | `{ "Grineer", "Wraith" }` |
| `Users` | N/A | N/A | N/A | Table (array of strings) | ❌ | Name of NPCs that use this weapon | `{ "Stalker", "Shadow Stalker" }` |
| `Zoom` | N/A | N/A | `ZoomLevels` | Table (array of strings) | ❌ | The levels of zoom that the gun offers | `{ "2.0x", "4.5x" }` |

## Melee Entry Schema

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-4 "Edit section's source code: Melee Entry Schema")]

```lua
["Melee Weapon Name"] = {
	_IgnoreEntry = true,
	_TooltipAttackDisplay = 1,
	Attacks = {
		{
			AttackIndex = 1,
            AttackName = "Normal Attack",
			Damage = { Impact = 1, Puncture = 1, Slash = 1 },
			CritChance = 0.1,
			CritMultiplier = 2,
			StatusChance = 0.1,
			FireRate = 1
 		},
        {
			AttackIndex = 2
			AttackName = "Slam Attack",
			AttackParentIndex = 1,
			CritChance = 0.1,
			CritMultiplier = 2,
			Damage = { Impact = 1 },
			Falloff = { EndRange = 1, Reduction = 0.5, StartRange = 0 },
			FireRate = 1,
			ForcedProcs = { "Impact" },
			IsSilent = true,
			Range = 1,
			ShotType = "AoE",
			StatusChance = 0.1 
		},
		{
			AttackIndex = 3
			AttackName = "Heavy Slam Attack",
			AttackParentIndex = 1,
			CritChance = 0.1,
			CritMultiplier = 2,
			Damage = { Blast = 1 },
			Falloff = { EndRange = 2, Reduction = 0.3, StartRange = 0 },
			FireRate = 1,
			ForcedProcs = { "Lifted" },
			IsSilent = true,
			Range = 2,
			ShotType = "AoE",
			StatusChance = 0.1 
		}
	},
	BlockAngle = 55,
	Class = "Two-Handed Nikana",
	ComboDur = 5,
	Conclave = false,
	Disposition = 0.5,
	Family = "Tatsu",
	FollowThrough = 0.7,
	HeavyAttack = 1284,
	Image = "Tatsu.png",
	Introduced = "",
    Link = "Page Name",
	Mastery = 1,
	MaxRank = 30,
	MeleeRange = 3,
	Name = "MeleeName",
	Polarities = { "Madurai" },
	SellPrice = 7500,
	SlideAttack = 1,
 	Slot = "Melee",
	StancePolarity = "Madurai",
	SweepRadius = 0.25,
	Traits = { "Tenno" },
	WindUp = 0.7
},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `Attacks` | N/A | N/A | `AttackData`, `ExplosiveAttack`, `RadialDamage`, `EmbedAttack` | Table | ✔️ | Contains attack data for the weapon | See [#Attack Data Schema](#Attack_Data_Schema) |
| `BlockAngle` | Blocking Angle | `blockingAngle` | `ParryAngle` | Number (integer) | ✔️ | Melee's base blocking angle in degrees | `90` |
| `Class` | N/A | `productCategory` | `parent`, `parents`, or `MeleeStyle` | String | ✔️ | Weapon class for modding or a subclass of the weapon in its equip slot; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just "Exalted Weapon" | `"Nikana"` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ❌ | Whether or not the weapon has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `false` |
| `ComboDur` | Combo Duration | `comboDuration` | `TimeBetweenHits` | Number (integer) | ❌ | Melee's base [combo](/w/Combo "Combo") duration in seconds | `5` |
| `CompatibilityTags` | N/A | N/A | `CompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, items with these tags can/cannot have a particular mod installed with the same tag. | `{ "POWER_WEAPON" }` |
| `Conclave` | N/A | N/A | `AvailableOnPvp` | Boolean | ❌ | Whether or not the weapon can be used in [Conclave](/w/Conclave "Conclave") | `false` |
| `DefaultUpgrades` | N/A | N/A | `DefaultUpgrades` | Table (array of strings) | ❌ | Additional upgrades that are innate to the weapon | `{ "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" }` |
| `Disposition` | Riven Disposition | `omegaAttenuation` | `OmegaAttenuation` | Number (float) | ✔️ | [Riven Mod](/w/Riven_Mods "Riven Mods") Disposition value | `0.5` |
| `Family` | N/A | N/A | N/A | String | ❌ | Weapon family that it belongs to, corresponding to the [Riven Mod](/w/Riven_Mods "Riven Mods") compatibility | `"Machete"` |
| `FollowThrough` | Follow Through | `followThrough` | N/A | Number (float) | ✔️ | Melee's base follow through multiplier as a decimal | `0.6` |
| `HeavyAttack` | Heavy Attack | `heavyAttackDamage` | N/A | Number (float) | ✔️ | Melee's base heavy attack damage. For Kuva/Tenet weapons include minimum +25% Progenitor bonus in damage value. | `1284` |
| `IncarnonDuration` | N/A | N/A | N/A | Number (integer) | ❌ | For melees, the duration of Incarnon Mode in seconds | 180 |
| `IncarnonImage` | N/A | N/A | N/A | String | ❌ | Image file name of the weapon in its [Incarnon](/w/Incarnon "Incarnon") Form as uploaded to the wiki | `"Ack&BruntIncarnon.png"` |
| `Image` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the weapon as uploaded to the wiki | `"Ankyros.png"` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ✔️ | The full unique name of a weapon formatted as a file path | `"/Lotus/Weapons/MK1Series/MK1Furis"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the weapon was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `IsLichWeapon` | N/A | N/A | `IsKuva` | Boolean | ❌ | Denotes whether or not a weapon is a [Kuva](/w/Category:Kuva_Lich_Weapons "Category:Kuva Lich Weapons") or [Tenet](/w/Category:Tenet_Weapons "Category:Tenet Weapons") weapon | `true` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Page/article link to the weapon on the wiki | `"Exalted Blade (Weapon)"` |
| `Mastery` | N/A | `masteryReq` | `RequiredLevel` | Number (integer) | ✔️ | [Mastery Rank](/w/Mastery_Rank "Mastery Rank") requirement | `5` |
| `MaxRank` | N/A | N/A | `LevelCap` | Number (integer) | ❌ | Weapon's maximum rank | `30` |
| `MeleeRange` | Range | `range` | N/A | Number (float) | ✔️ | Melee's base attack range in meters | `2` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Weapon's name | `"Galatine Prime"` |
| `Polarities` | N/A | N/A | `ArtifactSlots` | Table (array of strings) | ✔️ | Full names of the weapon's non-Universal [polarities](/w/Polarity "Polarity") | `{ "Naramon", "Madurai" }` |
| `SellPrice` | N/A | N/A | `SellingPrice` | Number (integer) | ❌ | For sellable weapons, the sell price in [Credits](/w/Credits "Credits") when removed from the player's inventory | `25000` |
| `SlideAttack` | Slide Attack | `slideAttack` | N/A | Number (float) | ✔️ | Melee's base slide attack damage. For Kuva/Tenet weapons include minimum +25% Progenitor bonus in damage value. | `100` |
| `SlideElement` | N/A | N/A | N/A | String | ❌ | Melee's base slide attack damage type | `"Toxin"` |
| `Slot` | N/A | `slot` | `InventorySlot` | String | ✔️ | The weapon slot that the weapon can be equipped on; in the case of [Exalted Weapons](/w/Exalted_Weapon "Exalted Weapon"), it is just their modding class | `"Melee"` |
| `StancePolarity` | N/A | N/A | `ArtifactSlots` | String | ✔️ | Polarity on [Stance](/w/Stance "Stance") slot | `"Madurai"` |
| `SweepRadius` | N/A | N/A | `SweepRadius` | Number (float) | ✔️ | Melee's sweep attack's (i.e. normal and heavy attacks) base hitbox radius in meters | `0.25` |
| `Tradable` | N/A | N/A | `TradeCapability` | Number (integer, enum) | ❌ | Whether or not a weapon is [tradable](/w/Trading "Trading") to other players.  * 0 or nil = not tradable * 1 = weapon itself is tradable only if it is unranked with no Forma and Orokin Catalyst installed * 2 = tradable parts and blueprint(s) but weapon itself is not tradable * 3 = indirectly tradable through trading Kuva Liches/Sisters of Parvos ([Adversary System](/w/Adversary_System "Adversary System") in general) * 4 = only fully built components are tradable, not blueprints | `2` |
| `Traits` | N/A | N/A | N/A | Table (array of strings) | ❌ | Gun's categorical traits | `{ "Grineer", "Wraith" }` |
| `Users` | N/A | N/A | N/A | Table (array of strings) | ❌ | Name of NPCs that use this weapon | `{ "Stalker", "Shadow Stalker" }` |
| `WindUp` | Wind Up | `windUp` | N/A | Number (float) | ✔️ | Heavy attack wind-up time in seconds | `0.5` |

## For Module Use

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-5 "Edit section's source code: For Module Use")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | For module use, indicates that this weapon table entry is special and should ignored when parsing table entries | `true` |
| `_IgnoreInCSV` | Boolean | ❌ | For module use, indicates that this weapon table entry should be ignored when outputting CSV (via [Module:Weapons/csv](/w/Module:Weapons/csv "Module:Weapons/csv")) | `true` |
| `_IgnoreInMasteryCount` | Boolean | ❌ | For module use, indicates that this weapon table entry should be ignored when tallying up mastery totals | `true` |
| `_TooltipAttackDisplay` | Number | ❌ | For module use, tells what table entry in `Attack` table to use when processing weapon tooltips and comparing weapon variants in Comparison sections; `1` will be used if no value is assigned | `4` |

## Preprocessed Data

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-6 "Edit section's source code: Preprocessed Data")]

If you want data on the relative stat rankings (percentile-based) of each weapon for each weapon stat, see [Module:Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata").

## Export Data

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-7 "Edit section's source code: Export Data")]

[![](/images/thumb/CephalonSimaris.jpg/60px-CephalonSimaris.jpg?4a8c5)](/w/Cephalon_Simaris "Cephalon Simaris")

*"Hunter, I have temporarily disabled that ability."*

This article contains JavaScript scripts that users can run locally in their browser's console or machine. As a warning, which goes for any scripts you copy/run from the Internet, *MAKE SURE YOU UNDERSTAND THE CODE BEFORE RUNNING IT LOCALLY FOR YOUR OWN SECURITY!* Contact an [admin](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators") if you have any concerns or questions about a script.

Since this database is horizontally partitioned, if you want all the weapon table entries at once, go to [Special:ExpandTemplates](/w/Special:ExpandTemplates "Special:ExpandTemplates") and run `{{#invoke:LuaSerializer|serialize|Weapons/data}}`. This will run the script on this page and return plaintext that contains a executable prettified Lua table with all the weapon table entries.

Alternatively, you can use [MediaWiki's Action API](https://www.mediawiki.org/wiki/API:Main_page "mw:API:Main page") to get the executed contents of this module:

* [Special:ApiSandbox](/w/Special:ApiSandbox "Special:ApiSandbox"):
  + `https://wiki.warframe.com/w/Special:ApiSandbox#action=scribunto-console&format=json&title=Module%3AWeapons&content=return%20require('Module%3ALuaSerializer')._serialize('Weapons%2Fdata')&question=%3Dp&clear=1`
  + `https://wiki.warframe.com/w/Special:ApiSandbox#action=scribunto-console&format=json&title=Module%3AWeapons&content=return%20require('Module%3AWeapons%2Fdata')&question=%3Dp&clear=1`
* Raw endpoints:
  + `https://wiki.warframe.com/api.php?action=scribunto-console&format=json&title=Module%3AWeapons&content=return%20require(%27Module%3ALuaSerializer%27)._serialize(%27Weapons%2Fdata%27)&question=%3Dp&clear=1`
  + `https://wiki.warframe.com/api.php?action=scribunto-console&format=json&title=Module%3AWeapons&content=return%20require(%27Module%3AWeapons%2Fdata%27)&question=%3Dp&clear=1`
* JavaScript:
  + ```lua
    var url = new URL('https://wiki.warframe.com/api.php?');
    var searchParams = new URLSearchParams({
    	action: 'scribunto-console',
    	format: 'json',
    	title: 'Module:Weapons',
    	// Alternatively, run "return require('Module:LuaSerializer')._serialize('Weapons/data')"
    	// If you want to convert Lua tables to native JSON, run "return require('Module:JSON').stringify(require('Module:Weapons/data'))"
    	content: "return require('Module:Weapons/data')",
    	question: '=p',
    	clear: 1
    });
    fetch(url + searchParams)
    	.then(data => data.json())
    	.then(json => console.log(json.return));
    ```
* See <https://wiki.warframe.com/api.php> for auto-generated documentation on this wiki's version of the API

## Weapon Edge Cases

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-8 "Edit section's source code: Weapon Edge Cases")]

Some weapons have complicated mechanics or behaviors that are not currently compatible with the wiki's weapon entry schema:

* [![](/images/thumb/TenetDiplos.png/32px-TenetDiplos.png?b553c)](/w/Tenet_Diplos "Tenet Diplos") [Tenet Diplos](/w/Tenet_Diplos "Tenet Diplos")'s lock-on mechanic while aiming has a ~0.5 second delay after the burst ends before being able to lock-on again. This delay is affected by Fire Rate bonuses. This delay is not the same as `BurstDelay` or `BurstReloadDelay`. Can be thought as the "delay between bursts that is not the reciprocal of Fire Rate".

## Where To Source Weapon Data

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-9 "Edit section's source code: Where To Source Weapon Data")]

Some notes on where editors can source weapon data:

* In-game:
  + [Chat](/w/Chat "Chat") link
  + [Market](/w/Market "Market") preview
  + Viewing or equipping in [Arsenal](/w/Arsenal "Arsenal")
  + For Railjack weapons, go to [Clan Dojo](/w/Clan_Dojo "Clan Dojo")'s or [Relay](/w/Relay "Relay")'s [Dry Dock](/w/Dry_Dock "Dry Dock")
* Outside of the game (without the need to launch the game):
  + [Public Export](/w/Public_Export "Public Export")'s `ExportWeapons` manifest
  + <https://overframe.gg/>, go create a "New Build" and F12 to HTML source to find some internal JSON data on weapon. See the below section for more details.

### Where To Find Weapon Metadata

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-10 "Edit section's source code: Where To Find Weapon Metadata")]

The in-game UI does not thoroughly present all the data and interactions that is provided from a weapon. Here are some methods and sources to get more insight on the internal mechanics on weapons:

* <https://overframe.gg/> has access to more metadata than what Digital Extremes provide to the public. This JSON data is cached locally on the client in these tags: `<script id="__NEXT_DATA__" type="application/json"></script>`
  + For example, for more metadata on [![](/images/thumb/KuvaBramma.png/32px-KuvaBramma.png?e3603)](/w/Kuva_Bramma "Kuva Bramma") [Kuva Bramma](/w/Kuva_Bramma "Kuva Bramma"), go create a new build <https://overframe.gg/build/new/4245/kuva-bramma/> and inspect the HTML element on the page using your browser's development tools. The relevant metadata should be under the `<script id="__NEXT_DATA__" type="application/json"></script>` tags. If not, hard refresh the browser's cache so the underlying data is updated to reflect on the actual item.

    ```lua
    	"data": {
    		"AmmoCapacity": 5,
    		"AmmoClipSize": 1,
    		"ArtifactSlots": ["AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_ATTACK", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_TACTIC", "AP_UNIVERSAL"],
    		"Behaviors": [{
    				"fire:LotusWeaponProjectileFireBehavior": {
    					"AIMED_ACCURACY": {
    						"Spread": {
    							"SHOOTING": {
    								"range": [0, 12],
    								"type": "ST_EXPONENTIAL"
    							}
    						}
    					},
    					"IgnoreFireIterations": 0,
    					"IsMeleeBehavior": 0,
    					"IsSilenced": 0,
    					"RoundUpAmmoConsumption": 0,
    					"ScaleAmmoRequirement": 0,
    					"UseAmmo": 1,
    					"ammoRequirement": 1,
    					"ammoType": "/Lotus/Weapons/Ammo/RifleAmmoEx",
    					"chargedProjectileType": {
    						"AttackData": {
    							"Amount": 187,
    							"HitType": "DHT_PROJECTILE",
    							"ProcChance": 0.21,
    							"Type": "DT_IMPACT"
    						},
    						"BounceOnAvatars": 0,
    						"CanStick": 1,
    						"ClusterProjectiles": {
    							"AttackData": {
    								"Amount": 49,
    								"HitType": "DHT_PROJECTILE",
    								"ProcChance": 0.21,
    								"Type": "DT_IMPACT"
    							},
    							"BounceOnAvatars": 0,
    							"CanStick": 1,
    							"CriticalChance": 0.35,
    							"CriticalMultiplier": 2.1,
    							"DamageRadius": 3.5,
    							"DealDamageThroughImpactBehavior": 1,
    							"EmbedAttack": {
    								"Amount": 0,
    								"Type": "DT_POISON"
    							},
    							"EmbedDeathAttack": {
    								"Amount": 35,
    								"Type": "DT_EXPLOSION"
    							},
    							"EmbedTime": [0.5, 0.5],
    							"ExplosionFallOff": 0.5,
    							"ExplosionIgnoreSource": 1,
    							"ExplosiveAttack": {
    								"Amount": 57,
    								"HitType": "DHT_RADIAL",
    								"ProcChance": 0.21
    							},
    							"MaxLife": 2
    						},
    						"CriticalChance": 0.35,
    						"CriticalMultiplier": 2.1,
    						"DamageRadius": 8.3,
    						"DealDamageThroughImpactBehavior": 1,
    						"EmbedAttack": {
    							"Amount": 0,
    							"Type": "DT_POISON"
    						},
    						"EmbedDeathAttack": {
    							"Amount": 175,
    							"HitType": "DHT_RADIAL"
    						},
    						"ExplosionFallOff": 0.9,
    						"ExplosiveAttack": {
    							"Amount": 839,
    							"HitType": "DHT_RADIAL",
    							"ProcChance": 0.21
    						},
    						"MaxLife": 5,
    						"NumClusterProjectiles": 3
    					},
    					"fireIterations": 1,
    					"projectileType": {
    						"AttackData": {
    							"Amount": 187,
    							"HitType": "DHT_PROJECTILE",
    							"ProcChance": 0.21,
    							"Type": "DT_IMPACT"
    						},
    						"BounceOnAvatars": 0,
    						"CanStick": 1,
    						"ClusterProjectiles": {
    							"AttackData": {
    								"Amount": 49,
    								"HitType": "DHT_PROJECTILE",
    								"ProcChance": 0.21,
    								"Type": "DT_IMPACT"
    							},
    							"BounceOnAvatars": 0,
    							"CanStick": 1,
    							"CriticalChance": 0.35,
    							"CriticalMultiplier": 2.1,
    							"DamageRadius": 3.5,
    							"DealDamageThroughImpactBehavior": 1,
    							"EmbedAttack": {
    								"Amount": 0,
    								"Type": "DT_POISON"
    							},
    							"EmbedDeathAttack": {
    								"Amount": 35,
    								"Type": "DT_EXPLOSION"
    							},
    							"EmbedTime": [0.5, 0.5],
    							"ExplosionFallOff": 0.5,
    							"ExplosionIgnoreSource": 1,
    							"ExplosiveAttack": {
    								"Amount": 57,
    								"HitType": "DHT_RADIAL",
    								"ProcChance": 0.21
    							},
    							"MaxLife": 2
    						},
    						"CriticalChance": 0.35,
    						"CriticalMultiplier": 2.1,
    						"DamageRadius": 8.3,
    						"DealDamageThroughImpactBehavior": 1,
    						"EmbedAttack": {
    							"Amount": 0,
    							"Type": "DT_POISON"
    						},
    						"EmbedDeathAttack": {
    							"Amount": 175,
    							"HitType": "DHT_RADIAL"
    						},
    						"ExplosionFallOff": 0.9,
    						"ExplosiveAttack": {
    							"Amount": 839,
    							"HitType": "DHT_RADIAL",
    							"ProcChance": 0.21
    						},
    						"MaxLife": 5,
    						"NumClusterProjectiles": 3
    					}
    				},
    				"fire:Type": "/Lotus/Types/Game/LotusWeaponProjectileFireBehavior",
    				"impact:LotusWeaponImpactBehavior": {
    					"AttackData": {
    						"Amount": 10,
    						"DT_IMPACT": 0.33333,
    						"DT_PUNCTURE": 0.33333,
    						"DT_SLASH": 0.33333,
    						"HitType": "DHT_NONE",
    						"ProcChance": 0.1,
    						"Type": "DT_PHYSICAL",
    						"UseNewFormat": 0
    					},
    					"PlayerDamageMultiplier": 1,
    					"PvpDamageMultiplier": 1,
    					"criticalHitChance": 0.2,
    					"criticalHitDamageMultiplier": 1.5,
    					"radius": 0
    				},
    				"impact:Type": "/Lotus/Types/Weapon/LotusWeaponImpactBehavior",
    				"state:ChargedRemoteMineStateBehavior": {
    					"AutoFireWhenChargeCompleted": 0,
    					"ChargeModifier": "WEAPON_FIRE_RATE",
    					"ChargeTime": 0.4,
    					"ClipSizeAffectsChargeTime": 0,
    					"DamageMultiplier": 1,
    					"IsAlternateFire": 0,
    					"LocTag": "/Lotus/Language/Menu/Loadout_TriggerCharge",
    					"MinChargeRatio": 1,
    					"MinDamageMultiplier": 1,
    					"fireRate": 40,
    					"reloadTime": 0.6
    				},
    				"state:Type": "/Lotus/Types/Weapon/ChargedRemoteMineStateBehavior"
    			}
    		],
    		"CompatibilityTags": ["PROJECTILE", "AOE", "SNIPER_AMMO", "SINGLESHOT", "GRNBOW"],
    		"EquipTime": 1.8,
    		"GripType": "BOW",
    		"HasClip": 0,
    		"Icon": "/Lotus/Interface/Icons/StoreIcons/Weapons/PrimaryWeapons/Weapons/KuvaGrnBow.png",
    		"InventorySlot": "SLOT_2",
    		"IsKuva": 1,
    		"LevelCap": 40,
    		"LocalizeDescTag": "/Lotus/Language/Weapons/KuvaGrnBowDesc",
    		"LocalizeTag": "/Lotus/Language/Weapons/KuvaGrnBowName",
    		"MarketMode": "MM_HIDDEN",
    		"OmegaAttenuation": 0.6,
    		"PVPAmmoClipSize": 1,
    		"PremiumPrice": 225,
    		"ProductCategory": "LongGuns",
    		"RequiredLevel": 15,
    		"SellingPrice": 7500,
    		"ZoomLevels": [{}
    		]
    	},
    	"id": 4245,
    	"parent": "/Lotus/Weapons/Tenno/Bows/LotusLongBow",
    	"parents": ["/Lotus/Weapons/Tenno/Bows/LotusLongBow", "/Lotus/Weapons/Tenno/Bows/LotusBow", "/Lotus/Weapons/Tenno/Rifle/LotusRifle", "/Lotus/Weapons/Tenno/LotusLongGun", "/Lotus/Weapons/Tenno/LotusBulletWeapon"],
    	"path": "/Lotus/Weapons/Grineer/Bows/GrnBow/GrnBowWeapon",
    	"storeData": {
    		"DisplayRecipe": "",
    		"PremiumPrice": 225,
    		"ProductCategory": "LongGuns",
    		"SearchTags": ["/Lotus/Language/Game/DT_EXPLOSION_NoIcon", "/Lotus/Language/Game/DT_IMPACT_NoIcon", "/Lotus/Language/Items/BowCategoryName", "/Lotus/Language/Items/RifleCategoryName", "/Lotus/Language/Items/SniperCategoryName"],
    		"SellingPrice": 7500,
    		"ShowInMarket": 0
    	},
    	"storeItemType": "/Lotus/StoreItems/Weapons/Grineer/Bows/GrnBow/GrnBowWeapon",
    	"tag": "Weapon",
    	"texture": "/Lotus/Interface/Icons/Store/KuvaGrnBow.png",
    	"texture_new": "/Lotus/Interface/Icons/StoreIcons/Weapons/PrimaryWeapons/Weapons/KuvaGrnBow.png"
    }
    ```

## Data Validation

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-11 "Edit section's source code: Data Validation")]

### Validate data types of key-value pairs

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-12 "Edit section's source code: Validate data types of key-value pairs")]

**p.validateDataTypes(frame): There are a total of 737 key-value errors**

1. "[AX-52](/w/AX-52 "AX-52")" contains an unsupported key `GripType`
2. "[Acceltra](/w/Acceltra "Acceltra")" contains an unsupported key `GripType`
3. "[Acceltra Prime](/w/Acceltra_Prime "Acceltra Prime")" contains an unsupported key `GripType`
4. "[Ack & Brunt](/w/Ack_%26_Brunt "Ack & Brunt")" contains an unsupported key `GripType`
5. "[Ack & Brunt](/w/Ack_%26_Brunt "Ack & Brunt")" contains an unsupported key `IncarnonDuration`
6. "[Acrid](/w/Acrid "Acrid")" contains an unsupported key `GripType`
7. "[Aegrit](/w/Aegrit "Aegrit")" contains an unsupported key `GripType`
8. "[Aeolak](/w/Aeolak "Aeolak")" contains an unsupported key `GripType`
9. "[Afentis](/w/Afentis "Afentis")" contains an unsupported key `GripType`
10. "[Afentis Prime](/w/Afentis_Prime "Afentis Prime")" contains an unsupported key `GripType`
11. "[Afuris](/w/Afuris "Afuris")" contains an unsupported key `GripType`
12. "[Afuris Prime](/w/Afuris_Prime "Afuris Prime")" contains an unsupported key `GripType`
13. "[Agkuza](/w/Agkuza "Agkuza")" contains an unsupported key `GripType`
14. "[Akarius](/w/Akarius "Akarius")" contains an unsupported key `GripType`
15. "[Akarius Prime](/w/Akarius_Prime "Akarius Prime")" contains an unsupported key `GripType`
16. "[Akbolto](/w/Akbolto "Akbolto")" contains an unsupported key `GripType`
17. "[Akbolto Prime](/w/Akbolto_Prime "Akbolto Prime")" contains an unsupported key `GripType`
18. "[Akbronco](/w/Akbronco "Akbronco")" contains an unsupported key `GripType`
19. "[Akbronco Prime](/w/Akbronco_Prime "Akbronco Prime")" contains an unsupported key `GripType`
20. "[Akjagara](/w/Akjagara "Akjagara")" contains an unsupported key `GripType`
21. "[Akjagara Prime](/w/Akjagara_Prime "Akjagara Prime")" contains an unsupported key `GripType`
22. "[Aklato](/w/Aklato "Aklato")" contains an unsupported key `GripType`
23. "[Aklex](/w/Aklex "Aklex")" contains an unsupported key `GripType`
24. "[Aklex Prime](/w/Aklex_Prime "Aklex Prime")" contains an unsupported key `GripType`
25. "[Akmagnus](/w/Akmagnus "Akmagnus")" contains an unsupported key `GripType`
26. "[Akmagnus Prime](/w/Akmagnus_Prime "Akmagnus Prime")" contains an unsupported key `GripType`
27. "[Aksomati](/w/Aksomati "Aksomati")" contains an unsupported key `GripType`
28. "[Aksomati Prime](/w/Aksomati_Prime "Aksomati Prime")" contains an unsupported key `GripType`
29. "[Akstiletto](/w/Akstiletto "Akstiletto")" contains an unsupported key `GripType`
30. "[Akstiletto Prime](/w/Akstiletto_Prime "Akstiletto Prime")" contains an unsupported key `GripType`
31. "[Akvasto](/w/Akvasto "Akvasto")" contains an unsupported key `GripType`
32. "[Akvasto Prime](/w/Akvasto_Prime "Akvasto Prime")" contains an unsupported key `GripType`
33. "[Akzani](/w/Akzani "Akzani")" contains an unsupported key `GripType`
34. "[Alternox](/w/Alternox "Alternox")" contains an unsupported key `GripType`
35. "[Alternox Prime](/w/Alternox_Prime "Alternox Prime")" contains an unsupported key `GripType`
36. "[Amanata](/w/Amanata "Amanata")" contains an unsupported key `GripType`
37. "[Ambassador](/w/Ambassador "Ambassador")" contains an unsupported key `GripType`
38. "[Amphis](/w/Amphis "Amphis")" contains an unsupported key `GripType`
39. "[Amprex](/w/Amprex "Amprex")" contains an unsupported key `GripType`
40. "[Angstrum](/w/Angstrum "Angstrum")" contains an unsupported key `IncarnonChargeGain`
41. "[Angstrum](/w/Angstrum "Angstrum")" contains an unsupported key `GripType`
42. "[Anku](/w/Anku "Anku")" contains an unsupported key `GripType`
43. "[Anku](/w/Anku "Anku")" contains an unsupported key `IncarnonDuration`
44. "[Ankyros](/w/Ankyros "Ankyros")" contains an unsupported key `GripType`
45. "[Ankyros Prime](/w/Ankyros_Prime "Ankyros Prime")" contains an unsupported key `GripType`
46. "[Arbucep](/w/Arbucep "Arbucep")" contains an unsupported key `GripType`
47. "[Arbucep (Atmosphere)](/w/Arbucep_(Atmosphere)?action=edit&redlink=1 "Arbucep (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
48. "[Arca Plasmor](/w/Arca_Plasmor "Arca Plasmor")" contains an unsupported key `GripType`
49. "[Arca Scisco](/w/Arca_Scisco "Arca Scisco")" contains an unsupported key `GripType`
50. "[Arca Titron](/w/Arca_Titron "Arca Titron")" contains an unsupported key `GripType`
51. "[Argo & Vel](/w/Argo_%26_Vel "Argo & Vel")" contains an unsupported key `GripType`
52. "[Argonak](/w/Argonak "Argonak")" contains an unsupported key `GripType`
53. "[Arquebex](/w/Arquebex "Arquebex")" contains an unsupported key `GripType`
54. "[Artemis Bow](/w/Artemis_Bow "Artemis Bow")" contains an unsupported key `GripType`
55. "[Artemis Bow Prime](/w/Artemis_Bow_Prime "Artemis Bow Prime")" contains an unsupported key `GripType`
56. "[Arum Spinosa](/w/Arum_Spinosa "Arum Spinosa")" contains an unsupported key `GripType`
57. "[Astilla](/w/Astilla "Astilla")" contains an unsupported key `GripType`
58. "[Astilla Prime](/w/Astilla_Prime "Astilla Prime")" contains an unsupported key `GripType`
59. "[Athodai](/w/Athodai "Athodai")" contains an unsupported key `GripType`
60. "[Athodai Prime](/w/Athodai_Prime "Athodai Prime")" contains an unsupported key `GripType`
61. "[Atomos](/w/Atomos "Atomos")" contains an unsupported key `IncarnonChargeGain`
62. "[Atomos](/w/Atomos "Atomos")" contains an unsupported key `GripType`
63. "[Atterax](/w/Atterax "Atterax")" contains an unsupported key `GripType`
64. "[Attica](/w/Attica "Attica")" contains an unsupported key `GripType`
65. "[Azima](/w/Azima "Azima")" contains an unsupported key `GripType`
66. "[Azothane](/w/Azothane "Azothane")" contains an unsupported key `GripType`
67. "[Balefire Charger](/w/Balefire_Charger "Balefire Charger")" contains an unsupported key `GripType`
68. "[Balefire Charger Prime](/w/Balefire_Charger_Prime "Balefire Charger Prime")" contains an unsupported key `GripType`
69. "[Ballistica](/w/Ballistica "Ballistica")" contains an unsupported key `IncarnonChargeGain`
70. "[Ballistica](/w/Ballistica "Ballistica")" contains an unsupported key `GripType`
71. "[Ballistica Prime](/w/Ballistica_Prime "Ballistica Prime")" contains an unsupported key `IncarnonChargeGain`
72. "[Ballistica Prime](/w/Ballistica_Prime "Ballistica Prime")" contains an unsupported key `GripType`
73. "[Basmu](/w/Basmu "Basmu")" contains an unsupported key `GripType`
74. "[Battacor](/w/Battacor "Battacor")" contains an unsupported key `GripType`
75. "[Baza](/w/Baza "Baza")" contains an unsupported key `GripType`
76. "[Baza Prime](/w/Baza_Prime "Baza Prime")" contains an unsupported key `GripType`
77. "[Bo](/w/Bo "Bo")" contains an unsupported key `GripType`
78. "[Bo](/w/Bo "Bo")" contains an unsupported key `IncarnonDuration`
79. "[Bo Prime](/w/Bo_Prime "Bo Prime")" contains an unsupported key `GripType`
80. "[Bo Prime](/w/Bo_Prime "Bo Prime")" contains an unsupported key `IncarnonDuration`
81. "[Boar](/w/Boar "Boar")" contains an unsupported key `IncarnonChargeGain`
82. "[Boar](/w/Boar "Boar")" contains an unsupported key `GripType`
83. "[Boar Prime](/w/Boar_Prime "Boar Prime")" contains an unsupported key `IncarnonChargeGain`
84. "[Boar Prime](/w/Boar_Prime "Boar Prime")" contains an unsupported key `GripType`
85. "[Boltace](/w/Boltace "Boltace")" contains an unsupported key `GripType`
86. "[Bolto](/w/Bolto "Bolto")" contains an unsupported key `GripType`
87. "[Boltor](/w/Boltor "Boltor")" contains an unsupported key `IncarnonChargeGain`
88. "[Boltor](/w/Boltor "Boltor")" contains an unsupported key `GripType`
89. "[Boltor Prime](/w/Boltor_Prime "Boltor Prime")" contains an unsupported key `IncarnonChargeGain`
90. "[Boltor Prime](/w/Boltor_Prime "Boltor Prime")" contains an unsupported key `GripType`
91. "[Brakk](/w/Brakk "Brakk")" contains an unsupported key `GripType`
92. "[Braton](/w/Braton "Braton")" contains an unsupported key `IncarnonChargeGain`
93. "[Braton](/w/Braton "Braton")" contains an unsupported key `GripType`
94. "[Braton Prime](/w/Braton_Prime "Braton Prime")" contains an unsupported key `IncarnonChargeGain`
95. "[Braton Prime](/w/Braton_Prime "Braton Prime")" contains an unsupported key `GripType`
96. "[Braton Vandal](/w/Braton_Vandal "Braton Vandal")" contains an unsupported key `IncarnonChargeGain`
97. "[Braton Vandal](/w/Braton_Vandal "Braton Vandal")" contains an unsupported key `GripType`
98. "[Broken Scepter](/w/Broken_Scepter "Broken Scepter")" contains an unsupported key `GripType`
99. "[Broken War](/w/Broken_War "Broken War")" contains an unsupported key `GripType`
100. "[Bronco](/w/Bronco "Bronco")" contains an unsupported key `IncarnonChargeGain`
101. "[Bronco](/w/Bronco "Bronco")" contains an unsupported key `GripType`
102. "[Bronco Prime](/w/Bronco_Prime "Bronco Prime")" contains an unsupported key `IncarnonChargeGain`
103. "[Bronco Prime](/w/Bronco_Prime "Bronco Prime")" contains an unsupported key `GripType`
104. "[Bubonico](/w/Bubonico "Bubonico")" contains an unsupported key `GripType`
105. "[Burston](/w/Burston "Burston")" contains an unsupported key `IncarnonChargeGain`
106. "[Burston](/w/Burston "Burston")" contains an unsupported key `GripType`
107. "[Burston Prime](/w/Burston_Prime "Burston Prime")" contains an unsupported key `IncarnonChargeGain`
108. "[Burston Prime](/w/Burston_Prime "Burston Prime")" contains an unsupported key `GripType`
109. "[Buzlok](/w/Buzlok "Buzlok")" contains an unsupported key `GripType`
110. "[Cadus](/w/Cadus "Cadus")" contains an unsupported key `GripType`
111. "[Cantare](/w/Cantare "Cantare")" contains an unsupported key `GripType`
112. "[Carmine Penta](/w/Carmine_Penta "Carmine Penta")" contains an unsupported key `GripType`
113. "[Cassowar](/w/Cassowar "Cassowar")" contains an unsupported key `GripType`
114. "[Castanas](/w/Castanas "Castanas")" contains an unsupported key `GripType`
115. "[Catabolyst](/w/Catabolyst "Catabolyst")" contains an unsupported key `GripType`
116. "[Caustacyst](/w/Caustacyst "Caustacyst")" contains an unsupported key `GripType`
117. "[Cedo](/w/Cedo "Cedo")" contains an unsupported key `GripType`
118. "[Cedo Prime](/w/Cedo_Prime "Cedo Prime")" contains an unsupported key `GripType`
119. "[Centaur](/w/Centaur "Centaur")" contains an unsupported key `GripType`
120. "[Ceramic Dagger](/w/Ceramic_Dagger "Ceramic Dagger")" contains an unsupported key `GripType`
121. "[Ceramic Dagger](/w/Ceramic_Dagger "Ceramic Dagger")" contains an unsupported key `IncarnonDuration`
122. "[Cerata](/w/Cerata "Cerata")" contains an unsupported key `GripType`
123. "[Cernos](/w/Cernos "Cernos")" contains an unsupported key `GripType`
124. "[Cernos Prime](/w/Cernos_Prime "Cernos Prime")" contains an unsupported key `GripType`
125. "[Cestra](/w/Cestra "Cestra")" contains an unsupported key `IncarnonChargeGain`
126. "[Cestra](/w/Cestra "Cestra")" contains an unsupported key `GripType`
127. "[Ceti Lacera](/w/Ceti_Lacera "Ceti Lacera")" contains an unsupported key `GripType`
128. "[Cinta](/w/Cinta "Cinta")" contains an unsupported key `GripType`
129. "[Cobra & Crane](/w/Cobra_%26_Crane "Cobra & Crane")" contains an unsupported key `GripType`
130. "[Cobra & Crane Prime](/w/Cobra_%26_Crane_Prime "Cobra & Crane Prime")" contains an unsupported key `GripType`
131. "[Coda Bassocyst](/w/Coda_Bassocyst "Coda Bassocyst")" contains an unsupported key `GripType`
132. "[Coda Bubonico](/w/Coda_Bubonico "Coda Bubonico")" contains an unsupported key `GripType`
133. "[Coda Catabolyst](/w/Coda_Catabolyst "Coda Catabolyst")" contains an unsupported key `GripType`
134. "[Coda Caustacyst](/w/Coda_Caustacyst "Coda Caustacyst")" contains an unsupported key `GripType`
135. "[Coda Hema](/w/Coda_Hema "Coda Hema")" contains an unsupported key `GripType`
136. "[Coda Hirudo](/w/Coda_Hirudo "Coda Hirudo")" contains an unsupported key `GripType`
137. "[Coda Mire](/w/Coda_Mire "Coda Mire")" contains an unsupported key `GripType`
138. "[Coda Motovore](/w/Coda_Motovore "Coda Motovore")" contains an unsupported key `GripType`
139. "[Coda Pathocyst](/w/Coda_Pathocyst "Coda Pathocyst")" contains an unsupported key `GripType`
140. "[Coda Pox](/w/Coda_Pox "Coda Pox")" contains an unsupported key `GripType`
141. "[Coda Sporothrix](/w/Coda_Sporothrix "Coda Sporothrix")" contains an unsupported key `GripType`
142. "[Coda Synapse](/w/Coda_Synapse "Coda Synapse")" contains an unsupported key `GripType`
143. "[Coda Tysis](/w/Coda_Tysis "Coda Tysis")" contains an unsupported key `GripType`
144. "[Convectrix](/w/Convectrix "Convectrix")" contains an unsupported key `GripType`
145. "[Corinth](/w/Corinth "Corinth")" contains an unsupported key `GripType`
146. "[Corinth Prime](/w/Corinth_Prime "Corinth Prime")" contains an unsupported key `GripType`
147. "[Cortege](/w/Cortege "Cortege")" contains an unsupported key `GripType`
148. "[Cortege (Atmosphere)](/w/Cortege_(Atmosphere)?action=edit&redlink=1 "Cortege (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
149. "[Corufell](/w/Corufell "Corufell")" contains an unsupported key `GripType`
150. "[Corvas](/w/Corvas "Corvas")" contains an unsupported key `GripType`
151. "[Corvas (Atmosphere)](/w/Corvas_(Atmosphere)?action=edit&redlink=1 "Corvas (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
152. "[Corvas Prime](/w/Corvas_Prime "Corvas Prime")" contains an unsupported key `GripType`
153. "[Corvas Prime (Atmosphere)](/w/Corvas_Prime_(Atmosphere)?action=edit&redlink=1 "Corvas Prime (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
154. "[Cronus](/w/Cronus "Cronus")" contains an unsupported key `GripType`
155. "[Cyanex](/w/Cyanex "Cyanex")" contains an unsupported key `GripType`
156. "[Cycron](/w/Cycron "Cycron")" contains an unsupported key `GripType`
157. "[Cyngas](/w/Cyngas "Cyngas")" contains an unsupported key `GripType`
158. "[Cyngas (Atmosphere)](/w/Cyngas_(Atmosphere)?action=edit&redlink=1 "Cyngas (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
159. "[Daikyu](/w/Daikyu "Daikyu")" contains an unsupported key `GripType`
160. "[Daikyu Prime](/w/Daikyu_Prime "Daikyu Prime")" contains an unsupported key `GripType`
161. "[Dakra Prime](/w/Dakra_Prime "Dakra Prime")" contains an unsupported key `GripType`
162. "[Dark Dagger](/w/Dark_Dagger "Dark Dagger")" contains an unsupported key `GripType`
163. "[Dark Split-Sword (Dual Swords)](/w/Dark_Split-Sword_(Dual_Swords) "Dark Split-Sword (Dual Swords)")" contains an unsupported key `GripType`
164. "[Dark Split-Sword (Heavy Blade)](/w/Dark_Split-Sword_(Heavy_Blade) "Dark Split-Sword (Heavy Blade)")" contains an unsupported key `GripType`
165. "[Dark Sword](/w/Dark_Sword "Dark Sword")" contains an unsupported key `GripType`
166. "[Dera](/w/Dera "Dera")" contains an unsupported key `IncarnonChargeGain`
167. "[Dera](/w/Dera "Dera")" contains an unsupported key `GripType`
168. "[Dera Vandal](/w/Dera_Vandal "Dera Vandal")" contains an unsupported key `IncarnonChargeGain`
169. "[Dera Vandal](/w/Dera_Vandal "Dera Vandal")" contains an unsupported key `GripType`
170. "[Despair](/w/Despair "Despair")" contains an unsupported key `IncarnonChargeGain`
171. "[Despair](/w/Despair "Despair")" contains an unsupported key `GripType`
172. "[Destreza](/w/Destreza "Destreza")" contains an unsupported key `GripType`
173. "[Destreza](/w/Destreza "Destreza")" contains an unsupported key `IncarnonDuration`
174. "[Destreza Prime](/w/Destreza_Prime "Destreza Prime")" contains an unsupported key `GripType`
175. "[Destreza Prime](/w/Destreza_Prime "Destreza Prime")" contains an unsupported key `IncarnonDuration`
176. "[Detron](/w/Detron "Detron")" contains an unsupported key `GripType`
177. "[Dex Dakra](/w/Dex_Dakra "Dex Dakra")" contains an unsupported key `GripType`
178. "[Dex Furis](/w/Dex_Furis "Dex Furis")" contains an unsupported key `GripType`
179. "[Dex Nikana](/w/Dex_Nikana "Dex Nikana")" contains an unsupported key `GripType`
180. "[Dex Pixia](/w/Dex_Pixia "Dex Pixia")" contains an unsupported key `GripType`
181. "[Dex Pixia Prime](/w/Dex_Pixia_Prime "Dex Pixia Prime")" contains an unsupported key `GripType`
182. "[Dex Sybaris](/w/Dex_Sybaris "Dex Sybaris")" contains an unsupported key `IncarnonChargeGain`
183. "[Dex Sybaris](/w/Dex_Sybaris "Dex Sybaris")" contains an unsupported key `GripType`
184. "[Dorrclave](/w/Dorrclave "Dorrclave")" contains an unsupported key `GripType`
185. "[Dragon Nikana](/w/Dragon_Nikana "Dragon Nikana")" contains an unsupported key `GripType`
186. "[Drakgoon](/w/Drakgoon "Drakgoon")" contains an unsupported key `GripType`
187. "[Dread](/w/Dread "Dread")" contains an unsupported key `IncarnonChargeGain`
188. "[Dread](/w/Dread "Dread")" contains an unsupported key `GripType`
189. "[Dual Cestra](/w/Dual_Cestra "Dual Cestra")" contains an unsupported key `GripType`
190. "[Dual Cleavers](/w/Dual_Cleavers "Dual Cleavers")" contains an unsupported key `GripType`
191. "[Dual Coda Torxica](/w/Dual_Coda_Torxica "Dual Coda Torxica")" contains an unsupported key `GripType`
192. "[Dual Decurion](/w/Dual_Decurion "Dual Decurion")" contains an unsupported key `GripType`
193. "[Dual Decurion (Atmosphere)](/w/Dual_Decurion_(Atmosphere)?action=edit&redlink=1 "Dual Decurion (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
194. "[Dual Ether](/w/Dual_Ether "Dual Ether")" contains an unsupported key `GripType`
195. "[Dual Heat Swords](/w/Dual_Heat_Swords "Dual Heat Swords")" contains an unsupported key `GripType`
196. "[Dual Ichor](/w/Dual_Ichor "Dual Ichor")" contains an unsupported key `GripType`
197. "[Dual Ichor](/w/Dual_Ichor "Dual Ichor")" contains an unsupported key `IncarnonDuration`
198. "[Dual Kamas](/w/Dual_Kamas "Dual Kamas")" contains an unsupported key `GripType`
199. "[Dual Kamas Prime](/w/Dual_Kamas_Prime "Dual Kamas Prime")" contains an unsupported key `GripType`
200. "[Dual Keres](/w/Dual_Keres "Dual Keres")" contains an unsupported key `GripType`
201. "[Dual Keres Prime](/w/Dual_Keres_Prime "Dual Keres Prime")" contains an unsupported key `GripType`
202. "[Dual Raza](/w/Dual_Raza "Dual Raza")" contains an unsupported key `GripType`
203. "[Dual Skana](/w/Dual_Skana "Dual Skana")" contains an unsupported key `GripType`
204. "[Dual Toxocyst](/w/Dual_Toxocyst "Dual Toxocyst")" contains an unsupported key `IncarnonChargeGain`
205. "[Dual Toxocyst](/w/Dual_Toxocyst "Dual Toxocyst")" contains an unsupported key `GripType`
206. "[Dual Viciss](/w/Dual_Viciss "Dual Viciss")" contains an unsupported key `GripType`
207. "[Dual Zoren](/w/Dual_Zoren "Dual Zoren")" contains an unsupported key `GripType`
208. "[Dual Zoren Prime](/w/Dual_Zoren_Prime "Dual Zoren Prime")" contains an unsupported key `GripType`
209. "[EFV-5 Jupiter](/w/EFV-5_Jupiter "EFV-5 Jupiter")" contains an unsupported key `GripType`
210. "[EFV-8 Mars](/w/EFV-8_Mars "EFV-8 Mars")" contains an unsupported key `GripType`
211. "[Edun](/w/Edun "Edun")" contains an unsupported key `GripType`
212. "[Ekhein](/w/Ekhein "Ekhein")" contains an unsupported key `GripType`
213. "[Embolist](/w/Embolist "Embolist")" contains an unsupported key `GripType`
214. "[Endura](/w/Endura "Endura")" contains an unsupported key `GripType`
215. "[Enkaus](/w/Enkaus "Enkaus")" contains an unsupported key `GripType`
216. "[Epitaph](/w/Epitaph "Epitaph")" contains an unsupported key `GripType`
217. "[Epitaph Prime](/w/Epitaph_Prime "Epitaph Prime")" contains an unsupported key `GripType`
218. "[Ether Daggers](/w/Ether_Daggers "Ether Daggers")" contains an unsupported key `GripType`
219. "[Ether Reaper](/w/Ether_Reaper "Ether Reaper")" contains an unsupported key `GripType`
220. "[Ether Sword](/w/Ether_Sword "Ether Sword")" contains an unsupported key `GripType`
221. "[Euphona Prime](/w/Euphona_Prime "Euphona Prime")" contains an unsupported key `GripType`
222. "[Evensong](/w/Evensong "Evensong")" contains an unsupported key `GripType`
223. "[Exalted Blade](/w/Exalted_Blade "Exalted Blade")" contains an unsupported key `GripType`
224. "[Exalted Prime Blade](/w/Exalted_Prime_Blade "Exalted Prime Blade")" contains an unsupported key `GripType`
225. "[Exalted Umbra Blade](/w/Exalted_Umbra_Blade "Exalted Umbra Blade")" contains an unsupported key `GripType`
226. "[Exergis](/w/Exergis "Exergis")" contains an unsupported key `GripType`
227. "[Falcor](/w/Falcor "Falcor")" contains an unsupported key `GripType`
228. "[Fang](/w/Fang "Fang")" contains an unsupported key `GripType`
229. "[Fang Prime](/w/Fang_Prime "Fang Prime")" contains an unsupported key `GripType`
230. "[Felarx](/w/Felarx "Felarx")" contains an unsupported key `IncarnonChargeGain`
231. "[Felarx](/w/Felarx "Felarx")" contains an unsupported key `GripType`
232. "[Ferrox](/w/Ferrox "Ferrox")" contains an unsupported key `GripType`
233. "[Fluctus](/w/Fluctus "Fluctus")" contains an unsupported key `GripType`
234. "[Fluctus (Atmosphere)](/w/Fluctus_(Atmosphere)?action=edit&redlink=1 "Fluctus (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
235. "[Flux Rifle](/w/Flux_Rifle "Flux Rifle")" contains an unsupported key `GripType`
236. "[Fragor](/w/Fragor "Fragor")" contains an unsupported key `GripType`
237. "[Fragor Prime](/w/Fragor_Prime "Fragor Prime")" contains an unsupported key `GripType`
238. "[Fulmin](/w/Fulmin "Fulmin")" contains an unsupported key `GripType`
239. "[Fulmin Prime](/w/Fulmin_Prime "Fulmin Prime")" contains an unsupported key `GripType`
240. "[Furax](/w/Furax "Furax")" contains an unsupported key `GripType`
241. "[Furax](/w/Furax "Furax")" contains an unsupported key `IncarnonDuration`
242. "[Furax Wraith](/w/Furax_Wraith "Furax Wraith")" contains an unsupported key `GripType`
243. "[Furax Wraith](/w/Furax_Wraith "Furax Wraith")" contains an unsupported key `IncarnonDuration`
244. "[Furis](/w/Furis "Furis")" contains an unsupported key `IncarnonChargeGain`
245. "[Furis](/w/Furis "Furis")" contains an unsupported key `GripType`
246. "[Fusilai](/w/Fusilai "Fusilai")" contains an unsupported key `GripType`
247. "[Galariak Prime](/w/Galariak_Prime "Galariak Prime")" contains an unsupported key `GripType`
248. "[Galatine](/w/Galatine "Galatine")" contains an unsupported key `GripType`
249. "[Galatine Prime](/w/Galatine_Prime "Galatine Prime")" contains an unsupported key `GripType`
250. "[Galvacord](/w/Galvacord "Galvacord")" contains an unsupported key `GripType`
251. "[Gammacor](/w/Gammacor "Gammacor")" contains an unsupported key `IncarnonChargeGain`
252. "[Gammacor](/w/Gammacor "Gammacor")" contains an unsupported key `GripType`
253. "[Gazal Machete](/w/Gazal_Machete "Gazal Machete")" contains an unsupported key `GripType`
254. "[Ghoulsaw](/w/Ghoulsaw "Ghoulsaw")" contains an unsupported key `GripType`
255. "[Glaive](/w/Glaive "Glaive")" contains an unsupported key `GripType`
256. "[Glaive Prime](/w/Glaive_Prime "Glaive Prime")" contains an unsupported key `GripType`
257. "[Glaxion](/w/Glaxion "Glaxion")" contains an unsupported key `GripType`
258. "[Glaxion Vandal](/w/Glaxion_Vandal "Glaxion Vandal")" contains an unsupported key `GripType`
259. "[Glory](/w/Glory "Glory")" contains an unsupported key `GripType`
260. "[Gorgon](/w/Gorgon "Gorgon")" contains an unsupported key `IncarnonChargeGain`
261. "[Gorgon](/w/Gorgon "Gorgon")" contains an unsupported key `GripType`
262. "[Gorgon Wraith](/w/Gorgon_Wraith "Gorgon Wraith")" contains an unsupported key `IncarnonChargeGain`
263. "[Gorgon Wraith](/w/Gorgon_Wraith "Gorgon Wraith")" contains an unsupported key `GripType`
264. "[Gotva Prime](/w/Gotva_Prime "Gotva Prime")" contains an unsupported key `GripType`
265. "[Grakata](/w/Grakata "Grakata")" contains an unsupported key `GripType`
266. "[Gram](/w/Gram "Gram")" contains an unsupported key `GripType`
267. "[Gram Prime](/w/Gram_Prime "Gram Prime")" contains an unsupported key `GripType`
268. "[Grattler](/w/Grattler "Grattler")" contains an unsupported key `GripType`
269. "[Grattler (Atmosphere)](/w/Grattler_(Atmosphere)?action=edit&redlink=1 "Grattler (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
270. "[Grimoire](/w/Grimoire "Grimoire")" contains an unsupported key `GripType`
271. "[Grinlok](/w/Grinlok "Grinlok")" contains an unsupported key `GripType`
272. "[Guandao](/w/Guandao "Guandao")" contains an unsupported key `GripType`
273. "[Guandao Prime](/w/Guandao_Prime "Guandao Prime")" contains an unsupported key `GripType`
274. "[Gunsen](/w/Gunsen "Gunsen")" contains an unsupported key `GripType`
275. "[Gunsen Prime](/w/Gunsen_Prime "Gunsen Prime")" contains an unsupported key `GripType`
276. "[Haalvu](/w/Haalvu "Haalvu")" contains an unsupported key `GripType`
277. "[Halikar](/w/Halikar "Halikar")" contains an unsupported key `GripType`
278. "[Halikar Wraith](/w/Halikar_Wraith "Halikar Wraith")" contains an unsupported key `GripType`
279. "[Harmony](/w/Harmony "Harmony")" contains an unsupported key `GripType`
280. "[Harpak](/w/Harpak "Harpak")" contains an unsupported key `GripType`
281. "[Hate](/w/Hate "Hate")" contains an unsupported key `GripType`
282. "[Hate](/w/Hate "Hate")" contains an unsupported key `IncarnonDuration`
283. "[Heat Dagger](/w/Heat_Dagger "Heat Dagger")" contains an unsupported key `GripType`
284. "[Heat Sword](/w/Heat_Sword "Heat Sword")" contains an unsupported key `GripType`
285. "[Hek](/w/Hek "Hek")" contains an unsupported key `GripType`
286. "[Heliocor](/w/Heliocor "Heliocor")" contains an unsupported key `GripType`
287. "[Hema](/w/Hema "Hema")" contains an unsupported key `GripType`
288. "[Hespar](/w/Hespar "Hespar")" contains an unsupported key `GripType`
289. "[Higasa](/w/Higasa "Higasa")" contains an unsupported key `GripType`
290. "[Hikou](/w/Hikou "Hikou")" contains an unsupported key `GripType`
291. "[Hikou Prime](/w/Hikou_Prime "Hikou Prime")" contains an unsupported key `GripType`
292. "[Hind](/w/Hind "Hind")" contains an unsupported key `GripType`
293. "[Hirudo](/w/Hirudo "Hirudo")" contains an unsupported key `GripType`
294. "[Hystrix](/w/Hystrix "Hystrix")" contains an unsupported key `GripType`
295. "[Hystrix Prime](/w/Hystrix_Prime "Hystrix Prime")" contains an unsupported key `GripType`
296. "[Ignis](/w/Ignis "Ignis")" contains an unsupported key `GripType`
297. "[Ignis Wraith](/w/Ignis_Wraith "Ignis Wraith")" contains an unsupported key `GripType`
298. "[Imperator](/w/Imperator "Imperator")" contains an unsupported key `GripType`
299. "[Imperator (Atmosphere)](/w/Imperator_(Atmosphere)?action=edit&redlink=1 "Imperator (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
300. "[Imperator Vandal](/w/Imperator_Vandal "Imperator Vandal")" contains an unsupported key `GripType`
301. "[Imperator Vandal (Atmosphere)](/w/Imperator_Vandal_(Atmosphere)?action=edit&redlink=1 "Imperator Vandal (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
302. "[Innodem](/w/Innodem "Innodem")" contains an unsupported key `GripType`
303. "[Iron Staff](/w/Iron_Staff "Iron Staff")" contains an unsupported key `GripType`
304. "[Iron Staff Prime](/w/Iron_Staff_Prime "Iron Staff Prime")" contains an unsupported key `GripType`
305. "[Ironbride](/w/Ironbride "Ironbride")" contains an unsupported key `GripType`
306. "[Jat Kittag](/w/Jat_Kittag "Jat Kittag")" contains an unsupported key `GripType`
307. "[Jat Kusar](/w/Jat_Kusar "Jat Kusar")" contains an unsupported key `GripType`
308. "[Javlok](/w/Javlok "Javlok")" contains an unsupported key `GripType`
309. "[Jaw Sword](/w/Jaw_Sword "Jaw Sword")" contains an unsupported key `GripType`
310. "[Kama](/w/Kama "Kama")" contains an unsupported key `GripType`
311. "[Karak](/w/Karak "Karak")" contains an unsupported key `GripType`
312. "[Karak Wraith](/w/Karak_Wraith "Karak Wraith")" contains an unsupported key `GripType`
313. "[Karyst](/w/Karyst "Karyst")" contains an unsupported key `GripType`
314. "[Karyst Prime](/w/Karyst_Prime "Karyst Prime")" contains an unsupported key `GripType`
315. "[Kaszas](/w/Kaszas "Kaszas")" contains an unsupported key `GripType`
316. "[Keratinos](/w/Keratinos "Keratinos")" contains an unsupported key `GripType`
317. "[Kesheg](/w/Kesheg "Kesheg")" contains an unsupported key `GripType`
318. "[Kestrel](/w/Kestrel "Kestrel")" contains an unsupported key `GripType`
319. "[Kestrel Prime](/w/Kestrel_Prime "Kestrel Prime")" contains an unsupported key `GripType`
320. "[Knell](/w/Knell "Knell")" contains an unsupported key `GripType`
321. "[Knell Prime](/w/Knell_Prime "Knell Prime")" contains an unsupported key `GripType`
322. "[Knux](/w/Knux "Knux")" contains an unsupported key `GripType`
323. "[Kogake](/w/Kogake "Kogake")" contains an unsupported key `GripType`
324. "[Kogake Prime](/w/Kogake_Prime "Kogake Prime")" contains an unsupported key `GripType`
325. "[Kohm](/w/Kohm "Kohm")" contains an unsupported key `GripType`
326. "[Kohmak](/w/Kohmak "Kohmak")" contains an unsupported key `GripType`
327. "[Komorex](/w/Komorex "Komorex")" contains an unsupported key `GripType`
328. "[Kompressa](/w/Kompressa "Kompressa")" contains an unsupported key `GripType`
329. "[Kompressa Prime](/w/Kompressa_Prime "Kompressa Prime")" contains an unsupported key `GripType`
330. "[Korrudo](/w/Korrudo "Korrudo")" contains an unsupported key `GripType`
331. "[Korumm](/w/Korumm "Korumm")" contains an unsupported key `GripType`
332. "[Kraken](/w/Kraken "Kraken")" contains an unsupported key `GripType`
333. "[Kreska](/w/Kreska "Kreska")" contains an unsupported key `GripType`
334. "[Krohkur](/w/Krohkur "Krohkur")" contains an unsupported key `GripType`
335. "[Kronen](/w/Kronen "Kronen")" contains an unsupported key `GripType`
336. "[Kronen Prime](/w/Kronen_Prime "Kronen Prime")" contains an unsupported key `GripType`
337. "[Kulstar](/w/Kulstar "Kulstar")" contains an unsupported key `GripType`
338. "[Kunai](/w/Kunai "Kunai")" contains an unsupported key `IncarnonChargeGain`
339. "[Kunai](/w/Kunai "Kunai")" contains an unsupported key `GripType`
340. "[Kuva Ayanga](/w/Kuva_Ayanga "Kuva Ayanga")" contains an unsupported key `GripType`
341. "[Kuva Ayanga (Atmosphere)](/w/Kuva_Ayanga_(Atmosphere)?action=edit&redlink=1 "Kuva Ayanga (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
342. "[Kuva Brakk](/w/Kuva_Brakk "Kuva Brakk")" contains an unsupported key `GripType`
343. "[Kuva Bramma](/w/Kuva_Bramma "Kuva Bramma")" contains an unsupported key `GripType`
344. "[Kuva Chakkhurr](/w/Kuva_Chakkhurr "Kuva Chakkhurr")" contains an unsupported key `GripType`
345. "[Kuva Drakgoon](/w/Kuva_Drakgoon "Kuva Drakgoon")" contains an unsupported key `GripType`
346. "[Kuva Ghoulsaw](/w/Kuva_Ghoulsaw "Kuva Ghoulsaw")" contains an unsupported key `GripType`
347. "[Kuva Grattler](/w/Kuva_Grattler "Kuva Grattler")" contains an unsupported key `GripType`
348. "[Kuva Grattler (Atmosphere)](/w/Kuva_Grattler_(Atmosphere)?action=edit&redlink=1 "Kuva Grattler (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
349. "[Kuva Hek](/w/Kuva_Hek "Kuva Hek")" contains an unsupported key `GripType`
350. "[Kuva Hind](/w/Kuva_Hind "Kuva Hind")" contains an unsupported key `GripType`
351. "[Kuva Karak](/w/Kuva_Karak "Kuva Karak")" contains an unsupported key `GripType`
352. "[Kuva Kohm](/w/Kuva_Kohm "Kuva Kohm")" contains an unsupported key `GripType`
353. "[Kuva Kraken](/w/Kuva_Kraken "Kuva Kraken")" contains an unsupported key `GripType`
354. "[Kuva Nukor](/w/Kuva_Nukor "Kuva Nukor")" contains an unsupported key `GripType`
355. "[Kuva Ogris](/w/Kuva_Ogris "Kuva Ogris")" contains an unsupported key `GripType`
356. "[Kuva Quartakk](/w/Kuva_Quartakk "Kuva Quartakk")" contains an unsupported key `GripType`
357. "[Kuva Seer](/w/Kuva_Seer "Kuva Seer")" contains an unsupported key `GripType`
358. "[Kuva Shildeg](/w/Kuva_Shildeg "Kuva Shildeg")" contains an unsupported key `GripType`
359. "[Kuva Sobek](/w/Kuva_Sobek "Kuva Sobek")" contains an unsupported key `GripType`
360. "[Kuva Tonkor](/w/Kuva_Tonkor "Kuva Tonkor")" contains an unsupported key `GripType`
361. "[Kuva Twin Stubbas](/w/Kuva_Twin_Stubbas "Kuva Twin Stubbas")" contains an unsupported key `GripType`
362. "[Kuva Zarr](/w/Kuva_Zarr "Kuva Zarr")" contains an unsupported key `GripType`
363. "[Lacera](/w/Lacera "Lacera")" contains an unsupported key `GripType`
364. "[Laetum](/w/Laetum "Laetum")" contains an unsupported key `IncarnonChargeGain`
365. "[Laetum](/w/Laetum "Laetum")" contains an unsupported key `GripType`
366. "[Landslide Fists](/w/Landslide_Fists "Landslide Fists")" contains an unsupported key `GripType`
367. "[Landslide Fists Prime](/w/Landslide_Fists_Prime "Landslide Fists Prime")" contains an unsupported key `GripType`
368. "[Lanka](/w/Lanka "Lanka")" contains an unsupported key `GripType`
369. "[Larkspur](/w/Larkspur "Larkspur")" contains an unsupported key `GripType`
370. "[Larkspur (Atmosphere)](/w/Larkspur_(Atmosphere)?action=edit&redlink=1 "Larkspur (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
371. "[Larkspur Prime](/w/Larkspur_Prime "Larkspur Prime")" contains an unsupported key `GripType`
372. "[Larkspur Prime (Atmosphere)](/w/Larkspur_Prime_(Atmosphere)?action=edit&redlink=1 "Larkspur Prime (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
373. "[Lato](/w/Lato "Lato")" contains an unsupported key `IncarnonChargeGain`
374. "[Lato](/w/Lato "Lato")" contains an unsupported key `GripType`
375. "[Lato Prime](/w/Lato_Prime "Lato Prime")" contains an unsupported key `IncarnonChargeGain`
376. "[Lato Prime](/w/Lato_Prime "Lato Prime")" contains an unsupported key `GripType`
377. "[Lato Vandal](/w/Lato_Vandal "Lato Vandal")" contains an unsupported key `IncarnonChargeGain`
378. "[Lato Vandal](/w/Lato_Vandal "Lato Vandal")" contains an unsupported key `GripType`
379. "[Latron](/w/Latron "Latron")" contains an unsupported key `IncarnonChargeGain`
380. "[Latron](/w/Latron "Latron")" contains an unsupported key `GripType`
381. "[Latron Prime](/w/Latron_Prime "Latron Prime")" contains an unsupported key `IncarnonChargeGain`
382. "[Latron Prime](/w/Latron_Prime "Latron Prime")" contains an unsupported key `GripType`
383. "[Latron Wraith](/w/Latron_Wraith "Latron Wraith")" contains an unsupported key `IncarnonChargeGain`
384. "[Latron Wraith](/w/Latron_Wraith "Latron Wraith")" contains an unsupported key `GripType`
385. "[Lecta](/w/Lecta "Lecta")" contains an unsupported key `GripType`
386. "[Lenz](/w/Lenz "Lenz")" contains an unsupported key `GripType`
387. "[Lesion](/w/Lesion "Lesion")" contains an unsupported key `GripType`
388. "[Lex](/w/Lex "Lex")" contains an unsupported key `IncarnonChargeGain`
389. "[Lex](/w/Lex "Lex")" contains an unsupported key `GripType`
390. "[Lex Prime](/w/Lex_Prime "Lex Prime")" contains an unsupported key `IncarnonChargeGain`
391. "[Lex Prime](/w/Lex_Prime "Lex Prime")" contains an unsupported key `GripType`
392. "[Lizzie](/w/Lizzie "Lizzie")" contains an unsupported key `GripType`
393. "[Machete](/w/Machete "Machete")" contains an unsupported key `GripType`
394. "[Machete Wraith](/w/Machete_Wraith "Machete Wraith")" contains an unsupported key `GripType`
395. "[Magistar](/w/Magistar "Magistar")" contains an unsupported key `GripType`
396. "[Magistar](/w/Magistar "Magistar")" contains an unsupported key `IncarnonDuration`
397. "[Magnus](/w/Magnus "Magnus")" contains an unsupported key `GripType`
398. "[Magnus Prime](/w/Magnus_Prime "Magnus Prime")" contains an unsupported key `GripType`
399. "[Mandonel](/w/Mandonel "Mandonel")" contains an unsupported key `GripType`
400. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
401. "[Mara Detron](/w/Mara_Detron "Mara Detron")" contains an unsupported key `GripType`
402. "[Marelok](/w/Marelok "Marelok")" contains an unsupported key `GripType`
403. "[Masseter](/w/Masseter "Masseter")" contains an unsupported key `GripType`
404. "[Masseter Prime](/w/Masseter_Prime "Masseter Prime")" contains an unsupported key `GripType`
405. "[Mausolon](/w/Mausolon "Mausolon")" contains an unsupported key `GripType`
406. "[Mausolon (Atmosphere)](/w/Mausolon_(Atmosphere)?action=edit&redlink=1 "Mausolon (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
407. "[Mios](/w/Mios "Mios")" contains an unsupported key `GripType`
408. "[Mire](/w/Mire "Mire")" contains an unsupported key `GripType`
409. "[Miter](/w/Miter "Miter")" contains an unsupported key `IncarnonChargeGain`
410. "[Miter](/w/Miter "Miter")" contains an unsupported key `GripType`
411. "[Mk1-Bo](/w/Mk1-Bo "Mk1-Bo")" contains an unsupported key `GripType`
412. "[Mk1-Bo](/w/Mk1-Bo "Mk1-Bo")" contains an unsupported key `IncarnonDuration`
413. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" contains an unsupported key `IncarnonChargeGain`
414. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" contains an unsupported key `GripType`
415. "[Mk1-Furax](/w/Mk1-Furax "Mk1-Furax")" contains an unsupported key `GripType`
416. "[Mk1-Furax](/w/Mk1-Furax "Mk1-Furax")" contains an unsupported key `IncarnonDuration`
417. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" contains an unsupported key `IncarnonChargeGain`
418. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" contains an unsupported key `GripType`
419. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" contains an unsupported key `IncarnonChargeGain`
420. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" contains an unsupported key `GripType`
421. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" contains an unsupported key `IncarnonChargeGain`
422. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" contains an unsupported key `GripType`
423. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" contains an unsupported key `IncarnonChargeGain`
424. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" contains an unsupported key `GripType`
425. "[Morgha](/w/Morgha "Morgha")" contains an unsupported key `GripType`
426. "[Morgha (Atmosphere)](/w/Morgha_(Atmosphere)?action=edit&redlink=1 "Morgha (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
427. "[Mutalist Cernos](/w/Mutalist_Cernos "Mutalist Cernos")" contains an unsupported key `GripType`
428. "[Mutalist Quanta](/w/Mutalist_Quanta "Mutalist Quanta")" contains an unsupported key `GripType`
429. "[Nagantaka](/w/Nagantaka "Nagantaka")" contains an unsupported key `GripType`
430. "[Nagantaka Prime](/w/Nagantaka_Prime "Nagantaka Prime")" contains an unsupported key `GripType`
431. "[Nami Skyla](/w/Nami_Skyla "Nami Skyla")" contains an unsupported key `GripType`
432. "[Nami Skyla Prime](/w/Nami_Skyla_Prime "Nami Skyla Prime")" contains an unsupported key `GripType`
433. "[Nami Solo](/w/Nami_Solo "Nami Solo")" contains an unsupported key `GripType`
434. "[Nami Solo](/w/Nami_Solo "Nami Solo")" contains an unsupported key `IncarnonDuration`
435. "[Nataruk](/w/Nataruk "Nataruk")" contains an unsupported key `GripType`
436. "[Nepheri](/w/Nepheri "Nepheri")" contains an unsupported key `GripType`
437. "[Neutralizer](/w/Neutralizer "Neutralizer")" contains an unsupported key `GripType`
438. "[Nikana](/w/Nikana "Nikana")" contains an unsupported key `GripType`
439. "[Nikana Prime](/w/Nikana_Prime "Nikana Prime")" contains an unsupported key `GripType`
440. "[Ninkondi](/w/Ninkondi "Ninkondi")" contains an unsupported key `GripType`
441. "[Ninkondi Prime](/w/Ninkondi_Prime "Ninkondi Prime")" contains an unsupported key `GripType`
442. "[Noctua](/w/Noctua "Noctua")" contains an unsupported key `GripType`
443. "[Nukor](/w/Nukor "Nukor")" contains an unsupported key `GripType`
444. "[Obex](/w/Obex "Obex")" contains an unsupported key `GripType`
445. "[Obex](/w/Obex "Obex")" contains an unsupported key `IncarnonDuration`
446. "[Ocucor](/w/Ocucor "Ocucor")" contains an unsupported key `GripType`
447. "[Ogris](/w/Ogris "Ogris")" contains an unsupported key `GripType`
448. "[Ohma](/w/Ohma "Ohma")" contains an unsupported key `GripType`
449. "[Okina](/w/Okina "Okina")" contains an unsupported key `GripType`
450. "[Okina](/w/Okina "Okina")" contains an unsupported key `IncarnonDuration`
451. "[Okina Prime](/w/Okina_Prime "Okina Prime")" contains an unsupported key `GripType`
452. "[Okina Prime](/w/Okina_Prime "Okina Prime")" contains an unsupported key `IncarnonDuration`
453. "[Onorix](/w/Onorix "Onorix")" contains an unsupported key `GripType`
454. "[Onos](/w/Onos "Onos")" contains an unsupported key `IncarnonChargeGain`
455. "[Onos](/w/Onos "Onos")" contains an unsupported key `GripType`
456. "[Opticor](/w/Opticor "Opticor")" contains an unsupported key `GripType`
457. "[Opticor Vandal](/w/Opticor_Vandal "Opticor Vandal")" contains an unsupported key `GripType`
458. "[Orthos](/w/Orthos "Orthos")" contains an unsupported key `GripType`
459. "[Orthos Prime](/w/Orthos_Prime "Orthos Prime")" contains an unsupported key `GripType`
460. "[Orvius](/w/Orvius "Orvius")" contains an unsupported key `GripType`
461. "[Pandero](/w/Pandero "Pandero")" contains an unsupported key `GripType`
462. "[Pandero Prime](/w/Pandero_Prime "Pandero Prime")" contains an unsupported key `GripType`
463. "[Pangolin Prime](/w/Pangolin_Prime "Pangolin Prime")" contains an unsupported key `GripType`
464. "[Pangolin Sword](/w/Pangolin_Sword "Pangolin Sword")" contains an unsupported key `GripType`
465. "[Panthera](/w/Panthera "Panthera")" contains an unsupported key `GripType`
466. "[Panthera Prime](/w/Panthera_Prime "Panthera Prime")" contains an unsupported key `GripType`
467. "[Paracesis](/w/Paracesis "Paracesis")" contains an unsupported key `GripType`
468. "[Paracyst](/w/Paracyst "Paracyst")" contains an unsupported key `GripType`
469. "[Paris](/w/Paris "Paris")" contains an unsupported key `IncarnonChargeGain`
470. "[Paris](/w/Paris "Paris")" contains an unsupported key `GripType`
471. "[Paris Prime](/w/Paris_Prime "Paris Prime")" contains an unsupported key `IncarnonChargeGain`
472. "[Paris Prime](/w/Paris_Prime "Paris Prime")" contains an unsupported key `GripType`
473. "[Pathocyst](/w/Pathocyst "Pathocyst")" contains an unsupported key `GripType`
474. "[Pennant](/w/Pennant "Pennant")" contains an unsupported key `GripType`
475. "[Penta](/w/Penta "Penta")" contains an unsupported key `GripType`
476. "[Perigale](/w/Perigale "Perigale")" contains an unsupported key `GripType`
477. "[Perigale Prime](/w/Perigale_Prime "Perigale Prime")" contains an unsupported key `GripType`
478. "[Phaedra](/w/Phaedra "Phaedra")" contains an unsupported key `GripType`
479. "[Phaedra (Atmosphere)](/w/Phaedra_(Atmosphere)?action=edit&redlink=1 "Phaedra (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
480. "[Phage](/w/Phage "Phage")" contains an unsupported key `GripType`
481. "[Phantasma](/w/Phantasma "Phantasma")" contains an unsupported key `GripType`
482. "[Phantasma Prime](/w/Phantasma_Prime "Phantasma Prime")" contains an unsupported key `GripType`
483. "[Phenmor](/w/Phenmor "Phenmor")" contains an unsupported key `IncarnonChargeGain`
484. "[Phenmor](/w/Phenmor "Phenmor")" contains an unsupported key `GripType`
485. "[Plasma Sword](/w/Plasma_Sword "Plasma Sword")" contains an unsupported key `GripType`
486. "[Plinx](/w/Plinx "Plinx")" contains an unsupported key `GripType`
487. "[Pox](/w/Pox "Pox")" contains an unsupported key `GripType`
488. "[Praedos](/w/Praedos "Praedos")" contains an unsupported key `GripType`
489. "[Pride](/w/Pride "Pride")" contains an unsupported key `GripType`
490. "[Prisma Angstrum](/w/Prisma_Angstrum "Prisma Angstrum")" contains an unsupported key `IncarnonChargeGain`
491. "[Prisma Angstrum](/w/Prisma_Angstrum "Prisma Angstrum")" contains an unsupported key `GripType`
492. "[Prisma Dual Cleavers](/w/Prisma_Dual_Cleavers "Prisma Dual Cleavers")" contains an unsupported key `GripType`
493. "[Prisma Dual Decurions](/w/Prisma_Dual_Decurions "Prisma Dual Decurions")" contains an unsupported key `GripType`
494. "[Prisma Dual Decurions (Atmosphere)](/w/Prisma_Dual_Decurions_(Atmosphere)?action=edit&redlink=1 "Prisma Dual Decurions (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
495. "[Prisma Gorgon](/w/Prisma_Gorgon "Prisma Gorgon")" contains an unsupported key `IncarnonChargeGain`
496. "[Prisma Gorgon](/w/Prisma_Gorgon "Prisma Gorgon")" contains an unsupported key `GripType`
497. "[Prisma Grakata](/w/Prisma_Grakata "Prisma Grakata")" contains an unsupported key `GripType`
498. "[Prisma Grinlok](/w/Prisma_Grinlok "Prisma Grinlok")" contains an unsupported key `GripType`
499. "[Prisma Lenz](/w/Prisma_Lenz "Prisma Lenz")" contains an unsupported key `GripType`
500. "[Prisma Machete](/w/Prisma_Machete "Prisma Machete")" contains an unsupported key `GripType`
501. "[Prisma Obex](/w/Prisma_Obex "Prisma Obex")" contains an unsupported key `GripType`
502. "[Prisma Obex](/w/Prisma_Obex "Prisma Obex")" contains an unsupported key `IncarnonDuration`
503. "[Prisma Ohma](/w/Prisma_Ohma "Prisma Ohma")" contains an unsupported key `GripType`
504. "[Prisma Skana](/w/Prisma_Skana "Prisma Skana")" contains an unsupported key `GripType`
505. "[Prisma Skana](/w/Prisma_Skana "Prisma Skana")" contains an unsupported key `IncarnonDuration`
506. "[Prisma Tetra](/w/Prisma_Tetra "Prisma Tetra")" contains an unsupported key `GripType`
507. "[Prisma Twin Gremlins](/w/Prisma_Twin_Gremlins "Prisma Twin Gremlins")" contains an unsupported key `GripType`
508. "[Prisma Veritux](/w/Prisma_Veritux "Prisma Veritux")" contains an unsupported key `GripType`
509. "[Proboscis Cernos](/w/Proboscis_Cernos "Proboscis Cernos")" contains an unsupported key `GripType`
510. "[Prova](/w/Prova "Prova")" contains an unsupported key `GripType`
511. "[Prova Vandal](/w/Prova_Vandal "Prova Vandal")" contains an unsupported key `GripType`
512. "[Pulmonars](/w/Pulmonars "Pulmonars")" contains an unsupported key `GripType`
513. "[Pupacyst](/w/Pupacyst "Pupacyst")" contains an unsupported key `GripType`
514. "[Purgator 1](/w/Purgator_1 "Purgator 1")" contains an unsupported key `GripType`
515. "[Pyrana](/w/Pyrana "Pyrana")" contains an unsupported key `GripType`
516. "[Pyrana Prime](/w/Pyrana_Prime "Pyrana Prime")" contains an unsupported key `GripType`
517. "[Quanta](/w/Quanta "Quanta")" contains an unsupported key `GripType`
518. "[Quanta Vandal](/w/Quanta_Vandal "Quanta Vandal")" contains an unsupported key `GripType`
519. "[Quartakk](/w/Quartakk "Quartakk")" contains an unsupported key `GripType`
520. "[Quassus](/w/Quassus "Quassus")" contains an unsupported key `GripType`
521. "[Quassus Prime](/w/Quassus_Prime "Quassus Prime")" contains an unsupported key `GripType`
522. "[Quatz](/w/Quatz "Quatz")" contains an unsupported key `GripType`
523. "[Quellor](/w/Quellor "Quellor")" contains an unsupported key `GripType`
524. "[Rakta Ballistica](/w/Rakta_Ballistica "Rakta Ballistica")" contains an unsupported key `IncarnonChargeGain`
525. "[Rakta Ballistica](/w/Rakta_Ballistica "Rakta Ballistica")" contains an unsupported key `GripType`
526. "[Rakta Cernos](/w/Rakta_Cernos "Rakta Cernos")" contains an unsupported key `GripType`
527. "[Rakta Dark Dagger](/w/Rakta_Dark_Dagger "Rakta Dark Dagger")" contains an unsupported key `GripType`
528. "[Rathbone](/w/Rathbone "Rathbone")" contains an unsupported key `GripType`
529. "[Rauta](/w/Rauta "Rauta")" contains an unsupported key `GripType`
530. "[Reaper Prime](/w/Reaper_Prime "Reaper Prime")" contains an unsupported key `GripType`
531. "[Reconifex](/w/Reconifex "Reconifex")" contains an unsupported key `GripType`
532. "[Redeemer](/w/Redeemer "Redeemer")" contains an unsupported key `GripType`
533. "[Redeemer Prime](/w/Redeemer_Prime "Redeemer Prime")" contains an unsupported key `GripType`
534. "[Regulators](/w/Regulators "Regulators")" contains an unsupported key `GripType`
535. "[Regulators Prime](/w/Regulators_Prime "Regulators Prime")" contains an unsupported key `GripType`
536. "[Riot-848](/w/Riot-848 "Riot-848")" contains an unsupported key `GripType`
537. "[Ripkas](/w/Ripkas "Ripkas")" contains an unsupported key `GripType`
538. "[Rubico](/w/Rubico "Rubico")" contains an unsupported key `GripType`
539. "[Rubico Prime](/w/Rubico_Prime "Rubico Prime")" contains an unsupported key `GripType`
540. "[Rumblejack](/w/Rumblejack "Rumblejack")" contains an unsupported key `GripType`
541. "[Ruvox](/w/Ruvox "Ruvox")" contains an unsupported key `GripType`
542. "[Sampotes](/w/Sampotes "Sampotes")" contains an unsupported key `GripType`
543. "[Sancti Castanas](/w/Sancti_Castanas "Sancti Castanas")" contains an unsupported key `GripType`
544. "[Sancti Magistar](/w/Sancti_Magistar "Sancti Magistar")" contains an unsupported key `GripType`
545. "[Sancti Magistar](/w/Sancti_Magistar "Sancti Magistar")" contains an unsupported key `IncarnonDuration`
546. "[Sancti Tigris](/w/Sancti_Tigris "Sancti Tigris")" contains an unsupported key `GripType`
547. "[Sarofang](/w/Sarofang "Sarofang")" contains an unsupported key `GripType`
548. "[Sarofang Prime](/w/Sarofang_Prime "Sarofang Prime")" contains an unsupported key `GripType`
549. "[Sarpa](/w/Sarpa "Sarpa")" contains an unsupported key `GripType`
550. "[Scindo](/w/Scindo "Scindo")" contains an unsupported key `GripType`
551. "[Scindo Prime](/w/Scindo_Prime "Scindo Prime")" contains an unsupported key `GripType`
552. "[Scoliac](/w/Scoliac "Scoliac")" contains an unsupported key `GripType`
553. "[Scourge](/w/Scourge "Scourge")" contains an unsupported key `GripType`
554. "[Scourge Prime](/w/Scourge_Prime "Scourge Prime")" contains an unsupported key `GripType`
555. "[Scyotid](/w/Scyotid "Scyotid")" contains an unsupported key `GripType`
556. "[Secura Dual Cestra](/w/Secura_Dual_Cestra "Secura Dual Cestra")" contains an unsupported key `GripType`
557. "[Secura Lecta](/w/Secura_Lecta "Secura Lecta")" contains an unsupported key `GripType`
558. "[Secura Penta](/w/Secura_Penta "Secura Penta")" contains an unsupported key `GripType`
559. "[Seer](/w/Seer "Seer")" contains an unsupported key `GripType`
560. "[Sepulcrum](/w/Sepulcrum "Sepulcrum")" contains an unsupported key `GripType`
561. "[Serro](/w/Serro "Serro")" contains an unsupported key `GripType`
562. "[Shadow Claws](/w/Shadow_Claws "Shadow Claws")" contains an unsupported key `GripType`
563. "[Shadow Claws Prime](/w/Shadow_Claws_Prime?action=edit&redlink=1 "Shadow Claws Prime (page does not exist)")" contains an unsupported key `GripType`
564. "[Shadow Clones](/w/Shadow_Clones "Shadow Clones")" contains an unsupported key `GripType`
565. "[Shadow Clones Prime](/w/Shadow_Clones_Prime?action=edit&redlink=1 "Shadow Clones Prime (page does not exist)")" contains an unsupported key `GripType`
566. "[Shaku](/w/Shaku "Shaku")" contains an unsupported key `GripType`
567. "[Shattered Lash](/w/Shattered_Lash "Shattered Lash")" contains an unsupported key `GripType`
568. "[Shattered Lash Prime](/w/Shattered_Lash_Prime?action=edit&redlink=1 "Shattered Lash Prime (page does not exist)")" contains an unsupported key `GripType`
569. "[Shedu](/w/Shedu "Shedu")" contains an unsupported key `GripType`
570. "[Sheev](/w/Sheev "Sheev")" contains an unsupported key `GripType`
571. "[Sibear](/w/Sibear "Sibear")" contains an unsupported key `GripType`
572. "[Sibear](/w/Sibear "Sibear")" contains an unsupported key `IncarnonDuration`
573. "[Sicarus](/w/Sicarus "Sicarus")" contains an unsupported key `IncarnonChargeGain`
574. "[Sicarus](/w/Sicarus "Sicarus")" contains an unsupported key `GripType`
575. "[Sicarus Prime](/w/Sicarus_Prime "Sicarus Prime")" contains an unsupported key `IncarnonChargeGain`
576. "[Sicarus Prime](/w/Sicarus_Prime "Sicarus Prime")" contains an unsupported key `GripType`
577. "[Sigma & Octantis](/w/Sigma_%26_Octantis "Sigma & Octantis")" contains an unsupported key `GripType`
578. "[Silva & Aegis](/w/Silva_%26_Aegis "Silva & Aegis")" contains an unsupported key `GripType`
579. "[Silva & Aegis Prime](/w/Silva_%26_Aegis_Prime "Silva & Aegis Prime")" contains an unsupported key `GripType`
580. "[Simulor](/w/Simulor "Simulor")" contains an unsupported key `GripType`
581. "[Skana](/w/Skana "Skana")" contains an unsupported key `GripType`
582. "[Skana](/w/Skana "Skana")" contains an unsupported key `IncarnonDuration`
583. "[Skana Prime](/w/Skana_Prime "Skana Prime")" contains an unsupported key `GripType`
584. "[Skana Prime](/w/Skana_Prime "Skana Prime")" contains an unsupported key `IncarnonDuration`
585. "[Skiajati](/w/Skiajati "Skiajati")" contains an unsupported key `GripType`
586. "[Slaytra](/w/Slaytra "Slaytra")" contains an unsupported key `GripType`
587. "[Snipetron](/w/Snipetron "Snipetron")" contains an unsupported key `GripType`
588. "[Snipetron Vandal](/w/Snipetron_Vandal "Snipetron Vandal")" contains an unsupported key `GripType`
589. "[Sobek](/w/Sobek "Sobek")" contains an unsupported key `GripType`
590. "[Soma](/w/Soma "Soma")" contains an unsupported key `IncarnonChargeGain`
591. "[Soma](/w/Soma "Soma")" contains an unsupported key `GripType`
592. "[Soma Prime](/w/Soma_Prime "Soma Prime")" contains an unsupported key `IncarnonChargeGain`
593. "[Soma Prime](/w/Soma_Prime "Soma Prime")" contains an unsupported key `GripType`
594. "[Sonicor](/w/Sonicor "Sonicor")" contains an unsupported key `GripType`
595. "[Spectra](/w/Spectra "Spectra")" contains an unsupported key `GripType`
596. "[Spectra Vandal](/w/Spectra_Vandal "Spectra Vandal")" contains an unsupported key `GripType`
597. "[Spinnerex](/w/Spinnerex "Spinnerex")" contains an unsupported key `GripType`
598. "[Spira](/w/Spira "Spira")" contains an unsupported key `GripType`
599. "[Spira Prime](/w/Spira_Prime "Spira Prime")" contains an unsupported key `GripType`
600. "[Sporothrix](/w/Sporothrix "Sporothrix")" contains an unsupported key `GripType`
601. "[Stahlta](/w/Stahlta "Stahlta")" contains an unsupported key `GripType`
602. "[Staticor](/w/Staticor "Staticor")" contains an unsupported key `GripType`
603. "[Steflos](/w/Steflos "Steflos")" contains an unsupported key `GripType`
604. "[Stradavar](/w/Stradavar "Stradavar")" contains an unsupported key `GripType`
605. "[Stradavar Prime](/w/Stradavar_Prime "Stradavar Prime")" contains an unsupported key `GripType`
606. "[Stropha](/w/Stropha "Stropha")" contains an unsupported key `GripType`
607. "[Strun](/w/Strun "Strun")" contains an unsupported key `IncarnonChargeGain`
608. "[Strun](/w/Strun "Strun")" contains an unsupported key `GripType`
609. "[Strun Prime](/w/Strun_Prime "Strun Prime")" contains an unsupported key `IncarnonChargeGain`
610. "[Strun Prime](/w/Strun_Prime "Strun Prime")" contains an unsupported key `GripType`
611. "[Strun Wraith](/w/Strun_Wraith "Strun Wraith")" contains an unsupported key `IncarnonChargeGain`
612. "[Strun Wraith](/w/Strun_Wraith "Strun Wraith")" contains an unsupported key `GripType`
613. "[Stubba](/w/Stubba "Stubba")" contains an unsupported key `GripType`
614. "[Stug](/w/Stug "Stug")" contains an unsupported key `GripType`
615. "[Sun & Moon](/w/Sun_%26_Moon "Sun & Moon")" contains an unsupported key `GripType`
616. "[Supra](/w/Supra "Supra")" contains an unsupported key `GripType`
617. "[Supra Vandal](/w/Supra_Vandal "Supra Vandal")" contains an unsupported key `GripType`
618. "[Syam](/w/Syam "Syam")" contains an unsupported key `GripType`
619. "[Sybaris](/w/Sybaris "Sybaris")" contains an unsupported key `IncarnonChargeGain`
620. "[Sybaris](/w/Sybaris "Sybaris")" contains an unsupported key `GripType`
621. "[Sybaris Prime](/w/Sybaris_Prime "Sybaris Prime")" contains an unsupported key `IncarnonChargeGain`
622. "[Sybaris Prime](/w/Sybaris_Prime "Sybaris Prime")" contains an unsupported key `GripType`
623. "[Sydon](/w/Sydon "Sydon")" contains an unsupported key `GripType`
624. "[Synapse](/w/Synapse "Synapse")" contains an unsupported key `GripType`
625. "[Synoid Gammacor](/w/Synoid_Gammacor "Synoid Gammacor")" contains an unsupported key `IncarnonChargeGain`
626. "[Synoid Gammacor](/w/Synoid_Gammacor "Synoid Gammacor")" contains an unsupported key `GripType`
627. "[Synoid Heliocor](/w/Synoid_Heliocor "Synoid Heliocor")" contains an unsupported key `GripType`
628. "[Synoid Simulor](/w/Synoid_Simulor "Synoid Simulor")" contains an unsupported key `GripType`
629. "[Tak & Lug](/w/Tak_%26_Lug "Tak & Lug")" contains an unsupported key `GripType`
630. "[Talons](/w/Talons "Talons")" contains an unsupported key `GripType`
631. "[Tatsu](/w/Tatsu "Tatsu")" contains an unsupported key `GripType`
632. "[Tatsu Prime](/w/Tatsu_Prime "Tatsu Prime")" contains an unsupported key `GripType`
633. "[Tekko](/w/Tekko "Tekko")" contains an unsupported key `GripType`
634. "[Tekko Prime](/w/Tekko_Prime "Tekko Prime")" contains an unsupported key `GripType`
635. "[Telos Akbolto](/w/Telos_Akbolto "Telos Akbolto")" contains an unsupported key `GripType`
636. "[Telos Boltace](/w/Telos_Boltace "Telos Boltace")" contains an unsupported key `GripType`
637. "[Telos Boltor](/w/Telos_Boltor "Telos Boltor")" contains an unsupported key `IncarnonChargeGain`
638. "[Telos Boltor](/w/Telos_Boltor "Telos Boltor")" contains an unsupported key `GripType`
639. "[Tenet Agendus](/w/Tenet_Agendus "Tenet Agendus")" contains an unsupported key `GripType`
640. "[Tenet Arca Plasmor](/w/Tenet_Arca_Plasmor "Tenet Arca Plasmor")" contains an unsupported key `GripType`
641. "[Tenet Cycron](/w/Tenet_Cycron "Tenet Cycron")" contains an unsupported key `GripType`
642. "[Tenet Detron](/w/Tenet_Detron "Tenet Detron")" contains an unsupported key `GripType`
643. "[Tenet Diplos](/w/Tenet_Diplos "Tenet Diplos")" contains an unsupported key `GripType`
644. "[Tenet Envoy](/w/Tenet_Envoy "Tenet Envoy")" contains an unsupported key `GripType`
645. "[Tenet Exec](/w/Tenet_Exec "Tenet Exec")" contains an unsupported key `GripType`
646. "[Tenet Ferrox](/w/Tenet_Ferrox "Tenet Ferrox")" contains an unsupported key `GripType`
647. "[Tenet Flux Rifle](/w/Tenet_Flux_Rifle "Tenet Flux Rifle")" contains an unsupported key `GripType`
648. "[Tenet Glaxion](/w/Tenet_Glaxion "Tenet Glaxion")" contains an unsupported key `GripType`
649. "[Tenet Grigori](/w/Tenet_Grigori "Tenet Grigori")" contains an unsupported key `GripType`
650. "[Tenet Livia](/w/Tenet_Livia "Tenet Livia")" contains an unsupported key `GripType`
651. "[Tenet Plinx](/w/Tenet_Plinx "Tenet Plinx")" contains an unsupported key `GripType`
652. "[Tenet Quanta](/w/Tenet_Quanta "Tenet Quanta")" contains an unsupported key `GripType`
653. "[Tenet Spirex](/w/Tenet_Spirex "Tenet Spirex")" contains an unsupported key `GripType`
654. "[Tenet Tetra](/w/Tenet_Tetra "Tenet Tetra")" contains an unsupported key `GripType`
655. "[Tenora](/w/Tenora "Tenora")" contains an unsupported key `GripType`
656. "[Tenora Prime](/w/Tenora_Prime "Tenora Prime")" contains an unsupported key `GripType`
657. "[Tetra](/w/Tetra "Tetra")" contains an unsupported key `GripType`
658. "[Thalys](/w/Thalys "Thalys")" contains an unsupported key `GripType`
659. "[Thornbak](/w/Thornbak "Thornbak")" contains an unsupported key `GripType`
660. "[Tiberon](/w/Tiberon "Tiberon")" contains an unsupported key `GripType`
661. "[Tiberon Prime](/w/Tiberon_Prime "Tiberon Prime")" contains an unsupported key `GripType`
662. "[Tigris](/w/Tigris "Tigris")" contains an unsupported key `GripType`
663. "[Tigris Prime](/w/Tigris_Prime "Tigris Prime")" contains an unsupported key `GripType`
664. "[Tipedo](/w/Tipedo "Tipedo")" contains an unsupported key `GripType`
665. "[Tipedo Prime](/w/Tipedo_Prime "Tipedo Prime")" contains an unsupported key `GripType`
666. "[Tonbo](/w/Tonbo "Tonbo")" contains an unsupported key `GripType`
667. "[Tonkkatt](/w/Tonkkatt "Tonkkatt")" contains an unsupported key `GripType`
668. "[Tonkor](/w/Tonkor "Tonkor")" contains an unsupported key `GripType`
669. "[Torid](/w/Torid "Torid")" contains an unsupported key `IncarnonChargeGain`
670. "[Torid](/w/Torid "Torid")" contains an unsupported key `GripType`
671. "[Trumna](/w/Trumna "Trumna")" contains an unsupported key `GripType`
672. "[Trumna Prime](/w/Trumna_Prime "Trumna Prime")" contains an unsupported key `GripType`
673. "[Twin Basolk](/w/Twin_Basolk "Twin Basolk")" contains an unsupported key `GripType`
674. "[Twin Grakatas](/w/Twin_Grakatas "Twin Grakatas")" contains an unsupported key `GripType`
675. "[Twin Gremlins](/w/Twin_Gremlins "Twin Gremlins")" contains an unsupported key `GripType`
676. "[Twin Kohmak](/w/Twin_Kohmak "Twin Kohmak")" contains an unsupported key `GripType`
677. "[Twin Krohkur](/w/Twin_Krohkur "Twin Krohkur")" contains an unsupported key `GripType`
678. "[Twin Rogga](/w/Twin_Rogga "Twin Rogga")" contains an unsupported key `GripType`
679. "[Twin Vipers](/w/Twin_Vipers "Twin Vipers")" contains an unsupported key `GripType`
680. "[Twin Vipers Wraith](/w/Twin_Vipers_Wraith "Twin Vipers Wraith")" contains an unsupported key `GripType`
681. "[Tysis](/w/Tysis "Tysis")" contains an unsupported key `GripType`
682. "[Vadarya Prime](/w/Vadarya_Prime "Vadarya Prime")" contains an unsupported key `GripType`
683. "[Valkyr Prime Talons](/w/Valkyr_Prime_Talons "Valkyr Prime Talons")" contains an unsupported key `GripType`
684. "[Valkyr Talons](/w/Valkyr_Talons "Valkyr Talons")" contains an unsupported key `GripType`
685. "[Vastilok](/w/Vastilok "Vastilok")" contains an unsupported key `GripType`
686. "[Vasto](/w/Vasto "Vasto")" contains an unsupported key `IncarnonChargeGain`
687. "[Vasto](/w/Vasto "Vasto")" contains an unsupported key `GripType`
688. "[Vasto Prime](/w/Vasto_Prime "Vasto Prime")" contains an unsupported key `IncarnonChargeGain`
689. "[Vasto Prime](/w/Vasto_Prime "Vasto Prime")" contains an unsupported key `GripType`
690. "[Vaykor Hek](/w/Vaykor_Hek "Vaykor Hek")" contains an unsupported key `GripType`
691. "[Vaykor Marelok](/w/Vaykor_Marelok "Vaykor Marelok")" contains an unsupported key `GripType`
692. "[Vaykor Sydon](/w/Vaykor_Sydon "Vaykor Sydon")" contains an unsupported key `GripType`
693. "[Vectis](/w/Vectis "Vectis")" contains an unsupported key `IncarnonChargeGain`
694. "[Vectis](/w/Vectis "Vectis")" contains an unsupported key `GripType`
695. "[Vectis Prime](/w/Vectis_Prime "Vectis Prime")" contains an unsupported key `IncarnonChargeGain`
696. "[Vectis Prime](/w/Vectis_Prime "Vectis Prime")" contains an unsupported key `GripType`
697. "[Veldt](/w/Veldt "Veldt")" contains an unsupported key `GripType`
698. "[Velocitus](/w/Velocitus "Velocitus")" contains an unsupported key `GripType`
699. "[Velocitus (Atmosphere)](/w/Velocitus_(Atmosphere)?action=edit&redlink=1 "Velocitus (Atmosphere) (page does not exist)")" contains an unsupported key `GripType`
700. "[Velox](/w/Velox "Velox")" contains an unsupported key `GripType`
701. "[Velox Prime](/w/Velox_Prime "Velox Prime")" contains an unsupported key `GripType`
702. "[Venato](/w/Venato "Venato")" contains an unsupported key `GripType`
703. "[Venato Prime](/w/Venato_Prime "Venato Prime")" contains an unsupported key `GripType`
704. "[Venka](/w/Venka "Venka")" contains an unsupported key `GripType`
705. "[Venka Prime](/w/Venka_Prime "Venka Prime")" contains an unsupported key `GripType`
706. "[Verdilac](/w/Verdilac "Verdilac")" contains an unsupported key `GripType`
707. "[Vericres](/w/Vericres "Vericres")" contains an unsupported key `GripType`
708. "[Veritux](/w/Veritux "Veritux")" contains an unsupported key `GripType`
709. "[Vesper 77](/w/Vesper_77 "Vesper 77")" contains an unsupported key `GripType`
710. "[Vinquibus (Melee)](/w/Vinquibus_(Melee) "Vinquibus (Melee)")" contains an unsupported key `GripType`
711. "[Vinquibus (Primary)](/w/Vinquibus_(Primary) "Vinquibus (Primary)")" contains an unsupported key `GripType`
712. "[Viper](/w/Viper "Viper")" contains an unsupported key `GripType`
713. "[Viper Wraith](/w/Viper_Wraith "Viper Wraith")" contains an unsupported key `GripType`
714. "[Vitrica](/w/Vitrica "Vitrica")" contains an unsupported key `GripType`
715. "[Volnus](/w/Volnus "Volnus")" contains an unsupported key `GripType`
716. "[Volnus Prime](/w/Volnus_Prime "Volnus Prime")" contains an unsupported key `GripType`
717. "[Vulkar](/w/Vulkar "Vulkar")" contains an unsupported key `GripType`
718. "[Vulkar Wraith](/w/Vulkar_Wraith "Vulkar Wraith")" contains an unsupported key `GripType`
719. "[War](/w/War "War")" contains an unsupported key `GripType`
720. "[War Prime](/w/War_Prime "War Prime")" contains an unsupported key `GripType`
721. "[Whipclaw](/w/Whipclaw "Whipclaw")" contains an unsupported key `GripType`
722. "[Whipclaw Prime](/w/Whipclaw_Prime?action=edit&redlink=1 "Whipclaw Prime (page does not exist)")" contains an unsupported key `GripType`
723. "[Wolf Sledge](/w/Wolf_Sledge "Wolf Sledge")" contains an unsupported key `GripType`
724. "[Wrath](/w/Wrath "Wrath")" contains an unsupported key `GripType`
725. "[Xoris](/w/Xoris "Xoris")" contains an unsupported key `GripType`
726. "[Zakti](/w/Zakti "Zakti")" contains an unsupported key `GripType`
727. "[Zakti Prime](/w/Zakti_Prime "Zakti Prime")" contains an unsupported key `GripType`
728. "[Zarr](/w/Zarr "Zarr")" contains an unsupported key `GripType`
729. "[Zenistar](/w/Zenistar "Zenistar")" contains an unsupported key `GripType`
730. "[Zenith](/w/Zenith "Zenith")" contains an unsupported key `GripType`
731. "[Zhuge](/w/Zhuge "Zhuge")" contains an unsupported key `GripType`
732. "[Zhuge Prime](/w/Zhuge_Prime "Zhuge Prime")" contains an unsupported key `GripType`
733. "[Zylok](/w/Zylok "Zylok")" contains an unsupported key `IncarnonChargeGain`
734. "[Zylok](/w/Zylok "Zylok")" contains an unsupported key `GripType`
735. "[Zylok Prime](/w/Zylok_Prime "Zylok Prime")" contains an unsupported key `IncarnonChargeGain`
736. "[Zylok Prime](/w/Zylok_Prime "Zylok Prime")" contains an unsupported key `GripType`
737. "[Zymos](/w/Zymos "Zymos")" contains an unsupported key `GripType`

### Checking missing keys

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-13 "Edit section's source code: Checking missing keys")]

**p.checkForMissingData(frame): There are a total of 0 key-value errors**

### Validate `Attack` tables

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-14 "Edit section's source code: Validate Attack tables")]

**p.validateAttacks(frame): There are a total of 0 key-value errors**

### Validate required weapon table keys

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-15 "Edit section's source code: Validate required weapon table keys")]

**p.validateRequiredKeys(frame): There are a total of 443 key-value errors**

1. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
2. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
3. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
4. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Magazine must be a value above 0
5. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Missing reload time or reload time has to be above 0
6. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Missing trigger type of weapon
7. "[Amanata](/w/Amanata "Amanata")" Heavy attack must be greater than 0
8. "[Apoc](/w/Apoc "Apoc")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
9. "[Apoc Mk I](/w/Apoc_Mk_I "Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
10. "[Apoc Mk II](/w/Apoc_Mk_II "Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
11. "[Apoc Mk III](/w/Apoc_Mk_III "Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
12. "[Arbucep (Atmosphere)](/w/Arbucep_(Atmosphere)?action=edit&redlink=1 "Arbucep (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Arbucep.png
13. "[Artax](/w/Artax "Artax")" AmmoPickup must be a value greater than or equal to 0
14. "[Burst Laser](/w/Burst_Laser "Burst Laser")" AmmoPickup must be a value greater than or equal to 0
15. "[Burst Laser Prime](/w/Burst_Laser_Prime "Burst Laser Prime")" AmmoPickup must be a value greater than or equal to 0
16. "[Cantic Prism](/w/Cantic_Prism "Cantic Prism")" AmmoPickup must be a value greater than or equal to 0
17. "[Carcinnox](/w/Carcinnox "Carcinnox")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
18. "[Carcinnox Mk I](/w/Carcinnox_Mk_I "Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
19. "[Carcinnox Mk II](/w/Carcinnox_Mk_II "Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
20. "[Carcinnox Mk III](/w/Carcinnox_Mk_III "Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
21. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
22. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Magazine must be a value above 0
23. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Missing reload time or reload time has to be above 0
24. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
25. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Magazine must be a value above 0
26. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Missing reload time or reload time has to be above 0
27. "[Cerata](/w/Cerata "Cerata")" Heavy attack must be greater than 0
28. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
29. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
30. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
31. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Magazine must be a value above 0
32. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
33. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing trigger type of weapon
34. "[Coda Pathocyst](/w/Coda_Pathocyst "Coda Pathocyst")" Heavy attack must be greater than 0
35. "[Cortege](/w/Cortege "Cortege")" AmmoPickup must be a value greater than or equal to 0
36. "[Cortege (Atmosphere)](/w/Cortege_(Atmosphere)?action=edit&redlink=1 "Cortege (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cortege.png
37. "[Corvas](/w/Corvas "Corvas")" AmmoPickup must be a value greater than or equal to 0
38. "[Corvas (Atmosphere)](/w/Corvas_(Atmosphere)?action=edit&redlink=1 "Corvas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Corvas.png
39. "[Corvas Prime](/w/Corvas_Prime "Corvas Prime")" AmmoPickup must be a value greater than or equal to 0
40. "[Corvas Prime (Atmosphere)](/w/Corvas_Prime_(Atmosphere)?action=edit&redlink=1 "Corvas Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: CorvasPrime.png
41. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
42. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
43. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
44. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Magazine must be a value above 0
45. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing reload time or reload time has to be above 0
46. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing trigger type of weapon
47. "[Cryophon](/w/Cryophon "Cryophon")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
48. "[Cryophon Mk I](/w/Cryophon_Mk_I "Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
49. "[Cryophon Mk II](/w/Cryophon_Mk_II "Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
50. "[Cryophon Mk III](/w/Cryophon_Mk_III "Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
51. "[Cryotra](/w/Cryotra "Cryotra")" AmmoPickup must be a value greater than or equal to 0
52. "[Cyngas](/w/Cyngas "Cyngas")" AmmoPickup must be a value greater than or equal to 0
53. "[Cyngas (Atmosphere)](/w/Cyngas_(Atmosphere)?action=edit&redlink=1 "Cyngas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cyngas.png
54. "[Dargyn](/w/Dargyn "Dargyn")" AmmoPickup must be a value greater than or equal to 0
55. "[Dargyn](/w/Dargyn "Dargyn")" Disposition must be between 0.5-1.55; default should be 0.5
56. "[Dargyn](/w/Dargyn "Dargyn")" Image should be in the form of "WeaponName.png"; current value: GrnSkiffMissile.png
57. "[Dargyn](/w/Dargyn "Dargyn")" Missing InternalName
58. "[Dargyn](/w/Dargyn "Dargyn")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
59. "[Deconstructor](/w/Deconstructor "Deconstructor")" AmmoPickup must be a value greater than or equal to 0
60. "[Deconstructor Prime](/w/Deconstructor_Prime "Deconstructor Prime")" AmmoPickup must be a value greater than or equal to 0
61. "[Deth Machine Rifle](/w/Deth_Machine_Rifle "Deth Machine Rifle")" AmmoPickup must be a value greater than or equal to 0
62. "[Deth Machine Rifle Prime](/w/Deth_Machine_Rifle_Prime "Deth Machine Rifle Prime")" AmmoPickup must be a value greater than or equal to 0
63. "[Dissic Scaffold](/w/Dissic_Scaffold "Dissic Scaffold")" AmmoPickup must be a value greater than or equal to 0
64. "[Dual Decurion](/w/Dual_Decurion "Dual Decurion")" AmmoPickup must be a value greater than or equal to 0
65. "[Dual Decurion (Atmosphere)](/w/Dual_Decurion_(Atmosphere)?action=edit&redlink=1 "Dual Decurion (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: DualDecurion.png
66. "[Exard Scaffold](/w/Exard_Scaffold "Exard Scaffold")" AmmoPickup must be a value greater than or equal to 0
67. "[Falcor](/w/Falcor "Falcor")" Heavy attack must be greater than 0
68. "[Fluctus](/w/Fluctus "Fluctus")" AmmoPickup must be a value greater than or equal to 0
69. "[Fluctus (Atmosphere)](/w/Fluctus_(Atmosphere)?action=edit&redlink=1 "Fluctus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Fluctus.png
70. "[Galvarc](/w/Galvarc "Galvarc")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
71. "[Galvarc Mk I](/w/Galvarc_Mk_I "Galvarc Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
72. "[Galvarc Mk II](/w/Galvarc_Mk_II "Galvarc Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
73. "[Galvarc Mk III](/w/Galvarc_Mk_III "Galvarc Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
74. "[Garuda Prime Talons](/w/Garuda_Prime_Talons "Garuda Prime Talons")" Disposition must be between 0.5-1.55; default should be 0.5
75. "[Garuda Talons](/w/Garuda_Talons "Garuda Talons")" Disposition must be between 0.5-1.55; default should be 0.5
76. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
77. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Magazine must be a value above 0
78. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Missing reload time or reload time has to be above 0
79. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
80. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Magazine must be a value above 0
81. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Missing reload time or reload time has to be above 0
82. "[Glaive](/w/Glaive "Glaive")" Heavy attack must be greater than 0
83. "[Glaive Prime](/w/Glaive_Prime "Glaive Prime")" Heavy attack must be greater than 0
84. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
85. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
86. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
87. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" AmmoPickup must be a value greater than or equal to 0
88. "[Grattler](/w/Grattler "Grattler")" AmmoPickup must be a value greater than or equal to 0
89. "[Grattler (Atmosphere)](/w/Grattler_(Atmosphere)?action=edit&redlink=1 "Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Grattler.png
90. "[Grimoire](/w/Grimoire "Grimoire")" Magazine must be a value above 0
91. "[Grimoire](/w/Grimoire "Grimoire")" Missing reload time or reload time has to be above 0
92. "[Halikar](/w/Halikar "Halikar")" Heavy attack must be greater than 0
93. "[Halikar Wraith](/w/Halikar_Wraith "Halikar Wraith")" Heavy attack must be greater than 0
94. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoMax must be a value greater than or equal to 0
95. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoPickup must be a value greater than or equal to 0
96. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Magazine must be a value above 0
97. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing reload time or reload time has to be above 0
98. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing trigger type of weapon
99. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoMax must be a value greater than or equal to 0
100. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoPickup must be a value greater than or equal to 0
101. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
102. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Magazine must be a value above 0
103. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing reload time or reload time has to be above 0
104. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing trigger type of weapon
105. "[Helstrum](/w/Helstrum "Helstrum")" AmmoPickup must be a value greater than or equal to 0
106. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
107. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
108. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
109. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Magazine must be a value above 0
110. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing reload time or reload time has to be above 0
111. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing trigger type of weapon
112. "[Imperator](/w/Imperator "Imperator")" AmmoPickup must be a value greater than or equal to 0
113. "[Imperator (Atmosphere)](/w/Imperator_(Atmosphere)?action=edit&redlink=1 "Imperator (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Imperator.png
114. "[Imperator Vandal](/w/Imperator_Vandal "Imperator Vandal")" AmmoPickup must be a value greater than or equal to 0
115. "[Imperator Vandal (Atmosphere)](/w/Imperator_Vandal_(Atmosphere)?action=edit&redlink=1 "Imperator Vandal (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: ImperatorVandal.png
116. "[Kestrel](/w/Kestrel "Kestrel")" Heavy attack must be greater than 0
117. "[Kestrel Prime](/w/Kestrel_Prime "Kestrel Prime")" Heavy attack must be greater than 0
118. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" AmmoPickup must be a value greater than or equal to 0
119. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" AmmoPickup must be a value greater than or equal to 0
120. "[Kuva Ayanga](/w/Kuva_Ayanga "Kuva Ayanga")" AmmoPickup must be a value greater than or equal to 0
121. "[Kuva Ayanga (Atmosphere)](/w/Kuva_Ayanga_(Atmosphere)?action=edit&redlink=1 "Kuva Ayanga (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaAyanga.png
122. "[Kuva Grattler](/w/Kuva_Grattler "Kuva Grattler")" AmmoPickup must be a value greater than or equal to 0
123. "[Kuva Grattler (Atmosphere)](/w/Kuva_Grattler_(Atmosphere)?action=edit&redlink=1 "Kuva Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaGrattler.png
124. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
125. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
126. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
127. "[Larkspur](/w/Larkspur "Larkspur")" AmmoPickup must be a value greater than or equal to 0
128. "[Larkspur (Atmosphere)](/w/Larkspur_(Atmosphere)?action=edit&redlink=1 "Larkspur (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Larkspur.png
129. "[Larkspur Prime](/w/Larkspur_Prime "Larkspur Prime")" AmmoPickup must be a value greater than or equal to 0
130. "[Larkspur Prime (Atmosphere)](/w/Larkspur_Prime_(Atmosphere)?action=edit&redlink=1 "Larkspur Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: LarkspurPrime.png
131. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
132. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
133. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
134. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
135. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
136. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
137. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
138. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
139. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
140. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
141. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
142. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
143. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
144. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
145. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
146. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
147. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
148. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
149. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
150. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
151. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
152. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
153. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
154. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
155. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
156. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
157. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
158. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
159. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
160. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
161. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
162. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
163. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
164. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
165. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
166. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
167. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
168. "[Lega Prism](/w/Lega_Prism "Lega Prism")" AmmoPickup must be a value greater than or equal to 0
169. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" AmmoPickup must be a value greater than or equal to 0
170. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing InternalName
171. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing reload time or reload time has to be above 0
172. "[Mandonel](/w/Mandonel "Mandonel")" AmmoPickup must be a value greater than or equal to 0
173. "[Mandonel](/w/Mandonel "Mandonel")" Missing InternalName
174. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mandonel.png
175. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Missing InternalName
176. "[Mausolon](/w/Mausolon "Mausolon")" AmmoPickup must be a value greater than or equal to 0
177. "[Mausolon (Atmosphere)](/w/Mausolon_(Atmosphere)?action=edit&redlink=1 "Mausolon (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mausolon.png
178. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
179. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
180. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
181. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Magazine must be a value above 0
182. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing reload time or reload time has to be above 0
183. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing trigger type of weapon
184. "[Milati](/w/Milati "Milati")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
185. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
186. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
187. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
188. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" Image should be in the form of "WeaponName.png"; current value: Braton.png
189. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" Image should be in the form of "WeaponName.png"; current value: Furis.png
190. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" Image should be in the form of "WeaponName.png"; current value: Kunai.png
191. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" Image should be in the form of "WeaponName.png"; current value: Paris.png
192. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" Image should be in the form of "WeaponName.png"; current value: Strun.png
193. "[Morgha](/w/Morgha "Morgha")" AmmoPickup must be a value greater than or equal to 0
194. "[Morgha (Atmosphere)](/w/Morgha_(Atmosphere)?action=edit&redlink=1 "Morgha (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Morgha.png
195. "[Mote Amp](/w/Mote_Amp "Mote Amp")" AmmoPickup must be a value greater than or equal to 0
196. "[Multron](/w/Multron "Multron")" AmmoPickup must be a value greater than or equal to 0
197. "[Noodletron](/w/Noodletron "Noodletron")" AmmoPickup must be a value greater than or equal to 0
198. "[Noodletron](/w/Noodletron "Noodletron")" Missing InternalName
199. "[Noodletron](/w/Noodletron "Noodletron")" Magazine must be a value above 0
200. "[Noodletron](/w/Noodletron "Noodletron")" Missing reload time or reload time has to be above 0
201. "[Orvius](/w/Orvius "Orvius")" Heavy attack must be greater than 0
202. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
203. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
204. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
205. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Magazine must be a value above 0
206. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing reload time or reload time has to be above 0
207. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing trigger type of weapon
208. "[Parazon](/w/Parazon "Parazon")" AmmoMax must be a value greater than or equal to 0
209. "[Parazon](/w/Parazon "Parazon")" AmmoPickup must be a value greater than or equal to 0
210. "[Parazon](/w/Parazon "Parazon")" Magazine must be a value above 0
211. "[Parazon](/w/Parazon "Parazon")" Missing reload time or reload time has to be above 0
212. "[Parazon](/w/Parazon "Parazon")" Missing trigger type of weapon
213. "[Pathocyst](/w/Pathocyst "Pathocyst")" Heavy attack must be greater than 0
214. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" AmmoPickup must be a value greater than or equal to 0
215. "[Phaedra](/w/Phaedra "Phaedra")" AmmoPickup must be a value greater than or equal to 0
216. "[Phaedra (Atmosphere)](/w/Phaedra_(Atmosphere)?action=edit&redlink=1 "Phaedra (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Phaedra.png
217. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" AmmoPickup must be a value greater than or equal to 0
218. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
219. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
220. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
221. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Magazine must be a value above 0
222. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing reload time or reload time has to be above 0
223. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing trigger type of weapon
224. "[Photor](/w/Photor "Photor")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
225. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
226. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
227. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
228. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
229. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" AmmoPickup must be a value greater than or equal to 0
230. "[Prisma Dual Decurions](/w/Prisma_Dual_Decurions "Prisma Dual Decurions")" AmmoPickup must be a value greater than or equal to 0
231. "[Prisma Dual Decurions (Atmosphere)](/w/Prisma_Dual_Decurions_(Atmosphere)?action=edit&redlink=1 "Prisma Dual Decurions (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: PrismaDualDecurions.png
232. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" AmmoPickup must be a value greater than or equal to 0
233. "[Pugil](/w/Pugil "Pugil")" AmmoMax must be a value greater than or equal to 0
234. "[Pugil](/w/Pugil "Pugil")" AmmoPickup must be a value greater than or equal to 0
235. "[Pugil](/w/Pugil "Pugil")" Missing InternalName
236. "[Pugil](/w/Pugil "Pugil")" Magazine must be a value above 0
237. "[Pugil](/w/Pugil "Pugil")" Missing reload time or reload time has to be above 0
238. "[Pugil](/w/Pugil "Pugil")" Missing trigger type of weapon
239. "[Pulsar](/w/Pulsar "Pulsar")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
240. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
241. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
242. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
243. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" AmmoPickup must be a value greater than or equal to 0
244. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
245. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
246. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
247. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Magazine must be a value above 0
248. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
249. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing trigger type of weapon
250. "[Rampart](/w/Rampart "Rampart")" AmmoPickup must be a value greater than or equal to 0
251. "[Rampart](/w/Rampart "Rampart")" Disposition must be between 0.5-1.55; default should be 0.5
252. "[Rampart](/w/Rampart "Rampart")" Missing InternalName
253. "[Rampart](/w/Rampart "Rampart")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
254. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" AmmoPickup must be a value greater than or equal to 0
255. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
256. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Magazine must be a value above 0
257. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing reload time or reload time has to be above 0
258. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
259. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Magazine must be a value above 0
260. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing reload time or reload time has to be above 0
261. "[Razorflies](/w/Razorflies "Razorflies")" AmmoMax must be a value greater than or equal to 0
262. "[Razorflies](/w/Razorflies "Razorflies")" AmmoPickup must be a value greater than or equal to 0
263. "[Razorflies](/w/Razorflies "Razorflies")" Image should be in the form of "WeaponName.png"; current value: Razorfly.png
264. "[Razorflies](/w/Razorflies "Razorflies")" Magazine must be a value above 0
265. "[Razorflies](/w/Razorflies "Razorflies")" Missing reload time or reload time has to be above 0
266. "[Razorflies](/w/Razorflies "Razorflies")" Missing trigger type of weapon
267. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
268. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
269. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
270. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Magazine must be a value above 0
271. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
272. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing trigger type of weapon
273. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" AmmoPickup must be a value greater than or equal to 0
274. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" AmmoPickup must be a value greater than or equal to 0
275. "[Sirocco](/w/Sirocco "Sirocco")" AmmoPickup must be a value greater than or equal to 0
276. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
277. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
278. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
279. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Magazine must be a value above 0
280. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing reload time or reload time has to be above 0
281. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing trigger type of weapon
282. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoMax must be a value greater than or equal to 0
283. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoPickup must be a value greater than or equal to 0
284. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
285. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Magazine must be a value above 0
286. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing reload time or reload time has to be above 0
287. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing trigger type of weapon
288. "[Soaktron](/w/Soaktron "Soaktron")" AmmoPickup must be a value greater than or equal to 0
289. "[Soaktron](/w/Soaktron "Soaktron")" Missing InternalName
290. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
291. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Magazine must be a value above 0
292. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing reload time or reload time has to be above 0
293. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
294. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Magazine must be a value above 0
295. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing reload time or reload time has to be above 0
296. "[Stinger](/w/Stinger "Stinger")" AmmoPickup must be a value greater than or equal to 0
297. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
298. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
299. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
300. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Magazine must be a value above 0
301. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing reload time or reload time has to be above 0
302. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing trigger type of weapon
303. "[Sweeper](/w/Sweeper "Sweeper")" AmmoPickup must be a value greater than or equal to 0
304. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" AmmoPickup must be a value greater than or equal to 0
305. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
306. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
307. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
308. "[Tazicor](/w/Tazicor "Tazicor")" AmmoPickup must be a value greater than or equal to 0
309. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Disposition must be between 0.5-1.55; default should be 0.5
310. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
311. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
312. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Magazine must be a value above 0
313. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing reload time or reload time has to be above 0
314. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
315. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Magazine must be a value above 0
316. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing reload time or reload time has to be above 0
317. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
318. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
319. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
320. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
321. "[Unarmed](/w/Unarmed "Unarmed")" AmmoMax must be a value greater than or equal to 0
322. "[Unarmed](/w/Unarmed "Unarmed")" AmmoPickup must be a value greater than or equal to 0
323. "[Unarmed](/w/Unarmed "Unarmed")" Image should be in the form of "WeaponName.png"; current value: Blank.png
324. "[Unarmed](/w/Unarmed "Unarmed")" Missing InternalName
325. "[Unarmed](/w/Unarmed "Unarmed")" Magazine must be a value above 0
326. "[Unarmed](/w/Unarmed "Unarmed")" Missing reload time or reload time has to be above 0
327. "[Unarmed](/w/Unarmed "Unarmed")" Missing trigger type of weapon
328. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
329. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
330. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
331. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Magazine must be a value above 0
332. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing reload time or reload time has to be above 0
333. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing trigger type of weapon
334. "[Velocitus](/w/Velocitus "Velocitus")" AmmoPickup must be a value greater than or equal to 0
335. "[Velocitus (Atmosphere)](/w/Velocitus_(Atmosphere)?action=edit&redlink=1 "Velocitus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Velocitus.png
336. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
337. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
338. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
339. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Magazine must be a value above 0
340. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing reload time or reload time has to be above 0
341. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing trigger type of weapon
342. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
343. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
344. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
345. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Magazine must be a value above 0
346. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing reload time or reload time has to be above 0
347. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing trigger type of weapon
348. "[Verglas](/w/Verglas "Verglas")" AmmoPickup must be a value greater than or equal to 0
349. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" AmmoPickup must be a value greater than or equal to 0
350. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
351. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Magazine must be a value above 0
352. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing reload time or reload time has to be above 0
353. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
354. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Magazine must be a value above 0
355. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing reload time or reload time has to be above 0
356. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
357. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
358. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
359. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
360. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
361. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
362. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
363. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
364. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
365. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
366. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
367. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
368. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
369. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
370. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
371. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
372. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
373. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
374. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
375. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
376. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
377. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
378. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
379. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
380. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
381. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
382. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
383. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
384. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
385. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
386. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
387. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
388. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
389. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
390. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
391. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
392. "[Vinquibus (Melee)](/w/Vinquibus_(Melee) "Vinquibus (Melee)")" Block angle must be a value between 0 exclusive and 100 inclusive
393. "[Vinquibus (Primary)](/w/Vinquibus_(Primary) "Vinquibus (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vinquibus.png
394. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
395. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
396. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
397. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Magazine must be a value above 0
398. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing reload time or reload time has to be above 0
399. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing trigger type of weapon
400. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
401. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
402. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
403. "[Vulcax](/w/Vulcax "Vulcax")" AmmoPickup must be a value greater than or equal to 0
404. "[Vulklok](/w/Vulklok "Vulklok")" AmmoPickup must be a value greater than or equal to 0
405. "[War](/w/War "War")" Slide attack must be greater than 0
406. "[War Prime](/w/War_Prime "War Prime")" Slide attack must be greater than 0
407. "[Xoris](/w/Xoris "Xoris")" Heavy attack must be greater than 0
408. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
409. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
410. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
411. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
412. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
413. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
414. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
415. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
416. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
417. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
418. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
419. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
420. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
421. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
422. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
423. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
424. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
425. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
426. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
427. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
428. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
429. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
430. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
431. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
432. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
433. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
434. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
435. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
436. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
437. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
438. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
439. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
440. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
441. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
442. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
443. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png

## Weapon Data

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-16 "Edit section's source code: Weapon Data")]

## References

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-17 "Edit section's source code: References")]

1. [↑](#cite_ref-1) As of [Hotfix 32.0.12](/w/Update_32#Hotfix_32.0.12 "Update 32") (2022-10-12), this may not be accurate (last checked 2022-11-01 and first noticed a weapon data schema change ~2 months ago). This key is absent on most weapons and if it is present, then equivalent data is under `UpgradeType` key like for [![](/images/thumb/TatsuPrime.png/32px-TatsuPrime.png?7a830)](/w/Tatsu_Prime "Tatsu Prime") [Tatsu Prime](/w/Tatsu_Prime "Tatsu Prime") (see script tag with id "\_\_NEXT\_DATA\_\_" under HTML source on <https://overframe.gg/build/new/5979/tatsu-prime/>). Treat this information as speculation however.

---

```lua
return {
	["Ack & Brunt"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 14.9, Puncture = 14.9, Slash = 119.2 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Spectral Axe",
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Impact = 29.8, Puncture = 14.9, Slash = 104.3 },
				FireRate = 0.833,
				IsSilent = true,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 3,
				AttackName = "Spectral Axe Explosion",
				AttackParentIndex = 2,
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Heat = 303 },
				Falloff = { EndRange = 5, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 298 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 447 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Ack & Brunt",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 745,
		Image = "Ack&Brunt.png",
		IncarnonDuration = 180,
		IncarnonImage = "Ack&BruntIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerTylAxeAndBoar/RegorAxeShield",
		Introduced = "17",
		Link = "Ack & Brunt",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Ack & Brunt",
		SellPrice = 5000,
		SlideAttack = 149,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Tyl Regor", "Gorth" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Amanata = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Puncture = 37.8, Slash = 88.2 },
				FireRate = 1,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Blast = 252 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Blast = 378 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		Conclave = false,
		Disposition = 0.85,
		Family = "Amanata",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		Image = "Amanata.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/Naginata/ShrineMaidenNaginataWeapon",
		Introduced = "37",
		Link = "Amanata",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Amanata",
		Polarities = { "Madurai" },
		SellPrice = 7500,
		SlideAttack = 252,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.9 
	},
	Amphis = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 1.7,
				Damage = { Impact = 91, Puncture = 19.5, Slash = 19.5 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.21 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 1.7,
				Damage = { Electricity = 260 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 378 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.5,
		Family = "Amphis",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 650,
		Image = "Amphis.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/GrnStaff",
		Introduced = "6.5",
		Link = "Amphis",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Amphis",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 130,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Dok Thul", "Guardsman", "Prosecutor" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Anku = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 25.5, Puncture = 136, Slash = 8.5 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		Disposition = 1.46,
		Family = "Anku",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1020,
		Image = "Anku.png",
		IncarnonDuration = 180,
		IncarnonImage = "AnkuIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/ParisScythe/ParisScythe",
		Introduced = "16.7",
		Link = "Anku",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Anku",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 340,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		Users = { "Valkyr Specter" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Ankyros = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 63, Puncture = 13.5, Slash = 13.5 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 180 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 270 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		Disposition = 1.5,
		Family = "Ankyros",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 450,
		Image = "Ankyros.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gauntlet/Gauntlet",
		Introduced = "7.8",
		Link = "Ankyros",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Ankyros",
		SellPrice = 5000,
		SlideAttack = 270,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Ankyros Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Impact = 89.6, Puncture = 19.2, Slash = 19.2 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Impact = 256 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Blast = 384 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Ankyros",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 640,
		HeavySlamAttack = 384,
		HeavySlamElement = "Impact",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 9,
		Image = "AnkyrosPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gauntlet/PrimeAnkyros/PrimeAnkyros",
		Introduced = "12.4",
		Link = "Ankyros Prime",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Ankyros Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlamAttack = 256,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 8,
		SlideAttack = 384,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Arca Titron"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Impact = 234, Slash = 126 },
				FireRate = 0.733,
				IsSilent = true,
				StatusChance = 0.38 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 720 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.733,
				ForcedProcs = { "Impact", "Electricity" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 1080 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.733,
				ForcedProcs = { "Electricity", "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.38 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Corpus/Melee/Hammer/CorpusHammerWeaponInnateMod" },
		Disposition = 1.3,
		Family = "Arca Titron",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 2160,
		Image = "ArcaTitron.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Hammer/CorpusHammerWeapon",
		Introduced = "21.7",
		Link = "Arca Titron",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Arca Titron",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 720,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.15,
		Traits = { "Corpus" },
		Users = { "Amalgam Arca Heqet" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Argo & Vel"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 60, Slash = 240 },
				FireRate = 0.8,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Heavy Attack Glaive",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 40, Slash = 160 },
				FireRate = 0.8,
				IsSilent = true,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.24 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Attack Glaive AoE",
				AttackParentIndex = 2,
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 20, Slash = 80 },
				Falloff = { EndRange = 3, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.8,
				IsSilent = true,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.24 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Slash = 600 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Slash = 900 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = false,
		Disposition = 1.15,
		Family = "Argo & Vel",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 900,
		Image = "Argo&Vel.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/DaxDuviriMaceShieldWeapon",
		Introduced = "33.6",
		Link = "Argo & Vel",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Argo & Vel",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Duviri" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Arum Spinosa"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.09,
				CritMultiplier = 1.9,
				Damage = { Impact = 35.64, Puncture = 59.4, Slash = 201.96 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.37 
			},
			{
				AttackIndex = 2,
				AttackName = "First Heavy Attack - Toxic Spines",
				ChargeTime = 0.49,
				CritChance = 0.09,
				CritMultiplier = 1.7,
				Damage = { Impact = 17.5, Puncture = 27.5, Slash = 57.5, Toxin = 72.5 },
				FireRate = 2,
				IsSilent = true,
				Multishot = 18,
				PunchThrough = 1.3,
				Range = 35,
				ShotSpeed = 49,
				ShotType = "Projectile",
				StatusChance = 0.0616,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Second Heavy Attack - Toxic Spines",
				ChargeTime = 0.49,
				CritChance = 0.09,
				CritMultiplier = 1.7,
				Damage = { Impact = 35, Puncture = 55, Slash = 115, Toxin = 145 },
				FireRate = 2,
				IsSilent = true,
				Multishot = 9,
				PunchThrough = 1.3,
				Range = 35,
				ShotSpeed = 49,
				ShotType = "Projectile",
				StatusChance = 0.123,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.09,
				CritMultiplier = 1.9,
				Damage = { Impact = 594 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.09,
				CritMultiplier = 1.9,
				Damage = { Blast = 891 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		Disposition = 1.25,
		Family = "Arum Spinosa",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1188,
		Image = "ArumSpinosa.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/InfWarfan/InfWarfanWeapon",
		Introduced = "29.5",
		Link = "Arum Spinosa",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Arum Spinosa",
		Polarities = { "Naramon", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 297,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Infested" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Atterax = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 6.45, Puncture = 6.45, Slash = 116.1 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Slash = 258 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 387 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Atterax",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 580.5,
		Image = "Atterax.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerWhip/GrineerWhip",
		Introduced = "14.7",
		Link = "Atterax",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Atterax",
		SellPrice = 5000,
		SlideAttack = 258,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Azothane = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 51, Puncture = 34, Slash = 85 },
				FireRate = 1.17,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Slash = 340 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Two-Handed Nikana",
		ComboDur = 5,
		CompatibilityTags = { "LONG_KATANA_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Azothane",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1020,
		Image = "Azothane.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DaxDuviriTwoHandedKatana/DaxDuviriTwoHandedKatanaWeapon",
		Introduced = "33",
		Link = "Azothane",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 3.2,
		Name = "Azothane",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 340,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Duviri" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Bo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.125,
				CritMultiplier = 2,
				Damage = { Impact = 126, Puncture = 14 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.125,
				CritMultiplier = 2,
				Damage = { Impact = 280 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.125,
				CritMultiplier = 2,
				Damage = { Blast = 420 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Bo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 700,
		Image = "Bo.png",
		IncarnonDuration = 180,
		IncarnonImage = "BoIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/Staff",
		Introduced = "Vanilla",
		Link = "Bo",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Bo",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 140,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Bo Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 158.4, Puncture = 17.6 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 352 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Blast = 528 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Bo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 880,
		Image = "BoPrime.png",
		IncarnonDuration = 180,
		IncarnonImage = "BoPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/PrimeBo/PrimeBoWeapon",
		Introduced = "13.7",
		Link = "Bo Prime",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Bo Prime",
		Polarities = { "Vazarin", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 176,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Boltace = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Impact = 17.6, Puncture = 140.8, Slash = 17.6 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Impact = 352 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Blast = 528 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Boltace",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 704,
		Image = "Boltace.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Tonfa/Boltonfa/Boltonfa",
		Introduced = "16.5",
		Link = "Boltace",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Boltace",
		SellPrice = 5000,
		SlideAttack = 352,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Loki Specter" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Broken Scepter"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 125.3, Puncture = 17.9, Slash = 35.8 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 358 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 537 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Broken Scepter",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 895,
		Image = "BrokenScepter.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnQueenSceptre/GrnQueenSceptreWeapon",
		Introduced = "19.0",
		Link = "Broken Scepter",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Broken Scepter",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 179,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Users = { "Grineer Queens" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Broken War"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2.2,
				Damage = { Impact = 18.7, Puncture = 18.7, Slash = 149.6 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.2,
				Damage = { Impact = 374 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.2,
				Damage = { Blast = 561 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Broken War",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 935,
		Image = "BrokenWar.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/StalkerTwo/StalkerTwoSmallSword",
		Introduced = "18.0",
		Link = "Broken War",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Broken War",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 187,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Sentient" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Cadus = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Electricity = 60, Impact = 70 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 260 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 390 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = false,
		Disposition = 1.29,
		Family = "Cadus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 850,
		Image = "Cadus.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/SingleStaff",
		Introduced = "30.5",
		Link = "Cadus",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Cadus",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 170,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Cassowar = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.4,
				Damage = { Impact = 41.36, Puncture = 63.92, Slash = 82.72 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.4,
				Damage = { Impact = 376 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.4,
				Damage = { Blast = 564 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Cassowar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1128,
		Image = "Cassowar.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/TnHalberdPolearm/TnHalberdPolearmWeapon",
		Introduced = "22.4",
		Link = "Cassowar",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Cassowar",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 376,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Traits = { "Tenno" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Caustacyst = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Corrosive = 103, Impact = 17, Puncture = 71, Slash = 69 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.37 
			},
			{
				AttackIndex = 2,
				AttackName = "Corrosive Wave",
				ChargeTime = 0.995,
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Corrosive = 225 },
				Falloff = { EndRange = 35, Reduction = 1, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Blind" },
				IsSilent = true,
				Range = 35,
				ShotSpeed = 15,
				ShotType = "Projectile",
				StatusChance = 0.37,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Corrosive Pool",
				AttackParentIndex = 2,
				ChargeTime = 0.995,
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Corrosive = 98 },
				EffectDuration = 4,
				FireRate = 1,
				ForcedProcs = { "Blind" },
				IsSilent = true,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Impact = 520 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Blast = 780 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Caustacyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1560,
		Image = "Caustacyst.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/InfEmbolistScythe/InfestedScythe",
		Introduced = "Update: The Index Preview",
		Link = "Caustacyst",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Caustacyst",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 520,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Infested" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Ceramic Dagger"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 14, Puncture = 126 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Spectral Dagger",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 35, Puncture = 116.67, Slash = 198.33 },
				FireRate = 1,
				IsSilent = true,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Spectral Dagger Explosion",
				AttackParentIndex = 2,
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Heat = 350 },
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 280 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 420 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.43,
		Family = "Ceramic Dagger",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 280,
		Image = "CeramicDagger.png",
		IncarnonDuration = 180,
		IncarnonImage = "CeramicDaggerIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Dagger/CeramicDagger",
		Introduced = "5.0",
		Link = "Ceramic Dagger",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 1.8,
		Name = "Ceramic Dagger",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 280,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Cerata = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 19, Puncture = 36, Slash = 52, Toxin = 76 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 33, Puncture = 39, Slash = 52, Toxin = 77 },
				FireRate = 1,
				IsSilent = true,
				Range = 34,
				ShotSpeed = 35,
				ShotType = "Thrown",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Toxin = 333 },
				Falloff = { EndRange = 4.8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Toxin = 666 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Toxin", "Impact" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 46, Puncture = 80, Slash = 114, Toxin = 162 },
				FireRate = 0.833,
				ForcedProcs = { "Toxin", "Impact" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 34,
				ShotSpeed = 45,
				ShotType = "Thrown",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Toxin = 666 },
				Falloff = { EndRange = 4.8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Toxin = 1318 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Toxin", "Impact" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Toxin = 366 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Toxin = 549 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Cerata",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Cerata.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Glaives/PunctureGlaive/PunctureGlaiveWeapon",
		Introduced = "17.9",
		Link = "Cerata",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Cerata",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 366,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	["Ceti Lacera"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 100, Impact = 12, Puncture = 38, Slash = 66 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 432 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.45 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 648 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.45 
			} 
		},
		BlockAngle = 60,
		Class = "Blade and Whip",
		ComboDur = 5,
		CompatibilityTags = { "BLADE_AND_WHIP_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Lacera",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 864,
		Image = "CetiLacera.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/StalkerMios/OperationsLacera",
		Introduced = "27.3",
		Link = "Ceti Lacera",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Ceti Lacera",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 216,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Cobra & Crane"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 207.2, Puncture = 88.8 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 592 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Blast = 888 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = false,
		Disposition = 1.35,
		Family = "Cobra & Crane",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1480,
		Image = "Cobra&Crane.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/PacifistShieldAndSword/PacifistShieldSword",
		Introduced = "24.2",
		Link = "Cobra & Crane",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Cobra & Crane",
		SellPrice = 5000,
		SlideAttack = 296,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Cobra & Crane Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 210, Puncture = 90 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.38 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 600 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Blast = 900 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Cobra & Crane",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1500,
		Image = "Cobra&CranePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/PrimeCobraAndCrane/PrimeCobraAndCraneWeapon",
		Introduced = "32.2.5",
		Link = "Cobra & Crane Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Cobra & Crane Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime" },
		Users = {  },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Coda Caustacyst"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Corrosive = 120, Impact = 20, Puncture = 75, Slash = 70 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.41 
			},
			{
				AttackIndex = 2,
				AttackName = "Corrosive Wave",
				ChargeTime = 0.995,
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Corrosive = 225 },
				Falloff = { EndRange = 35, Reduction = 1, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Blind" },
				IsSilent = true,
				Range = 35,
				ShotSpeed = 15,
				ShotType = "Projectile",
				StatusChance = 0.41,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Corrosive Pool",
				AttackParentIndex = 2,
				ChargeTime = 0.995,
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Corrosive = 145 },
				EffectDuration = 4,
				FireRate = 1,
				ForcedProcs = { "Blind" },
				IsSilent = true,
				ShotType = "AoE",
				StatusChance = 1 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 570 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Blast = 855 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = false,
		Disposition = 0.85,
		Family = "Caustacyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1560,
		Image = "CodaCaustacyst.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Melee/CodaCaustacyst/CodaCaustacyst",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Caustacyst",
		Mastery = 17,
		MaxRank = 40,
		MeleeRange = 2.9,
		Name = "Coda Caustacyst",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 520,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Infested", "Technocyte Coda" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Coda Hirudo"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.34,
				CritMultiplier = 3.1,
				Damage = { Impact = 26.25, Puncture = 140, Slash = 8.75 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 3.1,
				Damage = { Impact = 350 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 3.1,
				Damage = { Blast = 525 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		DefaultUpgrades = {
			"/Lotus/Weapons/Infested/Melee/InfWFAccompanyingSparring/InfestedKogakeUpgrade" 
		},
		Disposition = 0.75,
		Family = "Hirudo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 1138,
		Image = "CodaHirudo.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Melee/CodaHirudo",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Hirudo",
		Mastery = 17,
		MaxRank = 40,
		MeleeRange = 1.25,
		Name = "Coda Hirudo",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 350,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Infested", "Technocyte Coda" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Coda Mire"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2.4,
				Damage = { Impact = 45, Puncture = 45, Slash = 66, Toxin = 79 },
				FireRate = 1.083,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2.4,
				Damage = { Toxin = 470 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact", "Toxin" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.31 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2.4,
				Damage = { Toxin = 705 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Toxin", "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.31 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = false,
		Disposition = 0.75,
		Family = "Mire",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1175,
		Image = "CodaMire.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Melee/CodaMire",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Mire",
		Mastery = 17,
		MaxRank = 40,
		MeleeRange = 2.7,
		Name = "Coda Mire",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 235,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Infested", "Technocyte Coda" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Coda Motovore"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 83.325, Puncture = 83.325, Slash = 83.35 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 166.5, Puncture = 166.5, Slash = 167 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 249.75, Puncture = 249.75, Slash = 250.5 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.8,
		Family = "Motovore",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1500,
		Image = "CodaMotovore.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Melee/InfestedHammer/InfLichHammerWeapon",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Motovore",
		Mastery = 17,
		MaxRank = 40,
		MeleeRange = 2.5,
		Name = "Coda Motovore",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Infested", "Technocyte Coda" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Coda Pathocyst"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.3,
				Damage = { Impact = 58, Puncture = 55, Slash = 65, Viral = 92 },
				FireRate = 0.667,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 49, Puncture = 45, Slash = 80, Viral = 123 },
				FireRate = 0.667,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Viral = 405 },
				Falloff = { EndRange = 4.9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.12,
				CritMultiplier = 2.4,
				Damage = { Viral = 810 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact", "Viral" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.5,
				Damage = { Impact = 131, Puncture = 125, Slash = 137, Viral = 201 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.5,
				Damage = { Viral = 810 },
				Falloff = { EndRange = 4.9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.5,
				Damage = { Viral = 1620 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact", "Viral" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.3,
				Damage = { Viral = 540 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.3,
				Damage = { Viral = 810 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = false,
		Disposition = 0.65,
		Family = "Pathocyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "CodaPathocyst.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Melee/CodaPathocyst/CodaPathocyst",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Pathocyst",
		Mastery = 17,
		MaxRank = 40,
		MeleeRange = 1.3,
		Name = "Coda Pathocyst",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 524,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Infested", "Technocyte Coda" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Corufell = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 96, Puncture = 68, Slash = 36 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.14 
			},
			{
				AttackIndex = 2,
				AttackName = "Charged Projectile",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Heat = 600 },
				Falloff = { EndRange = 30, Reduction = 0.5, StartRange = 15 },
				FireRate = 0.833,
				IsSilent = false,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.14,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Blast = 400 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Heavy Scythe",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY SCYTHE_STANCE" },
		Conclave = false,
		Disposition = 1.05,
		Family = "Corufell",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1200,
		Image = "Corufell.png",
		InternalName = "/Lotus/Weapons/Tenno/Archwing/Melee/ExaltedArchScythe/ExaltedAWScytheWeapon",
		Introduced = "32.3",
		Link = "Corufell",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Corufell",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 1.3,
		_TooltipAttackDisplay = 1 
	},
	Cronus = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Impact = 31.8, Puncture = 15.9, Slash = 58.3 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Impact = 212 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Blast = 318 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.48,
		Family = "Cronus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 530,
		Image = "Cronus.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/CronusSword/CronusLongSword",
		Introduced = "Vanilla",
		Link = "Cronus",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Cronus",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 106,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Grineer" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Dakra Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.36,
				CritMultiplier = 2.4,
				Damage = { Impact = 17, Puncture = 17, Slash = 136 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.36,
				CritMultiplier = 2.4,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.36,
				CritMultiplier = 2.4,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Dakra Prime",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 850,
		HeavySlamAttack = 510,
		HeavySlamElement = "Blast",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 8,
		Image = "DakraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/CronusSword/PrimeCronusLongSword",
		Introduced = "10.0",
		Link = "Dakra Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dakra Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlamAttack = 340,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 7,
		SlideAttack = 170,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Dark Dagger"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Puncture = 58, Radiation = 60, Slash = 36 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 308 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Radiation = 462 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.22 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Dark Dagger",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 308,
		HeavySlamAttack = 462,
		HeavySlamElement = "Radiation",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 6,
		Image = "DarkDagger.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Dagger/DarkDagger",
		Introduced = "5.0",
		Link = "Dark Dagger",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Dark Dagger",
		SellPrice = 5000,
		SlamAttack = 308,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 5,
		SlideAttack = 308,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Dark Split-Sword (Dual Swords)"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Puncture = 56, Radiation = 32, Slash = 28 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Impact = 232 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Blast = 462 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE", "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Dark Split-Sword (Dual Swords)",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 464,
		Image = "DarkSplitSwordDualSwords.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DarkSword/DarkSwordDaggerDuals",
		Introduced = "18.14",
		Link = "Dark Split-Sword",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Dark Split-Sword (Dual Swords)",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 232,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Dark Split-Sword (Heavy Blade)"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Puncture = 78, Radiation = 100, Slash = 52 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 460 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 690 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE", "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Dark Split-Sword (Heavy Blade)",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1380,
		HeavySlamAttack = 690,
		HeavySlamRadius = 9,
		Image = "DarkSplitSwordHeavyBlade.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DarkSword/DarkSwordDaggerSingle",
		Introduced = "18.14",
		Link = "Dark Split-Sword",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Dark Split-Sword (Heavy Blade)",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlamAttack = 460,
		SlamElement = "Blast",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 8,
		SlideAttack = 460,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Dark Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Puncture = 120, Radiation = 80, Slash = 60 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Toxin = 520 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Toxin = 780 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Toxin", "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.48,
		Family = "Dark Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1300,
		Image = "DarkSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DarkSword/DarkLongSword",
		Introduced = "5.0",
		Link = "Dark Sword",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dark Sword",
		SellPrice = 5000,
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Desert Wind"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 250 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = false,
		DefaultUpgrades = { "Serene Storm" },
		FollowThrough = 1,
		HeavyAttack = 3750,
		Image = "DesertWind.png",
		InternalName = "/Lotus/Powersuits/Pacifist/PacifistFist",
		Introduced = "24.2",
		Link = "Desert Wind",
		MaxRank = 30,
		MeleeRange = 1.2,
		Name = "Desert Wind",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		SlideAttack = 750,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Baruuk" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Desert Wind Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 250 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = false,
		DefaultUpgrades = { "Serene Storm" },
		FollowThrough = 1,
		HeavyAttack = 3750,
		Image = "DesertWind.png",
		InternalName = "/Lotus/Powersuits/Pacifist/PacifistFistPrime",
		Introduced = "32.2.5",
		Link = "Desert Wind",
		MaxRank = 30,
		MeleeRange = 1.2,
		Name = "Desert Wind Prime",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		SlideAttack = 750,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Baruuk Prime" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Destreza = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Impact = 3.95, Puncture = 134.3, Slash = 19.75 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.14 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Impact = 316 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Blast = 474 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Rapier",
		ComboDur = 5,
		CompatibilityTags = { "RAPIER_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Destreza",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 711,
		Image = "Destreza.png",
		IncarnonDuration = 180,
		IncarnonImage = "DestrezaIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TnoRapier/TnoRapier",
		Introduced = "18.3",
		Link = "Destreza",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Destreza",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 158,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Violence" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Destreza Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Impact = 20.4, Puncture = 119, Slash = 30.6 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.18 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Rapier",
		ComboDur = 5,
		CompatibilityTags = { "RAPIER_STANCE" },
		Conclave = true,
		Disposition = 1.14,
		Family = "Destreza",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 765,
		Image = "DestrezaPrime.png",
		IncarnonDuration = 180,
		IncarnonImage = "DestrezaPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PRapier/DestrezaPrime",
		Introduced = "23.0.3",
		Link = "Destreza Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Destreza Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 170,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Dex Dakra"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 14.2, Puncture = 14.2, Slash = 113.6 },
				FireRate = 0.883,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 284 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 426 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Dex Dakra",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 568,
		Image = "DexDakra.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DexTheSecond/DexTheSecond",
		Introduced = "16.1.2",
		Link = "Dex Dakra",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dex Dakra",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 284,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dex Nikana"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 16.8, Puncture = 25.2, Slash = 126 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 336 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Blast = 504 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		CodexSecret = false,
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Nikana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 840,
		Image = "DexNikana.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/KatanaAndWakizashi/Dex2023Nikana/Dex2023Nikana",
		Introduced = "35.5",
		Link = "Dex Nikana",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dex Nikana",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 336,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Diwata = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 30, Puncture = 150, Slash = 20 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Razorwing" },
		FollowThrough = 1,
		HeavyAttack = 200,
		Image = "Diwata.png",
		InternalName = "/Lotus/Powersuits/Fairy/FlightSword",
		Introduced = "23.0",
		Link = "Diwata",
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Diwata",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		SlideAttack = 429,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.5,
		Traits = { "Tenno" },
		Users = { "Titania" },
		WindUp = 0,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Diwata Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 30, Puncture = 150, Slash = 20 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Razorwing" },
		FollowThrough = 1,
		HeavyAttack = 200,
		Image = "DiwataPrime.png",
		InternalName = "/Lotus/Powersuits/Fairy/PrimeFlightSword",
		Introduced = "27.3.6",
		Link = "Diwata",
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Diwata Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		SlideAttack = 429,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.5,
		Traits = { "Tenno" },
		Users = { "Titania Prime" },
		WindUp = 0,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Dorrclave = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Slash = 222 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Slash = 444 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Slash = 666 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.14 
			} 
		},
		BlockAngle = 60,
		Class = "Blade and Whip",
		ComboDur = 5,
		CompatibilityTags = { "BLADE_AND_WHIP_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Dorrclave",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 888,
		Image = "Dorrclave.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TnDagathBladeWhip/TnDagathBladeWhip",
		Introduced = "34",
		Link = "Dorrclave",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dorrclave",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 222,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Dagath", "Tenno" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Dragon Nikana"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 9.4, Puncture = 18.8, Slash = 159.8 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 376 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 564 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Dragon Nikana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 940,
		Image = "DragonNikana.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/KatanaAndWakizashi/LowKatana",
		Introduced = "13.0",
		Link = "Dragon Nikana",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dragon Nikana",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 376,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Dual Cleavers"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 23.55, Puncture = 23.55, Slash = 109.9 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 314 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 471 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Dual Cleavers",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 628,
		Image = "DualCleavers.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerMachetteAndCleaver/DualCleaverWeapon",
		Introduced = "8.0",
		Link = "Dual Cleavers",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Dual Cleavers",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 314,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Butcher", "Corrupted Butcher" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Ether"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 27, Puncture = 27, Slash = 126 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Dual Ether",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 720,
		Image = "DualEther.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualShortSword/DualEtherSword",
		Introduced = "7.7.3",
		Link = "Dual Ether",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dual Ether",
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Heat Swords"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 22.05, Puncture = 22.05, Slash = 102.9 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Heat = 294 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Heat" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Heat = 441 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Dual Heat Swords",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 588,
		Image = "DualHeatSwords.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualShortSword/DualHeatSwords",
		Introduced = "6.2",
		Link = "Dual Heat Swords",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dual Heat Swords",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 294,
		Slot = "Melee",
		StancePolarity = "Universal",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Red Veil" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Ichor"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 19, Puncture = 11, Slash = 45, Toxin = 47 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 244 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 366 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Dual Ichor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 488,
		Image = "DualIchor.png",
		IncarnonDuration = 180,
		IncarnonImage = "DualIchorIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/DualInfestedAxesWeapon",
		Introduced = "10.0",
		Link = "Dual Ichor",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.3,
		Name = "Dual Ichor",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 244,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Kamas"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 4.8, Puncture = 9.6, Slash = 81.6 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 192 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Blast = 288 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Dual Kamas",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 384,
		Image = "DualKamas.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualKamas/DualKamas",
		Introduced = "11.1",
		Link = "Dual Kamas",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Dual Kamas",
		SellPrice = 5000,
		SlideAttack = 192,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Kamas Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 8, Puncture = 32, Slash = 120 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 320 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 480 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Dual Kamas",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 640,
		Image = "DualKamasPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeDualKamas/PrimeDualKamas",
		Introduced = "17.6",
		Link = "Dual Kamas Prime",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Dual Kamas Prime",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 320,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Keres"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Impact = 13.8, Puncture = 34.5, Slash = 66.7 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.14 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Impact = 230 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Blast = 345 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Swords/QuillSword/QuillDualSwordsSignatureUpgrade" },
		Disposition = 1.1,
		Family = "Dual Keres",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 460,
		Image = "DualKeres.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/QuillSword/QuillDualSwords",
		Introduced = "22.18",
		Link = "Dual Keres",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dual Keres",
		SellPrice = 5000,
		SlideAttack = 230,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Keres Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 21.6, Puncture = 54, Slash = 104.4 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Swords/QuillSword/QuillDualSwordsSignatureUpgrade" },
		Disposition = 0.8,
		Family = "Dual Keres",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 720,
		Image = "DualKeresPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeDualKeres/PrimeDualKeresWeapon",
		Introduced = "31.7",
		Link = "Dual Keres Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dual Keres Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Raza"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 11, Puncture = 33, Slash = 66 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 220 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 330 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Dual Raza",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 440,
		Image = "DualRaza.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Soma/SomaDualKamas",
		Introduced = "16.3",
		Link = "Dual Raza",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Dual Raza",
		SellPrice = 5000,
		SlideAttack = 220,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Rhino Specter" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Skana"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 18, Puncture = 18, Slash = 84 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.48,
		Family = "Dual Skana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 480,
		Image = "DualSkana.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualShortSword/DualShortSword",
		Introduced = "Vanilla",
		Link = "Dual Skana",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Dual Skana",
		SellPrice = 5000,
		SlideAttack = 240,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Excalibur Specter" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Viciss"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Gas = 153, Puncture = 51, Slash = 51 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.29 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Gas = 510 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.29 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Gas = 765 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.29 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = false,
		Disposition = 0.8,
		Family = "Dual Viciss",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 1020,
		Image = "DualViciss.png",
		InternalName = "/Lotus/Weapons/Lasria/LasGooSickle/LasGooSicklePlayerWeapon",
		Introduced = "38.5",
		Link = "Dual Viciss",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Dual Viciss",
		SellPrice = 5000,
		SlideAttack = 510,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Scaldra" },
		Users = { "Scaldra Flayer" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Zoren"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 3.5, Puncture = 3.5, Slash = 63 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.05 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 140 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 210 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Dual Zoren",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 280,
		Image = "DualZoren.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/DualAxeWeapon",
		Introduced = "6.0",
		Link = "Dual Zoren",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 2.3,
		Name = "Dual Zoren",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 140,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Dual Zoren Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3.2,
				Damage = { Impact = 7, Puncture = 7, Slash = 126 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3.2,
				Damage = { Impact = 280 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3.2,
				Damage = { Blast = 420 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = false,
		Disposition = 0.9,
		Family = "Dual Zoren",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 560,
		Image = "DualZorenPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/PrimeZoren/PrimeZorenAxeWeapon",
		Introduced = "38.0.10",
		Link = "Dual Zoren Prime",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 2.3,
		Name = "Dual Zoren Prime",
		Polarities = { "Vazarin", "Naramon", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 280,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Edun = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = { Impact = 44, Puncture = 66, Slash = 110 },
				FireRate = 1,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Polearm Throw",
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Impact = 144, Puncture = 192, Slash = 144 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Polearm Explosion",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Blast = 400 },
				ExplosionDelay = 0.8,
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = false,
		Disposition = 1.15,
		Family = "Edun",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 880,
		HeavySlamAttack = 660,
		HeavySlamElement = "Blast",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 9,
		Image = "Edun.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/DaxDuviriPolearm/DaxDuviriPolearmWeapon",
		Introduced = "33",
		Link = "Edun",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Edun",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		SellPrice = 5000,
		SlamAttack = 440,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 7,
		SlideAttack = 440,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Duviri" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Ekhein = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 340 },
				FireRate = 0.767,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 680 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.767,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.15 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Blast = 1020 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.767,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.15 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Ekhein",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 2040,
		Image = "Ekhein.png",
		InternalName = "/Lotus/Weapons/Thanotech/EntSphereHammer/EntSphereHammer",
		Introduced = "35",
		Link = "Ekhein",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Ekhein",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 680,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Entrati" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Endura = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 10, Puncture = 140, Slash = 50 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Rapier",
		ComboDur = 5,
		CompatibilityTags = { "RAPIER_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Endura",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 900,
		Image = "Endura.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/ThreeLeaf/ThreeLeaf",
		Introduced = "20.6",
		Link = "Endura",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Endura",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Ether Daggers"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 33.6, Puncture = 33.6, Slash = 156.8 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 448 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Blast = 672 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.49,
		Family = "Ether Daggers",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 448,
		Image = "EtherDaggers.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualDagger/DualEtherDagger",
		Introduced = "7.7.3",
		Link = "Ether Daggers",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Ether Daggers",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 448,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Nova Specter" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Ether Reaper"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 27, Puncture = 27, Slash = 126 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Ether Reaper",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1080,
		Image = "EtherReaper.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/EtherScytheWeapon",
		Introduced = "10.0",
		Link = "Ether Reaper",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Ether Reaper",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		Users = { "Misery" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Ether Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 28.8, Puncture = 28.8, Slash = 134.4 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Radiation = 384 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact", "Radiation" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Radiation = 576 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Ether Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 960,
		Image = "EtherSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/LongSword/EtherSword",
		Introduced = "8.0",
		Link = "Ether Sword",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Ether Sword",
		SellPrice = 5000,
		SlideAttack = 192,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Exalted Blade"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 37.5, Puncture = 37.5, Slash = 175 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 40,
				ShotSpeed = 15,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Exalted Blade" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1250,
		Image = "ExaltedBladeWeapon.png",
		InternalName = "/Lotus/Powersuits/Excalibur/DoomSword",
		Introduced = "23.0",
		Link = "Exalted Blade (Weapon)",
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Exalted Blade",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		SlideAttack = 536,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Excalibur" },
		WindUp = 0.6,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Exalted Prime Blade"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 37.5, Puncture = 37.5, Slash = 175 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 40,
				ShotSpeed = 15,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1250,
		Image = "ExaltedPrimeBlade.png",
		InternalName = "/Lotus/Powersuits/Excalibur/DoomSwordPrime",
		Introduced = "23.0",
		Link = "Exalted Blade (Weapon)",
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Exalted Prime Blade",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		SlideAttack = 536,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Excalibur Prime" },
		WindUp = 0.6,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Exalted Umbra Blade"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 37.5, Puncture = 37.5, Slash = 175 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 40,
				ShotSpeed = 15,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1250,
		Image = "ExaltedUmbraBlade.png",
		InternalName = "/Lotus/Powersuits/Excalibur/DoomSwordUmbra",
		Introduced = "23.0",
		Link = "Exalted Blade (Weapon)",
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Exalted Umbra Blade",
		Polarities = { "Umbra", "Umbra" },
		SlideAttack = 536,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Excalibur Umbra" },
		WindUp = 0.6,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Falcor = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.6,
				Damage = { Electricity = 84, Impact = 36, Puncture = 18, Slash = 92 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Electricity = 110, Impact = 20, Puncture = 40, Slash = 80 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 40,
				ShotSpeed = 25,
				ShotType = "Thrown",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Electricity = 345 },
				Falloff = { EndRange = 6, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Electricity = 690 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Electricity = 200, Impact = 56, Puncture = 20, Slash = 230 },
				FireRate = 0.833,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 40,
				ShotSpeed = 35,
				ShotType = "Thrown",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Electricity = 690 },
				Falloff = { EndRange = 6, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Electricity = 1380 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.38 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.6,
				Damage = { Electricity = 460 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.6,
				Damage = { Electricity = 750 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.34 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = false,
		Disposition = 1.3,
		Family = "Falcor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Falcor.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Glaive/CrpGlaive/CrpGlaive",
		Introduced = "23.10",
		Link = "Falcor",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.3,
		Name = "Falcor",
		SellPrice = 5000,
		SlideAttack = 460,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Fang = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 16.2, Puncture = 75.6, Slash = 16.2 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 216 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Blast = 324 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.36,
		Family = "Fang",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 216,
		Image = "Fang.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualDagger/DualDagger",
		Introduced = "7.0",
		Link = "Fang",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 1.65,
		Name = "Fang",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 216,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Fang Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 26.7, Puncture = 124.6, Slash = 26.7 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 356 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Blast = 534 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Fang",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 356,
		Image = "FangPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualDagger/FangPrimeDagger",
		Introduced = "9.0",
		Link = "Fang Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Fang Prime",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 356,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Fragor = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 140, Puncture = 30, Slash = 30 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Fragor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1200,
		Image = "Fragor.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Hammer/HammerWeapon",
		Introduced = "5.4",
		Link = "Fragor",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Fragor",
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		Users = { "Lieutenant Lech Kril (Brokk Skin)" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Fragor Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 2.5,
				Damage = { Impact = 189, Puncture = 40.5, Slash = 40.5 },
				FireRate = 0.8,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.4,
				CritMultiplier = 2.5,
				Damage = { Impact = 540 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.4,
				CritMultiplier = 2.5,
				Damage = { Blast = 810 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "Fragor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1620,
		Image = "FragorPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeFragor/PrimeFragor",
		Introduced = "18.12",
		Link = "Fragor Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Fragor Prime",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 540,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Furax = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 94.5, Puncture = 20.3, Slash = 20.2 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.11 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 270 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Blast = 405 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		Disposition = 1.38,
		Family = "Furax",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 675,
		Image = "Furax.png",
		IncarnonDuration = 180,
		IncarnonImage = "FuraxIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Fist/Fist",
		Introduced = "Vanilla",
		Link = "Furax",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Furax",
		SellPrice = 5000,
		SlideAttack = 405,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Powerfist" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Furax Wraith"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.7,
				Damage = { Impact = 97.3, Puncture = 20.9, Slash = 20.8 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.7,
				Damage = { Impact = 278 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.3,
				Damage = { Blast = 417 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Furax",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 695,
		Image = "FuraxWraith.png",
		IncarnonDuration = 180,
		IncarnonImage = "FuraxWraithIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Fist/FuraxWraith",
		Introduced = "18.10",
		Link = "Furax Wraith",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Furax Wraith",
		SellPrice = 5000,
		SlideAttack = 417,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Tradable = 2,
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Galariak Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Impact = 30.3, Puncture = 190.5, Slash = 13.2 },
				FireRate = 1.083,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Impact = 702 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.083,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Blast = 1170 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.083,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHE_STANCE" },
		Conclave = false,
		Disposition = 0.8,
		Family = "Galariak Prime",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1404,
		Image = "GalariakPrime.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/Scythe/GrnDrillScythe/GrnDrillScythe",
		Introduced = "41.0",
		Link = "Galariak Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Galariak Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 468,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 0,
		Traits = { "Prime" },
		Users = {  },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Galatine = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 4.55, Puncture = 4.55, Slash = 172.9 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 364 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 546 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "Galatine",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1092,
		Image = "Galatine.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/GreatSword/TennoGreatSword",
		Introduced = "10.2",
		Link = "Galatine",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Galatine",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 364,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Galatine Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 7, Slash = 266 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Impact = 560 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Blast = 840 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 0.9,
		Family = "Galatine",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1680,
		Image = "GalatinePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeGalatine/PrimeGalatine",
		Introduced = "Hotfix: The Silver Grove 3",
		Link = "Galatine Prime",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Galatine Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 560,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Galvacord = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Electricity = 96, Impact = 12, Puncture = 38, Slash = 64 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Electricity = 420 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Electricity = 630 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = false,
		Disposition = 1.35,
		Family = "Galvacord",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 945,
		Image = "Galvacord.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Whips/CrpShockGrip/CrpShockGripWhipWeapon",
		Introduced = "24.2",
		Link = "Galvacord",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Galvacord",
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Garuda Prime Talons"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 14, Puncture = 28, Slash = 238 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 560 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Blast = 840 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = false,
		Disposition = 0,
		FollowThrough = 0.8,
		HeavyAttack = 1400,
		Image = "GarudaPrimeTalons.png",
		InternalName = "/Lotus/Powersuits/Garuda/GarudaPrimeClaws",
		Introduced = "31.3",
		Link = "Garuda Prime Talons",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.2,
		Name = "Garuda Prime Talons",
		Polarities = { "Madurai", "Naramon" },
		SlideAttack = 840,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Prime" },
		Users = { "Garuda Prime" },
		WindUp = 0.6,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Garuda Talons"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 19.84, Puncture = 54.56, Slash = 173.6 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 496 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 744 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = false,
		Disposition = 0,
		FollowThrough = 0.8,
		HeavyAttack = 1240,
		Image = "GarudaTalons.png",
		InternalName = "/Lotus/Powersuits/Garuda/GarudaClaws",
		Introduced = "24.0",
		Link = "Garuda Talons",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.2,
		Name = "Garuda Talons",
		Polarities = { "Madurai", "Naramon" },
		SlideAttack = 744,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Garuda" },
		WindUp = 0.6,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Gazal Machete"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 17.8, Puncture = 26.7, Slash = 133.5 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 356 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 534 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Gazal Machete",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1068,
		Image = "GazalMachete.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PersianMachete/DjinnMachete",
		Introduced = "Update: The Vacuum Within",
		Link = "Gazal Machete",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Gazal Machete",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 356,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Ghoulsaw = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.9,
				Damage = { Impact = 37.43, Puncture = 45.31, Slash = 114.26 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.27 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.9,
				Damage = { Impact = 394 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.9,
				Damage = { Blast = 591 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Assault Saw",
		ComboDur = 5,
		CompatibilityTags = { "BLADESAW_STANCE" },
		Conclave = false,
		Disposition = 1.25,
		Family = "Ghoulsaw",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 1,
		HeavyAttack = 1182,
		Image = "Ghoulsaw.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnGhoulSaw/GrnGhoulSawPlayer",
		Introduced = "30.7",
		Link = "Ghoulsaw",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.15,
		Name = "Ghoulsaw",
		SellPrice = 5000,
		SlideAttack = 394,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Grineer" },
		Users = { "Ghoul Rictus" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Glaive = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 15.75, Puncture = 15.75, Slash = 73.5 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.12 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.14,
				CritMultiplier = 2.1,
				Damage = { Impact = 17.4, Puncture = 17.4, Slash = 81.2 },
				FireRate = 1,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 20,
				ShotType = "Thrown",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.14,
				CritMultiplier = 2.1,
				Damage = { Blast = 190 },
				Falloff = { EndRange = 4.8, Reduction = 0.4, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.14,
				CritMultiplier = 2.1,
				Damage = { Blast = 380 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2.2,
				Damage = { Impact = 34.65, Puncture = 34.65, Slash = 161.7 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 30,
				ShotSpeed = 35,
				ShotType = "Thrown",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2.2,
				Damage = { Blast = 378 },
				Falloff = { EndRange = 4.8, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.16,
				CritMultiplier = 2.2,
				Damage = { Blast = 756 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 210 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Blast = 315 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Glaive",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Glaive.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Glaives/LightGlaive/LightGlaiveWeapon",
		Introduced = "7.9",
		Link = "Glaive",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Glaive",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 210,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	["Glaive Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 24.6, Puncture = 24.6, Slash = 114.8 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 27, Puncture = 27, Slash = 126 },
				FireRate = 1.25,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				Range = 50,
				ShotSpeed = 40,
				ShotType = "Thrown",
				StatusChance = 0.32 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 296 },
				Falloff = { EndRange = 4.8, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.32 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 592 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.32 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 54, Puncture = 54, Slash = 252 },
				FireRate = 0.833,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 50,
				ShotSpeed = 55,
				ShotType = "Thrown",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Blast = 592 },
				Falloff = { EndRange = 4.8, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.25,
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Blast = 1184 },
				Falloff = { EndRange = 4.8, Reduction = 0, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 328 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 492 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 0.7,
		Family = "Glaive",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "GlaivePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Glaives/PrimeGlaive/PrimeGlaiveWeapon",
		Introduced = "11",
		Link = "Glaive Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Glaive Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 328,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Gram = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 24, Puncture = 24, Slash = 112 },
				FireRate = 0.95,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 320 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.95,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 480 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.95,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Gram",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 960,
		Image = "Gram.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/GreatSword/GreatSword",
		Introduced = "6.2",
		Link = "Gram",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Gram",
		SellPrice = 5000,
		SlideAttack = 320,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Gram Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 60, Puncture = 15, Slash = 225 },
				FireRate = 0.8,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 600 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Blast = 900 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.8,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 0.75,
		Family = "Gram",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1800,
		Image = "GramPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeGram/PrimeGram",
		Introduced = "23.9",
		Link = "Gram Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Gram Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 600,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Guandao = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 50.5, Puncture = 10.1, Slash = 141.4 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.04 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 404 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 606 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "Guandao",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1212,
		Image = "Guandao.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/TnGuandaoPolearm/TnGuandaoPolearmWeapon",
		Introduced = "21.1",
		Link = "Guandao",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Guandao",
		Polarities = { "Vazarin", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 404,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Traits = { "Tenno" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	["Guandao Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 60, Puncture = 12, Slash = 168 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 480 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Blast = 720 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 6,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = false,
		Disposition = 0.7,
		Family = "Guandao",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1440,
		Image = "GuandaoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/PrimeGuandao/PrimeGuandaoWeapon",
		Introduced = "29.3",
		Link = "Guandao Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Guandao Prime",
		Polarities = { "Vazarin", "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 480,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Gunsen = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 12.8, Puncture = 19.2, Slash = 128 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 320 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 480 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		Disposition = 1.35,
		Family = "Gunsen",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 640,
		Image = "Gunsen.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Warfan/WarfanWeapon",
		Introduced = "22",
		Link = "Gunsen",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Gunsen",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 160,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Gunsen Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 9, Puncture = 13.5, Slash = 202.5 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 450 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 675 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.34 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		Disposition = 1,
		Family = "Gunsen",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 900,
		Image = "GunsenPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Warfan/PrimeGunsen/PrimeGunsenWeapon",
		Introduced = "33.6",
		Link = "Gunsen Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 1.9,
		Name = "Gunsen Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 225,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Halikar = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.17,
				CritMultiplier = 2,
				Damage = { Impact = 14.9, Puncture = 119.2, Slash = 14.9 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.29 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 16.3, Puncture = 130.4, Slash = 16.3 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.31 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 450 },
				Falloff = { EndRange = 4.9, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.17,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.31 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 450 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.31 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 32.7, Puncture = 261.6, Slash = 32.7 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 30,
				ShotSpeed = 40,
				ShotType = "Thrown",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 447 },
				Falloff = { EndRange = 4.9, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 894 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.17,
				CritMultiplier = 2,
				Damage = { Magnetic = 298 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.29 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.17,
				CritMultiplier = 2,
				Damage = { Magnetic = 447 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.29 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Halikar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Halikar.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnBoomerang/GrnBoomerang",
		Introduced = "15.0",
		Link = "Halikar",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 1.2,
		Name = "Halikar",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 298,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	["Halikar Wraith"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 22.5, Puncture = 180, Slash = 22.5 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 87.7, Puncture = 87.7, Slash = 87.7 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.39 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 329 },
				Falloff = { EndRange = 5.1, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.17,
				IsSilent = true,
				Range = 5.1,
				ShotType = "AoE",
				StatusChance = 0.39 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 658 },
				Falloff = { EndRange = 5.1, Reduction = 0, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5.1,
				ShotType = "AoE",
				StatusChance = 0.39 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Impact = 52.7, Puncture = 421.6, Slash = 22.7 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 30,
				ShotSpeed = 40,
				ShotType = "Thrown",
				StatusChance = 0.41 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Blast = 657 },
				Falloff = { EndRange = 5.1, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 5.1,
				ShotType = "AoE",
				StatusChance = 0.41 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Blast = 1314 },
				Falloff = { EndRange = 5.1, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5.1,
				ShotType = "AoE",
				StatusChance = 0.41 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Magnetic = 450 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.29 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Magnetic = 675 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.29 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Halikar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "HalikarWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnBoomerang/HalikarWraithWeapon",
		Introduced = "29.10.10",
		Link = "Halikar Wraith",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 1.15,
		Name = "Halikar Wraith",
		Polarities = { "Madurai", "Naramon", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 450,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Grineer", "Wraith", "Baro" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Harmony = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Puncture = 168, Slash = 72 },
				FireRate = 1.083,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Impact = 480 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Blast = 720 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = false,
		Disposition = 0.6,
		Family = "Harmony",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1440,
		Image = "Harmony.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/TnChoirScythe/TnChoirScythe",
		Introduced = "36",
		Link = "Harmony",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Harmony",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 480,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Hate = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Impact = 34.5, Puncture = 34.5, Slash = 161 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Spectral Blade",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Impact = 19.5, Puncture = 19.5, Slash = 91 },
				FireRate = 0.917,
				IsSilent = true,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Spectral Blade Explosion",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Heat = 130 },
				EmbedDelay = 0.4,
				Falloff = { EndRange = 3, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				IsSilent = true,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Impact = 460 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Blast = 690 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Hate",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1380,
		Image = "Hate.png",
		IncarnonDuration = 180,
		IncarnonImage = "HateIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/StalkerScytheWeapon",
		Introduced = "8.0",
		Link = "Hate",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Hate",
		SellPrice = 5000,
		SlideAttack = 460,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Stalker" },
		Users = { "Stalker" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Heat Dagger"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 1.6,
				Damage = { Heat = 62, Impact = 14, Puncture = 76, Slash = 56 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.14 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 1.6,
				Damage = { Heat = 416 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact", "Heat" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 1.6,
				Damage = { Heat = 624 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.44,
		Family = "Heat Dagger",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 416,
		Image = "HeatDagger.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Dagger/Dagger",
		Introduced = "5.0",
		Link = "Heat Dagger",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Heat Dagger",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 416,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Malice" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Heat Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 14.7, Puncture = 14.7, Slash = 117.6 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Heat = 294 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact", "Heat" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Heat = 441 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.2 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.48,
		Family = "Heat Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 735,
		Image = "HeatSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/HeatSword/HeatLongSword",
		Introduced = "5.0",
		Link = "Heat Sword",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Heat Sword",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 147,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Volt Specter", "Ember Specter" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Heliocor = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2,
				Damage = { Impact = 238, Puncture = 28, Slash = 14 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.12 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2,
				Damage = { Impact = 560 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2,
				Damage = { Blast = 840 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Heliocor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1680,
		Image = "Heliocor.png",
		InternalName = "/Lotus/Weapons/Cephalon/Melee/Hammer/CephHammerWeapon",
		Introduced = "Update: Specters of the Rail 1",
		Link = "Heliocor",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Heliocor",
		SellPrice = 5000,
		SlideAttack = 560,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Cephalon Simaris" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Hespar = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 112, Puncture = 33.6, Slash = 134.4 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 560 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 840 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Heavy Scythe",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY SCYTHE_STANCE" },
		Conclave = false,
		Disposition = 1.05,
		Family = "Hespar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 5040,
		Image = "Hespar.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/HeavyScythe/DuviriScythe/DuviriHeavyScytheWeapon",
		Introduced = "31.5",
		Link = "Hespar",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Hespar",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 560,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 0,
		Traits = { "Duviri" },
		Users = { "Thrax Centurion" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Hirudo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 19.5, Puncture = 104, Slash = 6.5 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.11 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 260 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Blast = 390 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		DefaultUpgrades = {
			"/Lotus/Weapons/Infested/Melee/InfWFAccompanyingSparring/InfestedKogakeUpgrade" 
		},
		Disposition = 1.15,
		Family = "Hirudo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 845,
		Image = "Hirudo.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/InfWFAccompanyingSparring/InfestedKogake",
		Introduced = "19.5",
		Link = "Hirudo",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Hirudo",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Innodem = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 36, Puncture = 144, Slash = 180 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Dagger Projectile",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Radiation = 360 },
				Falloff = { EndRange = 20, Reduction = 0.7222, StartRange = 12 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 21,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 720 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 1080 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Upgrades/Evolutions/Melee/Dagger/ZarimanDaggerTransform",
			"/Lotus/Upgrades/Evolutions/Melee/Dagger/EvoDaggerVoidFinisherBuff" 
		},
		Disposition = 0.65,
		Family = "Innodem",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 720,
		Image = "Innodem.png",
		InternalName = "/Lotus/Weapons/Tenno/Zariman/Melee/Dagger/ZarimanDaggerWeapon",
		Introduced = "31.6",
		Link = "Innodem",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 1.8,
		Name = "Innodem",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 720,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Zariman", "Incarnon" },
		WindUp = 0.4 
	},
	["Iron Staff"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 204, Slash = 96 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 600 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Blast = 900 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Primal Fury" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1500,
		Image = "IronStaff.png",
		InternalName = "/Lotus/Powersuits/MonkeyKing/MonkeyKingStaff",
		Introduced = "23.0",
		Link = "Iron Staff",
		MaxRank = 30,
		MeleeRange = 3.5,
		Name = "Iron Staff",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.1,
		Traits = { "Tenno" },
		Users = { "Wukong", "Wukong Prime" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Iron Staff Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 204, Slash = 96 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 600 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Blast = 900 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Primal Fury" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1500,
		Image = "IronStaffPrime.png",
		InternalName = "/Lotus/Powersuits/MonkeyKing/WukongPrimeStaff",
		Introduced = "25.3",
		Link = "Iron Staff",
		MaxRank = 30,
		MeleeRange = 3.5,
		Name = "Iron Staff Prime",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.1,
		Traits = { "Tenno" },
		Users = { "Wukong Prime" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Jat Kittag"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 160, Puncture = 30, Slash = 10 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 400 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Jat Kittag",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1200,
		Image = "JatKittag.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerJetPoweredPolearm/GrineerJetPolearm",
		Introduced = "12.0",
		Link = "Jat Kittag",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Jat Kittag",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Grineer" },
		Users = { "Bailiff", "Vay Molta" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Jat Kusar"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Heat = 81, Impact = 79, Puncture = 13, Slash = 45 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.19 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Heat = 436 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.19 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Heat = 654 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.19 
			} 
		},
		BlockAngle = 60,
		Class = "Blade and Whip",
		ComboDur = 5,
		CompatibilityTags = { "BLADE_AND_WHIP_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Jat Kusar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 872,
		Image = "JatKusar.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnKusarigama/GrnKusarigamaWeapon",
		Introduced = "21.2",
		Link = "Jat Kusar",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Jat Kusar",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 218,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Jaw Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 6, Puncture = 24, Slash = 90 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Jaw Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 600,
		Image = "JawSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/JawSword/JawLongSword",
		Introduced = "5.0",
		Link = "Jaw Sword",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Jaw Sword",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 120,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Kama = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Impact = 13.5, Puncture = 13.5, Slash = 63 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Impact = 180 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Blast = 270 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.47,
		Family = "Kama",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 540,
		Image = "Kama.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/DualKamas/SingleKama",
		Introduced = "10.0",
		Link = "Kama",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Kama",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 180,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Karyst = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 30, Puncture = 84, Slash = 72, Toxin = 87 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 546 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Toxin = 819 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.26 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Karyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 546,
		Image = "Karyst.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/KrisDagger/KrisDagger",
		Introduced = "14.2",
		Link = "Karyst",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Karyst",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 546,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Saryn Specter" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Karyst Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 50, Puncture = 96, Slash = 102, Toxin = 96 },
				FireRate = 0.667,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 688 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Toxin = 1032 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.26 
			} 
		},
		BlockAngle = 50,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = false,
		Disposition = 1.15,
		Family = "Karyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 688,
		Image = "KarystPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeKaryst/PrimeKrisDagger",
		Introduced = "28.2",
		Link = "Karyst Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.2,
		Name = "Karyst Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 688,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Keratinos = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Impact = 79, Puncture = 45, Slash = 87, Viral = 33 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.29 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Impact = 488 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Viral = 732 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = false,
		Disposition = 1.05,
		Family = "Keratinos",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 1708,
		Image = "Keratinos.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/InfTransformClaw/InfTransformClawsWeapon",
		Introduced = "29",
		Link = "Keratinos",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Keratinos",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 732,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Infested" },
		WindUp = 0.8,
		_TooltipAttackDisplay = 1 
	},
	Kesheg = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Impact = 96.4, Puncture = 24.1, Slash = 120.5 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.23 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Blast = 482 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.5,
				Damage = { Blast = 723 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Kesheg",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1446,
		Image = "Kesheg.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerHalberd/GrnHalberd",
		Introduced = "19.0",
		Link = "Kesheg",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Kesheg",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 482,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Traits = { "Grineer" },
		Users = { "Kuva Guardian" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Kestrel = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 58.8, Puncture = 12.6, Slash = 12.6 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.12,
				CritMultiplier = 2.1,
				Damage = { Impact = 73.6, Puncture = 9.2, Slash = 9.2 },
				FireRate = 1.08,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.12 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.12,
				CritMultiplier = 2.1,
				Damage = { Blast = 126 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.08,
				IsSilent = true,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.12 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.12,
				CritMultiplier = 2.1,
				Damage = { Blast = 252 },
				Falloff = { EndRange = 3.6, Reduction = 0, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.12 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Impact = 147.2, Puncture = 18.4, Slash = 18.4 },
				FireRate = 0.833,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 30,
				ShotSpeed = 40,
				ShotType = "Thrown",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Blast = 252 },
				Falloff = { EndRange = 4, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Blast = 504 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Magnetic = 168 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Magnetic = 252 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Kestrel",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Kestrel.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Glaives/Boomerang/BoomerangWeapon",
		Introduced = "8.1",
		Link = "Kestrel",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 1.2,
		Name = "Kestrel",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 168,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	["Kestrel Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Impact = 157.5, Puncture = 21, Slash = 31.5 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.22,
				CritMultiplier = 2.1,
				Damage = { Impact = 184, Puncture = 23, Slash = 23 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.22,
				CritMultiplier = 2.1,
				Damage = { Blast = 315 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.12,
				CritMultiplier = 2.1,
				Damage = { Blast = 630 },
				Falloff = { EndRange = 3.6, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 368, Puncture = 46, Slash = 46 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				PunchThrough = 1,
				Range = 30,
				ShotSpeed = 40,
				ShotType = "Thrown",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 630 },
				Falloff = { EndRange = 4, Reduction = 0.4, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 1260 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Magnetic = 420 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Magnetic = 630 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 0.75,
		Family = "Kestrel",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "KestrelPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Glaives/PrimeKestrel/PrimeKestrel",
		Introduced = "41",
		Link = "Kestrel Prime",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 1.2,
		Name = "Kestrel Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Kogake = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 84, Puncture = 18, Slash = 18 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		Disposition = 1.46,
		Family = "Kogake",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 1440,
		Image = "Kogake.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/BrassKnuckles/BrassKnuckles",
		Introduced = "8.2",
		Link = "Kogake",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Kogake",
		SellPrice = 5000,
		SlideAttack = 240,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Kogake Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Impact = 169.4, Puncture = 36.3, Slash = 36.3 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.38 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Impact = 484 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Blast = 726 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Kogake",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 2904,
		Image = "KogakePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeKogake/KogakePrimeKnuckles",
		Introduced = "22.7",
		Link = "Kogake Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Kogake Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 484,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Korrudo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.31,
				CritMultiplier = 2.5,
				Damage = { Impact = 110.01, Puncture = 5.79, Slash = 77.2 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.09 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.5,
				Damage = { Impact = 386 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.5,
				Damage = { Blast = 579 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Korrudo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 2065,
		Image = "Korrudo.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnSparring/GrnSpiderSparring/GrnSpiderSparring",
		Introduced = "24.6",
		Link = "Korrudo",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Korrudo",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 386,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Korumm = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 52, Puncture = 104, Slash = 104 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Tactical Combo Slam Attack",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Electricity = 1040 },
				Falloff = { EndRange = 10, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 520 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 780 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Korumm",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1560,
		Image = "Korumm.png",
		InternalName = "/Lotus/Weapons/Archon/Melee/Trident/ArchonTridentPlayerWep",
		Introduced = "31",
		Link = "Korumm",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Korumm",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 520,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Sentient" },
		Users = { "Archon Boreal" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Kreska = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Heat = 100, Impact = 30, Puncture = 15, Slash = 45 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Heat = 380 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Heat = 570 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = false,
		Disposition = 1.35,
		Family = "Kreska",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1140,
		Image = "Kreska.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/CrpVenusHatchet/CrpVenusHatchet",
		Introduced = "24",
		Link = "Kreska",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Kreska",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 380,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		Users = { "Terra Trencher" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Krohkur = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.29,
				CritMultiplier = 2.3,
				Damage = { Impact = 26, Puncture = 39.1, Slash = 151.9 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.19 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.29,
				CritMultiplier = 2.3,
				Damage = { Impact = 434 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.29,
				CritMultiplier = 2.3,
				Damage = { Blast = 651 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Krohkur",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1085,
		Image = "Krohkur.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnEgyptSwd/GrnEgyptSwdWeapon",
		Introduced = "22",
		Link = "Krohkur",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Krohkur",
		SellPrice = 5000,
		SlideAttack = 217,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Kronen = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 13, Puncture = 13, Slash = 104 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 260 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Blast = 390 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = true,
		Disposition = 1.43,
		Family = "Kronen",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 520,
		Image = "Kronen.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Tonfa/TonfaContestWinner/TennoTonfa",
		Introduced = "14.5",
		Link = "Kronen",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Kronen",
		SellPrice = 5000,
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Kronen Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 21.2, Puncture = 21.2, Slash = 169.6 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 424 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 636 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = true,
		Disposition = 0.7,
		Family = "Kronen",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 848,
		Image = "KronenPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Tonfa/TonfaContestWinnerPrime/TonfaContestWinnerPrimeWeapon",
		Introduced = "22.16.4",
		Link = "Kronen Prime",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Kronen Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 424,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Kuva Ghoulsaw"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Impact = 40.09, Puncture = 48.53, Slash = 122.38 },
				FireRate = 1.2,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Impact = 422 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Blast = 633 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Assault Saw",
		ComboDur = 5,
		CompatibilityTags = { "BLADESAW_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.7,
		Family = "Ghoulsaw",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 1,
		HeavyAttack = 1266,
		Image = "KuvaGhoulsaw.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnGhoulSaw/GrnKuvaGhoulSawPlayer",
		Introduced = "42",
		Link = "Kuva Ghoulsaw",
		Mastery = 13,
		MaxRank = 40,
		MeleeRange = 2.15,
		Name = "Kuva Ghoulsaw",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 422,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Users = { "Kuva Lich" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Kuva Shildeg"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.31,
				CritMultiplier = 2.7,
				Damage = { Impact = 75.85, Puncture = 100.45, Slash = 28.7 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.27 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.7,
				Damage = { Impact = 410 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.7,
				Damage = { Blast = 615 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.8,
		Family = "Kuva Shildeg",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1230,
		Image = "KuvaShildeg.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnKuvaLichScythe/GrnKuvaLichScytheWeapon",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Shildeg",
		Mastery = 13,
		MaxRank = 40,
		MeleeRange = 3,
		Name = "Kuva Shildeg",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 410,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Users = { "Kuva Lich" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Lacera = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Electricity = 100, Impact = 12, Puncture = 38, Slash = 66 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.45 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Electricity = 432 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.45 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Electricity = 648 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.45 
			} 
		},
		BlockAngle = 60,
		Class = "Blade and Whip",
		ComboDur = 5,
		CompatibilityTags = { "BLADE_AND_WHIP_STANCE" },
		Conclave = true,
		Disposition = 1.31,
		Family = "Lacera",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 864,
		Image = "Lacera.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/StalkerMios/StalkerMios",
		Introduced = "18.0",
		Link = "Lacera",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Lacera",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 216,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Mania" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Landslide Fists"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 350 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.15 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Landslide" },
		Family = "Landslide Fists",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 450,
		HeavySlamAttack = 300,
		HeavySlamRadius = 0,
		Image = "Landslide130xWhite.png",
		InternalName = "/Lotus/Powersuits/Brawler/AtlasPunchWeapon",
		Introduced = "38.5",
		Link = "Landslide Fists",
		MaxRank = 30,
		MeleeRange = 4,
		Name = "Landslide Fists",
		Polarities = { "Madurai", "Madurai" },
		SlamAttack = 300,
		SlamRadius = 0,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Atlas" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Landslide Fists Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 350 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.15 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Landslide" },
		Family = "Landslide Fists",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 450,
		HeavySlamAttack = 300,
		HeavySlamRadius = 0,
		Image = "Landslide130xWhite.png",
		InternalName = "/Lotus/Powersuits/Brawler/AtlasPunchWeaponPrime",
		Introduced = "38.5",
		Link = "Landslide Fists",
		MaxRank = 30,
		MeleeRange = 4,
		Name = "Landslide Fists Prime",
		Polarities = { "Madurai", "Madurai" },
		SlamAttack = 300,
		SlamRadius = 0,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Prime" },
		Users = { "Atlas Prime" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Lecta = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 56, Puncture = 20, Slash = 25 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 202 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 303 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Lecta",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 455,
		Image = "Lecta.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Whip/CorpusWhipWeapon",
		Introduced = "11.0",
		Link = "Lecta",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Lecta",
		SellPrice = 5000,
		SlideAttack = 202,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		Users = { "Scrambus", "Comba", "Pelna Cade", "Jad Teran" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Lesion = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 47.4, Puncture = 11.85, Slash = 177.75 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.37 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 474 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 711 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Infested/Melee/TipedoStaff/InfTipedoProcMeleeMod" },
		Disposition = 0.85,
		Family = "Lesion",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1422,
		HeavySlamAttack = 711,
		HeavySlamElement = "Blast",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 8,
		Image = "Lesion.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/TipedoStaff/InfTipedoStaff",
		Introduced = "18.5",
		Link = "Lesion",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Lesion",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlamAttack = 474,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 7,
		SlideAttack = 474,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Machete = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 18, Puncture = 18, Slash = 84 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Machete",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 720,
		Image = "Machete.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerMachetteAndCleaver/Machete",
		Introduced = "8.0",
		Link = "Machete",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Machete",
		SellPrice = 5000,
		SlideAttack = 240,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Scorpion" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Machete Wraith"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 31.65, Puncture = 31.65, Slash = 147.7 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Machete",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1268,
		Image = "MacheteWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerMachetteAndCleaver/WraithMacheteWeapon",
		Introduced = "10.5",
		Link = "Machete Wraith",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Machete Wraith",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 422,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Wraith", "Grineer" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Magistar = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 168, Puncture = 31.5, Slash = 10.5 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 420 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 630 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Magistar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1260,
		Image = "Magistar.png",
		IncarnonDuration = 180,
		IncarnonImage = "MagistarIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Maces/PaladinMace/PaladinMaceWeapon",
		Introduced = "11.5",
		Link = "Magistar",
		Mastery = 1,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Magistar",
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Masseter = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Impact = 134.96, Slash = 106.04 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Impact = 482 },
				Falloff = { EndRange = 10, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Blast = 723 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Swords/TnChiselKanabo/GrendelInnateUpgrade" },
		Disposition = 1.25,
		Family = "Masseter",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1446,
		Image = "Masseter.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TnChiselKanabo/TnChiselKanabo",
		Introduced = "26",
		Link = "Masseter",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Masseter",
		SellPrice = 5000,
		SlideAttack = 482,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Masseter Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 145.6, Slash = 114.4 },
				FireRate = 1.083,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 520 },
				Falloff = { EndRange = 10, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Blast = 780 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Swords/TnChiselKanabo/GrendelInnateUpgrade" },
		Disposition = 1,
		Family = "Masseter",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1560,
		Image = "MasseterPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeMasseter/PrimeMasseter",
		Introduced = "34",
		Link = "Masseter Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Masseter Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 520,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime", "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Mios = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Impact = 53.1, Puncture = 44.25, Slash = 79.65 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Toxin = 354 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Toxin = 531 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Blade and Whip",
		ComboDur = 5,
		CompatibilityTags = { "BLADE_AND_WHIP_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Mios",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 708,
		Image = "Mios.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Swords/Mios/Mios",
		Introduced = "17.11",
		Link = "Mios",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Mios",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 177,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Mire = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.09,
				CritMultiplier = 1.5,
				Damage = { Impact = 23, Puncture = 23, Slash = 47, Toxin = 65 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.31 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.09,
				CritMultiplier = 1.5,
				Damage = { Toxin = 316 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact", "Toxin" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.31 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.09,
				CritMultiplier = 1.5,
				Damage = { Toxin = 474 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Toxin", "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.31 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Mire",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 790,
		Image = "Mire.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Swords/Mire/MireSword",
		Introduced = "7.7.2",
		Link = "Mire",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Mire",
		SellPrice = 5000,
		SlideAttack = 158,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Bo"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 81, Puncture = 9 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 180 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 270 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Bo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 450,
		Image = "MK1-Bo.png",
		IncarnonDuration = 180,
		IncarnonImage = "BoIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Bo",
		Introduced = "14.0",
		Link = "Mk1-Bo",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Mk1-Bo",
		Polarities = { "Vazarin" },
		SellPrice = 2500,
		SlideAttack = 90,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Furax"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 63, Puncture = 13.5, Slash = 13.5 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 180 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 270 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		Disposition = 1.45,
		Family = "Furax",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 450,
		Image = "MK1-Furax.png",
		IncarnonDuration = 180,
		IncarnonImage = "FuraxIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Furax",
		Introduced = "14.0",
		Link = "Mk1-Furax",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Mk1-Furax",
		SellPrice = 2500,
		SlideAttack = 270,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Nami Skyla"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 18.75, Puncture = 18.75, Slash = 87.5 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 250 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Blast = 375 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Nami Skyla",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 500,
		Image = "NamiSkyla.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/CutlassAndPoignard/CutlassPoignardSwords",
		Introduced = "13.0",
		Link = "Nami Skyla",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Nami Skyla",
		SellPrice = 5000,
		SlideAttack = 250,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Nami Skyla Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 18, Puncture = 36, Slash = 126 },
				FireRate = 1.33,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1,
		Family = "Nami Skyla",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 720,
		Image = "NamiSkylaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeNamiSkyla/PrimeNamiSkyla",
		Introduced = "21.6",
		Link = "Nami Skyla Prime",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Nami Skyla Prime",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Nami Solo"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 25.8, Puncture = 25.8, Slash = 120.4 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 344 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 516 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.43,
		Family = "Nami Solo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1032,
		Image = "NamiSolo.png",
		IncarnonDuration = 180,
		IncarnonImage = "NamiSoloIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/CutlassAndPoignard/TennoCutlass",
		Introduced = "13.5",
		Link = "Nami Solo",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Nami Solo",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 344,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Nepheri = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Heat = 92, Impact = 21, Puncture = 63, Slash = 85 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Fireballs",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Heat = 131 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				Range = 20,
				ShotSpeed = 100,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 522 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 783 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = false,
		Disposition = 1,
		Family = "Nepheri",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 522,
		Image = "Nepheri.png",
		InternalName = "/Lotus/Weapons/Archon/Melee/DualDaggers/ArchonDualDaggersPlayerWep",
		Introduced = "31",
		Link = "Nepheri",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 1.9,
		Name = "Nepheri",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 522,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.35,
		Traits = { "Sentient" },
		Users = { "Archon Amar" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Nikana = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 7.1, Puncture = 14.2, Slash = 120.7 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 284 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 426 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = true,
		Disposition = 0.95,
		Family = "Nikana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 710,
		Image = "Nikana.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/KatanaAndWakizashi/Katana",
		Introduced = "13.0",
		Link = "Nikana",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Nikana",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 284,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Nikana Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Impact = 9.9, Puncture = 9.9, Slash = 178.2 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Impact = 396 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Blast = 594 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = true,
		Disposition = 0.6,
		Family = "Nikana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 990,
		Image = "NikanaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeKatana/PrimeNikana",
		Introduced = "18.4.12",
		Link = "Nikana Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Nikana Prime",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 396,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Ninkondi = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Electricity = 100, Impact = 90 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Electricity = 380 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Electricity = 570 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.35 
			} 
		},
		BlockAngle = 55,
		Class = "Nunchaku",
		ComboDur = 5,
		CompatibilityTags = { "NUNCHAKU_STANCE" },
		Conclave = true,
		Disposition = 1.41,
		Family = "Ninkondi",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 950,
		Image = "Ninkondi.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Nunchaku/Nunchaku/Nunchaku",
		Introduced = "17.4",
		Link = "Ninkondi",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.31,
		Name = "Ninkondi",
		SellPrice = 5000,
		SlideAttack = 380,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Ninkondi Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 90, Impact = 66, Puncture = 28, Slash = 50 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 468 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 702 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.36 
			} 
		},
		BlockAngle = 55,
		Class = "Nunchaku",
		ComboDur = 5,
		CompatibilityTags = { "NUNCHAKU_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Ninkondi",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 1170,
		Image = "NinkondiPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeNinkondi/PrimeNikondi",
		Introduced = "25.3",
		Link = "Ninkondi Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.31,
		Name = "Ninkondi Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 468,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Obex = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 84, Puncture = 18, Slash = 18 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Electricity = 240 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Electricity = 360 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Obex",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 1440,
		Image = "Obex.png",
		IncarnonDuration = 180,
		IncarnonImage = "ObexIncarnon.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/KickAndPunch/KickPunchWeapon",
		Introduced = "10.7",
		Link = "Obex",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Obex",
		SellPrice = 5000,
		SlideAttack = 240,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		Users = { "Jen Dro" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Ohma = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Electricity = 110, Impact = 76, Slash = 38 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Electricity = 448 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 672 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Ohma",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 896,
		Image = "Ohma.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/CrpTonfa/CrpTonfa",
		Introduced = "19.7",
		Link = "Ohma",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Ohma",
		SellPrice = 5000,
		SlideAttack = 448,
		SlideElement = "Electricity",
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		Users = { "Tia Mayn" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Okina = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 63, Slash = 70 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Spectral Dagger",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 21, Puncture = 49, Slash = 70 },
				FireRate = 1.08,
				IsSilent = true,
				ShotSpeed = 18,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Spectral Dagger Explosion",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Cold = 140 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Cold" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 280 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 420 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Okina",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 280,
		Image = "Okina.png",
		IncarnonDuration = 180,
		IncarnonImage = "OkinaIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TennoSai/TennoSais",
		Introduced = "Specters of the Rail 0.0",
		Link = "Okina",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Okina",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 280,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Okina Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Impact = 9.2, Puncture = 64.4, Slash = 110.4 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Spectral Dagger",
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Impact = 27.6, Puncture = 64.4, Slash = 92 },
				FireRate = 1.17,
				IsSilent = true,
				ShotSpeed = 18,
				ShotType = "Projectile",
				StatusChance = 0.24 
			},
			{
				AttackIndex = 3,
				AttackName = "Spectral Dagger Explosion",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Cold = 184 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Cold" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.24 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Impact = 368 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Blast = 552 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Dual Daggers",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 0.7,
		Family = "Okina",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 368,
		Image = "OkinaPrime.png",
		IncarnonDuration = 180,
		IncarnonImage = "OkinaPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeOkina/PrimeOkina",
		Introduced = "35.5.9",
		Link = "Okina Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Okina Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 368,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Orthos = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Impact = 27.75, Puncture = 27.75, Slash = 129.5 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Blast = 370 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.06,
				CritMultiplier = 1.5,
				Damage = { Blast = 555 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1,
		Family = "Orthos",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1110,
		Image = "Orthos.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/PolearmWeapon",
		Introduced = "8.1",
		Link = "Orthos",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Orthos",
		SellPrice = 5000,
		SlideAttack = 370,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.15,
		Traits = { "Tenno" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	["Orthos Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 35.1, Puncture = 35.1, Slash = 163.8 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 468 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 702 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 0.7,
		Family = "Orthos",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1404,
		Image = "OrthosPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/PrimePolearmWeapon",
		Introduced = "9.0",
		Link = "Orthos Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Orthos Prime",
		SellPrice = 5000,
		SlideAttack = 468,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Orvius = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 39, Puncture = 9.75, Slash = 146.25 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Impact = 43, Puncture = 10.75, Slash = 161.25 },
				FireRate = 0.75,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 35,
				ShotType = "Thrown",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Blast = 293 },
				Falloff = { EndRange = 4, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.75,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Blast = 586 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Cold" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 85.75, Puncture = 21.5, Slash = 321.75 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 30,
				ShotSpeed = 35,
				ShotType = "Thrown",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Cold = 585 },
				Falloff = { EndRange = 4, Reduction = 0.4, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Cold = 1170 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Cold" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 8,
				AttackName = "Hover Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Cold = 75 },
				EffectDuration = 3,
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.6 
			},
			{
				AttackIndex = 9,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 390 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 10,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Blast = 585 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Orvius",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Orvius.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Glaives/TeshinGlaive/TnTeshinGlaiveWep",
		Introduced = "19.0",
		Link = "Orvius",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.3,
		Name = "Orvius",
		Polarities = { "Naramon", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 390,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Users = { "Teshin" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	["Pangolin Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 12.4, Puncture = 37.2, Slash = 198.4 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 496 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Blast = 744 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = false,
		Disposition = 1.05,
		Family = "Pangolin Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1240,
		Image = "PangolinPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimePangolinSword/PrimePangolinSword",
		Introduced = "27.3.6",
		Link = "Pangolin Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Pangolin Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 248,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Pangolin Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 7.5, Puncture = 22.5, Slash = 120 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Puncture = 300 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact", "Slash" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Blast = 450 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.47,
		Family = "Pangolin Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 750,
		Image = "PangolinSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PangolinSword/PangolinLongSword",
		Introduced = "5.0",
		Link = "Pangolin Sword",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Pangolin Sword",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 150,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Paracesis = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.31,
				CritMultiplier = 2.6,
				Damage = { Impact = 48.8, Puncture = 17.8, Slash = 155.4 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.6,
				Damage = { Impact = 444 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.12 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.31,
				CritMultiplier = 2.6,
				Damage = { Blast = 666 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 0.65,
		Family = "Paracesis",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1332,
		Image = "Paracesis.png",
		InternalName = "/Lotus/Weapons/Orokin/BallasSword/BallasSwordWeapon",
		Introduced = "23.10",
		Link = "Paracesis",
		Mastery = 10,
		MaxRank = 40,
		MeleeRange = 2.9,
		Name = "Paracesis",
		SlideAttack = 444,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Orokin" },
		Users = { "Ballas" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Pathocyst = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2.1,
				Damage = { Impact = 57, Puncture = 55, Slash = 61, Viral = 89 },
				FireRate = 0.667,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Impact = 49, Puncture = 43, Slash = 78, Viral = 118 },
				FireRate = 0.667,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Viral = 393 },
				Falloff = { EndRange = 4.9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Viral = 786 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact", "Viral" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Impact = 127, Puncture = 121, Slash = 135, Viral = 193 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 30,
				ShotSpeed = 30,
				ShotType = "Thrown",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Viral = 786 },
				Falloff = { EndRange = 4.9, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Viral = 1572 },
				Falloff = { EndRange = 4.9, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact", "Viral" },
				IsSilent = true,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2.1,
				Damage = { Viral = 524 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2.1,
				Damage = { Viral = 786 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		ComboDur = 5,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = false,
		Disposition = 1.3,
		Family = "Pathocyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		Image = "Pathocyst.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/InfBoomerang/InfBoomerangWeapon",
		Introduced = "25.7.7",
		Link = "Pathocyst",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1.3,
		Name = "Pathocyst",
		Polarities = { "Madurai", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 524,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Infested" },
		Users = { "Zealoid Prelate" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Pennant = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 20, Puncture = 140, Slash = 40 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Two-Handed Nikana",
		ComboDur = 5,
		CompatibilityTags = { "LONG_KATANA_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Swords/TnRailjackGreatKatana/TnRailJackGreatKatanaInnateUpgrade" 
		},
		Disposition = 0.95,
		Family = "Pennant",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1200,
		Image = "Pennant.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TnRailjackGreatKatana/TnRailJackGreatKatanaWeapon",
		Introduced = "27.0",
		Link = "Pennant",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Pennant",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Plasma Sword"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Electricity = 66, Impact = 34, Puncture = 12, Slash = 88 },
				FireRate = 0.667,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Electricity = 400 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact", "Electricity" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Electricity = 600 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.48,
		Family = "Plasma Sword",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1000,
		Image = "PlasmaSword.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PlasmaSword/PlasmaLongSword",
		Introduced = "5.0",
		Link = "Plasma Sword",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Plasma Sword",
		SellPrice = 5000,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Praedos = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 20, Slash = 160 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Upgrades/Evolutions/Melee/ZarimanTonfaTransform",
			"/Lotus/Upgrades/Evolutions/Melee/EvoTonfaHeavyEfficiency" 
		},
		Disposition = 0.6,
		Family = "Praedos",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 800,
		Image = "Praedos.png",
		InternalName = "/Lotus/Weapons/Tenno/Zariman/Melee/Tonfas/ZarimanTonfaWeapon",
		Introduced = "31.5",
		Link = "Praedos",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Praedos",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Zariman", "Incarnon" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Pride = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Puncture = 125, Slash = 125 },
				FireRate = 1.2,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Heavy Scythe",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY SCYTHE_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/HeavyScythe/TnOrionSiriusScythe/TnSiriusInnateBuff" 
		},
		Disposition = 0.5,
		Family = "Pride",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 4500,
		Image = "Pride.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/HeavyScythe/TnOrionSiriusScythe/TnSiriusScytheWeapon",
		Introduced = "43",
		Link = "Pride",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Pride",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 0,
		Traits = { "Tenno" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Dual Cleavers"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 13.3, Puncture = 13.3, Slash = 106.4 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 266 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Blast = 399 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Dual Cleavers",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 532,
		Image = "PrismaDualCleavers.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerMachetteAndCleaver/PrismaDualCleavers",
		Introduced = "16.11.3",
		Link = "Prisma Dual Cleavers",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Prisma Dual Cleavers",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 266,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Machete"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.9,
				Damage = { Impact = 28.95, Puncture = 28.95, Slash = 135.1 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.31 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.9,
				Damage = { Impact = 386 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.9,
				Damage = { Blast = 579 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = false,
		Disposition = 1.45,
		Family = "Machete",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 756,
		Image = "PrismaMachete.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerMachetteAndCleaver/PrismaMachete",
		Introduced = "30.3.5",
		Link = "Prisma Machete",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Prisma Machete",
		SellPrice = 5000,
		SlideAttack = 386,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 1,
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Obex"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 105, Puncture = 22.5, Slash = 22.5 },
				FireRate = 1.33,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Electricity = 300 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Electricity = 450 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sparring",
		ComboDur = 5,
		CompatibilityTags = { "SPARRING_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Obex",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 1800,
		Image = "PrismaObex.png",
		IncarnonDuration = 180,
		IncarnonImage = "ObexIncarnon.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/KickAndPunch/PrismaObex",
		Introduced = "20.4.2",
		Link = "Prisma Obex",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Prisma Obex",
		SellPrice = 5000,
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Ohma"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Electricity = 124, Impact = 82, Slash = 44 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Electricity = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = false,
		Disposition = 0.95,
		Family = "Ohma",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1000,
		Image = "PrismaOhma.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/CrpTonfa/CrpPrismaTonfa",
		Introduced = "33.6.3",
		Link = "Prisma Ohma",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Prisma Ohma",
		Polarities = { "Naramon", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Prisma Skana"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 25.5, Puncture = 25.5, Slash = 119 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Skana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 850,
		Image = "PrismaSkana.png",
		IncarnonDuration = 180,
		IncarnonImage = "PrismaSkanaIncarnon.png",
		InternalName = "/Lotus/Weapons/VoidTrader/PrismaSkana",
		Introduced = "16.6.2",
		Link = "Prisma Skana",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Prisma Skana",
		SellPrice = 5000,
		SlideAttack = 170,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Prova = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Electricity = 76, Impact = 52 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Electricity = 256 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Electricity = 384 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.16 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.4,
		Family = "Prova",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 768,
		Image = "Prova.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/ElectroProd",
		Introduced = "8.0",
		Link = "Prova",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Prova",
		SellPrice = 5000,
		SlideAttack = 256,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		Users = { "Prod Crewman", "Nako Xol", "Ved Xol", "John Prodman" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Prova Vandal"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Electricity = 118, Impact = 80 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Electricity = 396 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact", "Electricity" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Blast = 594 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Prova",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1188,
		Image = "ProvaVandal.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/VandalElectroProd",
		Introduced = "10.5",
		Link = "Prova Vandal",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Prova Vandal",
		SellPrice = 5000,
		SlideAttack = 396,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Corpus", "Vandal" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Pulmonars = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 193, Viral = 97 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Viral = 580 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Viral = 870 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		BlockAngle = 55,
		Class = "Nunchaku",
		ComboDur = 9,
		CompatibilityTags = { "NUNCHAKU_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Pulmonars",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 1450,
		Image = "Pulmonars.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Nunchaku/InfNunchuck/InfNunchuck",
		Introduced = "29.5",
		Link = "Pulmonars",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.51,
		Name = "Pulmonars",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 580,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Infested" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Pupacyst = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Impact = 139, Viral = 145 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.27 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Impact = 296.622, Viral = 271.378 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.29 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Impact = 387.27, Toxin = 464.73 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.37 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Pupacyst",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1704,
		Image = "Pupacyst.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Staff/InfStaff/InfStaff",
		Introduced = "23.10",
		Link = "Pupacyst",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Pupacyst",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 568,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Quassus = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 27.6, Puncture = 46, Slash = 156.4 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.12 
			},
			{
				AttackIndex = 2,
				AttackName = "First Heavy Attack - Ethereal Daggers",
				ChargeTime = 0.49,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Puncture = 76, Slash = 114 },
				FireRate = 2,
				ForcedProcs = { "Slash" },
				IsSilent = true,
				Multishot = 12,
				PunchThrough = 2,
				Range = 35,
				ShotSpeed = 46,
				ShotType = "Projectile",
				StatusChance = 0.01,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Second Heavy Attack - Ethereal Daggers",
				ChargeTime = 0.49,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Puncture = 152, Slash = 228 },
				FireRate = 2,
				ForcedProcs = { "Slash" },
				IsSilent = true,
				Multishot = 6,
				PunchThrough = 2,
				Range = 35,
				ShotSpeed = 46,
				ShotType = "Projectile",
				StatusChance = 0.02,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 460 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Blast = 690 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Warfan/TnBrokenFrameWarfan/TnBrokenFrameWarfanInnateMod" 
		},
		Disposition = 1.15,
		Family = "Quassus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 920,
		Image = "Quassus.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Warfan/TnBrokenFrameWarfan/TnBrokenFrameWarfanWeapon",
		Introduced = "29",
		Link = "Quassus",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Quassus",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 230,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Quassus Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Impact = 26, Puncture = 52, Slash = 182 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "First Heavy Attack - Ethereal Daggers",
				ChargeTime = 0.49,
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Puncture = 76, Slash = 114 },
				FireRate = 2,
				ForcedProcs = { "Slash" },
				IsSilent = true,
				Multishot = 18,
				PunchThrough = 2,
				Range = 35,
				ShotSpeed = 46,
				ShotType = "Projectile",
				StatusChance = 0.01,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Second Heavy Attack - Ethereal Daggers",
				ChargeTime = 0.49,
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Puncture = 152, Slash = 228 },
				FireRate = 2,
				ForcedProcs = { "Slash" },
				IsSilent = true,
				Multishot = 9,
				PunchThrough = 2,
				Range = 35,
				ShotSpeed = 46,
				ShotType = "Projectile",
				StatusChance = 0.02,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Impact = 520 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Blast = 780 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.34 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Warfan/TnBrokenFrameWarfan/TnBrokenFrameWarfanInnateMod" 
		},
		Disposition = 0.9,
		Family = "Quassus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1040,
		Image = "QuassusPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Warfan/TnBrokenFrameWarfan/TnBrokenFramePrimeWarfanWeapon",
		Introduced = "37.0.9",
		Link = "Quassus Prime",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Quassus Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Rakta Dark Dagger"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Puncture = 88, Radiation = 96, Slash = 62 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Impact = 492 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Radiation = 738 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Syndicates/RedVeil/Melee/RVDarkDaggerInnateUpgrade" },
		Disposition = 1,
		Family = "Dark Dagger",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 492,
		Image = "RaktaDarkDagger.png",
		InternalName = "/Lotus/Weapons/Syndicates/RedVeil/Melee/RVDarkDagger",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Rakta Dark Dagger",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Rakta Dark Dagger",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 492,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Syndicate", "Red Veil" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Reaper Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Impact = 30, Puncture = 30, Slash = 140 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		Disposition = 0.8,
		Family = "Reaper Prime",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1200,
		Image = "ReaperPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/ReaperWeapon",
		Introduced = "8.0",
		Link = "Reaper Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Reaper Prime",
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Redeemer = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 18, Puncture = 36, Slash = 126 },
				FireRate = 0.833,
				IsSilent = true,
				Multishot = 1,
				StatusChance = 0.22 
			},
			{
				Accuracy = 6.7,
				AttackIndex = 2,
				AttackName = "Ranged Attack",
				ChargeTime = 0.39,
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Blast = 30 },
				Falloff = { EndRange = 20, Reduction = 0.8333, StartRange = 10 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 10,
				Multishot = 10,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.066,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Gunblade",
		ComboDur = 5,
		CompatibilityTags = { "GUNBLADE_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "Redeemer",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 900,
		Image = "Redeemer.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gunblade/TnoGunblade",
		Introduced = "15.5",
		Link = "Redeemer",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 2,
		Name = "Redeemer",
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Mesa Specter" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 2 
	},
	["Redeemer Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 21.2, Puncture = 42.4, Slash = 148.4 },
				FireRate = 0.917,
				IsSilent = true,
				Multishot = 1,
				StatusChance = 0.3 
			},
			{
				Accuracy = 6.7,
				AttackIndex = 2,
				AttackName = "Ranged Attack",
				ChargeTime = 0.39,
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 80 },
				Falloff = { EndRange = 30, Reduction = 0.9375, StartRange = 10 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 10,
				Multishot = 10,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 424 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.28 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Blast = 636 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Gunblade",
		ComboDur = 5,
		CompatibilityTags = { "GUNBLADE_STANCE" },
		Conclave = false,
		Disposition = 0.65,
		Family = "Redeemer",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 3200,
		Image = "RedeemerPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gunblade/RedeemerPrime/RedeemerPrimeWep",
		Introduced = "24.2.2",
		Link = "Redeemer Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2,
		Name = "Redeemer Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 424,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 2 
	},
	Ripkas = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 8.65, Puncture = 17.3, Slash = 147.05 },
				FireRate = 0.883,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 346 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 519 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Ripkas",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 865,
		Image = "Ripkas.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerClaws/GrnClaws",
		Introduced = "16.0",
		Link = "Ripkas",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Ripkas",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 519,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Zura", "Kuva Powerclaw", "Nightwatch Powerclaw" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Rumblejack = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 1.8,
				Damage = { Electricity = 180, Impact = 120 },
				FireRate = 0.67,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Electricity = 600 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Electricity = 900 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Rumblejack",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 600,
		Image = "Rumblejack.png",
		InternalName = "/Lotus/Weapons/Operator/Melee/DrifterTazer/DrifterTazerPlayerWep",
		Introduced = "31",
		Link = "Rumblejack",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.8,
		Name = "Rumblejack",
		SellPrice = 5000,
		SlideAttack = 600,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Drifter" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Ruvox = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 170 },
				FireRate = 1,
				IsSilent = true,
				MeleeRange = 1.25,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		CodexSecret = false,
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = false,
		Disposition = 0.9,
		ExilusPolarity = "Madurai",
		Family = "Ruvox",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 850,
		Image = "Ruvox.png",
		InternalName = "/Lotus/Weapons/Thanotech/EntFistIncarnon/EntFistIncarnon",
		Introduced = "35.5",
		Link = "Ruvox",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Ruvox",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 510,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Incarnon", "Entrati" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Sampotes = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 173.6, Puncture = 37.2, Slash = 37.2 },
				FireRate = 0.833,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 496 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Blast = 744 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		Disposition = 1,
		Family = "Sampotes",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1488,
		Image = "Sampotes.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Hammer/DaxDuviriHammer/DaxDuviriHammerWeapon",
		Introduced = "33",
		Link = "Sampotes",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Sampotes",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 496,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Duviri" },
		WindUp = 1.4,
		_TooltipAttackDisplay = 1 
	},
	["Sancti Magistar"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 192, Puncture = 36, Slash = 12 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 480 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Blast = 720 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Syndicates/NewLoka/Melee/NLMagistarLifeStrikeAOEMod" },
		Disposition = 1.25,
		Family = "Magistar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1440,
		Image = "SanctiMagistar.png",
		IncarnonDuration = 180,
		IncarnonImage = "MagistarIncarnon.png",
		InternalName = "/Lotus/Weapons/Syndicates/NewLoka/Melee/NLMagistar",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Sancti Magistar",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Sancti Magistar",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 480,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Tradable = 1,
		Traits = { "New Loka", "Syndicate" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Sarofang = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 80, Puncture = 8, Slash = 112 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Sarofang",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1200,
		Image = "Sarofang.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/WolfFrameAxeWeapon",
		Introduced = "32.2",
		Link = "Sarofang",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Sarofang",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Sarofang Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 66, Puncture = 8.8, Slash = 145.2 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		Disposition = 0.65,
		Family = "Sarofang",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1320,
		Image = "SarofangPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/PrimeVorunaAxeWeapon",
		Introduced = "42.0.6",
		Link = "Sarofang Prime",
		Mastery = 16,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Sarofang Prime",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 440,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Sarpa = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 16, Puncture = 32, Slash = 112 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				Accuracy = 100,
				AttackIndex = 2,
				AttackName = "Ranged Attack",
				BurstCount = 5,
				BurstDelay = 0.05,
				ChargeTime = 0.319,
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 3.5, Puncture = 10.5, Slash = 21 },
				Falloff = { EndRange = 40, Reduction = 0.8571, StartRange = 20 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 10,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.28,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 320 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Blast = 480 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Gunblade",
		ComboDur = 5,
		CompatibilityTags = { "GUNBLADE_STANCE" },
		Conclave = false,
		Disposition = 1.2,
		Family = "Sarpa",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 2100,
		Image = "Sarpa.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gunblade/GunbladeAutomatic/TnoGunbladeAutomatic",
		Introduced = "Update: The Silver Grove",
		Link = "Sarpa",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2,
		Name = "Sarpa",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 320,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.3,
		_TooltipAttackDisplay = 2 
	},
	Scindo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 20, Puncture = 20, Slash = 160 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 400 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Scindo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1200,
		Image = "Scindo.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/AxeWeapon",
		Introduced = "5.4",
		Link = "Scindo",
		Mastery = 2,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Scindo",
		SellPrice = 5000,
		SlideAttack = 400,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Scindo Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 25, Puncture = 25, Slash = 200 },
				FireRate = 0.967,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.967,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.967,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Scindo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1500,
		Image = "ScindoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Axe/PrimeScindo/PrimeScindoWeapon",
		Introduced = "14.8",
		Link = "Scindo Prime",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Scindo Prime",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Scoliac = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Impact = 22.5, Puncture = 22.5, Slash = 105 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.29 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Toxin = 300 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Toxin = 450 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Scoliac",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 675,
		Image = "Scoliac.png",
		InternalName = "/Lotus/Weapons/Infested/Melee/Whip/InfestedWhip/InfestedWhipWeapon",
		Introduced = "11.5",
		Link = "Scoliac",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Scoliac",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 300,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Infested" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	["Secura Lecta"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Electricity = 80, Puncture = 30, Slash = 66 },
				FireRate = 1.25,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Electricity = 352 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Electricity = 528 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Lecta",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 792,
		Image = "SecuraLecta.png",
		InternalName = "/Lotus/Weapons/Syndicates/PerrinSequence/Melee/PSLecta",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Secura Lecta",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Secura Lecta",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 352,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Syndicate", "Perrin Sequence" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Serro = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Electricity = 138, Slash = 96 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Blast = 468 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Blast = 702 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.38,
		Family = "Serro",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1404,
		Image = "Serro.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Polearm/CorpusPolearm01/CorpusPolearmWeapon",
		Introduced = "13.4",
		Link = "Serro",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Serro",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 468,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.15,
		Traits = { "Corpus" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	["Shadow Claws"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Impact = 75, Puncture = 50, Slash = 125 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = false,
		DefaultUpgrades = { "Ravenous Wraith" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 2000,
		Image = "ShadowClaws.png",
		InternalName = "/Lotus/Powersuits/Wraith/ReaperMeleeWeapon",
		Introduced = "30",
		Link = "Shadow Claws",
		MaxRank = 30,
		MeleeRange = 1.5,
		Name = "Shadow Claws",
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.6,
		Traits = { "Tenno" },
		Users = { "Sevagoth's Shadow" },
		WindUp = 0.9,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Shadow Claws Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Impact = 75, Puncture = 50, Slash = 125 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = false,
		DefaultUpgrades = { "Ravenous Wraith" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1000,
		Image = "ShadowClawsPrime.png",
		InternalName = "/Lotus/Powersuits/Wraith/SevagothShadowPrimeClawsWeapon",
		Introduced = "36.1",
		Link = "Shadow Claws",
		MaxRank = 30,
		MeleeRange = 1.5,
		Name = "Shadow Claws Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.6,
		Traits = { "Tenno", "Prime" },
		Users = { "Sevagoth's Shadow Prime" },
		WindUp = 0.9,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Shadow Clones"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.2,
				Damage = { Finisher = 1500 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.05 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON", "POWER_WEAPON_LITE", "NO_SLIDE" },
		Conclave = true,
		DefaultUpgrades = { "Blade Storm" },
		Family = "Shadow Clones",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 3375,
		HeavySlamAttack = 2250,
		HeavySlamRadius = 0,
		Image = "BladeStorm130xWhite.png",
		InternalName = "/Lotus/Powersuits/Ninja/NinjaStormWeapon",
		Introduced = "38.5",
		Link = "Shadow Clones",
		MaxRank = 30,
		MeleeRange = 50,
		Name = "Shadow Clones",
		Polarities = { "Madurai", "Madurai" },
		SlamAttack = 2250,
		SlamRadius = 0,
		SlideAttack = 1500,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Ash" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Shadow Clones Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.2,
				Damage = { Finisher = 1500 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.05 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON", "POWER_WEAPON_LITE", "NO_SLIDE" },
		Conclave = true,
		DefaultUpgrades = { "Blade Storm" },
		Family = "Shadow Clones",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 3375,
		HeavySlamAttack = 2250,
		HeavySlamRadius = 0,
		Image = "BladeStorm130xWhite.png",
		InternalName = "/Lotus/Powersuits/Ninja/NinjaStormWeaponPrime",
		Introduced = "38.5",
		Link = "Shadow Clones",
		MaxRank = 30,
		MeleeRange = 50,
		Name = "Shadow Clones Prime",
		Polarities = { "Madurai", "Madurai" },
		SlamAttack = 2250,
		SlamRadius = 0,
		SlideAttack = 1500,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Prime" },
		Users = { "Ash Prime" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Shaku = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 180 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nunchaku",
		ComboDur = 5,
		CompatibilityTags = { "NUNCHAKU_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Shaku",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 900,
		Image = "Shaku.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Nunchaku/TnoNunchaku/TnoNunchaku",
		Introduced = "18.1",
		Link = "Shaku",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.21,
		Name = "Shaku",
		SellPrice = 5000,
		SlideAttack = 360,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Equinox Specter" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Shattered Lash"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Damage",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Puncture = 400 },
				FireRate = 1,
				IsSilent = true,
				Range = 1.75,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Arcing Damage",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Slash = 400 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Shattered Lash" },
		Family = "Shattered Lash",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 2250,
		HeavySlamAttack = 1500,
		HeavySlamRadius = 0,
		Image = "ShatteredLash130xWhite.png",
		InternalName = "/Lotus/Powersuits/Glass/GaraShankWeapon",
		Introduced = "38.5",
		Link = "Shattered Lash (Weapon)",
		MaxRank = 30,
		MeleeRange = 12,
		Name = "Shattered Lash",
		Polarities = { "Naramon", "Madurai" },
		SlamAttack = 1500,
		SlamRadius = 0,
		SlideAttack = 1000,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Gara" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Shattered Lash Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Damage",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Puncture = 400 },
				FireRate = 1,
				IsSilent = true,
				Range = 1.75,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Arcing Damage",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Slash = 400 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Shattered Lash" },
		Family = "Shattered Lash",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 2250,
		HeavySlamAttack = 1500,
		HeavySlamRadius = 0,
		Image = "ShatteredLash130xWhite.png",
		InternalName = "/Lotus/Powersuits/Glass/GaraShankWeaponPrime",
		Introduced = "38.5",
		Link = "Shattered Lash (Weapon)",
		MaxRank = 30,
		MeleeRange = 12,
		Name = "Shattered Lash Prime",
		Polarities = { "Naramon", "Madurai" },
		SlamAttack = 1500,
		SlamRadius = 0,
		SlideAttack = 1000,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Prime" },
		Users = { "Gara Prime" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Sheev = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Impact = 13.5, Puncture = 13.5, Slash = 243 },
				FireRate = 0.667,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Heat = 540 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.25 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.13,
				CritMultiplier = 2.1,
				Damage = { Heat = 810 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.667,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.25 
			} 
		},
		BlockAngle = 45,
		Class = "Dagger",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "DAGGERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Sheev",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 540,
		Image = "Sheev.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrineerCombatKnife/GrineerCombatKnife",
		Introduced = "14.7",
		Link = "Sheev",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 1.7,
		Name = "Sheev",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 540,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Grineer" },
		Users = { "Harkonar", "Nok", "Reth", "Ranged Grineer soldiers" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Sibear = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Cold = 130, Impact = 70, Puncture = 20, Slash = 50 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Cold = 540 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Cold = 810 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Sibear",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1620,
		Image = "Sibear.png",
		IncarnonDuration = 180,
		IncarnonImage = "SibearIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Hammer/IceHammer/IceHammer",
		Introduced = "18.8",
		Link = "Sibear",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Sibear",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 540,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		Users = { "Frost Specter" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Sigma & Octantis"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 38.28, Puncture = 27.84, Slash = 107.88 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Shield Throw",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 25.52, Puncture = 18.56, Slash = 71.92 },
				FireRate = 1.08,
				ForcedProcs = { "Stun" },
				IsSilent = true,
				Range = 24,
				ShotSpeed = 60,
				ShotType = "Thrown",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 3,
				AttackName = "Shield Throw Explosion",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 50 },
				Falloff = { EndRange = 4, Reduction = 1, StartRange = 0 },
				FireRate = 1.08,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.16 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 348 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 522 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Sigma & Octantis",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 870,
		Image = "Sigma&Octantis.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/SundialSwordBoard/SundialBoardSword",
		Introduced = "22.1.2",
		Link = "Sigma & Octantis",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Sigma & Octantis",
		SlideAttack = 174,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Silva & Aegis"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Heat = 98 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 196 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 294 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Silva & Aegis",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 490,
		Image = "Silva&Aegis.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/MeleeContestWinnerOne/TennoSwordShield",
		Introduced = "14.0",
		Link = "Silva & Aegis",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Silva & Aegis",
		SellPrice = 5000,
		SlideAttack = 98,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Silva & Aegis Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Heat = 318 },
				FireRate = 0.75,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Heat = 636 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Heat = 954 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.75,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "Silva & Aegis",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1590,
		Image = "Silva&AegisPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeSilvaAegis/PrimeSilvaAegis",
		Introduced = "20.6.2",
		Link = "Silva & Aegis Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Silva & Aegis Prime",
		Polarities = { "Madurai", "Vazarin", "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 318,
		SlideElement = "Heat",
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Skana = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 18, Puncture = 18, Slash = 84 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.16 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 240 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 360 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Sword",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Skana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 600,
		Image = "Skana.png",
		IncarnonDuration = 180,
		IncarnonImage = "SkanaIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/LongSword/LongSword",
		Introduced = "Vanilla",
		Link = "Skana",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Skana",
		SellPrice = 5000,
		SlideAttack = 75,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Skana Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 31.5, Puncture = 31.5, Slash = 147 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 420 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Blast = 630 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Sword",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Skana",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1050,
		Image = "SkanaPrime.png",
		IncarnonDuration = 180,
		IncarnonImage = "SkanaPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/LongSword/SkanaPrime",
		Introduced = "5.0",
		Link = "Skana Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Skana Prime",
		Polarities = { "Madurai", "Naramon" },
		SellPrice = 5000,
		SlideAttack = 210,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Prime", "Vaulted", "Founder" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Skiajati = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 26.25, Puncture = 12.25, Slash = 136.5 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 350 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 525 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Swords/UmbraKatana/UmbraAbilityCastUpgrade" },
		Disposition = 0.9,
		Family = "Skiajati",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 875,
		Image = "Skiajati.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/UmbraKatana/UmbraKatana",
		Introduced = "23.0",
		Link = "Skiajati",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Skiajati",
		Polarities = { "Umbra", "Umbra" },
		SlideAttack = 350,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Slaytra = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 73.26, Puncture = 93.24, Slash = 166.5 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 666 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Blast = 999 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Machete",
		ComboDur = 5,
		CompatibilityTags = { "MACHETES_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/Melee/GrnSharbola/GrnSharbolaInnateUpgrade" },
		Disposition = 1.05,
		Family = "Slaytra",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1998,
		Image = "Slaytra.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnSharbola/GrnSharbolaWeapon",
		Introduced = "32",
		Link = "Slaytra",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Slaytra",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 666,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Kahl-175" },
		WindUp = 0.7 
	},
	Spinnerex = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Toxin = 168 },
				FireRate = 1.36,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Toxin = 168 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.36,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Toxin = 504 },
				Falloff = { EndRange = 6, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.36,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Whip",
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = true,
		Disposition = 0.75,
		Family = "Spinnerex",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 756,
		Image = "Spinnerex.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Whips/SpiderWhip/SpiderWhipWeapon",
		Introduced = "39",
		Link = "Spinnerex",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Spinnerex",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 336,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Stropha = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 61.6, Puncture = 74.8, Slash = 83.6 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.14 
			},
			{
				Accuracy = 100,
				AttackIndex = 2,
				AttackName = "Ranged Attack",
				ChargeTime = 0.39,
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 700 },
				Falloff = { EndRange = 12, Reduction = 0.9857, StartRange = 6 },
				FireRate = 1,
				IsSilent = false,
				Range = 17,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.14,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Gunblade",
		ComboDur = 5,
		CompatibilityTags = { "GUNBLADE_STANCE" },
		Conclave = false,
		Disposition = 0.65,
		Family = "Stropha",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 2800,
		Image = "Stropha.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Gunblade/CrpGunBlade/CrpGunbladeWeapon",
		Introduced = "28",
		Link = "Stropha",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2,
		Name = "Stropha",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 440,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Corpus" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 2 
	},
	["Sun & Moon"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Impact = 38, Puncture = 45.6, Slash = 106.4 },
				FireRate = 1,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Impact = 380 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Blast = 570 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Nikanas",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_KATANAS_STANCE" },
		Conclave = false,
		Disposition = 0.8,
		Family = "Sun & Moon",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1140,
		Image = "Sun&Moon.png",
		InternalName = "/Lotus/Types/Friendly/PlayerControllable/Weapons/DuviriDualSwordsWeapon",
		Introduced = "33",
		Link = "Sun & Moon",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Sun & Moon",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 380,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Dax" },
		Users = { "Teshin" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Syam = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 54, Puncture = 108, Slash = 108 },
				FireRate = 1,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "First Shockwave",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Heat = 500 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				ShotType = "Projectile",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 3,
				AttackName = "Second Shockwave",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Heat = 1500 },
				FireRate = 1,
				IsSilent = true,
				ShotType = "Projectile",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 540 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 3,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 810 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Nikana",
		ComboDur = 5,
		CompatibilityTags = { "NIKANAS_STANCE" },
		Conclave = false,
		Disposition = 0.75,
		Family = "Syam",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1350,
		Image = "Syam.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/DaxDuviriKatana/DaxDuviriKatanaWeapon",
		Introduced = "33",
		Link = "Syam",
		Mastery = 0,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Syam",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 540,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Duviri" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Sydon = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 11.25, Puncture = 213.75 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 450 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 675 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.35,
		Family = "Sydon",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1350,
		Image = "Sydon.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnTrident/GrnTridentWeapon",
		Introduced = "18.2",
		Link = "Sydon",
		Mastery = 5,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Sydon",
		SellPrice = 5000,
		SlideAttack = 450,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Traits = { "Grineer" },
		Users = { "Shock Draga" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	["Synoid Heliocor"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 238, Puncture = 28, Slash = 14 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 560 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 840 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Syndicates/CephalonSuda/Melee/CreateSpectreOnKill" },
		Disposition = 1.35,
		Family = "Heliocor",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1680,
		Image = "SynoidHeliocor.png",
		InternalName = "/Lotus/Weapons/Syndicates/CephalonSuda/Melee/CSHeliocor",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Synoid Heliocor",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Synoid Heliocor",
		SellPrice = 5000,
		SlideAttack = 560,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 1,
		Traits = { "Syndicate", "Cephalon Suda" },
		UniqueTrait = {
			Description = "Fatal strikes with this weapon perform a Codex Scan. Enemies killed by Heavy Attacks are recomposed as spectral allies for 30 seconds if their Codex entry is completed",
			Name = "Suda Specter" 
		},
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	["Tak & Lug"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 39.4, Slash = 157.6 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.31 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 394 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Blast = 522 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 70,
		Class = "Sword and Shield",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = false,
		Disposition = 0.95,
		Family = "Tak & Lug",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 2364,
		Image = "Tak&Lug.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SwordsAndBoards/MortiforShieldAndSword/MortiforShieldAndSword",
		Introduced = "38.5.11",
		Link = "Tak & Lug",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Tak & Lug",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 197,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Tatsu = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 54, Radiation = 72, Slash = 68 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Soul Swarm Projectile",
				CritChance = 0.11,
				CritMultiplier = 1.9,
				Damage = { Radiation = 96 },
				FireRate = 1,
				ForcedProcs = { "Stun" },
				IsSilent = true,
				ShotSpeed = 20,
				ShotType = "Projectile",
				StatusChance = 0.23 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 428 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 642 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Two-Handed Nikana",
		ComboDur = 5,
		CompatibilityTags = { "LONG_KATANA_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Swords/TnTwoHandedKatana/TnTwoHandedKatanaFrameInnateMod" 
		},
		Disposition = 1.05,
		Family = "Tatsu",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1284,
		Image = "Tatsu.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/TnTwoHandedKatana/TnTwoHandedKatana",
		Introduced = "24.4",
		Link = "Tatsu",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Tatsu",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 428,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Tatsu Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 20, Puncture = 54, Radiation = 80, Slash = 76 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Soul Swarm Projectile",
				CritChance = 0.11,
				CritMultiplier = 1.9,
				Damage = { Radiation = 96 },
				FireRate = 1.17,
				ForcedProcs = { "Stun" },
				IsSilent = true,
				ShotSpeed = 20,
				ShotType = "Projectile",
				StatusChance = 0.23 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 460 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Blast = 690 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Two-Handed Nikana",
		ComboDur = 5,
		CompatibilityTags = { "LONG_KATANA_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Swords/TnTwoHandedKatana/TnTwoHandedKatanaFrameInnateMod" 
		},
		Disposition = 0.9,
		Family = "Tatsu",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1380,
		Image = "TatsuPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeTatsu/PrimeTatsuWeapon",
		Introduced = "32.0.9",
		Link = "Tatsu Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Tatsu Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 460,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Tekko = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 32, Puncture = 16, Slash = 112 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 320 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Blast = 480 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = true,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Gauntlet/BrawlerKnuckles/BrawlerKnucklesInnateUpgrade" 
		},
		Disposition = 1.4,
		Family = "Tekko",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 800,
		Image = "Tekko.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Gauntlet/BrawlerKnuckles/BrawlerKnuckles",
		Introduced = "17.5",
		Link = "Tekko",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 1.25,
		Name = "Tekko",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 480,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Tekko Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 39.6, Puncture = 25.2, Slash = 115.2 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Fist",
		ComboDur = 5,
		CompatibilityTags = { "FIST_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/PrimeTekko/TekkoPrimeInnateUpgrade" },
		Disposition = 1.3,
		Family = "Tekko",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.9,
		HeavyAttack = 900,
		Image = "TekkoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeTekko/PrimeTekko",
		Introduced = "25.8",
		Link = "Tekko Prime",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 1.35,
		Name = "Tekko Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 540,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Telos Boltace"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 21, Puncture = 178.5, Slash = 10.5 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Stormpath Slide Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 42, Puncture = 357, Slash = 21 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				StatusChance = 0.35 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 420 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 630 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Syndicates/ArbitersOfHexis/Melee/AHBoltaceMobilizeMod" },
		Disposition = 1.1,
		Family = "Boltace",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 840,
		Image = "TelosBoltace.png",
		InternalName = "/Lotus/Weapons/Syndicates/ArbitersOfHexis/Melee/AHBoltace",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Telos Boltace",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Telos Boltace",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Syndicate", "Arbiters of Hexis" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Tenet Agendus"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 140, Impact = 120 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Energy Disk",
				ChargeTime = 0.995,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 2880 },
				Falloff = { EndRange = 20, Reduction = 0.9305, StartRange = 10 },
				FireRate = 1,
				IsSilent = true,
				Range = 40,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.28,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 520 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 780 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 90,
		Class = "Sword and Shield",
		ComboDur = 5,
		CompatibilityTags = { "SWORDS_AND_SHIELD_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.9,
		Family = "Tenet Agendus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1040,
		Image = "TenetAgendus.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/ShieldAndSword/CrpHammerShield/CrpHammerShield",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Agendus",
		Mastery = 14,
		MaxRank = 40,
		MeleeRange = 2.6,
		Name = "Tenet Agendus",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Corpus", "Tenet" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Tenet Exec"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Impact = 102.6, Slash = 87.4 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Impact = 380 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Impact = 570 },
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.8,
		Family = "Tenet Exec",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1140,
		Image = "TenetExec.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/CrpBigSlash/CrpBigSlash",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Exec",
		Mastery = 16,
		MaxRank = 40,
		MeleeRange = 2.8,
		Name = "Tenet Exec",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 380,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Corpus", "Tenet" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Tenet Grigori"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 1.6,
				Damage = { Impact = 9.1, Puncture = 82.1, Slash = 136.8 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.38 
			},
			{
				AttackIndex = 2,
				AttackName = "Energy Disk",
				ChargeTime = 1,
				CritChance = 0.24,
				CritMultiplier = 1.6,
				Damage = { Impact = 1360, Puncture = 1360, Slash = 1360 },
				FireRate = 1,
				IsSilent = true,
				Range = 10,
				ShotSpeed = 1,
				ShotType = "Projectile",
				StatusChance = 0.38,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.24,
				CritMultiplier = 1.6,
				Damage = { Impact = 456 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.24,
				CritMultiplier = 1.6,
				Damage = { Blast = 684 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.95,
		Family = "Tenet Grigori",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1368,
		Image = "TenetGrigori.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/CrpBriefcaseScythe/CrpBriefcaseScythe",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Grigori",
		Mastery = 14,
		MaxRank = 40,
		MeleeRange = 2.5,
		Name = "Tenet Grigori",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 456,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Corpus", "Tenet" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Tenet Livia"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 9.9, Puncture = 9.9, Slash = 178.2 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 396 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 594 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Two-Handed Nikana",
		ComboDur = 5,
		CompatibilityTags = { "LONG_KATANA_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Corpus/Melee/CrpBriefcase2HKatana/CrpBriefcase2HKatanaInnateUpgrade" 
		},
		Disposition = 0.95,
		Family = "Tenet Livia",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 1188,
		Image = "TenetLivia.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/CrpBriefcase2HKatana/CrpBriefcase2HKatana",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Livia",
		Mastery = 14,
		MaxRank = 40,
		MeleeRange = 2.5,
		Name = "Tenet Livia",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 396,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Corpus", "Tenet" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	Thalys = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Puncture = 90, Slash = 210 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Impact = 600 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Blast = 900 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Heavy Scythe",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY SCYTHE_STANCE" },
		Conclave = false,
		DefaultUpgrades = {  },
		Disposition = 0.6,
		Family = "Thalys",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 800,
		Image = "Thalys.png",
		InternalName = "/Lotus/Weapons/Tenno/Zariman/Melee/HeavyScythe/ZarimanHeavyScythe/ZarimanHeavyScytheWeapon",
		Introduced = "39",
		Link = "Thalys",
		Mastery = 12,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Thalys",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 600,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 0,
		Traits = { "Duviri", "Incarnon" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Tipedo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 12.4, Puncture = 12.4, Slash = 99.2 },
				FireRate = 1.33,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 248 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Blast = 372 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.31,
		Family = "Tipedo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 620,
		Image = "Tipedo.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/MonkSpade/TnoMonkStaff",
		Introduced = "15.9",
		Link = "Tipedo",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Tipedo",
		Polarities = { "Vazarin" },
		SellPrice = 5000,
		SlideAttack = 124,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Mag Specter" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Tipedo Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Impact = 17, Puncture = 17, Slash = 136 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Impact = 340 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Blast = 510 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Staff",
		ComboDur = 5,
		CompatibilityTags = { "STAVES_STANCE" },
		Conclave = true,
		Disposition = 1.25,
		Family = "Tipedo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 850,
		Image = "TipedoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Staff/TipedoPrime/TipedoPrimeWeapon",
		Introduced = "24.5.8",
		Link = "Tipedo Prime",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Tipedo Prime",
		Polarities = { "Vazarin", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 170,
		Slot = "Melee",
		StancePolarity = "Unairu",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	Tonbo = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 18.4, Puncture = 27.6, Slash = 138 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.25 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Blast = 368 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Blast = 552 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		Disposition = 1.38,
		Family = "Tonbo",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1104,
		Image = "Tonbo.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Polearms/FlowerPowerPolearm/FlowerPowerPolearmWep",
		Introduced = "15.15",
		Link = "Tonbo",
		Mastery = 3,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Tonbo",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 368,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.15,
		Traits = { "Tenno" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Tonkkatt = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Puncture = 33, Slash = 132 },
				FireRate = 1.0833,
				IsSilent = true,
				StatusChance = 0.21 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Impact = 330 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Blast = 495 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Tonfa",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "TONFA_STANCE" },
		Conclave = false,
		Disposition = 0.85,
		Family = "Tonkkatt",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 660,
		Image = "Tonkkatt.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/Tonfa/GrnChainSawTonfa/GrnChainSawTonfaWeapon",
		Introduced = "38.5.11",
		Link = "Tonkkatt",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Tonkkatt",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 330,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Twin Basolk"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Heat = 85, Impact = 55, Puncture = 15, Slash = 55 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Heat = 420 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Heat = 630 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.3,
		Family = "Twin Basolk",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 840,
		Image = "TwinBasolk.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnDualFireAxe/GrnDualFireAxe",
		Introduced = "17.8",
		Link = "Twin Basolk",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 2.4,
		Name = "Twin Basolk",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Flameblade", "Garesh" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Twin Krohkur"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Impact = 30, Puncture = 45, Slash = 175 },
				FireRate = 0.917,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Dual Swords",
		ComboDur = 5,
		CompatibilityTags = { "DUAL_SWORDS_STANCE" },
		Conclave = true,
		Disposition = 1.2,
		Family = "Twin Krohkur",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 1000,
		Image = "TwinKrohkur.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GrnEgyptSwd/DualGrnEgyptSwdWeapon",
		Introduced = "22",
		Link = "Twin Krohkur",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 2.5,
		Name = "Twin Krohkur",
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Grineer" },
		Users = { "Tusk Predator" },
		WindUp = 0.7,
		_TooltipAttackDisplay = 1 
	},
	["Valkyr Prime Talons"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Puncture = 62.5, Slash = 187.5 },
				FireRate = 1.5,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Puncture = 125, Slash = 375 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Hysteria" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1250,
		Image = "ValkyrTalons.png",
		InternalName = "/Lotus/Powersuits/Berserker/BerserkerMeleePrime",
		Introduced = "23.0",
		Link = "Valkyr Talons",
		MaxRank = 30,
		MeleeRange = 2.15,
		Name = "Valkyr Prime Talons",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		SlideAttack = 750,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Valkyr Prime" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Valkyr Talons"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Puncture = 62.5, Slash = 187.5 },
				FireRate = 1.5,
				IsSilent = true,
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Puncture = 125, Slash = 375 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = { "POWER_WEAPON" },
		Conclave = true,
		DefaultUpgrades = { "Hysteria" },
		FollowThrough = 1,
		GripType = "MELEE_ONE_HAND",
		HeavyAttack = 1250,
		Image = "ValkyrTalons.png",
		InternalName = "/Lotus/Powersuits/Berserker/BerserkerMelee",
		Introduced = "23.0",
		Link = "Valkyr Talons",
		MaxRank = 30,
		MeleeRange = 2.15,
		Name = "Valkyr Talons",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		SlideAttack = 750,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Valkyr" },
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Vastilok = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Impact = 19.53, Puncture = 25.11, Slash = 234.36 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				StatusChance = 0.31 
			},
			{
				Accuracy = 6.7,
				AttackIndex = 2,
				AttackName = "Ranged Attack",
				ChargeTime = 0.39,
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Impact = 8.97, Puncture = 10.35, Slash = 49.68 },
				Falloff = { EndRange = 49, Reduction = 0.9565, StartRange = 24 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 10,
				Multishot = 9,
				PunchThrough = 1.3,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1033,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Impact = 558 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.19,
				CritMultiplier = 1.7,
				Damage = { Blast = 837 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Gunblade",
		ComboDur = 5,
		CompatibilityTags = { "GUNBLADE_STANCE" },
		Conclave = false,
		Disposition = 0.9,
		Family = "Vastilok",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 2484,
		Image = "Vastilok.png",
		InternalName = "/Lotus/Weapons/Grineer/Melee/GunBlade/GrnGunBlade/GrnGunblade",
		Introduced = "30.5.4",
		Link = "Vastilok",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 1,
		Name = "Vastilok",
		SellPrice = 5000,
		SlideAttack = 558,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Grineer" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 2 
	},
	["Vaykor Sydon"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Impact = 10.65, Puncture = 202.35 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Blast = 426 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Blast = 639 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Polearm",
		ComboDur = 5,
		CompatibilityTags = { "POLEARMS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Syndicates/SteelMeridian/Melee/SMSydonSpecialUpgrade" },
		Disposition = 1.3,
		Family = "Sydon",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1278,
		Image = "VaykorSydon.png",
		InternalName = "/Lotus/Weapons/Syndicates/SteelMeridian/Melee/SMSydon",
		Introduced = "Update: The Silver Grove 2.0",
		Link = "Vaykor Sydon",
		Mastery = 11,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Vaykor Sydon",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 426,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Syndicate", "Steel Meridian" },
		WindUp = 0.9,
		_TooltipAttackDisplay = 1 
	},
	Venato = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Impact = 33, Puncture = 110, Slash = 77 },
				FireRate = 1.08,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.08,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 90,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Sentients/SentJointedScythe/SentJointedScytheInnateUpgrade" },
		Disposition = 1.3,
		Family = "Venato",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1320,
		Image = "Venato.png",
		InternalName = "/Lotus/Weapons/Sentients/SentJointedScythe/SentJointedScytheWeapon",
		Introduced = "31",
		Link = "Venato",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.7,
		Name = "Venato",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 440,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Traits = { "Tenno", "Sentient" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	["Venato Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.34,
				CritMultiplier = 2.3,
				Damage = { Impact = 36.75, Puncture = 122.5, Slash = 85.75 },
				FireRate = 1.166,
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 2.3,
				Damage = { Impact = 490 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.166,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.34,
				CritMultiplier = 2.3,
				Damage = { Blast = 735 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.166,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 60,
		Class = "Scythe",
		ComboDur = 5,
		CompatibilityTags = { "SCYTHES_STANCE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Melee/Scythe/PrimeVento/PrimeVentoProcOnProcUpgrade",
			"/Lotus/Weapons/Sentients/SentJointedScythe/SentJointedScytheInnateUpgrade" 
		},
		Disposition = 0.6,
		Family = "Venato",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1470,
		Image = "VenatoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Scythe/PrimeVento/PrimeVentoScythe",
		Introduced = "39.1",
		Link = "Venato Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Venato Prime",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 490,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Tenno", "Sentient", "Prime" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Venka = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 35, Slash = 98 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 280 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 420 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = true,
		Disposition = 1.1,
		Family = "Venka",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 700,
		Image = "Venka.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Claws/TennoClaws",
		Introduced = "13.9",
		Link = "Venka",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 1.75,
		Name = "Venka",
		SellPrice = 5000,
		SlideAttack = 420,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Violence" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	["Venka Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 9.4, Puncture = 37.6, Slash = 141 },
				FireRate = 1.05,
				IsSilent = true,
				StatusChance = 0.24 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 376 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.05,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Blast = 564 },
				Falloff = { EndRange = 7, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.05,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Claws",
		ComboDur = 5,
		CompatibilityTags = { "CLAWS_STANCE_STANCE" },
		Conclave = true,
		Disposition = 0.85,
		Family = "Venka",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.8,
		HeavyAttack = 940,
		Image = "VenkaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeVenKa/PrimeVenkaClaws",
		Introduced = "19.0.7",
		Link = "Venka Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 1.8,
		Name = "Venka Prime",
		Polarities = { "Naramon", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 564,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		WindUp = 0.6,
		_TooltipAttackDisplay = 1 
	},
	Verdilac = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Impact = 21.3, Puncture = 85.2, Slash = 106.5 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.21 
			},
			{
				AttackIndex = 2,
				AttackName = "Energy Wave",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Toxin = 213 },
				FireRate = 1,
				IsSilent = false,
				Range = 35,
				StatusChance = 0.21 
			},
			{
				AttackIndex = 3,
				AttackName = "Energy Wave Explosion",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Electricity = 2 },
				FireRate = 1,
				IsSilent = false,
				Range = 2,
				StatusChance = 0 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Electricity = 426 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Electricity = 639 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 45,
		Class = "Whip",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "WHIPS_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Verdilac",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 959,
		Image = "Verdilac.png",
		InternalName = "/Lotus/Weapons/Archon/Melee/Whip/ArchonWhipPlayerWep",
		Introduced = "31",
		Link = "Verdilac",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Verdilac",
		Polarities = {  },
		SellPrice = 5000,
		SlideAttack = 426,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.25,
		Traits = { "Sentient" },
		Users = { "Archon Nira" },
		WindUp = 0.4,
		_TooltipAttackDisplay = 1 
	},
	Vericres = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 21.6, Puncture = 28.8, Slash = 129.6 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 360 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 540 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		BlockAngle = 55,
		Class = "Warfan",
		ComboDur = 5,
		CompatibilityTags = { "WARFAN_STANCE" },
		Conclave = false,
		Disposition = 1.15,
		Family = "Vericres",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 720,
		Image = "Vericres.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Warfan/TnMoonWarfan/MoonWarfanWeapon",
		Introduced = "31.6.4",
		Link = "Vericres",
		Mastery = 8,
		MaxRank = 30,
		MeleeRange = 1.8,
		Name = "Vericres",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 180,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Tradable = 1,
		Traits = { "Tenno" },
		WindUp = 0.5,
		_TooltipAttackDisplay = 1 
	},
	["Vinquibus (Melee)"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 3.2,
				Damage = { Puncture = 182, Slash = 78 },
				FireRate = 1,
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Gunshot",
				CritChance = 0.4,
				CritMultiplier = 3.2,
				Damage = { Puncture = 182, Slash = 78 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Gunshot Explosion",
				AttackParentIndex = 2,
				CritChance = 0.4,
				CritMultiplier = 3.2,
				Damage = { Blast = 400 },
				ExplosionDelay = 0.8,
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.4,
				CritMultiplier = 3.2,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 5,
				AttackName = "Heavy Slam Attack",
				AttackParentIndex = 2,
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 0,
		Class = "Bayonet",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "BAYONET_STANCE" },
		Conclave = false,
		Disposition = 0.7,
		Family = "Vinquibus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 2600,
		HeavySlamAttack = 660,
		HeavySlamElement = "Blast",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 9,
		Image = "Vinquibus.png",
		InternalName = "/Lotus/Weapons/Tenno/Bayonet/TnBayonetRifleWeapon",
		Introduced = "41",
		Link = "Vinquibus",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 3,
		Name = "Vinquibus (Melee)",
		Polarities = { "Madurai", "Aura" },
		SellPrice = 5000,
		SlamAttack = 440,
		SlamElement = "Impact",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 7,
		SlideAttack = 520,
		Slot = "Melee",
		StancePolarity = "Aura",
		SweepRadius = 0.25,
		Traits = { "" },
		WindUp = 1,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Vitrica = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.3,
				Damage = { Impact = 99.9, Puncture = 99.9, Slash = 133.2 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Glass Explosion",
				CritChance = 0.23,
				CritMultiplier = 2.3,
				Damage = { Impact = 299.7, Puncture = 299.7, Slash = 399.6 },
				Falloff = { EndRange = 6, Reduction = 0.9, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 3,
				AttackName = "Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.3,
				Damage = { Impact = 666 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 4,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.23,
				CritMultiplier = 2.3,
				Damage = { Impact = 999 },
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = {  },
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		BlockAngle = 60,
		Class = "Heavy Blade",
		ComboDur = 10,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		Disposition = 1.1,
		Family = "Vitrica",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1998,
		Image = "Vitrica.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/NWIIIOrokinSword/NWOrokinSword",
		Introduced = "29.3",
		Link = "Vitrica",
		Mastery = 13,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Vitrica",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 666,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Orokin" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Volnus = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 1.6,
				Damage = { Impact = 48.4, Puncture = 70.4, Slash = 101.2 },
				FireRate = 1.2,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 1.6,
				Damage = { Slash = 440 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.18,
				CritMultiplier = 1.6,
				Damage = { Slash = 660 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Hammer/GlassHammer/GlassHammerInnateUpgrade" },
		Disposition = 1.4,
		Family = "Volnus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1320,
		Image = "Volnus.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Hammer/GlassHammer/GlassHammer",
		Introduced = "22",
		Link = "Volnus",
		Mastery = 9,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Volnus",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 440,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["Volnus Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Impact = 55, Puncture = 80, Slash = 115 },
				FireRate = 1.2,
				IsSilent = true,
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Slash = 500 },
				Falloff = { EndRange = 10, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Slash = 750 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.2,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/Hammer/GlassHammer/GlassHammerInnateUpgrade" },
		Disposition = 1.3,
		Family = "Volnus",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1500,
		Image = "VolnusPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/PrimeVolnus/VolnusPrimeWeapon",
		Introduced = "30.3",
		Link = "Volnus Prime",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.9,
		Name = "Volnus Prime",
		Polarities = { "Madurai", "Madurai" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Traits = { "Prime" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	War = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 120, Puncture = 60, Slash = 70 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Blast = 750 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.05,
		Family = "War",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1500,
		Image = "War.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/StalkerTwo/StalkerTwoGreatSword",
		Introduced = "18.0",
		Link = "War",
		Mastery = 10,
		MaxRank = 30,
		MeleeRange = 3.2,
		Name = "War",
		Polarities = { "Naramon" },
		SellPrice = 5000,
		SlamAttack = 500,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Sentient" },
		Users = { "Shadow Stalker" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	["War Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 3.2,
				Damage = { Impact = 194.4, Puncture = 32.4, Slash = 43.2 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 3.2,
				Damage = { Impact = 500 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.26,
				CritMultiplier = 3.2,
				Damage = { Blast = 810 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.917,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		CodexSecret = true,
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = false,
		Disposition = 0.5,
		Family = "War",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1620,
		Image = "WarPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Swords/PrimeWar/PrimeWarWeapon",
		Introduced = "43.0",
		Link = "War Prime",
		Mastery = 15,
		MaxRank = 30,
		MeleeRange = 3.2,
		Name = "War Prime",
		Polarities = { "Naramon" },
		SlamAttack = 540,
		Slot = "Melee",
		StancePolarity = "Vazarin",
		SweepRadius = 0.2,
		Traits = { "Sentient", "Prime" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	},
	Whipclaw = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 49.95, Puncture = 49.95, Slash = 50.1 },
				FireRate = 1,
				IsSilent = true,
				Range = 5,
				StatusChance = 0.25 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Whipclaw" },
		Family = "Whipclaw",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 450,
		HeavySlamAttack = 300,
		HeavySlamRadius = 0,
		Image = "Whipclaw130xWhite.png",
		InternalName = "/Lotus/Powersuits/Khora/KhoraWhipclawWeapon",
		Introduced = "38.5",
		Link = "Whipclaw (Weapon)",
		MaxRank = 30,
		MeleeRange = 10,
		Name = "Whipclaw",
		Polarities = { "Madurai", "Vazarin" },
		SlamAttack = 300,
		SlamRadius = 0,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno" },
		Users = { "Khora" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Whipclaw Prime"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 49.95, Puncture = 49.95, Slash = 50.1 },
				FireRate = 1,
				IsSilent = true,
				Range = 5,
				StatusChance = 0.25 
			} 
		},
		BlockAngle = 90,
		Class = "Exalted Weapon",
		ComboDur = 5,
		CompatibilityTags = {
			"POWER_WEAPON",
			"POWER_WEAPON_LITE",
			"NO_FINISHER",
			"NO_SLIDE",
			"NO_ATTACK_SPEED" 
		},
		Conclave = true,
		DefaultUpgrades = { "Whipclaw" },
		Family = "Whipclaw",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.5,
		HeavyAttack = 450,
		HeavySlamAttack = 300,
		HeavySlamRadius = 0,
		Image = "Whipclaw130xWhite.png",
		InternalName = "/Lotus/Powersuits/Khora/KhoraWhipclawWeaponPrime",
		Introduced = "38.5",
		Link = "Whipclaw (Weapon)",
		MaxRank = 30,
		MeleeRange = 10,
		Name = "Whipclaw Prime",
		Polarities = { "Madurai", "Vazarin" },
		SlamAttack = 300,
		SlamRadius = 0,
		SlideAttack = 200,
		Slot = "Melee",
		StancePolarity = "Zenurik",
		SweepRadius = 0.25,
		Traits = { "Tenno", "Prime" },
		Users = { "Khora Prime" },
		WindUp = 0.4,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Wolf Sledge"] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = { Impact = 132.09, Puncture = 7.77, Slash = 119.14 },
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				ChargeTime = 0.75,
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 396.27, Puncture = 23.31, Slash = 357.42 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 40,
				ShotType = "Thrown",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 777 },
				Falloff = { EndRange = 5, Reduction = 0.4, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Blast = 1554 },
				Falloff = { EndRange = 5, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = true,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 5,
				AttackName = "Slam Attack",
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = { Impact = 518 },
				Falloff = { EndRange = 9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 6,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = { Blast = 777 },
				Falloff = { EndRange = 10, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 50,
		Class = "Hammer",
		ComboDur = 5,
		CompatibilityTags = { "HAMMERS_STANCE" },
		Conclave = false,
		Disposition = 1.25,
		Family = "Wolf Sledge",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 1036,
		Image = "WolfSledge.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/Hammer/ThrowingHammer",
		Introduced = "24.3",
		Link = "Wolf Sledge",
		Mastery = 7,
		MaxRank = 30,
		MeleeRange = 3.1,
		Name = "Wolf Sledge",
		SellPrice = 5000,
		SlideAttack = 518,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Tradable = 2,
		Users = { "Wolf of Saturn Six" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 1 
	},
	Wrath = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Puncture = 44, Slash = 176 },
				FireRate = 1.2,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 2,
				AttackName = "Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 440 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 3,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Blast = 660 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 65,
		Class = "Heavy Scythe",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY SCYTHE_STANCE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Melee/HeavyScythe/TnOrionSiriusScythe/TnOrionInnateBuff" },
		Disposition = 0.5,
		Family = "Wrath",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.4,
		HeavyAttack = 3960,
		Image = "Wrath.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/HeavyScythe/TnOrionSiriusScythe/TnOrionScytheWeapon",
		Introduced = "43",
		Link = "Wrath",
		Mastery = 14,
		MaxRank = 30,
		MeleeRange = 2.8,
		Name = "Wrath",
		Polarities = { "Madurai" },
		SellPrice = 5000,
		SlideAttack = 500,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.25,
		Tradable = 0,
		Traits = { "Tenno" },
		WindUp = 1,
		_TooltipAttackDisplay = 1 
	},
	Xoris = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Impact = 24, Puncture = 40.8, Slash = 55.2 },
				FireRate = 1.17,
				IsSilent = true,
				StatusChance = 0.18 
			},
			{
				AttackIndex = 2,
				AttackName = "Throw",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Impact = 24, Puncture = 40.8, Slash = 55.2 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 22,
				ShotSpeed = 25,
				ShotType = "Thrown",
				StatusChance = 0.18 
			},
			{
				AttackIndex = 3,
				AttackName = "Throw Bounce Explosion",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Electricity = 250 },
				Falloff = { EndRange = 8, Reduction = 0.7, StartRange = 0 },
				FireRate = 1.17,
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.18 
			},
			{
				AttackIndex = 4,
				AttackName = "Throw Recall Explosion",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 8, Reduction = 0, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact", "Electricity" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.18 
			},
			{
				AttackIndex = 5,
				AttackName = "Charged Throw",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 24, Puncture = 40.8, Slash = 55.2 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 22,
				ShotSpeed = 25,
				ShotType = "Thrown",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 6,
				AttackName = "Charged Throw Bounce Explosion",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 9, Reduction = 0.7, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 7,
				AttackName = "Charged Throw Recall Explosion",
				ChargeTime = 1.192,
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 1000 },
				Falloff = { EndRange = 9, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact", "Electricity" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 8,
				AttackName = "Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Electricity = 240 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 9,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Electricity = 360 },
				Falloff = { EndRange = 8, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.34 
			} 
		},
		BlockAngle = 55,
		Class = "Glaive",
		CodexSecret = true,
		CompatibilityTags = { "GLAIVES_STANCE" },
		Conclave = false,
		Disposition = 0.65,
		Family = "Xoris",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.7,
		HeavyAttack = 0,
		HeavySlamAttack = 360,
		HeavySlamElement = "Electricity",
		HeavySlamForcedProcs = { "Lifted" },
		HeavySlamRadius = 8,
		Image = "Xoris.png",
		InternalName = "/Lotus/Weapons/Corpus/Melee/Glaive/CrpGhostCatcherGlaive/CrpGhostCatcherGlaive",
		Introduced = "28",
		Link = "Xoris",
		Mastery = 4,
		MaxRank = 30,
		MeleeRange = 1.3,
		Name = "Xoris",
		Polarities = {  },
		SellPrice = 5000,
		SlamAttack = 240,
		SlamElement = "Electricity",
		SlamForcedProcs = { "Impact" },
		SlamRadius = 6,
		SlideAttack = 240,
		Slot = "Melee",
		StancePolarity = "Naramon",
		SweepRadius = 0.25,
		Traits = { "Corpus" },
		WindUp = 1.2,
		_TooltipAttackDisplay = 7 
	},
	Zenistar = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Heat = 150, Impact = 80, Slash = 68 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Attacks While Disc Deployed",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 13, Puncture = 13, Slash = 104 },
				FireRate = 0.833,
				IsSilent = true,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 3,
				AttackName = "Disc Impact",
				ChargeTime = 1.09,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 75 },
				FireRate = 0.909,
				IsSilent = true,
				Range = 9,
				StatusChance = 0.15 
			},
			{
				AttackIndex = 4,
				AttackName = "Disc Explosion",
				ChargeTime = 1.09,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Heat = 350 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 0.909,
				IsSilent = true,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.15 
			},
			{
				AttackIndex = 5,
				AttackName = "Disc Aura",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Heat = 50 },
				EffectDuration = 10,
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 1.2,
				IsSilent = true,
				Range = 4,
				StatusChance = 0.5 
			},
			{
				AttackIndex = 6,
				AttackName = "Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 596 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 7,
				AttackName = "Heavy Slam Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 894 },
				Falloff = { EndRange = 9, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Lifted" },
				IsSilent = true,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		BlockAngle = 55,
		Class = "Heavy Blade",
		ComboDur = 5,
		CompatibilityTags = { "HEAVY_BLADE_STANCE" },
		Conclave = true,
		Disposition = 1.15,
		Family = "Zenistar",
		GripType = "MELEE_ONE_HAND",
		FollowThrough = 0.6,
		HeavyAttack = 1788,
		Image = "Zenistar.png",
		InternalName = "/Lotus/Weapons/Tenno/Melee/SunDialAxe/SundialAxeWeapon",
		Introduced = "Update: Specters of the Rail 1",
		Link = "Zenistar",
		Mastery = 6,
		MaxRank = 30,
		MeleeRange = 2.6,
		Name = "Zenistar",
		Polarities = { "Madurai" },
		SlideAttack = 260,
		Slot = "Melee",
		StancePolarity = "Madurai",
		SweepRadius = 0.2,
		Traits = { "Tenno" },
		WindUp = 1.1,
		_TooltipAttackDisplay = 1 
	} 
}
```

