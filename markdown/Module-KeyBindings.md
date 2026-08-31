---
title: "Module:KeyBindings"
wiki_url: "https://wiki.warframe.com/w/Module/KeyBindings"
wiki_timestamp: "2021-08-02T05:01:21Z"
---

*Documentation for this module may be created at [Module:KeyBindings/doc](/w/Module:KeyBindings/doc?action=edit&redlink=1 "Module:KeyBindings/doc (page does not exist)")*

```lua
---	'''KeyBindings''' maps default PC keybindings to keybindings in other platforms.  

--	To be used with Template:Key
--	
--	On this Wiki, KeyBindings is used in:
--	
--	
--	@module		keybindings
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:KeyBindings/data]]
--	@release	stable
--	

local p = {}

local KeyBindingsData = mw.loadData [[Module:KeyBindings/data]]

---	Returns the appropriate console keybinding equivalent for a PC keybinding.
--	@function		p.getKeybinding
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of keybinding
function p.getKeybinding(frame)
    local key = frame.args ~= nil and frame.args[1] or frame
    local platform = frame.args ~= nil and frame.args[2] or frame

    return KeyBindingsData[key][platform]
end

return p
```

