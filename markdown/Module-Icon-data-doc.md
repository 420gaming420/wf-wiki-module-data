---
title: "Module:Icon/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Icon/data/doc"
wiki_timestamp: "2025-03-07T19:42:52Z"
---

Database for miscellaneous icons used in [WARFRAME](/w/WARFRAME "WARFRAME"). Some categories of items/icons/content are not large enough or unique enough in terms of properties to justify having their own database.

## Icon Entry Schema

[[edit source](/w/Module:Icon/data/doc?action=edit&section=1 "Edit section's source code: Icon Entry Schema")]

Item template:

```lua
	["Item name"] = {
		Description = "Item Description",
		Image = "ItemName.png",
		Link = "Link Name",
		Name = "Page Name",
		CssClasses = "CSS Classes"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Description` | Boolean | ❌ | Description of icon | `"Modifies the Duration of Warframe Abilities and the Energy cost of toggled Abilities. Hover over each Ability to see how its stats are affected."` |
| `Image` | String | ✔️ | Image file name of the icon as uploaded to the wiki | `"Health.png"` |
| `Link>` | String | ✔️ | Page/article link to the mod on the wiki | `"Health"` |
| `Name` | String | ✔️ | Name of item | `"Health"` |
| `CssClasses` | String | ❌ | CSS classes to be applied when icon is used in tooltips | `"light-invert"` |

