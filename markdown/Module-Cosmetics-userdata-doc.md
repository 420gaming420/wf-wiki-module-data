---
title: "Module:Cosmetics/userdata/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Cosmetics/userdata/doc"
wiki_timestamp: "2026-11-23T02:02:32Z"
---

**Users** collection maps items to the cosmetics they can equip in the respective cosmetic slot.

Cosmetic items in this collection should have a corresponding entry on a [Module:Cosmetics/data](/w/Module:Cosmetics/data "Module:Cosmetics/data") subpage.

## Users Data Schema

[[edit](/w/Module:Cosmetics/userdata/doc?action=edit&section=1 "Edit Section using Source Editor:
Users Data Schema")]

```lua
		["Item Name"] = {
			Equipments = {
				["Animation Set"] = {
					"Animation Set Name",
				},
				Auxiliary = {
					"Auxiliary Name",
				},
				Armor = {
					"Armor Name",
				},
				Emblem = {
					"Emblem Name",
				},
				Ephemera = {
					"Ephemera Name",
				},
				Helmet = {
					"Helmet Name",
				},
				Holster = {
					"Holster Name",
				},
				Livery = {
					"Livery Name",
				},
				Skin = {
					"Skin Name",
				},
			},
			Type = "Weapon/Warframe/Attachment/Vehicle/Companion",
		},
```

Supported `Equipments` tables:

Supported cosmetic equipment slots

| Name | Item Types |
| --- | --- |
| Animation Set | [Warframe](/w/Warframe "Warframe"), [Operator](/w/Operator "Operator"), [Drifter](/w/Drifter "Drifter") |
| Auxiliary | Warframe |
| Armor | Warframe |
| Beard | Drifter |
| Body Suit | Operator |
| Chamfron | [Kaithe](/w/Kaithe "Kaithe") |
| Collar | Kubrow |
| Coronet | Kaithe |
| Ear | Operator, Drifter |
| Emblem | Warframe, Companion |
| Emotion Module | [MOA (Companion)](/w/MOA_(Companion) "MOA (Companion)") |
| Ephemera | Warframe, Operator, Drifter |
| Eye | Operator, Drifter |
| Face | Operator, Drifter |
| Facial | Operator, Drifter |
| Gene-Masking Kit | Kubrow, Kavat |
| Hair | Operator, Drifter |
| Helmet | Warframe, Necramech, [Kahl-175](/w/Kahl-175 "Kahl-175") |
| Holster | Warframe |
| Hood | Operator, Drifter |
| Leggings | Operator, Drifter, Kahl-175 |
| Livery | [Atomocycle](/w/Atomocycle "Atomocycle") |
| Markings | Operator, Drifter |
| Pattern | Kubrow, Kavat |
| Pedigree | Kaithe |
| Saddle | Kaithe |
| Scrawl | [K-Drive](/w/K-Drive "K-Drive") |
| Skin | Warframe, Archwing, Necramech, [Landing Craft](/w/Landing_Craft "Landing Craft"), [Railjack](/w/Railjack "Railjack") |
| Sleeves | Operator, Drifter |
| Sumdali | Landing Craft |
| Tail | Sentinel, Kaithe |
| Visage Ink | Operator, Drifter |
| Waistband | Operator, Drifter |
| Wing | Sentinel |

