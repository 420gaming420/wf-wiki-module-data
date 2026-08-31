---
title: "Module:SnekwTest"
wiki_url: "https://wiki.warframe.com/w/Module/SnekwTest"
wiki_timestamp: "2018-05-05T21:29:06Z"
---

*Documentation for this module may be created at [Module:SnekwTest/doc](/w/Module:SnekwTest/doc?action=edit&redlink=1 "Module:SnekwTest/doc (page does not exist)")*

```lua
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
```

