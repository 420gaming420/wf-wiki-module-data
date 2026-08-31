---
title: "Module:Missions/data/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Missions/data/dev"
wiki_timestamp: "2021-09-10T22:43:03Z"
---

*Documentation for this module may be created at [Module:Missions/data/dev/doc](/w/Module:Missions/data/dev/doc?action=edit&redlink=1 "Module:Missions/data/dev/doc (page does not exist)")*

```lua
local MissionData = {
	["FactionImages"] = {
		["Grineer"] = "IconGrineerB.svg",
		["Corpus"] = "IconCorpusB.svg",
		["Infested"] = "IconInfestedB.svg",
		["Corrupted"] = "IconOrokinB.svg",
		["Crossfire"] = "InvasionIcon_b.png",
	},
	["MissionDetails"] = {
		{ Node = "Apollodorus", Planet = "Mercury", Type = "Survival",Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, Tier = "Survival1", MasteryExp = 3, InternalName = "SolNode94" },
		{ Node = "Boethius", Planet = "Mercury", Type = "Mobile Defense", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 8, MaxLevel = 10, MasteryExp = 3, InternalName = "SolNode223" },
		{ Node = "Caloris", Planet = "Mercury", Type = "Rescue", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8, Tier = "Rescue1", MasteryExp = 3, InternalName = "SolNode119" },
		{ Node = "Elion", Planet = "Mercury", Type = "Capture", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 7, MaxLevel = 9, Tier = "Capture", MasteryExp = 3, InternalName = "SolNode12" },
		{ Node = "Lares", Planet = "Mercury", Type = "Defense", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, Tier = "Defense1", Other = "B", MasteryExp = 3, InternalName = "SolNode130" },
		{ Node = "M Prime", Planet = "Mercury", Type = "Exterminate", Tileset = "Grineer Asteroid", Enemy = {"Infested", "Grineer"}, MinLevel = 7, MaxLevel = 9, MasteryExp = 3, InternalName = "SolNode103" },
		{ Node = "Odin", Planet = "Mercury", Type = "Interception", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 11, Tier = "Interception1", MasteryExp = 3, InternalName = "SolNode224" },
		{ Node = "Pantheon", Planet = "Mercury", Type = "Exterminate", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8, MasteryExp = 3, InternalName = "SolNode226" },
		{ Node = "Suisei", Planet = "Mercury", Type = "Spy", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, Tier = "Spy1", MasteryExp = 3, InternalName = "SolNode225" },
		{ Node = "Terminus", Planet = "Mercury", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = {"Infested", "Grineer"}, MinLevel = 8, MaxLevel = 10, Tier = "Reactor1", MasteryExp = 3, InternalName = "SolNode28" },
		{ Node = "Tolstoj", Planet = "Mercury", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, Tier = "Vor",  LinkName = "Captain Vor", Pic = "CaptainVor_sigil_b.png", Drops = {"Cronus","Seer"}, MasteryExp = 25, InternalName = "SolNode108" },
		
		{ Node = "Orb Vallis", Planet = "Venus", Type = "Landscape|Free Roam", Tileset = "Orb Vallis", Enemy = "Corpus", MinLevel = 10, MaxLevel = 30, Tier = "Landscape", Pic = "SolarisUnitedSigil.png", MasteryExp = 24, InternalName = "SolNode129" },
		{ Node = "Aphrodite", Planet = "Venus", Type = "Mobile Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, MasteryExp = 18, InternalName = "SolNode2" },
		{ Node = "Cytherean", Planet = "Venus", Type = "Interception", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Interception1", MasteryExp = 18, InternalName = "SolNode23" },
		{ Node = "E Gate", Planet = "Venus", Type = "Exterminate", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 5, MasteryExp = 18, InternalName = "SolNode128" },
		{ Node = "Ishtar", Planet = "Venus", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, Tier = "Reactor1", MasteryExp = 24, InternalName = "SolNode61" },
		{ Node = "Kiliken", Planet = "Venus", Type = "Excavation", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Excavation1", MasteryExp = 18, InternalName = "SolNode101" },
		{ Node = "Linea", Planet = "Venus", Type = "Rescue", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, Tier = "Rescue1", MasteryExp = 18, InternalName = "SolNode109" },
		{ Node = "Malva", Planet = "Venus", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, Tier = "DSSurvival1", DSCredits = 10, DSResourceBonus = 10, DSXPBonus = 10, DSWeaponBonus = 5, DSWeapon = 'Rifles', MasteryExp = 18, InternalName = "ClanNode1" },
		{ Node = "Montes", Planet = "Venus", Type = "Exterminate", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "AWExterminate", MasteryExp = 18, InternalName = "SolNode902" },
		{ Node = "Romula", Planet = "Venus", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, Tier = "DSDefense", DSCredits = 10, DSResourceBonus = 10, DSXPBonus = 10, DSWeaponBonus = 5, DSWeapon = 'Rifles', MasteryExp = 18, InternalName = "ClanNode0" },
		{ Node = "Tessera", Planet = "Venus", Type = "Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Defense1", Other = "E", MasteryExp = 18, InternalName = "SolNode22" },
		{ Node = "Unda", Planet = "Venus", Type = "Spy", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 4, MaxLevel = 6, Tier = "Spy1", MasteryExp = 18, InternalName = "SolNode66" },
		{ Node = "Venera", Planet = "Venus", Type = "Capture", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, Tier = "Capture", MasteryExp = 18, InternalName = "SolNode107" },
		{ Node = "V Prime", Planet = "Venus", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, Tier = "Survival1", MasteryExp = 18, InternalName = "SolNode123" },
		{ Node = "Fossa", Planet = "Venus", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, Tier = "Jackal",  LinkName = "Jackal", Pic = "Jackal_sigil_b.png", Drops = {"Rhino"}, MasteryExp = 18, InternalName = "SolNode104" },
		
		{ Node = "Plains of Eidolon", Planet = "Earth", Type = "Landscape|Free Roam", Tileset = "Plains of Eidolon", Enemy = "Grineer", MinLevel = 10, MaxLevel = 30, Tier = "Landscape", Pic = "DawnsEarlyLight.png", MasteryExp = 24, InternalName = "SolNode228" },
		{ Node = "Cambria", Planet = "Earth", Type = "Spy", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, Tier = "Spy1", MasteryExp = 24, InternalName = "SolNode79" },
		{ Node = "Cervantes", Planet = "Earth", Type = "Sabotage", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 4, MaxLevel = 6, Tier = "EarthCaches", MasteryExp = 24, InternalName = "SolNode75" },
		{ Node = "E Prime", Planet = "Earth", Type = "Exterminate", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3, MasteryExp = 24, InternalName = "SolNode27" },
		{ Node = "Erpo", Planet = "Earth", Type = "Mobile Defense", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "AWMobileDefense", MasteryExp = 24, InternalName = "SolNode903" },
		{ Node = "Eurasia", Planet = "Earth", Type = "Mobile Defense", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 3, MaxLevel = 5, MasteryExp = 24, InternalName = "SolNode59" },
		{ Node = "Everest", Planet = "Earth", Type = "Excavation", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Excavation1", MasteryExp = 24, InternalName = "SolNode39" },
		{ Node = "Gaia", Planet = "Earth", Type = "Interception", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Interception1", MasteryExp = 20, InternalName = "SolNode85" },
		{ Node = "Lith", Planet = "Earth", Type = "Defense", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, Tier = "Defense1", Other = "J", MasteryExp = 24, InternalName = "SolNode26" },
		{ Node = "Mantle", Planet = "Earth", Type = "Capture", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, Tier = "Capture", MasteryExp = 24, InternalName = "SolNode63" },
		{ Node = "Mariana", Planet = "Earth", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3, MasteryExp = 24, InternalName = "SolNode89" },
		{ Node = "Pacific", Planet = "Earth", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 3, MaxLevel = 6, Tier = "Rescue1", MasteryExp = 24, InternalName = "SolNode15" },
		{ Node = "Coba", Planet = "Earth", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, Tier = "DSDefense", DSCredits = 12, DSResourceBonus = 15, DSXPBonus = 12, DSWeaponBonus = 8, DSWeapon = 'Melee', MasteryExp = 24, InternalName = "ClanNode2" },
		{ Node = "Oro", Planet = "Earth", Type = "Assassination", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 20, MaxLevel = 25, Tier = "Vay Hek",  LinkName = "Councilor Vay Hek", Pic = "VeyHek_sigil_b.png", Drops = {"Hydroid"}, MasteryExp = 24, InternalName = "SolNode24" },
		{ Node = "Tikal", Planet = "Earth", Type = "Excavation", IsDarkSector = 1, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, Tier = "Excavation1", DSCredits = 12, DSResourceBonus = 15, DSXPBonus = 12, DSWeaponBonus = 8, DSWeapon = 'Melee', MasteryExp = 24, InternalName = "ClanNode3" },
		
		{ Node = "Alator", Planet = "Mars", Type = "Interception", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "Interception1", MasteryExp = 51, InternalName = "SolNode106" },
		{ Node = "Ara", Planet = "Mars", Type = "Capture", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, Tier = "Capture", MasteryExp = 51, InternalName = "SolNode45" },
		{ Node = "Ares", Planet = "Mars", Type = "Sabotage", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11, MasteryExp = 51, InternalName = "SolNode113" },
		{ Node = "Arval", Planet = "Mars", Type = "Spy", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11, Tier = "Spy1", MasteryExp = 51, InternalName = "SolNode41" },
		{ Node = "Augustus", Planet = "Mars", Type = "Excavation", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 14, Tier = "Excavation1", MasteryExp = 51, InternalName = "SolNode16" },
		{ Node = "Gradivus", Planet = "Mars", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 9, MaxLevel = 11, Tier = "Reactor1", MasteryExp = 45, InternalName = "SolNode65" },
		{ Node = "Hellas", Planet = "Mars", Type = "Exterminate", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, MasteryExp = 51, InternalName = "SolNode58" },
		{ Node = "Kadesh", Planet = "Mars", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Settlement", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, Tier = "DSDefense", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Pistols', MasteryExp = 51, InternalName = "ClanNode8" },
		{ Node = "Martialis", Planet = "Mars", Type = "Rescue", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, Tier = "Rescue1", MasteryExp = 51, InternalName = "SolNode36" },
		{ Node = "Olympus", Planet = "Mars", Type = "Disruption", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, Tier = "DisruptionMars", MasteryExp = 51, InternalName = "SolNode30" },
		{ Node = "Spear", Planet = "Mars", Type = "Defense", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "Defense1", Other = "B", MasteryExp = 51, InternalName = "SolNode46" },
		{ Node = "Syrtis", Planet = "Mars", Type = "Exterminate", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, Tier = "AWExterminate", MasteryExp = 51, InternalName = "SolNode904" },
		{ Node = "Tharsis", Planet = "Mars", Type = "Mobile Defense", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, MasteryExp = 51, InternalName = "SolNode11" },
		{ Node = "Ultor", Planet = "Mars", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = {"Grineer", "Corpus"}, MinLevel = 11, MaxLevel = 13, MasteryExp = 51, InternalName = "SolNode14" },
		{ Node = "Vallis", Planet = "Mars", Type = "Mobile Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13, MasteryExp = 51, InternalName = "SolNode68" },
		{ Node = "Wahiba", Planet = "Mars", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Pistols', MasteryExp = 51, InternalName = "ClanNode9" },
		{ Node = "War", Planet = "Mars", Type = "Assassination", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13, Tier = "Lech Kril", LinkName = "Lieutenant Lech Kril", Pic = "LechKril_sigil_b.png", Drops = {"Excalibur"}, MasteryExp = 51, InternalName = "SolNode99" },
		
		{ Node = "Roche", Planet = "Phobos", Type = "Exterminate", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 12, MasteryExp = 157, InternalName = "SettlementNode1" },
		{ Node = "Sharpless", Planet = "Phobos", Type = "Mobile Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13, MasteryExp = 157, InternalName = "SettlementNode15" },
		{ Node = "Gulliver", Planet = "Phobos", Type = "Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, Tier = "Defense1", Other = "C", MasteryExp = 157, InternalName = "SettlementNode11" },
		{ Node = "Kepler", Planet = "Phobos", Type = "Rush (Archwing)", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, Tier = "AWRush", MasteryExp = 157, InternalName = "SettlementNode10" },
		{ Node = "Memphis", Planet = "Phobos", Type = "Defection", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "Defection1", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee', MasteryExp = 157, InternalName = "ClanNode10" },
		{ Node = "Monolith", Planet = "Phobos", Type = "Rescue", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, Tier = "Rescue1", MasteryExp = 157, InternalName = "SettlementNode12" },
		{ Node = "Shklovsky", Planet = "Phobos", Type = "Spy", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13, Tier = "Spy1", MasteryExp = 157, InternalName = "SettlementNode14" },
		{ Node = "Skyresh", Planet = "Phobos", Type = "Capture", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, Tier = "Capture", MasteryExp = 157, InternalName = "SettlementNode2" },
		{ Node = "Stickney", Planet = "Phobos", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, Tier = "Survival1", MasteryExp = 157, InternalName = "SettlementNode3" },
		{ Node = "Zeugma", Planet = "Phobos", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSSurvival2", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Rifles', MasteryExp = 157, InternalName = "ClanNode11" },
		{ Node = "Iliad", Planet = "Phobos", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, Tier = "Sergeant",  LinkName = "The Sergeant", Pic = "NefAnyo_sigil_b.png", Drops = {"Mag"}, MasteryExp = 100, InternalName = "SettlementNode20" },
		
		{ Node = "Horend", Planet = "Deimos", Type = "Capture",  Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 12, MaxLevel = 14, Tier = "Capture", MasteryExp = 0, InternalName = "SolNode706" },
		{ Node = "Phlegyas", Planet = "Deimos", Type = "Exterminate", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 13, MaxLevel = 15, MasteryExp = 0, InternalName = "SolNode708" },
		{ Node = "Cambion Drift", Planet = "Deimos", Type = "Landscape|Free Roam", Tileset = "Cambion Drift", Enemy = "Infested", MinLevel = 20, MaxLevel = 35, Pic = "EntratiIcon.png", MasteryExp = 0, InternalName = "SolNode229" },
		{ Node = "Formido", Planet = "Deimos", Type = "Sabotage", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 14, MaxLevel = 16, Tier = "DerelictCaches", MasteryExp = 0, InternalName = "SolNode710" },
		{ Node = "Hyf", Planet = "Deimos", Type = "Defense", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 20, Tier = "DerelictDefense", MasteryExp = 0, InternalName = "SolNode707" },
		{ Node = "Dirus", Planet = "Deimos", Type = "Mobile Defense", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 17, MasteryExp = 0, InternalName = "SolNode709" },
		{ Node = "Magnacidium", Planet = "Deimos", Type = "Assassination", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 20, MaxLevel = 25, Tier = "Lephantis",  LinkName = "Lephantis", Pic = "Lephantis_sigil_b.png", Drops = {"Nekros"}, MasteryExp = 0, InternalName = "SolNode712" },
		{ Node = "Terrorem", Planet = "Deimos", Type = "Survival", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, Tier = "DerelictSurvival", MasteryExp = 0, InternalName = "SolNode711" },
		{ Node = "Exequias", Planet = "Deimos", Type = "Assassination", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "Zealoid Prelate", LinkName = "Zealoid Prelate", Pic = "ZealoidPrelate.png", Drops = {"Pathocyst"}, MasteryExp = 0, InternalName = "SolNode713" },
		
		{ Node = "Bode", Planet = "Ceres", Type = "Spy", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14, Tier = "Spy2", MasteryExp = 163, InternalName = "SolNode132" },
		{ Node = "Casta", Planet = "Ceres", Type = "Defense", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Defense1", Other = "I", MasteryExp = 163, InternalName = "SolNode149" },
		{ Node = "Cinxia", Planet = "Ceres", Type = "Interception", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Interception1", MasteryExp = 163, InternalName = "SolNode147" },
		{ Node = "Draco", Planet = "Ceres", Type = "Survival", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, Tier = "Survival2", MasteryExp = 163, InternalName = "SolNode146" },
		{ Node = "Gabii", Planet = "Ceres", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSSurvival1", DSCredits = 20, DSResourceBonus = 35, DSXPBonus = 26, DSWeaponBonus = 21, DSWeapon = 'Melee', MasteryExp = 163, InternalName = "ClanNode23" },
		{ Node = "Ker", Planet = "Ceres", Type = "Sabotage", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Reactor2", MasteryExp = 163, InternalName = "SolNode141" },
		{ Node = "Kiste", Planet = "Ceres", Type = "Mobile Defense", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15, MasteryExp = 163, InternalName = "SolNode140" },
		{ Node = "Lex", Planet = "Ceres", Type = "Capture", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Capture", MasteryExp = 163, InternalName = "SolNode139" },
		{ Node = "Ludi", Planet = "Ceres", Type = "Hijack", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17, MasteryExp = 163, InternalName = "SolNode138" },
		{ Node = "Nuovo", Planet = "Ceres", Type = "Rescue", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15, Tier = "Rescue1", MasteryExp = 163, InternalName = "SolNode137" },
		{ Node = "Pallas", Planet = "Ceres", Type = "Exterminate", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14, MasteryExp = 163, InternalName = "SolNode131" },
		{ Node = "Seimeni", Planet = "Ceres", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Shipyard", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, Tier = "DSDefense", DSCredits = 20, DSResourceBonus = 35, DSXPBonus = 26, DSWeaponBonus = 21, DSWeapon = 'Melee', MasteryExp = 163, InternalName = "ClanNode22" },
		{ Node = "Thon", Planet = "Ceres", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17, Tier = "Reactor2", MasteryExp = 163, InternalName = "SolNode135" },
		{ Node = "Exta", Planet = "Ceres", Type = "Assassination", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, Tier = "Kril and Vor 2", LinkName = "Captain Vor & Lieutenant Lech Kril", Pic = "Vor Krill Icon.png", Drops = {"Frost","Miter","Twin Gremlins"}, MasteryExp = 163, InternalName = "SolNode144" },
		
		{ Node = "Adrastea", Planet = "Jupiter", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, Tier = "Reactor2", MasteryExp = 51, InternalName = "SolNode88" },
		{ Node = "Amalthea", Planet = "Jupiter", Type = "Spy", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, Tier = "Spy2", MasteryExp = 51, InternalName = "SolNode97" },
		{ Node = "Ananke", Planet = "Jupiter", Type = "Capture", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18, Tier = "Capture", MasteryExp = 51, InternalName = "SolNode73" },
		{ Node = "Callisto", Planet = "Jupiter", Type = "Interception", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Interception2", MasteryExp = 51, InternalName = "SolNode25" },
		{ Node = "Carme", Planet = "Jupiter", Type = "Mobile Defense", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18, MasteryExp = 51, InternalName = "SolNode74" },
		{ Node = "Carpo", Planet = "Jupiter", Type = "Exterminate", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, Tier = "JupiterCaches", MasteryExp = 51, InternalName = "SolNode121" },
		{ Node = "Elara", Planet = "Jupiter", Type = "Survival", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Survival2", MasteryExp = 51, InternalName = "SolNode100" },
		{ Node = "Galilea", Planet = "Jupiter", Type = "Sabotage", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "AWSabotage", MasteryExp = 51, InternalName = "SolNode905" },
		{ Node = "Ganymede", Planet = "Jupiter", Type = "Disruption", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 30, MaxLevel = 35, Tier = "DisruptionJupiter", MasteryExp = 51, InternalName = "SolNode87" },
		{ Node = "Io", Planet = "Jupiter", Type = "Defense", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, Tier = "Defense2", Other = "H", MasteryExp = 51, InternalName = "SolNode125" },
		{ Node = "Metis", Planet = "Jupiter", Type = "Rescue", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 17, Tier = "Rescue2", MasteryExp = 51, InternalName = "SolNode126" },
		{ Node = "Thebe", Planet = "Jupiter", Type = "Sabotage", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, MasteryExp = 51, InternalName = "SolNode10" },
		{ Node = "Cameria", Planet = "Jupiter", Type = "Survival", IsDarkSector = 1, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Shotguns', MasteryExp = 51, InternalName = "ClanNode5" },
		{ Node = "Sinai", Planet = "Jupiter", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, Tier = "DSDefense", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Melee', MasteryExp = 51, InternalName = "ClanNode4" },
		{ Node = "Themisto", Planet = "Jupiter", Type = "Assassination", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, Tier = "Alad V",  LinkName = "Alad V", Pic = "AladV_sigil_b.png", Drops = {"Valkyr"}, MasteryExp = 51, InternalName = "SolNode53" },
		{ Node = "The Ropalolyst", Planet = "Jupiter", Type = "Assassination", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 40, MaxLevel = 40, Tier = "Ropalolyst",  LinkName = "Ropalolyst", Pic = "Ropalolyst.png", Drops = {"Wisp"}, MasteryExp = 55, InternalName = "SolNode740" },
		
		{ Node = "Abaddon", Planet = "Europa", Type = "Capture", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, Tier = "Capture", MasteryExp = 138, InternalName = "SolNode203" },
		{ Node = "Armaros", Planet = "Europa", Type = "Exterminate", Tileset = "Infested Ship", Enemy = {"Infested", "Grineer"}, MinLevel = 18, MaxLevel = 20, MasteryExp = 138, InternalName = "SolNode204" },
		{ Node = "Baal", Planet = "Europa", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, MasteryExp = 138, InternalName = "SolNode205" },
		{ Node = "Kokabiel", Planet = "Europa", Type = "Sabotage", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22, MasteryExp = 138, InternalName = "SolNode220" },
		{ Node = "Morax", Planet = "Europa", Type = "Mobile Defense", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, MasteryExp = 138, InternalName = "SolNode209" },
		{ Node = "Orias", Planet = "Europa", Type = "Rescue", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22, Tier = "Rescue2", MasteryExp = 138, InternalName = "SolNode217" },
		{ Node = "Ose", Planet = "Europa", Type = "Interception", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Interception2", MasteryExp = 138, InternalName = "SolNode211" },
		{ Node = "Paimon", Planet = "Europa", Type = "Defense", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Defense2", Other = "D/E/F", MasteryExp = 138, InternalName = "SolNode212" },
		{ Node = "Sorath", Planet = "Europa", Type = "Hijack", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 19, MaxLevel = 21, MasteryExp = 138, InternalName = "SolNode214" },
		{ Node = "Valac", Planet = "Europa", Type = "Spy", Tileset = "Corpus Ship", Enemy = {"Grineer", "Corpus"}, MinLevel = 18, MaxLevel = 20, Tier = "Spy2", MasteryExp = 138, InternalName = "SolNode215" },
		{ Node = "Valefor", Planet = "Europa", Type = "Excavation", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, Tier = "Excavation2", MasteryExp = 138, InternalName = "SolNode216" },
		{ Node = "Cholistan", Planet = "Europa", Type = "Excavation", IsDarkSector = 1, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, Tier = "Excavation3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 12, DSWeapon = 'Melee', MasteryExp = 138, InternalName = "ClanNode7" },
		{ Node = "Larzac", Planet = "Europa", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, Tier = "DSDefense", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 12, DSWeapon = 'Pistols', MasteryExp = 138, InternalName = "ClanNode6" },
		{ Node = "Naamah", Planet = "Europa", Type = "Assassination", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, Tier = "Raptor",  LinkName = "Raptors", Pic = "Raptor_sigil_b.png", Drops = {"Nova"}, MasteryExp = 138, InternalName = "SolNode210" },
		
		{ Node = "Anthe", Planet = "Saturn", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, Tier = "Rescue3", MasteryExp = 55, InternalName = "SolNode31" },
		{ Node = "Calypso", Planet = "Saturn", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, Tier = "Reactor2", MasteryExp = 55, InternalName = "SolNode82" },
		{ Node = "Caracol", Planet = "Saturn", Type = "Defection", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, Tier = "Defection2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Rifles', MasteryExp = 55, InternalName = "ClanNode12" },
		{ Node = "Cassini", Planet = "Saturn", Type = "Capture", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "Capture", MasteryExp = 55, InternalName = "SolNode70" },
		{ Node = "Dione", Planet = "Saturn", Type = "Spy", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "Spy2", MasteryExp = 55, InternalName = "SolNode67" },
		{ Node = "Enceladus", Planet = "Saturn", Type = "Sabotage", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25, MasteryExp = 49, InternalName = "SolNode19" },
		{ Node = "Helene", Planet = "Saturn", Type = "Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Defense2", Other = "A", MasteryExp = 55, InternalName = "SolNode42" },
		{ Node = "Keeler", Planet = "Saturn", Type = "Mobile Defense", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25, MasteryExp = 55, InternalName = "SolNode93" },
		{ Node = "Numa", Planet = "Saturn", Type = "Rescue", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, Tier = "Rescue2", MasteryExp = 55, InternalName = "SolNode50" },
		{ Node = "Pandora", Planet = "Saturn", Type = "Pursuit", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, Tier = "AWPursuit", MasteryExp = 55, InternalName = "SolNode906" },
		{ Node = "Piscinas", Planet = "Saturn", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, Tier = "DSSurvival2", DSCredits = 14, DSResourceBonus = 20, DSXPBonus = 15, DSWeaponBonus = 10, DSWeapon = 'Shotguns', MasteryExp = 55, InternalName = "ClanNode13" },
		{ Node = "Rhea", Planet = "Saturn", Type = "Interception", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Interception2", MasteryExp = 55, InternalName = "SolNode18" },
		{ Node = "Telesto", Planet = "Saturn", Type = "Exterminate", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, MasteryExp = 55, InternalName = "SolNode20" },
		{ Node = "Titan", Planet = "Saturn", Type = "Survival", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "Survival2", MasteryExp = 55, InternalName = "SolNode96" },
		{ Node = "Tethys", Planet = "Saturn", Type = "Assassination", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, Tier = "Sargas Ruk",  LinkName = "General Sargas Ruk", Pic = "SargusRuk_sigil_b.png", Drops = {"Ember"}, MasteryExp = 55, InternalName = "SolNode32" },
		
		{ Node = "Ariel", Planet = "Uranus", Type = "Capture", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, Tier = "Capture", MasteryExp = 69, InternalName = "SolNode33" },
		{ Node = "Assur", Planet = "Uranus", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, Tier = "DSSurvival3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee', MasteryExp = 69, InternalName = "ClanNode17" },
		{ Node = "Caelus", Planet = "Uranus", Type = "Interception", IsArchwing = 1, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "AWInterception", MasteryExp = 69, InternalName = "SolNode907" },
		{ Node = "Caliban", Planet = "Uranus", Type = "Rescue", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, Tier = "Rescue3", MasteryExp = 69, InternalName = "SolNode60" },
		{ Node = "Cressida", Planet = "Uranus", Type = "Mobile Defense", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, MasteryExp = 69, InternalName = "SolNode83" },
		{ Node = "Desdemona", Planet = "Uranus", Type = "Sabotage", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 26, MaxLevel = 28, Tier = "SealabCaches", MasteryExp = 69, InternalName = "SolNode98" },
		{ Node = "Ophelia", Planet = "Uranus", Type = "Survival", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Survival3", MasteryExp = 69, InternalName = "SolNode69" },
		{ Node = "Puck", Planet = "Uranus", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, MasteryExp = 44, InternalName = "SolNode114" },
		{ Node = "Rosalind", Planet = "Uranus", Type = "Spy", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, Tier = "Spy3", MasteryExp = 69, InternalName = "SolNode9" },
		{ Node = "Stephano", Planet = "Uranus", Type = "Defense", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Defense3", Other = "O", MasteryExp = 69, InternalName = "SolNode122" },
		{ Node = "Sycorax", Planet = "Uranus", Type = "Exterminate", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, MasteryExp = 69, InternalName = "SolNode34" },
		{ Node = "Umbriel", Planet = "Uranus", Type = "Interception", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, Tier = "Interception2", MasteryExp = 69, InternalName = "SolNode64" },
		{ Node = "Ur", Planet = "Uranus", Type = "Disruption", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "DisruptionUranus", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Pistols', MasteryExp = 69, InternalName = "ClanNode16" },
		{ Node = "Titania", Planet = "Uranus", Type = "Assassination", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, Tier = "Tyl Regor",  LinkName = "Tyl Regor", Pic = "TylRegor_sigil_b.png", Drops = {"Equinox"}, MasteryExp = 69, InternalName = "SolNode105" },
		
		{ Node = "Despina", Planet = "Neptune", Type = "Excavation", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "Excavation3", MasteryExp = 52, InternalName = "SolNode4" },
		{ Node = "Galatea", Planet = "Neptune", Type = "Capture", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 29, Tier = "Capture", MasteryExp = 52, InternalName = "SolNode1" },
		{ Node = "Kelashin", Planet = "Neptune", Type = "Survival", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "DSSurvival3", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Rifles', MasteryExp = 52, InternalName = "ClanNode21" },
		{ Node = "Laomedeia", Planet = "Neptune", Type = "Disruption", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "DisruptionNeptune", MasteryExp = 52, InternalName = "SolNode118" },
		{ Node = "Larissa", Planet = "Neptune", Type = "Mobile Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode49" },
		{ Node = "Nereid", Planet = "Neptune", Type = "Spy", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, Tier = "Spy3", MasteryExp = 52, InternalName = "SolNode84" },
		{ Node = "Neso", Planet = "Neptune", Type = "Exterminate", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode62" },
		{ Node = "Proteus", Planet = "Neptune", Type = "Defense", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "Defense3", Other = "D/E/F", MasteryExp = 52, InternalName = "SolNode17" },
		{ Node = "Salacia", Planet = "Neptune", Type = "Mobile Defense", IsArchwing = 1, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, Tier = "AWMobileDefense", MasteryExp = 52, InternalName = "SolNode908" },
		{ Node = "Sao", Planet = "Neptune", Type = "Sabotage", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode57" },
		{ Node = "Triton", Planet = "Neptune", Type = "Rescue", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 28, MaxLevel = 30, Tier = "Rescue3", MasteryExp = 52, InternalName = "SolNode78" },
		{ Node = "Yursa", Planet = "Neptune", Type = "Defection", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Defection3", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Shotguns', MasteryExp = 52, InternalName = "ClanNode20" },
		{ Node = "Psamathe", Planet = "Neptune", Type = "Assassination", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, Tier = "Hyena Pack",  LinkName = "Hyena Pack", Pic = "HyenaPack_sigil_b.png", Drops = {"Loki"}, MasteryExp = 52, InternalName = "SolNode127" },
		
		{ Node = "Acheron", Planet = "Pluto", Type = "Exterminate", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, MasteryExp = 51, InternalName = "SolNode4" },
		{ Node = "Cerberus", Planet = "Pluto", Type = "Interception", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Interception3", MasteryExp = 51, InternalName = "SolNode43" },
		{ Node = "Cypress", Planet = "Pluto", Type = "Sabotage", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, Tier = "Reactor3", MasteryExp = 51, InternalName = "SolNode56" },
		{ Node = "Hydra", Planet = "Pluto", Type = "Capture", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34, Tier = "Capture", MasteryExp = 51, InternalName = "SolNode76" },
		{ Node = "Minthe", Planet = "Pluto", Type = "Mobile Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34, MasteryExp = 51, InternalName = "SolNode38" },
		{ Node = "Narcissus", Planet = "Pluto", Type = "Exterminate", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36, MasteryExp = 51, InternalName = "SolNode21" },
		{ Node = "Oceanum", Planet = "Pluto", Type = "Spy", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36, Tier = "Spy3", MasteryExp = 51, InternalName = "SolNode102" },
		{ Node = "Outer Terminus", Planet = "Pluto", Type = "Defense", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "D/E/F", MasteryExp = 51, InternalName = "SolNode72" },
		{ Node = "Palus", Planet = "Pluto", Type = "Survival", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, Tier = "Survival3", MasteryExp = 51, InternalName = "SolNode81" },
		{ Node = "Regna", Planet = "Pluto", Type = "Rescue", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, Tier = "Rescue3", MasteryExp = 51, InternalName = "SolNode48" },
		{ Node = "Hieracon", Planet = "Pluto", Type = "Excavation", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "Excavation3", DSCredits = 24, DSResourceBonus = 35, DSXPBonus = 30, DSWeaponBonus = 25, DSWeapon = 'Pistols', MasteryExp = 51, InternalName = "ClanNode25" },
		{ Node = "Sechura", Planet = "Pluto", Type = "Defense", IsDarkSector = 1, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 24, DSResourceBonus = 35, DSXPBonus = 30, DSWeaponBonus = 25, DSWeapon = 'Rifles', MasteryExp = 51, InternalName = "ClanNode24" },
		{ Node = "Hades", Planet = "Pluto", Type = "Assassination", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 35, MaxLevel = 45, Tier = "Ambulas",  LinkName = "Ambulas", Pic = "Ambulas_sigil_b.png", Drops = {"Trinity"}, MasteryExp = 51, InternalName = "SolNode51" },
		
		{ Node = "Naga", Planet = "Sedna", Type = "Rescue", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 34, Tier = "Rescue3", MasteryExp = 177, InternalName = "SolNode189" },
		{ Node = "Berehynia", Planet = "Sedna", Type = "Interception", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Interception3", MasteryExp = 50, InternalName = "SolNode185" },
		{ Node = "Hydron", Planet = "Sedna", Type = "Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "A", MasteryExp = 177, InternalName = "SolNode195" },
		{ Node = "Selkie", Planet = "Sedna", Type = "Survival", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, Tier = "Survival3", MasteryExp = 177, InternalName = "SolNode187" },
		{ Node = "Adaro", Planet = "Sedna", Type = "Exterminate", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36, MasteryExp = 177, InternalName = "SolNode181" },
		{ Node = "Rusalka", Planet = "Sedna", Type = "Sabotage", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36, Tier = "Reactor3", MasteryExp = 100, InternalName = "SolNode184" },
		{ Node = "Kelpie", Planet = "Sedna", Type = "Spy", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "Spy3", MasteryExp = 177, InternalName = "SolNode188" },
		{ Node = "Marid", Planet = "Sedna", Type = "Hijack", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, MasteryExp = 177, InternalName = "SolNode191" },
		{ Node = "Charybdis", Planet = "Sedna", Type = "Mobile Defense", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, MasteryExp = 177, InternalName = "SolNode196" },
		{ Node = "Amarna", Planet = "Sedna", Type = "Survival", IsDarkSector = 1, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSSurvival3", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Rifles', MasteryExp = 177, InternalName = "ClanNode14" },
		{ Node = "Sangeru", Planet = "Sedna", Type = "Defense", IsDarkSector = 1, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 16, DSResourceBonus = 25, DSXPBonus = 18, DSWeaponBonus = 13, DSWeapon = 'Melee', MasteryExp = 177, InternalName = "ClanNode15" },
		{ Node = "Kappa", Planet = "Sedna", Type = "Disruption", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, Tier = "DisruptionSedna", MasteryExp = 177, InternalName = "SolNode177" },
		{ Node = "Nakki", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 40, MaxLevel = 40, Tier = "Rathuum1", MasteryExp = 177, InternalName = "SolNode190" },
		{ Node = "Yam", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 60, MaxLevel = 60, Tier = "Rathuum2", MasteryExp = 177, InternalName = "SolNode199" },
		{ Node = "Vodyanoi", Planet = "Sedna", Type = "Rathuum", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 85, MaxLevel = 85, Tier = "Rathuum2", MasteryExp = 177, InternalName = "SolNode183" },
		{ Node = "Merrow", Planet = "Sedna", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "Kela De Thaym",  LinkName = "Kela De Thaym", Pic = "KelaDeThaym_sigil_b.png", Drops = {"Saryn","Twin Kohmak"}, MasteryExp = 177, InternalName = "SolNode193" },
		
		{ Node = "Brugia", Planet = "Eris", Type = "Rescue", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, Tier = "Rescue3", MasteryExp = 279, InternalName = "SolNode153" },
		{ Node = "Isos", Planet = "Eris", Type = "Capture", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, Tier = "Capture", MasteryExp = 279, InternalName = "SolNode162" },
		{ Node = "Kala-azar", Planet = "Eris", Type = "Defense", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Defense3", Other = "C", MasteryExp = 279, InternalName = "SolNode164" },
		{ Node = "Naeglar", Planet = "Eris", Type = "Sabotage", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 34, Tier = "HiveCaches", MasteryExp = 279, InternalName = "SolNode175" },
		{ Node = "Nimus", Planet = "Eris", Type = "Survival", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Survival3", MasteryExp = 279, InternalName = "SolNode166" },
		{ Node = "Oestrus", Planet = "Eris", Type = "Infested Salvage", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, Tier = "Salvage", MasteryExp = 279, InternalName = "SolNode167" },
		{ Node = "Saxis", Planet = "Eris", Type = "Exterminate", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, MasteryExp = 279, InternalName = "SolNode171" },
		{ Node = "Solium", Planet = "Eris", Type = "Mobile Defense", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, MasteryExp = 279, InternalName = "SolNode173" },
		{ Node = "Xini", Planet = "Eris", Type = "Interception", Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, Tier = "Interception3", MasteryExp = 279, InternalName = "SolNode172" },
		{ Node = "Akkad", Planet = "Eris", Type = "Defense", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSDefense", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Melee', MasteryExp = 279, InternalName = "ClanNode18" },
		{ Node = "Zabala", Planet = "Eris", Type = "Survival", IsDarkSector = 1, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, Tier = "DSSurvival4", DSCredits = 18, DSResourceBonus = 30, DSXPBonus = 23, DSWeaponBonus = 18, DSWeapon = 'Pistols', MasteryExp = 279, InternalName = "ClanNode19" },
		{ Node = "Jordas Golem Assassinate", Planet = "Eris", Type = "Assassination", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 34, Tier = "Jordas Golem",  LinkName = "Jordas Golem", Pic = "J3Golem.png", Drops = {"Atlas"}, MasteryExp = 0, InternalName = "?" },
		{ Node = "Mutalist Alad V Assassinate", Planet = "Eris", Type = "Assassination", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Tier = "Mutalist Alad V",  LinkName = "Mutalist Alad V", Pic = "InfestedAladV2.png", Drops = {"Mesa"}, MasteryExp = 0, InternalName = "?" },
		
		{ Node = "Apollo", Planet = "Lua", Type = "Disruption", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 35, MaxLevel = 40, Tier = "DisruptionLua", MasteryExp = 0, InternalName = "SolNode308" },
		{ Node = "Copernicus", Planet = "Lua", Type = "Capture", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Capture", MasteryExp = 0, InternalName = "SolNode304" },
		{ Node = "Grimaldi", Planet = "Lua", Type = "Mobile Defense", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30, MasteryExp = 0, InternalName = "SolNode301" },
		{ Node = "Pavlov", Planet = "Lua", Type = "Spy", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, Tier = "LuaSpy", MasteryExp = 0, InternalName = "SolNode306" },
		{ Node = "Plato", Planet = "Lua", Type = "Exterminate", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, Tier = "LuaCaches", MasteryExp = 0, InternalName = "SolNode300" },
		{ Node = "Stöfler", Planet = "Lua", Type = "Defense", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30, Tier = "Defense3", Other = "?", MasteryExp = 0, InternalName = "SolNode305" },
		{ Node = "Tycho", Planet = "Lua", Type = "Survival", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Survival3", MasteryExp = 0, InternalName = "SolNode302" },
		{ Node = "Zeipel", Planet = "Lua", Type = "Rescue", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, Tier = "Rescue3", MasteryExp = 0, InternalName = "SolNode307" },
		
		{ Node = "Dakata", Planet = "Kuva Fortress", Type = "Exterminate", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 28, MaxLevel = 30, Tier = "KuvaCaches", MasteryExp = 0, InternalName = "SolNode746" },
		{ Node = "Garus", Planet = "Kuva Fortress", Type = "Rescue", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, Tier = "Rescue3", MasteryExp = 0, InternalName = "SolNode748" },
		{ Node = "Koro", Planet = "Kuva Fortress", Type = "Assault", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 29, MaxLevel = 31, MasteryExp = 0, InternalName = "SolNode741" },
		{ Node = "Nabuk", Planet = "Kuva Fortress", Type = "Defense", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32, Tier = "Defense3", MasteryExp = 0, InternalName = "SolNode742" },
		{ Node = "Pago", Planet = "Kuva Fortress", Type = "Spy", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, Tier = "KuvaSpy", MasteryExp = 0, InternalName = "SolNode747" },
		{ Node = "Rotuma", Planet = "Kuva Fortress", Type = "Mobile Defense", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32, MasteryExp = 0, InternalName = "SolNode743" },
		{ Node = "Tamu", Planet = "Kuva Fortress", Type = "Disruption", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, Tier = "DisruptionKuva", Other = "?", MasteryExp = 0, InternalName = "SolNode745" },
		{ Node = "Taveuni", Planet = "Kuva Fortress", Type = "Survival", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 32, MaxLevel = 37, Tier = "Survival3", MasteryExp = 0, InternalName = "SolNode744" },
		
		{ Node = "Teshub", Planet = "Void", Type = "Exterminate", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidExterminate1", MasteryExp = 0, InternalName = "SolNode400" },
		{ Node = "Hepit", Planet = "Void", Type = "Capture", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidCapture1", MasteryExp = 0, InternalName = "SolNode401" },
		{ Node = "Taranis", Planet = "Void", Type = "Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, Tier = "VoidDefense1", Other = "K", MasteryExp = 0, InternalName = "SolNode402" },
		{ Node = "Tiwaz", Planet = "Void", Type = "Mobile Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidMDefense2", MasteryExp = 0, InternalName = "SolNode403" },
		{ Node = "Stribog", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidSabotage2", MasteryExp = 0, InternalName = "SolNode404" },
		{ Node = "Stribog", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidCaches1", IgnoreInList = true, MasteryExp = 0, InternalName = "SolNode404" },
		{ Node = "Ani", Planet = "Void", Type = "Survival", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, Tier = "VoidSurvival2", MasteryExp = 0, InternalName = "SolNode405" },
		{ Node = "Ukko", Planet = "Void", Type = "Capture", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidCapture3", MasteryExp = 0, InternalName = "SolNode406" },
		{ Node = "Oxomoco", Planet = "Void", Type = "Exterminate", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidExterminate3", MasteryExp = 0, InternalName = "SolNode407" },
		{ Node = "Belenus", Planet = "Void", Type = "Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, Tier = "VoidDefense3", Other = "K", MasteryExp = 0, InternalName = "SolNode408" },
		{ Node = "Aten", Planet = "Void", Type = "Mobile Defense", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidMDefense4", MasteryExp = 0, InternalName = "SolNode410" },
		{ Node = "Marduk", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidSabotage4", MasteryExp = 0, InternalName = "SolNode411" },
		{ Node = "Marduk", Planet = "Void", Type = "Sabotage", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidCaches2", IgnoreInList = true, MasteryExp = 0, InternalName = "SolNode411" },
		{ Node = "Mithra", Planet = "Void", Type = "Interception", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidInterception4", MasteryExp = 0, InternalName = "SolNode412" },
		{ Node = "Mot", Planet = "Void", Type = "Survival", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, Tier = "VoidSurvival4", MasteryExp = 0, InternalName = "SolNode409" },
		
		{ Node = "Phorid Alert", Planet = "Invasion", Type = "Assassination", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 0, MaxLevel = 0, Tier = "Phorid",  LinkName = "Phorid", Pic = "Phorid_sigil_b.png", Drops = {"Nyx"}, MasteryExp = 0, InternalName = "?" },
		
-- Empyrean
		--{ Node = "Free Flight", Planet = "Earth Proxima", Type = "Landscape|Free Roam", Tileset = "Free Space", MasteryExp = 0, InternalName = "?" },
		{ Node = "Sover Strait", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, Tier = "EarthProxima", FighterMinLevel = 3, FighterMaxLevel = 6, MaxFighters = 30, MaxCrewships = 2, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Iota Temple", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 20, MaxLevel = 28, Tier = "EarthProxima", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Ogal Cluster", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, Tier = "EarthProxima", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 30, MaxCrewships = 2, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Korms Belt", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 34, MaxLevel = 40, Tier = "EarthProxima", FighterMinLevel = 12, FighterMaxLevel = 15, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, ObjectiveDetails = 'Chance for Galleon Assassinate', MasteryExp = 0, InternalName = "?" },
		{ Node = "Bendar Cluster", Planet = "Earth Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 39, MaxLevel = 46, Tier = "EarthProxima", FighterMinLevel = 14, FighterMaxLevel = 17, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "?" },

		{ Node = "Beacon Shield Ring", Planet = "Venus Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 17, MaxLevel = 20, Tier = "VenusProximaVolatile", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Vesper Strait", Planet = "Venus Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 21, MaxLevel = 24, Tier = "VenusProximaOrphix", FighterMinLevel = 12, FighterMaxLevel = 16, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Luckless Expanse", Planet = "Venus Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 22, MaxLevel = 25, Tier = "VenusProximaSurvival", FighterMinLevel = 14, FighterMaxLevel = 17, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Falling Glory", Planet = "Venus Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 23, MaxLevel = 26, Tier = "VenusProximaDefense", FighterMinLevel = 14, FighterMaxLevel = 18, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Bifrost Echo", Planet = "Venus Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 25, MaxLevel = 28, Tier = "VenusProxima", FighterMinLevel = 4, FighterMaxLevel = 8, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Orvin-Haarc", Planet = "Venus Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 29, MaxLevel = 32, Tier = "VenusProximaSpy", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		
		{ Node = "Mordo Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 55, MaxLevel = 60, Tier = "SaturnProxima", FighterMinLevel = 24, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Lupal Pass", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 58, MaxLevel = 66, Tier = "SaturnProxima", FighterMinLevel = 22, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Nodo Gap", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 64, MaxLevel = 70, Tier = "SaturnProxima", FighterMinLevel = 22, FighterMaxLevel = 25, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Vand Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 65, MaxLevel = 70, Tier = "SaturnProxima", FighterMinLevel = 29, FighterMaxLevel = 32, MaxFighters = 90, MaxCrewships = 6, Objectives = 1, MasteryExp = 0, InternalName = "?" },
		{ Node = "Kasio's Rest", Planet = "Saturn Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 70, MaxLevel = 75, Tier = "SaturnProxima", FighterMinLevel = 30, FighterMaxLevel = 33, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, ObjectiveDetails = '1 is an Asteroid Assassinate', MasteryExp = 0, InternalName = "?" },

		{ Node = "Arva Vector", Planet = "Neptune Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 25, MaxLevel = 28, Tier = "NeptuneProximaDefense", FighterMinLevel = 18, FighterMaxLevel = 20, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Nu-Gua Mines", Planet = "Neptune Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 27, MaxLevel = 30, Tier = "NeptuneProxima", FighterMinLevel = 20, FighterMaxLevel = 24, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Mammon's Prospect", Planet = "Neptune Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 31, MaxLevel = 34, Tier = "NeptuneProximaOrphix", FighterMinLevel = 27, FighterMaxLevel = 32, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Brom Cluster", Planet = "Neptune Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 32, MaxLevel = 35, Tier = "NeptuneProximaSpy", FighterMinLevel = 18, FighterMaxLevel = 20, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Enkidu Ice Drifts", Planet = "Neptune Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 39, MaxLevel = 42, Tier = "NeptuneProximaSurvival", FighterMinLevel = 23, FighterMaxLevel = 28, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Sovereign Grasp", Planet = "Neptune Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 43, MaxLevel = 46, Tier = "NeptuneProximaVolatile", FighterMinLevel = 31, FighterMaxLevel = 36, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },

		{ Node = "Khufu Envoy", Planet = "Pluto Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 35, MaxLevel = 38, Tier = "PlutoProximaOrphix", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Seven Sirens", Planet = "Pluto Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 47, MaxLevel = 50, Tier = "PlutoProxima", FighterMinLevel = 34, FighterMaxLevel = 38, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Obol Crossing", Planet = "Pluto Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 39, MaxLevel = 42, Tier = "PlutoProximaDefense", FighterMinLevel = 37, FighterMaxLevel = 42, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Fenton's Field", Planet = "Pluto Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 50, MaxLevel = 53, Tier = "PlutoProximaSurvival", FighterMinLevel = 38, FighterMaxLevel = 44, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Profit Margin", Planet = "Pluto Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 41, MaxLevel = 44, Tier = "PlutoProximaVolatile", FighterMinLevel = 41, FighterMaxLevel = 45, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Peregrine Axis", Planet = "Pluto Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 43, MaxLevel = 46, Tier = "PlutoProximaSpy", FighterMinLevel = 44, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		
		{ Node = "Nsu Grid", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "?" },
		{ Node = "R-9 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, Tier = "VeilProxima", FighterMinLevel = 40, FighterMaxLevel = 43, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "?" },
		{ Node = "H-2 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 90, MaxLevel = 100, Tier = "VeilProxima", FighterMinLevel = 38, FighterMaxLevel = 41, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "?" },
		{ Node = "Flexa", Planet = "Veil Proxima", Type = "Skirmish", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 90, MaxLevel = 100, Tier = "VeilProxima", FighterMinLevel = 36, FighterMaxLevel = 39, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "?" },
		{ Node = "Calabash", Planet = "Veil Proxima", Type = "Exterminate", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 45, MaxLevel = 49, Tier = "VeilProximaExterminate", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Numina", Planet = "Veil Proxima", Type = "Volatile", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 48, MaxLevel = 52, Tier = "VeilProximaVolatile", FighterMinLevel = 48, FighterMaxLevel = 52, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Arc Silver", Planet = "Veil Proxima", Type = "Defense", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 51, MaxLevel = 55, Tier = "VeilProximaDefense", FighterMinLevel = 51, FighterMaxLevel = 55, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Erato", Planet = "Veil Proxima", Type = "Orphix", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 54, MaxLevel = 58, Tier = "VeilProximaOrphix", FighterMinLevel = 55, FighterMaxLevel = 59, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Lu-Yan", Planet = "Veil Proxima", Type = "Survival", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 55, MaxLevel = 59, Tier = "VeilProximaSurvival", FighterMinLevel = 56, FighterMaxLevel = 60, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
		{ Node = "Sabmir Cloud", Planet = "Veil Proxima", Type = "Spy", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 57, MaxLevel = 60, Tier = "VeilProximaSpy", FighterMinLevel = 59, FighterMaxLevel = 62, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "?" },
	},
	by = { Name = {} },
	dictionary = {},
	vars = {
		'Node',
		'Enemy',
		'Planet',
		'Type',
		'Tileset',
		'Tier',
		'LinkName',
		'Drops',
		'Pic',
		'MasteryExp',
		'ObjectiveDetails',
		'InternalName',
	},
}

table.sort(MissionData["MissionDetails"], function(a,b) 
	return a.MinLevel < b.MinLevel or (a.MinLevel == b.MinLevel and a.MaxLevel < b.MaxLevel)
end)

for i, obj in ipairs(MissionData["MissionDetails"]) do
	obj.IsDarkSector = obj.IsDarkSector and 1 or 0	-- default
	obj.IsCrossfire = (type(obj.Enemy) == 'table') and (obj.Enemy[1] ~= 'Infested') and 1 or 0
	
	MissionData.by.Name[obj.Node] = obj	-- single-layered
	
	if not obj.IgnoreInList then
		for valname, v in pairs(obj) do 
			if not MissionData.by[valname] then
				MissionData.by[valname] = {}
			end
			for i, val in ipairs(type(v) == 'table' and v or {v}) do
				if not MissionData.by[valname][val] then
					MissionData.by[valname][val] = {}
				end
				
				table.insert(MissionData.by[valname][val], obj)
				
				if type(val) ~= 'number' and val ~= 'Capture' then 
					if not MissionData.dictionary[val] then
						MissionData.dictionary[val] = valname
					elseif MissionData.dictionary[val] ~= valname then
						local order = MissionData.vars
						for i,v in ipairs(order) do
							order[i] = nil
							order[v] = i
						end
						
						MissionData.dictionary[val] = 
							(order[valname] or #order+1) < (order[MissionData.dictionary[val]] or #order+1) and valname or MissionData.dictionary[val]
					end
				end
			end
		end
	end
	obj.id = i
	obj.FactionImage = obj.Pic or 
		MissionData.FactionImages[(type(obj.Enemy) == 'table') and (obj.Enemy[1] ~= 'Infested' and 'Crossfire' or 'Infested') or obj.Enemy]
end

MissionData.dictionary.Capture = 'Type'

for k in pairs(MissionData.by) do table.insert(MissionData.vars, k) end

--NOTE: by.Node is double-layered (by.Node.Rosalind[1])
--use by.Name if necessary

--list vars:
-- for k,v in ipairs(p.vars) do mw.log(k) end
-- error(mw.dumpObject(MissionData))
return MissionData
```

