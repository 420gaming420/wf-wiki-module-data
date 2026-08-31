---
title: "Module:VideoGallery"
wiki_url: "https://wiki.warframe.com/w/Module/VideoGallery"
wiki_timestamp: "2025-01-31T14:44:45Z"
---

*Documentation for this module may be created at [Module:VideoGallery/doc](/w/Module:VideoGallery/doc?action=edit&redlink=1 "Module:VideoGallery/doc (page does not exist)")*

```lua
local p = {}

function p.main(frame)
	local out = {
		'

'
	}
	for k,v in ipairs(frame:getParent().args) do
		if string.find(v, '%S') then
			table.insert(out, v)
		end
	end
	table.insert(out, '

')
	return table.concat(out, '\n')
end

return p
```

