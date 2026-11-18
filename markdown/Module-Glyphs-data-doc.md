---
title: "Module:Glyphs/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Glyphs/data/doc"
wiki_timestamp: "2026-11-18T06:28:20Z"
---

Database for [Glyphs](/w/Glyph "Glyph").

## Glyph Entry Schema

[[edit](/w/Module:Glyphs/data/doc?action=edit&section=1 "Edit Section using Source Editor:
Glyph Entry Schema")]

```lua
	["Glyph Name"] = {
		CodexSecret = false,
		Description = "A Glyph for your profile.",
		ExcludeFromCodex = true,
		Image = "GlyphName.png",
		InternalName = "/Lotus/Types/StoreItems/AvatarImages/AvatarImageDefault",
		Name = "Glyph Name",
	},
```

| Key/Column Name | [Public Export](/w/Public_Export "Public Export") Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- |
| `CodexSecret` | `codexSecret` | Boolean | ✔️ | Whether or not the Glyph has an entry in the [Codex](/w/Codex "Codex") before the player acquires it; defaults to false | `"true"` `"false"` |
| `Description` | `description` | String | ✔️ | In-game item description | `"A Glyph for your profile."` |
| `ExcludeFromCodex` | `excludeFromCodex` | Boolean | ✔️ | Whether or not the Glyph will always be excluded from Codex | `"true"` `"false"` `"nil"` |
| `Image` | `textureLocation` | String | ✔️ | Image file name of the Glyph as uploaded to the Wiki; should be formatted as GlyphName.png | `"LotusSymbolGlyph.png"` |
| `InternalName` | `uniqueName` | String | ✔️ | The full unique name of a Glyph formatted as a file path | `"/Lotus/Types/StoreItems/AvatarImages/AvatarImageDefault"` |
| `Name` | `name` | String | ✔️ | Name of Glyph as seen in-game | `"Lotus Symbol Glyph"` |

