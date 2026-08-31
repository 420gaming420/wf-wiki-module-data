---
title: "Module:Modular/generator"
wiki_url: "https://wiki.warframe.com/w/Module/Modular/generator"
wiki_timestamp: "2026-06-22T05:07:43Z"
---

*Documentation for this module may be created at [Module:Modular/generator/doc](/w/Module:Modular/generator/doc?action=edit&redlink=1 "Module:Modular/generator/doc (page does not exist)")*

```lua
local p = {}

local ModularData = require("Module:Modular/data")

local CHAMBER_CLASS_MAP = {
	["Catchmoon"] = {
		["Primary"] = "Shotgun",
		["Secondary"] = "Pistol"
	},
	["Gaze"] = {
		["Primary"] = "Rifle",
		["Secondary"] = "Pistol"
	},
	["Rattleguts"] = {
		["Primary"] = "Rifle",
		["Secondary"] = "Pistol"
	},
	["Sporelacer"] = {
		["Primary"] = "Shotgun",
		["Secondary"] = "Pistol"
	},
	["Tombfinger"] = {
		["Primary"] = "Launcher",
		["Secondary"] = "Pistol"
	},
	["Vermisplicer"] = {
		["Primary"] = "Rifle",
		["Secondary"] = "Pistol"
	},
}

---	Returns a Lua table with Kitgun weapon combinations that follow [[Module:Weapons/data]] schema
--	TODO: Generate an entry for Pax Charge?
--	@function		p._generateKitgunData
--	@returns		{table} kitgunData
function p._generateKitgunData()
	local kitgunData = {}
	
	local function processType(kitgunType, slot)
		local data = ModularData[kitgunType]
		if not data then return end
		
		for chamberName, chamber in pairs(data.Chamber) do
			for loaderName, loader in pairs(data.Loader) do
				for gripName, grip in pairs(data.Grip) do
					-- e.g. "Catchmoon-Haymaker-Deepbreath"
					local kitgunComboName = chamberName .. "-" .. loaderName .. "-" .. gripName
					
					local damage = {}
					-- Grip modifies base damage value
					if chamber.Damage[gripName] then
						for k, v in pairs(chamber.Damage[gripName]) do
							damage[k] = v
						end
					else
						for k, v in pairs(chamber.Damage.Base) do
							damage[k] = v
						end
					end
					
					-- For beam-type chambers like the Gaze, the Grip will only determine the weapon's base damage and maximum range, and not the fire rate or recoil. 
					local fireRate = chamber.FireRate[gripName] or 1.0
					local range = nil
					if chamber.Trigger == "Held" then
						range = fireRate
						fireRate = 12.0
					end
                    
					local magazine = chamber.Magazine[loader.Magazine] or 1
					
					local critChance = chamber.CritChance + loader.CritChance
					local critMultiplier = chamber.CritMultiplier + loader.CritMultiplier
					local statusChance = chamber.StatusChance + loader.StatusChance
					
					local mainAttack = {
						AttackName = "Normal Attack",
						AmmoCost = chamber.AmmoCost,
						Damage = damage,
						CritChance = critChance,
						CritMultiplier = critMultiplier,
						StatusChance = statusChance,
						FireRate = fireRate,
						IsSilent = chamber.IsSilent,
						MinSpread = chamber.MinSpread,
						MaxSpread = chamber.MaxSpread,
						Multishot = 1,	-- TODO: Confirm if this is true for shotguns too
						ShotType = chamber.ShotType,
						Trigger = chamber.Trigger
					}
					if range then
                        mainAttack.Range = range
                    elseif chamber.Falloff ~= nil then
                        mainAttack.Falloff = {
                        	StartRange = chamber.Falloff.StartRange,
                        	EndRange = chamber.Falloff.EndRange,
                        	Reduction = chamber.Falloff.Reduction
                        }
                    end
					-- TODO: Missing AoE component for Tombfinger and others
							
					kitgunData[kitgunComboName] = {
						_TooltipAttackDisplay = 1,
						Accuracy = chamber.Accuracy,
						AmmoMax = chamber.AmmoMax,
						AmmoPickup = chamber.AmmoPickup,
						AmmoType = slot,
						Attacks = { mainAttack },
						Class = CHAMBER_CLASS_MAP[chamberName][slot],
						CompatibilityTags = chamber.CompatibilityTags,
						Conclave = false,
						Disposition = chamber.Disposition,
						ExilusPolarity = "Madurai",
						Family = chamberName,
						Image = chamberName .. '.png',	-- TODO: We need to create a map for this?
						Link = chamberName,
						Magazine = magazine,
						Mastery = 0,
						MaxRank = 30,
						Name = kitgunComboName,
						Polarities = {},
						Reload = loader.Reload,
						SellPrice = 7500,	-- TODO: Need to confirm in-game
						Slot = slot,
						Tradable = 0,
						Traits = { "Modular" },
						Trigger = chamber.Trigger,
					}
				end
			end
		end
	end
	
	processType("Kitgun", "Secondary")
	processType("KitgunPrimary", "Primary")
	
	return kitgunData
end

---	Dumps a preprocessed table of weapon stats and info to copy into M:Modular/data/kitgun.
--	@function		p.dumpKitgunData
--	@param			{table} frame Frame object
--	@returns		{string} kitgunData preprocessed wikitext string in Lua table formatting
function p.dumpKitgunData(frame)
	local str = { '

```lua
' }
	local data = mw.dumpObject(p._generateKitgunData()):gsub('table#%d+ %{', '%{')
			:gsub('%-nan', 'nil'):gsub('    ', '	'):gsub('inf', 'math.huge')	-- Note: replacing 4 spaces with one tab
			-- :gsub('"math.huge"', 'math.huge'):gsub('"%-math.huge"', '-math.huge')
	table.insert(str, 'return '..data..'\n')
	table.insert(str, '
```

')

	return frame:preprocess(table.concat(str, '\n'))
end

return p
```

