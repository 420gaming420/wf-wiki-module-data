---
title: "Module:Icon/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Icon/testcases"
wiki_timestamp: "2021-05-16T22:58:29Z"
---

false

---

```lua
local userError = require('Dev:User error');
local notEnoughArgs = userError('Not enough input arguments | $1');

return {
	_Item = {
		options = {
			mode = 'invocation',
		},
		tests = {
			{ 'Orokin Catalyst', '[[File:OrokinCatalyst64.png|x26|link=Orokin Catalyst]]' },
		},
	},
};
```

