return {
	ArtifactPolarity = {
		["AP_UNIVERSAL"] = 0,	-- No polarity
		["AP_ATTACK"] = 1,	-- Madurai
		["AP_DEFENSE"] = 2,	-- Vazarin
		["AP_TACTIC"] = 3,	-- Naramon
		["AP_POWER"] = 4,	-- Zenurik
		["AP_PRECEPT"] = 5,	-- Penjaga
		["AP_FUSION"] = 6,	-- Fusion Core
		["AP_WARD"] = 7,	-- Unairu
		["AP_UMBRA"] = 8,	-- Umbra
		["AP_ANY"] = 9,		-- Aura
	},
	ArtifactSlot = {
		["NORMAL"] = 0,
		["AURA"] = 1,
		["STANCE"] = 2,
		["EXILUS"] = 3,
		["ARCANE"] = 4,
	},
	-- Linking game model bones to appropriate locations 
	-- Used in Modular system
	AttachBone = {
		["GAME_R1_WEAPON1"] = 0,
		["GAME_WEAPON_BLADE1"] = 1,
		["GAME_WEAPON_WEIGHT1"] = 2,	-- Zaw Links
		["GAME_C1_BARREL"] = 3,
		["GAME_C1_CLIP"] = 4,
		["GAME_C1_SPINE1"] = 5,	-- Moas
	},
	-- For modular Kitguns
	BarrelType = {
		["BT_AUTO_HITSCAN"] = 0,
		["BT_SEMI_PROJECTILE"] = 1,
	},
	-- For mod base drain and max rank
	BaseDrain = {
		["QA_LOW"] = 0,
		["QA_MEDIUM"] = 1,
		["QA_HIGH"] = 2,
		["QA_VERY_HIGH"] = 3,
	},
	-- Stance combos
	ComboContext = {
		["CC_AIR"] = 0,	-- Aerial
        ["CC_AIR_RIGHT"] = 1,
        ["CC_DOWNED_ENEMY"] = 2,	-- Ground finisher
        ["CC_GROUND"] = 3,	-- Neutral
        ["CC_GROUND_BRANCH_A"] = 4,	-- Forward
        ["CC_GROUND_BRANCH_B"] = 5,	-- Forward + Block
        ["CC_GROUND_BRANCH_C"] = 6,	-- Block
        ["CC_GROUND_HEAVY"] = 7,	-- Heavy attack
        ["CC_SLIDING"] = 8,	-- Slide attack
        ["CC_SLIDING_PVP"] = 9,	-- Slide attack in PvP
        ["CC_WALLRUN"] = 10,	-- Wall attack
	},
	DamageType = {
		["DT_IMPACT"] = 0,
		["DT_PUNCTURE"] = 1,
		["DT_SLASH"] = 2,
		["DT_FIRE"] = 3,
		["DT_FREEZE"] = 4,
		["DT_ELECTRICITY"] = 5,
		["DT_POISON"] = 6,
		["DT_EXPLOSION"] = 7,
		["DT_RADIATION"] = 8,
		["DT_GAS"] = 9,
		["DT_MAGNETIC"] = 10,
		["DT_VIRAL"] = 11,
		["DT_CORROSIVE"] = 12,
		["DT_RADIANT"] = 13,	-- Void
		["DT_SENTIENT"] = 14,	-- Tau
		["DT_CINEMATIC"] = 15,
		["DT_SHIELD_DRAIN"] = 16,
		["DT_HEALTH_DRAIN"] = 17,
		["DT_ENERGY_DRAIN"] = 18,
		["DT_FINISHER"] = 19,	-- True
		["DT_SUICIDE"] = 20,
		["DT_PHYSICAL"] = 21,
		["DT_BASE_ELEMENTAL"] = 22,
		["DT_COMPOUND_ELEMENTAL"] = 23,
		["DT_ANY"] = 24,
		["DT_INVALID"] = 25,
	},
	-- Likely for weapon rigging
	GripType = {
		["MELEE_ONE_HAND"] = 0,	-- Used by all melees
		["GUN_ONE_HAND"] = 1, -- Used by single Pistols
		["DUAL_GUN_GUN"] = 2,	-- Used by Dual Pistols, Throwing Knives
		["BOW"] = 3,
		["SPEAR"] = 4,	-- Used by Spearguns
		["ARM_GUN_ONE_HAND"] = 3,	-- Used by Arm Cannons
	},
	MeleeStyle = {
		["MS_SWORD"] = 0,	-- Also used by Whips
		["MS_AKIMBO_SHORT_SWORD"] = 1,	-- Used by Dual Swords and Sword and Whip
		["MS_BO_STAFF"] = 2,	-- Also used by Polearms and Scythes
		["MS_DAGGER"] = 3,
		["MS_AKIMBO_DAGGER"] = 4,	-- Dual Daggers
		["MS_HEAVY_SWORD"] = 5,	-- Heavy Blade
		["MS_HEAVY_AXE"] = 6,	-- Hammers and Scindo family
		["MS_FIST"]	= 7,	-- Also used by Claws and Sparring
		["MS_GLAIVE"] = 8,
		["MS_RAPIER"] = 9,
		["MS_KATANA"] = 10,	-- Nikana
		["MS_SWORD_SHIELD"] = 11,
		["MS_TONFA"] = 12,
		["MS_NUNCHAKU"] = 13,
		["MS_GUN_BLADE"] = 14,
		["MS_KATANA_LONG"] = 15,	-- Two-Handed Nikana
		["MS_WARFAN"] = 16,
		["MS_SAW_HEAVY"] = 17,	-- Assault Saw
		["MS_HEAVY_SCYTHE"] = 18,
	},
	-- For modular Kitguns
	GunType = {
		["GT_RIFLE"] = 0,
		["GT_SHOTGUN"] = 1,
		["GT_BEAM"] = 2,
	},
	HitType = {
		["DHT_NONE"] = 0,	-- Used by most guns (hitscan)
		["DHT_MELEE"] = 1,
		["DHT_PROJECTILE"] = 2,	-- Projectiles
		["DHT_RADIAL"] = 4,	-- Radial AoE
		["DHT_TRACE"] = 5,	-- Used by Buzlok's alt-fire, Kohm, Kuva Kohm, Kohmak, Twin Kohmak
	},
	-- See https://wiki.warframe.com/w/Public_Export
	InventorySlot = {
		["SLOT_1"] = 0,	-- Pistol
		["SLOT_2"] = 1,	-- Primary / Archgun / Sentinel Weapon
		["SLOT_3"] = 2,
		["SLOT_4"] = 3,	-- Warframe / Necramech
		["SLOT_5"] = 4,
		["SLOT_6"] = 5,	-- Melee / Archmelee
		["SLOT_7"] = 6,	-- Archwing
		["SLOT_8"] = 7,	-- Exalted Weapon
		["SLOT_9"] = 8,
		["SLOT_10"] = 9,
		["SLOT_11"] = 10,
		["SLOT_12"] = 11,
		["SLOT_13"] = 12,
		["SLOT_14"] = 13,	-- Railjack Armament
	},
	MarketMode = {
		["MM_NONE"] = 0,
		["MM_HIDDEN"] = 1,
		["MM_VISIBLE"] = 2,
	},
	-- Extrapolated from https://wiki.warframe.com/w/Public_Export#ExportRegions_Nodes_Schema
	-- and https://wiki.warframe.com/w/World_State#Mission_Type
	MissionType = {
		MT_ASSASSINATION = 0,
		MT_EXTERMINATION = 1,	-- Exterminate
		MT_SURVIVAL = 2,
		MT_RESCUE = 3,
		MT_SABOTAGE = 4,
		MT_CAPTURE = 5,
		-- Unknown
		MT_INTEL = 7,	-- Spy
		MT_DEFENSE = 8,
		MT_MOBILE_DEFENSE = 9,
		-- Unknown
		-- Unknown
		-- Unknown
		MT_TERRITORY = 13,	-- Interception
		MT_RETRIEVAL = 14,	-- Hijack
		MT_HIVE = 15,	-- Hive Sabotage
		-- Unknown
		MT_EXCAVATE = 17,	-- Excavation
		-- Unknown
		-- Unknown
		-- Unknown
		MT_PURIFY = 21,	-- Infested Salvage
		MT_ARENA = 22,	-- Rathuum/The Index
		-- Unknown
		-- Pursuit
		MT_RACE = 25,	-- Archwing Race
		MT_ASSAULT = 26,
		MT_EVACUATION = 27,	-- Defection
		MT_LANDSCAPE = 28,	-- Free Roam/Landscape
		-- Unknown
		-- Unknown
		-- Unknown
		MT_ARTIFACT = 32,	-- Disruption
		MT_CORRUPTION = 33,	-- Void Flood
		MT_VOID_CASCADE = 34,
		MT_ARMAGEDDON = 35,	-- Void Armageddon
		
		-- Don't know where these go
		MT_DEFAULT = 996,
		MT_ENDLESS_EXTERMINATION = 997,	-- Sanctuary Onslaught
		MT_PVP = 998,	-- Conclave
		MT_SECTOR = 999,	-- Solar Rail Conflict
		MT_GENERIC = 1000,
	},
	NoiseLevel = {
		["ALARMING"] = 0,
		["SILENT"] = 1,
	},
	-- Calculating upgrade bonuses
	OperationType = {
		["ADD"] = 0,
		["STACKING_MULTIPLY"] = 1,
		["MULTIPLY"] = 2,
		["SET"] = 3
	},
	-- For modular weapon system
	PartType = {
		["LWPT_BLADE"] = 0,	-- Zaw blade
		["LWPT_HILT"] = 1,	-- Zaw handle
		["LWPT_HILT_WEIGHT"] = 2,	-- Zaw link
		["LWPT_GUN_BARREL"] = 3,
		["LWPT_GUN_SECONDARY_HANDLE"] = 4,
		["LWPT_GUN_CLIP"] = 5,
		["LWPT_MOA_HEAD"] = 6,
		["LWPT_MOA_PAYLOAD"] = 7,
		["LWPT_MOA_ENGINE"] = 8,
		["LWPT_MOA_LEG"] = 9,
		["LWPT_GUN_PRIMARY_HANDLE"] = 10,
	},
	-- Avatar animation state
	Posture = {
		["PM_AIM"] = 1,	-- While aiming
		["PM_IN_AIR"] = 2,	-- While jumping, falling, or aim-gliding in mid-air (used by Motus Impact, Ironclad FLight, Soaring Strike, and Overview mods)
		["PM_AIRBORNE"] = 3,	-- While airborne like with Titania's Razorflies (used by Motus Impact and Ironclad FLight mods)
		["PM_BULLETJUMP"] = 4,	-- While bullet jumping; used in mods like Armored Acrobatics
		["SLIDE"] = 5,	-- While sliding
		["CROUCH"] = 6,	-- While crouching (used by Lie In Wait mod)
	},
	PVP = {
		["INVALID"] = 0,
		["PVE_ONLY"] = 1,
		["PVP_ONLY"] = 2,
		["UNIVERSAL"] = 3,
	},
	Rarity = {
		["COMMON"] = 0,
		["UNCOMMON"] = 1,
		["RARE"] = 2,
		["LEGENDARY"] = 3,
	},
	RoundingMode = {
		["RM_ROUND"] = 0,
		["RM_CEILING"] = 1,
	},
	Shooting = {
		["ST_EXPONENTIAL"] = 0,
	},
	StackMode = {
		["SM_DECAY"] = 0,
	},
	-- Player trading flags
	TradeCapability = {
		["RO_NEVER"] = 0,
		["RO_ALWAYS"] = 1,
	},
	TransferenceSupport = {
		["TS_OPERATOR_ONLY"] = 0,
	},
	Unknown = {
		["INVALID"] = 0,
		["NEUTRAL"] = 1,
		["MATCH"] = 2,
		["MISMATCH"] = 3,
	},
}
