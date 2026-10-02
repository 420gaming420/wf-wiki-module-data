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

--- make a data-* span from a table, or passthrough a string
local function normalize_out(out)
	if type(out) == 'string' then return tooltipsub(out); end
	if type(out) ~= 'table' then
		error('normalize_out(): expected string or table, got '..type(out));
	end
	for key, value in pairs(out) do
		if type(key) == 'string' and key ~= 'suff' then
			table.insert(out, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
		end
	end
	return '<span '..table.concat(out, ' ')..'></span>'..(out.suff and tooltipsub(out.suff) or '');
end

--- Creates a maximization calculator for a specific Warframe ability based on formulas in [[Module:Maximization/data]].
--  @function		p.ability
--	@alias			p.main
--  @param			{table} frame Frame object with the ability names as the arguments
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(...)
	local names = (...).args or {...};
	local single = not names[2]; -- if invoked >1 names, will put ability-specific ins under ability output blocks instead of the generic input block
	local colspan = single and '' or 'colspan=2 ';

	local ins_block = {};
	local blocks = {};
	local posttexts = {};
	
	local name_set = {}; -- individual counts, later `false` for already-emitted globals
	local name_count = 0; -- number of entries in the set

	for _, name in ipairs(names) do
		for _, input in ipairs(MaxData[name] and MaxData[name].ins or {}) do
			local iname = input.name
			if iname then
				local prev_entry = name_set[iname]
				if not prev_entry then
					name_count = name_count + 1
					name_set[iname] = 1
				else
					name_set[iname] = prev_entry + 1
				end
			end
		end
	end
	local threshold = 2

for _, name in ipairs(names) do
	local data = MaxData[name];
	local block = {};

	for _, output in ipairs(data and data.outs or {}) do
		local key_attrs = {}
		for k, v in pairs(output) do
			if type(k) == 'string' then
				table.insert(key_attrs, k..'="'..value:gsub('[\\"]','\\%0')..'"')
			end
		end
		key_attrs = table.concat(key_attrs, ' ')
		table.insert(block, '|- '..key_attrs..'\n|'..normalize_out(output[1])..'||'..normalize_out(output[2]));
	end

	local next_prefix = '|-\n| style="border-top:2px solid var(--wikitable-header-bg)" ';
	local next_global_prefix = next_prefix;
	for _, input in ipairs(data and data.ins or {}) do
		local prevalence = input.name and name_set[input.name]
		local globalize = prevalence and prevalence >= threshold
		if globalize then name_set[input.name] = false end
		
		local ins_receiver = (globalize or single) and ins_block or block
		
		if input.name and not prevalence then -- skip
		elseif type(input) == 'table' then
			local attrs = {}
			for key, value in pairs(input) do
				if type(key) == 'string' and key ~= 'cont' then
					table.insert(attrs, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
				end
			end
			local prefix
			if globalize then
				prefix = next_global_prefix; next_global_prefix = '|-\n|'
			else
				prefix = next_prefix; next_prefix = '|-\n|'
			end
			table.insert(ins_receiver, prefix..colspan
				..table.concat(attrs, ' ')..'|'..tooltipsub(input.cont));
		else
			table.insert(ins_receiver, next_prefix..colspan..input);
			next_prefix = '|-\n|';
		end
	end

	table.insert(blocks, '{| class="wikitable calc__block"\n|-\n!colspan=2|'
		..Tooltips.full(name, 'Ability')..'\n|-\n'..table.concat(block, '\n')..'\n|}');

	if data and data.post then
		table.insert(posttexts, '<div style="width: 100%">'..data.post..'</div>');
	end
	if not data then
		table.insert(posttexts, '<div style="width: 100%">'.."''Help create a maximization calculator for "
			..Tooltips.full(name, 'Ability').." and its augments by adding data to [[Module:Maximization/data]].''"
			..'</div>');
	end
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
	table.concat(ins_block, '\n'),
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
p.WarframeAbilities = p.ability_set;

-- TODO: Helminth original abilities
-- TODO: Warframe stats
-- TODO: gear like Archwings, cornbots, hoverboards
-- TODO: craftable combo gear like kitguns, amps
-- TODO: weapons and Arch-weapons
-- TODO: enemies

function p._exists(name) return MaxData[name] and true or false end

return p
