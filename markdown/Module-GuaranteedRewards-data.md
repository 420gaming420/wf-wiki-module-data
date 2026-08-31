---
title: "Module:GuaranteedRewards/data"
wiki_url: "https://wiki.warframe.com/w/Module/GuaranteedRewards/data"
wiki_timestamp: "2022-09-13T19:00:47Z"
---

Database for "guaranteed" rewards that are merit-based after completing some sort of milestone. Typically reserved for events that guarantee a reward to players that complete some sort of task. [Quest](/w/Quest "Quest") rewards are also valid content to store in here.

## Reward Entry Schema

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=T-1 "Edit section's source code: Reward Entry Schema")]

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

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=T-2 "Edit section's source code: Source Entry Schema")]

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

[[edit source](/w/Module:GuaranteedRewards/data/doc?action=edit&section=T-3 "Edit section's source code: Reward Data")]

---

```lua
return {
	["Arid Fear"] = {
		Name = "Arid Fear",
		Link = "Operation: Arid Fear",
		Rewards = {
			{ "Shred", "Mod" }, { "Vigor", "Mod" }, { "Lethal Torrent", "Mod" }
		},
		Type = "Event" 
	},
	["Breeding Grounds"] = {
		Name = "Breeding Grounds",
		Link = "Operation: Breeding Grounds",
		Rewards = {
			{ "Thermite Rounds", "Mod" },
			{ "Scattering Inferno", "Mod" },
			{ "Scorch", "Mod" },
			{ "Volcanic Edge", "Mod" } 
		},
		Type = "Event" 
	},
	["Buried Debts"] = {
		Name = "Buried Debts",
		Link = "Operation: Buried Debts",
		Rewards = {
			{ "Amalgam Shotgun Barrage", "Mod" },
			{ "Amalgam Serration", "Mod" },
			{ "Amalgam Barrel Diffusion", "Mod" },
			{ "Amalgam Organ Shatter", "Mod" } 
		},
		Type = "Event" 
	},
	["Cryotic Front"] = {
		Name = "Cryotic Front",
		Link = "Operation: Cryotic Front",
		Rewards = {
			{ "Rime Rounds", "Mod" },
			{ "Frigid Blast", "Mod" },
			{ "Frostbite", "Mod" },
			{ "Vicious Frost", "Mod" } 
		},
		Type = "Event" 
	},
	["Daily Tribute"] = {
		Name = "Daily Tribute",
		Link = "Daily Tribute",
		Rewards = {
			{ "Primed Fury", "Mod" },
			{ "Primed Vigor", "Mod" },
			{ "Primed Shred", "Mod" },
			{ "Primed Sure Footed", "Mod" },
			{ "Azima", "Weapon" },
			{ "Sigma & Octantis", "Weapon" },
			{ "Zenistar", "Weapon" },
			{ "Zenith", "Weapon" },
		},
		Type = "Daily Tribute" 
	},
	["Daily Tribute Day 5"] = {
		Name = "Daily Tribute Day 5",
		Link = "Daily Tribute",
		Rewards = {
			{ "Endo", "Mod", 1000 },
			{ "Credits", "Credits", 25000 },
		},
		Type = "Daily Tribute" 
	},
	["Eyes of Blight"] = {
		Name = "Eyes of Blight",
		Link = "Operation: Eyes of Blight",
		Rewards = { { "Magma Chamber", "Mod" }, { "Searing Steel", "Mod" } },
		Type = "Event" 
	},
	["False Profit"] = {
		Name = "False Profit",
		Link = "Operation: False Profit",
		Rewards = {
			{ "Crash Course", "Mod" },
			{ "Full Contact", "Mod" },
			{ "Pummel", "Mod" },
			{ "Collision Force", "Mod" } 
		},
		Type = "Event" 
	},
	["Gate Crash"] = {
		Name = "Gate Crash",
		Link = "Operation: Gate Crash",
		Rewards = {
			{ "Fanged Fusillade", "Mod" },
			{ "Sweeping Serration", "Mod" },
			{ "Maim", "Mod" },
			{ "Buzz Kill", "Mod" } 
		},
		Type = "Event" 
	},
	["Mastery Rank 30"] = {
		Name = "Mastery Rank 30",
		Link = "Mastery Rank",
		Rewards = {
			{ "Umbra Forma", "Resource", 3 }
		},
		Type = "Mastery Rank"
	},
	["Legendary Ranks"] = {
		Name = "Legendary Ranks",
		Link = "Mastery Rank",
		Rewards = {
			{ "Legendary Core", "Mod", 1 }
		},
		Type = "Mastery Rank"
	},
	["Mutalist Incursions"] = {
		Name = "Mutalist Incursions",
		Link = "Operation: Mutalist Incursions",
		Rewards = {
			{ "Piercing Caliber", "Mod" },
			{ "Breach Loader", "Mod" },
			{ "Bore", "Mod" },
			{ "Auger Strike", "Mod" },
			{ "High Voltage", "Mod" },
			{ "Shell Shock", "Mod" },
			{ "Jolt", "Mod" },
			{ "Voltaic Strike", "Mod" } 
		},
		Type = "Event" 
	},
	["Profit-Taker Phase 3"] = {
		Name = "Profit-Taker Phase 3",
		Link = "Heist",
		Rewards = {
			{ "Gravimag", "Resource" },
		},
		Type = "First Completion"
	},
	["Sling-Stone"] = {
		Name = "Sling-Stone",
		Link = "Operation Sling-Stone",
		Rewards = {
			{ "Rifle Ammo Mutation", "Mod" },
			{ "Sniper Ammo Mutation", "Mod" },
			{ "Shotgun Ammo Mutation", "Mod" },
			{ "Pistol Ammo Mutation", "Mod" },
			{ "Arrow Mutation", "Mod" } 
		},
		Type = "Event" 
	},
	["Tethra's Doom"] = {
		Name = "Tethra's Doom",
		Link = "Tethra's Doom",
		Rewards = {
			{ "High Voltage", "Mod" },
			{ "Shell Shock", "Mod" },
			{ "Jolt", "Mod" },
			{ "Voltaic Strike", "Mod" } 
		},
		Type = "Event" 
	},
	["The Cicero Crisis"] = {
		Name = "The Cicero Crisis",
		Link = "The Cicero Crisis",
		Rewards = {
			{ "Malignant Force", "Mod" },
			{ "Toxic Barrage", "Mod" },
			{ "Pistol Pestilence", "Mod" },
			{ "Virulent Scourge", "Mod" } 
		},
		Type = "Event" 
	},
}
```

