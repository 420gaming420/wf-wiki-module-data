---
title: "Module:Mods/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Mods/testcases"
wiki_timestamp: "2021-08-06T00:02:13Z"
---

false

---

```lua
local userError = require('Dev:User error')
local notEnoughArg = '$1: Not enough arguments'

return {
	getValue = {
		options = {
			mode = 'invocation',
		},
		tests = {
			{ nil, (notEnoughArg:gsub('$1', 'getValue(modName, valName)')) },
			{ '', (notEnoughArg:gsub('$1', 'getValue(modName, valName)')) },
			{ 'Serration', (notEnoughArg:gsub('$1', 'getValue(modName, valName)')) },
			{ 'Serration|Rarity', 'Uncommon' },
			{ 'Serration|rarity', 'Uncommon' },
			{ 'Serration|RARITY', 'Uncommon' },
			{ 'Serration|MaxRank', '10' },
			{ 'Serration|Incompatible', '[[Amalgam Serration]], [[Flawed Serration]]' },
			{ 'Serration|Transmutable', 'true' },
			{ 'Serration|Introduced', '[[Closed Beta Updates#Vanilla|Vanilla]]'},
			{ 'Serration|Placeholder', 'Unknown argument' },
		},
	}
}
```

