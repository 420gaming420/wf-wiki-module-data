local data = {
Global = {
    Tiers = {
        Normal = {
            [-2] = {
                StandingMin = -44000,
                StandingMax = 0
                },
            [-1] = {
                StandingMin = -22000,
                StandingMax = 0
                },
            [0] = {
                StandingMin = -5000,
                StandingMax = 5000
                },
            [1] = {
                StandingMin = 0,
                StandingMax = 22000
                },
            [2] = {
                StandingMin = 0,
                StandingMax = 44000
                },
            [3] = {
                StandingMin = 0,
                StandingMax = 70000
                },
            [4] = {
                StandingMin = 0,
                StandingMax = 99000
                },
            [5] = {
                StandingMin = 0,
                StandingMax = 132000
                },
            },
        },
    },
Syndicates = {
    ["Arbiters of Hexis"] = {
        Name = "Arbiters of Hexis",
        Type = "Normal",
        KillSquad = "Eximus Corrupted Lancer",
        Initiation = {
            Credits = 10000,
            Item = {Name = "Nano Spores", Type = "Resource", Count = 500},
            },
        Ranks = {
            [-2] = {
                Title = "Fraud",
            },
            [-1] = {
                Title = "Deceiver",
                Cost = {
                    Credits = 100000,
                    Item = {Name = "Orokin Reactor", Type = "Item"}},
                },
            [0] = {
                Title = "Neutral",
                Cost = {
                    Credits = 50000,
                    Item = {Name = "Forma", Type = "Item"}},
                },
            [1] = {
                Title = "Principled",
                Cost = {
                    Credits = 30000,
                    Item = {Name = "Neural Sensors", Type = "Resource", Count = 2}},
                },
            [2] = {
                Title = "Authentic",
                Cost = {
                    Credits = 50000,
                    Item = {Name = "Forma", Type = "Item"}},
                },
            [3] = {
                Title = "Lawful",
                Cost = {
                    Credits = 100000,
                    Item = {Name = "Orokin Reactor", Type = "Item"}},
                },
            [4] = {
                Title = "Crusader",
                Cost = {
                    Credits = 250000,
                    Item = {Name = "Cernos Prime Lower Limb", Type = "PrimePart"}},
                },
            [5] = {
                Title = "Maxim",
                Cost = {
                    Credits = 500000,
                    Item = {Name = "Nekros Prime Neuroptics", Type = "PrimePart"}},
                },
            },
        },
        Offerings = {
            { Name = "Corrupted Lancer Specter",
              Type = "Item",
              Count = 5,
              Rank = 1,
              Cost = 2500},
            { Name = "Guiding Path Sigil",
              Type = "Sigil",
              Rank = 1,
              Cost = 2500},
          { Name = "Bending Will Sigil",
              Type = "Sigil",
              Rank = 1,
              Cost = 5000},
          { Name = "Discipline Sigil",
              Type = "Sigil",
              Rank = 1,
              Cost = 7500},
          { Name = "Syndicate Relic Pack",
              Type = "Relic",
              Rank = 2,
              Cost = 25000},
          { Name = "Dual Decurion Barrel",
              Type = "Blueprint",
              Rank = 2,
              Cost = 20000},
          { Name = "Phaedra Barrel",
              Type = "Blueprint",
              Rank = 2,
              Cost = 20000},
          { Name = "Corvas Barrel",
              Type = "Blueprint",
              Rank = 2,
              Cost = 20000},
          { Name = "Will Sigil",
              Type = "Sigil",
              Rank = 2,
              Cost = 10000},
          { Name = "Choice Sigil",
              Type = "Sigil",
              Rank = 2,
              Cost = 15000},
        },
    },
}

return data
