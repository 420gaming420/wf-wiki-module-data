---
title: "Module:Mods/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Mods/data/doc"
wiki_timestamp: "2026-07-21T01:21:16Z"
---

Database for all [Mods](/w/Mod "Mod") in [WARFRAME](/w/WARFRAME "WARFRAME") (with the exception of unveiled [Riven Mods](/w/Riven_Mods "Riven Mods")). Preferably put new mods in the correct alphabetical order, but it is not necessary.

:   *Last updated: Tue, 21 Jul 2026 01:21:16 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Mods/data/doc?diff=0))*

## Contents

* [1 Mod Entry Schema](#Mod_Entry_Schema)
* [2 Mod Collections](#Mod_Collections)
* [3 Mod Images](#Mod_Images)
  + [3.1 Programmatically Creating Mod Cards](#Programmatically_Creating_Mod_Cards)
    - [3.1.1 Assets](#Assets)
* [4 Where To Find Mod Metadata](#Where_To_Find_Mod_Metadata)
* [5 Data Validation](#Data_Validation)
  + [5.1 Checking for required keys](#Checking_for_required_keys)
  + [5.2 Validating data types of values](#Validating_data_types_of_values)
  + [5.3 Checking naming scheme of image names](#Checking_naming_scheme_of_image_names)
  + [5.4 Validating mod incompatibility graphs for circular references](#Validating_mod_incompatibility_graphs_for_circular_references)
* [6 References](#References)
* [7 Mod Data](#Mod_Data)

## Mod Entry Schema

[[edit source](/w/Module:Mods/data/doc?action=edit&section=1 "Edit section's source code: Mod Entry Schema")]

```lua
	["Mod Name"] = {
		BaseDrain = 0,
		Conclave = false,
		Description = "Description on mod card at max rank",
		Icon = "ModName.png",
		Image = "ModNameMod.png",
		InternalName = "",
		Incompatible = { "Primed Mod Name", "Flawed Mod Name" },
		Introduced = "29",
		IsExilus = false,
		IsFlawed = false,
		Link = "Page Name",
		MaxRank = 5,
		Name = "Mod Name",
		Polarity = "Madurai",
		Rarity = "Rare",
		Tradable = true,
		Transmutable = true,
		Type = "Primary",
	},
```

| Key/Column Name | [Arsenal](/w/Arsenal "Arsenal") EN L10n | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `_IgnoreEntry` | N/A | N/A | N/A | Boolean | ❌ | For wiki internal use, denotes entries to ignore for purposes of usage on the wiki (e.g. total mod count) and data validation | `true` |
| `BaseDrain` | N/A | `baseDrain` | `BaseDrain` | Number (integer) | ✔️ | Base mod capacity drain at Rank 0 | `2` |
| `Class` | N/A | N/A | `IsImmortal`, `IsGalvanized` | String | ❌ | For mods with a special material on their mod card, the class name that describes these types of mods (different from rarity) | `"Galvanized"` or `"Requiem"` |
| `CodexSecret` | N/A | `codexSecret` | `CodexSecret` | Boolean | ✔️ | Whether or not the mod has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `false` |
| `CompatibilityTags` | N/A | N/A | `CompatibilityTags` or `compatibilityTags` | Table (array of strings) | ❌ | Tags that denote item compatibility. In other words, an item with one these tags can/cannot have this particular mod installed. | `{ "POWER_WEAPON" }` |
| `Conclave` | N/A | N/A | `AvailableOnPvp` | Boolean | ❌ | Whether or not the mod can be used in [Conclave](/w/Conclave "Conclave") | `false` |
| `Description` | N/A | `levelStats` or/and `description` (some mods like auras have their in-game descriptions split between `levelStats` and `description`) | `LocTag` or `description` | String | ✔️ | Description of mod at max rank | `"+165% Damage"` |
| `Icon` | N/A | `textureLocation` | `Icon` | String | ✔️ | Image file name of the mod image as uploaded to the wiki. Preferably using the "ModName.png" naming convention. | `"BattleStations.png"` |
| `Image` | N/A | N/A | N/A | String | ✔️ | Image file name of the full mod card (with text) as uploaded to the wiki. Preferably using the "ModNameMod.png" naming convention. | `"BattleStationsMod.png"` |
| `Incompatible` | N/A | N/A | N/A | Table | ❌ | Table containing the mods that cannot be equipped with at the same time | `{ "Primed Flow", "Flawed Flow" }` |
| `IncompatibilityTags` | N/A | N/A | `IncompatibilityTags` | Table (array of strings) | ❌ | Tags that denote item incompatibility. In other words, items with these tags cannot have this particular mod installed. | `{ "POWER_WEAPON" }` |
| `InternalName` | N/A | `uniqueName` | `TypeName` | String | ✔️ | The full unique name of a mod formatted as a file path | `"/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod"` |
| `Introduced` | N/A | N/A | N/A | String | ✔️ | The game version in which the mod was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `IsAbilityAugment` | N/A | N/A | `IsAbilityAugment` | Boolean | ❌ | Whether or not the mod is classified as [Warframe Augment Mods](/w/Warframe_Augment_Mods "Warframe Augment Mods") or augment mods for abilities (including Archwing) | `true` |
| `IsDefaultUpgrade` | N/A | N/A | N/A | Boolean | ❌ | Whether or not the mod is a hidden innate upgrade to some weapons (e.g.  [Komorex](/w/Komorex "Komorex")'s innate ammo mutation) | `true` |
| `IsExilus` | N/A | `isUtility` | `IsUtility` | Boolean | ❌ | Whether or not the mod can be installed to the [Exilus](/w/Exilus "Exilus") slot | `true` |
| `IsFlawed` | N/A | N/A | `IsStarter` | Boolean | ❌ | Whether or not the mod is a [Flawed mod](/w/Flawed_Mods "Flawed Mods") | `true` |
| `IsWeaponAugment` | N/A | N/A | N/A | Boolean | ❌ | Whether or not the mod is classified as [Weapon Augments](/w/Weapon_Augments "Weapon Augments") or augment mods for weapons. Note that there are exceptions like  [Harkonar Scope](/w/Harkonar_Scope "Harkonar Scope") and  [Medi-Ray](/w/Medi-Ray "Medi-Ray") which are classified as augments b/c they drop from [Kela De Thaym](/w/Kela_De_Thaym "Kela De Thaym") | `true` |
| `Link` | N/A | N/A | N/A | String | ✔️ | Page/article link to the mod on the wiki | `"Scorch (Mod)"` |
| `MaxRank` | N/A | `fusionLimit` | `FusionLimit` | Number (integer) | ✔️ | Maximum rank that mod can be upgraded to using [Endo](/w/Endo "Endo") | `10` |
| `Name` | N/A | `name` | `LocalizeTag` | String | ✔️ | Name of mod | `"Scorch"` |
| `NotUpgradable` | N/A | N/A | N/A | Boolean | ❌ | Denotes whether or not a mod can be upgraded by the player using [Endo](/w/Endo "Endo") | `true` |
| `NumUpgradesInSet` | N/A | `numUpgradesInSet` | N/A | Number (integer) | ❌ | For set bonuses, the total number of mods that are part of this set | `4` |
| `Polarity` | N/A | `polarity` | `ArtifactPolarity` | String | ✔️ | Full name of the mod's [polarity](/w/Polarity "Polarity") | `"Naramon"` or `"Universal"` |
| `Rarity` | N/A | `rarity` | `Rarity` | String | ✔️ | Rarity of the mod; this also determines their [Endo](/w/Endo "Endo") cost to upgrade. Not required for [Endo](/w/Endo "Endo") entry. | `"Legendary"` |
| `Set` | N/A | `modSet` | `ModSet` | String | ❌ | For [Set Mods](/w/Set_Mods "Set Mods"), the name of the set that the mod belongs to | `"Vigilante"` |
| `Tradable` | N/A | N/A | `TradeCapability` or `tradable` | Boolean | ✔️ | Whether or not the mod can be [traded](/w/Trading "Trading") with other players | `true` |
| `Transmutable` | N/A | N/A | `IncludeInBoosterPack` or `canBeTransmutation` | Boolean | ✔️ | Whether or not the mod can be obtained from [Transmutation](/w/Transmutation "Transmutation") | `true` |
| `Type` | N/A | `compatName` or `type` | `ItemCompatibility` and `ItemCompatibilityLocTag` or `compatName` | String | ✔️ | The class of items that the mod can be equipped on as seen on the mod card; there may be additional information for exceptions | `"Rifle"`, `"Trinity"`, or `"Bow (non-AoE bows and crossbows)"` |
| `UpgradeTypes` | N/A | N/A | `UpgradeType` | String | ❌ | Upgrade tags associated with the mod for categorization and to reflect the specific internal bonus it adds (sometimes localized description does not explain full functionality). Mods whose functionality are derived from Lua scripts (i.e. complex/unorthodox behavior) will not have this key set. This key is solely for mods that provide simple stat bonuses. | `GAMEPLAY_FACTION_DAMAGE` |

## Mod Collections

[[edit source](/w/Module:Mods/data/doc?action=edit&section=2 "Edit section's source code: Mod Collections")]

There are three main collections that store mod data:

* `DefaultUpgrades` - these are "innate" mods invisible in the modding screen. They include weapon [passives](/w/Passives "Passives"), [Signature Weapon](/w/Signature_Weapon "Signature Weapon") bonuses, and [Progenitor Bonus](/w/Progenitor_Bonus "Progenitor Bonus").
* `Sets` - [Set Mod](/w/Set_Mod "Set Mod") bonuses
* `Mods` - contains all mod data including deprecated and removed mods

## Mod Images

[[edit source](/w/Module:Mods/data/doc?action=edit&section=3 "Edit section's source code: Mod Images")]

Mod images without border styling, image filter, and description text can be sourced from [Public Export](/w/Public_Export "Public Export"). However, full mod images are NOT provided by Digital Extremes since they are generated within the engine (presumably they are modularly built to support different localizations and styling).[[1]](#cite_note-1)[[2]](#cite_note-2) There are two ways to source full mod images:

* Cropping high quality screenshot of mod from a [Chat](/w/Chat "Chat") link or [Trading](/w/Trading "Trading") preview
* Ripping from the game

### Programmatically Creating Mod Cards

[[edit source](/w/Module:Mods/data/doc?action=edit&section=4 "Edit section's source code: Programmatically Creating Mod Cards")]

It is possible to programmatically build mod cards using individual image assets sourced from [Public Export](/w/Public_Export "Public Export") (mod image) and [Warframe Arsenal Twitch Extension](/w/Warframe_Arsenal_Twitch_Extension "Warframe Arsenal Twitch Extension") (mod image frames and background). For example, see the following resources as reference for mimicking the [![](/images/thumb/SerrationMod.png/22px-SerrationMod.png?0b8ff)](/w/Serration "Serration") [Serration](/w/Serration "Serration") mod card:

* <https://overframe.gg/items/arsenal/626/serration/>
* <https://warframe.fandom.com/uk/wiki/Зубець> (Ukrainian Fandom wiki)

One benefit of this method is to be flexible to different localizations that WARFRAME supports. The same mod card template can be adapted to multiple languages if the localized mod name and descriptions are stored in this data store.

#### Assets

[[edit source](/w/Module:Mods/data/doc?action=edit&section=5 "Edit section's source code: Assets")]

:   *Main article: [Mod/Assets](/w/Mod/Assets "Mod/Assets")*

## Where To Find Mod Metadata

[[edit source](/w/Module:Mods/data/doc?action=edit&section=6 "Edit section's source code: Where To Find Mod Metadata")]

The in-game UI does not thoroughly present all the data and interactions that is provided from a mod (or any [Upgrade](/w/Upgrade "Upgrade") for that matter). Here are some methods and sources to get more insight on the internal mechanics on mods:

* [Public Export](/w/Public_Export "Public Export")'s `ExportUpgrades` manifest
* <https://overframe.gg/> has access to more metadata than what Digital Extremes provide to the public. This JSON data is cached locally on the client in these tags: `<script id="__NEXT_DATA__" type="application/json"></script>`
  + For example, for more metadata on [![](/images/thumb/SerrationMod.png/22px-SerrationMod.png?0b8ff)](/w/Serration "Serration") [Serration](/w/Serration "Serration"), go to <https://overframe.gg/items/arsenal/626/serration/> and inspect the HTML element on the page using your browser's development tools. The relevant metadata should be under the `<script id="__NEXT_DATA__" type="application/json"></script>` tags. If not, hard refresh the browser's cache so the underlying data is updated to reflect on the actual item.

    ```lua
    "data": {
        "ArtifactPolarity": "AP_ATTACK",
        "BaseDrain": "QA_MEDIUM",
        "ExcludeFromCodex": 0,
        "FusionLimit": "QA_VERY_HIGH",
        "Icon": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.png",
        "IncludeInBoosterPack": 1,
        "ItemCompatibility": "/Lotus/Weapons/Tenno/Rifle/LotusRifle",
        "ItemCompatibilityLocTag": "/Lotus/Language/Items/RifleCategoryName",
        "LocalizeDescTag": "",
        "LocalizeTag": "/Lotus/Language/Items/RifleModDamageAmount",
        "MarketMode": "MM_HIDDEN",
        "ProductCategory": "Upgrades",
        "Rarity": "UNCOMMON",
        "RectangleIcon": 1,
        "Slotted": 0,
        "Upgrades": [{
                "AutoType": 1,
                "DamageType": "DT_ANY",
                "DisplayAsMultiplier": 0,
                "DisplayAsPercent": 1,
                "LocKeyWordScript": {
                    "Script": ""
                },
                "LocTag": "/Lotus/Language/Upgrades/WeaponDamageModDesc",
                "OperationType": "STACKING_MULTIPLY",
                "OverrideLocalization": 1,
                "ReverseValueSymbol": 0,
                "RoundTo": 0.1,
                "RoundingMode": "RM_ROUND",
                "SmallerIsBetter": 0,
                "SymbolFilter": "",
                "UpgradeObject": "",
                "UpgradeType": "WEAPON_DAMAGE_AMOUNT",
                "ValidModifiers": [],
                "ValidPostures": [],
                "ValidProcTypes": [],
                "ValidType": "",
                "Value": 0.15000001
            }]
        },
        "id": 626,
        "parent": "/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade",
        "parents": ["/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade", "/Lotus/Types/Game/LotusArtifactUpgrade"],
        "path": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod",
        "storeData": {
            "Giftable": 0,
            "ProductCategory": "Upgrades",
            "SearchTags": ["/Lotus/Language/Items/RifleCategoryName"],
            "SellingPrice": 500,
            "ShowInMarket": 0,
            "TypeName": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod"
        },
        "storeItemType": "/Lotus/StoreItems/Upgrades/Mods/Rifle/WeaponDamageAmountMod",
        "tag": "Mod",
        "texture": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg",
        "texture_new": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg"
    },
    ```
  + Adding some comments for context:

    ```lua
    "data": {
        "ArtifactPolarity": "AP_ATTACK", -- Mod polarity as stored as an string enum
        "BaseDrain": "QA_MEDIUM", -- Base mod capacity drain as stored as a string enum
        "ExcludeFromCodex": 0, -- Boolean value as an integer (0 or 1) to determine whether to hide mod from Codex or not
        "FusionLimit": "QA_VERY_HIGH", -- Mod's max rank as stored a a string enum
        "Icon": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.png", -- Game's internal file path to the mod image
        "IncludeInBoosterPack": 1, -- Boolean value as an integer to determine if mod is transmutable or not
        "ItemCompatibility": "/Lotus/Weapons/Tenno/Rifle/LotusRifle", - Mod item compatibility as location to object definition
        "ItemCompatibilityLocTag": "/Lotus/Language/Items/RifleCategoryName", -- Location of mod item compatibility localization string (e.g. "Rifle")
        "LocalizeDescTag": "",
        "LocalizeTag": "/Lotus/Language/Items/RifleModDamageAmount", -- Location of localization string of mod description
        "MarketMode": "MM_HIDDEN", -- Whether or not mod is available in in-game market as a string enum
        "ProductCategory": "Upgrades", - Item category
        "Rarity": "UNCOMMON", - Mod rarity as a string enum
        "RectangleIcon": 1, -- Boolean value as an integer to determine whether or not mod image has a dimensions of a rectangle
        "Slotted": 0, -- Boolean value as an integer to determine if mod is installed
        "Upgrades": [{ -- Array of stat modifiers that the mod provides
                "AutoType": 1,
                "DamageType": "DT_ANY", -- If mod's effect provides damage stat modifiers, this will determine damage type that it will apply to as a string enum
                "DisplayAsMultiplier": 0,
                "DisplayAsPercent": 1,
                "LocKeyWordScript": {
                    "Script": ""
                },
                "LocTag": "/Lotus/Language/Upgrades/WeaponDamageModDesc", -- Location of localization string of stat modifier
                "OperationType": "STACKING_MULTIPLY", -- How stat modifier is applied to base stat and how it interacts with other similar stat modifiers as a string enum
                "OverrideLocalization": 1,
                "ReverseValueSymbol": 0,
                "RoundTo": 0.1,
                "RoundingMode": "RM_ROUND", -- Value rounding mode as a string enum
                "SmallerIsBetter": 0, -- Boolean value as an integer to determine if smaller stat modifier is a buff or not
                "SymbolFilter": "", -- Search filter for any symbols present in mod description (e.g. damage icons)
                "UpgradeObject": "",
                "UpgradeType": "WEAPON_DAMAGE_AMOUNT", -- Stat modifier as a string enum
                "ValidModifiers": [],
                "ValidPostures": [], -- Array of valid avatar movement states to trigger mod's effect
                "ValidProcTypes": [], -- Array of valid status effects to trigger mod's effect
                "ValidType": "",
                "Value": 0.15000001 -- Value of said stat modifier as a floating-point value
            }]
        },
        "id": 626,
        "parent": "/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade", -- Parent game object of mod for inheritance
        "parents": ["/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade", "/Lotus/Types/Game/LotusArtifactUpgrade"],
        "path": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod", -- Unique path to mod data
        "storeData": { -- In-game market data for mod
            "Giftable": 0,
            "ProductCategory": "Upgrades",
            "SearchTags": ["/Lotus/Language/Items/RifleCategoryName"],
            "SellingPrice": 500, -- Mod's sell price in Credits
            "ShowInMarket": 0,
            "TypeName": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod"
        },
        "storeItemType": "/Lotus/StoreItems/Upgrades/Mods/Rifle/WeaponDamageAmountMod",
        "tag": "Mod",
        "texture": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg",
        "texture_new": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg"
    },
    ```

## Data Validation

[[edit source](/w/Module:Mods/data/doc?action=edit&section=7 "Edit section's source code: Data Validation")]

### Checking for required keys

[[edit source](/w/Module:Mods/data/doc?action=edit&section=8 "Edit section's source code: Checking for required keys")]

**p.checkRequiredKeysExist(frame): There are a total of 9 key-value errors**

1. "[Ancient Fusion Core (Common)](/w/Ancient_Fusion_Core_(Common)?action=edit&redlink=1 "Ancient Fusion Core (Common) (page does not exist)")" is missing `BaseDrain`
2. "[Ancient Fusion Core (Common)](/w/Ancient_Fusion_Core_(Common)?action=edit&redlink=1 "Ancient Fusion Core (Common) (page does not exist)")" is missing `InternalName`
3. "[Ancient Fusion Core (Rare)](/w/Ancient_Fusion_Core_(Rare)?action=edit&redlink=1 "Ancient Fusion Core (Rare) (page does not exist)")" is missing `BaseDrain`
4. "[Ancient Fusion Core (Rare)](/w/Ancient_Fusion_Core_(Rare)?action=edit&redlink=1 "Ancient Fusion Core (Rare) (page does not exist)")" is missing `InternalName`
5. "[Ancient Fusion Core (Uncommon)](/w/Ancient_Fusion_Core_(Uncommon)?action=edit&redlink=1 "Ancient Fusion Core (Uncommon) (page does not exist)")" is missing `BaseDrain`
6. "[Ancient Fusion Core (Uncommon)](/w/Ancient_Fusion_Core_(Uncommon)?action=edit&redlink=1 "Ancient Fusion Core (Uncommon) (page does not exist)")" is missing `InternalName`
7. "[Fusion Core](/w/Fusion_Core "Fusion Core")" is missing `BaseDrain`
8. "[Fusion Core](/w/Fusion_Core "Fusion Core")" is missing `InternalName`
9. "[Squad Renew](/w/Squad_Renew "Squad Renew")" is missing `BaseDrain`

### Validating data types of values

[[edit source](/w/Module:Mods/data/doc?action=edit&section=9 "Edit section's source code: Validating data types of values")]

**p.validateDataTypes(frame): There are a total of 0 key-value errors**

### Checking naming scheme of image names

[[edit source](/w/Module:Mods/data/doc?action=edit&section=10 "Edit section's source code: Checking naming scheme of image names")]

**p.checkImageName(frame): There are a total of 20 image names that do not follow mod image naming scheme ModNameMod.png**

1. "[Ancient Fusion Core (Common)](/w/Ancient_Fusion_Core_(Common)?action=edit&redlink=1 "Ancient Fusion Core (Common) (page does not exist)")": "[UncommonAncientFusionCore.png](/w/File:UncommonAncientFusionCore.png "File:UncommonAncientFusionCore.png")"
2. "[Ancient Fusion Core (Rare)](/w/Ancient_Fusion_Core_(Rare)?action=edit&redlink=1 "Ancient Fusion Core (Rare) (page does not exist)")": "[UncommonAncientFusionCore.png](/w/File:UncommonAncientFusionCore.png "File:UncommonAncientFusionCore.png")"
3. "[Ancient Fusion Core (Uncommon)](/w/Ancient_Fusion_Core_(Uncommon)?action=edit&redlink=1 "Ancient Fusion Core (Uncommon) (page does not exist)")": "[UncommonAncientFusionCore.png](/w/File:UncommonAncientFusionCore.png "File:UncommonAncientFusionCore.png")"
4. "[Archgun Riven Mod](/w/Archgun_Riven_Mod "Archgun Riven Mod")": "[ArchgunRivenMod.png](/w/File:ArchgunRivenMod.png "File:ArchgunRivenMod.png")"
5. "[Blade Storm](/w/Blade_Storm "Blade Storm")": "[BladeStormStanceMod.png](/w/File:BladeStormStanceMod.png?action=edit&redlink=1 "File:BladeStormStanceMod.png (page does not exist)")"
6. "[Companion Weapon Riven Mod](/w/Companion_Weapon_Riven_Mod "Companion Weapon Riven Mod")": "[CompanionWeaponRivenMod.png](/w/File:CompanionWeaponRivenMod.png "File:CompanionWeaponRivenMod.png")"
7. "[Exalted Blade](/w/Exalted_Blade "Exalted Blade")": "[ExaltedBladeStanceMod.png](/w/File:ExaltedBladeStanceMod.png "File:ExaltedBladeStanceMod.png")"
8. "[Hysteria](/w/Hysteria "Hysteria")": "[HysteriaStanceMod.png](/w/File:HysteriaStanceMod.png "File:HysteriaStanceMod.png")"
9. "[Kitgun Riven Mod](/w/Kitgun_Riven_Mod?action=edit&redlink=1 "Kitgun Riven Mod (page does not exist)")": "[KitgunRivenMod.png](/w/File:KitgunRivenMod.png "File:KitgunRivenMod.png")"
10. "[Landslide](/w/Landslide "Landslide")": "[LandslideStanceMod.png](/w/File:LandslideStanceMod.png?action=edit&redlink=1 "File:LandslideStanceMod.png (page does not exist)")"
11. "[Melee Riven Mod](/w/Melee_Riven_Mod "Melee Riven Mod")": "[MeleeRivenMod.png](/w/File:MeleeRivenMod.png "File:MeleeRivenMod.png")"
12. "[Oull](/w/Oull "Oull")": "[OullMod.gif](/w/File:OullMod.gif "File:OullMod.gif")"
13. "[Pistol Riven Mod](/w/Pistol_Riven_Mod "Pistol Riven Mod")": "[PistolRivenMod.png](/w/File:PistolRivenMod.png "File:PistolRivenMod.png")"
14. "[Primal Fury](/w/Primal_Fury "Primal Fury")": "[PrimalFuryStanceMod.png](/w/File:PrimalFuryStanceMod.png "File:PrimalFuryStanceMod.png")"
15. "[Rifle Riven Mod](/w/Rifle_Riven_Mod "Rifle Riven Mod")": "[RifleRivenMod.png](/w/File:RifleRivenMod.png "File:RifleRivenMod.png")"
16. "[Serene Storm](/w/Serene_Storm "Serene Storm")": "[SereneStormStanceMod.png](/w/File:SereneStormStanceMod.png "File:SereneStormStanceMod.png")"
17. "[Shattered Lash](/w/Shattered_Lash "Shattered Lash")": "[ShatteredLashStanceMod.png](/w/File:ShatteredLashStanceMod.png?action=edit&redlink=1 "File:ShatteredLashStanceMod.png (page does not exist)")"
18. "[Shotgun Riven Mod](/w/Shotgun_Riven_Mod "Shotgun Riven Mod")": "[ShotgunRivenMod.png](/w/File:ShotgunRivenMod.png "File:ShotgunRivenMod.png")"
19. "[Whipclaw](/w/Whipclaw "Whipclaw")": "[WhipclawStanceMod.png](/w/File:WhipclawStanceMod.png?action=edit&redlink=1 "File:WhipclawStanceMod.png (page does not exist)")"
20. "[Zaw Riven Mod](/w/Zaw_Riven_Mod "Zaw Riven Mod")": "[ZawRivenMod.png](/w/File:ZawRivenMod.png "File:ZawRivenMod.png")"

### Validating mod incompatibility graphs for circular references

[[edit source](/w/Module:Mods/data/doc?action=edit&section=11 "Edit section's source code: Validating mod incompatibility graphs for circular references")]

**p.validateIncompatibilityEdges(frame): There are a total of 0 `Incompatible` table errors**

## References

[[edit source](/w/Module:Mods/data/doc?action=edit&section=12 "Edit section's source code: References")]

1. [↑](#cite_ref-1) <https://warframe.fandom.com/f/p/2290994351439873490>
2. [↑](#cite_ref-2) Jeloxale (2014, September 12). *[I've talked to a DE member about this but it takes too long. Only option for them is to go trough them 1 by 1 and screencap everything. That's how they did it the last time, but this time it ain't gonna work.](https://forums.warframe.com/topic/308747-mods-image-for-wiki/?do=findComment&comment=3500491)*. Warframe Forums. Accessed 2022-10-06. [Archived](https://web.archive.org/web/20221006011831/https://forums.warframe.com/topic/308747-mods-image-for-wiki/) from the original on 2022-10-06. [User:Jeloxale](/w/User:Jeloxale "User:Jeloxale"), former wiki moderator, commenting on DE's old way of providing full mod image assets.

## Mod Data

[[edit source](/w/Module:Mods/data/doc?action=edit&section=13 "Edit section's source code: Mod Data")]

