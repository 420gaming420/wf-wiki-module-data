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
