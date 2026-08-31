---
title: "Module:MyCodex"
wiki_url: "https://wiki.warframe.com/w/Module/MyCodex"
wiki_timestamp: "2026-08-17T03:40:37Z"
---

*Documentation for this module may be created at [Module:MyCodex/doc](/w/Module:MyCodex/doc?action=edit&redlink=1 "Module:MyCodex/doc (page does not exist)")*

```lua
local p = {}

function p.Table(frame)
	local rv = '{| class="wikitable" style="width:100%; text-align:center; vertical-align:middle;"\n'
	rv = rv .. '! style="width:20%;" | Name\n'
	rv = rv .. '! style="width:20%;" | Picture\n'
	rv = rv .. '! style="width:60%;" | Description\n'

	local args = {}

	-- Collect all numbered arguments in order
	for i, value in pairs(frame.args) do
		if tonumber(i) then
			args[tonumber(i)] = mw.text.trim(value)
		end
	end

	-- Create one table row for every three arguments
	local i = 1

	while args[i] do
		local name = args[i]
		local image = args[i + 1] or ""
		local description = args[i + 2] or ""

		if name ~= "" then
			rv = rv .. '|-\n'

			-- Name
			rv = rv .. '| style="font-weight:bold;" | ' .. name .. '\n'

			-- Image
			rv = rv .. '| '
			if image ~= "" then
				rv = rv .. '[[File:' .. image .. '|150px]]'
			else
				rv = rv .. 'No image'
			end
			rv = rv .. '\n'

			-- Description
			rv = rv .. '| style="text-align:left; vertical-align:top; padding:10px;" | '
			rv = rv .. description .. '\n'
		end

		i = i + 3
	end

	rv = rv .. '|}'

	return rv
end

function p.Main(frame)

	return [[

Objects=
Objects content goes here.

|-|

Enemies=
Enemies content goes here.

]]

end

return p
```

