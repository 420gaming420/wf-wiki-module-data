local p = {}

local TestData = mw.loadData( 'Module:FalterTest/data' )

-- iterator sorted by keys
-- For example, if you had a table that looked something like
-- data = {["Cat"] = 5,
--         ["Bat"] = 4,
--         ["Hat"] = 7}
-- You could do
--  for k, v in skpairs(data) do...
-- And your loop would start with k="Bat", v=4 then go to k="Cat", v=5, 
--         and finally to k="Hat", v=7
--Originally snagged this from Module:VoidByReward written by User:NoBrainz
function skpairs(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    table.sort(keys)
 
    local i = 0
    local iterator = function()
        i = i + 1
        local key = keys[i]
        if key then
            return key, t[key]
        else
            return nil
        end
    end
    return iterator
end



function p.exampleTable(frame)
    --Setting up table header
    result = '{| class="sortable" style="font-size:11px;"'
    result = result..'\n! Name'
    result = result..'\n! data-sort-type="number" |Damage'
    
    --Adding rows
    for i, weap in skpairs(TestData.Weapons) do
        result = result..'\n|-'
        result = result..'\n|'..weap[1]..'||'..weap[2]
    end
    
    --Closing off table and return the result
    result = result..'\n|}'
    return result
end

return p
