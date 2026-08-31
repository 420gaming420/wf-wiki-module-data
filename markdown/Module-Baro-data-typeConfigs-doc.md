---
title: "Module:Baro/data/typeConfigs/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Baro/data/typeConfigs/doc"
wiki_timestamp: "2026-06-10T00:14:36Z"
---

Configuration file for categorizing and formatting item names in [Module:Baro](/w/Module:Baro "Module:Baro").

:   *Last updated: Wed, 10 Jun 2026 00:14:36 +0000 (UTC) by [User:Anexera](/w/User:Anexera "User:Anexera") ([change log](https://wiki.warframe.com/w/Module:Baro/data/typeConfigs/doc?diff=0))*

## Contents

* [1 Notes](#Notes)
* [2 Config Schema](#Config_Schema)
* [3 Configuration Data](#Configuration_Data)

## Notes

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=1 "Edit section's source code: Notes")]

* **Consistency**: Keys (e.g., "Booster", "Primed Mod (Warframe)") must exactly match the `Type` field in [Module:Baro/data](/w/Module:Baro/data "Module:Baro/data") (case-sensitive).
* **GalleryCategory**: Determines which tab the item appears in [Baro Ki'Teer/Current PC Items](/w/Baro_Ki%27Teer/Current_PC_Items "Baro Ki'Teer/Current PC Items").
* **HistoryCategory**: Determines which tab the item appears in [Baro Ki'Teer/Trades](/w/Baro_Ki%27Teer/Trades "Baro Ki'Teer/Trades").
* **TooltipModule**: Specifies the module name used to fetch and format the item's custom display with icons and tooltips (e.g., `Void` will display as [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_A2 "Axi A2") [Axi A2 Relic](/w/Axi_A2 "Axi A2")).

## Config Schema

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=2 "Edit section's source code: Config Schema")]

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

[[edit source](/w/Module:Baro/data/typeConfigs/doc?action=edit&section=3 "Edit section's source code: Configuration Data")]

