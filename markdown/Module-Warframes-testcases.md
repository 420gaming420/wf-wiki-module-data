---
title: "Module:Warframes/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Warframes/testcases"
wiki_timestamp: "2021-03-24T01:41:24Z"
---

*Documentation for this module may be created at [Module:Warframes/testcases/doc](/w/Module:Warframes/testcases/doc?action=edit&redlink=1 "Module:Warframes/testcases/doc (page does not exist)")*

```lua
local userError = require('Dev:User error');
local missingOperand1 = userError('Must provide a numeric value to $1');
local missingOperand2 = userError('Must provide a second numeric value to $1');
local missingOperand3 = userError('Must provide a third numeric value to $1');
local missingOperand4 = userError('Must provide numeric values to $1');

return {
	getWarframeCount = {
		options = {
			mode = 'method',
			preprocess = true
		},
		tests = {
		},
	},
};
```

