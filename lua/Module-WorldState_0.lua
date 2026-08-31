local p = {}
 
function p.synthesis ( frame )
    local platform = frame.args[1]
    local pc_data = frame.args.pcdata
    local ps4_data = frame.args.ps4data
    local xb1_data = frame.args.xb1data
    local data_list = {}
    local data = ""
    
    if platform == "PC" then
        data = pc_data
    elseif platform == "PS4" then
        data = ps4_data
    elseif platform == "XB1" then
        data = xb1_data
    else 
        data = pc_data .. " " .. ps4_data .. " " .. xb1_data
    end

--sense pc_data if have more than 5 data point
--slice data
    
    for i in string.gmatch(pc_data, "%S+") do
        table.insert(data_list, i)
    end
    
--pc console data page separate? synthesis invasion separate? hide option?

    return table.concat(data_list,",")
end
 
 
return p
