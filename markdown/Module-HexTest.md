---
title: "Module:HexTest"
wiki_url: "https://wiki.warframe.com/w/Module/HexTest"
wiki_timestamp: "2020-12-22T03:13:57Z"
---

*Documentation for this module may be created at [Module:HexTest/doc](/w/Module:HexTest/doc?action=edit&redlink=1 "Module:HexTest/doc (page does not exist)")*

```lua
local p = {}

local CodexData = mw.loadData('Module:HexTest/data')

function p.CodexGrid(frame)
    local codex = frame.args[1]
    local section = frame.args[2]
    local start = frame.args[3]
    local finish = frame.args[4]

	return p._CodexGrid(codex, section, start, finish)
end

function p._CodexGrid(codex, section, start, finish)
	local rv = ""
	local inrange = true
	if start ~= nil then
		inrange = false
	end
	for _, entry in ipairs(CodexData[codex]) do
		if entry.name ~= nil then
			if not inrange and entry.name >= start then
				inrange = true
			end
			if inrange and finish ~= nil and string.sub(entry.name, 1, 1) > finish then
				break
			end
		end
		if (inrange and (section == "All" or entry.section == section)) then
			rv = rv..p._GenerateEntryMarkup(entry)
		end
	end
	return rv
end

function p._GenerateEntryMarkup(entry)
	local name = entry.name
	local eximus = false
	if name ~= nil and name:find('Eximus') ~= nil then
		name = name:gsub(' Eximus', '')
		eximus = true
	end
	local rv = '

if entry.flipimage == true then
		rv = rv..' style="transform:scaleX(-1);"'
	end
	rv = rv..'>[[File:'
	if entry.image ~= nil then
		rv = rv..entry.image
	else
		rv = rv..'Placeholder.png'
	end
	rv = rv..'|109x109px|link='
	if entry.link ~= nil then
		rv = rv..entry.link
	elseif name ~=nil then
		rv = rv..name
	end
	rv = rv..']]

'
	if name ~= nil then
		rv = rv..'[['
		if entry.link ~= nil then
			rv = rv..entry.link
		else
			rv = rv..name
		end
		rv = rv..'|'..name..']]'
	end
	if eximus == true then
		rv = rv..' [[Eximus|Eximus]]'
	end
	if entry.caption ~= nil then
		rv = rv..' ('..entry.caption..')'
	end
	rv = rv..'
```

\n'
 return rv
end
return p

