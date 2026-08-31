-- Module to format entries from the official droptables into our Databases more easily
-- Originally created for bounties but could be expanded to other droptables...
-- Questions to User:Croquemorttime

-- FOR BOUNTIES
-- enter the data into FormatingTool/data by following these instructions
-- entry has first to be formatted in notepad++ with the following
-- ctr H : ^ to " (reg exp enabled : begining of each line start with ")
-- ctr H : "     to " (removes the \tab from begining of lines)
-- ctr H : $ to ", (end of line into ",)
-- copy and paste into the BFS table below... remove last comma
-- Call the function formatBFS on a regular page to see the result... 
-- The result should be on one of my test pages... User:Croquemorttime/BountyFormating
 
local p = {}
 
local ModData = mw.loadData( 'Module:Mods/data' )
 
local BFS = mw.loadData( 'Module:FormatingTool/data' )
local MFS = mw.loadData( 'Module:FormatingTool/data2' )
local missionlist = mw.loadData( 'Module:FormatingTool/missions' )

function p.SimpleModNameList(frame)
    local result= ""
    local modtable={}
    for name, Mod in pairs(ModData['Mods'])do
        --mw.log(name, Mod)
        table.insert(modtable, name)
    end
    table.sort(modtable)
    for i, name in ipairs(modtable)do
        --mw.log(name)
        result=result..name..'<br>'
    end
    return result
end


function splitter(str,delim)
    if string.find(str,delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0    -- No limit
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then
            break
        end
    end
    -- Handle the last field
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result
end
 
function maxou(tab)
    local result=0
    for i, t in ipairs(tab) do
        if(t>result) then result = t end
    end
    return result
end
 
function ismod(name)
    local result=false
    if(ModData["Mods"][name]~=nil) then result=true end
    return result
end
 
-- for bounties
function p.formatBFS(frame)
 
    local result=''
    local ta='&nbsp;&nbsp;&nbsp;&nbsp;'
    local tata=ta..ta
    local tatata=tata..ta
    local tatatata=tata..tata
    local Hypertable={}

    
    local lvl=0
    local levels={}
    local rot=''
    local nstage=0
    local stages={}
    
    for i, line in ipairs(BFS) do

        if(string.find(line,"Bounty")~=nil) then
            lvl=lvl+1
            levels[lvl]=line
            Hypertable[lvl]={}
        elseif(string.find(line,"Rotation")~=nil) then
            rot=string.gsub(line,"Rotation ","")
            Hypertable[lvl][rot]={}
            nstage=0
        elseif(string.find(line,"Stage")~=nil) then
            nstage=nstage+1
            stages[nstage]=line
            Hypertable[lvl][rot][nstage]={}
        else
            local elements=splitter(line,"\t")
            local value=nil
            local item=''
            local parts=splitter(elements[1]," ")
            local mayvalue=parts[1]
            mayvalue=string.gsub(mayvalue,"X","")
            if(tonumber(mayvalue,10)~=nil) then 
                value=tonumber(mayvalue,10) 
                item=string.gsub(elements[1],parts[1]..' ',"")
            else
                item=elements[1]
            end
 
            local Type="Resource" --resource by default
 
            if(item=="Endo") then Type="Endo" end
 
            if(string.match(item,"Relic")~=nil) then
                Type="Relic"
                item=string.gsub(item," Relic","")
            end
 
            if(string.match(item,"Blueprint")~=nil or string.match(item,"Furax")~=nil or string.match(item,"Braton")~=nil or string.match(item,"Lato")~=nil or string.match(item,"Phaedra")~=nil) then
                Type="Blueprint"
            end
            
            if(string.match(item,"Fragment")~=nil) then
                Type="Fragments"
            end
 
            if(string.match(item,"Credits")~=nil) then
                Type="Credits"
            end
            
            if(string.match(item,"Scene")~=nil) then
                Type="Scene"
            end 
            
            if(ismod(item)) then Type="Mod" end
 
            local dropstring=elements[2]
            local dropct={tonumber(string.match(dropstring,"%d%d%d.%d%d")) or 0}
            table.insert(dropct,tonumber(string.match(dropstring,"%d%d.%d%d")) or 0)
            table.insert(dropct,tonumber(string.match(dropstring,"%d%d.%d")) or 0)
            table.insert(dropct,tonumber(string.match(dropstring,"%d.%d")) or 0)
            table.insert(dropct,tonumber(string.match(dropstring,"%d.%d%d")) or 0)
            local dropchance=maxou(dropct)  -- I know, it is not pretty... but I'm weak... -_-
            local res=''
            res=res..tatatata
            res=res..'{"'..item..'","'..Type..'",'..dropchance
            if(value~=nil) then 
                res=res..','..value..'},<br/>'
            else
                res=res..'},<br/>'
            end
            if(lvl~=nil and rot ~=nil and nstage~=nil) then
            --    mw.log("shit", lvl, rot, nstage)
                table.insert(Hypertable[lvl][rot][nstage],res)
            end
            
        end

    end
    
--    for i, v in ipairs(Hypertable) do mw.log(i, levels[i], v) end
--    for j, w in pairs(Hypertable[1]) do mw.log(j, w) end
--    for k, x in ipairs(Hypertable[1]["A"]) do mw.log(k, x) end
--    for l, y in pairs(Hypertable[1]["A"][1]) do mw.log(l, y) end

   for i, bounty in ipairs(Hypertable) do
--        result=result..'<br/><b>'..levels[i]..'</b><br/>'
        for k = 1,4 do

            local tier=string.gsub(levels[i],"Level%s","")
            local kstr1=k
            if(k==4) then 
                kstr1="F"
            end
            
            tier=string.gsub(tier," Bounty","") 
            tier=string.gsub(tier," Ghoul","") 
            tier=string.gsub(tier," Cetus","")
            tier=string.gsub(tier," Orb Vallis","") 
            tier=string.gsub(tier," ","") 
--            mw.log(levels[i],tier)
            result=result..tata..'{ Type = '
            if(string.find(levels[i],"Ghoul")) then
                result=result..'"Ghoul Bounty",<br/>'
            elseif(string.find(levels[i],"Cetus")) then
                result=result..'"Cetus Bounty",<br/>'
            elseif(string.find(levels[i],"Vallis")) then
                result=result..'"Orb Vallis Bounty",<br/>'     
            elseif(string.find(levels[i],"Vallis")) then
                result=result..'"Cambion Drift Bounty",<br/>'    
            else --should not happen
                result=result..'"Bounty",<br/>'
            end
            result=result..tata..'Tier = "'..tier..'-'..kstr1..'",<br/>'
            result=result..tata..'Name = "'..tier..', '..stages[k]..'",<br/>'
            if(string.find(levels[i],"Ghoul")) then
                result=result..tata..'Alias = "GhoulBounty'..(i-5)..'-'..kstr1..'",<br/>'
            elseif(string.find(levels[i],"Cetus")) then
                result=result..tata..'Alias = "CetusBounty'..(i)..'-'..kstr1..'",<br/>'
            elseif(string.find(levels[i],"Vallis")) then
                result=result..tata..'Alias = "OrbVallisBounty'..(i-7)..'-'..kstr1..'",<br/>'    
            else --should not happen
                result=result..tata..'Alias = "Bounty'..i..'-'..kstr1..'",<br/>'
            end
            result=result..tata..'ShortName = "'..tier..'",<br/>'
            if(k~=3) then
                result=result..tata..'Ignore = true,<br/>'
                -- put ignore=true to all stages where not all drops are present
            end
            result=result..tata..'Rewards = {<br/>'
            if(Hypertable[i]["A"]~=nil)then
                result=result..tatata..'["A"] = {<br/>'
                for j, rotlevel in ipairs(Hypertable[i]["A"][k]) do
                    result=result..Hypertable[i]["A"][k][j]
                end
                result=result..tatata..'},<br/>'
            end
            if(Hypertable[i]["B"]~=nil)then
                result=result..tatata..'["B"] = {<br/>'
                for j, rotlevel in ipairs(Hypertable[i]["B"][k]) do
                    result=result..Hypertable[i]["B"][k][j]
                end
                result=result..tatata..'},<br/>'
            end
            if(Hypertable[i]["C"]~=nil)then
                result=result..tatata..'["C"] = {<br/>'
                for j, rotlevel in ipairs(Hypertable[i]["C"][k]) do
                    result=result..Hypertable[i]["C"][k][j]
                end
                result=result..tatata..'},<br/>' -- end of rotation
            end
            result=result..tata..'&nbsp;&nbsp;'..'},<br/>' --end of rewards
            result=result..tata..'},<br/>' -- end of bounty
        end
        
    end        

        
--   mw.log(result)
    return result
end

--  for missions
function p.formatMFS(frame)
 
    local result=''
    local ta='&nbsp;&nbsp;&nbsp;&nbsp;'
    local tata=ta..ta
    local tatata=tata..ta
    local tatatata=tata..tata
    local Hypertable={}
    local printthat=false
    
    local localkey=''
    local levels={}
    local rot=''
    local nstage=0
    local stages={}
    local res=''
    --mw.log(MFS[1])
    --mw.log(missionlist["surv t1"])
    --mw.log(string.find(MFS[1],missionlist["surv t1"]))
    for i, line in ipairs(MFS) do
        --if i==1 then mw.log(i, printthat,  line, string.find(line,missionlist["surv t1"])) end
        if(printthat) then
            
            if(string.find(line,"Rotation")~=nil) then
                rot=string.gsub(line,"Rotation ","")
                res=res..tatata..'},<br/>'..tatata..'["'..rot..'"] = {<br/>'
            else
                local elements=splitter(line,"\t")
                local value=nil
                local item=''
                local parts=splitter(elements[1]," ")
                local mayvalue=parts[1]
                mayvalue=string.gsub(mayvalue,"X","")
                if(tonumber(mayvalue,10)~=nil) then 
                    value=tonumber(mayvalue,10) 
                    item=string.gsub(elements[1],parts[1]..' ',"")
                else
                    item=elements[1]
                end
     
                local Type="Resource" --resource by default
     
                if(item=="Endo") then Type="Endo" end
     
                if(string.match(item,"Relic")~=nil) then
                    Type="Relic"
                    item=string.gsub(item," Relic","")
                end
     
                if(string.match(item,"Blueprint")~=nil or string.match(item,"Furax")~=nil or string.match(item,"Braton")~=nil or string.match(item,"Lato")~=nil or string.match(item,"Phaedra")~=nil or string.match(item,"Spectra")~=nil or string.match(item,"Engines")~=nil or string.match(item,"Shield%sArray")~=nil or string.match(item,"Reactor")~=nil) then
                    Type="Blueprint"
                end
                
                if(string.match(item,"Fragment")~=nil) then
                    Type="Fragments"
                end
     
                if(string.match(item,"Credits")~=nil) then
                    Type="Credits"
                end
                
                if(string.match(item,"Omni")~=nil) then
                    Type="Item"
                end
                
                if(string.match(item,"Restore")~=nil) then
                    Type="Item"
                    item=string.gsub(item,"%s%(Large%)","")
                end

                if(string.match(item,"Scene")~=nil) then
                    Type="Scene"
                end 
                
                if(string.match(item,"Ayatan")~=nil) then
                    Type="Ayatan Sculpture"
                end 
                
                if(ismod(item)) then Type="Mod" end
                
                -- empyrean Mk Iii and MkIi formattings
                if(string.match(item,"Mk%sIii")) then
                    item=string.gsub(item,"Mk%sIii","Mk III")
                end 
                if(string.match(item,"Mk%sIi")) then
                    item=string.gsub(item,"Mk%sIi","Mk II")
                end
                   
                
     
                local dropstring=elements[2]
                local dropct={tonumber(string.match(dropstring,"%d%d%d.%d%d")) or 0}
                table.insert(dropct,tonumber(string.match(dropstring,"%d%d.%d%d")) or 0)
                table.insert(dropct,tonumber(string.match(dropstring,"%d%d.%d")) or 0)
                table.insert(dropct,tonumber(string.match(dropstring,"%d.%d")) or 0)
                table.insert(dropct,tonumber(string.match(dropstring,"%d.%d%d")) or 0)
                local dropchance=maxou(dropct)  -- I know, it is not pretty... but I'm weak... -_-
                
                res=res..tatatata
                res=res..'{"'..item..'","'..Type..'",'..dropchance
                if(value~=nil) then 
                    res=res..','..value..'},<br/>'
                else
                    res=res..'},<br/>'
                end
                --result=result..res
                
                
                
            end
            if(string.match(MFS[i+1],"/")~=nil) then
                res=res..tatata..'},<br/>'
                Hypertable[localkey]=res
                printthat=false
            end
        else
            for num, keystring in ipairs(missionlist) do
                
                if (string.find(line,keystring[2])~=nil and string.find(line,"Event")==nil) then
                    --mw.log(key)
                    --result=result..'<br/>'..key..'<br/>'
                    localkey=keystring[1]
                    res=''
                    printthat=true
                end
            end
        end
        

    end
    for num, keystring in ipairs(missionlist) do
        --keystring=missionlist[1]
        --mw.log(keystring[1],keystring[2],Hypertable[keystring[1]])
        if(Hypertable[keystring[1]]~=nil) then
            
            result=result..'<br/>'..keystring[1]..' (taken from : '..keystring[2]..')<br/>'..Hypertable[keystring[1]]
        else
            result=result..'<br/>'..keystring[1]..' (taken from : '..keystring[2]..')<br/>'..'NO RESULT'    
        end
        

    end
    --for key, keystring in pairs(missionlist) do mw.log(keystring) end
    --mw.log(result)
    return result
end
 
return p
