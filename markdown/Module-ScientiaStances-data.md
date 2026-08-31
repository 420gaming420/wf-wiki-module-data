---
title: "Module:ScientiaStances/data"
wiki_url: "https://wiki.warframe.com/w/Module/ScientiaStances/data"
wiki_timestamp: "2019-12-31T21:48:01Z"
---

*Documentation for this module may be created at [Module:ScientiaStances/data/doc](/w/Module:ScientiaStances/data/doc?action=edit&redlink=1 "Module:ScientiaStances/data/doc (page does not exist)")*

```lua
-- For use in Module:ScientiaStances

-- Each stance comes with the following unique combos:
--      Basic: basic/neutral combo (unlocked by default if exists)
--      Forward: forward combo (unlocked at Rank 1 if exists)
--      ForwardBlock: "forward tactical" combo (unlocked at Rank 2 if exists)
--      Block: block combo (unlocked at Rank 3 if exists)

-- Each weapon class shares the following combos regardless of stance used:
--      Heavy: heavy attack
--      Slide: slide attack
--      Air: air attack
--      Wall: wall attack
--      Ground: ground finisher

-- Each combo a set number of attacks that share the same input.
-- (e.g for Block combo, holding the block/aim key while attacking)
-- Each combo comes with a list of attacks that have their own proc info,
-- number of hits, attack type ("Default", "360", or "Slam"),
-- and damage multiplier.

-- For hits with multiple procs, concatenate the first three letters of each
-- proc together (e.g. "Slash" and "Puncture" will become "SlaPun")

-- Note: avoid putting nil values in tables, otherwise functions that iterate over
--       tables will break or won't work properly. To denote a hit that
--       doesn't proc in the Proc table, input "None".

-- Default values for keys if keys are omitted:
--      ConclaveOnly = false
--      Type = "Default"
--      Multiplier = 1 or { 1, 1, ... } if NumberOfHits is a table
--      NumberOfHits = 1 or { 1, 1, ... } if Multiplier is a table
--      Proc = nil

-- Styling for StanceData:
--[[
    ["Stance Name"] = {
        WeaponType = required,
        ConclaveOnly = optional,
        Basic = {
            Name = required,
            Attacks = {
                { Type = optional, Multiplier = optional, NumberOfHits = optional, Proc = optional },
                { Type = optional, Multiplier = optional, NumberOfHits = optional, Proc = optional },
                { Type = optional, Multiplier = optional, NumberOfHits = optional, Proc = optional },
            },
        },
        Forward = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        ForwardBlock = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        Block = {
            Name = "",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
    },
]]--

-- Styling for SharedCombosData:
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

-- in alphabetical order if possible
-- only contains Basic, Forward, ForwardBlock, and Block combos
local StanceData = {
    ["Brutal Tide"] = {
        WeaponType = "Sparring",
        Forward = {
            Name = "Inferno",
            Attacks = {
                { NumberOfHits = 2 },
                { Multiplier = 2 },
                { Multiplier = { 1, 2 }, NumberOfHits = { 2, 1 } },
                { Multiplier = 3, NumberOfHits = 2 },
            },
        },
        ForwardBlock = {
            Name = "Rushing Fire",
            Attacks = {
                { Multiplier = 2, NumberOfHits = 2, Proc = "Impact" },
                { Multiplier = { 3, 1, 3 }, Proc = { "None", "None", "Impact" } },
                { Multiplier = { 2, 3, 1 }, Proc = { "None", "None", "Knockdown" } },
            },
        },
    },
    -- including every single optional input
    -- setting proc to "None" instead of nil
    ["Cyclone Kraken"] = {
        WeaponType = "Machete",
        ConclaveOnly = false,
        Basic = {
            Name = "Gale Triton",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = "Impact" },
                { Type = "Default", Multiplier = { 2, 1 }, NumberOfHits = { 1, 1}, Proc = { "Impact", "None" } },
                { Type = "360", Multiplier = { 1, 2, 4 }, NumberOfHits = { 1, 1, 1 }, Proc = { "None", "None", "None"} },
                { Type = "360", Multiplier = 4, NumberOfHits = 1, Proc = "Knockdown" },
            },
        },
        Forward = {
            Name = "Leviathan Rain",
            Attacks = {
                { Type = "Default", Multiplier = 1, NumberOfHits = 2, Proc = "None" },
                { Type = "360", Multiplier = 1, NumberOfHits = 3, Proc = "Impact" },
            },
        },
        ForwardBlock = {
            Name = "Lightning Siren",
            Attacks = {
                { Type = "Default", Multiplier = 2, NumberOfHits = 2, Proc = "Impact" },
                { Type = "Default", Multiplier = { 1, 2, 4 }, NumberOfHits = { 1, 1, 1 }, Proc = { "Impact", "Slash", "Knockdown" } },
            },
        },
        Block = {
            Name = "Thunder Hydra",
            Attacks = {
                { Type = "Default", Multiplier = { 1, 3 }, NumberOfHits = { 1, 1 }, Proc = { "Lifted", "Impact" } },
                { Type = "360", Multiplier = 3, NumberOfHits = 1, Proc = "None" },
                { Type = "Default", Multiplier = 4, NumberOfHits = 1, Proc = "Ragdoll" },
            },
        },
    },
    -- testing minimal input as possible, omitting keys with default values
    ["Defiled Snapdragon"] = {
        WeaponType = "Blade and Whip",
        Basic = {
            Name = "Claws of the Drake",
            Attacks = {
                { Multiplier = 3, Proc = "Lifted" },
                { Multiplier = 3 },
                { Multiplier = { 1, 2 }, Proc = { "None", "ImpSla" } },
                { Multiplier = { 2, 1, 1, 2 }, Proc = { "Impact", "None", "Slash", "None" } },
                { Multiplier = 4, NumberOfHits = 2, Proc = "Knockdown" },
            },
        },
        Forward = {
            Name = "Soul of the Leviathan",
            Attacks = {
                { NumberOfHits = 4 },
                { Type = "360", NumberOfHits = 5 },
                { Multiplier = { 1, 2 }, Proc = { "None", "Impact" } },
                { Multiplier = { 2, 1 }, NumberOfHits = { 2, 2 } },
                { Multiplier = 2, Proc = "Impact"},
            },
        },
        ForwardBlock = {
            Name = "Heart of the Naga",
            Attacks = {
                { Multiplier = 3, Proc = "Impact" },
                { Multiplier = { 1, 2 }, NumberOfHits = { 3, 1 }, Proc = { "None", "ImpSla" } },
                { Type = "360", Multiplier = { 1, 2 }, Proc = { "Impact", "SlaKno" } },
            },
        },
        Block = {
            Name = "Fangs of the Lindwurm",
            Attacks = {
                { Multiplier = 5, Proc = "Ragdoll" },
            },
        },
    },
    ["Hysteria"] = {
        WeaponType = "Valkyr's Talons",
        Basic = {
            Name = "Fervor",
            Attacks = {
                { nil },
                { nil },
                { Type = "360", NumberOfHits = 2 },
                { Type = "360", NumberOfHits = 2 },
                { nil },
                { NumberOfHits = 2 },
            },
        },
        Forward = {
            Name = "Rage",
            Attacks = {
                { nil },
                { nil },
                { nil },
                { Type = "360" },
            },
        },
        ForwardBlock = {
            Name = "Madness",
            Attacks = {
                { nil },
                { NumberOfHits = 2 },
                { NumberOfHits = 3 },
                { NumberOfHits = 2 },
                { NumberOfHits = 3 },
                { Multiplier = { 1, 1, 2 }, Proc = { "None", "Impact", "None" } },
            },
        },
        Block = {
            Name = "Delirium",
            Attacks = {
                { nil },
                { NumberOfHits = 2 },
                { NumberOfHits = 3 },
                { Multiplier = { 1, 1, 2 }, Proc = { "None", "Impact", "None" } },
            },
        },
    },
    -- testing empty table in place of nil in Attacks table
    ["High Noon"] = {
        WeaponType = "Gunblade",
        Basic = {
            Name = "Final Showdown",
            Attacks = {
                { NumberOfHits = 2 },
                { Multiplier = 2.5, NumberOfHits = 2, Proc = "Impact" },
                { Multiplier = 2.5 },
                { Multiplier = 3, Proc = "Lifted" },
            },
        },
        Forward = {
            Name = "Vagabond Blitz",
            Attacks = {
                {},
                { Multiplier = 2, NumberOfHits = 2 },
                { NumberOfHits = 2 },
            },
        },
        ForwardBlock = {
            Name = "Desperado Zeal",
            Attacks = {
                {},
                { NumberOfHits = 2 },
            },
        },
        Block = {
            Name = "Tomahawk Double-Tap",
            Attacks = {
                { Type = "Slam", Multiplier = 3 },
                { Multiplier = 4, NumberOfHits = 2 },
                { Multiplier = 4 },
            },
        },
    },
    -- testing what happens if shared combos are in StancesData table
    ["Iron Phoenix"] = {
        WeaponType = "Sword",
        Basic = {
            Name = "Wings and Beak",
            Attacks = {
                { Multiplier = 3, Proc = "ImpSla" },
                { Multiplier = 2 },
                { Multiplier = 2, Proc = "Knockdown" },
            },
        },
        Forward = {
            Name = "Double Slash",
            Attacks = {
                { nil },
                { Multiplier = 2 },
            },
        },
        ForwardBlock = {
            Name = "Taking Flight",
            Attacks = {
                {
                    -- first element is multipler for first hit
                    -- second element is multiplier for second hit
                    Multiplier = { 1, 2 },
                    NumberOfHits = { 1, 1 },
                    -- first element is proc for first hit
                    -- second element is multipler for second hit
                    Proc = { "None", "Impact" }
                },
                { Type = "Slam", Multiplier = 4, Proc = "Lifted" },
            },
        },
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
    ["Stinging Thorn"] = {
        WeaponType = "Dagger",
        Basic = {
            Name = "Carving Spike",
            Attacks = {
                { Multiplier = { 3, 1 }, Proc = { "None", "Impact" } },
                { Multiplier = { 1, 2, 2 }, Proc = { "Slash", "Slash", "None" } },
                { Multiplier = { 3, 2 }, Proc = { "None", "Impact" } },
                { Multiplier = { 2, 2 }, Proc = { "Impact", "Slash" } },
                { Multiplier = 4, Proc = "SlaKno" },
            },
        },
        Forward = {
            Name = "Piercing Horn",
            Attacks = {
                { Multiplier = { 1, 2 } },
                { Multiplier = 2, Proc = "Impact" },
                { Multiplier = { 1, 2 }, Proc = { "None", "Impact" } },
            },
        },
        ForwardBlock = {
            Name = "Lacerating Spine",
            Attacks = {
                { Multiplier = 2 },
                { Multiplier = { 2, 2 }, NumberOfHits = { 2, 1 }, Proc = { "None", "Slash" } },
                { Type = "Slam", Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Block = {
            Name = "Impaling Quill",
            Attacks = {
                { Multiplier = { 1, 2, 3 }, Proc = { "None", "Lifted", "Impact" } },
                { Multiplier = 2, Proc = "Slash" },
                { Multiplier = 4, Proc = "Ragdoll" },
            },
        },
    },
    ["Vengeful Revenant"] = {
        WeaponType = "Sword",
        Basic = {
            Name = "Impending Dread",
            Attacks = {
                { Multiplier = 3 },
                { Multiplier = 2 },
                { Multiplier = 3 },
                { Multiplier = 3, Proc = "Impact" },
                { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Forward = {
            Name = "Lone Vengeance",
            Attacks = {
                { nil },
                { Multiplier = 2 },
                { Proc = "Slash" },
                { Multiplier = 2, Proc = "Impact" },
            },
        },
        ForwardBlock = {
            Name = "Drowning Despair",
            Attacks = {
                { Type = "360", Multiplier = { 1, 3 }, Proc = { "Impact", "None" } },
                { Multiplier = { 0.5, 3 }, NumberOfHits = { 2, 1 }, Proc = { "Impact", "None" } },
                { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Block = {
            Name = "Rising Hate",
            Attacks = {
                { Multiplier = { 4, 1 }, NumberOfHits = { 1, 1 } },
                { Multiplier = 2, Proc = "SlaLif" },
                { Type = "Slam", Multiplier = 3 },
            },
        },
    },
    -- testing a variety of inputs for combos 
    -- (e.g. omitting keys, setting keys to nil, etc.)
    ["Wise Razor"] = {
        WeaponType = "Two-Handed Nikana",
        Basic = {
            Name = "Cutting Thrice",
            Attacks = {
                { Multiplier = { 3, 3, 4 }, NumberOfHits = { 1, 1, 1 }, Proc = { "None", "Slash", "Impact" } },
                { Multiplier = 3, Proc = "Impact" },
                { Multiplier = 3 },
                { Multiplier = 5, Proc = "Knockdown"},
            },
        },
        Forward = {
            Name = "Threshing Grain",
            Attacks = {
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 4, NumberOfHits = 1, Proc = "Impact" },
            },
        },
        ForwardBlock = {
            Name = "Calling Thunder",
            Attacks = {
                { Type = "Slam", Multiplier = { 2, 2, 3 }, NumberOfHits = { 1, 1, 1 }, Proc = { "None", "Knockdown", "SlaLif" } },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 4, NumberOfHits = 1, Proc = "Knockdown" },
            },
        },
    },
    ["Test"] = {
        WeaponType = "Test",
        ConclaveOnly = false,
        Basic = {
            Name = "Neutral Combo",
            Attacks = {
                -- testing most basic attack
                { Type = "Default", Multiplier = 1, NumberOfHits = 1, Proc = "None" },
                -- testing two hits
                { Type = "360", Multiplier = { 1, 2 }, NumberOfHits = { 5, 10 }, Proc = { "Slash", "Puncture" } },
                -- testing single hit but in table
                { Type = "Slam", Multiplier = { 2 }, NumberOfHits = { 3 }, Proc = { "Impact" } },
            },
        },
        -- testing most simpliest combo with no additional information
        Forward = {
            Name = "Forward Combo",
            Attacks = {
                { Type = "Default", Multiplier = 1, NumberOfHits = 1, Proc = nil },
                { nil },
                {},
            },
        },
        -- testing max multi-hit attack combo
        ForwardBlock = {
            Name = "Forward Block Combo",
            Attacks = {
                -- attack with 4 unique hits
                { Type = "Default", Multiplier = { 1, 1, 5, 4 }, NumberOfHits = { 2, 4, 5, 1 }, Proc = { "Impact", "ImpSla", "Knockdown", "Slash" } },
                -- attack with 4 unique hits but all of them have no damage multiplier
                { Type = "Default", NumberOfHits = { 2, 5, 2, 3 }, Proc = { "Lifted", "KnoSta", "Slash", "None" } },
                -- attack with 4 unique hits but all of them hit once
                { Type = "Default", Multiplier = { 2, 3, 1, 4 }, Proc = { "Ragdoll", "Knockdown", "None", "Slash" } },
            },
        },
        -- testing simple attacks
        Block = {
            Name = "Block Combo",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = nil },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = "Slash" },
                { Type = "Default", NumberOfHits = 3, Proc = nil },
            },
        },
    },
    ["Different Table Length"] = {
        WeaponType = "Test",
        Basic = {
            Name = "Neutral Combo",
            Attacks = {
                -- testing different table lengths
                { Multiplier = { 1, 2, 3 }, NumberOfHits = { 2, 1 }, Proc = { "None", "Slash" } },
            },
        },
    },
    ["Unknown Combo"] = {
        WeaponType = "Test",
        Neutral = {
            Name = "Neutral Combo",
            Attacks = {
                -- testing most basic attack
                { Type = "Default", Multiplier = 1, NumberOfHits = 1, Proc = "None" },
                -- testing two hits
                { Type = "360", Multiplier = { 1, 2 }, NumberOfHits = { 5, 10 }, Proc = { "Slash", "Puncture" } },
                -- testing single hit but in table
                { Type = "Slam", Multiplier = { 2 }, NumberOfHits = { 3 }, Proc = { "Impact" } },
            },
        },
    },
}

-- each weapon class shares their own heavy, slide, air, wall, and ground
-- finisher combos
-- in alphabetical order
local SharedCombosData = {
    -- note that Slide, Air, Wall, and Ground combos are shared with Sword weapons
    ["Blade and Whip"] = {
        Heavy = {
            Name = "Rolling Thunder",
            Attacks = {
                { Multiplier = 4, Proc = "Ragdoll" },
                { Multiplier = { 4, 4, 4 }, Proc = { "Lifted", "Ragdoll", "None" } },
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
    ["Dagger"] = {
        Heavy = {
            Name = "Butterfly Slash",
            Attacks = {
                { Multiplier = { 2.5, 2.5 }, Proc = { "ImpSla", "Finisher" } },
                { Multiplier = { 2.5, 2.5 }, Proc = { "ImpSla", "Knockdown" } },
            },
        },
        Slide = {
            Name = "Splitting Brush",
            Attacks = {
                { Type = "360", Multiplier = 2, Proc = "Impact" },
            },
        },
        Air = {
            Name = "Scorpion Fall",
            Attacks = {
                { Multiplier = 2, Proc = "Impact" },
                { Proc = "Slash" },
            },
        },
        Wall = {
            Name = "Fanning Sting",
            Attacks = {
                { Multiplier = 3, Proc = "Impact" },
            },
        },
        Ground = {
            Name = "Relentless Point",
            Attacks = {
                { Multiplier = 1.25, NumberOfHits = 2, Proc = "Slash" },
            },
        },
    },
    -- testing single values in tables and also having "Blast" in proc
    ["Gunblade"] = {
        Heavy = {
            Name = "Spinning Uppercut",
            Attacks = {
                { Multiplier = { 6 }, Proc = { "Impact" } },
                { Multiplier =  { 6 }, Proc = { "Impact" } },
            },
        },
        Slide = {
            Name = "Fast Draw",
            Attacks = {
                { Type = "360", Multiplier = { 2 }, Proc = { "Impact" } },
            },
        },
        Air = {
            Name = "Outlaw Rush",
            Attacks = {
                { Multiplier = { 2 } },
                { Multiplier = { 2 } },
                { Multiplier = { 2 } },
            },
        },
        Wall = {
            Name = "Vendetta",
            Attacks = {
                { Multiplier = { 3 }, Proc = { "Knockdown" } },
            },
        },
        Ground = {
            Name = "Last Words",
            Attacks = {
                { Multiplier = { 10 }, Proc = { "Blast" } },
            },
        },
    },
    -- including every single optional input
    -- setting proc to "None" instead of nil
    ["Machete"] = {
        Heavy = {
            Name = "Rolling Wave",
            Attacks = {
                { Type = "360", Multiplier = { 1.5, 1.5, 1.5, 1.5 }, NumberOfHits = { 2, 1, 1, 1 }, Proc = { "None", "Slash", "None", "Impact" } },
                { Type = "Default", Multiplier = 5, NumberOfHits = 1, Proc = "Knockdown" },
            },
        },
        Slide = {
            Name = "Flowing River",
            Attacks = {
                { Type = "360", Multiplier = 2, NumberOfHits = 1, Proc = "Impact" },
            },
        },
        Air = {
            Name = "Weightless Steel",
            Attacks = {
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "None" },
                { Type = "Default", Multiplier = 2, NumberOfHits = 1, Proc = "None" },
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = "Knockdown" },
            },
        },
        Wall = {
            Name = "Weightless Steel",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = "Knockdown" },
            },
        },
        Ground = {
            Name = "Crashing Wave",
            Attacks = {
                { Type = "Default", Multiplier = 2.5, NumberOfHits = 1, Proc = "Slash" },
            },
        },
    },
    ["Sparring"] = {
        Heavy = {
            Name = "Rising from Ashes",
            Attacks = {
                { Type = "Slam", Multiplier = 12, Proc = "Lifted" },
                { Multiplier = { 1, 1 }, NumberOfHits = { 4, 1 }, Proc = { "None", "Lifted" } },
            },
        },
        Slide = {
            Name = "Rolling Blast",
            Attacks = {
                { Multiplier = 2, NumberOfHits = 2, Proc = "Ragdoll" },
            },
        },
        Air = {
            Name = "One Point",
            Attacks = {
                { Multiplier = 2 },
                { Multiplier = 2, NumberOfHits = 2 },
                { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Wall = {
            Name = "Through Strike",
            Attacks = {
               { Multiplier = 3 },
            },
        },
        Ground = {
            Name = "Roaring Drums",
            Attacks = {
                { Multiplier = 5, NumberOfHits = 6 },
            },
        },
    },
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
    ["Valkyr's Talons"] = {
        Heavy = {
            Name = "Rise From Ashes",
            Attacks = {
                { Type = "Slam", Multiplier = 8.33, Proc = "Lifted" },
                { NumberOfHits = { 4, 1 }, Proc = { "None", "Lifted" } },
            },
        },
        Slide = {
            Name = "Launching Spring",
            Attacks = {
                { Type = "360", Multiplier = 3, NumberOfHits = 6 },
            },
        },
        Air = {
            Name = "One Point",
            Attacks = {
                { Multiplier = 2 },
                { Multiplier = 2, NumberOfHits = 2 },
                { Multiplier = 3, Proc = "Knockdown" },
            },
        },
        Wall = {
            Name = "Through Strike",
            Attacks = {
                { Multiplier = 3 },
            },
        },
        Ground = {
            Name = "Roaring Drums",
            Attacks = {
                { Multiplier = 20, NumberOfHits = 6 },
            },
        },
    },
    ["Test"] = {
        -- testing different heavy attack combos
        Heavy = {
            Name = "Heavy Combo",
            Attacks = {
                { },
                { Proc = "Slash" },
                { Type = "Slam" },
                { Type = "360" },
            },
        },
        Slide = {
            Name = "Slide Combo",
            Attacks = {
                { Type = "360", Multiplier = 3, NumberOfHits = 1, Proc = nil },
            },
        },
        -- testing all single status effects and some multi-status hits
        Air = {
            Name = "Air Combo",
            Attacks = {
                { Proc = "Impact" },
                { Proc = "Puncture" },
                { Proc = "Slash" },
                { Proc = "Lifted" },
                { Proc = "Blast" },
                { Proc = "Knockdown" },
                { Proc = "Ragdoll" },
                { Proc = "Stagger" },
                { Proc = "Finisher" },
                { Proc = "Impair" },
                { Proc = "ImpPun" },
                { Proc = "ImpSla" },
                { Proc = "PunSla" },
                { Proc = "ImpLif" },
                { Proc = "KnoLif" },
                { Proc = "KnoRag" },
                { Proc = "LifRag" },
            },
        },
        -- testing three hits
        Wall = {
            Name = "Wall Combo",
            Attacks = {
                -- no proc info
                { Multiplier = { 3, 2, 4 }, NumberOfHits = { 2, 1, 1 }, Proc = nil },
                -- has proc info
                { Multiplier = { 2, 5, 1 }, NumberOfHits = { 5, 2, 3 }, Proc = { "None", "Slash", "None" } },
            },
        },
        -- testing single hit but with double proc
        Ground = {
            Name = "Ground Combo",
            Attacks = {
                { Type = "Default", Multiplier = 3, NumberOfHits = 1, Proc = "ImpSla" },
            },
        },
    },
}

-- doing an inner join of SharedCombosData and StanceData table based
-- on weapon type
for stance in pairs(StanceData) do
    -- stance is a string key, not a reference to table in Lua
    local weaponType = StanceData[stance]["WeaponType"]
    if (weaponType == nil) then
        weaponType = "Test" 
    end
    for comboType, combo in pairs(SharedCombosData[weaponType]) do
        StanceData[stance][comboType] = combo
    end
end

return StanceData
```

