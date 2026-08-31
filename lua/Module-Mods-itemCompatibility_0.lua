local p = {}

-- Load mods and weapons data
local Table = require("Module:Table")
local modsData = mw.loadData("Module:Mods/data").Mods
local weaponsData = mw.loadData("Module:Weapons/data")

local function isCompatible(mod, weapon)
	-- TODO: logic
	return false
end

-- Function to get compatible mods for a weapon
local function getCompatibleMods(weaponName)
    local weapon = weaponsData[weaponName]
    if not weapon then
        return error("Weapon not found: " .. weaponName)
    end
	
	local weaponParent = weapon.Parent
	local weaponParents = weapon.Parents

    local compatibleMods = {}
    for _, mod in Table.skpairs(modsData) do
        if isCompatible(mod, weapon) then
            table.insert(compatibleMods, mod.Name)
        end
    end

    return compatibleMods
end

-- Function to get incompatible mods for a weapon in the scenario where it should be compatible
-- but an IncompatibilityTag overrides it
local function getIncompatibleMods(weaponName)
    local weapon = weaponsData[weaponName]
    if not weapon then
        return error("Weapon not found: " .. weaponName)
    end
	
	local weaponParent = weapon.Parent
	local weaponParents = weapon.Parents
	
	local incompatibleMods = {}
	-- TODO: Add logic
	return incompatibleMods
end

-- Main function to display compatible mods
function p.compatibleMods(frame)
    local weaponName = frame.args[1] or ""
    if weaponName == "" then
        return error("Please provide a weapon name.")
    end

    local compatibleMods = getCompatibleMods(weaponName)
    if type(compatibleMods) == "string" then
        return compatibleMods
    end

    local result = { "Compatible mods for " .. weaponName .. ":" }
    for _, modName in ipairs(compatibleMods) do
        table.insert(result, "*"..modName)
    end
	table.insert(result, "")
	
    return frame:preprocess(table.concat(result, "\n"))
end

return
