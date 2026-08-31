---
title: "Module:Codex/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Codex/data/doc"
wiki_timestamp: "2026-08-19T16:08:43Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Codex/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Once [Module:Enemies/data](/w/Module:Enemies/data "Module:Enemies/data") is populated, can probably make this module store a subset of that data for relevant Codex information.
Also include [Synthesis](/w/Synthesis "Synthesis") information.

Database for [Codex](/w/Codex "Codex") entries. There are 2 lists (Enemy and Object) and entries will be displayed in the order found here, so add new ones in the correct place!

## Codex Entry Schema

[[edit source](/w/Module:Codex/data/doc?action=edit&section=1 "Edit section's source code: Codex Entry Schema")]

```lua
		["Codex Entry Name"] = {
			FlipImage = false,
			Image = "ImageName.png",
			Name = "Codex Entry Name",
			Section = "Grineer" 
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `FlipImage` | Boolean | ❌ | Reflect wiki uploaded image across vertical axis to match in-game Codex representation | `true` |
| `Image` | String | ✔️ | Image file name of the item as uploaded to the wiki | `"002-ER.png"` |
| `Name` | String | ✔️ | Name of item | `"002-ER"` |
| `Section` | String | ✔️ | The tab the entry appears on in-game | `"Grineer"` |

## Codex Data

[[edit source](/w/Module:Codex/data/doc?action=edit&section=2 "Edit section's source code: Codex Data")]

