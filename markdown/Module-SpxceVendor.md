---
title: "Module:SpxceVendor"
wiki_url: "https://wiki.warframe.com/w/Module/SpxceVendor"
wiki_timestamp: "2025-02-27T04:50:49Z"
---

*Documentation for this module may be created at [Module:SpxceVendor/doc](/w/Module:SpxceVendor/doc?action=edit&redlink=1 "Module:SpxceVendor/doc (page does not exist)")*

```lua
local p = {}

local vendors_data = mw.loadData('Module:Vendors/data').Vendors

function p.get_offerings(frame)
    local vendor_name = frame.args[1]

    local vendor_data = vendors_data[vendor_name]
    if vendor_data == nil then return "vendor_name \"" .. vendor_name .. "\" not valid." end

    local offerings_data = vendor_data["Offerings"]
    if offerings_data == nil then return "vendor_name \"" .. vendor_name .. "\" has no \"Offerings\" data." end

    -- Define the valid offering types
    local valid_offerings = {
        Mod = true,
        Blueprint = true,
        Relic = true,
        Arcane = true,
        Item = true,
        Gear = true
    }

    local names = ""
    local costs = ""
    for i, offering in ipairs(offerings_data) do
        local offering_name = offering[1]
        local offering_type = offering[2]
        local offering_cost = offering[3] -- This might be a table

        if valid_offerings[offering_type] then  
            names = names .. offering_name .. ","

            -- If offering_cost is a table, extract its first value or convert it to a string
            if type(offering_cost) == "table" then
                costs = costs .. table.concat(offering_cost, "/") .. "," -- Join values with "/"
            else
                costs = costs .. tostring(offering_cost) .. ","
            end
        end
    end

    return names .. '  
  
' .. costs
end

return p
```

