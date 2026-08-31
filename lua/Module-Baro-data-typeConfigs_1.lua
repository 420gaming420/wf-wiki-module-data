local COSMETIC = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic" }
local COSMETIC_COMPANION = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Companion)" }
local COSMETIC_VEHICLE = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Vehicle)" }
local MISC = { GalleryCategory = "Miscellaneous", HistoryCategory = "Misc" }
local MOD = { GalleryCategory = "Mods", HistoryCategory = "Mod" }
local WEAPON = { GalleryCategory = "Weapons", HistoryCategory = "Weapon", TooltipModule = "Weapons" }

return {
	-- Weapons
	["Weapon"] = WEAPON,
	["Weapon (Archwing)"] = WEAPON,

	-- Mods
	["Mod (Archgun)"] = MOD,
	["Mod (Archwing)"] = MOD,
	["Mod (Bow)"] = MOD,
	["Mod (Companion)"] = MOD,
	["Mod (Melee)"] = MOD,
	["Mod (Pistol)"] = MOD,
	["Mod (Rifle)"] = MOD,
	["Mod (Shotgun)"] = MOD,
	["Mod (Sniper)"] = MOD,
	["Mod (Stance)"] = MOD,
	["Mod (Warframe)"] = MOD,
	["Primed Mod (Archgun)"] = MOD,
	["Primed Mod (Archwing)"] = MOD,
	["Primed Mod (Bow)"] = MOD,
	["Primed Mod (Companion)"] = MOD,
	["Primed Mod (Melee)"] = MOD,
	["Primed Mod (Pistol)"] = MOD,
	["Primed Mod (Pistol)"] = MOD,
	["Primed Mod (Rifle)"] = MOD,
	["Primed Mod (Shotgun)"] = MOD,
	["Primed Mod (Sniper)"] = MOD,
	["Primed Mod (Warframe)"] = MOD,

	-- Appearance (Universal)
	["Cosmetic (Armor)"] = COSMETIC,
	["Cosmetic (Emblem)"] = COSMETIC,
	["Cosmetic (Ephemera)"] = COSMETIC,
	["Cosmetic (Sigil)"] = COSMETIC,
	["Cosmetic (Signa)"] = COSMETIC,
	["Cosmetic (Syandana)"] = COSMETIC,

	-- Appearance (Vehicles)
	["Cosmetic (Archwing)"] = COSMETIC_VEHICLE,
	["Cosmetic (Atomicycle)"] = COSMETIC_VEHICLE,
	["Cosmetic (Kaithe)"] = COSMETIC_VEHICLE,
	["Cosmetic (K-Drive)"] = COSMETIC_VEHICLE,
	["Cosmetic (Necramech)"] = COSMETIC_VEHICLE,
	["Cosmetic (Railjack)"] = COSMETIC_VEHICLE,
	["Cosmetic (Landing Craft)"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Cosmetic (Vehicle)" },
	["Cosmetic (Orbiter)"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Cosmetic (Vehicle)" },

	-- Appearance (Companions)
	["Cosmetic (Kavat)"] = COSMETIC_COMPANION,
	["Cosmetic (Kubrow)"] = COSMETIC_COMPANION,
	["Cosmetic (MOA)"] = COSMETIC_COMPANION,
	["Cosmetic (Sentinel)"] = COSMETIC_COMPANION,

	-- Appearance (Specialized)
	["Cosmetic (Operator)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Operator)" },
	["Cosmetic (Warframe Skin)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Warframe)" },
	["Cosmetic (Weapon)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Weapon)" },
	["Cosmetic (Weapon Skin)"] = { GalleryCategory = "Appearance", HistoryCategory = "Cosmetic (Weapon)" },

	-- Miscellaneous
	["Booster"] = MISC,
	["Bundle"] = MISC,
	["Captura Scene"] = MISC,
	["Color Palette"] = MISC,
	["Consumable"] = MISC,
	["Emote"] = MISC,
	["Glyph"] = MISC,
	["Lootbox"] = MISC,
	["Mission Locator"] = MISC,
	["Quest"] = MISC,
	["Somachord"] = MISC,
	["Decoration"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Decoration" },
	["Sentinel"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Companion" },
	["Void Relic"] = { GalleryCategory = "Miscellaneous", HistoryCategory = "Relic", TooltipModule = "Void" }
}
