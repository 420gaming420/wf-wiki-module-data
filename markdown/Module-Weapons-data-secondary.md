---
title: "Module:Weapons/data/secondary"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/secondary"
wiki_timestamp: "2026-09-01T08:37:57Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon").

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Weapons/data/doc](/w/Module:Weapons/data/doc "Module:Weapons/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Weapons/data/doc?action=edit).*

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Weapons/data/secondary?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

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

:   *Last updated: Tue, 01 Sep 2026 08:37:57 +0000 (UTC) by [User:N90](/w/User:N90?action=edit&redlink=1 "User:N90 (page does not exist)") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/secondary?diff=0))*

## Horizontal Partitions (and where to update data)

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-1 "Edit section's source code: Horizontal Partitions (and where to update data)")]

* [Module:Weapons/data/primary](/w/Module:Weapons/data/primary "Module:Weapons/data/primary") - [Primary Weapons](/w/Primary_Weapon "Primary Weapon")
* Module:Weapons/data/secondary - [Secondary Weapons](/w/Secondary_Weapon "Secondary Weapon")
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

**p.validateRequiredKeys(frame): There are a total of 447 key-value errors**

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
84. "[Glazio](/w/Glazio "Glazio")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
85. "[Glazio Mk I](/w/Glazio_Mk_I "Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
86. "[Glazio Mk II](/w/Glazio_Mk_II "Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
87. "[Glazio Mk III](/w/Glazio_Mk_III "Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
88. "[Granmu Prism](/w/Granmu_Prism "Granmu Prism")" AmmoPickup must be a value greater than or equal to 0
89. "[Grattler](/w/Grattler "Grattler")" AmmoPickup must be a value greater than or equal to 0
90. "[Grattler (Atmosphere)](/w/Grattler_(Atmosphere)?action=edit&redlink=1 "Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Grattler.png
91. "[Grimoire](/w/Grimoire "Grimoire")" Magazine must be a value above 0
92. "[Grimoire](/w/Grimoire "Grimoire")" Missing reload time or reload time has to be above 0
93. "[Halikar](/w/Halikar "Halikar")" Heavy attack must be greater than 0
94. "[Halikar Wraith](/w/Halikar_Wraith "Halikar Wraith")" Heavy attack must be greater than 0
95. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoMax must be a value greater than or equal to 0
96. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" AmmoPickup must be a value greater than or equal to 0
97. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Magazine must be a value above 0
98. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing reload time or reload time has to be above 0
99. "[Hand Grenade](/w/Hand_Grenade "Hand Grenade")" Missing trigger type of weapon
100. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoMax must be a value greater than or equal to 0
101. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" AmmoPickup must be a value greater than or equal to 0
102. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
103. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Magazine must be a value above 0
104. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing reload time or reload time has to be above 0
105. "[Helminth Claws](/w/Helminth_Claws "Helminth Claws")" Missing trigger type of weapon
106. "[Helstrum](/w/Helstrum "Helstrum")" AmmoPickup must be a value greater than or equal to 0
107. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
108. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
109. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
110. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Magazine must be a value above 0
111. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing reload time or reload time has to be above 0
112. "[Huras Claws](/w/Huras_Claws?action=edit&redlink=1 "Huras Claws (page does not exist)")" Missing trigger type of weapon
113. "[Imperator](/w/Imperator "Imperator")" AmmoPickup must be a value greater than or equal to 0
114. "[Imperator (Atmosphere)](/w/Imperator_(Atmosphere)?action=edit&redlink=1 "Imperator (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Imperator.png
115. "[Imperator Vandal](/w/Imperator_Vandal "Imperator Vandal")" AmmoPickup must be a value greater than or equal to 0
116. "[Imperator Vandal (Atmosphere)](/w/Imperator_Vandal_(Atmosphere)?action=edit&redlink=1 "Imperator Vandal (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: ImperatorVandal.png
117. "[Kestrel](/w/Kestrel "Kestrel")" Heavy attack must be greater than 0
118. "[Kestrel Prime](/w/Kestrel_Prime "Kestrel Prime")" Heavy attack must be greater than 0
119. "[Klamora Prism](/w/Klamora_Prism "Klamora Prism")" AmmoPickup must be a value greater than or equal to 0
120. "[Klebrik Scaffold](/w/Klebrik_Scaffold "Klebrik Scaffold")" AmmoPickup must be a value greater than or equal to 0
121. "[Kuva Ayanga](/w/Kuva_Ayanga "Kuva Ayanga")" AmmoPickup must be a value greater than or equal to 0
122. "[Kuva Ayanga (Atmosphere)](/w/Kuva_Ayanga_(Atmosphere)?action=edit&redlink=1 "Kuva Ayanga (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaAyanga.png
123. "[Kuva Grattler](/w/Kuva_Grattler "Kuva Grattler")" AmmoPickup must be a value greater than or equal to 0
124. "[Kuva Grattler (Atmosphere)](/w/Kuva_Grattler_(Atmosphere)?action=edit&redlink=1 "Kuva Grattler (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: KuvaGrattler.png
125. "[Laith](/w/Laith "Laith")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
126. "[Laith Mk I](/w/Laith_Mk_I "Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
127. "[Laith Mk II](/w/Laith_Mk_II "Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
128. "[Laith Mk III](/w/Laith_Mk_III "Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
129. "[Larkspur](/w/Larkspur "Larkspur")" AmmoPickup must be a value greater than or equal to 0
130. "[Larkspur (Atmosphere)](/w/Larkspur_(Atmosphere)?action=edit&redlink=1 "Larkspur (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Larkspur.png
131. "[Larkspur Prime](/w/Larkspur_Prime "Larkspur Prime")" AmmoPickup must be a value greater than or equal to 0
132. "[Larkspur Prime (Atmosphere)](/w/Larkspur_Prime_(Atmosphere)?action=edit&redlink=1 "Larkspur Prime (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: LarkspurPrime.png
133. "[Laser Rifle](/w/Laser_Rifle "Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
134. "[Lavan Apoc Mk I](/w/Lavan_Apoc_Mk_I "Lavan Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
135. "[Lavan Apoc Mk II](/w/Lavan_Apoc_Mk_II "Lavan Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
136. "[Lavan Apoc Mk III](/w/Lavan_Apoc_Mk_III "Lavan Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
137. "[Lavan Apoc Mk IV](/w/Lavan_Apoc_Mk_IV?action=edit&redlink=1 "Lavan Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
138. "[Lavan Carcinnox Mk I](/w/Lavan_Carcinnox_Mk_I "Lavan Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
139. "[Lavan Carcinnox Mk II](/w/Lavan_Carcinnox_Mk_II "Lavan Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
140. "[Lavan Carcinnox Mk III](/w/Lavan_Carcinnox_Mk_III "Lavan Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
141. "[Lavan Carcinnox Mk IV](/w/Lavan_Carcinnox_Mk_IV?action=edit&redlink=1 "Lavan Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
142. "[Lavan Cryophon Mk I](/w/Lavan_Cryophon_Mk_I "Lavan Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
143. "[Lavan Cryophon Mk II](/w/Lavan_Cryophon_Mk_II "Lavan Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
144. "[Lavan Cryophon Mk III](/w/Lavan_Cryophon_Mk_III "Lavan Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
145. "[Lavan Cryophon Mk IV](/w/Lavan_Cryophon_Mk_IV?action=edit&redlink=1 "Lavan Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
146. "[Lavan Glazio Mk I](/w/Lavan_Glazio_Mk_I "Lavan Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
147. "[Lavan Glazio Mk II](/w/Lavan_Glazio_Mk_II "Lavan Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
148. "[Lavan Glazio Mk III](/w/Lavan_Glazio_Mk_III "Lavan Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
149. "[Lavan Glazio Mk IV](/w/Lavan_Glazio_Mk_IV?action=edit&redlink=1 "Lavan Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
150. "[Lavan Laith Mk I](/w/Lavan_Laith_Mk_I "Lavan Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
151. "[Lavan Laith Mk II](/w/Lavan_Laith_Mk_II "Lavan Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
152. "[Lavan Laith Mk III](/w/Lavan_Laith_Mk_III "Lavan Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
153. "[Lavan Laith Mk IV](/w/Lavan_Laith_Mk_IV?action=edit&redlink=1 "Lavan Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
154. "[Lavan Photor Mk I](/w/Lavan_Photor_Mk_I "Lavan Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
155. "[Lavan Photor Mk II](/w/Lavan_Photor_Mk_II "Lavan Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
156. "[Lavan Photor Mk III](/w/Lavan_Photor_Mk_III "Lavan Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
157. "[Lavan Photor Mk IV](/w/Lavan_Photor_Mk_IV?action=edit&redlink=1 "Lavan Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
158. "[Lavan Pulsar Mk I](/w/Lavan_Pulsar_Mk_I "Lavan Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
159. "[Lavan Pulsar Mk II](/w/Lavan_Pulsar_Mk_II "Lavan Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
160. "[Lavan Pulsar Mk III](/w/Lavan_Pulsar_Mk_III "Lavan Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
161. "[Lavan Pulsar Mk IV](/w/Lavan_Pulsar_Mk_IV?action=edit&redlink=1 "Lavan Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
162. "[Lavan Talyn Mk I](/w/Lavan_Talyn_Mk_I "Lavan Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
163. "[Lavan Talyn Mk II](/w/Lavan_Talyn_Mk_II "Lavan Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
164. "[Lavan Talyn Mk III](/w/Lavan_Talyn_Mk_III "Lavan Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
165. "[Lavan Talyn Mk IV](/w/Lavan_Talyn_Mk_IV?action=edit&redlink=1 "Lavan Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
166. "[Lavan Vort Mk I](/w/Lavan_Vort_Mk_I "Lavan Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
167. "[Lavan Vort Mk II](/w/Lavan_Vort_Mk_II "Lavan Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
168. "[Lavan Vort Mk III](/w/Lavan_Vort_Mk_III "Lavan Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
169. "[Lavan Vort Mk IV](/w/Lavan_Vort_Mk_IV?action=edit&redlink=1 "Lavan Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
170. "[Lega Prism](/w/Lega_Prism "Lega Prism")" AmmoPickup must be a value greater than or equal to 0
171. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" AmmoPickup must be a value greater than or equal to 0
172. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing InternalName
173. "[Lob Blobs](/w/Lob_Blobs "Lob Blobs")" Missing reload time or reload time has to be above 0
174. "[Mandonel](/w/Mandonel "Mandonel")" AmmoPickup must be a value greater than or equal to 0
175. "[Mandonel](/w/Mandonel "Mandonel")" Missing InternalName
176. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mandonel.png
177. "[Mandonel (Atmosphere)](/w/Mandonel_(Atmosphere)?action=edit&redlink=1 "Mandonel (Atmosphere) (page does not exist)")" Missing InternalName
178. "[Mausolon](/w/Mausolon "Mausolon")" AmmoPickup must be a value greater than or equal to 0
179. "[Mausolon (Atmosphere)](/w/Mausolon_(Atmosphere)?action=edit&redlink=1 "Mausolon (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Mausolon.png
180. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
181. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
182. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
183. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Magazine must be a value above 0
184. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing reload time or reload time has to be above 0
185. "[Medjay Claws](/w/Medjay_Claws?action=edit&redlink=1 "Medjay Claws (page does not exist)")" Missing trigger type of weapon
186. "[Milati](/w/Milati "Milati")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
187. "[Milati Mk I](/w/Milati_Mk_I "Milati Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
188. "[Milati Mk II](/w/Milati_Mk_II "Milati Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
189. "[Milati Mk III](/w/Milati_Mk_III "Milati Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceMilati.png
190. "[Mk1-Braton](/w/Mk1-Braton "Mk1-Braton")" Image should be in the form of "WeaponName.png"; current value: Braton.png
191. "[Mk1-Furis](/w/Mk1-Furis "Mk1-Furis")" Image should be in the form of "WeaponName.png"; current value: Furis.png
192. "[Mk1-Kunai](/w/Mk1-Kunai "Mk1-Kunai")" Image should be in the form of "WeaponName.png"; current value: Kunai.png
193. "[Mk1-Paris](/w/Mk1-Paris "Mk1-Paris")" Image should be in the form of "WeaponName.png"; current value: Paris.png
194. "[Mk1-Strun](/w/Mk1-Strun "Mk1-Strun")" Image should be in the form of "WeaponName.png"; current value: Strun.png
195. "[Morgha](/w/Morgha "Morgha")" AmmoPickup must be a value greater than or equal to 0
196. "[Morgha (Atmosphere)](/w/Morgha_(Atmosphere)?action=edit&redlink=1 "Morgha (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Morgha.png
197. "[Mote Amp](/w/Mote_Amp "Mote Amp")" AmmoPickup must be a value greater than or equal to 0
198. "[Multron](/w/Multron "Multron")" AmmoPickup must be a value greater than or equal to 0
199. "[Noodletron](/w/Noodletron "Noodletron")" AmmoPickup must be a value greater than or equal to 0
200. "[Noodletron](/w/Noodletron "Noodletron")" Missing InternalName
201. "[Noodletron](/w/Noodletron "Noodletron")" Magazine must be a value above 0
202. "[Noodletron](/w/Noodletron "Noodletron")" Missing reload time or reload time has to be above 0
203. "[Orvius](/w/Orvius "Orvius")" Heavy attack must be greater than 0
204. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
205. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
206. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
207. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Magazine must be a value above 0
208. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing reload time or reload time has to be above 0
209. "[Panzer Claws](/w/Panzer_Claws?action=edit&redlink=1 "Panzer Claws (page does not exist)")" Missing trigger type of weapon
210. "[Parazon](/w/Parazon "Parazon")" AmmoMax must be a value greater than or equal to 0
211. "[Parazon](/w/Parazon "Parazon")" AmmoPickup must be a value greater than or equal to 0
212. "[Parazon](/w/Parazon "Parazon")" Magazine must be a value above 0
213. "[Parazon](/w/Parazon "Parazon")" Missing reload time or reload time has to be above 0
214. "[Parazon](/w/Parazon "Parazon")" Missing trigger type of weapon
215. "[Pathocyst](/w/Pathocyst "Pathocyst")" Heavy attack must be greater than 0
216. "[Pencha Scaffold](/w/Pencha_Scaffold "Pencha Scaffold")" AmmoPickup must be a value greater than or equal to 0
217. "[Phaedra](/w/Phaedra "Phaedra")" AmmoPickup must be a value greater than or equal to 0
218. "[Phaedra (Atmosphere)](/w/Phaedra_(Atmosphere)?action=edit&redlink=1 "Phaedra (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Phaedra.png
219. "[Phahd Scaffold](/w/Phahd_Scaffold "Phahd Scaffold")" AmmoPickup must be a value greater than or equal to 0
220. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
221. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
222. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
223. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Magazine must be a value above 0
224. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing reload time or reload time has to be above 0
225. "[Pharaoh Claws](/w/Pharaoh_Claws?action=edit&redlink=1 "Pharaoh Claws (page does not exist)")" Missing trigger type of weapon
226. "[Photor](/w/Photor "Photor")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
227. "[Photor Mk I](/w/Photor_Mk_I "Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
228. "[Photor Mk II](/w/Photor_Mk_II "Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
229. "[Photor Mk III](/w/Photor_Mk_III "Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
230. "[Prime Laser Rifle](/w/Prime_Laser_Rifle "Prime Laser Rifle")" AmmoPickup must be a value greater than or equal to 0
231. "[Prisma Burst Laser](/w/Prisma_Burst_Laser "Prisma Burst Laser")" AmmoPickup must be a value greater than or equal to 0
232. "[Prisma Dual Decurions](/w/Prisma_Dual_Decurions "Prisma Dual Decurions")" AmmoPickup must be a value greater than or equal to 0
233. "[Prisma Dual Decurions (Atmosphere)](/w/Prisma_Dual_Decurions_(Atmosphere)?action=edit&redlink=1 "Prisma Dual Decurions (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: PrismaDualDecurions.png
234. "[Propa Scaffold](/w/Propa_Scaffold "Propa Scaffold")" AmmoPickup must be a value greater than or equal to 0
235. "[Pugil](/w/Pugil "Pugil")" AmmoMax must be a value greater than or equal to 0
236. "[Pugil](/w/Pugil "Pugil")" AmmoPickup must be a value greater than or equal to 0
237. "[Pugil](/w/Pugil "Pugil")" Missing InternalName
238. "[Pugil](/w/Pugil "Pugil")" Magazine must be a value above 0
239. "[Pugil](/w/Pugil "Pugil")" Missing reload time or reload time has to be above 0
240. "[Pugil](/w/Pugil "Pugil")" Missing trigger type of weapon
241. "[Pulsar](/w/Pulsar "Pulsar")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
242. "[Pulsar Mk I](/w/Pulsar_Mk_I "Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
243. "[Pulsar Mk II](/w/Pulsar_Mk_II "Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
244. "[Pulsar Mk III](/w/Pulsar_Mk_III "Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
245. "[Rahn Prism](/w/Rahn_Prism "Rahn Prism")" AmmoPickup must be a value greater than or equal to 0
246. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
247. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
248. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
249. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Magazine must be a value above 0
250. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
251. "[Raksa Claws](/w/Raksa_Claws?action=edit&redlink=1 "Raksa Claws (page does not exist)")" Missing trigger type of weapon
252. "[Rampart](/w/Rampart "Rampart")" AmmoPickup must be a value greater than or equal to 0
253. "[Rampart](/w/Rampart "Rampart")" Disposition must be between 0.5-1.55; default should be 0.5
254. "[Rampart](/w/Rampart "Rampart")" Missing InternalName
255. "[Rampart](/w/Rampart "Rampart")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
256. "[Raplak Prism](/w/Raplak_Prism "Raplak Prism")" AmmoPickup must be a value greater than or equal to 0
257. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
258. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Magazine must be a value above 0
259. "[Rattleguts (Primary)](/w/Rattleguts_(Primary) "Rattleguts (Primary)")" Missing reload time or reload time has to be above 0
260. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Rattleguts.png
261. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Magazine must be a value above 0
262. "[Rattleguts (Secondary)](/w/Rattleguts_(Secondary) "Rattleguts (Secondary)")" Missing reload time or reload time has to be above 0
263. "[Razorflies](/w/Razorflies "Razorflies")" AmmoMax must be a value greater than or equal to 0
264. "[Razorflies](/w/Razorflies "Razorflies")" AmmoPickup must be a value greater than or equal to 0
265. "[Razorflies](/w/Razorflies "Razorflies")" Image should be in the form of "WeaponName.png"; current value: Razorfly.png
266. "[Razorflies](/w/Razorflies "Razorflies")" Magazine must be a value above 0
267. "[Razorflies](/w/Razorflies "Razorflies")" Missing reload time or reload time has to be above 0
268. "[Razorflies](/w/Razorflies "Razorflies")" Missing trigger type of weapon
269. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
270. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
271. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
272. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Magazine must be a value above 0
273. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing reload time or reload time has to be above 0
274. "[Sahasa Claws](/w/Sahasa_Claws?action=edit&redlink=1 "Sahasa Claws (page does not exist)")" Missing trigger type of weapon
275. "[Shraksun Scaffold](/w/Shraksun_Scaffold "Shraksun Scaffold")" AmmoPickup must be a value greater than or equal to 0
276. "[Shwaak Prism](/w/Shwaak_Prism "Shwaak Prism")" AmmoPickup must be a value greater than or equal to 0
277. "[Sirocco](/w/Sirocco "Sirocco")" AmmoPickup must be a value greater than or equal to 0
278. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
279. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
280. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
281. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Magazine must be a value above 0
282. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing reload time or reload time has to be above 0
283. "[Sly Claws](/w/Sly_Claws?action=edit&redlink=1 "Sly Claws (page does not exist)")" Missing trigger type of weapon
284. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoMax must be a value greater than or equal to 0
285. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" AmmoPickup must be a value greater than or equal to 0
286. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
287. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Magazine must be a value above 0
288. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing reload time or reload time has to be above 0
289. "[Smeeta Claws](/w/Smeeta_Claws "Smeeta Claws")" Missing trigger type of weapon
290. "[Soaktron](/w/Soaktron "Soaktron")" AmmoPickup must be a value greater than or equal to 0
291. "[Soaktron](/w/Soaktron "Soaktron")" Missing InternalName
292. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
293. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Magazine must be a value above 0
294. "[Sporelacer (Primary)](/w/Sporelacer_(Primary) "Sporelacer (Primary)")" Missing reload time or reload time has to be above 0
295. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Sporelacer.png
296. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Magazine must be a value above 0
297. "[Sporelacer (Secondary)](/w/Sporelacer_(Secondary) "Sporelacer (Secondary)")" Missing reload time or reload time has to be above 0
298. "[Stinger](/w/Stinger "Stinger")" AmmoPickup must be a value greater than or equal to 0
299. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
300. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
301. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
302. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Magazine must be a value above 0
303. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing reload time or reload time has to be above 0
304. "[Sunika Claws](/w/Sunika_Claws?action=edit&redlink=1 "Sunika Claws (page does not exist)")" Missing trigger type of weapon
305. "[Sweeper](/w/Sweeper "Sweeper")" AmmoPickup must be a value greater than or equal to 0
306. "[Sweeper Prime](/w/Sweeper_Prime "Sweeper Prime")" AmmoPickup must be a value greater than or equal to 0
307. "[Talyn](/w/Talyn "Talyn")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
308. "[Talyn Mk I](/w/Talyn_Mk_I "Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
309. "[Talyn Mk II](/w/Talyn_Mk_II "Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
310. "[Talyn Mk III](/w/Talyn_Mk_III "Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
311. "[Tazicor](/w/Tazicor "Tazicor")" AmmoPickup must be a value greater than or equal to 0
312. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Disposition must be between 0.5-1.55; default should be 0.5
313. "[Thermian RPG](/w/Thermian_RPG "Thermian RPG")" Missing mastery rank unlock and mastery has to between 0 and 17 inclusive
314. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
315. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Magazine must be a value above 0
316. "[Tombfinger (Primary)](/w/Tombfinger_(Primary) "Tombfinger (Primary)")" Missing reload time or reload time has to be above 0
317. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Tombfinger.png
318. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Magazine must be a value above 0
319. "[Tombfinger (Secondary)](/w/Tombfinger_(Secondary) "Tombfinger (Secondary)")" Missing reload time or reload time has to be above 0
320. "[Tycho Seeker](/w/Tycho_Seeker "Tycho Seeker")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
321. "[Tycho Seeker Mk I](/w/Tycho_Seeker_Mk_I "Tycho Seeker Mk I")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
322. "[Tycho Seeker Mk II](/w/Tycho_Seeker_Mk_II "Tycho Seeker Mk II")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
323. "[Tycho Seeker Mk III](/w/Tycho_Seeker_Mk_III "Tycho Seeker Mk III")" Image should be in the form of "WeaponName.png"; current value: OrdnanceTychoSeeker.png
324. "[Unarmed](/w/Unarmed "Unarmed")" AmmoMax must be a value greater than or equal to 0
325. "[Unarmed](/w/Unarmed "Unarmed")" AmmoPickup must be a value greater than or equal to 0
326. "[Unarmed](/w/Unarmed "Unarmed")" Image should be in the form of "WeaponName.png"; current value: Blank.png
327. "[Unarmed](/w/Unarmed "Unarmed")" Missing InternalName
328. "[Unarmed](/w/Unarmed "Unarmed")" Magazine must be a value above 0
329. "[Unarmed](/w/Unarmed "Unarmed")" Missing reload time or reload time has to be above 0
330. "[Unarmed](/w/Unarmed "Unarmed")" Missing trigger type of weapon
331. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
332. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
333. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
334. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Magazine must be a value above 0
335. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing reload time or reload time has to be above 0
336. "[Vasca Claws](/w/Vasca_Claws?action=edit&redlink=1 "Vasca Claws (page does not exist)")" Missing trigger type of weapon
337. "[Velocitus](/w/Velocitus "Velocitus")" AmmoPickup must be a value greater than or equal to 0
338. "[Velocitus (Atmosphere)](/w/Velocitus_(Atmosphere)?action=edit&redlink=1 "Velocitus (Atmosphere) (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: Velocitus.png
339. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
340. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
341. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
342. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Magazine must be a value above 0
343. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing reload time or reload time has to be above 0
344. "[Venari Claws](/w/Venari_Claws?action=edit&redlink=1 "Venari Claws (page does not exist)")" Missing trigger type of weapon
345. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
346. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
347. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
348. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Magazine must be a value above 0
349. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing reload time or reload time has to be above 0
350. "[Venari Prime Claws](/w/Venari_Prime_Claws?action=edit&redlink=1 "Venari Prime Claws (page does not exist)")" Missing trigger type of weapon
351. "[Verglas](/w/Verglas "Verglas")" AmmoPickup must be a value greater than or equal to 0
352. "[Verglas Prime](/w/Verglas_Prime "Verglas Prime")" AmmoPickup must be a value greater than or equal to 0
353. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
354. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Magazine must be a value above 0
355. "[Vermisplicer (Primary)](/w/Vermisplicer_(Primary) "Vermisplicer (Primary)")" Missing reload time or reload time has to be above 0
356. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Image should be in the form of "WeaponName.png"; current value: Vermisplicer.png
357. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Magazine must be a value above 0
358. "[Vermisplicer (Secondary)](/w/Vermisplicer_(Secondary) "Vermisplicer (Secondary)")" Missing reload time or reload time has to be above 0
359. "[Vidar Apoc Mk I](/w/Vidar_Apoc_Mk_I "Vidar Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
360. "[Vidar Apoc Mk II](/w/Vidar_Apoc_Mk_II "Vidar Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
361. "[Vidar Apoc Mk III](/w/Vidar_Apoc_Mk_III "Vidar Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
362. "[Vidar Apoc Mk IV](/w/Vidar_Apoc_Mk_IV?action=edit&redlink=1 "Vidar Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
363. "[Vidar Carcinnox Mk I](/w/Vidar_Carcinnox_Mk_I "Vidar Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
364. "[Vidar Carcinnox Mk II](/w/Vidar_Carcinnox_Mk_II "Vidar Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
365. "[Vidar Carcinnox Mk III](/w/Vidar_Carcinnox_Mk_III "Vidar Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
366. "[Vidar Carcinnox Mk IV](/w/Vidar_Carcinnox_Mk_IV?action=edit&redlink=1 "Vidar Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
367. "[Vidar Cryophon Mk I](/w/Vidar_Cryophon_Mk_I "Vidar Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
368. "[Vidar Cryophon Mk II](/w/Vidar_Cryophon_Mk_II "Vidar Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
369. "[Vidar Cryophon Mk III](/w/Vidar_Cryophon_Mk_III "Vidar Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
370. "[Vidar Cryophon Mk IV](/w/Vidar_Cryophon_Mk_IV?action=edit&redlink=1 "Vidar Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
371. "[Vidar Glazio Mk I](/w/Vidar_Glazio_Mk_I "Vidar Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
372. "[Vidar Glazio Mk II](/w/Vidar_Glazio_Mk_II "Vidar Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
373. "[Vidar Glazio Mk III](/w/Vidar_Glazio_Mk_III "Vidar Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
374. "[Vidar Glazio Mk IV](/w/Vidar_Glazio_Mk_IV?action=edit&redlink=1 "Vidar Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
375. "[Vidar Laith Mk I](/w/Vidar_Laith_Mk_I "Vidar Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
376. "[Vidar Laith Mk II](/w/Vidar_Laith_Mk_II "Vidar Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
377. "[Vidar Laith Mk III](/w/Vidar_Laith_Mk_III "Vidar Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
378. "[Vidar Laith Mk IV](/w/Vidar_Laith_Mk_IV?action=edit&redlink=1 "Vidar Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
379. "[Vidar Photor Mk I](/w/Vidar_Photor_Mk_I "Vidar Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
380. "[Vidar Photor Mk II](/w/Vidar_Photor_Mk_II "Vidar Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
381. "[Vidar Photor Mk III](/w/Vidar_Photor_Mk_III "Vidar Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
382. "[Vidar Photor Mk IV](/w/Vidar_Photor_Mk_IV?action=edit&redlink=1 "Vidar Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
383. "[Vidar Pulsar Mk I](/w/Vidar_Pulsar_Mk_I "Vidar Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
384. "[Vidar Pulsar Mk II](/w/Vidar_Pulsar_Mk_II "Vidar Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
385. "[Vidar Pulsar Mk III](/w/Vidar_Pulsar_Mk_III "Vidar Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
386. "[Vidar Pulsar Mk IV](/w/Vidar_Pulsar_Mk_IV?action=edit&redlink=1 "Vidar Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
387. "[Vidar Talyn Mk I](/w/Vidar_Talyn_Mk_I "Vidar Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
388. "[Vidar Talyn Mk II](/w/Vidar_Talyn_Mk_II "Vidar Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
389. "[Vidar Talyn Mk III](/w/Vidar_Talyn_Mk_III "Vidar Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
390. "[Vidar Talyn Mk IV](/w/Vidar_Talyn_Mk_IV?action=edit&redlink=1 "Vidar Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
391. "[Vidar Vort Mk I](/w/Vidar_Vort_Mk_I "Vidar Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
392. "[Vidar Vort Mk II](/w/Vidar_Vort_Mk_II "Vidar Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
393. "[Vidar Vort Mk III](/w/Vidar_Vort_Mk_III "Vidar Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
394. "[Vidar Vort Mk IV](/w/Vidar_Vort_Mk_IV?action=edit&redlink=1 "Vidar Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
395. "[Vinquibus (Melee)](/w/Vinquibus_(Melee) "Vinquibus (Melee)")" Block angle must be a value between 0 exclusive and 100 inclusive
396. "[Vinquibus (Primary)](/w/Vinquibus_(Primary) "Vinquibus (Primary)")" Image should be in the form of "WeaponName.png"; current value: Vinquibus.png
397. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoMax must be a value greater than or equal to 0
398. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" AmmoPickup must be a value greater than or equal to 0
399. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: BeastClaws.png
400. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Magazine must be a value above 0
401. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing reload time or reload time has to be above 0
402. "[Vizier Claws](/w/Vizier_Claws?action=edit&redlink=1 "Vizier Claws (page does not exist)")" Missing trigger type of weapon
403. "[Vort](/w/Vort "Vort")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
404. "[Vort Mk I](/w/Vort_Mk_I "Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
405. "[Vort Mk II](/w/Vort_Mk_II "Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
406. "[Vort Mk III](/w/Vort_Mk_III "Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
407. "[Vulcax](/w/Vulcax "Vulcax")" AmmoPickup must be a value greater than or equal to 0
408. "[Vulklok](/w/Vulklok "Vulklok")" AmmoPickup must be a value greater than or equal to 0
409. "[War](/w/War "War")" Slide attack must be greater than 0
410. "[War Prime](/w/War_Prime "War Prime")" Slide attack must be greater than 0
411. "[Xoris](/w/Xoris "Xoris")" Heavy attack must be greater than 0
412. "[Zetki Apoc Mk I](/w/Zetki_Apoc_Mk_I "Zetki Apoc Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
413. "[Zetki Apoc Mk II](/w/Zetki_Apoc_Mk_II "Zetki Apoc Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
414. "[Zetki Apoc Mk III](/w/Zetki_Apoc_Mk_III "Zetki Apoc Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
415. "[Zetki Apoc Mk IV](/w/Zetki_Apoc_Mk_IV?action=edit&redlink=1 "Zetki Apoc Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretApoc.png
416. "[Zetki Carcinnox Mk I](/w/Zetki_Carcinnox_Mk_I "Zetki Carcinnox Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
417. "[Zetki Carcinnox Mk II](/w/Zetki_Carcinnox_Mk_II "Zetki Carcinnox Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
418. "[Zetki Carcinnox Mk III](/w/Zetki_Carcinnox_Mk_III "Zetki Carcinnox Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
419. "[Zetki Carcinnox Mk IV](/w/Zetki_Carcinnox_Mk_IV?action=edit&redlink=1 "Zetki Carcinnox Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCarcinnox.png
420. "[Zetki Cryophon Mk I](/w/Zetki_Cryophon_Mk_I "Zetki Cryophon Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
421. "[Zetki Cryophon Mk II](/w/Zetki_Cryophon_Mk_II "Zetki Cryophon Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
422. "[Zetki Cryophon Mk III](/w/Zetki_Cryophon_Mk_III "Zetki Cryophon Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
423. "[Zetki Cryophon Mk IV](/w/Zetki_Cryophon_Mk_IV?action=edit&redlink=1 "Zetki Cryophon Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretCryophon.png
424. "[Zetki Glazio Mk I](/w/Zetki_Glazio_Mk_I "Zetki Glazio Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
425. "[Zetki Glazio Mk II](/w/Zetki_Glazio_Mk_II "Zetki Glazio Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
426. "[Zetki Glazio Mk III](/w/Zetki_Glazio_Mk_III "Zetki Glazio Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
427. "[Zetki Glazio Mk IV](/w/Zetki_Glazio_Mk_IV?action=edit&redlink=1 "Zetki Glazio Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretGlazio.png
428. "[Zetki Laith Mk I](/w/Zetki_Laith_Mk_I "Zetki Laith Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
429. "[Zetki Laith Mk II](/w/Zetki_Laith_Mk_II "Zetki Laith Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
430. "[Zetki Laith Mk III](/w/Zetki_Laith_Mk_III "Zetki Laith Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
431. "[Zetki Laith Mk IV](/w/Zetki_Laith_Mk_IV?action=edit&redlink=1 "Zetki Laith Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretLaith.png
432. "[Zetki Photor Mk I](/w/Zetki_Photor_Mk_I "Zetki Photor Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
433. "[Zetki Photor Mk II](/w/Zetki_Photor_Mk_II "Zetki Photor Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
434. "[Zetki Photor Mk III](/w/Zetki_Photor_Mk_III "Zetki Photor Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
435. "[Zetki Photor Mk IV](/w/Zetki_Photor_Mk_IV?action=edit&redlink=1 "Zetki Photor Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPhotor.png
436. "[Zetki Pulsar Mk I](/w/Zetki_Pulsar_Mk_I "Zetki Pulsar Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
437. "[Zetki Pulsar Mk II](/w/Zetki_Pulsar_Mk_II "Zetki Pulsar Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
438. "[Zetki Pulsar Mk III](/w/Zetki_Pulsar_Mk_III "Zetki Pulsar Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
439. "[Zetki Pulsar Mk IV](/w/Zetki_Pulsar_Mk_IV?action=edit&redlink=1 "Zetki Pulsar Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretPulsar.png
440. "[Zetki Talyn Mk I](/w/Zetki_Talyn_Mk_I "Zetki Talyn Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
441. "[Zetki Talyn Mk II](/w/Zetki_Talyn_Mk_II "Zetki Talyn Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
442. "[Zetki Talyn Mk III](/w/Zetki_Talyn_Mk_III "Zetki Talyn Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
443. "[Zetki Talyn Mk IV](/w/Zetki_Talyn_Mk_IV?action=edit&redlink=1 "Zetki Talyn Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretTalyn.png
444. "[Zetki Vort Mk I](/w/Zetki_Vort_Mk_I "Zetki Vort Mk I")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
445. "[Zetki Vort Mk II](/w/Zetki_Vort_Mk_II "Zetki Vort Mk II")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
446. "[Zetki Vort Mk III](/w/Zetki_Vort_Mk_III "Zetki Vort Mk III")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png
447. "[Zetki Vort Mk IV](/w/Zetki_Vort_Mk_IV?action=edit&redlink=1 "Zetki Vort Mk IV (page does not exist)")" Image should be in the form of "WeaponName.png"; current value: TurretVort.png

## Weapon Data

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-16 "Edit section's source code: Weapon Data")]

## References

[[edit source](/w/Module:Weapons/data/doc?action=edit&section=T-17 "Edit section's source code: References")]

1. [↑](#cite_ref-1) As of [Hotfix 32.0.12](/w/Update_32#Hotfix_32.0.12 "Update 32") (2022-10-12), this may not be accurate (last checked 2022-11-01 and first noticed a weapon data schema change ~2 months ago). This key is absent on most weapons and if it is present, then equivalent data is under `UpgradeType` key like for [![](/images/thumb/TatsuPrime.png/32px-TatsuPrime.png?7a830)](/w/Tatsu_Prime "Tatsu Prime") [Tatsu Prime](/w/Tatsu_Prime "Tatsu Prime") (see script tag with id "\_\_NEXT\_DATA\_\_" under HTML source on <https://overframe.gg/build/new/5979/tatsu-prime/>). Treat this information as speculation however.

---

```lua
return {
	Acrid = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Toxin = 43 },
				FireRate = 5,
				ForcedProcs = { "Toxin" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 65,
				ShotType = "Projectile",
				StatusChance = 0.1 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.33,
		ExilusPolarity = "Madurai",
		Family = "Acrid",
		GripType = "GUN_ONE_HAND",
		Image = "Acrid.png",
		InternalName = "/Lotus/Weapons/ClanTech/Bio/AcidDartPistol",
		Introduced = "8.0",
		Link = "Acrid",
		Magazine = 15,
		Mastery = 7,
		MaxRank = 30,
		Name = "Acrid",
		Reload = 1.2,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Aegrit = {
		Accuracy = 100,
		AmmoMax = 4,
		AmmoPickup = 1,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Direct Hit",
				CritChance = 0.37,
				CritMultiplier = 1.9,
				Damage = { Impact = 4.5, Puncture = 1.8, Slash = 2.7 },
				FireRate = 2,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 30,
				ShotType = "Projectile",
				StatusChance = 0.19 
			},
			{
				AttackIndex = 2,
				AttackName = "Detonation",
				AttackParentIndex = 1,
				CritChance = 0.37,
				CritMultiplier = 2,
				Damage = { Blast = 797 },
				Falloff = { EndRange = 9, Reduction = 0.7, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9,
				ShotType = "AoE",
				StatusChance = 0.19 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN", "AOE" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Aegrit",
		GripType = "DUAL_GUN_GUN",
		Image = "Aegrit.png",
		InternalName = "/Lotus/Weapons/Grineer/ThrowingWeapons/GrnVorStickyBomb/GrnVorStickyBomb",
		Introduced = "32",
		Link = "Aegrit",
		Magazine = 2,
		Mastery = 11,
		MaxRank = 30,
		Name = "Aegrit",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 1.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Active",
		_TooltipAttackDisplay = 2 
	},
	Afuris = {
		Accuracy = 15.4,
		AmmoMax = 240,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 3, Puncture = 14, Slash = 3 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Afuris",
		GripType = "DUAL_GUN_GUN",
		Image = "Afuris.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkimboAutoPistols",
		Introduced = "5.3",
		Link = "Afuris",
		Magazine = 70,
		Mastery = 4,
		MaxRank = 30,
		Name = "Afuris",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Valkyr Specter" },
		_TooltipAttackDisplay = 1 
	},
	["Afuris Prime"] = {
		Accuracy = 28.6,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 3.9, Puncture = 18.2, Slash = 3.9 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Afuris",
		GripType = "DUAL_GUN_GUN",
		Image = "AfurisPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAfuris/PrimeAFurisWeapon",
		Introduced = "32.2.5",
		Link = "Afuris Prime",
		Magazine = 80,
		Mastery = 12,
		MaxRank = 30,
		Name = "Afuris Prime",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		Users = {  },
		_TooltipAttackDisplay = 1 
	},
	Akarius = {
		Accuracy = 26.7,
		AmmoMax = 20,
		AmmoPickup = 5,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				BurstCount = 2,
				BurstDelay = 0.12,
				CritChance = 0.06,
				CritMultiplier = 1.8,
				Damage = { Impact = 68 },
				FireRate = 4.33,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Detonation",
				AttackParentIndex = 1,
				BurstCount = 2,
				BurstDelay = 0.12,
				CritChance = 0.06,
				CritMultiplier = 1.8,
				Damage = { Blast = 419 },
				Falloff = { EndRange = 7.2, Reduction = 0.7, StartRange = 0 },
				FireRate = 4.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.2,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/SapientPistol/SapientPistolInnateUpgrade",
			"/Lotus/Weapons/Tenno/Pistols/SapientPistol/SapientPistoRunnerInnateUpgrade" 
		},
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Akarius",
		GripType = "DUAL_GUN_GUN",
		Image = "Akarius.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/SapientPistol/SapientPistol",
		Introduced = "25.7",
		Link = "Akarius",
		Magazine = 10,
		Mastery = 8,
		MaxRank = 30,
		Name = "Akarius",
		Polarities = { "Naramon", "Naramon" },
		Reload = 3.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		Users = {  },
		_TooltipAttackDisplay = 2 
	},
	["Akarius Prime"] = {
		Accuracy = 26.7,
		AmmoMax = 24,
		AmmoPickup = 6,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				BurstCount = 2,
				BurstDelay = 0.12,
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 68 },
				FireRate = 3.667,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Detonation",
				AttackParentIndex = 1,
				BurstCount = 2,
				BurstDelay = 0.12,
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Blast = 509 },
				Falloff = { EndRange = 7.8, Reduction = 0.7, StartRange = 0 },
				FireRate = 3.667,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7.8,
				ShotType = "AoE",
				StatusChance = 0.34 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/SapientPistol/SapientPistolInnateUpgrade",
			"/Lotus/Weapons/Tenno/Pistols/SapientPistol/SapientPistoRunnerInnateUpgrade" 
		},
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Akarius",
		GripType = "DUAL_GUN_GUN",
		Image = "AkariusPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAkarius/PrimeAkariusWeapon",
		Introduced = "35.0.9",
		Link = "Akarius Prime",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Akarius Prime",
		Polarities = { "Naramon", "Naramon", "Madurai" },
		Reload = 2.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Burst",
		Users = {  },
		_TooltipAttackDisplay = 2 
	},
	Akbolto = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Impact = 6.4, Puncture = 57.6 },
				FireRate = 4.5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.022 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Akbolto",
		GripType = "DUAL_GUN_GUN",
		Image = "Akbolto.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkimboBolto",
		Introduced = "6.0",
		Link = "Akbolto",
		Magazine = 30,
		Mastery = 8,
		MaxRank = 30,
		Name = "Akbolto",
		Polarities = { "Vazarin" },
		Reload = 2.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akbolto Prime"] = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.36,
				CritMultiplier = 2.8,
				Damage = { Impact = 4.4, Puncture = 37.84, Slash = 1.76 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.14 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Akbolto",
		GripType = "DUAL_GUN_GUN",
		Image = "AkboltoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAkbolto/PrimeAkBoltoWeapon",
		Introduced = "22.7",
		Link = "Akbolto Prime",
		Magazine = 40,
		Mastery = 13,
		MaxRank = 30,
		Name = "Akbolto Prime",
		Polarities = { "Naramon", "Madurai", "Madurai", "Madurai" },
		Reload = 1.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akbronco = {
		Accuracy = 3.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 4.2, Slash = 4.2 },
				Falloff = { EndRange = 14, Reduction = 0.75, StartRange = 7 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0314 
			} 
		},
		Class = "Dual Shotguns",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = false,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Akbronco",
		GripType = "GUN_ONE_HAND",
		Image = "Akbronco.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkimboShotGun",
		Introduced = "8.0",
		Link = "Akbronco",
		Magazine = 4,
		Mastery = 2,
		MaxRank = 30,
		Name = "Akbronco",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akbronco Prime"] = {
		Accuracy = 3.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 40, Puncture = 5, Slash = 5 },
				Falloff = { EndRange = 18, Reduction = 0.75, StartRange = 9 },
				FireRate = 4.33,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1286 
			} 
		},
		Class = "Dual Shotguns",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = false,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Akbronco",
		GripType = "GUN_ONE_HAND",
		Image = "AkbroncoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/PrimeAkimboShotGun",
		Introduced = "12.4",
		Link = "Akbronco Prime",
		Magazine = 8,
		Mastery = 10,
		MaxRank = 30,
		Name = "Akbronco Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.25,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akjagara = {
		Accuracy = 15.4,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0,
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 5.4, Puncture = 5.4, Slash = 25.2 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Akjagara",
		GripType = "DUAL_GUN_GUN",
		Image = "Akjagara.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TigrisRedeemerSetPistol/TnoBladedPistols",
		Introduced = "15.13",
		Link = "Akjagara",
		Magazine = 36,
		Mastery = 8,
		MaxRank = 30,
		Name = "Akjagara",
		Polarities = { "Naramon" },
		Reload = 2.25,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Akjagara Prime"] = {
		Accuracy = 33.33,
		AmmoMax = 320,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0,
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Impact = 3.8, Puncture = 3.8, Slash = 30.4 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 4,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0.2,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.32 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Akjagara",
		GripType = "DUAL_GUN_GUN",
		Image = "AkjagaraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAkjagara/AkJagaraPrime",
		Introduced = "24.2.2",
		Link = "Akjagara Prime",
		Magazine = 40,
		Mastery = 12,
		MaxRank = 30,
		Name = "Akjagara Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Aklato = {
		Accuracy = 11.1,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 6, Puncture = 10, Slash = 24 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 14,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.52,
		ExilusPolarity = "Madurai",
		Family = "Aklato",
		GripType = "DUAL_GUN_GUN",
		Image = "Aklato.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkimboPistol",
		Introduced = "Vanilla",
		Link = "Aklato",
		Magazine = 30,
		Mastery = 3,
		MaxRank = 30,
		Name = "Aklato",
		Reload = 2.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Aklex = {
		Accuracy = 9.8,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 13, Puncture = 104, Slash = 13 },
				FireRate = 1.58,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Aklex",
		GripType = "DUAL_GUN_GUN",
		Image = "Aklex.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkLexPistols",
		Introduced = "11.1",
		Link = "Aklex",
		Magazine = 12,
		Mastery = 4,
		MaxRank = 30,
		Name = "Aklex",
		Reload = 3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Maroo" },
		_TooltipAttackDisplay = 1 
	},
	["Aklex Prime"] = {
		Accuracy = 9.8,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 15, Puncture = 120, Slash = 15 },
				FireRate = 2.67,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Aklex",
		GripType = "DUAL_GUN_GUN",
		Image = "AklexPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkLexPrimePistols",
		Introduced = "19.8.1",
		Link = "Aklex Prime",
		Magazine = 16,
		Mastery = 15,
		MaxRank = 30,
		Name = "Aklex Prime",
		Reload = 3,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Baro" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akmagnus = {
		Accuracy = 11.1,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 44.1, Puncture = 26.95, Slash = 26.95 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Akmagnus",
		GripType = "DUAL_GUN_GUN",
		Image = "Akmagnus.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/DualMagnus",
		Introduced = "11.9",
		Link = "Akmagnus",
		Magazine = 16,
		Mastery = 12,
		MaxRank = 30,
		Name = "Akmagnus",
		Reload = 3.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akmagnus Prime"] = {
		Accuracy = 11.1,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.8,
				Damage = { Impact = 44.1, Puncture = 26.95, Slash = 26.95 },
				FireRate = 5.67,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Akmagnus",
		GripType = "DUAL_GUN_GUN",
		Image = "AkmagnusPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/DualMagnusPrime",
		Introduced = "36.0.7",
		Link = "Akmagnus Prime",
		Magazine = 16,
		Mastery = 15,
		MaxRank = 30,
		Name = "Akmagnus Prime",
		Polarities = { "Madurai", "Vazarin" },
		Reload = 2.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Baro" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Aksomati = {
		Accuracy = 15.4,
		AmmoMax = 420,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.24,
				CritMultiplier = 3,
				Damage = { Impact = 1.8, Puncture = 7.2, Slash = 9 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.08 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Aksomati",
		GripType = "DUAL_GUN_GUN",
		Image = "Aksomati.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/SomaSidearm/AkimboSomaPistols",
		Introduced = "16.3",
		Link = "Aksomati",
		Magazine = 70,
		Mastery = 9,
		MaxRank = 30,
		Name = "Aksomati",
		Polarities = { "Naramon" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Spool = 6,
		Traits = { "Tenno" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	["Aksomati Prime"] = {
		Accuracy = 12.5,
		AmmoMax = 880,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Fully Spooled",
				CritChance = 0.24,
				CritMultiplier = 3,
				Damage = { Impact = 2, Puncture = 8, Slash = 10 },
				FireRate = 13.33,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		Disposition = 1.05,
		ExilusPolarity = "Naramon",
		Family = "Aksomati",
		GripType = "DUAL_GUN_GUN",
		Image = "AksomatiPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAksomati/PrimeAksomati",
		Introduced = "27.0.4",
		Link = "Aksomati Prime",
		Magazine = 80,
		Mastery = 12,
		MaxRank = 30,
		Name = "Aksomati Prime",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Spool = 11,
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 1 
	},
	Akstiletto = {
		Accuracy = 23.5,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 1.8,
				Damage = { Impact = 16.8, Puncture = 2.8, Slash = 8.4 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.18 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Akstiletto",
		GripType = "DUAL_GUN_GUN",
		Image = "Akstiletto.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TennoUzi/TennoUzi",
		Introduced = "12.0",
		Link = "Akstiletto",
		Magazine = 28,
		Mastery = 8,
		MaxRank = 30,
		Name = "Akstiletto",
		Polarities = { "Naramon" },
		Reload = 1.1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Akstiletto Prime"] = {
		Accuracy = 23.5,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Impact = 21.6, Puncture = 3.6, Slash = 10.8 },
				FireRate = 7.08,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 0.85,
		ExilusPolarity = "Madurai",
		Family = "Akstiletto",
		GripType = "DUAL_GUN_GUN",
		Image = "AkstilettoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAkstiletto/PrimeAkstiletto",
		Introduced = "18.12",
		Link = "Akstiletto Prime",
		Magazine = 40,
		Mastery = 10,
		MaxRank = 30,
		Name = "Akstiletto Prime",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Akvasto = {
		Accuracy = 11.1,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Impact = 22.5, Puncture = 22.5, Slash = 45 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 14,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Akvasto",
		GripType = "DUAL_GUN_GUN",
		Image = "Akvasto.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/DualVastos",
		Introduced = "9.7",
		Link = "Akvasto",
		Magazine = 12,
		Mastery = 8,
		MaxRank = 30,
		Name = "Akvasto",
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Torment" },
		_TooltipAttackDisplay = 1 
	},
	["Akvasto Prime"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 16.5, Puncture = 16.5, Slash = 77 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Akvasto",
		GripType = "DUAL_GUN_GUN",
		Image = "AkvastoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeVasto/AkPrimeVasto/AkPrimeVastoPistol",
		Introduced = "24.0.6",
		Link = "Akvasto Prime",
		Magazine = 12,
		Mastery = 12,
		MaxRank = 30,
		Name = "Akvasto Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Baro" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Akzani = {
		Accuracy = 16.7,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 1.8, Puncture = 8.4, Slash = 1.8 },
				FireRate = 20,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.14 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.52,
		ExilusPolarity = "Madurai",
		Family = "Akzani",
		GripType = "DUAL_GUN_GUN",
		Image = "Akzani.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/HarlequinGun/HarlequinPistols",
		Introduced = "14.0",
		Link = "Akzani",
		Magazine = 100,
		Mastery = 4,
		MaxRank = 30,
		Name = "Akzani",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Angstrum = {
		Accuracy = 26.7,
		AmmoMax = 18,
		AmmoPickup = 3,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Rocket Impact",
				ChargeTime = 0.5,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 200 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Single Rocket Explosion",
				AttackParentIndex = 1,
				ChargeTime = 0.5,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 250 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.22 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				CritChance = 0.18,
				CritMultiplier = 1.8,
				Damage = { Heat = 30 },
				FireRate = 6,
				IncarnonCharges = 120,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "None",
		Family = "Angstrum",
		GripType = "GUN_ONE_HAND",
		Image = "Angstrum.png",
		IncarnonChargeGain = 40,
		IncarnonImage = "AngstrumIncarnon.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpHandRL/CorpusHandRocketLauncher",
		Introduced = "13.3",
		Link = "Angstrum",
		Magazine = 3,
		Mastery = 4,
		MaxRank = 30,
		Name = "Angstrum",
		Polarities = { "Vazarin" },
		Reload = 2.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Charge",
		Users = { "Comba", "Scrambus", "Pelna Cade", "Jad Teran" },
		_TooltipAttackDisplay = 2 
	},
	["Arca Scisco"] = {
		Accuracy = 32,
		AmmoMax = 288,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 1.6,
				Damage = { Puncture = 36, Slash = 24 },
				FireRate = 4.667,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.25,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Corpus/Pistols/SniperPistol/ScopeGunInnateMod" },
		Disposition = 1.1,
		ExilusPolarity = "Naramon",
		Family = "Arca Scisco",
		GripType = "GUN_ONE_HAND",
		Image = "ArcaScisco.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/SniperPistol/CrpScopeGun",
		Introduced = "21.7",
		Link = "Arca Scisco",
		Magazine = 36,
		Mastery = 10,
		MaxRank = 30,
		Name = "Arca Scisco",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.2,
		SellPrice = 5000,
		Slot = "Secondary",
		SniperComboReset = 2,
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		Zoom = { "2.0x", "4.0x" },
		_TooltipAttackDisplay = 1 
	},
	Athodai = {
		AmmoMax = 48,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 50,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 2,
				Damage = { Heat = 48, Puncture = 22 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.08,
				Trigger = "Auto" 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Heat = 88 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 2,
				Range = 13,
				ShotType = "Hit-Scan",
				StatusChance = 0.24,
				Trigger = "Burst" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "TNJETTURBINEPISTOL" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnJetTurbine/TnTurbineInnateMod" },
		Disposition = 1.05,
		ExilusPolarity = "Naramon",
		Family = "Athodai",
		GripType = "GUN_ONE_HAND",
		Image = "Athodai.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnJetTurbine/TnJetTurbinePistolWeapon",
		Introduced = "28.2.1",
		Link = "Athodai",
		Magazine = 24,
		Mastery = 10,
		MaxRank = 30,
		Name = "Athodai",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 2500,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	["Athodai Prime"] = {
		AmmoMax = 72,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 50,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 2,
				Damage = { Heat = 56, Puncture = 24 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
				Trigger = "Auto" 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.2,
				CritMultiplier = 2.5,
				Damage = { Heat = 100 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 2,
				Range = 16,
				ShotType = "Hit-Scan",
				StatusChance = 0.35,
				Trigger = "Burst" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "TNJETTURBINEPISTOL" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/PrimeAthodai/PrimeAthodaiInnateMod" },
		Disposition = 0.5,
		ExilusPolarity = "Naramon",
		Family = "Athodai",
		GripType = "GUN_ONE_HAND",
		Image = "AthodaiPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeAthodai/PrimeAthodaiPistolWeapon",
		Introduced = "43",
		Link = "Athodai Prime",
		Magazine = 24,
		Mastery = 14,
		MaxRank = 30,
		Name = "Athodai Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 2500,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Auto / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	Atomos = {
		Accuracy = 12.5,
		AmmoMax = 350,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.7,
				Damage = { Heat = 29 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 8,
				Multishot = 1,
				PunchThrough = 0,
				Range = 15,
				ShotType = "Hit-Scan",
				StatusChance = 0.21 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.18,
				CritMultiplier = 3,
				Damage = { Impact = 100 },
				FireRate = 1.5,
				IncarnonCharges = 21,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.41,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.18,
				CritMultiplier = 3,
				Damage = { Blast = 450 },
				Falloff = { EndRange = 7.9, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.5,
				IsSilent = false,
				Multishot = 1,
				Range = 7.9,
				ShotType = "AoE",
				StatusChance = 0.41,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Atomos",
		GripType = "GUN_ONE_HAND",
		Image = "Atomos.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "AtomosIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/HeatGun/GrnHeatGun",
		Introduced = "16.5",
		Link = "Atomos",
		Magazine = 70,
		Mastery = 5,
		MaxRank = 30,
		Name = "Atomos",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Azima = {
		Accuracy = 22.2,
		AmmoMax = 525,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 2, Puncture = 5, Slash = 13 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.16 
			},
			{
				AmmoCost = 75,
				AttackIndex = 2,
				AttackName = "Turret Expiry",
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Blast = 75 },
				FireRate = 10,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.16 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Azima",
		GripType = "GUN_ONE_HAND",
		Image = "Azima.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/SundialGun/SundialPistol",
		Introduced = "18.5",
		Link = "Azima",
		Magazine = 75,
		Mastery = 6,
		MaxRank = 30,
		Name = "Azima",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.4,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Balefire Charger"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Shields",
		Attacks = {
			{
				AmmoCost = 100,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 1500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 100,
				AttackIndex = 3,
				AttackName = "Alt Fire Shot",
				BurstCount = 4,
				BurstDelay = 0.4,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.75,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1,
				Trigger = "Burst" 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "AOE" },
		Conclave = false,
		Family = "Balefire Charger",
		GripType = "DUAL_GUN_GUN",
		Image = "BalefireCharger.png",
		InternalName = "/Lotus/Powersuits/IronFrame/BlastWeapon",
		Introduced = "24.4",
		Link = "Balefire Charger",
		Magazine = 0,
		MaxRank = 30,
		Name = "Balefire Charger",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		Users = { "Hildryn" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Balefire Charger Prime"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Shields",
		Attacks = {
			{
				AmmoCost = 100,
				AttackIndex = 1,
				AttackName = "Uncharged Shot",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1,
				Trigger = "Burst" 
			},
			{
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 2,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 1500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.833,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 100,
				AttackIndex = 3,
				AttackName = "Alt Fire Shot",
				BurstCount = 4,
				BurstDelay = 0.4,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Electricity = 500 },
				Falloff = { EndRange = 3, Reduction = 0, StartRange = 0 },
				FireRate = 0.75,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotSpeed = 80,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "AOE" },
		Conclave = false,
		Family = "Balefire Charger",
		GripType = "DUAL_GUN_GUN",
		Image = "BalefireChargerPrime.png",
		InternalName = "/Lotus/Powersuits/IronFrame/BlastWeaponPrime",
		Introduced = "32.3.6",
		Link = "Balefire Charger",
		Magazine = 0,
		MaxRank = 30,
		Name = "Balefire Charger Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Charge",
		Users = { "Hildryn Prime" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Ballistica = {
		Accuracy = 4,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 28.6,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst Shot",
				BurstCount = 4,
				BurstDelay = 0.05,
				CritChance = 0.025,
				CritMultiplier = 1.5,
				Damage = { Impact = 6.25, Puncture = 12.5, Slash = 6.25 },
				FireRate = 6.67,
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.025 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 10, Puncture = 80, Slash = 10 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 50,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				ChargeTime = 0.4,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Slash = 640 },
				FireRate = 3.33,
				IncarnonCharges = 18,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 80,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Charge" 
			} 
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Ballistica",
		GripType = "GUN_ONE_HAND",
		Image = "Ballistica.png",
		IncarnonChargeGain = 1.5,
		IncarnonImage = "BallisticaIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/AutomaticHandCrossbow/AutoCrossBow",
		Introduced = "10.4",
		Link = "Ballistica",
		Magazine = 16,
		Mastery = 2,
		MaxRank = 30,
		Name = "Ballistica",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Burst / Charge",
		_TooltipAttackDisplay = 2 
	},
	["Ballistica Prime"] = {
		Accuracy = 4,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 4,
				AttackIndex = 1,
				AttackName = "Normal Shot",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 2, Puncture = 22, Slash = 16 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 50,
				MinSpread = 0,
				Multishot = 4,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.15 
			},
			{
				AmmoCost = 4,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 0.8,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 3.8, Puncture = 41.8, Slash = 30.4 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 50,
				MinSpread = 0,
				Multishot = 4,
				PunchThrough = 1,
				ShotSpeed = 140,
				ShotType = "Projectile",
				StatusChance = 0.15 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				ChargeTime = 0.4,
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Slash = 830 },
				FireRate = 3.33,
				IncarnonCharges = 18,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 80,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Charge" 
			} 
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Ballistica",
		GripType = "GUN_ONE_HAND",
		Image = "BallisticaPrime.png",
		IncarnonChargeGain = 1.5,
		IncarnonImage = "BallisticaPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeBallistica/PrimeBallistica",
		Introduced = "21.6",
		Link = "Ballistica Prime",
		Magazine = 32,
		Mastery = 14,
		MaxRank = 30,
		Name = "Ballistica Prime",
		Polarities = { "Naramon", "Madurai", "Madurai" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	Bolto = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 2.4,
				Damage = { Impact = 6.4, Puncture = 57.6 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.022 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.51,
		ExilusPolarity = "Naramon",
		Family = "Bolto",
		GripType = "GUN_ONE_HAND",
		Image = "Bolto.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/CrossBow",
		Introduced = "Vanilla",
		Link = "Bolto",
		Magazine = 15,
		Mastery = 7,
		MaxRank = 30,
		Name = "Bolto",
		Polarities = { "Vazarin" },
		Reload = 1.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Brakk = {
		Accuracy = 7.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.17,
				CritMultiplier = 2,
				Damage = { Impact = 9, Puncture = 5, Slash = 6 },
				Falloff = { EndRange = 22, Reduction = 0.6, StartRange = 11 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 17,
				MinSpread = 9,
				Multishot = 10,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.051 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SECONDARYSHOTGUN", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Brakk",
		GripType = "GUN_ONE_HAND",
		Image = "Brakk.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrineerHandShotgun/GrineerHandCannon",
		Introduced = "10.6",
		Link = "Brakk",
		Magazine = 5,
		Mastery = 6,
		MaxRank = 30,
		Name = "Brakk",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.05,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Bronco = {
		Accuracy = 3.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 33.6, Puncture = 4.2, Slash = 4.2 },
				Falloff = { EndRange = 14, Reduction = 0.75, StartRange = 7 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0943 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 3,
				Damage = { Impact = 13.2, Puncture = 2.2, Slash = 6.6 },
				Falloff = { EndRange = 28, Reduction = 0.5455, StartRange = 14 },
				FireRate = 2.5,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1886 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SINGLESHOT", "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Bronco",
		GripType = "GUN_ONE_HAND",
		Image = "Bronco.png",
		IncarnonChargeGain = 0.5,
		IncarnonImage = "BroncoIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/HandShotGun",
		Introduced = "Vanilla",
		Link = "Bronco",
		Magazine = 2,
		Mastery = 0,
		MaxRank = 30,
		Name = "Bronco",
		Reload = 1.05,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Bronco Prime"] = {
		Accuracy = 3.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 2,
				Damage = { Impact = 40, Puncture = 5, Slash = 5 },
				Falloff = { EndRange = 18, Reduction = 0.74, StartRange = 9 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1286 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.24,
				CritMultiplier = 3.2,
				Damage = { Impact = 27.2, Puncture = 3.4, Slash = 3.4 },
				Falloff = { EndRange = 36, Reduction = 0.5588, StartRange = 18 },
				FireRate = 3,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 36,
				MinSpread = 18,
				Multishot = 7,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2571 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SINGLESHOT", "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Bronco",
		GripType = "GUN_ONE_HAND",
		Image = "BroncoPrime.png",
		IncarnonChargeGain = 0.5,
		IncarnonImage = "BroncoPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/BroncoPrime",
		Introduced = "9.0",
		Link = "Bronco Prime",
		Magazine = 4,
		Mastery = 4,
		MaxRank = 30,
		Name = "Bronco Prime",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Cantare = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Puncture = 27, Slash = 63 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.22 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = false,
		Disposition = 1.05,
		ExilusPolarity = "Madurai",
		Family = "Cantare",
		GripType = "DUAL_GUN_GUN",
		Image = "Cantare.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/TnChoirframeKunai/TnChoirframeKunai",
		Introduced = "36",
		Link = "Cantare",
		Magazine = 6,
		Mastery = 10,
		MaxRank = 30,
		Name = "Cantare",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Castanas = {
		Accuracy = 100,
		AmmoMax = 18,
		AmmoPickup = 4,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Mid-Flight Detonation",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Electricity = 160 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.22 
			},
			{
				AttackIndex = 2,
				AttackName = "Embedded Detonation",
				AttackParentIndex = 1,
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Electricity = 160 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 3.33,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.22 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "DEPLOYABLE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Castanas",
		GripType = "DUAL_GUN_GUN",
		Image = "Castanas.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/StickyBomb/StickyBombs",
		Introduced = "12.2",
		Link = "Castanas",
		Magazine = 2,
		Mastery = 3,
		MaxRank = 30,
		Name = "Castanas",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Active",
		_TooltipAttackDisplay = 1 
	},
	Catabolyst = {
		Accuracy = 6.3,
		AmmoMax = 155,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Primary",
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 53 },
				Falloff = { EndRange = 19, Reduction = 0.9811, StartRange = 9 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 1,
				PunchThrough = 0.9,
				Range = 19,
				ShotType = "Hit-Scan",
				StatusChance = 0.43,
				Trigger = "Held" 
			},
			{
				AttackIndex = 2,
				AttackName = "Partial Reload Impact",
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Impact = 11 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.43 
			},
			{
				AttackIndex = 3,
				AttackName = "Partial Reload Explosion",
				AttackParentIndex = 2,
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 203 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.43 
			},
			{
				AttackIndex = 4,
				AttackName = "Reload From Empty Impact",
				CritChance = 0.31,
				CritMultiplier = 2.9,
				Damage = { Impact = 11 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2.1,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.59 
			},
			{
				AttackIndex = 5,
				AttackName = "Reload From Empty Explosion",
				AttackParentIndex = 4,
				CritChance = 0.31,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 1997 },
				Falloff = { EndRange = 7, Reduction = 0.5, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 7,
				ShotType = "AoE",
				StatusChance = 0.59 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "BEAM" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Infested/Pistols/InfBeamPistol/InfBeamPistolReloadFromEmptyMod" 
		},
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Catabolyst",
		GripType = "GUN_ONE_HAND",
		Image = "Catabolyst.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfBeamPistol/InfBeamPistol",
		Introduced = "29.5",
		Link = "Catabolyst",
		Magazine = 31,
		Mastery = 11,
		MaxRank = 30,
		Name = "Catabolyst",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Cestra = {
		Accuracy = 33.33,
		AmmoMax = 420,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.6,
				Damage = { Impact = 5.2, Puncture = 20.8 },
				FireRate = 8.33,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.5,
				CritMultiplier = 3,
				Damage = { Impact = 10, Puncture = 40 },
				FireRate = 6.67,
				IncarnonCharges = 150,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 1,
				Multishot = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.52,
		ExilusPolarity = "Madurai",
		Family = "Cestra",
		GripType = "GUN_ONE_HAND",
		Image = "Cestra.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "CestraIncarnon.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CorpusMinigun/CorpusMinigun",
		Introduced = "11.0",
		Link = "Cestra",
		Magazine = 60,
		Mastery = 4,
		MaxRank = 30,
		Name = "Cestra",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Coda Catabolyst"] = {
		Accuracy = 6.3,
		AmmoMax = 155,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Primary",
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 56 },
				Falloff = { EndRange = 19, Reduction = 0.9811, StartRange = 9 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 1,
				PunchThrough = 0.9,
				Range = 19,
				ShotType = "Hit-Scan",
				StatusChance = 0.5,
				Trigger = "Held" 
			},
			{
				AttackIndex = 2,
				AttackName = "Partial Reload Impact",
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Impact = 11 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.43 
			},
			{
				AttackIndex = 3,
				AttackName = "Partial Reload Explosion",
				AttackParentIndex = 2,
				CritChance = 0.11,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 74 },
				Falloff = { EndRange = 3, Reduction = 0.5, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.43 
			},
			{
				AttackIndex = 4,
				AttackName = "Reload From Empty Impact",
				CritChance = 0.31,
				CritMultiplier = 2.9,
				Damage = { Impact = 11 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 23,
				MinSpread = 9,
				Multishot = 3,
				PunchThrough = 0,
				Reload = 2.1,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.59 
			},
			{
				AttackIndex = 5,
				AttackName = "Reload From Empty Explosion",
				AttackParentIndex = 4,
				CritChance = 0.31,
				CritMultiplier = 2.9,
				Damage = { Corrosive = 658 },
				Falloff = { EndRange = 5, Reduction = 0.5, StartRange = 0 },
				FireRate = 12,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.59 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "BEAM" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Infested/Pistols/InfBeamPistol/InfBeamPistolReloadFromEmptyMod" 
		},
		Disposition = 0.65,
		ExilusPolarity = "Madurai",
		Family = "Catabolyst",
		GripType = "GUN_ONE_HAND",
		Image = "CodaCatabolyst.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Pistols/CodaCatabolyst",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Catabolyst",
		Magazine = 37,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Catabolyst",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Coda Pox"] = {
		Accuracy = 100,
		AmmoMax = 40,
		AmmoPickup = 4,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Spore Impact",
				CritChance = 0.1,
				CritMultiplier = 2.2,
				Damage = { Toxin = 55 },
				FireRate = 2.08,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 30,
				ShotType = "Projectile",
				StatusChance = 0.45 
			},
			{
				AttackIndex = 2,
				AttackName = "Poison Cloud",
				AttackParentIndex = 1,
				CritChance = 0.1,
				CritMultiplier = 2.2,
				Damage = { Toxin = 35 },
				EffectDuration = 5,
				Falloff = { EndRange = 2.8, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.8,
				ShotType = "AoE",
				StatusChance = 0.45 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Pox",
		GripType = "DUAL_GUN_GUN",
		Image = "CodaPox.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Pistols/CodaPox",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Pox",
		Magazine = 8,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Pox",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Coda Tysis"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Impact = 18, Puncture = 32, Slash = 26 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 2,
				AttackName = "Corrosive DoT",
				AttackParentIndex = 1,
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Corrosive = 59 },
				EffectDuration = 2,
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "DoT",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Tysis",
		GripType = "GUN_ONE_HAND",
		Image = "CodaTysis.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Pistols/CodaTysis",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Coda Tysis",
		Magazine = 18,
		Mastery = 17,
		MaxRank = 40,
		Name = "Coda Tysis",
		Polarities = { "Vazarin" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Cyanex = {
		Accuracy = 1.8,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				CritChance = 0.08,
				CritMultiplier = 1.4,
				Damage = { Impact = 50 },
				FireRate = 4.67,
				IsSilent = false,
				MaxSpread = 60,
				MinSpread = 50,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 24,
				ShotType = "Projectile",
				StatusChance = 0.32 
			},
			{
				AttackIndex = 2,
				AttackName = "Projectile Explosion",
				AttackParentIndex = 1,
				CritChance = 0.08,
				CritMultiplier = 1.4,
				Damage = { Gas = 41 },
				Falloff = { EndRange = 0.7, Reduction = 0.2, StartRange = 0 },
				FireRate = 4.67,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.7,
				ShotType = "AoE",
				StatusChance = 0.32 
			},
			{
				Accuracy = 80,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Burst Mode",
				BurstDelay = 0.08,
				BurstReloadDelay = 0.21,
				CritChance = 0.08,
				CritMultiplier = 1.4,
				Damage = { Impact = 2.88, Puncture = 30.24, Slash = 38.88 },
				FireRate = 4.67,
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0.5,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.32,
				Trigger = "Mag Burst" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Cyanex",
		GripType = "GUN_ONE_HAND",
		Image = "Cyanex.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpSentAmalgPistol/CrpSentAmalgPistol",
		Introduced = "25.0",
		Link = "Cyanex",
		Magazine = 11,
		Mastery = 8,
		MaxRank = 30,
		Name = "Cyanex",
		Polarities = {  },
		Reload = 2.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus", "Sentient" },
		Trigger = "Auto / Mag Burst",
		Users = { "Amalgam Machinist" },
		_TooltipAttackDisplay = 1 
	},
	Cycron = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 1.8,
				Damage = { Puncture = 8, Radiation = 10, Slash = 5 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 24,
				ShotType = "Hit-Scan",
				StatusChance = 0.3 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM", "BATTERY" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Cycron",
		GripType = "GUN_ONE_HAND",
		Image = "Cycron.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpChargeGun/CrpChargeGun",
		Introduced = "20.3",
		Link = "Cycron",
		Magazine = 40,
		Mastery = 8,
		MaxRank = 30,
		Name = "Cycron",
		Polarities = { "Naramon", "Naramon" },
		Reload = 2,
		ReloadDelay = 1,
		ReloadRate = 40,
		ReloadStyle = "Regenerate",
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Despair = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.6,
				Damage = { Impact = 2.9, Puncture = 46.4, Slash = 8.7 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.16 
			},
			{
				Accuracy = 10,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 3, Puncture = 48, Slash = 9 },
				FireRate = 3,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Heat = 160 },
				Falloff = { EndRange = 4, Reduction = 0.2, StartRange = 0 },
				FireRate = 3,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Despair",
		GripType = "DUAL_GUN_GUN",
		Image = "Despair.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "DespairIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/StalkerKunai",
		Introduced = "8.0",
		Link = "Despair",
		Magazine = 10,
		Mastery = 4,
		MaxRank = 30,
		Name = "Despair",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.75,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Stalker" },
		Trigger = "Auto",
		Users = { "Stalker" },
		_TooltipAttackDisplay = 1 
	},
	Detron = {
		Accuracy = 7.1,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.04,
				CritMultiplier = 1.5,
				Damage = { Radiation = 40 },
				Falloff = { EndRange = 22, Reduction = 0.6231, StartRange = 13 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 16,
				MinSpread = 12,
				Multishot = 7,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.1286 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN", "SINGLESHOT", "SEMI_AUTO" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Detron",
		GripType = "GUN_ONE_HAND",
		Image = "Detron.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CorpusHandShotgun/CorpusHandCannon",
		Introduced = "11.5.5",
		Link = "Detron",
		Magazine = 5,
		Mastery = 6,
		MaxRank = 30,
		Name = "Detron",
		Reload = 1.05,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		Users = { "Detron Crewman", "Scrambus", "Comba", "Pelna Cade", "Jad Teran" },
		_TooltipAttackDisplay = 1 
	},
	["Dex Furis"] = {
		Accuracy = 15.4,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 2.4, Puncture = 11.2, Slash = 2.4 },
				FireRate = 20,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.39,
		ExilusPolarity = "Naramon",
		Family = "Afuris",
		GripType = "DUAL_GUN_GUN",
		Image = "DexFuris.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/DexFuris/DexFuris",
		Introduced = "12.6",
		Link = "Dex Furis",
		Magazine = 100,
		Mastery = 10,
		MaxRank = 30,
		Name = "Dex Furis",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dex Pixia"] = {
		Accuracy = 23,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 16, Puncture = 16, Slash = 128 },
				FireRate = 5.83,
				IsSilent = false,
				MaxSpread = 8.5,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "BATTERY" },
		Conclave = true,
		Family = "Dex Pixia",
		GripType = "DUAL_GUN_GUN",
		Image = "DexPixia.png",
		InternalName = "/Lotus/Powersuits/Fairy/FlightPistols",
		Introduced = "23.0",
		Link = "Dex Pixia",
		Magazine = 60,
		MaxRank = 30,
		Name = "Dex Pixia",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.3,
		ReloadDelay = 0.25,
		ReloadRate = 50,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Titania", "Titania Prime" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Dex Pixia Prime"] = {
		Accuracy = 23,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 16, Puncture = 16, Slash = 128 },
				FireRate = 5.83,
				IsSilent = false,
				MaxSpread = 8.5,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "BATTERY" },
		Conclave = true,
		Family = "Dex Pixia",
		GripType = "DUAL_GUN_GUN",
		Image = "DexPixiaPrime.png",
		InternalName = "/Lotus/Powersuits/Fairy/PrimeFlightPistols",
		Introduced = "23.0",
		Link = "Dex Pixia",
		Magazine = 60,
		MaxRank = 30,
		Name = "Dex Pixia Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 0.3,
		ReloadDelay = 0.25,
		ReloadRate = 50,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Titania Prime" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Dual Cestra"] = {
		Accuracy = 20,
		AmmoMax = 480,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.6,
				Damage = { Impact = 5.2, Puncture = 20.8 },
				FireRate = 18.75,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Dual Cestra",
		GripType = "DUAL_GUN_GUN",
		Image = "DualCestra.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CorpusMinigun/DualCorpusMinigun",
		Introduced = "12.0",
		Link = "Dual Cestra",
		Magazine = 120,
		Mastery = 7,
		MaxRank = 30,
		Name = "Dual Cestra",
		Polarities = { "Madurai" },
		Reload = 3.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Auto",
		Users = { "Darvo", "Jen Dro" },
		_TooltipAttackDisplay = 1 
	},
	["Dual Coda Torxica"] = {
		Accuracy = 100,
		AmmoMax = 480,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.4,
				Damage = { Puncture = 17.5, Slash = 32.5 },
				FireRate = 6,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		Disposition = 0.55,
		ExilusPolarity = "Madurai",
		Family = "Dual Torxica",
		GripType = "DUAL_GUN_GUN",
		Image = "DualCodaTorxica.png",
		InternalName = "/Lotus/Weapons/Infested/InfestedLich/Pistols/1999InfSporePistol/1999InfSporePistolWeapon",
		Introduced = "38.5",
		IsLichWeapon = true,
		Link = "Dual Coda Torxica",
		Magazine = 160,
		Mastery = 17,
		MaxRank = 40,
		Name = "Dual Coda Torxica",
		Polarities = { "Naramon" },
		Reload = 2.33,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested", "Technocyte Coda" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Dual Toxocyst"] = {
		Accuracy = 16,
		AmmoMax = 72,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 7.5, Puncture = 60, Slash = 7.5 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.37 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.11,
				CritMultiplier = 3,
				Damage = { Impact = 15, Puncture = 37.5, Slash = 22.5 },
				FireRate = 4.5,
				IncarnonCharges = 270,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1000,
				ShotType = "Hit-Scan",
				StatusChance = 0.43,
				Trigger = "Auto" 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Infested/Pistols/InfVomitGun/FireRateOnHeadshotPistolMod" },
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Dual Toxocyst",
		GripType = "DUAL_GUN_GUN",
		Image = "DualToxocyst.png",
		IncarnonChargeGain = 30,
		IncarnonImage = "DualToxocystIncarnon.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfVomitGun/InfVomitGunWep",
		Introduced = "18.5",
		Link = "Dual Toxocyst",
		Magazine = 12,
		Mastery = 11,
		MaxRank = 30,
		Name = "Dual Toxocyst",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.35,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["EFV-8 Mars"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Impact = 20, Puncture = 55 },
				FireRate = 6.5,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hit-Scan",
				StatusChance = 0.17,
				Trigger = "Semi-Auto" 
			},
			{
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Corrosive = 35 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 22,
				ShotType = "Projectile",
				StatusChance = 0.33,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire AoE",
				AttackParentIndex = 2,
				CritChance = 0.27,
				CritMultiplier = 2.1,
				Damage = { Corrosive = 313 },
				Falloff = { EndRange = 3, Reduction = 0.8, StartRange = 0 },
				FireRate = 6.5,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.33 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 1.05,
		ExilusPolarity = "Naramon",
		Family = "EFV-8 Mars",
		GripType = "GUN_ONE_HAND",
		Image = "EFV-8Mars.png",
		InternalName = "/Lotus/Weapons/Lasria/LasGooPistol/LasGooPistolPlayerWeapon",
		Introduced = "38.5",
		Link = "EFV-8 Mars",
		Magazine = 15,
		Mastery = 14,
		MaxRank = 30,
		Name = "EFV-8 Mars",
		Polarities = { "Madurai", "Vazarin" },
		Reload = 1.7,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Scaldra" },
		Trigger = "Semi-Auto / Charge",
		Users = { "Scaldra Barbican" },
		_TooltipAttackDisplay = 1 
	},
	Embolist = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Toxin = 35 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9,
				ShotType = "Hit-Scan",
				StatusChance = 0.41 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM", "AOE" },
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Embolist",
		GripType = "GUN_ONE_HAND",
		Image = "Embolist.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfestedPistol",
		Introduced = "10.0",
		Link = "Embolist",
		Magazine = 33,
		Mastery = 9,
		MaxRank = 30,
		Name = "Embolist",
		Polarities = { "Naramon" },
		Reload = 1.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Epitaph = {
		Accuracy = 80,
		AmmoMax = 40,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.36,
				CritChance = 0.48,
				CritMultiplier = 2.6,
				Damage = { Impact = 120, Puncture = 45, Slash = 135 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 2,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.04,
				Trigger = "Charge" 
			},
			{
				Accuracy = 80,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Uncharged Direct Hit",
				CritChance = 0.02,
				CritMultiplier = 1.2,
				Damage = { Impact = 40, Puncture = 30, Slash = 30 },
				FireRate = 1.5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Uncharged AoE",
				AttackParentIndex = 2,
				CritChance = 0.02,
				CritMultiplier = 1.2,
				Damage = { Blast = 20 },
				Falloff = { EndRange = 8, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.5,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 8,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "SINGLESHOT", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnWraitheSidearm/TnWraitheSidearmInnateUpgrade" },
		Disposition = 0.6,
		ExilusPolarity = "Naramon",
		Family = "Epitaph",
		GripType = "GUN_ONE_HAND",
		Image = "Epitaph.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnWraitheSidearm/TnWraitheSidearmWeapon",
		Introduced = "30",
		Link = "Epitaph",
		Magazine = 1,
		Mastery = 8,
		MaxRank = 30,
		Name = "Epitaph",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Trigger = "Semi / Charge",
		_TooltipAttackDisplay = 1 
	},
	["Epitaph Prime"] = {
		Accuracy = 80,
		AmmoMax = 40,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Charged Shot",
				ChargeTime = 0.36,
				CritChance = 0.5,
				CritMultiplier = 3,
				Damage = { Impact = 126, Puncture = 47.25, Slash = 141.75 },
				FireRate = 1.75,
				ForcedProcs = { "Impact", "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 2,
				ShotSpeed = 300,
				ShotType = "Projectile",
				StatusChance = 0.14,
				Trigger = "Charge" 
			},
			{
				Accuracy = 80,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Uncharged Direct Hit",
				CritChance = 0.04,
				CritMultiplier = 1.8,
				Damage = { Impact = 40, Puncture = 30, Slash = 30 },
				FireRate = 1.75,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 1.5,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.5,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Uncharged AoE",
				AttackParentIndex = 2,
				CritChance = 0.04,
				CritMultiplier = 1.8,
				Damage = { Blast = 30 },
				Falloff = { EndRange = 10, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.75,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 10,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "SINGLESHOT", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnWraitheSidearm/TnWraitheSidearmInnateUpgrade" },
		Disposition = 0.55,
		ExilusPolarity = "Naramon",
		Family = "Epitaph",
		GripType = "GUN_ONE_HAND",
		Image = "EpitaphPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeEpitaph/PrimeEpitaphSidearmWeapon",
		Introduced = "36.1",
		Link = "Epitaph Prime",
		Magazine = 1,
		Mastery = 14,
		MaxRank = 30,
		Name = "Epitaph Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Trigger = "Semi / Charge",
		_TooltipAttackDisplay = 1 
	},
	["Euphona Prime"] = {
		Accuracy = 100,
		AmmoMax = 40,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Slug",
				CritChance = 0.3,
				CritMultiplier = 2.5,
				Damage = { Impact = 292.5, Puncture = 16.25, Slash = 16.25 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 500,
				ShotType = "Projectile",
				StatusChance = 0.02 
			},
			{
				Accuracy = 3.2,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Buckshot",
				CritChance = 0.02,
				CritMultiplier = 2,
				Damage = { Impact = 4.4, Puncture = 17.6, Slash = 66 },
				Falloff = { EndRange = 12, Reduction = 0.9886, StartRange = 6 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 41,
				MinSpread = 21,
				Multishot = 10,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN", "SINGLESHOT" },
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Euphona Prime",
		GripType = "GUN_ONE_HAND",
		Image = "EuphonaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/AllNew1hSG/AllNew1hSG",
		Introduced = "19.11.5",
		Link = "Euphona Prime",
		Magazine = 5,
		Mastery = 14,
		MaxRank = 30,
		Name = "Euphona Prime",
		Polarities = { "Madurai", "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Furis = {
		Accuracy = 22.2,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 3, Puncture = 14, Slash = 3 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.12 
			},
			{
				Accuracy = 10,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.26,
				CritMultiplier = 3.4,
				Damage = { Heat = 100 },
				Falloff = { EndRange = 16, Reduction = 0.48, StartRange = 10 },
				FireRate = 12,
				IncarnonCharges = 280,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 16,
				ShotType = "Hit-Scan",
				StatusChance = 0.24,
				Trigger = "Held" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Furis",
		GripType = "GUN_ONE_HAND",
		Image = "Furis.png",
		IncarnonChargeGain = 14,
		IncarnonImage = "FurisIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/AutoPistol",
		Introduced = "Vanilla",
		Link = "Furis",
		Magazine = 35,
		Mastery = 2,
		MaxRank = 30,
		Name = "Furis",
		Polarities = { "Naramon" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Fusilai = {
		Accuracy = 100,
		AmmoMax = 72,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Full Auto Mode",
				CritChance = 0.23,
				CritMultiplier = 1.7,
				Damage = { Puncture = 30.8, Slash = 46.2 },
				FireRate = 2.83,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.29 
			},
			{
				AmmoCost = 3,
				AttackIndex = 2,
				AttackName = "Semi-Auto Mode",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Puncture = 30.8, Slash = 46.2 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.123,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/ThrowingWeapons/GlassKunai/GlassKunaiInnateUpgrade" },
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Fusilai",
		GripType = "DUAL_GUN_GUN",
		Image = "Fusilai.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/GlassKunai/GlassKunaiWeapon",
		Introduced = "22",
		Link = "Fusilai",
		Magazine = 6,
		Mastery = 7,
		MaxRank = 30,
		Name = "Fusilai",
		Polarities = { "Madurai" },
		Reload = 0.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1 
	},
	Gammacor = {
		Accuracy = 100,
		AmmoMax = 240,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.8,
				Damage = { Magnetic = 16 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 25,
				ShotType = "Hit-Scan",
				StatusChance = 0.2 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Impact = 80 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 15,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Cold = 660 },
				ExplosionDelay = 1.2,
				Falloff = { EndRange = 5, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.22,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Gammacor",
		GripType = "GUN_ONE_HAND",
		Image = "Gammacor.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "GammacorIncarnon.png",
		InternalName = "/Lotus/Weapons/Syndicates/CephalonSuda/Pistols/CSDroidArray",
		Introduced = "15.5",
		Link = "Gammacor",
		Magazine = 60,
		Mastery = 2,
		MaxRank = 30,
		Name = "Gammacor",
		Polarities = { "Vazarin" },
		Reload = 1.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Cephalon" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Glory = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Heat = 150 },
				Falloff = { EndRange = 2, Reduction = 1, StartRange = 0 },
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				Range = 2,
				ShotSpeed = 100,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Alternate Fire",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Heat = 1500 },
				FireRate = 1.67,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				Range = 4,
				ShotType = "AoE",
				StatusChance = 0.2 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "NO_AIM", "AOE" },
		Conclave = false,
		GripType = "",
		Image = "Glory.png",
		InternalName = "/Lotus/Powersuits/Choir/ChoirEruptWeapon",
		Introduced = "36",
		Link = "Glory",
		Magazine = 0,
		MaxRank = 30,
		Name = "Glory",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Jade" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Grimoire = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 10,
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 100 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 40, --Accelerates up to 80 m/s at 0.6 m/s^2
				ShotType = "Projectile",
				StatusChance = 0.26,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Normal Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 50 },
				Falloff = { EndRange = 1, Reduction = 0.8, StartRange = 0 },
				FireRate = 1.5,
				IsSilent = false,
				Multishot = 1,
				Range = 1,
				ShotType = "AoE",
				StatusChance = 0.26,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Active Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 350 },
				FireRate = 1,
				ForcedProcs = { "Electricity" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				Range = 6,
				ShotSpeed = 6,
				ShotType = "Projectile",
				StatusChance = 0.26,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 4,
				AttackName = "Active Radial Attack",
				AttackParentIndex = 3,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Electricity = 250 },
				Falloff = { EndRange = 6, Reduction = 0.8, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Electricity" },
				IsSilent = false,
				Multishot = 1,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.26,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Tome",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = false,
		Disposition = 0.6,
		ExilusPolarity = "None",
		Family = "Grimoire",
		GripType = "BOOK",
		Image = "Grimoire.png",
		InternalName = "/Lotus/Weapons/Tenno/Grimoire/TnGrimoire",
		Introduced = "35",
		Link = "Grimoire",
		Magazine = 0,
		Mastery = 10,
		MaxRank = 30,
		Name = "Grimoire",
		Polarities = { "Madurai", "Naramon" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Entrati" },
		Trigger = "Auto" 
	},
	Hikou = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.04,
				CritMultiplier = 1.6,
				Damage = { Impact = 2.6, Puncture = 15.6, Slash = 7.8 },
				FireRate = 6.67,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.1 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Hikou",
		GripType = "DUAL_GUN_GUN",
		Image = "Hikou.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/TennoStars",
		Introduced = "9.0",
		Link = "Hikou",
		Magazine = 20,
		Mastery = 2,
		MaxRank = 30,
		Name = "Hikou",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.75,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Mag Specter" },
		_TooltipAttackDisplay = 1 
	},
	["Hikou Prime"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.8,
				Damage = { Impact = 3.6, Puncture = 30.6, Slash = 1.8 },
				FireRate = 5.83,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.28 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Hikou",
		GripType = "DUAL_GUN_GUN",
		Image = "HikouPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/PrimeThrowingStar/PrimeHikou",
		Introduced = "14.8",
		Link = "Hikou Prime",
		Magazine = 26,
		Mastery = 4,
		MaxRank = 30,
		Name = "Hikou Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Hystrix = {
		Accuracy = 14.3,
		AmmoMax = 320,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Poison Quill",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.16, Puncture = 30.96, Slash = 2.88 },
				FireRate = 7,
				ForcedProcs = { "Toxin" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Fire Quill",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.4, Puncture = 34.4, Slash = 3.2 },
				FireRate = 7,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Electric Quill",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.4, Puncture = 34.4, Slash = 3.2 },
				FireRate = 7,
				ForcedProcs = { "Electricity" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 1,
				AttackIndex = 4,
				AttackName = "Ice Quill",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.16, Puncture = 30.96, Slash = 2.88 },
				FireRate = 7,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.1 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/QuillDartgun/QuillDartgunInnateUpgrade" },
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Hystrix",
		GripType = "GUN_ONE_HAND",
		Image = "Hystrix.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/QuillDartgun/QuillDartGunWeapon",
		Introduced = "22.18",
		Link = "Hystrix",
		Magazine = 16,
		Mastery = 7,
		MaxRank = 30,
		Name = "Hystrix",
		Polarities = { "Madurai" },
		Reload = 1.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Hystrix Prime"] = {
		Accuracy = 14.3,
		AmmoMax = 320,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Poison Quill",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.76, Puncture = 39.56, Slash = 3.68 },
				FireRate = 7,
				ForcedProcs = { "Toxin" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Fire Quill",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.76, Puncture = 39.56, Slash = 3.68 },
				FireRate = 7,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Electric Quill",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.76, Puncture = 39.56, Slash = 3.68 },
				FireRate = 7,
				ForcedProcs = { "Electricity" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AmmoCost = 1,
				AttackIndex = 4,
				AttackName = "Ice Quill",
				CritChance = 0.28,
				CritMultiplier = 2.2,
				Damage = { Impact = 2.76, Puncture = 39.56, Slash = 3.68 },
				FireRate = 7,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/QuillDartgun/QuillDartgunInnateUpgrade" },
		Disposition = 1,
		ExilusPolarity = "Naramon",
		Family = "Hystrix",
		GripType = "GUN_ONE_HAND",
		Image = "HystrixPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeHystrix/PrimeHystrixWeapon",
		Introduced = "31.7",
		Link = "Hystrix Prime",
		Magazine = 16,
		Mastery = 12,
		MaxRank = 30,
		Name = "Hystrix Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Knell = {
		Accuracy = 32,
		AmmoMax = 10,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.5,
				Damage = { Impact = 63, Puncture = 69, Slash = 18 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.25,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.05 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateMod",
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateModB",
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateModC" 
		},
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Knell",
		GripType = "GUN_ONE_HAND",
		Image = "Knell.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolWeapon",
		Introduced = "21.0",
		Link = "Knell",
		Magazine = 1,
		Mastery = 10,
		MaxRank = 30,
		Name = "Knell",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		SniperComboReset = 2,
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Knell Prime"] = {
		Accuracy = 32,
		AmmoMax = 20,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.4,
				CritMultiplier = 2,
				Damage = { Impact = 75.6, Puncture = 82.8, Slash = 21.6 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.25,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateMod",
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateModB",
			"/Lotus/Weapons/Tenno/Pistols/TnPriestPistolScope/TnPriestPistolInnateModC" 
		},
		Disposition = 0.85,
		ExilusPolarity = "Madurai",
		Family = "Knell",
		GripType = "GUN_ONE_HAND",
		Image = "KnellPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeKnell/PrimeKnellWeapon",
		Introduced = "31",
		Link = "Knell Prime",
		Magazine = 1,
		Mastery = 14,
		MaxRank = 30,
		Name = "Knell Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno", "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Kohmak = {
		Accuracy = 8,
		AmmoMax = 210,
		AmmoPickup = 30,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Pellet",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 24, Reduction = 0.8333, StartRange = 12 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.69 
			},
			{
				AmmoCost = 1.67,
				AttackIndex = 2,
				AttackName = "Fully Spooled",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 24, Reduction = 0.8333, StartRange = 12 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 5,
				Multishot = 5,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.138 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Kohmak",
		GripType = "GUN_ONE_HAND",
		Image = "Kohmak.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnKohmPistol/GrnKohmPistol",
		Introduced = "16.0",
		Link = "Kohmak",
		Magazine = 40,
		Mastery = 5,
		MaxRank = 30,
		Name = "Kohmak",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Spool = 4,
		Traits = { "Grineer" },
		Trigger = "Auto-Spool",
		Users = { "Tusk Heavy Gunner" },
		_TooltipAttackDisplay = 2 
	},
	Kompressa = {
		Accuracy = 3.8,
		AmmoMax = 144,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.06,
				CritMultiplier = 1.8,
				Damage = { Viral = 2 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 30,
				MinSpread = 23,
				Multishot = 4,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.06,
				CritMultiplier = 1.8,
				Damage = { Viral = 42 },
				ExplosionDelay = 0.6,	--"0.6 - 0.8"
				Falloff = { EndRange = 2.4, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 4,
				PunchThrough = 0,
				Range = 2.4,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnYareliPistol/TnYareliPistolInnateUpgrade" },
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Kompressa",
		GripType = "GUN_ONE_HAND",
		Image = "Kompressa.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnYareliPistol/TnYareliPistolWeapon",
		Introduced = "30.5",
		Link = "Kompressa",
		Magazine = 12,
		Mastery = 8,
		MaxRank = 30,
		Name = "Kompressa",
		Polarities = { "Vazarin" },
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2 
	},
	["Kompressa Prime"] = {
		Accuracy = 3.8,
		AmmoMax = 144,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Viral = 2 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 30,
				MinSpread = 23,
				Multishot = 4,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.36 
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Viral = 46 },
				ExplosionDelay = 0.6,	--"0.6 - 0.8"
				Falloff = { EndRange = 2.8, Reduction = 0.2, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				Multishot = 4,
				PunchThrough = 0,
				Range = 2.8,
				ShotType = "AoE",
				StatusChance = 0.36 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnYareliPistol/TnYareliPistolInnateUpgrade" },
		Disposition = 0.6,
		ExilusPolarity = "Madurai",
		Family = "Kompressa",
		GripType = "GUN_ONE_HAND",
		Image = "KompressaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeKompressa/PrimeKompressa",
		Introduced = "38.6",
		Link = "Kompressa_Prime",
		Magazine = 12,
		Mastery = 13,
		MaxRank = 30,
		Name = "Kompressa Prime",
		Polarities = { "Vazarin", "Naramon" },
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 2 
	},
	Kraken = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 2,
				BurstDelay = 0.05,
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 36.75, Puncture = 6.125, Slash = 6.125 },
				FireRate = 2.83,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.13 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.53,
		ExilusPolarity = "Madurai",
		Family = "Kraken",
		GripType = "GUN_ONE_HAND",
		Image = "Kraken.png",
		InternalName = "/Lotus/Weapons/Grineer/GrineerPistol/GrnHeavyPistol",
		Introduced = "6.3",
		Link = "Kraken",
		Magazine = 14,
		Mastery = 0,
		MaxRank = 30,
		Name = "Kraken",
		Reload = 2.45,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Burst",
		Users = { "Seeker", "Dargyn Pilot" },
		_TooltipAttackDisplay = 1 
	},
	Kulstar = {
		Accuracy = 26.7,
		AmmoMax = 15,
		AmmoPickup = 3,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Rocket Impact",
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Impact = 200 },
				FireRate = 2,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.19 
			},
			{
				AttackIndex = 2,
				AttackName = "Rocket Explosion",
				AttackParentIndex = 1,
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Blast = 300 },
				Falloff = { EndRange = 3.9, Reduction = 0.4, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.9,
				ShotType = "AoE",
				StatusChance = 0.19 
			},
			{
				AttackIndex = 3,
				AttackName = "Cluster Bombs",
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Impact = 75 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 3,
				PunchThrough = 0,
				ShotSpeed = 8,
				ShotType = "Projectile",
				StatusChance = 0.19 
			},
			{
				AttackIndex = 4,
				AttackName = "Cluster Bomb Explosion",
				AttackParentIndex = 3,
				CritChance = 0.17,
				CritMultiplier = 2.3,
				Damage = { Blast = 90 },
				Falloff = { EndRange = 3.9, Reduction = 0.4, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.9,
				ShotType = "AoE",
				StatusChance = 0.19 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Kulstar",
		GripType = "GUN_ONE_HAND",
		Image = "Kulstar.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnTorpedoPistol/GrnTorpedoPistol",
		Introduced = "17.0",
		Link = "Kulstar",
		Magazine = 3,
		Mastery = 5,
		MaxRank = 30,
		Name = "Kulstar",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Darek Draga" },
		_TooltipAttackDisplay = 1 
	},
	Kunai = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.6,
				Damage = { Impact = 4.6, Puncture = 34.5, Slash = 6.9 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.08 
			},
			{
				Accuracy = 10,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Impact = 8, Puncture = 14, Slash = 18 },
				FireRate = 3.33,
				IncarnonCharges = 20,
				IsSilent = true,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 2,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.16 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.51,
		ExilusPolarity = "Naramon",
		Family = "Kunai",
		GripType = "DUAL_GUN_GUN",
		Image = "Kunai.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "KunaiIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/Kunai",
		Introduced = "8.0",
		Link = "Kunai",
		Magazine = 10,
		Mastery = 0,
		MaxRank = 30,
		Name = "Kunai",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.75,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Nova Specter" },
		_TooltipAttackDisplay = 1 
	},
	["Kuva Brakk"] = {
		Accuracy = 7.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.29,
				CritMultiplier = 2,
				Damage = { Impact = 6.75, Puncture = 3.75, Slash = 4.5 },
				Falloff = { EndRange = 20, Reduction = 0.96, StartRange = 10 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 17,
				MinSpread = 9,
				Multishot = 10,
				PunchThrough = 0.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.111 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.95,
		ExilusPolarity = "Naramon",
		Family = "Brakk",
		GripType = "GUN_ONE_HAND",
		Image = "KuvaBrakk.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/Secondaries/Brakk/KuvaBrakk",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Brakk",
		Magazine = 11,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Brakk",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Kuva Kraken"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.03,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 32.25, Puncture = 5.375, Slash = 5.375 },
				FireRate = 2.83,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.29 
			},
			{
				Accuracy = 8.2,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				BurstDelay = 0.05,
				BurstReloadDelay = 0.24,
				CritChance = 0.21,
				CritMultiplier = 2.3,
				Damage = { Impact = 32.25, Puncture = 5.375, Slash = 5.375 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				Reload = 2,
				ShotType = "Hit-Scan",
				StatusChance = 0.29,
				Trigger = "Mag Burst" 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Kraken",
		GripType = "GUN_ONE_HAND",
		Image = "KuvaKraken.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/Secondaries/Kraken/KuvaKraken",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Kraken",
		Magazine = 21,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Kraken",
		Reload = 1.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Burst / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	["Kuva Nukor"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.07,
				CritMultiplier = 5,
				Damage = { Radiation = 21 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 29,
				ShotType = "Hit-Scan",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.5,
		ExilusPolarity = "Madurai",
		Family = "Nukor",
		GripType = "GUN_ONE_HAND",
		Image = "KuvaNukor.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/Secondaries/Nukor/KuvaNukor",
		Introduced = "27.1",
		IsLichWeapon = true,
		Link = "Kuva Nukor",
		Magazine = 77,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Nukor",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Held",
		Users = { "Kuva Lich" },
		_TooltipAttackDisplay = 1 
	},
	["Kuva Seer"] = {
		Accuracy = 16,
		AmmoMax = 27,
		AmmoPickup = 9,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Impact = 26.2, Puncture = 68.12, Slash = 36.68 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.33 
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.21,
				CritMultiplier = 1.9,
				Damage = { Corrosive = 69 },
				Falloff = { EndRange = 2.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 2.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.3,
				ShotType = "AoE",
				StatusChance = 0.33 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Seer",
		GripType = "GUN_ONE_HAND",
		Image = "KuvaSeer.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/Secondaries/Seer/KuvaSeer",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Seer",
		Magazine = 9,
		Mastery = 15,
		MaxRank = 40,
		Name = "Kuva Seer",
		Reload = 2.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Kuva Twin Stubbas"] = {
		Accuracy = 36.4,
		AmmoMax = 684,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 1.9,
				Damage = { Impact = 11.61, Puncture = 2.7, Slash = 12.69 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.31 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Kuva Twin Stubbas",
		GripType = "DUAL_GUN_GUN",
		Image = "KuvaTwinStubbas.png",
		InternalName = "/Lotus/Weapons/Grineer/KuvaLich/Secondaries/Stubba/KuvaStubba",
		Introduced = "26",
		IsLichWeapon = true,
		Link = "Kuva Twin Stubbas",
		Magazine = 114,
		Mastery = 13,
		MaxRank = 40,
		Name = "Kuva Twin Stubbas",
		Polarities = { "Madurai" },
		Reload = 2.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Grineer", "Kuva Lich" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Laetum = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = { Impact = 64, Slash = 96 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Semi-Auto" 
			},
			{
				Accuracy = 4,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = { Impact = 100 },
				FireRate = 6.67,
				IncarnonCharges = 216,
				IsSilent = false,
				MaxSpread = 50,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Auto Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.22,
				CritMultiplier = 2.2,
				Damage = { Radiation = 300 },
				Falloff = { EndRange = 2, Reduction = 0.2, StartRange = 0 },
				FireRate = 6.67,
				IsSilent = false,
				Multishot = 1,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.22 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Upgrades/Evolutions/Pistol/EvoPistolAmmoEfficiencyOnHeadshot",
			"/Lotus/Upgrades/Evolutions/Pistol/EvoPistolDamageOnNoCritAndNoProcHit",
			"/Lotus/Upgrades/Evolutions/Pistol/EvoPistolReloadSpeedOnHeadshot" 
		},
		Disposition = 0.5,
		ExilusPolarity = "Naramon",
		Family = "Laetum",
		GripType = "GUN_ONE_HAND",
		Image = "Laetum.png",
		IncarnonChargeGain = 18,
		InternalName = "/Lotus/Weapons/Tenno/Zariman/Pistols/HeavyPistol/ZarimanHeavyPistol",
		Introduced = "31.5",
		Link = "Laetum",
		Magazine = 12,
		Mastery = 14,
		MaxRank = 30,
		Name = "Laetum",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Zariman", "Incarnon" },
		Trigger = "Semi / Auto",
		_TooltipAttackDisplay = 1 
	},
	Lato = {
		Accuracy = 18.2,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 1.8,
				Damage = { Impact = 10, Puncture = 10, Slash = 20 },
				FireRate = 4.5,
				IsSilent = false,
				MaxSpread = 10.5,
				MinSpread = 0.5,
				Multishot = 1,
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
				CritChance = 0.16,
				CritMultiplier = 2.6,
				Damage = { Impact = 16, Puncture = 16, Slash = 32 },
				FireRate = 3.5,
				IncarnonCharges = 24,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0.4,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Madurai",
		Family = "Lato",
		GripType = "GUN_ONE_HAND",
		Image = "Lato.png",
		IncarnonChargeGain = 4,
		IncarnonImage = "LatoIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/Pistol",
		Introduced = "Vanilla",
		Link = "Lato",
		Magazine = 15,
		Mastery = 0,
		MaxRank = 30,
		Name = "Lato",
		Reload = 1,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Lato Prime"] = {
		Accuracy = 18.2,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.6,
				Damage = { Impact = 6, Puncture = 12, Slash = 42 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 10.5,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.36,
				CritMultiplier = 3.2,
				Damage = { Impact = 19.5, Puncture = 19.5, Slash = 39 },
				FireRate = 4,
				IncarnonCharges = 24,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 1,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.15 
			} 
		},
		Class = "Pistol",
		CodexSecret = true,
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Lato",
		GripType = "GUN_ONE_HAND",
		Image = "LatoPrime.png",
		IncarnonChargeGain = 4,
		IncarnonImage = "LatoPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/LatoPrime",
		Introduced = "5.0",
		Link = "Lato Prime",
		Magazine = 20,
		Mastery = 14,
		MaxRank = 30,
		Name = "Lato Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 1,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Prime", "Vaulted", "Founder" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Lato Vandal"] = {
		Accuracy = 23,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 6.9, Puncture = 11.5, Slash = 27.6 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8.5,
				MinSpread = 0.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.34,
				CritMultiplier = 3,
				Damage = { Impact = 19, Puncture = 19, Slash = 38 },
				FireRate = 4,
				IncarnonCharges = 24,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0.8,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Lato",
		GripType = "GUN_ONE_HAND",
		Image = "LatoVandal.png",
		IncarnonChargeGain = 4,
		IncarnonImage = "LatoVandalIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/LatoVandal",
		Introduced = "7.0",
		Link = "Lato Vandal",
		Magazine = 15,
		Mastery = 7,
		MaxRank = 30,
		Name = "Lato Vandal",
		Polarities = { "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno", "Vandal" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Lex = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 13, Puncture = 104, Slash = 13 },
				FireRate = 1.08,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			},
			{
				Accuracy = 16,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 300, Radiation = 700 },
				FireRate = 0.67,
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Lex",
		GripType = "GUN_ONE_HAND",
		Image = "Lex.png",
		IncarnonChargeGain = 2,
		IncarnonImage = "LexIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/HeavyPistol",
		Introduced = "Vanilla",
		Link = "Lex",
		Magazine = 6,
		Mastery = 3,
		MaxRank = 30,
		Name = "Lex",
		Polarities = { "Madurai" },
		Reload = 2.35,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Maroo" },
		_TooltipAttackDisplay = 1 
	},
	["Lex Prime"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 18, Puncture = 144, Slash = 18 },
				FireRate = 2.08,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.25 
			},
			{
				Accuracy = 16,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.35,
				CritMultiplier = 3,
				Damage = { Impact = 400, Radiation = 800 },
				Falloff = { EndRange = 18, Reduction = 0.3333, StartRange = 10 },
				FireRate = 0.67,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 20,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 1.4,
				Range = 28,
				ShotSpeed = 110,
				ShotType = "Projectile",
				StatusChance = 0.44,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Lex",
		GripType = "GUN_ONE_HAND",
		Image = "LexPrime.png",
		IncarnonChargeGain = 2,
		IncarnonImage = "LexPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeLex/PrimeLex",
		Introduced = "13.0",
		Link = "Lex Prime",
		Magazine = 8,
		Mastery = 8,
		MaxRank = 30,
		Name = "Lex Prime",
		Polarities = { "Madurai" },
		Reload = 2.35,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Never Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Magnus = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Impact = 44.1, Puncture = 26.95, Slash = 26.95 },
				FireRate = 4.33,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.53,
		ExilusPolarity = "Naramon",
		Family = "Magnus",
		GripType = "GUN_ONE_HAND",
		Image = "Magnus.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/Magnum/Magnum",
		Introduced = "11.2",
		Link = "Magnus",
		Magazine = 8,
		Mastery = 10,
		MaxRank = 30,
		Name = "Magnus",
		Polarities = { "Madurai" },
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		Users = { "Volt Specter", "Ember Specter" },
		_TooltipAttackDisplay = 1 
	},
	["Magnus Prime"] = {
		Accuracy = 16,
		AmmoMax = 160,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.28,
				CritMultiplier = 2.8,
				Damage = { Impact = 44.1, Puncture = 26.95, Slash = 26.95 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/PrimeMagnus/PrimeMagnusInnateUpgrade" },
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Magnus",
		GripType = "GUN_ONE_HAND",
		Image = "MagnusPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeMagnus/PrimeMagnusWeapon",
		Introduced = "30.7",
		Link = "Magnus Prime",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Magnus Prime",
		Polarities = { "Madurai" },
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mara Detron"] = {
		Accuracy = 13.3,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.5,
				Damage = { Radiation = 40 },
				Falloff = { EndRange = 30, Reduction = 0.625, StartRange = 16 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 6,
				Multishot = 7,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.1371 
			} 
		},
		Class = "Shotgun Sidearm",
		CodexSecret = true,
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN", "SEMI_AUTO" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Madurai",
		Family = "Detron",
		GripType = "GUN_ONE_HAND",
		Image = "MaraDetron.png",
		InternalName = "/Lotus/Weapons/VoidTrader/VTDetron",
		Introduced = "15.6.3",
		Link = "Mara Detron",
		Magazine = 8,
		Mastery = 9,
		MaxRank = 30,
		Name = "Mara Detron",
		Reload = 1.05,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 1,
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Marelok = {
		Accuracy = 10,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 80, Puncture = 16, Slash = 64 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.3 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Marelok",
		GripType = "GUN_ONE_HAND",
		Image = "Marelok.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrineerLeverActionPistol/GLAPistol",
		Introduced = "12.3",
		Link = "Marelok",
		Magazine = 6,
		Mastery = 7,
		MaxRank = 30,
		Name = "Marelok",
		Polarities = { "Madurai" },
		Reload = 1.667,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Shik Tal", "Kuva Shield Lancer" },
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Furis"] = {
		Accuracy = 22.2,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 1.95, Puncture = 9.1, Slash = 1.95 },
				FireRate = 8.33,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.01 
			},
			{
				Accuracy = 10,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 3,
				Damage = { Heat = 60 },
				Falloff = { EndRange = 16, Reduction = 0.2167, StartRange = 10 },
				FireRate = 12,
				IncarnonCharges = 280,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 16,
				ShotType = "Hit-Scan",
				StatusChance = 0.08,
				Trigger = "Held" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Furis",
		GripType = "GUN_ONE_HAND",
		Image = "Furis.png",
		IncarnonChargeGain = 14,
		IncarnonImage = "FurisIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Furis",
		Introduced = "14.0",
		Link = "Mk1-Furis",
		Magazine = 35,
		Mastery = 0,
		MaxRank = 30,
		Name = "Mk1-Furis",
		Polarities = { "Naramon" },
		Reload = 1.4,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Mk1-Kunai"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2,
				Damage = { Impact = 4, Puncture = 30, Slash = 6 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.025 
			},
			{
				Accuracy = 10,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 4.8, Puncture = 8.4, Slash = 10.8 },
				FireRate = 3.33,
				IncarnonCharges = 20,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 2,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.05 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.51,
		ExilusPolarity = "Naramon",
		Family = "Kunai",
		GripType = "DUAL_GUN_GUN",
		Image = "Kunai.png",
		IncarnonChargeGain = 5,
		IncarnonImage = "KunaiIncarnon.png",
		InternalName = "/Lotus/Weapons/MK1Series/MK1Kunai",
		Introduced = "14.0",
		Link = "Mk1-Kunai",
		Magazine = 10,
		Mastery = 0,
		MaxRank = 30,
		Name = "Mk1-Kunai",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.75,
		SellPrice = 2500,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Noctua = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 10,
		Attacks = {
			{
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Slash = 250 },
				FireRate = 1.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				Shotspeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.25,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Active Attack",
				CritChance = 0.45,
				CritMultiplier = 3,
				Damage = { Impact = 1100, Radiation = 1650 },
				Falloff = { EndRange = 20, Reduction = 0.8618, StartRange = 10 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1.4,
				ShotSpeed = 35,
				ShotType = "Projectile",
				StatusChance = 0.45,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "AOE" },
		Conclave = false,
		GripType = "BOOK",
		Image = "Noctua.png",
		InternalName = "/Lotus/Powersuits/Pagemaster/ExaltedBook",
		Introduced = "35.5",
		Link = "Noctua (Weapon)",
		Magazine = 0,
		MaxRank = 30,
		Name = "Noctua",
		Polarities = { "Naramon", "Madurai" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Dante" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	Nukor = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.03,
				CritMultiplier = 4,
				Damage = { Radiation = 22 },
				FireRate = 10,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 25,
				ShotType = "Hit-Scan",
				StatusChance = 0.29 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Nukor",
		GripType = "GUN_ONE_HAND",
		Image = "Nukor.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrineerMicrowavegun/GrnMicrowavePistol",
		Introduced = "14.5",
		Link = "Nukor",
		Magazine = 50,
		Mastery = 4,
		MaxRank = 30,
		Name = "Nukor",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Held",
		Users = { "Nightwatch Seeker" },
		_TooltipAttackDisplay = 1 
	},
	Ocucor = {
		Accuracy = 100,
		AmmoMax = 300,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.8,
				Damage = { Puncture = 1, Radiation = 10 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 20,
				ShotType = "Hit-Scan",
				StatusChance = 0.24 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "BEAM" },
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Ocucor",
		GripType = "GUN_ONE_HAND",
		Image = "Ocucor.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpSentExperimentPistol/CrpSentExperimentPistol",
		Introduced = "24",
		Link = "Ocucor",
		Magazine = 60,
		Mastery = 8,
		MaxRank = 30,
		Name = "Ocucor",
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Onos = {
		Accuracy = 40,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Puncture = 220 },
				FireRate = 1.4,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 0,
				Multishot = 1,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.22,
				Trigger = "Auto" 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form Held Damage",
				CritChance = 0.14,
				CritMultiplier = 1.6,
				Damage = { Radiation = 30 },
				FireRate = 2,
				IncarnonCharges = 350,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 5,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Held" 
			},
			{
				AmmoCost = 50,
				AttackIndex = 3,
				AttackName = "Incarnon Form Charge Attack",
				CritChance = 0.38,
				CritMultiplier = 3.2,
				Damage = { Heat = 2200 },
				FireRate = 0.25,
				ForcedProcs = { "Heat" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				ShotType = "Hit-Scan",
				StatusChance = 0.26,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 4,
				AttackName = "Incarnon Form Charge Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.38,
				CritMultiplier = 3.2,
				Damage = { Heat = 1100 },
				Falloff = { EndRange = 3, Reduction = 0.3, StartRange = 0 },
				FireRate = 0.25,
				IsSilent = false,
				Multishot = 1,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.26,
				Trigger = "Charge" 
			} 
		},
		Class = "Pistol",
		CodexSecret = false,
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 0.8,
		ExilusPolarity = "Naramon",
		Family = "Onos",
		GripType = "GUN_ONE_HAND",
		Image = "Onos.png",
		IncarnonChargeGain = 30,
		InternalName = "/Lotus/Weapons/Thanotech/EntratiWristGun/EntratiWristGunWeapon",
		Introduced = "35.5",
		Link = "Onos",
		Magazine = 20,
		Mastery = 14,
		MaxRank = 30,
		Name = "Onos",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Entrati", "Incarnon" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Pandero = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 16,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 18, Puncture = 18, Slash = 36 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			},
			{
				Accuracy = 8.2,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				BurstDelay = 0.1,
				BurstReloadDelay = 0.24,
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 18, Puncture = 18, Slash = 36 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 18,
				MinSpread = 6.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.1,
				Trigger = "Mag Burst" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnBardPistol/TnBardPistolInnateUpgrade" },
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Pandero",
		GripType = "GUN_ONE_HAND",
		Image = "Pandero.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnBardPistol/TnBardPistolGun",
		Introduced = "20",
		Link = "Pandero",
		Magazine = 8,
		Mastery = 8,
		MaxRank = 30,
		Name = "Pandero",
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	["Pandero Prime"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 26, Puncture = 26, Slash = 52 },
				FireRate = 3,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.24 
			},
			{
				Accuracy = 8.2,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				BurstDelay = 0.1,
				BurstReloadDelay = 0.24,
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 26, Puncture = 26, Slash = 52 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 18,
				MinSpread = 6.5,
				Multishot = 1,
				PunchThrough = 0,
				StatusChance = 0.24,
				Trigger = "Mag Burst" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		DefaultUpgrades = { "/Lotus/Weapons/Tenno/Pistols/TnBardPistol/TnBardPistolInnateUpgrade" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Pandero",
		GripType = "GUN_ONE_HAND",
		Image = "PanderoPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimePandero/PanderoPrimeWeapon",
		Introduced = "29.9",
		Link = "Pandero Prime",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Pandero Prime",
		Polarities = { "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Semi-Auto / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	Plinx = {
		Accuracy = 50,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.32,
				CritMultiplier = 3,
				Damage = { Heat = 20, Puncture = 26 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 100,
				ShotType = "Hit-Scan",
				StatusChance = 0.04 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "BATTERY" },
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Plinx",
		GripType = "GUN_ONE_HAND",
		Image = "Plinx.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpSonificBlastor/CrpBlastorWeapon",
		Introduced = "24.2",
		Link = "Plinx",
		Magazine = 10,
		Mastery = 6,
		MaxRank = 30,
		Name = "Plinx",
		Reload = 1.3,
		ReloadDelay = 0.8,
		ReloadRate = 20,
		ReloadStyle = "Regenerate",
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Pox = {
		Accuracy = 100,
		AmmoMax = 20,
		AmmoPickup = 4,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Spore Impact",
				CritChance = 0.01,
				CritMultiplier = 2,
				Damage = { Toxin = 50 },
				FireRate = 2.08,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 30,
				ShotType = "Projectile",
				StatusChance = 0.35 
			},
			{
				AttackIndex = 2,
				AttackName = "Poison Cloud",
				AttackParentIndex = 1,
				CritChance = 0.01,
				CritMultiplier = 2,
				Damage = { Toxin = 20 },
				EffectDuration = 5,
				Falloff = { EndRange = 2.5, Reduction = 0, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.5,
				ShotType = "AoE",
				StatusChance = 0.35 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Pox",
		GripType = "DUAL_GUN_GUN",
		Image = "Pox.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfProximityStars/InfProximityStars",
		Introduced = "Update: The Silver Grove",
		Link = "Pox",
		Magazine = 4,
		Mastery = 9,
		MaxRank = 30,
		Name = "Pox",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Prisma Angstrum"] = {
		Accuracy = 26.7,
		AmmoMax = 18,
		AmmoPickup = 3,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Rocket Impact",
				ChargeTime = 0.2,
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Blast = 200 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Single Rocket Explosion",
				AttackParentIndex = 1,
				ChargeTime = 0.2,
				CritChance = 0.18,
				CritMultiplier = 2.2,
				Damage = { Blast = 250 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 2,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.26 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Heat = 50 },
				FireRate = 6,
				IncarnonCharges = 120,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2,
				Trigger = "Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "None",
		Family = "Angstrum",
		GripType = "GUN_ONE_HAND",
		Image = "PrismaAngstrum.png",
		IncarnonChargeGain = 40,
		IncarnonImage = "PrismaAngstrumIncarnon.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpHandRL/PrismaAngstrum",
		Introduced = "21.7",
		Link = "Prisma Angstrum",
		Magazine = 3,
		Mastery = 8,
		MaxRank = 30,
		Name = "Prisma Angstrum",
		Polarities = { "Vazarin" },
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 1,
		Traits = { "Prisma", "Baro" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 2 
	},
	["Prisma Twin Gremlins"] = {
		Accuracy = 36.4,
		AmmoMax = 600,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 1.9,
				Damage = { Impact = 2.97, Puncture = 12.69, Slash = 11.34 },
				FireRate = 8.83,
				IsSilent = false,
				MaxSpread = 3.5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.23 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Twin Gremlins",
		GripType = "DUAL_GUN_GUN",
		Image = "PrismaTwinGremlins.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrineerBulbousSMG/Prisma/PrismaTwinGremlinsWeapon",
		Introduced = "23.4.2",
		Link = "Prisma Twin Gremlins",
		Magazine = 70,
		Mastery = 11,
		MaxRank = 30,
		Name = "Prisma Twin Gremlins",
		Polarities = { "Madurai" },
		Reload = 0.9,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 1,
		Traits = { "Grineer" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Pyrana = {
		Accuracy = 5,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 2.2, Puncture = 2.2, Slash = 17.6 },
				Falloff = { EndRange = 30, Reduction = 0.7273, StartRange = 15 },
				FireRate = 4.17,
				IsSilent = false,
				MaxSpread = 22,
				MinSpread = 18,
				Multishot = 12,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.025 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 0.95,
		ExilusPolarity = "Madurai",
		Family = "Pyrana",
		GripType = "GUN_ONE_HAND",
		Image = "Pyrana.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/SawnOffShotgun/TennoHandShotgun",
		Introduced = "13.6",
		Link = "Pyrana",
		Magazine = 10,
		Mastery = 12,
		MaxRank = 30,
		Name = "Pyrana",
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Pyrana Prime"] = {
		Accuracy = 6.1,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.2,
				Damage = { Impact = 1.92, Puncture = 1.92, Slash = 20.16 },
				Falloff = { EndRange = 36, Reduction = 0.75, StartRange = 18 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 19,
				MinSpread = 14,
				Multishot = 10,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.036 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 0.65,
		ExilusPolarity = "Naramon",
		Family = "Pyrana",
		GripType = "GUN_ONE_HAND",
		Image = "PyranaPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimePyrana/PrimePyranaPistol",
		Introduced = "23.0.3",
		Link = "Pyrana Prime",
		Magazine = 12,
		Mastery = 13,
		MaxRank = 30,
		Name = "Pyrana Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Quatz = {
		Accuracy = 40,
		AmmoMax = 504,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.13,
				CritMultiplier = 1.5,
				Damage = { Electricity = 11, Impact = 9, Puncture = 2, Slash = 7 },
				FireRate = 15,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.27 
			},
			{
				Accuracy = 90.9,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Burst",
				BurstCount = 4,
				BurstDelay = 0,
				CritChance = 0.27,
				CritMultiplier = 2.5,
				Damage = { Electricity = 11, Impact = 9, Puncture = 2, Slash = 7 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 1.2,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.19,
				Trigger = "Burst" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/Pistols/GrnAmphisPistol/GrnAmphisPistolInnateUpgrade" },
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Quatz",
		GripType = "GUN_ONE_HAND",
		Image = "Quatz.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnAmphisPistol/GrnAmphisPistol",
		Introduced = "25.4.0",
		Link = "Quatz",
		Magazine = 72,
		Mastery = 9,
		MaxRank = 30,
		Name = "Quatz",
		Reload = 2.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Trigger = "Auto / Burst",
		_TooltipAttackDisplay = 1 
	},
	["Rakta Ballistica"] = {
		Accuracy = 4,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				Accuracy = 28.6,
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Burst Shot",
				BurstCount = 4,
				BurstDelay = 0.05,
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 18.75, Puncture = 37.5, Slash = 18.75 },
				FireRate = 6.67,
				IsSilent = true,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.05,
				Trigger = "Burst" 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Charged Shot",
				ChargeTime = 1,
				CritChance = 0.2,
				CritMultiplier = 1.5,
				Damage = { Impact = 15, Puncture = 270, Slash = 15 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 50,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Charge" 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form",
				ChargeTime = 0.4,
				CritChance = 0.25,
				CritMultiplier = 2.2,
				Damage = { Slash = 734 },
				FireRate = 3.33,
				IncarnonCharges = 18,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 80,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.25,
				Trigger = "Charge" 
			} 
		},
		Class = "Crossbow",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Ballistica",
		GripType = "GUN_ONE_HAND",
		Image = "RaktaBallistica.png",
		IncarnonChargeGain = 1.5,
		IncarnonImage = "RaktaBallisticaIncarnon.png",
		InternalName = "/Lotus/Weapons/Syndicates/RedVeil/Pistols/RVBallistica",
		Introduced = "15.5",
		Link = "Rakta Ballistica",
		Magazine = 20,
		Mastery = 6,
		MaxRank = 30,
		Name = "Rakta Ballistica",
		Polarities = { "Vazarin", "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		SyndicateEffect = "Blight",
		Tradable = 1,
		Traits = { "Syndicate", "Red Veil" },
		Trigger = "Burst / Charge",
		Users = { "Red Veil Operatives" },
		_TooltipAttackDisplay = 2 
	},
	Regulators = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 25, Puncture = 12.5, Slash = 12.5 },
				FireRate = 14.8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 50,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "NO_AIM" },
		Conclave = true,
		Family = "Regulators",
		GripType = "DUAL_GUN_GUN",
		Image = "Regulators.png",
		InternalName = "/Lotus/Powersuits/Cowgirl/SlingerPistols",
		Introduced = "23.0",
		Link = "Regulators",
		Magazine = 0,
		MaxRank = 30,
		Name = "Regulators",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Mesa" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Regulators Prime"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 3,
				Damage = { Impact = 25, Puncture = 12.5, Slash = 12.5 },
				FireRate = 14.8,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 50,
				ShotType = "Hit-Scan",
				StatusChance = 0.1 
			} 
		},
		Class = "Exalted Weapon",
		CompatibilityTags = { "POWER_WEAPON", "NO_AIM" },
		Conclave = true,
		Family = "Regulators",
		GripType = "DUAL_GUN_GUN",
		Image = "RegulatorsPrime.png",
		InternalName = "/Lotus/Powersuits/Cowgirl/PrimeSlingerPistols",
		Introduced = "24.2.2",
		Link = "Regulators",
		Magazine = 0,
		MaxRank = 30,
		Name = "Regulators Prime",
		Polarities = { "Madurai", "Naramon", "Naramon" },
		Reload = 0,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		Users = { "Mesa Prime" },
		_IgnoreInMasteryCount = true,
		_TooltipAttackDisplay = 1 
	},
	["Riot-848"] = {
		Accuracy = 23.53,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Puncture = 12 },
				FireRate = 8,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 120,
				ShotType = "Projectile",
				StatusChance = 0.26 
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2.2,
				Damage = { Blast = 48 },
				Falloff = { EndRange = 1.5, Reduction = 0.5, StartRange = 0 },
				FireRate = 8,
				IsSilent = false,
				Multishot = 1,
				Range = 1.5,
				ShotType = "AoE",
				StatusChance = 0.26 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		Disposition = 1,
		ExilusPolarity = "",
		Family = "Riot-848",
		GripType = "GUN_ONE_HAND",
		Image = "Riot-848.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/1999EntHybridPistolWeapon/1999EntHybridPistolWeapon",
		Introduced = "38.5",
		Link = "Riot-848",
		Magazine = 16,
		Mastery = 14,
		MaxRank = 30,
		Name = "Riot-848",
		Polarities = { "Madurai" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 0,
		Traits = { "Tenno", "Entrati" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Sagek Prime"] = {
		Accuracy = 15.33,
		AmmoMax = 450,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Impact = 6.112, Puncture = 8.246, Slash = 11.642 },
				FireRate = 12.33,
				IsSilent = false,
				MaxSpread = 11.5,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.01 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = {  },
		Conclave = false,
		Disposition = 0.8,
		ExilusPolarity = "Naramon",
		Image = "SagekPrime.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnOrokinPistol/GrnOrokinPistol",
		Introduced = "41.0",
		Link = "Sagek Prime",
		Magazine = 75,
		Mastery = 14,
		MaxRank = 30,
		Name = "Sagek Prime",
		Polarities = { "Madurai", "Naramon" },
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 0,
		Traits = { "Prime" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Sancti Castanas"] = {
		Accuracy = 100,
		AmmoMax = 18,
		AmmoPickup = 4,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Mid-Flight Detonation",
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 300 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.34 
			},
			{
				AttackIndex = 2,
				AttackName = "Embedded Detonation",
				AttackParentIndex = 1,
				CritChance = 0.24,
				CritMultiplier = 2,
				Damage = { Electricity = 300 },
				Falloff = { EndRange = 3.6, Reduction = 0.4, StartRange = 0 },
				FireRate = 3.33,
				ForcedProcs = { "Electricity" },
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.6,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "DEPLOYABLE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Castanas",
		GripType = "DUAL_GUN_GUN",
		Image = "SanctiCastanas.png",
		InternalName = "/Lotus/Weapons/Syndicates/NewLoka/Pistols/NLCastanas",
		Introduced = "15.5",
		Link = "Sancti Castanas",
		Magazine = 2,
		Mastery = 10,
		MaxRank = 30,
		Name = "Sancti Castanas",
		Polarities = { "Madurai", "Madurai", "Vazarin" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		SyndicateEffect = "Purity",
		Tradable = 1,
		Traits = { "Syndicate", "New Loka" },
		Trigger = "Active",
		Users = { "New Loka Operatives" },
		_TooltipAttackDisplay = 1 
	},
	Scyotid = {
		Accuracy = 100,
		AmmoMax = 320,
		AmmoPickup = 80,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Auto",
				CritChance = 0.24,
				CritMultiplier = 2.4,
				Damage = { Puncture = 8, Toxin = 32 },
				FireRate = 2.4,
				IsSilent = true,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 4,
				PunchThrough = 1.6,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.18,
				Trigger = "Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Semi",
				AttackParentIndex = 1,
				CritChance = 0.08,
				CritMultiplier = 2.4,
				Damage = { Toxin = 40 },
				FireRate = 1.6,
				IsSilent = true,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "AoE",
				StatusChance = 0.32,
				Trigger = "Semi" 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = false,
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Scyotid",
		GripType = "DUAL_GUN_GUN",
		Image = "Scyotid.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/TnOraxiaFlechette/TnOraxiaFlechette",
		Introduced = "39",
		Link = "Scyotid",
		Magazine = 40,
		Mastery = 12,
		MaxRank = 30,
		Name = "Scyotid",
		Polarities = { "Naramon" },
		Reload = 1.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 0,
		Trigger = "Auto / Semi",
		_TooltipAttackDisplay = 1 
	},
	["Secura Dual Cestra"] = {
		Accuracy = 20,
		AmmoMax = 480,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.16,
				CritMultiplier = 1.6,
				Damage = { Impact = 5.6, Puncture = 22.4 },
				FireRate = 12.5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.28 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Naramon",
		Family = "Dual Cestra",
		GripType = "DUAL_GUN_GUN",
		Image = "SecuraDualCestra.png",
		InternalName = "/Lotus/Weapons/Syndicates/PerrinSequence/Pistols/PSDualCestra",
		Introduced = "15.5",
		Link = "Secura Dual Cestra",
		Magazine = 120,
		Mastery = 10,
		MaxRank = 30,
		Name = "Secura Dual Cestra",
		Polarities = { "Madurai", "Naramon" },
		Reload = 3.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Spool = 5,
		SyndicateEffect = "Sequence",
		Tradable = 1,
		Traits = { "Syndicate", "Perrin Sequence" },
		Trigger = "Auto-Spool",
		Users = { "The Perrin Sequence Operatives" },
		_TooltipAttackDisplay = 1 
	},
	Seer = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Impact = 33.67, Puncture = 33.67, Slash = 33.67 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.13 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.5,
		ExilusPolarity = "Madurai",
		Family = "Seer",
		GripType = "GUN_ONE_HAND",
		Image = "Seer.png",
		InternalName = "/Lotus/Weapons/Grineer/GrineerPistol/GrnScopedPistolPlayer",
		Introduced = "9.0",
		Link = "Seer",
		Magazine = 8,
		Mastery = 0,
		MaxRank = 30,
		Name = "Seer",
		Reload = 2.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Captain Vor" },
		_TooltipAttackDisplay = 1 
	},
	Sepulcrum = {
		Accuracy = 22.2,
		AmmoMax = 180,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Primary-Fire",
				BurstCount = 2,
				BurstDelay = 0,
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Impact = 9.6, Puncture = 26.88, Slash = 11.52 },
				FireRate = 1.83,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.14 
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				BurstCount = 2,
				BurstDelay = 0,
				CritChance = 0.3,
				CritMultiplier = 2.2,
				Damage = { Heat = 46 },
				Falloff = { EndRange = 1.6, Reduction = 0.2, StartRange = 0 },
				FireRate = 1.83,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.6,
				ShotType = "AoE",
				StatusChance = 0.14 
			},
			{
				Accuracy = 1.8,
				AmmoCost = 0,
				AttackIndex = 3,
				AttackName = "Lock-On Mode",
				CritChance = 0.38,
				CritMultiplier = 3,
				Damage = { Impact = 19.2, Puncture = 53.76, Slash = 23.04 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 60,
				MinSpread = 50,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.26 
			},
			{
				AttackIndex = 4,
				AttackName = "Lock-On Radial Attack",
				AttackParentIndex = 3,
				CritChance = 0.38,
				CritMultiplier = 3,
				Damage = { Heat = 480 },
				Falloff = { EndRange = 3, Reduction = 0.2, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3,
				ShotType = "AoE",
				StatusChance = 0.26 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "AOE" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Thanotech/ThanoPistol/ThanotechPistolWeaponInnateMod" },
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Sepulcrum",
		GripType = "GUN_ONE_HAND",
		Image = "Sepulcrum.png",
		InternalName = "/Lotus/Weapons/Thanotech/ThanoPistol/ThanotechPistol",
		Introduced = "29",
		Link = "Sepulcrum",
		Magazine = 90,
		Mastery = 14,
		MaxRank = 30,
		Name = "Sepulcrum",
		Polarities = {  },
		Reload = 4,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Entrati" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Sicarus = {
		Accuracy = 20,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.04,
				CritChance = 0.16,
				CritMultiplier = 2,
				Damage = { Impact = 21, Puncture = 4.5, Slash = 4.5 },
				FireRate = 3.5,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.06 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 3,
				BurstDelay = 0.04,
				CritChance = 0.2,
				CritMultiplier = 3,
				Damage = { Impact = 28, Puncture = 6, Slash = 6 },
				FireRate = 3.5,
				IncarnonCharges = 120,
				IsSilent = false,
				MaxSpread = 10,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Sicarus",
		GripType = "GUN_ONE_HAND",
		Image = "Sicarus.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "SicarusIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/BurstPistol",
		Introduced = "Vanilla",
		Link = "Sicarus",
		Magazine = 15,
		Mastery = 3,
		MaxRank = 30,
		Name = "Sicarus",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	["Sicarus Prime"] = {
		Accuracy = 25,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				BurstCount = 3,
				BurstDelay = 0.04,
				CritChance = 0.25,
				CritMultiplier = 2,
				Damage = { Impact = 20, Puncture = 15, Slash = 15 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
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
				AttackName = "Incarnon Form",
				BurstCount = 3,
				BurstDelay = 0.04,
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 24, Puncture = 18, Slash = 18 },
				FireRate = 5,
				IncarnonCharges = 120,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.2 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Sicarus",
		GripType = "GUN_ONE_HAND",
		Image = "SicarusPrime.png",
		IncarnonChargeGain = 10,
		IncarnonImage = "SicarusPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeSicarus/PrimeSicarusPistol",
		Introduced = "11.0",
		Link = "Sicarus Prime",
		Magazine = 24,
		Mastery = 14,
		MaxRank = 30,
		Name = "Sicarus Prime",
		Polarities = { "Madurai" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Burst",
		_TooltipAttackDisplay = 1 
	},
	Sonicor = {
		Accuracy = 100,
		AmmoMax = 150,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Projectile Impact",
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Impact = 150 },
				Falloff = { EndRange = 20, Reduction = 0.8333, StartRange = 0 },
				FireRate = 1.25,
				ForcedProcs = { "Ragdoll" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 15,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0 
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 50 },
				FireRate = 1.25,
				ForcedProcs = { "Impact", "Ragdoll" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.25 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.15,
		ExilusPolarity = "Naramon",
		Family = "Sonicor",
		GripType = "GUN_ONE_HAND",
		Image = "Sonicor.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpAirPistol/CrpAirPistolArray",
		Introduced = "17.5",
		Link = "Sonicor",
		Magazine = 15,
		Mastery = 2,
		MaxRank = 30,
		Name = "Sonicor",
		Polarities = { "Vazarin" },
		Reload = 3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Semi-Auto",
		Users = { "Derim Zahn" },
		_TooltipAttackDisplay = 1 
	},
	Spectra = {
		Accuracy = 100,
		AmmoMax = 360,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Puncture = 7.56, Slash = 10.44 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 18,
				ShotType = "Hit-Scan",
				StatusChance = 0.22 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		Disposition = 1.49,
		ExilusPolarity = "Madurai",
		Family = "Spectra",
		GripType = "GUN_ONE_HAND",
		Image = "Spectra.png",
		InternalName = "/Lotus/Weapons/ClanTech/Energy/CrpLaserPistol",
		Introduced = "9.0",
		Link = "Spectra",
		Magazine = 60,
		Mastery = 4,
		MaxRank = 30,
		Name = "Spectra",
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Spectra Vandal"] = {
		Accuracy = 100,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Puncture = 9.24, Slash = 12.76 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0.5,
				Range = 22,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = false,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Spectra",
		GripType = "GUN_ONE_HAND",
		Image = "SpectraVandal.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CorpusModularPistol/Vandal/CrpLaserPistolVandal",
		Introduced = "25.0",
		Link = "Spectra Vandal",
		Magazine = 80,
		Mastery = 10,
		MaxRank = 30,
		Name = "Spectra Vandal",
		Polarities = {  },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Corpus", "Vandal" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	Spira = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 2,
				Damage = { Impact = 8.2, Puncture = 49.2, Slash = 24.6 },
				FireRate = 2.5,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.08 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Spira",
		GripType = "DUAL_GUN_GUN",
		Image = "Spira.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/LiDagger/LiDagger",
		Introduced = "17.4.5",
		Link = "Spira",
		Magazine = 10,
		Mastery = 8,
		MaxRank = 30,
		Name = "Spira",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Spira Prime"] = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.3,
				CritMultiplier = 3,
				Damage = { Impact = 6, Puncture = 48, Slash = 6 },
				FireRate = 3.33,
				IsSilent = true,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 70,
				ShotType = "Projectile",
				StatusChance = 0.14 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "THROWN" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Spira",
		GripType = "DUAL_GUN_GUN",
		Image = "SpiraPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/PrimeLiDagger/PrimeLiDagger",
		Introduced = "18.4.12",
		Link = "Spira Prime",
		Magazine = 12,
		Mastery = 10,
		MaxRank = 30,
		Name = "Spira Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 0.75,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Staticor = {
		Accuracy = 16.7,
		AmmoMax = 288,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Uncharged Projectile",
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Radiation = 44 },
				FireRate = 3.5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 60,
				ShotType = "Projectile",
				StatusChance = 0.28 
			},
			{
				AttackIndex = 2,
				AttackName = "Uncharged Explosion",
				AttackParentIndex = 1,
				CritChance = 0,
				CritMultiplier = 1,
				Damage = { Radiation = 88 },
				Falloff = { EndRange = 2.4, Reduction = 0.3, StartRange = 0 },
				FireRate = 3.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2.4,
				ShotType = "AoE",
				StatusChance = 0.28 
			},
			{
				AmmoCost = 5,
				AttackIndex = 3,
				AttackName = "Fully Charged Projectile",
				ChargeTime = 1,
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Radiation = 44 },
				FireRate = 3.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 40,
				ShotType = "Projectile",
				StatusChance = 0.28 
			},
			{
				AttackIndex = 4,
				AttackName = "Fully Charged Explosion",
				AttackParentIndex = 3,
				ChargeTime = 1,
				CritChance = 0.14,
				CritMultiplier = 2.2,
				Damage = { Radiation = 106 },
				Falloff = { EndRange = 9.6, Reduction = 0.9, StartRange = 0 },
				FireRate = 3.5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 9.6,
				ShotType = "AoE",
				StatusChance = 0.28 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 0.9,
		ExilusPolarity = "Madurai",
		Family = "Staticor",
		GripType = "GUN_ONE_HAND",
		Image = "Staticor.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpElectroMag/CrpElectroMag",
		Introduced = "18.4.7",
		Link = "Staticor",
		Magazine = 48,
		Mastery = 10,
		MaxRank = 30,
		Name = "Staticor",
		Polarities = { "Naramon" },
		Reload = 1.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Corpus" },
		Trigger = "Charge",
		_TooltipAttackDisplay = 4 
	},
	Stubba = {
		Accuracy = 16,
		AmmoMax = 399,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.23,
				CritMultiplier = 1.9,
				Damage = { Impact = 14.19, Puncture = 3.3, Slash = 15.51 },
				FireRate = 6.33,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.13 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Madurai",
		Family = "Stubba",
		GripType = "GUN_ONE_HAND",
		Image = "Stubba.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnUzi/GrnUziWeapon",
		Introduced = "22",
		Link = "Stubba",
		Magazine = 57,
		Mastery = 7,
		MaxRank = 30,
		Name = "Stubba",
		Reload = 1.3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Stug = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Blob Embed",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Corrosive = 4 },
				Falloff = { EndRange = 2, Reduction = 1, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotSpeed = 35,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AttackIndex = 2,
				AttackName = "Blob Explosion",
				CritChance = 0.05,
				CritMultiplier = 1.5,
				Damage = { Corrosive = 75 },
				ExplosionDelay = 1.5,
				Falloff = { EndRange = 0.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.3,
				ShotType = "AoE",
				StatusChance = 0.1 
			},
			{
				AmmoCost = 1,
				AttackIndex = 3,
				AttackName = "Incarnon Form Blob Embed",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Corrosive = 50 },
				Falloff = { EndRange = 2, Reduction = 1, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotSpeed = 35,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 4,
				AttackName = "Incarnon Form Blob Explosion",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Corrosive = 200 },
				ExplosionDelay = 1.5,
				Falloff = { EndRange = 0.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 0.3,
				ShotType = "AoE",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 5,
				AttackName = "Incarnon Form Bounce Explosion",
				CritChance = 0.15,
				CritMultiplier = 2,
				Damage = { Corrosive = 200 },
				Falloff = { EndRange = 1.5, Reduction = 0, StartRange = 0 },
				FireRate = 4,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 1.5,
				ShotType = "AoE",
				StatusChance = 0.2 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = true,
		Disposition = 1.48,
		ExilusPolarity = "Madurai",
		Family = "Stug",
		GripType = "GUN_ONE_HAND",
		Image = "Stug.png",
		IncarnonImage = "StugIncarnon.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrineerCrossbow/GrineerGooGun",
		Introduced = "11.5",
		Link = "Stug",
		Magazine = 20,
		Mastery = 2,
		MaxRank = 30,
		Name = "Stug",
		Polarities = { "Vazarin" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto / Charge",
		Users = { "Artificer" },
		_TooltipAttackDisplay = 2 
	},
	["Synoid Gammacor"] = {
		Accuracy = 100,
		AmmoMax = 400,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Magnetic = 21 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 40,
				ShotType = "Hit-Scan",
				StatusChance = 0.28 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 100 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IncarnonCharges = 15,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 0,
				ShotType = "Projectile",
				StatusChance = 0.28,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				AttackParentIndex = 2,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Cold = 800 },
				ExplosionDelay = 1.2,
				Falloff = { EndRange = 5, Reduction = 0.3, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Cold" },
				IsSilent = false,
				Multishot = 1,
				Range = 5,
				ShotType = "AoE",
				StatusChance = 0.28,
				Trigger = "Semi-Auto" 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM" },
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Gammacor",
		GripType = "GUN_ONE_HAND",
		Image = "SynoidGammacor.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "SynoidGammacorIncarnon.png",
		InternalName = "/Lotus/Weapons/Syndicates/CephalonSuda/Pistols/CSSynoidGammacor",
		Introduced = "15.5",
		Link = "Synoid Gammacor",
		Magazine = 80,
		Mastery = 7,
		MaxRank = 30,
		Name = "Synoid Gammacor",
		Polarities = { "Vazarin", "Naramon" },
		Reload = 1.8,
		SellPrice = 5000,
		Slot = "Secondary",
		SyndicateEffect = "Entropy",
		Tradable = 1,
		Traits = { "Syndicate", "Cephalon Suda" },
		Trigger = "Held",
		Users = { "Cephalon Suda Operatives" },
		_TooltipAttackDisplay = 1 
	},
	Talons = {
		Accuracy = 100,
		AmmoMax = 12,
		AmmoPickup = 4,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Mid-Flight Detonation",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 120 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotSpeed = 60,
				ShotType = "AoE",
				StatusChance = 0.26 
			},
			{
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Embedded Detonation",
				CritChance = 0.22,
				CritMultiplier = 2,
				Damage = { Blast = 250 },
				Falloff = { EndRange = 4, Reduction = 0.5, StartRange = 0 },
				FireRate = 3.33,
				ForcedProcs = { "Puncture", "Ragdoll" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Range = 4,
				ShotSpeed = 60,
				ShotType = "AoE",
				StatusChance = 0.1 
			} 
		},
		Class = "Thrown",
		CompatibilityTags = { "PROJECTILE", "DEPLOYABLE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.44,
		ExilusPolarity = "Madurai",
		Family = "Talons",
		GripType = "DUAL_GUN_GUN",
		Image = "Talons.png",
		InternalName = "/Lotus/Weapons/Tenno/ThrowingWeapons/U18ThrowingKnives/U18throwingknives",
		Introduced = "18.0",
		Link = "Talons",
		Magazine = 4,
		Mastery = 8,
		MaxRank = 30,
		Name = "Talons",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Active",
		_TooltipAttackDisplay = 2 
	},
	["Telos Akbolto"] = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.13,
				CritMultiplier = 2,
				Damage = { Impact = 7, Puncture = 63 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 7,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.29 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Akbolto",
		GripType = "DUAL_GUN_GUN",
		Image = "TelosAkbolto.png",
		InternalName = "/Lotus/Weapons/Syndicates/ArbitersOfHexis/Pistols/AHAkbolto",
		Introduced = "15.5",
		Link = "Telos Akbolto",
		Magazine = 30,
		Mastery = 11,
		MaxRank = 30,
		Name = "Telos Akbolto",
		Polarities = { "Vazarin", "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		SyndicateEffect = "Truth",
		Tradable = 1,
		Traits = { "Syndicate", "Arbiters of Hexis" },
		Trigger = "Semi-Auto",
		Users = { "Arbiters of Hexis Operatives" },
		_TooltipAttackDisplay = 1 
	},
	["Tenet Cycron"] = {
		Accuracy = 100,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 0.5,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Heat = 22 },
				FireRate = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				Range = 28,
				ShotType = "Hit-Scan",
				StatusChance = 0.4 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.7,
		ExilusPolarity = "Naramon",
		Family = "Cycron",
		GripType = "GUN_ONE_HAND",
		Image = "TenetCycron.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Secondary/CrpBECycron/CrpBECycron",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Cycron",
		Magazine = 40,
		Mastery = 14,
		MaxRank = 40,
		Name = "Tenet Cycron",
		Polarities = { "Naramon", "Naramon" },
		Reload = 1.5,
		ReloadDelay = 0.5,
		ReloadRate = 40,
		ReloadStyle = "Regenerate",
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Held",
		_TooltipAttackDisplay = 1 
	},
	["Tenet Detron"] = {
		Accuracy = 20,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Radiation = 26 },
				Falloff = { EndRange = 52, Reduction = 0.3077, StartRange = 26 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 4,
				Multishot = 10,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Burst Shot",
				BurstDelay = 0.12,
				CritChance = 0.18,
				CritMultiplier = 2,
				Damage = { Radiation = 26 },
				Falloff = { EndRange = 52, Reduction = 0.3077, StartRange = 26 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 4,
				Multishot = 10,
				PunchThrough = 0,
				ShotSpeed = 150,
				ShotType = "Projectile",
				StatusChance = 0.1,
				Trigger = "Mag Burst" 
			} 
		},
		Class = "Shotgun Sidearm",
		CompatibilityTags = { "PROJECTILE", "SECONDARYSHOTGUN" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 1,
		ExilusPolarity = "Madurai",
		Family = "Detron",
		GripType = "GUN_ONE_HAND",
		Image = "TenetDetron.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Secondary/CrpBEDetron/CrpBEDetron",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Detron",
		Magazine = 6,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Detron",
		Polarities = {  },
		Reload = 1.05,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Semi-Auto / Mag Burst",
		_TooltipAttackDisplay = 1 
	},
	["Tenet Diplos"] = {
		Accuracy = 100,
		AmmoMax = 460,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.36,
				CritMultiplier = 2.2,
				Damage = { Impact = 11.2, Puncture = 9, Slash = 7.8 },
				FireRate = 9.67,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 1,
				ShotSpeed = 50,
				ShotType = "Projectile",
				StatusChance = 0.14,
				Trigger = "Auto" 
			},
			{
				Accuracy = 62.5,
				AmmoCost = 2,
				AttackIndex = 2,
				AttackName = "Lock-on Mode",
				BurstDelay = 0.06,
				BurstReloadDelay = 0.1,
				CritChance = 0.36,
				CritMultiplier = 2.2,
				Damage = { Impact = 11.2, Puncture = 9, Slash = 7.8 },
				FireRate = 1,
				IsSilent = false,
				MaxSpread = 2,
				MinSpread = 1.2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 60,
				ShotSpeed = 200,
				ShotType = "Projectile",
				StatusChance = 0.14,
				Trigger = "Burst" 
			} 
		},
		Class = "Dual Pistols",
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Corpus/Pistols/CrpBriefcaseAkimbo/CrpBriefcaseAkimboInnateMod" 
		},
		Disposition = 0.75,
		ExilusPolarity = "Madurai",
		Family = "Tenet Diplos",
		GripType = "DUAL_GUN_GUN",
		Image = "TenetDiplos.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpBriefcaseAkimbo/CrpBriefcaseAkimboPistol",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Diplos",
		Magazine = 92,
		Mastery = 16,
		MaxRank = 40,
		Name = "Tenet Diplos",
		Polarities = { "Madurai" },
		Reload = 2.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Auto / Burst",
		_TooltipAttackDisplay = 1 
	},
	["Tenet Plinx"] = {
		Accuracy = 50,
		AmmoMax = 0,
		AmmoPickup = 0,
		AmmoType = "None",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Semi-Auto",
				CritChance = 0.44,
				CritMultiplier = 3,
				Damage = { Heat = 30, Puncture = 40 },
				FireRate = 3.33,
				IsSilent = false,
				MaxSpread = 3,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 100,
				ShotType = "Hit-Scan",
				StatusChance = 0.12 
			},
			{
				Accuracy = 100,
				AmmoCost = 10,
				AttackIndex = 2,
				AttackName = "Alt-Fire",
				ChargeTime = 0.8,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Impact = 100 },
				FireRate = 1,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				Reload = 2.5,
				ReloadDelay = 2,
				ReloadRate = 20,
				ShotSpeed = 100,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 3,
				AttackName = "Alt-Fire AoE",
				AttackParentIndex = 2,
				CritChance = 0.4,
				CritMultiplier = 3,
				Damage = { Radiation = 100 },
				EmbedDelay = 0.8,
				Falloff = { EndRange = 6, Reduction = 0.4, StartRange = 0 },
				FireRate = 1,
				ForcedProcs = { "Ragdoll" },
				IsSilent = false,
				Multishot = 1,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE", "BATTERY" },
		Conclave = false,
		DefaultUpgrades = { "/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod" },
		Disposition = 0.8,
		ExilusPolarity = "Madurai",
		Family = "Plinx",
		GripType = "GUN_ONE_HAND",
		Image = "TenetPlinx.png",
		InternalName = "/Lotus/Weapons/Corpus/BoardExec/Secondary/CrpBEPlinx/CrpBEPlinxWeapon",
		Introduced = "32.2",
		IsLichWeapon = true,
		Link = "Tenet Plinx",
		Magazine = 10,
		Mastery = 6,
		MaxRank = 40,
		Name = "Tenet Plinx",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1.3,
		ReloadDelay = 0.8,
		ReloadRate = 20,
		ReloadStyle = "Regenerate",
		SellPrice = 2500,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Semi / Charge",
		_TooltipAttackDisplay = 1 
	},
	["Tenet Spirex"] = {
		Accuracy = 12.5,
		AmmoMax = 80,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Slug Impact",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Heat = 60, Impact = 40, Puncture = 20 },
				FireRate = 2.33,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 9,
				MinSpread = 7,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 260,
				ShotType = "Projectile",
				StatusChance = 0.4 
			},
			{
				AttackIndex = 2,
				AttackName = "Explosion",
				AttackParentIndex = 1,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Heat = 80 },
				Falloff = { EndRange = 2, Reduction = 0.2, StartRange = 0 },
				FireRate = 2.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 2,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "BEAM", "AOE" },
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Grineer/KuvaLich/Upgrades/InnateDamageRandomMod",
			"/Lotus/Weapons/Corpus/Pistols/CrpIgniterPistol/CrpIgniterPistolInnateMod" 
		},
		Disposition = 1.05,
		ExilusPolarity = "None",
		Family = "Tenet Spirex",
		GripType = "GUN_ONE_HAND",
		Image = "TenetSpirex.png",
		InternalName = "/Lotus/Weapons/Corpus/Pistols/CrpIgniterPistol/CrpIgniterPistol",
		Introduced = "30.5",
		IsLichWeapon = true,
		Link = "Tenet Spirex",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 40,
		Name = "Tenet Spirex",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.4,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 3,
		Traits = { "Corpus", "Tenet" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Grakatas"] = {
		Accuracy = 28.6,
		AmmoMax = 1200,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 2,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.25,
				CritMultiplier = 2.7,
				Damage = { Impact = 4, Puncture = 3.33, Slash = 2.67 },
				FireRate = 20,
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2,
				Multishot = 2,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.165 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Madurai",
		Family = "Twin Grakatas",
		GripType = "DUAL_GUN_GUN",
		Image = "TwinGrakatas.png",
		InternalName = "/Lotus/Weapons/Grineer/LongGuns/GrineerAssaultRifle/TwinGrakatas",
		Introduced = "17.0",
		Link = "Twin Grakatas",
		Magazine = 120,
		Mastery = 9,
		MaxRank = 30,
		Name = "Twin Grakatas",
		Polarities = { "Naramon" },
		Reload = 3,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Clem" },
		_TooltipAttackDisplay = 1 
	},
	["Twin Gremlins"] = {
		Accuracy = 16.7,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 12.33, Puncture = 12.33, Slash = 12.33 },
				FireRate = 5,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 4,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 90,
				ShotType = "Projectile",
				StatusChance = 0.15 
			} 
		},
		Class = "Dual Pistols",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Twin Gremlins",
		GripType = "DUAL_GUN_GUN",
		Image = "TwinGremlins.png",
		InternalName = "/Lotus/Weapons/Grineer/GrineerPistol/GrineerAkimboPistol",
		Introduced = "9.5",
		Link = "Twin Gremlins",
		Magazine = 30,
		Mastery = 5,
		MaxRank = 30,
		Name = "Twin Gremlins",
		Polarities = { "Madurai" },
		Reload = 1.1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Kohmak"] = {
		Accuracy = 5.7,
		AmmoMax = 240,
		AmmoPickup = 30,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Single Pellet",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 24, Reduction = 0.8333, StartRange = 12 },
				FireRate = 1.334,
				IsSilent = false,
				MaxSpread = 25,
				MinSpread = 10,
				Multishot = 1,
				PunchThrough = 1.5,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.69 
			},
			{
				AmmoCost = 1.67,
				AttackIndex = 2,
				AttackName = "Fully Spooled",
				CritChance = 0.11,
				CritMultiplier = 2,
				Damage = { Impact = 6, Puncture = 6, Slash = 18 },
				Falloff = { EndRange = 24, Reduction = 0.8333, StartRange = 12 },
				FireRate = 6.67,
				IsSilent = false,
				MaxSpread = 25,
				MinSpread = 10,
				Multishot = 5,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.138 
			} 
		},
		Class = "Dual Shotguns",
		CompatibilityTags = { "SECONDARYSHOTGUN" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Naramon",
		Family = "Twin Kohmak",
		GripType = "GUN_ONE_HAND",
		Image = "TwinKohmak.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnDWUniques/GrnTwinKohmaks",
		Introduced = "16.0",
		Link = "Twin Kohmak",
		Magazine = 80,
		Mastery = 10,
		MaxRank = 30,
		Name = "Twin Kohmak",
		Polarities = { "Vazarin" },
		Reload = 2.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Spool = 11,
		Traits = { "Grineer" },
		Trigger = "Auto-Spool",
		_TooltipAttackDisplay = 2 
	},
	["Twin Rogga"] = {
		Accuracy = 8,
		AmmoMax = 120,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.1,
				CritMultiplier = 2,
				Damage = { Impact = 18.8, Puncture = 23.5, Slash = 4.7 },
				Falloff = { EndRange = 20, Reduction = 0.7872, StartRange = 10 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 10,
				Multishot = 15,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.066 
			} 
		},
		Class = "Dual Shotguns",
		CompatibilityTags = { "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.3,
		ExilusPolarity = "Madurai",
		Family = "Twin Rogga",
		GripType = "GUN_ONE_HAND",
		Image = "TwinRogga.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/GrnQueenGuardDualPistol/GrnQueenGuardDualPistols",
		Introduced = "19.0",
		Link = "Twin Rogga",
		Magazine = 2,
		Mastery = 9,
		MaxRank = 30,
		Name = "Twin Rogga",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.5,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Semi-Auto",
		Users = { "Kuva Guardian" },
		_TooltipAttackDisplay = 1 
	},
	["Twin Vipers"] = {
		Accuracy = 15.4,
		AmmoMax = 420,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 10.2, Puncture = 1.7, Slash = 5.1 },
				FireRate = 25,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.11 
			} 
		},
		Class = "Dual Pistols",
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Twin Vipers",
		GripType = "DUAL_GUN_GUN",
		Image = "TwinVipers.png",
		InternalName = "/Lotus/Weapons/Tenno/Akimbo/AkimboViperPistols",
		Introduced = "7.7.3",
		Link = "Twin Vipers",
		Magazine = 28,
		Mastery = 5,
		MaxRank = 30,
		Name = "Twin Vipers",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Twin Vipers Wraith"] = {
		Accuracy = 11.1,
		AmmoMax = 440,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Impact = 14.4, Puncture = 1.8, Slash = 1.8 },
				FireRate = 25,
				IsSilent = false,
				MaxSpread = 13,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09 
			} 
		},
		Class = "Dual Pistols",
		CodexSecret = true,
		Conclave = true,
		Disposition = 1.41,
		ExilusPolarity = "Madurai",
		Family = "Twin Vipers",
		GripType = "DUAL_GUN_GUN",
		Image = "TwinVipersWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/WraithTwinVipers/WraithTwinVipers",
		Introduced = "11.5",
		Link = "Twin Vipers Wraith",
		Magazine = 40,
		Mastery = 7,
		MaxRank = 30,
		Name = "Twin Vipers Wraith",
		Polarities = { "Naramon" },
		Reload = 2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Wraith", "Invasion Reward", "Grineer" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Tysis = {
		Accuracy = 100,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Impact = 9, Puncture = 23, Slash = 17 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 75,
				ShotType = "Projectile",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 2,
				AttackName = "Corrosive DoT",
				AttackParentIndex = 1,
				CritChance = 0.03,
				CritMultiplier = 1.5,
				Damage = { Corrosive = 27 },
				EffectDuration = 2,
				FireRate = 0,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "DoT",
				StatusChance = 0.5 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE" },
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Madurai",
		Family = "Tysis",
		GripType = "GUN_ONE_HAND",
		Image = "Tysis.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfestedDartPistol/InfestedDartPistol",
		Introduced = "11.7",
		Link = "Tysis",
		Magazine = 11,
		Mastery = 9,
		MaxRank = 30,
		Name = "Tysis",
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	Vasto = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.8,
				Damage = { Impact = 22.5, Puncture = 22.5, Slash = 45 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.08 
			},
			{
				Accuracy = 4,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 6,
				BurstDelay = 0.1,
				CritChance = 0.3,
				CritMultiplier = 2.8,
				Damage = { Impact = 7.5, Puncture = 7.5, Slash = 15 },
				Falloff = { EndRange = 32, Reduction = 0.9667, StartRange = 16 },
				FireRate = 2.5,
				IncarnonCharges = 24,
				IsSilent = false,
				MaxSpread = 35,
				MinSpread = 15,
				Multishot = 6,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0267,
				Trigger = "Burst" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Vasto",
		GripType = "GUN_ONE_HAND",
		Image = "Vasto.png",
		IncarnonChargeGain = 3,
		IncarnonImage = "VastoIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistol/RevolverPistol",
		Introduced = "9.3",
		Link = "Vasto",
		Magazine = 6,
		Mastery = 4,
		MaxRank = 30,
		Name = "Vasto",
		Polarities = { "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vasto Prime"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.22,
				CritMultiplier = 2.4,
				Damage = { Impact = 16.5, Puncture = 16.5, Slash = 77 },
				FireRate = 2.5,
				IsSilent = false,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22 
			},
			{
				Accuracy = 4,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				BurstCount = 6,
				BurstDelay = 0.1,
				CritChance = 0.3,
				CritMultiplier = 3.2,
				Damage = { Impact = 10.5, Puncture = 10.5, Slash = 49 },
				Falloff = { EndRange = 32, Reduction = 0.9857, StartRange = 16 },
				FireRate = 2.5,
				IncarnonCharges = 24,
				IsSilent = false,
				MaxSpread = 35,
				MinSpread = 15,
				Multishot = 6,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.0667,
				Trigger = "Burst" 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.35,
		ExilusPolarity = "Naramon",
		Family = "Vasto",
		GripType = "GUN_ONE_HAND",
		Image = "VastoPrime.png",
		IncarnonChargeGain = 3,
		IncarnonImage = "VastoPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeVasto/PrimeVastoPistol",
		Introduced = "15.7",
		Link = "Vasto Prime",
		Magazine = 6,
		Mastery = 10,
		MaxRank = 30,
		Name = "Vasto Prime",
		Polarities = { "Madurai", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Vaulted" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vaykor Marelok"] = {
		Accuracy = 10,
		AmmoMax = 210,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.2,
				CritMultiplier = 1.5,
				Damage = { Impact = 96, Puncture = 16, Slash = 48 },
				FireRate = 2,
				IsSilent = false,
				MaxSpread = 15,
				MinSpread = 5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.35 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Marelok",
		GripType = "GUN_ONE_HAND",
		Image = "VaykorMarelok.png",
		InternalName = "/Lotus/Weapons/Syndicates/SteelMeridian/Pistols/SMMarelok",
		Introduced = "15.5",
		Link = "Vaykor Marelok",
		Magazine = 10,
		Mastery = 10,
		MaxRank = 30,
		Name = "Vaykor Marelok",
		Polarities = { "Madurai", "Vazarin" },
		Reload = 1.667,
		SellPrice = 5000,
		Slot = "Secondary",
		SyndicateEffect = "Justice",
		Tradable = 1,
		Traits = { "Syndicate", "Steel Meridian" },
		Trigger = "Semi-Auto",
		Users = { "Steel Meridian Operatives" },
		_TooltipAttackDisplay = 1 
	},
	Velox = {
		Accuracy = 25,
		AmmoMax = 434,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 1.8,
				Damage = { Impact = 4.32, Puncture = 8.16, Slash = 11.52 },
				FireRate = 15,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.22,
				Trigger = "Auto" 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskAmmoEfficiencyMod",
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskAmmoEfficiencySignatureMod",
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskReloadFromEmptyMod" 
		},
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Velox",
		GripType = "GUN_ONE_HAND",
		Image = "Velox.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskSmgPistol",
		Introduced = "28",
		Link = "Velox",
		Magazine = 62,
		Mastery = 8,
		MaxRank = 30,
		Name = "Velox",
		Polarities = { "Madurai", "Madurai" },
		Reload = 2.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Velox Prime"] = {
		Accuracy = 25,
		AmmoMax = 520,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.14,
				CritMultiplier = 2,
				Damage = { Impact = 6.48, Puncture = 7.56, Slash = 12.96 },
				FireRate = 17,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 2,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.32,
				Trigger = "Auto" 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		DefaultUpgrades = {
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskAmmoEfficiencyMod",
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskAmmoEfficiencySignatureMod",
			"/Lotus/Weapons/Tenno/Pistols/TnOdaliskSmg/TnOdaliskReloadFromEmptyMod" 
		},
		Disposition = 0.85,
		ExilusPolarity = "Madurai",
		Family = "Velox",
		GripType = "GUN_ONE_HAND",
		Image = "VeloxPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeVelox/PrimeVeloxPistol",
		Introduced = "35.5.9",
		Link = "Velox Prime",
		Magazine = 70,
		Mastery = 13,
		MaxRank = 30,
		Name = "Velox Prime",
		Polarities = { "Madurai", "Madurai", "Naramon" },
		Reload = 2.6,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Tenno" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	["Vesper 77"] = {
		Accuracy = 16,
		AmmoMax = 210,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.24,
				CritMultiplier = 2.6,
				Damage = { Impact = 72, Puncture = 108 },
				FireRate = 2.08,
				IsSilent = true,
				MaxSpread = 12,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		Disposition = 0.8,
		ExilusPolarity = "",
		Family = "Vesper 77",
		GripType = "GUN_ONE_HAND",
		Image = "Vesper77.png",
		InternalName = "/Lotus/Weapons/Lasria/LasSilencedPistol/LasSilencedPistolWeapon",
		Introduced = "38.0",
		Link = "Vesper 77",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Vesper 77",
		Polarities = { "Madurai", "Naramon" },
		Reload = 2.35,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 4,
		Traits = {  },
		Trigger = "Semi-Auto",
		Users = { "Arthur", "Velimir" },
		_TooltipAttackDisplay = 1 
	},
	Viper = {
		Accuracy = 15.4,
		AmmoMax = 420,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.15,
				CritMultiplier = 1.5,
				Damage = { Impact = 10.2, Puncture = 1.7, Slash = 5.1 },
				FireRate = 14.38,
				IsSilent = false,
				MaxSpread = 11.5,
				MinSpread = 1.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.11 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.45,
		ExilusPolarity = "Naramon",
		Family = "Viper",
		GripType = "GUN_ONE_HAND",
		Image = "Viper.png",
		InternalName = "/Lotus/Weapons/Grineer/GrineerPistol/GrineerLightPistol",
		Introduced = "7.0",
		Link = "Viper",
		Magazine = 14,
		Mastery = 4,
		MaxRank = 30,
		Name = "Viper",
		Polarities = { "Naramon" },
		Reload = 0.7,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Grineer" },
		Trigger = "Auto",
		Users = { "Shield Lancer", "Seeker" },
		_TooltipAttackDisplay = 1 
	},
	["Viper Wraith"] = {
		Accuracy = 28.6,
		AmmoMax = 420,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.19,
				CritMultiplier = 2,
				Damage = { Impact = 14.4, Puncture = 1.8, Slash = 1.8 },
				FireRate = 14.38,
				IsSilent = false,
				MaxSpread = 6,
				MinSpread = 1,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.09 
			} 
		},
		Class = "Pistol",
		CodexSecret = true,
		Conclave = true,
		Disposition = 1.4,
		ExilusPolarity = "Naramon",
		Family = "Viper",
		GripType = "GUN_ONE_HAND",
		Image = "ViperWraith.png",
		InternalName = "/Lotus/Weapons/Grineer/Pistols/WraithSingleViper/WraithSingleViper",
		Introduced = "22.8.4",
		Link = "Viper Wraith",
		Magazine = 20,
		Mastery = 4,
		MaxRank = 30,
		Name = "Viper Wraith",
		Polarities = { "Naramon" },
		Reload = 0.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 1,
		Traits = { "Grineer", "Wraith", "Baro" },
		Trigger = "Auto",
		_TooltipAttackDisplay = 1 
	},
	Zakti = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Dart Impact",
				CritChance = 0.02,
				CritMultiplier = 1.5,
				Damage = { Impact = 12, Puncture = 18 },
				FireRate = 5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 80,
				ShotType = "Projectile",
				StatusChance = 0.2 
			},
			{
				AttackIndex = 2,
				AttackName = "Gas Cloud",
				AttackParentIndex = 1,
				CritChance = 0.02,
				CritMultiplier = 1.5,
				Damage = { Gas = 80 },
				Falloff = { EndRange = 3.5, Reduction = 0, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.5,
				ShotType = "AoE",
				StatusChance = 0.2 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE", "SINGLESHOT" },
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Zakti",
		GripType = "GUN_ONE_HAND",
		Image = "Zakti.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/TnGuandoPistol/TnGuandoPistolGun",
		Introduced = "21.1",
		Link = "Zakti",
		Magazine = 3,
		Mastery = 10,
		MaxRank = 30,
		Name = "Zakti",
		Polarities = { "Naramon", "Naramon" },
		Reload = 0.8,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Tenno" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2 
	},
	["Zakti Prime"] = {
		Accuracy = 26.7,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 1.8,
				Damage = { Impact = 12, Puncture = 18 },
				FireRate = 5,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 5,
				MinSpread = 2.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 140,
				ShotType = "Projectile",
				StatusChance = 0.42,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Gas Cloud",
				AttackParentIndex = 1,
				CritChance = 0.08,
				CritMultiplier = 1.8,
				Damage = { Gas = 100 },
				Falloff = { EndRange = 3.8, Reduction = 0, StartRange = 0 },
				FireRate = 5,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.8,
				ShotType = "AoE",
				StatusChance = 0.42 
			} 
		},
		Class = "Pistol",
		CompatibilityTags = { "PROJECTILE", "AOE" },
		Conclave = false,
		Disposition = 1.1,
		ExilusPolarity = "Madurai",
		Family = "Zakti",
		GripType = "GUN_ONE_HAND",
		Image = "ZaktiPrime.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeZakti/PrimeZaktiPistol",
		Introduced = "29.3",
		Link = "Zakti Prime",
		Magazine = 8,
		Mastery = 14,
		MaxRank = 30,
		Name = "Zakti Prime",
		Polarities = { "Naramon", "Naramon", "Madurai" },
		Reload = 1,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime" },
		Trigger = "Semi-Auto",
		_TooltipAttackDisplay = 2 
	},
	Zylok = {
		Accuracy = 23.5,
		AmmoMax = 210,
		AmmoPickup = 20,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.08,
				CritMultiplier = 2,
				Damage = { Impact = 44.8, Puncture = 16.8, Slash = 78.4 },
				FireRate = 1.8,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.26 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				ChargeTime = 0.6,
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Impact = 160, Puncture = 240 },
				FireRate = 1,
				IncarnonCharges = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hitscan",
				StatusChance = 0.4,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				CritChance = 0.2,
				CritMultiplier = 2,
				Damage = { Heat = 600 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 1.25,
		ExilusPolarity = "Madurai",
		Family = "Zylok",
		GripType = "GUN_ONE_HAND",
		Image = "Zylok.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "ZylokIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/ConclaveLeverPistol/ConclaveLeverPistol",
		Introduced = "23.6",
		Link = "Zylok",
		Magazine = 8,
		Mastery = 6,
		MaxRank = 30,
		Name = "Zylok",
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 1,
		Traits = { "Tenno" },
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	},
	["Zylok Prime"] = {
		Accuracy = 23.5,
		AmmoMax = 210,
		AmmoPickup = 60,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.12,
				CritMultiplier = 2.4,
				Damage = { Impact = 63, Puncture = 21, Slash = 126 },
				FireRate = 1.8,
				IsSilent = false,
				MaxSpread = 8,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				Range = 300,
				ShotType = "Hit-Scan",
				StatusChance = 0.36 
			},
			{
				Accuracy = 100,
				AmmoCost = 1,
				AttackIndex = 2,
				AttackName = "Incarnon Form",
				ChargeTime = 0.6,
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Impact = 200, Puncture = 300 },
				FireRate = 1,
				IncarnonCharges = 12,
				IsSilent = false,
				MaxSpread = 0,
				MinSpread = 0,
				Multishot = 1,
				PunchThrough = 0,
				ShotType = "Hitscan",
				StatusChance = 0.4,
				Trigger = "Charge" 
			},
			{
				AttackIndex = 3,
				AttackName = "Incarnon Form Radial Attack",
				CritChance = 0.26,
				CritMultiplier = 2.4,
				Damage = { Heat = 700 },
				Falloff = { EndRange = 6, Reduction = 0.6, StartRange = 0 },
				FireRate = 1,
				IsSilent = false,
				Multishot = 1,
				Range = 6,
				ShotType = "AoE",
				StatusChance = 0.4 
			} 
		},
		Class = "Pistol",
		Conclave = true,
		Disposition = 0.9,
		ExilusPolarity = "Madurai",
		Family = "Zylok",
		GripType = "GUN_ONE_HAND",
		Image = "ZylokPrime.png",
		IncarnonChargeGain = 1,
		IncarnonImage = "ZylokPrimeIncarnon.png",
		InternalName = "/Lotus/Weapons/Tenno/Pistols/PrimeZylok/ZylokPrimePistol",
		Introduced = "34",
		Link = "Zylok Prime",
		Magazine = 12,
		Mastery = 13,
		MaxRank = 30,
		Name = "Zylok Prime",
		Polarities = { "Naramon", "Madurai" },
		Reload = 1.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Tradable = 2,
		Traits = { "Prime", "Tenno" },
		Trigger = "Duplex",
		_TooltipAttackDisplay = 1 
	},
	Zymos = {
		Accuracy = 9.8,
		AmmoMax = 51,
		AmmoPickup = 40,
		AmmoType = "Secondary",
		Attacks = {
			{
				AmmoCost = 1,
				AttackIndex = 1,
				AttackName = "Normal Attack",
				CritChance = 0.05,
				CritMultiplier = 2.3,
				Damage = { Impact = 9.2, Puncture = 13.8 },
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				MaxSpread = 20,
				MinSpread = 0.5,
				Multishot = 1,
				PunchThrough = 0,
				ShotSpeed = 79,
				ShotType = "Projectile",
				StatusChance = 0.3,
				Trigger = "Semi-Auto" 
			},
			{
				AttackIndex = 2,
				AttackName = "Radial Attack",
				AttackParentIndex = 1,
				CritChance = 0.05,
				CritMultiplier = 2.3,
				Damage = { Toxin = 61 },
				Falloff = { EndRange = 3.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.3,
				ShotType = "AoE",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 3,
				AttackName = "Headshot Explosion",
				AttackParentIndex = 1,
				CritChance = 0.05,
				CritMultiplier = 2.3,
				Damage = { Toxin = 953 },
				ExplosionDelay = 1.1,
				Falloff = { EndRange = 3.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				ForcedProcs = { "Knockdown" },
				IsSilent = false,
				Multishot = 1,
				PunchThrough = 0,
				Range = 3.3,
				ShotType = "AoE",
				StatusChance = 0.5 
			},
			{
				AttackIndex = 4,
				AttackName = "Homing Spore Contact",
				CritChance = 0.05,
				CritMultiplier = 2.3,
				Damage = { Puncture = 11.5, Slash = 11.5 },
				FireRate = 1.33,
				ForcedProcs = { "Impact" },
				IsSilent = false,
				Multishot = 6,
				PunchThrough = 0,
				ShotType = "Projectile",
				StatusChance = 0.3 
			},
			{
				AttackIndex = 5,
				AttackName = "Homing Spore Explosion",
				AttackParentIndex = 4,
				CritChance = 0.05,
				CritMultiplier = 2.3,
				Damage = { Toxin = 333 },
				Falloff = { EndRange = 3.3, Reduction = 0.3, StartRange = 0 },
				FireRate = 1.33,
				IsSilent = false,
				Multishot = 6,
				PunchThrough = 0,
				Range = 3.3,
				ShotType = "AoE",
				StatusChance = 0.3 
			} 
		},
		Class = "Pistol",
		Conclave = false,
		Disposition = 1.2,
		ExilusPolarity = "Naramon",
		Family = "Zymos",
		GripType = "GUN_ONE_HAND",
		Image = "Zymos.png",
		InternalName = "/Lotus/Weapons/Infested/Pistols/InfUzi/InfUziWeapon",
		Introduced = "29",
		Link = "Zymos",
		Magazine = 17,
		Mastery = 11,
		MaxRank = 30,
		Name = "Zymos",
		Polarities = { "Madurai", "Naramon" },
		Reload = 3.2,
		SellPrice = 5000,
		Slot = "Secondary",
		Traits = { "Infested" },
		Trigger = "Semi-Auto",
		Users = { "Zealot Proselytizer" },
		_TooltipAttackDisplay = 3 
	} 
}
```

