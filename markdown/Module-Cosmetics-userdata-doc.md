---
title: "Module:Cosmetics/userdata/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Cosmetics/userdata/doc"
wiki_timestamp: "2026-04-15T14:08:53Z"
---

## Users Data Schema

[[edit source](/w/Module:Cosmetics/userdata/doc?action=edit&section=1 "Edit section's source code: Users Data Schema")]

**Users** collection maps items to the cosmetics they can equip in the respective cosmetic slot.

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

* Supported `Equipments` tables:
  + Animation Set
  + Auxiliary
  + Armor
  + Beard
  + Body Suit
  + Chamfron
  + Collar
  + Coronet
  + Ear
  + Emblem
  + Emotion Module
  + Ephemera
  + Eye
  + Face
  + Facial
  + Gene-Masking Kit
  + Hair
  + Helmet
  + Holster
  + Hood
  + Leggings
  + Livery
  + Markings
  + Pattern
  + Pedigree
  + Saddle
  + Scrawl
  + Skin
  + Sleeves
  + Sumdali
  + Tail
  + Visage Ink
  + Waistband
  + Wing

