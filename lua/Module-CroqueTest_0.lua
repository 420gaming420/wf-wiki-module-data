-- test functions to auto format some stuff for auto patch hystory generation

-- entry has first to be formatted in notepad++ with the following
-- ctr H : ^ to " (reg exp enabled : begining of each line start with ")
-- ctr H : "     to " (removes the tab from begining of lines)
-- ctr H : $ to ", (end of line into ",)
-- copy and paste here... remove last comma

local p = {}

local regist1={
["v6"]=1,["v7"]=1,["v8"]=1,["v9"]=1,["v10"]=1,
["v11"]=2,["v12"]=2,["v13"]=2,["v14"]=2,["v15"]=2,["v15A"]=2,["v15B"]=2,["v16"]=2,["v16A"]=2,["v16B"]=2,
["v17"]=2,["v17A"]=2,["v17B"]=2,["v18"]=2,["v18A"]=2,["v18B"]=2,["v18C"]=2,
["v19"]=2,["v19A"]=2,["v19B"]=2,["v19C"]=2,["v20"]=2,["v20A"]=2,["v20B"]=2,
["v21"]=3,["v22"]=3,["v22A"]=3,["v22B"]=3,["v22C"]=3,["v22D"]=3,
}
local regist2={'Module:CroqueTest/data','Module:CroqueTest/data2','Module:CroqueTest/data3'}

local keywords=mw.loadData( 'Module:CroqueTest/keywords' )

local BKT=mw.loadData( 'Module:CroqueTest/BKT' )
local worldstate=mw.loadData( 'Module:CroqueTest/data' )

local Weapons=mw.loadData( 'Module:Weapons/data' )
local Research=mw.loadData( 'Module:Research/data' )
local Warframes=mw.loadData( 'Module:Warframes/data' )

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

function p.findall(line,key)
    --local line="*Fix for %[%[Rifle Amp%]%] Aura stacking. A word from the designer: Rifle Amp, 45% damage buff stacking was too much, reduced to 27% (4.5% base). This was a typo on my part."
    --local key="Amp"
    --mw.log(string.find(string.upper(line),string.upper(key)))
    
    local result={}
    local i=0
    local j=0
    while true do
      i,j = string.find(string.upper(line),string.upper(key), i+1)  
      if i == nil then break end
      --mw.log(i,j)
      table.insert(result, {begin=i,zeend=j})
    end
    --for kk,vv in ipairs(result) do for k,v in pairs(vv) do mw.log(key,k,v) end end
    
    return result    
end


function p.checkline(line)
    --local line="*Fix for %[%[Rifle Amp%]%] Aura stacking. A word from the designer: Rifle Amp, 45% damage buff stacking was too much, reduced to 27% (4.5% base). This was a typo on my part."
    --mw.log(line)
    --for k,v in ipairs(keywords[1][2]) do mw.log(k, v) end
    local keystring=''
    for j, key in ipairs(keywords) do
        local aliases=key[1]
        local antialiases=key[2]
        local indexes={}
        local aindexes={}
        for jj, key1 in ipairs(aliases) do --gather all indexes of aliases
            
            if(string.find(string.upper(line),string.upper(key1))~=nil) then
                --local tt={string.find(string.upper(line),string.upper(key1))}
                --mw.log(key1,tt[1],tt[2])
                --table.insert(indexes,tt)
                local tt=p.findall(line,key1)
                for k,v in ipairs(tt) do table.insert(indexes,v) end
            end
        end
        --
        --for k,v in ipairs(indexes) do mw.log(k, v) end
        --
        for jj, key2 in ipairs(antialiases) do 
            --local antiindex
            if (string.find(string.upper(line),string.upper(key2))~=nil) then
                --antiindex={string.find(string.upper(line),string.upper(key2))}
                --for kk, aliindex in ipairs(indexes) do
                --    if (aliindex[1]>=antiindex[1] and aliindex[1]<antiindex[2]) then
                --        table.remove(indexes,kk)
                --    end
                --end
                local tt=p.findall(line,key2)
                for k,v in ipairs(tt) do table.insert(aindexes,v) end
                
            end
            
        end
        
        --for kk,vv in ipairs(indexes) do for k,v in pairs(vv) do mw.log(k,v) end end
        --for kk,vv in ipairs(aindexes) do for k,v in pairs(vv) do mw.log(k,v) end end
        --Now we cross check everything

        if(indexes[1]~=nil and aindexes[1]==nil) then 
            keystring=keystring..aliases[1]..'/'
        else
            local nogood=0
            local good=0
            for kk, ij in ipairs(indexes) do
                good=good+1
                i=ij.begin
                j=ij.zeend
                for l, mn in ipairs(aindexes) do
                    m=mn.begin
                    n=mn.zeend
                    --mw.log(i , j , m , n)
                    if (i>=m and i<=n) then
                        nogood=nogood+1
                        break
                    end
                    
                end
            end
            --mw.log(good,nogood)
            if(good>nogood) then
                keystring=keystring..aliases[1]..'/'
            end
        end

        
        --final construction of the string
        --if(indexes[1]~=nil) then
        --    keystring=keystring..aliases[1]..'/' 
        --end
        
    end
    
    --mw.log(keystring)
    return keystring    
end

function p.checktags(line)
    --local line="*New weapons: Dual Zoren, Akbolto, and Boltor!"
    --mw.log(line)
    --for k,v in ipairs(keywords[1][2]) do mw.log(k, v) end
    local keystring=''
    for j, key in ipairs(keywords) do
        local aliases=key[1]
        local antialiases=key[2]
        local indexes={}
        local aindexes={}
        for jj, key1 in ipairs(aliases) do --gather all indexes of aliases
            
            if(string.find(string.upper(line),string.upper(key1))~=nil) then
                --local tt={string.find(string.upper(line),string.upper(key1))}
                --mw.log(key1,tt[1],tt[2])
                --table.insert(indexes,tt)
                local tt=p.findall(line,key1)
                for k,v in ipairs(tt) do table.insert(indexes,v) end
            end
        end
        --
        --for k,v in ipairs(indexes) do mw.log(k, v) end
        --
        for jj, key2 in ipairs(antialiases) do 
            --local antiindex
            if (string.find(string.upper(line),string.upper(key2))~=nil) then
                local tt=p.findall(line,key2)
                for k,v in ipairs(tt) do table.insert(aindexes,v) end
                
            end
            
        end
        
        --for kk,vv in ipairs(indexes) do for k,v in pairs(vv) do mw.log(k,v) end end
        --for kk,vv in ipairs(aindexes) do for k,v in pairs(vv) do mw.log(k,v) end end

        --Now we cross check everything
        if(indexes[1]~=nil and aindexes[1]==nil) then 
            keystring=keystring..'"'..aliases[1]..'",'
        else
            local nogood=0
            local good=0
            for kk, ij in ipairs(indexes) do
                good=good+1
                i=ij.begin
                j=ij.zeend
                for l, mn in ipairs(aindexes) do
                    m=mn.begin
                    n=mn.zeend
                    --mw.log(i , j , m , n)
                    if (i>=m and i<=n) then
                        nogood=nogood+1
                        break
                    end
                    
                end
            end
            --mw.log(good,nogood)
            if(good>nogood) then
                keystring=keystring..'"'..aliases[1]..'",'
            end
        end

    end
    --mw.log(keystring)
    return keystring    
end

function p.formatBFSold(frame)
    if(type(UnformattedData)~="table") then return "No Data" end
    local BFS=UnformattedData[frame.args[1]]
    local result=''
    local nline=0
    local tab='&nbsp;&nbsp;&nbsp;&nbsp;'
    
    if(type(BFS)~="table") then return "No Entries" end
    
    for i, line in ipairs(BFS) do
        if(line=="") then
            result=result--..'<b>'..line..'</b><br/>'
        elseif(string.find(line,"Expand")~=nil) then
            result=result--..'<br/>'
        elseif(string.find(line,"Forum Post")~=nil) then
            result=result--
        elseif(string.find(line,"Update %d")~=nil or string.find(line,"Update:%s")~=nil or string.find(line,"Hotfix:%s")~=nil or string.find(line,"Hotfix %d")~=nil) then
            local vers=string.gsub(line,"Update ","")
            vers=string.gsub(vers,"Hotfix ","")
            result=result..'},<br/>{["Version"]={"'..vers..'"},<br/>'
        else
            local keystring=''
            for j, key in ipairs(keywords) do
                if(string.find(line,key)~=nil or string.find(line,string.upper(key))~=nil) then
                    keystring=keystring..key..'/'
                end
            end
            nline=nline+1
            result=result..tab..tab
            result=result..'["'..keystring..'"]={<br/>'
            result=result..tab..tab..tab
            result=result..'"'..line..'"<br/>'..tab..tab'},<br/>'
        end
        
    end
    result='Number of lines: '..nline..'<br/><br/>'..result
--    mw.log(result)
    return result
end


function p.formatBFS(frame)
    
    local versions=frame.args[1]
    local result=''
    local nline=0
    local tab='&nbsp;&nbsp;&nbsp;&nbsp;'
    local openframe = false
    local openedframe = ''
    local UnformattedData={}
    local BFS ={}
    if (regist1[versions]~=nil) then
        UnformattedData=mw.loadData( regist2[regist1[versions]] )
        if(type(UnformattedData)~="table") then return "No Data" end
        BFS=UnformattedData[versions]
        if(type(BFS)~="table") then return "No Entries" end
    else
        return "Bad Argument"
    end
    

    for i, line in ipairs(BFS) do

        
        if(line=="") then
            if (openframe) then 
                result=result..tab..tab..'{tags={""},text={"<%br/>"}},<br/>'
            end
        elseif(string.find(line,"{{update")~=nil or string.find(line,"{{Update")~=nil) then
            result=result..'{<br/>'
            openedupdate=true
        elseif(line=="}}") then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'<br/>},--update end<br/>'--
        elseif(string.find(line,"|update number")~=nil) then
            local vers=string.gsub(line,"|update number.-= ","")
            vers=string.gsub(vers,"|update number.-=","")
            result=result..'["update number"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|type")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            local vers=string.gsub(line,"|type.-= ","")
            vers=string.gsub(vers,"|type.-=","")
            result=result..'["type"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|date")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            local vers=string.gsub(line,"|date.-= ","")
            vers=string.gsub(vers,"|date.-=","")
            result=result..'["date"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|forumurl ")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            local vers=string.gsub(line,"|forumurl.-= ","")
            vers=string.gsub(vers,"|forumurl.-=","")
            result=result..'["forumurl"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|title")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            local vers=string.gsub(line,"|title.-= ","")
            vers=string.gsub(vers,"|title.-=","")
            result=result..'["title"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|image")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            local vers=string.gsub(line,"|image.-= ","")
            vers=string.gsub(vers,"|image.-=","")
            result=result..'["image"]={"'..vers..'"},<br/>'
        elseif(string.find(line,"|misc")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["misc"]={<br/>'
            openframe=true
            openedframe = 'misc'
        elseif(string.find(line,"|additions")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["additions"]={<br/>'
            openframe=true
            openedframe = 'additions'
        elseif(string.find(line,"|changes")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["changes"]={<br/>'
            openframe=true
            openedframe = 'changes'
        elseif(string.find(line,"|fixes")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["fixes"]={<br/>'
            openframe=true
            openedframe = 'fixes'
        elseif(string.find(line,"|conclave")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["conclave"]={<br/>'
            openframe=true
            openedframe = 'conclave'
        elseif(string.find(line,"|localizations")~=nil) then
            if(openframe) then 
                result=result..'},--'..openedframe..' end<br/>'
                openframe=false
            end
            result=result..'["localizations"]={<br/>'
            openframe=true
            openedframe = 'localizations'
        else
            local tags=p.checktags(line)
            
            nline=nline+1
            result=result..tab..tab
            result=result..'{tags={'..tags..'},text={"'..line..'"}},<br/>'
        end
        
    end
    local preamble="local PatchData =<br/>{<br/>"
    local postamble="<br/>}<br/>return PatchData"
    result='Number of lines: '..nline..'<br/><br/><code>'..preamble..result..postamble..'</code>'
    --mw.log(result)
    return result
end


function p.getBaroDates()
    local result=""
    local dates={}
    
    for i,Item in ipairs(BKT["Trades"]) do
        local cdate=Item["Dates"][1][1]
        --mw.log(cdate)
        local absent=true
        for j,odate in ipairs(dates) do
            if odate==cdate then
                absent=false
            end
        end
        if absent then
            table.insert(dates,cdate)
        end
            
    end
 
    for i,cdate in ipairs(dates) do
        result = result..cdate.."\n"
    end
  
    return result
end
   
function p.BaroChart(frame)
    local SurType = frame.args ~= nil and frame.args[1]
    --SurType="Misc"
    if SurType==nil then return 0 end
    
    local result="{| class='wikitable', style='font-size:5px'\n|- \n"
    result=result.."!Item\n"
    for i,cdate in ipairs(BKT["Apparitions"]) do
        result=result.."!<span title='"..cdate[1].."'>".."d".."</span>\n"
    end
    result=result.."|-\n"
    for j,Item in ipairs(BKT["Trades"]) do
        
        if Item["SurType"]==SurType then
            --mw.log(Item["SurType"])
            result=result.."|<span title='"..Item["Name"].."'>"..j.."</span>\n"
            for i,cdate in ipairs(BKT["Apparitions"]) do
                local present=false
                for k,kdate in ipairs(Item["Dates"]) do
                    if kdate[1]==cdate[1] then
                        present=true
                    end
                end
                if present then
                    result=result.."|1\n"
                else
                    result=result.."| \n"
                end
            end
            result=result.."|-\n"
        end
    end
    
                            
    
    result=result.."|-}"
    
    return result

end
    
function p.ResourceList(frame)
    local ResourceName = frame.args ~= nil and frame.args[1]
    --local ResourceName="Neurodes"
    if ResourceName==nil then return 0 end
    
    local list={}
    local totalcount=0
    local researchcount=0
    local componentnames={"Chassis","Neuroptics","Systems","Wings","Harness"}
    local gearnames={"Restore"}
    
    for i, Weapon in pairs(Weapons["Weapons"]) do
        if string.find(Weapon.Name,"Atmosphere") == nil then
            if Weapon.Cost ~= nil then
                if Weapon.Cost.Parts ~= nil then
                    --mw.log(Weapon.Name,Weapon.Slot)
                    for j, part in pairs(Weapon.Cost.Parts) do
                        if part.Name == ResourceName then
                            table.insert(list,{Name = Weapon.Name,Type = Weapon.Slot, Count = part.Count, RCount = 0})
                            totalcount=totalcount+part.Count
                        end
                    end
                end
            end
        end
    end
    
    for i, Warframe in pairs(Warframes["Warframes"]) do
        if Warframe.MainCost ~= nil then
            for j, part in pairs(Warframe.MainCost.Parts) do
                if part.Name == ResourceName then
                    table.insert(list,{Name = Warframe.Name,Type = "Warframe", Count = part.Count, RCount = 0})
                    totalcount=totalcount+part.Count
                end
            end
        end
        if Warframe.NeuroCost ~= nil then
            for j, part in pairs(Warframe.NeuroCost.Parts) do
                if part.Name == ResourceName then
                    table.insert(list,{Name = Warframe.Name.." Neuroptics",Type = "Component", Count = part.Count, RCount = 0})
                    totalcount=totalcount+part.Count
                end
            end
        end
        if Warframe.ChassisCost ~= nil then
            for j, part in pairs(Warframe.ChassisCost.Parts) do
                if part.Name == ResourceName then
                    table.insert(list,{Name = Warframe.Name.." Chassis",Type = "Component", Count = part.Count, RCount = 0})
                    totalcount=totalcount+part.Count
                end
            end
        end
        if Warframe.SystemCost ~= nil then
            for j, part in pairs(Warframe.SystemCost.Parts) do
                if part.Name == ResourceName then
                    table.insert(list,{Name = Warframe.Name.." Systems",Type = "Component", Count = part.Count, RCount = 0})
                    totalcount=totalcount+part.Count
                end
            end
        end
    end
    
    for i, Item in pairs(Research["Research"]) do
    	ItemName = i
        if Item.Resources ~= nil then
            for j, part in pairs(Item.Resources) do
                if part.Name == ResourceName then
                    local notthere = true
                    researchcount=researchcount+part.Count
                    -- check if already in list
                    for k, PItem in pairs(list) do
                        if ItemName == PItem.Name then
                            notthere=false
                            list[k].RCount=part.Count
                        end
                    end
                    if notthere then -- not already in the list
                        local ItemType = "Research"
                        if Warframes["Warframes"][ItemName]~=nil then ItemType = "Warframe" end
                        for k, component in pairs(componentnames) do
                            if string.find(ItemName,component)~=nil then ItemType = "Component" end
                        end
                        if Weapons["Weapons"][ItemName]~=nil then 
                            ItemType = Weapons["Weapons"][ItemName]["Slot"] 
                        end
                        for k, gear in pairs(gearnames) do
                            if string.find(ItemName,gear)~=nil then ItemType = "Gear" end
                        end
                        if string.find(ItemName,"Key")~=nil then ItemType = "Key" end
                        table.insert(list,{Name = ItemName,Type = ItemType, Count = 0, RCount = part.Count})
                    end
                end
            end
        end
    end
    
    local result="{| class='listtable sortable' style='width: 400px;' border='0' cellpadding='1' cellspacing='1'\n|- \n"
    result=result.."!Blueprints!!Type!!Quantity (Research)\n|- \n"
    for i,Item in pairs(list) do
    	--mw.log(Item.Type)
        if Item.RCount == 0 then
            result=result.."|"..Item.Name.."||"..Item.Type.."||"..Item.Count.."\n|- \n"
        elseif Item.Count == 0 then
            result=result.."|"..Item.Name.."||"..Item.Type.."||("..Item.RCount..")\n|- \n"
        else
            result=result.."|"..Item.Name.."||"..Item.Type.."||"..Item.Count.."("..Item.RCount..")\n|- \n"
        end
    end
    result=result.."|-}\n"
    result=result.."{| class='listtable' style='width: 400px;' border='0' cellpadding='1' cellspacing='1'\n|- \n"
    result=result.."! style='text-align: left;' |Total \n"
    result=result.."! style='text-align: right;' |".. totalcount.."("..researchcount..")\n|- \n"
    result=result.."| Research|| colspan='9' | PH Research Tiers\n"
    result=result.."|-}"
    
    return result
end

function p.NightWaveActs(frame)
    local Automatic = frame.args ~= nil and frame.args[1]
    local DWE = frame.args ~= nil and frame.args[2]
    if Automatic == "Auto" then Automatic = true end
    --Automatic=true
    local worldstring=worldstate["wstring"]
    local Acts=worldstate["Acts"]
    --mw.log(worldstring)
    local months={"January","February","March","April","May","June","July","August","September","October","November","December"}
    local Daily={}
    local Weekly={}
    local EliteWeekly={}
    local Index=0
    local Index2=1
    local ActCode
    local Expiry
    local ExpiryT
    local CDstart='<span class="customcountdown" style="font-size:12px">'
    CDstart=CDstart..'<span style="display:none" class="bText">( End in&nbsp;</span>'
    CDstart=CDstart..'<span style="display:none" class="bDelayText"></span>'
    CDstart=CDstart..'<span class="years"></span><span class="months"></span><span class="days"></span><span class="hours"></span><span class="minutes"></span><span class="seconds"></span>'
    CDstart=CDstart..'<span style="display:none" class="aText">&nbsp;)</span>'
    CDstart=CDstart..'<span style="display:none" class="aDelayText"></span>'
    CDstart=CDstart..'<span style="display:none" class="seedDate">'
    local CDend='</span><span style="display:none" class="loopTime">3</span>'
    CDend=CDend..'<span style="display:none" class="loopTimeUnit">D</span>'
    CDend=CDend..'<span style="display:none" class="loopLimit">1</span>'
    CDend=CDend..'<span style="display:none" class="endText">( Expired )</span>'
    CDend=CDend..'<span style="display:none" class="delayTime"></span>'
    CDend=CDend..'<span style="display:none" class="delayTimeUnit"></span>'
    CDend=CDend..'<span style="display:none" class="delayCountDisplay"></span>'
    CDend=CDend..'<span style="display:none" class="dst">t</span>'
    CDend=CDend..'<span style="display:none" class="dateFormat">D hh mm ss</span>'
    CDend=CDend..'<span style="display:none" class="dateLabels"></span>'
    CDend=CDend..'<span style="display:none" class="separators">:</span></span>'
    local localAct={}
    while(string.find(worldstring,"/Lotus/Types/Challenges/Seasons/Daily/",Index+1)~=nil) do
        localAct={}
        Index=string.find(worldstring,"/Lotus/Types/Challenges/Seasons/Daily/",Index+1)
        Index2=string.find(worldstring,"},",Index)
        ActCode=string.sub(worldstring,Index+38,Index2-2)
        Expiry=string.sub(worldstring,Index-30,Index-21)
        ExpiryT=os.date("*t",Expiry-259200) --remove 3 days for nightwave custom countdown
        localAct["Code"]=ActCode
        localAct["ExpiryEpoch"]=Expiry
        if Acts[ActCode]~=nil then
            localAct["Icon"]="[<ee>[File:"..Acts[ActCode]["Icon"].."|center|75px]<ee>]"
            localAct["Name"]=Acts[ActCode]["Name"]
            localAct["Description"]=Acts[ActCode]["Description"]
            localAct["Standing"]=Acts[ActCode]["Standing"]
            localAct["Expiry"]=months[ExpiryT["month"]].." "..ExpiryT["day"]..", "..ExpiryT["year"].." 00:00:00 UTC"
            localAct["ExpiryTemplate"]=months[ExpiryT["month"]].." "..ExpiryT["day"]..", "..ExpiryT["year"].." 00:00:00 UTC"
            --October 12, 2019 00:00:00 UTC
        else
            localAct["Icon"]=""
            localAct["Name"]=ActCode
            localAct["Description"]=""
            localAct["Standing"]="1,000"
            localAct["Expiry"]=months[ExpiryT["month"]].." "..ExpiryT["day"]..", "..ExpiryT["year"].." 00:00:00 UTC"
            localAct["ExpiryTemplate"]=months[ExpiryT["month"]].." "..ExpiryT["day"]..", "..ExpiryT["year"].." 00:00:00 UTC"
        end
        if string.find(localAct["Icon"],"xyz.png")~=nil then localAct["Icon"] = '<!<ee>--[<ee>[File:xyz.png|center|75px]<ee>] --<ee>>' end 
        table.insert(Daily,localAct)
    end
    while(string.find(worldstring,"/Lotus/Types/Challenges/Seasons/Weekly/",Index+1)~=nil) do
        localAct={}
        Index=string.find(worldstring,"/Lotus/Types/Challenges/Seasons/Weekly/",Index+1)
        Index2=string.find(worldstring,"},",Index)
        ActCode=string.sub(worldstring,Index+39,Index2-2)
        localAct["Code"]=ActCode
        --mw.log(ActCode)
        if Acts[ActCode]~=nil then
            localAct["Icon"]="[<ee>[File:"..Acts[ActCode]["Icon"].."|center|75px]<ee>]"
            localAct["Name"]=Acts[ActCode]["Name"]
            localAct["Description"]=Acts[ActCode]["Description"]
            localAct["Standing"]=Acts[ActCode]["Standing"]
        else
            localAct["Icon"]=""
            localAct["Name"]=ActCode
            localAct["Description"]=""
            localAct["Standing"]="4,500"
        end
        if string.find(localAct["Icon"],"xyz.png")~=nil then localAct["Icon"] = '<!<ee>--[[File:xyz.png|center|75px]] --<ee>>' end 
        table.insert(Weekly,localAct)
    end     
    while(string.find(worldstring,"/Lotus/Types/Challenges/Seasons/WeeklyHard/",Index+1)~=nil) do
        localAct={}
        Index=string.find(worldstring,"/Lotus/Types/Challenges/Seasons/WeeklyHard/",Index+1)
        Index2=string.find(worldstring,"}",Index)
        ActCode=string.sub(worldstring,Index+43,Index2-2)
        localAct["Code"]=ActCode
        if Acts[ActCode]~=nil then
            localAct["Icon"]="[<ee>[File:"..Acts[ActCode]["Icon"].."|center|75px]<ee>]"
            localAct["Name"]=Acts[ActCode]["Name"]
            localAct["Description"]=Acts[ActCode]["Description"]
            localAct["Standing"]=Acts[ActCode]["Standing"]
        else
            localAct["Icon"]=""
            localAct["Name"]=ActCode
            localAct["Description"]=""
            localAct["Standing"]="7,000"
        end
        if string.find(localAct["Icon"],"xyz.png")~=nil then localAct["Icon"] = '<!<ee>--[[File:xyz.png|center|75px]] --<ee>>' end 
        table.insert(EliteWeekly,localAct)
    end  
    
    table.sort(Daily, function(a,b) return a["ExpiryEpoch"] > b["ExpiryEpoch"] end)
    table.sort(Weekly, function(a,b) return a["Name"] < b["Name"] end)
    table.sort(EliteWeekly, function(a,b) return a["Name"] < b["Name"] end)
    
    for k,v in pairs(Daily) do mw.log(Daily[k]["Name"], Daily[k]["Expiry"]) end
    for k,v in pairs(Weekly) do mw.log(Weekly[k]["Name"]) end
    for k,v in pairs(EliteWeekly) do mw.log(EliteWeekly[k]["Name"]) end
    
    local result='{| class="emodtable" style="width:100%;"<br>'
    result=result..'|-<br>'
    result=result..'!Icon<br>'
    result=result..'!Description<br>'
    result=result..'!Reward<br>'
    
    local resultDaily=result..'!End time<br>'..'|-'
    local resultWeekly=result..'|-'
    local resultEliteWeekly=result..'|-'
    
    for _, lAct in pairs(Daily) do
        resultDaily=resultDaily.."<br>|"..lAct["Icon"]
        resultDaily=resultDaily.."<br>|'<ee>'<ee>'"..lAct["Name"].."'<ee>'<ee>'<br<ee>/>'<ee>'"..lAct["Description"].."'<ee>'"
        if (Automatic == true) then
            resultDaily=resultDaily.."<br>|[[File:ReputationLargeBlack.png|20px|link=Syndicates]]"..'&zwj;<b>'..lAct["Standing"]..'</b>'
        else
            resultDaily=resultDaily.."<br>|{{sc|"..lAct["Standing"].."}}"
        end
        if (Automatic == true) then 
            resultDaily=resultDaily.."<br>|"..CDstart..lAct["Expiry"]..CDend.."<br>|-"
        else
            resultDaily=resultDaily.."<br>|{{NightwaveCountdown|"..lAct["ExpiryTemplate"].."}}<br>|-"
        end
            
    end
    resultDaily=resultDaily.."<br>|}<br><br>"
    for _, lAct in pairs(Weekly) do
        resultWeekly=resultWeekly.."<br>|"..lAct["Icon"]
        resultWeekly=resultWeekly.."<br>|'<ee>'<ee>'"..lAct["Name"].."'<ee>'<ee>'<br<ee>/>'<ee>'"..lAct["Description"].."'<ee>'"
        if (Automatic == true) then
            resultWeekly=resultWeekly.."<br>|[[File:ReputationLargeBlack.png|20px|link=Syndicates]]"..'&zwj;<b>'..lAct["Standing"]..'</b><br>|-'
        else
            resultWeekly=resultWeekly.."<br>|{{sc|"..lAct["Standing"].."}}<br>|-"
        end
    end
    resultWeekly=resultWeekly.."<br>|}<br><br>"
    for _, lAct in pairs(EliteWeekly) do
        resultEliteWeekly=resultEliteWeekly.."<br>|"..lAct["Icon"]
        resultEliteWeekly=resultEliteWeekly.."<br>|'<ee>'<ee>'"..lAct["Name"].."'<ee>'<ee>'<br<ee>/>'<ee>'"..lAct["Description"].."'<ee>'"
        if (Automatic == true) then
            resultEliteWeekly=resultEliteWeekly.."<br>|[[File:ReputationLargeBlack.png|20px|link=Syndicates]]"..'&zwj;<b>'..lAct["Standing"]..'</b><br>|-'
        else
            resultEliteWeekly=resultEliteWeekly.."<br>|{{sc|"..lAct["Standing"].."}}<br>|-"
        end
    end
    resultEliteWeekly=resultEliteWeekly.."<br>|}<br>"
    
    
    if (Automatic==true) then
        if (DWE=="Daily") then
            result = string.gsub(resultDaily,"<ee>","")
            result = string.gsub(result,"<br>","\n")
        elseif (DWE=="Weekly") then
            result = string.gsub(resultWeekly,"<ee>","")
            result = string.gsub(result,"<br>","\n")
        elseif (DWE=="EliteWeekly") then
            result = string.gsub(resultEliteWeekly,"<ee>","")
            result = string.gsub(result,"<br>","\n")
        end
        return result
    else 
        result = '<<ee>div class="tabbertab-borderless"><<ee>tabber><br>|-|♦ Daily=<br>'..resultDaily..'|-|♦♦ Weekly=<br>'..resultWeekly..'|-|♦♦♦ Elite Weekly=<br>'..resultEliteWeekly.."</tabber<ee>></div<ee>>"
        return '<pre>'..result..'</pre>'
    end

end
    


return p
