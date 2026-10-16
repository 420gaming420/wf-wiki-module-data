---
title: "Module:Ability/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Ability/data/doc"
wiki_timestamp: "2026-10-15T13:27:32Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Ability/data/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Add [Railjack](/w/Railjack "Railjack") abilities like [Phoenix Blaze](/w/Phoenix_Blaze "Phoenix Blaze")

Database of abilities in [WARFRAME](/w/WARFRAME "WARFRAME").

:   *Last updated: Thu, 15 Oct 2026 13:27:32 +0000 (UTC) by [User:Yazuh](/w/User:Yazuh "User:Yazuh") ([change log](https://wiki.warframe.com/w/Module:Ability/data/doc?diff=0))*

## Contents

* [1 Ability Entry Schema](#Ability_Entry_Schema)
* [2 Ability Data](#Ability_Data)

## Ability Entry Schema

[[edit](/w/Module:Ability/data/doc?action=edit&section=1 "Edit Section using Source Editor:
Ability Entry Schema")]

```lua
	["Ability Name"] = {
		CardImage = "CardImageName.png",
		Cost = 100,
		CostType = "Mutation",
		Description = "In-game ability description",
		Icon = "AbilityIcon.png",
  		InternalName = "/Lotus/Powersuits/PowersuitAbilities/",
		Introduced = "29",
		IsChanneled = true,
		Key = 4,
		Link = "Page Name",
		Name = "Ability Name",
		Powersuit = "Warframe/Necramech/Archwing Name",
		Preview = "AbilityPreview.webm",
		PreviewFallback = "AbilityPreview.jpg",
		Subsumable = false,
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Augments` | Table (of strings) | ❌ | List of augment mods names associated with ability | `{ "Chromatic Blade" }` |
| `CardImage` | String | ✔️ | Image file name of the ability card as uploaded to the wiki | `"AirburstModU15.png"` |
| `Cost` | Number (int) | ✔️ | Cost for casting the abiltiy ( most of the time [Energy](/w/Energy "Energy")) , used in conjonction with *CostType* | `50` |
| `CostType` | Type (String) | ❌ | Alternate Cost for casting an ability . Ex : [Mutation](/w/Mutation "Mutation") for  [Nidus'](/w/Nidus "Nidus")  [Ravenous](/w/Ravenous "Ravenous") . Defined in [Module:Ability/infobox](/w/Module:Ability/infobox "Module:Ability/infobox") | `Mutation` |
| `Description` | String | ✔️ | In-game description of ability | `"Nyx absorbs all incoming damage and channels that collected energy into an explosive radial discharge. Nyx's Weapon damage is buffed based on incoming absorbed damage when the Ability ends."` |
| `Icon` | String | ✔️ | Image file name of the ability icon as uploaded to the wiki; icon must be in black | `"Airburst130xDark.png"` |
| `InternalName` | String | ✔️ | The full unique name of an ability formatted as a file path | `"/Lotus/Powersuits/PowersuitAbilities/HelminthStrengthAbility"` |
| `Introduced` | String | ✔️ | The game version in which the ability was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME"). `Introduced` keys can be cross-referenced with [Module:Warframes/data](/w/Module:Warframes/data "Module:Warframes/data"), but note that some abilities were introduced later on with Warframe reworks or are not associated with an individual Warframe at all (e.g. [Helminth](/w/Helminth "Helminth") abilities). | `"30.5"` or `"Specters of the Rail"` |
| `IsChanneled` | Boolean | ❌ | For abilities in the group of [Channeled Abilities](/w/Channeled_Abilities "Channeled Abilities") | `true` |
| `Key` | Number (int) | ✔️ | Default [key binding](/w/Key_Bindings "Key Bindings") on PC for ability | `4` |
| `Link` | String | ✔️ | Page/article link to the ability on the wiki | `"Amp (Ability)"` |
| `Name` | String | ✔️ | Name of ability | `"Amp"` |
| `Powersuit` | String | ✔️ | Name of player avatar that comes with ability by default; for [Helminth](/w/Helminth "Helminth") abilities put in "Helminth" | `"Excalibur"` or `"Helminth"` |
| `Preview` | String | ❌ | Video file name of the ability preview as uploaded to the wiki. Should use .webm for smaller file sizes. | `"AirburstPreview.webm"` |
| `PreviewFallback` | String | ❌ | Image file name of the ability preview as uploaded to the wiki. This is for fallback in case preview video doesn't load | `"AirburstPreview.jpg"` |
| `Subsumable` | Boolean | ❌ | For abilities that can be injected into other Warframes through [Helminth](/w/Helminth "Helminth") | `true` |

## Ability Data

[[edit](/w/Module:Ability/data/doc?action=edit&section=2 "Edit Section using Source Editor:
Ability Data")]

