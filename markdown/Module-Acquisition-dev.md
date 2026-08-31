---
title: "Module:Acquisition/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Acquisition/dev"
wiki_timestamp: "2021-11-19T02:03:08Z"
---

*Documentation for this module may be created at [Module:Acquisition/dev/doc](/w/Module:Acquisition/dev/doc?action=edit&redlink=1 "Module:Acquisition/dev/doc (page does not exist)")*

```lua
--- '''Acquisition''' builds the acquisition table for Warframes, Weapons, 
--  and Arcanes.
--  
--  Acquisition can be invoked directly (`{{#invoke:Acquisition|buildTable|...}}`) 
--  or invoked from a template (`{{Acquisition|...}}`)
--  
--  On this Wiki, Acquisition is used in:
--  * [[Template:Acquisition]]
--  
--  @module		acquisition
--  @alias		p
--  @author		[[User:FINNER|FINNER]]
--  @image		AcquisitionPic.PNG
--  @require	[[Module:Acquisition/data]]
--  @require	[[Module:Icon]]
--  @require	[[Module:Math]]
--  @require	[[Module:String]]
--	@require	[[Module:Lua]]
--  @require	[[w:c:dev:Module:Entrypoint|Module:Entrypoint]]
--  @require	[[w:c:dev:Module:User error|Module:User error]]
--  @release	stable
--  
local p = {};

--  Module dependencies  -------------------------------------------------------
local Data = mw.loadData([[Module:Acquisition/data]]);
local Icon = require([[Module:Icon]]);
local Math = require([[Module:Math]]);
local String = require([[Module:String]]);
local Lua = require([[Module:Lua]]);
local Entry = require('Dev:Entrypoint');
local Error = require('Dev:User error');

-- Local functions  ------------------------------------------------------------

---	Builds wikitable showcasing drop rates of items and their parts and the expected
--	number of runs to get them.
--	@function		buildItemTable
--	@param			{string} itemName
--	@returns		{string} Resultant wikitext of wikitable
local function buildItemTable(itemName)
    local itemData = Data[itemName];
    if itemData == nil or itemName == nil then
        return Error('Item "'..itemName..'" not found or may have an error in [[Module:Acquisition/data]][[Category:Broken Acquisition]]')
    end
    
    local result = { '{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left"' };
    
	table.insert(result, [[|-
! style="width: 27.5%;" | Source
! style="text-align:center" | Chance
! style="text-align:center" | Expected
! style="text-align:center" | Nearly Guaranteed
|-]]);
    
    for i, v in ipairs(itemData) do
        local partCount = 0;
        local dropChances = {};
        local dropParts = {};
        for j, w in ipairs(v) do
            partCount = partCount + 1;
            dropChances[partCount] = w.Chance;
            dropParts[partCount] = w.Mission or w.Part;
        end
    
        for j = 1, partCount do
            local part = dropParts[j];
            for k = 1, partCount do
                if dropParts[k] == part and k ~= j then
                    dropChances[j] = dropChances[j] + dropChances[k];
                    dropChances[k] = 0;
                    dropParts[k] = nil;
                end
            end
        end
    
        for j, w in ipairs(v) do
        	-- Use Mission for items like Forma else use Part for items that 
        	-- are crafted from multiple parts that rewarded from drop table(s)
            table.insert(result, '| '..(w.Mission or w.Part)..((w.Desc ~= nil and w.Desc ~= '') and '  
('..w.Desc..')' or ''));
            table.insert(result, '| style="text-align:center" | '..Math.round(w.Chance, 0.001, true, false)..'%');
            
            if j == 1 then
                local unit = '';
                
                if w.Unit ~= nil and w.Unit ~= '' then
                    unit = w.Unit;
                end
                
                table.insert(result, '| rowspan='..partCount..' style="text-align:center" | '..Math.ex(dropChances)..' '..unit);
                table.insert(result, '| rowspan='..partCount..' style="text-align:center" | '..Math.ng(dropChances)..' '..unit);
            end
        	
            table.insert(result, '|-');
        end
    end
    table.insert(result, '|}');
    
    return table.concat(result, '\n');
end
--  Member functions  ----------------------------------------------------------

--- Builds the acquisition table
--  @function		p.buildTable
--  @param			{table} frame The item name and if it's prime, or if it's a forma
--  @return			{string} HTML table
function p.buildTable(...)
	local args = Lua.getArgs({...});
    if args["Forma"] == nil or args["Forma"] == '' then
        if args["Prime"] == nil or args["Prime"] == '' then
            return buildItemTable(args["Name"]);
		end
    elseif string.upper(args["Forma"]) == "MISSIONS" then
        return buildItemTable('Forma Blueprint');
    else
        return buildItemTable('Forma');
    end
end

p.__main = Entry(p);
return p;
```

