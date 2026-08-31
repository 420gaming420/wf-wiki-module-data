---
title: "Module:RemoveCategory"
wiki_url: "https://wiki.warframe.com/w/Module/RemoveCategory"
wiki_timestamp: "2021-06-10T17:34:07Z"
---

Removes categories of content passed in as a parameter. Usage:

```lua
{{#invoke:RemoveCategory|rem|}}
```

---

```lua
return {
	rep = function(frame) 
		return (frame.args[1]:gsub('%[%[Category:','[[:Category:'))
	end,
	rem = function(frame)
		return (frame.args[1]:gsub('%[%[Category:.-]]',''))
	end
}
```

