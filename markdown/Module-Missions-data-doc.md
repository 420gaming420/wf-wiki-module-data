---
title: "Module:Missions/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Missions/data/doc"
wiki_timestamp: "2025-11-25T03:43:42Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Missions/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Some junctions have moved around. Reflect on node progression changes. E.g. Pluto goes to Eris now and then Sedna. Mars goes to Deimos and then Jupiter now

Database of [Star Chart](/w/Star_Chart "Star Chart") mission nodes.

:   *Last updated: Tue, 25 Nov 2025 03:43:42 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Missions/data/doc?diff=0))*

## Contents

* [1 Mission Node Entry Schema](#Mission_Node_Entry_Schema)
* [2 Mission Type Entry Schema](#Mission_Type_Entry_Schema)
* [3 Mission Modifier Entry Schema](#Mission_Modifier_Entry_Schema)
* [4 Different Methods Of Indexing Data](#Different_Methods_Of_Indexing_Data)
* [5 Node Mastery EXP Research](#Node_Mastery_EXP_Research)
* [6 Data Validation](#Data_Validation)
  + [6.1 Checking for required keys](#Checking_for_required_keys)
  + [6.2 Validating data types of values](#Validating_data_types_of_values)
* [7 Mission Node Data](#Mission_Node_Data)

## Mission Node Entry Schema

[[edit source](/w/Module:Missions/data/doc?action=edit&section=1 "Edit section's source code: Mission Node Entry Schema")]

```lua
{
	CreditsReward = 0,
	DropTableAlias = "Drop table entry key in Module:DropTables/data",
	Enemy = "Enemy faction",
	InternalName = "SolNode0",
	Introduced = "Vanilla",
	Link = "Node article name",
	MaxLevel = 11,
	MinLevel = 6,
	Name = "Node name",
	NextNodes = { "" },
	Planet = "Planet name",
	PreviousNodes = { "" },
	Quotes = "Quotes article name",
	Tileset = "Tileset name",
	Type = "Mission type",
},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `AdditionalCreditReward` | Number (integer) | ❌ | Additional number of [Credits](/w/Credits "Credits") rewarded at end-of-mission (separate from Credit pickups from enemies/containers, hover over Credits in end-of-mission summary for itemized list) | `5000` |
| `Boss` | String | ❌ | For [Assassination](/w/Assassination "Assassination") missions, the corresponding boss' page name on the wiki | `"General Sargas Ruk"` |
| `CacheDropTableAlias` | String | ❌ | Key of associated [Resource Cache](/w/Resource_Cache "Resource Cache") or Railjack [Points of Interest](/w/Points_of_Interest "Points of Interest") [Drop Table](/w/Drop_Tables "Drop Tables") entry as stored in [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") | `"CorpusVeilProximaCaches"` |
| `CreditReward` | Number (integer) | ❌ | Number of [Credits](/w/Credits "Credits") rewarded at end-of-mission based the equation 1000 + 100 \* (Minimum Enemy Level - 1) (separate from Credit pickups from enemies/containers, hover over Credits in end-of-mission summary for itemized list) | `5000` |
| `DSResourceBonus` | Number (float) | ❌ | For [Dark Sectors](/w/Dark_Sectors "Dark Sectors"), the [Resource](/w/Resource "Resource") drop bonus as a decimal percentage | `0.1` |
| `DSWeapon` | String | ❌ | For [Dark Sectors](/w/Dark_Sectors "Dark Sectors"), the weapon class that recieves additional affinity bonus | `"Rifles"` |
| `DSWeaponBonus` | Number (float) | ❌ | For [Dark Sectors](/w/Dark_Sectors "Dark Sectors"), the [Affinity](/w/Affinity "Affinity") bonus as a decimal percentage for a specific type of weapon | `0.05` |
| `DSXPBonus` | Number (float) | ❌ | For [Dark Sectors](/w/Dark_Sectors "Dark Sectors"), the [Affinity](/w/Affinity "Affinity") bonus as a decimal percentage | `0.1` |
| `DropTableAlias` | String | ❌ | Key of associated end-of-mission or reward rotation [Drop Table](/w/Drop_Tables "Drop Tables") entry as stored in [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") | `"Survival1"` |
| `Drops` | Table (of strings) | ❌ | For [Assassination](/w/Assassination "Assassination") missions, the names of items that the boss drops components/blueprints for | `{ "Hydroid" }` |
| `Enemy` | String | ✔️ | Enemy faction name | `"Grineer"` |
| `ExtraDropTableAlias` | String | ❌ | Key of associated end-of-mission bonus [Drop Table](/w/Drop_Tables "Drop Tables") entry as stored in [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") | `"ConjunctionSurvival1Extra"` |
| `FighterMaxLevel` | Number | ❌ | For Empyrean missions, maximum starting fighter level | `68` |
| `FighterMinLevel` | Number | ❌ | For Empyrean missions, minimum starting fighter level | `62` |
| `Image` | String | ❌ | Optional image file name of mission as uploaded to the wiki | `"Plains of Eidolon.png"` |
| `InternalName` | String | ✔️ | Internal code name of mission node | `"SolNode0"` |
| `Introduced` | String | ❌ | The game version in which the node was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `IsArchwing` | Boolean | ❌ | Denotes whether or not a node is an [Archwing](/w/Archwing "Archwing") mission (not the same as [Railjack](/w/Railjack "Railjack")); default false | `true` |
| `IsCrossfire` | Boolean | ❌ | Denotes whether or not multiple factions are actively combating on the node | `false` |
| `IsDarkSector` | Boolean | ❌ | Denotes whether or not a node is a [Dark Sector](/w/Dark_Sector "Dark Sector") mission; default false | `true` |
| `IsHidden` | Boolean | ❌ | Denotes whether or node is hidden from players to select on Star Chart | `true` |
| `IsRailjack` | Boolean | ❌ | Denotes whether or not a node is an [Empyrean](/w/Empyrean "Empyrean") mission; default false | `true` |
| `IsTracked` | Boolean | ❌ | Denotes whether or not a node is counted towards [Player Profile](/w/Player_Profile "Player Profile") progress | `true` |
| `Link` | String | ✔️ | Page/article link to the mission node on the wiki | `"Lex (Node)"` |
| `MaxLevel` | Number (integer) | ✔️ | Maximum starting enemy level | `11` |
| `MinLevel` | Number (integer) | ✔️ | Minimum starting enemy level | `6` |
| `Name` | String | ✔️ | Mission node name | `"Kappa"` |
| `NextNodes` | Table (of strings) | ❌ | Name of the node(s) after current node on the Star Chart | `{ "Baal", "Morax" }` |
| `Other` | String | ❌ | A letter that corresponds to the map on [Defense#Defense Types](/w/Defense#Defense_Types "Defense") | `"F"` |
| `Pic` | String | ❌ | For [Assassination](/w/Assassination "Assassination") missions, the file name of the corresponding boss' sigil drop or the file name of the image associated with the mission node | `"CaptainVor_sigil_b.png"` or `"SolarisUnitedSigil.png"` |
| `Planet` | String | ✔️ | Name of region that node is on | `"Kuva Fortress"` |
| `PreviousNodes` | Table (of strings) | ❌ | Name of the node(s) before current node on the Star Chart | `{ "Stöfler", "Pavlov" }` |
| `Quotes` | String | ❌ | Name of the article containing transcriptions and audio of dialogue spoken in that mission | "Captain Vor/Quotes" |
| `RegionResources` | Table (of strings) | ❌ | An array of resource names that are possible drops from enemies and containers in that region. Automatically added to mission entries when script is executed so no need to add this key directly. | `{ "Ferrite", "Alloy Plate", "Argon Crystal", "Control Module" }` |
| `Requirements` | String | ❌ | Wikitext that describes a unique conditional that players have to meet before gaining access to a mission node (other than completing previous nodes) | `"Completion of [[The War Within]]"` or `"Must have [[Mutalist Alad V Assassinate Key]]"` |
| `Tileset` | String | ✔️ | [Tile set](/w/Tile_Sets "Tile Sets") that is used in mission | `"Grineer Forest"` |
| `Type` | String | ✔️ | Mission type | `"Survival"` |

## Mission Type Entry Schema

[[edit source](/w/Module:Missions/data/doc?action=edit&section=2 "Edit section's source code: Mission Type Entry Schema")]

```lua
		Assassination = {
			Name = "Assassination",
			Link = "Assasination",
			Introduced = "Vanilla",
			Index = 0,
			IsEndless = false,
			InternalName = "MT_ASSASSINATION",
			RewardRotation = "AABC",
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Index` | Number (integer) | ❌ | If known, the internal numerical index assigned to the mission type | `2` |
| `InternalName` | String | ✔️ | Internal code name of mission type | `"MT_CAPTURE"` |
| `IsEndless` | Boolean | ✔️ | If true, mission is endless meaning players can continue to get rewards after objective is complete | `true` |
| `Introduced` | String | ✔️ | The game version in which the mission type was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"29.5"` |
| `Link` | String | ✔️ | Page/article link to the mission type on the wiki | `"Orphix (Mission)"` |
| `Name` | String | ✔️ | Mission type name | `"Assassination"` |
| `RewardRotation` | String | ❌ | Describes the default reward rotation for endless missions. Note that [Arbitrations](/w/Arbitrations "Arbitrations") variant of nodes will differ. | `"AABC"` |

## Mission Modifier Entry Schema

[[edit source](/w/Module:Missions/data/doc?action=edit&section=3 "Edit section's source code: Mission Modifier Entry Schema")]

```lua
		["Arcana Isolation Vault Bounty"] = {
			Name = "Arcana Isolation Vault Bounty",
			Link = "Isolation Vault",
			LocationNote = "*[[Cambion Drift]], [[Deimos]]; must complete initial [[Isolation Vault]] Bounty to unlock access to Arcana Vaults from [[Mother]] outside of Vaults"
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Link` | String | ✔️ | Page/article link to the mission modifier on the wiki | `"Archon Hunt"` |
| `LocationNote` | String | ✔️ | Wikitext that briefly describes where players can encounter this modifier | `"*[[Orb Vallis]], [[Venus]]"` |
| `Name` | String | ✔️ | Mission modifier name | `"Sortie"` |

## Different Methods Of Indexing Data

[[edit source](/w/Module:Missions/data/doc?action=edit&section=4 "Edit section's source code: Different Methods Of Indexing Data")]

This module will also provide additional subtables under the `p.by` key that help developers access one or more mission nodes' data entries based on certain key-value matches:

```lua
local MissionData = mw.loadData('Module:Missions/data')

-- Find all nodes with the Interception mission type (i.e. Type = "Interception")
-- Note that all values from MissionData.by.Key.["SearchTerm"] will be table types
MissionData.by.Type["Interception"]

-- Equivalent to:
local interceptionNodes = {}
for name, nodeEntry in pairs(MissionData.MissionDetails) do
    if (nodeEntry.Type == "Interception") then
        table.insert(interceptionNodes, nodeEntry)
    end
end

-- Find all nodes with the name "Hydron" (i.e. Name = "Hydron")
MissionData.by.Name["Hydron"]
```

## Node Mastery EXP Research

[[edit source](/w/Module:Missions/data/doc?action=edit&section=5 "Edit section's source code: Node Mastery EXP Research")]

Some sources for research on Mastery EXP given by each node on first completion:

* <https://www.reddit.com/r/Warframe/comments/hwk6tg/node_by_node_solar_map_mastery_numbers/>
* <https://www.reddit.com/r/Warframe/comments/4rzu3v/anyone_know_how_the_new_star_chart_mastery_works/>

## Data Validation

[[edit source](/w/Module:Missions/data/doc?action=edit&section=6 "Edit section's source code: Data Validation")]

### Checking for required keys

[[edit source](/w/Module:Missions/data/doc?action=edit&section=7 "Edit section's source code: Checking for required keys")]

**Script error: No such module "Missions/data/validate".**

### Validating data types of values

[[edit source](/w/Module:Missions/data/doc?action=edit&section=8 "Edit section's source code: Validating data types of values")]

**Script error: No such module "Missions/data/validate".**

## Mission Node Data

[[edit source](/w/Module:Missions/data/doc?action=edit&section=9 "Edit section's source code: Mission Node Data")]

