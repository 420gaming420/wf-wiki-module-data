---
title: "Module:Weapons/data/modular"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/modular"
wiki_timestamp: "2026-10-24T14:30:08Z"
---

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [modular weapons](/w/Category:Modular_Weapons "Category:Modular Weapons"). See [Module:Modular](/w/Module:Modular "Module:Modular") and [Module:Modular/data](/w/Module:Modular/data "Module:Modular/data") for data on specific modular parts and their stat modifiers.

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/data/doc?action=edit).*

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Weapons/data/modular?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

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

:   *Last updated: Sat, 24 Oct 2026 14:30:08 +0000 (UTC) by [User:Headbox8424](/w/User:Headbox8424 "User:Headbox8424") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/modular?diff=0))*

## Horizontal Partitions (and where to update data)

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-1 "Edit Section using Source Editor:
Horizontal Partitions (and where to update data)")]

* [Module:Weapons/data/primary](/w/Module:Weapons/data/primary "Module:Weapons/data/primary") - [Primary Weapons](/w/Primary_Weapon "Primary Weapon")
* [Module:Weapons/data/secondary](/w/Module:Weapons/data/secondary "Module:Weapons/data/secondary") - [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon")
* [Module:Weapons/data/melee](/w/Module:Weapons/data/melee "Module:Weapons/data/melee") - [Melee](/w/Melee "Melee") weapons
* [Module:Weapons/data/archwing](/w/Module:Weapons/data/archwing "Module:Weapons/data/archwing") - [Archguns](/w/Archgun "Archgun") and [Archmelees](/w/Archmelee "Archmelee")
* [Module:Weapons/data/companion](/w/Module:Weapons/data/companion "Module:Weapons/data/companion") - [Companion](/w/Companion "Companion") weapons
* [Module:Weapons/data/railjack](/w/Module:Weapons/data/railjack "Module:Weapons/data/railjack") - [Railjack](/w/Railjack "Railjack") turrets and ordnances
* Module:Weapons/data/modular - [Amps](/w/Amp "Amp"), [Zaws](/w/Zaw "Zaw"), and [Kitguns](/w/Kitgun "Kitgun")
* [Module:Weapons/data/misc](/w/Module:Weapons/data/misc "Module:Weapons/data/misc") - everything else

For [Conclave](/w/Conclave "Conclave") data:

* [Module:Weapons/Conclave/data/primary](/w/Module:Weapons/Conclave/data/primary "Module:Weapons/Conclave/data/primary") - Primary Weapons
* [Module:Weapons/Conclave/data/secondary](/w/Module:Weapons/Conclave/data/secondary "Module:Weapons/Conclave/data/secondary") - Secondary Weapons
* [Module:Weapons/Conclave/data/melee](/w/Module:Weapons/Conclave/data/melee "Module:Weapons/Conclave/data/melee") - Melee Weapons

## Attack Data Schema

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-2 "Edit Section using Source Editor:
Attack Data Schema")]

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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-3 "Edit Section using Source Editor:
Gun Entry Schema")]

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
	Disposition = 1.2,
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
| `Disposition` | Riven Disposition | `omegaAttenuation` | `OmegaAttenuation` | Number (float) | ✔️ | [Riven Disposition](/w/Riven_Disposition "Riven Disposition") value | `1.2` |
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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-4 "Edit Section using Source Editor:
Melee Entry Schema")]

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
	Disposition = 1.2,
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
| `Disposition` | Riven Disposition | `omegaAttenuation` | `OmegaAttenuation` | Number (float) | ✔️ | [Riven Disposition](/w/Riven_Disposition "Riven Disposition") value | `0.5` |
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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-5 "Edit Section using Source Editor:
For Module Use")]

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | For module use, indicates that this weapon table entry is special and should ignored when parsing table entries | `true` |
| `_IgnoreInCSV` | Boolean | ❌ | For module use, indicates that this weapon table entry should be ignored when outputting CSV (via [Module:Weapons/csv](/w/Module:Weapons/csv "Module:Weapons/csv")) | `true` |
| `_IgnoreInMasteryCount` | Boolean | ❌ | For module use, indicates that this weapon table entry should be ignored when tallying up mastery totals | `true` |
| `_TooltipAttackDisplay` | Number | ❌ | For module use, tells what table entry in `Attack` table to use when processing weapon tooltips and comparing weapon variants in Comparison sections; `1` will be used if no value is assigned | `4` |

## Preprocessed Data

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-6 "Edit Section using Source Editor:
Preprocessed Data")]

If you want data on the relative stat rankings (percentile-based) of each weapon for each weapon stat, see [Module:Weapons/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata").

## Export Data

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-7 "Edit Section using Source Editor:
Export Data")]

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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-8 "Edit Section using Source Editor:
Weapon Edge Cases")]

Some weapons have complicated mechanics or behaviors that are not currently compatible with the wiki's weapon entry schema:

* [![](/images/thumb/TenetDiplos.png/32px-TenetDiplos.png?b553c)](/w/Tenet_Diplos "Tenet Diplos") [Tenet Diplos](/w/Tenet_Diplos "Tenet Diplos")'s lock-on mechanic while aiming has a ~0.5 second delay after the burst ends before being able to lock-on again. This delay is affected by Fire Rate bonuses. This delay is not the same as `BurstDelay` or `BurstReloadDelay`. Can be thought as the "delay between bursts that is not the reciprocal of Fire Rate".

## Where To Source Weapon Data

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-9 "Edit Section using Source Editor:
Where To Source Weapon Data")]

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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-10 "Edit Section using Source Editor:
Where To Find Weapon Metadata")]

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

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-11 "Edit Section using Source Editor:
Data Validation")]

### Validate data types of key-value pairs

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-12 "Edit Section using Source Editor:
Validate data types of key-value pairs")]

**p.validateDataTypes(frame): There are a total of 0 key-value errors**

### Checking missing keys

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-13 "Edit Section using Source Editor:
Checking missing keys")]

**p.checkForMissingData(frame): There are a total of 0 key-value errors**

### Validate `Attack` tables

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-14 "Edit Section using Source Editor:
Validate Attack tables")]

**p.validateAttacks(frame): There are a total of 0 key-value errors**

### Validate required weapon table keys

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-15 "Edit Section using Source Editor:
Validate required weapon table keys")]

**p.validateRequiredKeys(frame): There are a total of 682 key-value errors**

1. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
2. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
3. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Missing GripType
4. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
5. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Magazine must be a value above 0
6. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Missing reload time or reload time has to be above 0
7. "[Adarza Claws](/w/Adarza_Claws?action=edit&redlink=1 "Adarza Claws (page does not exist)")" Missing trigger type of weapon
8. "[Amanata](/w/Amanata "Amanata")" Heavy attack must be greater than 0
9. "[Apoc](/w/Apoc "Apoc")" Missing GripType
10. "[Apoc](/w/Apoc "Apoc")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
11. "[Apoc Mk I](/w/Apoc_Mk_I "Apoc Mk I")" Missing GripType
12. "[Apoc Mk I](/w/Apoc_Mk_I "Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
13. "[Apoc Mk II](/w/Apoc_Mk_II "Apoc Mk II")" Missing GripType
14. "[Apoc Mk II](/w/Apoc_Mk_II "Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
15. "[Apoc Mk III](/w/Apoc_Mk_III "Apoc Mk III")" Missing GripType
16. "[Apoc Mk III](/w/Apoc_Mk_III "Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
17. "[Arbucep (Atmosphere)](/w/Arbucep_(Atmosphere)?action=edit&redlink=1 "Arbucep (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Arbucep.png
18. "[Artax](/w/Artax "Artax")" AmmoPickup must be a value greater than or equal to 0
19. "[Artax](/w/Artax "Artax")" Missing GripType
20. "[Burst Laser](/w/Burst_Laser "Burst Laser")" AmmoPickup must be a value greater than or equal to 0
21. "[Burst Laser](/w/Burst_Laser "Burst Laser")" Missing GripType
22. "[Burst Laser Prime](/w/Burst_Laser_Prime "Burst Laser Prime")" AmmoPickup must be a value greater than or equal to 0
23. "[Burst Laser Prime](/w/Burst_Laser_Prime "Burst Laser Prime")" Missing GripType
24. "[Cantic Prism](/w/Cantic_Prism "Cantic Prism")" AmmoPickup must be a value greater than or equal to 0
25. "[Cantic Prism](/w/Cantic_Prism "Cantic Prism")" Missing GripType
26. "[Carcinnox](/w/Carcinnox "Carcinnox")" Missing GripType
27. "[Carcinnox](/w/Carcinnox "Carcinnox")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
28. "[Carcinnox Mk I](/w/Carcinnox_Mk_I "Carcinnox Mk I")" Missing GripType
29. "[Carcinnox Mk I](/w/Carcinnox_Mk_I "Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
30. "[Carcinnox Mk II](/w/Carcinnox_Mk_II "Carcinnox Mk II")" Missing GripType
31. "[Carcinnox Mk II](/w/Carcinnox_Mk_II "Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
32. "[Carcinnox Mk III](/w/Carcinnox_Mk_III "Carcinnox Mk III")" Missing GripType
33. "[Carcinnox Mk III](/w/Carcinnox_Mk_III "Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
34. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Missing GripType
35. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
36. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Magazine must be a value above 0
37. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Missing reload time or reload time has to be above 0
38. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Missing GripType
39. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
40. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Magazine must be a value above 0
41. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Missing reload time or reload time has to be above 0
42. "[Cerata](/w/Cerata "Cerata")" Heavy attack must be greater than 0
43. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
44. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
45. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing GripType
46. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
47. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Magazine must be a value above 0
48. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
49. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing trigger type of weapon
50. "[Coda Pathocyst](/w/Coda_Pathocyst "Coda Pathocyst")" Heavy attack must be greater than 0
51. "[Cortege](/w/Cortege "Cortege")" AmmoPickup must be a value greater than or equal to 0
52. "[Cortege (Atmosphere)](/w/Cortege_(Atmosphere)?action=edit&redlink=1 "Cortege (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cortege.png
53. "[Corvas](/w/Corvas "Corvas")" AmmoPickup must be a value greater than or equal to 0
54. "[Corvas (Atmosphere)](/w/Corvas_(Atmosphere)?action=edit&redlink=1 "Corvas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Corvas.png
55. "[Corvas Prime](/w/Corvas_Prime "Corvas Prime")" AmmoPickup must be a value greater than or equal to 0
56. "[Corvas Prime (Atmosphere)](/w/Corvas_Prime_(Atmosphere)?action=edit&redlink=1 "Corvas Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: CorvasPrime.png
57. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
58. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
59. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing GripType
60. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
61. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Magazine must be a value above 0
62. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing reload time or reload time has to be above 0
63. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing trigger type of weapon
64. "[Cryophon](/w/Cryophon "Cryophon")" Missing GripType
65. "[Cryophon](/w/Cryophon "Cryophon")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
66. "[Cryophon Mk I](/w/Cryophon_Mk_I "Cryophon Mk I")" Missing GripType
67. "[Cryophon Mk I](/w/Cryophon_Mk_I "Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
68. "[Cryophon Mk II](/w/Cryophon_Mk_II "Cryophon Mk II")" Missing GripType
69. "[Cryophon Mk II](/w/Cryophon_Mk_II "Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
70. "[Cryophon Mk III](/w/Cryophon_Mk_III "Cryophon Mk III")" Missing GripType
71. "[Cryophon Mk III](/w/Cryophon_Mk_III "Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
72. "[Cryotra](/w/Cryotra "Cryotra")" AmmoPickup must be a value greater than or equal to 0
73. "[Cryotra](/w/Cryotra "Cryotra")" Missing GripType
74. "[Cyngas](/w/Cyngas "Cyngas")" AmmoPickup must be a value greater than or equal to 0
75. "[Cyngas (Atmosphere)](/w/Cyngas_(Atmosphere)?action=edit&redlink=1 "Cyngas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cyngas.png
76. "[Dargyn](/w/Dargyn "Dargyn")" AmmoPickup must be a value greater than or equal to 0
77. "[Dargyn](/w/Dargyn "Dargyn")" Disposition must be between 0.5-1.55; default should be 0.5
78. "[Dargyn](/w/Dargyn "Dargyn")" Missing GripType
79. "[Dargyn](/w/Dargyn "Dargyn")" Image should be in the form of "WeaponName.png"; current value: GrnSkiffMissile.png
80. "[Dargyn](/w/Dargyn "Dargyn")" Missing InternalName
81. "[Dargyn](/w/Dargyn "Dargyn")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
82. "[Deconstructor](/w/Deconstructor "Deconstructor")" AmmoPickup must be a value greater than or equal to 0
83. "[Deconstructor](/w/Deconstructor "Deconstructor")" Missing GripType
84. "[Deconstructor Prime](/w/Deconstructor_Prime "Deconstructor Prime")" AmmoPickup must be a value greater than or equal to 0
85. "[Deconstructor Prime](/w/Deconstructor_Prime "Deconstructor Prime")" Missing GripType
86. "[Deth Machine Rifle](/w/Deth_Machine_Rifle "Deth Machine Rifle")" AmmoPickup must be a value greater than or equal to 0
87. "[Deth Machine Rifle](/w/Deth_Machine_Rifle "Deth Machine Rifle")" Missing GripType
88. "[Deth Machine Rifle Prime](/w/Deth_Machine_Rifle_Prime "Deth Machine Rifle Prime")" AmmoPickup must be a value greater than or equal to 0
89. "[Deth Machine Rifle Prime](/w/Deth_Machine_Rifle_Prime "Deth Machine Rifle Prime")" Missing GripType
90. "[Dissic Scaffold](/w/Dissic_Scaffold "Dissic Scaffold")" AmmoPickup must be a value greater than or equal to 0
91. "[Dissic Scaffold](/w/Dissic_Scaffold "Dissic Scaffold")" Missing GripType
92. "[Dual Decurion](/w/Dual_Decurion "Dual Decurion")" AmmoPickup must be a value greater than or equal to 0
93. "[Dual Decurion (Atmosphere)](/w/Dual_Decurion_(Atmosphere)?action=edit&redlink=1 "Dual Decurion (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: DualDecurion.png
94. "[Exard Scaffold](/w/Exard_Scaffold "Exard Scaffold")" AmmoPickup must be a value greater than or equal to 0
95. "[Exard Scaffold](/w/Exard_Scaffold "Exard Scaffold")" Missing GripType
96. "[Falcor](/w/Falcor "Falcor")" Heavy attack must be greater than 0
97. "[Fluctus](/w/Fluctus "Fluctus")" AmmoPickup must be a value greater than or equal to 0
98. "[Fluctus (Atmosphere)](/w/Fluctus_(Atmosphere)?action=edit&redlink=1 "Fluctus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Fluctus.png
99. "[Galvarc](/w/Galvarc "Galvarc")" Missing GripType
100. "[Galvarc](/w/Galvarc "Galvarc")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
101. "[Galvarc Mk I](/w/Galvarc_Mk_I "Galvarc Mk I")" Missing GripType
102. "[Galvarc Mk I](/w/Galvarc_Mk_I "Galvarc Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
103. "[Galvarc Mk II](/w/Galvarc_Mk_II "Galvarc Mk II")" Missing GripType
104. "[Galvarc Mk II](/w/Galvarc_Mk_II "Galvarc Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
105. "[Galvarc Mk III](/w/Galvarc_Mk_III "Galvarc Mk III")" Missing GripType
106. "[Galvarc Mk III](/w/Galvarc_Mk_III "Galvarc Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
107. "[Garuda Prime Talons](/w/Garuda_Prime_Talons "Garuda Prime Talons")" Missing GripType
108. "[Garuda Talons](/w/Garuda_Talons "Garuda Talons")" Missing GripType
109. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Missing GripType
110. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
111. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Magazine must be a value above 0
112. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Missing reload time or reload time has to be above 0
113. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Missing GripType
114. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
115. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Magazine must be a value above 0
116. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Missing reload time or reload time has to be above 0
117. "[Glaive](/w/Glaive "Glaive")" Heavy attack must be greater than 0
118. "[Glaive Prime](/w/Glaive_Prime "Glaive Prime")" Heavy attack must be greater than 0
119. "[Glazio](/w/Glazio "Glazio")" Missing GripType
120. "[Glazio](/w/Glazio "Glazio")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
121. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Missing GripType
122. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
123. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Missing GripType
124. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
125. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Missing GripType
126. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
127. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" AmmoPickup must be a value greater than or equal to 0
128. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" Missing GripType
129. "[Grattler](/w/Grattler "Grattler")" AmmoPickup must be a value greater than or equal to 0
130. "[Grattler (Atmosphere)](/w/Grattler_(Atmosphere)?action=edit&redlink=1 "Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Grattler.png
131. "[Grimoire](/w/Grimoire "Grimoire")" Magazine must be a value above 0
132. "[Grimoire](/w/Grimoire "Grimoire")" Missing reload time or reload time has to be above 0
133. "[Halikar](/w/Halikar "Halikar")" Heavy attack must be greater than 0
134. "[Halikar Wraith](/w/Halikar_Wraith "Halikar Wraith")" Heavy attack must be greater than 0
135. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoMax must be a value greater than or equal to 0
136. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoPickup must be a value greater than or equal to 0
137. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing GripType
138. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Magazine must be a value above 0
139. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing reload time or reload time has to be above 0
140. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing trigger type of weapon
141. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoMax must be a value greater than or equal to 0
142. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoPickup must be a value greater than or equal to 0
143. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing GripType
144. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
145. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Magazine must be a value above 0
146. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing reload time or reload time has to be above 0
147. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing trigger type of weapon
148. "[Helstrum](/w/Helstrum "Helstrum")" AmmoPickup must be a value greater than or equal to 0
149. "[Helstrum](/w/Helstrum "Helstrum")" Missing GripType
150. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
151. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
152. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing GripType
153. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
154. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Magazine must be a value above 0
155. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing reload time or reload time has to be above 0
156. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing trigger type of weapon
157. "[Imperator](/w/Imperator "Imperator")" AmmoPickup must be a value greater than or equal to 0
158. "[Imperator (Atmosphere)](/w/Imperator_(Atmosphere)?action=edit&redlink=1 "Imperator (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Imperator.png
159. "[Imperator Vandal](/w/Imperator_Vandal "Imperator Vandal")" AmmoPickup must be a value greater than or equal to 0
160. "[Imperator Vandal (Atmosphere)](/w/Imperator_Vandal_(Atmosphere)?action=edit&redlink=1 "Imperator Vandal (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: ImperatorVandal.png
161. "[Kestrel](/w/Kestrel "Kestrel")" Heavy attack must be greater than 0
162. "[Kestrel Prime](/w/Kestrel_Prime "Kestrel Prime")" Heavy attack must be greater than 0
163. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" AmmoPickup must be a value greater than or equal to 0
164. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" Missing GripType
165. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" AmmoPickup must be a value greater than or equal to 0
166. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" Missing GripType
167. "[Kuva Ayanga](/w/Kuva_Ayanga "Kuva Ayanga")" AmmoPickup must be a value greater than or equal to 0
168. "[Kuva Ayanga (Atmosphere)](/w/Kuva_Ayanga_(Atmosphere)?action=edit&redlink=1 "Kuva Ayanga (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaAyanga.png
169. "[Kuva Grattler](/w/Kuva_Grattler "Kuva Grattler")" AmmoPickup must be a value greater than or equal to 0
170. "[Kuva Grattler (Atmosphere)](/w/Kuva_Grattler_(Atmosphere)?action=edit&redlink=1 "Kuva Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaGrattler.png
171. "[Laith](/w/Laith "Laith")" Missing GripType
172. "[Laith](/w/Laith "Laith")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
173. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Missing GripType
174. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
175. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Missing GripType
176. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
177. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Missing GripType
178. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
179. "[Larkspur](/w/Larkspur "Larkspur")" AmmoPickup must be a value greater than or equal to 0
180. "[Larkspur (Atmosphere)](/w/Larkspur_(Atmosphere)?action=edit&redlink=1 "Larkspur (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Larkspur.png
181. "[Larkspur Prime](/w/Larkspur_Prime "Larkspur Prime")" AmmoPickup must be a value greater than or equal to 0
182. "[Larkspur Prime (Atmosphere)](/w/Larkspur_Prime_(Atmosphere)?action=edit&redlink=1 "Larkspur Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: LarkspurPrime.png
183. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
184. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" Missing GripType
185. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Missing GripType
186. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
187. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Missing GripType
188. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
189. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Missing GripType
190. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
191. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Missing GripType
192. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
193. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Missing GripType
194. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
195. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Missing GripType
196. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
197. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Missing GripType
198. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
199. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Missing GripType
200. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
201. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Missing GripType
202. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
203. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Missing GripType
204. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
205. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Missing GripType
206. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
207. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Missing GripType
208. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
209. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Missing GripType
210. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
211. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Missing GripType
212. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
213. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Missing GripType
214. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
215. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Missing GripType
216. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
217. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Missing GripType
218. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
219. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Missing GripType
220. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
221. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Missing GripType
222. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
223. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Missing GripType
224. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
225. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Missing GripType
226. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
227. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Missing GripType
228. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
229. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Missing GripType
230. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
231. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Missing GripType
232. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
233. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Missing GripType
234. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
235. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Missing GripType
236. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
237. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Missing GripType
238. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
239. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Missing GripType
240. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
241. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Missing GripType
242. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
243. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Missing GripType
244. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
245. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Missing GripType
246. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
247. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Missing GripType
248. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
249. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Missing GripType
250. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
251. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Missing GripType
252. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
253. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Missing GripType
254. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
255. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Missing GripType
256. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
257. "[Lega Prism](/w/Lega_Prism "Lega Prism")" AmmoPickup must be a value greater than or equal to 0
258. "[Lega Prism](/w/Lega_Prism "Lega Prism")" Missing GripType
259. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" AmmoPickup must be a value greater than or equal to 0
260. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing GripType
261. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing InternalName
262. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing reload time or reload time has to be above 0
263. "[Mandonel](/w/Mandonel "Mandonel")" AmmoPickup must be a value greater than or equal to 0
264. "[Mandonel](/w/Mandonel "Mandonel")" Missing InternalName
265. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mandonel.png
266. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Missing InternalName
267. "[Mausolon](/w/Mausolon "Mausolon")" AmmoPickup must be a value greater than or equal to 0
268. "[Mausolon (Atmosphere)](/w/Mausolon_(Atmosphere)?action=edit&redlink=1 "Mausolon (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mausolon.png
269. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
270. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
271. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing GripType
272. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
273. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Magazine must be a value above 0
274. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing reload time or reload time has to be above 0
275. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing trigger type of weapon
276. "[Milati](/w/Milati "Milati")" Missing GripType
277. "[Milati](/w/Milati "Milati")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
278. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Missing GripType
279. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
280. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Missing GripType
281. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
282. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Missing GripType
283. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
284. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" Image should be in the form of "WeaponName.png"; current value: Braton.png
285. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" Image should be in the form of "WeaponName.png"; current value: Furis.png
286. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" Image should be in the form of "WeaponName.png"; current value: Kunai.png
287. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" Image should be in the form of "WeaponName.png"; current value: Paris.png
288. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" Image should be in the form of "WeaponName.png"; current value: Strun.png
289. "[Morgha](/w/Morgha "Morgha")" AmmoPickup must be a value greater than or equal to 0
290. "[Morgha (Atmosphere)](/w/Morgha_(Atmosphere)?action=edit&redlink=1 "Morgha (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Morgha.png
291. "[Mote Amp](/w/Mote_Amp "Mote Amp")" AmmoPickup must be a value greater than or equal to 0
292. "[Mote Amp](/w/Mote_Amp "Mote Amp")" Missing GripType
293. "[Multron](/w/Multron "Multron")" AmmoPickup must be a value greater than or equal to 0
294. "[Multron](/w/Multron "Multron")" Missing GripType
295. "[Noodletron](/w/Noodletron "Noodletron")" AmmoPickup must be a value greater than or equal to 0
296. "[Noodletron](/w/Noodletron "Noodletron")" Missing GripType
297. "[Noodletron](/w/Noodletron "Noodletron")" Missing InternalName
298. "[Noodletron](/w/Noodletron "Noodletron")" Magazine must be a value above 0
299. "[Noodletron](/w/Noodletron "Noodletron")" Missing reload time or reload time has to be above 0
300. "[Orvius](/w/Orvius "Orvius")" Heavy attack must be greater than 0
301. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
302. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
303. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing GripType
304. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
305. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Magazine must be a value above 0
306. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing reload time or reload time has to be above 0
307. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing trigger type of weapon
308. "[Parazon](/w/Parazon "Parazon")" AmmoMax must be a value greater than or equal to 0
309. "[Parazon](/w/Parazon "Parazon")" AmmoPickup must be a value greater than or equal to 0
310. "[Parazon](/w/Parazon "Parazon")" Missing GripType
311. "[Parazon](/w/Parazon "Parazon")" Magazine must be a value above 0
312. "[Parazon](/w/Parazon "Parazon")" Missing reload time or reload time has to be above 0
313. "[Parazon](/w/Parazon "Parazon")" Missing trigger type of weapon
314. "[Pathocyst](/w/Pathocyst "Pathocyst")" Heavy attack must be greater than 0
315. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" AmmoPickup must be a value greater than or equal to 0
316. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" Missing GripType
317. "[Phaedra](/w/Phaedra "Phaedra")" AmmoPickup must be a value greater than or equal to 0
318. "[Phaedra (Atmosphere)](/w/Phaedra_(Atmosphere)?action=edit&redlink=1 "Phaedra (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Phaedra.png
319. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" AmmoPickup must be a value greater than or equal to 0
320. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" Missing GripType
321. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
322. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
323. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing GripType
324. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
325. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Magazine must be a value above 0
326. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing reload time or reload time has to be above 0
327. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing trigger type of weapon
328. "[Photor](/w/Photor "Photor")" Missing GripType
329. "[Photor](/w/Photor "Photor")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
330. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Missing GripType
331. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
332. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Missing GripType
333. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
334. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Missing GripType
335. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
336. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
337. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" Missing GripType
338. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" AmmoPickup must be a value greater than or equal to 0
339. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" Missing GripType
340. "[Prisma Dual Decurions](/w/Prisma_Dual_Decurions "Prisma Dual Decurions")" AmmoPickup must be a value greater than or equal to 0
341. "[Prisma Dual Decurions (Atmosphere)](/w/Prisma_Dual_Decurions_(Atmosphere)?action=edit&redlink=1 "Prisma Dual Decurions (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: PrismaDualDecurions.png
342. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" AmmoPickup must be a value greater than or equal to 0
343. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" Missing GripType
344. "[Pugil](/w/Pugil "Pugil")" AmmoMax must be a value greater than or equal to 0
345. "[Pugil](/w/Pugil "Pugil")" AmmoPickup must be a value greater than or equal to 0
346. "[Pugil](/w/Pugil "Pugil")" Missing GripType
347. "[Pugil](/w/Pugil "Pugil")" Missing InternalName
348. "[Pugil](/w/Pugil "Pugil")" Magazine must be a value above 0
349. "[Pugil](/w/Pugil "Pugil")" Missing reload time or reload time has to be above 0
350. "[Pugil](/w/Pugil "Pugil")" Missing trigger type of weapon
351. "[Pulsar](/w/Pulsar "Pulsar")" Missing GripType
352. "[Pulsar](/w/Pulsar "Pulsar")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
353. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Missing GripType
354. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
355. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Missing GripType
356. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
357. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Missing GripType
358. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
359. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" AmmoPickup must be a value greater than or equal to 0
360. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" Missing GripType
361. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
362. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
363. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing GripType
364. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
365. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Magazine must be a value above 0
366. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
367. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing trigger type of weapon
368. "[Rampart](/w/Rampart "Rampart")" AmmoPickup must be a value greater than or equal to 0
369. "[Rampart](/w/Rampart "Rampart")" Disposition must be between 0.5-1.55; default should be 0.5
370. "[Rampart](/w/Rampart "Rampart")" Missing GripType
371. "[Rampart](/w/Rampart "Rampart")" Missing InternalName
372. "[Rampart](/w/Rampart "Rampart")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
373. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" AmmoPickup must be a value greater than or equal to 0
374. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" Missing GripType
375. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing GripType
376. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
377. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Magazine must be a value above 0
378. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing reload time or reload time has to be above 0
379. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing GripType
380. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
381. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Magazine must be a value above 0
382. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing reload time or reload time has to be above 0
383. "[Razorflies](/w/Razorflies "Razorflies")" AmmoMax must be a value greater than or equal to 0
384. "[Razorflies](/w/Razorflies "Razorflies")" AmmoPickup must be a value greater than or equal to 0
385. "[Razorflies](/w/Razorflies "Razorflies")" Missing GripType
386. "[Razorflies](/w/Razorflies "Razorflies")" Image should be in the form of "WeaponName.png"; current value: Razorfly.png
387. "[Razorflies](/w/Razorflies "Razorflies")" Magazine must be a value above 0
388. "[Razorflies](/w/Razorflies "Razorflies")" Missing reload time or reload time has to be above 0
389. "[Razorflies](/w/Razorflies "Razorflies")" Missing trigger type of weapon
390. "[Sagek Prime](/w/Sagek_Prime "Sagek Prime")" Missing GripType
391. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
392. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
393. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing GripType
394. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
395. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Magazine must be a value above 0
396. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
397. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing trigger type of weapon
398. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" AmmoPickup must be a value greater than or equal to 0
399. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" Missing GripType
400. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" AmmoPickup must be a value greater than or equal to 0
401. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" Missing GripType
402. "[Sirocco](/w/Sirocco "Sirocco")" AmmoPickup must be a value greater than or equal to 0
403. "[Sirocco](/w/Sirocco "Sirocco")" Missing GripType
404. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
405. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
406. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing GripType
407. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
408. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Magazine must be a value above 0
409. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing reload time or reload time has to be above 0
410. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing trigger type of weapon
411. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoMax must be a value greater than or equal to 0
412. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoPickup must be a value greater than or equal to 0
413. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing GripType
414. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
415. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Magazine must be a value above 0
416. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing reload time or reload time has to be above 0
417. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing trigger type of weapon
418. "[Soaktron](/w/Soaktron "Soaktron")" AmmoPickup must be a value greater than or equal to 0
419. "[Soaktron](/w/Soaktron "Soaktron")" Missing GripType
420. "[Soaktron](/w/Soaktron "Soaktron")" Missing InternalName
421. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing GripType
422. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
423. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Magazine must be a value above 0
424. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing reload time or reload time has to be above 0
425. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing GripType
426. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
427. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Magazine must be a value above 0
428. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing reload time or reload time has to be above 0
429. "[Stinger](/w/Stinger "Stinger")" AmmoPickup must be a value greater than or equal to 0
430. "[Stinger](/w/Stinger "Stinger")" Missing GripType
431. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
432. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
433. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing GripType
434. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
435. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Magazine must be a value above 0
436. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing reload time or reload time has to be above 0
437. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing trigger type of weapon
438. "[Sweeper](/w/Sweeper "Sweeper")" AmmoPickup must be a value greater than or equal to 0
439. "[Sweeper](/w/Sweeper "Sweeper")" Missing GripType
440. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" AmmoPickup must be a value greater than or equal to 0
441. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" Missing GripType
442. "[Talyn](/w/Talyn "Talyn")" Missing GripType
443. "[Talyn](/w/Talyn "Talyn")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
444. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Missing GripType
445. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
446. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Missing GripType
447. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
448. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Missing GripType
449. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
450. "[Tazicor](/w/Tazicor "Tazicor")" AmmoPickup must be a value greater than or equal to 0
451. "[Tazicor](/w/Tazicor "Tazicor")" Missing GripType
452. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Disposition must be between 0.5-1.55; default should be 0.5
453. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing GripType
454. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
455. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing GripType
456. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
457. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Magazine must be a value above 0
458. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing reload time or reload time has to be above 0
459. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing GripType
460. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
461. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Magazine must be a value above 0
462. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing reload time or reload time has to be above 0
463. "[Tunguska Cannon](/w/Tunguska_Cannon "Tunguska Cannon")" Missing GripType
464. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Missing GripType
465. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
466. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Missing GripType
467. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
468. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Missing GripType
469. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
470. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Missing GripType
471. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
472. "[Unarmed](/w/Unarmed "Unarmed")" AmmoMax must be a value greater than or equal to 0
473. "[Unarmed](/w/Unarmed "Unarmed")" AmmoPickup must be a value greater than or equal to 0
474. "[Unarmed](/w/Unarmed "Unarmed")" Missing GripType
475. "[Unarmed](/w/Unarmed "Unarmed")" Image should be in the form of "WeaponName.png"; current value: Blank.png
476. "[Unarmed](/w/Unarmed "Unarmed")" Missing InternalName
477. "[Unarmed](/w/Unarmed "Unarmed")" Magazine must be a value above 0
478. "[Unarmed](/w/Unarmed "Unarmed")" Missing reload time or reload time has to be above 0
479. "[Unarmed](/w/Unarmed "Unarmed")" Missing trigger type of weapon
480. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
481. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
482. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing GripType
483. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
484. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Magazine must be a value above 0
485. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing reload time or reload time has to be above 0
486. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing trigger type of weapon
487. "[Velocitus](/w/Velocitus "Velocitus")" AmmoPickup must be a value greater than or equal to 0
488. "[Velocitus (Atmosphere)](/w/Velocitus_(Atmosphere)?action=edit&redlink=1 "Velocitus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Velocitus.png
489. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
490. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
491. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing GripType
492. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
493. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Magazine must be a value above 0
494. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing reload time or reload time has to be above 0
495. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing trigger type of weapon
496. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
497. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
498. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing GripType
499. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
500. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Magazine must be a value above 0
501. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing reload time or reload time has to be above 0
502. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing trigger type of weapon
503. "[Verglas](/w/Verglas "Verglas")" AmmoPickup must be a value greater than or equal to 0
504. "[Verglas](/w/Verglas "Verglas")" Missing GripType
505. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" AmmoPickup must be a value greater than or equal to 0
506. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" Missing GripType
507. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing GripType
508. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
509. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Magazine must be a value above 0
510. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing reload time or reload time has to be above 0
511. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing GripType
512. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
513. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Magazine must be a value above 0
514. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing reload time or reload time has to be above 0
515. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Missing GripType
516. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
517. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Missing GripType
518. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
519. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Missing GripType
520. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
521. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Missing GripType
522. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
523. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Missing GripType
524. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
525. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Missing GripType
526. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
527. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Missing GripType
528. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
529. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Missing GripType
530. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
531. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Missing GripType
532. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
533. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Missing GripType
534. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
535. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Missing GripType
536. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
537. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Missing GripType
538. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
539. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Missing GripType
540. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
541. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Missing GripType
542. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
543. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Missing GripType
544. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
545. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Missing GripType
546. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
547. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Missing GripType
548. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
549. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Missing GripType
550. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
551. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Missing GripType
552. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
553. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Missing GripType
554. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
555. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Missing GripType
556. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
557. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Missing GripType
558. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
559. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Missing GripType
560. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
561. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Missing GripType
562. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
563. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Missing GripType
564. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
565. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Missing GripType
566. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
567. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Missing GripType
568. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
569. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Missing GripType
570. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
571. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Missing GripType
572. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
573. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Missing GripType
574. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
575. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Missing GripType
576. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
577. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Missing GripType
578. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
579. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Missing GripType
580. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
581. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Missing GripType
582. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
583. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Missing GripType
584. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
585. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Missing GripType
586. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
587. "[Vinquibus (Melee)](/w/Vinquibus_(Melee) "Vinquibus (Melee)")" Block angle must be a value between 0 exclusive and 100 inclusive
588. "[Vinquibus (Primary)](/w/Vinquibus_(Primary) "Vinquibus (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vinquibus.png
589. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
590. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
591. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing GripType
592. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
593. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Magazine must be a value above 0
594. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing reload time or reload time has to be above 0
595. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing trigger type of weapon
596. "[Vort](/w/Vort "Vort")" Missing GripType
597. "[Vort](/w/Vort "Vort")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
598. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Missing GripType
599. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
600. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Missing GripType
601. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
602. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Missing GripType
603. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
604. "[Vulcax](/w/Vulcax "Vulcax")" AmmoPickup must be a value greater than or equal to 0
605. "[Vulcax](/w/Vulcax "Vulcax")" Missing GripType
606. "[Vulklok](/w/Vulklok "Vulklok")" AmmoPickup must be a value greater than or equal to 0
607. "[Vulklok](/w/Vulklok "Vulklok")" Missing GripType
608. "[War](/w/War "War")" Slide attack must be greater than 0
609. "[War Prime](/w/War_Prime "War Prime")" Slide attack must be greater than 0
610. "[Xoris](/w/Xoris "Xoris")" Heavy attack must be greater than 0
611. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Missing GripType
612. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
613. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Missing GripType
614. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
615. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Missing GripType
616. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
617. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Missing GripType
618. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
619. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Missing GripType
620. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
621. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Missing GripType
622. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
623. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Missing GripType
624. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
625. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Missing GripType
626. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
627. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Missing GripType
628. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
629. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Missing GripType
630. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
631. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Missing GripType
632. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
633. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Missing GripType
634. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
635. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Missing GripType
636. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
637. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Missing GripType
638. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
639. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Missing GripType
640. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
641. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Missing GripType
642. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
643. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Missing GripType
644. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
645. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Missing GripType
646. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
647. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Missing GripType
648. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
649. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Missing GripType
650. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
651. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Missing GripType
652. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
653. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Missing GripType
654. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
655. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Missing GripType
656. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
657. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Missing GripType
658. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
659. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Missing GripType
660. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
661. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Missing GripType
662. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
663. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Missing GripType
664. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
665. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Missing GripType
666. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
667. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Missing GripType
668. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
669. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Missing GripType
670. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
671. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Missing GripType
672. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
673. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Missing GripType
674. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
675. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Missing GripType
676. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
677. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Missing GripType
678. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
679. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Missing GripType
680. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
681. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Missing GripType
682. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png

## Weapon Data

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-16 "Edit Section using Source Editor:
Weapon Data")]

## References

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-17 "Edit Section using Source Editor:
References")]

1. [↑](#cite_ref-1) As of [Hotfix 32.0.12](/w/Update_32#Hotfix_32.0.12 "Update 32") (2022-10-12), this may not be accurate (last checked 2022-11-01 and first noticed a weapon data schema change ~2 months ago). This key is absent on most weapons and if it is present, then equivalent data is under `UpgradeType` key like for [![](/images/thumb/TatsuPrime.png/32px-TatsuPrime.png?7a830)](/w/Tatsu_Prime "Tatsu Prime") [Tatsu Prime](/w/Tatsu_Prime "Tatsu Prime") (see script tag with id "\_\_NEXT\_DATA\_\_" under HTML source on <https://overframe.gg/build/new/5979/tatsu-prime/>). Treat this information as speculation however.

---

```lua
return {
	------------------------------------Amps----------------------------------------
	['Cantic Prism'] = {
		Accuracy = 32,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 3,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.08,
				CritChance = 0.34,
				CritMultiplier = 2.2,
				Damage = {
					Void = 1460,
				},
				FireRate = 2.67,
				IsSilent = true,
				MaxSpread = 6,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 100,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "CanticPrism.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Barrel/CorpAmpSet1BarrelPartA",
		Introduced = "24.2",
		Link = "Cantic Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Cantic Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Burst",
		_TooltipAttackDisplay = 1,
	},
	['Dissic Scaffold'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 50,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = {
					Impact = 15,
				},
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Projectile",
				StatusChance = 0.37,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = {
					Void = 6600,
				},
				Falloff = {
					EndRange = 7,
					Reduction = 0.6,
					StartRange = 0,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.37,
			},
			{
				AttackIndex = 3,
				AttackName = "Explosive Fragments",
				AttackIndex = 2,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = {
					Void = 300,
				},
				Falloff = {
					EndRange = 3,
					Reduction = 1,
					StartRange = 0,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 9,
				PunchThrough = 0,
				StatusChance = 0.37,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "DissicScaffold.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Chassis/CorpAmpSet1ChassisPartB",
		Introduced = "24.2",
		Link = "Dissic Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Dissic Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 2,
	},
	['Exard Scaffold'] = {
		Accuracy = 10,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 20,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				BurstCount = 3,
				BurstDelay = 0.12,
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = {
					Impact = 200,
				},
				Falloff = {
					EndRange = 60,
					Reduction = 0.825,
					StartRange = 40,
				},
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.33,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = {
					Void = 2600,
				},
				Falloff = {
					EndRange = 2.5,
					Reduction = 0.3,
					StartRange = 0,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.5,
				ShotType = "AoE",
				StatusChance = 0.33,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "ExardScaffold.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Chassis/CorpAmpSet1ChassisPartA",
		Introduced = "24.2",
		Link = "Exard Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Exard Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Burst",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 2,
	},
	['Granmu Prism'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 5,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				BurstCount = 3,
				BurstDelay = 0.15,
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = {
					Void = 1000,
				},
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				ProjectileSpeed = 40,
				PunchThrough = 0,
				ShotType = "Projectile",
				StatusChance = 0.12,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = {
					Void = 1400,
				},
				Falloff = {
					EndRange = 3.5,
					Reduction = 0.3,
					StartRange = 0,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.5,
				ShotType = "AoE",
				StatusChance = 0.12,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "GranmuPrism.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Barrel/SentAmpSet1BarrelPartC",
		Introduced = "22",
		Link = "Granmu Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Granmu Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Burst",
		_TooltipAttackDisplay = 1,
	},
	['Klamora Prism'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 2.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = {
					Void = 600,
				},
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 14,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "KlamoraPrism.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Barrel/CorpAmpSet1BarrelPartC",
		Introduced = "24.2",
		Link = "Klamora Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Klamora Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Held",
		_TooltipAttackDisplay = 1,
	},
	['Klebrik Scaffold'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 3,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.6,
				Damage = {
					Void = 320,
				},
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 25,
				ShotType = "Hit-Scan",
				StatusChance = 0.14,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "KlebrikScaffold.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Chassis/SentAmpSet1ChassisPartC",
		Introduced = "22",
		Link = "Klebrik Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Klebrik Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Held",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Lega Prism'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 0.8,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.6,
				Damage = {
					Void = 600,
				},
				FireRate = 7.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 28,
				ShotType = "Hit-Scan",
				StatusChance = 0.34,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "LegaPrism.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Barrel/CorpAmpSet1BarrelPartB",
		Introduced = "24.2",
		Link = "Lega Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Lega Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Held",
		_TooltipAttackDisplay = 1,
	},
	['Mote Amp'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 3.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.5,
				Damage = {
					Void = 240,
				},
				FireRate = 12,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 30,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "MoteAmp.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/SentTrainingAmplifier/SentAmpTrainingBarrel",
		Introduced = "22",
		Link = "Mote Amp",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Mote Amp",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		SellPrice = 2500,
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Held",
		_TooltipAttackDisplay = 1,
	},
	['Pencha Scaffold'] = {
		Accuracy = 100,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 10,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				ChargeTime = 0.8,
				CritChance = 0.14,
				CritMultiplier = 1.6,
				Damage = {
					Void = 9000,
				},
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 2,
				Range = 40,
				ShotType = "Hit-Scan",
				StatusChance = 0.18,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "PenchaScaffold.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Chassis/SentAmpSet1ChassisPartA",
		Introduced = "22",
		Link = "Pencha Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Pencha Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Charge",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Phahd Scaffold'] = {
		Accuracy = 9.1,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 20,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = {
					Void = 3000,
				},
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Projectile",
				StatusChance = 0.12,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.34,
				CritMultiplier = 2.6,
				Damage = {
					Void = 1100,
				},
				Falloff = {
					EndRange = 5,
					Reduction = 0.3,
					StartRange = 0,
				},
				FireRate = 1.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.12,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "PhahdScaffold.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set2/Chassis/SentAmpSet2ChassisPartA",
		Introduced = "23.4",
		Link = "Phahd Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Phahd Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Propa Scaffold'] = {
		Accuracy = 9.1,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 40,
				AttackIndex = 1,
				AttackName = "Explosion",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = {
					Void = 9000,
				},
				Falloff = {
					EndRange = 8,
					Reduction = 0.7,
					StartRange = 0,
				},
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 14,
				ShotType = "AoE",
				StatusChance = 0,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "PropaScaffold.png",
		InternalName = "/Lotus/Weapons/Corpus/OperatorAmplifiers/Set1/Chassis/CorpAmpSet1ChassisPartC",
		Introduced = "24.2",
		Link = "Propa Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Propa Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Rahn Prism'] = {
		Accuracy = 32,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 3,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = {
					Void = 1000,
				},
				FireRate = 5.67,
				IsSilent = true,
				MaxSpread = 6,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Projectile",
				StatusChance = 0.04,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "RahnPrism.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set2/Barrel/SentAmpSet2BarrelPartA",
		Introduced = "22",
		Link = "Rahn Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Rahn Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Auto",
		_TooltipAttackDisplay = 1,
	},
	['Raplak Prism'] = {
		Accuracy = 32,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 10,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 2.6,
				Damage = {
					Void = 3000,
				},
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "RaplakPrism.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Barrel/SentAmpSet1BarrelPartA",
		Introduced = "22",
		Link = "Raplak Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Raplak Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	['Shraksun Scaffold'] = {
		Accuracy = 9.1,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 10,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = {
					Void = 3000,
				},
				FireRate = 1.33,
				ForcedProc = { "Impact" },
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				ProjectileSpeed = 30,
				PunchThrough = 0,
				Range = 9,
				ShotType = "Projectile",
				StatusChance = 0.2,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = {
					Void = 4500,
				},
				Falloff = {
					EndRange = 5,
					Reduction = 0.4,
					StartRange = 0,
				},
				FireRate = 1.33,
				ForcedProc = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "ShraksunScaffold.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Chassis/SentAmpSet1ChassisPartB",
		Introduced = "22",
		Link = "Shraksun Scaffold",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Shraksun Scaffold",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Shwaak Prism'] = {
		Accuracy = 9.1,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 10,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.6,
				Damage = {
					Void = 3500,
				},
				Falloff = {
					EndRange = 30,
					Reduction = 0.5357,
					StartRange = 15,
				},
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 32,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2,
			},
		},
		Class = "Amp",
		Conclave = false,
		Image = "ShwaakPrism.png",
		InternalName = "/Lotus/Weapons/Sentients/OperatorAmplifiers/Set1/Barrel/SentAmpSet1BarrelPartB",
		Introduced = "22",
		Link = "Shwaak Prism",
		Magazine = 100,
		Mastery = 0,
		MaxRank = 30,
		AmmoMax = 0,
		Name = "Shwaak Prism",
		Polarities = {
		},
		Reload = 5.33,
		ReloadDelay = 2,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		Slot = "Amp",
		Traits = {
			"Sentient",
		},
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	Sirocco = {
		Accuracy = 16,
		AmmoMax = 0,
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 2,
				Damage = {
					Void = 2000,
				},
				FireRate = 3,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2,
				ShotType = "Projectile",
				StatusChance = 0.2,
			},
			{
				AttackIndex = 2,
				AttackName = "Overcharged Shot",
				CritChance = 0.8,
				CritMultiplier = 2,
				Damage = {
					Void = 3600,
				},
				FireRate = 0.833,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 0.5,
				ShotType = "Projectile",
				StatusChance = 0.5,
			},
		},
		Class = "Amp",
		CodexSecret = true,
		Conclave = false,
		Image = "Sirocco.png",
		InternalName = "/Lotus/Weapons/Operator/Pistols/DrifterPistol/DrifterPistolPlayerWeapon",
		Introduced = "31",
		Link = "Sirocco",
		Magazine = 10,
		Mastery = 0,
		MaxRank = 30,
		Name = "Sirocco",
		Reload = 2,
		Slot = "Amp",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	------------------------------------Kitguns-------------------------------------
	['Catchmoon (Secondary)'] = {
		Accuracy = 5.9,
		AmmoMax = 70,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Heat = 0,
					Impact = 0,
				},
				ExtraHeadshotDmg = -2,
				Falloff = {
					EndRange = 16,
					Reduction = 0.9375,
					StartRange = 8,
				},
				FireRate = 0,
				ForcedProcs = {
					"Impact",
				},
				IsSilent = false,
				MaxSpread = 22,
				MinSpread = 12,
				Multishot = 1,
				PunchThrough = 0,
				Range = 20,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		CompatibilityTags = { "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.75,
		ExilusPolarity = "Madurai",
		Family = "Catchmoon",
		Image = "Catchmoon.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelAPart",
		Introduced = "24",
		Link = "Catchmoon",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Catchmoon (Secondary)",
		Reload = 0,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	['Catchmoon (Primary)'] = {
		Accuracy = 22.2,
		AmmoMax = 70,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Heat = 0,
					Impact = 0,
				},
				ExtraHeadshotDmg = -2,
				Falloff = {
					EndRange = 40,
					Reduction = 0.9416,
					StartRange = 20,
				},
				FireRate = 0,
				ForcedProcs = {
					"Impact",
				},
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				Range = 42,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0,
			},
		},
		Class = "Shotgun",
		CompatibilityTags = { "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Catchmoon",
		Image = "Catchmoon.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelAPart",
		Introduced = "28",
		Link = "Catchmoon",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Catchmoon (Primary)",
		Reload = 0,
		Slot = "Primary",
		Trigger = "Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Gaze (Secondary)'] = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Puncture = 0,
					Radiation = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Gaze",
		Image = "Gaze.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelDPart",
		Introduced = "24",
		Link = "Gaze",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Gaze (Secondary)",
		Reload = 0,
		Slot = "Secondary",
		Trigger = "Held",
		_TooltipAttackDisplay = 1,
	},
	['Gaze (Primary)'] = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Radiation = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Area of Effect",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Radiation = 0,
				},
				Falloff = {
					EndRange = 3,
					Reduction = 0,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				StatusChance = 0,
			},
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Gaze",
		Image = "Gaze.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelDPart",
		Introduced = "28",
		Link = "Gaze",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Gaze (Primary)",
		Reload = 0,
		Slot = "Primary",
		Trigger = "Held",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Rattleguts (Secondary)'] = {
		Accuracy = 20,
		AmmoMax = 700,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Puncture = 0,
					Radiation = 0,
					Slash = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Rattleguts",
		Image = "Rattleguts.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelCPart",
		Introduced = "24",
		Link = "Rattleguts",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Rattleguts (Secondary)",
		Reload = 0,
		Slot = "Secondary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1,
	},
	['Rattleguts (Primary)'] = {
		Accuracy = 20,
		AmmoMax = 700,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Puncture = 0,
					Radiation = 0,
					Slash = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Rifle",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Rattleguts",
		Image = "Rattleguts.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelCPart",
		Introduced = "28",
		Link = "Rattleguts",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Rattleguts (Primary)",
		Reload = 0,
		Slot = "Primary",
		Trigger = "Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Sporelacer (Secondary)'] = {
		Accuracy = 5.9,
		AmmoMax = 130,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
				},
				Falloff = {
					EndRange = 26,
					Reduction = 0,
					StartRange = 13,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 22,
				MinSpread = 12,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 57,
				ShotType = "Projectile",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Toxin = 0,
				},
				Falloff = {
					EndRange = 4.7,
					Reduction = 0.5,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.7,
				ShotType = "AoE",
				StatusChance = 0,
			},
			{
				AttackIndex = 3,
				AttackName = "Bomblet Impact",
				AttackParentIndex = 2,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Toxin = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 3,
				ShotType = "Projectile",
				StatusChance = 0,
			},
			{
				AttackIndex = 4,
				AttackName = "Bomblet Explosion",
				AttackParentIndex = 3,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Toxin = 0,
				},
				Falloff = {
					EndRange = 2.1,
					Reduction = 0.8,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.1,
				ShotType = "AoE",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		CompatibilityTags = { "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.6,
		ExilusPolarity = "Madurai",
		Family = "Sporelacer",
		Image = "Sporelacer.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfKitGun/Barrels/InfBarrelEgg/InfModularBarrelEggPart",
		Introduced = "29.5",
		Link = "Sporelacer",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Sporelacer (Secondary)",
		Polarities = {
		},
		Reload = 0,
		Slot = "Secondary",
		Traits = {
			"Infested", "Kitgun",
		},
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	['Sporelacer (Primary)'] = {
		Accuracy = 5.9,
		AmmoMax = 60,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
				},
				Falloff = {
					EndRange = 16,
					Reduction = 0,
					StartRange = 8,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 22,
				MinSpread = 12,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Toxin = 0,
				},
				Falloff = {
					EndRange = 2.1,
					Reduction = 0.2,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.1,
				ShotType = "AoE",
				StatusChance = 0,
			},
		},
		Class = "Shotgun",
		CompatibilityTags = { "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Sporelacer",
		Image = "Sporelacer.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfKitGun/Barrels/InfBarrelEgg/InfModularBarrelEggPart",
		Introduced = "29.5",
		Link = "Sporelacer",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Sporelacer (Primary)",
		Polarities = {
		},
		Reload = 0,
		Slot = "Primary",
		Traits = {
			"Infested", "Kitgun",
		},
		Trigger = "Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Tombfinger (Secondary)'] = {
		Accuracy = 50,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Puncture = 0,
					Radiation = 0,
				},
				FireRate = 0,
				ForcedProcs = {
					"Impact",
				},
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 180,
				ShotType = "Projectile",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Radiation = 0,
				},
				Falloff = {
					EndRange = 1.9,
					Reduction = 0.3,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.9,
				ShotType = "AoE",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE", "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.9,
		ExilusPolarity = "Madurai",
		Family = "Tombfinger",
		Image = "Tombfinger.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelBPart",
		Introduced = "24",
		Link = "Tombfinger",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Tombfinger (Secondary)",
		Reload = 0,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1,
	},
	['Tombfinger (Primary)'] = {
		Accuracy = 50,
		AmmoMax = 120,
		AmmoPickup = 20,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Radiation = 0,
				},
				FireRate = 0,
				ForcedProcs = {
					"Impact",
				},
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Quick Shot Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Radiation = 0,
				},
				Falloff = {
					EndRange = 1.7,
					Reduction = 0.25,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.7,
				ShotType = "AoE",
				StatusChance = 0,
			},
			{
				AttackIndex = 3,
				AttackName = "Charged Shot Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Radiation = 0,
				},
				Falloff = {
					EndRange = 6.2,
					Reduction = 0.7,
					StartRange = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6.2,
				ShotType = "AoE",
				StatusChance = 0,
			},
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "MODULAR_GUN", "SEMI_AUTO" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1,
		Family = "Tombfinger",
		ExilusPolarity = "Madurai",
		Image = "Tombfinger.png",
		InternalName = "/Lotus/Weapons/SolarisUnited/Secondary/SUModularSecondarySet1/Barrel/SUModularSecondaryBarrelBPart",
		Introduced = "28",
		Link = "Tombfinger",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Tombfinger (Primary)",
		Reload = 0,
		Slot = "Primary",
		Trigger = "Charge",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Vermisplicer (Secondary)'] = {
		Accuracy = 5.4,
		AmmoMax = 90,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Puncture = 0,
					Slash = 0,
					Toxin = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 37,
				MinSpread = 0,
				Multishot = 5,
				PunchThrough = 1,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Vermisplicer",
		Image = "Vermisplicer.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfKitGun/Barrels/InfBarrelBeam/InfModularBarrelBeamPart",
		Introduced = "29.5",
		Link = "Vermisplicer",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Vermisplicer (Secondary)",
		Reload = 0,
		Slot = "Secondary",
		Traits = {
			"Infested", "Kitgun",
		},
		Trigger = "Held",
		_TooltipAttackDisplay = 1,
	},
	['Vermisplicer (Primary)'] = {
		Accuracy = 80,
		AmmoMax = 90,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Puncture = 0,
					Slash = 0,
					Toxin = 0,
				},
				FireRate = 0,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
			{
				AttackIndex = 2,
				AttackName = "Tendril",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 0,
				Damage = {
					Impact = 0,
					Puncture = 0,
					Slash = 0,
					Toxin = 0,
				},
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "Hit-Scan",
				StatusChance = 0,
			},
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.9,
		Family = "Vermisplicer",
		ExilusPolarity = "Madurai",
		Image = "Vermisplicer.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfKitGun/Barrels/InfBarrelBeam/InfModularBarrelBeamPart",
		Introduced = "29.5",
		Link = "Vermisplicer",
		Magazine = 0,
		Mastery = 0,
		MaxRank = 30,
		Name = "Vermisplicer (Primary)",
		Reload = 0,
		Slot = "Primary",
		Traits = {
			"Infested", "Kitgun",
		},
		Trigger = "Held",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	---------------------------------Zaws-------------------------------------------
	Balla = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Balla Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 11.2,
					Puncture = 134.4,
					Slash = 78.4,
				},
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Dagger / Staff",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.8,
		Family = "Balla",
		Image = "Balla.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipOne",
		Introduced = "22",
		Link = "Balla",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Balla",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Cyath = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Cyath Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 46,
					Puncture = 11.5,
					Slash = 172.5,
				},
				FireRate = 0.92,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Machete / Polearm",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.05,
		Family = "Cyath",
		Image = "Cyath.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipFour",
		Introduced = "22",
		Link = "Cyath",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Cyath",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Dehtat = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Dehtat Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 22.4,
					Puncture = 112,
					Slash = 89.6,
				},
				FireRate = 0.92,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Rapier / Polearm",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.25,
		Family = "Dehtat",
		Image = "Dehtat.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipFive",
		Introduced = "22",
		Link = "Dehtat",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Dehtat",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Dokrahm = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Dokrahm Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 46.4,
					Puncture = 108.1,
					Slash = 154.5,
				},
				FireRate = 1,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Scythe / Heavy Blade",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.75,
		Family = "Dokrahm",
		Image = "Dokrahm.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee02/Tip/TipEleven",
		Introduced = "22.18",
		Link = "Dokrahm",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Dokrahm",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Kronsh = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Kronsh Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 163.8,
					Slash = 70.2,
				},
				FireRate = 0.85,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Machete / Polearm",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.3,
		Family = "Kronsh",
		Image = "Kronsh.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipSix",
		Introduced = "22",
		Link = "Kronsh",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Kronsh",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Mewan = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Mewan Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 56,
					Puncture = 78.4,
					Slash = 89.6,
				},
				FireRate = 0.85,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Sword / Polearm",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.15,
		Family = "Mewan",
		Image = "Mewan.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipThree",
		Introduced = "22",
		Link = "Mewan",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Mewan",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Ooltha = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Ooltha Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 22.4,
					Puncture = 89.6,
					Slash = 112,
				},
				FireRate = 0.92,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Sword / Staff",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.3,
		Family = "Ooltha",
		Image = "Ooltha.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee01/Tip/TipTwo",
		Introduced = "22",
		Link = "Ooltha",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Ooltha",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	['Plague Keewar'] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Plague Keewar Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 88,
					Puncture = 57,
					Slash = 91,
					Viral = 70,
				},
				FireRate = 0.88,
				IsSilent = true,
				StatusChance = 0.22,
			},
		},
		Class = "Zaw Scythe / Staff",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.9,
		Family = "Plague Keewar",
		Image = "PlagueKeewar.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMeleeInfested/Tips/InfestedTipTwo",
		Introduced = "22.3",
		Link = "Plague Keewar",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Plague Keewar",
		Slot = "Melee",
		Traits = {
			"Infested", "Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	['Plague Kripath'] = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Plague Kripath Strike",
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = {
					Impact = 30,
					Puncture = 70,
					Slash = 49,
					Viral = 64,
				},
				FireRate = 0.95,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Rapier / Polearm",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.65,
		Family = "Plague Kripath",
		Image = "PlagueKripath.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMeleeInfested/Tips/InfestedTipOne",
		Introduced = "22.3",
		Link = "Plague Kripath",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Plague Kripath",
		Slot = "Melee",
		Traits = {
			"Infested", "Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Rabvee = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Rabvee Strike",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = {
					Impact = 140.4,
					Puncture = 11.7,
					Slash = 81.9,
				},
				FireRate = 0.85,
				IsSilent = true,
				StatusChance = 0.18,
			},
		},
		Class = "Zaw Machete / Hammer",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 1.3,
		Family = "Rabvee",
		Image = "Rabvee.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee02/Tip/TipTen",
		Introduced = "22.18",
		Link = "Rabvee",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Rabvee",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
	Sepfahn = {
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Sepfahn Strike",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = {
					Impact = 22.6,
					Puncture = 56.5,
					Slash = 146.9,
				},
				FireRate = 0.92,
				IsSilent = true,
				StatusChance = 0.2,
			},
		},
		Class = "Zaw Nikana / Staff",
		Conclave = false,
		Disposition = 1.2,
		_RetiredDisposition = 0.7,
		Family = "Sepfahn",
		Image = "Sepfahn.png",
		InternalName = "/Lotus/Weapons/Ostron/Melee/ModularMelee02/Tip/TipNine",
		Introduced = "22.18",
		Link = "Sepfahn",
		MeleeRange = 1,
		MaxRank = 30,
		Name = "Sepfahn",
		Slot = "Melee",
		Traits = {
			"Zaw",
		},
		SweepRadius = 0.25,
		_TooltipAttackDisplay = 1,
	},
}
```

