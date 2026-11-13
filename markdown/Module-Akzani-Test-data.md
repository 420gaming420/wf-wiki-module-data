---
title: "Module:Akzani/Test/data"
wiki_url: "https://wiki.warframe.com/w/Module/Akzani/Test/data"
wiki_timestamp: "2026-11-13T01:47:06Z"
---

*Documentation for this module may be created at [Module:Akzani/Test/data/doc](/w/Module:Akzani/Test/data/doc?action=edit&redlink=1 "Module:Akzani/Test/data/doc (page does not exist)")*

```lua
-- PT Enum:
-- Order is as presented by their respective indicies (17xx) in LU.lua
--- KB to SENT match with DT Index, rest needs further study
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
		["PT_MICROWAVE_BURN"] = PH, -- 1738
		["PT_STAGGERED"] = PH, -- Engine ✓ -- 1739
		["PT_BIG_STAGGER"] = PH, -- Engine ✓ -- 1740
		["PT_STUNNED"] = PH, -- Engine ✓ -- 1741
		["PT_KNOCKED_DOWN"] = PH, -- Engine ✓ -- 1742
		["PT_RAGDOLL"] = PH, -- Engine ✓ -- 1743
		["PT_PARRIED"] = PH, -- 1744
		["PT_DISARMED"] = PH, -- 1745
		["PT_SILENCED"] = PH, -- 1746
		["PT_ROOTS"] = PH, -- Impair -- 1747
		["PT_VOID"] = PH, -- Engine ✓ -- 1748
		["PT_GLUE"] = PH, -- Slow -- Engine ✓ -- 1749
		["PT_SLEEP"] = PH, -- 1750
		["PT_LIFT_HIT"] = PH, -- Lifted -- Engine ✓ -- 1751
		["PT_COUNTERED"] = PH, -- 1752
	--- Misc ---
		["MAX_ProcType"] = PH, -- 1753
		["PT_"] = PH,
		["PT_"] = PH,
		["PT_"] = PH,
		["PT_"] = PH,
		["PT_"] = PH,
	}
```

