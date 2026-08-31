---
title: "Module:Weapons/data/credits/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/credits/doc"
wiki_timestamp: "2022-01-12T00:10:11Z"
---

WIP database for storing the data on the designers behind the weapons.

:   *Last updated: Wed, 12 Jan 2022 00:10:11 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/credits/doc?diff=0))*

## Credits Entry Schema

[[edit source](/w/Module:Weapons/data/credits/doc?action=edit&section=1 "Edit section's source code: Credits Entry Schema")]

```lua
	["Weapon Internal Name"] = {
		Animator = "",
		ConceptArtist = "",
		Modeller = "",
		SoundDesigner = "",
		SourceLink = "URL",
		SourceArchive = "URL"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Animator` | String or Table (of strings) | ❌ | Weapon animator(s) |  |
| `ConceptArtist` | String or Table (of strings) | ❌ | Weapon concept artist(s) | `""` |
| `Modeller` | String or Table (of strings) | ❌ | Weapon modeller(s) | `""` |
| `SoundDesigner` | String or Table (of strings) | ❌ | Weapon sound designer(s) | `""` |
| `SourceLink` | String or Table (of strings) | ✔️ | URL(s) that provide proof of work such as those on artstation.com or from official [Devstreams](/w/Devstreams "Devstreams") | `"https://www.artstation.com/artwork/3dDJlm"` |
| `SourceArchive` | String or Table (of strings) | ✔️ | Archive link(s) to `SourceLink` | `""` |

## Data

[[edit source](/w/Module:Weapons/data/credits/doc?action=edit&section=2 "Edit section's source code: Data")]

