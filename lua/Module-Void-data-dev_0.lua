
-- When a relic is vaulted, it cannot be obtained through in-game missions.
-- In other words, they do not appear in any mission drop tables. When a relic
-- is vaulted, that means at least one item part that drops from that relic is
-- also vaulted. An item part is defined as being vaulted when all the relics
-- that it can be dropped from are vaulted.

-- Normally, relics that have been vaulted will not be unvaulted in the future.
-- Exceptions are:
-- * 2016, 2019, and 2020 Frost & Ember Prime Vault with Lith G1, Meso F2, Neo S5, and Axi E1
-- * 2018, 2019, and 2021 Nyx & Rhino Prime Vault Lith B4, Meso N6, Neo R1, and Axi S3
-- * Baro relics Neo O1, Axi A2, Axi A5, Axi V8

local Table = require('Module:Table')

-- Exceptions to the ducat prices due to distribution of rarities, probably if
-- at least 2/3 of drop rarities are a single type, then the ducat value will be based
-- on that type; TODO: figure out a pattern in which DE decides these exceptions
-- Nikana Prime Blueprint is an interesting edge case at 25 ducats with 2 rare, 1 uncommon, and 3 common drops
local DUCAT_EXCEPTIONS = {
		Forma = { Blueprint = 0 },
		Akstiletto = { Receiver = 45 },
		Braton = { Receiver = 45 },
		Rubico = { Stock = 45 },
		Saryn = { ['Neuroptics Blueprint'] = 45 },
		Soma = { Blueprint = 15 },
	}

local RelicData = {}	-- contains item part drops by relic

-- the 'inverse' of RelicData or a different view of the same dataset in RelicData
-- contains relic appearances by item part; 
local PrimeData = {}

-- Some notes on relationship of database entities from point of view of relational databases:
-- A Void Relic has multiple prime item parts that it can drop
-- A prime part can drop from multiple Void Relics 
-- > Thus the relationship between Relic and Part is many-to-many

-- A Primed item is made up of multiple prime parts
-- A specific prime part is associated with a single Primed item
-- > Thus the relationship between Item and Part is one-to-many

-- |Relic|
-- *FullName (string)
-- *Part (string)
-- Name (string)
-- Tier (string)
-- Introduced (string)
-- Vaulted (string)

-- |Item|
-- *Name (string)
-- Part (string)
-- IsVaulted (boolean)

-- |Part|
-- *Item (string)
-- *Relic (string)
-- Rarity (string)
-- DucatCost (number)

RelicData = {
	["Axi A1"] = {
		Drops = {
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Head", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Dual Kamas Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "A1",
		Tier = "Axi",
		Vaulted = "21.6" 
	},
	["Axi A10"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Aksomati Prime", Part = "Link", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "A10",
		Tier = "Axi",
		Vaulted = "29.9" 
	},
	["Axi A11"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Atlas Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "A11",
		Tier = "Axi",
		Vaulted = "30.3" 
	},
	["Axi A12"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "A12",
		Tier = "Axi",
		Vaulted = "30.0.8" 
	},
	["Axi A13"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Aksomati Prime", Part = "Link", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "A13",
		Tier = "Axi" 
	},
	["Axi A2"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Aklex Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Aklex Prime", Part = "Link", Rarity = "Rare" } 
		},
		Introduced = "19.8.1",
		IsBaro = true,
		Name = "A2",
		Tier = "Axi" 
	},
	["Axi A3"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "A3",
		Tier = "Axi",
		Vaulted = "23.9" 
	},
	["Axi A4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "A4",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi A5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Akvasto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Vasto Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akvasto Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.0.6",
		IsBaro = true,
		Name = "A5",
		Tier = "Axi" 
	},
	["Axi A6"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Ornament", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Atlas Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "A6",
		Tier = "Axi",
		Vaulted = "28.2" 
	},
	["Axi A7"] = {
		Drops = {
			{ Item = "Akstiletto Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "26.0.8",
		Name = "A7",
		Tier = "Axi",
		Vaulted = "27.1.1" 
	},
	["Axi A8"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Aksomati Prime", Part = "Link", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "A8",
		Tier = "Axi",
		Vaulted = "27.3.6" 
	},
	["Axi A9"] = {
		Drops = {
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Atlas Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "A9",
		Tier = "Axi",
		Vaulted = "28.2" 
	},
	["Axi B1"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Buckle", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "B1",
		Tier = "Axi",
		Vaulted = "20.6.2" 
	},
	["Axi B2"] = {
		Drops = {
			{ Item = "Fragor Prime", Part = "Head", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "B2",
		Tier = "Axi",
		Vaulted = "22.16.4" 
	},
	["Axi B3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "B3",
		Tier = "Axi",
		Vaulted = "29.9" 
	},
	["Axi B4"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Karyst Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "B4",
		Tier = "Axi",
		Vaulted = "29.3" 
	},
	["Axi C1"] = {
		Drops = {
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Vectis Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "C1",
		Tier = "Axi",
		Vaulted = "20.6.2" 
	},
	["Axi C2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "C2",
		Tier = "Axi",
		Vaulted = "21.6" 
	},
	["Axi C3"] = {
		Drops = {
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "C3",
		Tier = "Axi",
		Vaulted = "24.2.2" 
	},
	["Axi C4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "C4",
		Tier = "Axi",
		Vaulted = "24.5.8" 
	},
	["Axi C5"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Panthera Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Ornament", Rarity = "Uncommon" },
			{ Item = "Corinth Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "C5",
		Tier = "Axi",
		Vaulted = "29.9" 
	},
	["Axi C6"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Karyst Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Pandero Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Corinth Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "C6",
		Tier = "Axi" 
	},
	["Axi D1"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Destreza Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "D1",
		Tier = "Axi",
		Vaulted = " 27.0.4" 
	},
	["Axi D2"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Destreza Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "D2",
		Tier = "Axi",
		Vaulted = "27.3.6" 
	},
	["Axi E1"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Sicarus Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Frost Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Glaive Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ember Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.3",
		Name = "E1",
		Tier = "Axi",
		Vaulted = "24.5.6" 
	},
	["Axi E2"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Euphona Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "E2",
		Tier = "Axi",
		Vaulted = "24.2.2" 
	},
	["Axi G1"] = {
		Drops = {
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "G1",
		Tier = "Axi",
		Vaulted = "21.6" 
	},
	["Axi G2"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Ornament", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "G2",
		Tier = "Axi",
		Vaulted = "25.8" 
	},
	["Axi G3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "G3",
		Tier = "Axi",
		Vaulted = "27.0.4" 
	},
	["Axi G4"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "G4",
		Tier = "Axi",
		Vaulted = "28.2" 
	},
	["Axi G5"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "G5",
		Tier = "Axi",
		Vaulted = "30.6.1"
	},
	["Axi G6"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Karyst Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gara Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "G6",
		Tier = "Axi" 
	},
	["Axi H1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Head", Rarity = "Common" },
			{ Item = "Vectis Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "H1",
		Tier = "Axi",
		Vaulted = "20.6.2"  
	},
	["Axi H2"] = {
		Drops = {
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "H2",
		Tier = "Axi",
		Vaulted = "21.6" 
	},
	["Axi H3"] = {
		Drops = {
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "H3",
		Tier = "Axi",
		Vaulted = "23.9" 
	},
	["Axi H4"] = {
		Drops = {
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "H4",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi H5"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "H5",
		Tier = "Axi",
		Vaulted = "30.0.8" 
	},
	["Axi I1"] = {
		Drops = {
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Panthera Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volnus Prime", Part = "Head", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "I1",
		Tier = "Axi" 
	},
	["Axi K1"] = {
		Drops = {
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Pouch", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Buckle", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "K1",
		Tier = "Axi",
		Vaulted = "The Silver Grove 3" 
	},
	["Axi K2"] = {
		Drops = {
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "K2",
		Tier = "Axi",
		Vaulted = "23.0.3" 
	},
	["Axi K3"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "K3",
		Tier = "Axi",
		Vaulted = "23.9" 
	},
	["Axi K4"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "K4",
		Tier = "Axi",
		Vaulted = "24.5.8" 
	},
	["Axi K5"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "K5",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi L1"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Reaper Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Glaive Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Loki Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "L1",
		Tier = "Axi",
		Vaulted = "22.17.3" 
	},
	["Axi L2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "L2",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi L3"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "L3",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi L4"] = {
		Drops = {
			{ Item = "Bo Prime", Part = "Ornament", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Loki Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.8.2",
		Name = "L4",
		Tier = "Axi",
		Vaulted = "25.3" 
	},
	["Axi L5"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "L5",
		Tier = "Axi",
		Vaulted = "27.0.4" 
	},
	["Axi M1"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "M1",
		Tier = "Axi",
		Vaulted = "25.8" 
	},
	["Axi N1"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Wings Blueprint", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N1",
		Tier = "Axi",
		Vaulted = "19.11.5" 
	},
	["Axi N2"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Hilt", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N2",
		Tier = "Axi",
		Vaulted = "20.6.2" 
	},
	["Axi N3"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "N3",
		Tier = "Axi",
		Vaulted = "19.11.5" 
	},
	["Axi N4"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Hilt", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "N4",
		Tier = "Axi",
		Vaulted = "22.7" 
	},
	["Axi N5"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "N5",
		Tier = "Axi",
		Vaulted = "23.0.3" 
	},
	["Axi N6"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Hilt", Rarity = "Rare" } 
		},
		Introduced = "24.2.15",
		Name = "N6",
		Tier = "Axi",
		Vaulted = "24.2.15" 
	},
	["Axi N7"] = {
		Drops = {
			{ Item = "Octavia Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Astilla Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "N7",
		Tier = "Axi" 
	},
	["Axi O1"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "O1",
		Tier = "Axi",
		Vaulted = "22.16.4" 
	},
	["Axi O2"] = {
		Drops = {
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "O2",
		Tier = "Axi",
		Vaulted = "23.0.3" 
	},
	["Axi O3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "O3",
		Tier = "Axi",
		Vaulted = "23.9" 
	},
	["Axi O4"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "O4",
		Tier = "Axi",
		Vaulted = "24.5.8" 
	},
	["Axi O5"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Nezha Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Panthera Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Octavia Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "O5",
		Tier = "Axi" 
	},
	["Axi P1"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "P1",
		Tier = "Axi",
		Vaulted = "25.8" 
	},
	["Axi P2"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "P2",
		Tier = "Axi",
		Vaulted = "27.0.4" 
	},
	["Axi P3"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "P3",
		Tier = "Axi",
		Vaulted = "27.3.6" 
	},
	["Axi R1"] = {
		Drops = {
			{ Item = "Boltor Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Boar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Dakra Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ankyros Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Rhino Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.7.4",
		Name = "R1",
		Tier = "Axi",
		Vaulted = "21.2.1" 
	},
	["Axi R2"] = {
		Drops = {
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "R2",
		Tier = "Axi",
		Vaulted = "25.8" 
	},
	["Axi R3"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "R3",
		Tier = "Axi",
		Vaulted = "27.0.4" 
	},
	["Axi S1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S1",
		Tier = "Axi",
		Vaulted = "The Silver Grove 3" 
	},
	["Axi S2"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Loki Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ember Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Sicarus Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "S2",
		Tier = "Axi",
		Vaulted = "22.17.3" 
	},
	["Axi S3"] = {
		Drops = {
			{ Item = "Boltor Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Stars", Rarity = "Common" },
			{ Item = "Rhino Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Ankyros Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.1.2",
		Name = "S3",
		Tier = "Axi"
	},
	["Axi S4"] = {
		Drops = {
			{ Item = "Boar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Dakra Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "24.0.6",
		Name = "S4",
		Tier = "Axi",
		Vaulted = "24.2.11" 
	},
	["Axi S5"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "S5",
		Tier = "Axi",
		Vaulted = "26.0.8" 
	},
	["Axi S6"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "S6",
		Tier = "Axi",
		Vaulted = "27.5.6" 
	},
	["Axi S7"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "27.5.6",
		Name = "S7",
		Tier = "Axi",
		Vaulted = "29.2" 
	},
	["Axi S8"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "29.10",
		Name = "S8",
		Tier = "Axi" 
	},
	["Axi T1"] = {
		Drops = {
			{ Item = "Vectis Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "T1",
		Tier = "Axi",
		Vaulted = "19.11.5" 
	},
	["Axi T2"] = {
		Drops = {
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "T2",
		Tier = "Axi",
		Vaulted = "25.8" 
	},
	["Axi T3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "T3",
		Tier = "Axi",
		Vaulted = "27.3.6" 
	},
	["Axi T4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "T4",
		Tier = "Axi",
		Vaulted = "29.9" 
	},
	["Axi T5"] = {
		Drops = {
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "T5",
		Tier = "Axi",
		Vaulted = "28.2" 
	},
	["Axi T6"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Zakti Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Tenora Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "T6",
		Tier = "Axi",
		Vaulted = "30.3" 
	},
	["Axi T7"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "T7",
		Tier = "Axi" 
	},
	["Axi V1"] = {
		Drops = {
			{ Item = "Odonata Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V1",
		Tier = "Axi",
		Vaulted = "19.11.5" 
	},
	["Axi V10"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "String", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Stars", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "29.10",
		Name = "V10",
		Tier = "Axi" 
	},
	["Axi V2"] = {
		Drops = {
			{ Item = "Hikou Prime", Part = "Pouch", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Boar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V2",
		Tier = "Axi",
		Vaulted = "Specters of the Rail 13" 
	},
	["Axi V3"] = {
		Drops = {
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail 13",
		Name = "V3",
		Tier = "Axi",
		Vaulted = "19.0.7" 
	},
	["Axi V4"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "V4",
		Tier = "Axi",
		Vaulted = "19.11.5" 
	},
	["Axi V5"] = {
		Drops = {
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "V5",
		Tier = "Axi",
		Vaulted = "21.6" 
	},
	["Axi V6"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "V6",
		Tier = "Axi",
		Vaulted = "23.0.3" 
	},
	["Axi V7"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "V7",
		Tier = "Axi",
		Vaulted = "23.9" 
	},
	["Axi V8"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.15.1",
		IsBaro = true,
		Name = "V8",
		Tier = "Axi" 
	},
	["Axi V9"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "V9",
		Tier = "Axi",
		Vaulted = "26.0.8" 
	},
	["Axi W1"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "W1",
		Tier = "Axi",
		Vaulted = "29.9" 
	},
	["Axi W2"] = {
		Drops = {
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "W2",
		Tier = "Axi",
		Vaulted = "30.3" 
	},
	["Axi Z1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Panthera Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Baza Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "Z1",
		Tier = "Axi",
		Vaulted = "30.3" 
	},
	["Lith A1"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "A1",
		Tier = "Lith",
		Vaulted = "19.0.7" 
	},
	["Lith A2"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "A2",
		Tier = "Lith",
		Vaulted = "22.16.4" 
	},
	["Lith A3"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akjagara Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "A3",
		Tier = "Lith",
		Vaulted = "25.8" 
	},
	["Lith A4"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Baza Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Astilla Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "A4",
		Tier = "Lith" 
	},
	["Lith B1"] = {
		Drops = {
			{ Item = "Mag Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Ankyros Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rhino Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Boltor Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Boar Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "20.7.4",
		Name = "B1",
		Tier = "Lith",
		Vaulted = "21.2.1" 
	},
	["Lith B2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "B2",
		Tier = "Lith",
		Vaulted = "23.0.3" 
	},
	["Lith B3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "B3",
		Tier = "Lith",
		Vaulted = "23.9" 
	},
	["Lith B4"] = {
		Drops = {
			{ Item = "Ankyros Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rhino Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Boltor Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.1.2",
		Name = "B4",
		Tier = "Lith"
	},
	["Lith B5"] = {
		Drops = {
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "B5",
		Tier = "Lith",
		Vaulted = "24.2.2"
	},
	["Lith B6"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "B6",
		Tier = "Lith",
		Vaulted = "25.3"
	},
	["Lith B7"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Aksomati Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "B7",
		Tier = "Lith",
		Vaulted = "29.9"
	},
	["Lith B8"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "B8",
		Tier = "Lith" 
	},
	["Lith C1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Carrier Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "C1",
		Tier = "Lith",
		Vaulted = "19.0.7" 
	},
	["Lith C2"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "C2",
		Tier = "Lith",
		Vaulted = "23.9" 
	},
	["Lith C3"] = {
		Drops = {
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "C3",
		Tier = "Lith",
		Vaulted = "24.2.2" 
	},
	["Lith C4"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "C4",
		Tier = "Lith",
		Vaulted = "28.2" 
	},
	["Lith C5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "C5",
		Tier = "Lith",
		Vaulted = "26.0.8" 
	},
	["Lith C6"] = {
		Drops = {
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Corinth Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "C6",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith C7"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Pouch", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "29.10",
		Name = "C7",
		Tier = "Lith" 
	},
	["Lith C8"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "C8",
		Tier = "Lith",
		Vaulted = "30.6.1"
	},
	["Lith D1"] = {
		Drops = {
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "D1",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith D2"] = {
		Drops = {
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "D2",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith D3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "D3",
		Tier = "Lith",
		Vaulted = "29.9" 
	},
	["Lith D4"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "D4",
		Tier = "Lith",
		Vaulted = "30.3" 
	},
	["Lith F1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Scindo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "F1",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3" 
	},
	["Lith F2"] = {
		Drops = {
			{ Item = "Odonata Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Stars", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "F2",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3" 
	},
	["Lith G1"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Frost Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Reaper Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Ember Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Glaive Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.3",
		Name = "G1",
		Tier = "Lith",
		Vaulted = "24.5.6" 
	},
	["Lith G2"] = {
		Drops = {
			{ Item = "Bo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Latron Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Cerebrum", Rarity = "Common" },
			{ Item = "Frost Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Loki Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Glaive Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "G2",
		Tier = "Lith",
		Vaulted = "22.17.3" 
	},
	["Lith G3"] = {
		Drops = {
			{ Item = "Octavia Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Guandao Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "G3",
		Tier = "Lith",
		Vaulted = "30.3" 
	},
	["Lith G4"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Octavia Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Guandao Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "G4",
		Tier = "Lith" 
	},
	["Lith H1"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "H1",
		Tier = "Lith",
		Vaulted = "22.7" 
	},
	["Lith H2"] = {
		Drops = {
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "H2",
		Tier = "Lith",
		Vaulted = "24.2.2" 
	},
	["Lith I1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Pandero Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Karyst Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "I1",
		Tier = "Lith" 
	},
	["Lith K1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Buckle", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "K1",
		Tier = "Lith",
		Vaulted = "19.11.5" 
	},
	["Lith K2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "K2",
		Tier = "Lith",
		Vaulted = "25.8"
	},
	["Lith K3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "K3",
		Tier = "Lith",
		Vaulted = "27.0.4" 
	},
	["Lith K4"] = {
		Drops = {
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Buckle", Rarity = "Rare" } 
		},
		Introduced = "27.5.6",
		Name = "K4",
		Tier = "Lith",
		Vaulted = "29.2" 
	},
	["Lith K5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "K5",
		Tier = "Lith",
		Vaulted = "30.0.8" 
	},
	["Lith K6"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gara Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Karyst Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "K6",
		Tier = "Lith" 
	},
	["Lith L1"] = {
		Drops = {
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "L1",
		Tier = "Lith",
		Vaulted = "25.8" 
	},
	["Lith L2"] = {
		Drops = {
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "L2",
		Tier = "Lith",
		Vaulted = "27.3.6"
	},
	["Lith M1"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Boar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dakra Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mag Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "M1",
		Tier = "Lith",
		Vaulted = "Specters of the Rail 13"
	},
	["Lith M2"] = {
		Drops = {
			{ Item = "Dakra Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Boar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mag Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.0.6",
		Name = "M2",
		Tier = "Lith",
		Vaulted = "24.2.11"
	},
	["Lith M3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "M3",
		Tier = "Lith",
		Vaulted = "24.5.8"
	},
	["Lith M4"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "M4",
		Tier = "Lith",
		Vaulted = "27.3.6" 
	},
	["Lith M5"] = {
		Drops = {
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "M5",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith M6"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "M6",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith M7"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "M7",
		Tier = "Lith",
		Vaulted = "30.0.8" 
	},
	["Lith N1"] = {
		Drops = {
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "N1",
		Tier = "Lith",
		Vaulted = "19.0.7" 
	},
	["Lith N2"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "N2",
		Tier = "Lith",
		Vaulted = "20.6.2" 
	},
	["Lith N3"] = {
		Drops = {
			{ Item = "Sybaris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "N3",
		Tier = "Lith",
		Vaulted = "23.0.3" 
	},
	["Lith N4"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.3.9",
		Name = "N4",
		Tier = "Lith",
		Vaulted = "28.2" 
	},
	["Lith N5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "N5",
		Tier = "Lith",
		Vaulted = "29.9"
	},
	["Lith N6"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "N6",
		Tier = "Lith",
		Vaulted = "30.3" 
	},
	["Lith O1"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "O1",
		Tier = "Lith",
		Vaulted = "24.5.8"
	},
	["Lith O2"] = {
		Drops = {
			{ Item = "Bo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Cerebrum", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Loki Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Wings Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.8.2",
		Name = "O2",
		Tier = "Lith",
		Vaulted = "25.3" 
	},
	["Lith P1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "P1",
		Tier = "Lith",
		Vaulted = "24.2.2" 
	},
	["Lith P2"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "P2",
		Tier = "Lith",
		Vaulted = "25.3" 
	},
	["Lith P3"] = {
		Drops = {
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "P3",
		Tier = "Lith",
		Vaulted = "29.3"
	},
	["Lith P4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "P4",
		Tier = "Lith",
		Vaulted = "29.9" 
	},
	["Lith P5"] = {
		Drops = {
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Guandao Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "P5",
		Tier = "Lith" 
	},
	["Lith S1"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S1",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3" 
	},
	["Lith S10"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Baza Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "S10",
		Tier = "Lith",
		Vaulted = "29.3" 
	},
	["Lith S2"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S2",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3" 
	},
	["Lith S3"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "S3",
		Tier = "Lith",
		Vaulted = "19.0.7" 
	},
	["Lith S4"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "S4",
		Tier = "Lith",
		Vaulted = "21.6" 
	},
	["Lith S5"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "S5",
		Tier = "Lith",
		Vaulted = "20.6.2" 
	},
	["Lith S6"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "S6",
		Tier = "Lith",
		Vaulted = "21.6" 
	},
	["Lith S7"] = {
		Drops = {
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "S7",
		Tier = "Lith",
		Vaulted = "23.0.3" 
	},
	["Lith S8"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "S8",
		Tier = "Lith",
		Vaulted = "28.2" 
	},
	["Lith S9"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Guard", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "S9",
		Tier = "Lith",
		Vaulted = "27.5.6" 
	},
	["Lith T1"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "T1",
		Tier = "Lith",
		Vaulted = "23.0.3" 
	},
	["Lith T2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "T2",
		Tier = "Lith",
		Vaulted = "23.9" 
	},
	["Lith T3"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "T3",
		Tier = "Lith",
		Vaulted = "27.5.6" 
	},
	["Lith T4"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Zakti Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Karyst Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "T4",
		Tier = "Lith" 
	},
	["Lith T5"] = {
		Drops = {
			{ Item = "Corinth Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tenora Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "T5",
		Tier = "Lith",
		Vaulted = "30.3" 
	},
	["Lith T6"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "T6",
		Tier = "Lith",
		Vaulted = "30.6.1"
	},
	["Lith V1"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V1",
		Tier = "Lith",
		Vaulted = "19.11.5" 
	},
	["Lith V2"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "V2",
		Tier = "Lith",
		Vaulted = "22.16.4" 
	},
	["Lith V3"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "V3",
		Tier = "Lith",
		Vaulted = "23.0.3" 
	},
	["Lith V4"] = {
		Drops = {
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "V4",
		Tier = "Lith",
		Vaulted = "22.7" 
	},
	["Lith V5"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "V5",
		Tier = "Lith",
		Vaulted = "23.9" 
	},
	["Lith V6"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "V6",
		Tier = "Lith",
		Vaulted = "26.0.8" 
	},
	["Lith V7"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Head", Rarity = "Common" },
			{ Item = "Vectis Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "26.0.8",
		Name = "V7",
		Tier = "Lith",
		Vaulted = "27.1.1" 
	},
	["Lith V8"] = {
		Drops = {
			{ Item = "Ash Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "26.0.8",
		Name = "V8",
		Tier = "Lith",
		Vaulted = "27.1.1" 
	},
	["Lith W1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "W1",
		Tier = "Lith",
		Vaulted = "25.8" 
	},
	["Lith W2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Baza Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "W2",
		Tier = "Lith",
		Vaulted = "28.2" 
	},
	["Lith Z1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "Z1",
		Tier = "Lith",
		Vaulted = "23.9" 
	},
	["Lith Z2"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "Z2",
		Tier = "Lith",
		Vaulted = "24.2.2" 
	},
	["Meso A1"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Akjagara Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "A1",
		Tier = "Meso",
		Vaulted = "24.5.8" 
	},
	["Meso A2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "A2",
		Tier = "Meso",
		Vaulted = "25.8" 
	},
	["Meso B1"] = {
		Drops = {
			{ Item = "Dakra Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Boar Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "B1",
		Tier = "Meso",
		Vaulted = "Specters of the Rail 13" 
	},
	["Meso B2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "B2",
		Tier = "Meso",
		Vaulted = "24.2.2" 
	},
	["Meso B3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dakra Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mag Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Boar Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "24.0.6",
		Name = "B3",
		Tier = "Meso",
		Vaulted = "24.2.11" 
	},
	["Meso B4"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "B4",
		Tier = "Meso",
		Vaulted = "28.2" 
	},
	["Meso C1"] = {
		Drops = {
			{ Item = "Nova Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Scindo Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Carrier Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "C1",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3" 
	},
	["Meso C2"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Carrier Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "C2",
		Tier = "Meso",
		Vaulted = "19.11.5" 
	},
	["Meso C3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Lower Limb", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "C3",
		Tier = "Meso",
		Vaulted = "22.7" 
	},
	["Meso C4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "C4",
		Tier = "Meso",
		Vaulted = "28.2" 
	},
	["Meso C5"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Corinth Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "C5",
		Tier = "Meso",
		Vaulted = "28.2" 
	},
	["Meso C6"] = {
		Drops = {
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Corinth Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "C6",
		Tier = "Meso" 
	},
	["Meso D1"] = {
		Drops = {
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Dual Kamas Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "D1",
		Tier = "Meso",
		Vaulted = "21.6" 
	},
	["Meso D2"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Destreza Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "D2",
		Tier = "Meso",
		Vaulted = "23.9" 
	},
	["Meso D3"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Destreza Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "D3",
		Tier = "Meso",
		Vaulted = "25.3" 
	},
	["Meso D4"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "D4",
		Tier = "Meso",
		Vaulted = "28.2" 
	},
	["Meso D5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vasto Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dual Kamas Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "27.5.6",
		Name = "D5",
		Tier = "Meso",
		Vaulted = "29.2" 
	},
	["Meso D6"] = {
		Drops = {
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Octavia Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Aksomati Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "D6",
		Tier = "Meso" 
	},
	["Meso E1"] = {
		Drops = {
			{ Item = "Bo Prime", Part = "Ornament", Rarity = "Common" },
			{ Item = "Frost Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Latron Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wyrm Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Ember Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "E1",
		Tier = "Meso",
		Vaulted = "22.17.3" 
	},
	["Meso E2"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Equinox Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "E2",
		Tier = "Meso",
		Vaulted = "25.8" 
	},
	["Meso E3"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Equinox Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "E3",
		Tier = "Meso",
		Vaulted = "27.3.6" 
	},
	["Meso E4"] = {
		Drops = {
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Equinox Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "E4",
		Tier = "Meso",
		Vaulted = "29.9" 
	},
	["Meso E5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Euphona Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "E5",
		Tier = "Meso",
		Vaulted = "30.0.8" 
	},
	["Meso F1"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Dual Kamas Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "F1",
		Tier = "Meso",
		Vaulted = "21.6" 
	},
	["Meso F2"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Ember Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Sicarus Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Reaper Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Frost Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.3",
		Name = "F2",
		Tier = "Meso",
		Vaulted = "24.5.6"
	},
	["Meso F3"] = {
		Drops = {
			{ Item = "Ember Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Loki Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Reaper Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Glaive Prime", Part = "Disc", Rarity = "Uncommon" },
			{ Item = "Frost Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "F3",
		Tier = "Meso",
		Vaulted = "22.17.3"
	},
	["Meso G1"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "G1",
		Tier = "Meso",
		Vaulted = "23.0.3" 
	},
	["Meso G2"] = {
		Drops = {
			{ Item = "Equinox Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Guandao Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "G2",
		Tier = "Meso",
		Vaulted = "29.9"
	},
	["Meso H1"] = {
		Drops = {
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "H1",
		Tier = "Meso",
		Vaulted = "22.16.4" 
	},
	["Meso I1"] = {
		Drops = {
			{ Item = "Corinth Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Orthos Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "I1",
		Tier = "Meso" 
	},
	["Meso K1"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "K1",
		Tier = "Meso",
		Vaulted = "22.16.4" 
	},
	["Meso K2"] = {
		Drops = {
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "K2",
		Tier = "Meso",
		Vaulted = "25.8" 
	},
	["Meso K3"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Karyst Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "K3",
		Tier = "Meso",
		Vaulted = "30.3" 
	},
	["Meso L1"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "L1",
		Tier = "Meso",
		Vaulted = "27.3.6" 
	},
	["Meso M1"] = {
		Drops = {
			{ Item = "Dakra Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Boltor Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Ankyros Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Boar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Rhino Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Mag Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.7.4",
		Name = "M1",
		Tier = "Meso",
		Vaulted = "21.2.1"
	},
	["Meso M2"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "M2",
		Tier = "Meso",
		Vaulted = "24.5.8" 
	},
	["Meso M3"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "M3",
		Tier = "Meso",
		Vaulted = "25.3" 
	},
	["Meso N1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dual Kamas Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N1",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3" 
	},
	["Meso N10"] = {
		Drops = {
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "N10",
		Tier = "Meso",
		Vaulted = "30.3" 
	},
	["Meso N11"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Scindo Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.10",
		Name = "N11",
		Tier = "Meso" 
	},
	["Meso N2"] = {
		Drops = {
			{ Item = "Hikou Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N2",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3" 
	},
	["Meso N3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Carrier Prime", Part = "Cerebrum", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "N3",
		Tier = "Meso",
		Vaulted = "20.6.2" 
	},
	["Meso N4"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "N4",
		Tier = "Meso",
		Vaulted = "22.7" 
	},
	["Meso N5"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "N5",
		Tier = "Meso",
		Vaulted = "23.0.3" 
	},
	["Meso N6"] = {
		Drops = {
			{ Item = "Boltor Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Pouch", Rarity = "Common" },
			{ Item = "Rhino Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Scindo Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.1.2",
		Name = "N6",
		Tier = "Meso"
	},
	["Meso N7"] = {
		Drops = {
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "N7",
		Tier = "Meso",
		Vaulted = "27.0.4" 
	},
	["Meso N8"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Hilt", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "N8",
		Tier = "Meso",
		Vaulted = "26.0.8" 
	},
	["Meso N9"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "N9",
		Tier = "Meso",
		Vaulted = "29.3" 
	},
	["Meso O1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Akstiletto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "O1",
		Tier = "Meso",
		Vaulted = "22.16.4" 
	},
	["Meso O2"] = {
		Drops = {
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "O2",
		Tier = "Meso",
		Vaulted = "23.9" 
	},
	["Meso O3"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Loki Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Wyrm Prime", Part = "Systems", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Wings Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.8.2",
		Name = "O3",
		Tier = "Meso",
		Vaulted = "25.3" 
	},
	["Meso O4"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "O4",
		Tier = "Meso",
		Vaulted = "27.5.6" 
	},
	["Meso P1"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Oberon Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "P1",
		Tier = "Meso",
		Vaulted = "24.5.8" 
	},
	["Meso P2"] = {
		Drops = {
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "P2",
		Tier = "Meso",
		Vaulted = "30.3" 
	},
	["Meso P3"] = {
		Drops = {
			{ Item = "Karyst Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "P3",
		Tier = "Meso",
		Vaulted = "29.3" 
	},
	["Meso P4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "P4",
		Tier = "Meso" 
	},
	["Meso P5"] = {
		Drops = {
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Tenora Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zakti Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gara Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "P5",
		Tier = "Meso" 
	},
	["Meso R1"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Tiberon Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "R1",
		Tier = "Meso",
		Vaulted = "25.3" 
	},
	["Meso R2"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "R2",
		Tier = "Meso",
		Vaulted = "27.3.6" 
	},
	["Meso R3"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "R3",
		Tier = "Meso",
		Vaulted = "28.2"  
	},
	["Meso R4"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "R4",
		Tier = "Meso",
		Vaulted = "30.6.1"
	},
	["Meso S1"] = {
		Drops = {
			{ Item = "Nova Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "S1",
		Tier = "Meso",
		Vaulted = "19.0.7" 
	},
	["Meso S2"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "S2",
		Tier = "Meso",
		Vaulted = "22.7" 
	},
	["Meso S3"] = {
		Drops = {
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "S3",
		Tier = "Meso",
		Vaulted = "20.6.2" 
	},
	["Meso S4"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "S4",
		Tier = "Meso",
		Vaulted = "21.6" 
	},
	["Meso S5"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "S5",
		Tier = "Meso",
		Vaulted = "22.7" 
	},
	["Meso S6"] = {
		Drops = {
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "20.6.4",
		Name = "S6",
		Tier = "Meso",
		Vaulted = "22.7"
	},
	["Meso S7"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Nami Skyla Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "S7",
		Tier = "Meso",
		Vaulted = "23.9"
	},
	["Meso S8"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gram Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Ballistica Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "S8",
		Tier = "Meso",
		Vaulted = "24.5.8" 
	},
	["Meso S9"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "24.2.15",
		Name = "S9",
		Tier = "Meso",
		Vaulted = "24.2.15" 
	},
	["Meso T1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "T1",
		Tier = "Meso",
		Vaulted = "27.0.4" 
	},
	["Meso T2"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "T2",
		Tier = "Meso",
		Vaulted = "23.0.3" 
	},
	["Meso T3"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "T3",
		Tier = "Meso",
		Vaulted = "27.0.4" 
	},
	["Meso T4"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Tenora Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "T4",
		Tier = "Meso",
		Vaulted = "30.3" 
	},
	["Meso T5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Astilla Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Panthera Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Tenora Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "T5",
		Tier = "Meso" 
	},
	["Meso V1"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V1",
		Tier = "Meso",
		Vaulted = "20.6.2" 
	},
	["Meso V2"] = {
		Drops = {
			{ Item = "Vasto Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V2",
		Tier = "Meso",
		Vaulted = "19.0.7" 
	},
	["Meso V3"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "V3",
		Tier = "Meso",
		Vaulted = "19.11.5" 
	},
	["Meso V4"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "V4",
		Tier = "Meso",
		Vaulted = "20.6.2" 
	},
	["Meso V5"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "V5",
		Tier = "Meso",
		Vaulted = "22.7" 
	},
	["Meso V6"] = {
		Drops = {
			{ Item = "Akstiletto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Cerebrum", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "26.0.8",
		Name = "V6",
		Tier = "Meso",
		Vaulted = "27.1.1" 
	},
	["Meso W1"] = {
		Drops = {
			{ Item = "Tekko Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "W1",
		Tier = "Meso",
		Vaulted = "27.0.4" 
	},
	["Meso Z1"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "Z1",
		Tier = "Meso",
		Vaulted = "24.2.2" 
	},
	["Meso Z2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "Z2",
		Tier = "Meso",
		Vaulted = "24.5.8"
	},
	["Meso Z3"] = {
		Drops = {
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "Z3",
		Tier = "Meso",
		Vaulted = "27.0.4" 
	},
	["Meso Z4"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Volnus Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Tenora Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "Z4",
		Tier = "Meso" 
	},
	["Neo A1"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "String", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "A1",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo A2"] = {
		Drops = {
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbolto Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "A2",
		Tier = "Neo",
		Vaulted = "25.8" 
	},
	["Neo A3"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Equinox Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Akjagara Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "A3",
		Tier = "Neo",
		Vaulted = "29.3" 
	},
	["Neo A4"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Vauban Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Vectis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "26.0.8",
		Name = "A4",
		Tier = "Neo",
		Vaulted = "27.1.1" 
	},
	["Neo A5"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Gara Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Karyst Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Octavia Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Atlas Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "A5",
		Tier = "Neo" 
	},
	["Neo B1"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Vectis Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "B1",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo B2"] = {
		Drops = {
			{ Item = "Tigris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "B2",
		Tier = "Neo",
		Vaulted = "23.0.3" 
	},
	["Neo B3"] = {
		Drops = {
			{ Item = "Boar Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rhino Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Dakra Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Boltor Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.7.4",
		Name = "B3",
		Tier = "Neo",
		Vaulted = "21.2.1" 
	},
	["Neo B4"] = {
		Drops = {
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "B4",
		Tier = "Neo",
		Vaulted = "23.0.3" 
	},
	["Neo B5"] = {
		Drops = {
			{ Item = "Ballistica Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "B5",
		Tier = "Neo",
		Vaulted = "24.2.2"
	},
	["Neo B6"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Banshee Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.5.9",
		Name = "B6",
		Tier = "Neo",
		Vaulted = "30.0.8" 
	},
	["Neo B7"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tenora Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Stock", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "B7",
		Tier = "Neo" 
	},
	["Neo C1"] = {
		Drops = {
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Chroma Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "C1",
		Tier = "Neo",
		Vaulted = "27.0.4" 
	},
	["Neo D1"] = {
		Drops = {
			{ Item = "Mag Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Boar Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dakra Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "D1",
		Tier = "Neo",
		Vaulted = "Specters of the Rail 13" 
	},
	["Neo D2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nezha Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Equinox Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Cerebrum", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "D2",
		Tier = "Neo",
		Vaulted = "29.9" 
	},
	["Neo D3"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nezha Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Dethcube Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "D3",
		Tier = "Neo" 
	},
	["Neo E1"] = {
		Drops = {
			{ Item = "Frost Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Loki Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Reaper Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Ember Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "E1",
		Tier = "Neo",
		Vaulted = "22.17.3" 
	},
	["Neo E2"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Zakti Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Equinox Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "E2",
		Tier = "Neo",
		Vaulted = "29.9" 
	},
	["Neo F1"] = {
		Drops = {
			{ Item = "Ember Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Sicarus Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Sicarus Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bo Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Frost Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.11.1",
		Name = "F1",
		Tier = "Neo",
		Vaulted = "22.17.3" 
	},
	["Neo G1"] = {
		Drops = {
			{ Item = "Kogake Prime", Part = "Boot", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "G1",
		Tier = "Neo",
		Vaulted = "25.3" 
	},
	["Neo G2"] = {
		Drops = {
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "G2",
		Tier = "Neo",
		Vaulted = "27.3.6" 
	},
	["Neo G3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "G3",
		Tier = "Neo",
		Vaulted = "27.5.6" 
	},
	["Neo H1"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Head", Rarity = "Common" },
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "H1",
		Tier = "Neo",
		Vaulted = "22.16.4" 
	},
	["Neo H2"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Hydroid Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "H2",
		Tier = "Neo",
		Vaulted = "24.2.2" 
	},
	["Neo I1"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Zhuge Prime", Part = "String", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "I1",
		Tier = "Neo",
		Vaulted = "27.3.6" 
	},
	["Neo I2"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Stradavar Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Ivara Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "I2",
		Tier = "Neo",
		Vaulted = "29.9" 
	},
	["Neo K1"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Valkyr Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "K1",
		Tier = "Neo",
		Vaulted = "23.9" 
	},
	["Neo K2"] = {
		Drops = {
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Kogake Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "23.9",
		Name = "K2",
		Tier = "Neo",
		Vaulted = "24.2.2" 
	},
	["Neo K3"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Rubico Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "K3",
		Tier = "Neo",
		Vaulted = "30.6.1"
	},
	["Neo L1"] = {
		Drops = {
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "L1",
		Tier = "Neo",
		Vaulted = "24.2.2"
	},
	["Neo M1"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Helios Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "M1",
		Tier = "Neo",
		Vaulted = "24.2.2" 
	},
	["Neo M2"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Limbo Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "M2",
		Tier = "Neo",
		Vaulted = "27.3.6"
	},
	["Neo M3"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "M3",
		Tier = "Neo",
		Vaulted = "29.3" 
	},
	["Neo N1"] = {
		Drops = {
			{ Item = "Hikou Prime", Part = "Stars", Rarity = "Common" },
			{ Item = "Vectis Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N1",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3" 
	},
	["Neo N10"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Tipedo Prime", Part = "Ornament", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "N10",
		Tier = "Neo",
		Vaulted = "25.3" 
	},
	["Neo N11"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Oberon Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.1.1",
		Name = "N11",
		Tier = "Neo",
		Vaulted = "27.5.6"
	},
	["Neo N12"] = {
		Drops = {
			{ Item = "Soma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Band", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.5.6",
		Name = "N12",
		Tier = "Neo",
		Vaulted = "29.2" 
	},
	["Neo N13"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Pangolin Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "N13",
		Tier = "Neo",
		Vaulted = "30.3" 
	},
	["Neo N14"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Titania Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "N14",
		Tier = "Neo",
		Vaulted = "30.3" 
	},
	["Neo N15"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Baza Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Nezha Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "N15",
		Tier = "Neo" 
	},
	["Neo N2"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Vasto Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "N2",
		Tier = "Neo",
		Vaulted = "19.0.7" 
	},
	["Neo N3"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "N3",
		Tier = "Neo",
		Vaulted = "19.11.5" 
	},
	["Neo N4"] = {
		Drops = {
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "N4",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo N5"] = {
		Drops = {
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Ash Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Akstiletto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "N5",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo N6"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Trinity Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Hilt", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "N6",
		Tier = "Neo",
		Vaulted = "21.6" 
	},
	["Neo N7"] = {
		Drops = {
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Euphona Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Nekros Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.4",
		Name = "N7",
		Tier = "Neo",
		Vaulted = "21.6" 
	},
	["Neo N8"] = {
		Drops = {
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Sybaris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Akbolto Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nami Skyla Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "N8",
		Tier = "Neo",
		Vaulted = "24.5.8" 
	},
	["Neo N9"] = {
		Drops = {
			{ Item = "Boar Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dakra Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Mag Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Soma Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.0.6",
		Name = "N9",
		Tier = "Neo",
		Vaulted = "24.2.11" 
	},
	["Neo O1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Volt Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Aklex Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Odonata Prime", Part = "Wings Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.15.1",
		IsBaro = true,
		Name = "O1",
		Tier = "Neo" 
	},
	["Neo P1"] = {
		Drops = {
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Stock", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "P1",
		Tier = "Neo",
		Vaulted = "28.2" 
	},
	["Neo P2"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Guandao Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pandero Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "P2",
		Tier = "Neo" 
	},
	["Neo R1"] = {
		Drops = {
			{ Item = "Ankyros Prime", Part = "Gauntlet", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hikou Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Boltor Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Nyx Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Rhino Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.1.2",
		Name = "R1",
		Tier = "Neo"
	},
	["Neo R2"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Tiberon Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Rubico Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "R2",
		Tier = "Neo",
		Vaulted = "27.0.4" 
	},
	["Neo R3"] = {
		Drops = {
			{ Item = "Baza Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Limbo Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Grip", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "R3",
		Tier = "Neo",
		Vaulted = "27.3.6" 
	},
	["Neo R4"] = {
		Drops = {
			{ Item = "Aksomati Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Corinth Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Ninkondi Prime", Part = "Chain", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "27.3.6",
		Name = "R4",
		Tier = "Neo",
		Vaulted = "29.3" 
	},
	["Neo S1"] = {
		Drops = {
			{ Item = "Carrier Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Soma Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S1",
		Tier = "Neo",
		Vaulted = "19.0.7" 
	},
	["Neo S10"] = {
		Drops = {
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.15",
		Name = "S10",
		Tier = "Neo",
		Vaulted = "24.3.3" 
	},
	["Neo S11"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Kronen Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.5.8",
		Name = "S11",
		Tier = "Neo",
		Vaulted = "25.3" 
	},
	["Neo S12"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Wukong Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "S12",
		Tier = "Neo",
		Vaulted = "25.8" 
	},
	["Neo S13"] = {
		Drops = {
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Spira Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.7.3",
		Name = "S13",
		Tier = "Neo",
		Vaulted = "26.0.8" 
	},
	["Neo S14"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Karyst Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ninkondi Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Pangolin Prime", Part = "Blade", Rarity = "Uncommon" },
			{ Item = "Stradavar Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "S14",
		Tier = "Neo",
		Vaulted = "29.9" 
	},
	["Neo S2"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Lower Limb", Rarity = "Common" },
			{ Item = "Nova Prime", Part = "Systems Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Paris Prime", Part = "Upper Limb", Rarity = "Uncommon" },
			{ Item = "Saryn Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S2",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3" 
	},
	["Neo S3"] = {
		Drops = {
			{ Item = "Soma Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vasto Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "S3",
		Tier = "Neo",
		Vaulted = "19.0.7" 
	},
	["Neo S5"] = {
		Drops = {
			{ Item = "Latron Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Ember Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Reaper Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Glaive Prime", Part = "Disc", Rarity = "Uncommon" },
			{ Item = "Frost Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Sicarus Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "19.3",
		Name = "S5",
		Tier = "Neo",
		Vaulted = "24.5.6" 
	},
	["Neo S6"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Trinity Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Kavasa Prime Kubrow Collar", Part = "Buckle", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Guard", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "S6",
		Tier = "Neo",
		Vaulted = "21.6" 
	},
	["Neo S7"] = {
		Drops = {
			{ Item = "Banshee Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Ballistica Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Sybaris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Guard", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "S7",
		Tier = "Neo",
		Vaulted = "24.2.2" 
	},
	["Neo S8"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Hydroid Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nikana Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Spira Prime", Part = "Pouch", Rarity = "Rare" } 
		},
		Introduced = "21.6",
		Name = "S8",
		Tier = "Neo",
		Vaulted = "22.7" 
	},
	["Neo S9"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mirage Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Destreza Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Silva & Aegis Prime", Part = "Guard", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "S9",
		Tier = "Neo",
		Vaulted = "24.5.8" 
	},
	["Neo T1"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Tigris Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "19.11.5",
		Name = "T1",
		Tier = "Neo",
		Vaulted = "21.6" 
	},
	["Neo T2"] = {
		Drops = {
			{ Item = "Akbronco Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fang Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Dethcube Prime", Part = "Carapace", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tekko Prime", Part = "Blade", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "T2",
		Tier = "Neo",
		Vaulted = "30.3" 
	},
	["Neo T3"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Redeemer Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Atlas Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Inaros Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "28.2",
		Name = "T3",
		Tier = "Neo",
		Vaulted = "29.3" 
	},
	["Neo T4"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Ivara Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Guandao Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Astilla Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Tenora Prime", Part = "Receiver", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "T4",
		Tier = "Neo" 
	},
	["Neo V1"] = {
		Drops = {
			{ Item = "Nyx Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Dual Kamas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Nova Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "Specters of the Rail",
		Name = "V1",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3" 
	},
	["Neo V10"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Guandao Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Inaros Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Volnus Prime", Part = "Handle", Rarity = "Rare" } 
		},
		Introduced = "30.3",
		Name = "V10",
		Tier = "Neo" 
	},
	["Neo V2"] = {
		Drops = {
			{ Item = "Fang Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "V2",
		Tier = "Neo",
		Vaulted = "22.16.4" 
	},
	["Neo V3"] = {
		Drops = {
			{ Item = "Galatine Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Carrier Prime", Part = "Systems", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "The Silver Grove 3",
		Name = "V3",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo V4"] = {
		Drops = {
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Tigris Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Saryn Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Ash Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Venka Prime", Part = "Gauntlet", Rarity = "Rare" } 
		},
		Introduced = "19.0.7",
		Name = "V4",
		Tier = "Neo",
		Vaulted = "20.6.2" 
	},
	["Neo V5"] = {
		Drops = {
			{ Item = "Helios Prime", Part = "Carapace", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Silva & Aegis Prime", Part = "Hilt", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Burston Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "20.6.2",
		Name = "V5",
		Tier = "Neo",
		Vaulted = "22.16.4" 
	},
	["Neo V6"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Grip", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Fragor Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Mirage Prime", Part = "Systems Blueprint", Rarity = "Uncommon" },
			{ Item = "Vauban Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.7",
		Name = "V6",
		Tier = "Neo",
		Vaulted = "22.16.4" 
	},
	["Neo V7"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Pyrana Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Banshee Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "23.0.3",
		Name = "V7",
		Tier = "Neo",
		Vaulted = "23.9" 
	},
	["Neo V8"] = {
		Drops = {
			{ Item = "Loki Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Odonata Prime", Part = "Harness Blueprint", Rarity = "Common" },
			{ Item = "Wyrm Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Bo Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Volt Prime", Part = "Neuroptics Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.8.2",
		Name = "V8",
		Tier = "Neo",
		Vaulted = "25.3" 
	},
	["Neo V9"] = {
		Drops = {
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Nyx Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Venka Prime", Part = "Blades", Rarity = "Common" },
			{ Item = "Cernos Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Valkyr Prime", Part = "Chassis Blueprint", Rarity = "Rare" } 
		},
		Introduced = "29.10",
		Name = "V9",
		Tier = "Neo" 
	},
	["Neo Z1"] = {
		Drops = {
			{ Item = "Orthos Prime", Part = "Handle", Rarity = "Common" },
			{ Item = "Nekros Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Galatine Prime", Part = "Handle", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "22.16.4",
		Name = "Z1",
		Tier = "Neo",
		Vaulted = "23.0.3" 
	},
	["Neo Z2"] = {
		Drops = {
			{ Item = "Akbolto Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Pyrana Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "24.2.2",
		Name = "Z2",
		Tier = "Neo",
		Vaulted = "25.8" 
	},
	["Neo Z3"] = {
		Drops = {
			{ Item = "Bronco Prime", Part = "Receiver", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Zephyr Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Akjagara Prime", Part = "Receiver", Rarity = "Uncommon" },
			{ Item = "Mesa Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "25.3",
		Name = "Z3",
		Tier = "Neo",
		Vaulted = "27.0.4" 
	},
	["Neo Z4"] = {
		Drops = {
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Redeemer Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Blueprint", Rarity = "Rare" } 
		},
		Introduced = "25.8",
		Name = "Z4",
		Tier = "Neo",
		Vaulted = "27.0.4" 
	},
	["Neo Z5"] = {
		Drops = {
			{ Item = "Akjagara Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Burston Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Lex Prime", Part = "Barrel", Rarity = "Common" },
			{ Item = "Aksomati Prime", Part = "Barrel", Rarity = "Uncommon" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "27.0.4",
		Name = "Z5",
		Tier = "Neo",
		Vaulted = "29.3" 
	},
	["Neo Z6"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Guandao Prime", Part = "Blade", Rarity = "Common" },
			{ Item = "Paris Prime", Part = "String", Rarity = "Common" },
			{ Item = "Tipedo Prime", Part = "Ornament", Rarity = "Uncommon" },
			{ Item = "Titania Prime", Part = "Neuroptics Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.3",
		Name = "Z6",
		Tier = "Neo",
		Vaulted = "29.9" 
	},
	["Neo Z7"] = {
		Drops = {
			{ Item = "Atlas Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Wukong Prime", Part = "Neuroptics Blueprint", Rarity = "Common" },
			{ Item = "Akbronco Prime", Part = "Link", Rarity = "Uncommon" },
			{ Item = "Octavia Prime", Part = "Chassis Blueprint", Rarity = "Uncommon" },
			{ Item = "Zhuge Prime", Part = "Barrel", Rarity = "Rare" } 
		},
		Introduced = "29.9",
		Name = "Z7",
		Tier = "Neo",
		Vaulted = "30.3" 
	},
	["Neo Z8"] = {
		Drops = {
			{ Item = "Braton Prime", Part = "Stock", Rarity = "Common" },
			{ Item = "Chroma Prime", Part = "Chassis Blueprint", Rarity = "Common" },
			{ Item = "Kronen Prime", Part = "Blueprint", Rarity = "Common" },
			{ Item = "Forma", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Gram Prime", Part = "Blueprint", Rarity = "Uncommon" },
			{ Item = "Zephyr Prime", Part = "Systems Blueprint", Rarity = "Rare" } 
		},
		Introduced = "30.0.8",
		Name = "Z8",
		Tier = "Neo",
		Vaulted = "30.6.1"
	} 
}

--- Returns a table with an item part's drop rarity in all relics that it is dropped in.
--	@function		getItemRarities
--	@param			{table} primeData Table with item and part names mapped to their relics drops
--									  to add DucatValue key to
--	@param			{string} itemName Prime item name
--	@param			{string} partName Part name
--	@return			{table} A table that lists an item part's rarities (e.g. { 'Rare' } or { 'Common', 'Uncommon' })
local function getItemRarities(primeData, itemName, partName)
	local rarityDict = {}

	for relicName, rarity in pairs(primeData[itemName]['Parts'][partName]['Drops']) do
		rarityDict[rarity] = true
	end
	
	local rarityArr = {}
	-- Turning a dictionary { ["Common"] = true, ["Common"] = true, ["Uncommon"] = true } to an array { "Common", "Uncommon" }
	for rarity in pairs(rarityDict) do table.insert(rarityArr, rarity) end
	assert(#rarityArr ~= 0, 'getItemRarities(itemName, partName): no drop rarities found for "'..itemName..'" and part "'..partName..'"')
	return rarityArr
end

--- Gets the ducat value of a Prime part or blueprint.
--  @function	   getDucatValue
--	@param			{table} primeData Table with item and part names mapped to their relics drops
--							to add DucatValue key to
--  @param		  {string} itemName Prime item name
--  @param		  {string} partName Part name
--  @return		 {number} The ducat value of that Prime part/blueprint
local function getDucatValue(primeData, itemName, partName)
	local rarities = getItemRarities(primeData, itemName, partName)
	
	-- Rare parts are worth 100 ducats
	-- Uncommon parts are worth 45 ducats
	-- Common parts are worth 15 ducats
	-- If an item part is a common and rare drop in different relics, it is worth 65 ducats
	-- If an item part is a common and uncommon drop in different relics, it is worth 25 ducats
	
	if DUCAT_EXCEPTIONS[itemName] ~= nil and DUCAT_EXCEPTIONS[itemName][partName] ~= nil then
		return DUCAT_EXCEPTIONS[itemName][partName]
	end
	
	return rarities[2] and ( Table.contains(rarities, 'Common') and 25 or Table.contains(rarities, 'Rare') and 65 or rarities[3] and 25 )
		or ({ Common = 15, Uncommon = 45, Rare = 100 })[rarities[1]]
end

--- Adding "DucatValue" key; ducat price of a prime part is based on their rarity
--	of their drops in relics
--  @function	   addDucatValueKey
--  @param		  {table} primeData Table with item and part names mapped to their relics drops
--							to add DucatValue key to
local function addDucatValueKey(primeData)
	for itemName, itemTable in pairs(primeData) do
		for partName, relicTable in pairs(itemTable['Parts']) do
			primeData[itemName]['Parts'][partName]['DucatValue'] = getDucatValue(primeData, itemName, partName)
		end
	end
end

--- Adding "Vaulted" key; an item is vaulted if all its parts (including Blueprint) 
--	are vaulted, meaning that all the relics that it is dropped from are vaulted.
--  @function	   addVaultedKey
--  @param		  {table} primeData Table with item and part names mapped to their relics drops
--							to add Vaulted key to
local function addVaultedKey(primeData)
	for itemName, itemTable in pairs(primeData) do
		-- First assume item is vaulted until we can find a relic that is not vaulted
		-- to disprove this assumption
		local isVaulted = true
		for partName, relicTable in pairs(itemTable['Parts']) do
			for relicName, _ in pairs(relicTable['Drops']) do
				-- If we find at least one relic that is not vaulted,
				-- then that means that item part, thus the whole item, is not vaulted
				if (RelicData[relicName]['Vaulted'] == nil) then
					isVaulted = false
					break
				end
			end
			-- Some optimization once we already find an unvaulted relic
			if (not isVaulted) then
				break
			end
		end
		primeData[itemName]['IsVaulted'] = isVaulted
	end
end

PrimeData = (function() 
	local primeData = {}
	
	-- Looping through all relics and their drops
	for relicName, relicEntry in pairs(RelicData) do
		for i, drop in pairs(relicEntry['Drops']) do
			local itemName = drop['Item']
			local partName = drop['Part']
			-- Initiating an item entry
			if (primeData[itemName] == nil) then
				primeData[itemName] = {}
				primeData[itemName]['Parts'] = {}
			end
			-- Adding a part table to item entry
			if (primeData[itemName]['Parts'][partName] == nil) then
				primeData[itemName]['Parts'][partName] = {}
				primeData[itemName]['Parts'][partName]['Drops'] = {}
			end
			-- Insert the name of relic that an item part is dropped in
			primeData[itemName]['Parts'][partName]['Drops'][relicName] = drop['Rarity']
		end
	end
	
	addVaultedKey(primeData)
	addDucatValueKey(primeData)
	
	return primeData
end)()

return { RelicData = RelicData, PrimeData = PrimeData }
