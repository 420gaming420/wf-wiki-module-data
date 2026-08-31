---
title: "Module:Weapons/data/primary"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/primary"
wiki_timestamp: "2026-08-24T15:13:54Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Primary Weapons](/w/Primary_Weapon "Primary Weapon").

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/data/doc?action=edit).*

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Weapons/data/primary?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

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

:   *Last updated: Mon, 24 Aug 2026 15:13:54 +0000 (UTC) by [User:Evilflora](/w/User:Evilflora "User:Evilflora") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/primary?diff=0))*

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* Module:Weapons/data/primary - [Primary Weapons](/w/Primary_Weapon "Primary Weapon")
* [Module:Weapons/data/secondary](/w/Module:Weapons/data/secondary "Module:Weapons/data/secondary") - [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon")
* [Module:Weapons/data/melee](/w/Module:Weapons/data/melee "Module:Weapons/data/melee") - [Melee](/w/Melee "Melee") weapons
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
	["AX-52"] = {
		Accuracy = 133.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Puncture = 40 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 0.85,
		ExilusPolarity = "Madurai",
		Family = "AX-52",
		GripType = "",
		Image = "AX-52.png",
		InternalName = "/Lotus/Weapons/Lasria/AK47/TC2024AK47Weapon",
		Introduced = "36.0.5",
		Link = "AX-52",
		Magazine = 40,
		Mastery = 12,
		MaxRank = 30,
		Name = "AX-52",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = {  },
		Trigger = "Auto",
		Users = { "Arthur" },
		_TooltipAttackDisplay = 1
	},
	Acceltra = {
		Accuracy = 23.5,
		AmmoMax = 96,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				CritChance = 0.32,
				CritMultiplier = 2.8,
				Damage = { Impact = 35 },
				FireRate = 12,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.06
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.32,
				CritMultiplier = 2.8,
				Damage = { Puncture = 35.2, Slash = 8.8 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.06
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "AOE", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/SapientPrimary/SapientPrimaryInnateUpgrade",
			"/Lotus/Weapons/Tenno/LongGuns/SapientPrimary/SapientPrimaryRunnerInnateUpgrade"
		},
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Acceltra",
		GripType = "",
		Image = "Acceltra.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/SapientPrimary/SapientPrimaryWeapon",
		Introduced = "25.7",
		Link = "Acceltra",
		Magazine = 48,
		Mastery = 8,
		MaxRank = 30,
		Name = "Acceltra",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2
	},
	["Acceltra Prime"] = {
		Accuracy = 23.5,
		AmmoMax = 96,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 44 },
				FireRate = 10,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.18
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Puncture = 42.4, Slash = 10.6 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 10,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.18
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "AOE", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/SapientPrimary/SapientPrimaryInnateUpgrade",
			"/Lotus/Weapons/Tenno/LongGuns/SapientPrimary/SapientPrimaryRunnerInnateUpgrade"
		},
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Acceltra",
		GripType = "",
		Image = "AcceltraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeAcceltra/PrimeAcceltraWeapon",
		Introduced = "35.0.9",
		Link = "Acceltra Prime",
		Magazine = 48,
		Mastery = 14,
		MaxRank = 30,
		Name = "Acceltra Prime",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2
	},
	Aeolak = {
		Accuracy = 100,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 15, Puncture = 23, Radiation = 5, Slash = 17 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.33,
				Trigger = "Auto"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				ChargeTime = 0.3,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 58.2, Puncture = 9.7, Slash = 29.1 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 8,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.33,
				Trigger = "Auto Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire Explosion",
				AttackParentIndex = 2,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Blast = 789 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.5,
				IsSilent = false,
				Multishot = 1,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.33
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "None",
		Family = "Aeolak",
		GripType = "",
		Image = "Aeolak.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnRifleErsatz/TnRifleErsatzWeapon",
		Introduced = "31.5",
		Link = "Aeolak",
		Magazine = 40,
		Mastery = 10,
		MaxRank = 30,
		Name = "Aeolak",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = { "Duviri" },
		Trigger = "Auto / Charge",
		Users = { "Thrax Legatus" },
		_TooltipAttackDisplay = 1
	},
	Afentis = {
		Accuracy = 100,
		AmmoMax = 12,
		AmmoPickup = 4,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Impact = 20, Puncture = 60, Slash = 20 },
				FireRate = 0.833,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.24
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Blast = 800 },
				ExplosionDelay = 0.8,
				Falloff = { EndRange = 3, Reduction = 0.2, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Ragdoll" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.1
			},
			{
				AttackIndex = 3,
				AttackName = "Spear Throw",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 240, Puncture = 120, Slash = 40 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 1.8,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Semi"
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE", "IMPACTEXPLODE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod",
			"/Lotus/Weapons/Tenno/LongGuns/TnHopliteSpear/TnHopliteGunSpearInnateMod"
		},
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Afentis",
		GripType = "SPEAR",
		Image = "Afentis.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnHopliteSpear/TnHopliteSpearGunWeapon",
		Introduced = "32",
		Link = "Afentis",
		Magazine = 4,
		Mastery = 8,
		MaxRank = 30,
		Name = "Afentis",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2
	},
	["Afentis Prime"] = {
		Accuracy = 100,
		AmmoMax = 12,
		AmmoPickup = 4,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi",
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Impact = 40, Puncture = 120, Slash = 40 },
				FireRate = 0.833,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2.6,
				Damage = { Blast = 800, Heat = 250 },
				ExplosionDelay = 0.4,
				Falloff = { EndRange = 5.5, Reduction = 0.5, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5.5,
				ShotType = "AoE",
				StatusChance = 0.1
			},
			{
				AttackIndex = 3,
				AttackName = "Spear Throw",
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Impact = 330, Puncture = 165, Slash = 55 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 1.8,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi"
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE", "IMPACTEXPLODE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod",
			"/Lotus/Weapons/Tenno/LongGuns/TnHopliteSpear/TnHopliteGunSpearInnateMod"
		},
		Disposition = 0.5,
		ExilusPolarity = "Madurai",
		Family = "Afentis",
		GripType = "SPEAR",
		Image = "AfentisPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeAfentis/PrimeAfentisWeapon",
		Introduced = "43",
		Link = "Afentis Prime",
		Magazine = 4,
		Mastery = 13,
		MaxRank = 30,
		Name = "Afentis Prime",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2
	},
	Alternox = {
		Accuracy = 18.2,
		AmmoMax = 540,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Electricity = 62 },
				ExtraHeadshotDmg = -2,
				FireRate = 4.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Alt-Fire Contact",
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Impact = 5, Puncture = 37.5, Slash = 7.5 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.44,
				Trigger = "Active"
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire Damage over Time",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Electricity = 50 },
				EffectDuration = 10,
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				Multishot = 1,
				Range = 6,
				StatusChance = 0.44,
				Trigger = "DoT"
			},
			{
				AttackIndex = 4,
				AttackName = "Alt-Fire Explosion",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Electricity = 100 },
				ExplosionDelay = 10,
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.44,
				Trigger = "Active"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/GyreRifle/GyreRifleInnateUpgrade" },
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Alternox",
		GripType = "",
		Image = "Alternox.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/GyreRifle/GyreRifleWeapon",
		Introduced = "31.5",
		Link = "Alternox",
		Magazine = 28,
		Mastery = 8,
		MaxRank = 30,
		Name = "Alternox",
		Polarities = { "Madurai" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = { "Tenno" },
		Trigger = "Auto / Active",
		_TooltipAttackDisplay = 1
	},
	["Alternox Prime"] = {
		Accuracy = 18.2,
		AmmoMax = 540,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Electricity = 75 },
				ExtraHeadshotDmg = -2,
				FireRate = 5.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.4
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Alt-Fire Contact",
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 52.5, Slash = 10.5 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Active"
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire Damage over Time",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Electricity = 70 },
				EffectDuration = 10,
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				Multishot = 1,
				Range = 6,
				StatusChance = 0.5,
				Trigger = "DoT"
			},
			{
				AttackIndex = 4,
				AttackName = "Alt-Fire Explosion",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Electricity = 140 },
				ExplosionDelay = 10,
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5,
				Trigger = "Active"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/GyreRifle/GyreRifleInnateUpgrade" },
		Disposition = 0.8,
		ExilusPolarity = "Madurai",
		Family = "Alternox",
		GripType = "",
		Image = "AlternoxPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeAlternox/PrimeAlternoxWeapon",
		Introduced = "41",
		Link = "Alternox Prime",
		Magazine = 42,
		Mastery = 13,
		MaxRank = 30,
		Name = "Alternox Prime",
		Polarities = { "Madurai" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Auto / Active",
		_TooltipAttackDisplay = 1
	},
	Ambassador = {
		Accuracy = 111.1,
		AmmoMax = 960,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.14,
				CritMultiplier = 2.8,
				Damage = { Electricity = 29 },
				FireRate = 13.33,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.8,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26,
				Trigger = "Auto"
			},
			{
				Accuracy = 100,
				AmmoCost = 16,
				AttackIndex = 2,
				AttackName = "Charge",
				ChargeTime = 1,
				CritChance = 0.16,
				CritMultiplier = 2.8,
				Damage = { Electricity = 600 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.32,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Charged AoE",
				ChargeTime = 0.65,
				CritChance = 0.16,
				CritMultiplier = 2.8,
				Damage = { Electricity = 800 },
				Falloff = { EndRange = 6, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.32
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Ambassador",
		GripType = "",
		Image = "Ambassador.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpArSniper/CrpArSniperRifle",
		Introduced = "30.5",
		Link = "Ambassador",
		Magazine = 96,
		Mastery = 10,
		MaxRank = 30,
		Name = "Ambassador",
		Polarities = {  },
		Reload = 2.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Corpus" },
		Trigger = "Auto / Charge",
		_TooltipAttackDisplay = 1
	},
	Amprex = {
		Accuracy = 12.5,
		AmmoMax = 700,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2.2,
				Damage = { Electricity = 22 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 8,
				Multishot = 1,
				PunchThrough = 0,
				Range = 18,
				ShotType = "Hit-Scan",
				StatusChance = 0.22
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO", "AOE" },
		Conclave = true,
		Disposition = 0.85,
		ExilusPolarity = "Naramon",
		Family = "Amprex",
		GripType = "",
		Image = "Amprex.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/ChainLightningGun/ChainLightningRifle",
		Introduced = "13.1",
		Link = "Amprex",
		Magazine = 100,
		Mastery = 10,
		MaxRank = 30,
		Name = "Amprex",
		Reload = 2.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Held",
		Users = { "M-W.A.M." },
		_TooltipAttackDisplay = 1
	},
	["Arca Plasmor"] = {
		Accuracy = 9.1,
		AmmoMax = 50,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 1.6,
				Damage = { Radiation = 600 },
				ExtraHeadshotDmg = -2,
				Falloff = { EndRange = 20, Reduction = 0.6667, StartRange = 10 },
				FireRate = 1.1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 30,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.28
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Arca Plasmor",
		GripType = "",
		Image = "ArcaPlasmor.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpShotgun/CrpShotgun",
		Introduced = "21.7",
		Link = "Arca Plasmor",
		Magazine = 10,
		Mastery = 10,
		MaxRank = 30,
		Name = "Arca Plasmor",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		Users = { "Terra Plasmor Crewman", "Amalgam Arca Kucumatz" },
		_TooltipAttackDisplay = 1
	},
	Argonak = {
		Accuracy = 28.6,
		AmmoMax = 473,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 28.6,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.27,
				CritMultiplier = 2.3,
				Damage = { Impact = 24.51, Puncture = 6.27, Slash = 26.22 },
				FireRate = 4.33,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.19,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Full Auto Mode",
				CritChance = 0.09,
				CritMultiplier = 1.5,
				Damage = { Impact = 24.51, Puncture = 6.27, Slash = 26.22 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Argonak",
		GripType = "",
		Image = "Argonak.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/LaserAimRifle/LaserAimRifle",
		Introduced = "22",
		Link = "Argonak",
		Magazine = 43,
		Mastery = 7,
		MaxRank = 30,
		Name = "Argonak",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Artemis Bow"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 15,
				AttackIndex = 1,
				AttackName = "Base Uncharged Shot",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2
			},
			{
				AmmoCost = 15,
				AttackIndex = 2,
				AttackName = "Base Charged Shot",
				ChargeTime = 1,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AmmoCost = 15,
				AttackIndex = 3,
				AttackName = "Concentrated Arrow Uncharged Shot",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AttackIndex = 4,
				AttackName = "Concentrated Arrow Uncharged Headshot Explosion",
				AttackParentIndex = 3,
				ChargeTime = 1,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Blast = 500 },
				Falloff = { EndRange = 7, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0
			},
			{
				AmmoCost = 15,
				AttackIndex = 5,
				AttackName = "Concentrated Arrow Charged Shot",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AttackIndex = 6,
				AttackName = "Concentrated Arrow Uncharged Headshot Explosion",
				AttackParentIndex = 5,
				ChargeTime = 1,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Blast = 500 },
				Falloff = { EndRange = 7, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0
			}
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "PROJECTILE", "POWER_WEAPON" },
		Conclave = true,
		GripType = "BOW",
		Image = "ArtemisBowWeapon.png",
		InternalName = "/Lotus/Powersuits/Ranger/ExaltedBow",
		Introduced = "23.0",
		Link = "Artemis Bow (Weapon)",
		Magazine = 1,
		MaxRank = 30,
		Name = "Artemis Bow",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.9,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		Users = { "Ivara" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 2
	},
	["Artemis Bow Prime"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 15,
				AttackIndex = 1,
				AttackName = "Base Uncharged Shot",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2
			},
			{
				AmmoCost = 15,
				AttackIndex = 2,
				AttackName = "Base Charged Shot",
				ChargeTime = 1,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 7,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AmmoCost = 15,
				AttackIndex = 3,
				AttackName = "Concentrated Arrow Uncharged Shot",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AttackIndex = 4,
				AttackName = "Concentrated Arrow Uncharged Headshot Explosion",
				AttackParentIndex = 3,
				ChargeTime = 1,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Blast = 500 },
				Falloff = { EndRange = 7, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0
			},
			{
				AmmoCost = 15,
				AttackIndex = 5,
				AttackName = "Concentrated Arrow Charged Shot",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 192, Slash = 14.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				AttackIndex = 6,
				AttackName = "Concentrated Arrow Uncharged Headshot Explosion",
				AttackParentIndex = 5,
				ChargeTime = 1,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Blast = 500 },
				Falloff = { EndRange = 7, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0
			}
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "PROJECTILE", "POWER_WEAPON" },
		Conclave = true,
		GripType = "BOW",
		Image = "ArtemisBowPrimeWeapon.png",
		InternalName = "/Lotus/Powersuits/Ranger/PrimeExaltedBow",
		Introduced = "27.0.4",
		Link = "Artemis Bow (Weapon)",
		Magazine = 1,
		MaxRank = 30,
		Name = "Artemis Bow Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.9,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		Users = { "Ivara Prime" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 2
	},
	Astilla = {
		Accuracy = 25,
		AmmoMax = 112,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Slug Impact",
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = { Impact = 70 },
				Falloff = { EndRange = 60, Reduction = 0.5, StartRange = 40 },
				FireRate = 4.33,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.33
			},
			{
				AttackIndex = 2,
				AttackName = "Glass Explosion",
				AttackParentIndex = 1,
				CritChance = 0.17,
				CritMultiplier = 1.9,
				Damage = { Puncture = 42, Slash = 78 },
				Falloff = { EndRange = 2.4, Reduction = 0.3, StartRange = 0 },
				FireRate = 4.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.4,
				ShotType = "AoE",
				StatusChance = 0.33
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnGlassShotgun/TnGlassShotgunInnateUpgrade" },
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Astilla",
		GripType = "",
		Image = "Astilla.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnGlassShotgun/TnGlassShotgunGun",
		Introduced = "22.0",
		Link = "Astilla",
		Magazine = 16,
		Mastery = 10,
		MaxRank = 30,
		Name = "Astilla",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Astilla Prime"] = {
		Accuracy = 25,
		AmmoMax = 120,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Slug Impact",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 100 },
				Falloff = { EndRange = 100, Reduction = 0.5, StartRange = 60 },
				FireRate = 4.33,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.37
			},
			{
				AttackIndex = 2,
				AttackName = "Glass Explosion",
				AttackParentIndex = 1,
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Puncture = 49, Slash = 91 },
				Falloff = { EndRange = 2.4, Reduction = 0.3, StartRange = 0 },
				FireRate = 4.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.4,
				ShotType = "AoE",
				StatusChance = 0.37
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnGlassShotgun/TnGlassShotgunInnateUpgrade" },
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Astilla",
		GripType = "",
		Image = "AstillaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeAstilla/AstillaPrimeWeapon",
		Introduced = "30.3",
		Link = "Astilla Prime",
		Magazine = 24,
		Mastery = 14,
		MaxRank = 30,
		Name = "Astilla Prime",
		Polarities = { "Madurai", "Naramon", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Attica = {
		Accuracy = 40,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 4, Puncture = 60, Slash = 16 },
				FireRate = 3.67,
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.1
			}
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE", "ATTICA", "CROSSBOW" },
		Conclave = true,
		Disposition = 1.42,
		ExilusPolarity = "Madurai",
		Family = "Attica",
		GripType = "",
		Image = "Attica.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnoPrmryXbow/TnoPrmryXbowWeapon",
		Introduced = "13.0",
		Link = "Attica",
		Magazine = 20,
		Mastery = 7,
		MaxRank = 30,
		Name = "Attica",
		Polarities = { "Madurai" },
		Reload = 2.83,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Basmu = {
		Accuracy = 20,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Electricity = 39 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.29,
				Trigger = "Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Heat = 19 },
				Falloff = { EndRange = 1.7, Reduction = 0.2, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.7,
				ShotType = "AoE",
				StatusChance = 0.29
			},
			{
				Accuracy = 3,
				AttackIndex = 3,
				AttackName = "Held",
				CritChance = 0.02,
				CritMultiplier = 4.8,
				Damage = { Electricity = 12 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 42,
				MinSpread = 24,
				Multishot = 2,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Held"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE", "BATTERY" },
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Basmu",
		GripType = "",
		Image = "Basmu.png",
		InternalName = "/Lotus/Weapons/Sentients/SentRifleNewWar/SentRifleNewWarGun",
		Introduced = "27.3",
		Link = "Basmu",
		Magazine = 21,
		Mastery = 11,
		MaxRank = 30,
		Name = "Basmu",
		Polarities = { "Madurai" },
		Reload = 2.5,
		ReloadDelay = 0.2,
		ReloadDelayEmpty = 2,
		ReloadRate = 42,
		ReloadStyle = "Regenerate",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Sentient" },
		Trigger = "Auto / Held",
		_TooltipAttackDisplay = 1
	},
	Battacor = {
		AmmoMax = 720,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 25,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0.08,
				CritChance = 0.32,
				CritMultiplier = 2.4,
				Damage = { Magnetic = 42, Puncture = 24 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Auto Burst"
			},
			{
				Accuracy = 100,
				AttackIndex = 2,
				AttackName = "Secondary Fire",
				ChargeTime = 0.4,
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Radiation = 208 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 2,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.08,
				Trigger = "Auto Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Secondary Fire AoE",
				AttackParentIndex = 1,
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Radiation = 208 },
				Falloff = { EndRange = 3.4, Reduction = 0.4, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.4,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Battacor",
		GripType = "",
		Image = "Battacor.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpSentExperimentRifle/CrpSentExperimentRifle",
		Introduced = "24",
		Link = "Battacor",
		Magazine = 60,
		Mastery = 10,
		MaxRank = 30,
		Name = "Battacor",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Auto Burst / Charge",
		_TooltipAttackDisplay = 1
	},
	Baza = {
		Accuracy = 80,
		AmmoMax = 800,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 3,
				Damage = { Impact = 5.76, Puncture = 6.72, Slash = 3.52 },
				Falloff = { EndRange = 34, Reduction = 0.5, StartRange = 22 },
				FireRate = 16.67,
				IsSilent = true,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.05,
		ExilusPolarity = "Naramon",
		Family = "Baza",
		GripType = "",
		Image = "Baza.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnSMG/TnSMGWeapon",
		Introduced = "22.4",
		Link = "Baza",
		Magazine = 40,
		Mastery = 7,
		MaxRank = 30,
		Name = "Baza",
		Polarities = { "Madurai" },
		Reload = 1.4,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Baza Prime"] = {
		Accuracy = 80,
		AmmoMax = 840,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 3,
				Damage = { Impact = 5.76, Puncture = 6.72, Slash = 3.52 },
				Falloff = { EndRange = 60, Reduction = 0.5, StartRange = 30 },
				FireRate = 16.67,
				IsSilent = true,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.14
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Baza",
		GripType = "",
		Image = "BazaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeBaza/PrimeBazaGun",
		Introduced = "27.0.4",
		Link = "Baza Prime",
		Magazine = 60,
		Mastery = 10,
		MaxRank = 30,
		Name = "Baza Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.1,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Boar = {
		Accuracy = 5,
		AmmoMax = 120,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.5,
				Damage = { Impact = 12.1, Puncture = 3.3, Slash = 6.6 },
				Falloff = { EndRange = 25, Reduction = 0.5, StartRange = 15 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 30,
				MinSpread = 10,
				Multishot = 8,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.075
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.18,
				CritMultiplier = 1.8,
				Damage = { Heat = 20 },
				FireRate = 7.5,
				IncarnonCharges = 150,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 20,
				ShotType = "Hit-Scan",
				StatusChance = 0.2,
				Trigger = "Held"
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Boar",
		GripType = "",
		Image = "Boar.png",
		IncarnonChargeGain = 3,
		IncarnonImage = "BoarIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/FullAutoShotgun",
		Introduced = "Vanilla",
		Link = "Boar",
		Magazine = 20,
		Mastery = 2,
		MaxRank = 30,
		Name = "Boar",
		Reload = 2.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "New Loka Operatives" },
		_TooltipAttackDisplay = 1
	},
	["Boar Prime"] = {
		Accuracy = 5,
		AmmoMax = 120,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 26, Puncture = 6, Slash = 8 },
				Falloff = { EndRange = 25, Reduction = 0.7, StartRange = 18 },
				FireRate = 4.67,
				IsSilent = false,
				MaxSpread = 30,
				MinSpread = 10,
				Multishot = 8,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1125
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Heat = 30 },
				FireRate = 8,
				IncarnonCharges = 150,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 20,
				ShotType = "Hit-Scan",
				StatusChance = 0.24,
				Trigger = "Held"
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.34,
		ExilusPolarity = "Madurai",
		Family = "Boar",
		GripType = "",
		Image = "BoarPrime.png",
		IncarnonChargeGain = 3,
		IncarnonImage = "BoarPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/PrimeBoar",
		Introduced = "10.0",
		Link = "Boar Prime",
		Magazine = 20,
		Mastery = 11,
		MaxRank = 30,
		Name = "Boar Prime",
		Reload = 2.75,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Boltor = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 2.5, Puncture = 20, Slash = 2.5 },
				FireRate = 8.75,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.14
			},
			{
				Accuracy = 10,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.22,
				CritMultiplier = 2.8,
				Damage = { Impact = 0.4, Puncture = 1.2, Slash = 2.4 },
				FireRate = 10,
				IncarnonCharges = 160,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 8,
				Multishot = 3,
				PunchThrough = 0.6,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.0933,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Boltor",
		GripType = "",
		Image = "Boltor.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "BoltorIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/BoltoRifle",
		Introduced = "6.0",
		Link = "Boltor",
		Magazine = 60,
		Mastery = 2,
		MaxRank = 30,
		Name = "Boltor",
		Polarities = { "Vazarin" },
		Reload = 2.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Equinox Specter" },
		_TooltipAttackDisplay = 1
	},
	["Boltor Prime"] = {
		Accuracy = 50,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 4.6, Puncture = 41.4 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.34
			},
			{
				Accuracy = 10,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.24,
				CritMultiplier = 3,
				Damage = { Impact = 2.4, Puncture = 7.2, Slash = 14.4 },
				FireRate = 11.33,
				IncarnonCharges = 160,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 8,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Boltor",
		GripType = "",
		Image = "BoltorPrime.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "BoltorPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeBoltor/PrimeBoltor",
		Introduced = "12.4",
		Link = "Boltor Prime",
		Magazine = 60,
		Mastery = 13,
		MaxRank = 30,
		Name = "Boltor Prime",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Braton = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.6,
				Damage = { Impact = 7.92, Puncture = 7.92, Slash = 8.16 },
				FireRate = 8.75,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06
			},
			{
				Accuracy = 200,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 20, Puncture = 2, Slash = 28 },
				FireRate = 5,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Heat = 50 },
				Falloff = { EndRange = 3, Reduction = 0.1, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.12
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Braton",
		GripType = "",
		Image = "Braton.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "BratonIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/Rifle",
		Introduced = "Vanilla",
		Link = "Braton",
		Magazine = 45,
		Mastery = 0,
		MaxRank = 30,
		Name = "Braton",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Braton Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 600,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 1.75, Puncture = 12.25, Slash = 21 },
				FireRate = 9.58,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26
			},
			{
				Accuracy = 200,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 28, Puncture = 2.8, Slash = 39.2 },
				FireRate = 5.67,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Heat = 70 },
				Falloff = { EndRange = 3, Reduction = 0.1, StartRange = 0 },
				FireRate = 5.67,
				IsSilent = false,
				Multishot = 1,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Braton",
		GripType = "",
		Image = "BratonPrime.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "BratonPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/BratonPrime",
		Introduced = "9",
		Link = "Braton Prime",
		Magazine = 75,
		Mastery = 8,
		MaxRank = 30,
		Name = "Braton Prime",
		Reload = 2.15,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Braton Vandal"] = {
		Accuracy = 33.33,
		AmmoMax = 550,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 12.25, Puncture = 1.75, Slash = 21 },
				FireRate = 7.5,
				IsSilent = false,
				MaxSpread = 4.5,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.16
			},
			{
				Accuracy = 200,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.38,
				CritMultiplier = 3.2,
				Damage = { Impact = 26, Puncture = 2.6, Slash = 36.4 },
				FireRate = 4.67,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				CritChance = 0.38,
				CritMultiplier = 3.2,
				Damage = { Heat = 65 },
				Falloff = { EndRange = 3, Reduction = 0.1, StartRange = 0 },
				FireRate = 4.67,
				IsSilent = false,
				Multishot = 1,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.22
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Braton",
		GripType = "",
		Image = "BratonVandal.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "BratonVandalIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/VIPRifle",
		Introduced = "6.3.1",
		Link = "Braton Vandal",
		Magazine = 50,
		Mastery = 4,
		MaxRank = 30,
		Name = "Braton Vandal",
		Polarities = { "Madurai" },
		Reload = 1.75,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Vandal" },
		Trigger = "Auto",
		Users = { "Excalibur Specter" },
		_TooltipAttackDisplay = 1
	},
	Bubonico = {
		Accuracy = 25,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 2, Puncture = 13, Slash = 19, Toxin = 7 },
				Falloff = { EndRange = 41, Reduction = 0.5, StartRange = 19 },
				FireRate = 3.83,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1,
				Multishot = 7,
				PunchThrough = 0,
				ShotSpeed = 57,
				ShotType = "Projectile",
				StatusChance = 0.0929,
				Trigger = "Auto"
			},
			{
				Accuracy = 100,
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Burst",
				BurstCount = 3,
				BurstDelay = 0.23,
				CritChance = 0.03,
				CritMultiplier = 3.5,
				Damage = { Impact = 9 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.57,
				Trigger = "Burst"
			},
			{
				AmmoCost = 3,
				AttackIndex = 3,
				AttackName = "Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.03,
				CritMultiplier = 3.5,
				Damage = { Viral = 143 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 3.37,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.57
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE", "AOE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Sentients/Shedu/SheduInnateUpgrade" },
		Disposition = 0.75,
		ExilusPolarity = "Madurai",
		Family = "Bubonico",
		GripType = "ARM_GUN_ONE_HAND",
		Image = "Bubonico.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/InfArmCannon/InfArmCannon",
		Introduced = "29.5",
		Link = "Bubonico",
		Magazine = 27,
		Mastery = 13,
		MaxRank = 30,
		Name = "Bubonico",
		Polarities = { "Naramon" },
		Reload = 4.5,
		ReloadDelay = 1.5,
		ReloadRate = 9,
		ReloadStyle = "Regenerate",
		SellPrice = 8000,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Auto / Burst",
		_TooltipAttackDisplay = 1
	},
	Burston = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.061,
				CritChance = 0.06,
				CritMultiplier = 1.6,
				Damage = { Impact = 10, Puncture = 10, Slash = 10 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18,
				Trigger = "Burst"
			},
			{
				Accuracy = 28.57,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Heat = 3 },
				FireRate = 20,
				IncarnonCharges = 600,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Heat = 3 },
				Falloff = { EndRange = 2, Reduction = 0, StartRange = 0 },
				FireRate = 20,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.3,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Burston",
		GripType = "",
		Image = "Burston.png",
		IncarnonChargeGain = 30,
		IncarnonImage = "BurstonIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/BurstRifle",
		Introduced = "Vanilla",
		Link = "Burston",
		Magazine = 45,
		Mastery = 0,
		MaxRank = 30,
		Name = "Burston",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst / Auto",
		Users = { "Loki Specter" },
		_TooltipAttackDisplay = 1
	},
	["Burston Prime"] = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.04,
				CritChance = 0.18,
				CritMultiplier = 1.8,
				Damage = { Impact = 13.8, Puncture = 13.8, Slash = 18.4 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Burst"
			},
			{
				Accuracy = 28.57,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.28,
				CritMultiplier = 3,
				Damage = { Heat = 13 },
				FireRate = 20,
				IncarnonCharges = 600,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				CritChance = 0.28,
				CritMultiplier = 3,
				Damage = { Heat = 13 },
				Falloff = { EndRange = 2, Reduction = 1, StartRange = 0 },
				FireRate = 20,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.3,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Burston",
		GripType = "",
		Image = "BurstonPrime.png",
		IncarnonChargeGain = 30,
		IncarnonImage = "BurstonPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeBurston/PrimeBurston",
		Introduced = "11.5",
		Link = "Burston Prime",
		Magazine = 45,
		Mastery = 12,
		MaxRank = 30,
		Name = "Burston Prime",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Burst / Auto",
		_TooltipAttackDisplay = 1
	},
	Buzlok = {
		Accuracy = 16.7,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.5,
				Damage = { Impact = 30, Puncture = 24, Slash = 6 },
				FireRate = 6.25,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.21,
				Trigger = "Auto"
			},
			{
				Accuracy = 16.7,
				AttackIndex = 2,
				AttackName = "Beacon",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Puncture = 3 },
				EffectDuration = 20,
				FireRate = 1.67,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Buzlok",
		GripType = "",
		Image = "Buzlok.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnGorgSniperRifle/GrnGorgSniperRifle",
		Introduced = "14.7",
		Link = "Buzlok",
		Magazine = 50,
		Mastery = 11,
		MaxRank = 30,
		Name = "Buzlok",
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Harkonar" }
	},
	["Carmine Penta"] = {
		Accuracy = 100,
		AmmoMax = 40,
		AmmoPickup = 5,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 75 },
				FireRate = 2.7,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 20,
				ShotType = "Projectile",
				StatusChance = 0.1
			},
			{
				AttackIndex = 2,
				AttackName = "Grenade Detonation",
				AttackParentIndex = 1,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 350 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 2.7,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.1
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = false,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Penta",
		GripType = "",
		Image = "CarminePenta.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/GrenadeLauncher/CarminePenta",
		Introduced = "29.10",
		Link = "Carmine Penta",
		Magazine = 10,
		Mastery = 6,
		MaxRank = 30,
		Name = "Carmine Penta",
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Corpus" },
		Trigger = "Active",
		_TooltipAttackDisplay = 2
	},
	Cedo = {
		Accuracy = 20,
		AmmoMax = 200,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Puncture = 30 },
				Falloff = { EndRange = 52, Reduction = 0.9667, StartRange = 26 },
				FireRate = 3.83,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 2,
				Multishot = 6,
				PunchThrough = 0.8,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.003,
				Trigger = "Auto"
			},
			{
				Accuracy = 80,
				AmmoCost = 0,
				AttackIndex = 2,
				AttackName = "Alt-Fire Glaive",
				CritChance = 0.02,
				CritMultiplier = 1.4,
				Damage = { Slash = 20 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.5
			},
			{
				AmmoCost = 0,
				AttackIndex = 3,
				AttackName = "Glaive Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 1.4,
				Damage = { Blast = 10 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/TnAlchemistShotgun/TnAlchemistShotgunInnateMod",
			"/Lotus/Weapons/Tenno/LongGuns/TnAlchemistShotgun/TnAlchemistShotgunSignatureMod"
		},
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Cedo",
		GripType = "",
		Image = "Cedo.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnAlchemistShotgun/TnAlchemistShotgun",
		Introduced = "29.6",
		Link = "Cedo",
		Magazine = 40,
		Mastery = 8,
		MaxRank = 30,
		Name = "Cedo",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Cedo Prime"] = {
		Accuracy = 20,
		AmmoMax = 200,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Puncture = 32 },
				Falloff = { EndRange = 52, Reduction = 0.9667, StartRange = 26 },
				FireRate = 4.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 2,
				Multishot = 7,
				PunchThrough = 0.8,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.02,
				Trigger = "Auto"
			},
			{
				Accuracy = 80,
				AmmoCost = 0,
				AttackIndex = 2,
				AttackName = "Alt-Fire Glaive",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Slash = 20 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.5
			},
			{
				AmmoCost = 0,
				AttackIndex = 3,
				AttackName = "Glaive Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 10 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/TnAlchemistShotgun/TnAlchemistShotgunInnateMod",
			"/Lotus/Weapons/Tenno/LongGuns/TnAlchemistShotgun/TnAlchemistShotgunSignatureMod"
		},
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Cedo",
		GripType = "",
		Image = "CedoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeCedo/PrimeCedoWeapon",
		Introduced = "38.0.10",
		Link = "Cedo Prime",
		Magazine = 40,
		Mastery = 15,
		MaxRank = 30,
		Name = "Cedo Prime",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Cernos = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.36,
				CritMultiplier = 2,
				Damage = { Impact = 171, Puncture = 9.5, Slash = 9.5 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.36,
				CritMultiplier = 2,
				Damage = { Impact = 342, Puncture = 19, Slash = 19 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Cernos",
		GripType = "BOW",
		Image = "Cernos.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/AntlerBow/AntlerBow",
		Introduced = "11.1",
		Link = "Cernos",
		Magazine = 1,
		Mastery = 6,
		MaxRank = 30,
		Name = "Cernos",
		Polarities = { "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	["Cernos Prime"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Horizontal/Vertical Shot",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 82.8, Puncture = 4.6, Slash = 4.6 },
				ExtraHeadshotDmg = 0.5,
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Horizontal/Vertical Shot",
				ChargeTime = 0.5,
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 165.6, Puncture = 9.2, Slash = 9.2 },
				ExtraHeadshotDmg = 0.5,
				FireRate = 1,
				IsSilent = true,
				Multishot = 3,
				PunchThrough = 1,
				ShotSpeed = 95,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Bows/PrimeCernos/CernosPrimeInnateMod" },
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Cernos",
		GripType = "BOW",
		Image = "CernosPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/PrimeCernos/PrimeCernos",
		Introduced = "19.0.7",
		Link = "Cernos Prime",
		Magazine = 1,
		Mastery = 12,
		MaxRank = 30,
		Name = "Cernos Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.65,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	Cinta = {
		Accuracy = 16.7,
		AmmoMax = 60,
		AmmoPickup = 10,
		AmmoType = "Primary",
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Quick Shot",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Puncture = 360, Slash = 90 },
				FireRate = 0.667,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto"
			},
			{
				Accuracy = 100,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1.5,
				CritChance = 0.36,
				CritMultiplier = 3,
				Damage = { Puncture = 640, Slash = 160 },
				FireRate = 0.667,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.32,
				Trigger = "Charge"
			},
			{
				Accuracy = 100,
				AttackIndex = 3,
				AttackName = "Perfect Shot",
				ChargeTime = 1.05,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Heat = 600 },
				FireRate = 0.667,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.34,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Cinta",
		GripType = "BOW",
		Image = "Cinta.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/DaxDuviriAsymetricalBow/DaxDuviriAsymmetricalLongBowPlayerWeapon",
		Introduced = "33",
		Link = "Cinta",
		Magazine = 1,
		Mastery = 6,
		MaxRank = 30,
		Name = "Cinta",
		Polarities = { "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Duviri" },
		Trigger = "Charge",
		Users = { "Dax Arcus" },
		_IgnoreEntry = false,
		_TooltipAttackDisplay = 1
	},
	["Coda Bassocyst"] = {
		Accuracy = 100,
		AmmoMax = 96,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Blast = 789, Radiation = 19 },
				Falloff = { EndRange = 60, Reduction = 0.6745, StartRange = 35 },
				FireRate = 1.17,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 49.6,
				ShotSpeed = 62,
				ShotType = "Projectile",
				StatusChance = 0.4
			},
			{
				Ammocost = 4,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Blast = 303 },
				FireRate = 1.67,
				ForcedProcs = { "Impact", "Magnetic" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 6,
				PunchThrough = 0,
				Range = 25,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.4
			}
		},
		Class = "Shotgun",
		CompatibilityTags = {  },
		Conclave = false,
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Bassocyst",
		GripType = "",
		Image = "CodaBassocyst.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/LongGuns/1999InfShotgun/1999InfShotgunWeapon",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Bassocyst",
		Magazine = 24,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Bassocyst",
		Polarities = { "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Coda Bubonico"] = {
		Accuracy = 25,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.27,
				CritMultiplier = 2.3,
				Damage = { Impact = 2, Puncture = 13, Slash = 19, Toxin = 7 },
				Falloff = { EndRange = 41, Reduction = 0.5, StartRange = 19 },
				FireRate = 5.33,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1,
				Multishot = 7,
				PunchThrough = 1.9,
				ShotSpeed = 57,
				ShotType = "Projectile",
				StatusChance = 0.101429,
				Trigger = "Auto"
			},
			{
				Accuracy = 100,
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Burst",
				BurstCount = 3,
				BurstDelay = 0.23,
				CritChance = 0.05,
				CritMultiplier = 3.5,
				Damage = { Impact = 9 },
				FireRate = 7,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.61,
				Trigger = "Burst"
			},
			{
				AmmoCost = 3,
				AttackIndex = 3,
				AttackName = "Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.05,
				CritMultiplier = 3.5,
				Damage = { Viral = 143 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 3.37,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.57
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE", "AOE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Sentients/Shedu/SheduInnateUpgrade" },
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Bubonico",
		GripType = "ARM_GUN_ONE_HAND",
		Image = "CodaBubonico.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/LongGuns/CodaBubonico/CodaBubonicoCannon",
		Introduced = "42",
		IsLichWeapon = true,
		Link = "Coda Bubonico",
		Magazine = 36,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Bubonico",
		Polarities = { "Naramon", "Madurai", "Naramon" },
		Reload = 5.5,
		ReloadDelay = 1.5,
		ReloadRate = 9,
		ReloadStyle = "Regenerate",
		SellPrice = 8000,
		Slot = "Primary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Auto / Burst",
		_TooltipAttackDisplay = 1
	},
	["Coda Hema"] = {
		Accuracy = 20,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.1,
				CritChance = 0.2,
				CritMultiplier = 2.3,
				Damage = { Viral = 52 },
				FireRate = 5.33,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE" },
		Conclave = false,
		Disposition = 0.95,
		ExilusPolarity = "Naramon",
		Family = "Hema",
		GripType = "",
		Image = "CodaHema.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/LongGuns/CodaHema",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Hema",
		Magazine = 72,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Hema",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	["Coda Sporothrix"] = {
		Accuracy = 100,
		AmmoMax = 45,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 3,
				Damage = { Impact = 101.52, Puncture = 116.56, Slash = 157.92 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 1.83,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 270,
				ShotType = "Projectile",
				StatusChance = 0.55,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "AoE",
				AttackParentIndex = 1,
				CritChance = 0.05,
				CritMultiplier = 3,
				Damage = { Slash = 25, Viral = 23 },
				ExplosionDelay = 0.9,
				Falloff = { EndRange = 2, Reduction = 0.1, StartRange = 0 },
				FireRate = 1.83,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.55
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO", "PROJECTILE" },
		Conclave = false,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Sporothrix",
		GripType = "",
		Image = "CodaSporothrix.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/LongGuns/CodaSporothrix",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Sporothrix",
		Magazine = 11,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Sporothrix",
		Polarities = { "Vazarin" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Semi-Auto",
		Zoom = { "2.7x Zoom (+50% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	["Coda Synapse"] = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 2.7,
				Damage = { Corrosive = 26 },
				ExtraHeadshotDmg = 0.2,
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.2,
				Range = 32,
				ShotType = "Hit-Scan",
				StatusChance = 0.15
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Infested/LongGuns/InfestedRifleInnateUpgrade" },
		Disposition = 0.9,
		ExilusPolarity = "Naramon",
		Family = "Synapse",
		GripType = "",
		Image = "CodaSynapse.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/LongGuns/CodaSynapse",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Synapse",
		Magazine = 76,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Synapse",
		Polarities = { "Madurai" },
		Reload = 1.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	Convectrix = {
		Accuracy = 50,
		AmmoMax = 700,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Impact = 1.2, Puncture = 1.2, Slash = 9.6 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 2,
				Multishot = 2,
				PunchThrough = 0.6,
				Range = 30,
				ShotType = "Hit-Scan",
				StatusChance = 0.45
			},
			{
				AmmoCost = 0.5,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Impact = 0.9, Puncture = 0.9, Slash = 7.2 },
				FireRate = 16,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 2,
				Multishot = 2,
				PunchThrough = 0.6,
				Range = 30,
				ShotType = "Hit-Scan",
				StatusChance = 0.45
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.46,
		ExilusPolarity = "Naramon",
		Family = "Convectrix",
		GripType = "",
		Image = "Convectrix.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpSplitLaser/CrpSplitLaser",
		Introduced = "17.5",
		Link = "Convectrix",
		Magazine = 70,
		Mastery = 7,
		MaxRank = 30,
		Name = "Convectrix",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Held",
		Users = { "Terra Jailer", "Terra Overtaker" },
		_TooltipAttackDisplay = 1
	},
	Corinth = {
		Accuracy = 9.1,
		AmmoMax = 135,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Buckshot",
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 25.2, Puncture = 37.8, Slash = 27 },
				Falloff = { EndRange = 36, Reduction = 0.6667, StartRange = 18 },
				FireRate = 1.17,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 6,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Air Burst Projectile",
				CritChance = 0.04,
				CritMultiplier = 1.6,
				Damage = { Impact = 100 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.28
			},
			{
				AttackIndex = 3,
				AttackName = "Air Burst Explosion",
				AttackParentIndex = 2,
				CritChance = 0.04,
				CritMultiplier = 1.6,
				Damage = { Blast = 404 },
				Falloff = { EndRange = 9.4, Reduction = 0.9, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9.4,
				ShotType = "AoE",
				StatusChance = 0.28
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Corinth",
		GripType = "",
		Image = "Corinth.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnHeavyShotgun/TnHeavyShotgunGun",
		Introduced = "22.8",
		Link = "Corinth",
		Magazine = 5,
		Mastery = 8,
		MaxRank = 30,
		Name = "Corinth",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.3,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Corinth Prime"] = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Buckshot",
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 25.2, Puncture = 37.8, Slash = 27 },
				Falloff = { EndRange = 36, Reduction = 0.64444, StartRange = 18 },
				FireRate = 1.42,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 6,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Air Burst Projectile",
				CritChance = 0.04,
				CritMultiplier = 1.6,
				Damage = { Impact = 100 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.5
			},
			{
				AmmoCost = 4,
				AttackIndex = 3,
				AttackName = "Air Burst Explosion",
				AttackParentIndex = 2,
				CritChance = 0.04,
				CritMultiplier = 1.6,
				Damage = { Blast = 2200 },
				Falloff = { EndRange = 9.8, Reduction = 0.9, StartRange = 0 },
				FireRate = 0.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9.8,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Corinth",
		GripType = "",
		Image = "CorinthPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeCorinth/PrimeCorinth",
		Introduced = "27.3.6",
		Link = "Corinth Prime",
		Magazine = 20,
		Mastery = 14,
		MaxRank = 30,
		Name = "Corinth Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Daikyu = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.34,
				CritMultiplier = 2,
				Damage = { Impact = 210, Puncture = 280, Slash = 210 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 3,
				ShotSpeed = 140,
				ShotType = "Projectile",
				StatusChance = 0.46,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "DAIKYU" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Daikyu",
		GripType = "BOW",
		Image = "Daikyu.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/AsymetricalBow/AsymetricalBow",
		Introduced = "16.5",
		Link = "Daikyu",
		Magazine = 1,
		Mastery = 10,
		MaxRank = 30,
		Name = "Daikyu",
		Polarities = { "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 1
	},
	["Daikyu Prime"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Quick Shot",
				ChargeTime = 0.25,
				CritChance = 0.4,
				CritMultiplier = 2.4,
				Damage = { Impact = 112.5, Puncture = 150, Slash = 112.5 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 3,
				ShotSpeed = 140,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Charge"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.4,
				CritMultiplier = 2.4,
				Damage = { Impact = 225, Puncture = 300, Slash = 225 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 3,
				ShotSpeed = 180,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "DAIKYU" },
		Conclave = true,
		Disposition = 0.9,
		ExilusPolarity = "Naramon",
		Family = "Daikyu",
		GripType = "BOW",
		Image = "DaikyuPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/PrimeDaikyu/PrimeDaikyuBow",
		Introduced = "38.6",
		Link = "Daikyu Prime",
		Magazine = 1,
		Mastery = 15,
		MaxRank = 30,
		Name = "Daikyu Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	Dera = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.6,
				Damage = { Impact = 6, Puncture = 22.5, Slash = 1.5 },
				FireRate = 11.25,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.22
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.22,
				CritMultiplier = 3,
				Damage = { Impact = 40, Magnetic = 80, Puncture = 130, Slash = 80 },
				FireRate = 2,
				IncarnonCharges = 50,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.8,
				Multishot = 1,
				PunchThrough = 3,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Dera",
		GripType = "",
		Image = "Dera.png",
		IncarnonChargeGain = 2,
		IncarnonImage = "DeraIncarnon.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/EnergyRifle",
		Introduced = "8.0",
		Link = "Dera",
		Magazine = 45,
		Mastery = 4,
		MaxRank = 30,
		Name = "Dera",
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Auto",
		Users = { "Crewman", "Corrupted Lancer", "Ranger" },
		_TooltipAttackDisplay = 1
	},
	["Dera Vandal"] = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 2,
				Damage = { Impact = 6.4, Puncture = 24, Slash = 1.6 },
				FireRate = 11.25,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 50, Magnetic = 90, Puncture = 140, Slash = 90 },
				FireRate = 2,
				IncarnonCharges = 50,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.8,
				Multishot = 1,
				PunchThrough = 3,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Dera",
		GripType = "",
		Image = "DeraVandal.png",
		IncarnonChargeGain = 2,
		IncarnonImage = "DeraVandalIncarnon.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/DeraVandal",
		Introduced = "16.5",
		Link = "Dera Vandal",
		Magazine = 60,
		Mastery = 7,
		MaxRank = 30,
		Name = "Dera Vandal",
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Dex Sybaris"] = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0.09,
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 22.5, Puncture = 18.75, Slash = 33.75 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 4,
				BurstDelay = 0.09,
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 28.8, Puncture = 24, Slash = 43.2 },
				FireRate = 3.33,
				ForcedProcs = { "Blast" },
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Sybaris",
		GripType = "",
		Image = "DexSybaris.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "DexSybarisIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/DexTheThird/DexTheThird",
		Introduced = "18.6.2",
		Link = "Dex Sybaris",
		Magazine = 14,
		Mastery = 7,
		MaxRank = 30,
		Name = "Dex Sybaris",
		Reload = 1.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	Drakgoon = {
		Accuracy = 1.4,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 8, Puncture = 8, Slash = 24 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 80,
				MinSpread = 60,
				Multishot = 10,
				PunchThrough = 1.5,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.063
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.075,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 7, Slash = 56 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 10,
				PunchThrough = 2,
				ShotSpeed = 160,
				ShotType = "Projectile",
				StatusChance = 0.069
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Drakgoon",
		GripType = "",
		Image = "Drakgoon.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerFlakCannon/FlakCannon",
		Introduced = "11.6",
		Link = "Drakgoon",
		Magazine = 7,
		Mastery = 5,
		MaxRank = 30,
		Name = "Drakgoon",
		Reload = 2.3,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Charge",
		Users = { "Reth", "Kuva Heavy Gunner" },
		_TooltipAttackDisplay = 2
	},
	Dread = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Impact = 16.8, Puncture = 16.8, Slash = 134.4 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Impact = 16.8, Puncture = 16.8, Slash = 302.4 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 2.5,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				Accuracy = 16.7,
				AttackIndex = 3,
				AttackName = "Incarnon Form Charged Shot",
				ChargeTime = 0.6,
				CritChance = 0.5,
				CritMultiplier = 3,
				Damage = { Heat = 200, Impact = 100, Slash = 100 },
				FireRate = 1.5,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Dread",
		GripType = "BOW",
		Image = "Dread.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "DreadIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/StalkerBow",
		Introduced = "8.0",
		Link = "Dread",
		Magazine = 1,
		Mastery = 5,
		MaxRank = 30,
		Name = "Dread",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Stalker" },
		Trigger = "Charge",
		Users = { "Stalker" },
		_TooltipAttackDisplay = 2
	},
	["EFV-5 Jupiter"] = {
		Accuracy = 133.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.20999999,
				CritMultiplier = 2.3,
				Damage = { Corrosive = 7, Puncture = 31, Slash = 23 },
				FireRate = 7.8334,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0.25
			},
			{
				AmmoCost = 15,
				AttackIndex = 2,
				AttackName = "Buckshot",
				ChargeTime = 1,
				CritChance = 0.21,
				CritMultiplier = 2.1,
				Damage = { Corrosive = 35, Puncture = 57, Slash = 35 },
				Falloff = { EndRange = 10, Reduction = 0.9921, StartRange = 5 },
				FireRate = 7.8334,
				ForcedProcs = { "Corrosive" },
				IsSilent = false,
				MaxSpread = 42,
				MinSpread = 24,
				Multishot = 11,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0.0573,
				Trigger = "Auto Charge"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "EFV-5 Jupiter",
		GripType = "",
		Image = "EFV-5Jupiter.png",
		InternalName = "/Lotus/Weapons/Lasria/LasGooAK/LasGooAKPlayerWeapon",
		Introduced = "38.5",
		Link = "EFV-5 Jupiter",
		Magazine = 65,
		Mastery = 14,
		MaxRank = 30,
		Name = "EFV-5 Jupiter",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = { "Scaldra" },
		Trigger = "Auto / Charge",
		Users = { "Scaldra Jaeger" },
		_TooltipAttackDisplay = 1
	},
	Enkaus = {
		Accuracy = 1,
		AmmoMax = 60,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Primary",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Corrosive = 20, Puncture = 8 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 36,
				ShotType = "Hit-Scan",
				StatusChance = 0.32,
				Trigger = "Held"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Corrosive = 12, Puncture = 4 },
				FireRate = 2,
				MaxSpread = 1,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.32,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Corrosive = 10, Puncture = 4 },
				Falloff = { EndRange = 8, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 1,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.32,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Enkaus",
		GripType = "",
		Image = "Enkaus.png",
		InternalName = "Enkaus",
		Introduced = "42",
		Link = "Enkaus",
		Magazine = 60,
		Mastery = 12,
		MaxRank = 30,
		Name = "Enkaus",
		Polarities = { "Naramon" },
		Reload = 2.2,
		SellPrice = 5000,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Held / Semi",
		_TooltipAttackDisplay = 2
	},
	Evensong = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Quick Shot",
				CritChance = 0.25,
				CritMultiplier = 2.2,
				Damage = { Puncture = 97.5, Slash = 227.5 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.38,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1.2,
				CritChance = 0.25,
				CritMultiplier = 2.2,
				Damage = { Puncture = 150, Slash = 350 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.38,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Charged Radial Attack",
				ChargeTime = 1.2,
				CritChance = 0.25,
				CritMultiplier = 2.2,
				Damage = { Puncture = 45, Slash = 105 },
				Falloff = { EndRange = 4, Reduction = 0.7, StartRange = 0.9 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.38
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Evensong",
		GripType = "BOW",
		Image = "Evensong.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/TnChoirBow/TnChoirBow",
		Introduced = "36",
		Link = "Evensong",
		Magazine = 1,
		Mastery = 10,
		MaxRank = 30,
		Name = "Evensong",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	Exergis = {
		Accuracy = 15.4,
		AmmoMax = 47,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.4,
				Damage = { Impact = 20, Puncture = 120, Radiation = 140, Slash = 260 },
				Falloff = { EndRange = 60, Reduction = 0.508, StartRange = 30 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 3,
				PunchThrough = 0.5,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.36
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE", "SINGLESHOT" },
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Exergis",
		GripType = "",
		Image = "Exergis.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpShapeBlast/CrpShapeBlastShotgun",
		Introduced = "24.2",
		Link = "Exergis",
		Magazine = 1,
		Mastery = 8,
		MaxRank = 30,
		Name = "Exergis",
		Polarities = { "Vazarin" },
		Reload = 1.6,
		ReloadDelay = 0,
		SellPrice = 7500,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Felarx = {
		Accuracy = 7.7,
		AmmoMax = 60,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 38, Puncture = 68.4, Slash = 83.6 },
				Falloff = { EndRange = 28, Reduction = 0.9947, StartRange = 14 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 14,
				MinSpread = 12,
				Multishot = 4,
				PunchThrough = 0,
				Range = 300,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.055,
				Trigger = "Auto"
			},
			{
				Accuracy = 9.1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 3,
				Damage = { Impact = 200, Radiation = 400 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 60,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				Range = 56,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 0.6,
		ExilusPolarity = "Madurai",
		Family = "Felarx",
		GripType = "",
		Image = "Felarx.png",
		IncarnonChargeGain = 2,
		InternalName = "/Lotus/Weapons/Tenno/Zariman/LongGuns/PumpShotgun/ZarimanPumpShotgun",
		Introduced = "31.6",
		Link = "Felarx",
		Magazine = 6,
		Mastery = 14,
		MaxRank = 30,
		Name = "Felarx",
		Polarities = { "Madurai" },
		Reload = 3.7,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Zariman", "Incarnon" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Ferrox = {
		Accuracy = 16.7,
		AmmoMax = 100,
		AmmoPickup = 20,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.32,
				CritMultiplier = 2.8,
				Damage = { Impact = 35, Puncture = 245, Slash = 70 },
				FireRate = 1.33,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				CritChance = 0.32,
				CritMultiplier = 2.8,
				Damage = { Impact = 100 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.1
			},
			{
				AttackIndex = 3,
				AttackName = "Spear Throw",
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Impact = 35, Puncture = 5, Slash = 10 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.33,
				Trigger = "Semi"
			},
			{
				AttackIndex = 4,
				AttackName = "Attraction Field",
				AttackParentIndex = 3,
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Electricity = 150 },
				EffectDuration = 30,
				FireRate = 0.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod" },
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Ferrox",
		GripType = "SPEAR",
		Image = "Ferrox.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/Spears/Railgun/CorpusRailgun",
		Introduced = "19.13",
		Link = "Ferrox",
		Magazine = 10,
		Mastery = 14,
		MaxRank = 30,
		Name = "Ferrox",
		Polarities = { "Madurai", "Vazarin" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Charge",
		Users = { "Derim Zahn" },
		_TooltipAttackDisplay = 1
	},
	["Flux Rifle"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Puncture = 4.84, Slash = 17.16 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 30,
				ShotType = "Hit-Scan",
				StatusChance = 0.24
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO", "BATTERY" },
		Conclave = true,
		Disposition = 1.55,
		ExilusPolarity = "Naramon",
		Family = "Flux Rifle",
		GripType = "",
		Image = "FluxRifle.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/CrpLaserRifle",
		Introduced = "8.0",
		Link = "Flux Rifle",
		Magazine = 50,
		Mastery = 6,
		MaxRank = 30,
		Name = "Flux Rifle",
		Reload = 2.25,
		ReloadDelay = 1,
		ReloadRate = 40,
		ReloadStyle = "Regenerate",
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Held",
		Users = { "Elite Crewman" },
		_TooltipAttackDisplay = 1
	},
	Fulmin = {
		Accuracy = 9.1,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				Accuracy = 111.1,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full Auto Mode",
				CritChance = 0.28,
				CritMultiplier = 2.4,
				Damage = { Electricity = 25, Puncture = 8 },
				FireRate = 9.33,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.8,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
				Trigger = "Auto"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Electricity = 400, Impact = 100 },
				ExtraHeadshotDmg = -2,
				Falloff = { EndRange = 20, Reduction = 0.6666, StartRange = 10 },
				FireRate = 2.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.16
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnWispRifle/TnWispRifleInnateMod" },
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Fulmin",
		GripType = "",
		Image = "Fulmin.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnWispRifle/TnWispRifle",
		Introduced = "25.0",
		Link = "Fulmin",
		Magazine = 60,
		Mastery = 8,
		MaxRank = 30,
		Name = "Fulmin",
		Polarities = {  },
		Reload = 3,
		ReloadDelay = 1,
		ReloadRate = 30,
		ReloadStyle = "Regenerate",
		SellPrice = 7500,
		Slot = "Primary",
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Fulmin Prime"] = {
		Accuracy = 9.1,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				Accuracy = 111.1,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full Auto Mode",
				CritChance = 0.34,
				CritMultiplier = 2.4,
				Damage = { Electricity = 25, Puncture = 8 },
				FireRate = 9.33,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0.8,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
				Trigger = "Auto"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Electricity = 440, Impact = 110 },
				ExtraHeadshotDmg = -2,
				Falloff = { EndRange = 24, Reduction = 0.6666, StartRange = 12 },
				FireRate = 2.17,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.22
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnWispRifle/TnWispRifleInnateMod" },
		Disposition = 0.75,
		ExilusPolarity = "Madurai",
		Family = "Fulmin",
		GripType = "",
		Image = "FulminPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeFulmin/PrimeFulmin",
		Introduced = "33.6",
		Link = "Fulmin Prime",
		Magazine = 80,
		Mastery = 12,
		MaxRank = 30,
		Name = "Fulmin Prime",
		Polarities = { "Naramon" },
		Reload = 2.7,
		ReloadDelay = 0.7,
		ReloadRate = 40,
		ReloadStyle = "Regenerate",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Glaxion = {
		Accuracy = 100,
		AmmoMax = 720,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 2,
				Damage = { Cold = 26 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 24,
				ShotType = "Hit-Scan",
				StatusChance = 0.34
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Glaxion",
		GripType = "",
		Image = "Glaxion.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpFreezeRay/CrpFreezeRayRifle",
		Introduced = "14.5",
		Link = "Glaxion",
		Magazine = 80,
		Mastery = 8,
		MaxRank = 30,
		Name = "Glaxion",
		Reload = 2.2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Held",
		Users = { "Corpus Target", "Armis Ulta", "Dru Pesfor", "Rana Del", "M-W.A.M." },
		_TooltipAttackDisplay = 1
	},
	["Glaxion Vandal"] = {
		Accuracy = 100,
		AmmoMax = 800,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Cold = 29 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 28,
				ShotType = "Hit-Scan",
				StatusChance = 0.38
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Glaxion",
		GripType = "",
		Image = "GlaxionVandal.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpFreezeRay/Vandal/CrpFreezeRayVandalRifle",
		Introduced = "25.0",
		Link = "Glaxion Vandal",
		Magazine = 100,
		Mastery = 12,
		MaxRank = 30,
		Name = "Glaxion Vandal",
		Polarities = {  },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	Gorgon = {
		Accuracy = 12.5,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.17,
				CritMultiplier = 1.5,
				Damage = { Impact = 18.75, Puncture = 3.75, Slash = 2.5 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 7,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09
			},
			{
				Accuracy = 25,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 20, Puncture = 60, Slash = 20 },
				FireRate = 0.833,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.19,
				Trigger = "Auto Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Heat = 750 },
				ExplosionDelay = 1.1,
				Falloff = { EndRange = 5, Reduction = 0.1, StartRange = 0 },
				FireRate = 0.833,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.19
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Gorgon",
		GripType = "",
		Image = "Gorgon.png",
		IncarnonChargeGain = 0.66,
		IncarnonImage = "GorgonIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/HeavyRifle",
		Introduced = "Vanilla",
		Link = "Gorgon",
		Magazine = 90,
		Mastery = 3,
		MaxRank = 30,
		Name = "Gorgon",
		Reload = 4.2,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 9,
		Traits = { "Grineer" },
		Trigger = "Auto-Spool",
		Users = {
			"Lieutenant Lech Kril",
			"Heavy Gunner",
			"Corrupted Heavy Gunner",
			"Manic Bombard"
		},
		_TooltipAttackDisplay = 1
	},
	["Gorgon Wraith"] = {
		Accuracy = 16.7,
		AmmoMax = 900,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.15,
				CritMultiplier = 1.9,
				Damage = { Impact = 22.95, Puncture = 2.7, Slash = 1.35 },
				FireRate = 13.33,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.21
			},
			{
				Accuracy = 25,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 25, Puncture = 75, Slash = 25 },
				FireRate = 1,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.27,
				Trigger = "Auto Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Heat = 750 },
				ExplosionDelay = 0.9,
				Falloff = { EndRange = 5, Reduction = 0.1, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Gorgon",
		GripType = "",
		Image = "GorgonWraith.png",
		IncarnonChargeGain = 0.66,
		IncarnonImage = "GorgonWraithIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/WraithGorgon/WraithGorgon",
		Introduced = "12.4",
		Link = "Gorgon Wraith",
		Magazine = 90,
		Mastery = 7,
		MaxRank = 30,
		Name = "Gorgon Wraith",
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 6,
		Tradable = 2,
		Traits = { "Wraith", "Grineer" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1
	},
	["Gotva Prime"] = {
		Accuracy = 100,
		AmmoMax = 840,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.5,
				Damage = { Puncture = 25 },
				FireRate = 13.33,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 0.85,
		ExilusPolarity = "Naramon",
		Family = "Gotva",
		GripType = "",
		Image = "GotvaPrime.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnOrokinRifle/GrnOrokinRifleWeapon",
		Introduced = "33.6.6",
		Link = "Gotva Prime",
		Magazine = 84,
		Mastery = 14,
		MaxRank = 30,
		Name = "Gotva Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Grakata = {
		Accuracy = 28.6,
		AmmoMax = 750,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 4.4, Puncture = 3.7, Slash = 2.9 },
				FireRate = 20,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Grakata",
		GripType = "",
		Image = "Grakata.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerAssaultRifle/GrnAssaultRifle",
		Introduced = "7.8",
		Link = "Grakata",
		Magazine = 60,
		Mastery = 5,
		MaxRank = 30,
		Name = "Grakata",
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Lancer", "Hellion", "Commander", "Steel Meridian Operatives", "Vay Molta" },
		_TooltipAttackDisplay = 1
	},
	Grinlok = {
		Accuracy = 44.4,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2.5,
				Damage = { Impact = 93.5, Puncture = 18.7, Slash = 74.8 },
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.35
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Grinlok",
		GripType = "",
		Image = "Grinlok.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerLeverActionRifle/GLARifle",
		Introduced = "12.1",
		Link = "Grinlok",
		Magazine = 9,
		Mastery = 7,
		MaxRank = 30,
		Name = "Grinlok",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Nightwatch Lancer", "Kuva Elite Lancer", "Tusk Elite Lancer" },
		_TooltipAttackDisplay = 1
	},
	Haalvu = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Tau = 33 },
				FireRate = 13,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.19
			},
			{
				AmmoCost = 1.5,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				BurstCount = 2,
				BurstDelay = 0.05,
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Tau = 34 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26,
				Trigger = "Burst"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 0.5,
		ExilusPolarity = "Universal",
		Family = "Haalvu",
		GripType = "",
		Image = "Haalvu.png",
		InternalName = "/Lotus/Weapons/Sentients/SentOctaMiniGun/SentOctaMiniGun",
		Introduced = "43.0.7",
		Link = "Haalvu",
		Magazine = 150,
		Mastery = 14,
		MaxRank = 30,
		Name = "Haalvu",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		ReloadDelay = 0.5,
		ReloadRate = 300,
		ReloadStyle = "Regenerate",
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Sentient" },
		Trigger = "Auto",
		--Users = { },
		_TooltipAttackDisplay = 1
	},
	Harpak = {
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 18.2,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.1,
				CritChance = 0.2,
				CritMultiplier = 2.3,
				Damage = { Impact = 5, Puncture = 37.5, Slash = 7.5 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.17,
				Trigger = "Burst"
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Harpoon",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 40, Puncture = 50, Slash = 10 },
				FireRate = 1.5,
				ForcedProcs = { "Puncture" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 40,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.13,
				Trigger = "Semi"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.55,
		ExilusPolarity = "Madurai",
		Family = "Harpak",
		GripType = "",
		Image = "Harpak.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnHarpoonGun/GrnHarpoonGun",
		Introduced = "17.0",
		Link = "Harpak",
		Magazine = 45,
		Mastery = 7,
		MaxRank = 30,
		Name = "Harpak",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Burst / Semi",
		Users = { "Drekar Elite Lancer", "Draga" },
		_TooltipAttackDisplay = 1
	},
	Hek = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 11.25, Puncture = 48.75, Slash = 15 },
				Falloff = { EndRange = 20, Reduction = 0.8, StartRange = 10 },
				FireRate = 2.17,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.107
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Hek",
		GripType = "",
		Image = "Hek.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/QuadShotgun",
		Introduced = "5.2",
		Link = "Hek",
		Magazine = 4,
		Mastery = 4,
		MaxRank = 30,
		Name = "Hek",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Vem Tabook", "Dhurnam", "Kuva Trooper" },
		_TooltipAttackDisplay = 1
	},
	Hema = {
		Accuracy = 20,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.1,
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Viral = 47 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.25
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Hema",
		GripType = "",
		Image = "Hema.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/InfWFAccompanyingPri/InfestedBurstRifle",
		Introduced = "19.5",
		Link = "Hema",
		Magazine = 60,
		Mastery = 7,
		MaxRank = 30,
		Name = "Hema",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	Higasa = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				BurstCount = 5,
				BurstDelay = 0.1,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Puncture = 15.6, Slash = 10.4 },
				FireRate = 2.5,
				MaxSpread = 2,
				MinSpread = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Burst"
			},
			{
				AmmoCost = 0,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Blast = 390 },
				FireRate = 1.2,
				PunchThrough = 2,
				ShotType = "Hit-Scan",
				StatusChance = 0.18,
				Trigger = "Charge"
			}
		},
		Class = "Rifle",
		Conclave = false,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Higasa",
		GripType = "",
		Image = "Higasa.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/Gunbrella/ShrineMaidenGunbrellaWeapon",
		Introduced = "37",
		Link = "Higasa",
		Magazine = 90,
		Mastery = 2,
		MaxRank = 30,
		Name = "Higasa",
		Polarities = { "Vazarin" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst / Charge",
		Users = {  },
		_TooltipAttackDisplay = 1
	},
	Hind = {
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 33.33,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst Mode",
				BurstCount = 5,
				BurstDelay = 0.12,
				CritChance = 0.07,
				CritMultiplier = 1.5,
				Damage = { Impact = 7.5, Puncture = 7.5, Slash = 15 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.15
			},
			{
				Accuracy = 28.6,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 12, Puncture = 12, Slash = 36 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.1,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.42,
		ExilusPolarity = "Naramon",
		Family = "Hind",
		GripType = "",
		Image = "Hind.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/BurstRifle/GrnBurstRifle",
		Introduced = "9.6",
		Link = "Hind",
		Magazine = 65,
		Mastery = 0,
		MaxRank = 30,
		Name = "Hind",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Burst / Semi",
		Users = {
			"Elite Lancer",
			"Dok Thul",
			"Tusk Lancer",
			"Aerial Commander",
			"Plains Commander"
		},
		_TooltipAttackDisplay = 1
	},
	Ignis = {
		Accuracy = 100,
		AmmoMax = 150,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Heat = 33 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 20,
				ShotType = "Hit-Scan",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO", "AOE" },
		Conclave = true,
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Ignis",
		GripType = "",
		Image = "Ignis.png",
		InternalName = "/Lotus/Weapons/ClanTech/Chemical/FlameThrower",
		Introduced = "8.0",
		Link = "Ignis",
		Magazine = 150,
		Mastery = 5,
		MaxRank = 30,
		Name = "Ignis",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Held",
		Users = { "Scorch", "Hyekka Master", "Zura" },
		_TooltipAttackDisplay = 1
	},
	["Ignis Wraith"] = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.17,
				CritMultiplier = 2.5,
				Damage = { Heat = 35 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 27,
				ShotType = "Hit-Scan",
				StatusChance = 0.29
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO", "AOE" },
		Conclave = true,
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Ignis",
		GripType = "",
		Image = "IgnisWraith.png",
		InternalName = "/Lotus/Weapons/ClanTech/Chemical/FlameThrowerWraith",
		Introduced = "19.12",
		Link = "Ignis Wraith",
		Magazine = 200,
		Mastery = 9,
		MaxRank = 30,
		Name = "Ignis Wraith",
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Wraith", "Grineer" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	Javlok = {
		Accuracy = 100,
		AmmoMax = 150,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				ChargeTime = 0.3,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Heat = 160 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.25
			},
			{
				AttackIndex = 2,
				AttackName = "Projectile Explosion",
				AttackParentIndex = 1,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Heat = 120 },
				Falloff = { EndRange = 2.4, Reduction = 0.3, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.4,
				ShotType = "AoE",
				StatusChance = 0.25
			},
			{
				Accuracy = 16.7,
				AttackIndex = 3,
				AttackName = "Spear Throw Impact",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 45, Puncture = 75, Slash = 30 },
				FireRate = 1,
				ForcedProcs = { "Impact", "Knockdown" },
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 0.6,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.25,
				Trigger = "Semi"
			},
			{
				AttackIndex = 4,
				AttackName = "Spear Throw Explosion",
				AttackParentIndex = 3,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Heat = 300 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact", "Stagger" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.25
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE", "AOE", "IMPACTEXPLODE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod" },
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Javlok",
		GripType = "SPEAR",
		Image = "Javlok.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GrnFlameSpear",
		Introduced = "19.4",
		Link = "Javlok",
		Magazine = 6,
		Mastery = 7,
		MaxRank = 30,
		Name = "Javlok",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.9,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto Charge",
		_TooltipAttackDisplay = 1
	},
	Karak = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.09,
				CritMultiplier = 1.5,
				Damage = { Impact = 13.05, Puncture = 8.7, Slash = 7.25 },
				FireRate = 11.67,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.15
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Karak",
		GripType = "",
		Image = "Karak.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerM16Homage/GrineerM16Rifle",
		Introduced = "11.5",
		Link = "Karak",
		Magazine = 30,
		Mastery = 1,
		MaxRank = 30,
		Name = "Karak",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Frontier Elite Lancer" },
		_TooltipAttackDisplay = 1
	},
	["Karak Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Impact = 13.95, Puncture = 9.3, Slash = 7.75 },
				FireRate = 11.67,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.28,
		ExilusPolarity = "Naramon",
		Family = "Karak",
		GripType = "",
		Image = "KarakWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerM16Homage/KarakWraith",
		Introduced = "16.5",
		Link = "Karak Wraith",
		Magazine = 60,
		Mastery = 7,
		MaxRank = 30,
		Name = "Karak Wraith",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Wraith", "Invasion Reward", "Grineer" },
		Trigger = "Auto",
		Users = { "Nightwatch Lancer" },
		_TooltipAttackDisplay = 1
	},
	Kohm = {
		Accuracy = 8,
		AmmoMax = 960,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Pellet",
				CritChance = 0.11,
				CritMultiplier = 2.3,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 25, Reduction = 0.46667, StartRange = 15 },
				FireRate = 0.7333,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.75
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Fully Spooled",
				CritChance = 0.11,
				CritMultiplier = 2.3,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 25, Reduction = 0.46667, StartRange = 15 },
				FireRate = 3.67,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 12,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0625
			}
		},
		Class = "Shotgun",
		Conclave = false,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Kohm",
		GripType = "",
		Image = "Kohm.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnSpark/GrnSparkRifle",
		Introduced = "15.6",
		Link = "Kohm",
		Magazine = 245,
		Mastery = 5,
		MaxRank = 30,
		Name = "Kohm",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 5,
		Traits = { "Grineer" },
		Trigger = "Auto-Spool",
		Users = { "Kuva Lancer" },
		_TooltipAttackDisplay = 2
	},
	Komorex = {
		Accuracy = 20,
		AmmoMax = 40,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2.1,
				Damage = { Impact = 9.7, Puncture = 40.74, Slash = 46.56 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 250,
				ShotType = "Projectile",
				StatusChance = 0.35,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "3.5x Zoom Radial Attack",
				CritChance = 0.16,
				CritMultiplier = 2.1,
				Damage = { Viral = 53 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				StatusChance = 0.34
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Corpus/LongGuns/CrpSentAmlgSniper/CrpSentAmlgSniperConvertAmmoMod"
		},
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Komorex",
		GripType = "",
		Image = "Komorex.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpSentAmlgSniper/CrpSentAmlgSniper",
		Introduced = "25.0",
		Link = "Komorex",
		Magazine = 20,
		Mastery = 8,
		MaxRank = 30,
		Name = "Komorex",
		Polarities = {  },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 5,
		SniperComboReset = 2,
		Traits = { "Sentient", "Corpus" },
		Trigger = "Semi-Auto",
		Users = { "Amalgam Heqet" },
		Zoom = {
			"2x Zoom (-50% Recoil, +2m Punch Through)",
			"3.5x Zoom (+100% Damage, +3.5m Explosion Radius, -75% Fire Rate)"
		},
		_TooltipAttackDisplay = 2
	},
	["Kuva Bramma"] = {
		Accuracy = 16.7,
		AmmoMax = 5,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.4,
				CritChance = 0.35,
				CritMultiplier = 2.1,
				Damage = { Impact = 187 },
				FireRate = 0.667,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.21,
				Trigger = "Charge"
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				ChargeTime = 0.4,
				CritChance = 0.35,
				CritMultiplier = 2.1,
				Damage = { Blast = 839 },
				Falloff = { EndRange = 8.3, Reduction = 0.9, StartRange = 0 },
				FireRate = 0.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 8.3,
				ShotType = "AoE",
				StatusChance = 0.21,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Cluster Bomb Contact",
				ChargeTime = 0.4,
				CritChance = 0.35,
				CritMultiplier = 2.1,
				Damage = { Impact = 49 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 30,
				ShotType = "Projectile",
				StatusChance = 0.21,
				Trigger = "Charge"
			},
			{
				AttackIndex = 4,
				AttackName = "Cluster Bomb Explosion",
				AttackParentIndex = 3,
				ChargeTime = 0.4,
				CritChance = 0.35,
				CritMultiplier = 2.1,
				Damage = { Blast = 57 },
				Falloff = { EndRange = 3.5, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				Range = 3.5,
				ShotType = "AoE",
				StatusChance = 0.21,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT", "GRNBOW" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Grineer/Bows/GrnBow/GrnBowInnateMod"
		},
		Disposition = 0.65,
		ExilusPolarity = "Naramon",
		Family = "Kuva Bramma",
		GripType = "BOW",
		Image = "KuvaBramma.png",
		InternalName = "/Lotus/Weapons/Grineer/Bows/GrnBow/GrnBowWeapon",
		Introduced = "27.1",
		IsLichWeapon = true,
		Link = "Kuva Bramma",
		Magazine = 1,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Bramma",
		Polarities = { "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Charge",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Chakkhurr"] = {
		Accuracy = 100,
		AmmoMax = 55,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.5,
				CritMultiplier = 2.3,
				Damage = { Impact = 260 },
				ExtraHeadshotDmg = 0.5,
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.27
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.5,
				CritMultiplier = 2.3,
				Damage = { Blast = 25, Puncture = 52, Slash = 29 },
				Falloff = { EndRange = 2.9, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.17,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.9,
				ShotType = "AoE",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Grineer/LongGuns/GrnKuvaLichRifle/GrnKuvaLichRifleInnateUpgrade"
		},
		Disposition = 0.95,
		ExilusPolarity = "Naramon",
		Family = "Kuva Chakkhurr",
		GripType = "",
		Image = "KuvaChakkhurr.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnKuvaLichRifle/GrnKuvaLichRifleWeapon",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Chakkhurr",
		Magazine = 11,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Chakkhurr",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3.3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 1
	},
	["Kuva Drakgoon"] = {
		Accuracy = 1.4,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.19,
				CritMultiplier = 2.1,
				Damage = { Impact = 4.6, Puncture = 4.6, Slash = 13.8 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 80,
				MinSpread = 60,
				Multishot = 10,
				PunchThrough = 0,
				ShotSpeed = 130,
				ShotType = "Projectile",
				StatusChance = 0.09
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.3,
				CritChance = 0.21,
				CritMultiplier = 2.5,
				Damage = { Impact = 4.6, Puncture = 4.6, Slash = 36.8 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 10,
				PunchThrough = 1.5,
				ShotSpeed = 190,
				ShotType = "Projectile",
				StatusChance = 0.09
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Drakgoon",
		GripType = "",
		Image = "KuvaDrakgoon.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Drakgoon/KuvaDrakgoon",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Drakgoon",
		Magazine = 11,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Drakgoon",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Charge",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Hek"] = {
		Accuracy = 9.09,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Impact = 13.05, Puncture = 56.55, Slash = 17.4 },
				Falloff = { EndRange = 30, Reduction = 0.828, StartRange = 15 },
				FireRate = 2.17,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.133
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Impact = 13.05, Puncture = 56.55, Slash = 17.4 },
				Falloff = { EndRange = 30, Reduction = 0.989, StartRange = 15 },
				FireRate = 1.17,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 19,
				Multishot = 28,
				PunchThrough = 0.3,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.0332
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Hek",
		GripType = "",
		Image = "KuvaHek.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Hek/KuvaHekWeapon",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Kuva Hek",
		Magazine = 4,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Hek",
		Reload = 1.9,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Kuva Hind"] = {
		Accuracy = 33.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst",
				BurstCount = 5,
				BurstDelay = 0.07,
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Impact = 7.5, Puncture = 7.5, Slash = 15 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.33,
				Trigger = "Burst"
			},
			{
				Accuracy = 28.6,
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Semi-Auto",
				CritChance = 0.37,
				CritMultiplier = 2.9,
				Damage = { Impact = 18, Puncture = 18, Slash = 54 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.21,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Auto",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.33,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Hind",
		GripType = "",
		Image = "KuvaHind.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Hind/KuvaHind",
		Introduced = "27.1",
		IsLichWeapon = true,
		Link = "Kuva Hind",
		Magazine = 90,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Hind",
		Polarities = { "Madurai" },
		Reload = 2.3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Burst / Semi / Auto",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 1
	},
	["Kuva Karak"] = {
		Accuracy = 80,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 2.1,
				Damage = { Impact = 7.13, Puncture = 6.21, Slash = 9.66 },
				FireRate = 11.67,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0.2,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.31
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Karak",
		GripType = "",
		Image = "KuvaKarak.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Karak/KuvaKarak",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Karak",
		Magazine = 70,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Karak",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Auto",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 1
	},
	["Kuva Kohm"] = {
		Accuracy = 8,
		AmmoMax = 836,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Pellet",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 4, Puncture = 4, Slash = 12 },
				Falloff = { EndRange = 26, Reduction = 0.9, StartRange = 13 },
				FireRate = 0.8333,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.9
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Fully Spooled",
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 4, Puncture = 4, Slash = 12 },
				Falloff = { EndRange = 26, Reduction = 0.9, StartRange = 13 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 12,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.075
			}
		},
		Class = "Shotgun",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.9,
		ExilusPolarity = "Madurai",
		Family = "Kohm",
		GripType = "",
		Image = "KuvaKohm.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Kohm/KuvaKohm",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Kohm",
		Magazine = 209,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Kohm",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 5,
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Auto-Spool",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Ogris"] = {
		Accuracy = 100,
		AmmoMax = 7,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Impact = 18.9, Puncture = 8.1 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.47
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.09,
				CritMultiplier = 2,
				Damage = { Blast = 349, Puncture = 183, Slash = 155 },
				Falloff = { EndRange = 7.9, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.9,
				ShotType = "AoE",
				StatusChance = 0.47
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Ogris",
		GripType = "",
		Image = "KuvaOgris.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Ogris/KuvaOgris",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Ogris",
		Magazine = 3,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Ogris",
		Reload = 2.1,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Quartakk"] = {
		Accuracy = 40,
		AmmoMax = 880,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full-Auto",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 19.98, Puncture = 15.66, Slash = 18.36 },
				FireRate = 4.83,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.33,
				Trigger = "Auto"
			},
			{
				Accuracy = 90.9,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Burst-Fire While Aiming",
				BurstCount = 4,
				BurstDelay = 0,
				CritChance = 0.31,
				CritMultiplier = 2.3,
				Damage = { Impact = 19.98, Puncture = 15.66, Slash = 18.36 },
				FireRate = 1.58,
				IsSilent = false,
				MaxSpread = 1.2,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.27,
				Trigger = "Burst"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Quartakk",
		GripType = "",
		Image = "KuvaQuartakk.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Quartakk/KuvaQuartakk",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Quartakk",
		Magazine = 88,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Quartakk",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Auto / Burst",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Sobek"] = {
		Accuracy = 9.1,
		AmmoMax = 240,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 57.75, Puncture = 9.625, Slash = 9.625 },
				Falloff = { EndRange = 40, Reduction = 0.4805, StartRange = 25 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 5,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.21
			}
		},
		Class = "Shotgun",
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.8,
		ExilusPolarity = "Naramon",
		Family = "Sobek",
		GripType = "",
		Image = "KuvaSobek.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Sobek/KuvaSobek",
		Introduced = "35.6",
		IsLichWeapon = true,
		Link = "Kuva Sobek",
		Magazine = 20,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Sobek",
		Reload = 2.1,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Kuva Tonkor"] = {
		Accuracy = 100,
		AmmoMax = 30,
		AmmoPickup = 3,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Puncture = 59 },
				FireRate = 3.17,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.17
			},
			{
				AttackIndex = 2,
				AttackName = "Grenade Explosion",
				AttackParentIndex = 1,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Blast = 302, Puncture = 168, Slash = 204 },
				Falloff = { EndRange = 7, Reduction = 0.7, StartRange = 0 },
				FireRate = 3.17,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.17
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.9,
		ExilusPolarity = "Naramon",
		Family = "Tonkor",
		GripType = "",
		Image = "KuvaTonkor.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Tonkor/KuvaTonkor",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Tonkor",
		Magazine = 1,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Tonkor",
		Reload = 1.5,
		SellPrice = 8500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 2
	},
	["Kuva Zarr"] = {
		Accuracy = 100,
		AmmoMax = 5,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Cannon Mode Projectile",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Impact = 50 },
				FireRate = 2.17,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.31
			},
			{
				AttackIndex = 2,
				AttackName = "Cannon Mode Explosion",
				AttackParentIndex = 1,
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Blast = 673 },
				Falloff = { EndRange = 7, Reduction = 0.7, StartRange = 0 },
				FireRate = 2.17,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.31
			},
			{
				AttackIndex = 3,
				AttackName = "Cannon Mode Cluster Bomb Contact",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Impact = 15 },
				FireRate = 2.17,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 8,
				ShotType = "Projectile",
				StatusChance = 0.31
			},
			{
				AttackIndex = 4,
				AttackName = "Cannon Mode Cluster Bomb Explosion",
				AttackParentIndex = 3,
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Blast = 50 },
				Falloff = { EndRange = 3, Reduction = 0.1, StartRange = 0 },
				FireRate = 2.17,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.31
			},
			{
				Accuracy = 4.3,
				AmmoCost = 1,
				AttackIndex = 5,
				AttackName = "Barrage Mode",
				CritChance = 0.37,
				CritMultiplier = 2.5,
				Damage = { Impact = 15, Puncture = 25, Slash = 10 },
				Falloff = { EndRange = 40, Reduction = 0.98, StartRange = 20 },
				FireRate = 2.17,
				IsSilent = false,
				MaxSpread = 29,
				MinSpread = 17,
				Multishot = 10,
				PunchThrough = 1.6,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.097
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.7,
		ExilusPolarity = "Madurai",
		Family = "Zarr",
		GripType = "",
		Image = "KuvaZarr.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/LongGuns/Zarr/KuvaZarr",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Kuva Zarr",
		Magazine = 5,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Zarr",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 4.8,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2
	},
	Lanka = {
		Accuracy = 100,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Partially Charged Shot",
				ChargeTime = 0.33,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 200 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = math.huge,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.5,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.25
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Electricity = 525 },
				FireRate = math.huge,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 5,
				ShotSpeed = 250,
				ShotType = "Projectile",
				StatusChance = 0.25
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "PROJECTILE", "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Lanka",
		GripType = "",
		Image = "Lanka.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/Railgun",
		Introduced = "8.0",
		Link = "Lanka",
		Magazine = 10,
		Mastery = 10,
		MaxRank = 30,
		Name = "Lanka",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 6,
		Traits = { "Corpus" },
		Trigger = "Charge",
		Users = {
			"Sniper Crewman",
			"The Sergeant",
			"Nullifier Crewman",
			"Corrupted Nullifier",
			"The Perrin Sequence Operatives"
		},
		Zoom = {
			"3x (+20% Critical Chance)",
			"5x (+30% Critical Chance)",
			"8x (+50% Critical Chance)"
		},
		_TooltipAttackDisplay = 2
	},
	Latron = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 8.25, Puncture = 38.5, Slash = 8.25 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			},
			{
				Accuracy = 28.6,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Impact = 50 },
				FireRate = 3.33,
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.24,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Heat = 40, Puncture = 40 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.24
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "None",
		Family = "Latron",
		GripType = "",
		Image = "Latron.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "LatronIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/SemiAutoRifle",
		Introduced = "Vanilla",
		Link = "Latron",
		Magazine = 15,
		Mastery = 0,
		MaxRank = 30,
		Name = "Latron",
		Polarities = { "Madurai" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Clem" },
		_TooltipAttackDisplay = 1
	},
	["Latron Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.8,
				Damage = { Impact = 9, Puncture = 72, Slash = 9 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26
			},
			{
				Accuracy = 100,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.44,
				CritMultiplier = 3.4,
				Damage = { Impact = 50 },
				FireRate = 3.33,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.44,
				CritMultiplier = 3.4,
				Damage = { Heat = 70, Puncture = 70 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Latron",
		GripType = "",
		Image = "LatronPrime.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "LatronPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/LatronPrime",
		Introduced = "8.0",
		Link = "Latron Prime",
		Magazine = 15,
		Mastery = 10,
		MaxRank = 30,
		Name = "Latron Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Latron Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.8,
				Damage = { Impact = 15.5, Puncture = 43.4, Slash = 3.1 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.14
			},
			{
				Accuracy = 28.6,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.48,
				CritMultiplier = 3.4,
				Damage = { Impact = 50 },
				FireRate = 3.67,
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.28,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.48,
				CritMultiplier = 3.4,
				Damage = { Heat = 50, Puncture = 50 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.67,
				IsSilent = false,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.28
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Latron",
		GripType = "",
		Image = "LatronWraith.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "LatronIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/WraithLatron/WraithLatron",
		Introduced = "14.5",
		Link = "Latron Wraith",
		Magazine = 15,
		Mastery = 7,
		MaxRank = 30,
		Name = "Latron Wraith",
		Polarities = { "Madurai" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Wraith", "Invasion Reward", "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Lenz = {
		Accuracy = 16.7,
		AmmoMax = 6,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Impact = 50 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.05,
				Trigger = "Charge"
			},
			{
				AttackIndex = 2,
				AttackName = "Initial Blast",
				AttackParentIndex = 1,
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Cold = 10 },
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.05,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Bubble Collapse",
				AttackParentIndex = 1,
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = { Blast = 660 },
				ExplosionDelay = 1.3,
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.05,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "SNIPER_AMMO", "AOE", "SINGLESHOT", "CRPBOW" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Corpus/Bow/Longbow/CrpBowConvertAmmoMod" },
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Lenz",
		GripType = "BOW",
		Image = "Lenz.png",
		InternalName = "/Lotus/Weapons/Corpus/Bow/Longbow/CrpBow",
		Introduced = "21.3",
		Link = "Lenz",
		Magazine = 1,
		Mastery = 8,
		MaxRank = 30,
		Name = "Lenz",
		Polarities = { "Naramon", "Naramon" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 3
	},
	Lizzie = {
		AmmoMax = 0,
		AmmoType = "Backbeat metronome",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.35,
				CritMultiplier = 2.3,
				Damage = { Heat = 85 },
				FireRate = 8,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				Range = 10,
				ShotType = "Hit-Scan",
				StatusChance = 0.35
			},
			{
				AmmoCost = 2,
				AttackIndex = 2,
				AttackName = "Viral Wave",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Viral = 100 },
				FireRate = 5.33,
				ForcedProcs = { "Impact", "Viral" },
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.25
			},
			{
				AmmoCost = 2,
				AttackIndex = 3,
				AttackName = "Magnetic Wave",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Magnetic = 100 },
				FireRate = 5.33,
				ForcedProcs = { "Impact", "Magnetic" },
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.25
			},
			{
				AmmoCost = 2,
				AttackIndex = 4,
				AttackName = "Cold Wave",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Cold = 100 },
				FireRate = 5.33,
				ForcedProcs = { "Impact", "Cold" },
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.25
			},
			{
				AmmoCost = 2,
				AttackIndex = 5,
				AttackName = "Corrosive Wave",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Corrosive = 100 },
				FireRate = 5.33,
				ForcedProcs = { "Impact", "Corrosive" },
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.25
			}
		},
		Class = "Exalted Weapon",
		CodexSecret = true,
		CompatibilityTags = { "POWER_WEAPON", "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		GripType = "GUITAR",
		Image = "Lizzie.png",
		InternalName = "/Lotus/Powersuits/Temple/ExaltedGuitar",
		Introduced = "38.5",
		Link = "Lizzie",
		Magazine = 275,
		MaxRank = 30,
		Name = "Lizzie",
		Polarities = { "Naramon", "Madurai" },
		Reload = 0,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Held",
		Users = { "Temple" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1
	},
	Miter = {
		Accuracy = 100,
		AmmoMax = 80,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 10, Slash = 70 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.2
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.75,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 25, Puncture = 25, Slash = 450 },
				FireRate = 2.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 2.5,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.5
			},
			{
				Accuracy = 20,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 3.3,
				Damage = { Impact = 12, Puncture = 6, Slash = 42 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 48,
				ShotType = "Projectile",
				StatusChance = 0.56,
				Trigger = "Auto"
			},
			{
				AttackIndex = 4,
				AttackName = "Incarnon Form Radial Attack",
				AttackParentIndex = 3,
				CritChance = 0.2,
				CritMultiplier = 3.3,
				Damage = { Heat = 80 },
				Falloff = { EndRange = 3, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.56
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "SNIPER_AMMO", "AOE", "MITER" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/LongGuns/GrineerSawbladeGun/MiterDismemberUpgrade" },
		Disposition = 1.5,
		ExilusPolarity = "Madurai",
		Family = "Miter",
		GripType = "",
		Image = "Miter.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "MiterIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerSawbladeGun/SawBladeGun",
		Introduced = "9.5",
		Link = "Miter",
		Magazine = 20,
		Mastery = 6,
		MaxRank = 30,
		Name = "Miter",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Charge",
		Users = { "Eviscerator" },
		_TooltipAttackDisplay = 2
	},
	["Mk1-Braton"] = {
		Accuracy = 40,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Impact = 4.5, Puncture = 4.5, Slash = 9 },
				FireRate = 7.5,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.05
			},
			{
				Accuracy = 200,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Impact = 20, Puncture = 2, Slash = 28 },
				FireRate = 5,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
				Trigger = "Auto"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				CritChance = 0.2,
				CritMultiplier = 2.4,
				Damage = { Heat = 50 },
				Falloff = { EndRange = 3, Reduction = 0.1, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.1
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Braton",
		GripType = "",
		Image = "Braton.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "BratonIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/StartingRifle",
		Introduced = "Vanilla",
		Link = "Mk1-Braton",
		Magazine = 60,
		Mastery = 0,
		MaxRank = 30,
		Name = "Mk1-Braton",
		Reload = 2,
		SellPrice = 2500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Mk1-Paris"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 5.75, Puncture = 86.25, Slash = 23 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.15,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 11.5, Puncture = 184, Slash = 34.5 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 2,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.15,
				Trigger = "Charge"
			},
			{
				Accuracy = 100,
				AttackIndex = 3,
				AttackName = "Incarnon Form Charged Shot",
				ChargeTime = 0.8,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Heat = 250, Impact = 50 },
				FireRate = 1,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Paris",
		GripType = "BOW",
		Image = "Paris.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "ParisIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Paris",
		Introduced = "14.0",
		Link = "Mk1-Paris",
		Magazine = 1,
		Mastery = 0,
		MaxRank = 30,
		Name = "Mk1-Paris",
		Polarities = { "Naramon" },
		Reload = 0.55,
		SellPrice = 2500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	["Mk1-Strun"] = {
		Accuracy = 4,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.075,
				CritMultiplier = 2,
				Damage = { Impact = 9.9, Puncture = 2.7, Slash = 5.4 },
				Falloff = { EndRange = 25, Reduction = 0.5, StartRange = 15 },
				FireRate = 2.08,
				IsSilent = false,
				MaxSpread = 35,
				MinSpread = 15,
				Multishot = 10,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.44,
				CritMultiplier = 3,
				Damage = { Impact = 100 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.4
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.44,
				CritMultiplier = 3,
				Damage = { Blast = 45, Puncture = 25, Slash = 60 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.4
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Strun",
		GripType = "",
		Image = "Strun.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "StrunIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Strun",
		Introduced = "14.0",
		Link = "Mk1-Strun",
		Magazine = 6,
		Mastery = 0,
		MaxRank = 30,
		Name = "Mk1-Strun",
		Polarities = { "Naramon" },
		Reload = 3.75,
		ReloadStyle = "ByRound",
		SellPrice = 2500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Mutalist Cernos"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 184.5, Puncture = 10.25, Slash = 10.25 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.49,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 369, Puncture = 20.5, Slash = 20.5 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.49,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Toxin Cloud",
				AttackParentIndex = 2,
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Toxin = 5 },
				EffectDuration = 10,
				ExplosionDelay = 0.25,
				Falloff = { EndRange = 2.5, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Toxin" },
				Range = 2.5,
				ShotType = "AoE",
				StatusChance = 0.49
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "INFCERNOS" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Mutalist Cernos",
		GripType = "BOW",
		Image = "MutalistCernos.png",
		InternalName = "/Lotus/Weapons/Infested/Bow/InfCernosBow/InfCernos",
		Introduced = "18.5",
		Link = "Mutalist Cernos",
		Magazine = 1,
		Mastery = 7,
		MaxRank = 30,
		Name = "Mutalist Cernos",
		Polarities = { "Naramon" },
		Reload = 0.6,
		SellPrice = 8500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 1
	},
	["Mutalist Quanta"] = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.025,
				CritMultiplier = 1.5,
				Damage = { Impact = 2.5, Puncture = 15, Slash = 7.5 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.15,
				Trigger = "Auto"
			},
			{
				AmmoCost = 5,
				AttackIndex = 2,
				AttackName = "Infested Orb",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = { Radiation = 20 },
				EffectDuration = 9,
				Falloff = { EndRange = 2, Reduction = 0, StartRange = 0 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotSpeed = 5,
				ShotType = "Projectile",
				StatusChance = 1,
				Trigger = "Semi"
			},
			{
				Accuracy = 25,
				AttackIndex = 3,
				AttackName = "Orb Explosion",
				AttackParentIndex = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Toxin = 100 },
				Falloff = { EndRange = 4.4, Reduction = 0.5, StartRange = 0 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.4,
				Reload = 3,
				ShotType = "AoE",
				StatusChance = 0.39
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.5,
		ExilusPolarity = "Madurai",
		Family = "Mutalist Quanta",
		GripType = "",
		Image = "MutalistQuanta.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/InfCrpShockSwarm/InfCrpShockSwarmRifle",
		Introduced = "13.8",
		Link = "Mutalist Quanta",
		Magazine = 60,
		Mastery = 2,
		MaxRank = 30,
		Name = "Mutalist Quanta",
		Polarities = { "Vazarin" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Nagantaka = {
		Accuracy = 40,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 40,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi-Auto",
				CritChance = 0.15,
				CritMultiplier = 2.3,
				Damage = { Impact = 1.6, Puncture = 14.3, Slash = 143.1 },
				FireRate = 2.5,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.39,
				Trigger = "Semi-Auto"
			},
			{
				Accuracy = 40,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Burst Shot",
				BurstCount = 9,
				BurstDelay = 0.15,
				BurstReloadDelay = 0.2,
				CritChance = 0.15,
				CritMultiplier = 2.3,
				Damage = { Impact = 1.6, Puncture = 14.3, Slash = 143.1 },
				FireRate = 5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.39,
				Trigger = "Mag Burst"
			}
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE", "ZHUGE", "CROSSBOW" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/GarudaCrossbow/GarudaCrossbowInnateUpgrade",
			"/Lotus/Weapons/Tenno/LongGuns/GarudaCrossbow/GarudaCrossbowInnateUpgradeTwo"
		},
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Nagantaka",
		GripType = "",
		Image = "Nagantaka.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/GarudaCrossbow/GarudaCrossbow",
		Introduced = "24",
		Link = "Nagantaka",
		Magazine = 9,
		Mastery = 9,
		MaxRank = 30,
		Name = "Nagantaka",
		Polarities = { "Madurai" },
		Reload = 2.3,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi / Mag Burst",
		_TooltipAttackDisplay = 1
	},
	["Nagantaka Prime"] = {
		Accuracy = 40,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 40,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi-Auto",
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 1.7, Puncture = 15.6, Slash = 155.7 },
				FireRate = 2.5,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.39,
				Trigger = "Semi-Auto"
			},
			{
				Accuracy = 40,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Burst Shot",
				BurstCount = 11,
				BurstDelay = 0.11,
				BurstReloadDelay = 0.2,
				CritChance = 0.25,
				CritMultiplier = 2.3,
				Damage = { Impact = 1.7, Puncture = 15.6, Slash = 155.7 },
				FireRate = 5,
				ForcedProcs = { "Impact" },
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.39,
				Trigger = "Mag Burst"
			}
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE", "ZHUGE", "CROSSBOW" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/GarudaCrossbow/GarudaCrossbowInnateUpgrade",
			"/Lotus/Weapons/Tenno/LongGuns/GarudaCrossbow/GarudaCrossbowInnateUpgradeTwo"
		},
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Nagantaka",
		GripType = "",
		Image = "NagantakaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeNagantaka/PrimeNagantakaWeapon",
		Introduced = "31.3",
		Link = "Nagantaka Prime",
		Magazine = 11,
		Mastery = 12,
		MaxRank = 30,
		Name = "Nagantaka Prime",
		Polarities = { "Madurai" },
		Reload = 2.3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Semi / Mag Burst",
		_TooltipAttackDisplay = 1
	},
	Nataruk = {
		Accuracy = 16.7,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Quick Shot",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Puncture = 405, Slash = 45 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 140,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.5,
				CritMultiplier = 2.2,
				Damage = { Puncture = 648, Slash = 252 },
				FireRate = 0.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Perfect Shot",
				ChargeTime = 0.7,
				CritChance = 0.6,
				CritMultiplier = 2.4,
				Damage = { Puncture = 648, Slash = 252 },
				ExtraHeadshotDmg = -2,
				FireRate = 0.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "OMICRUS", "BATTERY" },
		Conclave = false,
		Disposition = 0.65,
		ExilusPolarity = "Naramon",
		Family = "Nataruk",
		GripType = "BOW",
		Image = "Nataruk.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/Omicrus/OmicrusPlayerWep",
		Introduced = "31",
		Link = "Nataruk",
		Magazine = 1,
		Mastery = 0,
		MaxRank = 30,
		Name = "Nataruk",
		Polarities = { "Madurai", "Madurai", "Madurai", "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Sentient" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 3
	},
	Neutralizer = {
		Accuracy = 13.33,
		AmmoMax = 0,
		AmmoType = "Energy",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.45,
				CritMultiplier = 3,
				Damage = { Impact = 12.75, Puncture = 216.75, Slash = 25.5 },
				FireRate = 1,
				MaxSpread = 15,
				MinSpread = 0,
				PunchThrough = 2.5,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			},
			{
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Cryo Grenade",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Cold = 20 },
				FireRate = 1.33,
				ForcedProcs = { "Cold" },
				MaxSpread = 8,
				MinSpread = 3,
				Range = 10,
				ShotSpeed = 100,
				ShotType = "AoE",
				StatusChance = 0
			}
		},
		Class = "Exalted Weapon",
		CodexSecret = true,
		CompatibilityTags = { "POWER_WEAPON", "SEMI_AUTO", "SNIPER_AMMO" },
		Conclave = true,
		GripType = "",
		Image = "Neutralizer.png",
		InternalName = "/Lotus/Powersuits/Frumentarius/ExaltedSniper",
		Introduced = "38.0",
		Link = "Neutralizer",
		Magazine = 12,
		MaxRank = 30,
		Name = "Neutralizer",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.25,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Cyte-09" },
		Zoom = { "2.5x", "4.0x", "8.0x" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1
	},
	Ogris = {
		Accuracy = 100,
		AmmoMax = 20,
		AmmoPickup = 5,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				ChargeTime = 0.3,
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Blast = 100 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.35
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 7.1, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.1,
				ShotType = "AoE",
				StatusChance = 0.35
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Ogris",
		GripType = "",
		Image = "Ogris.png",
		InternalName = "/Lotus/Weapons/ClanTech/Chemical/RocketLauncher",
		Introduced = "8.0",
		Link = "Ogris",
		Magazine = 5,
		Mastery = 9,
		MaxRank = 30,
		Name = "Ogris",
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Charge",
		Users = { "Bombard", "Corrupted Bombard", "Gorth", "Nightwatch Bombard" },
		_TooltipAttackDisplay = 2
	},
	Opticor = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 2,
				CritChance = 0.2,
				CritMultiplier = 2.5,
				Damage = { Impact = 100, Puncture = 850, Slash = 50 },
				FireRate = 1,
				ForcedProcs = { "Big Stagger" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			},
			{
				AttackIndex = 2,
				AttackName = "Charged Shot AoE",
				CritChance = 0.2,
				CritMultiplier = 2.5,
				Damage = { Magnetic = 400 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.2
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Quick Shot",
				CritChance = 0.2,
				CritMultiplier = 2.5,
				Damage = { Impact = 50, Puncture = 425, Slash = 25 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			},
			{
				AttackIndex = 4,
				AttackName = "Quick Shot AoE",
				CritChance = 0.2,
				CritMultiplier = 2.5,
				Damage = { Magnetic = 200 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Opticor",
		GripType = "",
		Image = "Opticor.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpBFG/CrpBFG",
		Introduced = "15.0",
		Link = "Opticor",
		Magazine = 5,
		Mastery = 14,
		MaxRank = 30,
		Name = "Opticor",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Charge",
		Users = { "Malice", "Ved Xol", "002-ER" },
		_TooltipAttackDisplay = 1
	},
	["Opticor Vandal"] = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.6,
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 40, Puncture = 280, Slash = 80 },
				FireRate = 2,
				ForcedProcs = { "Big Stagger" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Charged Shot AoE",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Magnetic = 200 },
				Falloff = { EndRange = 4.6, Reduction = 0.6, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.6,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Quick Shot",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 20, Puncture = 140, Slash = 40 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3
			},
			{
				AttackIndex = 4,
				AttackName = "Quick Shot AoE",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Magnetic = 100 },
				Falloff = { EndRange = 4.6, Reduction = 0.6, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.6,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Opticor",
		GripType = "",
		Image = "OpticorVandal.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpBFG/Vandal/VandalCrpBFG",
		Introduced = "24.4",
		Link = "Opticor Vandal",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Opticor Vandal",
		Polarities = { "Madurai" },
		Reload = 1.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 1
	},
	Panthera = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 2,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 10, Slash = 70 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.24,
				Trigger = "Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 10, Puncture = 10, Slash = 80 },
				FireRate = 2,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "Hit-Scan",
				StatusChance = 0.35,
				Trigger = "Held"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO", "BEAM" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Panthera",
		GripType = "",
		Image = "Panthera.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/Miter/TnoMiter",
		Introduced = "15.10",
		Link = "Panthera",
		Magazine = 60,
		Mastery = 7,
		MaxRank = 30,
		Name = "Panthera",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto / Held",
		_TooltipAttackDisplay = 1
	},
	["Panthera Prime"] = {
		Accuracy = 80,
		AmmoMax = 320,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 2,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 10, Slash = 70 },
				FireRate = 3.67,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Slash = 20 },
				Falloff = { EndRange = 1.6, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.6,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Alt-Fire",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Slash = 100 },
				FireRate = 2,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "Hit-Scan",
				StatusChance = 0.38,
				Trigger = "Held"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO", "BEAM" },
		Conclave = false,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Panthera",
		GripType = "",
		Image = "PantheraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimePanthera/PrimePanthera",
		Introduced = "28.2",
		Link = "Panthera Prime",
		Magazine = 80,
		Mastery = 14,
		MaxRank = 30,
		Name = "Panthera Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto / Held",
		_TooltipAttackDisplay = 1
	},
	Paracyst = {
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 50,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.05,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Toxin = 33 },
				FireRate = 8.33,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Burst"
			},
			{
				Accuracy = 50,
				AttackIndex = 2,
				AttackName = "Infested Harpoon",
				ChargeTime = 0.25,
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Toxin = 15 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 50,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Burst"
			},
			{
				AttackIndex = 3,
				AttackName = "Infested Harpoon Contact",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Toxin = 15 },
				EffectDuration = 5,
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.31,
		ExilusPolarity = "Naramon",
		Family = "Paracyst",
		GripType = "",
		Image = "Paracyst.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/QuantaFullyInfested/InfQuantaRifle",
		Introduced = "15.5",
		Link = "Paracyst",
		Magazine = 60,
		Mastery = 7,
		MaxRank = 30,
		Name = "Paracyst",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Burst",
		Users = { "Mutalist Alad V" },
		_TooltipAttackDisplay = 1
	},
	Paris = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 8, Puncture = 120, Slash = 32 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 16, Puncture = 256, Slash = 48 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 2,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Charge"
			},
			{
				Accuracy = 100,
				AttackIndex = 3,
				AttackName = "Incarnon Form Charged Shot",
				ChargeTime = 0.8,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Heat = 365, Impact = 95 },
				FireRate = 1,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Paris",
		GripType = "BOW",
		Image = "Paris.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "ParisIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/HuntingBow",
		Introduced = "7.0",
		Link = "Paris",
		Magazine = 1,
		Mastery = 0,
		MaxRank = 30,
		Name = "Paris",
		Polarities = { "Naramon" },
		Reload = 0.65,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		Users = { "Trinity Specter" },
		_TooltipAttackDisplay = 2
	},
	["Paris Prime"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.45,
				CritMultiplier = 2,
				Damage = { Impact = 9, Puncture = 153, Slash = 18 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.5,
				CritChance = 0.45,
				CritMultiplier = 2,
				Damage = { Impact = 9, Puncture = 288, Slash = 63 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 3,
				ShotSpeed = 95,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			},
			{
				Accuracy = 100,
				AttackIndex = 3,
				AttackName = "Incarnon Form Charged Shot",
				ChargeTime = 0.8,
				CritChance = 0.5,
				CritMultiplier = 3.4,
				Damage = { Heat = 420, Impact = 100 },
				FireRate = 1,
				IncarnonCharges = 20,
				IsSilent = false,
				Multishot = 1,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Paris",
		GripType = "BOW",
		Image = "ParisPrime.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "ParisPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/PrimeHuntingBow",
		Introduced = "9.0",
		Link = "Paris Prime",
		Magazine = 1,
		Mastery = 8,
		MaxRank = 30,
		Name = "Paris Prime",
		Polarities = { "Naramon", "Madurai" },
		Reload = 0.7,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	Penta = {
		Accuracy = 100,
		AmmoMax = 20,
		AmmoPickup = 5,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 75 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 20,
				ShotType = "Projectile",
				StatusChance = 0.1
			},
			{
				AttackIndex = 2,
				AttackName = "Grenade Detonation",
				AttackParentIndex = 1,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Blast = 350 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.1
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Penta",
		GripType = "",
		Image = "Penta.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/GrenadeLauncher/GrenadeLauncher",
		Introduced = "11.3",
		Link = "Penta",
		Magazine = 5,
		Mastery = 6,
		MaxRank = 30,
		Name = "Penta",
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Active",
		Users = { "Penta Ranger", "M-W.A.M." },
		_TooltipAttackDisplay = 2
	},
	Perigale = {
		Accuracy = 833.3,
		AmmoMax = 24,
		AmmoPickup = 12,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 4,
				BurstDelay = 0.04,
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Impact = 20.64, Puncture = 96.32, Slash = 55.04 },
				Falloff = { EndRange = 600, Reduction = 0.2, StartRange = 300 },
				FireRate = 2,
				MaxSpread = 0.14,
				MinSpread = 0.1,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.16,
				Trigger = "Burst"
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = false,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Perigale",
		GripType = "",
		Image = "Perigale.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnQuadSniper/TnQuadSniper",
		Introduced = "32.2",
		Link = "Perigale",
		Magazine = 12,
		Mastery = 8,
		MaxRank = 30,
		Name = "Perigale",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Burst",
		Zoom = { "2.0x (+20% Critical Multiplier)", "4.0x (+40% Critical Multiplier)" },
		_TooltipAttackDisplay = 1
	},
	["Perigale Prime"] = {
		Accuracy = 833.3,
		AmmoMax = 32,
		AmmoPickup = 16,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 4,
				BurstDelay = 0.04,
				CritChance = 0.32,
				CritMultiplier = 2.6,
				Damage = { Impact = 22.08, Puncture = 103.04, Slash = 58.88 },
				Falloff = { EndRange = 600, Reduction = 0.2, StartRange = 300 },
				FireRate = 2,
				MaxSpread = 0.14,
				MinSpread = 0.1,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.2,
				Trigger = "Burst"
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = false,
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Perigale",
		GripType = "",
		Image = "PerigalePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimePerigale/PrimePerigaleSniper",
		Introduced = "42.0.6",
		Link = "Perigale Prime",
		Magazine = 16,
		Mastery = 14,
		MaxRank = 30,
		Name = "Perigale Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Burst",
		Zoom = { "2.0x (+20% Critical Multiplier)", "4.0x (+40% Critical Multiplier)" },
		_TooltipAttackDisplay = 1
	},
	Phage = {
		Accuracy = 50,
		AmmoMax = 720,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Viral = 5 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 2,
				Multishot = 7,
				PunchThrough = 0,
				Range = 25,
				ShotType = "Hit-Scan",
				StatusChance = 0.155
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.46,
		ExilusPolarity = "None",
		Family = "Phage",
		GripType = "",
		Image = "Phage.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/Tentacluster/InfestedShotgun",
		Introduced = "12.0",
		Link = "Phage",
		Magazine = 90,
		Mastery = 11,
		MaxRank = 30,
		Name = "Phage",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	Phantasma = {
		Accuracy = 100,
		AmmoMax = 275,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Beam",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 5, Radiation = 10 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 6,
				PunchThrough = 0,
				Range = 20,
				ShotType = "Hit-Scan",
				StatusChance = 0.222,
				Trigger = "Held"
			},
			{
				AmmoCost = 2,
				AttackIndex = 2,
				AttackName = "Plasma Bomb Impact",
				ChargeTime = 1,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 15 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.37,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Plasma Bomb Explosion",
				AttackParentIndex = 2,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Radiation = 73 },
				Falloff = { EndRange = 4.8, Reduction = 0.5, StartRange = 0 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.37
			},
			{
				AttackIndex = 4,
				AttackName = "Cluster Bombs Impact",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 3 },
				FireRate = 2,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				Multishot = 5,
				PunchThrough = 0,
				ShotSpeed = 6,
				ShotType = "Projectile",
				StatusChance = 0.37
			},
			{
				AttackIndex = 5,
				AttackName = "Cluster Bombs Explosion",
				AttackParentIndex = 4,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Radiation = 18 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.37
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/RevenantShotgun/RevenantShotgunInnateMod" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Phantasma",
		GripType = "",
		Image = "Phantasma.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/RevenantShotgun/RevenantShotgun",
		Introduced = "23.5",
		Link = "Phantasma",
		Magazine = 11,
		Mastery = 9,
		MaxRank = 30,
		Name = "Phantasma",
		Polarities = { "Naramon", "Madurai" },
		Reload = 0.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Sentient" },
		Trigger = "Held / Charge",
		_TooltipAttackDisplay = 1
	},
	["Phantasma Prime"] = {
		Accuracy = 100,
		AmmoMax = 330,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Beam",
				CritChance = 0.11,
				CritMultiplier = 1.9,
				Damage = { Impact = 5, Radiation = 10 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 6,
				PunchThrough = 0,
				Range = 25,
				ShotType = "Hit-Scan",
				StatusChance = 0.222,
				Trigger = "Held"
			},
			{
				AmmoCost = 2,
				AttackIndex = 2,
				AttackName = "Plasma Bomb Impact",
				ChargeTime = 1,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 15 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.37,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Plasma Bomb Explosion",
				AttackParentIndex = 2,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Radiation = 73 },
				Falloff = { EndRange = 4.8, Reduction = 0.5, StartRange = 0 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.8,
				ShotType = "AoE",
				StatusChance = 0.37
			},
			{
				AttackIndex = 4,
				AttackName = "Cluster Bombs Impact",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 3 },
				FireRate = 2,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				Multishot = 5,
				PunchThrough = 0,
				ShotSpeed = 6,
				ShotType = "Projectile",
				StatusChance = 0.37
			},
			{
				AttackIndex = 5,
				AttackName = "Cluster Bombs Explosion",
				AttackParentIndex = 4,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Radiation = 18 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.37
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/RevenantShotgun/RevenantShotgunInnateMod" },
		Disposition = 0.8,
		ExilusPolarity = "Madurai",
		Family = "Phantasma",
		GripType = "",
		Image = "PhantasmaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimePhantasma/PhantasmaPrimeShotgun",
		Introduced = "32.0.9",
		Link = "Phantasma Prime",
		Magazine = 11,
		Mastery = 14,
		MaxRank = 30,
		Name = "Phantasma Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.5,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Sentient" },
		Trigger = "Held / Charge",
		_TooltipAttackDisplay = 1
	},
	Phenmor = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Puncture = 42, Slash = 98 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Semi"
			},
			{
				Accuracy = 14.3,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Radiation = 60, Slash = 80 },
				FireRate = 13.33,
				IncarnonCharges = 408,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 3,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Upgrades/Evolutions/Rifle/EvoRifleDamageOnHeadshots",
			"/Lotus/Upgrades/Evolutions/Rifle/EvoRifleInstantReloadChanceOnHeadshot",
			"/Lotus/Upgrades/Evolutions/Rifle/EvoRifleReloadSpeedFromEmpty"
		},
		Disposition = 0.6,
		ExilusPolarity = "Madurai",
		Family = "Phenmor",
		GripType = "",
		Image = "Phenmor.png",
		IncarnonChargeGain = 34,
		InternalName = "/Lotus/Weapons/Tenno/Zariman/LongGuns/SemiAutoRifle/ZarimanSemiAutoRifle",
		Introduced = "31.5",
		Link = "Phenmor",
		Magazine = 30,
		Mastery = 14,
		MaxRank = 30,
		Name = "Phenmor",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Zariman", "Incarnon" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Prisma Gorgon"] = {
		Accuracy = 20,
		AmmoMax = 840,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.3,
				CritMultiplier = 2.3,
				Damage = { Impact = 17.25, Puncture = 3.45, Slash = 2.3 },
				FireRate = 14.17,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.15
			},
			{
				Accuracy = 25,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.27,
				CritMultiplier = 2.3,
				Damage = { Impact = 15, Puncture = 45, Slash = 15 },
				FireRate = 1.167,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.21,
				Trigger = "Auto Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.27,
				CritMultiplier = 2.3,
				Damage = { Heat = 700 },
				ExplosionDelay = 0.8,
				Falloff = { EndRange = 5, Reduction = 0.1, StartRange = 0 },
				FireRate = 1.167,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.21
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Gorgon",
		GripType = "",
		Image = "PrismaGorgon.png",
		IncarnonChargeGain = 0.66,
		IncarnonImage = "PrismaGorgonIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/VoidTraderGorgon/VTGorgon",
		Introduced = "15.11.1",
		Link = "Prisma Gorgon",
		Magazine = 120,
		Mastery = 11,
		MaxRank = 30,
		Name = "Prisma Gorgon",
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 7,
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1
	},
	["Prisma Grakata"] = {
		Accuracy = 28.6,
		AmmoMax = 1000,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Impact = 6, Puncture = 5, Slash = 4 },
				FireRate = 21.67,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.21
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Grakata",
		GripType = "",
		Image = "PrismaGrakata.png",
		InternalName = "/Lotus/Weapons/VoidTrader/PrismaGrakata",
		Introduced = "16.8.3",
		Link = "Prisma Grakata",
		Magazine = 120,
		Mastery = 11,
		MaxRank = 30,
		Name = "Prisma Grakata",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Prisma Grinlok"] = {
		Accuracy = 32,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.21,
				CritMultiplier = 2.9,
				Damage = { Impact = 74.8, Puncture = 18.7, Slash = 93.5 },
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.25,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.37
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Grinlok",
		GripType = "",
		Image = "PrismaGrinlok.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerLeverActionRifle/PrismaGrinlokWeapon",
		Introduced = "24.4",
		Link = "Prisma Grinlok",
		Magazine = 21,
		Mastery = 11,
		MaxRank = 30,
		Name = "Prisma Grinlok",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Prisma Lenz"] = {
		Accuracy = 16.7,
		AmmoMax = 8,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2.8,
				Damage = { Impact = 56 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.16,
				Trigger = "Charge"
			},
			{
				AttackIndex = 2,
				AttackName = "Initial Blast",
				AttackParentIndex = 1,
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2.8,
				Damage = { Cold = 10 },
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.16,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Bubble Collapse",
				AttackParentIndex = 1,
				ChargeTime = 1.2,
				CritChance = 0.5,
				CritMultiplier = 2.8,
				Damage = { Blast = 740 },
				ExplosionDelay = 1.3,
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.16,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "SNIPER_AMMO", "AOE", "SINGLESHOT", "CRPBOW" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Corpus/Bow/Longbow/CrpBowConvertAmmoMod" },
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Lenz",
		GripType = "BOW",
		Image = "PrismaLenz.png",
		InternalName = "/Lotus/Weapons/Corpus/Bow/Longbow/PrismaLenz/PrismaLenzWeapon",
		Introduced = "33.0.10",
		Link = "Prisma Lenz",
		Magazine = 1,
		Mastery = 12,
		MaxRank = 30,
		Name = "Prisma Lenz",
		Polarities = { "Naramon", "Naramon", "Madurai" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Corpus", "Baro" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 3
	},
	["Prisma Tetra"] = {
		Accuracy = 18.2,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 7.6, Puncture = 30.4 },
				FireRate = 7.08,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.24
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Tetra",
		GripType = "",
		Image = "PrismaTetra.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CorpusUMP/PrismaCorpusUMP",
		Introduced = "17.0.5",
		Link = "Prisma Tetra",
		Magazine = 60,
		Mastery = 4,
		MaxRank = 30,
		Name = "Prisma Tetra",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Proboscis Cernos"] = {
		Accuracy = 16.7,
		AmmoMax = 7,
		AmmoPickup = 1,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.7,
				CritChance = 0.07,
				CritMultiplier = 1.9,
				Damage = { Impact = 103.23, Puncture = 30.69, Slash = 145.08 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 45,
				ShotType = "Projectile",
				StatusChance = 0.43,
				Trigger = "Charge"
			},
			{
				AttackIndex = 2,
				AttackName = "Appendages",
				AttackParentIndex = 1,
				ChargeTime = 0.7,
				CritChance = 0.07,
				CritMultiplier = 1.9,
				Damage = { Slash = 49, Viral = 41 },
				Falloff = { EndRange = 9, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Big Stagger" },
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.43,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Charged Shot Explosion",
				AttackParentIndex = 1,
				ChargeTime = 0.7,
				CritChance = 0.07,
				CritMultiplier = 1.9,
				Damage = { Viral = 1003 },
				ExplosionDelay = 1.7,
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.43,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE", "INFBOW" },
		Conclave = false,
		Disposition = 0.9,
		ExilusPolarity = "Naramon",
		Family = "Proboscis Cernos",
		GripType = "BOW",
		Image = "ProboscisCernos.png",
		InternalName = "/Lotus/Weapons/Tenno/Bows/PrimeDerelictCernos/DerelictCernos",
		Introduced = "29.5",
		Link = "Proboscis Cernos",
		Magazine = 1,
		Mastery = 15,
		MaxRank = 30,
		Name = "Proboscis Cernos",
		Polarities = { "Naramon", "Naramon" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 3
	},
	["Purgator 1"] = {
		Accuracy = 100,
		AmmoMax = 20,
		AmmoPickup = 2,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.31,
				CritMultiplier = 2.3,
				Damage = { Impact = 351.45, Puncture = 429.55 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.1,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.19
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Purgator 1",
		GripType = "",
		Image = "Purgator1.png",
		InternalName = "/Lotus/Weapons/Lasria/LasGrenadeLauncher/LasrianNoxPlayerWeapon",
		Introduced = "38.5",
		Link = "Purgator 1",
		Magazine = 9,
		Mastery = 14,
		MaxRank = 30,
		Name = "Purgator 1",
		Reload = 2.7,
		SellPrice = 8500,
		Slot = "Primary",
		Traits = { "Scaldra" },
		Trigger = "Semi-Auto",
		Users = { "Scaldra Dedicant" },
		_TooltipAttackDisplay = 1
	},
	Quanta = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Beam",
				CritChance = 0.16,
				CritMultiplier = 2.2,
				Damage = { Electricity = 10 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0,
				Range = 50,
				ShotType = "Hit-Scan",
				StatusChance = 0.24,
				Trigger = "Held"
			},
			{
				Accuracy = 25,
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Cube (direct hit)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 100 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 15,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.26,
				Trigger = "Semi"
			},
			{
				AttackIndex = 3,
				AttackName = "Cube Explosion",
				AttackParentIndex = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 150 },
				Falloff = { EndRange = 0.5, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.5,
				ShotType = "AoE",
				StatusChance = 0.26
			},
			{
				AttackIndex = 4,
				AttackName = "Cube (shot by player)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				StatusChance = 0.26
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Quanta",
		GripType = "",
		Image = "Quanta.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpShockRifle/CrpShockRifle",
		Introduced = "14.1",
		Link = "Quanta",
		Magazine = 60,
		Mastery = 4,
		MaxRank = 30,
		Name = "Quanta",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Held / Semi",
		_TooltipAttackDisplay = 1
	},
	["Quanta Vandal"] = {
		Accuracy = 100,
		AmmoMax = 560,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Beam",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Electricity = 13 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0,
				Range = 50,
				ShotType = "Hit-Scan",
				StatusChance = 0.45,
				Trigger = "Held"
			},
			{
				Accuracy = 25,
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Cube (direct hit)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 100 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 15,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.26,
				Trigger = "Semi"
			},
			{
				AttackIndex = 3,
				AttackName = "Cube Explosion",
				AttackParentIndex = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 150 },
				Falloff = { EndRange = 0.5, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.5,
				ShotType = "AoE",
				StatusChance = 0.26
			},
			{
				AttackIndex = 4,
				AttackName = "Cube (shot by player)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				StatusChance = 0.26
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Quanta",
		GripType = "",
		Image = "QuantaVandal.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpShockRifle/QuantaVandal",
		Introduced = "16.4",
		Link = "Quanta Vandal",
		Magazine = 80,
		Mastery = 10,
		MaxRank = 30,
		Name = "Quanta Vandal",
		Polarities = { "Madurai" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 1,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Held / Semi",
		_TooltipAttackDisplay = 1
	},
	Quartakk = {
		Accuracy = 90.9,
		AmmoMax = 840,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst-Fire",
				BurstCount = 4,
				BurstDelay = 0,
				CritChance = 0.19,
				CritMultiplier = 2.3,
				Damage = { Impact = 18.13, Puncture = 14.21, Slash = 16.66 },
				FireRate = 1.58,
				IsSilent = false,
				MaxSpread = 1.2,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.27
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Quartakk",
		GripType = "",
		Image = "Quartakk.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnFourBarrelRifle/GrnFourBarrelRifleWeapon",
		Introduced = "22",
		Link = "Quartakk",
		Magazine = 84,
		Mastery = 10,
		MaxRank = 30,
		Name = "Quartakk",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.9,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	Quellor = {
		Accuracy = 33.33,
		AmmoMax = 900,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.12,
				CritMultiplier = 1.6,
				Damage = { Cold = 16, Impact = 8, Puncture = 22, Slash = 12 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.38
			},
			{
				AmmoCost = 50,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				ChargeTime = 1.2,
				CritChance = 0.4,
				CritMultiplier = 2.2,
				Damage = { Cold = 800, Impact = 600 },
				Falloff = { EndRange = 18, Reduction = 0.6657, StartRange = 9 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Auto Charge"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Quellor",
		GripType = "",
		Image = "Quellor.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnRailjackRifle/RailjackRifleGun",
		Introduced = "27.0",
		Link = "Quellor",
		Magazine = 300,
		Mastery = 12,
		MaxRank = 30,
		Name = "Quellor",
		Polarities = { "Madurai", "Madurai" },
		Reload = 4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto / Charge",
		_TooltipAttackDisplay = 1
	},
	["Rakta Cernos"] = {
		Accuracy = 16.7,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 211.5, Puncture = 11.75, Slash = 11.75 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.15,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.25,
				CritChance = 0.35,
				CritMultiplier = 2,
				Damage = { Impact = 423, Puncture = 23.5, Slash = 23.5 },
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.15,
				Trigger = "Charge"
			}
		},
		Class = "Bow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Cernos",
		GripType = "BOW",
		Image = "RaktaCernos.png",
		InternalName = "/Lotus/Weapons/Syndicates/RedVeil/Bows/RVCernos",
		Introduced = "17.3",
		Link = "Rakta Cernos",
		Magazine = 1,
		Mastery = 12,
		MaxRank = 30,
		Name = "Rakta Cernos",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.6,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Blight",
		Tradable = 1,
		Traits = { "Syndicate", "Red Veil" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2
	},
	Rauta = {
		Accuracy = 4,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 26, Puncture = 26, Slash = 78 },
				Falloff = { EndRange = 20, Reduction = 0.8, StartRange = 10 },
				FireRate = 0.8,
				MaxSpread = 30,
				MinSpread = 12,
				Multishot = 8,
				ShotType = "Hit-Scan",
				StatusChance = 0.12,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Shotgun",
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Rauta",
		GripType = "",
		Image = "Rauta.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PaxDuviricusShotgun/PaxDuviricusShotgun",
		Introduced = "33.5",
		Link = "Rauta",
		Magazine = 4,
		Mastery = 8,
		MaxRank = 30,
		Name = "Rauta",
		Polarities = { "Vazarin" },
		Reload = 1.2,
		Slot = "Primary",
		Tradable = 2,
		Trigger = "Semi-Auto"
	},
	Reconifex = {
		Accuracy = 13.3,
		AmmoMax = 1000,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.8,
				Damage = { Impact = 16, Puncture = 24 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.16
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Reconifex",
		GripType = "",
		Image = "Reconifex.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnBeltFedRifle/TnBeltFedRifleWeapon",
		Introduced = "38.0",
		Link = "Reconifex",
		Magazine = 200,
		Mastery = 14,
		MaxRank = 30,
		Name = "Reconifex",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 5,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 4,
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	Rubico = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 144, Puncture = 27, Slash = 9 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 2.67,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Rubico",
		GripType = "",
		Image = "Rubico.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/FiveShotSniper/FiveShotSniper",
		Introduced = "18.0",
		Link = "Rubico",
		Magazine = 5,
		Mastery = 6,
		MaxRank = 30,
		Name = "Rubico",
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Zoom = { "3.5x (+35% Critical Multiplier)", "6x (+50% Critical Multiplier)" },
		_TooltipAttackDisplay = 1
	},
	["Rubico Prime"] = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.38,
				CritMultiplier = 3,
				Damage = { Impact = 149.6, Puncture = 28.1, Slash = 9.3 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 3.67,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.16
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Rubico",
		GripType = "",
		Image = "RubicoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/RubicoPrime/RubicoPrimeWeapon",
		Introduced = "23.9",
		Link = "Rubico Prime",
		Magazine = 5,
		Mastery = 12,
		MaxRank = 30,
		Name = "Rubico Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+35% Critical Multiplier)", "5.0x (+50% Critical Multiplier)" },
		_TooltipAttackDisplay = 1
	},
	["Sancti Tigris"] = {
		Accuracy = 6.5,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 21, Puncture = 21, Slash = 168 },
				Falloff = { EndRange = 20, Reduction = 0.5714, StartRange = 8 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 22,
				MinSpread = 9,
				Multishot = 6,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.14
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Tigris",
		GripType = "",
		Image = "SanctiTigris.png",
		InternalName = "/Lotus/Weapons/Syndicates/NewLoka/LongGuns/NLTigris",
		Introduced = "17.3",
		Link = "Sancti Tigris",
		Magazine = 2,
		Mastery = 12,
		MaxRank = 30,
		Name = "Sancti Tigris",
		Polarities = { "Vazarin", "Naramon", "Madurai" },
		Reload = 1.5,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Purity",
		Tradable = 1,
		Traits = { "Syndicate", "New Loka" },
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1
	},
	Scourge = {
		Accuracy = 100,
		AmmoMax = 200,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				CritChance = 0.02,
				CritMultiplier = 1.5,
				Damage = { Corrosive = 70 },
				FireRate = 2.67,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.02,
				CritMultiplier = 1.5,
				Damage = { Corrosive = 55 },
				Falloff = { EndRange = 1.7, Reduction = 0.3, StartRange = 0 },
				FireRate = 2.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.7,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				Accuracy = 16.7,
				AttackIndex = 3,
				AttackName = "Spear Throw Impact",
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Impact = 105, Puncture = 22.5, Slash = 22.5 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 0.6,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi"
			},
			{
				AttackIndex = 4,
				AttackName = "Spear Throw Explosion",
				AttackParentIndex = 3,
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Corrosive = 55 },
				Falloff = { EndRange = 7, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE", "IMPACTEXPLODE" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod" },
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Scourge",
		GripType = "SPEAR",
		Image = "Scourge.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnPriestSpear/TnPriestSpearGun",
		Introduced = "21.0",
		Link = "Scourge",
		Magazine = 40,
		Mastery = 6,
		MaxRank = 30,
		Name = "Scourge",
		Polarities = { "Naramon", "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Scourge Prime"] = {
		Accuracy = 100,
		AmmoMax = 360,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Corrosive = 80 },
				FireRate = 2.67,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Corrosive = 60 },
				Falloff = { EndRange = 1.7, Reduction = 0.3, StartRange = 0 },
				FireRate = 2.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.7,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				Accuracy = 16.7,
				AttackIndex = 3,
				AttackName = "Spear Throw",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 140, Puncture = 30, Slash = 30 },
				FireRate = 1,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 0.6,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi"
			},
			{
				AttackIndex = 4,
				AttackName = "Spear Explosion",
				AttackParentIndex = 3,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Corrosive = 55 },
				Falloff = { EndRange = 7, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE", "IMPACTEXPLODE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Scourge",
		GripType = "SPEAR",
		Image = "ScourgePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeScourge/PrimeScourgeWeapon",
		Introduced = "31",
		Link = "Scourge Prime",
		Magazine = 40,
		Mastery = 14,
		MaxRank = 30,
		Name = "Scourge Prime",
		Polarities = { "Naramon", "Madurai", "Madurai", "Madurai" },
		Reload = 2.2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Secura Penta"] = {
		Accuracy = 100,
		AmmoMax = 28,
		AmmoPickup = 5,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Impact = 75 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 0.26
			},
			{
				AttackIndex = 2,
				AttackName = "Grenade Detonation",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Blast = 300 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.26
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Penta",
		GripType = "",
		Image = "SecuraPenta.png",
		InternalName = "/Lotus/Weapons/Syndicates/PerrinSequence/LongGuns/PSPenta",
		Introduced = "17.3",
		Link = "Secura Penta",
		Magazine = 7,
		Mastery = 12,
		MaxRank = 30,
		Name = "Secura Penta",
		Polarities = { "Naramon", "Vazarin", "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Sequence",
		Tradable = 1,
		Traits = { "Syndicate", "Perrin Sequence" },
		Trigger = "Active",
		_TooltipAttackDisplay = 2
	},
	Shedu = {
		Accuracy = 28.6,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Heat = 71 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.23
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.25,
				CritMultiplier = 2.1,
				Damage = { Electricity = 87 },
				Falloff = { EndRange = 6.6, Reduction = 0.6, StartRange = 0 },
				FireRate = 2.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6.6,
				ShotType = "AoE",
				StatusChance = 0.29
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Sentients/Shedu/SheduInnateUpgrade" },
		Disposition = 0.75,
		ExilusPolarity = "None",
		Family = "Shedu",
		GripType = "ARM_GUN_ONE_HAND",
		Image = "Shedu.png",
		InternalName = "/Lotus/Weapons/Sentients/Shedu/SheduHeavyWeapon",
		Introduced = "27",
		Link = "Shedu",
		Magazine = 7,
		Mastery = 13,
		MaxRank = 30,
		Name = "Shedu",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.25,
		ReloadDelay = 0.4,
		ReloadDelayEmpty = 1,
		ReloadRate = 28,
		ReloadStyle = "Regenerate",
		SellPrice = 5000,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Sentient" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2
	},
	Simulor = {
		Accuracy = 28.6,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Orb Launch",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Impact = 0 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 12,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Orb Merging Damage",
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Magnetic = 100 },
				FireRate = 3,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				AttackIndex = 3,
				AttackName = "Orb Explosion",
				AttackParentIndex = 1,
				CritChance = 0.12,
				CritMultiplier = 2,
				Damage = { Magnetic = 200 },
				Falloff = { EndRange = 5, Reduction = 0.6, StartRange = 0 },
				FireRate = 3,
				ForcedProcs = { "Electricity" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "AOE", "PROJECTILE" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Simulor",
		GripType = "",
		Image = "Simulor.png",
		InternalName = "/Lotus/Weapons/Cephalon/Primary/CephPrimary/CephPrimary",
		Introduced = "16.10",
		Link = "Simulor",
		Magazine = 8,
		Mastery = 5,
		MaxRank = 30,
		Name = "Simulor",
		Polarities = { "Vazarin", "Naramon" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Cephalon" },
		Trigger = "Active",
		_TooltipAttackDisplay = 3
	},
	Snipetron = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 1.5,
				Damage = { Impact = 18, Puncture = 144, Slash = 18 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 2.5,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			}
		},
		Class = "Sniper Rifle",
		CodexSecret = true,
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Snipetron",
		GripType = "",
		Image = "Snipetron.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/SniperRifle",
		Introduced = "Vanilla",
		Link = "Snipetron",
		Magazine = 4,
		Mastery = 0,
		MaxRank = 30,
		Name = "Snipetron",
		Polarities = { "Madurai" },
		Reload = 3.5,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 3,
		SniperComboReset = 2,
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+30% Headshot Damage)", "6x (+50% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	["Snipetron Vandal"] = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Impact = 10, Puncture = 180, Slash = 10 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 3,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.16
			}
		},
		Class = "Sniper Rifle",
		CodexSecret = true,
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Snipetron",
		GripType = "",
		Image = "SnipetronVandal.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/VandalSniperRifle",
		Introduced = "8.3.2",
		Link = "Snipetron Vandal",
		Magazine = 6,
		Mastery = 5,
		MaxRank = 30,
		Name = "Snipetron Vandal",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 3,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Corpus", "Invasion Reward", "Vandal" },
		Trigger = "Semi-Auto",
		Zoom = { "2.5x (+30% Headshot Damage)", "6x (+50% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	Sobek = {
		Accuracy = 9.1,
		AmmoMax = 240,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Impact = 52.5, Puncture = 8.75, Slash = 8.75 },
				Falloff = { EndRange = 30, Reduction = 0.5, StartRange = 20 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 5,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.162
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.33,
		ExilusPolarity = "Naramon",
		Family = "Sobek",
		GripType = "",
		Image = "Sobek.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/DoubleBarrelShotgun",
		Introduced = "9.0",
		Link = "Sobek",
		Magazine = 20,
		Mastery = 7,
		MaxRank = 30,
		Name = "Sobek",
		Reload = 2.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Trooper", "Nok" },
		_TooltipAttackDisplay = 1
	},
	Soma = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 1.2, Puncture = 4.8, Slash = 6 },
				FireRate = 15,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.07
			},
			{
				Accuracy = 8,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.1,
				CritMultiplier = 3,
				Damage = { Impact = 0.48, Puncture = 2.24, Slash = 5.28 },
				Falloff = { EndRange = 0, Reduction = 0, StartRange = 0 },
				FireRate = 7,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 8,
				PunchThrough = 0.8,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.025
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Soma",
		GripType = "",
		Image = "Soma.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "SomaIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/TennoAR",
		Introduced = "10.0",
		Link = "Soma",
		Magazine = 100,
		Mastery = 6,
		MaxRank = 30,
		Name = "Soma",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 6,
		Traits = { "Tenno" },
		Trigger = "Auto-Spool",
		Users = { "Rhino Specter" },
		_TooltipAttackDisplay = 1
	},
	["Soma Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 800,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 1.2, Puncture = 4.8, Slash = 6 },
				FireRate = 15,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			},
			{
				Accuracy = 28.57,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.1,
				CritMultiplier = 3.4,
				Damage = { Impact = 1.08, Puncture = 5.04, Slash = 11.88 },
				Falloff = { EndRange = 0, Reduction = 0, StartRange = 0 },
				FireRate = 7,
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 8,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.03
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Soma",
		GripType = "",
		Image = "SomaPrime.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "SomaPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeSoma/PrimeSomaRifle",
		Introduced = "15.7",
		Link = "Soma Prime",
		Magazine = 200,
		Mastery = 7,
		MaxRank = 30,
		Name = "Soma Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 4,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1
	},
	Sporothrix = {
		Accuracy = 100,
		AmmoMax = 45,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.01,
				CritMultiplier = 3,
				Damage = { Impact = 100.17, Puncture = 115.01, Slash = 155.82 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 1.83,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 270,
				ShotType = "Projectile",
				StatusChance = 0.53,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "AoE",
				AttackParentIndex = 1,
				CritChance = 0.01,
				CritMultiplier = 3,
				Damage = { Slash = 22, Viral = 19 },
				ExplosionDelay = 0.9,
				Falloff = { EndRange = 1.7, Reduction = 0.1, StartRange = 0 },
				FireRate = 1.83,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.7,
				ShotType = "AoE",
				StatusChance = 0.53
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO", "PROJECTILE" },
		Conclave = false,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Sporothrix",
		GripType = "",
		Image = "Sporothrix.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/InfSniperRifle/InfSniperRifle",
		Introduced = "29.5",
		Link = "Sporothrix",
		Magazine = 9,
		Mastery = 13,
		MaxRank = 30,
		Name = "Sporothrix",
		Polarities = { "Vazarin" },
		Reload = 2.7,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Infested" },
		Trigger = "Semi-Auto",
		Zoom = { "2.7x Zoom (+50% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	Stahlta = {
		Accuracy = 50,
		AmmoMax = 300,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.24,
				CritMultiplier = 1.8,
				Damage = { Impact = 7.28, Puncture = 16.64, Slash = 28.08 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 1.2,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Auto"
			},
			{
				Accuracy = 25,
				AmmoCost = 20,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				ChargeTime = 1.6,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Impact = 120, Puncture = 180, Slash = 300 },
				FireRate = 0.667,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 300,
				ShotType = "Projectile",
				StatusChance = 0.32,
				Trigger = "Charge"
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire AoE",
				AttackParentIndex = 2,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Radiation = 1200 },
				EmbedDelay = 0.36,
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 0.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.5,
				Trigger = "Charge"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 1.05,
		ExilusPolarity = "Naramon",
		Family = "Stahlta",
		GripType = "",
		Image = "Stahlta.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpRubanRifle/CrpRubanRifle",
		Introduced = "28",
		Link = "Stahlta",
		Magazine = 40,
		Mastery = 10,
		MaxRank = 30,
		Name = "Stahlta",
		Polarities = { "Madurai" },
		Reload = 1.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Corpus" },
		Trigger = "Auto / Charge",
		_TooltipAttackDisplay = 1
	},
	Steflos = {
		Accuracy = 100,
		AmmoMax = 36,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Heat = 190, Impact = 130 },
				Falloff = { EndRange = 16, Reduction = 0.96875, StartRange = 8 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 20,
				ShotType = "Projectile",
				StatusChance = 0.22
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Steflos",
		GripType = "",
		Image = "Steflos.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnoLotusPodShotgun/TnoLotusPodShotgun",
		Introduced = "32.3",
		Link = "Steflos",
		Magazine = 12,
		Mastery = 8,
		MaxRank = 30,
		Name = "Steflos",
		Polarities = { "Madurai" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Stradavar = {
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 14.3,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full Auto Mode",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Impact = 9.8, Puncture = 9.8, Slash = 8.4 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			},
			{
				Accuracy = 28.6,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Impact = 7.5, Puncture = 30, Slash = 12.5 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.16,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Stradavar",
		GripType = "",
		Image = "Stradavar.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TennoTommyGun/TennoTommyGunRifle",
		Introduced = "18.11",
		Link = "Stradavar",
		Magazine = 65,
		Mastery = 8,
		MaxRank = 30,
		Name = "Stradavar",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Stradavar Prime"] = {
		AmmoMax = 720,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				Accuracy = 25,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full Auto Mode",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 10.5, Puncture = 10.5, Slash = 9 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			},
			{
				Accuracy = 66.7,
				AmmoCost = 2,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 8, Puncture = 24, Slash = 48 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Stradavar",
		GripType = "",
		Image = "StradavarPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeStradavar/PrimeStradavarGun",
		Introduced = "24.5.8",
		Link = "Stradavar Prime",
		Magazine = 90,
		Mastery = 12,
		MaxRank = 30,
		Name = "Stradavar Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Strun = {
		Accuracy = 4,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.075,
				CritMultiplier = 1.5,
				Damage = { Impact = 13.75, Puncture = 3.75, Slash = 7.5 },
				Falloff = { EndRange = 25, Reduction = 0.4, StartRange = 12 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 35,
				MinSpread = 15,
				Multishot = 12,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.05
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.44,
				CritMultiplier = 2.8,
				Damage = { Impact = 100 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.4
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.44,
				CritMultiplier = 2.8,
				Damage = { Blast = 60, Puncture = 30, Slash = 80 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.4
			}
		},
		Class = "Shotgun",
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Strun",
		GripType = "",
		Image = "Strun.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "StrunIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/Shotgun",
		Introduced = "Vanilla",
		Link = "Strun",
		Magazine = 6,
		Mastery = 1,
		MaxRank = 30,
		Name = "Strun",
		Polarities = { "Naramon" },
		Reload = 3.75,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Corrupted Crewman" },
		_TooltipAttackDisplay = 1
	},
	["Strun Prime"] = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 24.3, Puncture = 8.1, Slash = 21.6 },
				Falloff = { EndRange = 52, Reduction = 0.78, StartRange = 26 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 7,
				Multishot = 12,
				PunchThrough = 0.8,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0667
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.48,
				CritMultiplier = 3.4,
				Damage = { Impact = 100 },
				FireRate = 2.5,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.46
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.48,
				CritMultiplier = 3.4,
				Damage = { Blast = 60, Puncture = 40, Slash = 100 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 2.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.46
			}
		},
		Class = "Shotgun",
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Strun",
		GripType = "",
		Image = "StrunPrime.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "StrunPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeStrun/PrimeStrunWeapon",
		Introduced = "30.7",
		Link = "Strun Prime",
		Magazine = 10,
		Mastery = 14,
		MaxRank = 30,
		Name = "Strun Prime",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 4.6,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Strun Wraith"] = {
		Accuracy = 6.7,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Impact = 26, Puncture = 6, Slash = 8 },
				Falloff = { EndRange = 30, Reduction = 0.5, StartRange = 15 },
				FireRate = 2.5,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 10,
				Multishot = 10,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.56,
				CritMultiplier = 3.4,
				Damage = { Impact = 100 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 40,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.44
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form AoE",
				AttackParentIndex = 2,
				CritChance = 0.56,
				CritMultiplier = 3.4,
				Damage = { Blast = 70, Puncture = 40, Slash = 90 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 2,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.44
			}
		},
		Class = "Shotgun",
		CodexSecret = true,
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Strun",
		GripType = "",
		Image = "StrunWraith.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "StrunWraithIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Shotgun/ShotgunVandal",
		Introduced = "9.7.2",
		Link = "Strun Wraith",
		Magazine = 10,
		Mastery = 10,
		MaxRank = 30,
		Name = "Strun Wraith",
		Polarities = { "Naramon" },
		Reload = 5,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Tenno", "Invasion Reward", "Wraith" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Supra = {
		Accuracy = 14.3,
		AmmoMax = 1080,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Impact = 4, Puncture = 30, Slash = 6 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Supra",
		GripType = "",
		Image = "Supra.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/CrpHeavyRifle",
		Introduced = "8.0",
		Link = "Supra",
		Magazine = 180,
		Mastery = 12,
		MaxRank = 30,
		Name = "Supra",
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 5,
		Traits = { "Corpus" },
		Trigger = "Auto-Spool",
		Users = { "Corpus Tech", "M-W.A.M." },
		_TooltipAttackDisplay = 1
	},
	["Supra Vandal"] = {
		Accuracy = 28.6,
		AmmoMax = 1600,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 4, Puncture = 30, Slash = 6 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Supra",
		GripType = "",
		Image = "SupraVandal.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/Machinegun/SupraVandal",
		Introduced = "20.4",
		Link = "Supra Vandal",
		Magazine = 300,
		Mastery = 14,
		MaxRank = 30,
		Name = "Supra Vandal",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 4,
		Tradable = 1,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1
	},
	Sybaris = {
		Accuracy = 28.6,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0.101,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 26.4, Puncture = 26.4, Slash = 27.2 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 4,
				BurstDelay = 0.101,
				CritChance = 0.2,
				CritMultiplier = 3,
				Damage = { Impact = 29.7, Puncture = 29.7, Slash = 30.6 },
				FireRate = 3.33,
				ForcedProcs = { "Blast" },
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Sybaris",
		GripType = "",
		Image = "Sybaris.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "SybarisIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnoLeverAction/TnoLeverActionRifle",
		Introduced = "13.3",
		Link = "Sybaris",
		Magazine = 10,
		Mastery = 5,
		MaxRank = 30,
		Name = "Sybaris",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	["Sybaris Prime"] = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0.062,
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 29.04, Puncture = 29.04, Slash = 29.92 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 4,
				BurstDelay = 0.062,
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 36.3, Puncture = 36.3, Slash = 37.4 },
				FireRate = 3.33,
				ForcedProcs = { "Blast" },
				IncarnonCharges = 200,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Sybaris",
		GripType = "",
		Image = "SybarisPrime.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "SybarisPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeSybaris/PrimeSybarisRifle",
		Introduced = "20.6.2",
		Link = "Sybaris Prime",
		Magazine = 20,
		Mastery = 12,
		MaxRank = 30,
		Name = "Sybaris Prime",
		Polarities = { "Naramon", "Naramon", "Madurai" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	Synapse = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.39,
				CritMultiplier = 2.7,
				Damage = { Corrosive = 20 },
				ExtraHeadshotDmg = 0.2,
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 27,
				ShotType = "Hit-Scan",
				StatusChance = 0.13
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Infested/LongGuns/InfestedRifleInnateUpgrade" },
		Disposition = 1.31,
		ExilusPolarity = "Madurai",
		Family = "Synapse",
		GripType = "",
		Image = "Synapse.png",
		InternalName = "/Lotus/Weapons/Infested/LongGuns/InfestedRifle",
		Introduced = "10.0",
		Link = "Synapse",
		Magazine = 70,
		Mastery = 11,
		MaxRank = 30,
		Name = "Synapse",
		Reload = 1.5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	["Synoid Simulor"] = {
		Accuracy = 28.6,
		AmmoMax = 96,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Orb Launch",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Impact = 0 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 12,
				ShotType = "Projectile",
				StatusChance = 0
			},
			{
				AttackIndex = 2,
				AttackName = "Orb Merging Damage",
				AttackParentIndex = 1,
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Magnetic = 125 },
				Falloff = { EndRange = 4, Reduction = 0, StartRange = 0 },
				FireRate = 3.33,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.35
			},
			{
				AttackIndex = 3,
				AttackName = "Orb Explosion",
				AttackParentIndex = 1,
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Magnetic = 240 },
				Falloff = { EndRange = 5, Reduction = 1, StartRange = 0 },
				FireRate = 3.33,
				ForcedProcs = { "Electricity" },
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.35
			},
			{
				AttackIndex = 4,
				AttackName = "Fully Stacked Orb Singularity",
				CritChance = 0,
				CritMultiplier = 0,
				Damage = { Magnetic = 50 },
				EffectDuration = 20,
				Falloff = { EndRange = 5, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				Range = 5,
				ShotType = "DoT",
				StatusChance = 0
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "AOE", "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Simulor",
		GripType = "",
		Image = "SynoidSimulor.png",
		InternalName = "/Lotus/Weapons/Syndicates/CephalonSuda/LongGuns/CSSimulor",
		Introduced = "17.3",
		Link = "Synoid Simulor",
		Magazine = 16,
		Mastery = 12,
		MaxRank = 30,
		Name = "Synoid Simulor",
		Polarities = { "Madurai", "Vazarin", "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Entropy",
		Tradable = 1,
		Traits = { "Syndicate", "Cephalon Suda", "Cephalon" },
		Trigger = "Active",
		_TooltipAttackDisplay = 3
	},
	["Telos Boltor"] = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.4,
				Damage = { Impact = 3, Puncture = 27 },
				FireRate = 9.33,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.16
			},
			{
				Accuracy = 10,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.36,
				CritMultiplier = 3.2,
				Damage = { Impact = 2, Puncture = 6, Slash = 12 },
				FireRate = 10.33,
				IncarnonCharges = 160,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 8,
				Multishot = 3,
				PunchThrough = 0.6,
				ShotSpeed = 85,
				ShotType = "Projectile",
				StatusChance = 0.1067,
				Trigger = "Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Boltor",
		GripType = "",
		Image = "TelosBoltor.png",
		IncarnonChargeGain = 8,
		IncarnonImage = "TelosBoltorIncarnon.png",
		InternalName = "/Lotus/Weapons/Syndicates/ArbitersOfHexis/LongGuns/AHBoltor",
		Introduced = "17.3",
		Link = "Telos Boltor",
		Magazine = 90,
		Mastery = 12,
		MaxRank = 30,
		Name = "Telos Boltor",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 2.4,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Truth",
		Tradable = 1,
		Traits = { "Syndicate", "Arbiters of Hexis" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Tenet Arca Plasmor"] = {
		Accuracy = 9.1,
		AmmoMax = 40,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Radiation = 760 },
				ExtraHeadshotDmg = -2,
				Falloff = { EndRange = 36, Reduction = 0.5, StartRange = 18 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				Range = 44.4,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.34
			}
		},
		Class = "Shotgun",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Arca Plasmor",
		GripType = "",
		Image = "TenetArcaPlasmor.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBEArcaPlasmor/CrpBEArcaPlasmor",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Arca Plasmor",
		Magazine = 10,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Arca Plasmor",
		Polarities = { "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Tenet Envoy"] = {
		Accuracy = 100,
		AmmoMax = 16,
		AmmoPickup = 4,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Impact = 100 },
				FireRate = 0.83,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.24
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.28,
				CritMultiplier = 2.6,
				Damage = { Cold = 640 },
				Falloff = { EndRange = 8, Reduction = 0.8, StartRange = 0 },
				FireRate = 0.83,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.24
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Corpus/LongGuns/CrpBriefcaseLauncher/CrpBriefcaseLauncherInnateMod"
		},
		Disposition = 0.65,
		ExilusPolarity = "Naramon",
		Family = "Tenet Envoy",
		GripType = "",
		Image = "TenetEnvoy.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CrpBriefcaseLauncher/CrpBriefcaseLauncher",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Envoy",
		Magazine = 8,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Envoy",
		Reload = 4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2
	},
	["Tenet Ferrox"] = {
		Accuracy = 16.7,
		AmmoMax = 100,
		AmmoPickup = 20,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.4,
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 20, Puncture = 140, Slash = 40 },
				FireRate = 2.67,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 6, Puncture = 42, Slash = 12 },
				Falloff = { EndRange = 4, Reduction = 0.3, StartRange = 0 },
				FireRate = 2.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.26
			},
			{
				AttackIndex = 3,
				AttackName = "Spear Throw",
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Impact = 35, Puncture = 5, Slash = 10 },
				FireRate = 1,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.4,
				Trigger = "Semi"
			},
			{
				AttackIndex = 4,
				AttackName = "Attraction Field",
				AttackParentIndex = 3,
				CritChance = 0.04,
				CritMultiplier = 2,
				Damage = { Electricity = 150 },
				EffectDuration = 30,
				FireRate = 0.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Speargun",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/LongGuns/GrnFlameSpear/GunSpearInnateMod",
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod"
		},
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Ferrox",
		GripType = "SPEAR",
		Image = "TenetFerrox.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBEFerrox/CrpBEFerrox",
		Introduced = "32.2",
		IsLichWeapon = true,
		Link = "Tenet Ferrox",
		Magazine = 20,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Ferrox",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Charged Auto",
		_TooltipAttackDisplay = 1
	},
	["Tenet Flux Rifle"] = {
		Accuracy = 200,
		AmmoMax = 1200,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Puncture = 4.84, Slash = 17.16 },
				FireRate = 15,
				IsSilent = false,
				MaxSpread = 1,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Flux Rifle",
		GripType = "",
		Image = "TenetFluxRifle.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBEFluxRifle/CrpBEFluxRifle",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Flux Rifle",
		Magazine = 120,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Flux Rifle",
		Polarities = {  },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Tenet Glaxion"] = {
		Accuracy = 100,
		AmmoMax = 810,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2.2,
				Damage = { Cold = 34 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 30,
				ShotType = "Hit-Scan",
				StatusChance = 0.4
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Glaxion",
		GripType = "",
		Image = "TenetGlaxion.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBEGlaxion/CrpBEGlaxion",
		Introduced = "35.6",
		IsLichWeapon = true,
		Link = "Tenet Glaxion",
		Magazine = 90,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Glaxion",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1
	},
	["Tenet Quanta"] = {
		Accuracy = 100,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Beam",
				CritChance = 0.31,
				CritMultiplier = 2.5,
				Damage = { Electricity = 18 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0,
				Range = 50,
				ShotType = "Hit-Scan",
				StatusChance = 0.26,
				Trigger = "Held"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Cube (direct hit)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 180 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 15,
				ShotSpeed = 25,
				ShotType = "Projectile",
				StatusChance = 1,
				Trigger = "Semi"
			},
			{
				AttackIndex = 3,
				AttackName = "Cube Explosion",
				AttackParentIndex = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 150 },
				Falloff = { EndRange = 0.5, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.5,
				ShotType = "AoE",
				StatusChance = 0.26
			},
			{
				AttackIndex = 4,
				AttackName = "Cube (shot by player)",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Blast = 600 },
				Falloff = { EndRange = 6, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				StatusChance = 0.26
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "BEAM", "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 0.75,
		ExilusPolarity = "Naramon",
		Family = "Quanta",
		GripType = "",
		Image = "TenetQuanta.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBEQuanta/CrpBEQuanta",
		Introduced = "42",
		IsLichWeapon = true,
		Link = "Tenet Quanta",
		Magazine = 100,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Quanta",
		Polarities = { "Vazarin", "Madurai", "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Held / Semi",
		_TooltipAttackDisplay = 1
	},
	["Tenet Tetra"] = {
		Accuracy = 18.2,
		AmmoMax = 480,
		AmmoPickup = 40,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 13.2, Puncture = 33.6, Slash = 13.2 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AmmoCost = 80,
				AttackIndex = 2,
				AttackName = "Grenade Impact",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 200 },
				FireRate = 1.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 1.8,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto"
			},
			{
				AmmoCost = 80,
				AttackIndex = 3,
				AttackName = "Grenade AoE",
				AttackParentIndex = 2,
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Blast = 1000 },
				Falloff = { EndRange = 8, Reduction = 0.6, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Tetra",
		GripType = "",
		Image = "TenetTetra.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Primary/CrpBETetra/CrpBETetra",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Tetra",
		Magazine = 80,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Tetra",
		Polarities = {  },
		Reload = 2.2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	Tenora = {
		Accuracy = 12.5,
		AmmoMax = 900,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.28,
				CritMultiplier = 2,
				Damage = { Impact = 7.2, Puncture = 9.6, Slash = 7.2 },
				FireRate = 11.67,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.16,
				Trigger = "Auto-Spool"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Charged Attack",
				ChargeTime = 0.8,
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 48, Puncture = 144, Slash = 48 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.11,
				Trigger = "Charge"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnBardRifle/TnBardRifleInnateUpgrade" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Tenora",
		GripType = "",
		Image = "Tenora.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnBardRifle/TnBardRifle",
		Introduced = "20.0",
		Link = "Tenora",
		Magazine = 150,
		Mastery = 10,
		MaxRank = 30,
		Name = "Tenora",
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 9,
		Traits = { "Tenno" },
		Trigger = "Auto-Spool / Charge",
		_TooltipAttackDisplay = 1
	},
	["Tenora Prime"] = {
		Accuracy = 12.5,
		AmmoMax = 1000,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Impact = 8.4, Puncture = 11.2, Slash = 8.4 },
				FireRate = 12.67,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.24,
				Trigger = "Auto-Spool"
			},
			{
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Charged Attack",
				ChargeTime = 0.8,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Impact = 56, Puncture = 168, Slash = 56 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2,
				Trigger = "Charge"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/TnBardRifle/TnBardRifleInnateUpgrade" },
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Tenora",
		GripType = "",
		Image = "TenoraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeTenora/TenoraPrimeWeapon",
		Introduced = "29.9",
		Link = "Tenora Prime",
		Magazine = 200,
		Mastery = 14,
		MaxRank = 30,
		Name = "Tenora Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Spool = 9,
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto-Spool / Charge",
		_TooltipAttackDisplay = 1
	},
	Tetra = {
		Accuracy = 18.2,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.04,
				CritMultiplier = 1.5,
				Damage = { Impact = 6.4, Puncture = 25.6 },
				FireRate = 6.67,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 3,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.5,
		ExilusPolarity = "Madurai",
		Family = "Tetra",
		GripType = "",
		Image = "Tetra.png",
		InternalName = "/Lotus/Weapons/Corpus/LongGuns/CorpusUMP/CorpusUMP",
		Introduced = "11.8",
		Link = "Tetra",
		Magazine = 60,
		Mastery = 3,
		MaxRank = 30,
		Name = "Tetra",
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Corpus" },
		Trigger = "Auto",
		Users = { "Nako Xol", "Terra Provisor", "Terra Elite Crewman" },
		_TooltipAttackDisplay = 1
	},
	Thornbak = {
		Accuracy = 25,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 4,
				BurstDelay = 0.066,
				CritChance = 0.06,
				CritMultiplier = 1.4,
				Damage = { Impact = 9.3324, Puncture = 9.3324, Slash = 9.3352 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.36
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "",
		Family = "Thornbak",
		GripType = "",
		Image = "Thornbak.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnModQuestRifle/TnModQuestRifleWeapon",
		Introduced = "40",
		Link = "Thornbak",
		Magazine = 52,
		Mastery = 0,
		MaxRank = 30,
		Name = "Thornbak",
		Polarities = { "Naramon" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	Tiberon = {
		Accuracy = 33.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.06,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 11, Puncture = 22, Slash = 11 },
				FireRate = 6.67,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.16
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Tiberon",
		GripType = "",
		Image = "Tiberon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/DrakeRifle/DrakeRifle",
		Introduced = "14.9",
		Link = "Tiberon",
		Magazine = 30,
		Mastery = 10,
		MaxRank = 30,
		Name = "Tiberon",
		Polarities = { "Madurai" },
		Reload = 2.26,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1
	},
	["Tiberon Prime"] = {
		Accuracy = 33.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst",
				BurstCount = 3,
				BurstDelay = 0.08,
				CritChance = 0.28,
				CritMultiplier = 3,
				Damage = { Impact = 14.4, Puncture = 19.2, Slash = 14.4 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Semi-Auto",
				CritChance = 0.42,
				CritMultiplier = 3.4,
				Damage = { Impact = 14.4, Puncture = 19.2, Slash = 14.4 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Auto",
				CritChance = 0.16,
				CritMultiplier = 2.8,
				Damage = { Impact = 14.4, Puncture = 19.2, Slash = 14.4 },
				FireRate = 8.33,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.32
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Tiberon",
		GripType = "",
		Image = "TiberonPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeTiberon/PrimeTiberonRifle",
		Introduced = "22.16.4",
		Link = "Tiberon Prime",
		Magazine = 42,
		Mastery = 14,
		MaxRank = 30,
		Name = "Tiberon Prime",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		Reload = 2,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Burst / Semi / Auto",
		_TooltipAttackDisplay = 1
	},
	Tigris = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 21, Puncture = 21, Slash = 168 },
				Falloff = { EndRange = 20, Reduction = 0.5238, StartRange = 10 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 5,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.168
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Tigris",
		GripType = "",
		Image = "Tigris.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/DoubleBarrelShotgun/TennoDoubleBarrelShotgun",
		Introduced = "11.0",
		Link = "Tigris",
		Magazine = 2,
		Mastery = 7,
		MaxRank = 30,
		Name = "Tigris",
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Duplex",
		Users = { "Frost Specter" },
		_TooltipAttackDisplay = 1
	},
	["Tigris Prime"] = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 19.5, Puncture = 19.5, Slash = 156 },
				Falloff = { EndRange = 20, Reduction = 0.4872, StartRange = 10 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 8,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1125
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Naramon",
		Family = "Tigris",
		GripType = "",
		Image = "TigrisPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeTigris/PrimeTigris",
		Introduced = "Hotfix: The Silver Grove 3",
		Link = "Tigris Prime",
		Magazine = 2,
		Mastery = 13,
		MaxRank = 30,
		Name = "Tigris Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1
	},
	Tonkor = {
		Accuracy = 100,
		AmmoMax = 30,
		AmmoPickup = 3,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Puncture = 75 },
				FireRate = 3.17,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.1
			},
			{
				AttackIndex = 2,
				AttackName = "Grenade Explosion",
				AttackParentIndex = 1,
				CritChance = 0.25,
				CritMultiplier = 2.5,
				Damage = { Blast = 650 },
				Falloff = { EndRange = 7, Reduction = 0.7, StartRange = 0 },
				FireRate = 3.17,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.1
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Tonkor",
		GripType = "",
		Image = "Tonkor.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnGrenadeLauncher/GrnGrenadeLauncher",
		Introduced = "16.4",
		Link = "Tonkor",
		Magazine = 1,
		Mastery = 5,
		MaxRank = 30,
		Name = "Tonkor",
		Reload = 1.7,
		SellPrice = 8500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Kuva Napalm", "Nightwatch Reaver", "Aerial Commander" },
		_TooltipAttackDisplay = 2
	},
	Torid = {
		Accuracy = 100,
		AmmoMax = 60,
		AmmoPickup = 10,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Grenade Impact",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Toxin = 100 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.23
			},
			{
				AttackIndex = 2,
				AttackName = "Poison Cloud",
				AttackParentIndex = 1,
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Toxin = 40 },
				EffectDuration = 10,
				Falloff = { EndRange = 3, Reduction = 1, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.25
			},
			{
				Accuracy = 80,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				CritChance = 0.29,
				CritMultiplier = 3.1,
				Damage = { Toxin = 51 },
				FireRate = 8,
				IncarnonCharges = 170,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 37,
				ShotType = "Hit-Scan",
				StatusChance = 0.39,
				Trigger = "Held"
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "PROJECTILE", "SINGLESHOT", "AOE" },
		Conclave = false,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Torid",
		GripType = "",
		Image = "Torid.png",
		IncarnonChargeGain = 34,
		IncarnonImage = "ToridIncarnon.png",
		InternalName = "/Lotus/Weapons/ClanTech/Bio/BioWeapon",
		Introduced = "8.0",
		Link = "Torid",
		Magazine = 5,
		Mastery = 4,
		MaxRank = 30,
		Name = "Torid",
		Reload = 1.7,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Infested" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Trumna = {
		Accuracy = 200,
		AmmoMax = 400,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Heat = 53, Impact = 29 },
				FireRate = 4.67,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3,
				Trigger = "Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "Auto AoE",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Heat = 50 },
				Falloff = { EndRange = 1.6, Reduction = 0.15, StartRange = 0 },
				FireRate = 4.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.6,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				Accuracy = 9.1,
				AttackIndex = 3,
				AttackName = "Grenade Impact",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Impact = 100 },
				FireRate = 1.33,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.5,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 4,
				AttackName = "Grenade Bounce AoE",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Heat = 1000 },
				Falloff = { EndRange = 6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Thanotech/ThanoRifle/ThanotechRifleWeaponInnateMod" },
		Disposition = 0.85,
		ExilusPolarity = "Naramon",
		Family = "Trumna",
		GripType = "",
		Image = "Trumna.png",
		InternalName = "/Lotus/Weapons/Thanotech/ThanoRifle/ThanotechRifle",
		Introduced = "29",
		Link = "Trumna",
		Magazine = 200,
		Mastery = 13,
		MaxRank = 30,
		Name = "Trumna",
		Polarities = {  },
		Reload = 5,
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Entrati" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Trumna Prime"] = {
		Accuracy = 200,
		AmmoMax = 500,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Heat = 53, Impact = 32 },
				FireRate = 4.67,
				IsSilent = false,
				MaxSpread = 0.7,
				MinSpread = 0.3,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.34,
				Trigger = "Auto"
			},
			{
				AttackIndex = 2,
				AttackName = "Auto AoE",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Heat = 50 },
				Falloff = { EndRange = 1.6, Reduction = 0.15, StartRange = 0 },
				FireRate = 4.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.6,
				ShotType = "AoE",
				StatusChance = 0.34
			},
			{
				Accuracy = 9.1,
				AttackIndex = 3,
				AttackName = "Grenade Impact",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Impact = 100 },
				FireRate = 1.33,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.5,
				Trigger = "Semi-Auto"
			},
			{
				AttackIndex = 4,
				AttackName = "Grenade Bounce AoE",
				CritChance = 0.38,
				CritMultiplier = 2.4,
				Damage = { Heat = 1150 },
				Falloff = { EndRange = 6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Thanotech/ThanoRifle/ThanotechRifleWeaponInnateMod" },
		Disposition = 0.65,
		ExilusPolarity = "Naramon",
		Family = "Trumna",
		GripType = "",
		Image = "TrumnaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeTrumna/PrimeTrumnaWeapon",
		Introduced = "37.0.9",
		Link = "Trumna Prime",
		Magazine = 250,
		Mastery = 15,
		MaxRank = 30,
		Name = "Trumna Prime",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 4,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1
	},
	["Vadarya Prime"] = {
		Accuracy = 100,
		AmmoMax = 72,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				ChargeTime = 0.75,
				CritChance = 0.4,
				CritMultiplier = 2.8,
				Damage = { Electricity = 400 },
				FireRate = 2.8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/LongGuns/PrimeLightningGun/VadaryaPrimePassiveDescUpgrade"
		},
		Disposition = 0.75,
		ExilusPolarity = "Naramon",
		Family = "Vadarya Prime",
		GripType = "",
		Image = "VadaryaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeLightningGun/PrimeLightningGun",
		Introduced = "39.1",
		Link = "Vadarya Prime",
		Magazine = 16,
		Mastery = 15,
		MaxRank = 30,
		Name = "Vadarya Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.6,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 3,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "" },
		Trigger = "Auto Charge",
		_TooltipAttackDisplay = 1
	},
	["Vaykor Hek"] = {
		Accuracy = 9.1,
		AmmoMax = 120,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 11.25, Puncture = 48.75, Slash = 15 },
				Falloff = { EndRange = 25, Reduction = 0.7333, StartRange = 10 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 6,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.107
			}
		},
		Class = "Shotgun",
		CompatibilityTags = { "SYNDICATEMODBLOCKED", "SEMI_AUTO" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Hek",
		GripType = "",
		Image = "VaykorHek.png",
		InternalName = "/Lotus/Weapons/Syndicates/SteelMeridian/LongGuns/SMHek",
		Introduced = "17.3",
		Link = "Vaykor Hek",
		Magazine = 8,
		Mastery = 12,
		MaxRank = 30,
		Name = "Vaykor Hek",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 2.25,
		SellPrice = 7500,
		Slot = "Primary",
		SyndicateEffect = "Justice",
		Tradable = 1,
		Traits = { "Syndicate", "Steel Meridian" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Vectis = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 90, Puncture = 78.75, Slash = 56.25 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.3
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Cold = 5 },
				FireRate = 1.333,
				ForcedProcs = { "Cold" },
				IncarnonCharges = 45,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 300,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Headshot AoE",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Cold = 5 },
				Falloff = { EndRange = 6.7, Reduction = 0, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6.7,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				AttackIndex = 4,
				AttackName = "Incarnon Form Embed AoE",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Cold = 5 },
				Falloff = { EndRange = 0.15, Reduction = 0, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.15,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO", "Vectis", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Vectis",
		GripType = "",
		Image = "Vectis.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "VectisIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Rifle/TennoSniperRifle",
		Introduced = "10.6",
		Link = "Vectis",
		Magazine = 1,
		Mastery = 2,
		MaxRank = 30,
		Name = "Vectis",
		Polarities = { "Madurai" },
		Reload = 1,
		ReloadDelay = 0,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 1,
		SniperComboReset = 2,
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Saryn Specter" },
		Zoom = { "3x Zoom (+30% Headshot Damage)", "4.5x Zoom (+50% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	["Vectis Prime"] = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 140, Puncture = 157.5, Slash = 52.5 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 2.67,
				ForcedProcs = { "Stagger" },
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.3
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.35,
				CritMultiplier = 3,
				Damage = { Cold = 150 },
				FireRate = 1.333,
				ForcedProcs = { "Cold" },
				IncarnonCharges = 45,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 300,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Headshot AoE",
				AttackParentIndex = 2,
				CritChance = 0.35,
				CritMultiplier = 3,
				Damage = { Cold = 150 },
				Falloff = { EndRange = 6.7, Reduction = 0, StartRange = 0 },
				FireRate = 1.333,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 6.7,
				ShotType = "AoE",
				StatusChance = 0.3
			},
			{
				AttackIndex = 4,
				AttackName = "Incarnon Form Embed AoE",
				AttackParentIndex = 2,
				CritChance = 0.35,
				CritMultiplier = 3,
				Damage = { Cold = 25 },
				Falloff = { EndRange = 0.15, Reduction = 0, StartRange = 0 },
				FireRate = 1.333,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.15,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Vectis",
		GripType = "",
		Image = "VectisPrime.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "VectisPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeVectis/PrimeVectisRifle",
		Introduced = "16.11",
		Link = "Vectis Prime",
		Magazine = 2,
		Mastery = 14,
		MaxRank = 30,
		Name = "Vectis Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 0.85,
		ReloadDelay = 0,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 5,
		SniperComboReset = 2,
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		Zoom = { "3.5x (+40% Headshot Damage)", "6x (+60% Headshot Damage)" },
		_TooltipAttackDisplay = 1
	},
	Veldt = {
		Accuracy = 32,
		AmmoMax = 546,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = { Impact = 23.4, Puncture = 23.4, Slash = 43.2 },
				FireRate = 3.67,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.25,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "PROJECTILE", "ASSAULT_AMMO" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Veldt",
		GripType = "",
		Image = "Veldt.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/TnRevolverRifle/TnRevolverRifleGun",
		Introduced = "22.18",
		Link = "Veldt",
		Magazine = 26,
		Mastery = 8,
		MaxRank = 30,
		Name = "Veldt",
		Polarities = { "Naramon" },
		Reload = 1.8,
		SellPrice = 7500,
		Slot = "Primary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	["Vinquibus (Primary)"] = {
		Accuracy = 33.6,
		AmmoMax = 80,
		AmmoPickup = 8,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 3.2,
				Damage = { Puncture = 280, Slash = 120 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2
			}
		},
		Class = "Rifle",
		CodexSecret = true,
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 0.7,
		Family = "Vinquibus",
		GripType = "",
		Image = "Vinquibus.png",
		InternalName = "/Lotus/Weapons/Tenno/Bayonet/TnBayonetRifleWeapon",
		Introduced = "41",
		Link = "Vinquibus",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Vinquibus (Primary)",
		Polarities = { "Madurai", "Aura" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 0,
		Traits = {  },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1
	},
	Vulkar = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 180, Puncture = 33.8, Slash = 11.2 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 1.5,
				ForcedProcs = { "Big Stagger" },
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.25
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Vulkar",
		GripType = "",
		Image = "Vulkar.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerSniperRifle/GrnSniperRifle",
		Introduced = "8.0",
		Link = "Vulkar",
		Magazine = 6,
		Mastery = 3,
		MaxRank = 30,
		Name = "Vulkar",
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 2,
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Ballista", "Grineer Warden", "Harkonar" },
		Zoom = {
			"2.5x zoom (+35% Headshot Damage)",
			"4x zoom (+55% Headshot Damage)",
			"8x zoom (+70% Headshot Damage)"
		},
		_TooltipAttackDisplay = 1
	},
	["Vulkar Wraith"] = {
		Accuracy = 13.3,
		AmmoMax = 72,
		AmmoPickup = 15,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 245.7, Puncture = 27.3 },
				Falloff = { EndRange = 600, Reduction = 0.5, StartRange = 400 },
				FireRate = 2,
				ForcedProcs = { "Big Stagger" },
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.25
			}
		},
		Class = "Sniper Rifle",
		CompatibilityTags = { "SNIPER_AMMO" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Vulkar",
		GripType = "",
		Image = "VulkarWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerSniperRifle/VulkarWraith",
		Introduced = "18.4.1",
		Link = "Vulkar Wraith",
		Magazine = 8,
		Mastery = 7,
		MaxRank = 30,
		Name = "Vulkar Wraith",
		Polarities = { "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		SniperComboMin = 2,
		SniperComboReset = 2,
		Tradable = 1,
		Traits = { "Wraith", "Baro", "Grineer" },
		Trigger = "Semi-Auto",
		Zoom = {
			"2.5x zoom (+35% Headshot Damage)",
			"4x zoom (+55% Headshot Damage)",
			"8x zoom (+70% Headshot Damage)"
		},
		_TooltipAttackDisplay = 1
	},
	Zarr = {
		Accuracy = 100,
		AmmoMax = 60,
		AmmoPickup = 9,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Cannon Mode Projectile",
				CritChance = 0.17,
				CritMultiplier = 2.5,
				Damage = { Impact = 25 },
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.29
			},
			{
				AttackIndex = 2,
				AttackName = "Cannon Mode Explosion",
				AttackParentIndex = 1,
				CritChance = 0.17,
				CritMultiplier = 2.5,
				Damage = { Blast = 175 },
				Falloff = { EndRange = 4.9, Reduction = 0.5, StartRange = 0 },
				FireRate = 1.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4.9,
				ShotType = "AoE",
				StatusChance = 0.29
			},
			{
				AttackIndex = 3,
				AttackName = "Cannon Mode Cluster Bomb Contact",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 15 },
				FireRate = 1.67,
				IsSilent = false,
				Multishot = 6,
				PunchThrough = 0,
				ShotSpeed = 8,
				ShotType = "Projectile",
				StatusChance = 0.2
			},
			{
				AttackIndex = 4,
				AttackName = "Cannon Mode Cluster Bomb Explosion",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Blast = 50 },
				Falloff = { EndRange = 3, Reduction = 0.9, StartRange = 0 },
				FireRate = 1.67,
				IsSilent = false,
				Multishot = 6,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.1
			},
			{
				Accuracy = 1.4,
				AmmoCost = 1,
				AttackIndex = 5,
				AttackName = "Barrage Mode",
				CritChance = 0.17,
				CritMultiplier = 2.5,
				Damage = { Impact = 24, Puncture = 40, Slash = 16 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 80,
				MinSpread = 60,
				Multishot = 10,
				PunchThrough = 1.6,
				Range = 10,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.087
			}
		},
		Class = "Launcher",
		CompatibilityTags = { "ASSAULT_AMMO", "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Zarr",
		GripType = "",
		Image = "Zarr.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrnCannon/GrnCannonWeapon",
		Introduced = "19",
		Link = "Zarr",
		Magazine = 3,
		Mastery = 7,
		MaxRank = 30,
		Name = "Zarr",
		Polarities = { "Madurai" },
		Reload = 2.25,
		ReloadStyle = "ByRound",
		SellPrice = 7500,
		Slot = "Primary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2
	},
	Zenith = {
		Accuracy = 33.33,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto Mode",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 4.5, Puncture = 6, Slash = 19.5 },
				FireRate = 10.83,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.34
			},
			{
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.35,
				CritMultiplier = 2.5,
				Damage = { Impact = 15, Puncture = 120, Slash = 15 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 99999,
				Range = 300,
				Reload = 1.4,
				ShotType = "Hit-Scan",
				StatusChance = 0.08,
				Trigger = "Semi-Auto"
			}
		},
		Class = "Rifle",
		CompatibilityTags = { "ASSAULT_AMMO" },
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Zenith",
		GripType = "",
		Image = "Zenith.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/LoginPrimary/SundialRifle",
		Introduced = "20.2",
		Link = "Zenith",
		Magazine = 90,
		Mastery = 10,
		MaxRank = 30,
		Name = "Zenith",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.6,
		Slot = "Primary",
		Traits = { "Tenno" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 2
	},
	Zhuge = {
		Accuracy = 40,
		AmmoMax = 540,
		AmmoPickup = 80,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 5, Puncture = 75, Slash = 20 },
				FireRate = 4.17,
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.35
			}
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE", "ZHUGE", "CROSSBOW" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Zhuge",
		GripType = "",
		Image = "Zhuge.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/RepeatingCrossbow/RepeatingCrossbow",
		Introduced = "18.6",
		Link = "Zhuge",
		Magazine = 20,
		Mastery = 10,
		MaxRank = 30,
		Name = "Zhuge",
		Polarities = { "Madurai" },
		Reload = 2.5,
		SellPrice = 7500,
		Slot = "Primary",
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	},
	["Zhuge Prime"] = {
		Accuracy = 40,
		AmmoMax = 270,
		AmmoPickup = 60,
		AmmoType = "Primary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Arrow Impact",
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Impact = 10, Puncture = 22.5, Slash = 17.5 },
				FireRate = 5.5,
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3
			},
			{
				AttackIndex = 2,
				AttackName = "Arrow Explosion",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2,
				Damage = { Impact = 11.2, Puncture = 4, Slash = 24.8 },
				ExplosionDelay = 0.6,
				Falloff = { EndRange = 2.6, Reduction = 0.3, StartRange = 0 },
				FireRate = 5.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.6,
				ShotType = "AoE",
				StatusChance = 0.3
			}
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE", "ZHUGE", "CROSSBOW" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/LongGuns/PrimeZhuge/ZhugePrimeReloadFromEmptyMod" },
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Zhuge",
		GripType = "",
		Image = "ZhugePrime.png",
		InternalName = "/Lotus/Weapons/Tenno/LongGuns/PrimeZhuge/PrimeZhugeCrossbow",
		Introduced = "25.3",
		Link = "Zhuge Prime",
		Magazine = 30,
		Mastery = 14,
		MaxRank = 30,
		Name = "Zhuge Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 3,
		SellPrice = 7500,
		Slot = "Primary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1
	}
}
```

