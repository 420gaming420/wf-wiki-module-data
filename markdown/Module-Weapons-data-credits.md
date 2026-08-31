---
title: "Module:Weapons/data/credits"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/data/credits"
wiki_timestamp: "2022-01-03T06:42:21Z"
---

WIP database for storing the data on the designers behind the weapons.

:   *Last updated: Mon, 03 Jan 2022 06:42:21 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Weapons/data/credits?diff=0))*

## Credits Entry Schema

[[edit source](/w/Module:Weapons/data/credits/doc?action=edit&section=T-1 "Edit section's source code: Credits Entry Schema")]

```lua
	["Weapon Internal Name"] = {
		Animator = "",
		ConceptArtist = "",
		Modeller = "",
		SoundDesigner = "",
		SourceLink = "URL",
		SourceArchive = "URL"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Animator` | String or Table (of strings) | ❌ | Weapon animator(s) |  |
| `ConceptArtist` | String or Table (of strings) | ❌ | Weapon concept artist(s) | `""` |
| `Modeller` | String or Table (of strings) | ❌ | Weapon modeller(s) | `""` |
| `SoundDesigner` | String or Table (of strings) | ❌ | Weapon sound designer(s) | `""` |
| `SourceLink` | String or Table (of strings) | ✔️ | URL(s) that provide proof of work such as those on artstation.com or from official [Devstreams](/w/Devstreams "Devstreams") | `"https://www.artstation.com/artwork/3dDJlm"` |
| `SourceArchive` | String or Table (of strings) | ✔️ | Archive link(s) to `SourceLink` | `""` |

## Data

[[edit source](/w/Module:Weapons/data/credits/doc?action=edit&section=T-2 "Edit section's source code: Data")]

---

```lua
return {
	["/Lotus/Weapons/Tenno/Pistols/PrimePandero/PanderoPrimeWeapon"] = {
		Animator = "",
		ConceptArtist = "Andrew Yu",
		Modeller = "Malaya Yu",
		SoundDesigner = "",
		SourceLink = "https://www.artstation.com/artwork/3dDJlm",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Tenno/Archwing/Primary/ThanoTechGrenadeLaunch/ThanoTechGrenadeLauncher"] = {
		Animator = "",
		ConceptArtist = "Lucas Hug",
		Modeller = "Malaya Yu",
		SoundDesigner = "",
		SourceLink = "https://www.artstation.com/artwork/L39KLA",
		SourceArchive = "",
	},
	["/Lotus/Weapons/ClanTech/Chemical/FlameThrower"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Grineer/Pistols/GrnKohmPistol/GrnKohmPistol"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Grineer/Melee/GrnDualFireAxe/GrnDualFireAxe"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/ClanTech/Chemical/RocketLauncher"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/ClanTech/Bio/BioWeapon"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Grineer/Melee/GrineerTylAxeAndBoar/RegorAxeShield"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Grineer/Melee/GrineerWhip/GrineerWhip"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Infested/Melee/TipedoStaff/InfTipedoStaff"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Infested/LongGuns/QuantaFullyInfested/InfQuantaRifle"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Tenno/Pistols/PrimeVasto/PrimeVastoPistol"] = {
		ConceptArtist = "",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Tenno/Pistols/PrimeVasto/AkPrimeVasto/AkPrimeVastoPistol"] = {
		ConceptArtist = "",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Tenno/LongGuns/RepeatingCrossbow/RepeatingCrossbow"] = {
		ConceptArtist = "",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
	["/Lotus/Weapons/Tenno/Archwing/Primary/ArchBurstGun/ArchBurstGun"] = {
		ConceptArtist = "Lucas Hug",
		Modeller = "Lucas Hug",
		SourceLink = "https://www.artstation.com/artwork/XXm5a",
		SourceArchive = "",
	},
}
```

