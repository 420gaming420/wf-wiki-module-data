	-- PT Enum:
	-- Order is as presented by their respective indicies (17xx) in LU.lua
	-- "Engine" refers to Engine.PT_* ident/token in C.W, still looking for them
	ProcType = {
		["PT_KNOCKBACK"] = 0, -- Impact -- Engine ✓ -- 1723
		["PT_FRAILTY"] = 1, -- Puncture -- Engine ✓ -- 1724
		["PT_BLEEDING"] = 2, -- Slash -- Engine ✓ -- 1725
		["PT_IMMOLATION"] = 3, -- Heat -- Engine ✓ -- 1726
		["PT_CHILLED"] = 4, -- Cold -- Engine ✓ -- 1727
		["PT_ELECTROCUTION"] = 5, -- Electricity -- Engine ✓ -- 1728
		["PT_POISONED"] = 6, -- Toxin -- Engine ✓ -- 1729
		["PT_FLASHBANG"] = 7, -- Blast -- Engine ✓ -- 1730
		["PT_RAD_TOX"] = 8, -- Radiation -- Engine ✓ -- 1731
		["PT_ASPHYXIATION"] = 9, -- Gas -- 1732
		["PT_MAGNETIZED"] = 10, -- Magnetic -- Engine ✓ -- 1733
		["PT_INFECTED"] = 11, -- Viral -- Engine ✓ -- 1734
		["PT_CAUSTIC_BURN"] = 12, -- Corrosive -- Engine ✓ -- 1735
		["PT_RADIANT"] = 13, -- Void -- 1736
		["PT_SENTIENT"] = 14, -- Tau -- 1737
		["PT_MICROWAVE_BURN"] = 15, -- 1738
		["PT_STAGGERED"] = 16, -- Engine ✓ -- 1739
		["PT_BIG_STAGGER"] = 17, -- Engine ✓ -- 1740
		["PT_STUNNED"] = 18, -- Engine ✓ -- 1741
		["PT_KNOCKED_DOWN"] = 19, -- Engine ✓ -- 1742
		["PT_RAGDOLL"] = 20, -- Engine ✓ -- 1743
		["PT_PARRIED"] = 21, -- 1744
		["PT_DISARMED"] = 22, -- 1745
		["PT_SILENCED"] = 23, -- 1746
		["PT_ROOTS"] = 24, -- Impair -- 1747
		["PT_VOID"] = 25, -- Engine ✓ -- 1748
		["PT_GLUE"] = 26, -- Slow -- Engine ✓ -- 1749
		["PT_SLEEP"] = 27, -- 1750
		["PT_LIFT_HIT"] = 28, -- Lifted -- Engine ✓ -- 1751
		["PT_COUNTERED"] = 29, -- 1752
	--- Misc ---
		["MAX_ProcType"] = 30, -- 1753
	}
	-- RK Enum:
	--- Mix of old Health/Armor/Shield Types and current Faction RKs
	ResistanceKey = {
		["RK_NONE"] = 0,
		["RK_FLESH"] = 1,
		["RK_CLONED_FLESH"] = 2,
		["RK_INFESTED_FLESH"] = 3,
		["RK_TENNO_FLESH"] = 4,
		["RK_ROBOTIC"] = 5,
		["RK_MACHINERY"] = 6,
		["RK_INFESTED"] = 7,
		["RK_FOSSILIZED"] = 8,
		["RK_FRACTURE"] = 9,
		["RK_ARMOR"] = 10,
		["RK_HULKING_ARMOR"] = 11,
		["RK_INFESTED_ARMOUR"] = 12,
		["RK_TENNO_ARMOR"] = 13,
		["RK_SHIELD"] = 14,
		["RK_HEAVY_SHIELD"] = 15,
		["RK_TENNO_SHIELD"] = 16,
		["RK_OVERGUARD"] = 17,
		["RK_DISABLE_FACTION"] = 18,
		["RK_NEUTRAL"] = 19,
		["RK_GRINEER_FACTION"] = 20,
		["RK_INFESTED_FACTION"] = 21,
		["RK_CORPUS_FACTION"] = 22,
		["RK_MITW_FACTION"] = 23, -- Murmur
		["RK_SENTIENT_FACTION"] = 24,
		["RK_OROKIN_FACTION"] = 25,
		["RK_NARMER_FACTION"] = 26,
		["RK_ZARIMAN_FACTION"] = 27,
		["RK_LASRIA_FACTION"] = 28, -- Scaldra
		["RK_GRINEER_KUVA_FACTION"] = 29,
		["RK_INFESTED_DEIMOS_FACTION"] = 30,
		["RK_CORPUS_AMALGAM_FACTION"] = 31,
		["RK_PROTOINFESTED_FACTION"] = 32, -- Techrot
		["RK_OROKIN_EMPIRE_FACTION"] = 33, -- Anarchs
	}
