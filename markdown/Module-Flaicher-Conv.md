---
title: "Module:Flaicher/Conv"
wiki_url: "https://wiki.warframe.com/w/Module/Flaicher/Conv"
wiki_timestamp: "2018-11-20T17:36:56Z"
---

*Documentation for this module may be created at [Module:Flaicher/Conv/doc](/w/Module:Flaicher/Conv/doc?action=edit&redlink=1 "Module:Flaicher/Conv/doc (page does not exist)")*

```lua
--for converting the drop tables provided by DE to lua table

local p = {}

local dropData = mw.loadData('Module:Flaicher/Conv/data')
local Shared = require('Module:Shared')

--[[local function sFind(line)
    local finding = string.match(line, "%((%D-)%)")
    if finding ~= nil and finding ~= "Radiant" then
        return finding
    end
end--]]

local function sgMatch(line, pattern, ignore)
    if pattern == nil or not pattern then
        pattern = "%((%D-)%)"
    end
    
    local findings = {}
    for finding in string.gmatch(line, pattern) do
        if not ignore then
            if finding ~= "Radiant" and finding ~= "Variant" and finding ~= "Large" and finding ~= "Low Risk" and finding ~= "Medium Risk" and finding ~= "High Risk" then
                table.insert(findings, finding)
            end
        else
            table.insert(findings, finding)
        end
    end
    return findings
end

--[[
function p.buildMissionTable()
    local missions = {}
    for n, line in pairs(dropData["Missions"]) do
        local foundMission = sgMatch(line, "%((%D-)%)")
        if foundMission[1] then
            
--]]

function p.missionTest()
    local missionCount = 0
    local prevStart = nil
    local prevMission = nil
    for n, line in pairs(dropData["Missions"]) do
        --last mission is missing with this code
        local findings = sgMatch(line)
        if findings[1] then
            missionCount = missionCount + 1
            --[[for n2, m in pairs(findings) do
                mw.log(n,m,n2)
            end--]]
            if prevStart ~= nil and prevMission ~= nil then
                mw.log(prevStart,(n-1),prevMission)
            end
            prevStart = n
            prevMission = findings[1]
        end
        
    end
    mw.log(missionCount)
end

function p.missionUniqueTest()
    local missions = {}
    local missionCount = 0
    local missionCount2 = 0
    for n, line in pairs(dropData["Missions"]) do
        local findings = sgMatch(line,false)
        if findings[1] then
            missionCount = missionCount + 1
            for n2, m in pairs(findings) do
                missionCount2 = missionCount2 + 1
                if (missions[m] == nil) then
                    missions[m] = {}
                    table.insert(missions[m], "true")
                end
            end
        end
    end
    local missionCount3 = 0
    local tempTable ={}
    for s, mission in pairs(missions) do
        missionCount3 = missionCount3 + 1
        table.insert(tempTable, s)
    end
    table.sort(tempTable)
    local returnText = table.concat(tempTable, "\n")
    mw.log("mCount",missionCount,"mCount2",missionCount2,"mCount3",missionCount3)
    return returnText
end

function p.dropChanceTest(limit)
    local dropCount = 0
    for n, line in pairs(dropData["Missions"]) do
        
        local findings = sgMatch(line, "%((%d-%.%d-)%%%)")
        if findings[1] then
            dropCount = dropCount + 1
            for n2, m in pairs(findings) do
                mw.log(n,m)
            end
        end
        if limit ~= nil then
            if n >= limit then
                break
            end
        end
    end
    mw.log(dropCount)
end

function p.rotationTest()
    local rotCount = 0
    for n, line in pairs(dropData["Missions"]) do
        
        local findings = sgMatch(line, "(Rotation%s%a)")
        if findings[1] then
            rotCount = rotCount + 1
            for n2, m in pairs(findings) do
                mw.log(n,m)
            end
        end
        if limit ~= nil then
            if n >= limit then
                break
            end
        end
    end
    mw.log(rotCount)
end

return p
```

