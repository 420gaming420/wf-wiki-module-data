---
title: "Module:DropTables/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/DropTables/data/doc"
wiki_timestamp: "2025-02-23T20:17:51Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:DropTables/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

[Update 33.0](/w/Update_33#Update_33.0 "Update 33") (2023-04-26) and Duviri

Manually updated fork of the public [Drop Tables](/w/Drop_Tables "Drop Tables") provided by DE:

* <https://warframe-web-assets.nyc3.cdn.digitaloceanspaces.com/uploads/cms/hnfvc0o3jnfvc873njb03enrf56.html> or
* <https://www.warframe.com/droptables>

See [Module:DropTables](/w/Module:DropTables "Module:DropTables") to see what various things this is being used for right now.

:   *Last updated: Sun, 23 Feb 2025 20:17:51 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:DropTables/data/doc?diff=0))*

## Contents

* [1 How To Update Drop Tables](#How_To_Update_Drop_Tables)
* [2 Mod Drop Table Schema](#Mod_Drop_Table_Schema)
* [3 General Drop Table Schema](#General_Drop_Table_Schema)
* [4 Enemies Entry Schema](#Enemies_Entry_Schema)
* [5 Missions Entry Schema](#Missions_Entry_Schema)
* [6 Rewards Subtable Collection](#Rewards_Subtable_Collection)
  + [6.1 Viewing Contents via API Call](#Viewing_Contents_via_API_Call)
* [7 Differences Between Official Repo And Wiki's Drop Tables](#Differences_Between_Official_Repo_And_Wiki's_Drop_Tables)
* [8 Updating Relic Drop Locations Notes](#Updating_Relic_Drop_Locations_Notes)
  + [8.1 Prime Item Ducat Sell Price](#Prime_Item_Ducat_Sell_Price)
  + [8.2 Creating New Void Relic Pages](#Creating_New_Void_Relic_Pages)
  + [8.3 Module:DropTables/data](#Module:DropTables/data)
    - [8.3.1 Examples](#Examples)
      * [8.3.1.1 U31.7 - Khora Prime](#U31.7_-_Khora_Prime)
      * [8.3.1.2 U31.3 - Garuda Prime](#U31.3_-_Garuda_Prime)
      * [8.3.1.3 U31.0 - Harrow Prime](#U31.0_-_Harrow_Prime)
* [9 References](#References)
* [10 Drop Table Data](#Drop_Table_Data)

## How To Update Drop Tables

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=1 "Edit section's source code: How To Update Drop Tables")]

1. Login to your wiki account and click "Edit Source" at the top right corner of the page. These pages are usually protected from anonymous editors.
   * If you are an anon and don't want to make an account, you can contribute by writing exactly what you want changed in reference to the official drop tables on the talk page ([Module talk:DropTables/data](/w/Module_talk:DropTables/data "Module talk:DropTables/data")) to streamline the update process for editors.
   * Newly created accounts have to wait ~3 days until their account becomes "autoconfirmed".
2. CTRL+F the name of the relevant drop table, usually typing the mission type/enemy name should suffice.
   * If you still can't find the relevant drop table then you can reference the "Locations" section on any mission type article in the navigation box below to see what drop table alias a particular mission node uses. These drop table aliases are editor-defined for ease of reference since DE doesn't publicly name their drop tables.
     + Alternatively, you can go directly to the mission data stored on the wiki [Module:Missions/data](/w/Module:Missions/data "Module:Missions/data") and see exactly what drop table alias a particular node is mapped to.
   * For [bounties](/w/Bounty "Bounty"), search by the name of the hub that a particular bounty is associated with (e.g. [Cetus](/w/Cetus "Cetus"), [Fortuna](/w/Fortuna "Fortuna"), [Necralisk](/w/Necralisk "Necralisk")) and its enemy level range. [Zariman Ten Zero](/w/Zariman_Ten_Zero "Zariman Ten Zero") bounties are called "Zariman".
3. Change drop names or drop chances in accordance to the below schemas. Use EN localization for item names.
4. Updated data should proliferate across relevant pages across the wiki. If something isn't changed on an article then you can purge the page's cache by adding the query parameter `?action=purge` at the end of the URL.

| [Missions](/w/Mission "Mission") [Edit](https://wiki.warframe.com/w/Template:MissionsNav?action=edit) | | | |
| --- | --- | --- | --- |
| PvE | [Star Chart](/w/Star_Chart "Star Chart") | Standard | [Assassination](/w/Assassination "Assassination") • [Capture](/w/Capture "Capture") • [Exterminate](/w/Exterminate "Exterminate") ([Abyssal Zone](/w/Abyssal_Zone "Abyssal Zone")) • [Hijack](/w/Hijack "Hijack") • [Mobile Defense](/w/Mobile_Defense "Mobile Defense") • [Rescue](/w/Rescue "Rescue") • [Sabotage](/w/Sabotage "Sabotage") ([Assault](/w/Assault "Assault") • [Hive](/w/Hive_Sabotage "Hive Sabotage") • [Orokin](/w/Orokin_Sabotage "Orokin Sabotage") • [Reactor](/w/Reactor_Sabotage "Reactor Sabotage") • [Sealab](/w/Sealab_Sabotage "Sealab Sabotage")) • [Spy](/w/Spy "Spy") |
| Endless | [Alchemy](/w/Alchemy "Alchemy") • [Defection](/w/Defection "Defection") • [Disruption](/w/Disruption "Disruption") • [Defense](/w/Defense "Defense") ([Mirror](/w/Mirror_Defense "Mirror Defense")) • [Excavation](/w/Excavation "Excavation") • [Infested Salvage](/w/Infested_Salvage "Infested Salvage") • [Interception](/w/Interception "Interception") • [Legacyte Harvest](/w/Legacyte_Harvest "Legacyte Harvest") • [Survival](/w/Survival "Survival") ([Conjunction](/w/Conjunction_Survival "Conjunction Survival"), [Hell-Scrub](/w/Hell-Scrub "Hell-Scrub")) • [Void Armageddon](/w/Void_Armageddon "Void Armageddon") • [Void Cascade](/w/Void_Cascade "Void Cascade") • [Void Flood](/w/Void_Flood "Void Flood") |
| [Free Roam](/w/Landscape "Landscape") | [Bounty](/w/Bounty "Bounty") ([Isolation Vault](/w/Isolation_Vault "Isolation Vault"), [Heist](/w/Heist "Heist")) |
| [Arena](/w/Arena "Arena") | [The Index](/w/The_Index "The Index") • [Rathuum](/w/Rathuum "Rathuum") |
| Special | [Ascension](/w/Ascension "Ascension") • [Faceoff](/w/Faceoff "Faceoff") • [Follie's Hunt](/w/Follie%27s_Hunt "Follie's Hunt") • [Granum Void](/w/Granum_Void "Granum Void") • [Junction](/w/Junction "Junction") • [Netracells](/w/Netracells "Netracells") • [Recovery](/w/Recovery "Recovery") • [Sanctuary Onslaught](/w/Sanctuary_Onslaught "Sanctuary Onslaught") • [Shrine Defense](/w/Shrine_Defense "Shrine Defense") |
| Archimedea | [Deep Archimedea](/w/Deep_Archimedea "Deep Archimedea") • [Temporal Archimedea](/w/Temporal_Archimedea "Temporal Archimedea") |
| [Dark Refractory](/w/Dark_Refractory "Dark Refractory") | [The Descendia](/w/The_Descendia "The Descendia") • [The Perita Rebellion](/w/The_Perita_Rebellion "The Perita Rebellion") • [The Guilty](/w/The_Guilty "The Guilty") |
| [Archwing](/w/Archwing "Archwing") | [Exterminate](/w/Exterminate "Exterminate") • [Interception](/w/Interception "Interception") • [Mobile Defense](/w/Mobile_Defense "Mobile Defense") • [Pursuit](/w/Pursuit "Pursuit") • [Rush](/w/Rush_(Archwing) "Rush (Archwing)") • [Sabotage](/w/Sabotage#Archwing_Reactor_Sabotage "Sabotage") |
| [Empyrean](/w/Empyrean "Empyrean") | Standard | [Exterminate (Railjack)](/w/Exterminate#Empyrean "Exterminate") • [Skirmish (Railjack)](/w/Skirmish "Skirmish") • [Spy (Railjack)](/w/Spy "Spy") • [Volatile (Railjack)](/w/Volatile "Volatile") |
| Endless | [Defense (Railjack)](/w/Defense#Empyrean "Defense") • [Orphix (Railjack)](/w/Orphix_(Mission) "Orphix (Mission)") • [Survival (Railjack)](/w/Survival "Survival") |
| [Free Roam](/w/Free_Space "Free Space") | [Free Flight](/w/Free_Space "Free Space") |
| [Duviri](/w/Duviri "Duviri") | [Free Roam](/w/Landscape "Landscape") | [The Duviri Experience](/w/The_Duviri_Experience "The Duviri Experience") • [The Lone Story](/w/The_Lone_Story "The Lone Story") • [Isleweaver](/w/Isleweaver "Isleweaver") |
| Endless | [The Circuit](/w/The_Circuit "The Circuit") |
| [PvP](/w/PvP "PvP") | [Conclave](/w/Conclave "Conclave") | | [Cephalon Capture](/w/Cephalon_Capture "Cephalon Capture") • [Annihilation](/w/Annihilation "Annihilation") • [Team Annihilation](/w/Team_Annihilation "Team Annihilation") • [Lunaro](/w/Lunaro "Lunaro") |
| Other | | [Duel](/w/Duel "Duel") • [Faceoff](/w/Faceoff "Faceoff") |
| [Ludoplex](/w/Ludoplex "Ludoplex") | | | [Caliber Chicks 2](/w/Caliber_Chicks_2 "Caliber Chicks 2") • [Frame Fighter](/w/Frame_Fighter "Frame Fighter") • [Happy Zephyr](/w/Happy_Zephyr "Happy Zephyr") • [Ollie's Crash Course](/w/Ollie%27s_Crash_Course "Ollie's Crash Course") • [Wyrmius](/w/Wyrmius "Wyrmius") |
| Mission Modifiers | | | [Arbitrations](/w/Arbitrations "Arbitrations") • [Archon Hunt](/w/Archon_Hunt "Archon Hunt") • [Break Narmer](/w/Break_Narmer "Break Narmer") • [Crossfire](/w/Crossfire "Crossfire") • [Dark Sectors](/w/Dark_Sectors "Dark Sectors") • [Empowered Enemies](/w/Empowered_Enemies "Empowered Enemies") • [Invasions](/w/Invasion "Invasion") • [Kuva Siphon](/w/Kuva_Siphon "Kuva Siphon") • [Adversary System](/w/Adversary_System "Adversary System") ([Kuva Lich](/w/Kuva_Lich "Kuva Lich") • [Sisters of Parvos](/w/Sisters_of_Parvos "Sisters of Parvos") • [Technocyte Coda](/w/Technocyte_Coda "Technocyte Coda")) • [Nightmare Mode](/w/Nightmare_Mode "Nightmare Mode") • [Sorties](/w/Sortie "Sortie") • [The Steel Path](/w/The_Steel_Path "The Steel Path") • [Void Fissures](/w/Void_Fissure "Void Fissure") |
| Interactibles | | | [Data Vault](/w/Data_Vault "Data Vault") • [Defense Objects](/w/Defense_Objects "Defense Objects") • [Environmental Hazards](/w/Environmental_Hazards "Environmental Hazards") • [Friendship Door](/w/Friendship_Door "Friendship Door") • [Granum Void](/w/Granum_Void "Granum Void") • [Mission Item](/w/Mission_Item "Mission Item") • [Resource Cache](/w/Resource_Cache "Resource Cache") • [Synthesis](/w/Synthesis "Synthesis") |
| Mechanics | | | [Drop Tables](/w/Drop_Tables "Drop Tables") ([AABC](/w/AABC "AABC")) • [Enemy Level Scaling](/w/Enemy_Level_Scaling "Enemy Level Scaling") • [Mission Locator](/w/Mission_Locator "Mission Locator") • [Mission Rewards](/w/Mission_Rewards "Mission Rewards") • [Nightwave](/w/Nightwave "Nightwave") • [Search Pulse](/w/Search_Pulse "Search Pulse") • [Tile Sets](/w/Tile_Sets "Tile Sets") |

## Mod Drop Table Schema

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=2 "Edit section's source code: Mod Drop Table Schema")]

```lua
{
	{ "Endo", "Resource", 75.88, 15 },
	{ "Hawk Eye", "Mod", 7.37 },
	{ "Shotgun Barrage", "Mod", 7.37 },
	{ "Endo", "Resource", 7.37, 50 },
	{ "Shock Absorbers", "Mod", 1.01 },
	{ "Endo", "Resource", 1.01, 80 } 
}
```

1. First element in each table element will be the mod's name as a string (required)
2. Second element in each table element will be the item's type as a string (required)
3. Third element in each table element will be the individual drop chance of said mod as a float (required)
4. Forth element in each table element will represent drop count of [Endo](/w/Endo "Endo") as an integer (required if first element is "Endo")

## General Drop Table Schema

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=3 "Edit section's source code: General Drop Table Schema")]

```lua
{
	{ "Morphic Transformer", "Mod", 5.64 },
	{ "Automatic Trigger", "Mod", 38.72 },
	{ "Phaedra Receiver", "Item", 5.64 },
	{ "Extend", "Mod", 38.72 },
	{ "Shell Rush", "Mod", 5.64 },
	{ "Shell Rush", "Mod", 5.64 } 
}
```

1. First element in each table element will be the item's name as a string (required)
2. Second element in each table element will represent item type as a string (required)
   * Possible values include `"Mod", "Blueprint", "Relic", "Resource", "Arcane", "Item", "Scene"`
3. Third element in each table element will be the individual drop chance of said item as a float (required)
4. Fourth element in each table element will represent drop count of said item as an integer (optional)

## Enemies Entry Schema

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=4 "Edit section's source code: Enemies Entry Schema")]

```lua
		["Enemy Name"] = {
			ModChance = 3,
			Mods = {
				{ "Mod 1 Name", "Mod", 25 },
				{ "Mod 2 Name", "Mod", 25 },
				{ "Endo", "Resource", 25, 15 },
				{ "Endo", "Resource", 25, 80 }
			},
			Name = "Enemy Name",
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `_IgnoreEntry` | Boolean | ❌ | Denotes drop tables that are in the official repository but should be ignored when parsing tables for the wiki since its contents cannot be dropped in-game | `true` |
| `BlueprintChance` | Number (float) | ❌ | [Blueprint](/w/Blueprints "Blueprints")/Item drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `5` |
| `Blueprints` | Table (of tables) | ❌ | Blueprint/Item drop table contents as seen in the official drop table repo, each table element is a table that contains the name of blueprint/item and the percentage chance of that blueprint/item dropping. Required if `BlueprintChance` is a non-nil value. | `{ { "War Blade", 50 }, { "War Hilt", 50 } }` |
| `ItemChance` | Number (float) | ❌ | Additional Items drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `100` |
| `Items` | Table (of tables) | ❌ | Additional Items drop table contents as seen in the official drop table repo, each table element is a table that contains the name of item and the percentage chance of that item dropping. Required if `ItemChance` is a non-nil value. | `{ { "Powercell", 100 } }` |
| `ModChance` | Number (float) | ❌ | [Mod](/w/Mods "Mods") drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `3` |
| `Mods` | Table (of tables) | ❌ | Mod drop table contents as seen in the official drop table repo, each table element is a table that contains the name of mod and the percentage chance of that mod dropping; if reward is [Endo](/w/Endo "Endo"), also add a third element containing the amount of Endo rewarded. Required if `ModChance` is a non-nil value. | ```lua { 	{ "Regen", "Mod", 18.97 }, 	{ "Calculated Redirection", "Mod", 18.97 }, 	{ "Rupture", "Mod", 18.97 }, 	{ "Endo", "Resource", 18.97, 15 }, 	{ "Convulsion", "Mod", 7.37 }, 	{ "Speed Trigger", "Mod", 7.37 }, 	{ "Fracturing Wind", "Mod", 7.37 }, 	{ "Endo", "Resource", 2.01, 80 }  } ``` |
| `Name` | String | ✔️ | Name of enemy | `"Elite Lancer"` |
| `PigmentChance` | Number (float) | ❌ | [Pigment](/w/Pigment "Pigment") drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive. Note that in-game, this chance only applies if the [Clan](/w/Clan "Clan") that player is in is actively researching the pigment in question | `100` |
| `Pigments` | Table (of tables) | ❌ | [Pigment](/w/Pigment "Pigment") drop table contents. Note that in-game, this chance only applies if the [Clan](/w/Clan "Clan") that player is in is actively researching the pigment in question. Required if `PigmentChance` is a non-nil value. | ```lua { 	{ "Boiler Red Pigment", "Resource", 100, 2 } } ``` |
| `RelicChance` | Number (float) | ❌ | [Resource](/w/Resources "Resources") drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `20` |
| `Relics` | Table (of tables) | ❌ | [Relic](/w/Void_Relic "Void Relic") drop table contents as seen in the official drop table repo, each table element is a table that contains the name of relic and the percentage chance of that relic dropping. Required if `RelicChance` is a non-nil value. | ```lua { 	{ "Lith T7", "Relic", 15.49 }, 	{ "Lith N7", "Relic", 15.49 }, 	{ "Meso B5", "Relic", 15.49 }, 	{ "Meso S10", "Relic", 15.49 }, 	{ "Meso B6", "Relic", 15.49 }, 	{ "Neo N16", "Relic", 3.76 }, 	{ "Neo T5", "Relic", 3.76 }, 	{ "Neo N17", "Relic", 3.76 }, 	{ "Axi A14", "Relic", 3.76 }, 	{ "Axi I2", "Relic", 3.76 }, 	{ "Axi M2", "Relic", 3.76 }  } ``` |
| `ResourceChance` | Number (float) | ❌ | [Resource](/w/Resources "Resources") drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `7` |
| `Resources` | Table (of tables) | ❌ | Resource drop table contents as seen in the official drop table repo, each table element is a table that contains the name of resource and the percentage chance of that resource dropping. Required if `ResourceChance` is a non-nil value. | `{ { "Region Resource", 77.44 }, { "Nav Coordinate", 22.56 } }` |
| `SigilChance` | Number (float) | ❌ | [Sigil](/w/Sigils "Sigils") drop table chance of rolling its rewards as a percentage; a value between 0 exclusive and 100 inclusive | `100` |
| `Sigils` | Table (of tables) | ❌ | Sigil drop table contents as seen in the official drop table repo, each table element is a table that contains the name of sigil and the percentage chance of that sigil dropping. Required if `SigilChance` is a non-nil value. | `{ { "Alad V Sigil", 100 } }` |

## Missions Entry Schema

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=5 "Edit section's source code: Missions Entry Schema")]

```lua
		Spy1 = {
			Alias = "Spy1",
			Link = "Spy",
			Name = "Tier 1",
			Rewards = {
				A = {
					{ "Credits Cache", "Credits", 14.29, 1500 },
					{ "Credits Cache", "Credits", 14.29, 1500 },
					{ "Endo", "Resource", 14.29, 100 },
					{ "Endo", "Resource", 14.29, 100 },
					{ "Reflection", "Mod", 14.29 },
					{ "Reflex Guard", "Mod", 14.29 },
					{ "Parry", "Mod", 14.29 } 
				},
				B = {
					{ "Lith G4", "Relic", 14.29 },
					{ "Lith T7", "Relic", 14.29 },
					{ "Lith K7", "Relic", 14.29 },
					{ "Lith N7", "Relic", 14.29 },
					{ "Lith G4", "Relic", 14.29 },
					{ "Lith I1", "Relic", 14.29 },
					{ "Lith N8", "Relic", 14.29 } 
				},
				C = {
					{ "Master Key", "Mod", 10 },
					{ "Reflection", "Mod", 10 },
					{ "Parry", "Mod", 10 },
					{ "Heavy Impact", "Mod", 10 },
					{ "Serration", "Mod", 10 },
					{ "Hornet Strike", "Mod", 10 },
					{ "Metal Auger", "Mod", 10 },
					{ "Volcanic Edge", "Mod", 10 },
					{ "Vicious Frost", "Mod", 10 },
					{ "Ivara Systems Blueprint", "Blueprint", 10 } 
				} 
			},
			Type = "Spy" 
		},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Alias` | String | ✔️ | User-defined name for the drop table group. Many missions share the same drop tables so this is how we refer to a specific drop table group. `"Survival1"` |
| `InternalName` | String | ❌ | The full unique name of a drop table formatted as a file path | `"/Lotus/Types/Game/MissionDecks/InvasionRewards"` |
| `Link` | String | ✔️ | Name of page on the wiki of the mission associated with drop table | `"Spy"` |
| `Name` | String | ✔️ | User-defined name of drop table to be displayed to readers | `"Tier 1 Spy"` |
| `Rewards` | Table (of key-value pairs) | ✔️ | Contains at least three drop tables (named A, B, and C) associated with a specific drop table group. |  |
| `Tier` | String | ✔️ | Name of tier associated with mission type for the drop table | `"All"` or `"Tier 2"` |
| `Type` | String | ✔️ | Name of mission type associated with drop table | `"Survival"` |

## Rewards Subtable Collection

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=6 "Edit section's source code: Rewards Subtable Collection")]

Any reward entries added to the `Enemies` and `Missions` collections are automatically populated into the Rewards collection, indexed by item name and with the following schema:

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| Number index | Table (of table entries) | ✔️ | Each item name is mapped to an array-like table containing table entries about their drop source. | ```lua ["Ambassador Blueprint"] = { 		{ 			[1] = "Missions", 			[2] = "VeilProximaSurvival", 			[3] = "C" 			[4] = 2, 			Entry = { "Ambassador Blueprint", "Blueprint", 16.67 }, 			Probability: 0.1667, 			Source = reference to original table entry, 		}, 		{ 			[1] = "Missions", 			[2] = "NeptuneProximaSurvival", 			[3] = "C", 			[4] = 5, 			Entry = { "Ambassador Blueprint", "Blueprint", 8.33 }, 			Probability = 0.0833, 			Source = reference to original table entry, 		}, 			[1] = "Missions", 			[2] = "PlutoProximaSurvival", 			[3] = "C", 			[4] = 5, 			Entry = { "Ambassador Blueprint", "Blueprint", 8.33 }, 			Probability = 0.0833, 			Source = reference to original table entry, 		}, 		{ 			[1] = "Missions", 			[2] = "VenusProximaSurvival", 			[3] = "C", 			[4] = 5, 			Entry = { "Ambassador Blueprint", "Blueprint", 8.33 }, 			Probability = 0.0833, 			Source = reference to original table entry, 		}, } ``` |

### Viewing Contents via API Call

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=7 "Edit section's source code: Viewing Contents via API Call")]

[![](/images/thumb/CephalonSimaris.jpg/60px-CephalonSimaris.jpg?4a8c5)](/w/Cephalon_Simaris "Cephalon Simaris")

*"Hunter, I have temporarily disabled that ability."*

This article contains JavaScript scripts that users can run locally in their browser's console or machine. As a warning, which goes for any scripts you copy/run from the Internet, *MAKE SURE YOU UNDERSTAND THE CODE BEFORE RUNNING IT LOCALLY FOR YOUR OWN SECURITY!* Contact an [admin](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators") if you have any concerns or questions about a script.

For debugging purposes in browser console:

```lua
let origin = "https://wiki.warframe.com";
// MediaWiki's Action API endpoint
let path = "/api.php";
// Passing Lua code to Action API to convert Lua tables containing drop table data into JSON
let params = {
	action: "scribunto-console",
	format: "json",
	title: "Module:DropTables/data",
	content: "",
	question: `
local DropData = require('Module:DropTables/data').Rewards
local json = require('Module:JSON')
print(json.stringify(DropData))`,
	clear: 1
};

// [ ["action", "scribunto-console"], ["format","json"], ... ] to "action=scribunto-console&format=json&..."
let queryString = new URLSearchParams([ ...Object.entries(params) ]).toString();

let url = new URL(`${origin}${path}?${queryString}`);

fetch(url)
	.then((data) => data.json())
	.then((json) => {
		if (json.print !== undefined) {
			console.log(JSON.parse(json.print));
		} else {
			throw json.html;	// Lua script error has occurred
		}
	})
	.catch((error) => console.log(error));
```

## Differences Between Official Repo And Wiki's Drop Tables

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=8 "Edit section's source code: Differences Between Official Repo And Wiki's Drop Tables")]

**The official drop table repository and the wiki's repo are not one-to-one, just as the official repo is not one-to-one with actual in-game drop tables.** Entries are manually edited and audited for the purposes of rendering content properly on the wiki. **DO NOT ASSUME THIS IS THE SAME AS THE OFFICIAL REPO OR IN-GAME DROP TABLES.**

Wiki's repo

* [Void Relics](/w/Void_Relic "Void Relic") do not have " Relic" in their name unlike in the official repo.
* Chassis components for gun weapons are named "<Weapon\_Name> Gun Chassis" instead of "<Weapon\_Name> Chassis" to differentiate between Warframe chassis and weapon chassis
* Includes the chances that a new [Invasion](/w/Invasion "Invasion") node will roll a specific reward for both sides. This data was sourced from a datamined resource which may or may not be outdated.
* Includes [Orokin Tower Containers](/w/Orokin_Tower#Treasure_Rooms "Orokin Tower")
* Includes [Requiem Relic](/w/Requiem_Relic "Requiem Relic") drop chances of [Kuva Thralls](/w/Kuva_Thrall "Kuva Thrall") and [Hounds](/w/Hound "Hound")
* Enemy names will be formatted to their in-game representation (like "Raptor Mt" to "[Raptor MT](/w/Raptor_MT "Raptor MT")")
  + "Nechramech" is renamed to "Necramech" to match in-game presentation
  + Duplicate "Vomvalyst" entry is not included in wiki's repo. Use "Eidolon Vomvalyst" instead.
  + Exception would be "MOA" as in the Corpus enemy. Game is inconsistent with capitalization, using both "MOA" and "Moa". "MOA" is the original spelling.
* Drop chances may be rounded to more decimal places than two
* [Void Relic](/w/Void_Relic "Void Relic") drop tables are stored in [Module:Void/data](/w/Module:Void/data "Module:Void/data") and we only store the items in relic drop tables since drop chances at different relic refinements are the same across all relics (i.e. drop chances can be derived, no need to store additional data)
* Since some mission types of the same tier/difficulty share drop tables, we will not store duplicate drop tables in the wiki's repo to save space
* Contains [Pigment](/w/Pigment "Pigment") drop chance data
* For items that appear more than once in the same drop table, we consolidate these drop chances into one entry for simplicity and for sorting by highest/lowest drop chances in wikitables, even if that is not the actual internal implementation
  + For example, as of 2022-12-14, we see duplicate [Void Relic](/w/Void_Relic "Void Relic") entries for Void/Taranis (Defense) Rotation A drop table[[1]](#cite_note-1)

Official repo

* Contains drop tables of outdated event/Star Chart nodes like [Camenae](/w/Camenae?action=edit&redlink=1 "Camenae (page does not exist)"), Sedna (Defense) and [Viver](/w/Viver "Viver"), Eris (Caches)
* Contains drop tables of enemies that cannot be normally spawned like "Terra Cestra Manker" or "Kuva Lich Agor Rok (Level 0 - 69)"
* Contains entries that share the name as others like Common Corpus Storage Container. In the wiki's repo, the second instance of these drop tables will have " (2)" appended to the name so that keys stay unique.
* Labels all Railjack mission nodes as the "Skirmish" mission type. The wiki uses the mission type as shown in menus in-game.
* May contain unreleased content[[2]](#cite_note-2)

## Updating Relic Drop Locations Notes

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=9 "Edit section's source code: Updating Relic Drop Locations Notes")]

*This section is [transcluded](https://en.wikipedia.org/wiki/Help:Transclusion "wikipedia:Help:Transclusion") from [Module:Void/data/doc § Updating Notes](/w/Module:Void/data/doc#Updating_Notes "Module:Void/data/doc"). To change it, please [edit the transcluded page](https://wiki.warframe.com/w/Module:Void/data/doc?action=edit).*

Every [Prime Access](/w/Prime_Access "Prime Access") (once every ~3 months or financial quarter), DE will release new Void Relics that will contain at least one component/blueprint of the new Primes released. In addition, the oldest available Primes' relics will be removed from the game's [Drop Tables](/w/Drop_Table "Drop Table") to make room for the new relics and to not dilute the drop tables further. In some cases, newer/recent Prime items' parts would be unavailable to farm when DE removes these old relics, so they will add additional relics (separate from the newly released Primes) to make these items farmable.

It takes about 1-3 hours of manually editing to fully update [Module:Void/data](/w/Module:Void/data "Module:Void/data") and [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") with the latest Prime content.

Updating the vaulted status of relics here will automatically tag the appropriate item articles with [Template:ItemVault](/w/Template:ItemVault "Template:ItemVault").

### Prime Item Ducat Sell Price

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-1 "Edit section's source code: Prime Item Ducat Sell Price")]

Editors do not need to add [![](/images/thumb/OrokinDucats.png/32px-OrokinDucats.png?23930)](/w/Orokin_Ducats "Orokin Ducats") [Orokin Ducats](/w/Orokin_Ducats "Orokin Ducats") sell prices to every item manually. Prices can be determined based on drop rarity:

* Rare parts are worth 100 Ducats
* Uncommon parts are worth 45 Ducats
* Common parts are worth 15 Ducats
* If an item part is a uncommon and rare drop in different relics, it is worth 65 Ducats instead[[3]](#cite_note-3)
* If an item part is a common and uncommon drop in different relics, it is worth 25 Ducats instead
* If an item part is a common and rare drop in different relics, it is worth 25 Ducats instead

If there is item that deviates from this rule, please update the `DUCAT_EXCEPTIONS` table.

### Creating New Void Relic Pages

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-2 "Edit section's source code: Creating New Void Relic Pages")]

Use [Template:VoidRelicArticle](/w/Template:VoidRelicArticle "Template:VoidRelicArticle") as reference for creating new Void Relic articles. See [WARFRAME Wiki:Creating New Pages#Create New Void Relic Article](/w/WARFRAME_Wiki:Creating_New_Pages#Create_New_Void_Relic_Article "WARFRAME Wiki:Creating New Pages") for a sample text input to article wizard.

### Module:DropTables/data

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-3 "Edit section's source code: Module:DropTables/data")]

A simple find & replace should be enough to keep relic drops in [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") up-to-date with the latest [Prime Access](/w/Prime_Access "Prime Access")/[Prime Resurgence](/w/Prime_Resurgence "Prime Resurgence"). This is especially true if the number of relics introduced is equal to the number of relics removed from drop tables. However, there had been times where there is an unequal number of removed/added relics (mainly because some Prime weapons have varying numbers of parts associated with its crafting recipe; Prime parts are distributed across relics so that only one part from a unique weapon may be present in any given relic) which requires editors to manually go through each relevant mission drop table to audit for accuracy.

Good drop tables to check for what has changed:

* Tier 1 [Survival](/w/Survival "Survival") for Lith relics like Mercury/Apollodorus (Survival)
* Tier 1 [Defense](/w/Defense "Defense") (rotation B and C) for Meso relics like Mercury/Lares (Defense)
* Tier 3 [Excavation](/w/Excavation "Excavation") (rotation B) for Neo relics like Pluto/Hieracon (Excavation)
* Tier 3 [Excavation](/w/Excavation "Excavation") (rotation C) for Axi relics like Pluto/Hieracon (Excavation)

Notable patterns in relic drop distribution:

* Relics that are replaced are usually the same tier as the relic that replaces them (Lith, Meso, Neo, Axi)
* ~~[Bounties](/w/Bounties "Bounties") usually only drop relics that have been recently unvaulted with the latest [Prime Vault](/w/Prime_Vault "Prime Vault")~~ With [Prime Resurgence](/w/Prime_Resurgence "Prime Resurgence") being a permanent feature in the game since [Hotfix 32.0.3](/w/Update_32#Hotfix_32.0.3 "Update 32") (2022-09-14), editors will most likely won't need to update bounty drop tables on a frequent basis. Vaulted relics that once existed in bounty drop tables are now replaced by an intermediary currency [![](/images/thumb/Aya.png/32px-Aya.png?0542b)](/w/Aya "Aya") [Aya](/w/Aya "Aya").

#### Examples

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-4 "Edit section's source code: Examples")]

##### U31.7 - Khora Prime

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-5 "Edit section's source code: U31.7 - Khora Prime")]

[Update 31.7](/w/Update_31#Update_31.7 "Update 31") (2022-07-16) relic drop locations update for [![](/images/thumb/KhoraPrime_Thumb.png/32px-KhoraPrime_Thumb.png?730fb)](/w/Khora/Prime "Khora/Prime") [Khora Prime](/w/Khora/Prime "Khora/Prime")/[![](/images/thumb/HystrixPrime.png/32px-HystrixPrime.png?51199)](/w/Hystrix_Prime "Hystrix Prime") [Hystrix Prime](/w/Hystrix_Prime "Hystrix Prime")/[![](/images/thumb/DualKeresPrime.png/32px-DualKeresPrime.png?e0ad8)](/w/Dual_Keres_Prime "Dual Keres Prime") [Dual Keres Prime](/w/Dual_Keres_Prime "Dual Keres Prime") relics ([![](/images/thumb/InarosPrime_Thumb.png/32px-InarosPrime_Thumb.png?cd69a)](/w/Inaros/Prime "Inaros/Prime") [Inaros Prime](/w/Inaros/Prime "Inaros/Prime")/[![](/images/thumb/PantheraPrime.png/32px-PantheraPrime.png?a55ec)](/w/Panthera_Prime "Panthera Prime") [Panthera Prime](/w/Panthera_Prime "Panthera Prime")/[![](/images/thumb/KarystPrime.png/32px-KarystPrime.png?ba1c9)](/w/Karyst_Prime "Karyst Prime") [Karyst Prime](/w/Karyst_Prime "Karyst Prime") vaulted):

* Old -> New

[![](/images/thumb/InarosPrime_Thumb.png/32px-InarosPrime_Thumb.png?cd69a)](/w/Inaros/Prime "Inaros/Prime") [Inaros Prime](/w/Inaros/Prime "Inaros/Prime") -> [![](/images/thumb/KhoraPrime_Thumb.png/32px-KhoraPrime_Thumb.png?730fb)](/w/Khora/Prime "Khora/Prime") [Khora Prime](/w/Khora/Prime "Khora/Prime")/[![](/images/thumb/HystrixPrime.png/32px-HystrixPrime.png?51199)](/w/Hystrix_Prime "Hystrix Prime") [Hystrix Prime](/w/Hystrix_Prime "Hystrix Prime")/[![](/images/thumb/DualKeresPrime.png/32px-DualKeresPrime.png?e0ad8)](/w/Dual_Keres_Prime "Dual Keres Prime") [Dual Keres Prime](/w/Dual_Keres_Prime "Dual Keres Prime")

* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_H4 "Lith H4") [Lith H4](/w/Lith_H4 "Lith H4") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_K9 "Lith K9") [Lith K9](/w/Lith_K9 "Lith K9")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_I2 "Meso I2") [Meso I2](/w/Meso_I2 "Meso I2") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_H2 "Meso H2") [Meso H2](/w/Meso_H2 "Meso H2") (needed for [![](/images/thumb/NezhaPrime_Thumb.png/32px-NezhaPrime_Thumb.png?1d330)](/w/Nezha/Prime "Nezha/Prime") [Nezha Prime](/w/Nezha/Prime "Nezha/Prime") BP, otherwise it's unobtainable)
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_N12 "Meso N12") [Meso N12](/w/Meso_N12 "Meso N12") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_O5 "Meso O5") [Meso O5](/w/Meso_O5 "Meso O5") (needed for [![](/images/thumb/OctaviaPrime_Thumb.png/32px-OctaviaPrime_Thumb.png?5a09d)](/w/Octavia/Prime "Octavia/Prime") [Octavia Prime](/w/Octavia/Prime "Octavia/Prime") BP, otherwise it's unobtainable)
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_K4 "Neo K4") [Neo K4](/w/Neo_K4 "Neo K4") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N21 "Neo N21") [Neo N21](/w/Neo_N21 "Neo N21")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_V10 "Neo V10") [Neo V10](/w/Neo_V10 "Neo V10") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_D5 "Neo D5") [Neo D5](/w/Neo_D5 "Neo D5")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_G7 "Axi G7") [Axi G7](/w/Axi_G7 "Axi G7") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_N8 "Axi N8") [Axi N8](/w/Axi_N8 "Axi N8") (needed for [![](/images/thumb/NezhaPrime_Thumb.png/32px-NezhaPrime_Thumb.png?1d330)](/w/Nezha/Prime "Nezha/Prime") [Nezha Prime](/w/Nezha/Prime "Nezha/Prime") Neuroptics BP, otherwise it's unobtainable)
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K6 "Axi K6") [Axi K6](/w/Axi_K6 "Axi K6") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K8 "Axi K8") [Axi K8](/w/Axi_K8 "Axi K8")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_O5 "Axi O5") [Axi O5](/w/Axi_O5 "Axi O5") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K9 "Axi K9") [Axi K9](/w/Axi_K9 "Axi K9")

[![](/images/thumb/PantheraPrime.png/32px-PantheraPrime.png?a55ec)](/w/Panthera_Prime "Panthera Prime") [Panthera Prime](/w/Panthera_Prime "Panthera Prime") -> [![](/images/thumb/KhoraPrime_Thumb.png/32px-KhoraPrime_Thumb.png?730fb)](/w/Khora/Prime "Khora/Prime") [Khora Prime](/w/Khora/Prime "Khora/Prime")/[![](/images/thumb/HystrixPrime.png/32px-HystrixPrime.png?51199)](/w/Hystrix_Prime "Hystrix Prime") [Hystrix Prime](/w/Hystrix_Prime "Hystrix Prime")/[![](/images/thumb/DualKeresPrime.png/32px-DualKeresPrime.png?e0ad8)](/w/Dual_Keres_Prime "Dual Keres Prime") [Dual Keres Prime](/w/Dual_Keres_Prime "Dual Keres Prime")

* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_G3 "Meso G3") [Meso G3](/w/Meso_G3 "Meso G3") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_P8 "Meso P8") [Meso P8](/w/Meso_P8 "Meso P8")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_P5 "Meso P5") [Meso P5](/w/Meso_P5 "Meso P5") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_H3 "Meso H3") [Meso H3](/w/Meso_H3 "Meso H3")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_P7 "Meso P7") [Meso P7](/w/Meso_P7 "Meso P7") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_V7 "Meso V7") [Meso V7](/w/Meso_V7 "Meso V7")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S10 "Axi S10") [Axi S10](/w/Axi_S10 "Axi S10") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_G8 "Axi G8") [Axi G8](/w/Axi_G8 "Axi G8")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S11 "Axi S11") [Axi S11](/w/Axi_S11 "Axi S11") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K10 "Axi K10") [Axi K10](/w/Axi_K10 "Axi K10") (is an additional relic for some Prime parts; not essential for a particular part to be farmable)

[![](/images/thumb/KarystPrime.png/32px-KarystPrime.png?ba1c9)](/w/Karyst_Prime "Karyst Prime") [Karyst Prime](/w/Karyst_Prime "Karyst Prime") -> [![](/images/thumb/HystrixPrime.png/32px-HystrixPrime.png?51199)](/w/Hystrix_Prime "Hystrix Prime") [Hystrix Prime](/w/Hystrix_Prime "Hystrix Prime")/[![](/images/thumb/DualKeresPrime.png/32px-DualKeresPrime.png?e0ad8)](/w/Dual_Keres_Prime "Dual Keres Prime") [Dual Keres Prime](/w/Dual_Keres_Prime "Dual Keres Prime")

* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N20 "Neo N20") [Neo N20](/w/Neo_N20 "Neo N20") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_G4 "Neo G4") [Neo G4](/w/Neo_G4 "Neo G4")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_P4 "Neo P4") [Neo P4](/w/Neo_P4 "Neo P4") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_S15 "Neo S15") [Neo S15](/w/Neo_S15 "Neo S15") (needed for [![](/images/thumb/BroncoPrime.png/32px-BroncoPrime.png?a83e3)](/w/Bronco_Prime "Bronco Prime") [Bronco Prime](/w/Bronco_Prime "Bronco Prime") Barrel, otherwise it's unobtainable)
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K6 "Axi K6") [Axi K6](/w/Axi_K6 "Axi K6") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K8 "Axi K8") [Axi K8](/w/Axi_K8 "Axi K8")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K7 "Axi K7") [Axi K7](/w/Axi_K7 "Axi K7") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S12 "Axi S12") [Axi S12](/w/Axi_S12 "Axi S12") (needed for [![](/images/thumb/TenoraPrime.png/32px-TenoraPrime.png?c7070)](/w/Tenora_Prime "Tenora Prime") [Tenora Prime](/w/Tenora_Prime "Tenora Prime") Stock, otherwise it's unobtainable)

##### U31.3 - Garuda Prime

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-6 "Edit section's source code: U31.3 - Garuda Prime")]

[Update 31.3](/w/Update_31#Update_31.3 "Update 31") (2022-03-28) relic drop locations update for [![](/images/thumb/GarudaPrime_Thumb.png/32px-GarudaPrime_Thumb.png?13f16)](/w/Garuda/Prime "Garuda/Prime") [Garuda Prime](/w/Garuda/Prime "Garuda/Prime")/[![](/images/thumb/NagantakaPrime.png/32px-NagantakaPrime.png?8eb34)](/w/Nagantaka_Prime "Nagantaka Prime") [Nagantaka Prime](/w/Nagantaka_Prime "Nagantaka Prime")/[![](/images/thumb/CorvasPrime.png/32px-CorvasPrime.png?290fd)](/w/Corvas_Prime "Corvas Prime") [Corvas Prime](/w/Corvas_Prime "Corvas Prime") relics ([![](/images/thumb/TitaniaPrime_Thumb.png/32px-TitaniaPrime_Thumb.png?a33ec)](/w/Titania/Prime "Titania/Prime") [Titania Prime](/w/Titania/Prime "Titania/Prime")/[![](/images/thumb/CorinthPrime.png/32px-CorinthPrime.png?5c1bb)](/w/Corinth_Prime "Corinth Prime") [Corinth Prime](/w/Corinth_Prime "Corinth Prime")/[![](/images/thumb/PangolinPrime.png/32px-PangolinPrime.png?51917)](/w/Pangolin_Prime "Pangolin Prime") [Pangolin Prime](/w/Pangolin_Prime "Pangolin Prime") vaulted):

* Old -> New
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S9 "Axi S9") [Axi S9](/w/Axi_S9 "Axi S9") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_G7 "Axi G7") [Axi G7](/w/Axi_G7 "Axi G7")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_M2 "Axi M2") [Axi M2](/w/Axi_M2 "Axi M2") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K7 "Axi K7") [Axi K7](/w/Axi_K7 "Axi K7")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_P4 "Axi P4") [Axi P4](/w/Axi_P4 "Axi P4") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S10 "Axi S10") [Axi S10](/w/Axi_S10 "Axi S10")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_C7 "Axi C7") [Axi C7](/w/Axi_C7 "Axi C7") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S11 "Axi S11") [Axi S11](/w/Axi_S11 "Axi S11")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_P3 "Neo P3") [Neo P3](/w/Neo_P3 "Neo P3") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_C2 "Neo C2") [Neo C2](/w/Neo_C2 "Neo C2")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N17 "Neo N17") [Neo N17](/w/Neo_N17 "Neo N17") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_M4 "Neo M4") [Neo M4](/w/Neo_M4 "Neo M4")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N18 "Neo N18") [Neo N18](/w/Neo_N18 "Neo N18") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N20 "Neo N20") [Neo N20](/w/Neo_N20 "Neo N20")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_P4 "Meso P4") [Meso P4](/w/Meso_P4 "Meso P4") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_G4 "Meso G4") [Meso G4](/w/Meso_G4 "Meso G4")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_Z4 "Meso Z4") [Meso Z4](/w/Meso_Z4 "Meso Z4") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_N12 "Meso N12") [Meso N12](/w/Meso_N12 "Meso N12")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_S11 "Meso S11") [Meso S11](/w/Meso_S11 "Meso S11") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_P7 "Meso P7") [Meso P7](/w/Meso_P7 "Meso P7")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_G4 "Lith G4") [Lith G4](/w/Lith_G4 "Lith G4") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_G5 "Lith G5") [Lith G5](/w/Lith_G5 "Lith G5")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_T8 "Lith T8") [Lith T8](/w/Lith_T8 "Lith T8") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_H4 "Lith H4") [Lith H4](/w/Lith_H4 "Lith H4")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_C9 "Lith C9") [Lith C9](/w/Lith_C9 "Lith C9") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N11 "Lith N11") [Lith N11](/w/Lith_N11 "Lith N11")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_S11 "Lith S11") [Lith S11](/w/Lith_S11 "Lith S11") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_S12 "Lith S12") [Lith S12](/w/Lith_S12 "Lith S12")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_H3 "Lith H3") [Lith H3](/w/Lith_H3 "Lith H3") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_Z3 "Lith Z3") [Lith Z3](/w/Lith_Z3 "Lith Z3")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N10 "Lith N10") [Lith N10](/w/Lith_N10 "Lith N10") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N12 "Lith N12") [Lith N12](/w/Lith_N12 "Lith N12")

##### U31.0 - Harrow Prime

[[edit source](/w/Module:Void/data/doc?action=edit&section=T-7 "Edit section's source code: U31.0 - Harrow Prime")]

[Update 31.0](/w/Update_31#Update_31.0 "Update 31") (2021-12-15) relic drop locations update for [![](/images/thumb/HarrowPrime_Thumb.png/32px-HarrowPrime_Thumb.png?9cd5a)](/w/Harrow/Prime "Harrow/Prime") [Harrow Prime](/w/Harrow/Prime "Harrow/Prime")/[![](/images/thumb/ScourgePrime.png/32px-ScourgePrime.png?a0ef5)](/w/Scourge_Prime "Scourge Prime") [Scourge Prime](/w/Scourge_Prime "Scourge Prime")/[![](/images/thumb/KnellPrime.png/32px-KnellPrime.png?08b42)](/w/Knell_Prime "Knell Prime") [Knell Prime](/w/Knell_Prime "Knell Prime") relics ([![](/images/thumb/IvaraPrime_Thumb.png/32px-IvaraPrime_Thumb.png?59590)](/w/Ivara/Prime "Ivara/Prime") [Ivara Prime](/w/Ivara/Prime "Ivara/Prime")/[![](/images/thumb/BazaPrime.png/32px-BazaPrime.png?c1df2)](/w/Baza_Prime "Baza Prime") [Baza Prime](/w/Baza_Prime "Baza Prime")/[![](/images/thumb/AksomatiPrime.png/32px-AksomatiPrime.png?ce035)](/w/Aksomati_Prime "Aksomati Prime") [Aksomati Prime](/w/Aksomati_Prime "Aksomati Prime") vaulted):

* Old -> New
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_A4 "Lith A4") [Lith A4](/w/Lith_A4 "Lith A4") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_T9 "Lith T9") [Lith T9](/w/Lith_T9 "Lith T9")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_I1 "Lith I1") [Lith I1](/w/Lith_I1 "Lith I1") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_S11 "Lith S11") [Lith S11](/w/Lith_S11 "Lith S11")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_K7 "Lith K7") [Lith K7](/w/Lith_K7 "Lith K7") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_H3 "Lith H3") [Lith H3](/w/Lith_H3 "Lith H3")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N7 "Lith N7") [Lith N7](/w/Lith_N7 "Lith N7") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_C9 "Lith C9") [Lith C9](/w/Lith_C9 "Lith C9")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N8 "Lith N8") [Lith N8](/w/Lith_N8 "Lith N8") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_N9 "Lith N9") [Lith N9](/w/Lith_N9 "Lith N9")
* [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_T7 "Lith T7") [Lith T7](/w/Lith_T7 "Lith T7") -> [![](/images/thumb/LithRelicIntact.png/32px-LithRelicIntact.png?ee7d7)](/w/Lith_T8 "Lith T8") [Lith T8](/w/Lith_T8 "Lith T8")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_B5 "Meso B5") [Meso B5](/w/Meso_B5 "Meso B5") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_I2 "Meso I2") [Meso I2](/w/Meso_I2 "Meso I2")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_B6 "Meso B6") [Meso B6](/w/Meso_B6 "Meso B6") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_G3 "Meso G3") [Meso G3](/w/Meso_G3 "Meso G3")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_C6 "Meso C6") [Meso C6](/w/Meso_C6 "Meso C6") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_A3 "Meso A3") [Meso A3](/w/Meso_A3 "Meso A3")
* [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_S10 "Meso S10") [Meso S10](/w/Meso_S10 "Meso S10") -> [![](/images/thumb/MesoRelicIntact.png/32px-MesoRelicIntact.png?a9b4a)](/w/Meso_S11 "Meso S11") [Meso S11](/w/Meso_S11 "Meso S11")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_P2 "Neo P2") [Neo P2](/w/Neo_P2 "Neo P2") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_P2 "Neo P2") [Neo P2](/w/Neo_P2 "Neo P2") (mistake by the devs for still being in the game at the time, fixed in [Hotfix 31.0.11](/w/Update_31#Hotfix_31.0.11 "Update 31") (2022-01-25) by replacing with [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_P4 "Neo P4") [Neo P4](/w/Neo_P4 "Neo P4"))
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_T4 "Neo T4") [Neo T4](/w/Neo_T4 "Neo T4") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_K4 "Neo K4") [Neo K4](/w/Neo_K4 "Neo K4")
* [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_T5 "Neo T5") [Neo T5](/w/Neo_T5 "Neo T5") -> [![](/images/thumb/NeoRelicIntact.png/32px-NeoRelicIntact.png?6dc86)](/w/Neo_N18 "Neo N18") [Neo N18](/w/Neo_N18 "Neo N18")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_A13 "Axi A13") [Axi A13](/w/Axi_A13 "Axi A13") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_T8 "Axi T8") [Axi T8](/w/Axi_T8 "Axi T8")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_A14 "Axi A14") [Axi A14](/w/Axi_A14 "Axi A14") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_K6 "Axi K6") [Axi K6](/w/Axi_K6 "Axi K6")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_C6 "Axi C6") [Axi C6](/w/Axi_C6 "Axi C6") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_P4 "Axi P4") [Axi P4](/w/Axi_P4 "Axi P4")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_G6 "Axi G6") [Axi G6](/w/Axi_G6 "Axi G6") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_C7 "Axi C7") [Axi C7](/w/Axi_C7 "Axi C7")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_I2 "Axi I2") [Axi I2](/w/Axi_I2 "Axi I2") -> [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_S9 "Axi S9") [Axi S9](/w/Axi_S9 "Axi S9")

## References

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=10 "Edit section's source code: References")]

1. [↑](#cite_ref-1) (2022, December 14). *[Official Drop Table Repo](https://www.warframe.com/droptables)*. Digital Extremes. Accessed 2022-12-22. [Archived](https://web.archive.org/web/20221217011721/https://n8k6e2y6.ssl.hwcdn.net/repos/hnfvc0o3jnfvc873njb03enrf56.html) from the original on 2022-12-17.
2. [↑](#cite_ref-2) (2022, December 14). *[Official Drop Table Repo](https://www.warframe.com/droptables)*. Digital Extremes. Accessed 2022-12-26. [Archived](https://web.archive.org/web/20221217011721/https://n8k6e2y6.ssl.hwcdn.net/repos/hnfvc0o3jnfvc873njb03enrf56.html) from the original on 2022-12-17. Lith A5, Lith V9, Meso T6, Meso V8, Neo A7, Neo D6, and Axi F1 are included in 2022-12-14 update of drop table repo, representing a future Atlas/Vauban Prime rerun.
3. [↑](#cite_ref-3) [DE]Momaw (2022, December 20). *[PSA: Future change in Ducat value for Baza Prime Blueprint](https://forums.warframe.com/topic/1335674-psa-future-change-in-ducat-value-for-baza-prime-blueprint/)*. Warframe Forums. Accessed 2022-12-20. [Archived](https://web.archive.org/web/20221220171327/https://forums.warframe.com/topic/1335674-psa-future-change-in-ducat-value-for-baza-prime-blueprint/) from the original on 2022-12-20.

## Drop Table Data

[[edit source](/w/Module:DropTables/data/doc?action=edit&section=11 "Edit section's source code: Drop Table Data")]

