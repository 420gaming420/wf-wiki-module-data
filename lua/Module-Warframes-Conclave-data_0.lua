local deepCopy = require('Module:Table').deepCopy
local WarframeData = mw.loadData('Module:Warframes/data')

local SHARED_KEYS = { 'Abilities', 'AuraPolarity', 'ExilusPolarity', 'FullImages', 'Image', 'InternalName', 'Introduced', 'Mastery', 'Name', 'SellPrice', 'Sex', 'StancePolarity', 'Type' }

---	Copying key-value pairs to target table from reference table.
--	Keys that are already in target table will not be overrided with data from reference table.
--	@function		copyKeyValues
--	@param			{table} targetTable Table to be modified
--	@param			{table} refTable Reference table
--	@param			{table} keyTable Table of key names to copy within each table entry
--	@return			{table} Modified target table
local function copyKeyValues(targetTable, refTable, keyTable)
	for k, v in pairs(targetTable) do
		local targetTableEntry = targetTable[k]
		local refTableEntry = refTable[k]
		for _, key in ipairs(keyTable) do
			if (targetTable[key] == nil) then
				if (type(refTableEntry[key]) ~= 'table') then
					targetTableEntry[key] = refTableEntry[key]
				else
					targetTableEntry[key] = deepCopy(refTableEntry[key])
				end
			end
		end
	end
	return targetTable
end

local ConclaveWarframeData = {
	Warframes = {
		Ash = {
			Armor = 70,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Ash",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1.15 
		},
		["Ash Prime"] = {
			Armor = 95,
			Energy = 100,
			Health = 120,
			Link = "Conclave:Ash Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Madurai", "Madurai" },
			Shield = 155,
			Sprint = 1.2 
		},
		Atlas = {
			Armor = 170,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Atlas",
			Mobility = 0.8,
			Polarities = { "Naramon", "Vazarin", "Madurai" },
			Shield = 145,
			Sprint = 0.9 
		},
		["Atlas Prime"] = {
			Armor = 175,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Atlas Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Vazarin", "Madurai", "Madurai" },
			Shield = 165,
			Sprint = 1 
		},
		Banshee = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Banshee",
			Mobility = 1,
			Polarities = { "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1.1 
		},
		["Banshee Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Banshee Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai", "Naramon" },
			Shield = 145,
			Sprint = 1.15 
		},
		Chroma = {
			Armor = 145,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Chroma",
			Mobility = 0.8,
			Polarities = { "Naramon", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		["Chroma Prime"] = {
			Armor = 165,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Chroma Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Vazarin", "Madurai", "Naramon" },
			Shield = 145,
			Sprint = 1 
		},
		Equinox = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Equinox",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 145,
			Sprint = 1.15 
		},
		["Equinox Prime"] = {
			Armor = 85,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Equinox Prime",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Vazarin", "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1.15 
		},
		Excalibur = {
			Armor = 110,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Excalibur",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		["Excalibur Prime"] = {
			Armor = 130,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Excalibur Prime",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		["Excalibur Umbra"] = {
			Armor = 130,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Excalibur Umbra",
			Mobility = 0.9,
			Polarities = { "Madurai", "U", "U", "U" },
			Shield = 145,
			Sprint = 1 
		},
		Frost = {
			Armor = 130,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Frost",
			Mobility = 0.8,
			Polarities = { "Naramon", "Vazarin" },
			Shield = 165,
			Sprint = 0.95 
		},
		["Frost Prime"] = {
			Armor = 130,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Frost Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Vazarin", "Vazarin" },
			Shield = 175,
			Sprint = 0.95 
		},
		Gara = {
			Armor = 85,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Gara",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1.15 
		},
		["Gara Prime"] = {
			Armor = 100,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Gara Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai", "Naramon" },
			Shield = 145,
			Sprint = 1.15 
		},
		Harrow = {
			Armor = 95,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Harrow",
			Mobility = 0.8,
			Polarities = { "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1 
		},
		Hydroid = {
			Armor = 110,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Hydroid",
			Mobility = 0.8,
			Polarities = { "Madurai", "Naramon" },
			Shield = 155,
			Sprint = 1 
		},
		["Hydroid Prime"] = {
			Armor = 125,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Hydroid Prime",
			Mobility = 0.8,
			Polarities = { "Madurai", "Vazarin", "Naramon", "Naramon" },
			Shield = 175,
			Sprint = 1 
		},
		Inaros = {
			Armor = 110,
			Energy = 100,
			ExilusPolarity = "Naramon",
			Health = 300,
			Link = "Conclave:Inaros",
			Mobility = 0.8,
			Polarities = { "Vazarin", "Vazarin" },
			Shield = 0,
			Sprint = 1 
		},
		Ivara = {
			Armor = 70,
			Energy = 100,
			Health = 100,
			Link = "Conclave:Ivara",
			Mobility = 1,
			Polarities = { "Vazarin", "Naramon" },
			Shield = 145,
			Sprint = 1.15 
		},
		["Ivara Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Ivara Prime",
			Mobility = 1,
			Polarities = { "Madurai", "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1.2 
		},
		Khora = {
			Armor = 125,
			Energy = 100,
			ExilusPolarity = "Naramon",
			Health = 115,
			Link = "Conclave:Khora",
			Mobility = 0.8,
			Polarities = { "Vazarin", "Naramon" },
			Shield = 145,
			Sprint = 1.05 
		},
		["Khora Prime"] = {
			Armor = 140,
			Energy = 100,
			ExilusPolarity = "Naramon",
			Health = 100,
			Link = "Conclave:Khora Prime",
			Mobility = 0.8,
			Polarities = { "Madurai", "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1.05 
		},
		Limbo = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Limbo",
			Mobility = 1,
			Polarities = { "Madurai", "Madurai" },
			Shield = 130,
			Sprint = 1.15 
		},
		["Limbo Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Limbo Prime",
			Mobility = 1,
			Polarities = { "Madurai", "Madurai", "Naramon", "Vazarin" },
			Shield = 145,
			Sprint = 1.15 
		},
		Loki = {
			Armor = 70,
			Energy = 100,
			Health = 100,
			Link = "Conclave:Loki",
			Mobility = 1,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 130,
			Sprint = 1.25 
		},
		["Loki Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 100,
			Link = "Conclave:Loki Prime",
			Mobility = 1,
			Polarities = { "Vazarin", "Vazarin", "Madurai", "Naramon" },
			Shield = 130,
			Sprint = 1.25 
		},
		Mag = {
			Armor = 70,
			Energy = 100,
			Health = 100,
			Link = "Conclave:Mag",
			Mobility = 0.9,
			Polarities = { "Naramon", "Naramon" },
			Shield = 165,
			Sprint = 1 
		},
		["Mag Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Mag Prime",
			Mobility = 0.9,
			Polarities = { "Naramon", "Naramon", "Madurai" },
			Shield = 165,
			Sprint = 1 
		},
		Mesa = {
			Armor = 70,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Mesa",
			Mobility = 1,
			Polarities = { "Naramon", "Naramon" },
			Shield = 130,
			Sprint = 1.1 
		},
		["Mesa Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Mesa Prime",
			Mobility = 0.9,
			Polarities = { "Naramon", "Naramon", "Vazarin", "Madurai" },
			Shield = 130,
			Sprint = 1.1 
		},
		Mirage = {
			Armor = 70,
			Energy = 100,
			Health = 105,
			Link = "Conclave:Mirage",
			Mobility = 1,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 135,
			Sprint = 1.2 
		},
		["Mirage Prime"] = {
			Armor = 95,
			Energy = 100,
			Health = 105,
			Link = "Conclave:Mirage Prime",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Vazarin", "Naramon", "Madurai" },
			Shield = 150,
			Sprint = 1.2 
		},
		Nekros = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nekros",
			Mobility = 1,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 140,
			Sprint = 1.1 
		},
		["Nekros Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nekros Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1.1 
		},
		Nezha = {
			Armor = 100,
			Energy = 100,
			Health = 100,
			Link = "Conclave:Nezha",
			Mobility = 1,
			Polarities = { "Vazarin", "Madurai" },
			Shield = 130,
			Sprint = 1.15 
		},
		["Nezha Prime"] = {
			Armor = 120,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Nezha Prime",
			Mobility = 1,
			Polarities = { "Vazarin", "Madurai", "Naramon" },
			Shield = 115,
			Sprint = 1.2 
		},
		Nidus = {
			Armor = 130,
			Energy = 100,
			Health = 150,
			Link = "Conclave:Nidus",
			Mobility = 1,
			Polarities = { "Madurai", "Vazarin" },
			Shield = 0,
			Sprint = 1 
		},
		Nova = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nova",
			Mobility = 1,
			Polarities = { "Madurai", "Madurai" },
			Shield = 130,
			Sprint = 1.2 
		},
		["Nova Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nova Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1.2 
		},
		Nyx = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nyx",
			Mobility = 1,
			Polarities = { "Madurai", "Naramon" },
			Shield = 145,
			Sprint = 1.1 
		},
		["Nyx Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Nyx Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Naramon", "Vazarin" },
			Shield = 155,
			Sprint = 1.125 
		},
		Oberon = {
			Armor = 95,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Oberon",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		["Oberon Prime"] = {
			Armor = 110,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Oberon Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Naramon", "Madurai", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		Octavia = {
			Armor = 85,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Octavia",
			Mobility = 1,
			Polarities = { "Naramon", "Naramon" },
			Shield = 130,
			Sprint = 1.05 
		},
		["Octavia Prime"] = {
			Armor = 85,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Octavia Prime",
			Mobility = 1,
			Polarities = { "Vazarin", "Naramon", "Naramon" },
			Shield = 145,
			Sprint = 1.05 
		},
		Rhino = {
			Armor = 100,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Rhino",
			Mobility = 0.8,
			Polarities = { "Vazarin", "Vazarin" },
			Shield = 165,
			Sprint = 0.95 
		},
		["Rhino Prime"] = {
			Armor = 125,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Rhino Prime",
			Mobility = 0.8,
			Polarities = { "Vazarin", "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1 
		},
		Saryn = {
			Armor = 110,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Saryn",
			Mobility = 0.9,
			Polarities = { "Naramon", "Vazarin" },
			Shield = 145,
			Sprint = 0.95 
		},
		["Saryn Prime"] = {
			Armor = 130,
			Energy = 100,
			Health = 115,
			Link = "Conclave:Saryn Prime",
			Mobility = 0.9,
			Polarities = { "Naramon", "Vazarin", "Madurai" },
			Shield = 145,
			Sprint = 1 
		},
		Titania = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Titania",
			Mobility = 1,
			Polarities = { "Madurai", "Vazarin" },
			Shield = 145,
			Sprint = 1 
		},
		Trinity = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Trinity",
			Mobility = 1,
			Polarities = { "Vazarin", "Vazarin" },
			Shield = 145,
			Sprint = 1 
		},
		["Trinity Prime"] = {
			Armor = 80,
			Energy = 150,
			Health = 110,
			Link = "Conclave:Trinity Prime",
			Mobility = 0.9,
			Polarities = { "Vazarin", "Vazarin", "Madurai", "Naramon" },
			Shield = 165,
			Sprint = 1.1 
		},
		Valkyr = {
			Armor = 200,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Valkyr",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai" },
			Shield = 115,
			Sprint = 1.1 
		},
		["Valkyr Prime"] = {
			Armor = 220,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Valkyr Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai", "Madurai" },
			Shield = 115,
			Sprint = 1.1 
		},
		Volt = {
			Armor = 70,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Volt",
			Mobility = 0.9,
			Polarities = { "Naramon", "Madurai" },
			Shield = 165,
			Sprint = 1 
		},
		["Volt Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 110,
			Link = "Conclave:Volt Prime",
			Mobility = 0.8,
			Polarities = { "Naramon", "Madurai", "Madurai" },
			Shield = 165,
			Sprint = 1.15 
		},
		Zephyr = {
			Armor = 70,
			Energy = 100,
			Health = 120,
			Link = "Conclave:Zephyr",
			Mobility = 0.9,
			Polarities = { "Madurai", "Naramon" },
			Shield = 165,
			Sprint = 1.15 
		},
		["Zephyr Prime"] = {
			Armor = 80,
			Energy = 100,
			Health = 120,
			Link = "Conclave:Zephyr Prime",
			Mobility = 0.9,
			Polarities = { "Madurai", "Madurai", "Vazarin", "Naramon" },
			Shield = 165,
			Sprint = 1.2 
		} 
	} 
}

ConclaveWarframeData['Warframes'] = copyKeyValues(ConclaveWarframeData['Warframes'], WarframeData['Warframes'], SHARED_KEYS)
return ConclaveWarframeData
