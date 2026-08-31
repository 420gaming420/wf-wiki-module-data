local UserData = require('Module:Cosmetics/userdata')

-- general cosmetics
local AnimationSetData = require('Module:Cosmetics/data/animationset')
local ArmorData = require('Module:Cosmetics/data/armor')
local AuxiliaryData = require('Module:Cosmetics/data/auxiliary')
local EmblemData = require('Module:Cosmetics/data/emblem')
local EphemeraData = require('Module:Cosmetics/data/ephemera')
local SignaData = require('Module:Cosmetics/data/signa')
local SyandanaData = require('Module:Cosmetics/data/syandana')
local TextureData = require('Module:Cosmetics/data/texture') -- voidshell
local WarframeHelmetData = require('Module:Cosmetics/data/warframehelmet')
local WarframeSkinData = require('Module:Cosmetics/data/warframeskin')

local TennoGenData = require('Module:TennoGen/data')
local SigilData = require('Module:Sigils/data')

-- weapon cosmetics
local HolsterData = require('Module:Cosmetics/data/holster')
local SugatraData = require('Module:Cosmetics/data/sugatra')
local ParazonSkinData = require('Module:Cosmetics/data/parazonskin')
local WeaponSkinData = require('Module:Cosmetics/data/weaponskin')

-- companion cosmetics
local EmotionModuleData = require('Module:Cosmetics/data/emotionmodule') -- moa
local GeneMaskingKitData = require('Module:Cosmetics/data/genemaskingkit')
local KubrowArmorData = require('Module:Cosmetics/data/kubrowarmor')
local KubrowCollarData = require('Module:Cosmetics/data/kubrowcollar')
local KavatArmorData = require('Module:Cosmetics/data/kavatarmor')
local MoaSkinData = require('Module:Cosmetics/data/moaskin')
local PatternData = require('Module:Cosmetics/data/pattern')
local SentinelArmorData = require('Module:Cosmetics/data/sentinelarmor') -- mask, wing, tail
local SentinelSkinData = require('Module:Cosmetics/data/sentinelskin')

-- operator/drifter customization and cosmetics
local FaceData = require('Module:Cosmetics/data/face') -- face, head, hair, beard
local FacialAccessoryData = require('Module:Cosmetics/data/facialaccessory')
local TransferenceSuitData = require('Module:Cosmetics/data/transferencesuit')
local VisageInkData = require('Module:Cosmetics/data/visageink')

-- landing craft cosmetics
local LandingCraftLiveryData = require('Module:Cosmetics/data/landingcraftlivery')
local SumdaliData = require('Module:Cosmetics/data/sumdali')

-- vehicle cosmetics
local ArchwingSkinData = require('Module:Cosmetics/data/archwingskin')
local KDriveSkinData = require('Module:Cosmetics/data/kdriveskin')
local ScrawlData = require('Module:Cosmetics/data/scrawl')
local NecramechSkinData = require('Module:Cosmetics/data/necramechskin')
local RailjackSkinData = require('Module:Cosmetics/data/railjackskin')
local KaitheData = require('Module:Cosmetics/data/kaithe')
local AtomicycleLiveryData = require('Module:Cosmetics/data/atomicyclelivery')

-- lotus customization
local LotusSkinData = require('Module:Cosmetics/data/lotusskin')

-- kahl cosmetics
local KahlArmorData = require('Module:Cosmetics/data/kahlarmor')

-- uncategorized cosmetics 
local UncategorizedData = require('Module:Cosmetics/data/uncategorized')

-- Compile all data from horizontal partition into one table
local ExternalPartitions = {
	AnimationSetData,
	ArmorData,
	AuxiliaryData,
    EmblemData,
    EphemeraData,
    SignaData,
    SyandanaData,
	TextureData,
	WarframeHelmetData,
	WarframeSkinData,
	
	TennoGenData,
	SigilData,

	HolsterData,
	SugatraData,
	ParazonSkinData,
	WeaponSkinData,
    
	EmotionModuleData,
    GeneMaskingKitData,
	KubrowArmorData,
	KubrowCollarData,
	KavatArmorData,
	MoaSkinData,
	PatternData,
	SentinelArmorData,
	SentinelSkinData,

    FaceData,
	FacialAccessoryData,
	TransferenceSuitData,
    VisageInkData,

	LandingCraftLiveryData,
	SumdaliData,

	ArchwingSkinData,
	KDriveSkinData,
	ScrawlData,
	NecramechSkinData,
	RailjackSkinData,
	KaitheData,
	AtomicycleLiveryData,
	
	LotusSkinData,
	KahlArmorData,
	UncategorizedData
}

local CosmeticsData = {
	Users = UserData,
	Cosmetics = {}
}

for _, data in ipairs(ExternalPartitions) do
    for key, value in pairs(data) do
        CosmeticsData.Cosmetics[key] = value
    end
end

-- Duplicate skin entries
CosmeticsData["Acceltra Prime"] = CosmeticsData["Acceltra"]
CosmeticsData["Afuris Prime"] = CosmeticsData["Afuris"]
CosmeticsData["Akbolto Prime"] = CosmeticsData["Akbolto"]; CosmeticsData["Telos Akbolto"] = CosmeticsData["Akbolto"]
CosmeticsData["Akjagara Prime"] = CosmeticsData["Akjagara"]
CosmeticsData["Aklex Prime"] = CosmeticsData["Aklex"]
CosmeticsData["Akmagnus Prime"] = CosmeticsData["Akmagnus"]
CosmeticsData["Akstiletto Prime"] = CosmeticsData["Akstiletto"]
CosmeticsData["Akvasto Prime"] = CosmeticsData["Akvasto"]
CosmeticsData["Ash Prime"] = CosmeticsData["Ash"]
CosmeticsData["Prisma Angstrum"] = CosmeticsData["Angstrum"]
CosmeticsData["Ankyros Prime"] = CosmeticsData["Ankyros"]
CosmeticsData["Tenet Arca Plasmor"] = CosmeticsData["Arca Plasmor"]
CosmeticsData["Artemis Bow Prime"] = CosmeticsData["Artemis Bow"]
CosmeticsData["Atlas Prime"] = CosmeticsData["Atlas"]
CosmeticsData["Balefire Charger Prime"] = CosmeticsData["Balefire Charger"]
CosmeticsData["Ballistica Prime"] = CosmeticsData["Ballistica"]; CosmeticsData["Rakta Ballistica"] = CosmeticsData["Ballistica"]
CosmeticsData["Banshee Prime"] = CosmeticsData["Banshee"]
CosmeticsData["Baruuk Prime"] = CosmeticsData["Baruuk"]
CosmeticsData["Baza Prime"] = CosmeticsData["Baza"]
CosmeticsData["Bo Prime"] = CosmeticsData["Bo"]; CosmeticsData["Mk1-Bo"] = CosmeticsData["Bo"]
CosmeticsData["Boar Prime"] = CosmeticsData["Boar"]
CosmeticsData["Boltor Prime"] = CosmeticsData["Boltor"]; CosmeticsData["Telos Boltor"] = CosmeticsData["Boltor"]
CosmeticsData["Brakk Prime"] = CosmeticsData["Brakk"]
CosmeticsData["Braton Prime"] = CosmeticsData["Braton"]; CosmeticsData["Mk1-Braton"] = CosmeticsData["Braton"]; CosmeticsData["Braton Vandal"] = CosmeticsData["Braton"]
CosmeticsData["Burston Prime"] = CosmeticsData["Burston"]
CosmeticsData["Caliban Prime"] = CosmeticsData["Caliban"]
CosmeticsData["Carrier Prime"] = CosmeticsData["Carrier"]
CosmeticsData["Cedo Prime"] = CosmeticsData["Cedo"]
CosmeticsData["Cernos Prime"] = CosmeticsData["Cernos"]; CosmeticsData["Rakta Cernos"] = CosmeticsData["Cernos"]
CosmeticsData["Chroma Prime"] = CosmeticsData["Chroma"]
CosmeticsData["Corinth Prime"] = CosmeticsData["Corinth"]
CosmeticsData["Corvas Prime"] = CosmeticsData["Corvas"]
CosmeticsData["Tenet Cycron"] = CosmeticsData["Cycron"]
CosmeticsData["Rakta Dark Dagger"] = CosmeticsData["Dark Dagger"]
CosmeticsData["Dera Vandal"] = CosmeticsData["Dera"]
CosmeticsData["Dethcube Prime"] = CosmeticsData["Dethcube"]
CosmeticsData["Tenet Detron"] = CosmeticsData["Detron"]; CosmeticsData["Mara Detron"] = CosmeticsData["Detron"]
CosmeticsData["Dex Pixia Prime"] = CosmeticsData["Dex Pixia"]
CosmeticsData["Diwata Prime"] = CosmeticsData["Diwata"]
CosmeticsData["Kuva Drakgoon"] = CosmeticsData["Drakgoon"]
CosmeticsData["Secura Dual Cestra"] = CosmeticsData["Dual Cestra"]
CosmeticsData["Prisma Dual Cleavers"] = CosmeticsData["Dual Cleavers"]
CosmeticsData["Dual Kamas Prime"] = CosmeticsData["Dual Kamas"]
CosmeticsData["Dual Keres Prime"] = CosmeticsData["Dual Keres"]
CosmeticsData["Dual Zoren Prime"] = CosmeticsData["Dual Zoren"]
CosmeticsData["Ember Prime"] = CosmeticsData["Ember"]
CosmeticsData["Epitaph Prime"] = CosmeticsData["Epitaph"]
CosmeticsData["Equinox Prime"] = CosmeticsData["Equinox"]
CosmeticsData["Excalibur Prime"] = CosmeticsData["Excalibur"]; CosmeticsData["Excalibur Umbra"] = CosmeticsData["Excalibur"]
CosmeticsData["Tenet Flux Rifle"] = CosmeticsData["Flux Rifle"]
CosmeticsData["Fragor Prime"] = CosmeticsData["Fragor"]
CosmeticsData["Frost Prime"] = CosmeticsData["Frost"]
CosmeticsData["Fulmin Prime"] = CosmeticsData["Fulmin"]
CosmeticsData["Furax Prime"] = CosmeticsData["Furax"]; CosmeticsData["Mk1-Furax"] = CosmeticsData["Furax"]; CosmeticsData["Furax Wraith"] = CosmeticsData["Furax"]
CosmeticsData["Galatine Prime"] = CosmeticsData["Galatine"]
CosmeticsData["Synoid Gammacor"] = CosmeticsData["Gammacor"]
CosmeticsData["Gara Prime"] = CosmeticsData["Gara"]
CosmeticsData["Garuda Prime"] = CosmeticsData["Garuda"]
CosmeticsData["Gauss Prime"] = CosmeticsData["Gauss"]
CosmeticsData["Glaive Prime"] = CosmeticsData["Glaive"]
CosmeticsData["Glaxion Vandal"] = CosmeticsData["Glaxion"]; CosmeticsData["Tenet Glaxion"] = CosmeticsData["Glaxion"]
CosmeticsData["Prisma Gorgon"] = CosmeticsData["Gorgon"]; CosmeticsData["Gorgon Wraith"] = CosmeticsData["Gorgon"]
CosmeticsData["Prisma Grakata"] = CosmeticsData["Grakata"]
CosmeticsData["Gram Prime"] = CosmeticsData["Gram"]
CosmeticsData["Kuva Grattler"] = CosmeticsData["Grattler"]
CosmeticsData["Grendel Prime"] = CosmeticsData["Grendel"]
CosmeticsData["Prisma Grinlok"] = CosmeticsData["Grinlok"]
CosmeticsData["Noctua"] = CosmeticsData["Grimoire"]
CosmeticsData["Guandao Prime"] = CosmeticsData["Guandao"]
CosmeticsData["Gunsen Prime"] = CosmeticsData["Gunsen"]
CosmeticsData["Harrow Prime"] = CosmeticsData["Harrow"]
CosmeticsData["Kuva Hek"] = CosmeticsData["Hek"]
CosmeticsData["Synoid Heliocor"] = CosmeticsData["Heliocor"]
CosmeticsData["Helios Prime"] = CosmeticsData["Helios"]
CosmeticsData["Hildryn Prime"] = CosmeticsData["Hildryn"]
CosmeticsData["Hydroid Prime"] = CosmeticsData["Hydroid"]
CosmeticsData["Ignis Wraith"] = CosmeticsData["Ignis"]
CosmeticsData["Imperator Vandal"] = CosmeticsData["Imperator"]
CosmeticsData["Inaros Prime"] = CosmeticsData["Inaros"]
CosmeticsData["Ivara Prime"] = CosmeticsData["Ivara"]
CosmeticsData["Karak Wraith"] = CosmeticsData["Karak"]; CosmeticsData["Kuva Karak"] = CosmeticsData["Karak"]
CosmeticsData["Khora Prime"] = CosmeticsData["Khora"]
CosmeticsData["Kuva Kohm"] = CosmeticsData["Kohm"]
CosmeticsData["Kuva Kraken"] = CosmeticsData["Kraken"]
CosmeticsData["Kronen Prime"] = CosmeticsData["Kronen"]
CosmeticsData["Mk1-Kunai"] = CosmeticsData["Kunai"]
CosmeticsData["Ceti Lacera"] = CosmeticsData["Lacera"]
CosmeticsData["Lato Prime"] = CosmeticsData["Lato"]; CosmeticsData["Lato Vandal"] = CosmeticsData["Lato"]
CosmeticsData["Latron Prime"] = CosmeticsData["Latron"]; CosmeticsData["Latron Wraith"] = CosmeticsData["Latron"]
CosmeticsData["Lavos Prime"] = CosmeticsData["Lavos"]
CosmeticsData["Secura Lecta"] = CosmeticsData["Lecta"]
CosmeticsData["Prisma Lenz"] = CosmeticsData["Lenz"]
CosmeticsData["Lex Prime"] = CosmeticsData["Lex"]
CosmeticsData["Limbo Prime"] = CosmeticsData["Limbo"]
CosmeticsData["Loki Prime"] = CosmeticsData["Loki"]
CosmeticsData["Prisma Machete"] = CosmeticsData["Machete"]; CosmeticsData["Machete Wraith"] = CosmeticsData["Machete"]
CosmeticsData["Mag Prime"] = CosmeticsData["Mag"]
CosmeticsData["Magnus Prime"] = CosmeticsData["Magnus"]
CosmeticsData["Vaykor Marelok"] = CosmeticsData["Marelok"]
CosmeticsData["Mesa Prime"] = CosmeticsData["Mesa"]
CosmeticsData["Mirage Prime"] = CosmeticsData["Mirage"]
CosmeticsData["Nagantaka Prime"] = CosmeticsData["Nagantaka"]
CosmeticsData["Nautilus Prime"] = CosmeticsData["Nautilus"]
CosmeticsData["Nekros Prime"] = CosmeticsData["Nekros"]
CosmeticsData["Nezha Prime"] = CosmeticsData["Nezha"]
CosmeticsData["Nidus Prime"] = CosmeticsData["Nidus"]
CosmeticsData["Nikana Prime"] = CosmeticsData["Nikana"]; CosmeticsData["Dex Nikana"] = CosmeticsData["Nikana"]
CosmeticsData["Nova Prime"] = CosmeticsData["Nova"]
CosmeticsData["Kuva Nukor"] = CosmeticsData["Nukor"]
CosmeticsData["Nyx Prime"] = CosmeticsData["Nyx"]
CosmeticsData["Oberon Prime"] = CosmeticsData["Oberon"]
CosmeticsData["Prisma Obex"] = CosmeticsData["Obex"]
CosmeticsData["Octavia Prime"] = CosmeticsData["Octavia"]
CosmeticsData["Odonata Prime"] = CosmeticsData["Odonata"]
CosmeticsData["Kuva Ogris"] = CosmeticsData["Ogris"]
CosmeticsData["Okina Prime"] = CosmeticsData["Okina"]
CosmeticsData["Opticor Vandal"] = CosmeticsData["Opticor"]
CosmeticsData["Orthos Prime"] = CosmeticsData["Orthos"]
CosmeticsData["Pandero Prime"] = CosmeticsData["Pandero"]
CosmeticsData["Panthera Prime"] = CosmeticsData["Panthera"]
CosmeticsData["Paris Prime"] = CosmeticsData["Paris"]; CosmeticsData["Mk1-Paris"] = CosmeticsData["Paris"]
CosmeticsData["Perigale Prime"] = CosmeticsData["Perigale"];
CosmeticsData["Secura Penta"] = CosmeticsData["Penta"]; CosmeticsData["Carmine Penta"] = CosmeticsData["Penta"]
CosmeticsData["Tenet Plinx"] = CosmeticsData["Plinx"]
CosmeticsData["Protea Prime"] = CosmeticsData["Protea"]
CosmeticsData["Prova Vandal"] = CosmeticsData["Prova"]
CosmeticsData["Pyrana Prime"] = CosmeticsData["Pyrana"]
CosmeticsData["Quanta Vandal"] = CosmeticsData["Quanta"]
CosmeticsData["Kuva Quartakk"] = CosmeticsData["Quartakk"]
CosmeticsData["Redeemer Prime"] = CosmeticsData["Redeemer"]
CosmeticsData["Regulators Prime"] = CosmeticsData["Regulators"]
CosmeticsData["Revenant Prime"] = CosmeticsData["Revenant"]
CosmeticsData["Rhino Prime"] = CosmeticsData["Rhino"]
CosmeticsData["Rubico Prime"] = CosmeticsData["Rubico"]
CosmeticsData["Sarofang Prime"] = CosmeticsData["Sarofang"];
CosmeticsData["Saryn Prime"] = CosmeticsData["Saryn"]
CosmeticsData["Scindo Prime"] = CosmeticsData["Scindo"]
CosmeticsData["Sevagoth Prime"] = CosmeticsData["Sevagoth"]
CosmeticsData["Shade Prime"] = CosmeticsData["Shade"]; CosmeticsData["Prisma Shade"] = CosmeticsData["Shade"]
CosmeticsData["Shadow Claws Prime"] = CosmeticsData["Shadow Claws"]
CosmeticsData["Silva & Aegis Prime"] = CosmeticsData["Silva & Aegis"]
CosmeticsData["Synoid Simulor"] = CosmeticsData["Simulor"]
CosmeticsData["Skana Prime"] = CosmeticsData["Skana"]; CosmeticsData["Prisma Skana"] = CosmeticsData["Skana"]
CosmeticsData["Snipetron Vandal"] = CosmeticsData["Snipetron"]
CosmeticsData["Kuva Sobek"] = CosmeticsData["Sobek"]
CosmeticsData["Soma Prime"] = CosmeticsData["Soma"]
CosmeticsData["Spectra Vandal"] = CosmeticsData["Spectra"]
CosmeticsData["Spira Prime"] = CosmeticsData["Spira"]
CosmeticsData["Stradavar Prime"] = CosmeticsData["Stradavar"]
CosmeticsData["Strun Prime"] = CosmeticsData["Strun"]; CosmeticsData["Mk1-Strun"] = CosmeticsData["Strun"]; CosmeticsData["Strun Wraith"] = CosmeticsData["Strun"]
CosmeticsData["Supra Vandal"] = CosmeticsData["Supra"]
CosmeticsData["Sybaris Prime"] = CosmeticsData["Sybaris"]; CosmeticsData["Dex Sybaris"] = CosmeticsData["Sybaris"]
CosmeticsData["Tatsu Prime"] = CosmeticsData["Tatsu"]
CosmeticsData["Prisma Tetra"] = CosmeticsData["Tetra"]; CosmeticsData["Tenet Tetra"] = CosmeticsData["Tetra"]
CosmeticsData["Tiberon Prime"] = CosmeticsData["Tiberon"]
CosmeticsData["Tigris Prime"] = CosmeticsData["Tigris"]; CosmeticsData["Sancti Tigris"] = CosmeticsData["Tigris"]
CosmeticsData["Tipedo Prime"] = CosmeticsData["Tipedo"]
CosmeticsData["Titania Prime"] = CosmeticsData["Titania"]
CosmeticsData["Kuva Tonkor"] = CosmeticsData["Tonkor"]
CosmeticsData["Trinity Prime"] = CosmeticsData["Trinity"]
CosmeticsData["Prisma Twin Gremlins"] = CosmeticsData["Twin Gremlins"]
CosmeticsData["Twin Vipers Wraith"] = CosmeticsData["Twin Vipers"]
CosmeticsData["Valkyr Prime"] = CosmeticsData["Valkyr"]
CosmeticsData["Vasto Prime"] = CosmeticsData["Vasto"]
CosmeticsData["Vauban Prime"] = CosmeticsData["Vauban"]
CosmeticsData["Vectis Prime"] = CosmeticsData["Vectis"]
CosmeticsData["Venari Prime"] = CosmeticsData["Venari"]
CosmeticsData["Prisma Veritux"] = CosmeticsData["Veritux"]
CosmeticsData["Viper Wraith"] = CosmeticsData["Viper"]
CosmeticsData["Volt Prime"] = CosmeticsData["Volt"]
CosmeticsData["Voruna Prime"] = CosmeticsData["Voruna"]
CosmeticsData["Vulkar Wraith"] = CosmeticsData["Vulkar"]
CosmeticsData["Wisp Prime"] = CosmeticsData["Wisp"]
CosmeticsData["Wukong Prime"] = CosmeticsData["Wukong"]
CosmeticsData["Wyrm Prime"] = CosmeticsData["Wyrm"]
CosmeticsData["Xaku Prime"] = CosmeticsData["Xaku"]
CosmeticsData["Kuva Zarr"] = CosmeticsData["Zarr"]
CosmeticsData["Zephyr Prime"] = CosmeticsData["Zephyr"]

-- Filling in the User of Cosmetic based on Entry (aka creating reverse indexes based on Cosmetic type)
-- e.g. creating CosmeticData["Skin"]["Users"] = [ { "Ash", "Warframe" }, { "Braton", "Weapons" } ]
for user, entry in pairs(CosmeticsData.Users) do
	for _, part in pairs(entry.Equipments) do
		for _, name in ipairs(part) do
			if CosmeticsData.Cosmetics[name] == nil then
				CosmeticsData.Cosmetics[name] = {}
			end
			if CosmeticsData.Cosmetics[name]["Users"] == nil then
				CosmeticsData.Cosmetics[name]["Users"] = {}
			end
			table.insert(CosmeticsData.Cosmetics[name]["Users"], {user, entry.Type}) -- Type used for Tooltips. e.g. { "Ash", "Warframe" }
		end
	end
end

return CosmeticsData
