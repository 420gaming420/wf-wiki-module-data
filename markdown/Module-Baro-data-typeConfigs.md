---
title: "Module:Baro/data/typeConfigs"
wiki_url: "https://wiki.warframe.com/w/Module/Baro/data/typeConfigs"
wiki_timestamp: "2026-06-03T15:56:28Z"
---

Configuration file for categorizing and formatting item names in [Module:Baro](/w/Module:Baro "Module:Baro").

:   *Last updated: Wed, 03 Jun 2026 15:56:28 +0000 (UTC) by [User:Anexera](/w/User:Anexera "User:Anexera") ([change log](https://wiki.warframe.com/w/Module:Baro/data/typeConfigs?diff=0))*

## Contents

* [1 Notes](#Notes)
* [2 Config Schema](#Config_Schema)
* [3 Configuration Data](#Configuration_Data)

## Notes

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=T-1 "Edit section's source code: Notes")]

* **Consistency**: Keys (e.g., "Booster", "Primed Mod (Warframe)") must exactly match the `Type` field in [Module:Baro/data](/w/Module:Baro/data "Module:Baro/data") (case-sensitive).
* **GalleryCategory**: Determines which tab the item appears in [Baro Ki'Teer/Current PC Items](/w/Baro_Ki%27Teer/Current_PC_Items "Baro Ki'Teer/Current PC Items").
* **HistoryCategory**: Determines which tab the item appears in [Baro Ki'Teer/Trades](/w/Baro_Ki%27Teer/Trades "Baro Ki'Teer/Trades").
* **TooltipModule**: Specifies the module name used to fetch and format the item's custom display with icons and tooltips (e.g., `Void` will display as [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_A2 "Axi A2") [Axi A2 Relic](/w/Axi_A2 "Axi A2")).

## Config Schema

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=T-2 "Edit section's source code: Config Schema")]

```lua
	["Item Type"] = {
		GalleryCategory = "Appearance",
		HistoryCategory = "Cosmetic",
		TooltipModule = "Cosmetics"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `GalleryCategory` | String | ✔️ | Defines the tab grouping for `buildGallery` via `buildTabbers`. | `"Miscellaneous"` |
| `HistoryCategory` | String | ✔️ | Defines the tab grouping for `buildHistoryTable` via `buildTabbers`. | `"Relic"` |
| `TooltipModule` | String | ❌ | The database key configured in [Module:Tooltips/icon](/w/Module:Tooltips/icon "Module:Tooltips/icon") used to fetch corresponding data and icons (e.g., `"Void"`, `"Weapons"`, `"Cosmetics"`). | `"Void"` |

## Configuration Data

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=T-3 "Edit section's source code: Configuration Data")]

---

```lua
local COSMETIC = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic" }
local COSMETIC_COMPANION = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Companion)" }
local COSMETIC_VEHICLE = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Vehicle)" }
local MISC = { GalleryCategory = "Miscellaneous", HistoryCategory = "Misc" }
local MOD = { GalleryCategory = "Mods", HistoryCategory = "Mod" }
local WEAPON = { GalleryCategory = "Weapons", HistoryCategory = "Weapon", TooltipModule = "Weapons" }

return {
	-- Weapons
	["Weapon"] = WEAPON,
	["Weapon (Archwing)"] = WEAPON,

	-- Mods
	["Mod (Archgun)"] = MOD,
	["Mod (Archwing)"] = MOD,
	["Mod (Bow)"] = MOD,
	["Mod (Companion)"] = MOD,
	["Mod (Melee)"] = MOD,
	["Mod (Pistol)"] = MOD,
	["Mod (Rifle)"] = MOD,
	["Mod (Shotgun)"] = MOD,
	["Mod (Sniper)"] = MOD,
	["Mod (Stance)"] = MOD,
	["Mod (Warframe)"] = MOD,
	["Primed Mod (Archgun)"] = MOD,
	["Primed Mod (Archwing)"] = MOD,
	["Primed Mod (Bow)"] = MOD,
	["Primed Mod (Companion)"] = MOD,
	["Primed Mod (Melee)"] = MOD,
	["Primed Mod (Pistol)"] = MOD,
	["Primed Mod (Pistol)"] = MOD,
	["Primed Mod (Rifle)"] = MOD,
	["Primed Mod (Shotgun)"] = MOD,
	["Primed Mod (Sniper)"] = MOD,
	["Primed Mod (Warframe)"] = MOD,

	-- Appearance (Universal)
	["Cosmetic (Armor)"] = COSMETIC,
	["Cosmetic (Emblem)"] = COSMETIC,
	["Cosmetic (Ephemera)"] = COSMETIC,
	["Cosmetic (Sigil)"] = COSMETIC,
	["Cosmetic (Signa)"] = COSMETIC,
	["Cosmetic (Syandana)"] = COSMETIC,

	-- Appearance (Vehicles)
	["Cosmetic (Archwing)"] = COSMETIC_VEHICLE,
	["Cosmetic (Atomicycle)"] = COSMETIC_VEHICLE,
	["Cosmetic (Kaithe)"] = COSMETIC_VEHICLE,
	["Cosmetic (K-Drive)"] = COSMETIC_VEHICLE,
	["Cosmetic (Necramech)"] = COSMETIC_VEHICLE,
	["Cosmetic (Railjack)"] = COSMETIC_VEHICLE,
	["Cosmetic (Landing Craft)"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Cosmetic (Vehicle)" },
	["Cosmetic (Orbiter)"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Cosmetic (Vehicle)" },

	-- Appearance (Companions)
	["Cosmetic (Kavat)"] = COSMETIC_COMPANION,
	["Cosmetic (Kubrow)"] = COSMETIC_COMPANION,
	["Cosmetic (MOA)"] = COSMETIC_COMPANION,
	["Cosmetic (Sentinel)"] = COSMETIC_COMPANION,

	-- Appearance (Specialized)
	["Cosmetic (Operator)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Operator)" },
	["Cosmetic (Warframe Skin)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Warframe)" },
	["Cosmetic (Weapon)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Weapon)" },
	["Cosmetic (Weapon Skin)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Weapon)" },

	-- Miscellaneous
	["Booster"] = MISC,
	["Bundle"] = MISC,
	["Captura Scene"] = MISC,
	["Color Palette"] = MISC,
	["Consumable"] = MISC,
	["Emote"] = MISC,
	["Glyph"] = MISC,
	["Lootbox"] = MISC,
	["Mission Locator"] = MISC,
	["Quest"] = MISC,
	["Somachord"] = MISC,
	["Decoration"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Decoration" },
	["Sentinel"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Companion" },
	["Void Relic"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Relic", TooltipModule = "Void" }
}
```

