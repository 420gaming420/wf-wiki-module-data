---
title: "Module:GuaranteedRewards/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/GuaranteedRewards/data/doc"
wiki_timestamp: "2022-09-13T19:02:43Z"
---

Database for "guaranteed" rewards that are merit-based after completing some sort of milestone. Typically reserved for events that guarantee a reward to players that complete some sort of task. [Quest](/w/Quest "Quest") rewards are also valid content to store in here.

## Reward Entry Schema

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=1 "Edit section's source code: Reward Entry Schema")]

```lua
{
	{ "Endo", "Resource", 15 },
	{ "Hawk Eye", "Mod" },
	{ "Shotgun Barrage", "Mod" },
	{ "Endo", "Resource", 50 },
	{ "Shock Absorbers", "Mod" },
	{ "Endo", "Resource", 100 } 
}
```

1. First element in each table element will be the mod's name as a string (required)
2. Second element in each table element will be the item's type as a string (required)
3. Third element in each table element will represent drop count as an integer (optional)

## Source Entry Schema

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=2 "Edit section's source code: Source Entry Schema")]

```lua
		["Event Name"] = {
			Link = "Event Article Name",
			Name = "Event Name",
			Rewards = {
				{ "Endo", "Resource", 15 },
				{ "Hawk Eye", "Mod" },
				{ "Shotgun Barrage", "Mod" },
				{ "Endo", "Resource", 50 },
				{ "Shock Absorbers", "Mod" },
				{ "Endo", "Resource", 100 } 
			},
			Type = "Event" 
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `InternalName` | String | ❌ | The full unique name of a reward table formatted as a file path | `""` |
| `Link` | String | ✔️ | Name of page on the wiki of the mission associated with reward table | `"Daily Tribute"` |
| `Name` | String | ✔️ | User-defined name of reward table to be displayed to readers | `"Daily Tribute"` |
| `Rewards` | Table (of tables) | ✔️ | Contains rewards that are guaranteed to be given to players |  |
| `Type` | String | ✔️ | Type of reward source | `"Event"` |

## Reward Data

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=3 "Edit section's source code: Reward Data")]

