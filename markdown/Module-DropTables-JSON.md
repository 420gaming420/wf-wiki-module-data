---
title: "Module:DropTables/JSON"
wiki_url: "https://wiki.warframe.com/w/Module/DropTables/JSON"
wiki_timestamp: "2020-11-01T23:25:58Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:DropTables/JSON?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

Instead of storing JSON data in Lua tables, put them in on a page outside of Module namespace with a JSON content model like [NightwaveActs.json](/w/NightwaveActs.json "NightwaveActs.json"). You can parse JSON data with mw.loadJsonData() in these Lua modules.

This module is a WIP, but eventually it'll (hopefully) be able to replace the clunky manual drop tables!

Data from [here](https://github.com/WFCD/warframe-drop-data/tree/gh-pages/data)

* [DropTables/JSON/Cetus Bounties](/w/Module:DropTables/JSON/Cetus_Bounties "Module:DropTables/JSON/Cetus Bounties")
* [DropTables/JSON/Fortuna Bounties](/w/Module:DropTables/JSON/Fortuna_Bounties "Module:DropTables/JSON/Fortuna Bounties")
* [DropTables/JSON/Missions](/w/Module:DropTables/JSON/Missions "Module:DropTables/JSON/Missions")
* [DropTables/JSON/Necralisk Bounties](/w/Module:DropTables/JSON/Necralisk_Bounties "Module:DropTables/JSON/Necralisk Bounties")
* [DropTables/JSON/Relics](/w/Module:DropTables/JSON/Relics "Module:DropTables/JSON/Relics")
* [DropTables/JSON/Sorties](/w/Module:DropTables/JSON/Sorties "Module:DropTables/JSON/Sorties")
* [DropTables/JSON/Transient](/w/Module:DropTables/JSON/Transient "Module:DropTables/JSON/Transient")
* [DropTables/JSON/doc](/w/Module:DropTables/JSON/doc "Module:DropTables/JSON/doc")
* [DropTables/JSON/slim](/w/Module:DropTables/JSON/slim "Module:DropTables/JSON/slim")

---

```lua
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
```

