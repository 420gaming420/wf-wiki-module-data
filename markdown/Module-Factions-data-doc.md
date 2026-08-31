---
title: "Module:Factions/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Factions/data/doc"
wiki_timestamp: "2022-09-15T19:48:58Z"
---

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Factions](/w/Factions "Factions").

## Faction Entry Schema

[[edit source](/w/Module:Factions/data/doc?action=edit&section=1 "Edit section's source code: Faction Entry Schema")]

```lua
	["Faction Name"] = {
		Description = "Faction Description",
		Image = "FactionName.png",
		Introduced = "31",
		Link = "Link Name",
		Name = "Faction Name",
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Description` | String | ✔️ | Description of faction as seen in-game | `"Support and rewards for Tenno fighting in active operations."` |
| `Image` | String | ✔️ | Image file name of the faction icon as uploaded to the wiki. Preferably using the "FactionName.png" naming convention. | `"SteelMeridian.png"` |
| `Introduced` | String | ✔️ | The game version in which the faction was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ✔️ | Page/article link to the faction on the wiki | `"The Holdfasts"` |
| `Name` | String | ✔️ | Name of faction | `"Arbiters of Hexis"` |

