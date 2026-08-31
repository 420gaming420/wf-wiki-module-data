-- Original table was from https://warframe.fandom.com/wiki/Module:Icon/data
-- Moved here on 2021-10-20 for archival reasons since icons are relevant to
-- superceded Focus 1.0 - [[User:Cephalon Scientia]]
-- Focus 2.0 content moved here since 2022-05-06 after Focus 3.0 rework was
-- released on Update 31.5 Angels of the Zariman
return {
	-- Focus 1.0 content
	["Focus 1.0"] = {
		["Focus"] = {
			["Focus Points"]= {
				icon  = {"FocusLensFocus_b.png", "FocusLensFocus.png"},
				seal = {""},
			},
			["Pool"]= {
				icon  = {"FocusPool.png", "FocusPool_White.png"},
				seal = {""},
			},
			["Madurai"]= {
				icon  = {"FocusLensMadurai_b.png", "FocusLensMadurai.png"},
				seal = {"SealMaduraiCloud_b.png", "SealMaduraiCloud.png"},
			},
			["Naramon"]= {
				icon  = {"FocusLensNaramon_b.png", "FocusLensNaramon.png"},
				seal = {"SealNaramonTree_b.png", "SealNaramonTree.png"},
			},
			["Unairu"]= {
				icon  = {"FocusLensUnairu_b.png", "FocusLensUnairu.png"},
				seal = {"SealUnairuMountain_b.png", "SealUnairuMountain.png"},
			},
			["Vazarin"]= {
				icon  = {"FocusLensVazarin_b.png", "FocusLensVazarin.png"},
				seal = {"SealVazarinWave_b.png", "SealVazarinWave.png"},
			},
			["Zenurik"]= {
				icon  = {"FocusLensZenurik_b.png", "FocusLensZenurik.png"},
				seal = {"SealZenurikCrystal_b.png", "SealZenurikCrystal.png"},
			},
		},
		["Ways"] = {
			-- The ways are sorted from left to right, top to bottom.
			
			-- Unairu
			["Stone Shape"] = "FocusIcon68_b.png",
			["Medusa Skin"] = "FocusIcon92_b.png",
			["Mighty Blows"] = "FocusIcon78_b.png",
			["Lasting Judgement"] = "FocusIcon74_b.png",
			["Scorched Earth"] = "FocusIcon72_b.png",
			["Crushing Force"] = "FocusIcon75_b.png",
			["Basilisk Flare Mastery"] = "FocusIcon95_b.png",
			["Weight of Justice"] = "FocusIcon82_b.png",
			["Stone Armor"] = "FocusIcon71_b.png",
			["Eroded Defenses"] = "FocusIcon80_b.png",
			
			-- Zenurik
			["Temporal Storm"] = "FocusIcon29_b.png",
			["Time Stream"] = "FocusIcon27_b.png",
			["Void Pulse Mastery"] = "FocusIcon99_b.png",
			["Rift Sight"] = "FocusIcon32_b.png",
			["Systemic Override"] = "FocusIcon25_b.png",
			["Energy Overflow"] = "FocusIcon26_b.png",
			["Energy Surge"] = "FocusIcon24_b.png",
			["Umbra Lance"] = "FocusIcon28_b.png",
			["Energy Spike"] = "FocusIcon23_b.png",
			["Magnetic Aftershock"] = "FocusIcon20_b.png",
			
			-- Naramon
			["Shadow Step"] = "FocusIcon49_b.png",
			["Traumatic Redirection"] = "FocusIcon51_b.png",
			["Strategic Execution"] = "FocusIcon56_b.png",
			["Mind Blast"] = "FocusIcon41_b.png",
			["Deadly Intent"] = "FocusIcon54_b.png",
			["Mind Spike Mastery"] = "FocusIcon85_b.png",
			["Sundering Blast"] = "FocusIcon48_b.png",
			["Reveal Weakness"] = "FocusIcon45_b.png",
			["Cloaking Aura"] = "FocusIcon43_b.png",
			["Tactical Strike"] = "FocusIcon40_b.png",
			
			-- Vazarin
			["Disciplined Approach"] = "FocusIcon108_b.png",
			["Mending Tides Mastery"] = "FocusIcon94_b.png",
			["Commanding Words"] = "FocusIcon11_b.png", -- identical, not a mistake
			["Retaliation"] = "FocusIcon11_b.png", -- identical, not a mistake
			["New Moon"] = "FocusIcon03_b.png",
			["Protection Ward"] = "FocusIcon111_b.png",
			["Strengthen Defenses"] = "FocusIcon118_b.png",
			["Polluted Waters"] = "FocusIcon117_b.png",
			["Mending Shower"] = "FocusIcon115_b.png",
			["Guardian Presence"] = "FocusIcon112_b.png",
			
			-- Madurai
			["Burning Rage"] = "FocusIcon122_b.png",
			["Searing Wrath"] = "FocusIcon126_b.png",
			["Phoenix Gaze Mastery"] = "FocusIcon90_b.png",
			["Blazing Fury"] = "FocusIcon136_b.png",
			["Chimera Breath"] = "FocusIcon123_b.png",
			["Dragon Fire"] = "FocusIcon103_b.png",
			["Rising Ashes"] = "FocusIcon07_b.png",
			["Phoenix Flash"] = "FocusIcon09_b.png",
			["Hades Touch"] = "FocusIcon105_b.png",
			["Meteorite"] = "FocusIcon102_b.png",
			
			-- TODO
			["EXAMPLE"] = "FocusIcon_b.png",
		},
	},
	-- Focus 2.0 content
	["Focus 2.0"] = {
		["Symbols"] = {
			["Focus Points"]= {
				Description = "Basic unit of Focus for unlocking Focus Ways. Equip Focus Lens on max-ranked items to convert excess Affinity into Focus Points.",
				Image  = "FocusLensFocus_b.png",
				Link = "Focus",
				Name = "Focus Points",
			},
			["Focus Pool"]= {
				Description = "Represents Focus Way capacity that limits the number and types of active Ways for an equipped Focus School.",
				Image  = "FocusPool.png",
				Link = "Focus",
				Name = "Focus Pool"
			},
		},
		["Ways"] = {
		--
		--
		--Madurai
		--
		--
			["Blazing Dash"] = {
				Image = "FocusBlazingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/DashFireFocusUpgrade",
				Introduced = "22",
				Name = "Blazing Dash",
				Link = "Blazing Dash",
				Description = "[[Void Dash]] leaves a trail of fire that deals '''100 / 200 / 300 / 400 / 600 / 1000''' damage/s over '''3 / 6 / 9 / 12 / 12 / 14'''s. Void Dash will now stun enemies instead of displacing them.",
				School = "Madurai",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Eternal Gaze"] = {
				Image = "FocusEternalGaze.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Stats/RegenAmmoFocusUpgrade",
				Introduced = "22",
				Name = "Eternal Gaze",
				Link = "Eternal Gaze",
				Description = "Increases the regeneration rate of Energy for Amps and [[Void Beam]] by '''10% / 20% / 30% / 40% / 50% / 60% / 60%'''.",
				School = "Madurai",
				Type = "Way-Bound Passive",
				Unlock = 50000,
				Rankup = "120,000 / 162,426 / 240,000 / 340,454 / 459,411 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 4 / 7 / 10 / 13 / 16 / 16",
				Type = "Active"
			},
		
			["Flame Blast"] = {
				Image = "FocusFlameBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/BlastFireballFocusUpgrade",
				Introduced = "22",
				Name = "Flame Blast",
				Link = "Flame Blast",
				Description = "[[Void Blast]] releases a ball of fire that deals '''100% / 150% / 200% / 250%''' of the Void Blast damage and explodes after '''0.1 / 0.15 / 0.3 / 0.6'''s.",
				School = "Madurai",
				Unlock = 50000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Inner Gaze"] = {
				Image = "FocusInnerGaze.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Stats/MoreAmmoFocusUpgrade",
				Introduced = "22",
				Name = "Inner Gaze",
				Link = "Inner Gaze",
				Description = "Increase Energy for Amps and [[Void Beam]] by '''10% / 20% / 30% / 40% / 40%'''.",
				School = "Madurai",
				Type = "Way-Bound Passive",
				Unlock = 25000,
				Rankup = "80,000 / 108,284 / 160,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 7",
			},
		
			["Meteoric Dash"] = {
				Image = "FocusMeteoricDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/DashDamageFocusUpgrade",
				Introduced = "22",
				Name = "Meteoric Dash",
				Link = "Meteoric Dash",
				Description = "[[Void Dash]] deals '''+100 / +200 / +300 / +400''' Extra Damage to enemies.",
				School = "Madurai",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Phoenix Spirit"] = {
				Image = "FocusPhoenixSpirit.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Residual/ElementalDamageFocusUpgrade",
				Introduced = "22",
				Name = "Phoenix Spirit",
				Link = "Phoenix Spirit",
				Description = "Elemental Damage increased by '''10% / 15% / 20% / 25%'''.",
				School = "Madurai",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000",
				Pool = "1 / 2 / 3 / 4",
			},
		
			["Phoenix Talons"] = {
				Image = "FocusPhoenixTalons.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Residual/PhysicalDamageFocusUpgrade",
				Introduced = "22",
				Name = "Phoenix Talons",
				Link = "Phoenix Talons",
				Description = "Physical Damage increased by '''10% / 15% / 20% / 25%'''.",
				School = "Madurai",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000",
				Pool = "1 / 2 / 3 / 4",
			},
		
			["Rising Blast"] = {
				Image = "FocusRisingBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/BlastChargeFocusUpgrade",
				Introduced = "22",
				Name = "Rising Blast",
				Link = "Rising Blast",
				Description = "Increase damage of [[Void Blast]] by '''50% / 100% / 150% / 200%''' and it can now be charged to deal additional damage.",
				School = "Madurai",
				Unlock = 80000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Radiance"] = {
				Image = "FocusVoidRadiance.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/CloakBlindFocusUpgrade",
				Introduced = "22",
				Name = "Void Radiance",
				Link = "Void Radiance",
				Description = "Consumes '''25 / 30 / 45 / 50''' energy on leaving [[Void Mode]] to blind enemies within '''4 / 6 / 8 / 10'''m for '''2 / 3 / 4 / 5'''s.",
				School = "Madurai",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Strike"] = {
				Image = "FocusVoidStrike.png",
				InternalName = "/Lotus/Upgrades/Focus/Attack/Active/CloakAttackChargeFocusUpgrade",
				Introduced = "22",
				Name = "Void Strike",
				Link = "Void Strike",
				Description = "On leaving [[Void Mode]] the next '''1 / 1 / 2 / 4 / 6 / 8''' attacks deal '''5% / 7% / 8% / 10% / 11% / 12%''' additional damage for every second spent cloaked. Cloak consumes '''2''' additional energy per second.",
				School = "Madurai",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000 / 340,454 / 459,411",
				Pool = "1 / 4 / 7 / 10 / 13 / 16",
				Type = "Active"
			},
		--
		--
		--Naramon
		--
		--
			["Affinity Spike"] = {
				Image = "FocusAffinitySpike.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Residual/MeleeXpFocusUpgrade",
				Introduced = "22",
				Name = "Affinity Spike",
				Link = "Affinity Spike",
				Description = "Kills from Melee Attacks grant '''10% / 15% / 20% / 25% / 35% / 45%''' more Melee Affinity.",
				School = "Naramon",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000 / 113,485 / 153,137",
				Pool = "1 / 2 / 3 / 4 / 5 / 6",
			},
		
			["Disarming Blast"] = {
				Image = "FocusDisarmingBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/BlastDisarmFocusUpgrade",
				Introduced = "22",
				Name = "Disarming Blast",
				Link = "Disarming Blast",
				Description = "Enemies hit by [[Void Blast]] have a '''10% / 15% / 20% / 25% / 35% / 50%''' chance to be disarmed.",
				School = "Naramon",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Disorienting Blast"] = {
				Image = "FocusDisorientingBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/BlastConfuseFocusUpgrade",
				Introduced = "22",
				Name = "Disorienting Blast",
				Link = "Disorienting Blast",
				Description = "[[Void Blast]] has a '''20% / 30% / 40% / 50%''' chance of confusing enemies for '''4s / 8s / 12s / 16s''', causing them to be unable to distinguish friend and foe.",
				School = "Naramon",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000",
				Pool = "1 / 2 / 3 / 4",
				Type = "Active"
			},
		
			["Executing Dash"] = {
				Image = "FocusExecutingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/DashFinisherFocusUpgrade",
				Introduced = "22",
				Name = "Executing Dash",
				Link = "Executing Dash",
				Description = "[[Void Dash]] no longer displaces enemies, instead it will open them up to finishers and increase finisher damage taken by '''15% / 20% / 25% / 35%'''.",
				School = "Naramon",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Mind Sprint"] = {
				Image = "FocusMindSprint.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Stats/DashSpeedFocusUpgrade",
				Introduced = "22",
				Name = "Mind Sprint",
				Link = "Mind Sprint",
				Description = "Increases the speed of [[Void Dash]] by '''20% / 40% / 60% / 80% / 100% / 120% / 120%'''.",
				School = "Naramon",
				Type = "Way-Bound Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 9 / 11 / 11",
			},
		
			["Mind Step"] = {
				Image = "FocusMindStep.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Stats/MoveSpeedFocusUpgrade",
				Introduced = "22",
				Name = "Mind Step",
				Link = "Mind Step",
				Description = "Increase the movement speed of the Operator by '''7% / 15% / 22% / 30% / 30%'''.",
				School = "Naramon",
				Type = "Way-Bound Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 7",
			},
		
			["Power Spike"] = {
				Image = "FocusPowerSpike.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Residual/MeleeComboFocusUpgrade",
				Introduced = "22",
				Name = "Power Spike",
				Link = "Power Spike",
				Description = "Melee Combo Counter now decays while out of combat by '''20 / 15 / 10 / 5''' every few seconds, instead of depleting completely.",
				School = "Naramon",
				Type = "Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
			},
		
			["Surging Dash"] = {
				Image = "FocusSurgingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/DashWaveFocusUpgrade",
				Introduced = "22",
				Name = "Surging Dash",
				Link = "Surging Dash",
				Description = "Creates a wave while dashing, increasing the damage by '''5% / 10% / 15% / 20% / 25% / 30%''' and the area of effect around the Operator by '''2m / 4m / 6m / 8m / 10m / 12m'''.",
				School = "Naramon",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Void Hunter"] = {
				Image = "FocusVoidHunter.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/CloakRevealFocusUpgrade",
				Introduced = "22",
				Name = "Void Hunter",
				Link = "Void Hunter",
				Description = "[[Void Mode]] reveals enemies within '''10m / 12m / 18m / 25m''' through walls. This range gradually decreases over '''2s / 3s / 4s / 5s''' when the Operator leaves [[Void Mode]]. This ability costs an additional '''2 / 2 / 1 / 1''' energy per second.",
				School = "Naramon",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Stalker"] = {
				Image = "FocusVoidStalker.png",
				InternalName = "/Lotus/Upgrades/Focus/Tactic/Active/CloakMeleeCritFocusUpgrade",
				Introduced = "22",
				Name = "Void Stalker",
				Link = "Void Stalker",
				Description = "[[Void Mode]] increases Critical Chance of melee attacks by up to '''20% / 30% / 40% / 50%''' over '''5s'''. This chance gradually decreases over '''5s / 10s / 15s / 20s''' when the Operator leaves Void Mode. This ability costs an additional '''1 / 2 / 3 / 4''' energy/s.",
				School = "Naramon",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		--
		--
		--Unairu
		--
		--
			["Basilisk Gaze"] = {
				Image = "FocusBasiliskScalesGaze.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Stats/BlastRadiusFocusUpgrade",
				Introduced = "22",
				Name = "Basilisk Gaze",
				Link = "Basilisk Gaze",
				Description = "Increase the radius of [[Void Blast]] by '''15% / 30% / 45% / 60% / 60%'''.",
				School = "Unairu",
				Unlock = 50000,
				Type = "Way-Bound Passive",
				Rankup = "80,000 / 108,284 / 160,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 7",
			},
		
			["Basilisk Scales"] = {
				Image = "FocusBasiliskScalesGaze.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Stats/ArmourIncreaseFocusUpgrade",
				Introduced = "22",
				Name = "Basilisk Scales",
				Link = "Basilisk Scales",
				Description = "Increase armor for the Operator by ''' 50% / 100% / 150% / 200% / 200%'''.",
				School = "Unairu",
				Unlock = 50000,
				Type = "Way-Bound Passive",
				Rankup = "80,000 / 108,284 / 160,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 7",
			},
		
			["Crippling Dash"] = {
				Image = "FocusCripplingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/DashReduceDamageFocusUpgrade",
				Introduced = "22",
				Name = "Crippling Dash",
				Link = "Crippling Dash",
				Description = "Using [[Void Dash]] through an enemy will reduce their damage by''' 20% / 30% / 40% / 50%'''.",
				School = "Unairu",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Magnetic Blast"] = {
				Image = "FocusMagneticBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/BlastBulletAttractorFocusUpgrade",
				Introduced = "22",
				Name = "Magnetic Blast",
				Link = "Magnetic Blast",
				Description = "Enemies hit by [[Void Blast]] are affected by [[Damage/Void Damage#Status Effects|Magnetize]] for '''4 / 6 / 8 / 10'''s.",
				School = "Unairu",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Stone Skin"] = {
				Image = "FocusStoneSkin.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Residual/ArmourBuffFocusUpgrade",
				Introduced = "22",
				Name = "Stone Skin",
				Link = "Stone Skin",
				Description = "Increase armor for Warframe and operator by '''20 / 30 / 40 / 60'''.",
				School = "Unairu",
				Type = "Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
			},
		
			["Sundering Dash"] = {
				Image = "FocusSunderingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/DashReduceArmourFocusUpgrade",
				Introduced = "22",
				Name = "Sundering Dash",
				Link = "Sundering Dash",
				Description = "Using [[Void Dash]] through an enemy will reduce their armor by '''10% / 20% / 30% / 40% / 50% / 75%'''.",
				School = "Unairu",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000 / 340,454 / 459,411",
				Pool  = "1 / 4 / 7 / 10 / 13 / 16",
				Type = "Active"
			},
		
			["Unairu Wisp"] = {
				Image = "FocusUnairuWisp.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/BlastDamagePickupFocusUpgrade",
				Introduced = "22",
				Name = "Unairu Wisp",
				Link = "Unairu Wisp",
				Description = "[[Void Blast]] has a '''25% / 50% / 75% / 100%''' chance to summon a Wisp when it damages an enemy. The Wisp can be picked up by allies to increase Operator damage by '''20% / 40% / 60% / 100%''' for '''3 / 6 / 9 / 12''' seconds.",
				School = "Unairu",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Void Chrysalis"] = {
				Image = "FocusVoidChrysalis.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/CloakReduceDamageFocusUpgrade",
				Introduced = "22",
				Name = "Void Chrysalis",
				Link = "Void Chrysalis",
				Description = "[[Void Mode]] reduces damage taken by invisible allies within '''10m / 15m / 20m / 25m''' by '''20% / 40% / 60% / 80%'''. This ability costs an additional '''1 / 2 / 3 / 4''' energy/s.",
				School = "Unairu",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Shadow"] = {
				Image = "FocusVoidShadow.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Active/CloakAllyCloakFocusUpgrade",
				Introduced = "22",
				Name = "Void Shadow",
				Link = "Void Shadow",
				Description = "[[Void Mode]] now renders allies within '''10m / 20m / 30m / 40m''' invisible. This ability costs an additional '''1 / 2 / 3 / 4''' energy/s per ally cloaked.",
				School = "Unairu",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Spines"] = {
				Image = "FocusVoidSpines.png",
				InternalName = "/Lotus/Upgrades/Focus/Ward/Residual/ReflectDamageFocusUpgrade",
				Introduced = "22",
				Name = "Void Spines",
				Link = "Void Spines",
				Description = "'''5% / 15% / 25% / 50% / 75% / 100%''' of damage taken is returned to the attacker.",
				School = "Unairu",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
			},
		--
		--
		--Vazarin
		--
		--
			["Enduring Tides"] = {
				Image = "FocusEnduringTides.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Stats/HealthMaxFocusUpgrade",
				Introduced = "22",
				Name = "Enduring Tides",
				Link = "Enduring Tides",
				Description = "Increase health of the Operator by '''25% / 50% / 100% / 150% / 150%'''.",
				School = "Vazarin",
				Type = "Way-Bound Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 7",
			},
		
			["Guardian Blast"] = {
				Image = "FocusGuardianBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/BlastAllyShieldFocusUpgrade",
				Introduced = "22",
				Name = "Guardian Blast",
				Link = "Guardian Blast",
				Description = "[[Void Blast]] consumes 25 energy for each ally hit within '''5m / 6m / 7m / 8m''' and grants them '''50 / 80 / 120 / 160''' shields.",
				School = "Vazarin",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Guardian Shell"] = {
				Image = "FocusGuardianShell.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/BlastSelfShieldFocusUpgrade",
				Introduced = "22",
				Name = "Guardian Shell",
				Link = "Guardian Shell",
				Description = "[[Void Blast]] can be charged to manifest a shield that drains energy for every '''150 / 200 / 250 / 300 / 350 / 400''' damage absorbed.",
				School = "Vazarin",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Mending Soul"] = {
				Image = "FocusMendingSoul.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Residual/InstantReviveFocusUpgrade",
				Introduced = "22",
				Name = "Mending Soul",
				Link = "Mending Soul",
				Description = "The next '''1 / 2 / 3 / 4''' revives are instantaneous.",
				School = "Vazarin",
				Type = "Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
			},
		
			["Mending Unity"] = {
				Image = "FocusMendingUnity.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Residual/RadialXpFocusUpgrade",
				Introduced = "22",
				Name = "Mending Unity",
				Link = "Mending Unity",
				Description = "Increase affinity radius by '''10m / 15m / 20m / 25m'''.",
				School = "Vazarin",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000",
				Pool = "1 / 2 / 3 / 4",
			},
		
			["Protective Dash"] = {
				Image = "FocusProtectiveDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/DashImmunityFocusUpgrade",
				Introduced = "22",
				Name = "Protective Dash",
				Link = "Protective Dash",
				Description = "Allies hit by [[Void Dash]] are granted immunity from damage for '''2s / 3s / 4s / 5s''' and healed '''25% / 35% / 45% / 60%''' over 5s.",
				School = "Vazarin",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Rejuvenating Tides"] = {
				Image = "FocusRejuvenatingTides.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Stats/HealthRegenFocusUpgrade",
				Introduced = "22",
				Name = "Rejuvenating Tides",
				Link = "Rejuvenating Tides",
				Description = "Increase health regeneration of the Operator by '''1 / 2 / 3 / 4 / 4 per second'''.",
				School = "Vazarin",
				Type = "Way-Bound Passive",
				Unlock = 80000,
				Rankup = " 120,000 / 162,426 / 240,000 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 4 / 7 / 10 / 10",
			},
		
			["Sonic Dash"] = {
				Image = "FocusSonicDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/DashShockwaveFocusUpgrade",
				Introduced = "22",
				Name = "Sonic Dash",
				Link = "Sonic Dash",
				Description = "[[Void Dash]] no longer displaces enemies, instead it emits a shockwave '''8m / 10m / 12m / 14m''' wide and travels '''2m / 4m / 6m / 8m''' stunning any enemy it hits.",
				School = "Vazarin",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Void Aegis"] = {
				Image = "FocusVoidAegis.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/CloakShieldFocusUpgrade",
				Introduced = "22",
				Name = "Void Aegis",
				Link = "Void Aegis",
				Description = "[[Void Mode]] creates a shield that grows up to '''5m / 8m / 10m / 12m''' over 5s. This ability costs an additional 2 energy/s.",
				School = "Vazarin",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Void Regen"] = {
				Image = "FocusVoidRegen.png",
				InternalName = "/Lotus/Upgrades/Focus/Defense/Active/CloakHealFocusUpgrade",
				Introduced = "22",
				Name = "Void Regen",
				Link = "Void Regen",
				Description = "[[Void Mode]] heals '''+4 / +8 / +16 / +25''' health/s. This ability costs an additional 2 energy/s.",
				School = "Vazarin",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		--
		--
		--Zenurik
		--
		--
			["Energizing Dash"] = {
				Image = "FocusEnergizingDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/DashBubbleFocusUpgrade",
				Introduced = "22",
				Name = "Energizing Dash",
				Link = "Energizing Dash",
				Description = "[[Void Dash]] creates a zone of energy for '''4 / 4 / 5 / 5 / 6 / 8''' seconds. Allies passing through the zone gain '''3 / 3 / 4 / 4 / 5 / 5''' energy/second for '''10 / 15 / 20 / 22 / 25 / 30''' seconds.",
				School = "Zenurik",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Energy Pulse"] = {
				Image = "FocusEnergyPulse.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Residual/EnergyOverTimeFocusUpgrade",
				Introduced = "22",
				Name = "Energy Pulse",
				Link = "Energy Pulse",
				Description = "Energy pickups grant '''25% / 30% / 35% / 40% / 45% / 50%''' additional energy over '''10 / 9 / 8 / 7 / 6 / 5''' seconds.",
				School = "Zenurik",
				Type = "Passive",
				Unlock = 25000,
				Rankup = "40,000 / 54,142 / 80,000 / 113,485 / 153,137",
				Pool = "1 / 2 / 3 / 4 / 5 / 6",
			},
		
			["Inner Might"] = {
				Image = "FocusInnerMight.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Residual/ChannelEfficiencyFocusUpgrade",
				Introduced = "22",
				Name = "Inner Might",
				Link = "Inner Might",
				Description = "Increase Heavy Attack efficiency by '''10% / 20% / 30% / 40% / 50% / 60%'''.",
				School = "Zenurik",
				Type = "Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
			},
		
			["Lightning Dash"] = {
				Image = "FocusLightningDash.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/DashElectricityFocusUpgrade",
				Introduced = "22",
				Name = "Lightning Dash",
				Link = "Lightning Dash",
				Description = "Manifests ball lightning after a [[Void Dash]] that travels slowly and zaps enemies within '''4 / 8 / 12 / 16''' meters for '''200 / 400 / 600 / 800''' damage. Costs '''10''' energy",
				School = "Zenurik",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Temporal Blast"] = {
				Image = "FocusTemporalBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/BlastSlowFocusUpgrade",
				Introduced = "22",
				Name = "Temporal Blast",
				Link = "Temporal Blast",
				Description = "[[Void Blast]] slows enemies by '''20% / 30% / 40% / 50% / 60% / 80%''' for '''4 / 6 / 8 / 10 / 12 / 15''' seconds.",
				School = "Zenurik",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274",
				Pool = "1 / 3 / 5 / 7 / 9 / 11",
				Type = "Active"
			},
		
			["Void Flow"] = {
				Image = "FocusVoidFlow.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Stats/EnergyPoolFocusUpgrade",
				Introduced = "22",
				Name = "Void Flow",
				Link = "Void Flow",
				Description = "Increase Operator Energy by '''15% / 30% / 45% / 60% / 75% / 90% / 90%'''.",
				School = "Zenurik",
				Type = "Way-Bound Passive",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000 / 340,454 / 459,411 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 4 / 7 / 10 / 13 / 16 / 16",
			},
		
			["Void Singularity"] = {
				Image = "FocusVoidSingularity.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/CloakPullFocusUpgrade",
				Introduced = "22",
				Name = "Void Singularity",
				Link = "Void Singularity",
				Description = "[[Void Mode]] pulls enemies within '''10 / 12 / 15 / 20''' meters towards the Operator, and costs an additional '''2 / 2 / 2 / 2''' energy/second.",
				School = "Zenurik",
				Unlock = 80000,
				Rankup = "120,000 / 162,426 / 240,000",
				Pool = "1 / 4 / 7 / 10",
				Type = "Active"
			},
		
			["Void Siphon"] = {
				Image = "FocusVoidSiphon.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Stats/EnergyRestoreFocusUpgrade",
				Introduced = "22",
				Name = "Void Siphon",
				Link = "Void Siphon",
				Description = "Increase Operator Energy Regeneration by '''15% / 30% / 45% / 60% / 75% / 90% / 90%'''.",
				School = "Zenurik",
				Type = "Way-Bound Passive",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000 / 226,969 / 306,274 / 1,000,000 + 1x [[Brilliant Eidolon Shard]]",
				Pool = "1 / 3 / 5 / 7 / 9 / 11 / 11",
			},
		
			["Void Static"] = {
				Image = "FocusVoidStatic.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/CloakStaticFocusUpgrade",
				Introduced = "22",
				Name = "Void Static",
				Link = "Void Static",
				Description = "[[Void Mode]] emits a pulse that deals '''200 / 300 / 400 / 500''' damage/second over '''8 / 10 / 12 / 15''' meters and costs an additional '''2 / 2 / 2 / 1''' energy/second.",
				School = "Zenurik",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		
			["Voltaic Blast"] = {
				Image = "FocusVoltaicBlast.png",
				InternalName = "/Lotus/Upgrades/Focus/Power/Active/BlastBurstFocusUpgrade",
				Introduced = "22",
				Name = "Voltaic Blast",
				Link = "Voltaic Blast",
				Description = "[[Void Blast]] creates a surge of electricity, zapping enemies within '''4 / 6 / 8 / 10''' meters for '''100% / 125% / 150% / 200%''' damage.",
				School = "Zenurik",
				Unlock = 50000,
				Rankup = "80,000 / 108,284 / 160,000",
				Pool = "1 / 3 / 5 / 7",
				Type = "Active"
			},
		}
	},
}
