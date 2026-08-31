---
title: "Module:SynthTest"
wiki_url: "https://wiki.warframe.com/w/Module/SynthTest"
wiki_timestamp: "2020-12-18T02:46:46Z"
---

*Documentation for this module may be created at [Module:SynthTest/doc](/w/Module:SynthTest/doc?action=edit&redlink=1 "Module:SynthTest/doc (page does not exist)")*

```lua
local Data = {
    ["Labs"] = {
        ["Infested"] = {
            Name = "Bio Lab",
            Faction = "Infested"
        },
        ["Grineer"] = {
            Name = "Chem Lab",
            Faction = "Grineer"
        },
        ["Corpus"] = {
            Name = "Energy Lab",
            Faction = "Corpus"
        },
        ["Tenno"] = {
            Name = "Tenno Lab",
            Faction = "Tenno"
        },
        ["Orokin"] = {
            Name = "Orokin Lab",
            Faction = "Orokin"
        },
        ["Railjack"] = {
            Name = "Dry Dock",
            Faction = "Tenno"
        },
    },
    ["Research"] = {
        -- Bio Lab --
        ["Acrid"] = {
            Name = 'Acrid',
            Image = 'Acrid2.png',
            Lab = 'Infested',
            Time = 72,
            Affinity = 3000,
            Prereq = 'Torid',
            Resources = {
                {Name = 'Mutagen Sample', Count = 10},
                {Name = 'Ferrite', Count = 150},
                {Name = 'Nano Spores', Count = 1000},
                {Name = 'Polymer Bundle', Count = 500},},
            Credits = 7500
        },
        ["Bubonico"] = {
            Name = 'Bubonico',
            Image = 'Bubonico.png',
            Lab = 'Infested',
            Time = 72,
            Affinity = 3000,
            Prereq = 'Embolist',
            Resources = {
                {Name = 'Mutagen Sample', Count = 35},
                {Name = 'Rubedo', Count = 8000},
                {Name = 'Nano Spores', Count = 22000},
                {Name = 'Neurodes', Count = 20},},
            Credits = 5000
        },
        ["Catabolyst"] = {
            Name = 'Catabolyst',
            Image = 'Catabolyst.png',
            Lab = 'Infested',
            Time = 72,
            Affinity = 3000,
            Prereq = 'Embolist',
            Resources = {
                {Name = 'Mutagen Sample', Count = 40},
                {Name = 'Plastids', Count = 650},
                {Name = 'Salvage', Count = 3750},
                {Name = 'Nano Spores', Count = 4250},},
            Credits = 5000
        },
    }
}

return Data
```

