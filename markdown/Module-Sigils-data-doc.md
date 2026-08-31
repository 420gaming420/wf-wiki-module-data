---
title: "Module:Sigils/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Sigils/data/doc"
wiki_timestamp: "2023-01-18T19:32:17Z"
---

Database for [Sigils](/w/Sigils "Sigils").

## Sigil Entry Schema

[[edit source](/w/Module:Sigils/data/doc?action=edit&section=1 "Edit section's source code: Sigil Entry Schema")]

```lua
	["Sigil Name"] = {
		Description = "Sigil description",
		Image = "SigilName.png",
		Name = "Sigil Name",
		Link = "Article Name",
		SellPrice = 1000,
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| Description | String | ✔️ | In-game item description | `"A sigil representing prestige gained with the Ostron."` |
| Image | String | ✔️ | Image file name of the sigil as seen in in-game menus | `"LeapingThrasherSigil.png"` |
| Name | String | ✔️ | Name of sigil as seen in-game | `"Bloodshed Sigil"` |
| Link | String | ✔️ | Page/article link to the related article on the wiki | `"Stalker"` |
| SellPrice | Number | ❌ | Sigil's selling price in [Credits](/w/Credits "Credits") | `1000` |

## Sigil Data

[[edit source](/w/Module:Sigils/data/doc?action=edit&section=2 "Edit section's source code: Sigil Data")]

