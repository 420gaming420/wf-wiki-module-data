---
title: "Module:Resources/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Resources/data/doc"
wiki_timestamp: "2026-04-10T00:42:49Z"
---

Database of [WARFRAME](/w/WARFRAME "WARFRAME") [Resources](/w/Resources "Resources"), items, and components. For blueprints which require resources to be crafted, see [Module:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data").

:   *Last updated: Fri, 10 Apr 2026 00:42:49 +0000 (UTC) by [User:Twilight053](/w/User:Twilight053 "User:Twilight053") ([change log](https://wiki.warframe.com/w/Module:Resources/data/doc?diff=0))*

## Contents

* [1 Resource Entry Schema](#Resource_Entry_Schema)
* [2 Data Validation](#Data_Validation)
  + [2.1 Checking naming scheme of image names](#Checking_naming_scheme_of_image_names)
* [3 Resource Data](#Resource_Data)

## Resource Entry Schema

[[edit source](/w/Module:Resources/data/doc?action=edit&section=1 "Edit section's source code: Resource Entry Schema")]

```lua
	["Resource Name"] = {
		Amount = { 1, 1 },
		ContainerImage = "ResourceContainer.png",
		HelminthCategory = "Bile",
		HelminthCost = 999999,
		Description = "Description",
		Image = "Resource.png",
		Introduced = "30",
		Link = "Page Name",
		Name = "Resource Name",
		Rarity = "Rare",
		Type = "Event",
		ResourceBoostAble = true,
		BountifulHarvestAble = false,
		ResourceDropChanceBoostAble = false,
		RetrieverModAble = true
	},
```

| Key/Column Name | [Public Export](/w/Public_Export "Public Export") Equivalent | Internal Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- | --- |
| `Amount` | N/A | `Amount` | Table (of integers) | ❌ | A 2-element array with the first element being the minimum drop amount and the second being the maximum drop amount for the item. Game will uniformly choose a value between these two bounds when determining resource/item drops from enemies and containers. For mining materials, these values will serve the range of values rewarded based on mining minigame performance (e.g. perfect 5 star scores get max value). | `{ 150, 250 }` |
| `ContainerImage` | N/A | N/A | String | ❌ | Image file name of the resource's deposit container as uploaded to the wiki | `"AlloyPlateContainer.png"` |
| `Description` | `description` | `LocalizeDescTag` | String | ✔️ | Description of resource as seen in-game | `"Sinewy and metallic, possessed of great elastic strength."` |
| `HelminthCategory` | N/A | `InfestedFoundryResourceType` | String | ❌ | For resources that can be fed to the [Helminth](/w/Helminth "Helminth"), the secretion category that can be increased | `"Biotics"` |
| `HelminthCost` | N/A | `InfestedFoundryResourceBundleSize` | Number (integer) | ❌ | For resources that can be fed to the Helminth, the amount needed to increase secretion | `500` |
| `Image` | `textureLocation` | `Icon` | String | ✔️ | Image file name of the resource as uploaded to the wiki | `"Adramalium.png"` |
| `InternalName` | `uniqueName` | `TypeName` | String | ❌ | The full unique name of a resource formatted as a file path | `"/Lotus/Types/Items/Gems/Deimos/DeimosCommonOreAItem"` |
| `Introduced` | N/A | N/A | String | ✔️ | The game version in which the resource was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | N/A | N/A | String | ✔️ | Page/article link to the resource on the wiki | `"Kuva (Resource)"` |
| `Name` | `name` | `LocalizeTag` | String | ✔️ | Name of resource | `"Kuva"` |
| `Rarity` | N/A | `Rarity` | String | ❌ | For [Star Chart](/w/Star_Chart "Star Chart") resources (those that can obtained from [Extractors](/w/Extractor "Extractor")), the rarity of the resource | `"Rare"` |
| `SellPrice` | N/A | `SellingPrice` | Number (integer) | ❌ | For sellable resources, the sell price in [Credits](/w/Credits "Credits") when removed from the player's inventory | `100` |
| `SortingPriority` | N/A | `SortingPriority` | Number (integer) | ❌ | An integer value representing the priority in which it is shown in the end-of-mission menu when rewards are sorted by "Importance". The smaller the number, the higher the priority. High priority means that item will be near the top of the reward menu | `3` |
| `Tradable` | N/A | `TradeCapability` | Boolean | ❌ | Denotes whether or not a resource is [tradable](/w/Trading "Trading"); default is false | `true` |
| `Type` | N/A | N/A | String | ✔️ | The class of resource (e.g. "Resource", "Event", "Weapon", "Fish Part", "Gem", "Pigment") | `"Event"` |
| `ResourceBoostAble` | N/A | N/A | Boolean | ❌ | Whether the resource pickup is doubled by Resource Booster or not. | `true` |
| `BountifulHarvestAble` | N/A | N/A | Boolean | ❌ | Whether the resource pickup is doubled by Bountiful Harvest Decree or not. | `true` |
| `ResourceDropChanceBoostAble` | N/A | N/A | Boolean | ❌ | Whether the resource pickup is doubled by Resource Drop Chance Boost or not. | `false` |
| `RetrieverModAble` | N/A | N/A | Boolean | ❌ | Whether the resource pickup is doubled by Retriever Mods or not. | `true` |

## Data Validation

[[edit source](/w/Module:Resources/data/doc?action=edit&section=2 "Edit section's source code: Data Validation")]

### Checking naming scheme of image names

[[edit source](/w/Module:Resources/data/doc?action=edit&section=3 "Edit section's source code: Checking naming scheme of image names")]

**p.checkImageName(frame): There are a total of 150 image names that do not follow mod image naming scheme ItemName.png**

1. "[/Lotus/Language/Items/Relayreconstructionitemaname](/w/Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitemaname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitemaname (page does not exist)")": "[LotusLanguageItemsRelayreconstructionitemaname.png](/w/File:LotusLanguageItemsRelayreconstructionitemaname.png?action=edit&redlink=1 "File:LotusLanguageItemsRelayreconstructionitemaname.png (page does not exist)")"
2. "[/Lotus/Language/Items/Relayreconstructionitembname](/w/Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitembname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitembname (page does not exist)")": "[LotusLanguageItemsRelayreconstructionitembname.png](/w/File:LotusLanguageItemsRelayreconstructionitembname.png?action=edit&redlink=1 "File:LotusLanguageItemsRelayreconstructionitembname.png (page does not exist)")"
3. "[/Lotus/Language/Items/Relayreconstructionitemcname](/w/Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitemcname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Items/Relayreconstructionitemcname (page does not exist)")": "[LotusLanguageItemsRelayreconstructionitemcname.png](/w/File:LotusLanguageItemsRelayreconstructionitemcname.png?action=edit&redlink=1 "File:LotusLanguageItemsRelayreconstructionitemcname.png (page does not exist)")"
4. "[/Lotus/Language/Relayreconstruction/Relayreconphase1leftitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase1leftitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase1leftitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase1leftitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase1leftitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase1leftitemname.png (page does not exist)")"
5. "[/Lotus/Language/Relayreconstruction/Relayreconphase2aleftitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2aleftitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2aleftitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase2aleftitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase2aleftitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase2aleftitemname.png (page does not exist)")"
6. "[/Lotus/Language/Relayreconstruction/Relayreconphase2arightitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2arightitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2arightitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase2arightitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase2arightitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase2arightitemname.png (page does not exist)")"
7. "[/Lotus/Language/Relayreconstruction/Relayreconphase2clanitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2clanitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase2clanitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase2clanitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase2clanitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase2clanitemname.png (page does not exist)")"
8. "[/Lotus/Language/Relayreconstruction/Relayreconphase3clanitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase3clanitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase3clanitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase3clanitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase3clanitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase3clanitemname.png (page does not exist)")"
9. "[/Lotus/Language/Relayreconstruction/Relayreconphase3leftitemname](/w/Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase3leftitemname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Relayreconstruction/Relayreconphase3leftitemname (page does not exist)")": "[LotusLanguageRelayreconstructionRelayreconphase3leftitemname.png](/w/File:LotusLanguageRelayreconstructionRelayreconphase3leftitemname.png?action=edit&redlink=1 "File:LotusLanguageRelayreconstructionRelayreconphase3leftitemname.png (page does not exist)")"
10. "[/Lotus/Language/Scans/Gofplantaplantname](/w/Module:Resources/data/doc/Lotus/Language/Scans/Gofplantaplantname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Scans/Gofplantaplantname (page does not exist)")": "[LotusLanguageScansGofplantaplantname.png](/w/File:LotusLanguageScansGofplantaplantname.png?action=edit&redlink=1 "File:LotusLanguageScansGofplantaplantname.png (page does not exist)")"
11. "[/Lotus/Language/Scans/Gofplanteplantname](/w/Module:Resources/data/doc/Lotus/Language/Scans/Gofplanteplantname?action=edit&redlink=1 "Module:Resources/data/doc/Lotus/Language/Scans/Gofplanteplantname (page does not exist)")": "[LotusLanguageScansGofplanteplantname.png](/w/File:LotusLanguageScansGofplanteplantname.png?action=edit&redlink=1 "File:LotusLanguageScansGofplanteplantname.png (page does not exist)")"
12. "[01000011 Cyan Pigment](/w/01000011_Cyan_Pigment "01000011 Cyan Pigment")": "[Pigment01000011Cyan.png](/w/File:Pigment01000011Cyan.png "File:Pigment01000011Cyan.png")"
13. "[Anti Violet Pigment](/w/Anti_Violet_Pigment "Anti Violet Pigment")": "[PigmentAntiViolet.png](/w/File:PigmentAntiViolet.png "File:PigmentAntiViolet.png")"
14. "[Archwing Launcher](/w/Archwing_Launcher "Archwing Launcher")": "[GenericArchwingSystems.png](/w/File:GenericArchwingSystems.png "File:GenericArchwingSystems.png")"
15. "[Argon Purple Pigment](/w/Argon_Purple_Pigment "Argon Purple Pigment")": "[PigmentArgonPurple.png](/w/File:PigmentArgonPurple.png "File:PigmentArgonPurple.png")"
16. "[Ash Systems](/w/Ash_Systems "Ash Systems")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
17. "[Autumn Brown Pigment](/w/Autumn_Brown_Pigment "Autumn Brown Pigment")": "[PigmentAutumnBrown.png](/w/File:PigmentAutumnBrown.png "File:PigmentAutumnBrown.png")"
18. "[Baro's Relay Ticket](/w/Baro%27s_Relay_Ticket "Baro's Relay Ticket")": "[BaroRelayTicket.png](/w/File:BaroRelayTicket.png "File:BaroRelayTicket.png")"
19. "[Boiler Red Pigment](/w/Boiler_Red_Pigment "Boiler Red Pigment")": "[PigmentBoilerRed.png](/w/File:PigmentBoilerRed.png "File:PigmentBoilerRed.png")"
20. "[Charger Blue Pigment](/w/Charger_Blue_Pigment "Charger Blue Pigment")": "[PigmentChargerBlue.png](/w/File:PigmentChargerBlue.png "File:PigmentChargerBlue.png")"
21. "[Chroma Mark](/w/Chroma_Mark?action=edit&redlink=1 "Chroma Mark (page does not exist)")": "[ChromaMark64.png](/w/File:ChromaMark64.png "File:ChromaMark64.png")"
22. "[Chroma Signal](/w/Chroma_Signal?action=edit&redlink=1 "Chroma Signal (page does not exist)")": "[ChromaSignal64.png](/w/File:ChromaSignal64.png "File:ChromaSignal64.png")"
23. "[Conductor Gold Pigment](/w/Conductor_Gold_Pigment "Conductor Gold Pigment")": "[PigmentConductorGold.png](/w/File:PigmentConductorGold.png "File:PigmentConductorGold.png")"
24. "[Convergence Orb](/w/Convergence_Orb "Convergence Orb")": "[ConvergenceOrb(NoBackground).png](/w/File:ConvergenceOrb(NoBackground).png "File:ConvergenceOrb(NoBackground).png")"
25. "[Coolant Blue Pigment](/w/Coolant_Blue_Pigment "Coolant Blue Pigment")": "[PigmentCoolantBlue.png](/w/File:PigmentCoolantBlue.png "File:PigmentCoolantBlue.png")"
26. "[Corufell Barrel](/w/Corufell_Barrel?action=edit&redlink=1 "Corufell Barrel (page does not exist)")": "[GenericWeaponBlade.png](/w/File:GenericWeaponBlade.png "File:GenericWeaponBlade.png")"
27. "[Corufell Handle](/w/Corufell_Handle?action=edit&redlink=1 "Corufell Handle (page does not exist)")": "[GenericWeaponHilt.png](/w/File:GenericWeaponHilt.png "File:GenericWeaponHilt.png")"
28. "[Corufell Receiver](/w/Corufell_Receiver?action=edit&redlink=1 "Corufell Receiver (page does not exist)")": "[GenericGunReceiver.png](/w/File:GenericGunReceiver.png "File:GenericGunReceiver.png")"
29. "[Crawler Blue Pigment](/w/Crawler_Blue_Pigment "Crawler Blue Pigment")": "[PigmentCrawlerBlue.png](/w/File:PigmentCrawlerBlue.png "File:PigmentCrawlerBlue.png")"
30. "[DNA Stabilizer](/w/DNA_Stabilizer "DNA Stabilizer")": "[DNAStabilizerKit.png](/w/File:DNAStabilizerKit.png "File:DNAStabilizerKit.png")"
31. "[Delta Beacon](/w/Delta_Beacon "Delta Beacon")": "[NavCodeVayHekA.png](/w/File:NavCodeVayHekA.png "File:NavCodeVayHekA.png")"
32. "[Devar Grey Pigment](/w/Devar_Grey_Pigment "Devar Grey Pigment")": "[PigmentDevarGrey.png](/w/File:PigmentDevarGrey.png "File:PigmentDevarGrey.png")"
33. "[Dust Brown Pigment](/w/Dust_Brown_Pigment "Dust Brown Pigment")": "[PigmentDustBrown.png](/w/File:PigmentDustBrown.png "File:PigmentDustBrown.png")"
34. "[Eidolon Madurai Lens](/w/Eidolon_Madurai_Lens "Eidolon Madurai Lens")": "[EidolonLens.png](/w/File:EidolonLens.png "File:EidolonLens.png")"
35. "[Eidolon Naramon Lens](/w/Eidolon_Naramon_Lens "Eidolon Naramon Lens")": "[EidolonLens.png](/w/File:EidolonLens.png "File:EidolonLens.png")"
36. "[Eidolon Unairu Lens](/w/Eidolon_Unairu_Lens "Eidolon Unairu Lens")": "[EidolonLens.png](/w/File:EidolonLens.png "File:EidolonLens.png")"
37. "[Eidolon Vazarin Lens](/w/Eidolon_Vazarin_Lens "Eidolon Vazarin Lens")": "[EidolonLens.png](/w/File:EidolonLens.png "File:EidolonLens.png")"
38. "[Eidolon Zenurik Lens](/w/Eidolon_Zenurik_Lens "Eidolon Zenurik Lens")": "[EidolonLens.png](/w/File:EidolonLens.png "File:EidolonLens.png")"
39. "[Elysium Blue Pigment](/w/Elysium_Blue_Pigment "Elysium Blue Pigment")": "[PigmentElysiumBlue.png](/w/File:PigmentElysiumBlue.png "File:PigmentElysiumBlue.png")"
40. "[Ember Systems](/w/Ember_Systems?action=edit&redlink=1 "Ember Systems (page does not exist)")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
41. "[Emissary Cred](/w/Emissary_Cred?action=edit&redlink=1 "Emissary Cred (page does not exist)")": "[EmissaryCred64.png](/w/File:EmissaryCred64.png "File:EmissaryCred64.png")"
42. "[Equinox Day Aspect](/w/Equinox_Day_Aspect?action=edit&redlink=1 "Equinox Day Aspect (page does not exist)")": "[AnimusAspect.png](/w/File:AnimusAspect.png "File:AnimusAspect.png")"
43. "[Equinox Night Aspect](/w/Equinox_Night_Aspect?action=edit&redlink=1 "Equinox Night Aspect (page does not exist)")": "[AnimaAspect.png](/w/File:AnimaAspect.png "File:AnimaAspect.png")"
44. "[False Orange Pigment](/w/False_Orange_Pigment "False Orange Pigment")": "[PigmentFalseOrange.png](/w/File:PigmentFalseOrange.png "File:PigmentFalseOrange.png")"
45. "[Focus](/w/Focus "Focus")": "[FocusLensFocus.png](/w/File:FocusLensFocus.png "File:FocusLensFocus.png")"
46. "[Frost Systems](/w/Frost_Systems "Frost Systems")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
47. "[Gamma Beacon](/w/Gamma_Beacon "Gamma Beacon")": "[NavCodeVayHekB.png](/w/File:NavCodeVayHekB.png "File:NavCodeVayHekB.png")"
48. "[Garuda Systems](/w/Garuda_Systems "Garuda Systems")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
49. "[Glacial Blue Pigment](/w/Glacial_Blue_Pigment "Glacial Blue Pigment")": "[PigmentGlacialBlue.png](/w/File:PigmentGlacialBlue.png "File:PigmentGlacialBlue.png")"
50. "[Glyph Prism](/w/Glyph_Prism "Glyph Prism")": "[LotusSymbolGlyph.png](/w/File:LotusSymbolGlyph.png "File:LotusSymbolGlyph.png")"
51. "[Greater Madurai Lens](/w/Greater_Madurai_Lens "Greater Madurai Lens")": "[GreaterFocusLens.png](/w/File:GreaterFocusLens.png "File:GreaterFocusLens.png")"
52. "[Greater Naramon Lens](/w/Greater_Naramon_Lens "Greater Naramon Lens")": "[GreaterFocusLens.png](/w/File:GreaterFocusLens.png "File:GreaterFocusLens.png")"
53. "[Greater Unairu Lens](/w/Greater_Unairu_Lens "Greater Unairu Lens")": "[GreaterFocusLens.png](/w/File:GreaterFocusLens.png "File:GreaterFocusLens.png")"
54. "[Greater Vazarin Lens](/w/Greater_Vazarin_Lens "Greater Vazarin Lens")": "[GreaterFocusLens.png](/w/File:GreaterFocusLens.png "File:GreaterFocusLens.png")"
55. "[Greater Zenurik Lens](/w/Greater_Zenurik_Lens "Greater Zenurik Lens")": "[GreaterFocusLens.png](/w/File:GreaterFocusLens.png "File:GreaterFocusLens.png")"
56. "[Harmony Green Pigment](/w/Harmony_Green_Pigment "Harmony Green Pigment")": "[PigmentHarmonyGreen.png](/w/File:PigmentHarmonyGreen.png "File:PigmentHarmonyGreen.png")"
57. "[Health Restore](/w/Health_Restore "Health Restore")": "[HealthRestore(Large).png](/w/File:HealthRestore(Large).png "File:HealthRestore(Large).png")"
58. "[Hesperia Brown Pigment](/w/Hesperia_Brown_Pigment "Hesperia Brown Pigment")": "[PigmentHesperiaBrown.png](/w/File:PigmentHesperiaBrown.png "File:PigmentHesperiaBrown.png")"
59. "[Höllars](/w/H%C3%B6llars "Höllars")": "[Hollars.png](/w/File:Hollars.png "File:Hollars.png")"
60. "[Höllvanian Pitchweave Fragment](/w/H%C3%B6llvanian_Pitchweave_Fragment "Höllvanian Pitchweave Fragment")": "[HollvanianPitchweaveFragment.png](/w/File:HollvanianPitchweaveFragment.png "File:HollvanianPitchweaveFragment.png")"
61. "[Intermission I Cred](/w/Intermission_I_Cred?action=edit&redlink=1 "Intermission I Cred (page does not exist)")": "[NoraCred64.png](/w/File:NoraCred64.png "File:NoraCred64.png")"
62. "[Intermission II Cred](/w/Intermission_II_Cred?action=edit&redlink=1 "Intermission II Cred (page does not exist)")": "[Nora2Cred64.png](/w/File:Nora2Cred64.png "File:Nora2Cred64.png")"
63. "[Intermission III Cred](/w/Intermission_III_Cred?action=edit&redlink=1 "Intermission III Cred (page does not exist)")": "[Nora3Cred64.png](/w/File:Nora3Cred64.png "File:Nora3Cred64.png")"
64. "[Jackal Yellow Pigment](/w/Jackal_Yellow_Pigment "Jackal Yellow Pigment")": "[PigmentJackalYellow.png](/w/File:PigmentJackalYellow.png "File:PigmentJackalYellow.png")"
65. "[Jordas Golem Assassinate](/w/Jordas_Golem_Assassinate "Jordas Golem Assassinate")": "[J3Golem.png](/w/File:J3Golem.png "File:J3Golem.png")"
66. "[Kappa Beacon](/w/Kappa_Beacon "Kappa Beacon")": "[NavCodeVayHekC.png](/w/File:NavCodeVayHekC.png "File:NavCodeVayHekC.png")"
67. "[Leaf Red Pigment](/w/Leaf_Red_Pigment "Leaf Red Pigment")": "[PigmentLeafRed.png](/w/File:PigmentLeafRed.png "File:PigmentLeafRed.png")"
68. "[Leech Green Pigment](/w/Leech_Green_Pigment "Leech Green Pigment")": "[PigmentLeechGreen.png](/w/File:PigmentLeechGreen.png "File:PigmentLeechGreen.png")"
69. "[Lua Madurai Lens](/w/Lua_Madurai_Lens "Lua Madurai Lens")": "[LuaLens.png](/w/File:LuaLens.png "File:LuaLens.png")"
70. "[Lua Naramon Lens](/w/Lua_Naramon_Lens "Lua Naramon Lens")": "[LuaLens.png](/w/File:LuaLens.png "File:LuaLens.png")"
71. "[Lua Unairu Lens](/w/Lua_Unairu_Lens "Lua Unairu Lens")": "[LuaLens.png](/w/File:LuaLens.png "File:LuaLens.png")"
72. "[Lua Vazarin Lens](/w/Lua_Vazarin_Lens "Lua Vazarin Lens")": "[LuaLens.png](/w/File:LuaLens.png "File:LuaLens.png")"
73. "[Lua Zenurik Lens](/w/Lua_Zenurik_Lens "Lua Zenurik Lens")": "[LuaLens.png](/w/File:LuaLens.png "File:LuaLens.png")"
74. "[Madurai Lens](/w/Madurai_Lens "Madurai Lens")": "[FocusLens.png](/w/File:FocusLens.png "File:FocusLens.png")"
75. "[Marks of Valiance](/w/Marks_of_Valiance "Marks of Valiance")": "[MarksOfValiance.png](/w/File:MarksOfValiance.png "File:MarksOfValiance.png")"
76. "[Memoriam Purple Pigment](/w/Memoriam_Purple_Pigment "Memoriam Purple Pigment")": "[PigmentMemoriamPurple.png](/w/File:PigmentMemoriamPurple.png "File:PigmentMemoriamPurple.png")"
77. "[Mergoo Pheromone Oota](/w/Mergoo_Pheromone_Oota "Mergoo Pheromone Oota")": "[KuakaPheromoneOota.png](/w/File:KuakaPheromoneOota.png "File:KuakaPheromoneOota.png")"
78. "[Moa Green Pigment](/w/Moa_Green_Pigment "Moa Green Pigment")": "[PigmentMoaGreen.png](/w/File:PigmentMoaGreen.png "File:PigmentMoaGreen.png")"
79. "[Morning Yellow Pigment](/w/Morning_Yellow_Pigment "Morning Yellow Pigment")": "[PigmentMorningYellow.png](/w/File:PigmentMorningYellow.png "File:PigmentMorningYellow.png")"
80. "[Mortus Pink Pigment](/w/Mortus_Pink_Pigment "Mortus Pink Pigment")": "[PigmentMortusPink.png](/w/File:PigmentMortusPink.png "File:PigmentMortusPink.png")"
81. "[Mutalist Alad V Assassinate](/w/Mutalist_Alad_V_Assassinate "Mutalist Alad V Assassinate")": "[PatientZero.png](/w/File:PatientZero.png "File:PatientZero.png")"
82. "[Mutalist Red Pigment](/w/Mutalist_Red_Pigment "Mutalist Red Pigment")": "[PigmentMutalistRed.png](/w/File:PigmentMutalistRed.png "File:PigmentMutalistRed.png")"
83. "[Nai-Zhen Kubrow Collar](/w/Nai-Zhen_Kubrow_Collar?action=edit&redlink=1 "Nai-Zhen Kubrow Collar (page does not exist)")": "[KubrowCollar.png](/w/File:KubrowCollar.png?action=edit&redlink=1 "File:KubrowCollar.png (page does not exist)")"
84. "[Nanite Blue Pigment](/w/Nanite_Blue_Pigment "Nanite Blue Pigment")": "[PigmentNaniteBlue.png](/w/File:PigmentNaniteBlue.png "File:PigmentNaniteBlue.png")"
85. "[Naramon Lens](/w/Naramon_Lens "Naramon Lens")": "[FocusLens.png](/w/File:FocusLens.png "File:FocusLens.png")"
86. "[Nautilus Carapace](/w/Nautilus_Carapace?action=edit&redlink=1 "Nautilus Carapace (page does not exist)")": "[Chassis.png](/w/File:Chassis.png "File:Chassis.png")"
87. "[Nautilus Cerebrum](/w/Nautilus_Cerebrum?action=edit&redlink=1 "Nautilus Cerebrum (page does not exist)")": "[Helmet.png](/w/File:Helmet.png "File:Helmet.png")"
88. "[Nautilus Systems](/w/Nautilus_Systems?action=edit&redlink=1 "Nautilus Systems (page does not exist)")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
89. "[Neo Pink Pigment](/w/Neo_Pink_Pigment "Neo Pink Pigment")": "[PigmentNeoPink.png](/w/File:PigmentNeoPink.png "File:PigmentNeoPink.png")"
90. "[Night Blue Pigment](/w/Night_Blue_Pigment "Night Blue Pigment")": "[PigmentNightBlue.png](/w/File:PigmentNightBlue.png "File:PigmentNightBlue.png")"
91. "[Nora's Choice Cred](/w/Nora%27s_Choice_Cred?action=edit&redlink=1 "Nora's Choice Cred (page does not exist)")": "[NoraCredOfferings.png](/w/File:NoraCredOfferings.png "File:NoraCredOfferings.png")"
92. "[Nora's Mix Vol. 1 Cred](/w/Nora%27s_Mix_Vol._1_Cred?action=edit&redlink=1 "Nora's Mix Vol. 1 Cred (page does not exist)")": "[Nora'sMixVol1Cred.png](/w/File:Nora%27sMixVol1Cred.png "File:Nora'sMixVol1Cred.png")"
93. "[Nora's Mix Vol. 2 Cred](/w/Nora%27s_Mix_Vol._2_Cred?action=edit&redlink=1 "Nora's Mix Vol. 2 Cred (page does not exist)")": "[Nora'sMixVol2Cred.png](/w/File:Nora%27sMixVol2Cred.png "File:Nora'sMixVol2Cred.png")"
94. "[Nora's Mix Vol. 3 Cred](/w/Nora%27s_Mix_Vol._3_Cred?action=edit&redlink=1 "Nora's Mix Vol. 3 Cred (page does not exist)")": "[Nora'sMixVol2Cred.png](/w/File:Nora%27sMixVol2Cred.png "File:Nora'sMixVol2Cred.png")"
95. "[Nora's Mix Vol. 4 Cred](/w/Nora%27s_Mix_Vol._4_Cred?action=edit&redlink=1 "Nora's Mix Vol. 4 Cred (page does not exist)")": "[Nora'sMixVol4Cred.png](/w/File:Nora%27sMixVol4Cred.png "File:Nora'sMixVol4Cred.png")"
96. "[Nora's Mix Vol. 5 Cred](/w/Nora%27s_Mix_Vol._5_Cred?action=edit&redlink=1 "Nora's Mix Vol. 5 Cred (page does not exist)")": "[Nora'sMixVol5Cred.png](/w/File:Nora%27sMixVol5Cred.png "File:Nora'sMixVol5Cred.png")"
97. "[Nora's Mix Vol. 6 Cred](/w/Nora%27s_Mix_Vol._6_Cred?action=edit&redlink=1 "Nora's Mix Vol. 6 Cred (page does not exist)")": "[Nora'sMixVol6Cred.png](/w/File:Nora%27sMixVol6Cred.png "File:Nora'sMixVol6Cred.png")"
98. "[Nora's Mix Vol. 7 Cred](/w/Nora%27s_Mix_Vol._7_Cred?action=edit&redlink=1 "Nora's Mix Vol. 7 Cred (page does not exist)")": "[Nora'sMixVol7Cred.png](/w/File:Nora%27sMixVol7Cred.png "File:Nora'sMixVol7Cred.png")"
99. "[Nora's Mix Vol. 8 Cred](/w/Nora%27s_Mix_Vol._8_Cred?action=edit&redlink=1 "Nora's Mix Vol. 8 Cred (page does not exist)")": "[Nora'sMixVol8Cred.png](/w/File:Nora%27sMixVol8Cred.png "File:Nora'sMixVol8Cred.png")"
100. "[Nora's Mix Vol. 9 Cred](/w/Nora%27s_Mix_Vol._9_Cred?action=edit&redlink=1 "Nora's Mix Vol. 9 Cred (page does not exist)")": "[Nora'sMixVol9Cred.png](/w/File:Nora%27sMixVol9Cred.png "File:Nora'sMixVol9Cred.png")"
101. "[Nora's Mix: Dreams of the Dead Cred](/w/Nora%27s_Mix:_Dreams_of_the_Dead_Cred?action=edit&redlink=1 "Nora's Mix: Dreams of the Dead Cred (page does not exist)")": "[Nora'sMixDreamsoftheDeadCred.png](/w/File:Nora%27sMixDreamsoftheDeadCred.png "File:Nora'sMixDreamsoftheDeadCred.png")"
102. "[Nora's Mix: Time Tempests Cred](/w/Nora%27s_Mix:_Time_Tempests_Cred?action=edit&redlink=1 "Nora's Mix: Time Tempests Cred (page does not exist)")": "[Nora'sMixTimeTempestsCred.png](/w/File:Nora%27sMixTimeTempestsCred.png "File:Nora'sMixTimeTempestsCred.png")"
103. "[Oak Brown Pigment](/w/Oak_Brown_Pigment "Oak Brown Pigment")": "[PigmentOakBrown.png](/w/File:PigmentOakBrown.png "File:PigmentOakBrown.png")"
104. "[Oberon Systems](/w/Oberon_Systems?action=edit&redlink=1 "Oberon Systems (page does not exist)")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
105. "[Olympus Blue Pigment](/w/Olympus_Blue_Pigment "Olympus Blue Pigment")": "[PigmentOlympusBlue.png](/w/File:PigmentOlympusBlue.png "File:PigmentOlympusBlue.png")"
106. "[Omega Beacon](/w/Omega_Beacon "Omega Beacon")": "[NavCodeVayHekD.png](/w/File:NavCodeVayHekD.png "File:NavCodeVayHekD.png")"
107. "[Omni Ammo Box](/w/Omni_Ammo_Box "Omni Ammo Box")": "[AmmoBox.png](/w/File:AmmoBox.png "File:AmmoBox.png")"
108. "[Omni Forma](/w/Omni_Forma "Omni Forma")": "[AuraForma.png](/w/File:AuraForma.png "File:AuraForma.png")"
109. "[Orokin Archive](/w/Orokin_Archive "Orokin Archive")": "[NavCoordinate.png](/w/File:NavCoordinate.png "File:NavCoordinate.png")"
110. "[Pigment](/w/Pigment "Pigment")": "[GenericDojoColorPigment.png](/w/File:GenericDojoColorPigment.png "File:GenericDojoColorPigment.png")"
111. "[Platinum](/w/Platinum "Platinum")": "[PlatinumLarge.png](/w/File:PlatinumLarge.png "File:PlatinumLarge.png")"
112. "[Potent Pherliac Pods](/w/Potent_Pherliac_Pods "Potent Pherliac Pods")": "[PherliacPods.png](/w/File:PherliacPods.png "File:PherliacPods.png")"
113. "[Proof Fragment](/w/Proof_Fragment "Proof Fragment")": "[NavCoordinate.png](/w/File:NavCoordinate.png "File:NavCoordinate.png")"
114. "[Railgun Blue Pigment](/w/Railgun_Blue_Pigment "Railgun Blue Pigment")": "[PigmentRailgunBlue.png](/w/File:PigmentRailgunBlue.png "File:PigmentRailgunBlue.png")"
115. "[Relay Strut Component](/w/Relay_Strut_Component "Relay Strut Component")": "[ThermicStrut.png](/w/File:ThermicStrut.png "File:ThermicStrut.png")"
116. "[Remote Observer](/w/Remote_Observer "Remote Observer")": "[GenericComponentPlug.png](/w/File:GenericComponentPlug.png "File:GenericComponentPlug.png")"
117. "[River Blue Pigment](/w/River_Blue_Pigment "River Blue Pigment")": "[PigmentRiverBlue.png](/w/File:PigmentRiverBlue.png "File:PigmentRiverBlue.png")"
118. "[Sand Yellow Pigment](/w/Sand_Yellow_Pigment "Sand Yellow Pigment")": "[PigmentSandYellow.png](/w/File:PigmentSandYellow.png "File:PigmentSandYellow.png")"
119. "[Scorched Beacon](/w/Scorched_Beacon?action=edit&redlink=1 "Scorched Beacon (page does not exist)")": "[ScorchedBeacon64.png](/w/File:ScorchedBeacon64.png "File:ScorchedBeacon64.png")"
120. "[Shard Black Pigment](/w/Shard_Black_Pigment "Shard Black Pigment")": "[PigmentShardBlack.png](/w/File:PigmentShardBlack.png "File:PigmentShardBlack.png")"
121. "[Sisters of Parvos Token](/w/Sisters_of_Parvos_Token?action=edit&redlink=1 "Sisters of Parvos Token (page does not exist)")": "[SistersOfParvosToken.png](/w/File:SistersOfParvosToken.png?action=edit&redlink=1 "File:SistersOfParvosToken.png (page does not exist)")"
122. "[Squad Ammo Restore (Large)](/w/Squad_Ammo_Restore_(Large) "Squad Ammo Restore (Large)")": "[LargeTeamAmmoPack.png](/w/File:LargeTeamAmmoPack.png "File:LargeTeamAmmoPack.png")"
123. "[Squad Ammo Restore (Medium)](/w/Squad_Ammo_Restore_(Medium) "Squad Ammo Restore (Medium)")": "[AmmoTotemMediumBundle.png](/w/File:AmmoTotemMediumBundle.png "File:AmmoTotemMediumBundle.png")"
124. "[Squad Ammo Restore (Small)](/w/Squad_Ammo_Restore_(Small) "Squad Ammo Restore (Small)")": "[TeamAmmoRestore.png](/w/File:TeamAmmoRestore.png "File:TeamAmmoRestore.png")"
125. "[Squad Energy Restore (Large)](/w/Squad_Energy_Restore_(Large) "Squad Energy Restore (Large)")": "[LargeTeamEnergyPack.png](/w/File:LargeTeamEnergyPack.png "File:LargeTeamEnergyPack.png")"
126. "[Squad Energy Restore (Medium)](/w/Squad_Energy_Restore_(Medium) "Squad Energy Restore (Medium)")": "[EnergyTotemMediumBundle.png](/w/File:EnergyTotemMediumBundle.png "File:EnergyTotemMediumBundle.png")"
127. "[Squad Energy Restore (Small)](/w/Squad_Energy_Restore_(Small) "Squad Energy Restore (Small)")": "[TeamEnergyRestore.png](/w/File:TeamEnergyRestore.png "File:TeamEnergyRestore.png")"
128. "[Squad Health Restore (Large)](/w/Squad_Health_Restore_(Large) "Squad Health Restore (Large)")": "[LargeTeamHealPack.png](/w/File:LargeTeamHealPack.png "File:LargeTeamHealPack.png")"
129. "[Squad Health Restore (Medium)](/w/Squad_Health_Restore_(Medium) "Squad Health Restore (Medium)")": "[HealthTotemMediumBundle.png](/w/File:HealthTotemMediumBundle.png "File:HealthTotemMediumBundle.png")"
130. "[Squad Health Restore (Small)](/w/Squad_Health_Restore_(Small) "Squad Health Restore (Small)")": "[TeamHealRestore.png](/w/File:TeamHealRestore.png "File:TeamHealRestore.png")"
131. "[Squad Shield Restore (Large)](/w/Squad_Shield_Restore_(Large) "Squad Shield Restore (Large)")": "[LargeTeamShieldPack.png](/w/File:LargeTeamShieldPack.png "File:LargeTeamShieldPack.png")"
132. "[Squad Shield Restore (Medium)](/w/Squad_Shield_Restore_(Medium) "Squad Shield Restore (Medium)")": "[ShieldTotemMediumBundle.png](/w/File:ShieldTotemMediumBundle.png "File:ShieldTotemMediumBundle.png")"
133. "[Squad Shield Restore (Small)](/w/Squad_Shield_Restore_(Small) "Squad Shield Restore (Small)")": "[TeamShieldRestore.png](/w/File:TeamShieldRestore.png "File:TeamShieldRestore.png")"
134. "[Standing](/w/Standing "Standing")": "[ReputationLarge.png](/w/File:ReputationLarge.png "File:ReputationLarge.png")"
135. "[Stock (Kahl)](/w/Stock_(Kahl) "Stock (Kahl)")": "[KahlStock.png](/w/File:KahlStock.png "File:KahlStock.png")"
136. "[Syrtis Orange Pigment](/w/Syrtis_Orange_Pigment "Syrtis Orange Pigment")": "[PigmentSyrtisOrange.png](/w/File:PigmentSyrtisOrange.png "File:PigmentSyrtisOrange.png")"
137. "[Tempest Brown Pigment](/w/Tempest_Brown_Pigment "Tempest Brown Pigment")": "[PigmentTempestBrown.png](/w/File:PigmentTempestBrown.png "File:PigmentTempestBrown.png")"
138. "[Tharsis Brown Pigment](/w/Tharsis_Brown_Pigment "Tharsis Brown Pigment")": "[PigmentTharsisBrown.png](/w/File:PigmentTharsisBrown.png "File:PigmentTharsisBrown.png")"
139. "[Tower White Pigment](/w/Tower_White_Pigment "Tower White Pigment")": "[PigmentTowerWhite.png](/w/File:PigmentTowerWhite.png "File:PigmentTowerWhite.png")"
140. "[Trade](/w/Trade "Trade")": "[TradableIconxWhite.png](/w/File:TradableIconxWhite.png "File:TradableIconxWhite.png")"
141. "[Tree Green Pigment](/w/Tree_Green_Pigment "Tree Green Pigment")": "[PigmentTreeGreen.png](/w/File:PigmentTreeGreen.png "File:PigmentTreeGreen.png")"
142. "[Unairu Lens](/w/Unairu_Lens "Unairu Lens")": "[FocusLens.png](/w/File:FocusLens.png "File:FocusLens.png")"
143. "[Vazarin Lens](/w/Vazarin_Lens "Vazarin Lens")": "[FocusLens.png](/w/File:FocusLens.png "File:FocusLens.png")"
144. "[Veiled Riven Cipher](/w/Veiled_Riven_Cipher "Veiled Riven Cipher")": "[RivenCipher.png](/w/File:RivenCipher.png "File:RivenCipher.png")"
145. "[Veldt Yellow Pigment](/w/Veldt_Yellow_Pigment "Veldt Yellow Pigment")": "[PigmentVeldtYellow.png](/w/File:PigmentVeldtYellow.png "File:PigmentVeldtYellow.png")"
146. "[Volt Systems](/w/Volt_Systems?action=edit&redlink=1 "Volt Systems (page does not exist)")": "[Systems.png](/w/File:Systems.png "File:Systems.png")"
147. "[Wisp Grey Pigment](/w/Wisp_Grey_Pigment "Wisp Grey Pigment")": "[PigmentWispGrey.png](/w/File:PigmentWispGrey.png "File:PigmentWispGrey.png")"
148. "[Wolf Cred](/w/Wolf_Cred?action=edit&redlink=1 "Wolf Cred (page does not exist)")": "[WolfCred64.png](/w/File:WolfCred64.png "File:WolfCred64.png")"
149. "[Zenurik Lens](/w/Zenurik_Lens "Zenurik Lens")": "[FocusLens.png](/w/File:FocusLens.png "File:FocusLens.png")"
150. "[[[PH]]]": "[Panel.png](/w/File:Panel.png "File:Panel.png")"

## Resource Data

[[edit source](/w/Module:Resources/data/doc?action=edit&section=4 "Edit section's source code: Resource Data")]

