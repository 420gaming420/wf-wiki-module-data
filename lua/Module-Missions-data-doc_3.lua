local MissionData = mw.loadData('Module:Missions/data')

-- Find all nodes with the Interception mission type (i.e. Type = "Interception")
-- Note that all values from MissionData.by.Key.["SearchTerm"] will be table types
MissionData.by.Type["Interception"]

-- Equivalent to:
local interceptionNodes = {}
for name, nodeEntry in pairs(MissionData.MissionDetails) do
    if (nodeEntry.Type == "Interception") then
        table.insert(interceptionNodes, nodeEntry)
    end
end

-- Find all nodes with the name "Hydron" (i.e. Name = "Hydron")
MissionData.by.Name["Hydron"]
