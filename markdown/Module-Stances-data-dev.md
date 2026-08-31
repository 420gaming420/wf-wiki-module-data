---
title: "Module:Stances/data/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Stances/data/dev"
wiki_timestamp: "2022-05-14T19:14:12Z"
---

*Documentation for this module may be created at [Module:Stances/data/dev/doc](/w/Module:Stances/data/dev/doc?action=edit&redlink=1 "Module:Stances/data/dev/doc (page does not exist)")*

```lua
return {
	__Legend = {
		StanceName = "__Legend",
		Damage = { Attacks = { { Dmg = { 200 }, Hits = { 1 } } }, Name = "Damage" },
		Hits = { Attacks = { { Dmg = { 100 }, Hits = { 2 } } }, Name = "Hits" } 
	},
	["Heavy Scythe"] = {
		StanceName = "Heavy Scythe",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Impact" }},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } },
			},
			Duration = 1.905,
			Image = "HeavyScytheComboNeutral.gif",
			Name = "Combo 1" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.437,
			Image = "HeavyScytheComboForward.gif",
			Name = "Combo 2" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Impact" }},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } },
			},
			Duration = 1.905,
			Image = "HeavyScytheComboNeutral.gif",
			Name = "Combo 1" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Impact" }},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } },
			},
			Duration = 1.905,
			Image = "HeavyScytheComboNeutral.gif",
			Name = "Combo 1" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "" } } 
			},
			Image = "HeavyScytheComboAir.gif",
			Name = "Wind's Teeth" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1200 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "HeavyScytheComboFinisherGround.gif",
			Name = "Tunneling Spike" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 200,200,200 },
					Hits = { 1,1,1 },
					Procs = { "Knockback", "Bleeding", "Knockdown" },
					Shape = "Heavy" 
				},
				{
					Dmg = { 600, 600 },
					Hits = { 1, 1 },
					Procs = { "Ragdoll", "Ragdoll" },
					Shape = "Heavy" 
				} 
			},
			Image = "HeavyScytheComboHeavy.gif",
			Name = "Titan Cull" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { }, Types = { "360" } } },
			Image = "HeavyScytheComboSlide.gif",
			Name = "Hell's Wave" 
		},
		Wall = { Attacks = { { Dmg = { 200 }, Hits = { 1 } } }, Image = "HeavyScytheComboWall.gif", Name = "Flaying Home" },
		WeaponType = "Heavy Scythe"
	},
	["Galeforce Dawn"] = {
		StanceName = "Galeforce Dawn",
		Block = {
			Attacks = {
				{  Dmg = { 200 }, Hits = { 1 }, Procs = { { "Knockback" } } },
				{  Dmg = { 200 }, Hits = { 1 }, Procs = { { "Bleeding" } } },
				{  Dmg = { 500 }, Hits = { 1 }, Procs = { { "Knockdown" } } },
			},
			Duration = 3.06,
			Image = "GaleforceDawnCombo0.gif",
			Name = "Stormreaper"
		},
		Forward = {
			Attacks = {
				{  Dmg = { 100 }, Hits = { 2 } },
				{  Dmg = { 100 }, Hits = { 3 } },
				{  Dmg = { 100 }, Hits = { 1 } }
			},
			Duration = 2.66,
			Image = "GaleforceDawnCombo1.gif",
			Name = "Bleak Winnowing" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback"} },
				{ Dmg = { 100, 200, 100, 300 }, Hits = { 1, 1, 1, 1 }, Procs = { "Knockback", "Knockback", "Bleeding", }, Types = { "Slam" } },
				{ Dmg = { 100, 200, 200 }, Hits = { 1, 1, 1 }, Procs = { "Bleeding", "Knockback",  } },
			},
			Duration = 4.86,
			Image = "GaleforceDawnCombo2.gif",
			Name = "Thundering Peaks" 
		},
		Neutral = {
			Attacks = {
				{  Dmg = { 200 }, Hits = { 1 }, Procs = { { "Knockback" } } },
				{  Dmg = { 200 }, Hits = { 1 }, Procs = { { "Bleeding" } } },
				{  Dmg = { 500 }, Hits = { 1 }, Procs = { { "Knockdown" } } },
			},
			Duration = 3.06,
			Image = "GaleforceDawnCombo0.gif",
			Name = "Stormreaper" 
		},
		WeaponType = "Heavy Scythe"
	},
	["Butcher's Revelry"] = {
		StanceName = "Butcher's Revelry",
		Block = {
			Attacks = {
				{ Dmg = { 100, 100, 200 }, Hits = { 2, 1, 2 } },
				{ Dmg = { 200, 100, 200, 400, 100 }, Hits = { 1, 1, 1, 1, 1 }, Procs = { "Bleeding", "Bleeding", "Bleeding", "Ragdoll", "Knockback" }, Types = { "Sweep", "Sweep", "Sweep", "", "Slam" } },
			},
			Duration = 5.75,
			Image = "ButchersRevelryCombo3.gif",
			Name = "Reciprocator" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 2.83,
			Image = "ButchersRevelryCombo1.gif",
			Name = "Ghoul Rush" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 200, 300, 100 }, Hits = { 1, 1, 1, 1 }, Procs = { "Knockback", "Knockdown", "Knockdown", "Knockback" }, Types = { "Thrust", "Thrust", "","Slam" } },
			},
			Duration = 3.8,
			Image = "ButchersRevelryCombo2.gif",
			Name = "Rip 'N Ride" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback" } } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 }, Procs = { { "Bleeding" } } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 }, Procs = { { "Bleeding", "Knockdown" } } } 
			},
			Duration = 4.93,
			Image = "ButchersRevelryCombo0.gif",
			Name = "Rictus' Wrath" 
		},
		WeaponType = "Assault Saw"
	},
	["Assault Saw"] = {
		StanceName = "Assault Saw",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 2.83,
			Image = "ButchersRevelryCombo1.gif",
			Name = "Ghoul Rush" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 2.83,
			Image = "ButchersRevelryCombo1.gif",
			Name = "Ghoul Rush" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 2.83,
			Image = "ButchersRevelryCombo1.gif",
			Name = "Ghoul Rush" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 2.83,
			Image = "ButchersRevelryCombo1.gif",
			Name = "Ghoul Rush" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } }
			},
			Image = "AssaultSawComboAir.gif",
			Name = "Spine Splitter" 
		},
		Finisher = {
			Attacks = { { Dmg = { 900 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "AssaultSawComboFinisherGround.gif",
			Name = "Deep Cuts" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 100, 100, 100 }, Hits = { 3, 2, 1 }, Procs = { "", "Bleeding", { "Bleeding", "Knockdown" } }, Shape = "Heavy" },
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Ragdoll" }, Shape = "Heavy" } 
			},
			Image = "AssaultSawComboHeavy.gif",
			Name = "Carving Carcass" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
			},
			Image = "AssaultSawComboNeutral.gif",
			Name = "" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 1.03,
			Image = "AssaultSawComboSlide.gif",
			Name = "Ankle Cutter" 
		},
		Slam = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300 }, Hits = { 1 } },
			},
			Image = "AssaultSawComboSlam.gif",
			Name = "" 
		},
		Wall = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback" } } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { { "Bleeding", "Knockdown" } } } 
			},
			Duration = 4.5,
			Image = "ButchersRevelryCombo0.gif",
			Name = "Rictus' Wrath" 
		},
		WeaponType = "Assault Saw"
	},
	["Argent Scourge"] = {
		StanceName = "Argent Scourge",
		ConclaveOnly = true,
		Block = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "ArgentScourgeComboOne.gif",
			Name = "Roaring Whirlwind" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ArgentScourgeComboTwo.gif",
			Name = "Cutting Tempest" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 100, 100 }, Hits = { 1, 1, 1 } } 
			},
			Image = "ArgentScourgeComboThree.gif",
			Name = "Shrieking Wind" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "ArgentScourgeComboOne.gif",
			Name = "Roaring Whirlwind" 
		},
		WeaponType = "Polearm" 
	},
	["Astral Twilight"] = {
		StanceName = "Astral Twilight",
		Block = {
			Attacks = {
				{ Dmg = { 200, 200, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "Lifted", "Bleeding" } },
				{ Dmg = { 100, 200, 200 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Bleeding" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 3.5,
			Image = "AstralTwilightCombo3.gif",
			Name = "Rising Moon" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 100 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Lifted" } } 
			},
			Duration = 3.4,
			Image = "AstralTwilightCombo1.gif",
			Name = "Midnight Cloud" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 100 }, Hits = { 4 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Duration = 3.2,
			Image = "AstralTwilightCombo2.gif",
			Name = "Falling Star" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 300 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 3 } },
				{
					Dmg = { 200, 100, 200 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", "Knockdown" },
					Types = { "Sweep", "", "360" } 
				} 
			},
			Duration = 4.25,
			Image = "AstralTwilightCombo0.gif",
			Name = "Morning Sun" 
		},
		WeaponType = "Glaive" 
	},
	["Atlantis Vulcan"] = {
		StanceName = "Atlantis Vulcan",
		Block = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 7 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 4 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 3 }, Types = { "360" } },
				{ Dmg = { 100, 200 }, Hits = { 3, 1 }, Procs = { "", "Ragdoll" }, Types = { "360", "360" } } 
			},
			Duration = 3.35,
			Image = "AtlantisVulcanCombo3.gif",
			Name = "Infernal Maelstrom" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } } 
			},
			Duration = 3.25,
			Image = "AtlantisVulcanCombo1.gif",
			Name = "Searing Undertow" 
		},
		["Forward Block"] = {
			Attacks = { 
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } }, 
				{ Dmg = { 50, 100, 100, 150, 150 }, Hits = { 4, 1, 4, 1, 3 }, Procs = {"", "Knockback", "", "Knockback", ""} }
			},
			Duration = 4.1,
			Image = "AtlantisVulcanCombo2.gif",
			Name = "Blazing Vortex" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 3 }, Types = { "360" } },
				{ Dmg = { 50 }, Hits = { 6 } },
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Ragdoll" } } 
			},
			Duration = 3.45,
			Image = "AtlantisVulcanCombo0.gif",
			Name = "Molten Whirlpool" 
		},
		WeaponType = "Nunchaku" 
	},
	["Biting Piranha"] = {
		StanceName = "Biting Piranha",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "BitingPiranhaComboOne.gif",
			Name = "Rushing Cuts" 
		},
		Forward = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "BitingPiranhaComboTwo.gif",
			Name = "Flasing Razor" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 100 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "BitingPiranhaComboThree.gif",
			Name = "Leaping Slash" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "BitingPiranhaComboOne.gif",
			Name = "Rushing Cuts" 
		},
		WeaponType = "Dual Daggers" 
	},
	["Blade and Whip"] = {
		StanceName = "Blade and Whip",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 100, 200 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Ragdoll" }, "" } 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.25,
			Image = "DefiledSnapdragonCombo0.gif",
			Name = "Claws of the Drake" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 100, 200 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Ragdoll" }, "" } 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.25,
			Image = "DefiledSnapdragonCombo0.gif",
			Name = "Claws of the Drake" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 100, 200 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Ragdoll" }, "" } 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.25,
			Image = "DefiledSnapdragonCombo0.gif",
			Name = "Claws of the Drake" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 100, 200 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Ragdoll" }, "" } 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.25,
			Image = "DefiledSnapdragonCombo0.gif",
			Name = "Claws of the Drake" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Image = "Blade-WhipComboAir.gif",
			Name = "Weightless Steel" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "Blade-WhipComboFinisherGround.gif",
			Name = "Death's Mark" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" }, Shape = "Heavy" },
				{
					Dmg = { 400, 400, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "Lifted", "Ragdoll", "" },
					Shape = "Heavy" 
				} 
			},
			Image = "Blade-WhipComboHeavy.gif",
			Name = "Rolling Thunder" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } },
			Image = "Blade-WhipComboSlide.gif",
			Name = "Spiral Cut" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "Blade-WhipComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Blade and Whip"
	},
	["Bleeding Willow"] = {
		StanceName = "Bleeding Willow",
		Block = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "BleedingWillowCombo1.gif",
			Name = "Lethal Gust" 
		},
		Forward = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "BleedingWillowCombo1.gif",
			Name = "Lethal Gust" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "Knockback", "Knockback" }, Types = {"", ""} },
				{ SlashMultiplier = 1.5, Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200, 100 }, Hits = { 1, 2 } },
				{
					Dmg = { 200, 400 },
					Hits = { 1, 1 },
					Procs = { "Bleeding", "Knockdown" },
					Types = { "360", "Thrust" } 
				} 
			},
			Duration = 3.5,
			Image = "BleedingWillowCombo2.gif",
			Name = "Drifting Steel" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "BleedingWillowCombo1.gif",
			Name = "Lethal Gust" 
		},
		WeaponType = "Polearm" 
	},
	["Blind Justice"] = {
		StanceName = "Blind Justice",
		Block = {
			Attacks = {
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } },
				{
					Dmg = { 100, 200, 200 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", { "Knockback", "Bleeding" } } 
				},
				{ SlashMultiplier = 2, Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.7,
			Image = "BlindJusticeCombo3.gif",
			Name = "Destined Path" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "360" } },
				{
					Dmg = { 100, 200, 300 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", "Lifted" },
					Types = { "360", "360", "Sweep" } 
				},
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 3.05,
			Image = "BlindJusticeCombo1.gif",
			Name = "Zatōs Creed" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 5 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200, 400, 100 }, Hits = { 1, 1, 1 }, Types = { "Sweep", "", "Slam" } } 
			},
			Duration = 2.45,
			Image = "BlindJusticeCombo2.gif",
			Name = "Heeding Call" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ SlashMultiplier = 2, Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200, 400 }, Hits = { 1, 1 }, Procs = { "Bleeding", "Knockdown" } } 
			},
			Duration = 2.6,
			Image = "BlindJusticeCombo0.gif",
			Name = "Guiding Light" 
		},
		Slide = {
			Attacks = {
				{
					Dmg = { 100, 100, 100 },
					Hits = { 2, 1, 1 },
					Procs = { "", "Lifted", "" },
					Types = { "360", "360", "360" } 
				} 
			},
			Duration = 0.91,
			Image = "NikanaBlindJusticeComboSlide.gif",
			Name = "Parting Knee" 
		},
		Wall = {
			Attacks = { { Dmg = { 215 }, Hits = { 1 } } },
			Image = "NikanaBlindJusticeComboWall.gif",
			Name = "Guiding Wire" 
		},
		WeaponType = "Nikana" 
	},
	["Brutal Tide"] = {
		StanceName = "Brutal Tide",
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 } },
				{ Dmg = { 300 }, Hits = { 2 } } 
			},
			Duration = 2.15,
			Image = "BrutalTideCombo1.gif",
			Name = "Inferno" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 } },
				{ Dmg = { 300 }, Hits = { 2 } } 
			},
			Duration = 2.15,
			Image = "BrutalTideCombo1.gif",
			Name = "Inferno" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" }, Types = {""} },
				{ Dmg = { 300, 100, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 200, 300, 100 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockdown" } } 
			},
			Duration = 3.85,
			Image = "BrutalTideCombo2.gif",
			Name = "Rushing Fire" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 } },
				{ Dmg = { 300 }, Hits = { 2 } } 
			},
			Duration = 2.15,
			Image = "BrutalTideCombo1.gif",
			Name = "Inferno" 
		},
		WeaponType = "Sparring" 
	},
	["Bullet Dance"] = {
		StanceName = "Bullet Dance",
		Block = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {"", {"Bleeding", "Stagger"}}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } } 
			},
			Duration = 3,
			Image = "BulletDanceCombo3.gif",
			Name = "Samba Slash" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } } 
			},
			Duration = 3,
			Image = "BulletDanceCombo1.gif",
			Name = "Magnum Mambo" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 200, 100 }, Hits = { 2, 2 }, Procs = {"", {"Bleeding", "Stagger"}}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 2.8,
			Image = "BulletDanceCombo2.gif",
			Name = "Lead Tango" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 125, 100 }, Hits = { 1, 1 }, Procs = {"", {"Bleeding", "Stagger"}}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 125, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 150, 100 }, Hits = { 1, 1 }, Procs = {"", {"Bleeding", "Stagger"}}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = {1.25, 1}, PunctureMultiplier = {1.25, 1}, ImpactMultiplier = {1.25, 1}, Dmg = { 300 }, Hits = { 3 }, Procs = { "Knockback" } } 
			},
			Duration = 4.5,
			Image = "BulletDanceCombo0.gif",
			Name = "Automatic Rhumba" 
		},
		WeaponType = "Gunblade" 
	},
	["Burning Wasp"] = {
		StanceName = "Burning Wasp",
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Duration = 1.9,
			Image = "BurningWaspCombo0.gif",
			Name = "Sparking Torture" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "360" } } 
			},
			Duration = 3,
			Image = "BurningWaspCombo1.gif",
			Name = "Buzzing Sting" 
		},
		["Forward Block"] = {
			Attacks = { 
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 1.8,
			Image = "BurningWaspCombo2.gif",
			Name = "Guided Claw" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Duration = 1.9,
			Image = "BurningWaspCombo0.gif",
			Name = "Sparking Torture" 
		},
		WeaponType = "Whip" 
	},
	["Carving Mantis"] = {
		StanceName = "Carving Mantis",
		Block = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 4 } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ SlashMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.45,
			Image = "CarvingMantisCombo3.gif",
			Name = "Biting Mandibles" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ SlashMultiplier = 1.25, Dmg = { 100 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 2.35,
			Image = "CarvingMantisCombo1.gif",
			Name = "Ambush Predator" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Duration = 1.2,
			Image = "CarvingMantisCombo2.gif",
			Name = "Dire Courtship" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { { "Bleeding", "Knockdown" } } } 
			},
			Duration = 3.9,
			Image = "CarvingMantisCombo0.gif",
			Name = "Rapid Incisions" 
		},
		WeaponType = "Dual Swords" 
	},
	["Celestial Nightfall"] = {
		StanceName = "Celestial Nightfall",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "CelestialNightfallComboOne.gif",
			Name = "Expanding Spiral" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CelestialNightfallComboTwo.gif",
			Name = "Whirling Touch" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 100 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "CelestialNightfallComboThree.gif",
			Name = "Radial Wounding" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "CelestialNightfallComboOne.gif",
			Name = "Expanding Spiral" 
		},
		WeaponType = "Glaive" 
	},
	["Clashing Forest"] = {
		StanceName = "Clashing Forest",
		Block = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 50 },
					Hits = { 1, 1, 2, 1 },
					Procs = { "", "Lifted", "", "" } 
				},
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 400 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Duration = 1.95,
			Image = "ClashingForestCombo0.gif",
			Name = "Resolute Flurry" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } } 
			},
			Duration = 2.05,
			Image = "ClashingForestCombo1.gif",
			Name = "Skyward Limb" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 }, Types = {""} },
				{ Dmg = { 300 }, Hits = { 2 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.1,
			Image = "ClashingForestCombo2.gif",
			Name = "Battering Roots" 
		},
		Neutral = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 50 },
					Hits = { 1, 1, 2, 1 },
					Procs = { "", "Lifted", "", "" } 
				},
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 400 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Duration = 1.95,
			Image = "ClashingForestCombo0.gif",
			Name = "Resolute Flurry" 
		},
		WeaponType = "Staff" 
	},
	Claws = {
		StanceName = "Claws",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.1, Dmg = { 100 }, Hits = { 1 } } -- Not 100% sure on ImpactMultiplier, only tested on Ripkas
			},
			Image = "ClawsComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.1, Dmg = { 100 }, Hits = { 1 } } -- Not 100% sure on ImpactMultiplier, only tested on Ripkas
			},
			Image = "ClawsComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.1, Dmg = { 100 }, Hits = { 1 } } -- Not 100% sure on ImpactMultiplier, only tested on Ripkas
			},
			Image = "ClawsComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.1, Dmg = { 100 }, Hits = { 1 } } -- Not 100% sure on ImpactMultiplier, only tested on Ripkas
			},
			Image = "ClawsComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "ClawsComboAir.gif",
			Name = "One Point" 
		},
		Finisher = { Attacks = { { ImpactMultiplier = 1.25, Dmg = { 500 }, Hits = { 6 } } }, Image = "ClawsComboFinisherGround.gif", Name = "Roaring Drums" },
		Heavy = {
			Attacks = {
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { { "Knockback", "Bleeding" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { { "Knockdown", "Bleeding" } },
					Shape = "Heavy" 
				} 
			},
			Image = "ClawsComboHeavy.gif",
			Name = "Three Lessons" 
		},
		Slide = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" }, Types = { "360" } } },
			Duration = 0.67,
			Image = "ClawsComboSlide.gif",
			Name = "Launching Spring" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "ClawsComboWall.gif",
			Name = "Through Strike" 
		},
		WeaponType = "Claws"
	},
	["Cleaving Whirlwind"] = {
		StanceName = "Cleaving Whirlwind",
		Block = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, Dmg = { 400, 100 }, Hits = { 1, 1 }, Types = { "", "Slam" } },
				{ SlashMultiplier = 1.25, Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.9,
			Image = "CleavingWhirlwindCombo3.gif",
			Name = "Drifting Stampede" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "360" } },
				{ Dmg = { 200 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "360", "360" } },
				{ Dmg = { 0 }, Hits = { 1 } } 
			},
			Duration = 5.7,
			Image = "CleavingWhirlwindCombo1.gif",
			Name = "Broken Bull" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = {1.25, 1}, Dmg = { 500, 1 }, Hits = { 1, 1 }, Procs = { "Knockback", "" }, Types = { "", "Slam" } },
				{
					SlashMultiplier = {1.25, 1.25, 1, 1.25, 1, 1.25, 1}, 
					Dmg = { 300, 100, 100, 200, 100, 400, 100 },
					Hits = { 1, 1, 1, 1, 1, 1, 1 },
					Procs = { "", "", "", "", "", "Lifted", "Knockback" },
					Types = { "", "", "Slam", "", "Slam", "", "Slam" } 
				} 
			},
			Duration = 2.7,
			Image = "CleavingWhirlwindCombo2.gif",
			Name = "Sundered Tusk" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "" }, Types = { "", "Slam" } } 
			},
			Duration = 2.25,
			Image = "CleavingWhirlwindCombo0.gif",
			Name = "Crowd Fall" 
		},
		WeaponType = "Heavy Blade" 
	},
	["Coiling Viper"] = {
		StanceName = "Coiling Viper",
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 100, 400 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } } 
			},
			Duration = 2.7,
			Image = "CoilingViperCombo1.gif",
			Name = "Whistling Wind" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 100, 400 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } }
			},
			Duration = 2.7,
			Image = "CoilingViperCombo1.gif",
			Name = "Whistling Wind" 
		},
		["Forward Block"] = {
			Attacks = {
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 2.3,
			Image = "CoilingViperCombo2.gif",
			Name = "Tumbling King" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 100, 400 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } }
			},
			Duration = 2.7,
			Image = "CoilingViperCombo1.gif",
			Name = "Whistling Wind" 
		},
		WeaponType = "Whip" 
	},
	["Crashing Havoc"] = {
		StanceName = "Crashing Havoc",
		ConclaveOnly = true,
		Block = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "CrashingHavocComboOne.gif",
			Name = "Fist And Hammer" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CrashingHavocComboTwo.gif",
			Name = "Rising Thunder" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "CrashingHavocComboThree.gif",
			Name = "Falling Rock" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "CrashingHavocComboOne.gif",
			Name = "Fist And Hammer" 
		},
		WeaponType = "Hammer" 
	},
	["Crashing Timber"] = {
		StanceName = "Crashing Timber",
		ConclaveOnly = true,
		Block = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "CrashingTimberComboOne.gif",
			Name = "Falling Leaves" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CrashingTimberComboTwo.gif",
			Name = "Sweeping Limb" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Knockdown" } },
				{
					Dmg = { 100, 100 },
					Hits = { 1, 1 },
					Procs = { "", "Knockdown" },
					Types = { "Slam", "Slam" } 
				} 
			},
			Image = "CrashingTimberComboThree.gif",
			Name = "Bending Branch" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "CrashingTimberComboOne.gif",
			Name = "Falling Leaves" 
		},
		WeaponType = "Staff" 
	},
	["Crimson Dervish"] = {
		StanceName = "Crimson Dervish",
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{
					SlashMultiplier = 2,
					Dmg = { 200, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Knockback", "Knockdown" },
					Types = { "360", "Sweep", "Sweep" } 
				} 
			},
			Duration = 2,
			Image = "CrimsonDervishCombo0.gif",
			Name = "Twisting Flurry" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } } 
			},
			Duration = 2,
			Image = "CrimsonDervishCombo1.gif",
			Name = "Crimson Orbit" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 200, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", { "Knockback", "Bleeding" }, "Knockdown" },
					Types = { "360", "360", "Thrust" } 
				} 
			},
			Duration = 1.5,
			Image = "CrimsonDervishCombo2.gif",
			Name = "Coiling Impale" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{
					SlashMultiplier = 2,
					Dmg = { 200, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Knockback", "Knockdown" },
					Types = { "360", "Sweep", "Sweep" } 
				} 
			},
			Duration = 2,
			Image = "CrimsonDervishCombo0.gif",
			Name = "Twisting Flurry" 
		},
		WeaponType = "Sword" 
	},
	["Crossing Snakes"] = {
		StanceName = "Crossing Snakes",
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Lifted" } },
				{ Dmg = { 100, 200 }, Hits = { 2, 2 }, Procs = { "Bleeding", "Knockdown" } } 
			},
			Duration = 2.4,
			Image = "CrossingSnakesCombo3.gif",
			Name = "Twin Fang" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.85,
			Image = "CrossingSnakesCombo1.gif",
			Name = "Lacerating Leap" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 200, 200 }, Hits = { 2, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Duration = 2.2,
			Image = "CrossingSnakesCombo2.gif",
			Name = "Northern Coil" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Duration = 1.35,
			Image = "CrossingSnakesCombo0.gif",
			Name = "East to West" 
		},
		WeaponType = "Dual Swords" 
	},
	["Crushing Ruin"] = {
		StanceName = "Crushing Ruin",
		Block = {
			Attacks = {
				{
					Dmg = { 300, 200, 400, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", "", "Knockdown" },
					Types = { "Sweep", "Sweep", "", "Slam" } 
				} 
			},
			Duration = 2.25,
			Image = "CrushingRuinCombo3.gif",
			Name = "Winding Temper" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 2.6,
			Image = "CrushingRuinCombo1.gif",
			Name = "Tidal Force" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300, 50 }, Hits = { 1, 2 }, Types = { "Sweep", "360" } },
				{ Dmg = { 300, 50 }, Hits = { 1, 2 }, Types = { "Sweep", "360" } },
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } },
				{ Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" }, Types = { "", "Slam" } } 
			},
			Duration = 4.25,
			Image = "CrushingRuinCombo2.gif",
			Name = "Shattered Village" 
		},
		Neutral = {
			Attacks = {
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Types = { "360", "360" } },
				{ ImpactMultiplier = {1.5, 1}, Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "" }, Types = { "", "Slam" } } 
			},
			Duration = 3,
			Image = "CrushingRuinCombo0.gif",
			Name = "Raging Whirlwind" 
		},
		WeaponType = "Hammer" 
	},
	["Cunning Aspect"] = {
		StanceName = "Cunning Aspect",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "Impair", "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CunningAspectComboOne.gif",
			Name = "Shrouded Point" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CunningAspectComboTwo.gif",
			Name = "Deceptive Lunge" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 100, 100 }, Hits = { 1, 1, 1 } } 
			},
			Image = "CunningAspectComboThree.gif",
			Name = "Covert Coil" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "Impair", "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "CunningAspectComboOne.gif",
			Name = "Shrouded Point" 
		},
		WeaponType = "Rapier" 
	},
	["Cyclone Kraken"] = {
		StanceName = "Cyclone Kraken",
		Block = {
			Attacks = {
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "Lifted", "" } },
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } },
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.3,
			Image = "CycloneKrakenCombo3.gif",
			Name = "Thunder Hydra" 
		},
		Forward = {
			Attacks = { { SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 100 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 3 }, Types = { "360" } } },
			Duration = 1.95,
			Image = "CycloneKrakenCombo1.gif",
			Name = "Leviathan Rain" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } },
				{
					Dmg = { 100, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Bleeding", "Knockdown" } 
				} 
			},
			Duration = 2.3,
			Image = "CycloneKrakenCombo2.gif",
			Name = "Lightning Siren" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 200, 400 }, Hits = { 1, 1, 1 }, Types = { "360", "Sweep", "Sweep" } },
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "360" } } 
			},
			Duration = 4.1,
			Image = "CycloneKrakenCombo0.gif",
			Name = "Gale Triton" 
		},
		WeaponType = "Machete" 
	},
	Dagger = {
		StanceName = "Dagger",
		StancelessStance = true,
		Neutral = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
			},
			Image = "DaggerComboNeutral.gif",
			Name = ""
		},
		Forward = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
			},
			Image = "DaggerComboNeutral.gif",
			Name = ""
		},
		["Forward Block"] = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
			},
			Image = "DaggerComboNeutral.gif",
			Name = ""
		},
		Neutral = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
			},
			Image = "DaggerComboNeutral.gif",
			Name = ""
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Bleeding" } } 
			},
			Image = "DaggerComboAir.gif",
			Name = "Scorpion Fall" 
		},
		Finisher = {
			Attacks = { { Dmg = { 500 }, Hits = { 2 }, Procs = { "Bleeding" } } },
			Image = "DaggerComboFinisherGround.gif",
			Name = "Relentless Point" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 250, 250 },
					Hits = { 1, 1 },
					Procs = { { "Knockback", "Bleeding" }, "Finisher" },
					Shape = "Heavy" 
				},
				{
					Dmg = { 250, 250 },
					Hits = { 1, 1 },
					Procs = { { "Knockback", "Bleeding" }, "Knockdown" },
					Shape = "Heavy" 
				} 
			},
			Image = "DaggerComboHeavy.gif",
			Name = "Butterfly Slash" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.53,
			Image = "DaggerComboSlide.gif",
			Name = "Splitting Brush" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } } },
			Image = "DaggerComboWall.gif",
			Name = "Fanning Sting" 
		},
		WeaponType = "Dagger"
	},
	["Decisive Judgement"] = {
		StanceName = "Decisive Judgement",
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.55,
			Image = "DecisiveJudgementCombo3.gif",
			Name = "Silent Acumen" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 0.9,
			Image = "DecisiveJudgementCombo1.gif",
			Name = "Windless Cuts" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 100, 200, 300 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockback", "", "Knockback" } 
				},
				{ SlashMultiplier = 2, Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 1.65,
			Image = "DecisiveJudgementCombo2.gif",
			Name = "Consent Decree" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.65,
			Image = "DecisiveJudgementCombo0.gif",
			Name = "Swift Retribution" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.67,
			Name = "Parting Knee" 
		},
		WeaponType = "Nikana" 
	},
	["Defiled Snapdragon"] = {
		StanceName = "Defiled Snapdragon",
		Block = {
			Attacks = { { Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } },
			Duration = 1.35,
			Image = "DefiledSnapdragonCombo3.gif",
			Name = "Fangs of the Lindwurm" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 4 } },
				{ Dmg = { 100 }, Hits = { 5 }, Types = { "360" } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 200, 100 }, Hits = { 2, 2 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 4.1,
			Image = "DefiledSnapdragonCombo1.gif",
			Name = "Soul of the Leviathan" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 3, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 200 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Knockdown" } },
					Types = { "360", "Sweep", "Sweep" } 
				} 
			},
			Duration = 4.35,
			Image = "DefiledSnapdragonCombo2.gif",
			Name = "Heart of the Naga" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 200, 100, 100, 200 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", { "Bleeding", "Ragdoll" }, "" } 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.25,
			Image = "DefiledSnapdragonCombo0.gif",
			Name = "Claws of the Drake" 
		},
		WeaponType = "Blade and Whip" 
	},
	["Dividing Blades"] = {
		StanceName = "Dividing Blades",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100, 100, 100, 100 }, Hits = { 1, 1, 1, 1 } } 
			},
			Image = "DividingBladesComboOne.gif",
			Name = "Converging Edge" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "DividingBladesComboTwo.gif",
			Name = "Cross Cuts" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 100 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "DividingBladesComboThree.gif",
			Name = "Combined Strike" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100, 100, 100, 100 }, Hits = { 1, 1, 1, 1 } } 
			},
			Image = "DividingBladesComboOne.gif",
			Name = "Converging Edge" 
		},
		WeaponType = "Dual Swords" 
	},
	["Dual Daggers"] = {
		StanceName = "Dual Daggers",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "DualDaggersComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "DualDaggersComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "DualDaggersComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "DualDaggersComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Image = "DualDaggersComboAir.gif",
			Name = "Lion's Roar" 
		},
		Finisher = {
			Attacks = { { Dmg = { 800 }, Hits = { 2 }, Procs = { "Bleeding" } } },
			Image = "DualDaggersComboFinisherGround.gif",
			Name = "Final Strike" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" },
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" } 
			},
			Image = "DualDaggersComboHeavy.gif",
			Name = "Savage Tiger" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.67,
			Image = "DualDaggersComboSlide.gif",
			Name = "Lurking Cougar" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "DualDaggersComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Dual Daggers"
	},
	["Dual Swords"] = {
		StanceName = "Dual Swords",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Image = "DualSwordsComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ PunctureMultiplier = 1.5, Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "DualSwordsComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Image = "DualSwordsComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } } 
			},
			Image = "DualSwordsComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Image = "DualSwordsComboAir.gif",
			Name = "Red Soil" 
		},
		Finisher = {
			Attacks = { { Dmg = { 800 }, Hits = { 2 }, Procs = { "Bleeding" } } },
			Image = "DualSwordsComboFinisherGround.gif",
			Name = "Mirrored Spike" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "DualSwordsComboHeavy.gif",
			Name = "Northern Coil" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Image = "DualSwordsComboSlide.gif",
			Name = "Trimming Flowers" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "DualSwordsComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Dual Swords"
	},
	["Eleventh Storm"] = {
		StanceName = "Eleventh Storm",
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 5 } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" }, Types = {""} } 
			},
			Duration = 2,
			Image = "EleventhStormCombo3.gif",
			Name = "Diamond Deus" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.15,
			Image = "EleventhStormCombo1.gif",
			Name = "Devouring Beast" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 2 } },
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "", "Slam" } } 
			},
			Duration = 1.8,
			Image = "EleventhStormCombo2.gif",
			Name = "Bide and Bleed" 
		},
		Neutral = {
			Attacks = {
				{ ImpactMultiplier = 2, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "Lifted", "Bleeding" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.5,
			Image = "EleventhStormCombo0.gif",
			Name = "Striking Thunder" 
		},
		WeaponType = "Sword and Shield" 
	},
	["Exalted Blade"] = {
		StanceName = "Exalted Blade",
		Aerial = {
			Attacks = {
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown","" }, Types = {"","Ranged"} } 
			},
			Image = "SwordComboAir.gif",
			Name = "Weightless Steel" 
		},
		Block = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "","Ragdoll" }, Types = {"","Ranged"} },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "","Ragdoll" }, Types = {"","Ranged"} } 
			},
			Duration = 2.8,
			Image = "ExaltedBladeCombo3.gif",
			Name = "Equal Laceration" 
		},
		Finisher = {
			Attacks = { { Dmg = { 250 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "SwordComboFinisherGround.gif",
			Name = "Death's Mark" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} } 
			},
			Duration = 1.4,
			Image = "ExaltedBladeCombo1.gif",
			Name = "Lancing Justice" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = { "","Stagger" }, Types = {"","Ranged"} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "","Stagger" }, Types = {"","Ranged"} },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Procs = { "","Stagger" }, Types = {"","Ranged"} },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "","Stagger" }, Types = {"","Ranged"} } 
			},
			Duration = 2.4,
			Image = "ExaltedBladeCombo2.gif",
			Name = "Virtuous Slash" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 200, 100 }, Hits = { 1, 1 }, Types = {"","Ranged"} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "","Knockdown" }, Types = {"","Ranged"} },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "","Knockdown" }, Types = {"","Ranged"} } 
			},
			Duration = 3.2,
			Image = "ExaltedBladeCombo0.gif",
			Name = "Cutting Poise" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.95,
			Image=  "ExaltedBladeComboSlide.gif",
			Name = "Judged Severance" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image=  "SwordComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Sword" 
	},
	["Fateful Truth"] = {
		StanceName = "Fateful Truth",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 100 },
					Hits = { 1, 1, 1, 2 },
					Procs = { "Impair", "Impair", "Impair", "Impair" } 
				},
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FatefulTruthComboOne.gif",
			Name = "Leading Blade" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FatefulTruthComboTwo.gif",
			Name = "Keen Cuts" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 100, 100 },
					Hits = { 1, 1 },
					Procs = { "Knockdown", "" },
					Types = { "Slam", "Sweep" } 
				},
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FatefulTruthComboThree.gif",
			Name = "Sudden Spring" 
		},
		Neutral = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 100 },
					Hits = { 1, 1, 1, 2 },
					Procs = { "Impair", "Impair", "Impair", "Impair" } 
				},
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FatefulTruthComboOne.gif",
			Name = "Leading Blade" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Name = "Parting Knee" 
		},
		WeaponType = "Nikana" 
	},
	["Final Harbinger"] = {
		StanceName = "Final Harbinger",
		Block = {
			Attacks = {
				{
					Dmg = { 200, 100, 100 },
					Hits = { 1, 2, 1 },
					Procs = { "", "", "Knockback" },
					Types = { "Sweep", "Sweep", "360" } 
				},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.8,
			Image = "FinalHarbingerCombo3.gif",
			Name = "Systemic Shred" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100, 200, 100 }, Hits = { 1, 1, 2 }, Types = { "Sweep", "Sweep", "360" } } 
			},
			Duration = 2.65,
			Image = "FinalHarbingerCombo1.gif",
			Name = "Impending Battery" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 300, 100 }, Hits = { 3, 1, 1 }, Procs = { "", "Knockback", "Knockback" }, Types = { "Sweep", "", "Slam" } },
				{ Dmg = { 200 }, Hits = { 4 } },
				{ Dmg = { 100 }, Hits = { 5 }, Procs = { "Knockdown" }, Types = { "360" } } 
			},
			Duration = 4.05,
			Image = "FinalHarbingerCombo2.gif",
			Name = "Dark Light" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", { "Knockback", "Bleeding" } } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 } },
				{ Dmg = { 300, 100, 100 }, Hits = { 1, 2, 1 }, Procs = { "Lifted", "", "Bleeding" } },
				{ Dmg = { 400 }, Hits = { 3 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.05,
			Image = "FinalHarbingerCombo0.gif",
			Name = "Null Warning" 
		},
		WeaponType = "Sword and Shield" 
	},
	Fist = {
		StanceName = "Fist",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FistComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FistComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FistComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "FistComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "FistComboAir.gif",
			Name = "One Point" 
		},
		Finisher = { Attacks = { { ImpactMultiplier = 1.25, Dmg = { 500 }, Hits = { 6 } } }, Image = "FistComboFinisherGround.gif", Name = "Roaring Drums" },
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "FistComboHeavy.gif",
			Name = "Three Lessons" 
		},
		Slide = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" }, Types = { "360" } } },
			Image = "FistComboSlide.gif",
			Name = "Launching Spring" 
		},
		Wall = { Attacks = { { Dmg = { 300 }, Hits = { 1 } } }, Image = "FistComboWall.gif",Name = "Through Strike" },
		WeaponType = "Fist"
	},
	["Flailing Branch"] = {
		StanceName = "Flailing Branch",
		Block = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.35,
			Image = "FlailingBranchCombo0.gif",
			Name = "Rising Falls" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 } } 
			},
			Duration = 1.85,
			Image = "FlailingBranchCombo1.gif",
			Name = "Battered Thread" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = {""} },
				{
					Dmg = { 300, 300, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Knockdown", "Knockback" },
					Types = { "", "", "Slam" } 
				} 
			},
			Duration = 2.05,
			Image = "FlailingBranchCombo2.gif",
			Name = "Autumn Leaf" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.35,
			Image = "FlailingBranchCombo0.gif",
			Name = "Rising Falls" 
		},
		WeaponType = "Staff" 
	},
	["Four Riders"] = {
		StanceName = "Four Riders",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.1,
			Image = "FourRidersCombo3.gif",
			Name = "Eternal Fall" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.7,
			Image = "FourRidersCombo1.gif",
			Name = "Hungering Encroachment" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 200 }, Hits = { 2, 2 }, Procs = { "", "Knockback" } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{
					Dmg = { 100, 400 },
					Hits = { 1, 1 },
					Procs = { "Lifted", "Knockdown" },
					Types = { "Sweep", "Slam" } 
				} 
			},
			Duration = 3,
			Image = "FourRidersCombo2.gif",
			Name = "Raging Conflict" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.3,
			Image = "FourRidersCombo0.gif",
			Name = "Aggravated Swarm" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 2 }, Types = { "360" } } },
			Duration = 0.69,
			Image = "ClawsFourRidersComboSlide.gif",
			Name = "Feuding Blood" 
		},
		WeaponType = "Claws" 
	},
	["Fracturing Wind"] = {
		StanceName = "Fracturing Wind",
		Block = {
			Attacks = {
				{ Dmg = { 300, 500, 100, 100 }, Hits = { 1, 1, 1, 1 }, Procs = { "Knockback", "", "Knockback", "" }, Types = { "Sweep", "", "Slam", "Slam" } } 
			},
			Duration = 1.45,
			Image = "FracturingWindCombo3.gif",
			Name = "Rising Wind" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.8,
			Image = "FracturingWindCombo1.gif",
			Name = "Gaining Humility" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 100, 300 }, Hits = { 1, 3, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.9,
			Image = "FracturingWindCombo2.gif",
			Name = "Trailing Doom" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 300 }, Hits = { 1, 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } } 
			},
			Duration = 1.55,
			Image = "FracturingWindCombo0.gif",
			Name = "Rolling Gale" 
		},
		WeaponType = "Fist" 
	},
	["Gaia's Tragedy"] = {
		StanceName = "Gaia's Tragedy",
		Block = {
			Attacks = {
				{ Dmg = { 200, 100, 100 }, Hits = { 1, 3, 1 }, Procs = { "", "", "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "", "Slam" } } 
			},
			Duration = 3.8,
			Image = "GaiasTragedyCombo3.gif",
			Name = "Forest's Remorse" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Duration = 1.65,
			Image = "GaiasTragedyCombo1.gif",
			Name = "Ocean's Contempt" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 2, 1 }, Procs = { "Knockback" }, Types = { "", "Slam" } },
				{ Dmg = { 250, 100 }, Hits = { 2, 1 }, Types = { "", "Slam" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 2.3,
			Image = "GaiasTragedyCombo2.gif",
			Name = "Mountain's Rage" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 800 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.65,
			Image = "GaiasTragedyCombo0.gif",
			Name = "River's Grief" 
		},
		WeaponType = "Fist" 
	},
	["Gemini Cross"] = {
		StanceName = "Gemini Cross",
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 2 }, Procs = { "", "Knockback" } },
				{
					Dmg = { 200, 100, 300, 100 },
					Hits = { 2, 2, 2, 1 },
					Procs = { "", "Bleeding", "Knockdown", "Knockback" },
					Types = { "Sweep", "Sweep", "","Slam" } 
				} 
			},
			Duration = 2.85,
			Image = "GeminiCrossCombo3.gif",
			Name = "Blind Tormentor" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.2,
			Image = "GeminiCrossCombo1.gif",
			Name = "Cold Vendetta" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 300, 100, 200, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", "", "Knockback" } 
				},
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 2.3,
			Image = "GeminiCrossCombo2.gif",
			Name = "Baleful Sin" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 2, 2 } },
				{ Dmg = { 100, 100 }, Hits = { 4, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 100 }, Hits = { 5 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{
					Dmg = { 300, 200 },
					Hits = { 1, 1 },
					Procs = { "Knockback", { "Bleeding", "Knockdown" } } 
				} 
			},
			Duration = 4.6,
			Image = "GeminiCrossCombo0.gif",
			Name = "Vagrant Blight" 
		},
		WeaponType = "Tonfa" 
	},
	Glaive = {
		StanceName = "Glaive",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
			},
			Image = "GleamingTalonCombo3.gif",
			Name = "Ruin",
		},
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
			},
			Image = "GleamingTalonCombo3.gif",
			Name = "Ruin",
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
			},
			Image = "GleamingTalonCombo3.gif",
			Name = "Ruin",
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
			},
			Image = "GleamingTalonCombo3.gif",
			Name = "Ruin",
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 2 }, Types = { "360" } } 
			},
			Image = "GlaiveComboAir.gif",
			Name = "Auger" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "GlaiveComboFinisherGround.gif",
			Name = "Nemesis" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Shape = "Heavy", Types = { "Ranged" } },
				{ Dmg = { 500 }, Hits = { 1 }, Shape = "Heavy", Types = { "Ranged" } },
				{ Dmg = { 500 }, Hits = { 1 }, Shape = "Heavy", Types = { "Ranged" } } 
			},
			Image = "GlaiveComboHeavy.gif",
			Name = "Falling Star" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.74,
			Image = "GlaiveComboSlide.gif",
			Name = "Pirouette" 
		},
		Wall = { Attacks = { { Dmg = { 300 }, Hits = { 1 } } }, Image = "GlaiveComboWall.gif", Name = "Through Strike" },
		WeaponType = "Glaive"
	},
	["Gleaming Talon"] = {
		StanceName = "Gleaming Talon",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 } },
			},
			Image = "GleamingTalonCombo3.gif",
			Name = "Ruin",
		},
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier=  1.25, ImpactMultiplier = 1.25, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 3 }, Types = { "360" } } 
			},
			Duration = 2,
			Image = "GleamingTalonCombo1.gif",
			Name = "Ruin" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 200, 100, 200 },
					Hits = { 1, 2, 1 },
					Procs = { "", "", { "Bleeding", "Knockdown" } } 
				},
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.6,
			Image = "GleamingTalonCombo2.gif",
			Name = "Silver Reach" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, PunctureMultiplier=  1.1, ImpactMultiplier = 1.1, Dmg = { 400 }, Hits = { 1 }, Procs = { "Lifted" } } 
			},
			Duration = 4.3,
			Image = "GleamingTalonCombo0.gif",
			Name = "Mercury Vortex" 
		},
		WeaponType = "Glaive" 
	},
	["Gnashing Payara"] = {
		StanceName = "Gnashing Payara",
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 2 } },
				{
					Dmg = { 200, 400 },
					Hits = { 2, 1 },
					Procs = { { "Bleeding", "Knockdown" }, "Knockdown" } 
				} 
			},
			Duration = 2.5,
			Image = "GnashingPayaraCombo0.gif",
			Name = "Pincer Strike" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "Sweep" } } 
			},
			Duration = 1.15,
			Image = "GnashingPayaraCombo1.gif",
			Name = "Cheetah's Guile" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Types = { "Sweep", "360" } } 
			},
			Duration = 1.55,
			Image = "GnashingPayaraCombo2.gif",
			Name = "Flash Flurry" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 2 } },
				{
					Dmg = { 200, 400 },
					Hits = { 2, 1 },
					Procs = { { "Bleeding", "Knockdown" }, "Knockdown" } 
				} 
			},
			Duration = 2.5,
			Image = "GnashingPayaraCombo0.gif",
			Name = "Pincer Strike" 
		},
		WeaponType = "Dual Daggers" 
	},
	["Grim Fury"] = {
		StanceName = "Grim Fury",
		Block = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } },
				{ Dmg = { 300 }, Hits = { 2 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } }
			},
			Duration = 1.9,
			Image = "GrimFuryCombo0.gif",
			Name = "Fanning Flame" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 1.75,
			Image = "GrimFuryCombo1.gif",
			Name = "Bright Blaze" 
		},
		["Forward Block"] = {
			Attacks = {
				{ ImpactMultiplier = 3, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = {""} },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.4,
			Image = "GrimFuryCombo2.gif",
			Name = "Burning Desire" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 1 }, Procs = { "Knockback", "" } },
				{ Dmg = { 300 }, Hits = { 2 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.9,
			Image = "GrimFuryCombo0.gif",
			Name = "Fanning Flame" 
		},
		WeaponType = "Sparring" 
	},
	Gunblade = {
		StanceName = "Gunblade",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Ranged" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "Ranged" } } 
			},
			Duration = 2.5,
			Image = "HighNoonCombo1.gif",
			Name = "Vagabond Blitz" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Ranged" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "Ranged" } } 
			},
			Duration = 2.5,
			Image = "HighNoonCombo1.gif",
			Name = "Vagabond Blitz" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Ranged" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "Ranged" } } 
			},
			Duration = 2.5,
			Image = "HighNoonCombo1.gif",
			Name = "Vagabond Blitz" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Ranged" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "Ranged" } } 
			},
			Duration = 2.5,
			Image = "HighNoonCombo1.gif",
			Name = "Vagabond Blitz" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "GunbladeComboAir.gif",
			Name = "Outlaw Rush" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Flashbang" } } },
			Image = "GunbladeComboFinisherGround.gif",
			Name = "Last Words" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Shape = "Heavy", Procs = { "", "Ragdoll" }, Types = { "Ranged", "Slam" } },
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Shape = "Heavy", Procs = { "", "Ragdoll" }, Types = { "Ranged", "Slam" } } 
			},
			Image = "GunbladeComboHeavy.gif",
			Name = "Full Bore" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.6,
			Image = "GunbladeComboSlide.gif",
			Name = "Fast Draw" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "GunbladeComboWall.gif",
			Name = "Vendetta" 
		},
		WeaponType = "Gunblade"
	},
	Hammer = {
		StanceName = "Hammer",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "Sweep", "Slam" } },
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
			},
			Image = "HammerComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "Sweep", "Slam" } },
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
			},
			Image = "HammerComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "Sweep", "Slam" } },
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
			},
			Image = "HammerComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "Sweep", "Slam" } },
				{ ImpactMultiplier = 1.5, Dmg = { 400 }, Hits = { 1 }, Types = { "Slam" } },
			},
			Image = "HammerComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Image = "HammerComboAir.gif",
			Name = "Mountain's Chisel" 
		},
		Finisher = { Attacks = { { Dmg = { 1200 }, Hits = { 1 } } }, Image = "HammerComboFinisherGround.gif", Name = "Tunneling Spike" },
		Heavy = {
			Attacks = {
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Lifted" }, Shape = "Heavy" },
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "HammerComboHeavy.gif",
			Name = "Crowd Fall" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.97,
			Image = "HammerComboSlide.gif",
			Name = "Hell's Wave" 
		},
		Wall = { Attacks = { { Dmg = { 200 }, Hits = { 1 } } }, Image = "HammerComboWall.gif", Name = "Cyclical Dwelling" },
		WeaponType = "Hammer"
	},
	["Heavy Blade"] = {
		StanceName = "Heavy Blade",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "Slam" } } 
			},
			Duration = 2.25,
			Image = "CleavingWhirlwindCombo0.gif",
			Name = "Crowd Fall" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "Slam" } } 
			},
			Duration = 2.25,
			Image = "CleavingWhirlwindCombo0.gif",
			Name = "Crowd Fall" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "Slam" } } 
			},
			Duration = 2.25,
			Image = "CleavingWhirlwindCombo0.gif",
			Name = "Crowd Fall" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "Slam" } } 
			},
			Duration = 2.25,
			Image = "CleavingWhirlwindCombo0.gif",
			Name = "Crowd Fall" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Image = "HeavyBladeComboAir.gif",
			Name = "Mountain's Chisel" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1200 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "HeavyBladeComboFinisherGround.gif",
			Name = "Tunneling Spike" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Lifted" }, Shape = "Heavy" },
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "HeavyBladeComboHeavy.gif",
			Name = "Crowd Fall" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.98,
			Image = "HeavyBladeComboSlide.gif",
			Name = "Hell's Wave" 
		},
		Wall = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } },
			Image = "HeavyBladeComboWall.gif",
			Name = "Flaying Home" 
		},
		WeaponType = "Heavy Blade"
	},
	["High Noon"] = {
		StanceName = "High Noon",
		Block = {
			Attacks = {
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "Slam" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 400 }, Hits = { 2 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.75,
			Image = "HighNoonCombo3.gif",
			Name = "Tomahawk Double-Tap" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 2 }, Procs = { "", "Ragdoll" }, Types = { "Ranged", "Slam" } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = { "", "Ragdoll" }, Types = { "Ranged", "Slam" } } 
			},
			Duration = 2.5,
			Image = "HighNoonCombo1.gif",
			Name = "Vagabond Blitz" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "", "Ragdoll" }, Types = { "Ranged", "Slam" } },
				{ Dmg = { 100, 100, 100 }, Hits = { 2, 2, 1 }, Procs = { "", {"Bleeding", "Stagger"}, "" },  Types = { "Ranged", "Slam", "Slam" } } 
			},
			Duration = 1.85,
			Image = "HighNoonCombo2.gif",
			Name = "Desperado Zeal" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 2}, Procs = { "", {"Bleeding", "Stagger"} }, Types = { "Ranged", "Slam" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.25,
			Image = "HighNoonCombo0.gif",
			Name = "Final Showdown" 
		},
		WeaponType = "Gunblade" 
	},
	["Homing Fang"] = {
		StanceName = "Homing Fang",
		Block = {
			Attacks = {
				{ Dmg = { 200, 100, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{
					Dmg = { 300, 100, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", { "Knockdown", "Bleeding" } } 
				} 
			},
			Duration = 2.8,
			Image = "HomingFangCombo0.gif",
			Name = "Cutting Arches" 
		},
		Forward = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } } 
			},
			Duration = 1.4,
			Image = "HomingFangCombo1.gif",
			Name = "Life Eater" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ Dmg = { 100, 300 }, Hits = { 3, 1 }, Procs = { "", "Lifted" }, Types = { "360", "Sweep" } } 
			},
			Duration = 1.7,
			Image = "HomingFangCombo2.gif",
			Name = "Lashing Forward" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 100, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{
					Dmg = { 300, 100, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", { "Knockdown", "Bleeding" } } 
				} 
			},
			Duration = 2.8,
			Image = "HomingFangCombo0.gif",
			Name = "Cutting Arches" 
		},
		WeaponType = "Dagger" 
	},
	Hysteria = {
		StanceName = "Hysteria",
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "SparringComboAir.gif",
			Name = "One Point" 
		},
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Finisher" } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{
					Dmg = { 100, 100, 200 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockdown", { "Knockback", "Knockdown" }, "Knockdown" } 
				} 
			},
			Duration = 3.7,
			Image = "HysteriaCombo3.gif",
			Name = "Delirium" 
		},
		Finisher = { Attacks = { { Dmg = { 2000 }, Hits = { 6 } } }, Image = "SparringComboFinisherGround.gif", Name = "Roaring Drums" },
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 2.7,
			Image = "HysteriaCombo1.gif",
			Name = "Rage" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 }, Procs = { "Knockdown", "Knockdown" } } 
			},
			Duration = 5.65,
			Image = "HysteriaCombo2.gif",
			Name = "Madness" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 500, 400 },
					Hits = { 1, 1 },
					Procs = { "", "Lifted" },
					Shape = "Heavy",
					Types = { "", "Slam" } 
				},
				{ Dmg = { 100, 100 }, Hits = { 4, 1 }, Procs = { "", "Lifted" }, Shape = "Heavy" } 
			},
			Image = "SparringComboHeavy.gif",
			Name = "Rise From Ashes" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Finisher" } } 
			},
			Duration = 4.55,
			Image = "HysteriaCombo0.gif",
			Name = "Fervor" 
		},
		Slide = {
			Attacks = { { Dmg = { 300 }, Hits = { 6 }, Types = { "360" } } },
			Image = "HysteriaComboSlide.gif",
			Name = "Launching Spring" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "SparringComboWall.gif",
			Name = "Through Strike" 
		},
		WeaponType = "Valkyr Talons" 
	},
	["Iron Phoenix"] = {
		StanceName = "Iron Phoenix",
		Block = {
			Attacks = {
				{ SlashMultiplier = 0.1, ImpactMultiplier = 0.1, Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.35,
			Image = "IronPhoenixCombo0.gif",
			Name = "Wings and Beak" 
		},
		Forward = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 200 }, Hits = { 1 } } },
			Duration = 0.65,
			Image = "IronPhoenixCombo1.gif",
			Name = "Double Slash" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } },
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Note = "*", Procs = { "Lifted", "Knockback" }, Types = { "", "Slam" } } 
			},
			Duration = 1.8,
			Image = "IronPhoenixCombo2.gif",
			Name = "Taking Flight" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 0.1, ImpactMultiplier = 0.1, Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.35,
			Image = "IronPhoenixCombo0.gif",
			Name = "Wings and Beak" 
		},
		WeaponType = "Sword" 
	},
	Keratinos = {
		UniqueToWeapon = true,
		StanceName = "Keratinos",
		Heavy = {
			Attacks = {
				{
					Dmg = { 100, 100, 300 },
					Hits = { 3, 3, 1 },
					Procs = { "", "Bleeding", { "Bleeding", "Lifted" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				} 
			},
			Image = "KeratinosComboHeavy.gif",
			Name = "Keratinos Heavy (unofficial)" 
		},
		WeaponType = "Claws" 
	},
	Korumm = {
		UniqueToWeapon = true,
		StanceName = "Korumm",
		Block = {
			Attacks = {
				{ Dmg = { 200, 300, 400 }, Hits = { 1, 1, 1 }, Procs = { {"Electrocution", "Knockdown"}, {"Bleeding", "Ragdoll"}, "Knockback" }, Types = { "","","Slam" } }
			},
			Duration = 4.15,
			Image = "KorummComboBlock.gif",
			Name = "Korumm Block (unofficial)" 
		},
		WeaponType = "Polearm" 
	},
	["Lashing Coil"] = {
		StanceName = "Lashing Coil",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "LashingCoilComboOne.gif",
			Name = "Whispering Bite" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LashingCoilComboTwo.gif",
			Name = "Screaming Gust" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LashingCoilComboThree.gif",
			Name = "Burning Hum" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "LashingCoilComboOne.gif",
			Name = "Whispering Bite" 
		},
		WeaponType = "Whip" 
	},
	["Last Herald"] = {
		StanceName = "Last Herald",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 }, Procs = { "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LastHeraldComboOne.gif",
			Name = "Driving Steel" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LastHeraldComboTwo.gif",
			Name = "Bulwark" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 }, Procs = { "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LastHeraldComboThree.gif",
			Name = "Spiral Ward" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 }, Procs = { "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "LastHeraldComboOne.gif",
			Name = "Driving Steel" 
		},
		WeaponType = "Sword and Shield" 
	},
	Machete = {
		StanceName = "Machete",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "MacheteComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "MacheteComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "MacheteComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "MacheteComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Image = "MacheteComboAir.gif",
			Name = "Weightless Steel" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "MacheteComboFinisherGround.gif",
			Name = "Crashing Wave" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 150, 150, 150, 150 },
					Hits = { 2, 1, 1, 1 },
					Procs = { "", "Bleeding", "", { "Knockback", "Finisher" } },
					Shape = "Heavy",
					Types = { "360", "360", "360", "360" } 
				},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "MacheteComboHeavy.gif",
			Name = "Rolling Wave" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.66,
			Image = "MacheteComboSlide.gif",
			Name = "Flowing River" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "MacheteComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Machete"
	},
	["Mafic Rain"] = {
		StanceName = "Mafic Rain",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 13 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } } 
			},
			Image = "MaficRainComboOne.gif",
			Name = "Searing Sleet" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "MaficRainComboTwo.gif",
			Name = "Blazing Deluge" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 5 }, Procs = { "Knockdown" }, Types = { "360" } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Types = { "360", "360" } } 
			},
			Image = "MaficRainComboThree.gif",
			Name = "Torrid Torrent" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 13 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } } 
			},
			Image = "MaficRainComboOne.gif",
			Name = "Searing Sleet" 
		},
		WeaponType = "Nunchaku" 
	},
	["Malicious Raptor"] = {
		StanceName = "Malicious Raptor",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.95,
			Image = "MaliciousRaptorCombo3.gif",
			Name = "Venging Thrash" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200, 100, 200 }, Hits = { 1, 2, 1 } } 
			},
			Duration = 1.8,
			Image = "MaliciousRaptorCombo1.gif",
			Name = "Wicked Slash" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 200, 100, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", { "Knockback", "Bleeding" } } 
				},
				{ Dmg = { 300, 100 }, Hits = { 1, 2 }, Procs = { "Lifted", "" } },
				{ Dmg = { 300, 100 }, Hits = { 1,1 }, Procs = { "","Knockdown" }, Types = { "","Slam" } } 
			},
			Duration = 3.7,
			Image = "MaliciousRaptorCombo2.gif",
			Name = "Lethal Clash" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 200, 200 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Bleeding" } },
				{ Dmg = { 100, 300 }, Hits = { 4, 1 }, Procs = { "", { "Knockback", "Bleeding" } } },
				{
					Dmg = { 100, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "Lifted", "", "Knockdown" } 
				} 
			},
			Duration = 3.35,
			Image = "MaliciousRaptorCombo0.gif",
			Name = "Jagged Gash" 
		},
		WeaponType = "Claws" 
	},
	Nepheri = {
		UniqueToWeapon = true,
		StanceName = "Nepheri",
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200, 50 }, Hits = { 2, 4 }, Procs = { { "Impact", "Bleeding" }, { "Impact", "" } }, Types = { "Sweep", "Ranged" } }
			},
			Duration = 2.87,
			Image = "NepheriComboNeutral.gif",
			Name = "Nepheri Neutral (unofficial)" 
		},
		WeaponType = "Dual Daggers" 
	},
	Nikana = {
		StanceName = "Nikana",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } }
			},
			Image = "NikanaComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } }
			},
			Image = "NikanaComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } }
			},
			Image = "NikanaComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } }
			},
			Image = "NikanaComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "NikanaComboAir.gif",
			Name = "Setting Sun" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "NikanaComboFinisherGround.gif",
			Name = "Resting Place" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				} 
			},
			Image = "NikanaComboHeavy.gif",
			Name = "Windless Cuts" 
		},
		Wall = { Attacks = { { Dmg = { 215 }, Hits = { 1 } } }, Image = "NikanaComboWall.gif", Name = "Guiding Wire" },
		WeaponType = 'Nikana' 
	},
	["Noble Cadence"] = {
		StanceName = "Noble Cadence",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Image = "NobleCadenceComboOne.gif",
			Name = "Rushing Bull" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "NobleCadenceComboTwo.gif",
			Name = "Skull Smasher" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "NobleCadenceComboThree.gif",
			Name = "Plunging Edge" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Image = "NobleCadenceComboOne.gif",
			Name = "Rushing Bull" 
		},
		WeaponType = "Heavy Blade" 
	},
	Nunchaku = {
		StanceName = "Nunchaku",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } } 
			},
			Duration = 3.25,
			Image = "AtlantisVulcanCombo1.gif",
			Name = "Searing Undertow" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } } 
			},
			Duration = 3.25,
			Image = "AtlantisVulcanCombo1.gif",
			Name = "Searing Undertow" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } } 
			},
			Duration = 3.25,
			Image = "AtlantisVulcanCombo1.gif",
			Name = "Searing Undertow" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 5 }, Types = { "360" } } 
			},
			Duration = 3.25,
			Image = "AtlantisVulcanCombo1.gif",
			Name = "Searing Undertow" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Image = "NunchakuComboAir.gif",
			Name = "Fire Storm" 
		},
		Finisher = { Attacks = { { Dmg = { 1000 }, Hits = { 1 } } }, Image = "NunchakuComboFinisherGround.gif", Name = "Burning Tsunami" },
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "NunchakuComboHeavy.gif",
			Name = "Tidal Flames" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 3 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 1.05,
			Image = "NunchakuComboSlide.gif",
			Name = "Tidal Conflagration" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "NunchakuComboWall.gif",
			Name = "Creating Fire" 
		},
		WeaponType = "Nunchaku" 
	},
	["Piercing Fury"] = {
		StanceName = "Piercing Fury",
		ConclaveOnly = true,
		Block = {
			Attacks = { { Dmg = { 100, 100, 200 }, Hits = { 1, 1, 1 } } },
			Image = "PiercingFuryComboOne.gif",
			Name = "Arcing Slice" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "PiercingFuryComboTwo.gif",
			Name = "Swift Incision" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100, 100, 100 }, Hits = { 1, 1, 1 } } 
			},
			Image = "PiercingFuryComboThree.gif",
			Name = "Leading Point" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100, 100, 200 }, Hits = { 1, 1, 1 } } },
			Image = "PiercingFuryComboOne.gif",
			Name = "Arcing Slice" 
		},
		WeaponType = "Dagger" 
	},
	["Pointed Wind"] = {
		StanceName = "Pointed Wind",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "Slash", "" }, Types = { "360", "Sweep" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } } 
			},
			Duration = 1.55,
			Image = "PointedWindCombo0.gif",
			Name = "Parting Edge" 
		},
		Forward = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.25,
			Image = "PointedWindCombo1.gif",
			Name = "Viper's Bite" 
		},
		["Forward Block"] = {
			Attacks = {
				{ PunctureMultiplier = 2, Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 2, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ SlashMultiplier = 1.5, Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.25,
			Image = "PointedWindCombo1.gif",
			Name = "Viper's Bite" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "Slash", "" }, Types = { "360", "Sweep" } },
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } } 
			},
			Duration = 1.55,
			Image = "PointedWindCombo0.gif",
			Name = "Parting Edge" 
		},
		WeaponType = "Dagger" 
	},
	Polearm = {
		StanceName = "Polearm",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } }, 
			},
			Image = "PolearmComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } }, 
			},
			Image = "PolearmComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } }, 
			},
			Image = "PolearmComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } }, 
			},
			Image = "PolearmComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "PolearmComboAir.gif",
			Name = "Planting Widow" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1200 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "PolearmComboFinisherGround.gif",
			Name = "Tunneling Spike" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 600 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "PolearmComboHeavy.gif",
			Name = "The Way" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.78,
			Image = "PolearmComboSlide.gif",
			Name = "Cyclone Strike" 
		},
		Wall = { Attacks = { { Dmg = { 166 }, Hits = { 1 } } }, Image = "PolearmComboWall.gif", Name = "Guiding Plank" },
		WeaponType = "Polearm"
	},
	["Primal Fury"] = {
		StanceName = "Primal Fury",
		Aerial = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 } }, { Dmg = { 200 }, Hits = { 1 } } },
			Image = "PrimalFuryComboAir.gif",
			Name = "Deadly Circle" 
		},
		Block = {
			Attacks = {
				{
					Dmg = { 100, 30, 110, 100 },
					Hits = { 1, 2, 1, 1 },
					Procs = { "", "", "Knockback", "Stagger" },
					Types = { "360", "360", "360", "Slam" } 
				},
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Slam" } },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "Knockback", "" }, Types = { "", "Slam" } },
				{ Dmg = { 100, 100, 100 }, Hits = { 2, 1, 1 }, Procs = { "", "", "Lifted" }, Types = { "Sweep", "", "Slam" } } 
			},
			Duration = 3.95,
			Image = "PrimalFuryCombo3.gif",
			Name = "Rolling Boulder Rush" 
		},
		Finisher = { Attacks = { { Dmg = { 1000 }, Hits = { 1 } } }, Image = "StaffComboFinisherGround.gif", Name = "Wide Dispatch" },
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 50 }, Hits = { 4 }, Types = { "360" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {"", "Ragdoll"}, Types = { "Slam" } } 
			},
			Duration = 2.8,
			Image = "PrimalFuryCombo1.gif",
			Name = "Spinning Crash Technique" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { { "Knockback", "Frailty" } } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.9,
			Image = "PrimalFuryCombo2.gif",
			Name = "Cyclone Lightning Strike" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "StaffComboHeavy.gif",
			Name = "The Way" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 25 }, Hits = { 4 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{
					Dmg = { 50, 100 },
					Hits = { 2, 5 },
					Procs = { "Knockback", "Knockdown" },
					Types = { "360", "360" } 
				} 
			},
			Duration = 3.2,
			Image = "PrimalFuryCombo0.gif",
			Name = "Falling Oak Buster" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Image = "StaffComboSlide.gif",
			Name = "Crushing Reach" 
		},
		Wall = { Attacks = { { Dmg = { 166 }, Hits = { 1 } } }, Image = "StaffComboWall.gif", Name = "Guiding Plank" },
		WeaponType = "Iron Staff" 
	},
	["Quaking Hand"] = {
		StanceName = "Quaking Hand",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "QuakingHandComboOne.gif",
			Name = "Spinning Palms" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "QuakingHandComboTwo.gif",
			Name = "One Two Three" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 200 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "QuakingHandComboThree.gif",
			Name = "Descending Impact" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "QuakingHandComboOne.gif",
			Name = "Spinning Palms" 
		},
		WeaponType = "Fist" 
	},
	Rapier = {
		StanceName = "Rapier",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RapierComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RapierComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RapierComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RapierComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "RapierComboAir.gif",
			Name = "Sky Doom" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "RapierComboFinisherGround.gif",
			Name = "Death's Mark" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 450 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } }, Shape = "Heavy" },
				{ Dmg = { 450 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } }, Shape = "Heavy" } 
			},
			Image = "RapierComboHeavy.gif",
			Name = "Veiled Riposte" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.64,
			Image = "RapierComboSlide.gif",
			Name = "Spiral Cut" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "RapierComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Rapier"
	},
	["Ravenous Wraith"] = {
		StanceName = "Ravenous Wraith",
		Aerial = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } } 
			},
			Name = "Mortal Squall" 
		},
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } } 
			},
			Image = "RavenousWraithCombo3.gif",
			Name = "Reaping Cyclone" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 3 }, Procs = { "Knockback" } } 
			},
			Image = "RavenousWraithCombo1.gif",
			Name = "Soul Thresher" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "" } } 
			},
			Image = "RavenousWraithCombo2.gif",
			Name = "Void Torrent" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 400 },
					Hits = { 2 },
					Procs = { { "Knockback", "Bleeding" } },
					Shape = "Heavy" 
				},
				{ Dmg = { 400 }, Hits = { 2 }, Procs = { "Bleeding" }, Shape = "Heavy" } 
			},
			Name = "Death Knocking" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "" } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Bleeding" } },
				{
					Dmg = { 100, 200, 300 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockback", "Bleeding", "Knockdown" } 
				} 
			},
			Image = "RavenousWraithCombo0.gif",
			Name = "Cleaving Claws" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Procs = { "" }, Types = { "360" } } },
			Name = "Nightfall" 
		},
		WeaponType = "Shadow Claws" 
	},
	["Reaping Spiral"] = {
		StanceName = "Reaping Spiral",
		Block = {
			Attacks = {
				{ Dmg = { 400, 200 }, Hits = { 1, 1 }, Procs = { "Lifted", "" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ PunctureMultiplier = 1.25, Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.9,
			Image = "ReapingSpiralCombo0.gif",
			Name = "Eternal Nocturne" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.85,
			Image = "ReapingSpiralCombo1.gif",
			Name = "Reclamation" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = {""} },
				{ Dmg = { 200, 200 }, Hits = { 2, 1 }, Procs = { "", "Bleeding" } } 
			},
			Duration = 2.1,
			Image = "ReapingSpiralCombo2.gif",
			Name = "Abyssal Automaton" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 400, 200 }, Hits = { 1, 1 }, Procs = { "Lifted", "" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ PunctureMultiplier = 1.25, Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.9,
			Image = "ReapingSpiralCombo0.gif",
			Name = "Eternal Nocturne" 
		},
		WeaponType = "Scythe" 
	},
	["Rending Crane"] = {
		StanceName = "Rending Crane",
		Block = {
			Attacks = { { Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } },
			Duration = 1.05,
			Image = "RendingCraneCombo3.gif",
			Name = "Landing Dragon" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100, 200 }, Hits = { 2, 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 2.35,
			Image = "RendingCraneCombo1.gif",
			Name = "Lashing Tempest" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 300, 100 }, Hits = { 1, 1, 1 }, Procs = { "", "Knockback", "" } },
				{ Dmg = { 200, 400, 100 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" }, Types = { "Sweep", "", "Slam" } } 
			},
			Duration = 2.3,
			Image = "RendingCraneCombo2.gif",
			Name = "Rampaging Boar" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Types = { "", "Slam" } },
				{ Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown" }, Types = { "", "Slam" } } 
			},
			Duration = 1.85,
			Image = "RendingCraneCombo0.gif",
			Name = "Skull Splitter" 
		},
		WeaponType = "Heavy Blade" 
	},
	["Rending Wind"] = {
		StanceName = "Rending Wind",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RendingWindComboOne.gif",
			Name = "Brisk Current" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RendingWindComboTwo.gif",
			Name = "Ascending Surf" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Types = { "Sweep", "360" } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Slam" } } 
			},
			Image = "RendingWindComboThree.gif",
			Name = "Impending Tide" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RendingWindComboOne.gif",
			Name = "Brisk Current" 
		},
		WeaponType = "Machete" 
	},
	["Rising Steel"] = {
		StanceName = "Rising Steel",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RisingSteelComboOne.gif",
			Name = "Forward Edge" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RisingSteelComboTwo.gif",
			Name = "Hack And Slash" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "Slam" } } 
			},
			Image = "RisingSteelComboThree.gif",
			Name = "Blade Whip" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "RisingSteelComboOne.gif",
			Name = "Forward Edge" 
		},
		WeaponType = "Sword" 
	},
	["Scarlet Hurricane"] = {
		StanceName = "Scarlet Hurricane",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } } 
			},
			Image = "ScarletHurricaneComboOne.gif",
			Name = "Bloody Fall" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ScarletHurricaneComboTwo.gif",
			Name = "Ruby Current" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 100, 100 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 2 } } },
			Image = "ScarletHurricaneComboThree.gif",
			Name = "Whirling Rush" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Procs = { "Impair" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 } } 
			},
			Image = "ScarletHurricaneComboOne.gif",
			Name = "Bloody Fall" 
		},
		Slide = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" }, Types = { "360" } } },
			Name = "Launching Spring" 
		},
		WeaponType = "Claws" 
	},
	Scythe = {
		StanceName = "Scythe",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.85,
			Image = "ReapingSpiralCombo1.gif",
			Name = "Reclamation" 
		},
		Forward = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.85,
			Image = "ReapingSpiralCombo1.gif",
			Name = "Reclamation" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.85,
			Image = "ReapingSpiralCombo1.gif",
			Name = "Reclamation" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.85,
			Image = "ReapingSpiralCombo1.gif",
			Name = "Reclamation" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Image = "ScytheComboAir.gif",
			Name = "Mountain's Chisel" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1200 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "ScytheComboFinisherGround.gif",
			Name = "Tunneling Spike" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 600 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 600 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				} 
			},
			Image = "ScytheComboHeavy.gif",
			Name = "Fading Hope" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Image = "ScytheComboSlide.gif",
			Name = "Hell's Wave" 
		},
		Wall = { Attacks = { { Dmg = { 200 }, Hits = { 1 } } }, Image = "ScytheComboWall.gif", Name = "Flaying Home" },
		WeaponType = "Scythe"
	},
	["Seismic Palm"] = {
		StanceName = "Seismic Palm",
		Block = {
			Attacks = {
				{ Dmg = { 100, 200, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "Lifted", "" } },
				{ Dmg = { 300, 100 }, Hits = { 2, 1 }, Procs = {"", "Knockback"}, Types = { "", "Slam" } } 
			},
			Duration = 2.05,
			Image = "SeismicPalmCombo3.gif",
			Name = "Echoing Hands" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 1.35,
			Image = "SeismicPalmCombo1.gif",
			Name = "Erupting Vulcan" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200, 100 }, Hits = { 2, 1 }, Types = {"", "Slam"} } 
			},
			Duration = 1.7,
			Image = "SeismicPalmCombo2.gif",
			Name = "Sudden Rockfall" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300, 100 }, Hits = { 2, 1 }, Procs = { "Knockdown" }, Types = {"", "Slam"} } 
			},
			Duration = 1.55,
			Image = "SeismicPalmCombo0.gif",
			Name = "Quaking Touch" 
		},
		WeaponType = "Fist" 
	},
	["Serene Storm"] = {
		StanceName = "Serene Storm",
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "SparringComboAir.gif",
			Name = "One Point" 
		},
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 3, 1 }, Procs = { { "Ragdoll", "Disarmed" }, "Stagger" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { { "Ragdoll", "Disarmed" }, "Ragdoll" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 4, 1 }, Procs = { { "Ragdoll", "Disarmed" }, "Ragdoll" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { { "Ragdoll", "Disarmed"}, {"Ragdoll", "Knockback"} }, Types = { "", "Ranged" } } 
			},
			Duration = 4.1,
			Image = "SereneStormCombo3.gif",
			Name = "Patience Shattered" 
		},
		Finisher = { Attacks = { { Dmg = { 500 }, Hits = { 6 } } }, Image = "SparringComboFinisherGround.gif", Name = "Roaring Drums" },
		Forward = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Stagger"}, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Ragdoll"}, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Ragdoll"}, Types = { "", "Ranged" } } 
			},
			Duration = 2.5,
			Image = "SereneStormCombo1.gif",
			Name = "Father's Lesson" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Lifted"}, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Lifted"}, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = {{"Disarmed", "Ragdoll" }, "Lifted"}, Types = { "", "Ranged" } } 
			},
			Duration = 3.15,
			Image = "SereneStormCombo2.gif",
			Name = "Final Sunrise" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 500, 400 },
					Hits = { 1, 1 },
					Procs = { "Knockdown", "Disarmed" },
					Note = "*",
					Shape = "Heavy",
					Types = { "Slam" } 
				},
				{ Dmg = { 100, 100 }, Hits = { 4, 1 }, Procs = { "Lifted" }, Shape = "Heavy" } 
			},
			Image = "SparringComboHeavy.gif",
			Name = "Rise From Ashes" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { {"Disarmed", "Ragdoll" }, "Stagger" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = { {"Disarmed", "Ragdoll" }, "Stagger" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = { {"Disarmed", "Ragdoll" }, "Ragdoll" }, Types = { "", "Ranged" } },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { {"Disarmed", "Ragdoll" }, "Ragdoll" }, Types = { "", "Ranged" } } 
			},
			Duration = 3.5,
			Image = "SereneStormCombo0.gif",
			Name = "Trespass Denied" 
		},
		Slide = {
			Attacks = {
				{ Dmg = { 300, 300, 300 }, Hits = { 5, 1, 1 }, Procs = { { "Ragdoll", "Disarmed" }, { "Lifted", "Disarmed" }, { "Lifted", "Disarmed" } }, Types = { "360", "", "Ranged" } } 
			},
			Image = "SereneStormComboSlide.gif",
			Name = "Rolling Blast" 
		},
		Wall = { Attacks = { { Dmg = { 300 }, Hits = { 1 } } }, Image = "SparringComboWall.gif", Name = "Through Strike" },
		WeaponType = "Desert Wind" 
	},
	["Shadow Harvest"] = {
		StanceName = "Shadow Harvest",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ShadowHarvestComboOne.gif",
			Name = "Reaping Leap" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ShadowHarvestComboTwo.gif",
			Name = "Reclaimation" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 3, 1 }, Procs = { "", "" }, Types = { "Sweep", "360" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ShadowHarvestComboThree.gif",
			Name = "Soul Dance" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ShadowHarvestComboOne.gif",
			Name = "Reaping Leap" 
		},
		WeaponType = "Scythe" 
	},
	["Shattering Storm"] = {
		StanceName = "Shattering Storm",
		Block = {
			Attacks = {
				{ Dmg = { 300, 300 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 500, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" }, Types = { "", "Slam" } } 
			},
			Duration = 3.3,
			Image = "ShatteringStormCombo3.gif",
			Name = "Rising Thunder" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.5, Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } } 
			},
			Duration = 2.6,
			Image = "ShatteringStormCombo1.gif",
			Name = "Pounding Smite" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 400, 200 }, Hits = { 1, 1 }, Types = { "Sweep", "360" } },
				{
					ImpactMultiplier = { 1.5, 1.5, 1 }, 
					Dmg = { 200, 500, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "", "", "Knockdown" },
					Types = { "Sweep", "", "Slam" } 
				} 
			},
			Duration = 3.55,
			Image = "ShatteringStormCombo2.gif",
			Name = "Smashing Fury" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Types = { "", "Slam" } },
				{ Dmg = { 300, 300, 100 }, Hits = { 1, 1, 1 }, Procs = { "", "Knockback", "" }, Types = { "Sweep", "", "Slam" } },
				{ ImpactMultiplier = { 1.5, 1 }, Dmg = { 400, 100 }, Hits = { 1, 1 }, Types = { "", "Slam" } },
				{
					Dmg = { 200, 500, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockdown", "", "Knockdown" },
					Types = { "Sweep", "", "Slam" } 
				} 
			},
			Duration = 4.9,
			Image = "ShatteringStormCombo0.gif",
			Name = "Falling Rock" 
		},
		WeaponType = "Hammer" 
	},
	["Shimmering Blight"] = {
		StanceName = "Shimmering Blight",
		Block = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "ShimmeringBlightCombo0.gif",
			Name = "Slashing Wind" 
		},
		Forward = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "ShimmeringBlightCombo0.gif",
			Name = "Slashing Wind" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 5 }, Types = {"Thrust","360"} },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Duration = 2.55,
			Image = "ShimmeringBlightCombo2.gif",
			Name = "Howling Gale" 
		},
		Neutral = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 } }, { Dmg = { 100, 200 }, Hits = { 2, 1 } } },
			Duration = 0.95,
			Image = "ShimmeringBlightCombo0.gif",
			Name = "Slashing Wind" 
		},
		WeaponType = "Polearm" 
	},
	["Sinking Talon"] = {
		StanceName = "Sinking Talon",
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.15,
			Image = "SinkingTalonCombo1.gif",
			Name = "Lashing Panther" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.15,
			Image = "SinkingTalonCombo1.gif",
			Name = "Lashing Panther" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } },
				{
					Dmg = { 100, 300, 100, 100 },
					Hits = { 2, 1, 2, 1 },
					Procs = { "", { "Bleeding", "Lifted" }, "", "Knockback" } 
				} 
			},
			Duration = 3.05,
			Image = "SinkingTalonCombo2.gif",
			Name = "Rising Lion" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.15,
			Image = "SinkingTalonCombo1.gif",
			Name = "Lashing Panther" 
		},
		WeaponType = "Dual Daggers" 
	},
	["Slicing Feathers"] = {
		StanceName = "Slicing Feathers",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.15,
			Image = "SlicingFeathersCombo3.gif",
			Name = "Cutting Fringe" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200, 300 }, Hits = { 2, 1 } } 
			},
			Duration = 1.65,
			Image = "SlicingFeathersCombo1.gif",
			Name = "Razor Fin" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 5 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 100 }, Hits = { 3, 2 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 200, 400 }, Hits = { 1, 1 }, Procs = { "Knockback", "Lifted" } } 
			},
			Duration = 3.55,
			Image = "SlicingFeathersCombo2.gif",
			Name = "Serrated Crest" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 2 }, Note = "*", Procs = { "Knockback" } },
				{ Dmg = { 100, 300 }, Hits = { 2, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.6,
			Image = "SlicingFeathersCombo0.gif",
			Name = "Scathing Plume" 
		},
		WeaponType = "Warfan" 
	},
	["Sovereign Outcast"] = {
		StanceName = "Sovereign Outcast",
		Block = {
			Attacks = {
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "", "Ragdoll" } } 
			},
			Duration = 1.25,
			Image = "SovereignOutcastCombo3.gif",
			Name = "Scout Command" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 6 }, Types = { "360" } } 
			},
			Duration = 1.75,
			Image = "SovereignOutcastCombo1.gif",
			Name = "Vagrant Behest" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 6 } },
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300, 100 }, Hits = { 2, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "","Slam" } } 
			},
			Duration = 3,
			Image = "SovereignOutcastCombo2.gif",
			Name = "Villain Rule" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200, 50 }, Hits = { 1, 5 } },
				{ Dmg = { 200, 100, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 200 }, Hits = { 4 }, Procs = { "Bleeding" } },
				{ Dmg = { 300 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.85,
			Image = "SovereignOutcastCombo0.gif",
			Name = "Rogue Edict" 
		},
		WeaponType = "Tonfa" 
	},
	Sparring = {
		StanceName = "Sparring",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 } }, -- 268 with Hirudo stanceless but not exactly sure what is the physical damage bonus
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } -- 270 with Hirudo stanceless
			},
			Image = "SparringComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 } }, -- 268 with Hirudo stanceless but not exactly sure what is the physical damage bonus
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } -- 270 with Hirudo stanceless
			},
			Image = "SparringComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 } }, -- 268 with Hirudo stanceless but not exactly sure what is the physical damage bonus
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } -- 270 with Hirudo stanceless
			},
			Image = "SparringComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 2 } }, -- 268 with Hirudo stanceless but not exactly sure what is the physical damage bonus
				{ ImpactMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } -- 270 with Hirudo stanceless
			},
			Image = "SparringComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "SparringComboAir.gif",
			Name = "One Point" 
		},
		Finisher = { Attacks = { { Dmg = { 500 }, Hits = { 6 } } }, Image = "SparringComboFinisherGround.gif", Name = "Roaring Drums" },
		Heavy = {
			Attacks = {
				{
					Dmg = { 500, 400 },
					Hits = { 1, 1 },
					Procs = { "", "Lifted" },
					Shape = "Heavy",
					Types = { "", "Slam" } 
				},
				{ Dmg = { 100 }, Hits = { 4 }, Procs = { "Finisher" }, Shape = "Heavy" } 
			},
			Image = "SparringComboHeavy.gif",
			Name = "Rising from Ashes" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 2 }, Procs = { "Ragdoll" } } },
			Duration = 0.84,
			Image = "SparringComboSlide.gif",
			Name = "Rolling Blast" 
		},
		Wall = { Attacks = { { Dmg = { 300 }, Hits = { 1 } } }, Image = "SparringComboWall.gif", Name = "Through Strike" },
		WeaponType = "Sparring"
	},
	["Spinning Needle"] = {
		StanceName = "Spinning Needle",
		Block = {
			Attacks = { { Dmg = { 100, 200, 400 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Ragdoll" } } },
			Duration = 1.1,
			Image = "SpinningNeedleCombo3.gif",
			Name = "Fey Intervention" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 100 }, Hits = { 5 }, Types = { "360" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } } 
			},
			Duration = 2.15,
			Image = "SpinningNeedleCombo1.gif",
			Name = "Accursed Whispers" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Duration = 2.5,
			Image = "SpinningNeedleCombo2.gif",
			Name = "Fey Intervention" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Bleeding" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.85,
			Image = "SpinningNeedleCombo0.gif",
			Name = "True Kiss" 
		},
		WeaponType = "Dual Daggers" 
	},
	Staff = {
		StanceName = "Staff",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } }
			},
			Image = "StaffComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } }
			},
			Image = "StaffComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } }
			},
			Image = "StaffComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } }
			},
			Image = "StaffComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Image = "StaffComboAir.gif",
			Name = "Planting Widow" 
		},
		Finisher = { Attacks = { { Dmg = { 1000 }, Hits = { 1 } } }, Image = "StaffComboFinisherGround.gif", Name = "Wide Dispatch" },
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "StaffComboHeavy.gif",
			Name = "The Way" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Procs = { "Lifted" }, Types = { "360" } } },
			Duration = 0.68,
			Image = "StaffComboSlide.gif",
			Name = "Crushing Reach" 
		},
		Wall = { Attacks = { { Dmg = { 166 }, Hits = { 1 } } }, Image = "StaffComboWall.gif", Name = "Guiding Plank" },
		WeaponType = "Staff"
	},
	["Stalking Fan"] = {
		StanceName = "Stalking Fan",
		Block = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "Knockback", "" }, Types = { "360", "Sweep" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.9,
			Image = "StalkingFanCombo0.gif",
			Name = "Shadow Wing" 
		},
		Forward = {
			Attacks = { 
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } }, 
				{ SlashMultiplier = 1.1, ImpactMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 } }
			},
			Duration = 1.25,
			Image = "StalkingFanCombo1.gif",
			Name = "Many Tears" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 1.1, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{
					Dmg = { 200, 100 },
					Hits = { 3, 1 },
					Procs = { "", { "Knockback", "Bleeding" } },
					Types = { "360", "360" } 
				} 
			},
			Duration = 2.4,
			Image = "StalkingFanCombo2.gif",
			Name = "Dying Light" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "Knockback", "" }, Types = { "360", "Sweep" } },
				{ SlashMultiplier = 1.25, PunctureMultiplier = 1.25, ImpactMultiplier = 1.25, Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 4.9,
			Image = "StalkingFanCombo0.gif",
			Name = "Shadow Wing" 
		},
		WeaponType = "Scythe" 
	},
	["Star Divide"] = {
		StanceName = "Star Divide",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "Impair", "Impair", "Impair", "Impair" } 
				},
				{
					Dmg = { 100, 100, 100 },
					Hits = { 2, 2, 2 },
					Procs = { "Knockdown", "Knockdown", "Knockdown" },
					Types = { "Sweep", "Sweep", "Slam" } 
				} 
			},
			Image = "StarDivideComboOne.gif",
			Name = "Wandering Scourge" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "StarDivideComboTwo.gif",
			Name = "Bitter Grudge" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 300, 200 }, Hits = { 1, 1 } }, { Dmg = { 100 }, Hits = { 5 } } },
			Image = "StarDivideComboThree.gif",
			Name = "Dire Fall" 
		},
		Neutral = {
			Attacks = {
				{
					Dmg = { 100, 100, 100, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "Impair", "Impair", "Impair", "Impair" } 
				},
				{
					Dmg = { 100, 100, 100 },
					Hits = { 2, 2, 2 },
					Procs = { "Knockdown", "Knockdown", "Knockdown" },
					Types = { "Sweep", "Sweep", "Slam" } 
				} 
			},
			Image = "StarDivideComboOne.gif",
			Name = "Wandering Scourge" 
		},
		WeaponType = "Tonfa" 
	},
	["Stinging Thorn"] = {
		StanceName = "Stinging Thorn",
		Block = {
			Attacks = {
				{ Dmg = { 100, 200, 300 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.35,
			Image = "StingingThornCombo3.gif",
			Name = "Impaling Quill" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } } 
			},
			Duration = 1.8,
			Image = "StingingThornCombo1.gif",
			Name = "Piercing Horn" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200, 200 }, Hits = { 2, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "","Knockdown" }, Types = { "","Slam" } } 
			},
			Duration = 2.7,
			Image = "StingingThornCombo2.gif",
			Name = "Lacerating Spine" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "", "Knockback" } },
				{ Dmg = { 100, 200, 200 }, Hits = { 1, 1, 1 }, Procs = { "Bleeding", "Bleeding", "" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 200, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.95,
			Image = "StingingThornCombo0.gif",
			Name = "Carving Spike" 
		},
		WeaponType = "Dagger" 
	},
	["Sundering Weave"] = {
		StanceName = "Sundering Weave",
		Block = {
			Attacks = { { SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } },
			Duration = 1.2,
			Image = "SunderingWeaveCombo3.gif",
			Name = "Coming Tide" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 2,
			Image = "SunderingWeaveCombo1.gif",
			Name = "Cresting Surf" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 200 }, Hits = { 2, 1 }, Procs = { "", "Bleeding" }, Types = { "Sweep", "360" } },
				{ SlashMultiplier = {1.5, 1}, PunctureMultiplier = {1.5, 1}, ImpactMultiplier = {1.5, 1}, Dmg = { 400, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "", "Slam" } } 
			},
			Duration = 2.4,
			Image = "SunderingWeaveCombo2.gif",
			Name = "Flash Flood" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, PunctureMultiplier = 1.5, ImpactMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 1.7,
			Image = "SunderingWeaveCombo0.gif",
			Name = "Rapid Current" 
		},
		WeaponType = "Machete" 
	},
	["Swirling Tiger"] = {
		StanceName = "Swirling Tiger",
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 5, 1 }, Procs = { "", "Bleeding" } },
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Duration = 2.05,
			Image = "SwirlingTigerCombo0.gif",
			Name = "Winding Claws" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100, 200 }, Hits = { 3, 1 }, Procs = { "", "Lifted" }, Types = { "360", "Sweep" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 1.6,
			Image = "SwirlingTigerCombo1.gif",
			Name = "Raking Flesh" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200, 100, 100 }, Hits = { 2, 1, 1 }, Procs = { "", "", "Knockback" } },
				{ Dmg = { 100, 200 }, Hits = { 2, 2 } } 
			},
			Duration = 2.3,
			Image = "SwirlingTigerCombo2.gif",
			Name = "Dancing Hunter" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 5, 1 }, Procs = { "", "Bleeding" } },
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Duration = 2.05,
			Image = "SwirlingTigerCombo0.gif",
			Name = "Winding Claws" 
		},
		WeaponType = "Dual Swords" 
	},
	["Swooping Falcon"] = {
		StanceName = "Swooping Falcon",
		Block = {
			Attacks = {
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 2.75,
			Image = "SwoopingFalconCombo3.gif",
			Name = "Keen Broadwing" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.95,
			Image = "SwoopingFalconCombo1.gif",
			Name = "Swift Pursuit" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Duration = 2.05,
			Image = "SwoopingFalconCombo2.gif",
			Name = "Slicing Talon" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "Bleeding", "" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Knockdown" } } 
			},
			Duration = 2,
			Image = "SwoopingFalconCombo0.gif",
			Name = "Diving Kestrel" 
		},
		WeaponType = "Sword" 
	},
	Sword = {
		StanceName = "Sword",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, SlashMultiplier = 1.1 },
			},
			Image = "SwordComboNeutral.gif",
			Name = "",
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, SlashMultiplier = 1.1 },
			},
			Image = "SwordComboNeutral.gif",
			Name = "",
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, SlashMultiplier = 1.1 },
			},
			Image = "SwordComboNeutral.gif",
			Name = "",
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, SlashMultiplier = 1.1 },
			},
			Image = "SwordComboNeutral.gif",
			Name = "",
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } } 
			},
			Image = "SwordComboAir.gif",
			Name = "Weightless Steel" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "SwordComboFinisherGround.gif",
			Name = "Death's Mark" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Lifted" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "SwordComboHeavy.gif",
			Name = "Perfect Cut" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.69,
			Image = "SwordComboSlide.gif",
			Name = "Spiral Cut" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image=  "SwordComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Sword"
	},
	["Sword and Shield"] = {
		StanceName = "Sword and Shield",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.15,
			Image = "EleventhStormCombo1.gif",
			Name = "Devouring Beast" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.15,
			Image = "EleventhStormCombo1.gif",
			Name = "Devouring Beast" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.15,
			Image = "EleventhStormCombo1.gif",
			Name = "Devouring Beast" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } 
			},
			Duration = 1.15,
			Image = "EleventhStormCombo1.gif",
			Name = "Devouring Beast" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "Sword-ShieldComboAir.gif",
			Name = "Fist of Iron" 
		},
		Finisher = {
			Attacks = { { Dmg = { 800 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "Sword-ShieldComboFinisherGround.gif",
			Name = "Last Stand" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { "Knockdown" },
					Shape = "Heavy",
					Types = { "360" } 
				},
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Knockdown" }, Shape = "Heavy" } 
			},
			Image = "Sword-ShieldComboHeavy.gif",
			Name = "Hallowed Name" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } },
			Image = "Sword-ShieldComboSlide.gif",
			Name = "Destructive Symphony" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "Sword-ShieldComboWall.gif",
			Name = "Dying Angel" 
		},
		WeaponType = "Sword and Shield"
	},
	["Tainted Hydra"] = {
		StanceName = "Tainted Hydra",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{
					Dmg = { 100, 100, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockdown", "Knockdown", "Knockdown" } 
				},
				{ Dmg = { 100, 100, 100 }, Hits = { 1, 1, 1 } } 
			},
			Image = "TaintedHydraComboOne.gif",
			Name = "Heart of the Naga" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "TaintedHydraComboTwo.gif",
			Name = "Talons of the Wyrm" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Impair" } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "TaintedHydraComboThree.gif",
			Name = "Heart of the Imoogi" 
		},
		Neutral = {
			Attacks = {
				{
					Dmg = { 100, 100, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "Knockdown", "Knockdown", "Knockdown" } 
				},
				{ Dmg = { 100, 100, 100 }, Hits = { 1, 1, 1 } } 
			},
			Image = "TaintedHydraComboOne.gif",
			Name = "Heart of the Naga" 
		},
		WeaponType = "Blade and Whip" 
	},
	["Telos Boltace"] = {
		UniqueToWeapon = true,
		StanceName = "Telos Boltace",
		Slide = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Stagger" }, Types = { "360" } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Lifted" }, Types = { "360" } }
			},
			Duration = 1.48,
			Image = "TelosBoltaceComboSlide.gif",
			Name = "Stormpath" 
		},
		WeaponType = "Tonfa" 
	},
	["Tempo Royale"] = {
		StanceName = "Tempo Royale",
		Block = {
			Attacks = { { SlashMultiplier = {1.25, 1}, Dmg = { 600, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "", "Slam" } } },
			Duration = 1.8,
			Image = "TempoRoyaleCombo3.gif",
			Name = "Bold Reprise" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Types = { "360" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ SlashMultiplier = 1.25, Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Duration = 3.4,
			Image = "TempoRoyaleCombo1.gif",
			Name = "Majestic Abandon" 
		},
		["Forward Block"] = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{
					Dmg = { 200, 500, 100 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Knockdown", "Knockback" },
					Types = { "Sweep", "", "Slam" } 
				} 
			},
			Duration = 2.1,
			Image = "TempoRoyaleCombo2.gif",
			Name = "Resplendent Calma" 
		},
		Neutral = {
			Attacks = {
				{ SlashMultiplier = 1.25, Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 200, 100, 300, 100 }, Hits = { 1, 1, 1, 1 }, Types = { "", "Slam","", "Slam" } },
				{ SlashMultiplier = 1.25, Dmg = { 400 }, Hits = { 1 } },
				{
					Dmg = { 200, 100, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Knockback", "Knockdown" } 
				} 
			},
			Duration = 4.65,
			Image = "TempoRoyaleCombo0.gif",
			Name = "August Mesto" 
		},
		WeaponType = "Heavy Blade" 
	},
	["Tenet Agendus"] = {
		UniqueToWeapon = true,
		StanceName = "Tenet Agendus",
		Heavy = {
			Attacks = {
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { "Knockback" },
					Shape = "Heavy",
					Types = {"Ranged"}
				},
				{
					Dmg = { 500 },
					Hits = { 1 },
					Procs = { "Knockdown" },
					Shape = "Heavy",
					Types = { "360" } 
				}
			},
			Image = "TenetAgendusComboHeavy.gif",
			Name = "Tenet Agendus Heavy (unofficial)" 
		},
		WeaponType = "Sword and Shield" 
	},
	["Tenet Grigori"] = {
		UniqueToWeapon = true,
		StanceName = "Tenet Grigori",
		Heavy = {
			Attacks = {
				{
					Dmg = { 600 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Knockdown" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 600, 600 },
					Hits = { 1, 1 },
					Procs = { "Bleeding", "Knockback" },
					Shape = "Heavy",
					Types = { "", "Ranged" }
				} 
			},
			Image = "TenetGrigoriComboHeavy.gif",
			Name = "Tenet Grigori (unofficial)" 
		},
		WeaponType = "Scythe" 
	},
	Tonfa = {
		StanceName = "Tonfa",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "TonfaComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "TonfaComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "TonfaComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } 
			},
			Image = "TonfaComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 3 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 5 }, Procs = { "Knockback" } } 
			},
			Image = "TonfaComboAir.gif",
			Name = "Ascendant Bane" 
		},
		Finisher = { Attacks = { { Dmg = { 1000 }, Hits = { 1 } } }, Image = "TonfaComboFinisherGround.gif", Name = "Cold Vendetta" },
		Heavy = {
			Attacks = {
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" },
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" } 
			},
			Image = "TonfaComboHeavy.gif",
			Name = "Discord Sewn" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 2 }, Types = { "360" } } },
			Duration = 0.74,
			Image = "TonfaComboSlide.gif",
			Name = "Feuding Blood" 
		},
		Wall = {
			Attacks = { { Dmg = { 200 }, Hits = { 2 }, Procs = { "Knockdown" } } },
			Image = "TonfaComboWall.gif",
			Name = "Opposing Force" 
		},
		WeaponType = "Tonfa"
	},
	["Tranquil Cleave"] = {
		StanceName = "Tranquil Cleave",
		Block = {
			Attacks = { { Dmg = { 400 }, Hits = { 2 }, Procs = { "Ragdoll" } } },
			Duration = 1.2,
			Image = "TranquilCleaveCombo3.gif",
			Name = "Hook and Eye" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ SlashMultiplier = 1.5, Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.9,
			Image = "TranquilCleaveCombo1.gif",
			Name = "Windless Cut" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 2.6,
			Image = "TranquilCleaveCombo2.gif",
			Name = "Beyond Reproach" 
		},
		Neutral = {
			Attacks = {
				{ ImpactMultiplier = 2, Dmg = { 300, 100, 100 }, Hits = { 1, 1, 1 }, Procs = { "", "", "Bleeding" } },
				{ ImpactMultiplier = 2, Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "", "" } },
				{ SlashMultiplier = 2, ImpactMultiplier = 2, Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.8,
			Image = "TranquilCleaveCombo0.gif",
			Name = "Breathless Lunge" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Duration = 0.67,
			Name = "Parting Knee" 
		},
		WeaponType = "Nikana" 
	},
	["Twirling Spire"] = {
		StanceName = "Twirling Spire",
		Block = {
			Attacks = {
				{
					Dmg = { 200, 100, 400, 100 },
					Hits = { 1, 4, 1, 2 },
					Procs = { "", "", "Knockdown", "" } 
				} 
			},
			Duration = 2,
			Image = "TwirlingSpireCombo3.gif",
			Name = "Summit Plunge" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200, 100 }, Hits = { 1, 2 }, Types = { "360", "360" } },
				{ Dmg = { 100, 200 }, Hits = { 4, 1 }, Types = { "360", "360" } } 
			},
			Duration = 2.5,
			Image = "TwirlingSpireCombo1.gif",
			Name = "Spiraling Pinnacle" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "Knockback" }, Types = { "", "Slam" } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 1.75,
			Image = "TwirlingSpireCombo2.gif",
			Name = "Vaulting Apex" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 300, 200 }, Hits = { 1, 1 }, Procs = { "", "Lifted" } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.3,
			Image = "TwirlingSpireCombo0.gif",
			Name = "Cresting Peak" 
		},
		WeaponType = "Polearm" 
	},
	["Two-Handed Nikana"] = {
		StanceName = "Two-Handed Nikana",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.55,
			Image = "WiseRazorCombo1.gif",
			Name = "Cutting Thrice" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.55,
			Image = "WiseRazorCombo1.gif",
			Name = "Cutting Thrice" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.55,
			Image = "WiseRazorCombo1.gif",
			Name = "Cutting Thrice" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.55,
			Image = "WiseRazorCombo1.gif",
			Name = "Cutting Thrice" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Image = "Two-HandedNikanaComboAir.gif",
			Name = "Cunning Monkey" 
		},
		Finisher = {
			Attacks = { { Dmg = { 1200 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "Two-HandedNikanaComboFinisherGround.gif",
			Name = "Terrapin's Rebuke" 
		},
		Heavy = {
			Attacks = {
				{
					Dmg = { 600 },
					Hits = { 1 },
					Procs = { { "Bleeding", "Lifted" } },
					Shape = "Heavy" 
				},
				{
					Dmg = { 300, 300 },
					Hits = { 1, 1 },
					Procs = { { "Knockback", "Bleeding" }, { "Bleeding", "Knockdown" } },
					Shape = "Heavy",
					Types = { "360", "Sweep" } 
				} 
			},
			Image = "Two-HandedNikanaComboHeavy.gif",
			Name = "Lover's Farewell" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Types = { "360" } } },
			Image = "Two-HandedNikanaComboSlide.gif",
			Name = "Deceitful Serpent" 
		},
		Wall = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } } },
			Image = "Two-HandedNikanaComboWall.gif",
			Name = "Strident Gazelle" 
		},
		WeaponType = "Two-Handed Nikana"
	},
	["Vengeful Revenant"] = {
		StanceName = "Vengeful Revenant",
		Block = {
			Attacks = {
				{ Dmg = { 400, 100 }, Hits = { 1, 1 }, Types = { "Sweep", "360" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { { "Bleeding", "Lifted" } } },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "Knockdown", "Knockback" }, Types = { "", "Slam" } } 
			},
			Duration = 3,
			Image = "VengefulRevenantCombo3.gif",
			Name = "Rising Hate" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 }, Procs = { "Bleeding" } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 1.55,
			Image = "VengefulRevenantCombo1.gif",
			Name = "Lone Vengeance" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100, 300 }, Hits = { 1, 1 }, Procs = { "", "Knockback" }, Types = { "360", "Sweep" } },
				{ Dmg = { 50, 300 }, Hits = { 2, 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 2.3,
			Image = "VengefulRevenantCombo2.gif",
			Name = "Drowning Despair" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.15,
			Image = "VengefulRevenantCombo0.gif",
			Name = "Impending Dread" 
		},
		WeaponType = "Sword" 
	},
	Verdilac = {
		UniqueToWeapon = true,
		StanceName = "Verdilac",
		Block = {
			Attacks = {
				{ Dmg = { 400, 400 }, Hits = { 2, 1 }, Procs = { "", "" }, Types = { "Sweep", "Ranged" }},
				{ Dmg = { 200, 200 }, Hits = { 2, 1 }, Procs = { "Bleeding", "" }, Types = { "Sweep", "Ranged" } },
				{ Dmg = { 500, 500 }, Hits = { 1, 1 }, Procs = { "Ragdoll", "" }, Types = { "Sweep", "Ranged" } }
			},
			Duration = 4.00,
			Image = "VerdilacComboBlock.gif",
			Name = "Verdilac Block (unofficial)" 
		},
		WeaponType = "Whip" 
	},
	["Vermillion Storm"] = {
		StanceName = "Vermillion Storm",
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } },
				{
					Dmg = { 100, 200, 300, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "Knockdown", "","Knockdown" },
					Types = { "Sweep", "Sweep", "","Slam" } 
				} 
			},
			Duration = 2.5,
			Image = "VermillionStormCombo3.gif",
			Name = "Ruby Wind" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 200, 100 }, Hits = { 1, 3 }, Types = { "Sweep", "360" } },
				{ Dmg = { 200, 100 }, Hits = { 1, 1 } } 
			},
			Duration = 1.9,
			Image = "VermillionStormCombo1.gif",
			Name = "Crimson Hurricane" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 50, 100 }, Hits = { 3, 3 }, Types = { "360", "360" } },
				{ Dmg = { 50, 200 }, Hits = { 6, 1 }, Procs = { "", "Knockback" }, Types = { "360", "360" } } 
			},
			Duration = 3.4,
			Image = "VermillionStormCombo2.gif",
			Name = "Cardinal Breeze" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 100, 300 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 100 }, Hits = { 2, 2 }, Procs = { "", "Bleeding" } },
				{ Dmg = { 200, 400 }, Hits = { 1, 1 } },
				{ Dmg = { 300 }, Hits = { 2 }, Procs = { "Knockdown" } } 
			},
			Duration = 3.95,
			Image = "VermillionStormCombo0.gif",
			Name = "Flurry Rose" 
		},
		WeaponType = "Claws" 
	},
	["Vicious Approach"] = {
		StanceName = "Vicious Approach",
		ConclaveOnly = true,
		Block = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = { "Impair", "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "ViciousApproachComboOne.gif",
			Name = "Savagery At Hand" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } } 
			},
			Image = "ViciousApproachComboTwo.gif",
			Name = "Cruel Advance" 
		},
		["Forward Block"] = {
			Attacks = { { Dmg = { 100 }, Hits = { 2 } }, { Dmg = { 100 }, Hits = { 1 } } },
			Image = "ViciousApproachComboThree.gif",
			Name = "Impending Danger" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100, 100 }, Hits = { 2, 1 }, Procs = { "Impair", "Impair" } },
				{ Dmg = { 100 }, Hits = { 2 } } 
			},
			Image = "ViciousApproachComboOne.gif",
			Name = "Savagery At Hand" 
		},
		WeaponType = "Sparring" 
	},
	["Votive Onslaught"] = {
		StanceName = "Votive Onslaught",
		Block = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Lifted" } },
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 2 }, Procs = { "", "Lifted" } } 
			},
			Duration = 2.67,
			Image = "VotiveOnslaughtCombo3.gif",
			Name = "Penitent Offering" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 3 } },
				{ Dmg = { 100 }, Hits = { 4 } } 
			},
			Duration = 1.84,
			Image = "VotiveOnslaughtCombo1.gif",
			Name = "Clarion Rush" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200, 100 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 200 }, Hits = { 2, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 200, 100, 300 }, Hits = { 1, 1, 1 } },
				{ Dmg = { 300 }, Hits = { 2 }, Procs = { "Lifted" } } 
			},
			Duration = 2.78,
			Image = "VotiveOnslaughtCombo2.gif",
			Name = "Rending Lamentation" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 2 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "360" } },
				{
					Dmg = { 100, 100, 300, 300 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "", "", { "Bleeding", "Knockdown" } } 
				} 
			},
			Duration = 2.57,
			Image = "VotiveOnslaughtCombo0.gif",
			Name = "Purging Drive" 
		},
		WeaponType = "Warfan" 
	},
	["Vulpine Mask"] = {
		StanceName = "Vulpine Mask",
		Block = {
			Attacks = {
				{ Dmg = { 200, 300 }, Hits = { 1, 1 }, Procs = { "", "Lifted" }, Types = {"Thrust", "Thrust"} },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Ragdoll" } } 
			},
			Duration = 1.45,
			Image = "VulpineMaskCombo3.gif",
			Name = "Deceptive Lunge" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 50 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "Sweep" } },
				{ Dmg = { 200 }, Hits = { 1 } } 
			},
			Duration = 3,
			Image = "VulpineMaskCombo1.gif",
			Name = "Duel Secrets" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = {""} },
				{ Dmg = { 100, 100 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" }, Types = {"Thrust"} },
				{ Dmg = { 100, 200, 300 }, Hits = { 1, 1, 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockback" } } 
			},
			Duration = 2.5,
			Image = "VulpineMaskCombo2.gif",
			Name = "Hidden Flourish" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 }, Types = {"Thrust"} },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } }, Types = {"Thrust"} },
				{ Dmg = { 300 }, Hits = { 1 }, Types = {"Thrust"} },
				{ Dmg = { 300, 100 }, Hits = { 1, 1 }, Procs = { "", "Bleeding" }, Types = {"Thrust"} },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = {"Thrust"} } 
			},
			Duration = 3,
			Image = "VulpineMaskCombo0.gif",
			Name = "Assailant Guise" 
		},
		WeaponType = "Rapier" 
	},
	Warfan = {
		StanceName = "Warfan",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Image = "WarfanComboNeutral.gif",
			Name = "" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Image = "WarfanComboNeutral.gif",
			Name = "" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Image = "WarfanComboNeutral.gif",
			Name = "" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 100 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 2 } } 
			},
			Image = "WarfanComboNeutral.gif",
			Name = "" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 2 } },
				{ Dmg = { 200 }, Hits = { 3 } },
				{ Dmg = { 200 }, Hits = { 6 } } 
			},
			Image = "WarfanComboAir.gif",
			Name = "Sky Doom" 
		},
		Finisher = {
			Attacks = { { PunctureMultiplier = 2, Dmg = { 1000 }, Hits = { 1 }, Procs = { "Bleeding" } } },
			Image = "WarfanComboFinisherGround.gif",
			Name = "Death's Mark" 
		},
		Heavy = {
			Attacks = {
				{ Dmg = { 250 }, Hits = { 2 }, Procs = { "Bleeding" }, Shape = "Heavy" },
				{ Dmg = { 500 }, Hits = { 1 }, Procs = { "Bleeding" }, Shape = "Heavy" } 
			},
			Image = "WarfanComboHeavy.gif",
			Name = "Perfect Cut" 
		},
		Slide = {
			Attacks = { { Dmg = { 100 }, Hits = { 1 }, Types = { "360" } } },
			Image = "WarfanComboSlide.gif",
			Name = "Spiral Cut" 
		},
		Wall = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "WarfanComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Warfan"
	},
	Whip = {
		StanceName = "Whip",
		StancelessStance = true,
		Block = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Duration = 1.9,
			Image = "BurningWaspCombo0.gif",
			Name = "Sparking Torture" 
		},
		Forward = {
			Attacks = {
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100 }, Hits = { 1 } },
				{ Dmg = { 100, 200 }, Hits = { 1, 1 }, Types = { "360", "Sweep" } } 
			},
			Duration = 3,
			Image = "BurningWaspCombo1.gif",
			Name = "Buzzing Sting" 
		},
		["Forward Block"] = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Duration = 1.9,
			Image = "BurningWaspCombo0.gif",
			Name = "Sparking Torture" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } 
			},
			Duration = 1.9,
			Image = "BurningWaspCombo0.gif",
			Name = "Sparking Torture" 
		},
		Aerial = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { { "Knockback", "Bleeding" } } } 
			},
			Image = "WhipComboAir.gif",
			Name = "Mountain's Chisel" 
		},
		Finisher = { Attacks = { { Dmg = { 1000 }, Hits = { 1 } } }, Image = "WhipComboFinisherGround.gif", Name = "Resounding Fear" },
		Heavy = {
			Attacks = {
				{ Dmg = { 450 }, Hits = { 1 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" },
				{ Dmg = { 450 }, Hits = { 1 }, Procs = { { "Bleeding", "Knockdown" } }, Shape = "Heavy" } 
			},
			Image = "WhipComboHeavy.gif",
			Name = "Rolling Thunder" 
		},
		Slide = {
			Attacks = { { Dmg = { 200 }, Hits = { 1 }, Procs = { "Knockback" }, Types = { "360" } } },
			Duration = 0.64,
			Image = "WhipComboSlide.gif",
			Name = "Spiral Cut" 
		},
		Wall = {
			Attacks = { { Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockdown" } } },
			Image = "WhipComboWall.gif",
			Name = "Weightless Steel" 
		},
		WeaponType = "Whip"
	},
	["Wise Razor"] = {
		StanceName = "Wise Razor",
		Forward = {
			Attacks = {
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 200 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 } } 
			},
			Duration = 2.55,
			Image = "WiseRazorCombo1.gif",
			Name = "Cutting Thrice" 
		},
		["Forward Block"] = {
			Attacks = {
				{
					Dmg = { 200, 200, 300, 100 },
					Hits = { 1, 1, 1, 1 },
					Procs = { "", "Knockback", { "Bleeding", "Lifted" }, "Knockback" },
					Types = { "Sweep", "Sweep", "", "Slam" } 
				},
				{ Dmg = { 300 }, Hits = { 1 } },
				{ Dmg = { 400 }, Hits = { 1 }, Procs = { "Knockdown" }, Types = { "360" } } 
			},
			Duration = 3.5,
			Image = "WiseRazorCombo2.gif",
			Name = "Calling Thunder" 
		},
		Neutral = {
			Attacks = {
				{ Dmg = { 300 }, Hits = { 1 }, Procs = { "Knockback" } },
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{ PunctureMultiplier = 1.5, Dmg = { 300 }, Hits = { 1 } },
				{
					Dmg = { 200, 200, 400 },
					Hits = { 1, 1, 1 },
					Procs = { "", "Bleeding", "Knockdown" } 
				} 
			},
			Duration = 4.4,
			Image = "WiseRazorCombo0.gif",
			Name = "Threshing Grain" 
		},
		WeaponType = "Two-Handed Nikana" 
	} 
}
```

