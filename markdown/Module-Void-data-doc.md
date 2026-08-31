---
title: "Module:Void/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Void/data/doc"
wiki_timestamp: "2026-04-08T18:51:57Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Void/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Contains the data for [Void Relic](/w/Void_Relic "Void Relic") drop tables. Does not have to be in alphabetical order. For the drop tables that Void Relics can be rewarded from, see [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data").

Note that no drop chances are stored here since all relics of the same refinement share the same drop chances. Drop chances will be calculated by [Module:Void/page](/w/Module:Void/page "Module:Void/page") for output onto articles.

Also the place to update if a Prime part's [![](/images/thumb/OrokinDucats.png/32px-OrokinDucats.png?23930)](/w/Orokin_Ducats "Orokin Ducats") [Orokin Ducats](/w/Orokin_Ducats "Orokin Ducats") trade-in value is an anomaly for their rarity. See [#Prime Item Ducat Sell Price](#Prime_Item_Ducat_Sell_Price).

:   *Last updated: Wed, 08 Apr 2026 18:51:57 +0000 (UTC) by [User:Headbox8424](/w/User:Headbox8424 "User:Headbox8424") ([change log](https://wiki.warframe.com/w/Module:Void/data/doc?diff=0))*

## Contents

* [1 Relic Entry Schema](#Relic_Entry_Schema)
* [2 Prime Item Entry Schema](#Prime_Item_Entry_Schema)
  + [2.1 Viewing Contents via API Call](#Viewing_Contents_via_API_Call)
* [3 Updating Notes](#Updating_Notes)
  + [3.1 Prime Item Ducat Sell Price](#Prime_Item_Ducat_Sell_Price)
  + [3.2 Creating New Void Relic Pages](#Creating_New_Void_Relic_Pages)
  + [3.3 Module:DropTables/data](#Module:DropTables/data)
    - [3.3.1 Examples](#Examples)
      * [3.3.1.1 U31.7 - Khora Prime](#U31.7_-_Khora_Prime)
      * [3.3.1.2 U31.3 - Garuda Prime](#U31.3_-_Garuda_Prime)
      * [3.3.1.3 U31.0 - Harrow Prime](#U31.0_-_Harrow_Prime)
* [4 References](#References)
* [5 Void Relic Data](#Void_Relic_Data)

## Relic Entry Schema

[[edit source](/w/Module:Void/data/doc?action=edit&section=1 "Edit section's source code: Relic Entry Schema")]

```lua
	["Neo D3"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nezha Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Forma", ItemCount = 2, Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		IsBaro = false,
		Name = "Neo D3",
		Tier = "Neo",
		Vaulted = "30.3" 
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Drops` | Table | ✔️ | Drop table of relic; each table entry inside the `Drops` table represent a drop, each with a `Item` (a string representing item's full name), `ItemCount` (a int representing the item's amount if more than 1), `Part` (a string representing the item's part name), and `Rarity` (a string representing the rarity of drop; "Common", "Uncommon", or "Rare") | ```lua { 	{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" }, 	{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" }, 	{ Item = "Nezha Prime", Part = "Systems Blueprint", Rarity = "Common" }, 	{ Item = "Forma", ItemCount = 2, Part = "Blueprint", Rarity = "Uncommon" }, 	{ Item = "Zakti Prime", Part = "Barrel", Rarity = "Uncommon" }, 	{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" }  } ``` |
| `Introduced` | String | ✔️ | Shorthand name for the version in which relic was first introduced in the global build of WARFRAME | `"30.5"` |
| `IsBaro` | Boolean | ❌ | Denotes whether or not relic is exclusively bought from [Baro Ki'Teer](/w/Baro_Ki%27Teer "Baro Ki'Teer"); default is false if not present | `false` |
| `Name` | String | ✔️ | The relic name | `"Neo D3"` |
| `Tier` | String | ✔️ | Relic tier ("Lith", "Meso", "Neo", "Axi", "Requiem", or "Vanguard") | `"Neo"` |
| `Vaulted` | String | ❌ | Shorthand name for the version in which relic was **last** removed from mission [Drop Tables](/w/Drop_Tables "Drop Tables") | `"30.5"` |

## Prime Item Entry Schema

[[edit source](/w/Module:Void/data/doc?action=edit&section=2 "Edit section's source code: Prime Item Entry Schema")]

Any entry added to `RelicData` will have its contents automatically inserted into in another subtable under `PrimeData` with the schema:

```lua
	Aklex Prime = {  -- Item name
		Parts = {
			Blueprint =  -- Part name
				Drops = {  
					["Axi A2"] = "Uncommon",  -- {string} Relic name and rarity of drop for that part
					["Neo O1"] = "Uncommon",
				},
				DucatValue = 45  -- {number} Ducat value when exchanged in Baro kiosk on relays
			},
			Link = 
				Drops = {
					["Axi A2"] = "Rare",
				},
				DucatValue = 100
			}
		},
		IsVaulted = false  -- {boolean} Vaulted status of item
	},
```

### Viewing Contents via API Call

[[edit source](/w/Module:Void/data/doc?action=edit&section=3 "Edit section's source code: Viewing Contents via API Call")]

[![](/images/thumb/CephalonSimaris.jpg/60px-CephalonSimaris.jpg?4a8c5)](/w/Cephalon_Simaris "Cephalon Simaris")

*"Hunter, I have temporarily disabled that ability."*

This article contains JavaScript scripts that users can run locally in their browser's console or machine. As a warning, which goes for any scripts you copy/run from the Internet, *MAKE SURE YOU UNDERSTAND THE CODE BEFORE RUNNING IT LOCALLY FOR YOUR OWN SECURITY!* Contact an [admin](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators") if you have any concerns or questions about a script.

For debugging purposes in browser console:

```lua
let origin = "https://wiki.warframe.com";
let path = "/api.php";
let params = {
	action: "scribunto-console",
	format: "json",
	title: "Module:Void/data",
	content: "",
	question: `
local VoidData = require('Module:Void/data').PrimeData
local json = require('Module:JSON')
print(json.stringify(VoidData))`,
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
			throw json.html;	// Lua script error has occured
		}
	})
	.catch((error) => console.log(error));
```

## Updating Notes

[[edit source](/w/Module:Void/data/doc?action=edit&section=4 "Edit section's source code: Updating Notes")]

Every [Prime Access](/w/Prime_Access "Prime Access") (once every ~3 months or financial quarter), DE will release new Void Relics that will contain at least one component/blueprint of the new Primes released. In addition, the oldest available Primes' relics will be removed from the game's [Drop Tables](/w/Drop_Table "Drop Table") to make room for the new relics and to not dilute the drop tables further. In some cases, newer/recent Prime items' parts would be unavailable to farm when DE removes these old relics, so they will add additional relics (separate from the newly released Primes) to make these items farmable.

It takes about 1-3 hours of manually editing to fully update [Module:Void/data](/w/Module:Void/data "Module:Void/data") and [Module:DropTables/data](/w/Module:DropTables/data "Module:DropTables/data") with the latest Prime content.

Updating the vaulted status of relics here will automatically tag the appropriate item articles with [Template:ItemVault](/w/Template:ItemVault "Template:ItemVault").

### Prime Item Ducat Sell Price

[[edit source](/w/Module:Void/data/doc?action=edit&section=5 "Edit section's source code: Prime Item Ducat Sell Price")]

Editors do not need to add [![](/images/thumb/OrokinDucats.png/32px-OrokinDucats.png?23930)](/w/Orokin_Ducats "Orokin Ducats") [Orokin Ducats](/w/Orokin_Ducats "Orokin Ducats") sell prices to every item manually. Prices can be determined based on drop rarity:

* Rare parts are worth 100 Ducats
* Uncommon parts are worth 45 Ducats
* Common parts are worth 15 Ducats
* If an item part is a uncommon and rare drop in different relics, it is worth 65 Ducats instead[[1]](#cite_note-1)
* If an item part is a common and uncommon drop in different relics, it is worth 25 Ducats instead
* If an item part is a common and rare drop in different relics, it is worth 25 Ducats instead

If there is item that deviates from this rule, please update the `DUCAT_EXCEPTIONS` table.

### Creating New Void Relic Pages

[[edit source](/w/Module:Void/data/doc?action=edit&section=6 "Edit section's source code: Creating New Void Relic Pages")]

Use [Template:VoidRelicArticle](/w/Template:VoidRelicArticle "Template:VoidRelicArticle") as reference for creating new Void Relic articles. See [WARFRAME Wiki:Creating New Pages#Create New Void Relic Article](/w/WARFRAME_Wiki:Creating_New_Pages#Create_New_Void_Relic_Article "WARFRAME Wiki:Creating New Pages") for a sample text input to article wizard.

### Module:DropTables/data

[[edit source](/w/Module:Void/data/doc?action=edit&section=7 "Edit section's source code: Module:DropTables/data")]

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

[[edit source](/w/Module:Void/data/doc?action=edit&section=8 "Edit section's source code: Examples")]

##### U31.7 - Khora Prime

[[edit source](/w/Module:Void/data/doc?action=edit&section=9 "Edit section's source code: U31.7 - Khora Prime")]

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

[[edit source](/w/Module:Void/data/doc?action=edit&section=10 "Edit section's source code: U31.3 - Garuda Prime")]

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

[[edit source](/w/Module:Void/data/doc?action=edit&section=11 "Edit section's source code: U31.0 - Harrow Prime")]

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

[[edit source](/w/Module:Void/data/doc?action=edit&section=12 "Edit section's source code: References")]

1. [↑](#cite_ref-1) [DE]Momaw (2022, December 20). *[PSA: Future change in Ducat value for Baza Prime Blueprint](https://forums.warframe.com/topic/1335674-psa-future-change-in-ducat-value-for-baza-prime-blueprint/)*. Warframe Forums. Accessed 2022-12-20. [Archived](https://web.archive.org/web/20221220171327/https://forums.warframe.com/topic/1335674-psa-future-change-in-ducat-value-for-baza-prime-blueprint/) from the original on 2022-12-20.

## Void Relic Data

[[edit source](/w/Module:Void/data/doc?action=edit&section=13 "Edit section's source code: Void Relic Data")]

