---
title: "Module:Keys/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Keys/data/doc"
wiki_timestamp: "2023-03-08T19:20:57Z"
---

Database for [Quests](/w/Quest "Quest") and [Keys](/w/Keys "Keys"). See ExportKeys file on [Public Export](/w/Public_Export "Public Export") for initial data seeding.

:   *Last updated: Wed, 08 Mar 2023 19:20:57 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Keys/data/doc?diff=0))*

## Quest Entry Schema

[[edit source](/w/Module:Keys/data/doc?action=edit&section=1 "Edit section's source code: Quest Entry Schema")]

```lua
{
	CodexSecret = false,
	Description = "Quest in-game description",
	Image = "QuestName.png",
	InternalName = "/Lotus/Types/Keys/",
	Introduced = "Vanilla",
	Link = "Quest article name",
	Name = "Quest name",
	NextQuest = "",
	PreviousQuest = "",
    Replayable = false,
	Type = "Quest type",
},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `CodexSecret` | Boolean | ✔️ | Whether or not the quest has an entry in the [Codex](/w/Codex "Codex") before the player has access to it; defaults to false | `true` |
| `Description` | String | ✔️ | In-game description of quest as shown in Codex | `"Void Storms gather in Corpus lanes... could a mysterious vessel somehow be the cause?"` |
| `ExcludeFromCodex` | Boolean | ❌ | Whether or not the quest has an entry in the [Codex](/w/Codex "Codex") regardless if the player has access to it or not; defaults to false | `true` |
| `Image` | String | ✔️ | Image file name of quest as uploaded to the wiki | `"AngelsoftheZariman.png"` |
| `InternalName` | String | ✔️ | Internal code name of quest | `"/Lotus/Types/Keys/ZarimanQuest/ZarimanQuestKeyChain"` |
| `Introduced` | String | ✔️ | The game version in which the quest was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ✔️ | Page/article link to the quest on the wiki | `"Vox Solaris (Quest)"` |
| `Name` | String | ✔️ | Quest name | `"Vox Solaris"` |
| `NextQuest` | String | ❌ | Name of the next quest in sequence | `"The New War"` |
| `PreviousQuest` | String | ❌ | Name of the previous quest in sequence | `"Erra"` |
| `Replayable` | Boolean | ✔️ | Whether or not the quest is replayable after completion | `true` |
| `Type` | String | ✔️ | Quest type as defined by editors | `"Main Quest"` |

