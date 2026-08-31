---
title: "Module:ScientiaTest"
wiki_url: "https://wiki.warframe.com/w/Module/ScientiaTest"
wiki_timestamp: "2021-11-06T02:54:12Z"
---

**Lua error: bad argument #1 to 'mw.loadJsonData' ('W:c:User:Cephalon Scientia/general-i18n.json' is not a valid JSON page).**

---

```lua
local p = {}

local I18n = require('Module:I18n').loadMessages('w:c:User:Cephalon Scientia/general-i18n.json'):useUserLang()

function p.test()
	return I18n:msg( { key = 'rarity' } )
end

return p
```

