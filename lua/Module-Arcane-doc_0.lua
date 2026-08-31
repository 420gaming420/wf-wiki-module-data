local p = {}
local Arcane = require('Module:Arcane')

local function func(arcaneName, valName)
    return Arcane._getValue(arcaneName, valName)
end
