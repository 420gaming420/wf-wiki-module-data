---
title: "Module:Flaicher"
wiki_url: "https://wiki.warframe.com/w/Module/Flaicher"
wiki_timestamp: "2023-10-31T22:23:17Z"
---

*Documentation for this module may be created at [Module:Flaicher/doc](/w/Module:Flaicher/doc?action=edit&redlink=1 "Module:Flaicher/doc (page does not exist)")*

```lua
local p ={}

local Tooltips = require [[Module:Tooltips]]

--[[function p.test(modname)
	return Tooltips.full(modname,"Mods")
end

function p.testList(tableOfMods)
	mw.log(type(tableOfMods))
	for n,modName in tableOfMods do
		mw.log(n)
		mw.log(modName)
	end
end--]]

function p.getTable(frame)
	local title = frame.args and frame.args.title or nil
	mw.log(title)
end

function p.regextest()
	local testString = "{{M|Sonic Fracture}} • {{M|Resonance}} • {{M|Savage Silence}} • {{M|Resonating Quake}} • {{WF|Banshee}}"
	local found = mw.ustring.gmatch(testString, "{{([%a]+)|([%a%s]+)}}" )
	--mw.log(found)
	for typ,nam in found do
		mw.log(typ,nam)
		if typ == "M" then
			mw.log(Tooltips.full(nam,"Mods"))
		elseif typ == "WF" then
			mw.log(Tooltips.full(nam,"Warframes"))
		end
		
	end
end

function p.regextest2(testString)
	if testString == nil or testString == '' then
		testString = "WF_Ash_+Ashhere+ (M_Galvanized Scope_+Galvanized+) • M_Critical Delay_ • M_Point Strike_ • M_Proton Jet_"
	end
	local function replString(typ,nam,replaceName)
		--mw.log(replaceName)
		if typ == "M" then
			return Tooltips.full{nam,"Mods",r=replaceName}
		elseif typ == "WF" then
			return Tooltips.full{nam,"Warframes",r=replaceName}
		end
	end
	local found = mw.ustring.gsub(testString, "([%a]+)_([%a%s'&-]+)_%+([%a%s'&-]+)%+", replString )
	found = mw.ustring.gsub(found, "([%a]+)_([%a%s'&-]+)_", replString )
	--mw.log(found)
	return found
end

function p.regextest4(frame)
	local testStrin = frame.args ~= nil and frame.args[1] or frame
	return p.regextest2(testStrin)
end

function p.regextest3(frame)
	local testString = frame.args ~= nil and frame.args[1] or frame
	local function replString(typ,nam)
		if typ == "M" then
			return Tooltips.full(nam,"Mods")
		elseif typ == "WF" then
			return Tooltips.full(nam,"Warframes")
		end
	end
	local found = mw.ustring.gsub(testString, "{{([%a]+)|([%a%s]+)}}", replString )
	--mw.log(found)
	return found
end

return p
```

