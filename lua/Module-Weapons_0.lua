local StatObject = require('Module:StatObject') -- Base class
local WeaponData = require('Module:Weapons/data')

-- Doing some metaprogramming to extend functionality of StatObject class
StatObject.default = {
    Name = { nil, 'Weapon Name: %s' },  -- Sample definition for Name field getter/formatter
    ...
}

local BratonStatObject = StatObject(WeaponData['Braton'])

-- Get raw Name value "Braton" instead of StatObject.statRead(WeaponData['Braton'], 'Name')
local name = BratonStatObject.Name
-- Get formatted Name value "Weapon Name: Braton" (as defined in StatObject.default) instead of StatObject.statFormat(WeaponData['Braton'], 'Name')
print(BratonStatObject.Name)
mw.log(BratonStatObject.Name)
local formattedName = tostring(BratonStatObject.Name)
-- If the above is not possible in Lua then maybe add a __call metamethod to Name key to return its formatted value
formattedName = BratonStatObject.Name()
-- Or add a format() function to instantiated StatObject's metatable, passing in key name as argument
formattedName = BratonStatObject:format('Name')
