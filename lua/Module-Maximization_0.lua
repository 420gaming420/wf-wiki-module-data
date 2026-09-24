--- '''Maximization''' creates a stat maximization calculator for Warframe abilities.<br/>
--	
--  @module		maximization
--  @alias		p
--  @author		[[User:DANser|DANser]]
--	@author		[[User:Gigamicro|Gigamicro]]
--  @image		BlindRageMod.png
--	@require	[[Module:Maximization/data]]
--	@require	[[Module:Tooltips]]
--  @release	stable
--  

local Tooltips = require([[Module:Tooltips]]);
local MaxData = mw.loadData([[Module:Maximization/data]]);
local p = {};

-- replaces/expands '{{#invoke:Tooltip}}' stubs from [[Module:Maximization/data]]
local function tooltipsub(stub) return string.gsub(stub, '{{#invoke:Tooltip|([^|]*)(|[^{}]*)}}',
	function(fun, String)
		local args = {};
		for arg in String:gmatch'|([^|]*)' do
			local key, value = arg:match'^([^=]*)=(.*)$';
			if key then
				local num = tonumber(key);
				table[num and (num % 1 == 0) and num or key] = value;
			else table.insert(args, arg); end
		end
	return Tooltips[fun](args);
end)end

local function normalize_outs(Output)
	if type(Output) == 'string' then return tooltipsub(Output); end
	if type(Output) == 'table' then
		local suff = Output.suff;
		for key, value in pairs(Output) do
			if type(key) == 'string' and key ~= 'suff' then
				table.insert(Output, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
			end
		end
		return '<span '..table.concat(Output, ' ')..'></span>'..(suff and tooltipsub(suff) or '');
	end
	error('normalize(): expected string or table, got '..type(Output));
end

--- Creates a maximization calculator for a specific Warframe ability based on formulas in [[Module:Maximization/data]].
--  @function		p.ability
--	@alias			p.main
--  @param			{table} frame Frame object with the ability names as the arguments
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(...)
	local names = (...).args or {...};
	local ins = {};
	local visited_ins = {};
	local output_tables = {};
	local posts = {};
	local invoked_single_name = not names[2]; -- if invoked >1 names, will put ability-specific ins under ability output blocks instead of the generic input block
	
for _, name in ipairs(names) do
	local data = MaxData[name];
	local next_prefix = '| style="border-top:2px solid var(--wikitable-header-bg)" ';
	local outs = {};

	if (data) then
		if data.outs then
			for _, Output in ipairs(data.outs) do
				table.insert(outs, '|'..normalize_outs(Output[1])..'||'..normalize_outs(Output[2]));
			end
		end
		-- do ins after outs to have the option to distribute them between output blocks
		if data.ins then
			for _, Input in ipairs(data.ins) do
				if Input.name and visited_ins[Input.name] then--skip
				elseif type(Input) == 'table' then
					local cont = Input.cont or '';
					for key, value in pairs(Input) do
						if type(key) == 'string' and key ~= 'cont' then
							table.insert(Input, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
						end
					end
					visited_ins[Input.name or ''] = true;
					if invoked_single_name then
						table.insert(ins, next_prefix..table.concat(Input, ' ')..'|'..tooltipsub(cont));
					else 
						table.insert(outs, next_prefix..'colspan=2 '..table.concat(Input, ' ')..'|'..tooltipsub(cont));
					end
					next_prefix = '|';
				else 
					if invoked_single_name then
						table.insert(ins, next_prefix..Input);
					else 
						table.insert(outs, next_prefix..'colspan=2 '..Input);
					end 
					next_prefix = '|';
				end
			end
		end
		if data.post then table.insert(posts, '<div style="width: 100%">'..data.post..'</div>'); end
	else--if no data, show a note
		table.insert(posts, '<div style="width: 100%">'.."''Help create a maximization calculator for "
			..Tooltips.full(name, 'Ability').." and its augments by adding data to [[Module:Maximization/data]].''"..'</div>');
	end
	table.insert(output_tables, '{| class="wikitable calc__block"\n|-\n!colspan=2|'
		..Tooltips.full(name, 'Ability')..'\n|-\n'..table.concat(outs, '\n|-\n')..'\n|}');
end

--[[
	https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context 
	adding a wrapper with "display: flow-root" to fit nicely with random elements on the page (stop it from taking 100% of the page)
]]--
	local max = ([=[
<div style="display: flow-root"><div class="js-calc calc__container" data-style-number="max-width: 8ch">
{| class="wikitable calc__block"
!Inputs
|-
|data-name="STR" data-value="100"|%s:
|-
|data-name="DUR" data-value="100"|%s:
|-
|data-name="RNG" data-value="100"|%s:
|-
|data-name="EFF" data-value="100"|%s:<!--
--><span style="display:none" data-name=COST data-expr="200 EFF - 25 max as%%"></span><!--
--><span style="display:none" data-name=DRAIN data-expr="200 EFF - DUR / 25 max as%%"></span>
|-
%s
|}
%s
%s</div></div>]=]):format(
	Tooltips.full{'Ability Strength', 'Stats', r='Strength'},
	Tooltips.full{'Ability Duration', 'Stats', r='Duration'},
	Tooltips.full{'Ability Range', 'Stats', r='Range'},
	Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'},
	table.concat(ins, '\n|-\n'),
	table.concat(output_tables, '\n'),
	table.concat(posts, '\n'),
nil)

	return max
end

p.main = p.ability;

-- checks for a warframe mapping and calls p.ability() with related abilities, otherwise returns error text
function p.WarframeAbilities(...)
	local warframe_names = (...).args or {...};
	local ability_names = {};
	ability_names.args = ability_names;
	
	for _, name in ipairs(warframe_names) do
		local data = MaxData.Warframe[name];
		if data then
			for __, ability in ipairs(data) do table.insert(ability_names, ability); end
		else 
			return '<strong class="error scribunto-error">[[Module:Maximization|Maximization]] error: warframe abilities mapping for "'
			..tostring(name)..'" was not found in [[Module:Maximization/data]].</strong>[[Category:Pages with script errors]][[Category:Pages with maximization errors]]';
		end
	end
	return p.ability(ability_names);
end

function p._exists(name) return MaxData[name] and true or false end

return p
