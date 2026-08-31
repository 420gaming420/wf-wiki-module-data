-- test environement for... u know... stuff... :)

local p = {}

local Shared = require( "Module:Shared" )
local Version = require( "Module:Version" )

local register1={
--    ["v6"]="Module:CroqueTest2/DV6",
--    ["v7"]="Module:CroqueTest2/DV7",
--    ["v8"]="Module:CroqueTest2/DV8",
--    ["v9"]="Module:CroqueTest2/DV9",
--    ["v10"]="Module:CroqueTest2/DV10",
--    ["v11"]="Module:CroqueTest2/DV11",
--    ["v12"]="Module:CroqueTest2/DV12",
--    ["v13"]="Module:CroqueTest2/DV13",
--    ["v14"]="Module:CroqueTest2/DV14",
--    ["v15"]="Module:CroqueTest2/DV15",   
--    ["v16"]="Module:CroqueTest2/DV16",
--    ["v17"]="Module:CroqueTest2/DV17",
--    ["v18"]="Module:CroqueTest2/DV18",
--    ["v19"]="Module:CroqueTest2/DV19",
--    ["v20"]="Module:CroqueTest2/DV20",
--    ["v21"]="Module:CroqueTest2/DV21",
    ["v22"]="Module:CroqueTest2/DV22",
}

local Datafiles={
    "Module:CroqueTest2/DV22",
--    "Module:CroqueTest2/DV21",
--    "Module:CroqueTest2/DV20",
--    "Module:CroqueTest2/DV19",
--    "Module:CroqueTest2/DV18",
--    "Module:CroqueTest2/DV17",
--    "Module:CroqueTest2/DV16",
--    "Module:CroqueTest2/DV15",
--    "Module:CroqueTest2/DV14",
--    "Module:CroqueTest2/DV13",
--    "Module:CroqueTest2/DV12",
--    "Module:CroqueTest2/DV11",
--    "Module:CroqueTest2/DV10",
--    "Module:CroqueTest2/DV9",
--    "Module:CroqueTest2/DV8",
--    "Module:CroqueTest2/DV7",
--    "Module:CroqueTest2/DV6",
}


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

function unescapePatch(line)
    local lineout
    lineout=string.gsub(line,"%%","")
    lineout=string.gsub(lineout,"PERZENTO","%%")
    lineout=string.gsub(lineout,"{{Icon|Item|Credits}}"," Cr." )
    lineout=string.gsub(lineout,"{{Icon|Item|Platinum}}"," Plat." )
    lineout=string.gsub(lineout,"{{Clr}}",'<div style="clear:both;"></div>' )
    lineout=string.gsub(lineout,"{{clr}}",'<div style="clear:both;"></div>' )
    --lineout=string.gsub(line,"%%[","[")
    --lineout=string.gsub(lineout,"%%'","'")
    --lineout=string.gsub(lineout,"%%http","http")
    return lineout
end

function unescapeUpdt(line)
    local lineout
    lineout=string.gsub(line,"%%","")
    lineout=string.gsub(lineout,"PERZENTO","%%")
    lineout=string.gsub(lineout,"{{Icon|Item|Credits}}","[[File:Credits64.png|x26px|link=Credits]]" )
    lineout=string.gsub(lineout,"{{Icon|Item|Platinum}}","[[File:Platinum64.png|x26px|link=Platinum]]" )
    lineout=string.gsub(lineout,"{{Clr}}",'<div style="clear:both;"></div>' )
    lineout=string.gsub(lineout,"{{clr}}",'<div style="clear:both;"></div>' )
    --lineout=string.gsub(line,"%%[","[")
    --lineout=string.gsub(lineout,"%%'","'")
    --lineout=string.gsub(lineout,"%%http","http")
    return lineout
end

function p.buildPatchHistory(frame)
    local Item = frame.args ~= nil and frame.args[1]
    -- mw.log(type(PatchData))
    local PatchData2={}
    
    local result=''
    local fields={"misc","additions","changes","fixes"} -- separate conclave for now
    local isTable=false
    local isTableStart=false
    local isTableend=false
    local isTableHeader=false
    for _, Datafile in ipairs(Datafiles) do
        PatchData2=mw.loadData( Datafile )
        for i, updt in ipairs(PatchData2) do
            local vers=updt["update number"]
            local gen=true
            for _, field in ipairs(fields) do   
                if (updt[field]~=nil) then
                    for ItemList, entries in pairs(updt[field]) do
                        --mw.log(ItemList)
                        for j, w in ipairs(entries.tags) do
                            --mw.log(w)
                            if (w==Item) then
                                if (gen) then
                                    local verslink=Version.getVersionLink(vers[1])
                                    result=result..verslink..'\n'
                                    gen=false -- genrate the version link only once per version
                                end
                                for k, line in ipairs(entries.text) do
                                    isTable=false
                                    isTableStart=false
                                    isTableend=false
                                    isTableHeader=false
                                    line=unescapePatch(line)
                                    --check if it is not a table
                                    for _, tag in ipairs(entries.tags) do 
                                        if(tag=="Table") then isTable=true end
                                        if(tag=="TableStart") then isTableStart=true end
                                        if(tag=="TableEnd") then isTableEnd=true end
                                        if(tag=="TableHeader") then isTableHeader=true end
                                    end
                                    if(isTable) then
                                        if(isTableStart) then
                                            result=result..'----\n<table style="width:100%">\n'
                                        elseif(isTableEnd) then
                                            result=result..'</table>\n----\n'
                                        elseif(isTableHeader) then
                                            line=string.gsub(line,"!}}%-(.-){{!","!}}-{{!")
                                            line=string.gsub(line,"{{!}}%-{{!!!}}",'<tr><th align="center">')
                                            line=string.gsub(line,"{{!!!}}",'</th><th align="center">')
                                            result=result..line..'  </th></tr>\n'
                                        else
                                            line=string.gsub(line,"!}}%-(.-){{!","!}}-{{!")
                                            line=string.gsub(line,"{{!}}%-{{!}}",'<tr><td align="center">')
                                            line=string.gsub(line,"{{!}}",'</td><td align="center">')
                                            result=result..line..'  </td></tr>\n'
                                        end
                                    else
                                        if(string.sub(line,1,1)~="*") then line="*"..line end
                                        result=result..line..'\n'
                                    end
                                end
                            end
                        end
                    end
                end
            end
        -- check conclave finally
            if (updt["conclave"]~=nil) then
                for ItemList, entries in pairs(updt["conclave"]) do
                    --mw.log(ItemList)
                    for j, w in ipairs(entries.tags) do
                        --mw.log(w)
                        if (w==Item) then
                            if (gen) then
                                local verslink=Version.getVersionLink(vers[1])
                                result=result..verslink..'\n'
                                gen=false -- genrate the version link only once per version
                            end
                            for k, line in ipairs(entries.text) do
                                line=unescapePatch(line)
                                if(string.sub(line,1,1)~="*") then line="*"..line end
                                if(string.sub(line,1,2)~="**") then
                                    line="*'''Conclave:'''"..string.sub(line,2)
                                end -- insert 'conclave' only if it is a single entry
                                result=result..line..'\n'
                            end
                        end
                    end
                end
            end
        end      
        PatchData2={}
    end
    
    -- result = result..'}}'

    --mw.log(result)

    return result

end

function p.buildUpdate(frame)
    local versions = frame.args ~= nil and frame.args[1]
    -- mw.log(type(PatchData))
    local PatchData2={}
    local Datafile=register1[versions]
    PatchData2=mw.loadData( Datafile )
    if(type(PatchData2)~= "table") then return "Error : no PatchData\n" end
    
    local result=''
    local fields={"misc","additions","changes","fixes","conclave","localizations"} -- separate conclave for now
    local isTable=false
    local isTableStart=false
    local isTableend=false
    local isTableHeader=false
    for i, updt in ipairs(PatchData2) do
        local verst=updt["update number"] or {"No version"}
        --local verslink=Version.getVersionLink(vers[1])
        local vers=verst[1]
        local vtypet=updt["type"] or {""}
        local vtype=vtypet[1]
        if (vtype=="" or vtype=="update") then vtype = "Update" end
        if (vtype=="fix" or vtype=="hotfix") then vtype = "Hotfix" end
        local vtitlet=updt["title"] or {""}
        local vtitle=vtitlet[1]
        if (vtitle ~= "") then vtitle="'' - "..unescapeUpdt(vtitle).."''" end
        result=result.."\n=="..vtype.." "..vers.."==\n"
        result=result.."<div class='mw-collapsible mw-collapsed'>\n"
        result=result..updt["date"][1].." ["..updt["forumurl"][1].." Forum Post]"..vtitle.."\n"
        result=result.."<div class='mw-collapsible-content'>\n"
        if(updt["image"]~=nil and updt["image"][1]~="") then
            --result=result.."[[File:"..updt["image"][1].."|660px|center]]<br/>"
        end
        
        for _, field in ipairs(fields) do   
            if (updt[field]~=nil) then
                if(field~="misc") then
                    result=result.."\n==="..string.gsub(field,"^%l", string.upper).."===\n"
                end
                
                for ItemList, entries in pairs(updt[field]) do
                    --mw.log(ItemList)
                    if(entries.tags[1]~="NOUPDATE") then
                        for k, line in ipairs(entries.text) do
                            isTable=false
                            isTableStart=false
                            isTableend=false
                            isTableHeader=false
                            line=unescapeUpdt(line)
                            --check if it is not a table
                            for _, tag in ipairs(entries.tags) do 
                                if(tag=="Table") then isTable=true end
                                if(tag=="TableStart") then isTableStart=true end
                                if(tag=="TableEnd") then isTableEnd=true end
                                if(tag=="TableHeader") then isTableHeader=true end
                            end
                            if(isTable) then
                                if(isTableStart) then
                                    line=string.gsub(line,"{{{!}}","")
                                    result=result..'<table'..line..'>\n'
                                elseif(isTableEnd) then
                                    result=result..'</table>\n'
                                elseif(isTableHeader) then
                                    aa, bb, rformat=string.find(line,"!}}%-(.-){{!")
                                    rformat=rformat or ""
                                    line=string.gsub(line,"!}}%-(.-){{!","!}}-{{!")
                                    line=string.gsub(line,"{{!}}%-{{!!!}}","<tr "..rformat.."><th>")
                                    line=string.gsub(line,"{{!!!}}","</th><th>")
                                    result=result..line..'</th></tr>\n'
                                else
                                    aa, bb, rformat=string.find(line,"!}}%-(.-){{!")
                                    rformat=rformat or ""
                                    line=string.gsub(line,"!}}%-(.-){{!","!}}-{{!")
                                    line=string.gsub(line,"{{!}}%-{{!}}","<tr "..rformat.."><td>")
                                    line=string.gsub(line,"{{!}}","</td><td>")
                                    result=result..line..'</td></tr>\n'
                                end
                            else
                                if(string.sub(line,1,1)~="*") then line="\n"..line end
                                result=result..line..'\n'
                            end
                        end
                    end
                end
            end
        end
        result=result.."</div></div><br/>"
    end      
    PatchData2={}
    
    -- result = "==trying Header==\n"..result..

    -- mw.log(result)

    return result

end

return p
