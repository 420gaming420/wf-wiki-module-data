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

local Tooltips = require [[Module:Tooltips]]

local MaxData = mw.loadData [[Module:Maximization/data]]

local p = {}

-- replaces/expands '{{#invoke:Tooltip}}' stubs from [[Module:Maximization/data]]
local function tooltipsub(st) return string.gsub(st,'{{#invoke:Tooltip|([^|]*)(|[^{}]*)}}',function(fun,s)
	local args = {}
	for arg in s:gmatch'|([^|]*)' do
		local k, v = arg:match'^([^=]*)=(.*)$'
		if k then
			local num = tonumber(k)
			table[num and (num % 1 == 0) and num or k] = v
		else
			table.insert(args, arg)
		end
	end
	return Tooltips[fun](args)
end)end

--- Creates a maximization calculator for a specific Warframe ability based on formulas in [[Module:Maximization/data]].
--  @function		p.ability
--	@alias			p.main
--  @param			{table} frame Frame object with the ability names as the arguments
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(...)
	local names = (...).args or {...}

	local ins = {}
	local exist = {}
for _, name in ipairs(names) do
	local max_inner = MaxData[name]
	local next_prefix = '| style="border-top:2px solid var(--wikitable-header-bg)" '
	for i, v in ipairs(max_inner and max_inner.ins or {}) do
		if v.name and exist[v.name] then -- continue
		elseif type(v) == 'table' then
			local cont = v.cont or ''
			for kk, vv in pairs(v) do
				if type(kk) == 'string' and kk ~= 'cont' then
					table.insert(v, 'data-'..kk..'="'..vv:gsub('[\\"]','\\%0')..'"')
				end
			end
			exist[v.name] = true
			table.insert(ins, next_prefix..table.concat(v, ' ')..'|'..tooltipsub(cont))
			next_prefix = '|'
		else
			table.insert(ins, next_prefix..v)
			next_prefix = '|'
		end
	end
end
	local outses = {}
	local posts = {}
for _, name in ipairs(names) do
	local max_inner = MaxData[name]
	local outs = {}
	for i, v in ipairs(max_inner and max_inner.outs or {}) do
		local function normalize(v)
			if type(v) == 'string' then
				return tooltipsub(v)
			end
			if type(v) ~= 'table' then error('normalize(): expected string or table, got '..type(v)) end
			local suff = v.suff
			for kk, vv in pairs(v) do
				if type(kk) == 'string' and kk ~= 'suff' then
					table.insert(v, 'data-'..kk..'="'..vv:gsub('[\\"]','\\%0')..'"')
				end
			end
			return '<span '..table.concat(v, ' ')..'></span>'
			..(suff and tooltipsub(suff) or '')
		end
		outs[i] = '|'..normalize(v[1])..'||'..normalize(v[2])
	end
	table.insert(outses, '{| class="wikitable calc__block"\n|-\n!colspan=2|'..Tooltips.full(name, 'Ability')
		..'\n|-\n'..table.concat(outs, '\n|-\n')..'\n|}')
	if max_inner and max_inner.post then
		table.insert(posts, '<div style="width: 100%">'..max_inner.post..'</div>')
	end
end

	local max = ([=[
<div class="js-calc calc__container" data-style-number="max-width: 8ch">
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
%s</div>]=]):format(
	Tooltips.full{'Ability Strength', 'Stats', r='Strength'},
	Tooltips.full{'Ability Duration', 'Stats', r='Duration'},
	Tooltips.full{'Ability Range', 'Stats', r='Range'},
	Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'},
	table.concat(ins, '\n|-\n'),
	table.concat(outses, '\n'),
	table.concat(posts, '\n'),
nil)

	return max
end

p.main = p.ability

return p
