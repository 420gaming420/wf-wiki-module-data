p,q = {}, {
    -- 'Table Name'
    'Relics',
    'Cetus Bounties',
    'Fortuna Bounties',
    'Necralisk Bounties',
    'Sorties',
    --'Missions',--massive
    'Transient',
}
--[[
https://github.com/WFCD/warframe-drop-data/tree/gh-pages/data

additionalItemByAvatar.json
all.json
all.slim.json
blueprintLocations.json
cetusBountyRewards.json --
deimosRewards.json --
enemyBlueprintTables.json
enemyModTables.json
info.json
keyRewards.json
miscItems.json
missionRewards.json --
modLocations.json
relics.json --
resourceByAvatar.json
sigilByAvatar.json
solarisBountyRewards.json --
sortieRewards.json --
transientRewards.json
]]
for i,v in pairs(q) do
    p[v] = mw.text.jsonDecode(require('Module:DropTables/JSON/'..v))
    --p[v]['#']=#p[v]
    --p[i]=nil
end
--traverse lists here, not in other modules. This will only be run once.

return p
