local p = {}

local WeaponData = mw.loadData( 'Module:Weapons/data' )
local Icon = require( "Module:Icon" )
local Shared = require( "Module:Shared" )

function p.weaponExistsTest(frame)
    local weaponName = frame.args ~= nil and frame.args[1]
    if(WeaponData["Weapons"][weaponName]) then
        return true
    else
        return false
    end
end

function p.weaponNameAndKeyTest()
   local nDiff = 0
   local diffKeys = {}
   for key, Weapon in Shared.skpairs(WeaponData["Weapons"]) do
       if(key ~= Weapon.Name) then
           nDiff = nDiff + 1
           diffKeys[table.getn(diffKeys) + 1] = key
       end
    end
return nDiff, diffKeys[1]
end

return p
