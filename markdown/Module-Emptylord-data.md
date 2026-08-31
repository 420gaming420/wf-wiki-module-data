---
title: "Module:Emptylord/data"
wiki_url: "https://wiki.warframe.com/w/Module/Emptylord/data"
wiki_timestamp: "2026-01-22T18:23:22Z"
---

**Data in this module is fictional.**

---

```lua
--

```lua
return {
	["Accord"] = {
		["equip_type"] = "Warframe",
		["official"] = false,
		["icon"] = false,
		["abilities"] = {
			["Center Stage"] = {
				["hotkey"] = 0,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Gleam"] = {
				["hotkey"] = 1,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Quick Step"] = {
				["hotkey"] = 2,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Lovers' Hold"] = {
				["hotkey"] = 3,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Captivate"] = {
				["hotkey"] = 4,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
		},
	},
	["Amesha"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Amesha.png",
		["abilities"] = {
			["Watchful Swarm"] = {
				["hotkey"] = 1,
				["ability_icon"] = "WatchfulSwarm130xWhite.png",
				["augments"] = {
				},
			},
			["Benevolent Decoy"] = {
				["hotkey"] = 2,
				["ability_icon"] = "BenevolentDecoy130xWhite.png",
				["augments"] = {
				},
			},
			["Warding Grace"] = {
				["hotkey"] = 3,
				["ability_icon"] = "WardingGrace130xWhite.png",
				["augments"] = {
				},
			},
			["Wengeful Rush"] = {
				["hotkey"] = 4,
				["ability_icon"] = "WengefulRush130xWhite.png",
				["augments"] = {
				},
			},
		},
	},
	["Ash"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Ash_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Daggertail"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DaggertailMod.png",
						["description"] = "Passively gain {{STR|10 / 15 / 20 / 25m}} range on Finishers and Mercy kills, violently pulling the enemy into melee range before performing the Finisher.",
						["footnote"] = "The displacement would ideally affect enemies that are usually crowd-control-immune, since they must also be exposed to Finishers for this to be applicable. If this is not possible, Ash would freely Teleport to close the gap. In retrospect, Lethal Teleport being integrated into Ash's kit might have rendered this augment moot. Perhaps a general Parazon mod?",
						["volume"] = 7,
						["retired"] = 35,
					},
				},
			},
			["Shuriken"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Shuriken130xWhite.png",
				["exalted"] = "Ability",
				["revised_desc"] = "Casting releases a fan of up to '''2 / 3 / 4 / 5''' shurikens targeting unique enemies within a {{RNG|6m}}-radius. While aiming (default {{Keybind|RMB}}), casting will instead rapidly fire '''2 / 3 / 4 / 5''' homing shurikens towards enemies within 60m and 90{{Degree}} of your crosshair. Each cast generates 20 Ability Combo Points, and each shuriken deals {{STR|125 / 200 / 275 / 350}} Slash damage with forced status that is modified by your Shadow Blades config, and deals up to '''12x''' based on your Ability Combo Multiplier.",
					["revised"] = 35,
					["footnote"] = "

* Shuriken is now an Exalted ability, and can now be modded in your arsenal.
* Base damage reduced to compensate for modding.
* [[#Ability Combo]]* Shurikens no longer generate Melee Combo, and instead generate 20 Ability Combo Points.
  * Damage is now further modified by Ability Combo. Normal cast range is now modified by Range mods.

",
				["augments"] = {
					["Seeking Shuriken"] = {
						["official"] = true,
						["mod_avail"] = "Universal",
						["mod_image"] = "SeekingShurikenMod.png",
						["description"] = "On Hit: Reduce enemy Armor by a stacking {{STR|35 / 45 / 55 / 70%}} for {{DUR|2 / 4 / 6 / 8s.}}",
					},
					["Shadow Shuriken"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ShadowShurikenMod.png",
						["description"] = "Casting additionally summons a stationary, intangible Shadow Assassin that tracks your crosshair and mimics the next '''1 / 2 / 3 / 4''' casts of Shuriken.",
						["volume"] = 22,
					},
					["Shuriken Fan"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ShurikenFanMod.png",
						["description"] = "Unaimed casts gain '''3 / 4 / 5 / 6''' Shurikens and {{RNG|6m}} Ability Range, and Shurikens are now evenly distributed across enemies within range.",
						["volume"] = 22,
					},
				},
			},
			["Smoke Screen"] = {
				["hotkey"] = 2,
				["ability_icon"] = "SmokeScreen130xWhite.png",
				["revised_desc"] = "Casting drops a smoke bomb that staggers enemies within {{RNG|10m}}. For the next {{DUR|3 / 6 / 9 / 12s}}, Ash is invisible, inaudible and moves with soft steps.",
					["revised"] = 28,
					["footnote"] = "[[#Invisibility]] While invisible, Ash's noise level is reduced by 100% and his movement will not be detected.",
				["augments"] = {
					["Rolling Smoke"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RollingSmokeMod.png",
						["description"] = "On Dodge: Transform into smoke for {{RNG|2s}}, also becoming invulnerable and gaining full flight capabilities. As smoke, your movement cannot be detected, you do not have biometrics, you cannot be seen, and you cannot be heard. '''12 / 10 / 8.5 / 7''' second cooldown.",
						["volume"] = 27,
						["restrict"] = "{{m|Rolling Guard}}",
					},
					["Smoke Shadow"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "SmokeShadowMod.png",
						["description"] = "Casting renders allies within {{RNG|8 / 10 / 12 / 15m}} invisible and inaudible, as well as granting everyone '''60 / 90 / 120 / 150%''' Critical Chance while invisible.",
						["revised"] = 28,
					},
					["Tear Gas"] = {
						["official"] = true,
						["mod_avail"] = "Universal",
						["mod_image"] = "TearGasMod.png",
						["description"] = "Casting blinds enemies within {{RNG|3 / 6 / 9 / 12m}} for {{DUR|6s}}, as well as opening them to Finishers. In Conclave, the effect is diminished to blinding enemies within '''1 / 2 / 3 / 4m''' for '''3s'''.",
						["revised"] = 30,
					},
				},
			},
			["Teleport"] = {
				["hotkey"] = 3,
				["ability_icon"] = "Teleport130xWhite.png",
				["revised_desc"] = "Casting teleports you to a target within {{RNG|15 / 30 / 45 / 60m}}. If the target is an enemy, you performs a Finisher or Mercy Kill with {{STR|125 / 150 / 175 / 200%}} bonus Finisher Damage, and will refund 50% of '''Teleport's''' energy cost on-kill.",
				["revised"] = 32,
				["augments"] = {
					["Abduct"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AbductMod.png",
						["description"] = "Hold-cast to appear behind the target, whereafter you grapple them and then teleport you both back to the cast location. Passively gain {{STR|50 / 75 / 125 / 200%}} Finisher Damage.",
						["volume"] = 22,
					},
					["Boundless Teleport"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord BoundlessTeleportMod.png",
						["description"] = "Casting instead teleports you '''8m''' in the target direction. Hold-casting will increase the range to {{RNG|8 / 9 / 10 / 12m}} over {{DUR|0.25s}} and will instead teleport you toward the location in your crosshairs.",
						["volume"] = 27,
					},
					["Cinematic Mode"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord CinematicModeMod.png",
						["description"] = "Targeting an enemy with Death Marks will cause you to enter Cinematic Mode, wherein you will to automatically chain-cast Teleport on additional marked targets at no extra cost. You are invulnerable during Cinematic Mode and gain '''1.25 / 1.33 / 1.5 / 2x''' Finisher Speed.",
						["volume"] = 32,
						["exilus"] = true,
						["footnote"] = "With the integration of Fatal Teleport as a baseline feature in Ash's rework, Cinematic Mode went from opt-in to mandetory - and this can be quite disruptive, especially if you want to use Teleport for positioning or the bonus stats from Teleport Rush. I think that the power fantasy provided by Cinematic Mode is worth retaining, but I think it works better as an opt-in feature. An alternative implementation would be to use Tap/Hold, where hold-cast causes you to enter Cinematic Mode. While held, you could enter a state of focus (reusing Blade Storm's current visual and sound effects) as well as highlighting valid targets."
					},
					["Shadow Step"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ShadowStepMod.png",
						["description"] = "Casting leaves behind an invulnerable Shadow Assassin at your cast location for {{DUR|4 / 5 / 6 / 8s}} that draws enemy fire.",
						["volume"] = 27,
					},
					["Teleport Rush"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "TeleportRushMod.png",
						["description"] = "Casting increases Parkour Velocity by '''15 / 20 / 25 / 30%''' for {{DUR|12s}}. Killing a target with Teleport extends the duration of {{a|Smoke Screen}} by {{DUR|5s}}, increased to a full refresh on Mercy Kills.",
					},
				},
			},
			["Blade Storm"] = {
				["hotkey"] = 4,
				["ability_icon"] = "BladeStorm130xWhite.png",
				["revised_desc"] = "Casting will holster your current weapon and equip your Unseen Blades, an Exalted Secondary Weapon that accepts Thrown mods. Unseen Blades will lock-on to enemies within '''15{{Degree}}''' of your crosshair while Aiming (default {{keybind|RMB}}). Enemies damaged by Unseen Blades will accumulate Death Marks. At '''3''' Death Marks, a Shadow Assassin is called to perform a Finisher on the target, dealing three instances of {{STR|750 / 1000 / 1500 / 2000}} True damage with guaranteed Slash status. Up to '''2''' Shadow Assassins may be active at a time. If deactivated, Shadow Assassins will target any outstanding Death Marks but will deal proportionately less damage.",
				["revised"] = 30,
				["augments"] = {
					["Covert Blades"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord CovertBladesMod.png",
						["description"] = "While active, you will now apply Death Marks with any source of damage. Enemies with 3 Death Marks are instead exposed to Finishers, and performing a Finisher will summon Shadow Assassins to perform Finishers on up to 2 additional enemies within {{RNG|1.5 / 3 / 4.5 / 6m}}. Passively gain {{STR|25 / 50 / 75 / 100%}} Finisher Damage.",
						["footnote"] = "The intent of this augment is to (hopefully) appeal to legacy Ash players who don't like the sound of using a Thrown weapon to apply marks. Combine with Thermal Sunder or some other source of AOE to quickly apply marks to entire groups of enemies - and then start Finishing.",
						["volume"] = 32,
					},
					["Promised End"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PromisedEndMod.png",
						["description"] = "Death Marks instead store {{STR|25 / 33 / 50 / 100%}} of damage the target receives from all sources, doubled for melee damage. Shadow Assassins will be summoned when a Death Mark has stored lethal damage, and will perform a Lethal Finisher.",
						["volume"] = 7,
					},
					["Rising Storm"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord CovertBladesMod.png",
						["description"] = "While active, you will be surrounded by orbiting blades that deal {{STR|100 / 150 / 200 / 250}} Slash damage/s with guaranteed Status to enemies within ➲[1.5m]. Orbiting blades will increment Ash's Melee Combo Counter. The damage from orbiting blades and Shadow Assassins is increased by '''25%''' per Combo Multiplier.",
						["revised"] = 30,
					},
					["Shadow Clones"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ShadowClonesMod.png",
						["description"] = "While active, your Shadow Assassins now accompany you as ranged specters that have {{RNG|12m}} attack range and deal {{STR|25 / 33 / 50 / 100 x Enemy Level}} Slash damage with guaranteed status at a fire rate of '''1.2'''. Unseen Blades no longer applies Death Marks.",
						["volume"] = 32,
					},
				},
			},
			["Shadow Blades"] = {
				["ability_icon"] = "ShadowClones.png",
				["exalted"] = "Secondary",
				["augments"] = {
				},
			},
		},
	},
	["Atlas"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Atlas_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["revised_desc"] = "Passively immune to stagger and knockdown whil in contact with the ground. Petrified enemies may drop Rubble on-death, which you can pick up to to restore Health, with healing in excess of your maximum health being applied as Rubble Armor. Rubble Armor is capped at '''1500''', and decays at a rate of '''5/s'''. You have an innate '''8m''' Rubble-Vacuum radius.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Geological Preparation"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord GeologicalPreparationMod.png",
						["description"] = "Atlas starts the mission with '''250 / 350 / 500 / 1000''' Rubble Armor. Rubble Armor no longer decays passively, and instead is depleted by '''5''' whenever you receive damage, up to once/s.",
						["volume"] = 32,
						["exilus"] = true,
						["restrict"] = "{{m|Preparation}}",
					},
					["Geosynchronous"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord GeosynchronousMod.png",
						["description"] = "Passive immunity is now always effective, even while airborne. In addition, Atlas has a '''25 / 33 / 50 / 100%''' chance to resist any external source of displacement or immobilizing effect.",
						["volume"] = 33,
						["exilus"] = true,
					},
					["Rubble Heap"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "RubbleHeaphMod.png",
						["description"] = "While above 1200 Rubble, Landslide costs no Energy, deals '''1.25 / 1.5 / 1.75 / 2x''' Damage, and travels 2x faster.",
						["revised"] = "Not Recorded",
						["footnote"] = "Threshold reduced to 1200 from 1400."
					},
					["Seismic Scavanger"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SeismicScavangerMod.png",
						["description"] = "While you are in a mission, all resource deposits and storage containers will now yield 1 Rubble. Landslide will now damage destructable objects. Landslide may also target lockers to break them open, yielding 1 Rubble. This has a '''25 / 50 / 75 / 100%''' chance to unlock locked lockers.",
						["volume"] = 27,
						["revised"] = 35,
						["footnote"] = "Bonus Rubble from deposits and containers used to be part of Landslide's '''Land's End''' augment, but I decided to separate the two effects. The name 'Seismic Scavenger' was proposed by MarakViri for the combined mod, which was previously known as 'Reduce and Reuse'. This portion of the effect is now a Passive augment, and has gained an interaction with lockers. I opted to create the name 'Land's End' for the newly separated Finisher effect.",
						["credit"] = "MarakViri (Warframe)",
					},
					["Worked Quarry"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord WorkedQuarryMod.png",
						["description"] = "Casting Tectonics or Rumblers will now fracture the ground beneath you over a {{RNG|3 / 7 / 11 / 15m}}-radius area. You can maintain up to 3 quarries. You and your squadmates will receive {{STR|3}} Energy Regen/s while stood within a quarry, while enemies are slowed by 30%, and have a {{STR|15 / 21 / 27 / 33}}% chance to stagger when receiving physical damage.",
						["volume"] = 22,
					},
				},
			},
			["Landslide"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Landslide130xWhite.png",
				["exalted"] = "Ability",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Land's End"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FinisherMod.png",
						["description"] = "Targeting an enemy that is vulnerable to Finishers will cause Landslide to deal {{STR|1.5 / 2 / 2.5 / 3x}} Damage, with Atlas instead leaping into the air and pummelling the target into the ground. On Finisher kill with Landslide: generate 1 Rubble.",
						["volume"] = 27,
						["revised"] = 35,
						["footnote"] = "Bonus Rubble from deposits and containers has been moved to its own Passive augment. Reworded to say that the effect occurs when targeting an enemy that is vulnerable to Finishers, rather than saying that the ability is capable of performing Finishers. Added flavour-text to describe the animation. Given the new name 'Land's End', with 'Seismic Scavanger' being retained by the newly separated Passive augment.",
					},
					["Meteor Punch"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord MeteorPunchMod.png",
						["description"] = "Casting while airborne and aiming down will cause you to perform a Heavy Slam Attack, deal 3x Heavy Damage, as well as gaining {{STR|100 / 200 / 300 / 400%}} Blast Status Chance and knocking down enemies. For every meter travelled toward the ground, Landslide will also gain 10% impact radius. You can cast Landslide in this way without an enemy target.",
						["volume"] = 34,
					},
					["Worldbreaker"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord WorldbreakerMod.png",
						["description"] = "Hold-cast to charge your next Landslide, generating '''20''' Ability Combo Points/s and increasing the targeting range by {{RNG|6 / 7.5 / 10.5 / 15m}} over '''3{{divided by}}{{DUR|1}}s'''. Release to charge forward, applying the effects of Landslide to all enemies in your path.",
						["volume"] = 22,
					},
				},
			},
			["Tectonics"] = {
				["hotkey"] = 2,
				["ability_icon"] = "Tectonics130xWhite.png",
				["revised_desc"] = "Casting summons a bulwark with high targeting priority from the ground with Health equal to {{STR|600 / 900 / 1200 / 1500}} plus {{STR|5x}} Total Armor, which is further increased by all damage mitigated during an initial {{DUR|1 / 2 / 3 / 4s}} of invulnerability. The bulwark will intercept all incoming attacks, and provides cover against area of effect. {{STR|100%}} of damage received by the bulwark is propogated to enemies within {{RNG|?m}} as Slash damage. Recasting will direct the bulwark to slide up to {{RNG|30m}} toward the location in your crosshair, collecting all enemies in its path and dealing them {{STR|150 / 300 / 450 / 600}} Impact damage/s. Upon collision with a vertical surface or upon reaching the designated location, the bulwark will explode, dealing {{STR|250 / 300 / 350 / 500}} Puncture Damage within a {{RNG|3 / 3 / 4 / 5m}}-radius. Hold-casting will skip deploying the bulwark, as well as exploding any existing bulwarks where they stand.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Boulder Toss"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord BoulderTossMod.png",
						["description"] = "Hold-cast is now a channelled ability that extends Tectonic's invulnerability window to Atlas himself while he carries the boulder, storing '''25 / 50 / 75 / 100%''' of damage negated as additional Puncture Damage on the Boulder's explosion. Upon release, Atlas now throws the boulder with an arcing trajectory to the target location that explodes as normal on impact, also removing enemy armor equal to {{STR|10 / 15 / 20 / 25%}} of the damage dealt.",
						["volume"] = 27,
						["revised"] = 30,
						["credit"] = "AtlasIsMyBabe (Reddit)",
					},
					["Heavy Elements"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord HeavyBoulderMod.png",
						["description"] = "Recasting Tectonics now registers as a Heavy Attack, consuming '''100 / 75 / 50 / 25%''' of Landslide's Ability Combo Multiplier to deal 3x Heavy Damage, which is further modified by your Ability Combo Multiplier.",
						["volume"] = 34,
					},
					["Hungry Earth"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord HungryEarthMod.png",
						["description"] = "Tap-casts instead soften the ground within a {{RNG|10 / 13 / 16 / 19m}}-radius, sinking enemies into the ground and rendering them immobile for {{DUR|4 / 8 / 12 / 16s}}. Their allies may stop and attempt to pull them free. Hold-casts are unmodified.",
						["volume"] = 27,
					},
					["Immovable Object"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ImmovableObjectMod.png",
						["description"] = "Tap-casts instead grant Overguard equal to '''20 / 30 / 40 / 50'''% of the total health a Bulwark would gain. Recasts will stack the Overguard, with the total not exceeding {{STR|15,000}}. Hold-cast are unmodified.",
						["volume"] = 32,
						["credit"] = "MarakViri (Warframe)",
						["coop"] = "Impasse",
					},
					["Sailing Stones"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ImmovableObjectMod.png",
						["description"] = "When recast, the Bulwark will not explode and will instead persist at its new location. Directing the Bulwark into a wall will deal Impact Damage that is increased by '''25 / 33 / 50 / 100%''' per enemy being carried.",
						["volume"] = 35,
						["footnote"] = "After completing Banshee and Frost's sections, I'm wondering if the damage from impacting geometry should be a percentage of maximum health - as that seems to be the standard for impact-against-terrain damage."
					},
					["Stonecutter"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord StonecutterMod.png",
						["description"] = "Recasting will no longer reposition the Bulwark, and instead loose a shard from the bulwark toward your crosshair, depleting '''10% + {{STR|150 / 250 / 400 / 600}}''' of the bulwark's health to deal the same amount as Impact damage on-hit and as Puncture Damage in a {{RNG|3 / 3 / 4 / 5m}}-radius area.",
						["volume"] = 22,
						["revised"] = 35,
						["footnote"] = "Hold-casting to detonate your current bulwark has been moved to a baseline effect.",
					},
					["Tectonic Detainment"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord TectonicDetainmentMod.png",
						["description"] = "Casting now erects a {{RNG|14x14 / 16x16 / 18x18 / 20x20m}} perimeter wall with Atlas at its center, before compressing the walls together. Enemies hit will be collected and dropped at his feet, dealing Tectonic's Puncture damage to all nearby enemies per enemy displaced. ",
						["volume"] = 34,
						["coop"] = "Detainment",
					},
					["Tectonic Force"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord TectonicForceMod.png",
						["description"] = "Targeting a bulwark with Landslide will cause it to shatter, sending shrapnel forward in a '''35 / 50 / 55 / 80{{Degree}}''' conical area with a maximum range of {{RNG|15 / 20 / 25 / 30m}}. Enemies hit by the shrapnel take Puncture Damage equal to {{STR|10%}} of the bulwark's remaining health, scaling with Ability Combo Multiplier, and have a '''15 / 21 / 27 / 33%''' chance to drop Rubble if killed.",
						["volume"] = 22,
					},
					["Tectonic Fracture"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "TectonicFractureMod.png",
						["description"] = "Casting now deals {{STR|200 / 300 / 400 / 500}} Blast Damage to enemies within a {{RNG|2 / 3 / 4 / 5m}}-radius of the bulwark. Hold-casting will now deploy the bulwark from the surface in your crosshairs, up to a maximum range of {{RNG|20 / 30 / 40 / 50m}}. You can now maintain up to '''3''' Bulwarks, but it is no longer possible to trigger the recast effect.",
						["revised"] = "Not Recorded",
						["footnote"] = "In addition to its original effects, this augment now also applies damage in an area around the bulwark and allows you to summon the bulwarks at range.",
					},
					["Terrestrial Burden"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord TerrestrialBurdenMod.png",
						["description"] = "Casting now reverses the direction of gravity for all enemies within a {{RNG|5 / 10 / 15 / 20m}}-radius for '''2s'''. Hold-casting now drain {{EFF|12.5/s}} to reverse the direction of gravity on yourself until the ability is released.",
						["volume"] = 22,
						["revised"] = 30,
					},
				},
			},
			["Petrify"] = {
				["hotkey"] = 3,
				["ability_icon"] = "Petrify130xWhite.png",
				["revised_desc"] = "Casting will Petrify all enemies within a '''60{{Degree}}''' field-of-view, up to {{RNG|10 / 11 / 12 / 14m}}, for {{DUR|5 / 10 / 15 / 20s}}. Petrified enemies are '''100%''' more vulnerable to damage, are guaranteed to be dismembered if slain by Physical or Blast damage, and have a {{STR|10 / 15 / 20 / 25%}} chance to drop additional loot on-kill.",
				["revised"] = 34,
				["augments"] = {
					["Faultline"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FaultlineMod.png",
						["description"] = "Petrified enemies are scanned into your Codex. Petrified enemies with a completed codex entry are {{STR|25 / 33 / 50 / 100%}} more vulnerable to damage.",
						["volume"] = 26,
						["revised"] = 34,
					},
					["Gorgon's Gaze"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Gorgon'sGazeMod.png",
						["description"] = "Hold-cast to channel this ability, draining {{EFF|3}}/s and limiting your movement to '''35 / 40 / 45 / 50%''' speed and dodge maneuvers. Your other actions are not restricted while channeling Tectonics.",
						["volume"] = 28,
						["revised"] = 34,
					},
					["Ore Gaze"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "OreGazeMod.png",
						["description"] = "Ore and Gem Veins hit by Petrify have a {{STR|20 / 25 / 33 / 50%}} chance to be Auto-Prospected.",
						["revised"] = "Not Recorded",
						["footnote"] = "Bonus loot is now a baseline feature. Codex scanning has been moved to '''Faultline'''. This is a novel effect based around the name, '''Ore Gaze'''.",
					},
					["Path of Statues"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "PathofStatuesMod.png",
						["description"] = "Casting Petrify will cause you to leave a trail in your wake for {{RNG|7 / 8 / 10 / 12s}} that lingers for {{DUR|3 / 4 / 5 / 6s}} and petrifies enemies on-contact for {{DUR|4 / 5 / 6 / 7s.}}",
						["revised"] = "Not Recorded",
						["footnote"] = "Previously a Landslide augment that created a trail when casting Landslide. The effect now occurs when casting Petrify, but is still effective during Landslide.",
					},
				},
			},
			["Rumblers"] = {
				["hotkey"] = 4,
				["ability_icon"] = "Rumblers130xWhite.png",
				["revised_desc"] = "Casting summons two Rumblers for {{DUR|15 / 20 / 30 / 45s}}, also Petrifying all enemies within {{RNG|3 / 4 / 5 / 6m}} for {{DUR|10s}}. Rumblers have {{STR|360}} Health and {{STR|150}} Armor, which are each increased by '''4% x Enemy Level'''. Rumblers deal {{STR|800 / 1000 / 1400 / 2000}} Impact damage on their melee attacks, and {{STR|200 / 250 / 350 / 500}} Impact damage with a ranged boulder attack, which are both modified by the config on your Landslide Fists. Casting Petrify will direct Rumblers to use their boulder attack '''once''' toward petrified enemies. Rumblers each generate their Attack Combo Multiplier, stacking up to 6x Damage. Collecting Rubble will extend the lifespan of active Rumblers by '''1 / 1.5 / 2 / 3s'''. The remaining duration cannot exceed the maximum duration.",
				["revised"] = 34,
				["augments"] = {
					["Faceted Fists"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FacetedFistsMod.png",
						["description"] = "Rumblers gain up to '''25 / 35 / 45 / 55%''' Attack Speed based on their Melee Combo Multiplier. Consecutive Rumbler attacks within 1s now occur in a sequence of left fist, right fist and ground slam. The ground slam can target an enemy up to 8m away and creates a shockwave that deals 2x damage to all enemies 15m line.",
						["volume"] = 29,
						["revised"] = 35,
						["footnote"] = "Renamed (previously 'Rock 'em, Sock'em)."
					},
					["Rock Slide"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RockSlideMod.png",
						["description"] = "Rumblers gain '''6 / 9 / 12 / 15m''' Melee Attraction Range on a '''3''' cooldown.",
						["volume"] = 34,
						["exilus"] = true,
					},
					["Rowdy Rumblers"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RowdyRumblersMod.png",
						["description"] = "Collecting Rubble will now also heal your Rumblers, with healing in excess of their maximum health being converted into their own reserve of Rubble Armor. Healing from Rubble is increased to {{STR|30 / 60 / 90 / 120}}, and maximum Rubble Armor increased to '''1750 / 2000 / 2500 / 3000'''.",
						["volume"] = 32,
					},
					["Rubble Rousers"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RubbleRousersMod.png",
						["description"] = "Casting now costs 500 Rubble Armor to summon a single Rumbler, which now lasts indefinitely. You can hold-cast to channel a further '''25 / 50 / 75 / 100''' Rubble Armor per second, up '''250 / 500 / 750 / 1000''', to grant your Rumbler bonus Armor equal to '''3x''' the additional Rubble Armor expended. You can have up to '''1 / 2 / 3 / 4''' Rumblers active at a time.",
						["volume"] = 32,
					},
					["Rumbled"] = {
						["official"] = true,
						["mod_avail"] = "Universal",
						["mod_image"] = "RumbledMod.png",
						["description"] = "Casting now transforms you into a Rumbler. As a Rumbler, your arsenal is unavailable and your parkour is limited to Dodge maneuvers. You may still cast your abilities, and your [Melee] hotkey will cast Landslide. [Primary Fire] will hurl a boulder that deals Landslide's damage and generates Ability Combo Points. Aim to bring up a targeting reticle. Your Rumbler form has {{STR|200 / 225 / 250 / 300%}} Health, and you gain Overguard equal to damage mitigated by an initial '''1 / 2 / 3 / 4s''' of invulnerability with no Overguard Cap. If you take Letahl Damage, you will revert to your normal form with '''10 / 15 / 20 / 25%''' health.",
						["footnote"] = "You can now perform Dodge maneuvers. Now has a separate health bar that will protect you from lethal damage. Primary Fire now respects the automatic fire mode accessibility setting.",
						["revised"] = "Not Recorded",
					},
					["Stone Slingers"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord StoneSlingersMod.png",
						["description"] = "Casting instead summons 3 Stone Slingers that hurl rocks every 2.5s, dealing {{STR|200 / 275 / 350 / 500}} Impact Damage. The rocks have a 25% chance to break into Rubble. While active, you can hold-cast to drain {{EFF|25}} energy and entice your Slingers to each launch an explosive boulder toward your crosshair, dealing {{STR|500 / 750 / 1000 / 1250}} Blast Damage in a {{RNG|2 / 3 / 5 / 7m}} radius. Stone Slinger damage is modified by Ability Combo Multiplier.",
						["volume"] = 27,
						["revised"] = 34,
					},
					["Stoneborn Subjugation"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord StonebornSubjugationMod.png",
						["description"] = "Casting instead subjugates petrified enemies within {{RNG|3 / 6 / 9 / 12m}}. Subjugated enemies will seek out the nearest non-subjugated enemy within '''50m''' and have a speed modifer of {{RNG|1.5}}. When killed, or after {{RNG|4}}s, subjugated enemies will explode, dealing {{STR|375 / 750 / 1125 / 1500}} Blast Damage in a 6m radius and have a 50% Rubble drop chance.",
						["volume"] = 27,
						["credit"] = "AtlasIsMyBabe (Reddit)",
					},
					["Titanic Rumbler"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "TitanicRumblerMod.png",
						["description"] = "Casting now creates a single Rumbler with {{STR|200 / 225 / 265 / 300%}} Health and {{STR|200 / 250 / 300 / 400%}} Damage. Re-cast to command your Rumbler to slam the ground, dealing {{STR|200 / 300 / 400 / 500}} damage to enemies within {{RNG|15m}} and knocking them down.",
					},
				},
			},
		},
	},
	["Banshee"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Banshee_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Acoustic Resonance"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AcousticResonanceMod.png",
						["description"] = "Alarming damaging effects are no longer silenced, but deal up to '''10 / 15 / 25 / 50'''% increased damage based on the proximity to the source of the noise, applying the full bonus within 3m and falling-off over 12m. Sonic Boom and Sound Quake are Alarming.",
						["volume"] = 8,
					},
					["Skull Rupture"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SkullRuptureMod.png",
						["description"] = "Alarming damaging effects are no longer silenced, instead your Alarming damaging effects have a '''25 / 33 / 50 / 100%''' chance to Stagger enemies the first time you damage them.",
						["volume"] = 8,
					},
				},
			},
			["Sonic Boom"] = {
				["hotkey"] = 1,
				["ability_icon"] = "SonicBoom130xWhite.png",
				["revised_desc"] = "Casting unleashes a blast that deals {{STR|100 / 200 / 300 / 400}} Blast Damage to enemies within a '''180{{Degree}}''' by {{RNG|10 / 12 / 13 / 15m}} conical area, and ragdolling them to the edge of the blast. Enemies who are shoved into geometry take an additional {{STR|15 / 25 / 35 / 45%}} of their maximum health as True Damage. Sonic Boom has {{STR|33 / 50 / 100 / 200%}} Impact Status chance.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Sonic Fracture"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "Reduces the Armor of enemies hit by {{STR|30 / 45 / 55 / 70%}}.",
					},
					["Sonic Wraith"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "Casting instead transforms you into a wave of sonic force that travels up to {{RNG|9 / 10 / 12 / 15m}} in the target direction, applying the effects of Sonic Boom to enemies you pass through. You can hold the ability to automatically recast.",
						["volume"] = 8,
						["exilus"] = true,
					},
				},
			},
			["Sonar"] = {
				["hotkey"] = 2,
				["ability_icon"] = "Sonar130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Resonance"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "On Weakpoint kill versus an enemy revealed by Sonar will trigger another Sonar for {{DUR|50 / 65 / 80 / 100%}} of remaining duration.",
					},
					["Seeking Sonar"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SeekingSonarMod.png",
						["description"] = "Sonar will now highlight rare items for {{DUR|2 / 2.5 / 3.5 / 5s}}.",
						["volume"] = 32,
					},
					["Sonic Harmony"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicHarmonyMod.png",
						["description"] = "Casting will now highlight a genuine Weak Point on affected enemies. Attacks against Weak Points revealed by Sonar have a {{STR|10 / 15 / 20 / 25}}% final Critical Chance modifier. Additional Sonars will enlarge the Weak Point.",
						["volume"] = 23,
						["revised"] = 34,
						["set"] = "Harmonic",
					},
				},
			},
			["Silence"] = {
				["hotkey"] = 3,
				["ability_icon"] = "Silence130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Sonic Fracture"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "While Silence is active, enemies are {{STR|150 / 200 / 250 / 300}}% more vulnerable Weakpoint hits and Finishers.",
						["revised"] = "Not Recorded",
					},
				},
			},
			["Sound Quake"] = {
				["hotkey"] = 4,
				["ability_icon"] = "SoundQuake130xWhite.png",
				["revised_desc"] = "Channel untrasonic reverberations that deals {{STR|125 / 150 / 175 / 200}} Blast Damage/s to enemies within an unobstructed {{RNG|12 / 15 / 18 / 20m}}-radius. Generates 20 Ability Combo Points/s, which modifies the damage up to '''12x.'''",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Banshee's Wail"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Banshee'sWailMod.png",
						["description"] = "You are no longer rooted in place, instead moving at '''65 / 60 / 55 / 50%''' speed. Enemies directly impacted by the soundwaves become enchanted, rendering them harmless and luring them closer. This now does increasing damage, up to 2000% damage at the epicenter.",
						["volume"] = 8,
					},
					["Concussive Waves"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ConcussiveWavesMod.png",
						["description"] = "Sound Quake now has 100% Blast Status Chance and deals an additional '''20 / 25 / 33 / 50%''' damage for each stack of Blast Damage on the target.",
						["volume"] = 29,
						["credit"] = "TheKengineer (YouTube)",
					},
					["Fracturing Waves"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FracturingWavesMod.png",
						["description"] = "Sound Quake will now deal {{STR|20 / 25 / 33 / 50%}} bonus damage to shields and will reduce enemy armor by {{STR|20 / 25 / 33 / 50%}} of the damage it deals to their health.",
						["volume"] = 30,
					},
					["Resonating Quake"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "Casting instead creates a single shockwave that expands outward at '''17.5m/s''' to '''1.25 / 1.5 / 1.6 / 1.75x''' base range, dealing '''10 / 12 / 15 / 20x''' Sound Quake's damage at its epicenter that falls-off steeply down to 33% damage at maximum range.",
					},
				},
			},
		},
	},
	["Baruuk"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Baruuk_Thumb.png",
		["abilities"] = {
			["Restraint"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Acolyte of Air"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Acolyteof AirMod.png",
						["description"] = "Passively gain {{STR|50%}} Bullet Jump Velocity and +1 Jump Reset. Performing the extra jump will deploy a hang glider that slows your fall speed. Erode '''0.4 / 0.8 / 1.2 / 1.6%''' Restraint per meter travelled while gliding. Using your hang glider is a two-handed action.",
						["volume"] = 4,
						["revised"] = 32,
						["exilus"] = true,
						["set"] = "Kalarupa",
					},
				},
			},
			["Elude"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Elude130xWhite.png",
				["revised_desc"] = "Channel to gain '''100%''' Dodge Chance in a {{RNG|120 / 130 / 150 / 180{{Degree}}}} field-of-view in the direction of aim. Attacking will render you vulnerable for '''0.2s'''.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Acolyte of Earth"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Acolyteof EarthMod.png",
						["description"] = "Casting instead grants you '''100%''' Dodge Chance while your feet are on the ground. Becoming airborne will render you vulnerable for '''0.5s'''. While grounded, Elude also provides '''5 / 10 / 15 / 20%''' Status Immunity per second, stacking up to 5 times, and decaying at the same rate if not grounded.",
						["volume"] = 4,
						["revised"] = 32,
						["exilus"] = true,
						["set"] = "Kalarupa",
					},
					["Elusive Retribution"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "Evading attacks will increase Baruuk's Melee Attack Speed and Melee Critical Damage by {{STR|5%}} for {{DUR|6s}}, stacking up to '''3 / 4 / 5 / 6''' times. Stacks will decay one at a time.",
					},
					["Pristine Chassis"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PristineChassisMod.png",
						["description"] = "Hold-cast to empower Elude, generating {{EFF|20%}} to redirect all projectiles that pass through you towards an ally within Affinity Range and healing them for {{STR|5 / 10 / 15 / 20}}% of weapon damage.",
						["volume"] = 26,
						["revised"] = 32,
						["set"] = "Pristine",
					},
				},
			},
			["Lull"] = {
				["hotkey"] = 2,
				["ability_icon"] = "Lull130xWhite.png",
				["revised_desc"] = "Casting creates a {{RNG|10 / 15 / 20 / 25m}}-radius calming zone that lingerss for {{DUR|2 / 3 / 4 / 5s}}. Enemies who enter the zone will fall asleep for {{DUR|10 / 13 / 18 / 20s}} after a '''1s'''-delay, during which they are increasingly slowed. Sleeping enemies are exposed to Finishers and gain +100% Vulnerability to Finishers, forget their previous alert level, and will wake if they receive in excess of 50% of their current health in damage. You erode '''0.8%''' Restraint per enemy lulled to sleep.",
				["augments"] = {
					["Acolyte of Spirit"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Acolyteof SpiritMod.png",
						["description"] = "Hold-cast to instead enrage enemies within range, generating {{EFF|10%}} Restraint to cause them to fight each other. Enraged enemies will take {{STR|20 / 30 / 40 / 50 x Enemy Level}} True Damage each time they attack.",
						["volume"] = 4,
						["revised"] = 32,
						["set"] = "Kalarupa",
					},
					["Endless Lullaby"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "On Finisher or Kill against a sleeping enemies will re-cast Lull for 100% of the remaining duration. Passively gain '''25 / 50 / 75 / 100%''' Lull duration.",
					},
					["Pristine Neuroptics"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PristineNeuropticsMod.png",
						["description"] = "Hold-cast to empower Lull, generating {{EFF|20%}} Restraint to cause {{STR|20 / 25 / 33 / 50%}} of damage received by sleeping enemies to bypass their armor and shields.",
						["volume"] = 26,
						["set"] = "Pristine",
					},
					["Stay and Listen"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Stayand ListenMod.png",
						["description"] = "Casting now affect all enemies within your field of view, up to a maximum distance of {{RNG|20 / 40 /60 / 80}} meters. Hold-cast to channel with an upkeep cost of {{EFF|3}}/s, reducing your mobility to '''35 / 40 / 45 / 50%''' speed and dodge maneuvers. While channelling, enemies within your line of sight cannot be awoken and damage they receive is adapted to their weaknesses.",
						["volume"] = 26,
					},
				},
			},
			["Desolate Hands"] = {
				["hotkey"] = 3,
				["ability_icon"] = "DesolateHands130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Acolyte of Water"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Acolyteof WaterMod.png",
						["description"] = "Casting instead surrounds you with a ring of water for {{DUR|20s}}. Baruuk's projectile attacks are frozen, gaining {{STR|20 / 24 / 26 / 30%}} bonus Cold damage with a guaranteed Cold Status Chance. Frozen projectiles that hit a Weak Point erode '''1.6%''' Restraint.",
						["volume"] = 4,
						["revised"] = 32,
						["set"] = "Kalarupa",
					},
					["Astral Transference"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AstralTransferenceMod.png",
						["description"] = "Casting projects an invulnerable avatar of yourself at the target location and assumes direct control, leaving Baruuk's mortal form immobile and vulnerable. During Astral Transference, you will use your Exalted Weapon and your attacks will heal allies hit for {{STR|2 / 3 / 4 / 5%}} of the damage values.",
						["volume"] = 26,
					},
					["Pristine Systems"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PristineSystemsMod.png",
						["description"] = "Hold-cast to empower Desolate Hands, generating {{EFF|20%}} Restraint to immediately launch empowered daggers that are evenly distributed among all enemies in your line of sight, up to a maximum distance of {{RNG|20 / 40 /60 / 80m}}. Empowered daggers deal an additional {{STR|25 / 50 / 75 / 100%}} damage.",
						["volume"] = 26,
						["revised"] = 32,
						["set"] = "Pristine",
					},
				},
			},
			["Serene Storm"] = {
				["hotkey"] = 4,
				["ability_icon"] = "SereneStorm130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Acolyte of Fire"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Acolyteof FireMod.png",
						["description"] = "Casting now equips Crackling Lightning, an Exalted Primary weapon that replaces Desert Wind. Hold Primary Fire to unleash lightning that arcs to multiple enemies. Generates '''1.4 / 1.2 / 1.0 / 0.8%''' Restraint per second.",
						["volume"] = 4,
						["revised"] = 32,
						["exilus"] = true,
						["set"] = "Kalarupa",
					},
					["Meditative Preparation"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord MeditativePreparationMod.png",
						["description"] = "Baruuk begins a mission with '''25 / 33 / 50 / 100%''' of his Restraint eroded.",
						["volume"] = 30,
						["restrict"] = "{{m|Preparation}}",
					},
					["Reactive Storm"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "Desert Wind is granted {{STR|100 / 150 / 200 / 250%}} Status Chance, and its base physical damage is adapted to the enemy's faction weakness.",
					},
					["Tempered Storm"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord TemperedStormMod.png",
						["description"] = "Serene Storm is no longer disabled when your Restraint is full. Instead, while full, Desert Wind will deal only '''20 / 25 / 33 / 50%''' damage and drains {{EFF|0.4}}/s, increased by a further {{EFF|0.4}} for every second your Restraint goes unchecked.",
						["volume"] = 29,
						["credit"] = "TheKengineer (YouTube)",
					},
				},
			},
			["Desert Wind"] = {
				["ability_icon"] = "DesertWind.png",
				["exalted"] = "Melee",
				["augments"] = {
				},
			},
		},
	},
	["Bonewidow"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Bonewidow.png",
		["abilities"] = {
			["Meathook"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Meathook130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Hook Line"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting now launches your Meat Hook up to {{RNG|10 / 15 / 20 / 25m}} in the target direction, pulling yourself toward the first enemy or surface hit, and dealing Meat Hook's damage to all enemies within a {{RNG|5m}}-radius on-impact.",
						["volume"] = "Not Recorded",
					},
					["Meat Grinder"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting now launches your Meat Hook up to {{RNG|25 / 40 / 60 / 75m}} in the target direction, grabbing and reeling-in the first enemy hit.",
						["volume"] = "Not Recorded",
					},
					["Meat Juicer"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "You will drain your hook victim's health to cover your ability costs at '''5 / 4 / 3 / 2''' health per 1 energy.",
						["volume"] = "Not Recorded",
					},
					["Walkies"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting now launches your Meat Hook up to {{RNG|10 / 15 / 20 / 25m}} in the target direction, permanently silencing them and preventing them from being any further away.",
						["volume"] = "Not Recorded",
					},
				},
			},
			["Shield Maiden"] = {
				["hotkey"] = 2,
				["ability_icon"] = "ShieldMaiden130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Meat Shield"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting or recasting while an enemy is on your '''Meat Hook''' will deal them lethal damage and add {{STR|0.5 / 0.75 / 1.0 / 1.5x}} their maximum health to Shield Maiden's shield value.",
						["volume"] = "Not Recorded",
					},
				},
			},
			["Firing Line"] = {
				["hotkey"] = 3,
				["ability_icon"] = "FiringLine130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Infiltration Protocol"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting instead performs a Codex Scan on each enemy hit. Versus enemies whose Codex Entry is completed, you will hijack their senses and render them incapable of registering the Tenno faction as a threat for {{DUR|5 / 10 / 15 / 20s}}.",
						["volume"] = "Not Recorded",
					},
					["Siphoning Line"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting now siphons {{STR|20 / 25 / 33 / 50%%}} of her maximum health from each enemy hit, inflicted as true damage..",
						["volume"] = "Not Recorded",
					},
				},
			},
			["Exalted Ironbride"] = {
				["hotkey"] = 4,
				["ability_icon"] = "ExaltedIronbride130xWhite.png",
				["augments"] = {
				},
			},
		},
	},
	["Burnscar"] = {
		["equip_type"] = "Warframe",
		["official"] = false,
		["icon"] = false,
		["abilities"] = {
			["Recursion Grenade"] = {
				["hotkey"] = 1,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Rocket Grapple"] = {
				["hotkey"] = 2,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Shrapnel Field"] = {
				["hotkey"] = 3,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
			["Sniper Mode"] = {
				["hotkey"] = 4,
				["ability_icon"] = false,
				["augments"] = {
				},
			},
		},
	},
	["Caliban"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Caliban_Thumb.png",
		["abilities"] = {
			["Adaptive Armor"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["revised_desc"] = "When Damaged: Gain '''5%''' Resistance to the dominant Damage Type, stacking up to '''90%'''. After '''5s''' without receiving damage, Adaptive Armor will decay at a rate of '''5%/s'''.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Counteroffensive"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord CounteroffensiveMod.png",
						["description"] = "Your weapons deal additionals hits of damage based on your current '''1 / 2 / 3 / 4''' highest Adaptive Armor values.",
						["volume"] = 30,
						["revised"] = 35,
						["footnote"] = "Added a maximum number of additional hits based on the mod's rank.",
					},
					["Jumpstart Shields"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord JumpstartShieldsMod.png",
						["description"] = "Your Bullet Jumps restore 15 Shields and jumpstarts shield regeneration. '''20 / 25 / 33 / 50%''' Parkour Velocity.",
						["volume"] = 29,
						["exilus"] = true,
						["credit"] = "TheKengineer (YouTube)",
					},
					["Manifold Aura"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ManifoldAuraMod.png",
						["description"] = "Your allies within Affinity Range will benefit from Adaptive Armor, up to 50% Damage Reduction. Additionally, Caliban and his allies within Affinity Range will benefit from Adaptation-Link, causing them to damage received by any linked ally to increment the current Adaptive Armor values for all other linked allies.",
						["volume"] = 26,
						["aura"] = true,
					},
				},
			},
			["Razor Gyro"] = {
				["hotkey"] = 1,
				["ability_icon"] = "RazorGyre130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Razor Step"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RazorStepMod.png",
						["description"] = "Razor Gyro now uses Hybrid Casting. On Tap: Become invulnerable for 0.25s, also gaining a burst of forward momentum and cleansing status effects. Deal one instance of Razor Gyro's damage to nearby enemies. While Held: Maintain Razor Gyro.",
						["volume"] = 34,
						["restrict"] = "{{m|Rolling Guard}}",
					},
					["Razor Storm"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RazorStormMod.png",
						["description"] = "Casting additionally causes your active Conculysts to begin spinning, applying Razor Gyro's damage within a '''2x''' radius of each summon. Razor Gyro now generates Ability Combo Points per enemy hit, and deals up to 12x Damage based on your Ability Combo Multiplier.",
						["volume"] = 18,
						["revised"] = 30,
					},
					["Razor Mortar"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SonicWraithMod.png",
						["description"] = "While active, enemies hit are grouped together. Upon resolution, your active Ortholysts are deployed surrounding you, and focus fire onto the grouped enemies with {{STR|40 / 50 / 60 / 70%}} Electricity Damage and Fire Rate for {{DUR|3 / 4 / 5 / 6s}}.",
					},
				},
			},
			["Sentient Wrath"] = {
				["hotkey"] = 2,
				["ability_icon"] = "SentientWrath130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Sentient Path"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SentientPathMod.png",
						["description"] = "Casting additionally causes your active Summulust is deployed in front of you in gate form, which repeats the effects of Sentient Wrath 3 times, or every 3.3s, which ever is greater, The gate also applies a directional force over the area that pulls immobilized enemies toward itself at {{RNG|5 / 6 / 7 / 10m}}/s.",
						["volume"] = 34,
					},
					["Sentient Spite"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SentientSpiteMod.png",
						["description"] = "Once the projectiles reach maximum range, they come to a stop before returning to you and applying the Sentient Wrath's effects again. The damage vulnerability will now stack up to twice. The returning projectiles accelerate up to '''45m/s'''.",
						["volume"] = 26,
					},
				},
			},
			["Lethal Progeny"] = {
				["hotkey"] = 3,
				["ability_icon"] = "LethalProgeny130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Defensive Progeny"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DefensiveProgenyMod.png",
						["description"] = "Adds Immunodes as a fourth sentient option that will grant invulnerability and immunity to status effects to allied units within {{RNG|5m}}. You will only summon a single Immunode, and they have the highest enemy targeting priority. {{STR|1500 / 2500 / 3000 / 3500}} object health.",
						["volume"] = 18,
					},
					["Ingenious Progeny"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord IngeniousProgenyMod.png",
						["description"] = "Active Sentients no longer bolster allied shields, and instead continuously radiates pulses that strips the shields of enemies within {{RNG|25m}} by {{STR|10 / 15 / 20 / 25%}}/s.",
						["volume"] = 28,
						["revised"] = 30,
					},
					["Lethal Ancestry"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord LethalAncestryMod.png",
						["description"] = "Adds Vomvalysts as a fourth sentient option that harasses enemies with homing projectiles and expends themselves to revive fallen allies. You will summon '''2 / 3 / 4 / 5''' Vomvalysts in a single cast.",
						["volume"] = 18,
						["coop"] = "Lineage",
					},
					["Lethal Vision"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord LethalVisionMod.png",
						["description"] = "Adds Oculysts as a fourth sentient option that disables lockdowns, resets alarms and disables security cameras, as well as highlighting Loot and Enemies within {{RNG|5 / 10 / 15 / 20m}}. Allies within Affinity Range of an Oculyst are Radar-Linked. Oculysts are immobile, last for {{DUR|20 / 25 / 30 / 35s}}, and only 1 is deployed per cast, but you may deploy up to 3, and they may be summoned in conjunction with your other Sentients.",
						["volume"] = 34,
					},
				},
			},
			["Fusion Strike"] = {
				["hotkey"] = 4,
				["ability_icon"] = "FusionStrike130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Fusion Point"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FusionPointMod.png",
						["description"] = "On Cast: Lethal Progeny's Conculysts will also project a single beam from their chest toward the object of Caliban's aim. Enemies will receive '''25 / 33 / 50 / 100%''' damage from beams beyond the first. Upon resolution, Conculysts will begin using their tornado ability, the duration of which is paused while within Fusion Strike's fallout. ",
						["volume"] = 34,
					},
				},
			},
		},
	},
	["Chroma"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Chroma_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Aurelian Armor"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AurelianArmorMod.png",
						["description"] = "Passively gain {{{STR|1}}} Armor for every 1000 Credits in your Mission Coffers, up to '''500 / 750 / 1000 / 1500''' Armor.",
						["volume"] = 27,
					},
					["Trailblazer"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord TrailblazerMod.png",
						["description"] = "Passively mitigate Status Effects. While above {{STR|5 / 7.5 / 10 / 15%}} Health, you will expend '''3%''' Health for each Status Effect mitigated.",
						["volume"] = 25,
						["footnote"] = "The health expenditure counts as damage received for the purposes of Vex Armor, as well as effects like {{m|Combat Discipline}}.",
					},
				},
			},
			["Spectral Scream"] = {
				["hotkey"] = 1,
				["ability_icon"] = "SpectralScream130xWhite.png",
				["revised_desc"] = "Channel to exale elemental destruction from your '''Sentient Pelt''', Chroma's Exalted Primary Weapon that deals {{STR|50}} Elemental Damage at a fire rate of 8.0 attack/s to all enemies in a {{RNG|8 / 12 / 16 / 20m}} by '''90{{Degree}}''' conic area. While Aiming, the area of effect is adjusted to {{RNG|15 / 20 / 25 / 30m}} by beam's FOV is narrowed to '''35{{Degree}}'''. Casting supports tap-to-toggle and hold-until-released. While active, you generate 20 Ability Combo Points/s, and deal up to 12x Damage based on your Ability Combo Multiplier.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Afterburn"] = {
						["official"] = true,
						["mod_avail"] = "Universal",
						["mod_image"] = "SpectralScreamMod.png",
						["description"] = "Upon deactivation, Chroma will launch a volatile projectile that explodes on impact, dealing {{STR|25 / 50 / 75 / 100}} damage for each second the ability was active to all enemies within a {{RNG|5m}} radius. In Conclave, this damage is capped at {{STR|200 / 300 / 400 / 500}}.",
						["revised"] = "Not Recorded",
						["footnote"] = "Damage cap is now only applicable in Conclave."
					},
					["Dynakinesis"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DynakinesisMod.png",
						["description"] = "Sentient Pelt's breath attack is instead a narrow beam that will automatically lock-on to the closest enemy within {{RNG|8 / 12 / 16 / 20m}} and within a '''90{{Degree}}''' field of view. The beam will chain indefinitely to unique enemies within {{RNG|4 / 6 / 8 / 10m}} of the last enemy hit.",
						["volume"] = 28,
					},
					["Morning Breath"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord MorningBreathMod.png",
						["description"] = "Casting while above '''75%''' Maximum Energy will instantly accumulate '''60 / 120 / 180 / 220''' Ability Combo Points.",
						["volume"] = 3,
					},
					["Piercing Scream"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Ear-piercingScreamMod.png",
						["description"] = "Casting instead unleashes a shriek with such intensity that all enemies with line-of-sight are dealt Sentient Pelt's damage with {{STR|100 / 125 / 150 / 200%}} Puncture Status Chance.",
						["volume"] = 18,
					},
					["Spectral Artillery"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SpectralArtilleryMod.png",
						["description"] = "Sentient Pelt's breath attack instead launches arcing globs of elemental spittle that explode on impact, dealing Sentient Pelt's damage to all enemies within a {{RNG|5m}}-radius. You can hold to automatically recast this ability. While at 6x Ability Combo Multiplier, gain '''+25 / 33 / 50 / 100%''' Spittle Radius. While at 12x Ability Combo Multiplier, gain '''100%''' Spittle Status Chance. Projectiles move at 60m/s with no maximum range, but are affected by gravity.",
						["volume"] = 33,
					},
					["Spectral Focus"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FocusedFireMod.png",
						["description"] = "Sentient Pelt's breath attack is instead a narrow, {{RNG|8 / 12 / 16 / 20m}}-ranged beam. Damaging an enemy will accumulate Focus stacks every second, which are set to 0 whenever you change target. At 3 stacks, consume all stacks to trigger an eruption that deals {{STR|500 / 750 / 1000 / 1250}} damage to all enemies within a {{RNG|6m}}-radius of your target.",
						["volume"] = 27,
					},
				},
			},
			["Elemental Ward"] = {
				["hotkey"] = 2,
				["ability_icon"] = "ElementalWard130xWhite.png",
				["revised_desc"] = "Hold to cycle between Cold, Electricity, Heat and Toxin. Your current selection modifies the damage type of your other abilities. Tap-cast to gain an aura of elemental protection for {{DUR|10 / 15 / 20 / 25s}}, granting friendly units within '''Affinity Range:'''

* Cold: {{STR|25 / 70 / 90 / 145%}} base Armor, as well as causing attackers to receive {{STR|150 / 200 / 250 / 300%}} of damage inflicted against you as Cold damage with {{STR|10 / 15 / 20 / 25%}} Status Chance,
* Electricity: {{STR|10 / 15 / 20 / 30%}} base Shields, as well as propogating {{STR|2.5 / 3 / 5 / 10x}} damage received as Electrical Damage to an enemy within {{RNG|5 / 6 / 8 / 10m}} with {{STR|10 / 15 / 20 / 25%}} Status Chance,
* Heat: {{STR|15 / 20 / 30 / 55%}} base Healths, as well as dealing {{STR|25 / 50 / 75 / 100}} Heat damage/s to enemies within a {{RNG|5m}}-radius with {{STR|5 / 5 / 7 / 10%}} Status Chance, or
* Toxin: {{STR|15 / 20 / 30 / 35%}} Reload Speed, as well as granting {{STR|15 / 25 / 30 / 35%}} Weapon Damage for {{DUR|3s}} whenever you swap weapons. Noxious fumes have a {{STR|25 / 35 / 40 / 50%}} chance/s to deal {{STR|5%}} of an enemy's maximum health as Toxin Damage with guaranteed status.

",
				["revised]"] = 35,
				["augments"] = {
					["Elemental Brand"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ElementalBrandMod.png",
						["description"] = "Casting now additionally brands the ground at the target location, as well as beneath all Warframes within Affinity Range. After a 1.75s delay, each brands erupts, dealing {{STR|500 / 750 / 1000 / 1250 x Enemy Level}} Elemental Damage to enemies within a {{RNG|5m}}-radius area.",
						["volume"] = 26,
					},
					["Prismatic Compounds"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PrismaticCompoundsMod.png",
						["description"] = "Hold-casting now opens a Selection Wheel that allows Chroma to choose between any of the 10 Elemental Forces. Casting Elemental Ward with a Compound Element will grant Chroma elemental protection corresponding to both composite elements. This augment is not compatible with Helminth.",
						["volume"] = 5,
						["revised"] = 30,
					},
				},
			},
			["Vex Armor"] = {
				["hotkey"] = 3,
				["ability_icon"] = "VexArmor130xWhite.png",
				["revised_desc"] = "Casting creates an aura for {{DUR|10 / 15 / 20 / 25s}} that grants up to {{STR|360%}} Bonus Armor ('Scorn') and up to {{STR|276%}} Bonus Damage ('Fury') to allies within Affinity Range, based on '''30x''' and '''23x''' your Ability Combo Multiplier, respectively. While active, Chroma gains Ability Combo Points equal to '''10%''' of any damage received, '''15''' Ability Combo Points on Melee and Ranged Kills, and '''30''' Ability Combo Points on Weakpoint and Finisher Kills. ",
				["revised"] = 35,
				["augments"] = {
					["Draconic Plating"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DraconicPlatingMod.png",
						["description"] = "Casting regenerates '''100%''' Shields and creates a Shield Gate every '''150''' total Shields. While active, your Ability Combo Duration is frozen. You gain '''60''' Ability Combo Points and your Maximum Shields are reduced by 150 each time you trigger Shield Gating. {{STR|600%}} maximum Fury Bonus Modifier. If your Shields are fully depleted, your Ability Combo is set to 0, your Maximum Shields are restored, and both your Ability Combo Generation and Shields are disabled until your Shields have fully regenerated. 60s cooldown beginning on-cast. '''+300 / +250 / +200 / +150%''' Shield Recharge Delay. '''Scorn''' is disabled.",
						["volume"] = 26,
						["revised"] = 35,
						["footnote"] = "Replaced mentions of 'plating' in the description with 'shield gate'. Added 60s cooddown. Added Shield Recharge Delay Penalty. Effect revised to suit Ability Combo Multiplier. I considered changing the size of 'plates' to be '''150 ÷ {{STR|1}}''', but I think that would be far too easy to get an unreasonably large number of plates.",
					},
					["Ire of Dragons"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Ireof DragonsMod.png",
						["description"] = "The effects of Vex Armor are now passive, and your Ability Combo Multiplier now decays by '''10 / 7.5 / 5 / 2.5''' every {{DUR|5s}}. Hold-casting will now sacrifice health at a rate of {{EFF|500}} per second, until released. Efficiency will reduce the damage taken without affecting Ability Combo Generation.",
						["volume"] = 26,
						["revised"] = 35,
						["footnot"] = " Effect revised to suit Ability Combo Multiplier.",
					},
				},
			},
			["Effigy"] = {
				["hotkey"] = 4,
				["ability_icon"] = "Effigy130xWhite.png",
				["revised_desc"] = "Channel to deploy your Sentient Pelt as an immobile Sentry, which autoamtically attacks nearby enemies and generates an aura that grants '''15 / 30 / 45 / 60%''' Credit Drop Chance and '''25 / 50 / 75 / 100%''' Credit Drop Amount Blessings to all allies within Affinity Range. Channeling will terminate automatically if Chroma moves out of Sentient Pelt's telegraphed Affinity Range. This does not prevent Chroma from casting Spectral Scream.",
				["revised"] = 35,
				["augments"] = {
					["Avaricious Aura"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AvariciousAuraMod.png",
						["description"] = "Your Effigy's Credit Blessings are now applied as a Mission-wide aura at all times.",
						["volume"] = 31,
						["aura"] = true,
						["revised"] = 35,
						["footnote"] = "The augment now affects both Credit Blessings, not just the Drop Chance. Effigy no longer needs to be active.",
					},
					["Dragon Blessed"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DragonBlessedMod.png",
						["description"] = "Your Effigy's Credit Drop Amount Blessing now persists on allies for {{DUR|18 / 22 / 26 / 30}}s.",
						["volume"] = 31,
						["retired"] = 35,
						["footnote"] = "I decided that Avaricious Aura should provide both bonuses, instead of the having two separate augments.",
					},
					["Dragon Sickness"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord DragonSicknessMod.png",
						["description"] = "While active, enemies within your Effigy's aura are intoxicated by the sight of gold and are compelled to fight each other in melee combat. Gain '''0.25 / 0.33 / 0.5 / 1.0%''' Affinity Range per 1000 Credits in your Mission Coffers, up to 100% Affinity Range.",
						["volume"] = 27,
					},
					["Overwhelm"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord OverwhelmMod.png",
						["description"] = "Casting instead causes you to charge upon a target enemy within {{RNG|15m}}, amassing all enemies within a {{RNG|20m}} by 80{{Degree}} cone into a dense cluster and then slam the cluster into the ground over your shoulder dealing {{STR|500 / 750 / 1000 / 1250}} damage that is affected by Sentient Pelt's config.",
						["volume"] = 26,
					},
					["Reign of Fire"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Reignof FireMod.png",
						["description"] = "Casting instead causes you to take flight for {{DUR|2s}}, scorching a trail through the battlefield that lingers for {{DUR|15s}} apply Sentient Pelt's damage. Replenish {{STR|1%}} health and energy per meter travelled in flight.",
						["volume"] = 3,
						["exilus"] = true,
					},
				},
			},
			["Sentient Pelt"] = {
				["ability_icon"] = "Effigy130xWhite.png",
				["exalted"] = "Primary",
				["augments"] = {
				},
			},
		},
	},
	["Citrine"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Citrine_Thumb.png",
		["abilities"] = {
			["Geoluminesence"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
				},
			},
			["Fractured Blast"] = {
				["hotkey"] = 1,
				["ability_icon"] = "FracturedBlast130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Percussive Blast"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PercussiveBlastMod.png",
						["description"] = "Hold-casting combines the crystal shards into a single, piercing projectile that will destroy emplacements, shatter deployable barriers, and remove any Shields, Armor and up to '''20 / 25 / 35 / 50%''' Overguard from enemies on-hit. Successfully breaking any form of defense will cause the projectile to explode, dealing {{STR|200 / 400 / 700 / 1000}} Electricity Damage to enemies within {{RNG|7.5m}}.",
						["volume"] = 28,
						["revised"] = 32,
					},
				},
			},
			["Preserving Shell"] = {
				["hotkey"] = 2,
				["ability_icon"] = "PreservingShell130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
				},
			},
			["Prismatic Gem"] = {
				["hotkey"] = 3,
				["ability_icon"] = "PrismaticGem130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Prismatic Companion"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "PrismaticCompanionMod.png",
						["description"] = "Casting will now attach the gem to your free-moving companion. Passively gain {{DUR|20 / 30 / 40 / 50%}} Prismatic Gem Duration.",
					},
					["Prismatic Focus"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PrismaticFocusMod.png",
						["description"] = "Prismatic Beams deal '''0.25 / 0.33 / 0.5 / 1.0x''' damage that is adapted to the enemy's shields and armor.",
						["volume"] = 28,
					},
				},
			},
			["Crystallize"] = {
				["hotkey"] = 4,
				["ability_icon"] = "Crystallize130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Recrystalize"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "PrismaticCompanionMod.png",
						["description"] = "Killing an enemy by attacking a crystalline growth will spread crystal shards to enemies within {{RNG|4 / 8 / 12 / 16}}, briefly staggering them as they form crystalline growths of their own for {{DUR|8s}}. This effect is recursive.",
					},
				},
			},
		},
	},
	["Cyte-09"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Cyte09_Thumb.png",
		["abilities"] = {
			["Practiced Aim"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
				},
			},
			["Seek"] = {
				["hotkey"] = 1,
				["ability_icon"] = "SeekIcon.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Active Denial"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Each pulse of your antennae will slow enemies revealed by {{STR|20 / 25 / 30 / 35%}} for {{DUR|2s}}.",
						["volume"] = 35,
						["credit"] = "TheJUST1 (Warframe)",
					},
					["Lethal Sights"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord LethalSightsMod.png",
						["description"] = "Your antennae are now fitted with ballistics, and project a tripwire in their facing direction. The enemy who breaks the tripwire will be dealt Neutralizer's damage to an exposed Weak Point. Antennae now pulse every '''4 / 3.5 / 3 / 2.5s''', and the tripwire will be re-engaged with each pulse.",
						["volume"] = 35,
					},
					["Remote Access"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord RemoteAccessMod.png",
						["description"] = "Hold-casting will deploy and assume control of an Infiltrator Roller for {{RNG|20 / 25 / 30 / 35s}}, which can adhere to surfaces, and cannot be detected by enemy senses or motional-based security systems. Use '''Primary Fire''' to discharge a pulse that disables enemy robotics and overrides security consoles within {{RNG|2 / 3 / 4 / 5m}}. After {{DUR|2 / 3 / 4 / 5}} uses or if recast, the roller will self-destruct. Evade's duration is paused while controlling the Infiltrartor Roller. ",
						["volume"] = 35,
					},
					["Spotter Osprey"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SpotterOspreyMod.png",
						["description"] = "Casting instead deploys an invulnerable Spotter Osprey, which accompanies you like a Sentinel. The Spotter Osprey has a '''30 / 45 / 60 / 75{{Degree}}''' cone of vision. Seek can no longer be recast while active.",
						["volume"] = 35,
					},
					["Squad Spotter"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Squad'sSpotterMod.png",
						["description"] = "Weak Point kills against enemies illuminated by Seek will highlight the Weak Points of all other enemies within {{RNG|15 / 20 / 25 / 30m}} for {{DUR|5s}}. All squad members can see and will gain Seek's bonus Weak Point damage versus enemies highlighted by Spotter.",
						["volume"] = 35,
						["credit"] = "TheR3D_Foxx (Warframe)",
					},
				},
			},
			["Resupply"] = {
				["hotkey"] = 2,
				["ability_icon"] = "ResupplyIcon.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Resupply Station"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ResupplyStationMod.png",
						["description"] = "Casting instead deploys a Resupply Station for {{DUR|10 / 15 / 20 / 25s}} that pulses every '''3s''', refilling the magazines of allies within {{RNG|10m}} and granting them bonus elemental damage on their current magazine.",
						["volume"] = 35,
						["credit"] = "TheR3D_Foxx (Warframe)",
					},
				},
			},
			["Evade"] = {
				["hotkey"] = 3,
				["ability_icon"] = "EvadeIcon.png",
				["revised_desc"] = "Casting causes you to jump back and become invisible for {{DUR|10s}}, reducing your noise level by 100% and granting you softsteps. While invisible, Weak Point kills will restore {{STR|25 / 50 / 75 / 100}} Health and extend the duration of Evade by {{DUR|2s}}. The remaining duration cannot exceed {{DUR|30s}}.",
				["revised"] = "Not Recorded",
				["augments"] = {
					["Blunt Force Rounds"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord BruteForce RoundsMod.png",
						["description"] = "Non-lethal headshots will now extend Evade's duration by '''0.1 / 0.2 / 0.3 / 0.4s'''. The duration is similarly extended whenever an enemy revealed by Seeker is slain by an ally.",
						["volume"] = 33,
					},
				},
			},
			["Neutralize"] = {
				["hotkey"] = 4,
				["ability_icon"] = "NeutralizeIcon.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
				},
			},
			["Neutralizer"] = {
				["ability_icon"] = "Neutralizer.png",
				["exalted"] = "Secondary",
				["augments"] = {
				},
			},
		},
	},
	["Dagath"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Dagath_Thumb.png",
		["abilities"] = {
			["Abundant Abyss"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Superstition"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SeraphimEyesMod.png",
						["description"] = "Enemies damaged by Dagath are permanently made Superstitious. Superstitious enemies are {{STR|5 / 10 / 15 / 20%}} less accurate, up to 75%. If Dagath would take Lethal Damage from a Superstitious enemy, she gains the effects of Grave Spirit's Spectral Form.",
						["volume"] = 35,
						["credit"] = "VondoGlok (Warframe)",
					},
				},
			},
			["Wyrd Scythes"] = {
				["hotkey"] = 1,
				["ability_icon"] = "WyrdScythes130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Reaping Scythes"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SeraphimEyesMod.png",
						["description"] = "On cast, Sickles will now expand to {{RNG|4m}} and orbit her for {{DUR|10 / 15 / 20 / 25s}}. While active, you may recast the ability will unleash the sickles toward enemies within {{RNG|40m}}, whereafter they will return to orbiting her. Recasting while aiming will instead send the sickles toward your crosshair.",
						["volume"] = 35,
						["credit"] = "VondoGlok (Warframe)",
						["footnote"] = "Sickles have infinite punchthrough, and so will pick the furthest away target. You may recast this ability multiple times, but you must wait for the scythes to return before you can unleash them again.",
					},
				},
			},
			["Doom"] = {
				["hotkey"] = 2,
				["ability_icon"] = "Doom130xWhite.png",
				["revised_desc"] = "Casting emits a morbid scream that curses all enemies within a {{RNG|10 / 12 / 13 / 15m}} by '''40{{degree}}''' conic area.",
				["augments"] = {
					["Deathly Omen"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Phantom Wrath will deal {{STR|1.5 / 2 / 2.5 / 3x}} Finisher Damage versus enemies that are vulnerable to Finishers. The lethal threshold for premature detonation will take this modifier into account, when applicable.",
						["volume"] = 35,
					},
					["Doom Merchent"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Each instance of Phantom Wrath will now accumulate {{STR|30 / 45 / 60 / 75%}} of damage inflicted to any other enemy that is afflicted, capped at to '''100%'''.",
						["volume"] = 35,
					},
				},
			},
			["Grave Spirit"] = {
				["hotkey"] = 3,
				["ability_icon"] = "GraveSpirit130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Spectral Spirit"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "GraveSpiritMod.png",
						["description"] = "Casting now immediately assumes Spectral Form. Passively gain '''25 / 50 / 75 / 100%''' Doom Status Chance on your damage from all sources. When not in Spectral Form, your kills decrease Grave Spirit's cooldown by '''1s'''.",
					},
				},
			},
			["Rakhali's Cavalry"] = {
				["hotkey"] = 4,
				["ability_icon"] = "RakhalisCavalry130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Rakhali's Reins"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["description"] = "Casting will instead summon and mount Rakhali, gaining an initial '''1 / 2 / 3 / 4s''' of invulnerability, and converting all mitigated damage into Overguard with no upper limit. While Overguard holds, you will resist Stagger and Knockdown effects that would otherwise dismount you. While mounted, performing a forward Dodge will summon '''Rikhali's Cavalry''', which will charge forward normally. Rickhali may only fly in landscape missions.",
						["volume"] = 35,
						["footnote"] = "You can employ effects such as {{m|Primed Sure Footed}} to continue to resist most dismounting effects even after your Overguard is depleted.",
					},
				},
			},
		},
	},
	["Dante"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Dante_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
				},
			},
			["Noctua"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Noctua130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Page Turner"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PageTurnerMod.png",
						["description"] = "Casting Final Verse while Noctua is fully charged will expend the charge to drain '''25 / 33 / 50 / 100%''' less energy. While active, Final Verse will generate '''1s''' of charge per target hit.",
						["volume"] = 33,
						["revised"] = 35,
						["footnote"] = "The effect originally allowed you to cast Final Verse using Noctua's Alternate Fire, but I decided to have each casting input remain separate while retaining the ability to spend Noctua's charge to reduce Final Verse's energy cost.",
					},
				},
			},
			["Noctua (Weapon)"] = {
				["ability_icon"] = "Noctua.png",
				["revised_name"] = "Noctua",
				["exalted"] = "Secondary",
				["augments"] = {
				},
			},
			["Light Verse"] = {
				["hotkey"] = 2,
				["ability_icon"] = "LightVerse130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Ambitious Verse"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord AmbitiousVerseMod.png",
						["description"] = "Casting will now carve a spiral rune, refilling the magazine of your current weapon and the current weapons of allies within {{RNG|20m}}.  
Foretell: With two Ambitious Verses, Final Chapter will create a {{RNG|20m}}-radius aura that grants {{STR|15 / 25 / 35 / 45%}} Ammo and Heavy Attack Efficiency for Final Chapter's duration.  
When combined with your third ability, this Verse will be substituted with Light Verse.",
						["volume"] = 33,
					},
					["Inspiring Verse"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord InspiringVerseMod.png",
						["description"] = "Casting will now carve a square rune, transporting you to the target location within {{RNG|22 / 23 / 24 / 25m}}.  
Ordain: With two Inspiring Verses, Final Chapter will open a portal before you and at the target location for Final Chapter's duration, which transport units and weapon fire in both directions. Hold cast to become invulnerable for up to '''15s''', gaining the ability to remotely place the exist portal.  
When combined with your third ability, this Verse will be substituted with Light Verse.",
						["volume"] = 34,
					},
				},
			},
			["Dark Verse"] = {
				["hotkey"] = 3,
				["helminth"] = true,
				["ability_icon"] = "DarkVerse130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Dark Codex"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["helminth"] = true,
						--["mod_image"] = "Emptylord DarkCodexMod.png",
						["description"] = "Every third cast will be a Tragedy with 300 / 250 / 200 / 150% energy cost.",
						["volume"] = 33,
					},
					["Dark Omen"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						["helminth"] = true,
						--["mod_image"] = "Emptylord DarkOmenMod.png",
						["description"] = "Track the number of enemies that die within '''1.5s''' of being affected by you, up to '''50 / 60 / 75 / 100'''. Hold-casting will drain 50 tracked kills to cast Pageflight for {{DUR|30 / 35 / 40 / 45s}}.",
						["volume"] = 34,
					},
					["Mesmering Verse"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord MesmeringVerseMod.png",
						["description"] = "Dante will now carve a triangular rune, creating a doorway that spills forth {{RNG|12}} missiles that are evenly distributed across enemies in your field of view, dealing {{STR|30 / 45 / 60 / 75 x Enemy Level}} Heat Damage with guaranteed status.  
Foreshadow: With two Mesmerizing Verses, Final Chapter will summon a stationary doppelgänger for Final Chapter's duration that shares your aim and mimics your attacks and cast Verses with {{STR|x0.5}} damage. You can maintain up to 3 doppelgängers.  
When combined with your second ability, this Verse will be substituted with Dark Verse.",
						["volume"] = 33,
					},
					["Sickening Verse"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SickeningVerseMod.png",
						["description"] = "Dante will now carve a crescent rune, displacing the souls of all enemies within {{RNG|6 / 8 / 10 / 12m}} and rendering them ''Hollow'' for '''6s''', affected by Status Duration.  
Omen: With two Sickening Verses, Final Chapter will extend the Status Duration on enemies within {{RNG|15 / 20 / 25 / 30m}} by Final Chapter's duration.  
When combined with your second ability, this Verse will be substituted with Dark Verse.",
						["volume"] = 34,
					},
				},
			},
			["Final Verse"] = {
				["hotkey"] = 4,
				["ability_icon"] = "FinalVerse130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Final Chapter"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FinalBookMod.png",
						["description"] = "Passively gain '''0.5''' stacks of Anticipation each time you cast a Verse ability, or use Noctua's Alternate Fire. Casting Final Verse will gain {{DUR|20%}} Ability Duration per ''whole'' stack of Anticipation and set your Anticipation to 0. '''2 / 3 / 4 / 5''' Max Stacks.",
						["volume"] = 33,
						["revised"] = 35,
						["footnote"] = "Added a synergy with Noctua.",
					},
				},
			},
		},
	},
	["Elytron"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Elytron.png",
		["abilities"] = {
			["Bloomer"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Bloomer130xWhite.png",
				["augments"] = {
				},
			},
			["Core Vent"] = {
				["hotkey"] = 2,
				["ability_icon"] = "CoreVent130xWhite.png",
				["augments"] = {
				},
			},
			["Thumper"] = {
				["hotkey"] = 3,
				["ability_icon"] = "Thumper130xWhite.png",
				["augments"] = {
				},
			},
			["Warhead"] = {
				["hotkey"] = 4,
				["ability_icon"] = "Warhead130xWhite.png",
				["augments"] = {
				},
			},
		},
	},
	["Ember"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Ember_Thumb.png",
		["abilities"] = {
			["Passive"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["revised_desc"] = "Fire Ball, Fire Blast and Inferno generate 20 Ability Combo Points per cast. Ember's deals up to 12x Heat Damage from all sources based on her Ability Combo Multiplier.",
				["revised"] = 34,
				["augments"] = {
					["Fire Starter"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SmoulderMod.png",
						["description"] = "The corpses of enemies who die while under the effects of your Heat Status Effects will linger as damaging zones for {{DUR|3 / 4.5 / 6 / 7.5s}}, dealing periodic Heat damage with guaranteed Heat Status to enemies within a {{RNG|1m}}-radius.",
						["volume"] = 35,
					},
					["Flame Cloak"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FlameCloakMod.png",
						["description"] = "Passively gain up to '''12 / 24 / 36 / 60%''' bonus movement speed based on your Ability Combo Multiplier. ",
						["volume"] = 26,
						["revised"] = 34,
						["exilus"] = true,
					},
					["Heat Death"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord HeatDeathMod.png",
						["description"] = "Enemies damaged by Ember are permanently more vulnerable to Heat Status effects, burning for an additional {{STR|0.25 / 0.33 / 0.5 / 1.0%}} of their maximum health per second, per Heat Status.",
						["volume"] = 28,
					},
					["Kindling"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SmoulderMod.png",
						["description"] = "Enemies damaged by Ember are permanently more vulnerable to Heat Status Effects, causing Burn Damage to be dealt to all enemies within {{RNG|1 / 3 / 5 / 7m}}.",
						["volume"] = 35,
					},
					["Smoulder"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SmoulderMod.png",
						["description"] = "You generate '''2 / 3 / 4 / 5''' Ability Combo Points each time an enemy dies while afflicted by your Heat Status. Your Ability Combo Duration now decays at a rate of {{DUR|20 / 15 / 10 / 5}} every {{DUR|5s}}.",
						["volume"] = 18,
						["revised"] = 34,
					},
					["Unquenchable Fire"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord UnquenchableFireMod.png",
						["description"] = "If you receive a fatal hit while at or above '''12x / 10x / 8x / 6x''' Ability Combo Multiplier, consume all Ability Combo Points to prevent death, gaining '''5s''' of invulnerability and regenerating '''100%''' health. This has no cooldown.",
						["volume"] = 26,
						["revised"] = 34,
						["exilus"] = true,
					},
				},
			},
			["Fireball"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Fireball130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Conflagration"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord ConflagrationMod.png",
						["description"] = "Striking an enemy that is already afflicted with Heat will cause fireballs to spread to enemies within line-of-sight, up to  {{RNG|10 / 15 / 20 / 25m}}, applying Fireball's damage and propagating Heat Status effects. This effect is not recursive.",
						["volume"] = 6,
					},
					["Fire Eater"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FireEaterMod.png",
						["description"] = "Hold-casting will extinguish all Heat Status effects within your field of view, dealing all undealt damage instantly with {{STR|1.0 / 1.1 / 1.2 / 1.3x}} damage multiplier.",
						["volume"] = 31,
					},
					["Fire Strike"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord FireStrikeMod.png",
						["description"] = "Hold-casting will a pillar of fire to erupt from the ground under your crosshair, dealing {{STR|200 / 300 / 400 / 500}} Heat damage with '''50 / 100 / 125 / 200%''' Status Chance to enemies within {{RNG|5m}}. ",
						["volume"] = 18,
						["set"] = "Sunwell",
					},
					["Fireball Frenzy"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["description"] = "Hold-casting will grant {{STR|50 / 65 / 80 / 100%}} bonus Heat Damage on weapons to all allies within {{RNG|15m}} for {{DUR|28 / 32 / 36 / 40}}.",
					},
				},
			},
			["Immolation"] = {
				["hotkey"] = 2,
				["ability_icon"] = "Immolation130xWhite.png",
				["revised_desc"] = "Casting engulfs you in flame, freezing your Ability Combo Duration and granting you between {{STR|3 / 4.5 / 6 / 7.5%}} Damage Reduction per Ability Combo Multiplier, up to 90%. While active, Fire Blast will register as a Heavy Attack, depleting '''50%''' of your Ability Combo Points to deal 3x Heavy Damage. While your Ability Combo Multiplier is at 12x, Immolation will drain {{EFF|0.4}} energy per second, increasing by {{EFF|0.4}} every second.",
				["revised"] = 34,
				["augments"] = {
					["Immolated Radiance"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["description"] = "While active, allies within Affinity Range will receive {{STR|1.5 / 2.25 / 3 / 3.75%}} Damage Reduction per Ability Combo Multiplier, up to 90%.",
						["revised"] = 35,
						["footnote"] = "Revised to suit Ability Combo. Cap on allies doubled to match the cap on Ember (90%). The amount granted to allies per Ability Combo is still half of the value granted to Ember, but with sufficient Ability Strength it would still be possible to reach 90%.",
					},
					["Inflammable"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord InflammableMod.png",
						["description"] = "While active, you gain {{STR|20}} Initial and Maximum Ability Combo Points, and Fire Blast instead depletes '''50 / 33 / 25 / 20%''' of your Ability Combo Points.",
						["volume"] = 31,
						["revised"] = 35,
						["footnote"] = "Revised to suit Ability Combo. Added bonus Initial and Maximum Combo.",
					},
					["World On Fire"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord WorldOn FireMod.png",
						["description"] = "While active, Fireball, Fire Blast and Inferno will set their damage areas ablaze for {{DUR|15}} seconds. Enemies take {{STR|100 / 125 / 150 / 175}} Heat Damage/s, which is modified by your Ability Combo Multiplier. Inferno no longer sets the environment ablaze except through this effect.",
						["volume"] = 29,
					},
				},
			},
			["Fire Blast"] = {
				["hotkey"] = 3,
				["ability_icon"] = "FireBlast130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Blast Burn"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord BlastBurnMod.png",
						["description"] = "Casting now additionally grants {{STR|30 / 35 / 40 / 50}}% movement speed for {{DUR|3.5 / 4 / 4.5 / 5}} seconds, and your ring of fire will now retract after reaching its maximum range at half the speed, detonating any Fire Bombs on unarmoured enemies.",
						["volume"] = 18,
						["revised"] = 32,
						["set"] = "Sunwell",
					},
					["Healing Flames"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "PurifyingFlamesMod.png",
						["description"] = "Ember restores {{STR|10 / 15 / 20 / 25}} Health per enemy hit, which is modified by your Ability Combo Multiplier. Excess healing is applied as Overguard, up to {{STR|15000}}.",
						["revised"] = 35,
						["footnote"] = "Reworded to be modified by Ability Combo Multiplier. Overguard cap is now standardized. Healing Flames and Purifying Flames seem like they should be one augment, since Overguard also grants Status Immunity.",
					},
					["Purifying Flames"] = {
						["official"] = true,
						["mod_avail"] = "Universal",
						["mod_image"] = "PurifyingFlamesMod.png",
						["description"] = "Allies hit by the expanding ring of fire are cleansed of Status Effects and granted {{DUR|1 / 2 / 3 / 4s}} of Status Immunity.",
					},
				},
			},
			["Inferno"] = {
				["hotkey"] = 4,
				["ability_icon"] = "Inferno130xWhite.png",
				["live_desc"] = "Unchanged.",
				["augments"] = {
					["Exothermic"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						["mod_image"] = "PurifyingFlamesMod.png",
						["description"] = "Enemies damaged by Inferno have a '''5 / 7.5 / 10 / 15%''' chance to drop an Energy Orb when slain.",
					},
					["Infernal Cascade"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord InfernalCascadeMod.png",
						["description"] = "Enemies struck will also suffer {{STR|25 / 50 / 75 / 100}}% additional damage from Heat Damage for {{DUR|2 / 4 / 6 / 8}} seconds.",
						["volume"] = 18,
						["revised"] = 32,
						["set"] = "Sunwell",
					},
					["Fire Storm"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord InfernalCascadeMod.png",
						["description"] = "Surviving enemies gain {{STR|+25 / 33 / 50 / 100%}} chance to receive Heat Status from all incoming damage.",
						["volume"] = 35,
					},
				},
			},
		},
	},
	["Equinox"] = {
		["equip_type"] = "Warframe",
		["official"] = true,
		["icon"] = "Equinox_Thumb.png",
		["abilities"] = {
			["Equilibrium"] = {
				["hotkey"] = 0,
				["ability_icon"] = "PassiveAbility.png",
				["revised_desc"] = "Health pickups give 60% Energy, increased to 110% in Night Form. Energy pickups give 60% Health, increased to 110% in Day Form.",
				["revised"] = 35,
				["augments"] = {
					["Silent Night & First Light"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SilentNight & First LightMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Passively gain {{STR|20% movement speed}}, and the range that enemies can spot you is reduced by '''20 / 25 / 33 / 50%'''.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Enemies damaged by Day are permanently {{STR|20 / 25 / 33 / 50%}} more likely to receive Critical Strikes from further sources of weapon damage.",
						["volume"] = 22,
						["revised"] = 35,
						["set"] = "Starfall",
						["footnote"] = "'''Silent Night's''' original effect was too similar to '''Pacify''' and '''Nightfall'''. '''First Light's''' effect was too similar to '''Night's Blessing''' and ''Daybreak'''. An alternative effect that was considered for Day Form: Day gains {{STR|33 / 50 / 100 / 200%}} Critical Chance on her first attack against each enemy.",
					},
				},
			},
			["Dawn & Dusk"] = {
				["hotkey"] = 1,
				["ability_icon"] = "Metamorphosis130xWhite.png",
				["revised_desc"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Casting has Night place her hands over her face and trades places with Day, leaving '''Night's Blessing''' for {{DUR|10 / 15 / 20 / 25s}}, which grants {{STR|10 / 15 / 20 / 25%}} Weapon Damage and {{STR|5 / 10 / 15 / 20%}} Movement Speed.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Casting has Day bow her head and trades places with Night, leaving '''Day's Blessing''' for {{DUR|10 / 15 / 20 / 25s}}, which grants {{STR|100 / 150 / 200 / 250}} base Armor and {{STR|50 / 75 / 100 / 150}} base Shields.",
				["augments"] = {
					["Duality"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Inspire& DefianceMod.png",
						["description"] = "Casting will now deploy a specter of your previous form for {{DUR|7 / 8 / 9 / 10s}} with a copy of your current loadout, which deals '''1 / 1.5 / 2 / 3x''' Damage.",
					},
					["Nightfall & Daybreak"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Daybreak& NightfallMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Becoming Night renders you invisible and inaudible for {{DUR|10 / 15 / 20 / 25s}}, as well as granting you softsteps.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Becoming Day wreaths you in dazzling radiance for {{DUR|10 / 15 / 20 / 25s}}, blinding enemies who come within line-of-sight and causing them to fumble their weapons.",
						["volume"] = 12,
						["revised"] = 35,
						["set"] = "Convergence",
						["footnote"] = "Nightfall's original effect was too similar to '''Pacify''' and '''Silent Night'''. Daybreak's effect was too similar to '''Night's Blessing''' and ''First Light'''.",
					},
					["Polar Night & Midnight Sun"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord PolarNight & Midnight SunMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Night's Blessing is now permanent across both forms. Casting Dawn will now grant Night's Blessing to all allies within Affinity Range for {{DUR|10 / 15 / 20 / 25s}}.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Day's Blessing is now permanent across both forms. Casting Dusk will now grant Day's Blessing to all allies within Affinity Range for {{DUR|10 / 15 / 20 / 25s}}.",
						["volume"] = 27,
					},
					["Push & Pull"] = {
						["official"] = true,
						["mod_avail"] = "Conclave",
						["mod_image"] = "Push & PullMod.png",
						["description"] = "Switching to Day-form will stagger enemies within '''1.5 / 3 / 4.5 / 6m''', while switching to Night-form will knock them down.",
					},
					["Solstitial Continuity"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SolstitialContinuityMod.png",
						["description"] = "Passively grants 30% Ability Duration. Switching to this form will grant an additional 30% Ability Duration for '''30s''', which decays by '''5%''' every '''5s'''.",
						["volume"] = 30,
						["restrict"] = "{{m|Continuity}}, {{m|Archon Continuity}}",
					},
					["Solstitial Intensify"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SolstitialIntensifyMod.png",
						["description"] = "Passively grants 30% Ability Strength. Switching to this form will grant an additional 30% Ability Strength for '''30s''', which decays by '''5%''' every '''5s'''.",
						["volume"] = 30,
						["restrict"] = "{{m|Intensify}}, {{m|Archon Intensify}}",
					},
					["Sun Dial"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord SunDialMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Fishing sources within Affinity Range will behave as if it were Night, Cold or Vome. +'''6 / 9 / 12 / 15m''' Fish Highlight Range.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Fishing sources within Affinity Range will behave as if it were Day, Heat or Fass. +'''6 / 9 / 12 / 15m''' Fish Highlight Range.",
						["volume"] = 33,
					},
					["Weighted Scales"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord WeightedScalesMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Night's Blessing also grants '''50 / 65 / 80 / 95'''% Ammo Efficiency, but Day spawns with her '''1''' on an initial '''60s''' cooldown. The cooldown is reduced by 1 second when an enemy dies that you've affected in the last '''1.5'''s.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Day's Blessing also grants '''50 / 65 / 80 / 95'''% Heavy Attack Efficiency, but Night spawns with her '''1''' on an initial '''60s''' cooldown. The cooldown is reduced by 1 second when an enemy dies that you've affected in the last '''1.5s'''.",
						["volume"] = 12,
						["revised"] = 33,
					},
				},
			},
			["Rest & Rage"] = {
				["hotkey"] = 2,
				["ability_icon"] = "RestRage130xWhite.png",
				["revised_desc"] = "Casting hypnotizes a target up to {{RNG|20 / 30 / 40 / 50m}} away for {{DUR|10 / 14 / 18 / 22s}}, as well as all enemies within {{RNG|1 / 3 / 3 / 5m}}. [[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Enemies are sent to sleep. Sleeping enemies are exposed to Finishers and gain '''+100%''' Vulnerability to Finishers, forget their previous alert level, and will wake if they receive in excess of '''50%''' of their current health in damage. [[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Enemies are enraged, gaining {{STR|5 / 10 / 15 / 20%}} Movement and Attack Speed, as well as becoming {{STR|20 / 30 / 40 / 50%}} more vulnerable to damage.",
				["augments"] = {
					["Calm & Frenzy"] = {
						["official"] = true,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Inspire& DefianceMod.png",
						["description"] = "Killing a hypnotized enemy causes the effect to spread to additional enemies within {{RNG|2 / 3 / 4 / 5m}} for '''40 / 60 / 80 / 100%''' of the remaining duration",
					},
					["Impasse & Deadlock"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Impasse& DeadlockMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Energy chords will also extend from the target to Equinox and her allies within {{RNG|12 / 14 / 17 / 20m}}. {{STR|20 / 25 / 30 / 35%}} of damage received by affected allies will be redirected to the target, up to a maximum of 90%.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Energy chords will also extend from the target to Equinox and her allies that are within {{RNG|12 / 14 / 17 / 20m}}. The target will deal {{STR|20 / 25 / 30 / 35}}% less damage to affected allies, up to a maximum of 90%.",
						["volume"] = 27,
					},
					["Lunar Rush & Zenith Blade"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord LunarRush & Zenith BladeMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Transform into a pale sphere with the ability to fly for {{DUR|1 / 1.25 / 1.5 / 2s}}. Enemies you pass through are put to sleep.  
[[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Strike a flaming blade into the ground at the target location within {{RNG|20 / 30 / 40 / 50m}} that applies the effects of Rage to enemies within {{RNG|2 / 4 / 6 / 10m}}. Recast to teleport to the blade and withdraw it, which ends the effect.",
						["volume"] = 27,
					},
				},
			},
			["Pacify & Provoke"] = {
				["hotkey"] = 3,
				["ability_icon"] = "PacifyProvoke130xWhite.png",
				["revised_desc"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' Channel an aura that causes enemies within Affinity Range to deal reduced damage based on their proximity to Equinox, up to {{STR|20 / 33 / 43 / 50%}} while within {{RNG|10 / 12 / 14 / 16m}}. Drains {{EFF|1}}/s per enemy affected, up to {{EFF|10}}/s. [[File:EquinoxDayFormIndicator.png|32px]] '''Day Form:''' Casting creates an aura that grants {{STR|5 / 10 / 15 / 20%}} bonus Ability Strength to squad members within Affinity Range. Drains {{EFF|3}} per ability cast within the aura.",
				["augments"] = {
					["Inspire & Defiance"] = {
						["official"] = false,
						["mod_avail"] = "Cooperative",
						--["mod_image"] = "Emptylord Inspire& DefianceMod.png",
						["description"] = "[[File:EquinoxNightFormIndicator.png|32px]] '''Night Form:''' On Finisher: Equinox gains {{STR|150 / 300 / 450 / 600}} Overguard, and allies within Affinity Range gain half as much.
```
```

