-- For use in Module:ScientiaStances

-- Each weapon class shares the following combos:
--      Heavy: heavy attack
--      Slide: slide attack
--      Air: air attack
--      Wall: wall attack
--      Ground: ground finisher

-- Each combo has a type (normal, forward, forward + block, and/or block combo)
-- and a set number of attacks that share the same input.
-- Each combo comes with a list of attacks that have their own proc info,
-- number of hits, attack type ("Default", "360", or "Slam"),
-- and damage mulitplier.

-- For hits with multiple procs, concatenate the first three letters of each
-- proc together (e.g. "Slash" and "Puncture" will become "SlaPun")

-- The reason for the need for NumberOfHits keys is because the 
-- length operator doesn't account for nil values (which are 
-- possible in this implementation in order to document attacks/hits 
-- that have no multiplier or proc info) or tables without keys (i.e Attacks
-- table).

-- styling:
--[[
    ["WeaponType"] = {
        Heavy = {
            Name = "",
            Attacks = {
                { Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        Slide = {
            Name = "",
            Attacks = {
                { Type = "360", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        Air = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        Wall = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        Ground = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
    },
]]--

-- each weapon class shares their own heavy, slide, air, wall, and ground
-- finisher combos
local SharedCombos = {
    ["Sword"] = {
        Heavy = {
            Name = "Perfect Cut",
            Attacks = {
                { Multiplier = 5, Proc = "Lifted" },
                { Multiplier = 5, Proc = "Knockdown" },
            },
        },
        Slide = {
            Name = "Spiral Cut",
            Attacks = {
                { Type = "360", Proc = "Impact" },
            },
        },
        Air = {
            Name = "Weightless Steel",
            Attacks = {
                { Multiplier = 2 },
                { Multiplier = 2 },
                { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Wall = {
            Name = "Weightless Steel",
            Attacks = {
               { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Ground = {
            Name = "Death's Mark",
            Attacks = {
                { Multiplier = 2.5, Proc = "Slash" },
            },
        },
    },
    ["Two-Handed Nikana"] = {
        Heavy = {
            Name = "Lover's Farewell",
            Attacks = {
                { Type = "Default", Multiplier = 6, NumberOfHits = 1, Proc = "SlaLif" },
                { Type = "360", Multiplier = { 3, 3 }, NumberOfHits = { 1, 1 }, Proc = { "ImpSla", "SlaKno" } }
            },
        },
        Slide = {
            Name = "Deceitful Serpent",
            Attacks = {
                { Type = "360", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
            },
        },
        Air = {
            Name = "Cunning Monkey",
            Attacks = {
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
            },
        },
        Wall = {
            Name = "Strident Gazelle",
            Attacks = {
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
            },
        },
        Ground = {
            Name = "Terrapin's Rebuke",
            Attacks = {
                { Type = "Default", Multiplier = 12, NumberOfHits = 1, Proc = "Slash" },
            },
        },  
    },
}

return SharedCombos
