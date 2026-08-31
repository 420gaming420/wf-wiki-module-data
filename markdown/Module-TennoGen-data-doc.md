---
title: "Module:TennoGen/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/TennoGen/data/doc"
wiki_timestamp: "2026-04-16T19:14:38Z"
---

Database of [TennoGen](/w/TennoGen "TennoGen") items. For more canonical data related to TennoGen cosmetics see [Module:Cosmetics/data](/w/Module:Cosmetics/data "Module:Cosmetics/data").

## TennoGen Item Schema

[[edit source](/w/Module:TennoGen/data/doc?action=edit&section=1 "Edit section's source code: TennoGen Item Schema")]

```lua
["Item Name"] = {
	Artists = { "Artist 1", "Artist 2" },  -- artist names in a table
	ConsolePrice = "100",  -- in platinum
	Image = "Panel.png",  -- image file name as stored on the wiki
    Link = "Page name",
    Name = "Item name",
	PcPrice = "$5.99",  -- include currency sign
	Round = "12",  -- TennoGen round number or name
	SteamLink = "https://steamcommunity.com/sharedfiles/filedetails/?id=1266378613",  -- entire URL of Steam workshop page
	Description = "Item description here, as it appears ingame",
	Type = "Syandana"   -- cosmetic type
},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Artists` | Table (of strings) | ✔️ | Name of artists who contributed | `{ "malaya", "Cobalt" }` |
| `ConsolePrice` | String | ✔️ | Price in [Platinum](/w/Platinum "Platinum") on consoles | `"200"` |
| `Image` | String | ✔️ | Image file name of the item as uploaded to the wiki | `"ArmalystSyandana.png"` |
| `InternalName` | String | ❌ | The full unique name of item formatted as a file path | `"/Lotus/Upgrades/Skins/Anima/SWDivisaHelmet"` |
| `Link` | String | ✔️ | Page/article link to the item on the wiki | `"Armalyst Syandana"` |
| `Name` | String | ✔️ | Name of TennoGen item | `"Armalyst Syandana"` |
| `PcPrice` | String | ✔️ | Price in US dollars on PC | `"$5.99"` |
| `Round` | String | ✔️ | TennoGen round number or name | `"12"` |
| `SteamLink` | String | ✔️ | Entire URL of Steam workshop page | `"https://steamcommunity.com/sharedfiles/filedetails/?id=1266378613"` |
| `Description` | String | ✔️ | In-Game Description | `"A unique Mag Skin Warframe."` |
| `Type` | String | ✔️ | Cosmetic type | `"Syandana"` |

