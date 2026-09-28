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
local Delay = require([[Module:Delay]]);
local MaxData = mw.loadData([[Module:Maximization/data]]);
local WarframesData = Delay.mw.loadData([[Module:Warframes/data]]);
local p = {};

-- replaces/expands '{{#invoke:Tooltip}}' stubs from [[Module:Maximization/data]]
local function tooltipsub(stubs) return string.gsub(stubs, '{{#invoke:Tooltip|([^|]*)(|[^{}]*)}}', function(fun, argstr)
	local args = {};
	for arg in argstr:gmatch'|([^|]*)' do
		local key, value = arg:match'^([^=]*)=(.*)$';
		if key then
			local num = tonumber(key);
			table[num and (num % 1 == 0) and num or key] = value;
		else table.insert(args, arg); end
	end
	return Tooltips[fun](args);
end)end

local function normalize_outs(outs)
	if type(outs) == 'string' then return tooltipsub(outs); end
	if type(outs) ~= 'table' then
		error('normalize_outs(): expected string or table, got '..type(outs));
	end
	for key, value in pairs(outs) do
		if type(key) == 'string' and key ~= 'suff' then
			table.insert(outs, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
		end
	end
	return '<span '..table.concat(outs, ' ')..'></span>'..(outs.suff and tooltipsub(outs.suff) or '');
end

--- Creates a maximization calculator for a specific Warframe ability based on formulas in [[Module:Maximization/data]].
--  @function		p.ability
--	@alias			p.main
--  @param			{table} frame Frame object with the ability names as the arguments
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(...)
	local names = (...).args or {...};
	local single = not names[2]; -- if invoked >1 names, will put ability-specific ins under ability output blocks instead of the generic input block
	local single_prefix = single and '' or 'colspan=2 ';

	-- local ins = {};
	local existing_ins = {};
	local blocks = {};
	local posttexts = {};
	
for _, name in ipairs(names) do
	local data = MaxData[name];
	local block = {};

	if data and data.outs then
		for _, Output in ipairs(data.outs) do
			table.insert(block, '|'..normalize_outs(Output[1])..'||'..normalize_outs(Output[2]));
		end
	end
	-- do ins after outs to have the option to distribute them between output blocks
	local next_prefix = '| style="border-top:2px solid var(--wikitable-header-bg)" ';
	if data and data.ins then
		for _, Input in ipairs(data.ins) do
			if Input.name and existing_ins[Input.name] then--skip
			elseif type(Input) == 'table' then
				if Input.name then existing_ins[Input.name] = true end
				for key, value in pairs(Input) do
					if type(key) == 'string' and key ~= 'cont' then
						table.insert(Input, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
					end
				end
				table.insert(block, next_prefix..single_prefix
					..table.concat(Input, ' ')..'|'..tooltipsub(Input.cont));
				next_prefix = '|';
			else
				table.insert(block, next_prefix..single_prefix..Input);
				next_prefix = '|';
			end
		end
	end
	if data and data.post then
		table.insert(posttexts, '<div style="width: 100%">'..data.post..'</div>');
	end
	if not data then
		table.insert(posttexts, '<div style="width: 100%">'.."''Help create a maximization calculator for "
			..Tooltips.full(name, 'Ability').." and its augments by adding data to [[Module:Maximization/data]].''"
			..'</div>');
	end

	table.insert(blocks, '{| class="wikitable calc__block"\n|-\n!colspan=2|'
		..Tooltips.full(name, 'Ability')..'\n|-\n'..table.concat(block, '\n|-\n')..'\n|}');
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
	'',-- table.concat(ins, '\n|-\n'),
	table.concat(blocks, '\n'),
	table.concat(posttexts, '\n'),
nil)

	return max
end
p.main = p.ability;

-- checks for ability sets by owner name and calls p.ability() with related abilities, otherwise returns error text
function p.ability_set(...)
	local warframe_names = (...).args or {...};
	local ability_names = {};
	ability_names.args = ability_names;
	
	for _, name in ipairs(warframe_names) do
		local data = WarframesData.Warframes[name] and WarframesData.Warframes[name].Abilities
		or MaxData.AbilitySets[name];
		if data then
			for __, ability in ipairs(data) do table.insert(ability_names, ability); end
		else 
			return '<strong class="error scribunto-error">[[Module:Maximization|Maximization]] error: warframe abilities mapping for "'
			..tostring(name)..'" was not found in [[Module:Maximization#L-16|AbilitySets]].</strong>[[Category:Pages with script errors]][[Category:Pages with maximization errors]]';
		end
	end
	return p.ability(ability_names);
end

-- TODO: Helminth original abilities
-- TODO: Warframe stats
-- TODO: gear like Archwings, cornbots, hoverboards
-- TODO: craftable combo gear like kitguns, amps
-- TODO: weapons and Arch-weapons
-- TODO: enemies

function p._exists(name) return MaxData[name] and true or false end

return p
