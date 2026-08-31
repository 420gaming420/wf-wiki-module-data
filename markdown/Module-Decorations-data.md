---
title: "Module:Decorations/data"
wiki_url: "https://wiki.warframe.com/w/Module/Decorations/data"
wiki_timestamp: "2025-08-21T09:28:18Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:Decorations/data?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Add [Dormizone](/w/Dormizone "Dormizone") decorations here

Database of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Decorations](/w/Decorations "Decorations").

## Decoration Entry Schema

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=T-1 "Edit section's source code: Decoration Entry Schema")]

```lua
	["Decoration Name"] = {
		Name = "Decoration Name",
		Image = "DecoDecorationName.png",
		Description = "Description",
		Cost = {
			Capacity = 5,
			Time = 24,
			Credits = 500,
			Resources = {
				{ Count = 300, Name = "Ferrite" },
				{ Count = 200, Name = "Salvage" },
				{ Count = 100, Name = "Polymer Bundle" },
				{ Count = 0.07, Name = "Control Module" }
			}
		}
	},
```

| Key/Column Name | [Public Export](/w/Public_Export "Public Export") Equivalent | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- | --- |
| `Cost` | N/A | Table (of key-value pairs) | ✔️ | Cost data of decoration | See [#Cost Table Schema](#Cost_Table_Schema) |
| `Description` | `description` | String | ✔️ | Description of decoration as seen in-game | `"Changes the entry point for Tenno arriving in the Dojo. Only one Arrival Gate can be placed in a Dojo."` |
| `Image` | `textureLocation` | String | ✔️ | Image file name of the decoration as uploaded to the wiki | `"DecoArrivalGate.png"` |
| `InternalName` | `uniqueName` | String | ❌ | The full unique name of a decoration formatted as a file path | `"/Lotus/Types/Recipes/WarframeRecipes/MummyBlueprint"` |
| `Introduced` | N/A | String | ❌ | The game version in which the decoration was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Name` | `name` | String | ✔️ | Name of decoration | `"Beacon"` |

### Cost Subtable Schema

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=T-2 "Edit section's source code: Cost Subtable Schema")]

```lua
		Cost = {
			Capacity = 5,
			Time = 24,
			Credits = 500,
			Resources = {
				{ Count = 300, Name = "Ferrite" },
				{ Count = 200, Name = "Salvage" },
				{ Count = 100, Name = "Polymer Bundle" },
				{ Count = 0.07, Name = "Control Module" }
			}
		}
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Capacity` | Number (int) | ✔️ | The room capacity cost for placing decoration | `5` |
| `Credits` | Number (int) | ✔️ | The [Credits](/w/Credits "Credits") cost for crafting the decoration | `25000` |
| `Resources` | Table (of tables) | ✔️ | A table containing the crafting components used to build the decoration and the amounts required at Ghost Clan rank | ```lua { 	{ Count = 4, Name = "Neurodes" }, 	{ Count = 1200, Name = "Alloy Plate" }, 	{ Count = 700, Name = "Ferrite" }, 	{ Count = 1000, Name = "Polymer Bundle" }  } ``` |
| `Time` | Number (int) | ✔️ | The time in hours to build an item | `24` |

## Data

[[edit source](/w/Module:Decorations/data/doc?action=edit&section=T-3 "Edit section's source code: Data")]

---

```lua
return {
	Atmospherics = {
		["Beacon"] = {
			Name = "Beacon",
			Image = "DecoBeacon.png",
			Description = "A beacon of light.",
			Cost = {
				Capacity = 5,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Bubbles"] = {
			Name = "Bubbles",
			Image = "DecoBubbles.png",
			Description = "Floating bubbles.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Butterflies"] = {
			Name = "Butterflies",
			Image = "DecoButterflies.png",
			Description = "An area of fluttering butterflies.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Cloud Of Infested Spores"] = {
			Name = "Cloud Of Infested Spores",
			Image = "DecoCloudOfInfestedSpores.png",
			Description = "A small cloud of infested spores.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Cob Webs"] = {
			Name = "Cob Webs",
			Image = "DecoCobWebs.png",
			Description = "Some webs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cob Webs (Hanging)"] = {
			Name = "Cob Webs (Hanging)",
			Image = "DecoCobWebs(Hanging).png",
			Description = "Webs that are hanging.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cosmic Dust"] = {
			Name = "Cosmic Dust",
			Image = "DecoCosmicDust.png",
			Description = "Dust from the cosmos spilling in from a mysterious portal.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Dust"] = {
			Name = "Dust",
			Image = "DecoDust.png",
			Description = "Dust motes that float through the air.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Dust Falling"] = {
			Name = "Dust Falling",
			Image = "DecoDustFalling.png",
			Description = "Dust falling softly.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Torch Flame"] = {
			Name = "Duviri Torch Flame",
			Image = "DecoDuviriTorchFlame.png",
			Description = "Blue torch flame inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Electricity"] = {
			Name = "Electricity",
			Image = "DecoElectricity.png",
			Description = "A point where bolts of electricity shoot out.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Electricity Arcs"] = {
			Name = "Electricity Arcs",
			Image = "DecoElectricityArcs.png",
			Description = "A circular arc of electricity.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Electricity Bolt"] = {
			Name = "Electricity Bolt",
			Image = "DecoElectricityBolt.png",
			Description = "A large bolt of electricity.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Embers Flowing"] = {
			Name = "Embers Flowing",
			Image = "DecoEmbersFlowing.png",
			Description = "A swarm of embers flowing in a small area.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Energy Beam (Long Violet)"] = {
			Name = "Energy Beam (Long Violet)",
			Image = "DecoEnergyBeam(LongViolet).png",
			Description = "A long high-voltage energy beam with a purple glow.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Energy Beam (Short Green)"] = {
			Name = "Energy Beam (Short Green)",
			Image = "DecoEnergyBeam(ShortGreen).png",
			Description = "A short high-voltage energy beam with a green glow.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Energy Beam (Short Violet)"] = {
			Name = "Energy Beam (Short Violet)",
			Image = "DecoEnergyBeam(ShortViolet).png",
			Description = "A short high-voltage energy beam with a purple glow.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Energy Cloud"] = {
			Name = "Energy Cloud",
			Image = "DecoEnergyCloud.png",
			Description = "A large cloud of energy.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Energy Ring"] = {
			Name = "Energy Ring",
			Image = "DecoEnergyRing.png",
			Description = "A ring of pure energy.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Falling Leaves"] = {
			Name = "Falling Leaves",
			Image = "DecoFallingLeaves.png",
			Description = "A large area of falling leaves.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Falling Sand"] = {
			Name = "Falling Sand",
			Image = "DecoFallingSand.png",
			Description = "A large area of falling sand.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Falling Stones"] = {
			Name = "Falling Stones",
			Image = "DecoFallingStones.png",
			Description = "An area of small falling stones.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Fire"] = {
			Name = "Fire",
			Image = "DecoFire.png",
			Description = "A small flame.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Fireflies"] = {
			Name = "Fireflies",
			Image = "DecoFireflies.png",
			Description = "A small area full of fireflies.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Flames With Smoke"] = {
			Name = "Flames With Smoke",
			Image = "DecoFlamesWithSmoke.png",
			Description = "Flames that create smoke.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Flames With Smoke (White)"] = {
			Name = "Flames With Smoke (White)",
			Image = "DecoFlamesWithSmoke(White).png",
			Description = "White flames that create smoke.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Flies"] = {
			Name = "Flies",
			Image = "DecoFlies.png",
			Description = "A small area swarming with flies.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Fog"] = {
			Name = "Fog",
			Image = "DecoFog.png",
			Description = "An area covered in fog.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Fog Falling"] = {
			Name = "Fog Falling",
			Image = "DecoFogFalling.png",
			Description = "A large area of falling fog.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Glow Bright"] = {
			Name = "Glow Bright",
			Image = "DecoGlowBright.png",
			Description = "A point of light that glows brightly.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Gravity Well"] = {
			Name = "Gravity Well",
			Image = "DecoGravityWell.png",
			Description = "A well of gravity pulling in energy.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Gravity Well (Large)"] = {
			Name = "Gravity Well (Large)",
			Image = "DecoGravityWell(Large).png",
			Description = "A large gravity well pulling in surrounding energy.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Heat Distortion"] = {
			Name = "Heat Distortion",
			Image = "DecoHeatDistortion.png",
			Description = "An area of super heated air.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Jet Of Flames (Strong)"] = {
			Name = "Jet Of Flames (Strong)",
			Image = "DecoJetOfFlames(Strong).png",
			Description = "A strong jet of flames.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Jet Of Flames (Weak)"] = {
			Name = "Jet Of Flames (Weak)",
			Image = "DecoJetOfFlames(Weak).png",
			Description = "A weak jet of flames.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Light Cone"] = {
			Name = "Light Cone",
			Image = "DecoLightCone.png",
			Description = "A curtain of light highlighting the humid or dusty air.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Light Rays"] = {
			Name = "Light Rays",
			Image = "DecoLightRays.png",
			Description = "Rays of light passing through the thick air.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Lightning Strike"] = {
			Name = "Lightning Strike",
			Image = "DecoLightningStrike.png",
			Description = "A bolt of lightning striking the ground.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Plasma Cloud"] = {
			Name = "Plasma Cloud",
			Image = "DecoPlasmaCloud.png",
			Description = "A large cloud of plasma.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Rain Drop Splashes"] = {
			Name = "Rain Drop Splashes",
			Image = "DecoRainDropSplashes.png",
			Description = "An area of rain drops splashing on the ground.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Shockwave"] = {
			Name = "Shockwave",
			Image = "DecoShockwave.png",
			Description = "A shockwave of energy bursting out from a center.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Smoke"] = {
			Name = "Smoke",
			Image = "DecoSmoke.png",
			Description = "A column of smoke rising from the surface.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Snow Falling"] = {
			Name = "Snow Falling",
			Image = "DecoSnowFalling.png",
			Description = "An area of gently falling snow.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Spark Explosion (Large)"] = {
			Name = "Spark Explosion (Large)",
			Image = "DecoSparkExplosion(Large).png",
			Description = "A large continual explosion of sparks.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sparkles"] = {
			Name = "Sparkles",
			Image = "DecoSparkles.png",
			Description = "A continuous stream of sparkles.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sparks"] = {
			Name = "Sparks",
			Image = "DecoSparks.png",
			Description = "A small eruption of sparks.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sparks Bursting"] = {
			Name = "Sparks Bursting",
			Image = "DecoSparksBursting.png",
			Description = "A small explosion of sparks bursting from a center.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Steam"] = {
			Name = "Steam",
			Image = "DecoSteam.png",
			Description = "A small jet of steam.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sunburst"] = {
			Name = "Sunburst",
			Image = "DecoSunburst.png",
			Description = "A micro sunburst.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Water Drips"] = {
			Name = "Water Drips",
			Image = "DecoWaterDrips.png",
			Description = "An area of water dripping.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Water Splashes"] = {
			Name = "Water Splashes",
			Image = "DecoWaterSplashes.png",
			Description = "Splashing water.",
			Cost = {
				Capacity = 20,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		}
	},
	Corpus = {
		["Accountant Interface Sled"] = {
			Name = "Accountant Interface Sled",
			Image = "DecoAccountantInterfaceSled.png",
			Description = "A sled chair used by Corpus accountants.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Airlock Door (Left)"] = {
			Name = "Airlock Door (Left)",
			Image = "DecoAirlockDoor(Left).png",
			Description = "A small door panel from a Corpus ship's airlock",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Angle Wall Support"] = {
			Name = "Angle Wall Support",
			Image = "DecoAngleWallSupport.png",
			Description = "A wedge shaped wall support from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Angled Engine Strut"] = {
			Name = "Angled Engine Strut",
			Image = "DecoAngledEngineStrut.png",
			Description = "An angled engine strut from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Angled Support Struct (Concave)"] = {
			Name = "Angled Support Struct (Concave)",
			Image = "DecoAngledSupportStruct(Concave).png",
			Description = "A large, angled support struct with a concave bend.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Angled Support Struct (Convex)"] = {
			Name = "Angled Support Struct (Convex)",
			Image = "DecoAngledSupportStruct(Convex).png",
			Description = "A large, angled support struct with a convex bend.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Auction Platform"] = {
			Name = "Auction Platform",
			Image = "DecoAuctionPlatform.png",
			Description = "A large auctioneer's platform.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Buttress Struct"] = {
			Name = "Buttress Struct",
			Image = "DecoButtressStruct.png",
			Description = "A support buttress from a Corpus ship interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Buttress Struct Cover Plate"] = {
			Name = "Buttress Struct Cover Plate",
			Image = "DecoButtressStructCoverPlate.png",
			Description = "A small metal cover plate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Cast Metal Frame"] = {
			Name = "Cast Metal Frame",
			Image = "DecoCastMetalFrame.png",
			Description = "A cast metal frame backing used to support Corpus art.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Ceiling Truss (12m)"] = {
			Name = "Ceiling Truss (12m)",
			Image = "DecoCeilingTruss(12m).png",
			Description = "A 12m long section of a ceiling support truss.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ceiling Truss (24m)"] = {
			Name = "Ceiling Truss (24m)",
			Image = "DecoCeilingTruss(24m).png",
			Description = "A 24m long section of a ceiling support truss.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ceiling Truss (4m)"] = {
			Name = "Ceiling Truss (4m)",
			Image = "DecoCeilingTruss(4m).png",
			Description = "A 4m long section of a ceiling support truss.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ceiling Truss With Panel (4m)"] = {
			Name = "Ceiling Truss With Panel (4m)",
			Image = "DecoCeilingTrussWithPanel(4m).png",
			Description = "A 4m long section of a ceiling support truss with a lowered access panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Command Platform"] = {
			Name = "Command Platform",
			Image = "DecoCommandPlatform.png",
			Description = "A large platform that designates the command position.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Command Podium"] = {
			Name = "Command Podium",
			Image = "DecoCommandPodium.png",
			Description = "A large podium for an imposing command station.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Commerce Display Case"] = {
			Name = "Commerce Display Case",
			Image = "DecoCommerceDisplayCase.png",
			Description = "A large display case.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Conduit Bare (6m)"] = {
			Name = "Conduit Bare (6m)",
			Image = "DecoConduitBare(6m).png",
			Description = "A 6m bare metal conduit pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Cap"] = {
			Name = "Conduit Cap",
			Image = "DecoConduitCap.png",
			Description = "A conduit pillar cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Case (6m)"] = {
			Name = "Conduit Case (6m)",
			Image = "DecoConduitCase(6m).png",
			Description = "A 6m conduit pillar, with partial blue casing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Connector (6m)"] = {
			Name = "Conduit Connector (6m)",
			Image = "DecoConduitConnector(6m).png",
			Description = "A 6m conduit connector.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Core (6m)"] = {
			Name = "Conduit Core (6m)",
			Image = "DecoConduitCore(6m).png",
			Description = "A 6m conduit pillar core.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Faceted Case (14m)"] = {
			Name = "Conduit Faceted Case (14m)",
			Image = "DecoConduitFacetedCase(14m).png",
			Description = "A 14m tall conduit pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Faceted Case (6m)"] = {
			Name = "Conduit Faceted Case (6m)",
			Image = "DecoConduitFacetedCase(6m).png",
			Description = "A 6m conduit pillar with blue faceted casing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Conduit Terminator (6m)"] = {
			Name = "Conduit Terminator (6m)",
			Image = "DecoConduitTerminator(6m).png",
			Description = "A terminator cap for a conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Containment Chamber"] = {
			Name = "Containment Chamber",
			Image = "DecoContainmentChamber.png",
			Description = "An open containment chamber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Containment Chamber Closed"] = {
			Name = "Containment Chamber Closed",
			Image = "DecoContainmentChamberClosed.png",
			Description = "A closed containment chamber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Containment Frame (15m)"] = {
			Name = "Containment Frame (15m)",
			Image = "DecoContainmentFrame(15m).png",
			Description = "A large frame used in containment cores.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Control Station"] = {
			Name = "Control Station",
			Image = "DecoControlStation.png",
			Description = "A large control station.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Control Station Chair"] = {
			Name = "Control Station Chair",
			Image = "DecoControlStationChair.png",
			Description = "A chair from a Corpus control station.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Corpus Advanced Ship Interface"] = {
			Name = "Corpus Advanced Ship Interface",
			Image = "DecoCorpusAdvancedShipInterface.png",
			Description = "A Corpus ship control module allowing advanced connections.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Air Purifier"] = {
			Name = "Corpus Air Purifier",
			Image = "DecoCorpusAirPurifier.png",
			Description = "A Corpus machine that purifies the air.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 120, Name = "Cryotic" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Barrel"] = {
			Name = "Corpus Barrel",
			Image = "DecoCorpusBarrel.png",
			Description = "A simple Corpus barrel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Barrel Advanced Security"] = {
			Name = "Corpus Barrel Advanced Security",
			Image = "DecoCorpusBarrelAdvancedSecurity.png",
			Description = "A Corpus barrel with built in advanced security.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Barrel Movator"] = {
			Name = "Corpus Barrel Movator",
			Image = "DecoCorpusBarrelMovator.png",
			Description = "A Corpus barrel holding device.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Batteries"] = {
			Name = "Corpus Batteries",
			Image = "DecoCorpusBatteries.png",
			Description = "A stack of Corpus batteries.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Battery Bank"] = {
			Name = "Corpus Battery Bank",
			Image = "DecoCorpusBatteryBank.png",
			Description = "A large battery bank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Battery Cell"] = {
			Name = "Corpus Battery Cell",
			Image = "DecoCorpusBatteryCell.png",
			Description = "A battery cell used in Corpus technology.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Bench"] = {
			Name = "Corpus Bench",
			Image = "DecoCorpusBench.png",
			Description = "A bench.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Biomass Processing Filter"] = {
			Name = "Corpus Biomass Processing Filter",
			Image = "DecoCorpusBiomassProcessingFilter.png",
			Description = "A large machine that filters biomass as a part of the processing pipeline.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Bollard"] = {
			Name = "Corpus Bollard",
			Image = "DecoCorpusBollard.png",
			Description = "A Corpus bollard used the create a barrier to vehicles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Cable Interface"] = {
			Name = "Corpus Cable Interface",
			Image = "DecoCorpusCableInterface.png",
			Description = "A small cable interface conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Capacitor Cap"] = {
			Name = "Corpus Capacitor Cap",
			Image = "DecoCorpusCapacitorCap.png",
			Description = "A device that will cap a Corpus capacitor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Catwalk (2m)"] = {
			Name = "Corpus Catwalk (2m)",
			Image = "DecoCorpusCatwalk(2m).png",
			Description = "A small section of a Corpus catwalk 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Catwalk (6m)"] = {
			Name = "Corpus Catwalk (6m)",
			Image = "DecoCorpusCatwalk(6m).png",
			Description = "A length of the Corpus catwalk system of 6m.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Catwalk Cap"] = {
			Name = "Corpus Catwalk Cap",
			Image = "DecoCorpusCatwalkCap.png",
			Description = "A Corpus designed catwalk end cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Catwalk Joint"] = {
			Name = "Corpus Catwalk Joint",
			Image = "DecoCorpusCatwalkJoint.png",
			Description = "A 4 way joint for the Corpus catwalk system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Catwalk Stairs"] = {
			Name = "Corpus Catwalk Stairs",
			Image = "DecoCorpusCatwalkStairs.png",
			Description = "A section of Corpus stairs part of the catwalk system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Computer"] = {
			Name = "Corpus Computer",
			Image = "DecoCorpusComputer.png",
			Description = "A Corpus computer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Computer Control Interface"] = {
			Name = "Corpus Computer Control Interface",
			Image = "DecoCorpusComputerControlInterface.png",
			Description = "A control interface for Corpus technology.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Computer Diagnostics Array"] = {
			Name = "Corpus Computer Diagnostics Array",
			Image = "DecoCorpusComputerDiagnosticsArray.png",
			Description = "An array of Corpus computer equipment for diagnostics.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Computer Monitoring Array"] = {
			Name = "Corpus Computer Monitoring Array",
			Image = "DecoCorpusComputerMonitoringArray.png",
			Description = "An array of Corpus computer equipment for monitoring.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Corpus Conduit Pillar"] = {
			Name = "Corpus Conduit Pillar",
			Image = "DecoCorpusConduitPillar.png",
			Description = "A pillar used as a conduit for Corpus technology.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Corporate Branding Marker"] = {
			Name = "Corpus Corporate Branding Marker",
			Image = "DecoCorpusCorporateBrandingMarker.png",
			Description = "A large marker that depicts the Corpus corporate brand.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Corporate Flag"] = {
			Name = "Corpus Corporate Flag",
			Image = "DecoCorpusCorporateFlag.png",
			Description = "A large banner representing the Corpus organization.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Data Mining Processing Unit"] = {
			Name = "Corpus Data Mining Processing Unit",
			Image = "DecoCorpusDataMiningProcessingUnit.png",
			Description = "A large data mining processing module.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Emergency Hull Breach Panel"] = {
			Name = "Corpus Emergency Hull Breach Panel",
			Image = "DecoCorpusEmergencyHullBreachPanel.png",
			Description = "A small Corpus emergency hull breach panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Fan Blades (Large)"] = {
			Name = "Corpus Fan Blades (Large)",
			Image = "DecoCorpusFanBlades(Large).png",
			Description = "A large set of Corpus fan blades that rotate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Logistics Controller"] = {
			Name = "Corpus Logistics Controller",
			Image = "DecoCorpusLogisticsController.png",
			Description = "A small mobile control interface for the logistics department.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Pillar"] = {
			Name = "Corpus Pillar",
			Image = "DecoCorpusPillar.png",
			Description = "A large round structural pillar of Corpus design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Pipe (4m)"] = {
			Name = "Corpus Pipe (4m)",
			Image = "DecoCorpusPipe(4m).png",
			Description = "A 4m length of Corpus pipe.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Pipe Corner (45 Degree)"] = {
			Name = "Corpus Pipe Corner (45 Degree)",
			Image = "DecoCorpusPipeCorner(45Degree).png",
			Description = "A Corpus pipe that turns 45 degrees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Pipe Corner (90 Degree)"] = {
			Name = "Corpus Pipe Corner (90 Degree)",
			Image = "DecoCorpusPipeCorner(90Degree).png",
			Description = "A Corpus pipe that turns 90 degrees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Platform"] = {
			Name = "Corpus Platform",
			Image = "DecoCorpusPlatform.png",
			Description = "A Corpus platform.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Robot Crusher Teeth"] = {
			Name = "Corpus Robot Crusher Teeth",
			Image = "DecoCorpusRobotCrusherTeeth.png",
			Description = "A large part of a corpus robot crushing machine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Security Crate"] = {
			Name = "Corpus Security Crate",
			Image = "DecoCorpusSecurityCrate.png",
			Description = "A larger crate used to keep Corpus technology and credits secure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Shelf (Large)"] = {
			Name = "Corpus Shelf (Large)",
			Image = "DecoCorpusShelf(Large).png",
			Description = "A large Corpus shelf.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Shelf (Small)"] = {
			Name = "Corpus Shelf (Small)",
			Image = "DecoCorpusShelf(Small).png",
			Description = "A small Corpus shelf.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Corpus Stackable Storage"] = {
			Name = "Corpus Stackable Storage",
			Image = "DecoCorpusStackableStorage.png",
			Description = "A small Corpus crate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Storage Container"] = {
			Name = "Corpus Storage Container",
			Image = "DecoCorpusStorageContainer.png",
			Description = "A Corpus storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Corpus Wall"] = {
			Name = "Corpus Wall",
			Image = "DecoCorpusWall.png",
			Description = "A large wall made of corpus materials.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Crane Base"] = {
			Name = "Crane Base",
			Image = "DecoCraneBase.png",
			Description = "A crane base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Crewmen Kiosk Base"] = {
			Name = "Crewmen Kiosk Base",
			Image = "DecoCrewmenKioskBase.png",
			Description = "A base of a kiosk used by low level Corpus Crewmen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Crewmen Kiosk Conduit"] = {
			Name = "Crewmen Kiosk Conduit",
			Image = "DecoCrewmenKioskConduit.png",
			Description = "A mechanical conduit that extends above the Crewmen Kiosk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Cryo Platform"] = {
			Name = "Cryo Platform",
			Image = "DecoCryoPlatform.png",
			Description = "A platform used in a cooling assembly.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cryo-Tower Impellor"] = {
			Name = "Cryo-Tower Impellor",
			Image = "DecoCryo-TowerImpellor.png",
			Description = "A large cryo-tower impeller.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cryo-Tower Pillar"] = {
			Name = "Cryo-Tower Pillar",
			Image = "DecoCryo-TowerPillar.png",
			Description = "A large cryo-tower pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Debtors Prison Door (Left)"] = {
			Name = "Debtors Prison Door (Left)",
			Image = "DecoDebtorsPrisonDoor(Left).png",
			Description = "The left-side door panel from a debtors prison cell.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Decorative Frame"] = {
			Name = "Decorative Frame",
			Image = "DecoDecorativeFrame.png",
			Description = "A decorative frame used to house Corpus art.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Deep Socket Power Cell"] = {
			Name = "Deep Socket Power Cell",
			Image = "DecoDeepSocketPowerCell.png",
			Description = "A power cell from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Display Billboard"] = {
			Name = "Display Billboard",
			Image = "DecoDisplayBillboard.png",
			Description = "A large display billboard, requires screen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Display Stand"] = {
			Name = "Display Stand",
			Image = "DecoDisplayStand.png",
			Description = "A small display stand.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Door Panel (Upper)"] = {
			Name = "Door Panel (Upper)",
			Image = "DecoDoorPanel(Upper).png",
			Description = "The upper section of a door panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Dual Interface Station"] = {
			Name = "Dual Interface Station",
			Image = "DecoDualInterfaceStation.png",
			Description = "An interface station designed for two crewmen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Dual-Screen Interface Console"] = {
			Name = "Dual-Screen Interface Console",
			Image = "DecoDual-ScreenInterfaceConsole.png",
			Description = "A dual-screened Corpus interface console.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Elevating Control Platform"] = {
			Name = "Elevating Control Platform",
			Image = "DecoElevatingControlPlatform.png",
			Description = "A circular platform often used as a command platform for high ranking Corpus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Fire Hazard Drone"] = {
			Name = "Fire Hazard Drone",
			Image = "DecoFireHazardDrone.png",
			Description = "A drone used for extinguishing fire hazards.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Fire Hazard Drone Dock"] = {
			Name = "Fire Hazard Drone Dock",
			Image = "DecoFireHazardDroneDock.png",
			Description = "A docking station for a Fire Hazard Drone.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Floor Assembly"] = {
			Name = "Floor Assembly",
			Image = "DecoFloorAssembly.png",
			Description = "A large section of the floor assembly from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Floor Trim (2m)"] = {
			Name = "Floor Trim (2m)",
			Image = "DecoFloorTrim(2m).png",
			Description = "A section of a floor spacer that is 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Floor Trim (4m)"] = {
			Name = "Floor Trim (4m)",
			Image = "DecoFloorTrim(4m).png",
			Description = "A section of a floor spacer that is 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Floor Trim (8m)"] = {
			Name = "Floor Trim (8m)",
			Image = "DecoFloorTrim(8m).png",
			Description = "A section of a floor spacer that is 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Floor Trim Long (2m)"] = {
			Name = "Floor Trim Long (2m)",
			Image = "DecoFloorTrimLong(2m).png",
			Description = "A 2m long section of floor trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Floor Trim Long (4m)"] = {
			Name = "Floor Trim Long (4m)",
			Image = "DecoFloorTrimLong(4m).png",
			Description = "A 4m long section of floor trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Floor Trim Long (6m)"] = {
			Name = "Floor Trim Long (6m)",
			Image = "DecoFloorTrimLong(6m).png",
			Description = "A 6m long section of floor trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Hall Center Struct"] = {
			Name = "Hall Center Struct",
			Image = "DecoHallCenterStruct.png",
			Description = "A center struct from a Corpus ship hallway.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hall Struct"] = {
			Name = "Hall Struct",
			Image = "DecoHallStruct.png",
			Description = "A reinforced fall struct from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hall Struct (Damaged)"] = {
			Name = "Hall Struct (Damaged)",
			Image = "DecoHallStruct(Damaged).png",
			Description = "A damaged hall struct from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hall Struct Base (Short)"] = {
			Name = "Hall Struct Base (Short)",
			Image = "DecoHallStructBase(Short).png",
			Description = "A shorter hall struct base from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hall Struct Base (Tall)"] = {
			Name = "Hall Struct Base (Tall)",
			Image = "DecoHallStructBase(Tall).png",
			Description = "A taller hall struct base from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hall Struct Half-Arch"] = {
			Name = "Hall Struct Half-Arch",
			Image = "DecoHallStructHalf-Arch.png",
			Description = "A reinforced half-struct hall struct.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Handrail (4m)"] = {
			Name = "Handrail (4m)",
			Image = "DecoHandrail(4m).png",
			Description = "A Corpus ship handrail 4m in length",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Handrail (8m)"] = {
			Name = "Handrail (8m)",
			Image = "DecoHandrail(8m).png",
			Description = "A Corpus ship handrail 8m in length",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Holo Screen (Inventory)"] = {
			Name = "Holo Screen (Inventory)",
			Image = "DecoHoloScreen(Inventory).png",
			Description = "A wide holographic screen displaying a catalogue of inventory.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Holo Screen (Profit Meter)"] = {
			Name = "Holo Screen (Profit Meter)",
			Image = "DecoHoloScreen(ProfitMeter).png",
			Description = "A wide holographic screen displaying a profit meter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Holo Screen (System Graph)"] = {
			Name = "Holo Screen (System Graph)",
			Image = "DecoHoloScreen(SystemGraph).png",
			Description = "A wide holographic screen displaying a graph of system performance.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Holo Screen (Top Accounts)"] = {
			Name = "Holo Screen (Top Accounts)",
			Image = "DecoHoloScreen(TopAccounts).png",
			Description = "A wide holographic screen displaying the names of top accounts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Holographic Banner First"] = {
			Name = "Holographic Banner First",
			Image = "DecoHolographicBannerFirst.png",
			Description = "A tall holographic banner with a fist to represent Corpus power.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Holographic Banner Parvos Granum"] = {
			Name = "Holographic Banner Parvos Granum",
			Image = "DecoHolographicBannerParvosGranum.png",
			Description = "A tall holographic banner featuring the Corpus founder, Parvos Granum.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Hull Cap"] = {
			Name = "Hull Cap",
			Image = "DecoHullCap.png",
			Description = "A large circular cap used for sealing ship hulls.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hull Panel"] = {
			Name = "Hull Panel",
			Image = "DecoHullPanel.png",
			Description = "A metal sheet used to patch ship hulls.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Hydraulic Elevator Cylinder"] = {
			Name = "Hydraulic Elevator Cylinder",
			Image = "DecoHydraulicElevatorCylinder.png",
			Description = "A hydraulic cylinder from a Corpus ship elevator.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Large Screen Control Station"] = {
			Name = "Large Screen Control Station",
			Image = "DecoLargeScreenControlStation.png",
			Description = "A Corpus control console with a large screen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Light Bar (Long)"] = {
			Name = "Light Bar (Long)",
			Image = "DecoLightBar(Long).png",
			Description = "A long light bar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Light Bar (Short)"] = {
			Name = "Light Bar (Short)",
			Image = "DecoLightBar(Short).png",
			Description = "A short light bar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Mechanical Housing (Flat)"] = {
			Name = "Mechanical Housing (Flat)",
			Image = "DecoMechanicalHousing(Flat).png",
			Description = "A large, flat housing for mechanical subsystems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Mechanical Housing (Tall)"] = {
			Name = "Mechanical Housing (Tall)",
			Image = "DecoMechanicalHousing(Tall).png",
			Description = "A large, tall housing for mechanical subsystems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Mixing Arm"] = {
			Name = "Mixing Arm",
			Image = "DecoMixingArm.png",
			Description = "A mixing arm for combining hazardous chemicals.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Navigation Interface Console"] = {
			Name = "Navigation Interface Console",
			Image = "DecoNavigationInterfaceConsole.png",
			Description = "A navigation interface console.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Ore Refractometer"] = {
			Name = "Ore Refractometer",
			Image = "DecoOreRefractometer.png",
			Description = "A device for analyzing mined ore.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Portal Door Panel (Lower)"] = {
			Name = "Portal Door Panel (Lower)",
			Image = "DecoPortalDoorPanel(Lower).png",
			Description = "A door panel used in the lower section of a portal.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Portal Door Panel (Upper)"] = {
			Name = "Portal Door Panel (Upper)",
			Image = "DecoPortalDoorPanel(Upper).png",
			Description = "A door panel used in the upper section of a portal.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Power Transformer"] = {
			Name = "Power Transformer",
			Image = "DecoPowerTransformer.png",
			Description = "A Corpus ship power transformer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Reactor Containment Cage"] = {
			Name = "Reactor Containment Cage",
			Image = "DecoReactorContainmentCage.png",
			Description = "A large cage used in Corpus ship reactors.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Reinforced Pillar"] = {
			Name = "Reinforced Pillar",
			Image = "DecoReinforcedPillar.png",
			Description = "A large heavy duty pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Reinforced Pillar (Damaged)"] = {
			Name = "Reinforced Pillar (Damaged)",
			Image = "DecoReinforcedPillar(Damaged).png",
			Description = "A damaged heavy duty pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Reinforced Pillar (Simple)"] = {
			Name = "Reinforced Pillar (Simple)",
			Image = "DecoReinforcedPillar(Simple).png",
			Description = "A large heavy duty pillar with fewer details.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Reinforced Pillar No Cap"] = {
			Name = "Reinforced Pillar No Cap",
			Image = "DecoReinforcedPillarNoCap.png",
			Description = "A reinforced pillar with no top cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Reinforced Pillar Oxidized"] = {
			Name = "Reinforced Pillar Oxidized",
			Image = "DecoReinforcedPillarOxidized.png",
			Description = "A large heavy duty pillar with oxidized coloration.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Repair Station Platform"] = {
			Name = "Repair Station Platform",
			Image = "DecoRepairStationPlatform.png",
			Description = "A large platform used at repair stations.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Safety Light"] = {
			Name = "Safety Light",
			Image = "DecoSafetyLight.png",
			Description = "A small light fixture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Security Bollard"] = {
			Name = "Security Bollard",
			Image = "DecoSecurityBollard.png",
			Description = "A Corpus security bollard.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk (12m)"] = {
			Name = "Ship Catwalk (12m)",
			Image = "DecoShipCatwalk(12m).png",
			Description = "A 12m long section of the ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk (2m)"] = {
			Name = "Ship Catwalk (2m)",
			Image = "DecoShipCatwalk(2m).png",
			Description = "A 2m long section of the ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk (4m)"] = {
			Name = "Ship Catwalk (4m)",
			Image = "DecoShipCatwalk(4m).png",
			Description = "A 4m long section of the ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk (8m)"] = {
			Name = "Ship Catwalk (8m)",
			Image = "DecoShipCatwalk(8m).png",
			Description = "A 8m long section of the ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk Corner (45 Degrees)"] = {
			Name = "Ship Catwalk Corner (45 Degrees)",
			Image = "DecoShipCatwalkCorner(45Degrees).png",
			Description = "A 90 degree corner section of ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk Corner (90 Degrees)"] = {
			Name = "Ship Catwalk Corner (90 Degrees)",
			Image = "DecoShipCatwalkCorner(90Degrees).png",
			Description = "A 45 degree corner section of ship catwalk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk Railing (4m)"] = {
			Name = "Ship Catwalk Railing (4m)",
			Image = "DecoShipCatwalkRailing(4m).png",
			Description = "A piece of solid catwalk railing that is 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Catwalk Railing (8m)"] = {
			Name = "Ship Catwalk Railing (8m)",
			Image = "DecoShipCatwalkRailing(8m).png",
			Description = "A piece of solid catwalk railing that is 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile (12 X 12m)"] = {
			Name = "Ship Floor Tile (12 X 12m)",
			Image = "DecoShipFloorTile(12X12m).png",
			Description = "A large floor tile that is a 12m square.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile (4 X 4m)"] = {
			Name = "Ship Floor Tile (4 X 4m)",
			Image = "DecoShipFloorTile(4X4m).png",
			Description = "A large floor tile that is a 4m square.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile (4 X 8m)"] = {
			Name = "Ship Floor Tile (4 X 8m)",
			Image = "DecoShipFloorTile(4X8m).png",
			Description = "A 4 x 8m section of floor tile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile Blue (4 X 8m)"] = {
			Name = "Ship Floor Tile Blue (4 X 8m)",
			Image = "DecoShipFloorTileBlue(4X8m).png",
			Description = "A 4 x 8m section of floor tile with a blue path.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile Center Path (12 X 12m)"] = {
			Name = "Ship Floor Tile Center Path (12 X 12m)",
			Image = "DecoShipFloorTileCenterPath(12X12m).png",
			Description = "A large floor tile that is a 12m square with a wide central blue path.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile Inside Corner (4 X 4m)"] = {
			Name = "Ship Floor Tile Inside Corner (4 X 4m)",
			Image = "DecoShipFloorTileInsideCorner(4X4m).png",
			Description = "A 4m square section of floor tile with a blue inside corner path.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Floor Tile Outside Corner (4 X 4m)"] = {
			Name = "Ship Floor Tile Outside Corner (4 X 4m)",
			Image = "DecoShipFloorTileOutsideCorner(4X4m).png",
			Description = "A 4m square section of floor tile with an blue outside corner path.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Reactor Core"] = {
			Name = "Ship Reactor Core",
			Image = "DecoShipReactorCore.png",
			Description = "A large Corpus ship reactor core.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Ship Umbilical Cord"] = {
			Name = "Ship Umbilical Cord",
			Image = "DecoShipUmbilicalCord.png",
			Description = "A very large ring that connects two ships for transfers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ship Wall (12m)"] = {
			Name = "Ship Wall (12m)",
			Image = "DecoShipWall(12m).png",
			Description = "A Corpus ship wall section 12m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall (16m)"] = {
			Name = "Ship Wall (16m)",
			Image = "DecoShipWall(16m).png",
			Description = "A Corpus ship wall section 16m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall (8m)"] = {
			Name = "Ship Wall (8m)",
			Image = "DecoShipWall(8m).png",
			Description = "A Corpus ship wall section 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Left (12m)"] = {
			Name = "Ship Wall Damaged Left (12m)",
			Image = "DecoShipWallDamagedLeft(12m).png",
			Description = "A Corpus ship wall section, 12m in length, with left side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Left (1m)"] = {
			Name = "Ship Wall Damaged Left (1m)",
			Image = "DecoShipWallDamagedLeft(1m).png",
			Description = "A Corpus ship wall section, 1m in length, with left side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Left (3m)"] = {
			Name = "Ship Wall Damaged Left (3m)",
			Image = "DecoShipWallDamagedLeft(3m).png",
			Description = "A Corpus ship wall section, 3m in length, with left side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Right (12m)"] = {
			Name = "Ship Wall Damaged Right (12m)",
			Image = "DecoShipWallDamagedRight(12m).png",
			Description = "A Corpus ship wall section, 12m in length, with right side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Right (1m)"] = {
			Name = "Ship Wall Damaged Right (1m)",
			Image = "DecoShipWallDamagedRight(1m).png",
			Description = "A Corpus ship wall section, 1m in length, with right side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Wall Damaged Right (3m)"] = {
			Name = "Ship Wall Damaged Right (3m)",
			Image = "DecoShipWallDamagedRight(3m).png",
			Description = "A Corpus ship wall section, 3m in length, with right side damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Frame (12m)"] = {
			Name = "Ship Window Frame (12m)",
			Image = "DecoShipWindowFrame(12m).png",
			Description = "A Corpus ship window frame that is 12m long.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Frame (Tall)"] = {
			Name = "Ship Window Frame (Tall)",
			Image = "DecoShipWindowFrame(Tall).png",
			Description = "A tall Corpus ship window frame with 3 panes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Spar (12m)"] = {
			Name = "Ship Window Spar (12m)",
			Image = "DecoShipWindowSpar(12m).png",
			Description = "A 12m window frame spar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Spar (24m)"] = {
			Name = "Ship Window Spar (24m)",
			Image = "DecoShipWindowSpar(24m).png",
			Description = "A 24m window frame spar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Spar (3m)"] = {
			Name = "Ship Window Spar (3m)",
			Image = "DecoShipWindowSpar(3m).png",
			Description = "A 3m window frame spar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Ship Window Spar (6m)"] = {
			Name = "Ship Window Spar (6m)",
			Image = "DecoShipWindowSpar(6m).png",
			Description = "A 6m window frame spar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Shrine Base (Long)"] = {
			Name = "Shrine Base (Long)",
			Image = "DecoShrineBase(Long).png",
			Description = "A long base of a shrine to The Corpus founder, Parvos Granum.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Shrine Base (Short)"] = {
			Name = "Shrine Base (Short)",
			Image = "DecoShrineBase(Short).png",
			Description = "A short base of a shrine to The Corpus founder, Parvos Granum.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Socket Panel"] = {
			Name = "Socket Panel",
			Image = "DecoSocketPanel.png",
			Description = "A panel used to cover large sockets.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Socket Panel (Damaged)"] = {
			Name = "Socket Panel (Damaged)",
			Image = "DecoSocketPanel(Damaged).png",
			Description = "A damaged socket panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Solid Rail Panel (4m)"] = {
			Name = "Solid Rail Panel (4m)",
			Image = "DecoSolidRailPanel(4m).png",
			Description = "A 4m long panel of railing from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Solid Rail Panel (8m)"] = {
			Name = "Solid Rail Panel (8m)",
			Image = "DecoSolidRailPanel(8m).png",
			Description = "A 8m long panel of railing from a Corpus ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Structural Frame (Damaged)"] = {
			Name = "Structural Frame (Damaged)",
			Image = "DecoStructuralFrame(Damaged).png",
			Description = "A damaged Corpus structural frame.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Sub-Floor Channel (2m)"] = {
			Name = "Sub-Floor Channel (2m)",
			Image = "DecoSub-FloorChannel(2m).png",
			Description = "A section of sub floor channel 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Sub-Floor Channel (4m)"] = {
			Name = "Sub-Floor Channel (4m)",
			Image = "DecoSub-FloorChannel(4m).png",
			Description = "A section of sub floor channel 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Sub-Floor Channel (8m)"] = {
			Name = "Sub-Floor Channel (8m)",
			Image = "DecoSub-FloorChannel(8m).png",
			Description = "A section of sub floor channel 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Sub-Floor Ramp Support"] = {
			Name = "Sub-Floor Ramp Support",
			Image = "DecoSub-FloorRampSupport.png",
			Description = "A ramping section of sub-floor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Suit Recharge Dock"] = {
			Name = "Suit Recharge Dock",
			Image = "DecoSuitRechargeDock.png",
			Description = "A recharging dock for Crewmen suits.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Support Beam (12m)"] = {
			Name = "Support Beam (12m)",
			Image = "DecoSupportBeam(12m).png",
			Description = "A large 12m support beam.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Beam (3m)"] = {
			Name = "Support Beam (3m)",
			Image = "DecoSupportBeam(3m).png",
			Description = "A stubby support beam that is 3m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Beam (6m)"] = {
			Name = "Support Beam (6m)",
			Image = "DecoSupportBeam(6m).png",
			Description = "A support beam that is 6m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Beam Damaged (6m)"] = {
			Name = "Support Beam Damaged (6m)",
			Image = "DecoSupportBeamDamaged(6m).png",
			Description = "A support beam that is 6m in length, and damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Beam Indented (12m)"] = {
			Name = "Support Beam Indented (12m)",
			Image = "DecoSupportBeamIndented(12m).png",
			Description = "A large, 12m support with an indented middle section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Beam Indented (6m)"] = {
			Name = "Support Beam Indented (6m)",
			Image = "DecoSupportBeamIndented(6m).png",
			Description = "A large, 6m support with an indented middle section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Support Clamp"] = {
			Name = "Support Clamp",
			Image = "DecoSupportClamp.png",
			Description = "A clamp used for securing large equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Support Joist"] = {
			Name = "Support Joist",
			Image = "DecoSupportJoist.png",
			Description = "A structural support joist.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Thin Beam"] = {
			Name = "Thin Beam",
			Image = "DecoThinBeam.png",
			Description = "A tall and thin beam.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Transaction Interface"] = {
			Name = "Transaction Interface",
			Image = "DecoTransactionInterface.png",
			Description = "A small console that processes transactions, including crewmen's wages.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Turret Base"] = {
			Name = "Turret Base",
			Image = "DecoTurretBase.png",
			Description = "A base for a turret.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Wall Trim (2m)"] = {
			Name = "Wall Trim (2m)",
			Image = "DecoWallTrim(2m).png",
			Description = "A section of trim 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Wall Trim (6m)"] = {
			Name = "Wall Trim (6m)",
			Image = "DecoWallTrim(6m).png",
			Description = "A section of trim 6m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Wall Trim Inside Corner"] = {
			Name = "Wall Trim Inside Corner",
			Image = "DecoWallTrimInsideCorner.png",
			Description = "A section of trim that goes inside corners.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Wall Trim Outside Corner"] = {
			Name = "Wall Trim Outside Corner",
			Image = "DecoWallTrimOutsideCorner.png",
			Description = "A section of trim that goes outside corners.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Winged Column"] = {
			Name = "Winged Column",
			Image = "DecoWingedColumn.png",
			Description = "A Corpus ship column that has winged designed elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		}
	},
	Festive = {
		["Blue Present"] = {
			Name = "Blue Present",
			Image = "DecoBluePresent.png",
			Description = "A present wrapped in blue paper.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Festive Garland"] = {
			Name = "Festive Garland",
			Image = "DecoFestiveGarland.png",
			Description = "Festive decorations made of leaves.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 100, Name = "Ferrite" },
					{ Count = 30, Name = "Alloy Plate" },
					{ Count = 30, Name = "Rubedo" },
					{ Count = 0.06, Name = "Gallium" }
				}
			}
		},
		["Festive Mistletoe"] = {
			Name = "Festive Mistletoe",
			Image = "DecoFestiveMistletoe.png",
			Description = "A branch of mistletoe.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 100, Name = "Ferrite" },
					{ Count = 20, Name = "Alloy Plate" },
					{ Count = 30, Name = "Plastids" },
					{ Count = 0.04, Name = "Oxium" }
				}
			}
		},
		["Festive Snowdrift"] = {
			Name = "Festive Snowdrift",
			Image = "DecoFestiveSnowdrift.png",
			Description = "A snowdrift sustained by a Cryotic Core.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Polymer Bundle" },
					{ Count = 30, Name = "Plastids" },
					{ Count = 20, Name = "Circuits" },
					{ Count = 0.04, Name = "Cryotic" }
				}
			}
		},
		["Festive Snowman"] = {
			Name = "Festive Snowman",
			Image = "DecoFestiveSnowman.png",
			Description = "A snowman sustained by a Cryotic Core.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Ferrite" },
					{ Count = 40, Name = "Plastids" },
					{ Count = 35, Name = "Rubedo" },
					{ Count = 0.04, Name = "Cryotic" }
				}
			}
		},
		["Festive Tree"] = {
			Name = "Festive Tree",
			Image = "DecoFestiveTree.png",
			Description = "A tree decorated with festive lights and tinsel.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Festive Wreath"] = {
			Name = "Festive Wreath",
			Image = "DecoFestiveWreath.png",
			Description = "A festive decoration.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 100, Name = "Salvage" },
					{ Count = 25, Name = "Alloy Plate" },
					{ Count = 35, Name = "Plastids" },
					{ Count = 0.04, Name = "Morphics" }
				}
			}
		},
		["Green Present"] = {
			Name = "Green Present",
			Image = "DecoGreenPresent.png",
			Description = "A present wrapped in green paper.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Lotus Wreath"] = {
			Name = "Lotus Wreath",
			Image = "DecoLotusWreath.png",
			Description = "A wreath shaped like the Lotus symbol.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 110, Name = "Salvage" },
					{ Count = 30, Name = "Alloy Plate" },
					{ Count = 35, Name = "Rubedo" },
					{ Count = 0.04, Name = "Morphics" }
				}
			}
		},
		["Purple Present"] = {
			Name = "Purple Present",
			Image = "DecoPurplePresent.png",
			Description = "A present wrapped in purple paper.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Red Bow"] = {
			Name = "Red Bow",
			Image = "DecoRedBow.png",
			Description = "A decorative bow.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Red Ribbon"] = {
			Name = "Red Ribbon",
			Image = "DecoRedRibbon.png",
			Description = "A decorative ribbon.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 120, Name = "Salvage" },
					{ Count = 40, Name = "Circuits" },
					{ Count = 25, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		}
	},
	Grineer = {
		["Advanced Cannon Projectile"] = {
			Name = "Advanced Cannon Projectile",
			Image = "DecoAdvancedCannonProjectile.png",
			Description = "A powerful Grineer projectile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Advanced Cannon Projectile Cap"] = {
			Name = "Advanced Cannon Projectile Cap",
			Image = "DecoAdvancedCannonProjectileCap.png",
			Description = "The cover of a powerful Grineer projectile case.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Advanced Cannon Projectile Casing"] = {
			Name = "Advanced Cannon Projectile Casing",
			Image = "DecoAdvancedCannonProjectileCasing.png",
			Description = "The empty casing of a powerful Grineer projectile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Armored Roof"] = {
			Name = "Armored Roof",
			Image = "DecoArmoredRoof.png",
			Description = "An armored roof.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Armored Roof (Tall)"] = {
			Name = "Armored Roof (Tall)",
			Image = "DecoArmoredRoof(Tall).png",
			Description = "A tall armored roof.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Armored Wall Murder Hole Door Panel (Lower)"] = {
			Name = "Armored Wall Murder Hole Door Panel (Lower)",
			Image = "DecoArmoredWallMurderHoleDoorPanel(Lower).png",
			Description = "The lower door panel used on armored wall murder holes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Armored Wall Murder Hole Door Panel (Upper)"] = {
			Name = "Armored Wall Murder Hole Door Panel (Upper)",
			Image = "DecoArmoredWallMurderHoleDoorPanel(Upper).png",
			Description = "The upper door panel used on armored wall murder holes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Armored Wall With Murder Hole (One Section)"] = {
			Name = "Armored Wall With Murder Hole (One Section)",
			Image = "DecoArmoredWallWithMurderHole(OneSection).png",
			Description = "A single section of armored wall with murder hole.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Armored Wall With Murder Hole (Two Sections)"] = {
			Name = "Armored Wall With Murder Hole (Two Sections)",
			Image = "DecoArmoredWallWithMurderHole(TwoSections).png",
			Description = "Two sections of armored wall with murder holes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Artifact Monitor Base"] = {
			Name = "Artifact Monitor Base",
			Image = "DecoArtifactMonitorBase.png",
			Description = "The base of a Grineer device used to monitor ancient artifacts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Artifact Monitor Core"] = {
			Name = "Artifact Monitor Core",
			Image = "DecoArtifactMonitorCore.png",
			Description = "The core of a Grineer device used to monitor ancient artifacts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artifact Monitor Shield"] = {
			Name = "Artifact Monitor Shield",
			Image = "DecoArtifactMonitorShield.png",
			Description = "A shield used to protect artifacts excavated by the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artifact Monitor Trim"] = {
			Name = "Artifact Monitor Trim",
			Image = "DecoArtifactMonitorTrim.png",
			Description = "A trim that secures the Grineer device that monitors ancient artifacts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Asteroid Saw"] = {
			Name = "Asteroid Saw",
			Image = "DecoAsteroidSaw.png",
			Description = "An industrial rock saw.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Banner Of The Queens"] = {
			Name = "Banner Of The Queens",
			Image = "DecoBannerOfTheQueens.png",
			Description = "The Queens' banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Base Of A Grineer Laser Scanning System"] = {
			Name = "Base Of A Grineer Laser Scanning System",
			Image = "DecoBaseOfAGrineerLaserScanningSystem.png",
			Description = "The base of a Grineer laser scanning system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bay Door Reinforcement Trim"] = {
			Name = "Bay Door Reinforcement Trim",
			Image = "DecoBayDoorReinforcementTrim.png",
			Description = "A large bay door trim used to reinforce openings.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Beam (Articulated)"] = {
			Name = "Beam (Articulated)",
			Image = "DecoBeam(Articulated).png",
			Description = "Articulated beam used in support system of the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Beam (Base)"] = {
			Name = "Beam (Base)",
			Image = "DecoBeam(Base).png",
			Description = "The base of the articulated beam support system used by the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bulwark"] = {
			Name = "Bulwark",
			Image = "DecoBulwark.png",
			Description = "A bulwark section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (90 Degree Corner, Open)"] = {
			Name = "Bulwark (90 Degree Corner, Open)",
			Image = "DecoBulwark(90DegreeCorner,Open).png",
			Description = "A 90 degree corner section of bulwark with openings for defense.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (90 Degree Corner)"] = {
			Name = "Bulwark (90 Degree Corner)",
			Image = "DecoBulwark(90DegreeCorner).png",
			Description = "A 90 degree corner bulwark section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (Corner)"] = {
			Name = "Bulwark (Corner)",
			Image = "DecoBulwark(Corner).png",
			Description = "A bulwark corner section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (Damaged)"] = {
			Name = "Bulwark (Damaged)",
			Image = "DecoBulwark(Damaged).png",
			Description = "A bulwark section that is damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (Inward Corner)"] = {
			Name = "Bulwark (Inward Corner)",
			Image = "DecoBulwark(InwardCorner).png",
			Description = "An inward corner bulwark section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark (Open)"] = {
			Name = "Bulwark (Open)",
			Image = "DecoBulwark(Open).png",
			Description = "A section of bulwark with an opening for defense.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bulwark Buttress"] = {
			Name = "Bulwark Buttress",
			Image = "DecoBulwarkButtress.png",
			Description = "A bulwark buttress.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark Buttress Without Light"] = {
			Name = "Bulwark Buttress Without Light",
			Image = "DecoBulwarkButtressWithoutLight.png",
			Description = "A bulwark buttress without a light.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bulwark Endcap (Left)"] = {
			Name = "Bulwark Endcap (Left)",
			Image = "DecoBulwarkEndcap(Left).png",
			Description = "A left endcap for the bulwark.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bulwark Endcap (Right)"] = {
			Name = "Bulwark Endcap (Right)",
			Image = "DecoBulwarkEndcap(Right).png",
			Description = "A right endcap for the bulwark.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cable Run (Curved 2m)"] = {
			Name = "Cable Run (Curved 2m)",
			Image = "DecoCableRun(Curved2m).png",
			Description = "A 2m length of cable that is curved 90 degrees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cable Run (Straight 12m)"] = {
			Name = "Cable Run (Straight 12m)",
			Image = "DecoCableRun(Straight12m).png",
			Description = "A 12m length of straight cable.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cable Run (Straight 4m)"] = {
			Name = "Cable Run (Straight 4m)",
			Image = "DecoCableRun(Straight4m).png",
			Description = "A 4m length of straight cable.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Camshaft Housing"] = {
			Name = "Camshaft Housing",
			Image = "DecoCamshaftHousing.png",
			Description = "A Grineer water pump camshaft housing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cannon Projectile"] = {
			Name = "Cannon Projectile",
			Image = "DecoCannonProjectile.png",
			Description = "A standard Grineer projectile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cannon Projectile Casing"] = {
			Name = "Cannon Projectile Casing",
			Image = "DecoCannonProjectileCasing.png",
			Description = "The empty casing of a standard Grineer projectile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Centrifuge Ring"] = {
			Name = "Centrifuge Ring",
			Image = "DecoCentrifugeRing.png",
			Description = "A large centrifuge ring that houses cloning material for processing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Clone Storage Base"] = {
			Name = "Clone Storage Base",
			Image = "DecoCloneStorageBase.png",
			Description = "Stores single clone pods.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Cauldron (Base)"] = {
			Name = "Cloning Cauldron (Base)",
			Image = "DecoCloningCauldron(Base).png",
			Description = "A large support base for the cloning cauldron.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Cauldron (Empty)"] = {
			Name = "Cloning Cauldron (Empty)",
			Image = "DecoCloningCauldron(Empty).png",
			Description = "The cloning cauldron without fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Cauldron (Support Strut)"] = {
			Name = "Cloning Cauldron (Support Strut)",
			Image = "DecoCloningCauldron(SupportStrut).png",
			Description = "A strut used to support the large cloning cauldron.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Cauldron (With Fluid)"] = {
			Name = "Cloning Cauldron (With Fluid)",
			Image = "DecoCloningCauldron(WithFluid).png",
			Description = "The cloning cauldron filled with fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Machine (Base)"] = {
			Name = "Cloning Machine (Base)",
			Image = "DecoCloningMachine(Base).png",
			Description = "A base structure used by different cloning machine components.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Machine (Combiner)"] = {
			Name = "Cloning Machine (Combiner)",
			Image = "DecoCloningMachine(Combiner).png",
			Description = "A machine used to combine materials used in cloning.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Machine (Control Console)"] = {
			Name = "Cloning Machine (Control Console)",
			Image = "DecoCloningMachine(ControlConsole).png",
			Description = "A console used to control various cloning machines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Machine (Distiller)"] = {
			Name = "Cloning Machine (Distiller)",
			Image = "DecoCloningMachine(Distiller).png",
			Description = "A machine that distills materials used in cloning.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Machine (Flask)"] = {
			Name = "Cloning Machine (Flask)",
			Image = "DecoCloningMachine(Flask).png",
			Description = "A flask used with cloning machines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Machine (Floor Plate)"] = {
			Name = "Cloning Machine (Floor Plate)",
			Image = "DecoCloningMachine(FloorPlate).png",
			Description = "A floor plate to catch spills from equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cloning Machine (Grower)"] = {
			Name = "Cloning Machine (Grower)",
			Image = "DecoCloningMachine(Grower).png",
			Description = "A large machine that grows the clones in pods.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Machine (Interface)"] = {
			Name = "Cloning Machine (Interface)",
			Image = "DecoCloningMachine(Interface).png",
			Description = "A machine used to interface with cloning machines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Machine (Pipe)"] = {
			Name = "Cloning Machine (Pipe)",
			Image = "DecoCloningMachine(Pipe).png",
			Description = "A large pipe used to inject materials into various machines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Machine (Pod Connector)"] = {
			Name = "Cloning Machine (Pod Connector)",
			Image = "DecoCloningMachine(PodConnector).png",
			Description = "A machine that connects cloning pods together during indoctrination.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cloning Machine (Separator)"] = {
			Name = "Cloning Machine (Separator)",
			Image = "DecoCloningMachine(Separator).png",
			Description = "A machine used to separate materials used in cloning.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cloning Pod (Open)"] = {
			Name = "Cloning Pod (Open)",
			Image = "DecoCloningPod(Open).png",
			Description = "A open cloning pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cloning Pod (With Fluid)"] = {
			Name = "Cloning Pod (With Fluid)",
			Image = "DecoCloningPod(WithFluid).png",
			Description = "A cloning pod filled with fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cloning Pod Clamp"] = {
			Name = "Cloning Pod Clamp",
			Image = "DecoCloningPodClamp.png",
			Description = "A clamp used for sensitive maneuvering of cloning pods.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cloning Pod Housing"] = {
			Name = "Cloning Pod Housing",
			Image = "DecoCloningPodHousing.png",
			Description = "A large pod housing structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cloning Supervisor Housing"] = {
			Name = "Cloning Supervisor Housing",
			Image = "DecoCloningSupervisorHousing.png",
			Description = "A housing used by a cloning supervisor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cloning Technician Housing"] = {
			Name = "Cloning Technician Housing",
			Image = "DecoCloningTechnicianHousing.png",
			Description = "A housing for a cloning technician drone.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Combine Shaft"] = {
			Name = "Combine Shaft",
			Image = "DecoCombineShaft.png",
			Description = "A component used in a Grineer processing machine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Composting Dumpster"] = {
			Name = "Composting Dumpster",
			Image = "DecoCompostingDumpster.png",
			Description = "A large bin used to compost natural debris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Conduit"] = {
			Name = "Conduit",
			Image = "DecoConduit.png",
			Description = "A large Grineer conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Control Console"] = {
			Name = "Control Console",
			Image = "DecoControlConsole.png",
			Description = "A control console used on Grineer machinery.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Dna Injector"] = {
			Name = "Dna Injector",
			Image = "DecoDnaInjector.png",
			Description = "A machine used to inject DNA into Grineer personnel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Dragon's Tooth Weapon System"] = {
			Name = "Dragon's Tooth Weapon System",
			Image = "DecoDragon'sToothWeaponSystem.png",
			Description = "A Grineer anti-personnel weapon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Electric Turret"] = {
			Name = "Electric Turret",
			Image = "DecoElectricTurret.png",
			Description = "An electric turret weapon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Energy Conduit"] = {
			Name = "Energy Conduit",
			Image = "DecoEnergyConduit.png",
			Description = "A conduit used with the Grineer cloning machines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Flame Thrower Turret"] = {
			Name = "Flame Thrower Turret",
			Image = "DecoFlameThrowerTurret.png",
			Description = "A flame thrower turret.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Cable Conduit"] = {
			Name = "Floor Cable Conduit",
			Image = "DecoFloorCableConduit.png",
			Description = "A floor cable conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Window (Large)"] = {
			Name = "Floor Window (Large)",
			Image = "DecoFloorWindow(Large).png",
			Description = "A large floor window found in underwater Grineer bases.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Floor Window (Medium)"] = {
			Name = "Floor Window (Medium)",
			Image = "DecoFloorWindow(Medium).png",
			Description = "A meduit floor window found in underwater Grineer bases.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Floor Window (Small)"] = {
			Name = "Floor Window (Small)",
			Image = "DecoFloorWindow(Small).png",
			Description = "A small floor window found in underwater Grineer bases.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Armored Door"] = {
			Name = "Fortress Armored Door",
			Image = "DecoFortressArmoredDoor.png",
			Description = "An armored door used in the Grineer Fortress.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Bulkhead (Large)"] = {
			Name = "Fortress Bulkhead (Large)",
			Image = "DecoFortressBulkhead(Large).png",
			Description = "A large Fortress bulkhead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Bulkhead (Very Large)"] = {
			Name = "Fortress Bulkhead (Very Large)",
			Image = "DecoFortressBulkhead(VeryLarge).png",
			Description = "A very large Fortress bulkhead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Door Lock"] = {
			Name = "Fortress Door Lock",
			Image = "DecoFortressDoorLock.png",
			Description = "A large locking mechanism used on Fortress doors.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Door Platform"] = {
			Name = "Fortress Door Platform",
			Image = "DecoFortressDoorPlatform.png",
			Description = "A platform used as a part of the Fortress armored door rail system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Door Rail Platform"] = {
			Name = "Fortress Door Rail Platform",
			Image = "DecoFortressDoorRailPlatform.png",
			Description = "A rail platform that supports the armored doors in the Grineer Fortress.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fortress Pillar"] = {
			Name = "Fortress Pillar",
			Image = "DecoFortressPillar.png",
			Description = "A Fortress pillar top.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Fortress Pillar Base"] = {
			Name = "Fortress Pillar Base",
			Image = "DecoFortressPillarBase.png",
			Description = "A Fortress pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Fortress Pillar Top"] = {
			Name = "Fortress Pillar Top",
			Image = "DecoFortressPillarTop.png",
			Description = "A Fortress pillar base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Fortress Tether Ring"] = {
			Name = "Fortress Tether Ring",
			Image = "DecoFortressTetherRing.png",
			Description = "A large ring used to tether items to the Fortress.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Corner Trim (1m Inward)"] = {
			Name = "Galleon Corner Trim (1m Inward)",
			Image = "DecoGalleonCornerTrim(1mInward).png",
			Description = "A 1m inner section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Corner Trim (1m Outward)"] = {
			Name = "Galleon Corner Trim (1m Outward)",
			Image = "DecoGalleonCornerTrim(1mOutward).png",
			Description = "A 1m outer section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Corner Trim (2m Inward)"] = {
			Name = "Galleon Corner Trim (2m Inward)",
			Image = "DecoGalleonCornerTrim(2mInward).png",
			Description = "A 2m inner section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Corner Trim (2m Outward)"] = {
			Name = "Galleon Corner Trim (2m Outward)",
			Image = "DecoGalleonCornerTrim(2mOutward).png",
			Description = "A 2m outer section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Corner Trim (4m Inward)"] = {
			Name = "Galleon Corner Trim (4m Inward)",
			Image = "DecoGalleonCornerTrim(4mInward).png",
			Description = "A 4m inner section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Corner Trim (4m Outward)"] = {
			Name = "Galleon Corner Trim (4m Outward)",
			Image = "DecoGalleonCornerTrim(4mOutward).png",
			Description = "A 4m outer section of corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Corner Trim (Sharp Inward)"] = {
			Name = "Galleon Corner Trim (Sharp Inward)",
			Image = "DecoGalleonCornerTrim(SharpInward).png",
			Description = "A sharp inner corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Corner Trim (Sharp Outward)"] = {
			Name = "Galleon Corner Trim (Sharp Outward)",
			Image = "DecoGalleonCornerTrim(SharpOutward).png",
			Description = "A sharp outer corner trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Floor Panel (Armored, Corner)"] = {
			Name = "Galleon Floor Panel (Armored, Corner)",
			Image = "DecoGalleonFloorPanel(Armored,Corner).png",
			Description = "A corner section for reinforced Grineer Galleon floor panels.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Floor Panel (Armored, Slim)"] = {
			Name = "Galleon Floor Panel (Armored, Slim)",
			Image = "DecoGalleonFloorPanel(Armored,Slim).png",
			Description = "A slim reinforced Grineer Galleon floor panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Floor Panel (Armored, Wide)"] = {
			Name = "Galleon Floor Panel (Armored, Wide)",
			Image = "DecoGalleonFloorPanel(Armored,Wide).png",
			Description = "A wide reinforced Grineer Galleon floor panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Floor Panel (Cargo, End)"] = {
			Name = "Galleon Floor Panel (Cargo, End)",
			Image = "DecoGalleonFloorPanel(Cargo,End).png",
			Description = "A section cap for Grineer Galleon panels built to secure cargo.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Floor Panel (Cargo, Middle)"] = {
			Name = "Galleon Floor Panel (Cargo, Middle)",
			Image = "DecoGalleonFloorPanel(Cargo,Middle).png",
			Description = "A mid-section Grineer Galleon floor panel built to secure cargo.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Floor Panel (Diamond, Corner)"] = {
			Name = "Galleon Floor Panel (Diamond, Corner)",
			Image = "DecoGalleonFloorPanel(Diamond,Corner).png",
			Description = "A corner section for Grineer Galleon floor panel with diamond plating.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Floor Panel (Diamond, Slim)"] = {
			Name = "Galleon Floor Panel (Diamond, Slim)",
			Image = "DecoGalleonFloorPanel(Diamond,Slim).png",
			Description = "A slim Grineer Galleon floor panel with diamond plating.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Floor Panel (Diamond, Wide)"] = {
			Name = "Galleon Floor Panel (Diamond, Wide)",
			Image = "DecoGalleonFloorPanel(Diamond,Wide).png",
			Description = "A wide Grineer Galleon floor panel with diamond plating.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Floor Panel (Tie Down, Corner)"] = {
			Name = "Galleon Floor Panel (Tie Down, Corner)",
			Image = "DecoGalleonFloorPanel(TieDown,Corner).png",
			Description = "A corner section for Grineer Galleon floor panels with built-in tie downs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Floor Panel (Tie Down, End)"] = {
			Name = "Galleon Floor Panel (Tie Down, End)",
			Image = "DecoGalleonFloorPanel(TieDown,End).png",
			Description = "A section cap for Grineer Galleon floor panels with built-in tie downs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Floor Panel (Tie Down, Middle)"] = {
			Name = "Galleon Floor Panel (Tie Down, Middle)",
			Image = "DecoGalleonFloorPanel(TieDown,Middle).png",
			Description = "A mid-section Grineer Galleon floor panel with built-in tie downs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Floor Panel (Tie Down, Slim)"] = {
			Name = "Galleon Floor Panel (Tie Down, Slim)",
			Image = "DecoGalleonFloorPanel(TieDown,Slim).png",
			Description = "A slim Grineer Galleon floor panel with built-in tie downs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Floor Panel (Tie Down, Wide)"] = {
			Name = "Galleon Floor Panel (Tie Down, Wide)",
			Image = "DecoGalleonFloorPanel(TieDown,Wide).png",
			Description = "A wide Grineer Galleon floor panel with built-in tie downs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Floor Vent"] = {
			Name = "Galleon Floor Vent",
			Image = "DecoGalleonFloorVent.png",
			Description = "Floor vent casing for Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Grate (Curved)"] = {
			Name = "Galleon Grate (Curved)",
			Image = "DecoGalleonGrate(Curved).png",
			Description = "A curved grate panel found on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Grate (Rectangular)"] = {
			Name = "Galleon Grate (Rectangular)",
			Image = "DecoGalleonGrate(Rectangular).png",
			Description = "A rectangular grate panel found on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Grate (Square)"] = {
			Name = "Galleon Grate (Square)",
			Image = "DecoGalleonGrate(Square).png",
			Description = "A square-shaped grate panel found on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Lower Deck Pillar (Corner Short)"] = {
			Name = "Galleon Lower Deck Pillar (Corner Short)",
			Image = "DecoGalleonLowerDeckPillar(CornerShort).png",
			Description = "A short pillar used to support the lower decks of Grineer Galleon class ships, custom fitted for corners.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Lower Deck Pillar (Corner Tall)"] = {
			Name = "Galleon Lower Deck Pillar (Corner Tall)",
			Image = "DecoGalleonLowerDeckPillar(CornerTall).png",
			Description = "A tall pillar used to support the lower decks of Grineer Galleon class ships, custom fitted for corners.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Lower Deck Pillar (Side Short)"] = {
			Name = "Galleon Lower Deck Pillar (Side Short)",
			Image = "DecoGalleonLowerDeckPillar(SideShort).png",
			Description = "A short pillar used to support the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Lower Deck Pillar (Side Tall)"] = {
			Name = "Galleon Lower Deck Pillar (Side Tall)",
			Image = "DecoGalleonLowerDeckPillar(SideTall).png",
			Description = "A tall pillar used to support the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Lower Deck Wall (1m Short)"] = {
			Name = "Galleon Lower Deck Wall (1m Short)",
			Image = "DecoGalleonLowerDeckWall(1mShort).png",
			Description = "A short 1m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Lower Deck Wall (1m Tall)"] = {
			Name = "Galleon Lower Deck Wall (1m Tall)",
			Image = "DecoGalleonLowerDeckWall(1mTall).png",
			Description = "A tall 1m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Lower Deck Wall (2m Narrow)"] = {
			Name = "Galleon Lower Deck Wall (2m Narrow)",
			Image = "DecoGalleonLowerDeckWall(2mNarrow).png",
			Description = "A narrow section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Lower Deck Wall (2m Short)"] = {
			Name = "Galleon Lower Deck Wall (2m Short)",
			Image = "DecoGalleonLowerDeckWall(2mShort).png",
			Description = "A short 2m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Lower Deck Wall (2m Tall)"] = {
			Name = "Galleon Lower Deck Wall (2m Tall)",
			Image = "DecoGalleonLowerDeckWall(2mTall).png",
			Description = "A tall 2m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Lower Deck Wall (4m Pipes)"] = {
			Name = "Galleon Lower Deck Wall (4m Pipes)",
			Image = "DecoGalleonLowerDeckWall(4mPipes).png",
			Description = "A section of wall that features pipes from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Lower Deck Wall (4m Short)"] = {
			Name = "Galleon Lower Deck Wall (4m Short)",
			Image = "DecoGalleonLowerDeckWall(4mShort).png",
			Description = "A short 4m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Lower Deck Wall (8m Short)"] = {
			Name = "Galleon Lower Deck Wall (8m Short)",
			Image = "DecoGalleonLowerDeckWall(8mShort).png",
			Description = "A short 8m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Galleon Lower Deck Wall (8m Tall)"] = {
			Name = "Galleon Lower Deck Wall (8m Tall)",
			Image = "DecoGalleonLowerDeckWall(8mTall).png",
			Description = "A tall 8m section of wall from the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Galleon Lower Deck Wall (Corner Short)"] = {
			Name = "Galleon Lower Deck Wall (Corner Short)",
			Image = "DecoGalleonLowerDeckWall(CornerShort).png",
			Description = "A short corner wall section used in the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Lower Deck Wall (Corner Tall)"] = {
			Name = "Galleon Lower Deck Wall (Corner Tall)",
			Image = "DecoGalleonLowerDeckWall(CornerTall).png",
			Description = "A tall corner wall section used in the lower decks of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Pillar (Base)"] = {
			Name = "Galleon Pillar (Base)",
			Image = "DecoGalleonPillar(Base).png",
			Description = "The base of a piped pillar from Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Pillar (Full)"] = {
			Name = "Galleon Pillar (Full)",
			Image = "DecoGalleonPillar(Full).png",
			Description = "A full piped pillar from Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Galleon Pillar (Middle)"] = {
			Name = "Galleon Pillar (Middle)",
			Image = "DecoGalleonPillar(Middle).png",
			Description = "The middle section of a piped pillar from Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Pillar (Top)"] = {
			Name = "Galleon Pillar (Top)",
			Image = "DecoGalleonPillar(Top).png",
			Description = "The top section of a piped pillar from Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Trim (16m)"] = {
			Name = "Galleon Trim (16m)",
			Image = "DecoGalleonTrim(16m).png",
			Description = "A 16m length of trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Galleon Trim (1m)"] = {
			Name = "Galleon Trim (1m)",
			Image = "DecoGalleonTrim(1m).png",
			Description = "A 1m length of trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Galleon Trim (4m)"] = {
			Name = "Galleon Trim (4m)",
			Image = "DecoGalleonTrim(4m).png",
			Description = "A 4m length of trim from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Ammunition Locker"] = {
			Name = "Grineer Ammunition Locker",
			Image = "DecoGrineerAmmunitionLocker.png",
			Description = "A large Grineer locker used to store ammunition.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Angled Pipe (Large 45 Degree)"] = {
			Name = "Grineer Angled Pipe (Large 45 Degree)",
			Image = "DecoGrineerAngledPipe(Large45Degree).png",
			Description = "A large Grineer pipe bent at a 45 degree angle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Angled Pipe (Large 90 Degree)"] = {
			Name = "Grineer Angled Pipe (Large 90 Degree)",
			Image = "DecoGrineerAngledPipe(Large90Degree).png",
			Description = "A large Grineer pipe bent at a 90 degree angle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Armored Pipe Flange"] = {
			Name = "Grineer Armored Pipe Flange",
			Image = "DecoGrineerArmoredPipeFlange.png",
			Description = "A large armored Grineer pipe flange used to connect large pipes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk (2m)"] = {
			Name = "Grineer Catwalk (2m)",
			Image = "DecoGrineerCatwalk(2m).png",
			Description = "A small 2 meter length of catwalk equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk (6m)"] = {
			Name = "Grineer Catwalk (6m)",
			Image = "DecoGrineerCatwalk(6m).png",
			Description = "A 6m length of catwalk equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk Cap"] = {
			Name = "Grineer Catwalk Cap",
			Image = "DecoGrineerCatwalkCap.png",
			Description = "A small end cap for the catwalk system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Catwalk Joint"] = {
			Name = "Grineer Catwalk Joint",
			Image = "DecoGrineerCatwalkJoint.png",
			Description = "A 4x4 Grineer catwalk joint.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk Railing (2m)"] = {
			Name = "Grineer Catwalk Railing (2m)",
			Image = "DecoGrineerCatwalkRailing(2m).png",
			Description = "A small 2m length of Grineer catwalk handrail.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk Railing (4m)"] = {
			Name = "Grineer Catwalk Railing (4m)",
			Image = "DecoGrineerCatwalkRailing(4m).png",
			Description = "A 4m length of Grineer catwalk handrail.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Catwalk Stairs"] = {
			Name = "Grineer Catwalk Stairs",
			Image = "DecoGrineerCatwalkStairs.png",
			Description = "A short set of stairs of catwalk equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Computer Miner"] = {
			Name = "Grineer Computer Miner",
			Image = "DecoGrineerComputerMiner.png",
			Description = "A small Grineer computer server used in mining.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Conduit Base"] = {
			Name = "Grineer Conduit Base",
			Image = "DecoGrineerConduitBase.png",
			Description = "The base of a conduit tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Conduit Segment"] = {
			Name = "Grineer Conduit Segment",
			Image = "DecoGrineerConduitSegment.png",
			Description = "A section of a Grineer conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Conduit Support (Left)"] = {
			Name = "Grineer Conduit Support (Left)",
			Image = "DecoGrineerConduitSupport(Left).png",
			Description = "Supports the left side of a Grineer conduit tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Conduit Support (Right)"] = {
			Name = "Grineer Conduit Support (Right)",
			Image = "DecoGrineerConduitSupport(Right).png",
			Description = "Supports the right side of a Grineer conduit tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Grineer Data Cables (90 Degree Bend, Large)"] = {
			Name = "Grineer Data Cables (90 Degree Bend, Large)",
			Image = "DecoGrineerDataCables(90DegreeBend,Large).png",
			Description = "A large set of data cables with a 90 degree bend",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Data Cables (Large)"] = {
			Name = "Grineer Data Cables (Large)",
			Image = "DecoGrineerDataCables(Large).png",
			Description = "A large set of data cables used by the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Drop Pod Landing Strut"] = {
			Name = "Grineer Drop Pod Landing Strut",
			Image = "DecoGrineerDropPodLandingStrut.png",
			Description = "A strut used to land a Grineer drop pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Drop Pod Lower Door"] = {
			Name = "Grineer Drop Pod Lower Door",
			Image = "DecoGrineerDropPodLowerDoor.png",
			Description = "The lower door of a Grineer drop pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Grineer Drop Pod Ramp"] = {
			Name = "Grineer Drop Pod Ramp",
			Image = "DecoGrineerDropPodRamp.png",
			Description = "The ramp of a Grineer drop pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Drop Pod Upper Door"] = {
			Name = "Grineer Drop Pod Upper Door",
			Image = "DecoGrineerDropPodUpperDoor.png",
			Description = "The upper door of a Grineer drop pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Exhaust Fan Blades Rotating"] = {
			Name = "Grineer Exhaust Fan Blades Rotating",
			Image = "DecoGrineerExhaustFanBladesRotating.png",
			Description = "A set of rotating Grineer fan blades used in their vents.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Floor Conduit"] = {
			Name = "Grineer Floor Conduit",
			Image = "DecoGrineerFloorConduit.png",
			Description = "A floor-mounted Grineer conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Grineer Galleon Ammo Loading Bracket"] = {
			Name = "Grineer Galleon Ammo Loading Bracket",
			Image = "DecoGrineerGalleonAmmoLoadingBracket.png",
			Description = "A bracket used to secure the railings of the Grineer Galleon cannon loading system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Galleon Ammo Loading Gear"] = {
			Name = "Grineer Galleon Ammo Loading Gear",
			Image = "DecoGrineerGalleonAmmoLoadingGear.png",
			Description = "A gear from the Grineer Galleon cannon loading system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Grineer Galleon Ammo Loading Rail"] = {
			Name = "Grineer Galleon Ammo Loading Rail",
			Image = "DecoGrineerGalleonAmmoLoadingRail.png",
			Description = "A railing used in the Grineer Galleon cannon loading system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Galleon Cannon Armor"] = {
			Name = "Grineer Galleon Cannon Armor",
			Image = "DecoGrineerGalleonCannonArmor.png",
			Description = "An armored panel from a Grineer Galleon cannon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Cannon Barrel"] = {
			Name = "Grineer Galleon Cannon Barrel",
			Image = "DecoGrineerGalleonCannonBarrel.png",
			Description = "The barrel of a Grineer Galleon cannon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Galleon Fuel Filtering Tank"] = {
			Name = "Grineer Galleon Fuel Filtering Tank",
			Image = "DecoGrineerGalleonFuelFilteringTank.png",
			Description = "A large Grineer fuel filtering tank originally used in galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Gas Pod"] = {
			Name = "Grineer Galleon Gas Pod",
			Image = "DecoGrineerGalleonGasPod.png",
			Description = "A pod used to allow the expansion of gas in Grineer machinery and weapon systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Galleon Girder"] = {
			Name = "Grineer Galleon Girder",
			Image = "DecoGrineerGalleonGirder.png",
			Description = "A girder used in the construction of Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Grineer Galleon Interface Console"] = {
			Name = "Grineer Galleon Interface Console",
			Image = "DecoGrineerGalleonInterfaceConsole.png",
			Description = "Interface screens used in Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Mine"] = {
			Name = "Grineer Galleon Mine",
			Image = "DecoGrineerGalleonMine.png",
			Description = "A mine used by Grineer Galleon class ships in space combat.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Grineer Galleon Porthole Door"] = {
			Name = "Grineer Galleon Porthole Door",
			Image = "DecoGrineerGalleonPortholeDoor.png",
			Description = "A porthole door used on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Galleon Porthole Frame"] = {
			Name = "Grineer Galleon Porthole Frame",
			Image = "DecoGrineerGalleonPortholeFrame.png",
			Description = "A porthole support frame used on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Porthole Hatch"] = {
			Name = "Grineer Galleon Porthole Hatch",
			Image = "DecoGrineerGalleonPortholeHatch.png",
			Description = "A porthole hatch used on Grineer Galleon class ships.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Reactor Shield"] = {
			Name = "Grineer Galleon Reactor Shield",
			Image = "DecoGrineerGalleonReactorShield.png",
			Description = "A shield to protect Grineer Galleon crew from a power reactor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Spire"] = {
			Name = "Grineer Galleon Spire",
			Image = "DecoGrineerGalleonSpire.png",
			Description = "The spire of a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Galleon Turbine"] = {
			Name = "Grineer Galleon Turbine",
			Image = "DecoGrineerGalleonTurbine.png",
			Description = "A turbine engine from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Galleon Utility Housing"] = {
			Name = "Grineer Galleon Utility Housing",
			Image = "DecoGrineerGalleonUtilityHousing.png",
			Description = "A large utility housing unit from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Grineer Galleon Vent Frame"] = {
			Name = "Grineer Galleon Vent Frame",
			Image = "DecoGrineerGalleonVentFrame.png",
			Description = "A vent frame from a Grineer Galleon class ship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Grineer Kuva Heavy Duty Barrel Stack"] = {
			Name = "Grineer Kuva Heavy Duty Barrel Stack",
			Image = "DecoGrineerKuvaHeavyDutyBarrelStack.png",
			Description = "A small pile of Grineer heavy duty kuva barrels covered by a tarp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Kuva Heavy Duty Storage Container"] = {
			Name = "Grineer Kuva Heavy Duty Storage Container",
			Image = "DecoGrineerKuvaHeavyDutyStorageContainer.png",
			Description = "A small barrel designed to store and secure kuva.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Lubricant Holding Tank"] = {
			Name = "Grineer Lubricant Holding Tank",
			Image = "DecoGrineerLubricantHoldingTank.png",
			Description = "A large Grineer lubricant holding tank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Machine Maintenance Conduit"] = {
			Name = "Grineer Machine Maintenance Conduit",
			Image = "DecoGrineerMachineMaintenanceConduit.png",
			Description = "A large conduit for granting easier maintenance to systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Machine Pressurizer"] = {
			Name = "Grineer Machine Pressurizer",
			Image = "DecoGrineerMachinePressurizer.png",
			Description = "A Grineer machine that creates pressure for other machine systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Mine"] = {
			Name = "Grineer Mine",
			Image = "DecoGrineerMine.png",
			Description = "A Grineer mine weapon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Pillar"] = {
			Name = "Grineer Pillar",
			Image = "DecoGrineerPillar.png",
			Description = "A simple Grineer pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Pillar With Lights"] = {
			Name = "Grineer Pillar With Lights",
			Image = "DecoGrineerPillarWithLights.png",
			Description = "A pillar designed by the Grineer with lights.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Pressurized Water Tank"] = {
			Name = "Grineer Pressurized Water Tank",
			Image = "DecoGrineerPressurizedWaterTank.png",
			Description = "A small Grineer pressurized water tank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Resource Processing Machine"] = {
			Name = "Grineer Resource Processing Machine",
			Image = "DecoGrineerResourceProcessingMachine.png",
			Description = "A large Grineer machine used to process raw materials.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Scraps Container"] = {
			Name = "Grineer Scraps Container",
			Image = "DecoGrineerScrapsContainer.png",
			Description = "A spacious container for scraps on a Grineer base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Shipping Skid"] = {
			Name = "Grineer Shipping Skid",
			Image = "DecoGrineerShippingSkid.png",
			Description = "A Grineer shipping skid wrapped in packing material.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Standard Storage Container"] = {
			Name = "Grineer Standard Storage Container",
			Image = "DecoGrineerStandardStorageContainer.png",
			Description = "A basic Grineer storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Standing Banner (Black)"] = {
			Name = "Grineer Standing Banner (Black)",
			Image = "DecoGrineerStandingBanner(Black).png",
			Description = "A proud freestanding display of the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Standing Banner (Red)"] = {
			Name = "Grineer Standing Banner (Red)",
			Image = "DecoGrineerStandingBanner(Red).png",
			Description = "A proud freestanding display of the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Standing Banner (White)"] = {
			Name = "Grineer Standing Banner (White)",
			Image = "DecoGrineerStandingBanner(White).png",
			Description = "A proud freestanding display of the Grineer.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grineer Straight Pipe (Large)"] = {
			Name = "Grineer Straight Pipe (Large)",
			Image = "DecoGrineerStraightPipe(Large).png",
			Description = "A large straight Grineer pipe.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Systems Control Fuse Conduit"] = {
			Name = "Grineer Systems Control Fuse Conduit",
			Image = "DecoGrineerSystemsControlFuseConduit.png",
			Description = "A large Grineer console to house system control fuses.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grineer Wall"] = {
			Name = "Grineer Wall",
			Image = "DecoGrineerWall.png",
			Description = "A large wall made of Grineer metals.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Wall With Pillars (4m)"] = {
			Name = "Grineer Wall With Pillars (4m)",
			Image = "DecoGrineerWallWithPillars(4m).png",
			Description = "A 5m large wall made of Grineer metals with integrated pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grineer Water Pump Conduit"] = {
			Name = "Grineer Water Pump Conduit",
			Image = "DecoGrineerWaterPumpConduit.png",
			Description = "A small Grineer water machine that circulates water.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Half Landing Pad"] = {
			Name = "Half Landing Pad",
			Image = "DecoHalfLandingPad.png",
			Description = "A large half of a landing pad.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hand Truck"] = {
			Name = "Hand Truck",
			Image = "DecoHandTruck.png",
			Description = "A small hand truck used to transport items in a warehouse.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Holographic Projection Of Asteroids"] = {
			Name = "Holographic Projection Of Asteroids",
			Image = "DecoHolographicProjectionOfAsteroids.png",
			Description = "A holographic projection of asteroids.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Holographic Projection Of Saturn"] = {
			Name = "Holographic Projection Of Saturn",
			Image = "DecoHolographicProjectionOfSaturn.png",
			Description = "A holographic projection of Saturn.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Holographic Projection Of The Fortress"] = {
			Name = "Holographic Projection Of The Fortress",
			Image = "DecoHolographicProjectionOfTheFortress.png",
			Description = "A holographic projection of the Fortress.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hull Debris (Dual Support)"] = {
			Name = "Hull Debris (Dual Support)",
			Image = "DecoHullDebris(DualSupport).png",
			Description = "A large wide hull section with two support struts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Debris (End Support)"] = {
			Name = "Hull Debris (End Support)",
			Image = "DecoHullDebris(EndSupport).png",
			Description = "A large narrow hull section with a support strut on its end.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Debris (Middle Support)"] = {
			Name = "Hull Debris (Middle Support)",
			Image = "DecoHullDebris(MiddleSupport).png",
			Description = "A large narrow hull section with a support strut in its middle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Debris (Single Support)"] = {
			Name = "Hull Debris (Single Support)",
			Image = "DecoHullDebris(SingleSupport).png",
			Description = "A large narrow hull section with a single support strut.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Plating (Long)"] = {
			Name = "Hull Plating (Long)",
			Image = "DecoHullPlating(Long).png",
			Description = "A long section of hull plating.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Plating (Short)"] = {
			Name = "Hull Plating (Short)",
			Image = "DecoHullPlating(Short).png",
			Description = "A short section of hull plating.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hull Struts"] = {
			Name = "Hull Struts",
			Image = "DecoHullStruts.png",
			Description = "A large set of hull support struts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Laser Scanner Bottom"] = {
			Name = "Laser Scanner Bottom",
			Image = "DecoLaserScannerBottom.png",
			Description = "The bottom of the laser scanner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Laser Scanner Top"] = {
			Name = "Laser Scanner Top",
			Image = "DecoLaserScannerTop.png",
			Description = "The top of the laser scanner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Processing Machine Manifold"] = {
			Name = "Processing Machine Manifold",
			Image = "DecoProcessingMachineManifold.png",
			Description = "A manifold from a Grineer processing machine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pump Housing"] = {
			Name = "Pump Housing",
			Image = "DecoPumpHousing.png",
			Description = "The housing of a Grineer pump.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pump Purifier"] = {
			Name = "Pump Purifier",
			Image = "DecoPumpPurifier.png",
			Description = "A component from a Grineer water pump that purifies the water.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Queens' Throne"] = {
			Name = "Queens' Throne",
			Image = "DecoQueens'Throne.png",
			Description = "The Queens' throne.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Reinforced Support Arch"] = {
			Name = "Reinforced Support Arch",
			Image = "DecoReinforcedSupportArch.png",
			Description = "A large heavily reinforced support arch.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Research Clamp"] = {
			Name = "Research Clamp",
			Image = "DecoResearchClamp.png",
			Description = "A clamp used to manipulate hazardous materials.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Restraint Rack"] = {
			Name = "Restraint Rack",
			Image = "DecoRestraintRack.png",
			Description = "A rank used to restrain clones.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Satellite"] = {
			Name = "Satellite",
			Image = "DecoSatellite.png",
			Description = "A satellite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Scaffolding Base"] = {
			Name = "Scaffolding Base",
			Image = "DecoScaffoldingBase.png",
			Description = "The base of Grineer scaffolding equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Security Blade"] = {
			Name = "Security Blade",
			Image = "DecoSecurityBlade.png",
			Description = "A blade used in security systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Security Platform (2m)"] = {
			Name = "Security Platform (2m)",
			Image = "DecoSecurityPlatform(2m).png",
			Description = "A 2x2m platform that holds security systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Security Platform (4m)"] = {
			Name = "Security Platform (4m)",
			Image = "DecoSecurityPlatform(4m).png",
			Description = "A 4x4m platform that holds security systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Square Light Rays"] = {
			Name = "Square Light Rays",
			Image = "DecoSquareLightRays.png",
			Description = "Rays of light in the shape of a square.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Storage Cylinder (Large)"] = {
			Name = "Storage Cylinder (Large)",
			Image = "DecoStorageCylinder(Large).png",
			Description = "A large Grineer storage cylinder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Submarine"] = {
			Name = "Submarine",
			Image = "DecoSubmarine.png",
			Description = "A submarine used by the Grineer at the under water research bases.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Support Arch"] = {
			Name = "Support Arch",
			Image = "DecoSupportArch.png",
			Description = "A standard support arch.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Blast Shield"] = {
			Name = "Throne Room Blast Shield",
			Image = "DecoThroneRoomBlastShield.png",
			Description = "A blast shield used in the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Door Frame"] = {
			Name = "Throne Room Door Frame",
			Image = "DecoThroneRoomDoorFrame.png",
			Description = "A door frame in the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Door Trim"] = {
			Name = "Throne Room Door Trim",
			Image = "DecoThroneRoomDoorTrim.png",
			Description = "A door frame trim in the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Floor"] = {
			Name = "Throne Room Floor",
			Image = "DecoThroneRoomFloor.png",
			Description = "A floor section from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Floor Adornment"] = {
			Name = "Throne Room Floor Adornment",
			Image = "DecoThroneRoomFloorAdornment.png",
			Description = "A floor andornment from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Glass Floor"] = {
			Name = "Throne Room Glass Floor",
			Image = "DecoThroneRoomGlassFloor.png",
			Description = "A glass floor from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Light Fixture"] = {
			Name = "Throne Room Light Fixture",
			Image = "DecoThroneRoomLightFixture.png",
			Description = "A light fixture from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar"] = {
			Name = "Throne Room Pillar",
			Image = "DecoThroneRoomPillar.png",
			Description = "A throne room pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar Arch"] = {
			Name = "Throne Room Pillar Arch",
			Image = "DecoThroneRoomPillarArch.png",
			Description = "Arch pillar from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar Arch (Straight)"] = {
			Name = "Throne Room Pillar Arch (Straight)",
			Image = "DecoThroneRoomPillarArch(Straight).png",
			Description = "A single straight section of the throne room pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar Arch Adornment"] = {
			Name = "Throne Room Pillar Arch Adornment",
			Image = "DecoThroneRoomPillarArchAdornment.png",
			Description = "An adornment hung on throne room pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar Base (Left)"] = {
			Name = "Throne Room Pillar Base (Left)",
			Image = "DecoThroneRoomPillarBase(Left).png",
			Description = "A left throne room pillar base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Pillar Base (Right)"] = {
			Name = "Throne Room Pillar Base (Right)",
			Image = "DecoThroneRoomPillarBase(Right).png",
			Description = "A right throne room pillar base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Stairs (Curved)"] = {
			Name = "Throne Room Stairs (Curved)",
			Image = "DecoThroneRoomStairs(Curved).png",
			Description = "Curved stairs from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Throne Room Stairs (Straight)"] = {
			Name = "Throne Room Stairs (Straight)",
			Image = "DecoThroneRoomStairs(Straight).png",
			Description = "Straight stairs from the throne room.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Tram Pillar Arch"] = {
			Name = "Tram Pillar Arch",
			Image = "DecoTramPillarArch.png",
			Description = "A tram pillar arch.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tram Pillar Arch (Half)"] = {
			Name = "Tram Pillar Arch (Half)",
			Image = "DecoTramPillarArch(Half).png",
			Description = "A half section of a tram pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tunnel Boring Machine"] = {
			Name = "Tunnel Boring Machine",
			Image = "DecoTunnelBoringMachine.png",
			Description = "A machine used to drill tunnels.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Turbine Blades"] = {
			Name = "Turbine Blades",
			Image = "DecoTurbineBlades.png",
			Description = "A large set of Grineer turbine blades.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Turbine Conduit"] = {
			Name = "Turbine Conduit",
			Image = "DecoTurbineConduit.png",
			Description = "A conduit used with the turbine generators.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Turbine Generator"] = {
			Name = "Turbine Generator",
			Image = "DecoTurbineGenerator.png",
			Description = "A compact turbine generator.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Turbine Nacelle"] = {
			Name = "Turbine Nacelle",
			Image = "DecoTurbineNacelle.png",
			Description = "The nacelle of a Grineer processing machine turbine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Turret Base (Deep)"] = {
			Name = "Turret Base (Deep)",
			Image = "DecoTurretBase(Deep).png",
			Description = "A deep turret encasement.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Turret Base (Shallow)"] = {
			Name = "Turret Base (Shallow)",
			Image = "DecoTurretBase(Shallow).png",
			Description = "A shallow turret encasement.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Turret Gun"] = {
			Name = "Turret Gun",
			Image = "DecoTurretGun.png",
			Description = "A gun turret.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Turret Mount"] = {
			Name = "Turret Mount",
			Image = "DecoTurretMount.png",
			Description = "A mount for different turret weapons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Turret Rocket Launcher"] = {
			Name = "Turret Rocket Launcher",
			Image = "DecoTurretRocketLauncher.png",
			Description = "A rocket launcher turret.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Turret Tracking Drone"] = {
			Name = "Turret Tracking Drone",
			Image = "DecoTurretTrackingDrone.png",
			Description = "A replica Grineer Latcher Turret.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (Reinforced 1m)"] = {
			Name = "Wall (Reinforced 1m)",
			Image = "DecoWall(Reinforced1m).png",
			Description = "A reinforced 1m long wall made to endure under water pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall (Reinforced 2m)"] = {
			Name = "Wall (Reinforced 2m)",
			Image = "DecoWall(Reinforced2m).png",
			Description = "A reinforced 2m long wall made to endure under water pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall (Reinforced 5m)"] = {
			Name = "Wall (Reinforced 5m)",
			Image = "DecoWall(Reinforced5m).png",
			Description = "A reinforced 5m long wall made to endure under water pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall (Reinforced 8m)"] = {
			Name = "Wall (Reinforced 8m)",
			Image = "DecoWall(Reinforced8m).png",
			Description = "A reinforced 8m long wall made to endure under water pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall (Reinforced With Window)"] = {
			Name = "Wall (Reinforced With Window)",
			Image = "DecoWall(ReinforcedWithWindow).png",
			Description = "A reinforced wall with a window made to endure under water pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Water Pump"] = {
			Name = "Water Pump",
			Image = "DecoWaterPump.png",
			Description = "A large Grineer machine that pumps water.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Water Pump (Fly Wheel)"] = {
			Name = "Water Pump (Fly Wheel)",
			Image = "DecoWaterPump(FlyWheel).png",
			Description = "A fly wheel used to assist in pumping water.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Water Pump (Piston)"] = {
			Name = "Water Pump (Piston)",
			Image = "DecoWaterPump(Piston).png",
			Description = "The piston from a Grineer water pump.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Water Sediment Trap"] = {
			Name = "Water Sediment Trap",
			Image = "DecoWaterSedimentTrap.png",
			Description = "A Grineer water sediment trap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Water Tower Holding Tank"] = {
			Name = "Water Tower Holding Tank",
			Image = "DecoWaterTowerHoldingTank.png",
			Description = "A large Grineer water tower holding tank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Window (Curved With Opening)"] = {
			Name = "Window (Curved With Opening)",
			Image = "DecoWindow(CurvedWithOpening).png",
			Description = "A large Grineer curved window with an opening.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Window (Curved)"] = {
			Name = "Window (Curved)",
			Image = "DecoWindow(Curved).png",
			Description = "A large Grineer curved window.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Window (Cylinder)"] = {
			Name = "Window (Cylinder)",
			Image = "DecoWindow(Cylinder).png",
			Description = "A large cylinder formation of windows.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wire Tower"] = {
			Name = "Wire Tower",
			Image = "DecoWireTower.png",
			Description = "A small support tower for wires.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		}
	},
	Infested = {
		["Infested Arches"] = {
			Name = "Infested Arches",
			Image = "DecoInfestedArches.png",
			Description = "An arch-like growth of Infestation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Bent Structural Pillar"] = {
			Name = "Infested Bent Structural Pillar",
			Image = "DecoInfestedBentStructuralPillar.png",
			Description = "A large Infested bent pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Biomass"] = {
			Name = "Infested Biomass",
			Image = "DecoInfestedBiomass.png",
			Description = "An infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass (Elongated)"] = {
			Name = "Infested Biomass (Elongated)",
			Image = "DecoInfestedBiomass(Elongated).png",
			Description = "A large elongated infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass (Large)"] = {
			Name = "Infested Biomass (Large)",
			Image = "DecoInfestedBiomass(Large).png",
			Description = "A large infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass (Small)"] = {
			Name = "Infested Biomass (Small)",
			Image = "DecoInfestedBiomass(Small).png",
			Description = "A small infested clump of biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass (Tapered)"] = {
			Name = "Infested Biomass (Tapered)",
			Image = "DecoInfestedBiomass(Tapered).png",
			Description = "An elongated infested biomass that is tapered on one end.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass (Webbed Open)"] = {
			Name = "Infested Biomass (Webbed Open)",
			Image = "DecoInfestedBiomass(WebbedOpen).png",
			Description = "A very large webbed formation of infested biomass without small webs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Biomass (Webbed)"] = {
			Name = "Infested Biomass (Webbed)",
			Image = "DecoInfestedBiomass(Webbed).png",
			Description = "A very large webbed formation of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Biomass Edge"] = {
			Name = "Infested Biomass Edge",
			Image = "DecoInfestedBiomassEdge.png",
			Description = "An elongated infested biomass that fits into wall edges.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass Edge With Pustules"] = {
			Name = "Infested Biomass Edge With Pustules",
			Image = "DecoInfestedBiomassEdgeWithPustules.png",
			Description = "An elongated infested biomass with pustules that fits into wall edges.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass Slender"] = {
			Name = "Infested Biomass Slender",
			Image = "DecoInfestedBiomassSlender.png",
			Description = "A slender infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Biomass Strand"] = {
			Name = "Infested Biomass Strand",
			Image = "DecoInfestedBiomassStrand.png",
			Description = "A strand of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Biomass Strand (Long)"] = {
			Name = "Infested Biomass Strand (Long)",
			Image = "DecoInfestedBiomassStrand(Long).png",
			Description = "A long strand of infested biomass with a heavy top.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Biomass Strand (Tapered)"] = {
			Name = "Infested Biomass Strand (Tapered)",
			Image = "DecoInfestedBiomassStrand(Tapered).png",
			Description = "A short strand of infested biomass with a heavy top.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Biomass Tower"] = {
			Name = "Infested Biomass Tower",
			Image = "DecoInfestedBiomassTower.png",
			Description = "Very large infested biomass strands shaped like a tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Biomass With Tendons"] = {
			Name = "Infested Biomass With Tendons",
			Image = "DecoInfestedBiomassWithTendons.png",
			Description = "An elongated infested biomass held together with central tendons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Bollard (Large)"] = {
			Name = "Infested Bollard (Large)",
			Image = "DecoInfestedBollard(Large).png",
			Description = "A large Infested bollard.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cage"] = {
			Name = "Infested Cage",
			Image = "DecoInfestedCage.png",
			Description = "A cage made of infested material.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Infested Carapace"] = {
			Name = "Infested Carapace",
			Image = "DecoInfestedCarapace.png",
			Description = "A hard shelled growth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Carapace (Small)"] = {
			Name = "Infested Carapace (Small)",
			Image = "DecoInfestedCarapace(Small).png",
			Description = "A small mass of infested shell.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Carapace (Webbing)"] = {
			Name = "Infested Carapace (Webbing)",
			Image = "DecoInfestedCarapace(Webbing).png",
			Description = "A small infested web that has small carapace forming.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Carapace Shell"] = {
			Name = "Infested Carapace Shell",
			Image = "DecoInfestedCarapaceShell.png",
			Description = "A small infested carapace shell.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Carapace Shell (Red)"] = {
			Name = "Infested Carapace Shell (Red)",
			Image = "DecoInfestedCarapaceShell(Red).png",
			Description = "A small carapace early in its formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Cluster"] = {
			Name = "Infested Cluster",
			Image = "DecoInfestedCluster.png",
			Description = "A large cluster of infested biomatter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Cluster (Hanging)"] = {
			Name = "Infested Cluster (Hanging)",
			Image = "DecoInfestedCluster(Hanging).png",
			Description = "A large cluster of infested biomass with tendrils to hang from.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Cluster (Large)"] = {
			Name = "Infested Cluster (Large)",
			Image = "DecoInfestedCluster(Large).png",
			Description = "A very large cluster of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Cocoon"] = {
			Name = "Infested Cocoon",
			Image = "DecoInfestedCocoon.png",
			Description = "A large infested cocoon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Corner Pillar"] = {
			Name = "Infested Corner Pillar",
			Image = "DecoInfestedCornerPillar.png",
			Description = "A large Infested triangular pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Corner Structure"] = {
			Name = "Infested Corner Structure",
			Image = "DecoInfestedCornerStructure.png",
			Description = "A large triangular shaped Infested formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Corner Support"] = {
			Name = "Infested Corner Support",
			Image = "DecoInfestedCornerSupport.png",
			Description = "A large triangular shaped Infested formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Creature Ribs"] = {
			Name = "Infested Creature Ribs",
			Image = "DecoInfestedCreatureRibs.png",
			Description = "A large set of ribs from an Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Creature's Claw"] = {
			Name = "Infested Creature's Claw",
			Image = "DecoInfestedCreature'sClaw.png",
			Description = "A claw from an Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Infested Creature's Claw (Small)"] = {
			Name = "Infested Creature's Claw (Small)",
			Image = "DecoInfestedCreature'sClaw(Small).png",
			Description = "A claw from a small Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Creature's Glow Pod"] = {
			Name = "Infested Creature's Glow Pod",
			Image = "DecoInfestedCreature'sGlowPod.png",
			Description = "A pod that grows on Infested creatures that glows.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Cyst (Group)"] = {
			Name = "Infested Cyst (Group)",
			Image = "DecoInfestedCyst(Group).png",
			Description = "A group of Infested cysts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst (Large)"] = {
			Name = "Infested Cyst (Large)",
			Image = "DecoInfestedCyst(Large).png",
			Description = "An Infested cyst in the late stages of its growth cycle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst (Medium)"] = {
			Name = "Infested Cyst (Medium)",
			Image = "DecoInfestedCyst(Medium).png",
			Description = "An Infested cyst in the middle of its growth cycle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst (Very Large)"] = {
			Name = "Infested Cyst (Very Large)",
			Image = "DecoInfestedCyst(VeryLarge).png",
			Description = "A very large Infested cyst in the very late stages of its growth cycle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Pedestal"] = {
			Name = "Infested Cyst Pedestal",
			Image = "DecoInfestedCystPedestal.png",
			Description = "An Infested pedestal with a cyst growth atop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Pedestal (Young)"] = {
			Name = "Infested Cyst Pedestal (Young)",
			Image = "DecoInfestedCystPedestal(Young).png",
			Description = "A young Infested pedestal with a cyst growth atop",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Popped (Group)"] = {
			Name = "Infested Cyst Popped (Group)",
			Image = "DecoInfestedCystPopped(Group).png",
			Description = "A group of Infested cysts that has been popped.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Popped (Large)"] = {
			Name = "Infested Cyst Popped (Large)",
			Image = "DecoInfestedCystPopped(Large).png",
			Description = "An Infested cyst in the late stages of its growth cycle that has been popped.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Popped (Medium)"] = {
			Name = "Infested Cyst Popped (Medium)",
			Image = "DecoInfestedCystPopped(Medium).png",
			Description = "An infested cyst in the middle of its growth cycle that has been popped.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Cyst Popped (Very Large)"] = {
			Name = "Infested Cyst Popped (Very Large)",
			Image = "DecoInfestedCystPopped(VeryLarge).png",
			Description = "A very large Infested cyst that has reached the end of its growth cycle that has been popped.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Egg"] = {
			Name = "Infested Egg",
			Image = "DecoInfestedEgg.png",
			Description = "A large Infested egg.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Infested Embolism (Large)"] = {
			Name = "Infested Embolism (Large)",
			Image = "DecoInfestedEmbolism(Large).png",
			Description = "A large Infested embolism.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Embolism Pillar"] = {
			Name = "Infested Embolism Pillar",
			Image = "DecoInfestedEmbolismPillar.png",
			Description = "An Infested embolism pillar",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Feeler Husk"] = {
			Name = "Infested Feeler Husk",
			Image = "DecoInfestedFeelerHusk.png",
			Description = "The small husk that Infested feelers grow from.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Feeler Tentacle"] = {
			Name = "Infested Feeler Tentacle",
			Image = "DecoInfestedFeelerTentacle.png",
			Description = "An Infested feeler tentacle",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Feeler Tentacle (Large)"] = {
			Name = "Infested Feeler Tentacle (Large)",
			Image = "DecoInfestedFeelerTentacle(Large).png",
			Description = "A large Infested feeler tentacle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Feeler Tentacle (Small)"] = {
			Name = "Infested Feeler Tentacle (Small)",
			Image = "DecoInfestedFeelerTentacle(Small).png",
			Description = "A small Infested feeler tentacle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Foliage (Large)"] = {
			Name = "Infested Foliage (Large)",
			Image = "DecoInfestedFoliage(Large).png",
			Description = "A large Infested foliage organism.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Fungus"] = {
			Name = "Infested Fungus",
			Image = "DecoInfestedFungus.png",
			Description = "A small growth of infested fungus",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Infested Fungus (Long)"] = {
			Name = "Infested Fungus (Long)",
			Image = "DecoInfestedFungus(Long).png",
			Description = "A long combination of infested fungus growth with webs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Fungus (Webbed)"] = {
			Name = "Infested Fungus (Webbed)",
			Image = "DecoInfestedFungus(Webbed).png",
			Description = "A combination of infested fungus growth with webs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Glow Seed"] = {
			Name = "Infested Glow Seed",
			Image = "DecoInfestedGlowSeed.png",
			Description = "An Infested glow seed.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Glowing Bollard (Large)"] = {
			Name = "Infested Glowing Bollard (Large)",
			Image = "DecoInfestedGlowingBollard(Large).png",
			Description = "A large glowing Infested bollard.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Grass Patch"] = {
			Name = "Infested Grass Patch",
			Image = "DecoInfestedGrassPatch.png",
			Description = "Ground patch growth that is classified as Infested grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Heavy Pillar"] = {
			Name = "Infested Heavy Pillar",
			Image = "DecoInfestedHeavyPillar.png",
			Description = "A large top heavy pillar formed from infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Mound"] = {
			Name = "Infested Mound",
			Image = "DecoInfestedMound.png",
			Description = "A mound of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Mound (Large)"] = {
			Name = "Infested Mound (Large)",
			Image = "DecoInfestedMound(Large).png",
			Description = "A large Infested mound growth",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Mound (Small)"] = {
			Name = "Infested Mound (Small)",
			Image = "DecoInfestedMound(Small).png",
			Description = "A small mound of Infested growth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Mound With Pustules (Large)"] = {
			Name = "Infested Mound With Pustules (Large)",
			Image = "DecoInfestedMoundWithPustules(Large).png",
			Description = "A large mound of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Mound With Pustules (Small)"] = {
			Name = "Infested Mound With Pustules (Small)",
			Image = "DecoInfestedMoundWithPustules(Small).png",
			Description = "A small mound of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Outgrowth"] = {
			Name = "Infested Outgrowth",
			Image = "DecoInfestedOutgrowth.png",
			Description = "A glowing infested growth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Pillar"] = {
			Name = "Infested Pillar",
			Image = "DecoInfestedPillar.png",
			Description = "A long thin infested biomass formed as a pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Infested Pillar Cyst"] = {
			Name = "Infested Pillar Cyst",
			Image = "DecoInfestedPillarCyst.png",
			Description = "An Infested cyst on a small pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Pillar Cyst (Large)"] = {
			Name = "Infested Pillar Cyst (Large)",
			Image = "DecoInfestedPillarCyst(Large).png",
			Description = "A large Infested cyst on a pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Pillar Cyst Popped"] = {
			Name = "Infested Pillar Cyst Popped",
			Image = "DecoInfestedPillarCystPopped.png",
			Description = "An Infested popped cyst on a small pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Pillar Cyst Popped (Large)"] = {
			Name = "Infested Pillar Cyst Popped (Large)",
			Image = "DecoInfestedPillarCystPopped(Large).png",
			Description = "A large popped Infested cyst on a pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Pillar Group"] = {
			Name = "Infested Pillar Group",
			Image = "DecoInfestedPillarGroup.png",
			Description = "A large group of Infested pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Infested Plant (Large)"] = {
			Name = "Infested Plant (Large)",
			Image = "DecoInfestedPlant(Large).png",
			Description = "A large Infested plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Plant (Small)"] = {
			Name = "Infested Plant (Small)",
			Image = "DecoInfestedPlant(Small).png",
			Description = "A small Infested plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Rubedo" }
				}
			}
		},
		["Infested Plant Bulb"] = {
			Name = "Infested Plant Bulb",
			Image = "DecoInfestedPlantBulb.png",
			Description = "The bulb of an Infested plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Rubedo" }
				}
			}
		},
		["Infested Plant Germ"] = {
			Name = "Infested Plant Germ",
			Image = "DecoInfestedPlantGerm.png",
			Description = "A small germ of an Infested plant getting ready to sprout.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Rubedo" }
				}
			}
		},
		["Infested Plant Sprout"] = {
			Name = "Infested Plant Sprout",
			Image = "DecoInfestedPlantSprout.png",
			Description = "A sprouting of an Infested plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Rubedo" }
				}
			}
		},
		["Infested Plant Sprout Husk"] = {
			Name = "Infested Plant Sprout Husk",
			Image = "DecoInfestedPlantSproutHusk.png",
			Description = "The inner Infested plant germ husk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Rubedo" }
				}
			}
		},
		["Infested Prototaxite"] = {
			Name = "Infested Prototaxite",
			Image = "DecoInfestedPrototaxite.png",
			Description = "An Infested tree-like prototaxite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Prototaxite (Large)"] = {
			Name = "Infested Prototaxite (Large)",
			Image = "DecoInfestedPrototaxite(Large).png",
			Description = "A large Infested tree-like prototaxite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Prototaxite (Small)"] = {
			Name = "Infested Prototaxite (Small)",
			Image = "DecoInfestedPrototaxite(Small).png",
			Description = "A small Infested tree-like prototaxite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Prototaxite Massive"] = {
			Name = "Infested Prototaxite Massive",
			Image = "DecoInfestedPrototaxiteMassive.png",
			Description = "An Infested massive tree-like prototaxite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Prototaxite Twisted"] = {
			Name = "Infested Prototaxite Twisted",
			Image = "DecoInfestedPrototaxiteTwisted.png",
			Description = "An Infested twisted tree-like prototaxite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Scab Growth"] = {
			Name = "Infested Scab Growth",
			Image = "DecoInfestedScabGrowth.png",
			Description = "This Infested growth is found scabbing open wounds of large creatures.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Infested Scale"] = {
			Name = "Infested Scale",
			Image = "DecoInfestedScale.png",
			Description = "A scale from an Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Scale (Large)"] = {
			Name = "Infested Scale (Large)",
			Image = "DecoInfestedScale(Large).png",
			Description = "A large Infested creature's scale.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Infested Seed Nest"] = {
			Name = "Infested Seed Nest",
			Image = "DecoInfestedSeedNest.png",
			Description = "A small nest that Infested seeds are settled in.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Infested Spawn Pod"] = {
			Name = "Infested Spawn Pod",
			Image = "DecoInfestedSpawnPod.png",
			Description = "Infested creatures are known to spawn from this formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Spinal Bone"] = {
			Name = "Infested Spinal Bone",
			Image = "DecoInfestedSpinalBone.png",
			Description = "A large spinal bone from an Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Infested Spinal Chord"] = {
			Name = "Infested Spinal Chord",
			Image = "DecoInfestedSpinalChord.png",
			Description = "A large section of Infested spinal chord.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Infested Spore"] = {
			Name = "Infested Spore",
			Image = "DecoInfestedSpore.png",
			Description = "An infested spore.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Infested Spores"] = {
			Name = "Infested Spores",
			Image = "DecoInfestedSpores.png",
			Description = "A small grouping of Infested spores.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Sporophytes"] = {
			Name = "Infested Sporophytes",
			Image = "DecoInfestedSporophytes.png",
			Description = "A small clump of newly formed Infested growths.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Strand (Short)"] = {
			Name = "Infested Strand (Short)",
			Image = "DecoInfestedStrand(Short).png",
			Description = "A short strand of infested biomass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Structural Arm"] = {
			Name = "Infested Structural Arm",
			Image = "DecoInfestedStructuralArm.png",
			Description = "A very large Infested structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Structural Arm Base"] = {
			Name = "Infested Structural Arm Base",
			Image = "DecoInfestedStructuralArmBase.png",
			Description = "A very large Infested structure base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendon"] = {
			Name = "Infested Tendon",
			Image = "DecoInfestedTendon.png",
			Description = "A tendon of a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendons (Thin Narrow)"] = {
			Name = "Infested Tendons (Thin Narrow)",
			Image = "DecoInfestedTendons(ThinNarrow).png",
			Description = "A web of thin narrow tendons from a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendons (Thin Short Narrow)"] = {
			Name = "Infested Tendons (Thin Short Narrow)",
			Image = "DecoInfestedTendons(ThinShortNarrow).png",
			Description = "A compact group of thin short tendons from a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendons (Thin Short Wide)"] = {
			Name = "Infested Tendons (Thin Short Wide)",
			Image = "DecoInfestedTendons(ThinShortWide).png",
			Description = "A web of thin short wide tendons from a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendons (Thin Short)"] = {
			Name = "Infested Tendons (Thin Short)",
			Image = "DecoInfestedTendons(ThinShort).png",
			Description = "A web of thin short tendons from a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendons (Thin Wide)"] = {
			Name = "Infested Tendons (Thin Wide)",
			Image = "DecoInfestedTendons(ThinWide).png",
			Description = "A web of thin wide tendons from a large Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Tendril (Curved)"] = {
			Name = "Infested Tendril (Curved)",
			Image = "DecoInfestedTendril(Curved).png",
			Description = "A long infested tendril shaped like a shallow s.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Tendril (Long)"] = {
			Name = "Infested Tendril (Long)",
			Image = "DecoInfestedTendril(Long).png",
			Description = "A long infested straight tendril.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Tendril (Short S Curved)"] = {
			Name = "Infested Tendril (Short S Curved)",
			Image = "DecoInfestedTendril(ShortSCurved).png",
			Description = "A very short s curve-shaped infested tendril.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Tendril (Short)"] = {
			Name = "Infested Tendril (Short)",
			Image = "DecoInfestedTendril(Short).png",
			Description = "A short almost straight infested tendril.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Tendril (Straight)"] = {
			Name = "Infested Tendril (Straight)",
			Image = "DecoInfestedTendril(Straight).png",
			Description = "A long almost straight infested tendril.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Infested Tentacle"] = {
			Name = "Infested Tentacle",
			Image = "DecoInfestedTentacle.png",
			Description = "A long slim Infested tentacle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Web"] = {
			Name = "Infested Web",
			Image = "DecoInfestedWeb.png",
			Description = "A small collection of infested webbing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Web (Long With Pustules)"] = {
			Name = "Infested Web (Long With Pustules)",
			Image = "DecoInfestedWeb(LongWithPustules).png",
			Description = "A long growth of infested webbing with pustules forming.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Web (Very Small)"] = {
			Name = "Infested Web (Very Small)",
			Image = "DecoInfestedWeb(VerySmall).png",
			Description = "A very small infested web.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Web (With Pustules)"] = {
			Name = "Infested Web (With Pustules)",
			Image = "DecoInfestedWeb(WithPustules).png",
			Description = "A growth of infested webbing with pustules forming.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Infested Zygote"] = {
			Name = "Infested Zygote",
			Image = "DecoInfestedZygote.png",
			Description = "A spawn of an Infested creature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		}
	},
	Natural = {
		["Agkara Plant"] = {
			Name = "Agkara Plant",
			Image = "DecoAgkaraPlant.png",
			Description = "Once thought lost, this plant was a favorite in Orokin gardens.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Anubias Plant"] = {
			Name = "Anubias Plant",
			Image = "DecoAnubiasPlant.png",
			Description = "A large underwater plant found deep in the oceans of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Asteroid Rock (Medium)"] = {
			Name = "Asteroid Rock (Medium)",
			Image = "DecoAsteroidRock(Medium).png",
			Description = "A medium rock that is part of some rubble from an asteroid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Asteroid Rock (Small)"] = {
			Name = "Asteroid Rock (Small)",
			Image = "DecoAsteroidRock(Small).png",
			Description = "A small rock that is part of some rubble from an asteroid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Asteroid Rock Pile (Rubble)"] = {
			Name = "Asteroid Rock Pile (Rubble)",
			Image = "DecoAsteroidRockPile(Rubble).png",
			Description = "A small rock rubble pile from an asteroid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Asteroid Rock Pillar (Large)"] = {
			Name = "Asteroid Rock Pillar (Large)",
			Image = "DecoAsteroidRockPillar(Large).png",
			Description = "A large pillar of rock from an asteroid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Asteroid Rock Wall"] = {
			Name = "Asteroid Rock Wall",
			Image = "DecoAsteroidRockWall.png",
			Description = "A large wall made of asteroid rock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Asteroid Rock Wall (Curved)"] = {
			Name = "Asteroid Rock Wall (Curved)",
			Image = "DecoAsteroidRockWall(Curved).png",
			Description = "A large rock wall made of asteroid rock in a curved formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Asteroid Rock Wall (Large)"] = {
			Name = "Asteroid Rock Wall (Large)",
			Image = "DecoAsteroidRockWall(Large).png",
			Description = "A large jagged rock wall from an asteroid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Avarna Plant"] = {
			Name = "Avarna Plant",
			Image = "DecoAvarnaPlant.png",
			Description = "An exotic plant recovered from deep in Earth's jungles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Balb Root"] = {
			Name = "Balb Root",
			Image = "DecoBalbRoot.png",
			Description = "A root that Ostrons use to make flour.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Balb Root Basket (Large)"] = {
			Name = "Balb Root Basket (Large)",
			Image = "DecoBalbRootBasket(Large).png",
			Description = "A bountiful harvest of balb roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Balb Root Basket (Shell)"] = {
			Name = "Balb Root Basket (Shell)",
			Image = "DecoBalbRootBasket(Shell).png",
			Description = "A harvest of balb roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Bamboo Plant (Cluster)"] = {
			Name = "Bamboo Plant (Cluster)",
			Image = "DecoBambooPlant(Cluster).png",
			Description = "A cluster of bamboo plants.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bamboo Plant (Curved Single)"] = {
			Name = "Bamboo Plant (Curved Single)",
			Image = "DecoBambooPlant(CurvedSingle).png",
			Description = "A single curved bamboo plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bamboo Plant (Single)"] = {
			Name = "Bamboo Plant (Single)",
			Image = "DecoBambooPlant(Single).png",
			Description = "A single straight bamboo plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bird Nest Fern (Fully Open)"] = {
			Name = "Bird Nest Fern (Fully Open)",
			Image = "DecoBirdNestFern(FullyOpen).png",
			Description = "A Bird Nest fern that is fully open.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bird Nest Fern (Narrowly Opened)"] = {
			Name = "Bird Nest Fern (Narrowly Opened)",
			Image = "DecoBirdNestFern(NarrowlyOpened).png",
			Description = "A Bird Nest fern that is narrowly opened.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bomba Fruit"] = {
			Name = "Bomba Fruit",
			Image = "DecoBombaFruit.png",
			Description = "A sweet fruit enjoyed by Ostrons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Bomba Plant"] = {
			Name = "Bomba Plant",
			Image = "DecoBombaPlant.png",
			Description = "Ostrons use the leaves of the bomba plant to make chimurr.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Bomba Plant Cluster"] = {
			Name = "Bomba Plant Cluster",
			Image = "DecoBombaPlantCluster.png",
			Description = "Ostrons use the leaves of the bomba plant to make chimurr.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Boulder (Irregular)"] = {
			Name = "Boulder (Irregular)",
			Image = "DecoBoulder(Irregular).png",
			Description = "A large irregularly shaped boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Boulder (Large)"] = {
			Name = "Boulder (Large)",
			Image = "DecoBoulder(Large).png",
			Description = "A large boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Boulder (Rectangular)"] = {
			Name = "Boulder (Rectangular)",
			Image = "DecoBoulder(Rectangular).png",
			Description = "A large rectangular shaped boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Boulder (Very Large)"] = {
			Name = "Boulder (Very Large)",
			Image = "DecoBoulder(VeryLarge).png",
			Description = "A large boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bush (Small)"] = {
			Name = "Bush (Small)",
			Image = "DecoBush(Small).png",
			Description = "A small bush.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bush (Tall)"] = {
			Name = "Bush (Tall)",
			Image = "DecoBush(Tall).png",
			Description = "A bush with a tall profile.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Cetus Boulder (Rectangular Cube)"] = {
			Name = "Cetus Boulder (Rectangular Cube)",
			Image = "DecoCetusBoulder(RectangularCube).png",
			Description = "A boulder from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Boulder (Rounded Cube)"] = {
			Name = "Cetus Boulder (Rounded Cube)",
			Image = "DecoCetusBoulder(RoundedCube).png",
			Description = "A boulder from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Boulder (Rounded)"] = {
			Name = "Cetus Boulder (Rounded)",
			Image = "DecoCetusBoulder(Rounded).png",
			Description = "A boulder from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Boulder (Tapered)"] = {
			Name = "Cetus Boulder (Tapered)",
			Image = "DecoCetusBoulder(Tapered).png",
			Description = "A boulder from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Boulder (Wedge)"] = {
			Name = "Cetus Boulder (Wedge)",
			Image = "DecoCetusBoulder(Wedge).png",
			Description = "A boulder from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Branch Pile"] = {
			Name = "Cetus Branch Pile",
			Image = "DecoCetusBranchPile.png",
			Description = "A small pile of tree branches gathered in the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Dirt Mound"] = {
			Name = "Cetus Dirt Mound",
			Image = "DecoCetusDirtMound.png",
			Description = "A mound of dirt from the surface of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Dirt Mound (Crescent)"] = {
			Name = "Cetus Dirt Mound (Crescent)",
			Image = "DecoCetusDirtMound(Crescent).png",
			Description = "A mound of dirt from the surface of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Dirt Mound (Long)"] = {
			Name = "Cetus Dirt Mound (Long)",
			Image = "DecoCetusDirtMound(Long).png",
			Description = "A mound of dirt from the surface of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Driftwood, Angular"] = {
			Name = "Cetus Driftwood, Angular",
			Image = "DecoCetusDriftwood,Angular.png",
			Description = "A small piece of angular driftwood.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Driftwood, Hooked"] = {
			Name = "Cetus Driftwood, Hooked",
			Image = "DecoCetusDriftwood,Hooked.png",
			Description = "A small piece of driftwood that has a hooked shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Driftwood, Straight"] = {
			Name = "Cetus Driftwood, Straight",
			Image = "DecoCetusDriftwood,Straight.png",
			Description = "A small piece of driftwood.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Driftwood, Tapered"] = {
			Name = "Cetus Driftwood, Tapered",
			Image = "DecoCetusDriftwood,Tapered.png",
			Description = "A small piece of tapered driftwood.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Leaf Pile (Long)"] = {
			Name = "Cetus Leaf Pile (Long)",
			Image = "DecoCetusLeafPile(Long).png",
			Description = "A long dense pile of leaves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Leaf Pile (Round)"] = {
			Name = "Cetus Leaf Pile (Round)",
			Image = "DecoCetusLeafPile(Round).png",
			Description = "A round dense pile of leaves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Leaf Pile (Sparse)"] = {
			Name = "Cetus Leaf Pile (Sparse)",
			Image = "DecoCetusLeafPile(Sparse).png",
			Description = "A sparse pile of leaves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Log (Long)"] = {
			Name = "Cetus Log (Long)",
			Image = "DecoCetusLog(Long).png",
			Description = "A log retrieved from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Log (Short)"] = {
			Name = "Cetus Log (Short)",
			Image = "DecoCetusLog(Short).png",
			Description = "A log retrieved from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Log (Tapered)"] = {
			Name = "Cetus Log (Tapered)",
			Image = "DecoCetusLog(Tapered).png",
			Description = "A log retrieved from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock (Wedge)"] = {
			Name = "Cetus Rock (Wedge)",
			Image = "DecoCetusRock(Wedge).png",
			Description = "A wedge shaped rock from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock Pillar"] = {
			Name = "Cetus Rock Pillar",
			Image = "DecoCetusRockPillar.png",
			Description = "A large pillar of rock from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock Slabs"] = {
			Name = "Cetus Rock Slabs",
			Image = "DecoCetusRockSlabs.png",
			Description = "Slabs of rock from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock Wall (Convex)"] = {
			Name = "Cetus Rock Wall (Convex)",
			Image = "DecoCetusRockWall(Convex).png",
			Description = "A smooth rocky surface from Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock Wall (Jagged)"] = {
			Name = "Cetus Rock Wall (Jagged)",
			Image = "DecoCetusRockWall(Jagged).png",
			Description = "A rough rocky surface from Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock With Fluid"] = {
			Name = "Cetus Rock With Fluid",
			Image = "DecoCetusRockWithFluid.png",
			Description = "A rock covered in fluid that seeped from Orokin towers on Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Rock With Moss"] = {
			Name = "Cetus Rock With Moss",
			Image = "DecoCetusRockWithMoss.png",
			Description = "A mossy rock from Earth's plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Stone And Roots Path"] = {
			Name = "Cetus Stone And Roots Path",
			Image = "DecoCetusStoneAndRootsPath.png",
			Description = "A natural path comprised of roots and stones.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Stone Path"] = {
			Name = "Cetus Stone Path",
			Image = "DecoCetusStonePath.png",
			Description = "A natural path comprised of stones.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cherry Blossom Tree"] = {
			Name = "Cherry Blossom Tree",
			Image = "DecoCherryBlossomTree.png",
			Description = "A large cherry blossom tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Cherry Blossom Tree (Branch)"] = {
			Name = "Cherry Blossom Tree (Branch)",
			Image = "DecoCherryBlossomTree(Branch).png",
			Description = "A branch from the cherry blossom tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cherry Blossom Tree (Dead)"] = {
			Name = "Cherry Blossom Tree (Dead)",
			Image = "DecoCherryBlossomTree(Dead).png",
			Description = "A large cherry blossom tree that has died.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Climbing Vines"] = {
			Name = "Climbing Vines",
			Image = "DecoClimbingVines.png",
			Description = "A growth of vines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Coral Tower"] = {
			Name = "Coral Tower",
			Image = "DecoCoralTower.png",
			Description = "A large underwater coral found deep in the oceans of the Origin system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Dead Tree"] = {
			Name = "Dead Tree",
			Image = "DecoDeadTree.png",
			Description = "A dead tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Dead Tree (No Branches)"] = {
			Name = "Dead Tree (No Branches)",
			Image = "DecoDeadTree(NoBranches).png",
			Description = "A husk of a dead tree with no branches.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Dead Tree (Tall Broken Branches)"] = {
			Name = "Dead Tree (Tall Broken Branches)",
			Image = "DecoDeadTree(TallBrokenBranches).png",
			Description = "A tall dead tree with broken branches.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Dezya Plant"] = {
			Name = "Dezya Plant",
			Image = "DecoDezyaPlant.png",
			Description = "A hardy plant sometimes found growing near steam vents on Sedna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Drilled Rock Opening"] = {
			Name = "Drilled Rock Opening",
			Image = "DecoDrilledRockOpening.png",
			Description = "A rock formation that has a hole drilled into it.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Bush (Large)"] = {
			Name = "Duviri Bush (Large)",
			Image = "DecoDuviriBush(Large).png",
			Description = "A large bush designed to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Bush (Small)"] = {
			Name = "Duviri Bush (Small)",
			Image = "DecoDuviriBush(Small).png",
			Description = "A small bush designed to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Fern (Gold)"] = {
			Name = "Duviri Fern (Gold)",
			Image = "DecoDuviriFern(Gold).png",
			Description = "A golden fern designed to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Fern Leaves (Gold)"] = {
			Name = "Duviri Fern Leaves (Gold)",
			Image = "DecoDuviriFernLeaves(Gold).png",
			Description = "Golden fern leaves designed to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Ferns (Green)"] = {
			Name = "Duviri Ferns (Green)",
			Image = "DecoDuviriFerns(Green).png",
			Description = "Green ferns designed to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Flowers (Arch)"] = {
			Name = "Duviri Flowers (Arch)",
			Image = "DecoDuviriFlowers(Arch).png",
			Description = "Flowers arranged in an arch to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Flowers (Circle)"] = {
			Name = "Duviri Flowers (Circle)",
			Image = "DecoDuviriFlowers(Circle).png",
			Description = "Flowers arranged in a circle to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Flowers (Fern)"] = {
			Name = "Duviri Flowers (Fern)",
			Image = "DecoDuviriFlowers(Fern).png",
			Description = "Flowers arranged with a fern to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Flowers (Patch)"] = {
			Name = "Duviri Flowers (Patch)",
			Image = "DecoDuviriFlowers(Patch).png",
			Description = "A flower patch arranged to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Flowers (Row)"] = {
			Name = "Duviri Flowers (Row)",
			Image = "DecoDuviriFlowers(Row).png",
			Description = "Flowers arranged in a row to look like the flora described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Arch, Angled)"] = {
			Name = "Duviri Rock (Arch, Angled)",
			Image = "DecoDuviriRock(Arch,Angled).png",
			Description = "An angled stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Arch, Broken)"] = {
			Name = "Duviri Rock (Arch, Broken)",
			Image = "DecoDuviriRock(Arch,Broken).png",
			Description = "A broken stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Arch, Circle)"] = {
			Name = "Duviri Rock (Arch, Circle)",
			Image = "DecoDuviriRock(Arch,Circle).png",
			Description = "A circular stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Arch, Cluster)"] = {
			Name = "Duviri Rock (Arch, Cluster)",
			Image = "DecoDuviriRock(Arch,Cluster).png",
			Description = "A cluster of stone arches designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Arch, Crescent)"] = {
			Name = "Duviri Rock (Arch, Crescent)",
			Image = "DecoDuviriRock(Arch,Crescent).png",
			Description = "A cresent-shaped stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Arch, Narrow)"] = {
			Name = "Duviri Rock (Arch, Narrow)",
			Image = "DecoDuviriRock(Arch,Narrow).png",
			Description = "A narrow stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Arch, Pointed)"] = {
			Name = "Duviri Rock (Arch, Pointed)",
			Image = "DecoDuviriRock(Arch,Pointed).png",
			Description = "A pointed stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Rock (Arch, Spiral)"] = {
			Name = "Duviri Rock (Arch, Spiral)",
			Image = "DecoDuviriRock(Arch,Spiral).png",
			Description = "A spiral stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Rock (Arch, Thick)"] = {
			Name = "Duviri Rock (Arch, Thick)",
			Image = "DecoDuviriRock(Arch,Thick).png",
			Description = "A thick stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Rock (Arch, Uneven)"] = {
			Name = "Duviri Rock (Arch, Uneven)",
			Image = "DecoDuviriRock(Arch,Uneven).png",
			Description = "An uneven stone arch designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Rock (Circle, Bisect)"] = {
			Name = "Duviri Rock (Circle, Bisect)",
			Image = "DecoDuviriRock(Circle,Bisect).png",
			Description = "Two stone circles fused into one, designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Circle, Cluster)"] = {
			Name = "Duviri Rock (Circle, Cluster)",
			Image = "DecoDuviriRock(Circle,Cluster).png",
			Description = "A cluster of stone circles designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Circle, Pair)"] = {
			Name = "Duviri Rock (Circle, Pair)",
			Image = "DecoDuviriRock(Circle,Pair).png",
			Description = "A pair of stone circles designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Circle, Single)"] = {
			Name = "Duviri Rock (Circle, Single)",
			Image = "DecoDuviriRock(Circle,Single).png",
			Description = "A single stone circle designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Circle, Trisect)"] = {
			Name = "Duviri Rock (Circle, Trisect)",
			Image = "DecoDuviriRock(Circle,Trisect).png",
			Description = "Three stone circles fused into one, designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Nook, Bisect)"] = {
			Name = "Duviri Rock (Nook, Bisect)",
			Image = "DecoDuviriRock(Nook,Bisect).png",
			Description = "A pair of stone arches fused into a nook, designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Rock (Nook, Trisect)"] = {
			Name = "Duviri Rock (Nook, Trisect)",
			Image = "DecoDuviriRock(Nook,Trisect).png",
			Description = "Three stone arches fused into a nook, designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Rock (Plateau, Polished)"] = {
			Name = "Duviri Rock (Plateau, Polished)",
			Image = "DecoDuviriRock(Plateau,Polished).png",
			Description = "A polished stone plateau designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Plateau, Tarnished)"] = {
			Name = "Duviri Rock (Plateau, Tarnished)",
			Image = "DecoDuviriRock(Plateau,Tarnished).png",
			Description = "A tarnished stone plateau designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Rock (Ring, Polished)"] = {
			Name = "Duviri Rock (Ring, Polished)",
			Image = "DecoDuviriRock(Ring,Polished).png",
			Description = "A polished stone ring designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Ring, Tarnished)"] = {
			Name = "Duviri Rock (Ring, Tarnished)",
			Image = "DecoDuviriRock(Ring,Tarnished).png",
			Description = "A tarnished stone ring designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Rock (Slab, Concave)"] = {
			Name = "Duviri Rock (Slab, Concave)",
			Image = "DecoDuviriRock(Slab,Concave).png",
			Description = "A concave stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Slab, Convex)"] = {
			Name = "Duviri Rock (Slab, Convex)",
			Image = "DecoDuviriRock(Slab,Convex).png",
			Description = "A convex stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Rock (Slab, Crescent)"] = {
			Name = "Duviri Rock (Slab, Crescent)",
			Image = "DecoDuviriRock(Slab,Crescent).png",
			Description = "A crescent-shaped stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Slab, Rectangle)"] = {
			Name = "Duviri Rock (Slab, Rectangle)",
			Image = "DecoDuviriRock(Slab,Rectangle).png",
			Description = "A rectangular stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Slab, Tapered)"] = {
			Name = "Duviri Rock (Slab, Tapered)",
			Image = "DecoDuviriRock(Slab,Tapered).png",
			Description = "A tapered stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Rock (Slab, Triangle)"] = {
			Name = "Duviri Rock (Slab, Triangle)",
			Image = "DecoDuviriRock(Slab,Triangle).png",
			Description = "A triangular stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Slab, Wedge)"] = {
			Name = "Duviri Rock (Slab, Wedge)",
			Image = "DecoDuviriRock(Slab,Wedge).png",
			Description = "A wedge-shaped stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Rock (Wave, Bisect)"] = {
			Name = "Duviri Rock (Wave, Bisect)",
			Image = "DecoDuviriRock(Wave,Bisect).png",
			Description = "A pair of stone waves fused into one, designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Wave, Circle)"] = {
			Name = "Duviri Rock (Wave, Circle)",
			Image = "DecoDuviriRock(Wave,Circle).png",
			Description = "A circular stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Wave, Crescent)"] = {
			Name = "Duviri Rock (Wave, Crescent)",
			Image = "DecoDuviriRock(Wave,Crescent).png",
			Description = "A crescent-shaped stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Rock (Wave, Eroded)"] = {
			Name = "Duviri Rock (Wave, Eroded)",
			Image = "DecoDuviriRock(Wave,Eroded).png",
			Description = "An eroded stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Rock (Wave, Left)"] = {
			Name = "Duviri Rock (Wave, Left)",
			Image = "DecoDuviriRock(Wave,Left).png",
			Description = "The left side of a stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Wave, Pointed)"] = {
			Name = "Duviri Rock (Wave, Pointed)",
			Image = "DecoDuviriRock(Wave,Pointed).png",
			Description = "A pointed stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Rock (Wave, Right)"] = {
			Name = "Duviri Rock (Wave, Right)",
			Image = "DecoDuviriRock(Wave,Right).png",
			Description = "The right side of a stone wave designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Eidolon Bush"] = {
			Name = "Eidolon Bush",
			Image = "DecoEidolonBush.png",
			Description = "A small bush found in the plains of Eidolon which sometimes bears fruit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Fern"] = {
			Name = "Fern",
			Image = "DecoFern.png",
			Description = "A fern.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Fern (Sickly)"] = {
			Name = "Fern (Sickly)",
			Image = "DecoFern(Sickly).png",
			Description = "A fern with some sickly leaves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Ferns"] = {
			Name = "Ferns",
			Image = "DecoFerns.png",
			Description = "A group of ferns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Foliage"] = {
			Name = "Foliage",
			Image = "DecoFoliage.png",
			Description = "Typical foliage found in Earth's forests.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Forest Flower"] = {
			Name = "Forest Flower",
			Image = "DecoForestFlower.png",
			Description = "A flower found in the forests of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Geisang Reeds"] = {
			Name = "Geisang Reeds",
			Image = "DecoGeisangReeds.png",
			Description = "The warm glow of Geisand Reeds is a comfort to Ostrons who venture into the Plains of Eidolon at night.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Grass Patch (Large Brown)"] = {
			Name = "Grass Patch (Large Brown)",
			Image = "DecoGrassPatch(LargeBrown).png",
			Description = "A large patch of brown grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grass Patch (Large Green)"] = {
			Name = "Grass Patch (Large Green)",
			Image = "DecoGrassPatch(LargeGreen).png",
			Description = "A large patch of green grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Grass Patch (Large Red)"] = {
			Name = "Grass Patch (Large Red)",
			Image = "DecoGrassPatch(LargeRed).png",
			Description = "A large patch of red grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Grass Tuft (Small Tall)"] = {
			Name = "Grass Tuft (Small Tall)",
			Image = "DecoGrassTuft(SmallTall).png",
			Description = "A small tuft of tall grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grass Tuft (Small)"] = {
			Name = "Grass Tuft (Small)",
			Image = "DecoGrassTuft(Small).png",
			Description = "A small tuft of grass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Grossa Fern"] = {
			Name = "Grossa Fern",
			Image = "DecoGrossaFern.png",
			Description = "A large fern found in the forests of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hakara Plant"] = {
			Name = "Hakara Plant",
			Image = "DecoHakaraPlant.png",
			Description = "A lost plant species discovered in an Orokin Derelict's lab.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hollowed Log"] = {
			Name = "Hollowed Log",
			Image = "DecoHollowedLog.png",
			Description = "A large hollowed log.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hollowed Log Half"] = {
			Name = "Hollowed Log Half",
			Image = "DecoHollowedLogHalf.png",
			Description = "A large half of a hollowed log.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Ice Formation (Large Curved)"] = {
			Name = "Ice Formation (Large Curved)",
			Image = "DecoIceFormation(LargeCurved).png",
			Description = "A large ice formation that is curved.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Glacier"] = {
			Name = "Ice Glacier",
			Image = "DecoIceGlacier.png",
			Description = "A large formation of compacted snow removed from a glacier",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Glacier Pillar"] = {
			Name = "Ice Glacier Pillar",
			Image = "DecoIceGlacierPillar.png",
			Description = "A pillar formation of compacted snow removed from a glacier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Glacier Pillar (Large)"] = {
			Name = "Ice Glacier Pillar (Large)",
			Image = "DecoIceGlacierPillar(Large).png",
			Description = "A very large pillar formation of compacted snow removed from a glacier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Glacier Wedge"] = {
			Name = "Ice Glacier Wedge",
			Image = "DecoIceGlacierWedge.png",
			Description = "A large, compacted wedge of snow from a glacier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Stalactite"] = {
			Name = "Ice Stalactite",
			Image = "DecoIceStalactite.png",
			Description = "An ice stalactite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Stalactite (Large Single)"] = {
			Name = "Ice Stalactite (Large Single)",
			Image = "DecoIceStalactite(LargeSingle).png",
			Description = "A large single stalactite ice formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Stalactite (Large)"] = {
			Name = "Ice Stalactite (Large)",
			Image = "DecoIceStalactite(Large).png",
			Description = "A large stalactite made of ice.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Stalagmite (Large)"] = {
			Name = "Ice Stalagmite (Large)",
			Image = "DecoIceStalagmite(Large).png",
			Description = "A large ice stalagmite.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Cryotic" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ice Stalagmite (Small)"] = {
			Name = "Ice Stalagmite (Small)",
			Image = "DecoIceStalagmite(Small).png",
			Description = "A small stalagmite ice formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Ice Wall (Large)"] = {
			Name = "Ice Wall (Large)",
			Image = "DecoIceWall(Large).png",
			Description = "A large wall of ice.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ivy (Ground Cover, Long)"] = {
			Name = "Ivy (Ground Cover, Long)",
			Image = "DecoIvy(GroundCover,Long).png",
			Description = "A growth of ground covering ivy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Ivy (Ground Cover, Short)"] = {
			Name = "Ivy (Ground Cover, Short)",
			Image = "DecoIvy(GroundCover,Short).png",
			Description = "A growth of ground covering ivy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Juta Reeds"] = {
			Name = "Juta Reeds",
			Image = "DecoJutaReeds.png",
			Description = "Used as straws in various Ostron beverages.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Juta Reeds Basket (Large)"] = {
			Name = "Juta Reeds Basket (Large)",
			Image = "DecoJutaReedsBasket(Large).png",
			Description = "A bountiful harvest of juta reeds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Juta Reeds Basket (Medium)"] = {
			Name = "Juta Reeds Basket (Medium)",
			Image = "DecoJutaReedsBasket(Medium).png",
			Description = "A harvest of juta reeds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Juta Reeds Basket (Small)"] = {
			Name = "Juta Reeds Basket (Small)",
			Image = "DecoJutaReedsBasket(Small).png",
			Description = "A harvest of juta reeds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Kabakka Gourds"] = {
			Name = "Kabakka Gourds",
			Image = "DecoKabakkaGourds.png",
			Description = "Kabakka gourds are a staple of simple Ostron cuisine, often used to fortify soups and stews.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Kathini Plant"] = {
			Name = "Kathini Plant",
			Image = "DecoKathiniPlant.png",
			Description = "Seeds for this plant were found in a vault on Lua.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Kubrow Den"] = {
			Name = "Kubrow Den",
			Image = "DecoKubrowDen.png",
			Description = "A shelter mound of mud of forest debris made by Kubrows.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Kuteo Gourd"] = {
			Name = "Kuteo Gourd",
			Image = "DecoKuteoGourd.png",
			Description = "A nutritious gourd enjoyed by Ostrons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Kuteo Gourd Basket (Large)"] = {
			Name = "Kuteo Gourd Basket (Large)",
			Image = "DecoKuteoGourdBasket(Large).png",
			Description = "A bountiful harvest of kuteo gourds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Kuteo Gourd Basket (Medium)"] = {
			Name = "Kuteo Gourd Basket (Medium)",
			Image = "DecoKuteoGourdBasket(Medium).png",
			Description = "A harvest of kuteo gourds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Lilang Pods"] = {
			Name = "Lilang Pods",
			Image = "DecoLilangPods.png",
			Description = "Lilang pods can be crushed to make purple dye.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Lua Rock"] = {
			Name = "Lua Rock",
			Image = "DecoLuaRock.png",
			Description = "A large pile of rock from Earth's moon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lua Rock (Small)"] = {
			Name = "Lua Rock (Small)",
			Image = "DecoLuaRock(Small).png",
			Description = "A small rock from Earth's moon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lua Rock Column (Large)"] = {
			Name = "Lua Rock Column (Large)",
			Image = "DecoLuaRockColumn(Large).png",
			Description = "A very large column of rock from Earth's moon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lua Shard"] = {
			Name = "Lua Shard",
			Image = "DecoLuaShard.png",
			Description = "A small shard from the surface of Lua.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lua Shard Cluster"] = {
			Name = "Lua Shard Cluster",
			Image = "DecoLuaShardCluster.png",
			Description = "A cluster of rock from Lua.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Lua Shard Cluster (Large)"] = {
			Name = "Lua Shard Cluster (Large)",
			Image = "DecoLuaShardCluster(Large).png",
			Description = "A large cluster of rock from Lua.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lua Shard Cluster (Small)"] = {
			Name = "Lua Shard Cluster (Small)",
			Image = "DecoLuaShardCluster(Small).png",
			Description = "A small cluster of rock from Lua.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Luciferin Gogalla Plant"] = {
			Name = "Luciferin Gogalla Plant",
			Image = "DecoLuciferinGogallaPlant.png",
			Description = "An underwater plant that glows.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Maple Tree (Intertwined)"] = {
			Name = "Maple Tree (Intertwined)",
			Image = "DecoMapleTree(Intertwined).png",
			Description = "Two maple trees intertwine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Maple Tree (Single)"] = {
			Name = "Maple Tree (Single)",
			Image = "DecoMapleTree(Single).png",
			Description = "A small single Maple tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Martian Ancient Rock (Eroded)"] = {
			Name = "Martian Ancient Rock (Eroded)",
			Image = "DecoMartianAncientRock(Eroded).png",
			Description = "A small cluster of Martian rocks that have eroded over the centuries.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Martian Ancient Rock (Settlement Formation)"] = {
			Name = "Martian Ancient Rock (Settlement Formation)",
			Image = "DecoMartianAncientRock(SettlementFormation).png",
			Description = "A Martian rock formation with hints of an ancient civilization carved into its surface.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Martian Boulder"] = {
			Name = "Martian Boulder",
			Image = "DecoMartianBoulder.png",
			Description = "A boulder from the surface of Mars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Martian Boulder (Small)"] = {
			Name = "Martian Boulder (Small)",
			Image = "DecoMartianBoulder(Small).png",
			Description = "A small boulder from the surface of Mars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Martian Rock (Large Formation)"] = {
			Name = "Martian Rock (Large Formation)",
			Image = "DecoMartianRock(LargeFormation).png",
			Description = "A large rock formation from the surface of Mars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Martian Rock (Large)"] = {
			Name = "Martian Rock (Large)",
			Image = "DecoMartianRock(Large).png",
			Description = "A large Martian rock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Martian Rock (Slab)"] = {
			Name = "Martian Rock (Slab)",
			Image = "DecoMartianRock(Slab).png",
			Description = "A slab of martian rock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Martian Rock (Small Slab)"] = {
			Name = "Martian Rock (Small Slab)",
			Image = "DecoMartianRock(SmallSlab).png",
			Description = "A small slab of rock from the Martian surface.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Martian Rock (Weathered)"] = {
			Name = "Martian Rock (Weathered)",
			Image = "DecoMartianRock(Weathered).png",
			Description = "A large Martian rock that has eroded over the centuries.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Mocfi Fern Plant"] = {
			Name = "Mocfi Fern Plant",
			Image = "DecoMocfiFernPlant.png",
			Description = "A small fern found in the forests of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Moonlight Dragonlily Plant"] = {
			Name = "Moonlight Dragonlily Plant",
			Image = "DecoMoonlightDragonlilyPlant.png",
			Description = "A flower found in the Earth forests with blooms at night.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Moonlight Jadeleaf Plant"] = {
			Name = "Moonlight Jadeleaf Plant",
			Image = "DecoMoonlightJadeleafPlant.png",
			Description = "A cluster of Moonlight Jadeleaves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Natural Vallis Animal Bones"] = {
			Name = "Natural Vallis Animal Bones",
			Image = "DecoNaturalVallisAnimalBones.png",
			Description = "A small pile of animal bones from Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coolant (Falls)"] = {
			Name = "Natural Vallis Coolant (Falls)",
			Image = "DecoNaturalVallisCoolant(Falls).png",
			Description = "A very large column of falling coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coolant (River)"] = {
			Name = "Natural Vallis Coolant (River)",
			Image = "DecoNaturalVallisCoolant(River).png",
			Description = "A large coolant river.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Arch)"] = {
			Name = "Natural Vallis Coral (Arch)",
			Image = "DecoNaturalVallisCoral(Arch).png",
			Description = "A large arch shape coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Bush)"] = {
			Name = "Natural Vallis Coral (Bush)",
			Image = "DecoNaturalVallisCoral(Bush).png",
			Description = "A large coral shaped like a bush.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Elkhorn)"] = {
			Name = "Natural Vallis Coral (Elkhorn)",
			Image = "DecoNaturalVallisCoral(Elkhorn).png",
			Description = "A large coral shaped like an elkhorn.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Fan)"] = {
			Name = "Natural Vallis Coral (Fan)",
			Image = "DecoNaturalVallisCoral(Fan).png",
			Description = "A large coral in a fanned shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Group Stack)"] = {
			Name = "Natural Vallis Coral (Group Stack)",
			Image = "DecoNaturalVallisCoral(GroupStack).png",
			Description = "A small group of stack coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Pair Stack)"] = {
			Name = "Natural Vallis Coral (Pair Stack)",
			Image = "DecoNaturalVallisCoral(PairStack).png",
			Description = "A pair of stack coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Small Bush)"] = {
			Name = "Natural Vallis Coral (Small Bush)",
			Image = "DecoNaturalVallisCoral(SmallBush).png",
			Description = "A small coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Stack)"] = {
			Name = "Natural Vallis Coral (Stack)",
			Image = "DecoNaturalVallisCoral(Stack).png",
			Description = "A single stack coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Coral (Tall)"] = {
			Name = "Natural Vallis Coral (Tall)",
			Image = "DecoNaturalVallisCoral(Tall).png",
			Description = "A very tall coral.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Dead Root"] = {
			Name = "Natural Vallis Dead Root",
			Image = "DecoNaturalVallisDeadRoot.png",
			Description = "A dead root.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Dead Root (Cluster)"] = {
			Name = "Natural Vallis Dead Root (Cluster)",
			Image = "DecoNaturalVallisDeadRoot(Cluster).png",
			Description = "A cluster of roots that are dead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Dead Root (Hub)"] = {
			Name = "Natural Vallis Dead Root (Hub)",
			Image = "DecoNaturalVallisDeadRoot(Hub).png",
			Description = "A large hub that roots would grow from if it were not dead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Dead Root (Large Cluster)"] = {
			Name = "Natural Vallis Dead Root (Large Cluster)",
			Image = "DecoNaturalVallisDeadRoot(LargeCluster).png",
			Description = "A large cluster of roots that are dead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Dead Root (Very Large Cluster)"] = {
			Name = "Natural Vallis Dead Root (Very Large Cluster)",
			Image = "DecoNaturalVallisDeadRoot(VeryLargeCluster).png",
			Description = "A very large cluster of roots that are dead.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Destroyed Fruit"] = {
			Name = "Natural Vallis Destroyed Fruit",
			Image = "DecoNaturalVallisDestroyedFruit.png",
			Description = "The destroyed fruit of vegetation found on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Large Breathing)"] = {
			Name = "Natural Vallis Fungus (Large Breathing)",
			Image = "DecoNaturalVallisFungus(LargeBreathing).png",
			Description = "A large fungus that is breathing in preparation for spore emission.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Large Post Spore)"] = {
			Name = "Natural Vallis Fungus (Large Post Spore)",
			Image = "DecoNaturalVallisFungus(LargePostSpore).png",
			Description = "A large fungus that has ejected its spores.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Large)"] = {
			Name = "Natural Vallis Fungus (Large)",
			Image = "DecoNaturalVallisFungus(Large).png",
			Description = "A large fungus from Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Mature)"] = {
			Name = "Natural Vallis Fungus (Mature)",
			Image = "DecoNaturalVallisFungus(Mature).png",
			Description = "A large mature fungus found growing on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Sapling)"] = {
			Name = "Natural Vallis Fungus (Sapling)",
			Image = "DecoNaturalVallisFungus(Sapling).png",
			Description = "A large sapling fungus found growing on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Small Breathing)"] = {
			Name = "Natural Vallis Fungus (Small Breathing)",
			Image = "DecoNaturalVallisFungus(SmallBreathing).png",
			Description = "A small clump of fungus that is breathing in preparation for spore emission.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Small)"] = {
			Name = "Natural Vallis Fungus (Small)",
			Image = "DecoNaturalVallisFungus(Small).png",
			Description = "A small clump of fungus from Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Sparse)"] = {
			Name = "Natural Vallis Fungus (Sparse)",
			Image = "DecoNaturalVallisFungus(Sparse).png",
			Description = "Sparsely spaced bits of fungus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Fungus (Young)"] = {
			Name = "Natural Vallis Fungus (Young)",
			Image = "DecoNaturalVallisFungus(Young).png",
			Description = "A large young fungus found growing on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Glowing Tree (Long)"] = {
			Name = "Natural Vallis Glowing Tree (Long)",
			Image = "DecoNaturalVallisGlowingTree(Long).png",
			Description = "A thin long tree that has glowing stems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Glowing Tree (Stump)"] = {
			Name = "Natural Vallis Glowing Tree (Stump)",
			Image = "DecoNaturalVallisGlowingTree(Stump).png",
			Description = "A glowing tree stump.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Glowing Tree (Webbed)"] = {
			Name = "Natural Vallis Glowing Tree (Webbed)",
			Image = "DecoNaturalVallisGlowingTree(Webbed).png",
			Description = "A small webbed twisted glowing tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Lake Bubbles"] = {
			Name = "Natural Vallis Lake Bubbles",
			Image = "DecoNaturalVallisLakeBubbles.png",
			Description = "A clumping of naturally occuring bubbles from the lakes on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Lake Bubbles (Mound)"] = {
			Name = "Natural Vallis Lake Bubbles (Mound)",
			Image = "DecoNaturalVallisLakeBubbles(Mound).png",
			Description = "A large rounded clumping of naturally occuring bubbles from the lakes on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Lake Bubbles (Tall)"] = {
			Name = "Natural Vallis Lake Bubbles (Tall)",
			Image = "DecoNaturalVallisLakeBubbles(Tall).png",
			Description = "A tall clumping of naturally occuring bubbles from the lakes on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Double Cap Wide)"] = {
			Name = "Natural Vallis Land Mushroom (Double Cap Wide)",
			Image = "DecoNaturalVallisLandMushroom(DoubleCapWide).png",
			Description = "A very large low sitting set of mature mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Double Cap)"] = {
			Name = "Natural Vallis Land Mushroom (Double Cap)",
			Image = "DecoNaturalVallisLandMushroom(DoubleCap).png",
			Description = "A very large pair of twisted mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Large Cap)"] = {
			Name = "Natural Vallis Land Mushroom (Large Cap)",
			Image = "DecoNaturalVallisLandMushroom(LargeCap).png",
			Description = "A very large mushroom cap without the stem.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Single Cap)"] = {
			Name = "Natural Vallis Land Mushroom (Single Cap)",
			Image = "DecoNaturalVallisLandMushroom(SingleCap).png",
			Description = "A very large single cap mushroom growing on land on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Triple Cap)"] = {
			Name = "Natural Vallis Land Mushroom (Triple Cap)",
			Image = "DecoNaturalVallisLandMushroom(TripleCap).png",
			Description = "A very large set of three twisted mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Wide And Tall)"] = {
			Name = "Natural Vallis Land Mushroom (Wide And Tall)",
			Image = "DecoNaturalVallisLandMushroom(WideAndTall).png",
			Description = "A very large tall land mushroom with a wide cap and many stems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Wide)"] = {
			Name = "Natural Vallis Land Mushroom (Wide)",
			Image = "DecoNaturalVallisLandMushroom(Wide).png",
			Description = "A very large land mushroom with a wide cap and many stems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Young Bent)"] = {
			Name = "Natural Vallis Land Mushroom (Young Bent)",
			Image = "DecoNaturalVallisLandMushroom(YoungBent).png",
			Description = "A very large bent mushroom that grows on land on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Land Mushroom (Young)"] = {
			Name = "Natural Vallis Land Mushroom (Young)",
			Image = "DecoNaturalVallisLandMushroom(Young).png",
			Description = "A very large mushroom that grows on land on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Cluster)"] = {
			Name = "Natural Vallis Mushroom (Cluster)",
			Image = "DecoNaturalVallisMushroom(Cluster).png",
			Description = "A large mix of large and small mushroom clustered together.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Coolant Growth)"] = {
			Name = "Natural Vallis Mushroom (Coolant Growth)",
			Image = "DecoNaturalVallisMushroom(CoolantGrowth).png",
			Description = "A large fungus growing on a coolant mound.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Fallen Tentacle)"] = {
			Name = "Natural Vallis Mushroom (Fallen Tentacle)",
			Image = "DecoNaturalVallisMushroom(FallenTentacle).png",
			Description = "A mushroom feeder of tentacle that has fallen off the parent fungus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Group)"] = {
			Name = "Natural Vallis Mushroom (Group)",
			Image = "DecoNaturalVallisMushroom(Group).png",
			Description = "A group of small mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Large Roots)"] = {
			Name = "Natural Vallis Mushroom (Large Roots)",
			Image = "DecoNaturalVallisMushroom(LargeRoots).png",
			Description = "A large patch of roots from the Orb Vallis mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Mature)"] = {
			Name = "Natural Vallis Mushroom (Mature)",
			Image = "DecoNaturalVallisMushroom(Mature).png",
			Description = "A large mature mushroom.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Roots)"] = {
			Name = "Natural Vallis Mushroom (Roots)",
			Image = "DecoNaturalVallisMushroom(Roots).png",
			Description = "A patch of roots from the Orb Vallis mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Small Bunch)"] = {
			Name = "Natural Vallis Mushroom (Small Bunch)",
			Image = "DecoNaturalVallisMushroom(SmallBunch).png",
			Description = "A small cluster of mushrooms.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Small Group)"] = {
			Name = "Natural Vallis Mushroom (Small Group)",
			Image = "DecoNaturalVallisMushroom(SmallGroup).png",
			Description = "A small grouping of mushrooms with large heads and small stems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Stem Stack)"] = {
			Name = "Natural Vallis Mushroom (Stem Stack)",
			Image = "DecoNaturalVallisMushroom(StemStack).png",
			Description = "A very large stack of mature mushroom stems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Stemless)"] = {
			Name = "Natural Vallis Mushroom (Stemless)",
			Image = "DecoNaturalVallisMushroom(Stemless).png",
			Description = "A small group of mushrooms typically found on vertical surfaces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Tall Stemless)"] = {
			Name = "Natural Vallis Mushroom (Tall Stemless)",
			Image = "DecoNaturalVallisMushroom(TallStemless).png",
			Description = "A tall cluster of mushrooms typically found on vertical structures.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Tentacle)"] = {
			Name = "Natural Vallis Mushroom (Tentacle)",
			Image = "DecoNaturalVallisMushroom(Tentacle).png",
			Description = "A large set of mushroom feeder tentacles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Twisted Tentacle)"] = {
			Name = "Natural Vallis Mushroom (Twisted Tentacle)",
			Image = "DecoNaturalVallisMushroom(TwistedTentacle).png",
			Description = "A large group of mushroom tentacles that are twisted together.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Young Cluster)"] = {
			Name = "Natural Vallis Mushroom (Young Cluster)",
			Image = "DecoNaturalVallisMushroom(YoungCluster).png",
			Description = "A mix of small young mushrooms clustered together.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Mushroom (Young)"] = {
			Name = "Natural Vallis Mushroom (Young)",
			Image = "DecoNaturalVallisMushroom(Young).png",
			Description = "A mushroom early in its growth development.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orb"] = {
			Name = "Natural Vallis Orb",
			Image = "DecoNaturalVallisOrb.png",
			Description = "A large golden orb.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Curved Wall)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Curved Wall)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(CurvedWall).png",
			Description = "A large section of an ancient destroyed curved Orokin weeping post wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Large)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Large)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(Large).png",
			Description = "A large ancient Orokin structure destroyed over time.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Long Wall)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Long Wall)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(LongWall).png",
			Description = "A large section of a long ancient destroyed Orokin weeping post wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Small)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Small)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(Small).png",
			Description = "A small ancient Orokin structure destroyed over time.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Tall Wall)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Tall Wall)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(TallWall).png",
			Description = "A large section of a tall ancient destroyed Orokin weeping post wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Destroyed Weeping Post (Wall)"] = {
			Name = "Natural Vallis Orokin Destroyed Weeping Post (Wall)",
			Image = "DecoNaturalVallisOrokinDestroyedWeepingPost(Wall).png",
			Description = "A large section of an ancient destroyed Orokin weeping post wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Puffer (Plant)"] = {
			Name = "Natural Vallis Orokin Puffer (Plant)",
			Image = "DecoNaturalVallisOrokinPuffer(Plant).png",
			Description = "An Orokin puffer plant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Puffer (Pod)"] = {
			Name = "Natural Vallis Orokin Puffer (Pod)",
			Image = "DecoNaturalVallisOrokinPuffer(Pod).png",
			Description = "An Orokin puffer pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Puffer (Seed)"] = {
			Name = "Natural Vallis Orokin Puffer (Seed)",
			Image = "DecoNaturalVallisOrokinPuffer(Seed).png",
			Description = "An Orokin puffer seed pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Root"] = {
			Name = "Natural Vallis Orokin Root",
			Image = "DecoNaturalVallisOrokinRoot.png",
			Description = "A single small Orokin root.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Root (Large Stringers)"] = {
			Name = "Natural Vallis Orokin Root (Large Stringers)",
			Image = "DecoNaturalVallisOrokinRoot(LargeStringers).png",
			Description = "A large set of Orokin root stringers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Root (Skinny)"] = {
			Name = "Natural Vallis Orokin Root (Skinny)",
			Image = "DecoNaturalVallisOrokinRoot(Skinny).png",
			Description = "A single long and skinny Orokin root.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Root (Stringers)"] = {
			Name = "Natural Vallis Orokin Root (Stringers)",
			Image = "DecoNaturalVallisOrokinRoot(Stringers).png",
			Description = "A set of Orokin root stringers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Roots (Chutes)"] = {
			Name = "Natural Vallis Orokin Roots (Chutes)",
			Image = "DecoNaturalVallisOrokinRoots(Chutes).png",
			Description = "Orokin roots with small chutes jutting out.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Roots (Feeders)"] = {
			Name = "Natural Vallis Orokin Roots (Feeders)",
			Image = "DecoNaturalVallisOrokinRoots(Feeders).png",
			Description = "An offshoot of feeder roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Roots (Large Chutes)"] = {
			Name = "Natural Vallis Orokin Roots (Large Chutes)",
			Image = "DecoNaturalVallisOrokinRoots(LargeChutes).png",
			Description = "A large set of Orokin roots with large chutes jutting out.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Roots (Long Feeders)"] = {
			Name = "Natural Vallis Orokin Roots (Long Feeders)",
			Image = "DecoNaturalVallisOrokinRoots(LongFeeders).png",
			Description = "An offshoot of long feeder roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Orokin Roots (Twisted Feeders)"] = {
			Name = "Natural Vallis Orokin Roots (Twisted Feeders)",
			Image = "DecoNaturalVallisOrokinRoots(TwistedFeeders).png",
			Description = "An offshoot of twisted feeder roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Puddle Of Frozen Fluid"] = {
			Name = "Natural Vallis Puddle Of Frozen Fluid",
			Image = "DecoNaturalVallisPuddleOfFrozenFluid.png",
			Description = "A frozen puddle of the fluid from the lakes of Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Puddles Of Frozen Fluid"] = {
			Name = "Natural Vallis Puddles Of Frozen Fluid",
			Image = "DecoNaturalVallisPuddlesOfFrozenFluid.png",
			Description = "A collection of frozen puddles of fluid from the lakes of Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Rock Fissure"] = {
			Name = "Natural Vallis Rock Fissure",
			Image = "DecoNaturalVallisRockFissure.png",
			Description = "A very large group of rocks that form a fissure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Seed Pod"] = {
			Name = "Natural Vallis Seed Pod",
			Image = "DecoNaturalVallisSeedPod.png",
			Description = "A small seed pod from Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Seed Pod (Germinated)"] = {
			Name = "Natural Vallis Seed Pod (Germinated)",
			Image = "DecoNaturalVallisSeedPod(Germinated).png",
			Description = "A small germinated seed pod from Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Stalactite (Cluster)"] = {
			Name = "Natural Vallis Stalactite (Cluster)",
			Image = "DecoNaturalVallisStalactite(Cluster).png",
			Description = "A cluster of small stalactites.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Stalagmite"] = {
			Name = "Natural Vallis Stalagmite",
			Image = "DecoNaturalVallisStalagmite.png",
			Description = "A large stalagmite formation found in the caves on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Stalagmite (Base)"] = {
			Name = "Natural Vallis Stalagmite (Base)",
			Image = "DecoNaturalVallisStalagmite(Base).png",
			Description = "The beginning of a large stalagmite formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Stalagmite (Cluster)"] = {
			Name = "Natural Vallis Stalagmite (Cluster)",
			Image = "DecoNaturalVallisStalagmite(Cluster).png",
			Description = "A large stalagmite formation found in the caves on Orb vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Stalagmite (Large Pillar)"] = {
			Name = "Natural Vallis Stalagmite (Large Pillar)",
			Image = "DecoNaturalVallisStalagmite(LargePillar).png",
			Description = "A very large stalagmite that formed a long pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Tree"] = {
			Name = "Natural Vallis Tree",
			Image = "DecoNaturalVallisTree.png",
			Description = "A tree that grows on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Tree (Tall)"] = {
			Name = "Natural Vallis Tree (Tall)",
			Image = "DecoNaturalVallisTree(Tall).png",
			Description = "A tall tree that grows on Orb Vallis.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Natural Vallis Tree (Young)"] = {
			Name = "Natural Vallis Tree (Young)",
			Image = "DecoNaturalVallisTree(Young).png",
			Description = "A young Orb Vallis tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Obsidian Rock"] = {
			Name = "Obsidian Rock",
			Image = "DecoObsidianRock.png",
			Description = "A large rock made of obsidian.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Obsidian Rock Pillar"] = {
			Name = "Obsidian Rock Pillar",
			Image = "DecoObsidianRockPillar.png",
			Description = "A large rock made of obsidian in the shape of a pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Obsidian Rock Square"] = {
			Name = "Obsidian Rock Square",
			Image = "DecoObsidianRockSquare.png",
			Description = "A large rock made of obsidian in a square shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Obsidian Rock Triangle"] = {
			Name = "Obsidian Rock Triangle",
			Image = "DecoObsidianRockTriangle.png",
			Description = "A large rock made of obsidian in a triangle shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Peca Nuts"] = {
			Name = "Peca Nuts",
			Image = "DecoPecaNuts.png",
			Description = "The nuts in this pod are crucial in the process of making daku liquor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Peca Nuts Basket (Large)"] = {
			Name = "Peca Nuts Basket (Large)",
			Image = "DecoPecaNutsBasket(Large).png",
			Description = "A bountiful harvest of peca nuts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Peca Nuts Basket (Small)"] = {
			Name = "Peca Nuts Basket (Small)",
			Image = "DecoPecaNutsBasket(Small).png",
			Description = "A harvest of peca nuts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Peca Nuts On The Vine"] = {
			Name = "Peca Nuts On The Vine",
			Image = "DecoPecaNutsOnTheVine.png",
			Description = "The nuts in these pods are crucial in the process of making daku liquor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Rho Plant"] = {
			Name = "Rho Plant",
			Image = "DecoRhoPlant.png",
			Description = "An experimental plant developed in the Corpus labs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Rock (Rounded Layered)"] = {
			Name = "Rock (Rounded Layered)",
			Image = "DecoRock(RoundedLayered).png",
			Description = "A large rounded layered rock formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rock (Small Slab)"] = {
			Name = "Rock (Small Slab)",
			Image = "DecoRock(SmallSlab).png",
			Description = "A small slab of rock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rock (Square Layered)"] = {
			Name = "Rock (Square Layered)",
			Image = "DecoRock(SquareLayered).png",
			Description = "A large squared layered rock formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Rock (Wedge)"] = {
			Name = "Rock (Wedge)",
			Image = "DecoRock(Wedge).png",
			Description = "A small wedge shaped rock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Rock Boulder"] = {
			Name = "Rock Boulder",
			Image = "DecoRockBoulder.png",
			Description = "A rock boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rock Boulder (Large)"] = {
			Name = "Rock Boulder (Large)",
			Image = "DecoRockBoulder(Large).png",
			Description = "A large rock boulder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rock Wall"] = {
			Name = "Rock Wall",
			Image = "DecoRockWall.png",
			Description = "A large rock wall formation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Root (Curved)"] = {
			Name = "Root (Curved)",
			Image = "DecoRoot(Curved).png",
			Description = "A large curved root.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Root (Long)"] = {
			Name = "Root (Long)",
			Image = "DecoRoot(Long).png",
			Description = "A large long root.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Root (S-Curved)"] = {
			Name = "Root (S-Curved)",
			Image = "DecoRoot(S-Curved).png",
			Description = "A large root curved in a \"S\" shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Roots (Cage Bulb)"] = {
			Name = "Roots (Cage Bulb)",
			Image = "DecoRoots(CageBulb).png",
			Description = "A large cage growth of roots in the shape of a bulb.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Roots (Cage)"] = {
			Name = "Roots (Cage)",
			Image = "DecoRoots(Cage).png",
			Description = "A group of roots that formed a cage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Roots (Climbing)"] = {
			Name = "Roots (Climbing)",
			Image = "DecoRoots(Climbing).png",
			Description = "A group of climbing roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Roots (Rounded)"] = {
			Name = "Roots (Rounded)",
			Image = "DecoRoots(Rounded).png",
			Description = "A set of roots that formed a round shape.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Roots (Tree Formation)"] = {
			Name = "Roots (Tree Formation)",
			Image = "DecoRoots(TreeFormation).png",
			Description = "A growth of roots that look like a tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Roots (Wall)"] = {
			Name = "Roots (Wall)",
			Image = "DecoRoots(Wall).png",
			Description = "A large wall formed by roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Rubad Fruit"] = {
			Name = "Rubad Fruit",
			Image = "DecoRubadFruit.png",
			Description = "A tangy fruit enjoyed by Ostrons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Rubad Fruit Basket (Large)"] = {
			Name = "Rubad Fruit Basket (Large)",
			Image = "DecoRubadFruitBasket(Large).png",
			Description = "A bountiful harvest of rubad fruits.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Rubad Fruit Basket (Medium)"] = {
			Name = "Rubad Fruit Basket (Medium)",
			Image = "DecoRubadFruitBasket(Medium).png",
			Description = "A harvest of rubad fruits.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ruk's Claw (Mature)"] = {
			Name = "Ruk's Claw (Mature)",
			Image = "DecoRuk'sClaw(Mature).png",
			Description = "A fern like plant found in Grineer Settlements on Mars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Orokin Cell" }
				}
			}
		},
		["Spinklat Plant"] = {
			Name = "Spinklat Plant",
			Image = "DecoSpinklatPlant.png",
			Description = "A large underwater plant found in the oceans of Uranus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tree (Small)"] = {
			Name = "Tree (Small)",
			Image = "DecoTree(Small).png",
			Description = "A small tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tree Branch (Large)"] = {
			Name = "Tree Branch (Large)",
			Image = "DecoTreeBranch(Large).png",
			Description = "A large tree branch.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Tree Stump Roots"] = {
			Name = "Tree Stump Roots",
			Image = "DecoTreeStumpRoots.png",
			Description = "A tree stump elevated by roots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Trinbula Plant"] = {
			Name = "Trinbula Plant",
			Image = "DecoTrinbulaPlant.png",
			Description = "A large underwater plant found off the coast of the Eidolon plains.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Typhina Plant"] = {
			Name = "Typhina Plant",
			Image = "DecoTyphinaPlant.png",
			Description = "A plant found in the forests of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Typhina Plant (Patch)"] = {
			Name = "Typhina Plant (Patch)",
			Image = "DecoTyphinaPlant(Patch).png",
			Description = "A patch of Typhina plants.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Venusian Boulder"] = {
			Name = "Venusian Boulder",
			Image = "DecoVenusianBoulder.png",
			Description = "A boulder from the surface of Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Venusian Boulder (Small)"] = {
			Name = "Venusian Boulder (Small)",
			Image = "DecoVenusianBoulder(Small).png",
			Description = "A small boulder from the surface of Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Venusian Rock (Layered Formation)"] = {
			Name = "Venusian Rock (Layered Formation)",
			Image = "DecoVenusianRock(LayeredFormation).png",
			Description = "A large layered rock formation from Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Venusian Rock Arch"] = {
			Name = "Venusian Rock Arch",
			Image = "DecoVenusianRockArch.png",
			Description = "A very large rock arch formation from the surface of Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Venusian Rock Wall"] = {
			Name = "Venusian Rock Wall",
			Image = "DecoVenusianRockWall.png",
			Description = "A very large rock wall from the surface of Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Venusian Rock Wall (Curved)"] = {
			Name = "Venusian Rock Wall (Curved)",
			Image = "DecoVenusianRockWall(Curved).png",
			Description = "A large curved rock formation from the surface of Venus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Waterfall (Gentle)"] = {
			Name = "Waterfall (Gentle)",
			Image = "DecoWaterfall(Gentle).png",
			Description = "A gentle flow of water.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Polymer Bundle" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Xanthophyl"] = {
			Name = "Xanthophyl",
			Image = "DecoXanthophyl.png",
			Description = "A unique plant found in the forests of Earth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Zen Pitcher Plant"] = {
			Name = "Zen Pitcher Plant",
			Image = "DecoZenPitcherPlant.png",
			Description = "A plant used to aid in meditation.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		}
	},
	Obstacle = {
			["Boundary Trap Rectangle"] = {
			Name = "Boundary Trap Rectangle",
			Image = "DecoBoundaryTrapRectangle.png",
			Description = "BOUNDARY TRAP RECTANGLE",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Boundary Trap Square"] = {
			Name = "Boundary Trap Square",
			Image = "DecoBoundaryTrapSquare.png",
			Description = "BOUNDARY TRAP SQUARE",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Checkpoint Gate"] = {
			Name = "Checkpoint Gate",
			Image = "DecoCheckpointGate.png",
			Description = "",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Cube"] = {
			Name = "Cube",
			Image = "DecoCube.png",
			Description = "A cube obstacle.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Cylinder"] = {
			Name = "Cylinder",
			Image = "DecoCylinder.png",
			Description = "A cylinder obstacle.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["End Gate"] = {
			Name = "End Gate",
			Image = "DecoEndGate.png",
			Description = "Marks the end of the course. Every course must have one.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Fire Trap"] = {
			Name = "Fire Trap",
			Image = "DecoFireTrap.png",
			Description = "A smouldering patch of ground that will set all who touch it ablaze.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Floor Tile (Large)"] = {
			Name = "Floor Tile (Large)",
			Image = "DecoFloorTile(Large).png",
			Description = "A larger floor tile.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Floor Tile (Small)"] = {
			Name = "Floor Tile (Small)",
			Image = "DecoFloorTile(Small).png",
			Description = "A floor tile.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Kill Trap"] = {
			Name = "Kill Trap",
			Image = "DecoKillTrap.png",
			Description = "Instantly knocks-out a challenger on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Laser Trap"] = {
			Name = "Laser Trap",
			Image = "DecoLaserTrap.png",
			Description = "Contacting this laser instantly knocks-out the challenger and ends the run.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Navigation Arrow"] = {
			Name = "Navigation Arrow",
			Image = "DecoNavigationArrow.png",
			Description = "Help Tenno navigate a course with this arrow.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Start Gate"] = {
			Name = "Start Gate",
			Image = "DecoStartGate.png",
			Description = "Passing through this gate starts the timer. Every course needs a Start Gate.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Target Dummy"] = {
			Name = "Target Dummy",
			Image = "DecoTargetDummy.png",
			Description = "A dummy enemy that must be destroyed to complete the course.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Vanishing Cube"] = {
			Name = "Vanishing Cube",
			Image = "DecoVanishingCube.png",
			Description = "This cube vanishes on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Vanishing Cylinder"] = {
			Name = "Vanishing Cylinder",
			Image = "DecoVanishingCylinder.png",
			Description = "This cylinder vanishes on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Vanishing Floor Tile"] = {
			Name = "Vanishing Floor Tile",
			Image = "DecoVanishingFloorTile.png",
			Description = "This floor tile vanishes on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Vanishing Floor Tile (Large)"] = {
			Name = "Vanishing Floor Tile (Large)",
			Image = "DecoVanishingFloorTile(Large).png",
			Description = "A larger floor tile that vanishes on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Vanishing Wedge"] = {
			Name = "Vanishing Wedge",
			Image = "DecoVanishingWedge.png",
			Description = "This wedge vanishes on contact.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
		["Wedge"] = {
			Name = "Wedge",
			Image = "DecoWedge.png",
			Description = "A wedge shaped platform.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 0,
				Resources = {
					{ Count = 0, Name = "Alloy Plate" }
				}
			}
		},
	},
	Orokin = {
		["Balcony"] = {
			Name = "Balcony",
			Image = "DecoBalcony.png",
			Description = "A balcony gate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Balcony (Damaged)"] = {
			Name = "Balcony (Damaged)",
			Image = "DecoBalcony(Damaged).png",
			Description = "A damaged balcony gate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Balloon Dock Pillar"] = {
			Name = "Balloon Dock Pillar",
			Image = "DecoBalloonDockPillar.png",
			Description = "A large pillar used to help tether harvesting balloons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Balloon Dock Platform"] = {
			Name = "Balloon Dock Platform",
			Image = "DecoBalloonDockPlatform.png",
			Description = "A platform used to dock harvesting balloon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Balloon Dock Tarp Support Structure"] = {
			Name = "Balloon Dock Tarp Support Structure",
			Image = "DecoBalloonDockTarpSupportStructure.png",
			Description = "A large support structure that holds tarps.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber (Flat)"] = {
			Name = "Blubber (Flat)",
			Image = "DecoBlubber(Flat).png",
			Description = "A large round flat piece of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Blubber (Large)"] = {
			Name = "Blubber (Large)",
			Image = "DecoBlubber(Large).png",
			Description = "A large piece of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber (Medium)"] = {
			Name = "Blubber (Medium)",
			Image = "DecoBlubber(Medium).png",
			Description = "A medium piece of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber (Small)"] = {
			Name = "Blubber (Small)",
			Image = "DecoBlubber(Small).png",
			Description = "A small piece of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber Column (Large)"] = {
			Name = "Blubber Column (Large)",
			Image = "DecoBlubberColumn(Large).png",
			Description = "A very large column of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber Column (Medium)"] = {
			Name = "Blubber Column (Medium)",
			Image = "DecoBlubberColumn(Medium).png",
			Description = "A medium sized column of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber Column (Small)"] = {
			Name = "Blubber Column (Small)",
			Image = "DecoBlubberColumn(Small).png",
			Description = "A small column of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Blubber Wall (16x16m)"] = {
			Name = "Blubber Wall (16x16m)",
			Image = "DecoBlubberWall(16x16m).png",
			Description = "A wall of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Blubber Wall (24x48m)"] = {
			Name = "Blubber Wall (24x48m)",
			Image = "DecoBlubberWall(24x48m).png",
			Description = "A wall of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Blubber Wall (Curved, 16x16m)"] = {
			Name = "Blubber Wall (Curved, 16x16m)",
			Image = "DecoBlubberWall(Curved,16x16m).png",
			Description = "A curved wall of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Blubber Wall (Curved, 4x16m)"] = {
			Name = "Blubber Wall (Curved, 4x16m)",
			Image = "DecoBlubberWall(Curved,4x16m).png",
			Description = "A curved wall of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Blubber Wall (With Holes)"] = {
			Name = "Blubber Wall (With Holes)",
			Image = "DecoBlubberWall(WithHoles).png",
			Description = "A wall of blubber with holes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ceiling Support"] = {
			Name = "Ceiling Support",
			Image = "DecoCeilingSupport.png",
			Description = "A support to connect the pillars to the ceilings.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ceiling Support (Damaged)"] = {
			Name = "Ceiling Support (Damaged)",
			Image = "DecoCeilingSupport(Damaged).png",
			Description = "A damaged ceiling support.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Column (Broken, Bottom)"] = {
			Name = "Column (Broken, Bottom)",
			Image = "DecoColumn(Broken,Bottom).png",
			Description = "A large broken Orokin column bottom.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Column (Broken, Top)"] = {
			Name = "Column (Broken, Top)",
			Image = "DecoColumn(Broken,Top).png",
			Description = "A large broken Orokin column top.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Column (Full)"] = {
			Name = "Column (Full)",
			Image = "DecoColumn(Full).png",
			Description = "A large complete Orokin tower column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Curved Wall (Damaged, Left Hand)"] = {
			Name = "Curved Wall (Damaged, Left Hand)",
			Image = "DecoCurvedWall(Damaged,LeftHand).png",
			Description = "A section of curved Orokin wall, more damaged on the left hand side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Curved Wall (Damaged, Right Hand)"] = {
			Name = "Curved Wall (Damaged, Right Hand)",
			Image = "DecoCurvedWall(Damaged,RightHand).png",
			Description = "A section of curved Orokin wall, more damaged on the right hand side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Curved Wall (Damaged, Small)"] = {
			Name = "Curved Wall (Damaged, Small)",
			Image = "DecoCurvedWall(Damaged,Small).png",
			Description = "A small section of damaged curved Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Door Frame"] = {
			Name = "Door Frame",
			Image = "DecoDoorFrame.png",
			Description = "An Orokin tower door frame.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Door Frame (Large)"] = {
			Name = "Door Frame (Large)",
			Image = "DecoDoorFrame(Large).png",
			Description = "A large Orokin tower door frame.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Door Frame (Wide)"] = {
			Name = "Door Frame (Wide)",
			Image = "DecoDoorFrame(Wide).png",
			Description = "A wide Orokin tower door frame.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Elevated Platform"] = {
			Name = "Elevated Platform",
			Image = "DecoElevatedPlatform.png",
			Description = "An elevated platform used in the Orokin tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Energy Barrier (Rectangle)"] = {
			Name = "Energy Barrier (Rectangle)",
			Image = "DecoEnergyBarrier(Rectangle).png",
			Description = "A rectangular energy barrier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Energy Barrier (Round)"] = {
			Name = "Energy Barrier (Round)",
			Image = "DecoEnergyBarrier(Round).png",
			Description = "A circular energy barrier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Bracket (Embossed)"] = {
			Name = "Entrati Lab Bracket (Embossed)",
			Image = "DecoEntratiLabBracket(Embossed).png",
			Description = "An embossed scaffold bracket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Bracket (Narrow)"] = {
			Name = "Entrati Lab Bracket (Narrow)",
			Image = "DecoEntratiLabBracket(Narrow).png",
			Description = "A narrow scaffold bracket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Bracket (Plated)"] = {
			Name = "Entrati Lab Bracket (Plated)",
			Image = "DecoEntratiLabBracket(Plated).png",
			Description = "A plated scaffold bracket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Bracket (Simple)"] = {
			Name = "Entrati Lab Bracket (Simple)",
			Image = "DecoEntratiLabBracket(Simple).png",
			Description = "A simple scaffold bracket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Ceiling Medallion"] = {
			Name = "Entrati Lab Ceiling Medallion",
			Image = "DecoEntratiLabCeilingMedallion.png",
			Description = "A medallion used to decorate ceilings in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Ceiling Tile"] = {
			Name = "Entrati Lab Ceiling Tile",
			Image = "DecoEntratiLabCeilingTile.png",
			Description = "A tile used to decorate ceilings in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Column (Dark)"] = {
			Name = "Entrati Lab Column (Dark)",
			Image = "DecoEntratiLabColumn(Dark).png",
			Description = "A dark column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Column (Decorative)"] = {
			Name = "Entrati Lab Column (Decorative)",
			Image = "DecoEntratiLabColumn(Decorative).png",
			Description = "A decorative column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Column (Middle)"] = {
			Name = "Entrati Lab Column (Middle)",
			Image = "DecoEntratiLabColumn(Middle).png",
			Description = "The middle section of a column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Column (Short)"] = {
			Name = "Entrati Lab Column (Short)",
			Image = "DecoEntratiLabColumn(Short).png",
			Description = "A short column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Column (Simple)"] = {
			Name = "Entrati Lab Column (Simple)",
			Image = "DecoEntratiLabColumn(Simple).png",
			Description = "A simple coulm used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Column (Top)"] = {
			Name = "Entrati Lab Column (Top)",
			Image = "DecoEntratiLabColumn(Top).png",
			Description = "The top section of a column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Column Base (Decorative)"] = {
			Name = "Entrati Lab Column Base (Decorative)",
			Image = "DecoEntratiLabColumnBase(Decorative).png",
			Description = "The base of a column used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Device (Base)"] = {
			Name = "Entrati Lab Device (Base)",
			Image = "DecoEntratiLabDevice(Base).png",
			Description = "A base for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Device (Charger)"] = {
			Name = "Entrati Lab Device (Charger)",
			Image = "DecoEntratiLabDevice(Charger).png",
			Description = "A charger for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Device (Cog)"] = {
			Name = "Entrati Lab Device (Cog)",
			Image = "DecoEntratiLabDevice(Cog).png",
			Description = "A cog for advanced experiements in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Device (Component)"] = {
			Name = "Entrati Lab Device (Component)",
			Image = "DecoEntratiLabDevice(Component).png",
			Description = "A component for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Device (Conduit)"] = {
			Name = "Entrati Lab Device (Conduit)",
			Image = "DecoEntratiLabDevice(Conduit).png",
			Description = "A conduit for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Device (Ionizer)"] = {
			Name = "Entrati Lab Device (Ionizer)",
			Image = "DecoEntratiLabDevice(Ionizer).png",
			Description = "An ionizer for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Device (Irradiator)"] = {
			Name = "Entrati Lab Device (Irradiator)",
			Image = "DecoEntratiLabDevice(Irradiator).png",
			Description = "An irradiator for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Device (Orb, Full)"] = {
			Name = "Entrati Lab Device (Orb, Full)",
			Image = "DecoEntratiLabDevice(Orb,Full).png",
			Description = "A full orb for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Device (Orb, Half)"] = {
			Name = "Entrati Lab Device (Orb, Half)",
			Image = "DecoEntratiLabDevice(Orb,Half).png",
			Description = "Half an orb for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Device (Orb, Hollow)"] = {
			Name = "Entrati Lab Device (Orb, Hollow)",
			Image = "DecoEntratiLabDevice(Orb,Hollow).png",
			Description = "A hollow orb for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Device (Platform)"] = {
			Name = "Entrati Lab Device (Platform)",
			Image = "DecoEntratiLabDevice(Platform).png",
			Description = "A platform for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Device (Polarizer)"] = {
			Name = "Entrati Lab Device (Polarizer)",
			Image = "DecoEntratiLabDevice(Polarizer).png",
			Description = "A polarizer for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Device (Support)"] = {
			Name = "Entrati Lab Device (Support)",
			Image = "DecoEntratiLabDevice(Support).png",
			Description = "A support pole for advanced experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Device (Veins)"] = {
			Name = "Entrati Lab Device (Veins)",
			Image = "DecoEntratiLabDevice(Veins).png",
			Description = "Veins for adcanved experiments in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Door Frame"] = {
			Name = "Entrati Lab Door Frame",
			Image = "DecoEntratiLabDoorFrame.png",
			Description = "A door frame used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Gold Trim (16m Curved Inward)"] = {
			Name = "Entrati Lab Gold Trim (16m Curved Inward)",
			Image = "DecoEntratiLabGoldTrim(16mCurvedInward).png",
			Description = "A 16m length of gold trim that bends inward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Gold Trim (16m Curved Outward)"] = {
			Name = "Entrati Lab Gold Trim (16m Curved Outward)",
			Image = "DecoEntratiLabGoldTrim(16mCurvedOutward).png",
			Description = "A 16m length of gold trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim (16m)"] = {
			Name = "Entrati Lab Gold Trim (16m)",
			Image = "DecoEntratiLabGoldTrim(16m).png",
			Description = "A 16m length of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Gold Trim (2m Curved Inward)"] = {
			Name = "Entrati Lab Gold Trim (2m Curved Inward)",
			Image = "DecoEntratiLabGoldTrim(2mCurvedInward).png",
			Description = "A 2m length of gold trim that bends inward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim (2m Curved Outward)"] = {
			Name = "Entrati Lab Gold Trim (2m Curved Outward)",
			Image = "DecoEntratiLabGoldTrim(2mCurvedOutward).png",
			Description = "A 2m length of gold trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Gold Trim (2m)"] = {
			Name = "Entrati Lab Gold Trim (2m)",
			Image = "DecoEntratiLabGoldTrim(2m).png",
			Description = "A 2m length of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim (4m Curved Inward)"] = {
			Name = "Entrati Lab Gold Trim (4m Curved Inward)",
			Image = "DecoEntratiLabGoldTrim(4mCurvedInward).png",
			Description = "A 4m length of gold trim that bends inward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim (4m Curved Outward)"] = {
			Name = "Entrati Lab Gold Trim (4m Curved Outward)",
			Image = "DecoEntratiLabGoldTrim(4mCurvedOutward).png",
			Description = "A 4m length of gold trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Gold Trim (4m)"] = {
			Name = "Entrati Lab Gold Trim (4m)",
			Image = "DecoEntratiLabGoldTrim(4m).png",
			Description = "A 4m length of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Gold Trim (8m Curved Inward)"] = {
			Name = "Entrati Lab Gold Trim (8m Curved Inward)",
			Image = "DecoEntratiLabGoldTrim(8mCurvedInward).png",
			Description = "A 8m length of gold trim that bends inward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Gold Trim (8m Curved Outward)"] = {
			Name = "Entrati Lab Gold Trim (8m Curved Outward)",
			Image = "DecoEntratiLabGoldTrim(8mCurvedOutward).png",
			Description = "A 8m length of gold trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim (8m)"] = {
			Name = "Entrati Lab Gold Trim (8m)",
			Image = "DecoEntratiLabGoldTrim(8m).png",
			Description = "A 8m length of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Gold Trim (Curved Outward)"] = {
			Name = "Entrati Lab Gold Trim (Curved Outward)",
			Image = "DecoEntratiLabGoldTrim(CurvedOutward).png",
			Description = "A length of gold trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim Arc (Semicircle)"] = {
			Name = "Entrati Lab Gold Trim Arc (Semicircle)",
			Image = "DecoEntratiLabGoldTrimArc(Semicircle).png",
			Description = "A smooth semicircle of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim Corner (Sharp)"] = {
			Name = "Entrati Lab Gold Trim Corner (Sharp)",
			Image = "DecoEntratiLabGoldTrimCorner(Sharp).png",
			Description = "A sharp corner section of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Gold Trim Corner (Smooth)"] = {
			Name = "Entrati Lab Gold Trim Corner (Smooth)",
			Image = "DecoEntratiLabGoldTrimCorner(Smooth).png",
			Description = "A smooth corner section of gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Gold Trim Endcap (Left)"] = {
			Name = "Entrati Lab Gold Trim Endcap (Left)",
			Image = "DecoEntratiLabGoldTrimEndcap(Left).png",
			Description = "A left end cap for gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Gold Trim Endcap (Right)"] = {
			Name = "Entrati Lab Gold Trim Endcap (Right)",
			Image = "DecoEntratiLabGoldTrimEndcap(Right).png",
			Description = "A right end cap for gold trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Lift Base"] = {
			Name = "Entrati Lab Lift Base",
			Image = "DecoEntratiLabLiftBase.png",
			Description = "The base of a lifting device used in in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Lift Car"] = {
			Name = "Entrati Lab Lift Car",
			Image = "DecoEntratiLabLiftCar.png",
			Description = "A lifting device used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Pipe (1m Curved)"] = {
			Name = "Entrati Lab Pipe (1m Curved)",
			Image = "DecoEntratiLabPipe(1mCurved).png",
			Description = "A 1m curved length of pipe used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Pipe (1m)"] = {
			Name = "Entrati Lab Pipe (1m)",
			Image = "DecoEntratiLabPipe(1m).png",
			Description = "A 1m length of pipe used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Pipe (2m Curved)"] = {
			Name = "Entrati Lab Pipe (2m Curved)",
			Image = "DecoEntratiLabPipe(2mCurved).png",
			Description = "A 2m curved length of pipe used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Pipe (4m)"] = {
			Name = "Entrati Lab Pipe (4m)",
			Image = "DecoEntratiLabPipe(4m).png",
			Description = "A 4m length of pipe used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Pipe (8m)"] = {
			Name = "Entrati Lab Pipe (8m)",
			Image = "DecoEntratiLabPipe(8m).png",
			Description = "An 8m length of pipe used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Pipe Cap (Circle)"] = {
			Name = "Entrati Lab Pipe Cap (Circle)",
			Image = "DecoEntratiLabPipeCap(Circle).png",
			Description = "A cap with a circular shape used to close off pipes in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Pipe Cap (Crux)"] = {
			Name = "Entrati Lab Pipe Cap (Crux)",
			Image = "DecoEntratiLabPipeCap(Crux).png",
			Description = "A cap with a crux-inspired shape used to close off pipes in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Pipe Cluster"] = {
			Name = "Entrati Lab Pipe Cluster",
			Image = "DecoEntratiLabPipeCluster.png",
			Description = "A cluster of pipes used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Pipe Coupler (Dual)"] = {
			Name = "Entrati Lab Pipe Coupler (Dual)",
			Image = "DecoEntratiLabPipeCoupler(Dual).png",
			Description = "A dual pipe coupler used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Pipe Coupler (Tri)"] = {
			Name = "Entrati Lab Pipe Coupler (Tri)",
			Image = "DecoEntratiLabPipeCoupler(Tri).png",
			Description = "A tri pipe coupler used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Pipe Frame"] = {
			Name = "Entrati Lab Pipe Frame",
			Image = "DecoEntratiLabPipeFrame.png",
			Description = "A frame for securing pipes in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Ruins Archway"] = {
			Name = "Entrati Lab Ruins Archway",
			Image = "DecoEntratiLabRuinsArchway.png",
			Description = "A ruined archway from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Ruins Column (Full)"] = {
			Name = "Entrati Lab Ruins Column (Full)",
			Image = "DecoEntratiLabRuinsColumn(Full).png",
			Description = "A ruined column from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Ruins Column (Half)"] = {
			Name = "Entrati Lab Ruins Column (Half)",
			Image = "DecoEntratiLabRuinsColumn(Half).png",
			Description = "Half a ruined column from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Ruins Floor (Circle Decal)"] = {
			Name = "Entrati Lab Ruins Floor (Circle Decal)",
			Image = "DecoEntratiLabRuinsFloor(CircleDecal).png",
			Description = "A ruined floor with a circular gold decal from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Ruins Floor (Crux Decal)"] = {
			Name = "Entrati Lab Ruins Floor (Crux Decal)",
			Image = "DecoEntratiLabRuinsFloor(CruxDecal).png",
			Description = "A ruined floor with a crux-inspired gold decal from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Ruins Rubble (Clustered)"] = {
			Name = "Entrati Lab Ruins Rubble (Clustered)",
			Image = "DecoEntratiLabRuinsRubble(Clustered).png",
			Description = "A clustered pile of rubble from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Ruins Rubble (Dispersed)"] = {
			Name = "Entrati Lab Ruins Rubble (Dispersed)",
			Image = "DecoEntratiLabRuinsRubble(Dispersed).png",
			Description = "A dispersed pile of rubble from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Ruins Rubble (Scattered)"] = {
			Name = "Entrati Lab Ruins Rubble (Scattered)",
			Image = "DecoEntratiLabRuinsRubble(Scattered).png",
			Description = "A scattered pile of rubble from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Ruins Rubble (Toppled)"] = {
			Name = "Entrati Lab Ruins Rubble (Toppled)",
			Image = "DecoEntratiLabRuinsRubble(Toppled).png",
			Description = "A toppled pile of rubble from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Ruins Stair Set"] = {
			Name = "Entrati Lab Ruins Stair Set",
			Image = "DecoEntratiLabRuinsStairSet.png",
			Description = "A ruined set of stairs from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Ruins Wall (Cracked)"] = {
			Name = "Entrati Lab Ruins Wall (Cracked)",
			Image = "DecoEntratiLabRuinsWall(Cracked).png",
			Description = "A ruined wall from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Ruins Wall (Fragment)"] = {
			Name = "Entrati Lab Ruins Wall (Fragment)",
			Image = "DecoEntratiLabRuinsWall(Fragment).png",
			Description = "A fragment of a ruined wall from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Ruins Window (Cracked)"] = {
			Name = "Entrati Lab Ruins Window (Cracked)",
			Image = "DecoEntratiLabRuinsWindow(Cracked).png",
			Description = "A ruined window from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Ruins Window (Fragment)"] = {
			Name = "Entrati Lab Ruins Window (Fragment)",
			Image = "DecoEntratiLabRuinsWindow(Fragment).png",
			Description = "A fragment of a ruined window from Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Scaffold (Decorative)"] = {
			Name = "Entrati Lab Scaffold (Decorative)",
			Image = "DecoEntratiLabScaffold(Decorative).png",
			Description = "Decorative scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Scaffold (Elegant)"] = {
			Name = "Entrati Lab Scaffold (Elegant)",
			Image = "DecoEntratiLabScaffold(Elegant).png",
			Description = "Elegant scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Scaffold (Embossed)"] = {
			Name = "Entrati Lab Scaffold (Embossed)",
			Image = "DecoEntratiLabScaffold(Embossed).png",
			Description = "Embossed scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Scaffold (Jagged)"] = {
			Name = "Entrati Lab Scaffold (Jagged)",
			Image = "DecoEntratiLabScaffold(Jagged).png",
			Description = "Jagged scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Scaffold (Simple)"] = {
			Name = "Entrati Lab Scaffold (Simple)",
			Image = "DecoEntratiLabScaffold(Simple).png",
			Description = "Simple scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Scaffold (Spiked)"] = {
			Name = "Entrati Lab Scaffold (Spiked)",
			Image = "DecoEntratiLabScaffold(Spiked).png",
			Description = "Spiked scaffolding used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Shelf (16m Curved)"] = {
			Name = "Entrati Lab Shelf (16m Curved)",
			Image = "DecoEntratiLabShelf(16mCurved).png",
			Description = "A 16m long curved shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Shelf (4m Medium)"] = {
			Name = "Entrati Lab Shelf (4m Medium)",
			Image = "DecoEntratiLabShelf(4mMedium).png",
			Description = "A medium 4m shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Shelf (4m Short)"] = {
			Name = "Entrati Lab Shelf (4m Short)",
			Image = "DecoEntratiLabShelf(4mShort).png",
			Description = "A short 4m shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Shelf (4m Tall)"] = {
			Name = "Entrati Lab Shelf (4m Tall)",
			Image = "DecoEntratiLabShelf(4mTall).png",
			Description = "A tall 4m shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Entrati Lab Shelf (8m Curved)"] = {
			Name = "Entrati Lab Shelf (8m Curved)",
			Image = "DecoEntratiLabShelf(8mCurved).png",
			Description = "An 8m long curved shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Shelf (8m Tall)"] = {
			Name = "Entrati Lab Shelf (8m Tall)",
			Image = "DecoEntratiLabShelf(8mTall).png",
			Description = "A tall 8m shelf used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Stone Trim (16m Curved Outward)"] = {
			Name = "Entrati Lab Stone Trim (16m Curved Outward)",
			Image = "DecoEntratiLabStoneTrim(16mCurvedOutward).png",
			Description = "A 16m length of stone trim that bends outward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Stone Trim (4m)"] = {
			Name = "Entrati Lab Stone Trim (4m)",
			Image = "DecoEntratiLabStoneTrim(4m).png",
			Description = "A 4m length of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Stone Trim (6m)"] = {
			Name = "Entrati Lab Stone Trim (6m)",
			Image = "DecoEntratiLabStoneTrim(6m).png",
			Description = "A 6m length of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Stone Trim (8m Curved Inward)"] = {
			Name = "Entrati Lab Stone Trim (8m Curved Inward)",
			Image = "DecoEntratiLabStoneTrim(8mCurvedInward).png",
			Description = "An 8m length of stone trim that bends inward used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Entrati Lab Stone Trim (8m)"] = {
			Name = "Entrati Lab Stone Trim (8m)",
			Image = "DecoEntratiLabStoneTrim(8m).png",
			Description = "An 8m length of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Entrati Lab Stone Trim Arc"] = {
			Name = "Entrati Lab Stone Trim Arc",
			Image = "DecoEntratiLabStoneTrimArc.png",
			Description = "An arc of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Entrati Lab Stone Trim Corner (Sharp)"] = {
			Name = "Entrati Lab Stone Trim Corner (Sharp)",
			Image = "DecoEntratiLabStoneTrimCorner(Sharp).png",
			Description = "A sharp corner section of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Entrati Lab Stone Trim Corner (Smooth)"] = {
			Name = "Entrati Lab Stone Trim Corner (Smooth)",
			Image = "DecoEntratiLabStoneTrimCorner(Smooth).png",
			Description = "A smooth corner section of stone trim used in Entrati laboratories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Exhaust Pipe (Damaged)"] = {
			Name = "Exhaust Pipe (Damaged)",
			Image = "DecoExhaustPipe(Damaged).png",
			Description = "A large exhaust pipe that has been damaged",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Fass Vosphene"] = {
			Name = "Fass Vosphene",
			Image = "DecoFassVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Fass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Ring (Trim)"] = {
			Name = "Floor Ring (Trim)",
			Image = "DecoFloorRing(Trim).png",
			Description = "A large floor trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Floor Section (Damaged, 3x3m)"] = {
			Name = "Floor Section (Damaged, 3x3m)",
			Image = "DecoFloorSection(Damaged,3x3m).png",
			Description = "A damaged 3x3m Orokin tower floor section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Floor Section (Damaged, 6x18m)"] = {
			Name = "Floor Section (Damaged, 6x18m)",
			Image = "DecoFloorSection(Damaged,6x18m).png",
			Description = "A damaged 6x18m Orokin tower floor section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Floor Section (Damaged, 6x6m)"] = {
			Name = "Floor Section (Damaged, 6x6m)",
			Image = "DecoFloorSection(Damaged,6x6m).png",
			Description = "A damaged 6x6 Orokin tower floor section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Floor Section (Damaged, 6x8m)"] = {
			Name = "Floor Section (Damaged, 6x8m)",
			Image = "DecoFloorSection(Damaged,6x8m).png",
			Description = "A damaged 6x8m Orokin tower floor section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Floor Tiles (Broken, Orokin Ceremonial Pattern, Large)"] = {
			Name = "Floor Tiles (Broken, Orokin Ceremonial Pattern, Large)",
			Image = "DecoFloorTiles(Broken,OrokinCeremonialPattern,Large).png",
			Description = "A large section of broken Orokin ceremonial floor tiles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Tiles (Broken, Orokin Ceremonial Pattern)"] = {
			Name = "Floor Tiles (Broken, Orokin Ceremonial Pattern)",
			Image = "DecoFloorTiles(Broken,OrokinCeremonialPattern).png",
			Description = "A section of Orokin ceremonial floor tiles that are broken.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Tiles (Broken, Orokin Standard Pattern, Large)"] = {
			Name = "Floor Tiles (Broken, Orokin Standard Pattern, Large)",
			Image = "DecoFloorTiles(Broken,OrokinStandardPattern,Large).png",
			Description = "A large section of broken Orokin standard pattern floor tiles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Tiles (Broken, Orokin Standard Pattern, Small)"] = {
			Name = "Floor Tiles (Broken, Orokin Standard Pattern, Small)",
			Image = "DecoFloorTiles(Broken,OrokinStandardPattern,Small).png",
			Description = "A small section of standard Orokin floor tiles that are broken.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Floor Tiles (Broken, Orokin Standard Pattern)"] = {
			Name = "Floor Tiles (Broken, Orokin Standard Pattern)",
			Image = "DecoFloorTiles(Broken,OrokinStandardPattern).png",
			Description = "A section of standard Orokin floor tiles that are broken.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Gold Trim (Damaged)"] = {
			Name = "Gold Trim (Damaged)",
			Image = "DecoGoldTrim(Damaged).png",
			Description = "A small section of damaged gold trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Jahu Vosphene"] = {
			Name = "Jahu Vosphene",
			Image = "DecoJahuVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Jahu.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Khra Vosphene"] = {
			Name = "Khra Vosphene",
			Image = "DecoKhraVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Khra.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Ladder (Ostron)"] = {
			Name = "Ladder (Ostron)",
			Image = "DecoLadder(Ostron).png",
			Description = "A ladder made by the Ostron people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Lamp (Orokin)"] = {
			Name = "Lamp (Orokin)",
			Image = "DecoLamp(Orokin).png",
			Description = "An Orokin lamp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lohk Vosphene"] = {
			Name = "Lohk Vosphene",
			Image = "DecoLohkVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Lohk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Netra Vosphene"] = {
			Name = "Netra Vosphene",
			Image = "DecoNetraVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Netra.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Operator Lesson Chair"] = {
			Name = "Operator Lesson Chair",
			Image = "DecoOperatorLessonChair.png",
			Description = "A chair that operators use when taking lessons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Operator Operations Pod"] = {
			Name = "Operator Operations Pod",
			Image = "DecoOperatorOperationsPod.png",
			Description = "A pod used by operators for remote operations.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Access Cover"] = {
			Name = "Orokin Access Cover",
			Image = "DecoOrokinAccessCover.png",
			Description = "An Orokin grate used to cover access passages.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Archive Tower"] = {
			Name = "Orokin Archive Tower",
			Image = "DecoOrokinArchiveTower.png",
			Description = "The top section of an Orokin archive tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Archive Tower (Top)"] = {
			Name = "Orokin Archive Tower (Top)",
			Image = "DecoOrokinArchiveTower(Top).png",
			Description = "A structure that houses Orokin archives.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Bench (4m)"] = {
			Name = "Orokin Bench (4m)",
			Image = "DecoOrokinBench(4m).png",
			Description = "An Orokin bench that is 4 meters in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Bench (Inside Curve)"] = {
			Name = "Orokin Bench (Inside Curve)",
			Image = "DecoOrokinBench(InsideCurve).png",
			Description = "An Orokin bench that is curved to the inside.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Bench (Outside Curve)"] = {
			Name = "Orokin Bench (Outside Curve)",
			Image = "DecoOrokinBench(OutsideCurve).png",
			Description = "An Orokin bench that is curved to the outside.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Bush (Small)"] = {
			Name = "Orokin Bush (Small)",
			Image = "DecoOrokinBush(Small).png",
			Description = "A small Orokin bush.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk 3-Way Junction"] = {
			Name = "Orokin Catwalk 3-Way Junction",
			Image = "DecoOrokinCatwalk3-WayJunction.png",
			Description = "An Orokin catwalk platform that is a 3-way junction.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk Platform (2m)"] = {
			Name = "Orokin Catwalk Platform (2m)",
			Image = "DecoOrokinCatwalkPlatform(2m).png",
			Description = "An Orokin catwalk section 2 meters in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk Platform (4m)"] = {
			Name = "Orokin Catwalk Platform (4m)",
			Image = "DecoOrokinCatwalkPlatform(4m).png",
			Description = "An Orokin catwalk platform section of 4 meters in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk Platform (Corner Junction)"] = {
			Name = "Orokin Catwalk Platform (Corner Junction)",
			Image = "DecoOrokinCatwalkPlatform(CornerJunction).png",
			Description = "An Orokin catwalk corner junction.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk Platform (End)"] = {
			Name = "Orokin Catwalk Platform (End)",
			Image = "DecoOrokinCatwalkPlatform(End).png",
			Description = "An Orokin catwalk end cap platform.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Catwalk Stairs"] = {
			Name = "Orokin Catwalk Stairs",
			Image = "DecoOrokinCatwalkStairs.png",
			Description = "A set of Orokin stairs used with the catwalk system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Ceremonial Circle Trim"] = {
			Name = "Orokin Ceremonial Circle Trim",
			Image = "DecoOrokinCeremonialCircleTrim.png",
			Description = "A large trim installed in ceremonial Orokin spaces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Column"] = {
			Name = "Orokin Column",
			Image = "DecoOrokinColumn.png",
			Description = "An Orokin column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Console"] = {
			Name = "Orokin Console",
			Image = "DecoOrokinConsole.png",
			Description = "A simple Orokin interface console.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Edifice"] = {
			Name = "Orokin Edifice",
			Image = "DecoOrokinEdifice.png",
			Description = "An edifice of Orokin structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Edifice Tower"] = {
			Name = "Orokin Edifice Tower",
			Image = "DecoOrokinEdificeTower.png",
			Description = "A tower section of Orokin edifice structures.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Energy Conduit (Large)"] = {
			Name = "Orokin Energy Conduit (Large)",
			Image = "DecoOrokinEnergyConduit(Large).png",
			Description = "A large Orokin energy conduit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Entrati Actuator Base"] = {
			Name = "Orokin Entrati Actuator Base",
			Image = "DecoOrokinEntratiActuatorBase.png",
			Description = "A small actuator used by the Entrati.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ancient Orb"] = {
			Name = "Orokin Entrati Ancient Orb",
			Image = "DecoOrokinEntratiAncientOrb.png",
			Description = "A very large orb that holds mysterious ancient information.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Big Clock Arm"] = {
			Name = "Orokin Entrati Broken Big Clock Arm",
			Image = "DecoOrokinEntratiBrokenBigClockArm.png",
			Description = "A broken big hand base piece of an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Big Clock Hand"] = {
			Name = "Orokin Entrati Broken Big Clock Hand",
			Image = "DecoOrokinEntratiBrokenBigClockHand.png",
			Description = "A broken big hand piece of  an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Clock Base"] = {
			Name = "Orokin Entrati Broken Clock Base",
			Image = "DecoOrokinEntratiBrokenClockBase.png",
			Description = "A broken base piece of an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Clock Orb"] = {
			Name = "Orokin Entrati Broken Clock Orb",
			Image = "DecoOrokinEntratiBrokenClockOrb.png",
			Description = "A large broken orb piece of an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Small Clock Arm"] = {
			Name = "Orokin Entrati Broken Small Clock Arm",
			Image = "DecoOrokinEntratiBrokenSmallClockArm.png",
			Description = "A broken small arm piece of an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Broken Small Clock Hand"] = {
			Name = "Orokin Entrati Broken Small Clock Hand",
			Image = "DecoOrokinEntratiBrokenSmallClockHand.png",
			Description = "A broken small hand piece of an Entrati cosmic clock.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Buttress Trim"] = {
			Name = "Orokin Entrati Buttress Trim",
			Image = "DecoOrokinEntratiButtressTrim.png",
			Description = "A large Entrati buttress trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ceiling Trim (16m)"] = {
			Name = "Orokin Entrati Ceiling Trim (16m)",
			Image = "DecoOrokinEntratiCeilingTrim(16m).png",
			Description = "A large Entrati ceiling trim measuring 16m long.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Ceiling Trim (8m)"] = {
			Name = "Orokin Entrati Ceiling Trim (8m)",
			Image = "DecoOrokinEntratiCeilingTrim(8m).png",
			Description = "A large Entrati ceiling trim measuring 8m long.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Column (Large Half)"] = {
			Name = "Orokin Entrati Column (Large Half)",
			Image = "DecoOrokinEntratiColumn(LargeHalf).png",
			Description = "A large Entrati half column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Column (Large)"] = {
			Name = "Orokin Entrati Column (Large)",
			Image = "DecoOrokinEntratiColumn(Large).png",
			Description = "A large Entrati column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Column (Small Half)"] = {
			Name = "Orokin Entrati Column (Small Half)",
			Image = "DecoOrokinEntratiColumn(SmallHalf).png",
			Description = "A small Entrati half column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Column (Small)"] = {
			Name = "Orokin Entrati Column (Small)",
			Image = "DecoOrokinEntratiColumn(Small).png",
			Description = "A small Entrati column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Column Base"] = {
			Name = "Orokin Entrati Column Base",
			Image = "DecoOrokinEntratiColumnBase.png",
			Description = "A large column base used by the Entrati.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Column Conduit"] = {
			Name = "Orokin Entrati Column Conduit",
			Image = "DecoOrokinEntratiColumnConduit.png",
			Description = "A conduit used with Entrati columns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Orokin Entrati Conduit Crystal"] = {
			Name = "Orokin Entrati Conduit Crystal",
			Image = "DecoOrokinEntratiConduitCrystal.png",
			Description = "A crystal used to interact with the user.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Cosmic Clock"] = {
			Name = "Orokin Entrati Cosmic Clock",
			Image = "DecoOrokinEntratiCosmicClock.png",
			Description = "A very large Entrati clock that tracks infinite moments through timespace.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Crown Trim"] = {
			Name = "Orokin Entrati Crown Trim",
			Image = "DecoOrokinEntratiCrownTrim.png",
			Description = "A golden crown trim used by the Entrati.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Curved Trim"] = {
			Name = "Orokin Entrati Curved Trim",
			Image = "DecoOrokinEntratiCurvedTrim.png",
			Description = "An Entrati architectural curved trim piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Curved Trim Section"] = {
			Name = "Orokin Entrati Curved Trim Section",
			Image = "DecoOrokinEntratiCurvedTrimSection.png",
			Description = "A section of curved Entrati trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Curved Wall (16m)"] = {
			Name = "Orokin Entrati Curved Wall (16m)",
			Image = "DecoOrokinEntratiCurvedWall(16m).png",
			Description = "A large, curved 16m long Entrati wall section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Curved Wall (8m)"] = {
			Name = "Orokin Entrati Curved Wall (8m)",
			Image = "DecoOrokinEntratiCurvedWall(8m).png",
			Description = "An 8m long curved Entrati wall section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Decorative Column"] = {
			Name = "Orokin Entrati Decorative Column",
			Image = "DecoOrokinEntratiDecorativeColumn.png",
			Description = "A decorative Entrati column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Decorative Column Base"] = {
			Name = "Orokin Entrati Decorative Column Base",
			Image = "DecoOrokinEntratiDecorativeColumnBase.png",
			Description = "An Entrati decorative base used on columns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Decorative End Cap"] = {
			Name = "Orokin Entrati Decorative End Cap",
			Image = "DecoOrokinEntratiDecorativeEndCap.png",
			Description = "A decorative Entrati trim end cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Display Base"] = {
			Name = "Orokin Entrati Display Base",
			Image = "DecoOrokinEntratiDisplayBase.png",
			Description = "A large display bsed used by the Entrati to show unique and important items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Domas Icon"] = {
			Name = "Orokin Entrati Domas Icon",
			Image = "DecoOrokinEntratiDomasIcon.png",
			Description = "An icon used by the Entrati in their architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Orokin Entrati Elegant Wall (8m)"] = {
			Name = "Orokin Entrati Elegant Wall (8m)",
			Image = "DecoOrokinEntratiElegantWall(8m).png",
			Description = "An 8m long Entrati curved wall section in the simplest base design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Orokin Entrati End Cap"] = {
			Name = "Orokin Entrati End Cap",
			Image = "DecoOrokinEntratiEndCap.png",
			Description = "A simple piece of Entrati material from their architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Energy Conduit"] = {
			Name = "Orokin Entrati Energy Conduit",
			Image = "DecoOrokinEntratiEnergyConduit.png",
			Description = "A small Entrati component used to focus energy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Formal Hallway End Cap"] = {
			Name = "Orokin Entrati Formal Hallway End Cap",
			Image = "DecoOrokinEntratiFormalHallwayEndCap.png",
			Description = "A large Entrati hallway end cap featuring a formal design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Gold Disc"] = {
			Name = "Orokin Entrati Gold Disc",
			Image = "DecoOrokinEntratiGoldDisc.png",
			Description = "A large Entrati gold disc used in their architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold End Cap"] = {
			Name = "Orokin Entrati Gold End Cap",
			Image = "DecoOrokinEntratiGoldEndCap.png",
			Description = "A small golden Entrati end cap trim piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold Orb"] = {
			Name = "Orokin Entrati Gold Orb",
			Image = "DecoOrokinEntratiGoldOrb.png",
			Description = "A golden Entrati orb.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold Trim (2m)"] = {
			Name = "Orokin Entrati Gold Trim (2m)",
			Image = "DecoOrokinEntratiGoldTrim(2m).png",
			Description = "An Entrati gold trim 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold Trim (4m)"] = {
			Name = "Orokin Entrati Gold Trim (4m)",
			Image = "DecoOrokinEntratiGoldTrim(4m).png",
			Description = "An Entrati gold trim 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold Trim (8m)"] = {
			Name = "Orokin Entrati Gold Trim (8m)",
			Image = "DecoOrokinEntratiGoldTrim(8m).png",
			Description = "An Entrati gold trim 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Gold Trim End Cap"] = {
			Name = "Orokin Entrati Gold Trim End Cap",
			Image = "DecoOrokinEntratiGoldTrimEndCap.png",
			Description = "A small Entrati golden trim end cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Salvage" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neurodes" }
				}
			}
		},
		["Orokin Entrati Hallway End Cap"] = {
			Name = "Orokin Entrati Hallway End Cap",
			Image = "DecoOrokinEntratiHallwayEndCap.png",
			Description = "A large Entrati hallway end cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Hallway Wall"] = {
			Name = "Orokin Entrati Hallway Wall",
			Image = "DecoOrokinEntratiHallwayWall.png",
			Description = "A large Entrati hallway wall section that's ornate in design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Nano Spores" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Orb"] = {
			Name = "Orokin Entrati Orb",
			Image = "DecoOrokinEntratiOrb.png",
			Description = "A large orb believe to house the ancient orb technology.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Column"] = {
			Name = "Orokin Entrati Ornate Column",
			Image = "DecoOrokinEntratiOrnateColumn.png",
			Description = "An ornate Entrati column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Column (Half)"] = {
			Name = "Orokin Entrati Ornate Column (Half)",
			Image = "DecoOrokinEntratiOrnateColumn(Half).png",
			Description = "An Entrati ornate half column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Column Base"] = {
			Name = "Orokin Entrati Ornate Column Base",
			Image = "DecoOrokinEntratiOrnateColumnBase.png",
			Description = "An ornate Entrati column base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Ornate Curved Wall (16m)"] = {
			Name = "Orokin Entrati Ornate Curved Wall (16m)",
			Image = "DecoOrokinEntratiOrnateCurvedWall(16m).png",
			Description = "A large, curved 16m long Entrati wall section with ornate design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Ornate Hallway End Cap"] = {
			Name = "Orokin Entrati Ornate Hallway End Cap",
			Image = "DecoOrokinEntratiOrnateHallwayEndCap.png",
			Description = "A large Entrati hallway end cap that's ornate in design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Ornate Pillar"] = {
			Name = "Orokin Entrati Ornate Pillar",
			Image = "DecoOrokinEntratiOrnatePillar.png",
			Description = "An Entrati ornate pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Ornate Trim (4m)"] = {
			Name = "Orokin Entrati Ornate Trim (4m)",
			Image = "DecoOrokinEntratiOrnateTrim(4m).png",
			Description = "A 4m length of ornate Entrati trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Trim (8m)"] = {
			Name = "Orokin Entrati Ornate Trim (8m)",
			Image = "DecoOrokinEntratiOrnateTrim(8m).png",
			Description = "An 8m length or ornate Entrati trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Trim (Curved Inward)"] = {
			Name = "Orokin Entrati Ornate Trim (Curved Inward)",
			Image = "DecoOrokinEntratiOrnateTrim(CurvedInward).png",
			Description = "A large ornate trim piece with an inward curve.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Trim (Curved Outward)"] = {
			Name = "Orokin Entrati Ornate Trim (Curved Outward)",
			Image = "DecoOrokinEntratiOrnateTrim(CurvedOutward).png",
			Description = "A large ornate trim with an outward curve.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Ornate Wall (8m)"] = {
			Name = "Orokin Entrati Ornate Wall (8m)",
			Image = "DecoOrokinEntratiOrnateWall(8m).png",
			Description = "An 8m long Entrati curved wall section with an ornate design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Ferrite" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Patterned Curved Wall (16m)"] = {
			Name = "Orokin Entrati Patterned Curved Wall (16m)",
			Image = "DecoOrokinEntratiPatternedCurvedWall(16m).png",
			Description = "A large, curved 16m long Entrati wall section that has a double pattern of the standard.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Orokin Entrati Pillar"] = {
			Name = "Orokin Entrati Pillar",
			Image = "DecoOrokinEntratiPillar.png",
			Description = "An Orokin Entrati pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Portal Gate"] = {
			Name = "Orokin Entrati Portal Gate",
			Image = "DecoOrokinEntratiPortalGate.png",
			Description = "A remnant of an ancient gate that focused energy to summon portals.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Portal Key"] = {
			Name = "Orokin Entrati Portal Key",
			Image = "DecoOrokinEntratiPortalKey.png",
			Description = "A key to ancient Entrati technology.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Short Wall (2m)"] = {
			Name = "Orokin Entrati Short Wall (2m)",
			Image = "DecoOrokinEntratiShortWall(2m).png",
			Description = "A short Entrati wall section 2m in width.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Short Wall (4m)"] = {
			Name = "Orokin Entrati Short Wall (4m)",
			Image = "DecoOrokinEntratiShortWall(4m).png",
			Description = "A short Entrati wall section 4m in width.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Short Wall (8m)"] = {
			Name = "Orokin Entrati Short Wall (8m)",
			Image = "DecoOrokinEntratiShortWall(8m).png",
			Description = "A short Entrati wall section 8m in width.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Stair Set (Large)"] = {
			Name = "Orokin Entrati Stair Set (Large)",
			Image = "DecoOrokinEntratiStairSet(Large).png",
			Description = "A large set of Entrati stairs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Stair Set (Small)"] = {
			Name = "Orokin Entrati Stair Set (Small)",
			Image = "DecoOrokinEntratiStairSet(Small).png",
			Description = "A small set of Entrati stairs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Step"] = {
			Name = "Orokin Entrati Step",
			Image = "DecoOrokinEntratiStep.png",
			Description = "A single Entrati step.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Tall Wall (2m)"] = {
			Name = "Orokin Entrati Tall Wall (2m)",
			Image = "DecoOrokinEntratiTallWall(2m).png",
			Description = "A tall Entrati wall section 2m wide.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Tall Wall (4m)"] = {
			Name = "Orokin Entrati Tall Wall (4m)",
			Image = "DecoOrokinEntratiTallWall(4m).png",
			Description = "A tall Entrati wall section 4m wide.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Polymer Bundle" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Trim (4m)"] = {
			Name = "Orokin Entrati Trim (4m)",
			Image = "DecoOrokinEntratiTrim(4m).png",
			Description = "A 4m length of Entrati trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Trim (8m)"] = {
			Name = "Orokin Entrati Trim (8m)",
			Image = "DecoOrokinEntratiTrim(8m).png",
			Description = "An 8m length of Entrati trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Trim (Curved Inward)"] = {
			Name = "Orokin Entrati Trim (Curved Inward)",
			Image = "DecoOrokinEntratiTrim(CurvedInward).png",
			Description = "A large trim piece with an inward curve.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Trim (Curved Outward)"] = {
			Name = "Orokin Entrati Trim (Curved Outward)",
			Image = "DecoOrokinEntratiTrim(CurvedOutward).png",
			Description = "A large trim with an outward curve.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Void Mirror Dormant"] = {
			Name = "Orokin Entrati Void Mirror Dormant",
			Image = "DecoOrokinEntratiVoidMirrorDormant.png",
			Description = "An inactive Entrati device used to access the void.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Void Mirror Fragment (A)"] = {
			Name = "Orokin Entrati Void Mirror Fragment (A)",
			Image = "DecoOrokinEntratiVoidMirrorFragment(A).png",
			Description = "A large broken piece from an Entrati void mirror.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Void Mirror Fragment (B)"] = {
			Name = "Orokin Entrati Void Mirror Fragment (B)",
			Image = "DecoOrokinEntratiVoidMirrorFragment(B).png",
			Description = "A large broken piece from an Entrati void mirror.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Void Mirror Fragment (C)"] = {
			Name = "Orokin Entrati Void Mirror Fragment (C)",
			Image = "DecoOrokinEntratiVoidMirrorFragment(C).png",
			Description = "A large broken piece from an Entrati void mirror.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Void Mirror Fragment (D)"] = {
			Name = "Orokin Entrati Void Mirror Fragment (D)",
			Image = "DecoOrokinEntratiVoidMirrorFragment(D).png",
			Description = "A large broken piece from an Entrati void mirror.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Alloy Plate" },
					{ Count = 150, Name = "Nano Spores" },
					{ Count = 75, Name = "Circuits" },
					{ Count = 0.05, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Entrati Wall (Large)"] = {
			Name = "Orokin Entrati Wall (Large)",
			Image = "DecoOrokinEntratiWall(Large).png",
			Description = "A large section of Entrati wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Wall (Small)"] = {
			Name = "Orokin Entrati Wall (Small)",
			Image = "DecoOrokinEntratiWall(Small).png",
			Description = "A small Entrati wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Wall Column Facade"] = {
			Name = "Orokin Entrati Wall Column Facade",
			Image = "DecoOrokinEntratiWallColumnFacade.png",
			Description = "A tall Entrati wall column facade.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Entrati Wall Screen"] = {
			Name = "Orokin Entrati Wall Screen",
			Image = "DecoOrokinEntratiWallScreen.png",
			Description = "A small ornate wall screen hung by the Entrati.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Entrati Zarinas Symbol"] = {
			Name = "Orokin Entrati Zarinas Symbol",
			Image = "DecoOrokinEntratiZarinasSymbol.png",
			Description = "A family symbol of the Entrati.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Filigree"] = {
			Name = "Orokin Filigree",
			Image = "DecoOrokinFiligree.png",
			Description = "An Orokin filigree trim piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Filigree (Large)"] = {
			Name = "Orokin Filigree (Large)",
			Image = "DecoOrokinFiligree(Large).png",
			Description = "An Orokin filigree piece that is larger.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Filigree Keystone"] = {
			Name = "Orokin Filigree Keystone",
			Image = "DecoOrokinFiligreeKeystone.png",
			Description = "An Orokin trim used as a focal point on their architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Filigree Keystone Ornate"] = {
			Name = "Orokin Filigree Keystone Ornate",
			Image = "DecoOrokinFiligreeKeystoneOrnate.png",
			Description = "An Orokin ornate trim used as a focal point on Orokin architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Filigree Shield"] = {
			Name = "Orokin Filigree Shield",
			Image = "DecoOrokinFiligreeShield.png",
			Description = "An Orokin filigree trim that resembles an ancient warrior class shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Filigree Trim Crown Ornate"] = {
			Name = "Orokin Filigree Trim Crown Ornate",
			Image = "DecoOrokinFiligreeTrimCrownOrnate.png",
			Description = "An Orokin trim crown used as a focal point on Orokin architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Filigree Wall Panel"] = {
			Name = "Orokin Filigree Wall Panel",
			Image = "DecoOrokinFiligreeWallPanel.png",
			Description = "A large wall panel of Orokin filigree design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Filigree Warrior Trim"] = {
			Name = "Orokin Filigree Warrior Trim",
			Image = "DecoOrokinFiligreeWarriorTrim.png",
			Description = "An Orokin filigree trim in the shape of ancient warrior class accessories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Grand Hall Ornament"] = {
			Name = "Orokin Grand Hall Ornament",
			Image = "DecoOrokinGrandHallOrnament.png",
			Description = "An Orokin architecture ornament typically used in grand Orokin spaces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Hallway Column Base"] = {
			Name = "Orokin Hallway Column Base",
			Image = "DecoOrokinHallwayColumnBase.png",
			Description = "An Orokin piece of architecture used at the base of columns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Hatch"] = {
			Name = "Orokin Hatch",
			Image = "DecoOrokinHatch.png",
			Description = "An Orokin disc that serves as a cap for passage ways.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Historical Archive Interface"] = {
			Name = "Orokin Historical Archive Interface",
			Image = "DecoOrokinHistoricalArchiveInterface.png",
			Description = "An Orokin user interface for historical references.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Judgement Tower"] = {
			Name = "Orokin Judgement Tower",
			Image = "DecoOrokinJudgementTower.png",
			Description = "An Orokin tower used by judges during trials.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Laser Disc"] = {
			Name = "Orokin Laser Disc",
			Image = "DecoOrokinLaserDisc.png",
			Description = "An Orokin weapon component that powers Orokin laser weapons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Cryotic" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Orokin Light Standard"] = {
			Name = "Orokin Light Standard",
			Image = "DecoOrokinLightStandard.png",
			Description = "An Orokin light standard.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Lotus Plate"] = {
			Name = "Orokin Lotus Plate",
			Image = "DecoOrokinLotusPlate.png",
			Description = "An Orokin lotus inspired plate used at the base of Orokin stairs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Ornate Column"] = {
			Name = "Orokin Ornate Column",
			Image = "DecoOrokinOrnateColumn.png",
			Description = "An ornate Orokin column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Ornate Pillar Base"] = {
			Name = "Orokin Ornate Pillar Base",
			Image = "DecoOrokinOrnatePillarBase.png",
			Description = "An Orokin designed base for pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Pavillion"] = {
			Name = "Orokin Pavillion",
			Image = "DecoOrokinPavillion.png",
			Description = "A small freestanding Orokin shelter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Planter"] = {
			Name = "Orokin Planter",
			Image = "DecoOrokinPlanter.png",
			Description = "An Orokin designed planter box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Orokin Platform"] = {
			Name = "Orokin Platform",
			Image = "DecoOrokinPlatform.png",
			Description = "An ornate platform used by the Orokin of high stature.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Projector Pads"] = {
			Name = "Orokin Projector Pads",
			Image = "DecoOrokinProjectorPads.png",
			Description = "A small grouping of Orokin projector pads.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Public Information Screen"] = {
			Name = "Orokin Public Information Screen",
			Image = "DecoOrokinPublicInformationScreen.png",
			Description = "An Orokin display used for public communications",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Railing (2m Curved)"] = {
			Name = "Orokin Railing (2m Curved)",
			Image = "DecoOrokinRailing(2mCurved).png",
			Description = "An Orokin designed curved railing 2m in length,",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Railing (2m)"] = {
			Name = "Orokin Railing (2m)",
			Image = "DecoOrokinRailing(2m).png",
			Description = "An Orokin designed railing 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Railing (4m Curved)"] = {
			Name = "Orokin Railing (4m Curved)",
			Image = "DecoOrokinRailing(4mCurved).png",
			Description = "An Orokin designed curved railing 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Railing (8m)"] = {
			Name = "Orokin Railing (8m)",
			Image = "DecoOrokinRailing(8m).png",
			Description = "An Orokin designed railing 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Standard Ring"] = {
			Name = "Orokin Standard Ring",
			Image = "DecoOrokinStandardRing.png",
			Description = "An Orokin trim used in basic architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Tech Cartridge"] = {
			Name = "Orokin Tech Cartridge",
			Image = "DecoOrokinTechCartridge.png",
			Description = "An Orokin piece of tech that acts as a cartridge for storing information.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tech Emitter"] = {
			Name = "Orokin Tech Emitter",
			Image = "DecoOrokinTechEmitter.png",
			Description = "An Orokin piece of tech used as an emitter of signals or energy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tech Energy Capacitor"] = {
			Name = "Orokin Tech Energy Capacitor",
			Image = "DecoOrokinTechEnergyCapacitor.png",
			Description = "An Orokin piece of tech used to store energy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tech Engine"] = {
			Name = "Orokin Tech Engine",
			Image = "DecoOrokinTechEngine.png",
			Description = "A mysterious Orokin designed engine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tech Heat Shield"] = {
			Name = "Orokin Tech Heat Shield",
			Image = "DecoOrokinTechHeatShield.png",
			Description = "An Orokin piece of tech used as a heat shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tech Relay"] = {
			Name = "Orokin Tech Relay",
			Image = "DecoOrokinTechRelay.png",
			Description = "An Orokin piece of tech used as an energy relay.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Orokin Tower Piece (Damaged, Large)"] = {
			Name = "Orokin Tower Piece (Damaged, Large)",
			Image = "DecoOrokinTowerPiece(Damaged,Large).png",
			Description = "A large damaged piece from the Orokin tower structures.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Tower Piece (Damaged, Single)"] = {
			Name = "Orokin Tower Piece (Damaged, Single)",
			Image = "DecoOrokinTowerPiece(Damaged,Single).png",
			Description = "A single damaged Orokin tower piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Tower Pieces (Damaged)"] = {
			Name = "Orokin Tower Pieces (Damaged)",
			Image = "DecoOrokinTowerPieces(Damaged).png",
			Description = "A small grouping of damaged Orokin tower pieces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Tower Trim"] = {
			Name = "Orokin Tower Trim",
			Image = "DecoOrokinTowerTrim.png",
			Description = "A large gold trim piece from an Orokin tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Transcendence Interface"] = {
			Name = "Orokin Transcendence Interface",
			Image = "DecoOrokinTranscendenceInterface.png",
			Description = "An Orokin console to interface with the ancient Orokin network.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Tree Planter"] = {
			Name = "Orokin Tree Planter",
			Image = "DecoOrokinTreePlanter.png",
			Description = "An Orokin designed planter for a small tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Orokin Trim Ring"] = {
			Name = "Orokin Trim Ring",
			Image = "DecoOrokinTrimRing.png",
			Description = "An Orokin circular designed trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Orokin Vegetation Tree (Large)"] = {
			Name = "Orokin Vegetation Tree (Large)",
			Image = "DecoOrokinVegetationTree(Large).png",
			Description = "A large sized Orokin tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Vegetation Tree (Medium)"] = {
			Name = "Orokin Vegetation Tree (Medium)",
			Image = "DecoOrokinVegetationTree(Medium).png",
			Description = "A medium sized Orokin tree.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Wall"] = {
			Name = "Orokin Wall",
			Image = "DecoOrokinWall.png",
			Description = "An Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Orokin Wall Light"] = {
			Name = "Orokin Wall Light",
			Image = "DecoOrokinWallLight.png",
			Description = "A standard wall light.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Orokin Wall Vent Register"] = {
			Name = "Orokin Wall Vent Register",
			Image = "DecoOrokinWallVentRegister.png",
			Description = "A wall vent register of Orokin design.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar (Damaged, Orokin, 2x4x20m)"] = {
			Name = "Pillar (Damaged, Orokin, 2x4x20m)",
			Image = "DecoPillar(Damaged,Orokin,2x4x20m).png",
			Description = "A damaged Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Base"] = {
			Name = "Pillar Base",
			Image = "DecoPillarBase.png",
			Description = "A base that secures pillars to the floor.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Base (Broken, 1x1x6m)"] = {
			Name = "Pillar Base (Broken, 1x1x6m)",
			Image = "DecoPillarBase(Broken,1x1x6m).png",
			Description = "The base section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Base (Broken, 1x2x6m)"] = {
			Name = "Pillar Base (Broken, 1x2x6m)",
			Image = "DecoPillarBase(Broken,1x2x6m).png",
			Description = "The base section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Base (Broken, 1x4x6m)"] = {
			Name = "Pillar Base (Broken, 1x4x6m)",
			Image = "DecoPillarBase(Broken,1x4x6m).png",
			Description = "The base section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Base (Damaged)"] = {
			Name = "Pillar Base (Damaged)",
			Image = "DecoPillarBase(Damaged).png",
			Description = "A damaged pillar base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Base Cap"] = {
			Name = "Pillar Base Cap",
			Image = "DecoPillarBaseCap.png",
			Description = "A decorative element that caps the pillar base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Base Cap (Damaged)"] = {
			Name = "Pillar Base Cap (Damaged)",
			Image = "DecoPillarBaseCap(Damaged).png",
			Description = "A damaged pillar base cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Debris (Bottom)"] = {
			Name = "Pillar Debris (Bottom)",
			Image = "DecoPillarDebris(Bottom).png",
			Description = "Debris from the bottom section of an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Debris (Large)"] = {
			Name = "Pillar Debris (Large)",
			Image = "DecoPillarDebris(Large).png",
			Description = "A large piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Debris (Medium)"] = {
			Name = "Pillar Debris (Medium)",
			Image = "DecoPillarDebris(Medium).png",
			Description = "A medium piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Debris (Mid)"] = {
			Name = "Pillar Debris (Mid)",
			Image = "DecoPillarDebris(Mid).png",
			Description = "Debris from the mid section of an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Debris (Small)"] = {
			Name = "Pillar Debris (Small)",
			Image = "DecoPillarDebris(Small).png",
			Description = "A small piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Debris (Top)"] = {
			Name = "Pillar Debris (Top)",
			Image = "DecoPillarDebris(Top).png",
			Description = "Debris from the top section of an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Frame"] = {
			Name = "Pillar Frame",
			Image = "DecoPillarFrame.png",
			Description = "A large frame that supports pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Shaft (8m)"] = {
			Name = "Pillar Shaft (8m)",
			Image = "DecoPillarShaft(8m).png",
			Description = "An 8m long pillar shaft.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Shaft (Damaged, 8m)"] = {
			Name = "Pillar Shaft (Damaged, 8m)",
			Image = "DecoPillarShaft(Damaged,8m).png",
			Description = "A damaged 8m length of a pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Shaft (Damaged, Small)"] = {
			Name = "Pillar Shaft (Damaged, Small)",
			Image = "DecoPillarShaft(Damaged,Small).png",
			Description = "A small damaged section of a pillar shaft.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Top"] = {
			Name = "Pillar Top",
			Image = "DecoPillarTop.png",
			Description = "The top section of the Orokin tower pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Top (Broken, 1x1x6m)"] = {
			Name = "Pillar Top (Broken, 1x1x6m)",
			Image = "DecoPillarTop(Broken,1x1x6m).png",
			Description = "The top section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top (Broken, 1x2x6m)"] = {
			Name = "Pillar Top (Broken, 1x2x6m)",
			Image = "DecoPillarTop(Broken,1x2x6m).png",
			Description = "The top section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top (Broken, 1x4x6m)"] = {
			Name = "Pillar Top (Broken, 1x4x6m)",
			Image = "DecoPillarTop(Broken,1x4x6m).png",
			Description = "The top section of a broken Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top (Damaged, Orokin)"] = {
			Name = "Pillar Top (Damaged, Orokin)",
			Image = "DecoPillarTop(Damaged,Orokin).png",
			Description = "A damaged top section of an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top (Damaged)"] = {
			Name = "Pillar Top (Damaged)",
			Image = "DecoPillarTop(Damaged).png",
			Description = "A damaged pillar top.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Pillar Top Anchor Debris"] = {
			Name = "Pillar Top Anchor Debris",
			Image = "DecoPillarTopAnchorDebris.png",
			Description = "An Orokin pillar ceiling anchor debris piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top Debris (Large)"] = {
			Name = "Pillar Top Debris (Large)",
			Image = "DecoPillarTopDebris(Large).png",
			Description = "A large top piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top Debris (Medium)"] = {
			Name = "Pillar Top Debris (Medium)",
			Image = "DecoPillarTopDebris(Medium).png",
			Description = "A medium top piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pillar Top Debris (Small)"] = {
			Name = "Pillar Top Debris (Small)",
			Image = "DecoPillarTopDebris(Small).png",
			Description = "A small top piece of debris from an Orokin pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pod Cluster (Operator Stasis Pod)"] = {
			Name = "Pod Cluster (Operator Stasis Pod)",
			Image = "DecoPodCluster(OperatorStasisPod).png",
			Description = "A cluster of operator stasis pods with umbilical codes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Portal Housing (Orokin)"] = {
			Name = "Portal Housing (Orokin)",
			Image = "DecoPortalHousing(Orokin).png",
			Description = "A very large Orokin portal housing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Ring (Damaged)"] = {
			Name = "Ring (Damaged)",
			Image = "DecoRing(Damaged).png",
			Description = "A large gold trim ring that has been damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ris Vosphene"] = {
			Name = "Ris Vosphene",
			Image = "DecoRisVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Ris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Rubble Pile"] = {
			Name = "Rubble Pile",
			Image = "DecoRubblePile.png",
			Description = "A pile of Orokin tower debris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rubble Pile (Mixed)"] = {
			Name = "Rubble Pile (Mixed)",
			Image = "DecoRubblePile(Mixed).png",
			Description = "A large pile of Orokin tower debris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Rubble Pile (Small)"] = {
			Name = "Rubble Pile (Small)",
			Image = "DecoRubblePile(Small).png",
			Description = "A small pile of Orokin tower rubble.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tower Base (Damaged)"] = {
			Name = "Tower Base (Damaged)",
			Image = "DecoTowerBase(Damaged).png",
			Description = "A large base found in the Orokin towers that has been damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tower Support"] = {
			Name = "Tower Support",
			Image = "DecoTowerSupport.png",
			Description = "A large ring that adds support to the structure of an Orokin tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Trim (Damaged, Orokin, 2m, Left Hand)"] = {
			Name = "Trim (Damaged, Orokin, 2m, Left Hand)",
			Image = "DecoTrim(Damaged,Orokin,2m,LeftHand).png",
			Description = "A small damaged 2m Orokin trim section on the left hand side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Trim (Damaged, Orokin, 2m, Right Hand)"] = {
			Name = "Trim (Damaged, Orokin, 2m, Right Hand)",
			Image = "DecoTrim(Damaged,Orokin,2m,RightHand).png",
			Description = "A small damaged 2m Orokin trim section on the right hand side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Trim (Large, 16m)"] = {
			Name = "Trim (Large, 16m)",
			Image = "DecoTrim(Large,16m).png",
			Description = "A large 16m wall trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Trim (Large, Outward Curved)"] = {
			Name = "Trim (Large, Outward Curved)",
			Image = "DecoTrim(Large,OutwardCurved).png",
			Description = "A large outward curved wall trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Vome Vosphene"] = {
			Name = "Vome Vosphene",
			Image = "DecoVomeVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Vome.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (16m)"] = {
			Name = "Wall (16m)",
			Image = "DecoWall(16m).png",
			Description = "A 16m length of wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (4m)"] = {
			Name = "Wall (4m)",
			Image = "DecoWall(4m).png",
			Description = "A 4m length of wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (8m)"] = {
			Name = "Wall (8m)",
			Image = "DecoWall(8m).png",
			Description = "An 8m length of wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Broken, 3x10m)"] = {
			Name = "Wall (Broken, 3x10m)",
			Image = "DecoWall(Broken,3x10m).png",
			Description = "A large broken Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (Broken, 3x3m)"] = {
			Name = "Wall (Broken, 3x3m)",
			Image = "DecoWall(Broken,3x3m).png",
			Description = "A broken 3x3m section of Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (Broken, 4x6m)"] = {
			Name = "Wall (Broken, 4x6m)",
			Image = "DecoWall(Broken,4x6m).png",
			Description = "A broken 4x6m section of Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (Broken, 6x6m)"] = {
			Name = "Wall (Broken, 6x6m)",
			Image = "DecoWall(Broken,6x6m).png",
			Description = "A broken 6x6m section of Orokin wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wall (Curved Inward, 16m)"] = {
			Name = "Wall (Curved Inward, 16m)",
			Image = "DecoWall(CurvedInward,16m).png",
			Description = "A 16m length of wall that is curved inward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Curved Inward, 8m)"] = {
			Name = "Wall (Curved Inward, 8m)",
			Image = "DecoWall(CurvedInward,8m).png",
			Description = "An 8m length of wall that is curved inward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Curved Inward)"] = {
			Name = "Wall (Curved Inward)",
			Image = "DecoWall(CurvedInward).png",
			Description = "A 16m section of wall that is curved inward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Curved Outward, 8m)"] = {
			Name = "Wall (Curved Outward, 8m)",
			Image = "DecoWall(CurvedOutward,8m).png",
			Description = "An 8m outward curved wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Curved Outward, Tall, 8m)"] = {
			Name = "Wall (Curved Outward, Tall, 8m)",
			Image = "DecoWall(CurvedOutward,Tall,8m).png",
			Description = "An outward curved wall 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged By A Hole)"] = {
			Name = "Wall (Damaged By A Hole)",
			Image = "DecoWall(DamagedByAHole).png",
			Description = "A wall panel with a hole in it.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged From The Left, Small)"] = {
			Name = "Wall (Damaged From The Left, Small)",
			Image = "DecoWall(DamagedFromTheLeft,Small).png",
			Description = "A small wall panel damaged from the left side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged From The Right, Small)"] = {
			Name = "Wall (Damaged From The Right, Small)",
			Image = "DecoWall(DamagedFromTheRight,Small).png",
			Description = "A small wall panel damaged from the right side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, 16m)"] = {
			Name = "Wall (Damaged, 16m)",
			Image = "DecoWall(Damaged,16m).png",
			Description = "A damaged wall 16m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, 8m, Left Side)"] = {
			Name = "Wall (Damaged, 8m, Left Side)",
			Image = "DecoWall(Damaged,8m,LeftSide).png",
			Description = "An 8m wall section damaged from the left side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, 8m, Right Side)"] = {
			Name = "Wall (Damaged, 8m, Right Side)",
			Image = "DecoWall(Damaged,8m,RightSide).png",
			Description = "An 8m wall section damaged from the right side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, 8m)"] = {
			Name = "Wall (Damaged, 8m)",
			Image = "DecoWall(Damaged,8m).png",
			Description = "An 8m length of damaged wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, Curved Inward, 16m)"] = {
			Name = "Wall (Damaged, Curved Inward, 16m)",
			Image = "DecoWall(Damaged,CurvedInward,16m).png",
			Description = "A 16m length of wall that is damaged and curved inward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, Curved Inward, 8m)"] = {
			Name = "Wall (Damaged, Curved Inward, 8m)",
			Image = "DecoWall(Damaged,CurvedInward,8m).png",
			Description = "An 8m length of wall that is damaged and curved inward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, Curved Outward, 8m)"] = {
			Name = "Wall (Damaged, Curved Outward, 8m)",
			Image = "DecoWall(Damaged,CurvedOutward,8m).png",
			Description = "A damaged 8m length of wall that is curved outward.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, Small)"] = {
			Name = "Wall (Damaged, Small)",
			Image = "DecoWall(Damaged,Small).png",
			Description = "A small mid section of wall that is damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged, Tall, Curved Outward, 8m)"] = {
			Name = "Wall (Damaged, Tall, Curved Outward, 8m)",
			Image = "DecoWall(Damaged,Tall,CurvedOutward,8m).png",
			Description = "A tall damaged outward curved wall 8m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Damaged)"] = {
			Name = "Wall (Damaged)",
			Image = "DecoWall(Damaged).png",
			Description = "A mid section of wall that is damaged.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Left Side Damaged, 2m)"] = {
			Name = "Wall (Left Side Damaged, 2m)",
			Image = "DecoWall(LeftSideDamaged,2m).png",
			Description = "A small length of wall damaged from the left side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Right Side Damaged, 2m)"] = {
			Name = "Wall (Right Side Damaged, 2m)",
			Image = "DecoWall(RightSideDamaged,2m).png",
			Description = "A small length of wall damaged from the right side.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (Tall, 16m)"] = {
			Name = "Wall (Tall, 16m)",
			Image = "DecoWall(Tall,16m).png",
			Description = "A tall wall 16m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall (With Extrusion)"] = {
			Name = "Wall (With Extrusion)",
			Image = "DecoWall(WithExtrusion).png",
			Description = "A 16m wall with an extrusion in the middle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall Cellular Structure (Frame, Curved)"] = {
			Name = "Wall Cellular Structure (Frame, Curved)",
			Image = "DecoWallCellularStructure(Frame,Curved).png",
			Description = "A curved structural frame section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Cellular Structure (Frame, Large)"] = {
			Name = "Wall Cellular Structure (Frame, Large)",
			Image = "DecoWallCellularStructure(Frame,Large).png",
			Description = "A large solid structural frame section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Cellular Structure (Frame)"] = {
			Name = "Wall Cellular Structure (Frame)",
			Image = "DecoWallCellularStructure(Frame).png",
			Description = "A structural frame section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Cellular Structure (Small)"] = {
			Name = "Wall Cellular Structure (Small)",
			Image = "DecoWallCellularStructure(Small).png",
			Description = "A small structural frame section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Cellular Structure (Solid, Large)"] = {
			Name = "Wall Cellular Structure (Solid, Large)",
			Image = "DecoWallCellularStructure(Solid,Large).png",
			Description = "A large solid structural section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Cellular Structure (Solid)"] = {
			Name = "Wall Cellular Structure (Solid)",
			Image = "DecoWallCellularStructure(Solid).png",
			Description = "The sold structural section of an Orokin wall interior.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wall Shell (Damaged, Complete With Hole)"] = {
			Name = "Wall Shell (Damaged, Complete With Hole)",
			Image = "DecoWallShell(Damaged,CompleteWithHole).png",
			Description = "A complete wall shell with a hole.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall Shell (Damaged, Incomplete)"] = {
			Name = "Wall Shell (Damaged, Incomplete)",
			Image = "DecoWallShell(Damaged,Incomplete).png",
			Description = "A wall shell missing the middle section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall Shell (Damaged, Tall)"] = {
			Name = "Wall Shell (Damaged, Tall)",
			Image = "DecoWallShell(Damaged,Tall).png",
			Description = "A tall section of damaged wall shell.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall Shell (Damaged)"] = {
			Name = "Wall Shell (Damaged)",
			Image = "DecoWallShell(Damaged).png",
			Description = "A section of damaged wall shell.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wall Tall (4m)"] = {
			Name = "Wall Tall (4m)",
			Image = "DecoWallTall(4m).png",
			Description = "A tall 4m section of wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Window (Curved, Framed)"] = {
			Name = "Window (Curved, Framed)",
			Image = "DecoWindow(Curved,Framed).png",
			Description = "A gold trim framed window.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Window (Curved, Not Framed)"] = {
			Name = "Window (Curved, Not Framed)",
			Image = "DecoWindow(Curved,NotFramed).png",
			Description = "A curved window with trim on the top and bottom.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Xata Vosphene"] = {
			Name = "Xata Vosphene",
			Image = "DecoXataVosphene.png",
			Description = "Leave the Void's mark on your Dojo with the symbol of Xata.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		}
	},
	Ostron = {
		["Cetus Wildlife Cage (Large)"] = {
			Name = "Cetus Wildlife Cage (Large)",
			Image = "DecoCetusWildlifeCage(Large).png",
			Description = "A large cage used to house wildlife.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Cetus Wildlife Cage (Small)"] = {
			Name = "Cetus Wildlife Cage (Small)",
			Image = "DecoCetusWildlifeCage(Small).png",
			Description = "A small cage used to house wildlife.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Chumpa Grub"] = {
			Name = "Chumpa Grub",
			Image = "DecoChumpaGrub.png",
			Description = "An Ostron delicacy, coveted for its gelatinous internal organs and aroma.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Damaged Ostron Dwelling (Large)"] = {
			Name = "Damaged Ostron Dwelling (Large)",
			Image = "DecoDamagedOstronDwelling(Large).png",
			Description = "The structure was damaged during a battle in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Damaged Ostron Dwelling (Small)"] = {
			Name = "Damaged Ostron Dwelling (Small)",
			Image = "DecoDamagedOstronDwelling(Small).png",
			Description = "The structure was damaged during a battle in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Blanket Piece"] = {
			Name = "Harvested Tower Blanket Piece",
			Image = "DecoHarvestedTowerBlanketPiece.png",
			Description = "A large piece of Orokin tower harvested by the Ostron.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell (Long)"] = {
			Name = "Harvested Tower Shell (Long)",
			Image = "DecoHarvestedTowerShell(Long).png",
			Description = "Shell harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell (Tapered)"] = {
			Name = "Harvested Tower Shell (Tapered)",
			Image = "DecoHarvestedTowerShell(Tapered).png",
			Description = "Shell harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell Pile"] = {
			Name = "Harvested Tower Shell Pile",
			Image = "DecoHarvestedTowerShellPile.png",
			Description = "Shell harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell Stack"] = {
			Name = "Harvested Tower Shell Stack",
			Image = "DecoHarvestedTowerShellStack.png",
			Description = "Shell harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell With Trim (Long)"] = {
			Name = "Harvested Tower Shell With Trim (Long)",
			Image = "DecoHarvestedTowerShellWithTrim(Long).png",
			Description = "Shell and golden trim harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Shell With Trim (Tapered)"] = {
			Name = "Harvested Tower Shell With Trim (Tapered)",
			Image = "DecoHarvestedTowerShellWithTrim(Tapered).png",
			Description = "Shell and golden trim harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim (Large)"] = {
			Name = "Harvested Tower Trim (Large)",
			Image = "DecoHarvestedTowerTrim(Large).png",
			Description = "A bundle of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim (Medium)"] = {
			Name = "Harvested Tower Trim (Medium)",
			Image = "DecoHarvestedTowerTrim(Medium).png",
			Description = "A bundle of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim (Small Circle)"] = {
			Name = "Harvested Tower Trim (Small Circle)",
			Image = "DecoHarvestedTowerTrim(SmallCircle).png",
			Description = "A bundle of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim (Small Straight)"] = {
			Name = "Harvested Tower Trim (Small Straight)",
			Image = "DecoHarvestedTowerTrim(SmallStraight).png",
			Description = "A bundle of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim Pile"] = {
			Name = "Harvested Tower Trim Pile",
			Image = "DecoHarvestedTowerTrimPile.png",
			Description = "A pile of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Harvested Tower Trim Post"] = {
			Name = "Harvested Tower Trim Post",
			Image = "DecoHarvestedTowerTrimPost.png",
			Description = "A post made of material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Debris Bundle"] = {
			Name = "Orokin Debris Bundle",
			Image = "DecoOrokinDebrisBundle.png",
			Description = "Remains of an Orokin tower in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Debris Cluster"] = {
			Name = "Orokin Debris Cluster",
			Image = "DecoOrokinDebrisCluster.png",
			Description = "Remains of an Orokin tower in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Bridge End"] = {
			Name = "Orokin Ruins Bridge End",
			Image = "DecoOrokinRuinsBridgeEnd.png",
			Description = "A section of an ancient Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Bridge Siding"] = {
			Name = "Orokin Ruins Bridge Siding",
			Image = "DecoOrokinRuinsBridgeSiding.png",
			Description = "A section of an ancient Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Column"] = {
			Name = "Orokin Ruins Column",
			Image = "DecoOrokinRuinsColumn.png",
			Description = "An ancient piece of an Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Fluid"] = {
			Name = "Orokin Ruins Fluid",
			Image = "DecoOrokinRuinsFluid.png",
			Description = "Coagulated fluid that seeped from ancient Orokin bridges.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Long Bridge"] = {
			Name = "Orokin Ruins Long Bridge",
			Image = "DecoOrokinRuinsLongBridge.png",
			Description = "A section of an ancient Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Pole"] = {
			Name = "Orokin Ruins Pole",
			Image = "DecoOrokinRuinsPole.png",
			Description = "A damaged pole the Orokin once used to support a transport system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Ruins Short Bridge"] = {
			Name = "Orokin Ruins Short Bridge",
			Image = "DecoOrokinRuinsShortBridge.png",
			Description = "A section of an ancient Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Bridge"] = {
			Name = "Orokin Tower Bridge",
			Image = "DecoOrokinTowerBridge.png",
			Description = "A bridge that connects Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Bridge Ornament"] = {
			Name = "Orokin Tower Bridge Ornament",
			Image = "DecoOrokinTowerBridgeOrnament.png",
			Description = "An ornament found on the tops of Orokin bridges.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Bridge Path"] = {
			Name = "Orokin Tower Bridge Path",
			Image = "DecoOrokinTowerBridgePath.png",
			Description = "The top section of a bridge that connects Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Column"] = {
			Name = "Orokin Tower Column",
			Image = "DecoOrokinTowerColumn.png",
			Description = "A piece of an Orokin bridge.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Embellishment"] = {
			Name = "Orokin Tower Embellishment",
			Image = "DecoOrokinTowerEmbellishment.png",
			Description = "A golden embellishment found on Orokin bridges.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Ornament"] = {
			Name = "Orokin Tower Ornament",
			Image = "DecoOrokinTowerOrnament.png",
			Description = "A decorative piece of an Orokin tower.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Pole"] = {
			Name = "Orokin Tower Pole",
			Image = "DecoOrokinTowerPole.png",
			Description = "A pole the Orokin used to support a transport system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Orokin Tower Pole With Supports"] = {
			Name = "Orokin Tower Pole With Supports",
			Image = "DecoOrokinTowerPoleWithSupports.png",
			Description = "A pole the Orokin used to support a transport system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Basket (Large)"] = {
			Name = "Ostron Basket (Large)",
			Image = "DecoOstronBasket(Large).png",
			Description = "An empty open rim basket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Basket (Medium)"] = {
			Name = "Ostron Basket (Medium)",
			Image = "DecoOstronBasket(Medium).png",
			Description = "An empty open rim basket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Basket (Shell)"] = {
			Name = "Ostron Basket (Shell)",
			Image = "DecoOstronBasket(Shell).png",
			Description = "An empty open rim basket with shell casing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Basket (Small)"] = {
			Name = "Ostron Basket (Small)",
			Image = "DecoOstronBasket(Small).png",
			Description = "An empty open rim basket.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Cutlet"] = {
			Name = "Ostron Blubber Cutlet",
			Image = "DecoOstronBlubberCutlet.png",
			Description = "A cutlet of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Fascia"] = {
			Name = "Ostron Blubber Fascia",
			Image = "DecoOstronBlubberFascia.png",
			Description = "A large chunk of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Fillet"] = {
			Name = "Ostron Blubber Fillet",
			Image = "DecoOstronBlubberFillet.png",
			Description = "A fillet of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Onomi"] = {
			Name = "Ostron Blubber Onomi",
			Image = "DecoOstronBlubberOnomi.png",
			Description = "An onomi cut of blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Pile (Large)"] = {
			Name = "Ostron Blubber Pile (Large)",
			Image = "DecoOstronBlubberPile(Large).png",
			Description = "A pile of blubber slabs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Pile (Small)"] = {
			Name = "Ostron Blubber Pile (Small)",
			Image = "DecoOstronBlubberPile(Small).png",
			Description = "A couple of blubber slabs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Blubber Processor"] = {
			Name = "Ostron Blubber Processor",
			Image = "DecoOstronBlubberProcessor.png",
			Description = "This machine processes harvested blubber.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Bottles"] = {
			Name = "Ostron Bottles",
			Image = "DecoOstronBottles.png",
			Description = "A collection of bottles common to the Cetus marketplace.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Bulb"] = {
			Name = "Ostron Bulb",
			Image = "DecoOstronBulb.png",
			Description = "A bulb used in lanterns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Bulbs"] = {
			Name = "Ostron Bulbs",
			Image = "DecoOstronBulbs.png",
			Description = "A set of bulbs used in Ostron lanterns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Bulletin Board (Large)"] = {
			Name = "Ostron Bulletin Board (Large)",
			Image = "DecoOstronBulletinBoard(Large).png",
			Description = "A large bulletin board common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Bulletin Board (Small)"] = {
			Name = "Ostron Bulletin Board (Small)",
			Image = "DecoOstronBulletinBoard(Small).png",
			Description = "A small bulletin board common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Cable"] = {
			Name = "Ostron Cable",
			Image = "DecoOstronCable.png",
			Description = "A straight cable.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Cable Cluster"] = {
			Name = "Ostron Cable Cluster",
			Image = "DecoOstronCableCluster.png",
			Description = "Five suspended cables.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Cable Pair"] = {
			Name = "Ostron Cable Pair",
			Image = "DecoOstronCablePair.png",
			Description = "Two suspended cables.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Blue (Curved)"] = {
			Name = "Ostron Canopy, Blue (Curved)",
			Image = "DecoOstronCanopy,Blue(Curved).png",
			Description = "A large blue curved canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Blue (Rectangular)"] = {
			Name = "Ostron Canopy, Blue (Rectangular)",
			Image = "DecoOstronCanopy,Blue(Rectangular).png",
			Description = "A large blue rectangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Blue (Triangular)"] = {
			Name = "Ostron Canopy, Blue (Triangular)",
			Image = "DecoOstronCanopy,Blue(Triangular).png",
			Description = "A blue triangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Green (Curved)"] = {
			Name = "Ostron Canopy, Green (Curved)",
			Image = "DecoOstronCanopy,Green(Curved).png",
			Description = "A large green curved canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Green (Rectangular)"] = {
			Name = "Ostron Canopy, Green (Rectangular)",
			Image = "DecoOstronCanopy,Green(Rectangular).png",
			Description = "A large green rectangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Green (Triangular)"] = {
			Name = "Ostron Canopy, Green (Triangular)",
			Image = "DecoOstronCanopy,Green(Triangular).png",
			Description = "A green triangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Red (Curved)"] = {
			Name = "Ostron Canopy, Red (Curved)",
			Image = "DecoOstronCanopy,Red(Curved).png",
			Description = "A large red curved canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Red (Rectangular)"] = {
			Name = "Ostron Canopy, Red (Rectangular)",
			Image = "DecoOstronCanopy,Red(Rectangular).png",
			Description = "A large red rectangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Canopy, Red (Triangular)"] = {
			Name = "Ostron Canopy, Red (Triangular)",
			Image = "DecoOstronCanopy,Red(Triangular).png",
			Description = "A red triangular canopy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Chimney"] = {
			Name = "Ostron Chimney",
			Image = "DecoOstronChimney.png",
			Description = "A piece of pipe used as a chimney in Cetus dwellings.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Cooking Pots Pile"] = {
			Name = "Ostron Cooking Pots Pile",
			Image = "DecoOstronCookingPotsPile.png",
			Description = "A pile of metal cooking pots.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Cooking Shelter"] = {
			Name = "Ostron Cooking Shelter",
			Image = "DecoOstronCookingShelter.png",
			Description = "A shelter used for outdoor cooking in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Dwelling (Large)"] = {
			Name = "Ostron Dwelling (Large)",
			Image = "DecoOstronDwelling(Large).png",
			Description = "A common structure for homes in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Dwelling (Small)"] = {
			Name = "Ostron Dwelling (Small)",
			Image = "DecoOstronDwelling(Small).png",
			Description = "A common structure for homes in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Explosive"] = {
			Name = "Ostron Explosive",
			Image = "DecoOstronExplosive.png",
			Description = "Designed for controlled explosions.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fence (2m)"] = {
			Name = "Ostron Fence (2m)",
			Image = "DecoOstronFence(2m).png",
			Description = "A section of wooden fence.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fence (8m)"] = {
			Name = "Ostron Fence (8m)",
			Image = "DecoOstronFence(8m).png",
			Description = "A section of wooden fence.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fence Post Reinforced"] = {
			Name = "Ostron Fence Post Reinforced",
			Image = "DecoOstronFencePostReinforced.png",
			Description = "A fence post reinforced with material retrieved from Orokin debris in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fence Post Wooden"] = {
			Name = "Ostron Fence Post Wooden",
			Image = "DecoOstronFencePostWooden.png",
			Description = "A wooden fence post.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fire Pit"] = {
			Name = "Ostron Fire Pit",
			Image = "DecoOstronFirePit.png",
			Description = "Stones and metal arranged for a cooking fire.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fish Head Cut (Large)"] = {
			Name = "Ostron Fish Head Cut (Large)",
			Image = "DecoOstronFishHeadCut(Large).png",
			Description = "A freshly cut fish without its jaw.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fish Head Cut (Small)"] = {
			Name = "Ostron Fish Head Cut (Small)",
			Image = "DecoOstronFishHeadCut(Small).png",
			Description = "The top of a fish head hanging on a hook.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fish Head Full"] = {
			Name = "Ostron Fish Head Full",
			Image = "DecoOstronFishHeadFull.png",
			Description = "A fish head hanging on a hook.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fish Hook"] = {
			Name = "Ostron Fish Hook",
			Image = "DecoOstronFishHook.png",
			Description = "A hook to display fish in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Fish Tail"] = {
			Name = "Ostron Fish Tail",
			Image = "DecoOstronFishTail.png",
			Description = "The tail of a fish hanging on a hook.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Flag (Cetus)"] = {
			Name = "Ostron Flag (Cetus)",
			Image = "DecoOstronFlag(Cetus).png",
			Description = "A flag reminiscent of Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Flag (Ocean)"] = {
			Name = "Ostron Flag (Ocean)",
			Image = "DecoOstronFlag(Ocean).png",
			Description = "A blue flag reminiscent of Earth's oceans.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Flag (Plains)"] = {
			Name = "Ostron Flag (Plains)",
			Image = "DecoOstronFlag(Plains).png",
			Description = "A green flag reminiscent of the vast Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Flag (Sun)"] = {
			Name = "Ostron Flag (Sun)",
			Image = "DecoOstronFlag(Sun).png",
			Description = "A red flag reminiscent of the sun's rays.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Flag Pole"] = {
			Name = "Ostron Flag Pole",
			Image = "DecoOstronFlagPole.png",
			Description = "A pole used to fly flags in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Hauling Balloon (Purple)"] = {
			Name = "Ostron Hauling Balloon (Purple)",
			Image = "DecoOstronHaulingBalloon(Purple).png",
			Description = "A purple hauling balloon used to transport items in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Hauling Balloon (Red)"] = {
			Name = "Ostron Hauling Balloon (Red)",
			Image = "DecoOstronHaulingBalloon(Red).png",
			Description = "A red hauling balloon used to transport items in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Home Blau Rug"] = {
			Name = "Ostron Home Blau Rug",
			Image = "DecoOstronHomeBlauRug.png",
			Description = "A common Ostron rug.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Home Blau Rug Rolled"] = {
			Name = "Ostron Home Blau Rug Rolled",
			Image = "DecoOstronHomeBlauRugRolled.png",
			Description = "A common Ostron rug.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Lantern (Grounded)"] = {
			Name = "Ostron Lantern (Grounded)",
			Image = "DecoOstronLantern(Grounded).png",
			Description = "A lantern that hangs from a pole fixed to the ground.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Lantern (Hanging)"] = {
			Name = "Ostron Lantern (Hanging)",
			Image = "DecoOstronLantern(Hanging).png",
			Description = "A lantern that hangs from a rope.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Lanterns (Strung)"] = {
			Name = "Ostron Lanterns (Strung)",
			Image = "DecoOstronLanterns(Strung).png",
			Description = "A string of lanterns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Light Post"] = {
			Name = "Ostron Light Post",
			Image = "DecoOstronLightPost.png",
			Description = "A light post common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Lighting Stand (Large)"] = {
			Name = "Ostron Lighting Stand (Large)",
			Image = "DecoOstronLightingStand(Large).png",
			Description = "A foundation for light fixtures in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Awning (Large)"] = {
			Name = "Ostron Market Awning (Large)",
			Image = "DecoOstronMarketAwning(Large).png",
			Description = "A large market stall awning common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Awning (Small)"] = {
			Name = "Ostron Market Awning (Small)",
			Image = "DecoOstronMarketAwning(Small).png",
			Description = "A small market stall awning common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Awning Cloth"] = {
			Name = "Ostron Market Awning Cloth",
			Image = "DecoOstronMarketAwningCloth.png",
			Description = "A stylish addition to market displays.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Display Pile"] = {
			Name = "Ostron Market Display Pile",
			Image = "DecoOstronMarketDisplayPile.png",
			Description = "A pile of unused and damaged market display stands.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Display Stand"] = {
			Name = "Ostron Market Display Stand",
			Image = "DecoOstronMarketDisplayStand.png",
			Description = "An angled stand used to display market wares in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Hanging Rack"] = {
			Name = "Ostron Market Hanging Rack",
			Image = "DecoOstronMarketHangingRack.png",
			Description = "A hanging rack used to display fabrics in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Sign (Large)"] = {
			Name = "Ostron Market Sign (Large)",
			Image = "DecoOstronMarketSign(Large).png",
			Description = "A board of painted wood to promote a vendor's wares.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Sign (Small)"] = {
			Name = "Ostron Market Sign (Small)",
			Image = "DecoOstronMarketSign(Small).png",
			Description = "A board of painted wood to promote a vendor's wares.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Stall"] = {
			Name = "Ostron Market Stall",
			Image = "DecoOstronMarketStall.png",
			Description = "A stall for market vendors in Cetus",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Stall With Counter"] = {
			Name = "Ostron Market Stall With Counter",
			Image = "DecoOstronMarketStallWithCounter.png",
			Description = "A counter used by vendors in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Stall With Shelves"] = {
			Name = "Ostron Market Stall With Shelves",
			Image = "DecoOstronMarketStallWithShelves.png",
			Description = "A counter with shelves used by vendors in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Tarp Stand"] = {
			Name = "Ostron Market Tarp Stand",
			Image = "DecoOstronMarketTarpStand.png",
			Description = "A stand made of tarps for vendors in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Market Tarp Stand, With Shelves"] = {
			Name = "Ostron Market Tarp Stand, With Shelves",
			Image = "DecoOstronMarketTarpStand,WithShelves.png",
			Description = "A stand made of tarps for vendors in the Cetus market.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Meat, Flank Cut"] = {
			Name = "Ostron Meat, Flank Cut",
			Image = "DecoOstronMeat,FlankCut.png",
			Description = "A flank cut of meat.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Meat, Loin Cut"] = {
			Name = "Ostron Meat, Loin Cut",
			Image = "DecoOstronMeat,LoinCut.png",
			Description = "A loin cut of meat.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Metal Pot"] = {
			Name = "Ostron Metal Pot",
			Image = "DecoOstronMetalPot.png",
			Description = "A large cooking pot.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Metal Skillet"] = {
			Name = "Ostron Metal Skillet",
			Image = "DecoOstronMetalSkillet.png",
			Description = "A cooking skillet.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Metal Skillet Lid"] = {
			Name = "Ostron Metal Skillet Lid",
			Image = "DecoOstronMetalSkilletLid.png",
			Description = "A lid for a cooking skillet.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Metal Skillet With Lid"] = {
			Name = "Ostron Metal Skillet With Lid",
			Image = "DecoOstronMetalSkilletWithLid.png",
			Description = "A cooking skillet covered by its lid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Particle Trap"] = {
			Name = "Ostron Particle Trap",
			Image = "DecoOstronParticleTrap.png",
			Description = "A trap used to collect free-floating particles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Platform (Planks With Shell)"] = {
			Name = "Ostron Platform (Planks With Shell)",
			Image = "DecoOstronPlatform(PlanksWithShell).png",
			Description = "A sturdy wooden platform.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Platform (Planks)"] = {
			Name = "Ostron Platform (Planks)",
			Image = "DecoOstronPlatform(Planks).png",
			Description = "A sturdy wooden platform.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Platform (Shell With Planks)"] = {
			Name = "Ostron Platform (Shell With Planks)",
			Image = "DecoOstronPlatform(ShellWithPlanks).png",
			Description = "A platform reinforced with material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Platform (Shell)"] = {
			Name = "Ostron Platform (Shell)",
			Image = "DecoOstronPlatform(Shell).png",
			Description = "A platform reinforced with material harvested from Orokin towers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Rodent Trap"] = {
			Name = "Ostron Rodent Trap",
			Image = "DecoOstronRodentTrap.png",
			Description = "A trap that catches small rodents.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Bowl"] = {
			Name = "Ostron Shell Bowl",
			Image = "DecoOstronShellBowl.png",
			Description = "A bowl made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Cup"] = {
			Name = "Ostron Shell Cup",
			Image = "DecoOstronShellCup.png",
			Description = "A cup made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Gourd (Short)"] = {
			Name = "Ostron Shell Gourd (Short)",
			Image = "DecoOstronShellGourd(Short).png",
			Description = "A gourd made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Gourd (Tall)"] = {
			Name = "Ostron Shell Gourd (Tall)",
			Image = "DecoOstronShellGourd(Tall).png",
			Description = "A gourd made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Jar"] = {
			Name = "Ostron Shell Jar",
			Image = "DecoOstronShellJar.png",
			Description = "A jar made from harvested shells with a blue stain.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Jug (Large)"] = {
			Name = "Ostron Shell Jug (Large)",
			Image = "DecoOstronShellJug(Large).png",
			Description = "A jug made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Jug (Small)"] = {
			Name = "Ostron Shell Jug (Small)",
			Image = "DecoOstronShellJug(Small).png",
			Description = "A jug made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Kettle"] = {
			Name = "Ostron Shell Kettle",
			Image = "DecoOstronShellKettle.png",
			Description = "A kettle made from harvested shells with a blue stain.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Pitcher"] = {
			Name = "Ostron Shell Pitcher",
			Image = "DecoOstronShellPitcher.png",
			Description = "A pitcher made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Plate"] = {
			Name = "Ostron Shell Plate",
			Image = "DecoOstronShellPlate.png",
			Description = "A plate made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Shell Platter"] = {
			Name = "Ostron Shell Platter",
			Image = "DecoOstronShellPlatter.png",
			Description = "A shallow serving platter made from harvested shells with a blue stain.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Sign (Fish)"] = {
			Name = "Ostron Sign (Fish)",
			Image = "DecoOstronSign(Fish).png",
			Description = "A banner sign advertising fish.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Sign (Fruit)"] = {
			Name = "Ostron Sign (Fruit)",
			Image = "DecoOstronSign(Fruit).png",
			Description = "A banner sign advertising fruit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Sign Post"] = {
			Name = "Ostron Sign Post",
			Image = "DecoOstronSignPost.png",
			Description = "A post for handing banner signs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Smoking Pipe"] = {
			Name = "Ostron Smoking Pipe",
			Image = "DecoOstronSmokingPipe.png",
			Description = "Packed with fine mulala twigs.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Spice Canister"] = {
			Name = "Ostron Spice Canister",
			Image = "DecoOstronSpiceCanister.png",
			Description = "A canister full of spices that compliment fish-based dishes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Staff"] = {
			Name = "Ostron Staff",
			Image = "DecoOstronStaff.png",
			Description = "Useful for long walks.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Staff Drill Attachment"] = {
			Name = "Ostron Staff Drill Attachment",
			Image = "DecoOstronStaffDrillAttachment.png",
			Description = "Your staff becomes a useful building tool with this attachments.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Staff With Hooks"] = {
			Name = "Ostron Staff With Hooks",
			Image = "DecoOstronStaffWithHooks.png",
			Description = "Useful for extending your reach.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Stairs"] = {
			Name = "Ostron Stairs",
			Image = "DecoOstronStairs.png",
			Description = "Stairs constructed from wood and shell materials that are common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Table"] = {
			Name = "Ostron Table",
			Image = "DecoOstronTable.png",
			Description = "A table made from harvested shells.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Table Slab"] = {
			Name = "Ostron Table Slab",
			Image = "DecoOstronTableSlab.png",
			Description = "A slab of shell used as a tabletop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Concave Blue)"] = {
			Name = "Ostron Tarp (Concave Blue)",
			Image = "DecoOstronTarp(ConcaveBlue).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Concave Green)"] = {
			Name = "Ostron Tarp (Concave Green)",
			Image = "DecoOstronTarp(ConcaveGreen).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Concave Red)"] = {
			Name = "Ostron Tarp (Concave Red)",
			Image = "DecoOstronTarp(ConcaveRed).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Parallel Blue)"] = {
			Name = "Ostron Tarp (Parallel Blue)",
			Image = "DecoOstronTarp(ParallelBlue).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Parallel Green)"] = {
			Name = "Ostron Tarp (Parallel Green)",
			Image = "DecoOstronTarp(ParallelGreen).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tarp (Parallel Red)"] = {
			Name = "Ostron Tarp (Parallel Red)",
			Image = "DecoOstronTarp(ParallelRed).png",
			Description = "This sturdy material guards against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tether (15m)"] = {
			Name = "Ostron Tether (15m)",
			Image = "DecoOstronTether(15m).png",
			Description = "A tether rope 15m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tether (5m)"] = {
			Name = "Ostron Tether (5m)",
			Image = "DecoOstronTether(5m).png",
			Description = "A tether rope 5m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tool Base"] = {
			Name = "Ostron Tool Base",
			Image = "DecoOstronToolBase.png",
			Description = "A versatile tool that fits multiple attachments.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Tool Drill"] = {
			Name = "Ostron Tool Drill",
			Image = "DecoOstronToolDrill.png",
			Description = "A drill used to builds structures in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Wind Chime"] = {
			Name = "Ostron Wind Chime",
			Image = "DecoOstronWindChime.png",
			Description = "A decorative wind chime.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Wooden Crate"] = {
			Name = "Ostron Wooden Crate",
			Image = "DecoOstronWoodenCrate.png",
			Description = "A simple wooden crate.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Wooden Planks (2m)"] = {
			Name = "Ostron Wooden Planks (2m)",
			Image = "DecoOstronWoodenPlanks(2m).png",
			Description = "Wooden planks fixed together.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Wooden Planks (4m)"] = {
			Name = "Ostron Wooden Planks (4m)",
			Image = "DecoOstronWoodenPlanks(4m).png",
			Description = "Wooden planks fixed together.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Awning (Large)"] = {
			Name = "Ostron Workshop Awning (Large)",
			Image = "DecoOstronWorkshopAwning(Large).png",
			Description = "Enjoy shade and cover from rain in your workshop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Awning (Small)"] = {
			Name = "Ostron Workshop Awning (Small)",
			Image = "DecoOstronWorkshopAwning(Small).png",
			Description = "Enjoy shade and cover from rain in your workshop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Frame (Large)"] = {
			Name = "Ostron Workshop Frame (Large)",
			Image = "DecoOstronWorkshopFrame(Large).png",
			Description = "The first step in building a workshop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Frame (Small)"] = {
			Name = "Ostron Workshop Frame (Small)",
			Image = "DecoOstronWorkshopFrame(Small).png",
			Description = "The first step in building a workshop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Shelf (Large)"] = {
			Name = "Ostron Workshop Shelf (Large)",
			Image = "DecoOstronWorkshopShelf(Large).png",
			Description = "A modular shelf used in workshops.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Shelf (Small)"] = {
			Name = "Ostron Workshop Shelf (Small)",
			Image = "DecoOstronWorkshopShelf(Small).png",
			Description = "A modular shelf used in workshops.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Stall"] = {
			Name = "Ostron Workshop Stall",
			Image = "DecoOstronWorkshopStall.png",
			Description = "This type of workshop is common in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Wall (Cloth)"] = {
			Name = "Ostron Workshop Wall (Cloth)",
			Image = "DecoOstronWorkshopWall(Cloth).png",
			Description = "A small tarp to guard against the elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ostron Workshop Wall (Solid)"] = {
			Name = "Ostron Workshop Wall (Solid)",
			Image = "DecoOstronWorkshopWall(Solid).png",
			Description = "A sturdy wall for workshops.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Scaffold (Small Wall Mounted, Ostron)"] = {
			Name = "Scaffold (Small Wall Mounted, Ostron)",
			Image = "DecoScaffold(SmallWallMounted,Ostron).png",
			Description = "A small wooden wall mounted scaffold.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold (Tall, Ostron)"] = {
			Name = "Scaffold (Tall, Ostron)",
			Image = "DecoScaffold(Tall,Ostron).png",
			Description = "A tall wooden scaffold made by the Ostron people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold (Wall Mounted, Ostron)"] = {
			Name = "Scaffold (Wall Mounted, Ostron)",
			Image = "DecoScaffold(WallMounted,Ostron).png",
			Description = "A wooden wall mounted scaffold.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold (With Ramps, Ostron)"] = {
			Name = "Scaffold (With Ramps, Ostron)",
			Image = "DecoScaffold(WithRamps,Ostron).png",
			Description = "A large scaffold structure with ramps made by the Ostron people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold Beam (Ostron)"] = {
			Name = "Scaffold Beam (Ostron)",
			Image = "DecoScaffoldBeam(Ostron).png",
			Description = "A wooden beam used in scaffolds.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold Debris (Ostron)"] = {
			Name = "Scaffold Debris (Ostron)",
			Image = "DecoScaffoldDebris(Ostron).png",
			Description = "A pile of debris consisting of wooden scaffold elements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold Platform (Ostron)"] = {
			Name = "Scaffold Platform (Ostron)",
			Image = "DecoScaffoldPlatform(Ostron).png",
			Description = "A wooden scaffold made by the Ostron people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Scaffold Ramp (Ostron)"] = {
			Name = "Scaffold Ramp (Ostron)",
			Image = "DecoScaffoldRamp(Ostron).png",
			Description = "A wooden scaffolding ramp made by the Ostron people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Toy Grakata"] = {
			Name = "Toy Grakata",
			Image = "DecoToyGrakata.png",
			Description = "A beloved toy for children in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Toy Skana"] = {
			Name = "Toy Skana",
			Image = "DecoToySkana.png",
			Description = "A beloved toy for children in Cetus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		}
	},
	Sentient = {
		["Narmer All Seeing Eye"] = {
			Name = "Narmer All Seeing Eye",
			Image = "DecoNarmerAllSeeingEye.png",
			Description = "The Narmer all seeing eye.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Banner (Long)"] = {
			Name = "Narmer Banner (Long)",
			Image = "DecoNarmerBanner(Long).png",
			Description = "A long version of a banner used in Narmer propaganda.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Banner (Short)"] = {
			Name = "Narmer Banner (Short)",
			Image = "DecoNarmerBanner(Short).png",
			Description = "A short version of a banner used in Narmer propaganda.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Ceremonial Pillar"] = {
			Name = "Narmer Ceremonial Pillar",
			Image = "DecoNarmerCeremonialPillar.png",
			Description = "A large pillar used in ceremonial Narmer architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Combat Barrier"] = {
			Name = "Narmer Combat Barrier",
			Image = "DecoNarmerCombatBarrier.png",
			Description = "A barrier used by the Narmer to protect combatants in battle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Control Barrier"] = {
			Name = "Narmer Control Barrier",
			Image = "DecoNarmerControlBarrier.png",
			Description = "A barrier used to control personnel in certain areas.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Control Point Pillar"] = {
			Name = "Narmer Control Point Pillar",
			Image = "DecoNarmerControlPointPillar.png",
			Description = "A marker used by the Narmer to mark control points.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Spire"] = {
			Name = "Narmer Spire",
			Image = "DecoNarmerSpire.png",
			Description = "A Spire in the Narmer style.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Straight Support Pillar"] = {
			Name = "Narmer Straight Support Pillar",
			Image = "DecoNarmerStraightSupportPillar.png",
			Description = "A large straight support pillar used in Narmer architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Support Column"] = {
			Name = "Narmer Support Column",
			Image = "DecoNarmerSupportColumn.png",
			Description = "A large Narmer support column.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Narmer Support Pillar"] = {
			Name = "Narmer Support Pillar",
			Image = "DecoNarmerSupportPillar.png",
			Description = "A large pillar used in Narmer architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Ossified Sentient Hinge Joint"] = {
			Name = "Ossified Sentient Hinge Joint",
			Image = "DecoOssifiedSentientHingeJoint.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ossified Sentient Horns"] = {
			Name = "Ossified Sentient Horns",
			Image = "DecoOssifiedSentientHorns.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ossified Sentient Monolith"] = {
			Name = "Ossified Sentient Monolith",
			Image = "DecoOssifiedSentientMonolith.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ossified Sentient Ribs"] = {
			Name = "Ossified Sentient Ribs",
			Image = "DecoOssifiedSentientRibs.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ossified Sentient Saddle Joint"] = {
			Name = "Ossified Sentient Saddle Joint",
			Image = "DecoOssifiedSentientSaddleJoint.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Ossified Sentient Totem"] = {
			Name = "Ossified Sentient Totem",
			Image = "DecoOssifiedSentientTotem.png",
			Description = "These ancient remains can be found across the Plains of Eidolon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 375,
				Resources = {
					{ Count = 225, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 75, Name = "Rubedo" },
					{ Count = 0.05, Name = "Morphics" }
				}
			}
		},
		["Sentient Animated Biofluid"] = {
			Name = "Sentient Animated Biofluid",
			Image = "DecoSentientAnimatedBiofluid.png",
			Description = "Sentient fluid that is animated.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Biomass Feeder (Single Constricted)"] = {
			Name = "Sentient Biomass Feeder (Single Constricted)",
			Image = "DecoSentientBiomassFeeder(SingleConstricted).png",
			Description = "A large single biomass feeder root that is constricted and made of Sentient fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Biomass Feeder (Single)"] = {
			Name = "Sentient Biomass Feeder (Single)",
			Image = "DecoSentientBiomassFeeder(Single).png",
			Description = "A large single biomass feeder root made of Sentient fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Biomass Feeder (Twins)"] = {
			Name = "Sentient Biomass Feeder (Twins)",
			Image = "DecoSentientBiomassFeeder(Twins).png",
			Description = "A large pair of biomass feeder roots made of Sentient fluid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Bridge Structure"] = {
			Name = "Sentient Bridge Structure",
			Image = "DecoSentientBridgeStructure.png",
			Description = "A large bridge or ramp used by Sentients.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Dark Grey Fang"] = {
			Name = "Sentient Dark Grey Fang",
			Image = "DecoSentientDarkGreyFang.png",
			Description = "A large dark grey-faced fang from a large Sentient.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Door Frame (Closed)"] = {
			Name = "Sentient Door Frame (Closed)",
			Image = "DecoSentientDoorFrame(Closed).png",
			Description = "A very large door frame built by the Sentients.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Energy Battery"] = {
			Name = "Sentient Energy Battery",
			Image = "DecoSentientEnergyBattery.png",
			Description = "A large Sentient component that stores energy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Energy Orb"] = {
			Name = "Sentient Energy Orb",
			Image = "DecoSentientEnergyOrb.png",
			Description = "A large orb made of Sentient energy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sentient Horn"] = {
			Name = "Sentient Horn",
			Image = "DecoSentientHorn.png",
			Description = "A small Sentient horn.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Hunhow Rib"] = {
			Name = "Sentient Hunhow Rib",
			Image = "DecoSentientHunhowRib.png",
			Description = "A small rib from a large Hunhow.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Interface"] = {
			Name = "Sentient Interface",
			Image = "DecoSentientInterface.png",
			Description = "A Sentient communication interface.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Launching Platform"] = {
			Name = "Sentient Launching Platform",
			Image = "DecoSentientLaunchingPlatform.png",
			Description = "A large platform that launches Sentient beings.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Light Fixture"] = {
			Name = "Sentient Light Fixture",
			Image = "DecoSentientLightFixture.png",
			Description = "A small light fixture from the Sentients.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sentient Light Fixture Base"] = {
			Name = "Sentient Light Fixture Base",
			Image = "DecoSentientLightFixtureBase.png",
			Description = "A small Sentient light fixture base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Light Fixture Base (Corner)"] = {
			Name = "Sentient Light Fixture Base (Corner)",
			Image = "DecoSentientLightFixtureBase(Corner).png",
			Description = "A Sentient light fixture base used in corners.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Light Fixture Horns"] = {
			Name = "Sentient Light Fixture Horns",
			Image = "DecoSentientLightFixtureHorns.png",
			Description = "A large Sentient light fixture base with horns.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Monolith"] = {
			Name = "Sentient Monolith",
			Image = "DecoSentientMonolith.png",
			Description = "A very large Sentient monolith.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Monolith (Damaged)"] = {
			Name = "Sentient Monolith (Damaged)",
			Image = "DecoSentientMonolith(Damaged).png",
			Description = "A very large Sentient monolith that has been damaged and is self-healing.",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Monolith Fragment"] = {
			Name = "Sentient Monolith Fragment",
			Image = "DecoSentientMonolithFragment.png",
			Description = "A very large monolith fragment that is self-healing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Pod"] = {
			Name = "Sentient Pod",
			Image = "DecoSentientPod.png",
			Description = "A small Sentient pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Rib"] = {
			Name = "Sentient Rib",
			Image = "DecoSentientRib.png",
			Description = "A rib from a large Sentient.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Sacrificial Altar"] = {
			Name = "Sentient Sacrificial Altar",
			Image = "DecoSentientSacrificialAltar.png",
			Description = "A large Sentient altar used in sacrificial ceremonies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Sacrificial Ornate Ramp"] = {
			Name = "Sentient Sacrificial Ornate Ramp",
			Image = "DecoSentientSacrificialOrnateRamp.png",
			Description = "A Sentient structure used in sacrificial ceremonies for higher ranks.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Sacrificial Pillar"] = {
			Name = "Sentient Sacrificial Pillar",
			Image = "DecoSentientSacrificialPillar.png",
			Description = "A sacrificial Sentient pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Sacrificial Pillar (Short)"] = {
			Name = "Sentient Sacrificial Pillar (Short)",
			Image = "DecoSentientSacrificialPillar(Short).png",
			Description = "A short sacrificial Sentient pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Sacrificial Pillar (Tall)"] = {
			Name = "Sentient Sacrificial Pillar (Tall)",
			Image = "DecoSentientSacrificialPillar(Tall).png",
			Description = "A tall sacrificial Sentient pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Sacrificial Plank (Large)"] = {
			Name = "Sentient Sacrificial Plank (Large)",
			Image = "DecoSentientSacrificialPlank(Large).png",
			Description = "A very large Sentient plank used during ceremonies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Sacrificial Plank (Small)"] = {
			Name = "Sentient Sacrificial Plank (Small)",
			Image = "DecoSentientSacrificialPlank(Small).png",
			Description = "A small Sentient plank used during ceremonies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Sacrificial Ramp (Small)"] = {
			Name = "Sentient Sacrificial Ramp (Small)",
			Image = "DecoSentientSacrificialRamp(Small).png",
			Description = "A small Sentient structure used in sacrificial ceremonies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Sacrificial Shield"] = {
			Name = "Sentient Sacrificial Shield",
			Image = "DecoSentientSacrificialShield.png",
			Description = "A Sentient sacrificial shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Shield"] = {
			Name = "Sentient Shield",
			Image = "DecoSentientShield.png",
			Description = "A Sentient shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Shield (Short)"] = {
			Name = "Sentient Shield (Short)",
			Image = "DecoSentientShield(Short).png",
			Description = "A short Sentient shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Shield (Thin)"] = {
			Name = "Sentient Shield (Thin)",
			Image = "DecoSentientShield(Thin).png",
			Description = "A large thin Sentient shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Shield (Wide)"] = {
			Name = "Sentient Shield (Wide)",
			Image = "DecoSentientShield(Wide).png",
			Description = "A wide Sentient shield.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Statue Horns"] = {
			Name = "Sentient Statue Horns",
			Image = "DecoSentientStatueHorns.png",
			Description = "A small set of horns used on a Sentient statue.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Statue Horns (Grey)"] = {
			Name = "Sentient Statue Horns (Grey)",
			Image = "DecoSentientStatueHorns(Grey).png",
			Description = "A small set of grey horns used on a Sentient statue.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Statue Horns (Thin)"] = {
			Name = "Sentient Statue Horns (Thin)",
			Image = "DecoSentientStatueHorns(Thin).png",
			Description = "A large set of thin Sentient horns used on a Sentient statue.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sentient Totem"] = {
			Name = "Sentient Totem",
			Image = "DecoSentientTotem.png",
			Description = "A very large Sentient totem",
			Cost = {
				Capacity = 10,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Sentient Tower Sickle (Large)"] = {
			Name = "Sentient Tower Sickle (Large)",
			Image = "DecoSentientTowerSickle(Large).png",
			Description = "A large Sentient tower shaped as a sickle, a naturally forming shape in many Sentient structures.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Tower Sickle (Medium)"] = {
			Name = "Sentient Tower Sickle (Medium)",
			Image = "DecoSentientTowerSickle(Medium).png",
			Description = "A medium Sentient tower sickle-shaped structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Oxium" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient White Fang"] = {
			Name = "Sentient White Fang",
			Image = "DecoSentientWhiteFang.png",
			Description = "A large white-faced fang from a large Sentient.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sentient Worship Gem"] = {
			Name = "Sentient Worship Gem",
			Image = "DecoSentientWorshipGem.png",
			Description = "A small Sentient worship gem.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Worship Pod"] = {
			Name = "Sentient Worship Pod",
			Image = "DecoSentientWorshipPod.png",
			Description = "A small Sentient worship pod.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sentient Worship Tower"] = {
			Name = "Sentient Worship Tower",
			Image = "DecoSentientWorshipTower.png",
			Description = "A small tower the Sentient use for worship.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		}
	},
	Duviri = {
		["Artisan Abacus (Large)"] = {
			Name = "Artisan Abacus (Large)",
			Image = "DecoArtisanAbacus(Large).png",
			Description = "A large abacus for group presentations.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artisan Abacus Desk"] = {
			Name = "Artisan Abacus Desk",
			Image = "DecoArtisanAbacusDesk.png",
			Description = "The ideal surface for an abacus.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Artisan Clamp"] = {
			Name = "Artisan Clamp",
			Image = "DecoArtisanClamp.png",
			Description = "A small clamp to be used for the artisan endeavors described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artisan Container (Large)"] = {
			Name = "Artisan Container (Large)",
			Image = "DecoArtisanContainer(Large).png",
			Description = "A large container to fill with wood, clay and other materials artisans might find useful.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Artisan Container (Medium)"] = {
			Name = "Artisan Container (Medium)",
			Image = "DecoArtisanContainer(Medium).png",
			Description = "A medium container to fill with wood, clay and other materials artisans might find useful.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Artisan Container (Small)"] = {
			Name = "Artisan Container (Small)",
			Image = "DecoArtisanContainer(Small).png",
			Description = "A small container to fill with wood, clay and other materials artisans might find useful.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Artisan Dummy"] = {
			Name = "Artisan Dummy",
			Image = "DecoArtisanDummy.png",
			Description = "Ideal for weapon testing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Artisan Rug (Common)"] = {
			Name = "Artisan Rug (Common)",
			Image = "DecoArtisanRug(Common).png",
			Description = "This rug was lovingly woven for a modest home.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Artisan Rug (Elite)"] = {
			Name = "Artisan Rug (Elite)",
			Image = "DecoArtisanRug(Elite).png",
			Description = "This rug was carefully woven for those with elite taste.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Artisan Sundial"] = {
			Name = "Artisan Sundial",
			Image = "DecoArtisanSundial.png",
			Description = "An elegant horologial device.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artisan Tool Rack"] = {
			Name = "Artisan Tool Rack",
			Image = "DecoArtisanToolRack.png",
			Description = "A rack to hold various artisan tools.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Artisan Weapon Rack (Large)"] = {
			Name = "Artisan Weapon Rack (Large)",
			Image = "DecoArtisanWeaponRack(Large).png",
			Description = "A grand weapon storage rack.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Artisan Weapon Rack (Small)"] = {
			Name = "Artisan Weapon Rack (Small)",
			Image = "DecoArtisanWeaponRack(Small).png",
			Description = "A small yet elegant weapon storage rack.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Console Screen Stand"] = {
			Name = "Console Screen Stand",
			Image = "DecoConsoleScreenStand.png",
			Description = "A stand that houses screens from consoles inspired by the regal displays in the Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Dominus Thrax Statue (Bust)"] = {
			Name = "Dominus Thrax Statue (Bust)",
			Image = "DecoDominusThraxStatue(Bust).png",
			Description = "A statue bust of Dominus Thrax from Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Dominus Thrax Statue (Left Hand)"] = {
			Name = "Dominus Thrax Statue (Left Hand)",
			Image = "DecoDominusThraxStatue(LeftHand).png",
			Description = "A statue of Dominus Thrax's left hand, as described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Dominus Thrax Statue (Right Hand)"] = {
			Name = "Dominus Thrax Statue (Right Hand)",
			Image = "DecoDominusThraxStatue(RightHand).png",
			Description = "A statue of Dominus Thrax's right hand, as described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Amphitheater Arch"] = {
			Name = "Duviri Amphitheater Arch",
			Image = "DecoDuviriAmphitheaterArch.png",
			Description = "An amphitheater arch inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Amphitheater Planter Base"] = {
			Name = "Duviri Amphitheater Planter Base",
			Image = "DecoDuviriAmphitheaterPlanterBase.png",
			Description = "A base to support planters in an amphitheater, inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Amphitheater Spire"] = {
			Name = "Duviri Amphitheater Spire",
			Image = "DecoDuviriAmphitheaterSpire.png",
			Description = "A decorative amphitheater spire inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Amphitheater Wall"] = {
			Name = "Duviri Amphitheater Wall",
			Image = "DecoDuviriAmphitheaterWall.png",
			Description = "A short amphitheater wall inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Arch (Tall)"] = {
			Name = "Duviri Arch (Tall)",
			Image = "DecoDuviriArch(Tall).png",
			Description = "A tall arch inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Banner (Large With Bracket)"] = {
			Name = "Duviri Banner (Large With Bracket)",
			Image = "DecoDuviriBanner(LargeWithBracket).png",
			Description = "A large banner with a bracket inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Banner (Large)"] = {
			Name = "Duviri Banner (Large)",
			Image = "DecoDuviriBanner(Large).png",
			Description = "A large banner inspired by the regal displayed described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Banner (Long)"] = {
			Name = "Duviri Banner (Long)",
			Image = "DecoDuviriBanner(Long).png",
			Description = "A long banner inspired by the regal displayed described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Banner (Short)"] = {
			Name = "Duviri Banner (Short)",
			Image = "DecoDuviriBanner(Short).png",
			Description = "A short banner inspired by the regal displayed described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Banner Post"] = {
			Name = "Duviri Banner Post",
			Image = "DecoDuviriBannerPost.png",
			Description = "A post with banners inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Bridge (16m)"] = {
			Name = "Duviri Bridge (16m)",
			Image = "DecoDuviriBridge(16m).png",
			Description = "A 16m road bridge inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Bridge Arch"] = {
			Name = "Duviri Bridge Arch",
			Image = "DecoDuviriBridgeArch.png",
			Description = "A bridge arch inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Bridge Arch Support"] = {
			Name = "Duviri Bridge Arch Support",
			Image = "DecoDuviriBridgeArchSupport.png",
			Description = "A bridge arch support inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Bridge Ramp"] = {
			Name = "Duviri Bridge Ramp",
			Image = "DecoDuviriBridgeRamp.png",
			Description = "A bridge ramp inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Bridge Stanchion"] = {
			Name = "Duviri Bridge Stanchion",
			Image = "DecoDuviriBridgeStanchion.png",
			Description = "A golden stanchion inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Bridge Support"] = {
			Name = "Duviri Bridge Support",
			Image = "DecoDuviriBridgeSupport.png",
			Description = "A white bridge support inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Chime (Long)"] = {
			Name = "Duviri Chime (Long)",
			Image = "DecoDuviriChime(Long).png",
			Description = "A long chime inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Chime (Short)"] = {
			Name = "Duviri Chime (Short)",
			Image = "DecoDuviriChime(Short).png",
			Description = "A short chime inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Church Bell"] = {
			Name = "Duviri Church Bell",
			Image = "DecoDuviriChurchBell.png",
			Description = "A church bell inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Clerical Desk"] = {
			Name = "Duviri Clerical Desk",
			Image = "DecoDuviriClericalDesk.png",
			Description = "Draft and redraft endless bureaucratic scrolls with this fine Duviri desk.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Communications Console"] = {
			Name = "Duviri Communications Console",
			Image = "DecoDuviriCommunicationsConsole.png",
			Description = "This console facilitates long-distance communication.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Console Screen Emitter"] = {
			Name = "Duviri Console Screen Emitter",
			Image = "DecoDuviriConsoleScreenEmitter.png",
			Description = "The screen emitter of a console inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Console Screen Frame"] = {
			Name = "Duviri Console Screen Frame",
			Image = "DecoDuviriConsoleScreenFrame.png",
			Description = "The screen frame from a console inspired by the regal displays in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Dais Drone (Antenna)"] = {
			Name = "Duviri Dais Drone (Antenna)",
			Image = "DecoDuviriDaisDrone(Antenna).png",
			Description = "The antenna of a drone inspired by Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Dais Drone (Body)"] = {
			Name = "Duviri Dais Drone (Body)",
			Image = "DecoDuviriDaisDrone(Body).png",
			Description = "The body of a drone inspired by Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Dais Drone (Ring)"] = {
			Name = "Duviri Dais Drone (Ring)",
			Image = "DecoDuviriDaisDrone(Ring).png",
			Description = "The decorative ring of a drone inspired by Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Fainting Couch"] = {
			Name = "Duviri Fainting Couch",
			Image = "DecoDuviriFaintingCouch.png",
			Description = "For those times when turning into an Orowyrm is not an option.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Flask"] = {
			Name = "Duviri Flask",
			Image = "DecoDuviriFlask.png",
			Description = "A discreet way to have a sip while attending any formal event.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Footbridge"] = {
			Name = "Duviri Footbridge",
			Image = "DecoDuviriFootbridge.png",
			Description = "A pedestrian footbridge inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Footstool"] = {
			Name = "Duviri Footstool",
			Image = "DecoDuviriFootstool.png",
			Description = "Even the lowest Duviri citizen may need to reach a high spot from time to time.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Golden Nook"] = {
			Name = "Duviri Golden Nook",
			Image = "DecoDuviriGoldenNook.png",
			Description = "A curved golden rock inspired by the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Manacles"] = {
			Name = "Duviri Manacles",
			Image = "DecoDuviriManacles.png",
			Description = "Manacles used to confine a prisoner by order of his majesty Dominus Thrax.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Mug"] = {
			Name = "Duviri Mug",
			Image = "DecoDuviriMug.png",
			Description = "Sip from this mug as you assess what the morning sky has in store.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Palace Balcony Carpet"] = {
			Name = "Duviri Palace Balcony Carpet",
			Image = "DecoDuviriPalaceBalconyCarpet.png",
			Description = "A carpet inspired by the descriptions of the king's palace in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Palace Door"] = {
			Name = "Duviri Palace Door",
			Image = "DecoDuviriPalaceDoor.png",
			Description = "A door inspired by the descriptions of the king's palace in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Palace Throne"] = {
			Name = "Duviri Palace Throne",
			Image = "DecoDuviriPalaceThrone.png",
			Description = "A throne inspired by the descriptions of the king's palace in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Palace Throne Base"] = {
			Name = "Duviri Palace Throne Base",
			Image = "DecoDuviriPalaceThroneBase.png",
			Description = "A throne base inspired by the descriptions of the king's palace in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Road Sign"] = {
			Name = "Duviri Road Sign",
			Image = "DecoDuviriRoadSign.png",
			Description = "A sign post inspired by Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Rock (Slab, Spiral)"] = {
			Name = "Duviri Rock (Slab, Spiral)",
			Image = "DecoDuviriRock(Slab,Spiral).png",
			Description = "A spiral-shaped stone slab designed to suit the landscape described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Sailboat"] = {
			Name = "Duviri Sailboat",
			Image = "DecoDuviriSailboat.png",
			Description = "A sailboat designed to traverse the skies, as described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Slipper Chair"] = {
			Name = "Duviri Slipper Chair",
			Image = "DecoDuviriSlipperChair.png",
			Description = "A slipper chair inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Stair Set (Large)"] = {
			Name = "Duviri Stair Set (Large)",
			Image = "DecoDuviriStairSet(Large).png",
			Description = "A large set of stairs inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Stair Set (Small)"] = {
			Name = "Duviri Stair Set (Small)",
			Image = "DecoDuviriStairSet(Small).png",
			Description = "A small set of stairs inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Support (Narrow, Full)"] = {
			Name = "Duviri Support (Narrow, Full)",
			Image = "DecoDuviriSupport(Narrow,Full).png",
			Description = "A full and narrow structural support  inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Duviri Support (Narrow, Half)"] = {
			Name = "Duviri Support (Narrow, Half)",
			Image = "DecoDuviriSupport(Narrow,Half).png",
			Description = "Half of a narrow structural support  inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Support (Wide, Full)"] = {
			Name = "Duviri Support (Wide, Full)",
			Image = "DecoDuviriSupport(Wide,Full).png",
			Description = "A full and wide structural support  inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Duviri Support (Wide, Half)"] = {
			Name = "Duviri Support (Wide, Half)",
			Image = "DecoDuviriSupport(Wide,Half).png",
			Description = "Half of a wide structural support  inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Support Bracket"] = {
			Name = "Duviri Support Bracket",
			Image = "DecoDuviriSupportBracket.png",
			Description = "A golden support bracket inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Duviri Support Bracket (Strap)"] = {
			Name = "Duviri Support Bracket (Strap)",
			Image = "DecoDuviriSupportBracket(Strap).png",
			Description = "A support strap bracket inspired by the regal displays described in Tales of Duviri",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Thermos"] = {
			Name = "Duviri Thermos",
			Image = "DecoDuviriThermos.png",
			Description = "The ideal veseel for any Tammherd who enjoys a hot or cold drink on the job.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Torch (Long)"] = {
			Name = "Duviri Torch (Long)",
			Image = "DecoDuviriTorch(Long).png",
			Description = "A long torch inspired by the regal displays described in Tales of Duviri",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Torch (Round)"] = {
			Name = "Duviri Torch (Round)",
			Image = "DecoDuviriTorch(Round).png",
			Description = "A round torch inspired by the regal displays described in Tales of Duviri",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Duviri Trim (End Cap)"] = {
			Name = "Duviri Trim (End Cap)",
			Image = "DecoDuviriTrim(EndCap).png",
			Description = "A golden trim cap inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Duviri Wall Plaque"] = {
			Name = "Duviri Wall Plaque",
			Image = "DecoDuviriWallPlaque.png",
			Description = "A golden wall plaque inspired by the regal displays described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Awning (16m)"] = {
			Name = "Hamlet Awning (16m)",
			Image = "DecoHamletAwning(16m).png",
			Description = "A 16m awning inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Bench (1m)"] = {
			Name = "Hamlet Bench (1m)",
			Image = "DecoHamletBench(1m).png",
			Description = "A 1m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Bench (4m, Curved)"] = {
			Name = "Hamlet Bench (4m, Curved)",
			Image = "DecoHamletBench(4m,Curved).png",
			Description = "A curved 4m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Bench (4m)"] = {
			Name = "Hamlet Bench (4m)",
			Image = "DecoHamletBench(4m).png",
			Description = "A 4m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Bench (6m, Curved)"] = {
			Name = "Hamlet Bench (6m, Curved)",
			Image = "DecoHamletBench(6m,Curved).png",
			Description = "A curved 6m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Bench (8m, Curved)"] = {
			Name = "Hamlet Bench (8m, Curved)",
			Image = "DecoHamletBench(8m,Curved).png",
			Description = "A curved 8m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Bench (8m)"] = {
			Name = "Hamlet Bench (8m)",
			Image = "DecoHamletBench(8m).png",
			Description = "A 8m bench inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Door"] = {
			Name = "Hamlet Door",
			Image = "DecoHamletDoor.png",
			Description = "A doorway inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Door Frame (Common)"] = {
			Name = "Hamlet Door Frame (Common)",
			Image = "DecoHamletDoorFrame(Common).png",
			Description = "A standard door frame inspired by the hamlets descibed in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Door Frame (Elite)"] = {
			Name = "Hamlet Door Frame (Elite)",
			Image = "DecoHamletDoorFrame(Elite).png",
			Description = "An elite door frame inspired by the hamlets descibed in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Door Frame (Full Gold)"] = {
			Name = "Hamlet Door Frame (Full Gold)",
			Image = "DecoHamletDoorFrame(FullGold).png",
			Description = "A golden door frame inspired by the hamlets descibed in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Door Frame (Gold Trim)"] = {
			Name = "Hamlet Door Frame (Gold Trim)",
			Image = "DecoHamletDoorFrame(GoldTrim).png",
			Description = "A door frame with gold trim inspired by the hamlets descibed in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Door Panel"] = {
			Name = "Hamlet Door Panel",
			Image = "DecoHamletDoorPanel.png",
			Description = "A door panel inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Drinking Fountain"] = {
			Name = "Hamlet Drinking Fountain",
			Image = "DecoHamletDrinkingFountain.png",
			Description = "A public water fountain inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Drinking Fountain Spigot"] = {
			Name = "Hamlet Drinking Fountain Spigot",
			Image = "DecoHamletDrinkingFountainSpigot.png",
			Description = "A public water fountain spigot inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Farm Combine"] = {
			Name = "Hamlet Farm Combine",
			Image = "DecoHamletFarmCombine.png",
			Description = "A farming combine inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Farm Silo"] = {
			Name = "Hamlet Farm Silo",
			Image = "DecoHamletFarmSilo.png",
			Description = "A silo inspired by the farms described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Farm Tractor (Back)"] = {
			Name = "Hamlet Farm Tractor (Back)",
			Image = "DecoHamletFarmTractor(Back).png",
			Description = "The back of a farming tractor, inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Farm Tractor (Front)"] = {
			Name = "Hamlet Farm Tractor (Front)",
			Image = "DecoHamletFarmTractor(Front).png",
			Description = "The front of a farming tractor, inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Hay Bale (Round)"] = {
			Name = "Hamlet Hay Bale (Round)",
			Image = "DecoHamletHayBale(Round).png",
			Description = "A round bale of hay, inspired by the lives of citizens described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Hay Pile"] = {
			Name = "Hamlet Hay Pile",
			Image = "DecoHamletHayPile.png",
			Description = "A pile of hay, inspired by the lives of citizens described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Kaithe Hitch (Large)"] = {
			Name = "Hamlet Kaithe Hitch (Large)",
			Image = "DecoHamletKaitheHitch(Large).png",
			Description = "A large hitch used to secure Kaithes, inspired by the lives of citizens described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Kaithe Hitch (Small)"] = {
			Name = "Hamlet Kaithe Hitch (Small)",
			Image = "DecoHamletKaitheHitch(Small).png",
			Description = "A small hitch used to secure Kaithes, inspired by the lives of citizens described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Kaithe Trough"] = {
			Name = "Hamlet Kaithe Trough",
			Image = "DecoHamletKaitheTrough.png",
			Description = "A trough for watering horses, inspired by the lives of citizens described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Lamp (Large)"] = {
			Name = "Hamlet Lamp (Large)",
			Image = "DecoHamletLamp(Large).png",
			Description = "A large lamp inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Lamp (Small)"] = {
			Name = "Hamlet Lamp (Small)",
			Image = "DecoHamletLamp(Small).png",
			Description = "A small lamp inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Lamp (Wall)"] = {
			Name = "Hamlet Lamp (Wall)",
			Image = "DecoHamletLamp(Wall).png",
			Description = "A wall-mounted lamp inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Pergola"] = {
			Name = "Hamlet Pergola",
			Image = "DecoHamletPergola.png",
			Description = "A pergola inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Pillar (Common)"] = {
			Name = "Hamlet Pillar (Common)",
			Image = "DecoHamletPillar(Common).png",
			Description = "A common pillar inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Pillar (Corner)"] = {
			Name = "Hamlet Pillar (Corner)",
			Image = "DecoHamletPillar(Corner).png",
			Description = "A corner pillar inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Pillar (Elite)"] = {
			Name = "Hamlet Pillar (Elite)",
			Image = "DecoHamletPillar(Elite).png",
			Description = "An elite pillar inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Radiator"] = {
			Name = "Hamlet Radiator",
			Image = "DecoHamletRadiator.png",
			Description = "A wall-mounted radiator inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Railing (16m)"] = {
			Name = "Hamlet Railing (16m)",
			Image = "DecoHamletRailing(16m).png",
			Description = "A 16m railing inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Railing (4m, Curved)"] = {
			Name = "Hamlet Railing (4m, Curved)",
			Image = "DecoHamletRailing(4m,Curved).png",
			Description = "A curved 4m railing inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Railing (4m)"] = {
			Name = "Hamlet Railing (4m)",
			Image = "DecoHamletRailing(4m).png",
			Description = "A 4m railing inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Railing (8m)"] = {
			Name = "Hamlet Railing (8m)",
			Image = "DecoHamletRailing(8m).png",
			Description = "An 8m railing inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Roof Antenna"] = {
			Name = "Hamlet Roof Antenna",
			Image = "DecoHamletRoofAntenna.png",
			Description = "A rooftop antenna inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Roof Casing"] = {
			Name = "Hamlet Roof Casing",
			Image = "DecoHamletRoofCasing.png",
			Description = "Rooftap casing to protect home systems, inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Roof Facade (1m)"] = {
			Name = "Hamlet Roof Facade (1m)",
			Image = "DecoHamletRoofFacade(1m).png",
			Description = "A 1m roof facade inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Roof Facade (4m)"] = {
			Name = "Hamlet Roof Facade (4m)",
			Image = "DecoHamletRoofFacade(4m).png",
			Description = "A 4m roof facade inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Roof Vent (Ornate)"] = {
			Name = "Hamlet Roof Vent (Ornate)",
			Image = "DecoHamletRoofVent(Ornate).png",
			Description = "An ornate roof vent inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Roof Vent (Standard)"] = {
			Name = "Hamlet Roof Vent (Standard)",
			Image = "DecoHamletRoofVent(Standard).png",
			Description = "A standard roof vent inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Rooftop (Crescent)"] = {
			Name = "Hamlet Rooftop (Crescent)",
			Image = "DecoHamletRooftop(Crescent).png",
			Description = "A crescent-shaped rooftop inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Rooftop (Elevated)"] = {
			Name = "Hamlet Rooftop (Elevated)",
			Image = "DecoHamletRooftop(Elevated).png",
			Description = "An elevated rooftop inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Rooftop (Ornate)"] = {
			Name = "Hamlet Rooftop (Ornate)",
			Image = "DecoHamletRooftop(Ornate).png",
			Description = "An ornate rooftop inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Rooftop (Standard)"] = {
			Name = "Hamlet Rooftop (Standard)",
			Image = "DecoHamletRooftop(Standard).png",
			Description = "A standard rooftop inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Rooftop Trim"] = {
			Name = "Hamlet Rooftop Trim",
			Image = "DecoHamletRooftopTrim.png",
			Description = "A section of rooftop trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Sconce"] = {
			Name = "Hamlet Sconce",
			Image = "DecoHamletSconce.png",
			Description = "A wall sconce inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Speaking Platform"] = {
			Name = "Hamlet Speaking Platform",
			Image = "DecoHamletSpeakingPlatform.png",
			Description = "A platform used to elevate public speakers, as described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Stair Set"] = {
			Name = "Hamlet Stair Set",
			Image = "DecoHamletStairSet.png",
			Description = "A set of stairs inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Trim (2m)"] = {
			Name = "Hamlet Trim (2m)",
			Image = "DecoHamletTrim(2m).png",
			Description = "A 2m length of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (45 Degree, Left, Sharp)"] = {
			Name = "Hamlet Trim (45 Degree, Left, Sharp)",
			Image = "DecoHamletTrim(45Degree,Left,Sharp).png",
			Description = "A sharp left 45 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Trim (45 Degree, Right, Sharp)"] = {
			Name = "Hamlet Trim (45 Degree, Right, Sharp)",
			Image = "DecoHamletTrim(45Degree,Right,Sharp).png",
			Description = "A sharp right 45 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (4m)"] = {
			Name = "Hamlet Trim (4m)",
			Image = "DecoHamletTrim(4m).png",
			Description = "A 4m length of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Trim (8m)"] = {
			Name = "Hamlet Trim (8m)",
			Image = "DecoHamletTrim(8m).png",
			Description = "An 8m lenght of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (90 Degree, Left, Curved)"] = {
			Name = "Hamlet Trim (90 Degree, Left, Curved)",
			Image = "DecoHamletTrim(90Degree,Left,Curved).png",
			Description = "A curved left 90 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (90 Degree, Left, Sharp)"] = {
			Name = "Hamlet Trim (90 Degree, Left, Sharp)",
			Image = "DecoHamletTrim(90Degree,Left,Sharp).png",
			Description = "A sharp left 90 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Trim (90 Degree, Right, Curved)"] = {
			Name = "Hamlet Trim (90 Degree, Right, Curved)",
			Image = "DecoHamletTrim(90Degree,Right,Curved).png",
			Description = "A curved right 90 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (90 Degree, Right, Sharp)"] = {
			Name = "Hamlet Trim (90 Degree, Right, Sharp)",
			Image = "DecoHamletTrim(90Degree,Right,Sharp).png",
			Description = "A sharp right 90 degree angled trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (Inside Corner)"] = {
			Name = "Hamlet Trim (Inside Corner)",
			Image = "DecoHamletTrim(InsideCorner).png",
			Description = "The inside corner section of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Trim (Left End Cap)"] = {
			Name = "Hamlet Trim (Left End Cap)",
			Image = "DecoHamletTrim(LeftEndCap).png",
			Description = "The left end of a run of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Trim (Outside Corner)"] = {
			Name = "Hamlet Trim (Outside Corner)",
			Image = "DecoHamletTrim(OutsideCorner).png",
			Description = "The outside corner section of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Control Module" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Trim (Right End Cap)"] = {
			Name = "Hamlet Trim (Right End Cap)",
			Image = "DecoHamletTrim(RightEndCap).png",
			Description = "The right end of a run of trim inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Wall (Corner)"] = {
			Name = "Hamlet Wall (Corner)",
			Image = "DecoHamletWall(Corner).png",
			Description = "An outward wall corner inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Wall (Short, 4m)"] = {
			Name = "Hamlet Wall (Short, 4m)",
			Image = "DecoHamletWall(Short,4m).png",
			Description = "A short 4m section of wall inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Wall (Short, 8m)"] = {
			Name = "Hamlet Wall (Short, 8m)",
			Image = "DecoHamletWall(Short,8m).png",
			Description = "An short 8m section of wall inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Wall (Tall, 4m)"] = {
			Name = "Hamlet Wall (Tall, 4m)",
			Image = "DecoHamletWall(Tall,4m).png",
			Description = "A tall 4m section of wall inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Wall (Tall, 8m)"] = {
			Name = "Hamlet Wall (Tall, 8m)",
			Image = "DecoHamletWall(Tall,8m).png",
			Description = "An tall 8m section of wall inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Wall End (Short)"] = {
			Name = "Hamlet Wall End (Short)",
			Image = "DecoHamletWallEnd(Short).png",
			Description = "A short wall end inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Wall End (Tall)"] = {
			Name = "Hamlet Wall End (Tall)",
			Image = "DecoHamletWallEnd(Tall).png",
			Description = "A tall wall end inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Hamlet Wall End (Wide)"] = {
			Name = "Hamlet Wall End (Wide)",
			Image = "DecoHamletWallEnd(Wide).png",
			Description = "A wide wall end inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Wall Facade"] = {
			Name = "Hamlet Wall Facade",
			Image = "DecoHamletWallFacade.png",
			Description = "A decorative wall facade inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Window Shutter (Long)"] = {
			Name = "Hamlet Window Shutter (Long)",
			Image = "DecoHamletWindowShutter(Long).png",
			Description = "A single shutter inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Window Shutters (Long)"] = {
			Name = "Hamlet Window Shutters (Long)",
			Image = "DecoHamletWindowShutters(Long).png",
			Description = "Long shutters inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Window Shutters (Round)"] = {
			Name = "Hamlet Window Shutters (Round)",
			Image = "DecoHamletWindowShutters(Round).png",
			Description = "Short shutters inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Window Trim (Angled, Long)"] = {
			Name = "Hamlet Window Trim (Angled, Long)",
			Image = "DecoHamletWindowTrim(Angled,Long).png",
			Description = "A long and angled window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Hamlet Window Trim (Angled, Short)"] = {
			Name = "Hamlet Window Trim (Angled, Short)",
			Image = "DecoHamletWindowTrim(Angled,Short).png",
			Description = "A short and angled window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Window Trim (Narrow, Long)"] = {
			Name = "Hamlet Window Trim (Narrow, Long)",
			Image = "DecoHamletWindowTrim(Narrow,Long).png",
			Description = "A long and narrow window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Hamlet Window Trim (Narrow, Short)"] = {
			Name = "Hamlet Window Trim (Narrow, Short)",
			Image = "DecoHamletWindowTrim(Narrow,Short).png",
			Description = "A short and narrow window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Window Trim (Round)"] = {
			Name = "Hamlet Window Trim (Round)",
			Image = "DecoHamletWindowTrim(Round).png",
			Description = "A round window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Window Trim (Small, Common)"] = {
			Name = "Hamlet Window Trim (Small, Common)",
			Image = "DecoHamletWindowTrim(Small,Common).png",
			Description = "A small and common window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Window Trim (Small, Elite)"] = {
			Name = "Hamlet Window Trim (Small, Elite)",
			Image = "DecoHamletWindowTrim(Small,Elite).png",
			Description = "A small and elite window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Window Trim (Small, Gold)"] = {
			Name = "Hamlet Window Trim (Small, Gold)",
			Image = "DecoHamletWindowTrim(Small,Gold).png",
			Description = "A small and golden window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Hamlet Window Trim (Wide, Long)"] = {
			Name = "Hamlet Window Trim (Wide, Long)",
			Image = "DecoHamletWindowTrim(Wide,Long).png",
			Description = "A long and wide window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Hamlet Window Trim (Wide, Short)"] = {
			Name = "Hamlet Window Trim (Wide, Short)",
			Image = "DecoHamletWindowTrim(Wide,Short).png",
			Description = "A short and wide window inspired by the hamlets described in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Long Artisan Barrel"] = {
			Name = "Long Artisan Barrel",
			Image = "DecoLongArtisanBarrel.png",
			Description = "A long barrel to fill with oil, water, and other materials artisans might have used in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Short Artisan Barrel"] = {
			Name = "Short Artisan Barrel",
			Image = "DecoShortArtisanBarrel.png",
			Description = "A short barrel to fill with oil, water, and other materials artisans might have used in Tales of Duviri.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		}
	},
	Solaris = {
		["Solaris Adjustable Light"] = {
			Name = "Solaris Adjustable Light",
			Image = "DecoSolarisAdjustableLight.png",
			Description = "A Solaris light that is able to be adjusted.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Architecture Trim End Piece"] = {
			Name = "Solaris Architecture Trim End Piece",
			Image = "DecoSolarisArchitectureTrimEndPiece.png",
			Description = "A large Solaris structural trim piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Armour Chest"] = {
			Name = "Solaris Armour Chest",
			Image = "DecoSolarisArmourChest.png",
			Description = "A heavy duty storage chest.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Barge"] = {
			Name = "Solaris Barge",
			Image = "DecoSolarisBarge.png",
			Description = "A large barge used to float over the coolant in Fortuna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Bench"] = {
			Name = "Solaris Bench",
			Image = "DecoSolarisBench.png",
			Description = "A bench used by the Solaris United people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Body Component Arm Claw"] = {
			Name = "Solaris Body Component Arm Claw",
			Image = "DecoSolarisBodyComponentArmClaw.png",
			Description = "A modular arm claw component from the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Body Component Chest Plate"] = {
			Name = "Solaris Body Component Chest Plate",
			Image = "DecoSolarisBodyComponentChestPlate.png",
			Description = "A modular chest plate component from the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Body Component Head"] = {
			Name = "Solaris Body Component Head",
			Image = "DecoSolarisBodyComponentHead.png",
			Description = "A modular head component from the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Body Component Loud Hailer"] = {
			Name = "Solaris Body Component Loud Hailer",
			Image = "DecoSolarisBodyComponentLoudHailer.png",
			Description = "A modular loud hailer component from the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Compressor"] = {
			Name = "Solaris Compressor",
			Image = "DecoSolarisCompressor.png",
			Description = "A machine used by the Solaris people to compress the refined coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Construction Base"] = {
			Name = "Solaris Construction Base",
			Image = "DecoSolarisConstructionBase.png",
			Description = "A large crase used to secure items during construction.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Control Relay"] = {
			Name = "Solaris Control Relay",
			Image = "DecoSolarisControlRelay.png",
			Description = "An electronic control relay.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Coolant Cap Square"] = {
			Name = "Solaris Coolant Cap Square",
			Image = "DecoSolarisCoolantCapSquare.png",
			Description = "A square cap used to close the pipes used in Fortuna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Coolant Conduit"] = {
			Name = "Solaris Coolant Conduit",
			Image = "DecoSolarisCoolantConduit.png",
			Description = "A conduit for transferring coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Coolant Expansion Tower"] = {
			Name = "Solaris Coolant Expansion Tower",
			Image = "DecoSolarisCoolantExpansionTower.png",
			Description = "A large tower used to allow expansion of the coolant when processing.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Coolant Overflow Tower"] = {
			Name = "Solaris Coolant Overflow Tower",
			Image = "DecoSolarisCoolantOverflowTower.png",
			Description = "A large tower used to collect coolant in overflow.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Coolant Pipe 16m"] = {
			Name = "Solaris Coolant Pipe 16m",
			Image = "DecoSolarisCoolantPipe16m.png",
			Description = "A pipe used to transport harvested coolant, 16m in length",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe 90 Degree Corner"] = {
			Name = "Solaris Coolant Pipe 90 Degree Corner",
			Image = "DecoSolarisCoolantPipe90DegreeCorner.png",
			Description = "A 90 degree corner pipe used to transport harvested coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe Cap"] = {
			Name = "Solaris Coolant Pipe Cap",
			Image = "DecoSolarisCoolantPipeCap.png",
			Description = "A cap used to close the pipe used in Fortuna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Coolant Pipe Frame"] = {
			Name = "Solaris Coolant Pipe Frame",
			Image = "DecoSolarisCoolantPipeFrame.png",
			Description = "A large coolant pipe support frame.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe Grate"] = {
			Name = "Solaris Coolant Pipe Grate",
			Image = "DecoSolarisCoolantPipeGrate.png",
			Description = "A grate cover used in the Solaris coolant pipes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Coolant Pipe Hollow 16m"] = {
			Name = "Solaris Coolant Pipe Hollow 16m",
			Image = "DecoSolarisCoolantPipeHollow16m.png",
			Description = "A pipe used to transport harvested coolant, 16m in length",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe Support Base"] = {
			Name = "Solaris Coolant Pipe Support Base",
			Image = "DecoSolarisCoolantPipeSupportBase.png",
			Description = "A large base of support for the Solaris coolant pipes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe Support Frame Half With Base"] = {
			Name = "Solaris Coolant Pipe Support Frame Half With Base",
			Image = "DecoSolarisCoolantPipeSupportFrameHalfWithBase.png",
			Description = "Half of a large coolant pipe support frame with a base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe Support Frame With Base"] = {
			Name = "Solaris Coolant Pipe Support Frame With Base",
			Image = "DecoSolarisCoolantPipeSupportFrameWithBase.png",
			Description = "A large coolant pipe support frame with a base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pipe T Joint"] = {
			Name = "Solaris Coolant Pipe T Joint",
			Image = "DecoSolarisCoolantPipeTJoint.png",
			Description = "A \"T\" shaped join pipe used to transport harvested coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Coolant Pod"] = {
			Name = "Solaris Coolant Pod",
			Image = "DecoSolarisCoolantPod.png",
			Description = "A small pod that stores coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Coolant Pod Case"] = {
			Name = "Solaris Coolant Pod Case",
			Image = "DecoSolarisCoolantPodCase.png",
			Description = "A small container used to store coolant pods.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Coolant Pod Case Opened"] = {
			Name = "Solaris Coolant Pod Case Opened",
			Image = "DecoSolarisCoolantPodCaseOpened.png",
			Description = "A small container used to store coolant pods. This one is opened and empty",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Coolant Pressure Tank"] = {
			Name = "Solaris Coolant Pressure Tank",
			Image = "DecoSolarisCoolantPressureTank.png",
			Description = "A large tank used to store coolant under pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Coolant Rod"] = {
			Name = "Solaris Coolant Rod",
			Image = "DecoSolarisCoolantRod.png",
			Description = "A rod used as a tool for coolant harvesting.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Crate Electronics"] = {
			Name = "Solaris Crate Electronics",
			Image = "DecoSolarisCrateElectronics.png",
			Description = "A small crate used by the Solaris people to protect electronics during transport.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Digital Display Board"] = {
			Name = "Solaris Digital Display Board",
			Image = "DecoSolarisDigitalDisplayBoard.png",
			Description = "A large digital display used by the Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Distilling Machine"] = {
			Name = "Solaris Distilling Machine",
			Image = "DecoSolarisDistillingMachine.png",
			Description = "A machine used by the Solaris people to distill the harvested coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Elevator Console"] = {
			Name = "Solaris Elevator Console",
			Image = "DecoSolarisElevatorConsole.png",
			Description = "A control console for the elevators used in Fortuna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Elevator Door Bottom Panel"] = {
			Name = "Solaris Elevator Door Bottom Panel",
			Image = "DecoSolarisElevatorDoorBottomPanel.png",
			Description = "A large door panel used in the Solaris elevator.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Elevator Door Top Panel"] = {
			Name = "Solaris Elevator Door Top Panel",
			Image = "DecoSolarisElevatorDoorTopPanel.png",
			Description = "A large door panel used in the Solaris elevator.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Elevator Signage"] = {
			Name = "Solaris Elevator Signage",
			Image = "DecoSolarisElevatorSignage.png",
			Description = "A large digital sign used in the elevator in Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Extraction Machine"] = {
			Name = "Solaris Extraction Machine",
			Image = "DecoSolarisExtractionMachine.png",
			Description = "A machine used by the Solaris people to extract coolant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Feedback Relay"] = {
			Name = "Solaris Feedback Relay",
			Image = "DecoSolarisFeedbackRelay.png",
			Description = "An electronic feedback relay.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Floor Riser"] = {
			Name = "Solaris Floor Riser",
			Image = "DecoSolarisFloorRiser.png",
			Description = "A floor riser.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Floor Riser Corner"] = {
			Name = "Solaris Floor Riser Corner",
			Image = "DecoSolarisFloorRiserCorner.png",
			Description = "A corner floor riser",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Grabber Tool"] = {
			Name = "Solaris Grabber Tool",
			Image = "DecoSolarisGrabberTool.png",
			Description = "A tool used to grab items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Hammer Tool"] = {
			Name = "Solaris Hammer Tool",
			Image = "DecoSolarisHammerTool.png",
			Description = "A larger tool used to hammer surfaces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Hanging Cables"] = {
			Name = "Solaris Hanging Cables",
			Image = "DecoSolarisHangingCables.png",
			Description = "A large set of hanging cables.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Injection Tool"] = {
			Name = "Solaris Injection Tool",
			Image = "DecoSolarisInjectionTool.png",
			Description = "A tool used to inject lubricants into machinery.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Large Access Housing"] = {
			Name = "Solaris Large Access Housing",
			Image = "DecoSolarisLargeAccessHousing.png",
			Description = "A very large housing for access to Solaris treatment tunnels.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Large Access Housing Cover"] = {
			Name = "Solaris Large Access Housing Cover",
			Image = "DecoSolarisLargeAccessHousingCover.png",
			Description = "A very large housing cover that caps access to Solaris treatment tunnels.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Large Access Housing With Lights"] = {
			Name = "Solaris Large Access Housing With Lights",
			Image = "DecoSolarisLargeAccessHousingWithLights.png",
			Description = "A very large housing with lights for access to Solaris treatment tunnels.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Large Filtration Wheel"] = {
			Name = "Solaris Large Filtration Wheel",
			Image = "DecoSolarisLargeFiltrationWheel.png",
			Description = "A large part of a filtration unit, the wheel component.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Light Fixture Large"] = {
			Name = "Solaris Light Fixture Large",
			Image = "DecoSolarisLightFixtureLarge.png",
			Description = "A large light fixture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Light Pedestal Lamp"] = {
			Name = "Solaris Light Pedestal Lamp",
			Image = "DecoSolarisLightPedestalLamp.png",
			Description = "A mobile lamp",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Lighting Stand"] = {
			Name = "Solaris Lighting Stand",
			Image = "DecoSolarisLightingStand.png",
			Description = "Large Solaris lights are affixed to the top of this mobile lighting stand.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Mechanical Crane"] = {
			Name = "Solaris Mechanical Crane",
			Image = "DecoSolarisMechanicalCrane.png",
			Description = "A large mechanical crane used by the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Mechanical Hand Tool"] = {
			Name = "Solaris Mechanical Hand Tool",
			Image = "DecoSolarisMechanicalHandTool.png",
			Description = "A tool that allows manipulation of hot and heavy items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Opaque Window 4m"] = {
			Name = "Solaris Opaque Window 4m",
			Image = "DecoSolarisOpaqueWindow4m.png",
			Description = "A large 4m high opaque window.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Opaque Window 8m"] = {
			Name = "Solaris Opaque Window 8m",
			Image = "DecoSolarisOpaqueWindow8m.png",
			Description = "A large 8m high opaque window.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Paper Boat"] = {
			Name = "Solaris Paper Boat",
			Image = "DecoSolarisPaperBoat.png",
			Description = "A small child's toy, a paper boat.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Particle Trap"] = {
			Name = "Solaris Particle Trap",
			Image = "DecoSolarisParticleTrap.png",
			Description = "A Solaris device that golds radioactive particles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Pillar"] = {
			Name = "Solaris Pillar",
			Image = "DecoSolarisPillar.png",
			Description = "A large pillar used by the Solaris people in their architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Pillar Very Large"] = {
			Name = "Solaris Pillar Very Large",
			Image = "DecoSolarisPillarVeryLarge.png",
			Description = "A very large pillar used in Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Pillar Very Large Base"] = {
			Name = "Solaris Pillar Very Large Base",
			Image = "DecoSolarisPillarVeryLargeBase.png",
			Description = "A very large base used in Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Pillar Very Large Tall"] = {
			Name = "Solaris Pillar Very Large Tall",
			Image = "DecoSolarisPillarVeryLargeTall.png",
			Description = "A very large tall pillar used in Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Posters Horizontal"] = {
			Name = "Solaris Posters Horizontal",
			Image = "DecoSolarisPostersHorizontal.png",
			Description = "A collection of posters created by the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Posters Vertical"] = {
			Name = "Solaris Posters Vertical",
			Image = "DecoSolarisPostersVertical.png",
			Description = "A collection of posters created by the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Pump"] = {
			Name = "Solaris Pump",
			Image = "DecoSolarisPump.png",
			Description = "A Solaris mechanical pump.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Rodent Trap"] = {
			Name = "Solaris Rodent Trap",
			Image = "DecoSolarisRodentTrap.png",
			Description = "A trap used to control the rodent population.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Security Gate"] = {
			Name = "Solaris Security Gate",
			Image = "DecoSolarisSecurityGate.png",
			Description = "A large gate used for security by the Solaris.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Sign Backing Large"] = {
			Name = "Solaris Sign Backing Large",
			Image = "DecoSolarisSignBackingLarge.png",
			Description = "A large panel used as a backing for signage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Sign Backing Small"] = {
			Name = "Solaris Sign Backing Small",
			Image = "DecoSolarisSignBackingSmall.png",
			Description = "A small panel used as a backing for signage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Small Angled Wall Panel"] = {
			Name = "Solaris Small Angled Wall Panel",
			Image = "DecoSolarisSmallAngledWallPanel.png",
			Description = "A small wall panel that is angled.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Small Crane"] = {
			Name = "Solaris Small Crane",
			Image = "DecoSolarisSmallCrane.png",
			Description = "A small crane used by the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Door Panel"] = {
			Name = "Solaris Small Door Panel",
			Image = "DecoSolarisSmallDoorPanel.png",
			Description = "A small Solaris door panel.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Small Ventilation 4m"] = {
			Name = "Solaris Small Ventilation 4m",
			Image = "DecoSolarisSmallVentilation4m.png",
			Description = "A small vent duct 4m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 2m"] = {
			Name = "Solaris Small Ventilation Duct 2m",
			Image = "DecoSolarisSmallVentilationDuct2m.png",
			Description = "A small vent duct 2m in length.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 45 Degree Corner"] = {
			Name = "Solaris Small Ventilation Duct 45 Degree Corner",
			Image = "DecoSolarisSmallVentilationDuct45DegreeCorner.png",
			Description = "A small vent duct used to change direction of a vent run by 45 degrees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 90 Degree Corner"] = {
			Name = "Solaris Small Ventilation Duct 90 Degree Corner",
			Image = "DecoSolarisSmallVentilationDuct90DegreeCorner.png",
			Description = "A small vent duct used to change direction of a vent run by 90 degrees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 90 Degrees Down"] = {
			Name = "Solaris Small Ventilation Duct 90 Degrees Down",
			Image = "DecoSolarisSmallVentilationDuct90DegreesDown.png",
			Description = "A small vent duct that changes direction of a vent run by 90 degrees down.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 90 Degrees Up"] = {
			Name = "Solaris Small Ventilation Duct 90 Degrees Up",
			Image = "DecoSolarisSmallVentilationDuct90DegreesUp.png",
			Description = "A small vent duct that changes direction of a vent run by 90 degrees up.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Small Ventilation Duct 90 Degrees Up With Exhaust"] = {
			Name = "Solaris Small Ventilation Duct 90 Degrees Up With Exhaust",
			Image = "DecoSolarisSmallVentilationDuct90DegreesUpWithExhaust.png",
			Description = "A small vent duct that changes direction of a vent run by 90 degrees up with an exhaust grill.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Stabilizing Rod"] = {
			Name = "Solaris Stabilizing Rod",
			Image = "DecoSolarisStabilizingRod.png",
			Description = "A tool used to stabilize parts when in transit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Storage Container Cube"] = {
			Name = "Solaris Storage Container Cube",
			Image = "DecoSolarisStorageContainerCube.png",
			Description = "A small sized cube Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Storage Container Cylinder"] = {
			Name = "Solaris Storage Container Cylinder",
			Image = "DecoSolarisStorageContainerCylinder.png",
			Description = "A very small sized cylinder Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Storage Container Cylinder Short"] = {
			Name = "Solaris Storage Container Cylinder Short",
			Image = "DecoSolarisStorageContainerCylinderShort.png",
			Description = "A very small sized short cylinder Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Storage Container Medium"] = {
			Name = "Solaris Storage Container Medium",
			Image = "DecoSolarisStorageContainerMedium.png",
			Description = "A medium sized Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Storage Container Small Extended"] = {
			Name = "Solaris Storage Container Small Extended",
			Image = "DecoSolarisStorageContainerSmallExtended.png",
			Description = "A small sized extended Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Storage Container Very Small"] = {
			Name = "Solaris Storage Container Very Small",
			Image = "DecoSolarisStorageContainerVerySmall.png",
			Description = "A very small sized Solaris storage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Storage Locker"] = {
			Name = "Solaris Storage Locker",
			Image = "DecoSolarisStorageLocker.png",
			Description = "A storage locker used by the Solaris people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Structure Corner"] = {
			Name = "Solaris Structure Corner",
			Image = "DecoSolarisStructureCorner.png",
			Description = "A large Solaris structural corner piece.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Supply Cart Closed"] = {
			Name = "Solaris Supply Cart Closed",
			Image = "DecoSolarisSupplyCartClosed.png",
			Description = "A closed supply cart used by the Solaris United people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Supply Cart Large"] = {
			Name = "Solaris Supply Cart Large",
			Image = "DecoSolarisSupplyCartLarge.png",
			Description = "A large cart used to keep supplies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Supply Cart Open"] = {
			Name = "Solaris Supply Cart Open",
			Image = "DecoSolarisSupplyCartOpen.png",
			Description = "An open supply cart used by the Solaris United people.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Supply Cart Small"] = {
			Name = "Solaris Supply Cart Small",
			Image = "DecoSolarisSupplyCartSmall.png",
			Description = "A small cart used to keep supplies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Supply Rack"] = {
			Name = "Solaris Supply Rack",
			Image = "DecoSolarisSupplyRack.png",
			Description = "A rack where supplies are hung.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Table"] = {
			Name = "Solaris Table",
			Image = "DecoSolarisTable.png",
			Description = "A large table used in Fortuna.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Tire"] = {
			Name = "Solaris Tire",
			Image = "DecoSolarisTire.png",
			Description = "A large tire used on Solaris United vehicles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Tool Box Empty"] = {
			Name = "Solaris Tool Box Empty",
			Image = "DecoSolarisToolBoxEmpty.png",
			Description = "A small empty tool box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Tool Box Full Of Tools"] = {
			Name = "Solaris Tool Box Full Of Tools",
			Image = "DecoSolarisToolBoxFullOfTools.png",
			Description = "A small tool box full of tools.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Tool Box Large Full"] = {
			Name = "Solaris Tool Box Large Full",
			Image = "DecoSolarisToolBoxLargeFull.png",
			Description = "A large tool box full of tools and parts.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Truss"] = {
			Name = "Solaris Truss",
			Image = "DecoSolarisTruss.png",
			Description = "A large structural truss.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Vehicle Chock"] = {
			Name = "Solaris Vehicle Chock",
			Image = "DecoSolarisVehicleChock.png",
			Description = "A large chock used with harvesting vehicles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Vendor Arm"] = {
			Name = "Solaris Vendor Arm",
			Image = "DecoSolarisVendorArm.png",
			Description = "A tool that can reach and hold dangerous items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Vendor Display Case"] = {
			Name = "Solaris Vendor Display Case",
			Image = "DecoSolarisVendorDisplayCase.png",
			Description = "A display case used by the Solaris Unique people to show off their wares.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Solaris Ventilation 4m"] = {
			Name = "Solaris Ventilation 4m",
			Image = "DecoSolarisVentilation4m.png",
			Description = "A 4m length of vent duct.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation 4m With Exhaust"] = {
			Name = "Solaris Ventilation 4m With Exhaust",
			Image = "DecoSolarisVentilation4mWithExhaust.png",
			Description = "A 4m length of vent duct with exhaust.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Assembly"] = {
			Name = "Solaris Ventilation Assembly",
			Image = "DecoSolarisVentilationAssembly.png",
			Description = "An assembly of vent equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Ventilation Assembly Small"] = {
			Name = "Solaris Ventilation Assembly Small",
			Image = "DecoSolarisVentilationAssemblySmall.png",
			Description = "A small assembly of vent equipment.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Ventilation Duct 2m"] = {
			Name = "Solaris Ventilation Duct 2m",
			Image = "DecoSolarisVentilationDuct2m.png",
			Description = "A basic 2m ventilation duct.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Duct 2m With Exhaust"] = {
			Name = "Solaris Ventilation Duct 2m With Exhaust",
			Image = "DecoSolarisVentilationDuct2mWithExhaust.png",
			Description = "A 2m vent duct with an exhaust port.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Duct Corner"] = {
			Name = "Solaris Ventilation Duct Corner",
			Image = "DecoSolarisVentilationDuctCorner.png",
			Description = "A vent duct used to change the direction of the vent run.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Duct Grill"] = {
			Name = "Solaris Ventilation Duct Grill",
			Image = "DecoSolarisVentilationDuctGrill.png",
			Description = "A vent grill to cap vent openings.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Fan"] = {
			Name = "Solaris Ventilation Fan",
			Image = "DecoSolarisVentilationFan.png",
			Description = "A fan used in the vent system to move air.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Fan Housing"] = {
			Name = "Solaris Ventilation Fan Housing",
			Image = "DecoSolarisVentilationFanHousing.png",
			Description = "A housing used to protect the vent fan.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Ventilation Fan Rotating"] = {
			Name = "Solaris Ventilation Fan Rotating",
			Image = "DecoSolarisVentilationFanRotating.png",
			Description = "A fan used in the vent system to move air, animated.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Louver"] = {
			Name = "Solaris Ventilation Louver",
			Image = "DecoSolarisVentilationLouver.png",
			Description = "A single louver from the vent system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Louver Cap Closed"] = {
			Name = "Solaris Ventilation Louver Cap Closed",
			Image = "DecoSolarisVentilationLouverCapClosed.png",
			Description = "A vent duct cap with closed louvers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Louver Cap Open"] = {
			Name = "Solaris Ventilation Louver Cap Open",
			Image = "DecoSolarisVentilationLouverCapOpen.png",
			Description = "A vent cap with open louvers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Ventilation Louverless Cap"] = {
			Name = "Solaris Ventilation Louverless Cap",
			Image = "DecoSolarisVentilationLouverlessCap.png",
			Description = "A vent cap missing its louvers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Solaris Very Large Structural Support Truss"] = {
			Name = "Solaris Very Large Structural Support Truss",
			Image = "DecoSolarisVeryLargeStructuralSupportTruss.png",
			Description = "A very large structural support truss.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Solaris Water Pressure Rank"] = {
			Name = "Solaris Water Pressure Rank",
			Image = "DecoSolarisWaterPressureRank.png",
			Description = "A large tank to store water under pressure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Solaris Weapons Peg"] = {
			Name = "Solaris Weapons Peg",
			Image = "DecoSolarisWeaponsPeg.png",
			Description = "A small rod used to hang weapons and other tools.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Solaris Workshop Light"] = {
			Name = "Solaris Workshop Light",
			Image = "DecoSolarisWorkshopLight.png",
			Description = "A large workshop light.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		}
	},
	NineteenNinetyNine = {
			["Advertising Column"] = {
			Name = "Advertising Column",
			Image = "DecoAdvertisingColumn.png",
			Description = "A small column used to display advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Air Conditioning Unit"] = {
			Name = "Air Conditioning Unit",
			Image = "DecoAirConditioningUnit.png",
			Description = "A small wall mounted air conditioning unit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Balloon (Blue)"] = {
			Name = "Balloon (Blue)",
			Image = "DecoBalloon(Blue).png",
			Description = "A blue balloon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Balloon (Purple)"] = {
			Name = "Balloon (Purple)",
			Image = "DecoBalloon(Purple).png",
			Description = "A purple balloon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Balloon (Red)"] = {
			Name = "Balloon (Red)",
			Image = "DecoBalloon(Red).png",
			Description = "A red balloon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Balloon (Yellow)"] = {
			Name = "Balloon (Yellow)",
			Image = "DecoBalloon(Yellow).png",
			Description = "A yellow balloon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bar Counter (1m)"] = {
			Name = "Bar Counter (1m)",
			Image = "DecoBarCounter(1m).png",
			Description = "A 1m straight section of a bar counter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bar Counter (2m)"] = {
			Name = "Bar Counter (2m)",
			Image = "DecoBarCounter(2m).png",
			Description = "A 2m straight section of a bar counter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bar Counter (Rounded Corner)"] = {
			Name = "Bar Counter (Rounded Corner)",
			Image = "DecoBarCounter(RoundedCorner).png",
			Description = "A section of a bar counter that has a rounded curve.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Bar Drink Dispenser"] = {
			Name = "Bar Drink Dispenser",
			Image = "DecoBarDrinkDispenser.png",
			Description = "A drink dispensing cabinet used in bars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Bar Stool"] = {
			Name = "Bar Stool",
			Image = "DecoBarStool.png",
			Description = "A wooden bar stool.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bicycle Rack"] = {
			Name = "Bicycle Rack",
			Image = "DecoBicycleRack.png",
			Description = "A rack to secure bicycles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bollard (Cement)"] = {
			Name = "Bollard (Cement)",
			Image = "DecoBollard(Cement).png",
			Description = "A cement street bollard used to block access to certain areas.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Bollard (Metal)"] = {
			Name = "Bollard (Metal)",
			Image = "DecoBollard(Metal).png",
			Description = "A metal street bollard used to block access to certain areas.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Booth Seat"] = {
			Name = "Booth Seat",
			Image = "DecoBoothSeat.png",
			Description = "A two place seat used to create a booth.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Bracket (Metal)"] = {
			Name = "Bracket (Metal)",
			Image = "DecoBracket(Metal).png",
			Description = "A large metal bracket that supports and stabilizes shelves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Bracket (Metal, Decorative)"] = {
			Name = "Bracket (Metal, Decorative)",
			Image = "DecoBracket(Metal,Decorative).png",
			Description = "A large decorative metal bracket that supports and stabilizes shelves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bus Stop Shelter"] = {
			Name = "Bus Stop Shelter",
			Image = "DecoBusStopShelter.png",
			Description = "A shelter for bus riding patrons.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cardboard Box"] = {
			Name = "Cardboard Box",
			Image = "DecoCardboardBox.png",
			Description = "A single cardboard box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Cardboard Boxes (Pile)"] = {
			Name = "Cardboard Boxes (Pile)",
			Image = "DecoCardboardBoxes(Pile).png",
			Description = "A large pile of cardboard boxes.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cash Register"] = {
			Name = "Cash Register",
			Image = "DecoCashRegister.png",
			Description = "A register that accounts for sales and holds cash.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Chain-Link Fence (2m)"] = {
			Name = "Chain-Link Fence (2m)",
			Image = "DecoChain-LinkFence(2m).png",
			Description = "A 2m length of a chain-link fence.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Chain-Link Fence (6m)"] = {
			Name = "Chain-Link Fence (6m)",
			Image = "DecoChain-LinkFence(6m).png",
			Description = "A 6m length of a chain-link fence.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Chain-Link Fence Post"] = {
			Name = "Chain-Link Fence Post",
			Image = "DecoChain-LinkFencePost.png",
			Description = "A post used in a chain-link fence system.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Computer Terminal"] = {
			Name = "Computer Terminal",
			Image = "DecoComputerTerminal.png",
			Description = "A computer terminal with a mouse, keyboard, and monitor built into one unit.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Concrete Barrier"] = {
			Name = "Concrete Barrier",
			Image = "DecoConcreteBarrier.png",
			Description = "A concrete barrier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Concrete Barrier (Tall)"] = {
			Name = "Concrete Barrier (Tall)",
			Image = "DecoConcreteBarrier(Tall).png",
			Description = "A tall concrete barrier.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Dark Sector Knockout Poster"] = {
			Name = "Dark Sector Knockout Poster",
			Image = "DecoDarkSectorKnockoutPoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Dark Sector Lasria Poster"] = {
			Name = "Dark Sector Lasria Poster",
			Image = "DecoDarkSectorLasriaPoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Dark Sector Mezner Poster"] = {
			Name = "Dark Sector Mezner Poster",
			Image = "DecoDarkSectorMeznerPoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Dark Sector Origins Poster"] = {
			Name = "Dark Sector Origins Poster",
			Image = "DecoDarkSectorOriginsPoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Desktop Computer Case"] = {
			Name = "Desktop Computer Case",
			Image = "DecoDesktopComputerCase.png",
			Description = "A computer case ready to be paired with a monitor and accessories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Desktop Computer Monitor"] = {
			Name = "Desktop Computer Monitor",
			Image = "DecoDesktopComputerMonitor.png",
			Description = "A computer monitor and accessories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Doktor Friday Poster"] = {
			Name = "Doktor Friday Poster",
			Image = "DecoDoktorFridayPoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Drink Vending Machine"] = {
			Name = "Drink Vending Machine",
			Image = "DecoDrinkVendingMachine.png",
			Description = "A refrigerated vending machine serving drinks.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Dumpster"] = {
			Name = "Dumpster",
			Image = "DecoDumpster.png",
			Description = "A large garbage container.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Dumpster Lid"] = {
			Name = "Dumpster Lid",
			Image = "DecoDumpsterLid.png",
			Description = "A lid for a dumpster.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Electrical Box (Large)"] = {
			Name = "Electrical Box (Large)",
			Image = "DecoElectricalBox(Large).png",
			Description = "A large box that houses high voltage electrical supply wires.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Electrical Box (Wall Mounted)"] = {
			Name = "Electrical Box (Wall Mounted)",
			Image = "DecoElectricalBox(WallMounted).png",
			Description = "A wall mounted box that houses high voltage electrical supply wires.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Electrical Box (With Base)"] = {
			Name = "Electrical Box (With Base)",
			Image = "DecoElectricalBox(WithBase).png",
			Description = "A box that houses high voltage electrical supply wires sitting on a cement base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Facsimile Machine"] = {
			Name = "Facsimile Machine",
			Image = "DecoFacsimileMachine.png",
			Description = "A machine that electronically sends copies of paper over a phone line.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Fesitve Banner"] = {
			Name = "Fesitve Banner",
			Image = "DecoFesitveBanner.png",
			Description = "A festive banner used to decorate for events.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Fire Extinguisher"] = {
			Name = "Fire Extinguisher",
			Image = "DecoFireExtinguisher.png",
			Description = "A fire extinguisher for emergencies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Fire Extinguisher (With Cabinet)"] = {
			Name = "Fire Extinguisher (With Cabinet)",
			Image = "DecoFireExtinguisher(WithCabinet).png",
			Description = "A cabinet that is mounted to the wall for easy access to a fire extinguisher for emergencies.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["First Aid Kit"] = {
			Name = "First Aid Kit",
			Image = "DecoFirstAidKit.png",
			Description = "A box holding items used to administer first aid.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Food Court Chair"] = {
			Name = "Food Court Chair",
			Image = "DecoFoodCourtChair.png",
			Description = "A rigid steel and wood food court chair.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Food Court Table (2 Seat)"] = {
			Name = "Food Court Table (2 Seat)",
			Image = "DecoFoodCourtTable(2Seat).png",
			Description = "A food court table that seats two.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Food Court Table (4 Seat)"] = {
			Name = "Food Court Table (4 Seat)",
			Image = "DecoFoodCourtTable(4Seat).png",
			Description = "A food court table that seats four.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Fuel Tank"] = {
			Name = "Fuel Tank",
			Image = "DecoFuelTank.png",
			Description = "A large metal fuel storage tank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Garbage Bag"] = {
			Name = "Garbage Bag",
			Image = "DecoGarbageBag.png",
			Description = "A garbage bag filled with trash.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Ground Trash"] = {
			Name = "Ground Trash",
			Image = "DecoGroundTrash.png",
			Description = "A small area of trash on the ground.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Kitchen Cabinet (Stainless Steel)"] = {
			Name = "Kitchen Cabinet (Stainless Steel)",
			Image = "DecoKitchenCabinet(StainlessSteel).png",
			Description = "A stainless steel cabinet used in commercial kitchens.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Kitchen Condiment Dispenser (Stainless Steel)"] = {
			Name = "Kitchen Condiment Dispenser (Stainless Steel)",
			Image = "DecoKitchenCondimentDispenser(StainlessSteel).png",
			Description = "A stainless steel pump that dispenses condiments.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Kitchen Counter Shelf (Stainless Steel)"] = {
			Name = "Kitchen Counter Shelf (Stainless Steel)",
			Image = "DecoKitchenCounterShelf(StainlessSteel).png",
			Description = "A stainless steel kitchen counter with shelves.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Kitchen Deep Fryer (Stainless Steel)"] = {
			Name = "Kitchen Deep Fryer (Stainless Steel)",
			Image = "DecoKitchenDeepFryer(StainlessSteel).png",
			Description = "A stainless steel deep fryer used in commercial kitchens.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Kitchen Sink (Stainless Steel)"] = {
			Name = "Kitchen Sink (Stainless Steel)",
			Image = "DecoKitchenSink(StainlessSteel).png",
			Description = "A stainless steel sink used in commercial kitchens.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Kitchen Stove (Stainless Steel)"] = {
			Name = "Kitchen Stove (Stainless Steel)",
			Image = "DecoKitchenStove(StainlessSteel).png",
			Description = "A stainless steel stove used in a commercial kitchen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Kitchen Utensil Holder (Stainless Steel)"] = {
			Name = "Kitchen Utensil Holder (Stainless Steel)",
			Image = "DecoKitchenUtensilHolder(StainlessSteel).png",
			Description = "A stainless steel holder of forks, knives, spoons, and other kitchen utensils.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Kitchen Vent Hood (Stainless Steel)"] = {
			Name = "Kitchen Vent Hood (Stainless Steel)",
			Image = "DecoKitchenVentHood(StainlessSteel).png",
			Description = "A stainless steel hood that collects exhaust and vents it out of the kitchen.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Ladder (Open)"] = {
			Name = "Ladder (Open)",
			Image = "DecoLadder(Open).png",
			Description = "An open ladder.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lamp (Ceiling Mounted, Pendant)"] = {
			Name = "Lamp (Ceiling Mounted, Pendant)",
			Image = "DecoLamp(CeilingMounted,Pendant).png",
			Description = "A ceiling mounted pendant style lamp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Lamp (Spotlight)"] = {
			Name = "Lamp (Spotlight)",
			Image = "DecoLamp(Spotlight).png",
			Description = "A spotlight lamp that can be directed on a stage for dynamic show lighting.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Lamp (Track Lighting)"] = {
			Name = "Lamp (Track Lighting)",
			Image = "DecoLamp(TrackLighting).png",
			Description = "A group of lights mounted on a track.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Lamp (Wall Mounted, Pendant Sconce)"] = {
			Name = "Lamp (Wall Mounted, Pendant Sconce)",
			Image = "DecoLamp(WallMounted,PendantSconce).png",
			Description = "A wall mounted pendant sconce style lamp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Lamp (Wall Mounted, Sconce)"] = {
			Name = "Lamp (Wall Mounted, Sconce)",
			Image = "DecoLamp(WallMounted,Sconce).png",
			Description = "A wall mounted sconce style lamp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Lamp (Wall Mounted, Shaded Sconce)"] = {
			Name = "Lamp (Wall Mounted, Shaded Sconce)",
			Image = "DecoLamp(WallMounted,ShadedSconce).png",
			Description = "A wall mounted shaded sconce style lamp.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Lamp Post"] = {
			Name = "Lamp Post",
			Image = "DecoLampPost.png",
			Description = "A lamp post to illuminate dark public areas.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Layered Posters"] = {
			Name = "Layered Posters",
			Image = "DecoLayeredPosters.png",
			Description = "A group of posters that have been layered on top of each other over time.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Locker (Single, Open)"] = {
			Name = "Locker (Single, Open)",
			Image = "DecoLocker(Single,Open).png",
			Description = "An open, single, metal storage locker used to secure items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Long Bar Table"] = {
			Name = "Long Bar Table",
			Image = "DecoLongBarTable.png",
			Description = "An long wooden table used in a bar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Mall Bench"] = {
			Name = "Mall Bench",
			Image = "DecoMallBench.png",
			Description = "A wooden bench found in the mall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Metal Barrier"] = {
			Name = "Metal Barrier",
			Image = "DecoMetalBarrier.png",
			Description = "A metal barrier used to create temporary blockades.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Metal Table (Round)"] = {
			Name = "Metal Table (Round)",
			Image = "DecoMetalTable(Round).png",
			Description = "A round metal table.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Metal Table (Square)"] = {
			Name = "Metal Table (Square)",
			Image = "DecoMetalTable(Square).png",
			Description = "A square metal table.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Microphone Stand"] = {
			Name = "Microphone Stand",
			Image = "DecoMicrophoneStand.png",
			Description = "A microphone on a stand.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Military Systems Control Console"] = {
			Name = "Military Systems Control Console",
			Image = "DecoMilitarySystemsControlConsole.png",
			Description = "A console the military uses for controlling systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Military Systems Control Console (Large)"] = {
			Name = "Military Systems Control Console (Large)",
			Image = "DecoMilitarySystemsControlConsole(Large).png",
			Description = "A large console the military uses for controlling systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Military Systems Control Console (Tall)"] = {
			Name = "Military Systems Control Console (Tall)",
			Image = "DecoMilitarySystemsControlConsole(Tall).png",
			Description = "A tall console the military uses for controlling systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Money (Pile)"] = {
			Name = "Money (Pile)",
			Image = "DecoMoney(Pile).png",
			Description = "A pile of bundled money stacks.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Money (Single Bundle)"] = {
			Name = "Money (Single Bundle)",
			Image = "DecoMoney(SingleBundle).png",
			Description = "A single bound stack of money.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Mounted Water Fountain"] = {
			Name = "Mounted Water Fountain",
			Image = "DecoMountedWaterFountain.png",
			Description = "A wall mounted water fountain for drinking.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Movie Theater Seats"] = {
			Name = "Movie Theater Seats",
			Image = "DecoMovieTheaterSeats.png",
			Description = "A group of four movie theater seats.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Newspaper Vending Machine"] = {
			Name = "Newspaper Vending Machine",
			Image = "DecoNewspaperVendingMachine.png",
			Description = "A vending machine that sells newspapers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Newspaper Vending Machine (Small)"] = {
			Name = "Newspaper Vending Machine (Small)",
			Image = "DecoNewspaperVendingMachine(Small).png",
			Description = "A small vending machine that sells newspapers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Office Telephone"] = {
			Name = "Office Telephone",
			Image = "DecoOfficeTelephone.png",
			Description = "A telephone used in office spaces.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Oil Drum"] = {
			Name = "Oil Drum",
			Image = "DecoOilDrum.png",
			Description = "A metal drum filled with oil.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Old Pizza"] = {
			Name = "Old Pizza",
			Image = "DecoOldPizza.png",
			Description = "Leftover pizza stuck to the carboard from its delivery box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Ornate Clock"] = {
			Name = "Ornate Clock",
			Image = "DecoOrnateClock.png",
			Description = "An ornate clock with gold trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Ornate Clock (With Stand)"] = {
			Name = "Ornate Clock (With Stand)",
			Image = "DecoOrnateClock(WithStand).png",
			Description = "An ornate standing clock with gold trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Patio Umbrella (Closed, Blue)"] = {
			Name = "Patio Umbrella (Closed, Blue)",
			Image = "DecoPatioUmbrella(Closed,Blue).png",
			Description = "A large blue closed patio umbrella.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Patio Umbrella (Open, Red)"] = {
			Name = "Patio Umbrella (Open, Red)",
			Image = "DecoPatioUmbrella(Open,Red).png",
			Description = "A large red open patio umbrella.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Payphone"] = {
			Name = "Payphone",
			Image = "DecoPayphone.png",
			Description = "A payphone stand used to make calls.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Phone Booth"] = {
			Name = "Phone Booth",
			Image = "DecoPhoneBooth.png",
			Description = "A phone booth used to make calls.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Pizza Box (Closed)"] = {
			Name = "Pizza Box (Closed)",
			Image = "DecoPizzaBox(Closed).png",
			Description = "A closed pizza box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Pizza Box (Open, Empty)"] = {
			Name = "Pizza Box (Open, Empty)",
			Image = "DecoPizzaBox(Open,Empty).png",
			Description = "An open, empty pizza box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Planter (Clay)"] = {
			Name = "Planter (Clay)",
			Image = "DecoPlanter(Clay).png",
			Description = "A round planter made of clay.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Planter (Indoor, Small)"] = {
			Name = "Planter (Indoor, Small)",
			Image = "DecoPlanter(Indoor,Small).png",
			Description = "A small wooden indoor planter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Planter (Large, Stone)"] = {
			Name = "Planter (Large, Stone)",
			Image = "DecoPlanter(Large,Stone).png",
			Description = "A large round stone planter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Planter (Large, Wood)"] = {
			Name = "Planter (Large, Wood)",
			Image = "DecoPlanter(Large,Wood).png",
			Description = "A large wooden planter box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Planter (Small, Stone)"] = {
			Name = "Planter (Small, Stone)",
			Image = "DecoPlanter(Small,Stone).png",
			Description = "A small round stone planter.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Planter (Small, Wood)"] = {
			Name = "Planter (Small, Wood)",
			Image = "DecoPlanter(Small,Wood).png",
			Description = "A small wooden planter box.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Recycling Bin"] = {
			Name = "Recycling Bin",
			Image = "DecoRecyclingBin.png",
			Description = "A large plastic bin used to dispose of recyclable items.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Recycling Bin Lid"] = {
			Name = "Recycling Bin Lid",
			Image = "DecoRecyclingBinLid.png",
			Description = "A plastic lid for a recycling bin.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Refrigerator (Commercial)"] = {
			Name = "Refrigerator (Commercial)",
			Image = "DecoRefrigerator(Commercial).png",
			Description = "A storage cabinet that is refrigerated to keep items cold.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Safe"] = {
			Name = "Safe",
			Image = "DecoSafe.png",
			Description = "A safe used to keep important items secure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Safety Cone"] = {
			Name = "Safety Cone",
			Image = "DecoSafetyCone.png",
			Description = "A large, orange safety cone.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Security Camera"] = {
			Name = "Security Camera",
			Image = "DecoSecurityCamera.png",
			Description = "A wall mounted security camera.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Shopping Cart"] = {
			Name = "Shopping Cart",
			Image = "DecoShoppingCart.png",
			Description = "A standard metal shopping cart.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sign (Atomicycle Accessories Store)"] = {
			Name = "Sign (Atomicycle Accessories Store)",
			Image = "DecoSign(AtomicycleAccessoriesStore).png",
			Description = "A sign displayed over a store that sells Atomicycle accessories.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sign (Atomicycle Store)"] = {
			Name = "Sign (Atomicycle Store)",
			Image = "DecoSign(AtomicycleStore).png",
			Description = "A sign displayed over a store that sells Atomicycles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sign (Big Bytes)"] = {
			Name = "Sign (Big Bytes)",
			Image = "DecoSign(BigBytes).png",
			Description = "A sign displaying Big Bytes Pizza's logo.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Sign (Burger Restaurant)"] = {
			Name = "Sign (Burger Restaurant)",
			Image = "DecoSign(BurgerRestaurant).png",
			Description = "A sign displayed over a burger restaurant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sign (Coffee Shop)"] = {
			Name = "Sign (Coffee Shop)",
			Image = "DecoSign(CoffeeShop).png",
			Description = "A sign displayed over a coffee shop.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Sign (Computer Store)"] = {
			Name = "Sign (Computer Store)",
			Image = "DecoSign(ComputerStore).png",
			Description = "A sign displayed over a store that sells computers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sign (Electronics Store)"] = {
			Name = "Sign (Electronics Store)",
			Image = "DecoSign(ElectronicsStore).png",
			Description = "A sign displayed over a store that sells electronics.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Sign (Furniture Store)"] = {
			Name = "Sign (Furniture Store)",
			Image = "DecoSign(FurnitureStore).png",
			Description = "A sign displayed over a store that sells furniture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sign (Internet Cafe)"] = {
			Name = "Sign (Internet Cafe)",
			Image = "DecoSign(InternetCafe).png",
			Description = "A sign displayed outside of an internet cafe.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sign (Music Store)"] = {
			Name = "Sign (Music Store)",
			Image = "DecoSign(MusicStore).png",
			Description = "A sign displayed over a store that sells music.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sign (Neon Circle)"] = {
			Name = "Sign (Neon Circle)",
			Image = "DecoSign(NeonCircle).png",
			Description = "An light up sign in the shape of a circle.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sign (Neon Joystick)"] = {
			Name = "Sign (Neon Joystick)",
			Image = "DecoSign(NeonJoystick).png",
			Description = "An light up sign in the shape of an arcade joystick.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sign (Neon Lines)"] = {
			Name = "Sign (Neon Lines)",
			Image = "DecoSign(NeonLines).png",
			Description = "An light up sign in the shape of two lines.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sign (Neon Moon)"] = {
			Name = "Sign (Neon Moon)",
			Image = "DecoSign(NeonMoon).png",
			Description = "An light up sign in the shape of a crescent moon.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Sign (Neon Star)"] = {
			Name = "Sign (Neon Star)",
			Image = "DecoSign(NeonStar).png",
			Description = "An light up sign in the shape of a star.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Sign (Pharmacy)"] = {
			Name = "Sign (Pharmacy)",
			Image = "DecoSign(Pharmacy).png",
			Description = "A sign displayed outside of a pharmacy.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Sign (Pizza Restaurant)"] = {
			Name = "Sign (Pizza Restaurant)",
			Image = "DecoSign(PizzaRestaurant).png",
			Description = "A sign displayed over a pizza restaurant.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Sign (Subway Transit)"] = {
			Name = "Sign (Subway Transit)",
			Image = "DecoSign(SubwayTransit).png",
			Description = "A sign showing the subway transit system entrance.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Sign (Video Game Store)"] = {
			Name = "Sign (Video Game Store)",
			Image = "DecoSign(VideoGameStore).png",
			Description = "A sign displayed over a store that sells video games.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Soda Fountain Machine"] = {
			Name = "Soda Fountain Machine",
			Image = "DecoSodaFountainMachine.png",
			Description = "A soda dispersing machine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Speaker"] = {
			Name = "Speaker",
			Image = "DecoSpeaker.png",
			Description = "A piece of electronic equipment to amplify sound.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Stage Audio Monitor"] = {
			Name = "Stage Audio Monitor",
			Image = "DecoStageAudioMonitor.png",
			Description = "An audio monitor used for stage performances.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Subway Seating (2 Seat)"] = {
			Name = "Subway Seating (2 Seat)",
			Image = "DecoSubwaySeating(2Seat).png",
			Description = "A group of two subway train seats.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Subway Seating (4 Seat)"] = {
			Name = "Subway Seating (4 Seat)",
			Image = "DecoSubwaySeating(4Seat).png",
			Description = "A group of four subway train seats.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Subway Ticket Vending Machine"] = {
			Name = "Subway Ticket Vending Machine",
			Image = "DecoSubwayTicketVendingMachine.png",
			Description = "A vending machine that sells tickets to ride the subway.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Subway Turnstile"] = {
			Name = "Subway Turnstile",
			Image = "DecoSubwayTurnstile.png",
			Description = "The turnstile used in subway stations to regulate the flow of passengers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Plastids" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Subway Turnstile Gate"] = {
			Name = "Subway Turnstile Gate",
			Image = "DecoSubwayTurnstileGate.png",
			Description = "The gate used in subway stations to regulate the flow of passengers.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Surface Town Movie Poster"] = {
			Name = "Surface Town Movie Poster",
			Image = "DecoSurfaceTownMoviePoster.png",
			Description = "A poster display box showcasing advertisements.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Table (Round)"] = {
			Name = "Table (Round)",
			Image = "DecoTable(Round).png",
			Description = "A round table.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Television (Mounted)"] = {
			Name = "Television (Mounted)",
			Image = "DecoTelevision(Mounted).png",
			Description = "A wall mounted television.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Toilet (Portable)"] = {
			Name = "Toilet (Portable)",
			Image = "DecoToilet(Portable).png",
			Description = "A portable toilet used at construction sites.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Trash Bin (Wood)"] = {
			Name = "Trash Bin (Wood)",
			Image = "DecoTrashBin(Wood).png",
			Description = "A wooden trash bin used in shopping malls.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Trash Can (Round)"] = {
			Name = "Trash Can (Round)",
			Image = "DecoTrashCan(Round).png",
			Description = "A round trash can used in public areas to dispose of waste.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Trash Can (Square)"] = {
			Name = "Trash Can (Square)",
			Image = "DecoTrashCan(Square).png",
			Description = "A square shaped trash can used in public areas to dispose of waste.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Salvage" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tree Guard (Metal)"] = {
			Name = "Tree Guard (Metal)",
			Image = "DecoTreeGuard(Metal).png",
			Description = "A rusted metal enclosure used to guard the base of small trees.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Vcr (Mounted)"] = {
			Name = "Vcr (Mounted)",
			Image = "DecoVcr(Mounted).png",
			Description = "A mounted video cassette recorder ready to be paired with a television.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Water Tank"] = {
			Name = "Water Tank",
			Image = "DecoWaterTank.png",
			Description = "A large portable water tank.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wood Table (Round)"] = {
			Name = "Wood Table (Round)",
			Image = "DecoWoodTable(Round).png",
			Description = "A round wood table.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Neural Sensors" }
				}
			}
		},
		["Wooden Pallet Crate"] = {
			Name = "Wooden Pallet Crate",
			Image = "DecoWoodenPalletCrate.png",
			Description = "A large wooden crate with a build in pallet base.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Wooden Table (Square)"] = {
			Name = "Wooden Table (Square)",
			Image = "DecoWoodenTable(Square).png",
			Description = "A square wooden table.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		}
	},
	Tenno = {
		["Armored Grineer Statue"] = {
			Name = "Armored Grineer Statue",
			Image = "DecoArmoredGrineerStatue.png",
			Description = "A statue of an armored Grineer.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 7500,
				Resources = {
					{ Count = 400, Name = "Ferrite" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 200, Name = "Circuits" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Arrival Gate"] = {
			Name = "Arrival Gate",
			Image = "DecoArrivalGate.png",
			Description = "Changes the entry point for Tenno arriving in the Dojo. Only one Arrival Gate can be placed in a Dojo.",
			Cost = {
				Capacity = 1,
				Time = 0,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		},
		["Aru Stone Lantern"] = {
			Name = "Aru Stone Lantern",
			Image = "DecoAruStoneLantern.png",
			Description = "A stone lantern",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 150, Name = "Circuits" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Ascension Altar"] = {
			Name = "Ascension Altar",
			Image = "DecoAscensionAltar.png",
			Description = "A place to pledge allegiance to the clan so that it may ascent to the next Clan Rank.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 1000,
				Resources = {
					{ Count = 1500, Name = "Salvage" },
					{ Count = 600, Name = "Alloy Plate" },
					{ Count = 0.05, Name = "Forma" }
				}
			}
		},
		["Autumn Maple Tree"] = {
			Name = "Autumn Maple Tree",
			Image = "DecoAutumnMapleTree.png",
			Description = "A maple tree that has started shedding some of its leaves.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.08, Name = "Neurodes" }
				}
			}
		},
		["Baseless Stone Fountain"] = {
			Name = "Baseless Stone Fountain",
			Image = "DecoBaselessStoneFountain.png",
			Description = "A fountain that cascades water down a pile of stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 250, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Bronze Buddha Statue"] = {
			Name = "Bronze Buddha Statue",
			Image = "DecoBronzeBuddhaStatue.png",
			Description = "A bronze statue of an Ancient Figure.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 130, Name = "Alloy Plate" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bronze Dragon Statue"] = {
			Name = "Bronze Dragon Statue",
			Image = "DecoBronzeDragonStatue.png",
			Description = "A bronze statue of a Dragon.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 125, Name = "Alloy Plate" },
					{ Count = 125, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bronze Foo Dog Statue"] = {
			Name = "Bronze Foo Dog Statue",
			Image = "DecoBronzeFooDogStatue.png",
			Description = "A bronze statue of a Foo Dog.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 120, Name = "Alloy Plate" },
					{ Count = 130, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bronze Incense Burner Statue"] = {
			Name = "Bronze Incense Burner Statue",
			Image = "DecoBronzeIncenseBurnerStatue.png",
			Description = "A bronze statue of an Incense Burner.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Bronze Turtle Dragon Statue"] = {
			Name = "Bronze Turtle Dragon Statue",
			Image = "DecoBronzeTurtleDragonStatue.png",
			Description = "A bronze statue of a Turtle Dragon.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 100, Name = "Alloy Plate" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Cairn"] = {
			Name = "Cairn",
			Image = "DecoCairn.png",
			Description = "Stones stacked together, marked a memorial to those lost forevermore.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 150, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Chokkan Fountain"] = {
			Name = "Chokkan Fountain",
			Image = "DecoChokkanFountain.png",
			Description = "A fountain constructed from stone and bamboo.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 125, Name = "Polymer Bundle" },
					{ Count = 125, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Daru Zen Sand Garden"] = {
			Name = "Daru Zen Sand Garden",
			Image = "DecoDaruZenSandGarden.png",
			Description = "A small sand garden featuring a large stone.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 400,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Dokomo Bell"] = {
			Name = "Dokomo Bell",
			Image = "DecoDokomoBell.png",
			Description = "An ornamental bell hanging from a traditional arch.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Drum 1"] = {
			Name = "Drum 1",
			Image = "DecoDrum1.png",
			Description = "Drum (Low C note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 2"] = {
			Name = "Drum 2",
			Image = "DecoDrum2.png",
			Description = "Drum (Low F note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 3"] = {
			Name = "Drum 3",
			Image = "DecoDrum3.png",
			Description = "Drum (Low B note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 4"] = {
			Name = "Drum 4",
			Image = "DecoDrum4.png",
			Description = "Drum (Middle E note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 5"] = {
			Name = "Drum 5",
			Image = "DecoDrum5.png",
			Description = "Drum (Middle A note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 6"] = {
			Name = "Drum 6",
			Image = "DecoDrum6.png",
			Description = "Drum (High D note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 7"] = {
			Name = "Drum 7",
			Image = "DecoDrum7.png",
			Description = "Drum (High G note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Drum 8"] = {
			Name = "Drum 8",
			Image = "DecoDrum8.png",
			Description = "Drum (High C note).",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Female Grineer Statue"] = {
			Name = "Female Grineer Statue",
			Image = "DecoFemaleGrineerStatue.png",
			Description = "A statue of a female Grineer.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 7500,
				Resources = {
					{ Count = 400, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Floor Medallion Eight"] = {
			Name = "Floor Medallion Eight",
			Image = "DecoFloorMedallionEight.png",
			Description = "Part of the medallion series!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Alloy Plate" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Floor Medallion Nine"] = {
			Name = "Floor Medallion Nine",
			Image = "DecoFloorMedallionNine.png",
			Description = "Part of the medallion series!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Floor Medallion Three"] = {
			Name = "Floor Medallion Three",
			Image = "DecoFloorMedallionThree.png",
			Description = "Part of the medallion series!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Fumiro Zen Sand Garden"] = {
			Name = "Fumiro Zen Sand Garden",
			Image = "DecoFumiroZenSandGarden.png",
			Description = "A medium-sized sand garden featuring shrubs and stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 200, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.05, Name = "Gallium" }
				}
			}
		},
		["Garden Arch"] = {
			Name = "Garden Arch",
			Image = "DecoGardenArch.png",
			Description = "A large, wooden archway.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Salvage" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Gallium" }
				}
			}
		},
		["Gomeka Bell"] = {
			Name = "Gomeka Bell",
			Image = "DecoGomekaBell.png",
			Description = "An ornamental bell crafted by Tenno artisans.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Grineer Marine Statue"] = {
			Name = "Grineer Marine Statue",
			Image = "DecoGrineerMarineStatue.png",
			Description = "A statue of a Grineer Marine.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 7500,
				Resources = {
					{ Count = 400, Name = "Nano Spores" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Orokin Cell" }
				}
			}
		},
		["Hokidachi Fountain"] = {
			Name = "Hokidachi Fountain",
			Image = "DecoHokidachiFountain.png",
			Description = "A fountain constructed from stone and bamboo.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 130, Name = "Polymer Bundle" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Incense Container"] = {
			Name = "Incense Container",
			Image = "DecoIncenseContainer.png",
			Description = "It makes sense to add incense to your room.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 150, Name = "Circuits" },
					{ Count = 0.08, Name = "Gallium" }
				}
			}
		},
		["Iyoro Bell"] = {
			Name = "Iyoro Bell",
			Image = "DecoIyoroBell.png",
			Description = "An ornamental bell crafted by Tenno artisans.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Jakari Bell"] = {
			Name = "Jakari Bell",
			Image = "DecoJakariBell.png",
			Description = "An ornamental bell hanging from a traditional arch.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Katsuen Bell"] = {
			Name = "Katsuen Bell",
			Image = "DecoKatsuenBell.png",
			Description = "An ornamental bell hanging from a traditional arch.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Koi Pond"] = {
			Name = "Koi Pond",
			Image = "DecoKoiPond.png",
			Description = "A beautiful pond for your Kio to flourish.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Orokin Cell" }
				}
			}
		},
		["Leaning Maple Tree"] = {
			Name = "Leaning Maple Tree",
			Image = "DecoLeaningMapleTree.png",
			Description = "A maple tree whose boughs lean to one side.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 200, Name = "Polymer Bundle" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.08, Name = "Neurodes" }
				}
			}
		},
		["Lech Kril Statue"] = {
			Name = "Lech Kril Statue",
			Image = "DecoLechKrilStatue.png",
			Description = "A statue of Lech Kril.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 7500,
				Resources = {
					{ Count = 500, Name = "Ferrite" },
					{ Count = 270, Name = "Alloy Plate" },
					{ Count = 300, Name = "Plastids" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		},
		["Ligumi Zen Garden Island"] = {
			Name = "Ligumi Zen Garden Island",
			Image = "DecoLigumiZenGardenIsland.png",
			Description = "A medium-sized stone island featuring a young maple tree.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Maho Zen Sand Garden"] = {
			Name = "Maho Zen Sand Garden",
			Image = "DecoMahoZenSandGarden.png",
			Description = "A long sand garden featuring shrubs and stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Miyeti Zen Garden Island"] = {
			Name = "Miyeti Zen Garden Island",
			Image = "DecoMiyetiZenGardenIsland.png",
			Description = "A small stone island featuring a young tree.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Nishan Bell"] = {
			Name = "Nishan Bell",
			Image = "DecoNishanBell.png",
			Description = "An ornamental bell hanging from a traditional arch.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Planter"] = {
			Name = "Planter",
			Image = "DecoPlanter.png",
			Description = "Spruce up your room with this stylish planter.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Pruned Bush"] = {
			Name = "Pruned Bush",
			Image = "DecoPrunedBush.png",
			Description = "A lovingly pruned bush.",
			Cost = {
				Capacity = 2,
				Time = 18,
				Credits = 450,
				Resources = {
					{ Count = 250, Name = "Nano Spores" },
					{ Count = 150, Name = "Polymer Bundle" },
					{ Count = 75, Name = "Plastids" },
					{ Count = 0.04, Name = "Neurodes" }
				}
			}
		},
		["Ramu Pillar Lantern"] = {
			Name = "Ramu Pillar Lantern",
			Image = "DecoRamuPillarLantern.png",
			Description = "An inset, stone lantern.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 150, Name = "Alloy Plate" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Rock Sculpture"] = {
			Name = "Rock Sculpture",
			Image = "DecoRockSculpture.png",
			Description = "A natural rock sculpture.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Alloy Plate" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Rodoko Zen Garden Island"] = {
			Name = "Rodoko Zen Garden Island",
			Image = "DecoRodokoZenGardenIsland.png",
			Description = "A small stone island featuring a bronze statue.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.1, Name = "Gallium" }
				}
			}
		},
		["Shakan Fountain"] = {
			Name = "Shakan Fountain",
			Image = "DecoShakanFountain.png",
			Description = "A fountain constructed from stone and bamboo.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 140, Name = "Polymer Bundle" },
					{ Count = 110, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Sinsino Bell"] = {
			Name = "Sinsino Bell",
			Image = "DecoSinsinoBell.png",
			Description = "An ornamental bell crafted by Tenno artisans.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Soru Stone Lantern"] = {
			Name = "Soru Stone Lantern",
			Image = "DecoSoruStoneLantern.png",
			Description = "A stone lantern.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 125, Name = "Circuits" },
					{ Count = 125, Name = "Plastids" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Spring Maple Tree"] = {
			Name = "Spring Maple Tree",
			Image = "DecoSpringMapleTree.png",
			Description = "A maple tree that is in full bloom.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 250, Name = "Polymer Bundle" },
					{ Count = 250, Name = "Plastids" },
					{ Count = 0.08, Name = "Neurodes" }
				}
			}
		},
		["Stone Fountain"] = {
			Name = "Stone Fountain",
			Image = "DecoStoneFountain.png",
			Description = "A fountain that cascades water down a pile of stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 250, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.05, Name = "Control Module" }
				}
			}
		},
		["Storage Crate"] = {
			Name = "Storage Crate",
			Image = "DecoStorageCrate.png",
			Description = "A crate Tenno use to store items.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 350, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 110, Name = "Circuits" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Summer Maple Tree"] = {
			Name = "Summer Maple Tree",
			Image = "DecoSummerMapleTree.png",
			Description = "A maple tree being tended to by fireflies.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 800,
				Resources = {
					{ Count = 600, Name = "Nano Spores" },
					{ Count = 250, Name = "Polymer Bundle" },
					{ Count = 300, Name = "Plastids" },
					{ Count = 0.08, Name = "Neurodes" }
				}
			}
		},
		["Tenno 8m Trim"] = {
			Name = "Tenno 8m Trim",
			Image = "DecoTenno8mTrim.png",
			Description = "A long 8m section of trim.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Ai Systems Interface"] = {
			Name = "Tenno Ai Systems Interface",
			Image = "DecoTennoAiSystemsInterface.png",
			Description = "A small computer system to interface with Tenno AI.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 130, Name = "Nano Spores" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tenno Architectural Pillar Base"] = {
			Name = "Tenno Architectural Pillar Base",
			Image = "DecoTennoArchitecturalPillarBase.png",
			Description = "A base used with Tenno architectural pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Banner A"] = {
			Name = "Tenno Banner A",
			Image = "DecoTennoBannerA.png",
			Description = "Floor standing Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner B"] = {
			Name = "Tenno Banner B",
			Image = "DecoTennoBannerB.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner C"] = {
			Name = "Tenno Banner C",
			Image = "DecoTennoBannerC.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner D"] = {
			Name = "Tenno Banner D",
			Image = "DecoTennoBannerD.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner E"] = {
			Name = "Tenno Banner E",
			Image = "DecoTennoBannerE.png",
			Description = "Floor standing Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner F"] = {
			Name = "Tenno Banner F",
			Image = "DecoTennoBannerF.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner G"] = {
			Name = "Tenno Banner G",
			Image = "DecoTennoBannerG.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner H"] = {
			Name = "Tenno Banner H",
			Image = "DecoTennoBannerH.png",
			Description = "Ceiling mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner I"] = {
			Name = "Tenno Banner I",
			Image = "DecoTennoBannerI.png",
			Description = "Floor standing Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner J"] = {
			Name = "Tenno Banner J",
			Image = "DecoTennoBannerJ.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner K"] = {
			Name = "Tenno Banner K",
			Image = "DecoTennoBannerK.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner L"] = {
			Name = "Tenno Banner L",
			Image = "DecoTennoBannerL.png",
			Description = "Ceiling mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner M"] = {
			Name = "Tenno Banner M",
			Image = "DecoTennoBannerM.png",
			Description = "Floor standing Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner N"] = {
			Name = "Tenno Banner N",
			Image = "DecoTennoBannerN.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner O"] = {
			Name = "Tenno Banner O",
			Image = "DecoTennoBannerO.png",
			Description = "Wall mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Banner P"] = {
			Name = "Tenno Banner P",
			Image = "DecoTennoBannerP.png",
			Description = "Ceiling mounted Tenno banner.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Tenno Breach Repair Plate"] = {
			Name = "Tenno Breach Repair Plate",
			Image = "DecoTennoBreachRepairPlate.png",
			Description = "A large plate used by the Tenno to repair breaches to structural damage.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Bulkhead Pillar"] = {
			Name = "Tenno Bulkhead Pillar",
			Image = "DecoTennoBulkheadPillar.png",
			Description = "A Tenno designed bulkhead pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk 3 Way Connector"] = {
			Name = "Tenno Catwalk 3 Way Connector",
			Image = "DecoTennoCatwalk3WayConnector.png",
			Description = "The standard Tenno catwalk 3 way connector.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk 4 Way Connector"] = {
			Name = "Tenno Catwalk 4 Way Connector",
			Image = "DecoTennoCatwalk4WayConnector.png",
			Description = "The standard Tenno catwalk 4 way connector.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk 4m"] = {
			Name = "Tenno Catwalk 4m",
			Image = "DecoTennoCatwalk4m.png",
			Description = "The standard Tenno catwalk 4m section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk 8m"] = {
			Name = "Tenno Catwalk 8m",
			Image = "DecoTennoCatwalk8m.png",
			Description = "The standard Tenno catwalk 8m section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk Corner Connector"] = {
			Name = "Tenno Catwalk Corner Connector",
			Image = "DecoTennoCatwalkCornerConnector.png",
			Description = "The standard Tenno catwalk corner connector.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk End Cap"] = {
			Name = "Tenno Catwalk End Cap",
			Image = "DecoTennoCatwalkEndCap.png",
			Description = "The standard Tenno catwalk end cap.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Catwalk Ramp"] = {
			Name = "Tenno Catwalk Ramp",
			Image = "DecoTennoCatwalkRamp.png",
			Description = "The standard Tenno catwalk ramp section.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 50, Name = "Oxium" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Ceiling Light Fixture"] = {
			Name = "Tenno Ceiling Light Fixture",
			Image = "DecoTennoCeilingLightFixture.png",
			Description = "A very large ceiling light fixture used by the Tenno.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tenno Curved Window With Pillars"] = {
			Name = "Tenno Curved Window With Pillars",
			Image = "DecoTennoCurvedWindowWithPillars.png",
			Description = "A large Tenno window with integrated pillars.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Energy Relay"] = {
			Name = "Tenno Energy Relay",
			Image = "DecoTennoEnergyRelay.png",
			Description = "A small relay used in Tenno energy systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Energy Turbine"] = {
			Name = "Tenno Energy Turbine",
			Image = "DecoTennoEnergyTurbine.png",
			Description = "A large Tenno energy turbine.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Energy Turbine Nacelle"] = {
			Name = "Tenno Energy Turbine Nacelle",
			Image = "DecoTennoEnergyTurbineNacelle.png",
			Description = "A large nacelle used with different Tenno turbine systems.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Entrance Pillar"] = {
			Name = "Tenno Entrance Pillar",
			Image = "DecoTennoEntrancePillar.png",
			Description = "A pillar used in Tenno architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Floor Marker Quarter"] = {
			Name = "Tenno Floor Marker Quarter",
			Image = "DecoTennoFloorMarkerQuarter.png",
			Description = "A small quartered section of a Tenno floor marker decoration.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Inspirational Display"] = {
			Name = "Tenno Inspirational Display",
			Image = "DecoTennoInspirationalDisplay.png",
			Description = "A large Tenno sign that displays inspirational information.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Inspirational Wall Display"] = {
			Name = "Tenno Inspirational Wall Display",
			Image = "DecoTennoInspirationalWallDisplay.png",
			Description = "A large Tenno wall sign that displays inspirational information.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 200, Name = "Ferrite" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior 4m Wall With Window"] = {
			Name = "Tenno Interior 4m Wall With Window",
			Image = "DecoTennoInterior4mWallWithWindow.png",
			Description = "A small 4m section of a Tenno wall made of glass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior 8m Wall With Window"] = {
			Name = "Tenno Interior 8m Wall With Window",
			Image = "DecoTennoInterior8mWallWithWindow.png",
			Description = "A small 8m section of a Tenno wall made of glass.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior Ornate Wall 2m Section"] = {
			Name = "Tenno Interior Ornate Wall 2m Section",
			Image = "DecoTennoInteriorOrnateWall2mSection.png",
			Description = "A small 2m section of an ornate Tenno wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior Ornate Wall 4m Section"] = {
			Name = "Tenno Interior Ornate Wall 4m Section",
			Image = "DecoTennoInteriorOrnateWall4mSection.png",
			Description = "A small 4m section of an ornate Tenno wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior Wall 2m Section"] = {
			Name = "Tenno Interior Wall 2m Section",
			Image = "DecoTennoInteriorWall2mSection.png",
			Description = "A small 2m section of interior wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Interior Wall 4m Section"] = {
			Name = "Tenno Interior Wall 4m Section",
			Image = "DecoTennoInteriorWall4mSection.png",
			Description = "A small 4m section on interior wall.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Light Standard"] = {
			Name = "Tenno Light Standard",
			Image = "DecoTennoLightStandard.png",
			Description = "A small light housing used by the Tenno.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Tenno Ordained Floor Marker"] = {
			Name = "Tenno Ordained Floor Marker",
			Image = "DecoTennoOrdainedFloorMarker.png",
			Description = "A large ordained Tenno floor decoration.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Alloy Plate" },
					{ Count = 200, Name = "Salvage" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Pillar"] = {
			Name = "Tenno Pillar",
			Image = "DecoTennoPillar.png",
			Description = "The main section of the Tenno pillar structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Pillar Base"] = {
			Name = "Tenno Pillar Base",
			Image = "DecoTennoPillarBase.png",
			Description = "The base of the Tenno architecture pillar structure.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Shrine"] = {
			Name = "Tenno Shrine",
			Image = "DecoTennoShrine.png",
			Description = "A shrine to the lost Tenno of old",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Alloy Plate" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Tenno Storage Locker"] = {
			Name = "Tenno Storage Locker",
			Image = "DecoTennoStorageLocker.png",
			Description = "A small Tenno storage locker.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Traditional Decorative Arch"] = {
			Name = "Tenno Traditional Decorative Arch",
			Image = "DecoTennoTraditionalDecorativeArch.png",
			Description = "A traditional Tenno decorative arch.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Triumphant Monument Arch"] = {
			Name = "Tenno Triumphant Monument Arch",
			Image = "DecoTennoTriumphantMonumentArch.png",
			Description = "A large arch that keeps the memory of past battles.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Wall Pillar"] = {
			Name = "Tenno Wall Pillar",
			Image = "DecoTennoWallPillar.png",
			Description = "A large Tenno pillar.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tenno Wall Trim"] = {
			Name = "Tenno Wall Trim",
			Image = "DecoTennoWallTrim.png",
			Description = "A small wall trim used in common Tenno architecture.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Tetuon Bell"] = {
			Name = "Tetuon Bell",
			Image = "DecoTetuonBell.png",
			Description = "An ornamental bell crafted by Tenno artisans.",
			Cost = {
				Capacity = 2,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Nano Spores" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 0.08, Name = "Morphics" }
				}
			}
		},
		["Tondo Floor Panel"] = {
			Name = "Tondo Floor Panel",
			Image = "DecoTondoFloorPanel.png",
			Description = "A circular floor panel",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Plastids" },
					{ Count = 100, Name = "Alloy Plate" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Topiary Bush (Large)"] = {
			Name = "Topiary Bush (Large)",
			Image = "DecoTopiaryBush(Large).png",
			Description = "A large topiary bush.",
			Cost = {
				Capacity = 1,
				Time = 24,
				Credits = 600,
				Resources = {
					{ Count = 350, Name = "Nano Spores" },
					{ Count = 150, Name = "Polymer Bundle" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.06, Name = "Neurodes" }
				}
			}
		},
		["Topiary Bush (Small)"] = {
			Name = "Topiary Bush (Small)",
			Image = "DecoTopiaryBush(Small).png",
			Description = "A small topiary bush.",
			Cost = {
				Capacity = 1,
				Time = 12,
				Credits = 200,
				Resources = {
					{ Count = 200, Name = "Nano Spores" },
					{ Count = 100, Name = "Polymer Bundle" },
					{ Count = 50, Name = "Plastids" },
					{ Count = 0.03, Name = "Neurodes" }
				}
			}
		},
		["Trading Post"] = {
			Name = "Trading Post",
			Image = "DecoTradingPost.png",
			Description = "The Trading Post allows clan members to trade Mods and keys in the Dojo.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 1000,
				Resources = {
					{ Count = 1000, Name = "Nano Spores" },
					{ Count = 500, Name = "Alloy Plate" },
					{ Count = 0.05, Name = "Forma" }
				}
			}
		},
		["Transporter"] = {
			Name = "Transporter",
			Image = "DecoTransporter.png",
			Description = "Create a macroscopic, temporal rift that will instantaneously relocate you to another Transporter.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 400, Name = "Salvage" },
					{ Count = 150, Name = "Circuits" },
					{ Count = 100, Name = "Rubedo" },
					{ Count = 35, Name = "Oxium" }
				}
			}
		},
		["Treasury"] = {
			Name = "Treasury",
			Image = "DecoTreasury.png",
			Description = "Contribute credits directly to your Clan or Alliance vault.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 1000,
				Resources = {
					{ Count = 1000, Name = "Nano Spores" },
					{ Count = 500, Name = "Alloy Plate" },
					{ Count = 0.05, Name = "Forma" }
				}
			}
		},
		["Tributa Statue"] = {
			Name = "Tributa Statue",
			Image = "DecoTributaStatue.png",
			Description = "Honor, support or commemorate a fellow Tenno with this venerated sculpture.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 100, Name = "Circuits" },
					{ Count = 0.07, Name = "Neurodes" }
				}
			}
		},
		["Wooden Bench"] = {
			Name = "Wooden Bench",
			Image = "DecoWoodenBench.png",
			Description = "A wooden bench mounted on top of a pile of stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 400, Name = "Ferrite" },
					{ Count = 125, Name = "Rubedo" },
					{ Count = 125, Name = "Plastids" },
					{ Count = 0.06, Name = "Morphics" }
				}
			}
		},
		["Wooden Bridge"] = {
			Name = "Wooden Bridge",
			Image = "DecoWoodenBridge.png",
			Description = "A large, wooden bridge.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 600, Name = "Salvage" },
					{ Count = 175, Name = "Rubedo" },
					{ Count = 175, Name = "Plastids" },
					{ Count = 0.07, Name = "Gallium" }
				}
			}
		},
		["Wooden Fountain"] = {
			Name = "Wooden Fountain",
			Image = "DecoWoodenFountain.png",
			Description = "A large, wooden fountain flowing into a basin.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 250, Name = "Nano Spores" },
					{ Count = 150, Name = "Circuits" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.07, Name = "Control Module" }
				}
			}
		},
		["Wooden Totem"] = {
			Name = "Wooden Totem",
			Image = "DecoWoodenTotem.png",
			Description = "A large sculpture constructed from wooden beams.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 750,
				Resources = {
					{ Count = 500, Name = "Salvage" },
					{ Count = 200, Name = "Rubedo" },
					{ Count = 150, Name = "Plastids" },
					{ Count = 0.08, Name = "Gallium" }
				}
			}
		},
		["Yin-Yang Garden"] = {
			Name = "Yin-Yang Garden",
			Image = "DecoYin-YangGarden.png",
			Description = "A garden designed around an ancient symbol illustrating the philosophy of balance.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 150, Name = "Rubedo" },
					{ Count = 100, Name = "Plastids" },
					{ Count = 0.07, Name = "Morphics" }
				}
			}
		},
		["Yoshijo Zen Sand Garden"] = {
			Name = "Yoshijo Zen Sand Garden",
			Image = "DecoYoshijoZenSandGarden.png",
			Description = "A medium-sized sand garden featuring shrubs and stones.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Ferrite" },
					{ Count = 200, Name = "Alloy Plate" },
					{ Count = 50, Name = "Rubedo" },
					{ Count = 0.01, Name = "Gallium" }
				}
			}
		}
	},
	Visitors = {
		["Ostron Explorer (Standing)"] = {
			Name = "Ostron Explorer (Standing)",
			Image = "DecoOstronExplorer(Standing).png",
			Description = "This Ostron likes to collect trinkets and makes sure to always have a gathering bag or two handy.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Neurodes" },
					{ Count = 400, Name = "Rubedo" },
					{ Count = 1100, Name = "Ferrite" },
					{ Count = 5, Name = "Grokdrul" }
				}
			}
		},
		["Ostron Gatherer (Standing)"] = {
			Name = "Ostron Gatherer (Standing)",
			Image = "DecoOstronGatherer(Standing).png",
			Description = "This Ostron has never before left Cetus, excited by the thought of grand adventure.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Neurodes" },
					{ Count = 400, Name = "Rubedo" },
					{ Count = 1100, Name = "Ferrite" },
					{ Count = 5, Name = "Grokdrul" }
				}
			}
		},
		["Ostron Relaxed (Seated)"] = {
			Name = "Ostron Relaxed (Seated)",
			Image = "DecoOstronRelaxed(Seated).png",
			Description = "This Ostron has a bad leg but an excellent cowl.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Neurodes" },
					{ Count = 400, Name = "Rubedo" },
					{ Count = 1100, Name = "Ferrite" },
					{ Count = 5, Name = "Grokdrul" }
				}
			}
		},
		["Ostron Trader Woman (Standing)"] = {
			Name = "Ostron Trader Woman (Standing)",
			Image = "DecoOstronTraderWoman(Standing).png",
			Description = "This Ostron woman says she is determined to see the Origin System while she's still young.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Neurodes" },
					{ Count = 400, Name = "Rubedo" },
					{ Count = 1100, Name = "Ferrite" },
					{ Count = 5, Name = "Grokdrul" }
				}
			}
		},
		["Solaris Foreman (Standing)"] = {
			Name = "Solaris Foreman (Standing)",
			Image = "DecoSolarisForeman(Standing).png",
			Description = "This Solaris worker is a respected crew chief, and will ensure that the Dojo continues to run smoothly.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Morphics" },
					{ Count = 500, Name = "Polymer Bundle" },
					{ Count = 1000, Name = "Alloy Plate" },
					{ Count = 5, Name = "Thermal Sludge" }
				}
			}
		},
		["Solaris Hazard Worker (Standing)"] = {
			Name = "Solaris Hazard Worker (Standing)",
			Image = "DecoSolarisHazardWorker(Standing).png",
			Description = "After years of hazardous substance handling, this Solaris worker has been looking for a quiet place to settle down.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Morphics" },
					{ Count = 500, Name = "Polymer Bundle" },
					{ Count = 1000, Name = "Alloy Plate" },
					{ Count = 5, Name = "Thermal Sludge" }
				}
			}
		},
		["Solaris Rig Jockey (Seated)"] = {
			Name = "Solaris Rig Jockey (Seated)",
			Image = "DecoSolarisRigJockey(Seated).png",
			Description = "This Solaris worker is on break, and has been for quite some time...",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Morphics" },
					{ Count = 500, Name = "Polymer Bundle" },
					{ Count = 1000, Name = "Alloy Plate" },
					{ Count = 5, Name = "Thermal Sludge" }
				}
			}
		},
		["Solaris Rig Jockey (Standing)"] = {
			Name = "Solaris Rig Jockey (Standing)",
			Image = "DecoSolarisRigJockey(Standing).png",
			Description = "This helpful Solaris worker will keep a close eye on the Dojo.",
			Cost = {
				Capacity = 25,
				Time = 0,
				Credits = 100,
				Resources = {
					{ Count = 1, Name = "Morphics" },
					{ Count = 500, Name = "Polymer Bundle" },
					{ Count = 1000, Name = "Alloy Plate" },
					{ Count = 5, Name = "Thermal Sludge" }
				}
			}
		}
	},
	Trophies = {
		["Ambulas Reborn Bronze Trophy"] = {
			Name = "Ambulas Reborn Bronze Trophy",
			Image = "DecoAmbulasRebornBronzeTrophy.png",
			Description = "Commemorates the Tenno who fought back the Ambulas incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Ambulas Reborn Gold Trophy"] = {
			Name = "Ambulas Reborn Gold Trophy",
			Image = "DecoAmbulasRebornGoldTrophy.png",
			Description = "Commemorates the Tenno who fought back the Ambulas incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Ambulas Reborn Silver Trophy"] = {
			Name = "Ambulas Reborn Silver Trophy",
			Image = "DecoAmbulasRebornSilverTrophy.png",
			Description = "Commemorates the Tenno who fought back the Ambulas incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Ambulas Reborn Terracotta Trophy"] = {
			Name = "Ambulas Reborn Terracotta Trophy",
			Image = "DecoAmbulasRebornTerracottaTrophy.png",
			Description = "Commemorates the Tenno who fought back the Ambulas incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Arid Fear Bronze Trophy"] = {
			Name = "Arid Fear Bronze Trophy",
			Image = "DecoAridFearBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Arid Fear.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Arid Fear Gold Trophy"] = {
			Name = "Arid Fear Gold Trophy",
			Image = "DecoAridFearGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Arid Fear.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Arid Fear Silver Trophy"] = {
			Name = "Arid Fear Silver Trophy",
			Image = "DecoAridFearSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Arid Fear.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Arid Fear Terracotta Trophy"] = {
			Name = "Arid Fear Terracotta Trophy",
			Image = "DecoAridFearTerracottaTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Arid Fear.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},

		["Belly of the Beast Terracotta Trophy"] = {
			Name = "Belly of the Beast Terracotta Trophy",
			Image = "BotB-1-Terra.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to Operation: Belly of the Beast.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 5, Name = "Stela" },
					{ Count = 25, Name = "Entrati Obols" },
					{ Count = 25, Name = "Necracoil" },
					{ Count = 1, Name = "Entrati Lanthorn" }
				}
			}
		},
		["Belly of the Beast Bronze Trophy"] = {
			Name = "Belly of the Beast Bronze Trophy",
			Image = "BotB-2-Bronze.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to Operation: Belly of the Beast.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 5, Name = "Stela" },
					{ Count = 25, Name = "Entrati Obols" },
					{ Count = 25, Name = "Necracoil" },
					{ Count = 1, Name = "Entrati Lanthorn" }
				}
			}
		},
		["Belly of the Beast Silver Trophy"] = {
			Name = "Belly of the Beast Silver Trophy",
			Image = "BotB-3-Silver.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to Operation: Belly of the Beast.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 5, Name = "Stela" },
					{ Count = 25, Name = "Entrati Obols" },
					{ Count = 25, Name = "Necracoil" },
					{ Count = 1, Name = "Entrati Lanthorn" }
				}
			}
		},
		["Belly of the Beast Gold Trophy"] = {
			Name = "Belly of the Beast Gold Trophy",
			Image = "BotB-4-Gold.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to Operation: Belly of the Beast.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 5, Name = "Stela" },
					{ Count = 25, Name = "Entrati Obols" },
					{ Count = 25, Name = "Necracoil" },
					{ Count = 1, Name = "Entrati Lanthorn" }
				}
			}
		},
		["Breeding Grounds Bronze Trophy"] = {
			Name = "Breeding Grounds Bronze Trophy",
			Image = "DecoBreedingGroundsBronzeTrophy.png",
			Description = "In recognition of exemplary efforts during Operation Breeding Grounds.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Breeding Grounds Gold Trophy"] = {
			Name = "Breeding Grounds Gold Trophy",
			Image = "DecoBreedingGroundsGoldTrophy.png",
			Description = "In recognition of exemplary efforts during Operation Breeding Grounds.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Breeding Grounds Silver Trophy"] = {
			Name = "Breeding Grounds Silver Trophy",
			Image = "DecoBreedingGroundsSilverTrophy.png",
			Description = "In recognition of exemplary efforts during Operation Breeding Grounds.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Cicero Crisis Bronze Trophy"] = {
			Name = "Cicero Crisis Bronze Trophy",
			Image = "DecoCiceroCrisisBronzeTrophy.png",
			Description = "Awarded to the most dedicated Tenno who fought against the Grineer's deforestation attempts in the Cicero Crisis event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Cicero Crisis Gold Trophy"] = {
			Name = "Cicero Crisis Gold Trophy",
			Image = "DecoCiceroCrisisGoldTrophy.png",
			Description = "Awarded to the most dedicated Tenno who fought against the Grineer's deforestation attempts in the Cicero Crisis event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Cicero Crisis Silver Trophy"] = {
			Name = "Cicero Crisis Silver Trophy",
			Image = "DecoCiceroCrisisSilverTrophy.png",
			Description = "Awarded to the most dedicated Tenno who fought against the Grineer's deforestation attempts in the Cicero Crisis event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Cryotic Front Bronze Trophy"] = {
			Name = "Cryotic Front Bronze Trophy",
			Image = "DecoCryoticFrontBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Cryotic Front.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Cryotic Front Gold Trophy"] = {
			Name = "Cryotic Front Gold Trophy",
			Image = "DecoCryoticFrontGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Cryotic Front.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Cryotic Front Silver Trophy"] = {
			Name = "Cryotic Front Silver Trophy",
			Image = "DecoCryoticFrontSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Cryotic Front.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Dojo Remaster Bronze Trophy"] = {
			Name = "Dojo Remaster Bronze Trophy",
			Image = "DecoDojoRemasterBronzeTrophy.png",
			Description = "Awarded to only the most impressive Dojos.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Dojo Remaster Gold Trophy"] = {
			Name = "Dojo Remaster Gold Trophy",
			Image = "DecoDojoRemasterGoldTrophy.png",
			Description = "Awarded to only the most impressive Dojos.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Dojo Remaster Platinum Trophy"] = {
			Name = "Dojo Remaster Platinum Trophy",
			Image = "DecoDojoRemasterPlatinumTrophy.png",
			Description = "Awarded to only the most impressive Dojos.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Dojo Remaster Silver Trophy"] = {
			Name = "Dojo Remaster Silver Trophy",
			Image = "DecoDojoRemasterSilverTrophy.png",
			Description = "Awarded to only the most impressive Dojos.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Eight Claw Terracotta Trophy"] = {
			Name = "Eight Claw Terracotta Trophy",
			Image = "EightClaw-1-Terra.png",
			Description = "Awarded to Tenno who battled against Neci Rusalka during Operation: Eight Claw.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 0.5, Name = "Temporal Dust" },
					{ Count = 0.1, Name = "Scuttler Husk" },
					{ Count = 0.35, Name = "Rune Marrow" },
					{ Count = 2, Name = "Lamentus" }
				}
			}
		},
		["Eight Claw Bronze Trophy"] = {
			Name = "Eight Claw Bronze Trophy",
			Image = "EightClaw-2-Bronze.png",
			Description = "Awarded to Tenno who battled against Neci Rusalka during Operation: Eight Claw.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 0.5, Name = "Temporal Dust" },
					{ Count = 0.1, Name = "Scuttler Husk" },
					{ Count = 0.35, Name = "Rune Marrow" },
					{ Count = 2, Name = "Lamentus" }
				}
			}
		},
		["Eight Claw Silver Trophy"] = {
			Name = "Eight Claw Silver Trophy",
			Image = "EightClaw-3-Silver.png",
			Description = "Awarded to Tenno who battled against Neci Rusalka during Operation: Eight Claw.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 0.5, Name = "Temporal Dust" },
					{ Count = 0.1, Name = "Scuttler Husk" },
					{ Count = 0.35, Name = "Rune Marrow" },
					{ Count = 2, Name = "Lamentus" }
				}
			}
		},
		["Eight Claw Gold Trophy"] = {
			Name = "Eight Claw Gold Trophy",
			Image = "EightClaw-4-Gold.png",
			Description = "Awarded to Tenno who battled against Neci Rusalka during Operation: Eight Claw.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 0.5, Name = "Temporal Dust" },
					{ Count = 0.1, Name = "Scuttler Husk" },
					{ Count = 0.35, Name = "Rune Marrow" },
					{ Count = 2, Name = "Lamentus" }
				}
			}
		},
		["Ghost Tier Decoration"] = {
			Name = "Ghost Tier Decoration",
			Image = "DecoGhostTierDecoration.png",
			Description = "A decoration to recognize the contributions of a Clan to the broader Dojo Community.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Shadow Tier Decoration"] = {
			Name = "Shadow Tier Decoration",
			Image = "DecoShadowTierDecoration.png",
			Description = "A decoration to recognize the contributions of a Clan to the broader Dojo Community.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Storm Tier Decoration"] = {
			Name = "Storm Tier Decoration",
			Image = "DecoStormTierDecoration.png",
			Description = "A decoration to recognize the contributions of a Clan to the broader Dojo Community.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Mountain Tier Decoration"] = {
			Name = "Mountain Tier Decoration",
			Image = "DecoMountainTierDecoration.png",
			Description = "A decoration to recognize the contributions of a Clan to the broader Dojo Community.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Moon Tier Decoration"] = {
			Name = "Moon Tier Decoration",
			Image = "DecoMoonTierDecoration.png",
			Description = "A decoration to recognize the contributions of a Clan to the broader Dojo Community.",
			Cost = {
				Capacity = 3,
				Time = 0,
				Credits = 1,
				Resources = {
					{ Count = 1, Name = "Alloy Plate" }
				}
			}
		},
		["Eyes Of Blight Gold Trophy"] = {
			Name = "Eyes Of Blight Gold Trophy",
			Image = "DecoEyesOfBlightGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Eyes of Blight.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Polymer Bundle" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Ferrite" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["False Profit Bronze Trophy"] = {
			Name = "False Profit Bronze Trophy",
			Image = "DecoFalseProfitBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: False Profit.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Rubedo" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["False Profit Gold Trophy"] = {
			Name = "False Profit Gold Trophy",
			Image = "DecoFalseProfitGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: False Profit.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Rubedo" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["False Profit Silver Trophy"] = {
			Name = "False Profit Silver Trophy",
			Image = "DecoFalseProfitSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: False Profit.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Rubedo" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["False Profit Terracotta Trophy"] = {
			Name = "False Profit Terracotta Trophy",
			Image = "DecoFalseProfitTerracottaTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: False Profit.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Rubedo" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Fusion MOA Trophy"] = {
			Name = "Fusion MOA Trophy",
			Image = "DecoFusionMOATrophy.png",
			Description = "Proudly display your Fusion Moa Trophy!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Corpus) Bronze Trophy"] = {
			Name = "Gradivus Dilemma (Corpus) Bronze Trophy",
			Image = "DecoGradivusDilemma(Corpus)BronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Corpus) Gold Trophy"] = {
			Name = "Gradivus Dilemma (Corpus) Gold Trophy",
			Image = "DecoGradivusDilemma(Corpus)GoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Corpus) Silver Trophy"] = {
			Name = "Gradivus Dilemma (Corpus) Silver Trophy",
			Image = "DecoGradivusDilemma(Corpus)SilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Grineer) Bronze Trophy"] = {
			Name = "Gradivus Dilemma (Grineer) Bronze Trophy",
			Image = "DecoGradivusDilemma(Grineer)BronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Grineer) Gold Trophy"] = {
			Name = "Gradivus Dilemma (Grineer) Gold Trophy",
			Image = "DecoGradivusDilemma(Grineer)GoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Gradivus Dilemma (Grineer) Silver Trophy"] = {
			Name = "Gradivus Dilemma (Grineer) Silver Trophy",
			Image = "DecoGradivusDilemma(Grineer)SilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Gradivus Dilemma.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Hostile Mergers Bronze Trophy"] = {
			Name = "Hostile Mergers Bronze Trophy",
			Image = "DecoHostileMergersBronzeTrophy.png",
			Description = "Commemorates the Tenno who fought back the Amalgam incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Salvage" },
					{ Count = 600, Name = "Hexenon" },
					{ Count = 2000, Name = "Rubedo" },
					{ Count = 0.2, Name = "Neural Sensors" }
				}
			}
		},
		["Hostile Mergers Gold Trophy"] = {
			Name = "Hostile Mergers Gold Trophy",
			Image = "DecoHostileMergersGoldTrophy.png",
			Description = "Commemorates the Tenno who fought back the Amalgam incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Salvage" },
					{ Count = 600, Name = "Hexenon" },
					{ Count = 2000, Name = "Rubedo" },
					{ Count = 0.2, Name = "Neural Sensors" }
				}
			}
		},
		["Hostile Mergers Silver Trophy"] = {
			Name = "Hostile Mergers Silver Trophy",
			Image = "DecoHostileMergersSilverTrophy.png",
			Description = "Commemorates the Tenno who fought back the Amalgam incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Salvage" },
					{ Count = 600, Name = "Hexenon" },
					{ Count = 2000, Name = "Rubedo" },
					{ Count = 0.2, Name = "Neural Sensors" }
				}
			}
		},
		["Hostile Mergers Terracotta Trophy"] = {
			Name = "Hostile Mergers Terracotta Trophy",
			Image = "DecoHostileMergersTerracottaTrophy.png",
			Description = "Commemorates the Tenno who fought back the Amalgam incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Salvage" },
					{ Count = 600, Name = "Hexenon" },
					{ Count = 2000, Name = "Rubedo" },
					{ Count = 0.2, Name = "Neural Sensors" }
				}
			}
		},
		["Mutalist Incursions Bronze Trophy"] = {
			Name = "Mutalist Incursions Bronze Trophy",
			Image = "DecoMutalistIncursionsBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Mutalist Incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Mutalist Incursions Gold Trophy"] = {
			Name = "Mutalist Incursions Gold Trophy",
			Image = "DecoMutalistIncursionsGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Mutalist Incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Mutalist Incursions Silver Trophy"] = {
			Name = "Mutalist Incursions Silver Trophy",
			Image = "DecoMutalistIncursionsSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Mutalist Incursion.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Morphics" }
				}
			}
		},
		["Orokin Sabotage Bronze Trophy"] = {
			Name = "Orokin Sabotage Bronze Trophy",
			Image = "DecoOrokinSabotageBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Orokin Sabotage.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Orokin Sabotage Gold Trophy"] = {
			Name = "Orokin Sabotage Gold Trophy",
			Image = "DecoOrokinSabotageGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Orokin Sabotage.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Orokin Sabotage Silver Trophy"] = {
			Name = "Orokin Sabotage Silver Trophy",
			Image = "DecoOrokinSabotageSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the cause in Operation: Orokin Sabotage.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Alloy Plate" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Neurodes" }
				}
			}
		},
		["Orphix Venom Bronze Trophy"] = {
			Name = "Orphix Venom Bronze Trophy",
			Image = "DecoOrphixVenomBronzeTrophy.png",
			Description = "Members of this clan fought bravely and with honor during Operation Orphix Venom.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1200, Name = "Salvage" },
					{ Count = 500, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Control Module" }
				}
			}
		},
		["Orphix Venom Gold Trophy"] = {
			Name = "Orphix Venom Gold Trophy",
			Image = "DecoOrphixVenomGoldTrophy.png",
			Description = "Members of this clan fought bravely and with honor during Operation Orphix Venom.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1200, Name = "Salvage" },
					{ Count = 500, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Control Module" }
				}
			}
		},
		["Orphix Venom Silver Trophy"] = {
			Name = "Orphix Venom Silver Trophy",
			Image = "DecoOrphixVenomSilverTrophy.png",
			Description = "Members of this clan fought bravely and with honor during Operation Orphix Venom.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1200, Name = "Salvage" },
					{ Count = 500, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Control Module" }
				}
			}
		},
		["Orphix Venom Terracotta Trophy"] = {
			Name = "Orphix Venom Terracotta Trophy",
			Image = "DecoOrphixVenomTerracottaTrophy.png",
			Description = "Members of this clan fought bravely and with honor during Operation Orphix Venom.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1200, Name = "Salvage" },
					{ Count = 500, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Control Module" }
				}
			}
		},
		["Plague Star Bronze Trophy"] = {
			Name = "Plague Star Bronze Trophy",
			Image = "DecoPlagueStarBronzeTrophy.png",
			Description = "Commemorating clan achievements during Operation Plague Star.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 130, Name = "Alloy Plate" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 25, Name = "Hemocyte Cystolith" }
				}
			}
		},
		["Plague Star Gold Trophy"] = {
			Name = "Plague Star Gold Trophy",
			Image = "DecoPlagueStarGoldTrophy.png",
			Description = "Commemorating clan achievements during Operation Plague Star.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 130, Name = "Alloy Plate" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 100, Name = "Hemocyte Cystolith" }
				}
			}
		},
		["Plague Star Silver Trophy"] = {
			Name = "Plague Star Silver Trophy",
			Image = "DecoPlagueStarSilverTrophy.png",
			Description = "Commemorating clan achievements during Operation Plague Star.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 130, Name = "Alloy Plate" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 50, Name = "Hemocyte Cystolith" }
				}
			}
		},
		["Plague Star Terracotta Trophy"] = {
			Name = "Plague Star Terracotta Trophy",
			Image = "DecoPlagueStarTerracottaTrophy.png",
			Description = "Commemorating clan achievements during Operation Plague Star.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 500,
				Resources = {
					{ Count = 300, Name = "Nano Spores" },
					{ Count = 130, Name = "Alloy Plate" },
					{ Count = 120, Name = "Plastids" },
					{ Count = 10, Name = "Hemocyte Cystolith" }
				}
			}
		},
		["Railjack Monument"] = {
			Name = "Railjack Monument",
			Image = "DecoRailjackMonument.png",
			Description = "In recognition of the construction of a home for the Railjack, and Cephalon Cy.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 45, Name = "Carbides" },
					{ Count = 50, Name = "Titanium" },
					{ Count = 1, Name = "Asterite" },
					{ Count = 1, Name = "Nullstones" }
				}
			}
		},
		["Rathuum Bronze Trophy"] = {
			Name = "Rathuum Bronze Trophy",
			Image = "DecoRathuumBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Rathuum.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Rathuum Gold Trophy"] = {
			Name = "Rathuum Gold Trophy",
			Image = "DecoRathuumGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Rathuum.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Rathuum Silver Trophy"] = {
			Name = "Rathuum Silver Trophy",
			Image = "DecoRathuumSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Rathuum.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Rathuum Terracotta Trophy"] = {
			Name = "Rathuum Terracotta Trophy",
			Image = "DecoRathuumTerracottaTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in Operation: Rathuum.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1600, Name = "Ferrite" },
					{ Count = 600, Name = "Rubedo" },
					{ Count = 2000, Name = "Alloy Plate" },
					{ Count = 0.2, Name = "Morphics" }
				}
			}
		},
		["Shadow Debt Bronze Trophy"] = {
			Name = "Shadow Debt Bronze Trophy",
			Image = "DecoShadowDebtBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in the Shadow Debt event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Shadow Debt Gold Trophy"] = {
			Name = "Shadow Debt Gold Trophy",
			Image = "DecoShadowDebtGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in the Shadow Debt event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Shadow Debt Silver Trophy"] = {
			Name = "Shadow Debt Silver Trophy",
			Image = "DecoShadowDebtSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in the Shadow Debt event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Shadow Debt Terracotta Trophy"] = {
			Name = "Shadow Debt Terracotta Trophy",
			Image = "DecoShadowDebtTerracottaTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to the efforts in the Shadow Debt event.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Rubedo" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Sling Stone Trophy"] = {
			Name = "Sling Stone Trophy",
			Image = "DecoSlingStoneTrophy.png",
			Description = "Only the top performing clans in Operation Sling-Stone get this trophy!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Spy Drone Trophy"] = {
			Name = "Spy Drone Trophy",
			Image = "DecoSpyDroneTrophy.png",
			Description = "Only the coolest of clans can claim this elusive trophy.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Survival Weekend Bronze Trophy"] = {
			Name = "Survival Weekend Bronze Trophy",
			Image = "DecoSurvivalWeekendBronzeTrophy.png",
			Description = "You managed to survive, now let your Dojo thrive with this beautiful trophy!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Survival Weekend Gold Trophy"] = {
			Name = "Survival Weekend Gold Trophy",
			Image = "DecoSurvivalWeekendGoldTrophy.png",
			Description = "You managed to survive, now let your Dojo thrive with this beautiful trophy!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Survival Weekend Silver Trophy"] = {
			Name = "Survival Weekend Silver Trophy",
			Image = "DecoSurvivalWeekendSilverTrophy.png",
			Description = "You managed to survive, now let your Dojo thrive with this beautiful trophy!",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Salvage" },
					{ Count = 350, Name = "Circuits" },
					{ Count = 360, Name = "Polymer Bundle" },
					{ Count = 0.16, Name = "Gallium" }
				}
			}
		},
		["Tethra's Doom Bronze Trophy"] = {
			Name = "Tethra's Doom Bronze Trophy",
			Image = "DecoTethra'sDoomBronzeTrophy.png",
			Description = "Awarded to the Tenno who distinguished themselves with exemplary performance when hijacking Fomorian Power Cores.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Oxium" }
				}
			}
		},
		["Tethra's Doom Gold Trophy"] = {
			Name = "Tethra's Doom Gold Trophy",
			Image = "DecoTethra'sDoomGoldTrophy.png",
			Description = "Awarded to the Tenno who distinguished themselves with exemplary performance when hijacking Fomorian Power Cores.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Oxium" }
				}
			}
		},
		["Tethra's Doom Silver Trophy"] = {
			Name = "Tethra's Doom Silver Trophy",
			Image = "DecoTethra'sDoomSilverTrophy.png",
			Description = "Awarded to the Tenno who distinguished themselves with exemplary performance when hijacking Fomorian Power Cores.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 700, Name = "Ferrite" },
					{ Count = 350, Name = "Plastids" },
					{ Count = 360, Name = "Nano Spores" },
					{ Count = 0.16, Name = "Oxium" }
				}
			}
		},
		["The Pacifism Defect Bronze Trophy"] = {
			Name = "The Pacifism Defect Bronze Trophy",
			Image = "DecoThePacifismDefectBronzeTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to helping the Kavor escape the clutches of the Infestation and Sargas Ruk.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 1200, Name = "Salvage" },
					{ Count = 420, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		},
		["The Pacifism Defect Gold Trophy"] = {
			Name = "The Pacifism Defect Gold Trophy",
			Image = "DecoThePacifismDefectGoldTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to helping the Kavor escape the clutches of the Infestation and Sargas Ruk.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 500, Name = "Salvage" },
					{ Count = 420, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		},
		["The Pacifism Defect Silver Trophy"] = {
			Name = "The Pacifism Defect Silver Trophy",
			Image = "DecoThePacifismDefectSilverTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to helping the Kavor escape the clutches of the Infestation and Sargas Ruk.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 500, Name = "Salvage" },
					{ Count = 420, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		},
		["The Pacifism Defect Terracotta Trophy"] = {
			Name = "The Pacifism Defect Terracotta Trophy",
			Image = "DecoThePacifismDefectTerracottaTrophy.png",
			Description = "Awarded to Tenno who demonstrated extreme commitment to helping the Kavor escape the clutches of the Infestation and Sargas Ruk.",
			Cost = {
				Capacity = 3,
				Time = 24,
				Credits = 10000,
				Resources = {
					{ Count = 500, Name = "Salvage" },
					{ Count = 420, Name = "Rubedo" },
					{ Count = 420, Name = "Polymer Bundle" },
					{ Count = 0.1, Name = "Morphics" }
				}
			}
		}
	}
}
```

