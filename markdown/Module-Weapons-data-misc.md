---
title: "Module:Weapons/data/misc"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/misc"
wiki_timestamp: "2026-11-25T06:45:52Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s miscellaneous [weapons](/w/Weapons "Weapons"). These do not necessarily have to be accessible by players.

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/data/doc?action=edit).*

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Weapons/data/misc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

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

:   *Last updated: Wed, 25 Nov 2026 06:45:52 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/misc?diff=0))*

## Horizontal Partitions (and where to update data)

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-1 "Edit Section using Source Editor:
Horizontal Partitions (and where to update data)")]

* [Module:Weapons/data/primary](/w/Module:Weapons/data/primary "Module:Weapons/data/primary") - [Primary Weapons](/w/Primary_Weapon "Primary Weapon")
* [Module:Weapons/data/secondary](/w/Module:Weapons/data/secondary "Module:Weapons/data/secondary") - [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon")
* [Module:Weapons/data/melee](/w/Module:Weapons/data/melee "Module:Weapons/data/melee") - [Melee](/w/Melee "Melee") weapons
* [Module:Weapons/data/archwing](/w/Module:Weapons/data/archwing "Module:Weapons/data/archwing") - [Archguns](/w/Archgun "Archgun") and [Archmelees](/w/Archmelee "Archmelee")
* [Module:Weapons/data/companion](/w/Module:Weapons/data/companion "Module:Weapons/data/companion") - [Companion](/w/Companion "Companion") weapons
* [Module:Weapons/data/railjack](/w/Module:Weapons/data/railjack "Module:Weapons/data/railjack") - [Railjack](/w/Railjack "Railjack") turrets and ordnances
* [Module:Weapons/data/modular](/w/Module:Weapons/data/modular "Module:Weapons/data/modular") - [Amps](/w/Amp "Amp"), [Zaws](/w/Zaw "Zaw"), and [Kitguns](/w/Kitgun "Kitgun")
* Module:Weapons/data/misc - everything else

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

**p.checkForMissingData(frame): There are a total of 1 key-value errors**

1. "[Arcata](/w/Arcata "Arcata")" `Attacks[1].StatusChance` is nil

### Validate `Attack` tables

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-14 "Edit Section using Source Editor:
Validate Attack tables")]

**p.validateAttacks(frame): There are a total of 0 key-value errors**

### Validate required weapon table keys

[[edit](/w/Module:Weapons/data/doc?action=edit&section=T-15 "Edit Section using Source Editor:
Validate required weapon table keys")]

**p.validateRequiredKeys(frame): There are a total of 693 key-value errors**

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
18. "[Arcata](/w/Arcata "Arcata")" Block angle must be a value between 0 exclusive and 100 inclusive
19. "[Arcata](/w/Arcata "Arcata")" Disposition must be between 0.5-1.55; default should be 0.5
20. "[Arcata](/w/Arcata "Arcata")" Follow through must be a value between 0 exclusive and 1 exclusive
21. "[Arcata](/w/Arcata "Arcata")" Missing GripType
22. "[Arcata](/w/Arcata "Arcata")" Heavy attack must be greater than 0
23. "[Arcata](/w/Arcata "Arcata")" Missing InternalName
24. "[Arcata](/w/Arcata "Arcata")" Missing mastery rank unlock
25. "[Arcata](/w/Arcata "Arcata")" Melee range must be a value above 0
26. "[Arcata](/w/Arcata "Arcata")" Slide attack must be greater than 0
27. "[Arcata](/w/Arcata "Arcata")" Missing Stance Polarity
28. "[Arcata](/w/Arcata "Arcata")" Heavy wind-up time must be above 0
29. "[Artax](/w/Artax "Artax")" AmmoPickup must be a value greater than or equal to 0
30. "[Artax](/w/Artax "Artax")" Missing GripType
31. "[Burst Laser](/w/Burst_Laser "Burst Laser")" AmmoPickup must be a value greater than or equal to 0
32. "[Burst Laser](/w/Burst_Laser "Burst Laser")" Missing GripType
33. "[Burst Laser Prime](/w/Burst_Laser_Prime "Burst Laser Prime")" AmmoPickup must be a value greater than or equal to 0
34. "[Burst Laser Prime](/w/Burst_Laser_Prime "Burst Laser Prime")" Missing GripType
35. "[Cantic Prism](/w/Cantic_Prism "Cantic Prism")" AmmoPickup must be a value greater than or equal to 0
36. "[Cantic Prism](/w/Cantic_Prism "Cantic Prism")" Missing GripType
37. "[Carcinnox](/w/Carcinnox "Carcinnox")" Missing GripType
38. "[Carcinnox](/w/Carcinnox "Carcinnox")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
39. "[Carcinnox Mk I](/w/Carcinnox_Mk_I "Carcinnox Mk I")" Missing GripType
40. "[Carcinnox Mk I](/w/Carcinnox_Mk_I "Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
41. "[Carcinnox Mk II](/w/Carcinnox_Mk_II "Carcinnox Mk II")" Missing GripType
42. "[Carcinnox Mk II](/w/Carcinnox_Mk_II "Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
43. "[Carcinnox Mk III](/w/Carcinnox_Mk_III "Carcinnox Mk III")" Missing GripType
44. "[Carcinnox Mk III](/w/Carcinnox_Mk_III "Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
45. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Missing GripType
46. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
47. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Magazine must be a value above 0
48. "[Catchmoon (Primary)](/w/Catchmoon_(Primary) "Catchmoon (Primary)")" Missing reload time or reload time has to be above 0
49. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Missing GripType
50. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Catchmoon.png
51. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Magazine must be a value above 0
52. "[Catchmoon (Secondary)](/w/Catchmoon_(Secondary) "Catchmoon (Secondary)")" Missing reload time or reload time has to be above 0
53. "[Cerata](/w/Cerata "Cerata")" Heavy attack must be greater than 0
54. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
55. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
56. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing GripType
57. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
58. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Magazine must be a value above 0
59. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
60. "[Chesa Claws](/w/Chesa_Claws?action=edit&redlink=1 "Chesa Claws (page does not exist)")" Missing trigger type of weapon
61. "[Coda Pathocyst](/w/Coda_Pathocyst "Coda Pathocyst")" Heavy attack must be greater than 0
62. "[Cortege](/w/Cortege "Cortege")" AmmoPickup must be a value greater than or equal to 0
63. "[Cortege (Atmosphere)](/w/Cortege_(Atmosphere)?action=edit&redlink=1 "Cortege (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cortege.png
64. "[Corvas](/w/Corvas "Corvas")" AmmoPickup must be a value greater than or equal to 0
65. "[Corvas (Atmosphere)](/w/Corvas_(Atmosphere)?action=edit&redlink=1 "Corvas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Corvas.png
66. "[Corvas Prime](/w/Corvas_Prime "Corvas Prime")" AmmoPickup must be a value greater than or equal to 0
67. "[Corvas Prime (Atmosphere)](/w/Corvas_Prime_(Atmosphere)?action=edit&redlink=1 "Corvas Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: CorvasPrime.png
68. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
69. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
70. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing GripType
71. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
72. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Magazine must be a value above 0
73. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing reload time or reload time has to be above 0
74. "[Crescent Claws](/w/Crescent_Claws?action=edit&redlink=1 "Crescent Claws (page does not exist)")" Missing trigger type of weapon
75. "[Cryophon](/w/Cryophon "Cryophon")" Missing GripType
76. "[Cryophon](/w/Cryophon "Cryophon")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
77. "[Cryophon Mk I](/w/Cryophon_Mk_I "Cryophon Mk I")" Missing GripType
78. "[Cryophon Mk I](/w/Cryophon_Mk_I "Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
79. "[Cryophon Mk II](/w/Cryophon_Mk_II "Cryophon Mk II")" Missing GripType
80. "[Cryophon Mk II](/w/Cryophon_Mk_II "Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
81. "[Cryophon Mk III](/w/Cryophon_Mk_III "Cryophon Mk III")" Missing GripType
82. "[Cryophon Mk III](/w/Cryophon_Mk_III "Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
83. "[Cryotra](/w/Cryotra "Cryotra")" AmmoPickup must be a value greater than or equal to 0
84. "[Cryotra](/w/Cryotra "Cryotra")" Missing GripType
85. "[Cyngas](/w/Cyngas "Cyngas")" AmmoPickup must be a value greater than or equal to 0
86. "[Cyngas (Atmosphere)](/w/Cyngas_(Atmosphere)?action=edit&redlink=1 "Cyngas (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Cyngas.png
87. "[Dargyn](/w/Dargyn "Dargyn")" AmmoPickup must be a value greater than or equal to 0
88. "[Dargyn](/w/Dargyn "Dargyn")" Disposition must be between 0.5-1.55; default should be 0.5
89. "[Dargyn](/w/Dargyn "Dargyn")" Missing GripType
90. "[Dargyn](/w/Dargyn "Dargyn")" Image should be in the form of "WeaponName.png"; current value: GrnSkiffMissile.png
91. "[Dargyn](/w/Dargyn "Dargyn")" Missing InternalName
92. "[Dargyn](/w/Dargyn "Dargyn")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
93. "[Deconstructor](/w/Deconstructor "Deconstructor")" AmmoPickup must be a value greater than or equal to 0
94. "[Deconstructor](/w/Deconstructor "Deconstructor")" Missing GripType
95. "[Deconstructor Prime](/w/Deconstructor_Prime "Deconstructor Prime")" AmmoPickup must be a value greater than or equal to 0
96. "[Deconstructor Prime](/w/Deconstructor_Prime "Deconstructor Prime")" Missing GripType
97. "[Deth Machine Rifle](/w/Deth_Machine_Rifle "Deth Machine Rifle")" AmmoPickup must be a value greater than or equal to 0
98. "[Deth Machine Rifle](/w/Deth_Machine_Rifle "Deth Machine Rifle")" Missing GripType
99. "[Deth Machine Rifle Prime](/w/Deth_Machine_Rifle_Prime "Deth Machine Rifle Prime")" AmmoPickup must be a value greater than or equal to 0
100. "[Deth Machine Rifle Prime](/w/Deth_Machine_Rifle_Prime "Deth Machine Rifle Prime")" Missing GripType
101. "[Dissic Scaffold](/w/Dissic_Scaffold "Dissic Scaffold")" AmmoPickup must be a value greater than or equal to 0
102. "[Dissic Scaffold](/w/Dissic_Scaffold "Dissic Scaffold")" Missing GripType
103. "[Dual Decurion](/w/Dual_Decurion "Dual Decurion")" AmmoPickup must be a value greater than or equal to 0
104. "[Dual Decurion (Atmosphere)](/w/Dual_Decurion_(Atmosphere)?action=edit&redlink=1 "Dual Decurion (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: DualDecurion.png
105. "[Exard Scaffold](/w/Exard_Scaffold "Exard Scaffold")" AmmoPickup must be a value greater than or equal to 0
106. "[Exard Scaffold](/w/Exard_Scaffold "Exard Scaffold")" Missing GripType
107. "[Falcor](/w/Falcor "Falcor")" Heavy attack must be greater than 0
108. "[Fluctus](/w/Fluctus "Fluctus")" AmmoPickup must be a value greater than or equal to 0
109. "[Fluctus (Atmosphere)](/w/Fluctus_(Atmosphere)?action=edit&redlink=1 "Fluctus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Fluctus.png
110. "[Galvarc](/w/Galvarc "Galvarc")" Missing GripType
111. "[Galvarc](/w/Galvarc "Galvarc")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
112. "[Galvarc Mk I](/w/Galvarc_Mk_I "Galvarc Mk I")" Missing GripType
113. "[Galvarc Mk I](/w/Galvarc_Mk_I "Galvarc Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
114. "[Galvarc Mk II](/w/Galvarc_Mk_II "Galvarc Mk II")" Missing GripType
115. "[Galvarc Mk II](/w/Galvarc_Mk_II "Galvarc Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
116. "[Galvarc Mk III](/w/Galvarc_Mk_III "Galvarc Mk III")" Missing GripType
117. "[Galvarc Mk III](/w/Galvarc_Mk_III "Galvarc Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceGalvarc.png
118. "[Garuda Prime Talons](/w/Garuda_Prime_Talons "Garuda Prime Talons")" Missing GripType
119. "[Garuda Talons](/w/Garuda_Talons "Garuda Talons")" Missing GripType
120. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Missing GripType
121. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
122. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Magazine must be a value above 0
123. "[Gaze (Primary)](/w/Gaze_(Primary) "Gaze (Primary)")" Missing reload time or reload time has to be above 0
124. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Missing GripType
125. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Gaze.png
126. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Magazine must be a value above 0
127. "[Gaze (Secondary)](/w/Gaze_(Secondary) "Gaze (Secondary)")" Missing reload time or reload time has to be above 0
128. "[Glaive](/w/Glaive "Glaive")" Heavy attack must be greater than 0
129. "[Glaive Prime](/w/Glaive_Prime "Glaive Prime")" Heavy attack must be greater than 0
130. "[Glazio](/w/Glazio "Glazio")" Missing GripType
131. "[Glazio](/w/Glazio "Glazio")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
132. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Missing GripType
133. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
134. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Missing GripType
135. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
136. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Missing GripType
137. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
138. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" AmmoPickup must be a value greater than or equal to 0
139. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" Missing GripType
140. "[Grattler](/w/Grattler "Grattler")" AmmoPickup must be a value greater than or equal to 0
141. "[Grattler (Atmosphere)](/w/Grattler_(Atmosphere)?action=edit&redlink=1 "Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Grattler.png
142. "[Grimoire](/w/Grimoire "Grimoire")" Magazine must be a value above 0
143. "[Grimoire](/w/Grimoire "Grimoire")" Missing reload time or reload time has to be above 0
144. "[Halikar](/w/Halikar "Halikar")" Heavy attack must be greater than 0
145. "[Halikar Wraith](/w/Halikar_Wraith "Halikar Wraith")" Heavy attack must be greater than 0
146. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoMax must be a value greater than or equal to 0
147. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoPickup must be a value greater than or equal to 0
148. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing GripType
149. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Magazine must be a value above 0
150. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing reload time or reload time has to be above 0
151. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing trigger type of weapon
152. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoMax must be a value greater than or equal to 0
153. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoPickup must be a value greater than or equal to 0
154. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing GripType
155. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
156. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Magazine must be a value above 0
157. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing reload time or reload time has to be above 0
158. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing trigger type of weapon
159. "[Helstrum](/w/Helstrum "Helstrum")" AmmoPickup must be a value greater than or equal to 0
160. "[Helstrum](/w/Helstrum "Helstrum")" Missing GripType
161. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
162. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
163. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing GripType
164. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
165. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Magazine must be a value above 0
166. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing reload time or reload time has to be above 0
167. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing trigger type of weapon
168. "[Imperator](/w/Imperator "Imperator")" AmmoPickup must be a value greater than or equal to 0
169. "[Imperator (Atmosphere)](/w/Imperator_(Atmosphere)?action=edit&redlink=1 "Imperator (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Imperator.png
170. "[Imperator Vandal](/w/Imperator_Vandal "Imperator Vandal")" AmmoPickup must be a value greater than or equal to 0
171. "[Imperator Vandal (Atmosphere)](/w/Imperator_Vandal_(Atmosphere)?action=edit&redlink=1 "Imperator Vandal (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: ImperatorVandal.png
172. "[Kestrel](/w/Kestrel "Kestrel")" Heavy attack must be greater than 0
173. "[Kestrel Prime](/w/Kestrel_Prime "Kestrel Prime")" Heavy attack must be greater than 0
174. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" AmmoPickup must be a value greater than or equal to 0
175. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" Missing GripType
176. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" AmmoPickup must be a value greater than or equal to 0
177. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" Missing GripType
178. "[Kuva Ayanga](/w/Kuva_Ayanga "Kuva Ayanga")" AmmoPickup must be a value greater than or equal to 0
179. "[Kuva Ayanga (Atmosphere)](/w/Kuva_Ayanga_(Atmosphere)?action=edit&redlink=1 "Kuva Ayanga (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaAyanga.png
180. "[Kuva Grattler](/w/Kuva_Grattler "Kuva Grattler")" AmmoPickup must be a value greater than or equal to 0
181. "[Kuva Grattler (Atmosphere)](/w/Kuva_Grattler_(Atmosphere)?action=edit&redlink=1 "Kuva Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaGrattler.png
182. "[Laith](/w/Laith "Laith")" Missing GripType
183. "[Laith](/w/Laith "Laith")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
184. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Missing GripType
185. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
186. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Missing GripType
187. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
188. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Missing GripType
189. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
190. "[Larkspur](/w/Larkspur "Larkspur")" AmmoPickup must be a value greater than or equal to 0
191. "[Larkspur (Atmosphere)](/w/Larkspur_(Atmosphere)?action=edit&redlink=1 "Larkspur (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Larkspur.png
192. "[Larkspur Prime](/w/Larkspur_Prime "Larkspur Prime")" AmmoPickup must be a value greater than or equal to 0
193. "[Larkspur Prime (Atmosphere)](/w/Larkspur_Prime_(Atmosphere)?action=edit&redlink=1 "Larkspur Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: LarkspurPrime.png
194. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
195. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" Missing GripType
196. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Missing GripType
197. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
198. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Missing GripType
199. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
200. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Missing GripType
201. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
202. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Missing GripType
203. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
204. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Missing GripType
205. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
206. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Missing GripType
207. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
208. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Missing GripType
209. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
210. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Missing GripType
211. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
212. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Missing GripType
213. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
214. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Missing GripType
215. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
216. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Missing GripType
217. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
218. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Missing GripType
219. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
220. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Missing GripType
221. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
222. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Missing GripType
223. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
224. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Missing GripType
225. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
226. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Missing GripType
227. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
228. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Missing GripType
229. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
230. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Missing GripType
231. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
232. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Missing GripType
233. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
234. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Missing GripType
235. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
236. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Missing GripType
237. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
238. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Missing GripType
239. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
240. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Missing GripType
241. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
242. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Missing GripType
243. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
244. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Missing GripType
245. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
246. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Missing GripType
247. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
248. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Missing GripType
249. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
250. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Missing GripType
251. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
252. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Missing GripType
253. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
254. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Missing GripType
255. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
256. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Missing GripType
257. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
258. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Missing GripType
259. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
260. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Missing GripType
261. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
262. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Missing GripType
263. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
264. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Missing GripType
265. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
266. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Missing GripType
267. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
268. "[Lega Prism](/w/Lega_Prism "Lega Prism")" AmmoPickup must be a value greater than or equal to 0
269. "[Lega Prism](/w/Lega_Prism "Lega Prism")" Missing GripType
270. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" AmmoPickup must be a value greater than or equal to 0
271. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing GripType
272. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing InternalName
273. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing reload time or reload time has to be above 0
274. "[Mandonel](/w/Mandonel "Mandonel")" AmmoPickup must be a value greater than or equal to 0
275. "[Mandonel](/w/Mandonel "Mandonel")" Missing InternalName
276. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mandonel.png
277. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Missing InternalName
278. "[Mausolon](/w/Mausolon "Mausolon")" AmmoPickup must be a value greater than or equal to 0
279. "[Mausolon (Atmosphere)](/w/Mausolon_(Atmosphere)?action=edit&redlink=1 "Mausolon (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mausolon.png
280. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
281. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
282. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing GripType
283. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
284. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Magazine must be a value above 0
285. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing reload time or reload time has to be above 0
286. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing trigger type of weapon
287. "[Milati](/w/Milati "Milati")" Missing GripType
288. "[Milati](/w/Milati "Milati")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
289. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Missing GripType
290. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
291. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Missing GripType
292. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
293. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Missing GripType
294. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
295. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" Image should be in the form of "WeaponName.png"; current value: Braton.png
296. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" Image should be in the form of "WeaponName.png"; current value: Furis.png
297. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" Image should be in the form of "WeaponName.png"; current value: Kunai.png
298. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" Image should be in the form of "WeaponName.png"; current value: Paris.png
299. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" Image should be in the form of "WeaponName.png"; current value: Strun.png
300. "[Morgha](/w/Morgha "Morgha")" AmmoPickup must be a value greater than or equal to 0
301. "[Morgha (Atmosphere)](/w/Morgha_(Atmosphere)?action=edit&redlink=1 "Morgha (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Morgha.png
302. "[Mote Amp](/w/Mote_Amp "Mote Amp")" AmmoPickup must be a value greater than or equal to 0
303. "[Mote Amp](/w/Mote_Amp "Mote Amp")" Missing GripType
304. "[Multron](/w/Multron "Multron")" AmmoPickup must be a value greater than or equal to 0
305. "[Multron](/w/Multron "Multron")" Missing GripType
306. "[Noodletron](/w/Noodletron "Noodletron")" AmmoPickup must be a value greater than or equal to 0
307. "[Noodletron](/w/Noodletron "Noodletron")" Missing GripType
308. "[Noodletron](/w/Noodletron "Noodletron")" Missing InternalName
309. "[Noodletron](/w/Noodletron "Noodletron")" Magazine must be a value above 0
310. "[Noodletron](/w/Noodletron "Noodletron")" Missing reload time or reload time has to be above 0
311. "[Orvius](/w/Orvius "Orvius")" Heavy attack must be greater than 0
312. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
313. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
314. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing GripType
315. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
316. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Magazine must be a value above 0
317. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing reload time or reload time has to be above 0
318. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing trigger type of weapon
319. "[Parazon](/w/Parazon "Parazon")" AmmoMax must be a value greater than or equal to 0
320. "[Parazon](/w/Parazon "Parazon")" AmmoPickup must be a value greater than or equal to 0
321. "[Parazon](/w/Parazon "Parazon")" Missing GripType
322. "[Parazon](/w/Parazon "Parazon")" Magazine must be a value above 0
323. "[Parazon](/w/Parazon "Parazon")" Missing reload time or reload time has to be above 0
324. "[Parazon](/w/Parazon "Parazon")" Missing trigger type of weapon
325. "[Pathocyst](/w/Pathocyst "Pathocyst")" Heavy attack must be greater than 0
326. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" AmmoPickup must be a value greater than or equal to 0
327. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" Missing GripType
328. "[Phaedra](/w/Phaedra "Phaedra")" AmmoPickup must be a value greater than or equal to 0
329. "[Phaedra (Atmosphere)](/w/Phaedra_(Atmosphere)?action=edit&redlink=1 "Phaedra (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Phaedra.png
330. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" AmmoPickup must be a value greater than or equal to 0
331. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" Missing GripType
332. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
333. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
334. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing GripType
335. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
336. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Magazine must be a value above 0
337. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing reload time or reload time has to be above 0
338. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing trigger type of weapon
339. "[Photor](/w/Photor "Photor")" Missing GripType
340. "[Photor](/w/Photor "Photor")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
341. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Missing GripType
342. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
343. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Missing GripType
344. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
345. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Missing GripType
346. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
347. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
348. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" Missing GripType
349. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" AmmoPickup must be a value greater than or equal to 0
350. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" Missing GripType
351. "[Prisma Dual Decurions](/w/Prisma_Dual_Decurions "Prisma Dual Decurions")" AmmoPickup must be a value greater than or equal to 0
352. "[Prisma Dual Decurions (Atmosphere)](/w/Prisma_Dual_Decurions_(Atmosphere)?action=edit&redlink=1 "Prisma Dual Decurions (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: PrismaDualDecurions.png
353. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" AmmoPickup must be a value greater than or equal to 0
354. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" Missing GripType
355. "[Pugil](/w/Pugil "Pugil")" AmmoMax must be a value greater than or equal to 0
356. "[Pugil](/w/Pugil "Pugil")" AmmoPickup must be a value greater than or equal to 0
357. "[Pugil](/w/Pugil "Pugil")" Missing GripType
358. "[Pugil](/w/Pugil "Pugil")" Missing InternalName
359. "[Pugil](/w/Pugil "Pugil")" Magazine must be a value above 0
360. "[Pugil](/w/Pugil "Pugil")" Missing reload time or reload time has to be above 0
361. "[Pugil](/w/Pugil "Pugil")" Missing trigger type of weapon
362. "[Pulsar](/w/Pulsar "Pulsar")" Missing GripType
363. "[Pulsar](/w/Pulsar "Pulsar")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
364. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Missing GripType
365. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
366. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Missing GripType
367. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
368. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Missing GripType
369. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
370. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" AmmoPickup must be a value greater than or equal to 0
371. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" Missing GripType
372. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
373. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
374. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing GripType
375. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
376. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Magazine must be a value above 0
377. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
378. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing trigger type of weapon
379. "[Rampart](/w/Rampart "Rampart")" AmmoPickup must be a value greater than or equal to 0
380. "[Rampart](/w/Rampart "Rampart")" Disposition must be between 0.5-1.55; default should be 0.5
381. "[Rampart](/w/Rampart "Rampart")" Missing GripType
382. "[Rampart](/w/Rampart "Rampart")" Missing InternalName
383. "[Rampart](/w/Rampart "Rampart")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
384. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" AmmoPickup must be a value greater than or equal to 0
385. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" Missing GripType
386. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing GripType
387. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
388. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Magazine must be a value above 0
389. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing reload time or reload time has to be above 0
390. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing GripType
391. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
392. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Magazine must be a value above 0
393. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing reload time or reload time has to be above 0
394. "[Razorflies](/w/Razorflies "Razorflies")" AmmoMax must be a value greater than or equal to 0
395. "[Razorflies](/w/Razorflies "Razorflies")" AmmoPickup must be a value greater than or equal to 0
396. "[Razorflies](/w/Razorflies "Razorflies")" Missing GripType
397. "[Razorflies](/w/Razorflies "Razorflies")" Image should be in the form of "WeaponName.png"; current value: Razorfly.png
398. "[Razorflies](/w/Razorflies "Razorflies")" Magazine must be a value above 0
399. "[Razorflies](/w/Razorflies "Razorflies")" Missing reload time or reload time has to be above 0
400. "[Razorflies](/w/Razorflies "Razorflies")" Missing trigger type of weapon
401. "[Sagek Prime](/w/Sagek_Prime "Sagek Prime")" Missing GripType
402. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
403. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
404. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing GripType
405. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
406. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Magazine must be a value above 0
407. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
408. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing trigger type of weapon
409. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" AmmoPickup must be a value greater than or equal to 0
410. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" Missing GripType
411. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" AmmoPickup must be a value greater than or equal to 0
412. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" Missing GripType
413. "[Sirocco](/w/Sirocco "Sirocco")" AmmoPickup must be a value greater than or equal to 0
414. "[Sirocco](/w/Sirocco "Sirocco")" Missing GripType
415. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
416. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
417. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing GripType
418. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
419. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Magazine must be a value above 0
420. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing reload time or reload time has to be above 0
421. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing trigger type of weapon
422. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoMax must be a value greater than or equal to 0
423. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoPickup must be a value greater than or equal to 0
424. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing GripType
425. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
426. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Magazine must be a value above 0
427. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing reload time or reload time has to be above 0
428. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing trigger type of weapon
429. "[Soaktron](/w/Soaktron "Soaktron")" AmmoPickup must be a value greater than or equal to 0
430. "[Soaktron](/w/Soaktron "Soaktron")" Missing GripType
431. "[Soaktron](/w/Soaktron "Soaktron")" Missing InternalName
432. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing GripType
433. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
434. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Magazine must be a value above 0
435. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing reload time or reload time has to be above 0
436. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing GripType
437. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
438. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Magazine must be a value above 0
439. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing reload time or reload time has to be above 0
440. "[Stinger](/w/Stinger "Stinger")" AmmoPickup must be a value greater than or equal to 0
441. "[Stinger](/w/Stinger "Stinger")" Missing GripType
442. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
443. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
444. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing GripType
445. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
446. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Magazine must be a value above 0
447. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing reload time or reload time has to be above 0
448. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing trigger type of weapon
449. "[Sweeper](/w/Sweeper "Sweeper")" AmmoPickup must be a value greater than or equal to 0
450. "[Sweeper](/w/Sweeper "Sweeper")" Missing GripType
451. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" AmmoPickup must be a value greater than or equal to 0
452. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" Missing GripType
453. "[Talyn](/w/Talyn "Talyn")" Missing GripType
454. "[Talyn](/w/Talyn "Talyn")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
455. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Missing GripType
456. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
457. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Missing GripType
458. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
459. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Missing GripType
460. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
461. "[Tazicor](/w/Tazicor "Tazicor")" AmmoPickup must be a value greater than or equal to 0
462. "[Tazicor](/w/Tazicor "Tazicor")" Missing GripType
463. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Disposition must be between 0.5-1.55; default should be 0.5
464. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing GripType
465. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
466. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing GripType
467. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
468. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Magazine must be a value above 0
469. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing reload time or reload time has to be above 0
470. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing GripType
471. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
472. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Magazine must be a value above 0
473. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing reload time or reload time has to be above 0
474. "[Tunguska Cannon](/w/Tunguska_Cannon "Tunguska Cannon")" Missing GripType
475. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Missing GripType
476. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
477. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Missing GripType
478. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
479. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Missing GripType
480. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
481. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Missing GripType
482. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
483. "[Unarmed](/w/Unarmed "Unarmed")" AmmoMax must be a value greater than or equal to 0
484. "[Unarmed](/w/Unarmed "Unarmed")" AmmoPickup must be a value greater than or equal to 0
485. "[Unarmed](/w/Unarmed "Unarmed")" Missing GripType
486. "[Unarmed](/w/Unarmed "Unarmed")" Image should be in the form of "WeaponName.png"; current value: Blank.png
487. "[Unarmed](/w/Unarmed "Unarmed")" Missing InternalName
488. "[Unarmed](/w/Unarmed "Unarmed")" Magazine must be a value above 0
489. "[Unarmed](/w/Unarmed "Unarmed")" Missing reload time or reload time has to be above 0
490. "[Unarmed](/w/Unarmed "Unarmed")" Missing trigger type of weapon
491. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
492. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
493. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing GripType
494. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
495. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Magazine must be a value above 0
496. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing reload time or reload time has to be above 0
497. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing trigger type of weapon
498. "[Velocitus](/w/Velocitus "Velocitus")" AmmoPickup must be a value greater than or equal to 0
499. "[Velocitus (Atmosphere)](/w/Velocitus_(Atmosphere)?action=edit&redlink=1 "Velocitus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Velocitus.png
500. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
501. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
502. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing GripType
503. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
504. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Magazine must be a value above 0
505. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing reload time or reload time has to be above 0
506. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing trigger type of weapon
507. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
508. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
509. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing GripType
510. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
511. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Magazine must be a value above 0
512. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing reload time or reload time has to be above 0
513. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing trigger type of weapon
514. "[Verglas](/w/Verglas "Verglas")" AmmoPickup must be a value greater than or equal to 0
515. "[Verglas](/w/Verglas "Verglas")" Missing GripType
516. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" AmmoPickup must be a value greater than or equal to 0
517. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" Missing GripType
518. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing GripType
519. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
520. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Magazine must be a value above 0
521. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing reload time or reload time has to be above 0
522. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing GripType
523. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
524. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Magazine must be a value above 0
525. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing reload time or reload time has to be above 0
526. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Missing GripType
527. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
528. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Missing GripType
529. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
530. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Missing GripType
531. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
532. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Missing GripType
533. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
534. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Missing GripType
535. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
536. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Missing GripType
537. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
538. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Missing GripType
539. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
540. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Missing GripType
541. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
542. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Missing GripType
543. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
544. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Missing GripType
545. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
546. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Missing GripType
547. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
548. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Missing GripType
549. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
550. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Missing GripType
551. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
552. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Missing GripType
553. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
554. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Missing GripType
555. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
556. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Missing GripType
557. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
558. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Missing GripType
559. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
560. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Missing GripType
561. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
562. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Missing GripType
563. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
564. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Missing GripType
565. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
566. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Missing GripType
567. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
568. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Missing GripType
569. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
570. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Missing GripType
571. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
572. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Missing GripType
573. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
574. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Missing GripType
575. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
576. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Missing GripType
577. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
578. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Missing GripType
579. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
580. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Missing GripType
581. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
582. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Missing GripType
583. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
584. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Missing GripType
585. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
586. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Missing GripType
587. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
588. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Missing GripType
589. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
590. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Missing GripType
591. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
592. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Missing GripType
593. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
594. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Missing GripType
595. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
596. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Missing GripType
597. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
598. "[Vinquibus (Melee)](/w/Vinquibus_(Melee) "Vinquibus (Melee)")" Block angle must be a value between 0 exclusive and 100 inclusive
599. "[Vinquibus (Primary)](/w/Vinquibus_(Primary) "Vinquibus (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vinquibus.png
600. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
601. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
602. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing GripType
603. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
604. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Magazine must be a value above 0
605. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing reload time or reload time has to be above 0
606. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing trigger type of weapon
607. "[Vort](/w/Vort "Vort")" Missing GripType
608. "[Vort](/w/Vort "Vort")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
609. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Missing GripType
610. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
611. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Missing GripType
612. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
613. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Missing GripType
614. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
615. "[Vulcax](/w/Vulcax "Vulcax")" AmmoPickup must be a value greater than or equal to 0
616. "[Vulcax](/w/Vulcax "Vulcax")" Missing GripType
617. "[Vulklok](/w/Vulklok "Vulklok")" AmmoPickup must be a value greater than or equal to 0
618. "[Vulklok](/w/Vulklok "Vulklok")" Missing GripType
619. "[War](/w/War "War")" Slide attack must be greater than 0
620. "[War Prime](/w/War_Prime "War Prime")" Slide attack must be greater than 0
621. "[Xoris](/w/Xoris "Xoris")" Heavy attack must be greater than 0
622. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Missing GripType
623. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
624. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Missing GripType
625. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
626. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Missing GripType
627. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
628. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Missing GripType
629. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
630. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Missing GripType
631. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
632. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Missing GripType
633. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
634. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Missing GripType
635. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
636. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Missing GripType
637. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
638. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Missing GripType
639. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
640. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Missing GripType
641. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
642. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Missing GripType
643. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
644. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Missing GripType
645. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
646. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Missing GripType
647. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
648. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Missing GripType
649. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
650. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Missing GripType
651. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
652. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Missing GripType
653. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
654. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Missing GripType
655. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
656. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Missing GripType
657. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
658. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Missing GripType
659. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
660. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Missing GripType
661. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
662. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Missing GripType
663. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
664. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Missing GripType
665. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
666. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Missing GripType
667. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
668. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Missing GripType
669. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
670. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Missing GripType
671. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
672. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Missing GripType
673. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
674. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Missing GripType
675. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
676. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Missing GripType
677. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
678. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Missing GripType
679. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
680. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Missing GripType
681. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
682. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Missing GripType
683. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
684. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Missing GripType
685. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
686. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Missing GripType
687. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
688. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Missing GripType
689. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
690. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Missing GripType
691. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
692. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Missing GripType
693. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png

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
	Arcata = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = {
					Impact = 7.6,
					Puncture = 47.9,
					Slash = 7.6
				},
				FireRate = 1.1,
				CritChance = 0,
				CritMultiplier = 0,
			}
		},
		Class = "Unique",
		Conclave = true,
		Image = "Arcata.png",
		Introduced = "Update: Lunaro",
		Link = "Arcata",
		Name = "Arcata",
		Slot = "Melee",
		Traits = {
			"Tenno",
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	---------------------------------Emplacements-----------------------------------
	Rampart = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = {
					Impact = 66.7,
					Puncture = 66.7,
					Slash = 66.6,
				},
				FireRate = 13.3,
				CritChance = 0,
				StatusChance = 0,
				CritMultiplier = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "Rampart.png",
		Introduced = "17.0",
		Link = "Rampart",
		Magazine = 200,
		AmmoMax = math.huge,
		Name = "Rampart",
		Reload = 4,
		ReloadDelay = 0,
		ReloadRate = 50,
		ReloadStyle = "Regenerate",
		Slot = "Emplacement",
		Traits = {
			"Grineer",
		},
		Trigger = "Auto",
		Users = {
			"Lancer",
			"Elite Lancer",
			"Trooper",
			"Seeker",
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	-------------------------------------Gear---------------------------------------
	['Ebisu Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Impact = 10,
				},
				FireRate = 1,
				CritChance = 0,
				StatusChance = 0,
				CritMultiplier = 0,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "EbisuSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/InfestedFishingSpearB",
		Introduced = "29",
		Link = "Ebisu Spear",
		Name = "Ebisu Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Cambion Drift",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Lanzo Fishing Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Impact = 10,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "LanzoFishingSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/SpearFishingSpear",
		Introduced = "22.0",
		Link = "Lanzo",
		Name = "Lanzo Fishing Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Cetus",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Peram Fishing Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Slash = 10,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "PeramFishingSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/SpearFishingSpearC",
		Introduced = "22.0",
		Link = "Peram",
		Name = "Peram Fishing Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Cetus",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Shockprod Fishing Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Impact = 10,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "ShockprodFishingSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/RobofishSpearB",
		Introduced = "24.0",
		Link = "Shockprod",
		Name = "Shockprod Fishing Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Orb Vallis",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Spari Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Puncture = 10,
				},
				FireRate = 1,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "SpariSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/InfestedFishingSpearA",
		Introduced = "29",
		Link = "Spari Spear",
		Name = "Spari Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Cambion Drift",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Stunna Fishing Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Impact = 10,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Fishing Spear",
		Conclave = false,
		Image = "StunnaFishingSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/RobofishSpearC",
		Introduced = "24.0",
		Link = "Stunna",
		Name = "Stunna Fishing Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Orb Vallis",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	['Tulok Fishing Spear'] = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritMultiplier = 2,
				Damage = {
					Puncture = 10,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
				CritChance = 0,
				CritMultiplier = 0,
			},
		},
		Class = "Unique",
		Conclave = false,
		Family = "Fishing Spear",
		Image = "TulokFishingSpear.png",
		InternalName = "/Lotus/Types/Restoratives/Consumable/SpearFishingSpearB",
		Introduced = "22.0",
		Link = "Tulok",
		Name = "Tulok Fishing Spear",
		Range = 20,
		Slot = "Gear",
		Traits = {
			"Cetus",
		},
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
		["Thermian RPG"] = {
		AmmoMax = 2,
		AmmoPickup = 0,
		Attacks = {
			{
				AmmoCost = 1,
				AttackName = "Projectile Impact",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Impact = 3500000, Puncture = 1500000 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				MaxSpread = 0,
				MinSpread = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0,
				Trigger = "Semi-Auto" 
			},
			{
				AttackName = "Explosion",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Impact = 1000000, Puncture = 1000000, Blast = 1000000 },
				Falloff = { EndRange = 8, Reduction = 1, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Big Stagger" },
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0 
			}
		},
		CompatibilityTags = { "PROJECTILE", "SNIPER_AMMO", "AOE", "SINGLESHOT", "SEMI_AUTO" },
		Image = "ThermianRPG.png",
		InternalName = "/Lotus/Weapons/1999/RocketPropelledGrenadeLauncher/1999RPGLauncher",
		Introduced = "38.5",
		Link = "Thermian RPG",
		Magazine = 1,
		MaxRank = 40,
		Name = "Thermian RPG",
		Reload = 2.1,
		Slot = "Primary",
		Class = "Unique",
		Traits = { "Scaldra" },
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 2 
	},
	-----------------------------------Nech-Melee-----------------------------------
	Pugil = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.5,
				CritMultiplier = 2,
				Damage = {
					Impact = 83.3,
					Puncture = 83.3,
					Slash = 83.3,
				},
				FireRate = 1,
				ForcedProcs = {
					"Ragdoll",
				},
				IsSilent = true,
				StatusChance = 0,
			},
		},
		BlockAngle = 60,
		Class = "Unique",
		ComboDur = 5,
		Conclave = false,
		FollowThrough = 0.9,
		HeavyAttack = 250,
		HeavyRadialDmg = 1000,
		HeavySlamAttack = 1000,
		HeavySlamRadius = 9,
		Image = "Pugil.png",
		Introduced = "29.0",
		Link = "Necramech",
		Mastery = 0,
		MeleeRange = 1,
		Name = "Pugil",
		SlamAttack = 500,
		SlamElement = "Blast",
		SlamForcedProcs = {	"Blast" },
		SlamRadius = 8,
		SlideAttack = 500,
		Slot = "Nech-Melee",
		Traits = {
			"Tenno",
		},
		WindUp = 0,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	------------------------------------Unique--------------------------------------
	["Hand Grenade"] = {
		Attacks = {
			{
				AttackName = "Explosion",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = {
					Blast = 495,
				},
				Falloff = { StartRange = 0, EndRange = 10, Reduction = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 10,
				StatusChance = 0.1,
			},
		},
		Class = "Enemy",
		Conclave = false,
		Image = "HandGrenade.png",
		InternalName = "NpcThrowGrenadeWeapon",
		Introduced = "Vanilla",
		Link = "Hand Grenade",
		Name = "Hand Grenade",
		Slot = "Unique",
		Traits = {
			"Grineer", "Corpus", "Corrupted"
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	["Lob Blobs"] = {-- TODO: UpdateMe with tested values!
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = {
					Impact = 60,
				},
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "LobBlobs.png",
		Introduced = "36.0.7",
		Link = "Lob Blobs",
		Magazine = 3,
		AmmoMax = 3,
		Name = "Lob Blobs",
		Reload = 0,
		Slot = "Unique",
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	Noodletron = {-- TODO: UpdateMe with tested values!
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = {
					Impact = 60,
				},
				FireRate = 2,
				IsSilent = true,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "Noodletron.png",
		Introduced = "39.0.7",
		Link = "Noodletron",
		Magazine = 0,
		AmmoMax = 0,
		Name = "Noodletron",
		Reload = 0,
		Slot = "Unique",
		Trigger = "Semi-Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	Parazon = {
		Attacks = {
			{
				AttackName = "Mercy Finisher",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = {
					True = 1,
				},
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
			},
		},
		Class = "Parazon",
		Conclave = false,
		Image = "Parazon.png",
		InternalName = "/Lotus/Weapons/Tenno/HackingDevices/TnHackingDevice/TnHackingDeviceWeapon",
		Introduced = "26",
		Link = "Parazon",
		Name = "Parazon",
		Slot = "Unique",
		Traits = {
			"Tenno",
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	Razorflies = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = {
					Slash = 80,
				},
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0,
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "Razorfly.png",
		InternalName = "/Lotus/Powersuits/Fairy/FlightAgentGun",
		Introduced = "The Silver Grove",
		Link = "Razorwing",
		Name = "Razorflies",
		Slot = "Unique",
		Traits = {
			"Tenno",
		},
		Users = {
			"Titania",
			"Titania Prime",
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	Soaktron = {
		AmmoType = "Water",
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = {
					Impact = 60,
				},
				FireRate = 7,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.05,
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "Soaktron.png",
		Introduced = "25.5.1",
		Link = "Soaktron",
		Magazine = 20,
		AmmoMax = 200,
		Name = "Soaktron",
		Reload = 5,
		Slot = "Unique",
		Trigger = "Auto",
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	Unarmed = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 3.5, Puncture = 0.75, Slash = 0.75 },
				FireRate = 1,
				IsSlilent = true,
				StatusChance = 0.1,
			},
		},
		BlockAngle = 50,
		Class = "Unique",
		ComboDur = 5,
		Conclave = false,
		FollowThrough = 0.5,
		HeavyAttack = 60,
		HeavySlamAttack = 0,
		HeavySlamRadius = 0,
		Image = "Blank.png",
		Introduced = "11",
		Link = "Unarmed",
		MeleeRange = 0.5,
		Name = "Unarmed",
		SlamAttack = 10,
		SlamElement = "Electricity",
		SlamForcedProcs = { "Knockdown" },
		SlamRadius = 7,
		SlideAttack = 20,
		Slot = "Unique",
		WindUp = 0.5,
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
	---------------------------------Vehicles---------------------------------------
	Dargyn = {
		Attacks = {
			{
				AttackName = "Normal Attack",
				Damage = { Impact = 150, Puncture = 150, Slash = 150 },
				CritChance = 0,
				StatusChance = 0,
				CritMultiplier = 0,
				FireRate = 9.03,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 300,
				ShotType = "Projectile",
			},
		},
		Class = "Unique",
		Conclave = false,
		Image = "GrnSkiffMissile.png",
		Introduced = "22.12",
		Link = "Dargyn",
		Magazine = 75,
		AmmoMax = math.huge,
		Name = "Dargyn",
		Reload = 1.8,
		ReloadDelay = 0,
		ReloadRate = 41.7,
		ReloadStyle = "Regenerate",
		Slot = "Vehicle",
		Traits = {
			"Grineer",
		},
		Trigger = "Auto",
		Users = {
			"Dargyn Pilot",
		},
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1,
	},
}
```

