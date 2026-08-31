---
title: "Module:ChickenTest2"
wiki_url: "https://wiki.warframe.com/w/Module/ChickenTest2"
wiki_timestamp: "2015-06-29T07:49:48Z"
---

*Documentation for this module may be created at [Module:ChickenTest2/doc](/w/Module:ChickenTest2/doc?action=edit&redlink=1 "Module:ChickenTest2/doc (page does not exist)")*

```lua
local p = {}
 
local ChickenData = mw.loadData( 'Module:ChickenTest/data' )
 
function p.voidtest ( frame )
    local testout = ""
    for k, v in ipairs(ChickenData) do
        if v[k][1][1][1] == "BOLTOR" then
        testout = v[k][1][1][1]
        end
    end
    return testout
end

 
return p
```

