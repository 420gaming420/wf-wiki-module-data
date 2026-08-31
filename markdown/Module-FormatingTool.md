---
title: "Module:FormatingTool"
wiki_url: "https://wiki.warframe.com/w/Module/FormatingTool"
wiki_timestamp: "2021-05-07T07:55:31Z"
---

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • M:FormatingTool • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

---

```lua
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
        result=result..name..'  
'
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
    local ta='    '
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
                res=res..','..value..'},  
'
            else
                res=res..'},  
'
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
--        result=result..'  
'..levels[i]..'  
'
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
                result=result..'"Ghoul Bounty",  
'
            elseif(string.find(levels[i],"Cetus")) then
                result=result..'"Cetus Bounty",  
'
            elseif(string.find(levels[i],"Vallis")) then
                result=result..'"Orb Vallis Bounty",  
'     
            elseif(string.find(levels[i],"Vallis")) then
                result=result..'"Cambion Drift Bounty",  
'    
            else --should not happen
                result=result..'"Bounty",  
'
            end
            result=result..tata..'Tier = "'..tier..'-'..kstr1..'",  
'
            result=result..tata..'Name = "'..tier..', '..stages[k]..'",  
'
            if(string.find(levels[i],"Ghoul")) then
                result=result..tata..'Alias = "GhoulBounty'..(i-5)..'-'..kstr1..'",  
'
            elseif(string.find(levels[i],"Cetus")) then
                result=result..tata..'Alias = "CetusBounty'..(i)..'-'..kstr1..'",  
'
            elseif(string.find(levels[i],"Vallis")) then
                result=result..tata..'Alias = "OrbVallisBounty'..(i-7)..'-'..kstr1..'",  
'    
            else --should not happen
                result=result..tata..'Alias = "Bounty'..i..'-'..kstr1..'",  
'
            end
            result=result..tata..'ShortName = "'..tier..'",  
'
            if(k~=3) then
                result=result..tata..'Ignore = true,  
'
                -- put ignore=true to all stages where not all drops are present
            end
            result=result..tata..'Rewards = {  
'
            if(Hypertable[i]["A"]~=nil)then
                result=result..tatata..'["A"] = {  
'
                for j, rotlevel in ipairs(Hypertable[i]["A"][k]) do
                    result=result..Hypertable[i]["A"][k][j]
                end
                result=result..tatata..'},  
'
            end
            if(Hypertable[i]["B"]~=nil)then
                result=result..tatata..'["B"] = {  
'
                for j, rotlevel in ipairs(Hypertable[i]["B"][k]) do
                    result=result..Hypertable[i]["B"][k][j]
                end
                result=result..tatata..'},  
'
            end
            if(Hypertable[i]["C"]~=nil)then
                result=result..tatata..'["C"] = {  
'
                for j, rotlevel in ipairs(Hypertable[i]["C"][k]) do
                    result=result..Hypertable[i]["C"][k][j]
                end
                result=result..tatata..'},  
' -- end of rotation
            end
            result=result..tata..'  '..'},  
' --end of rewards
            result=result..tata..'},  
' -- end of bounty
        end
        
    end        

        
--   mw.log(result)
    return result
end

--  for missions
function p.formatMFS(frame)
 
    local result=''
    local ta='    '
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
                res=res..tatata..'},  
'..tatata..'["'..rot..'"] = {  
'
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
                    res=res..','..value..'},  
'
                else
                    res=res..'},  
'
                end
                --result=result..res
                
                
                
            end
            if(string.match(MFS[i+1],"/")~=nil) then
                res=res..tatata..'},  
'
                Hypertable[localkey]=res
                printthat=false
            end
        else
            for num, keystring in ipairs(missionlist) do
                
                if (string.find(line,keystring[2])~=nil and string.find(line,"Event")==nil) then
                    --mw.log(key)
                    --result=result..'  
'..key..'  
'
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
            
            result=result..'  
'..keystring[1]..' (taken from : '..keystring[2]..')  
'..Hypertable[keystring[1]]
        else
            result=result..'  
'..keystring[1]..' (taken from : '..keystring[2]..')  
'..'NO RESULT'    
        end
        

    end
    --for key, keystring in pairs(missionlist) do mw.log(keystring) end
    --mw.log(result)
    return result
end
 
return p
```

