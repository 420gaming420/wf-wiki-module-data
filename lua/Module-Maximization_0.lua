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
			ins[i] = '|'..table.concat(v, ' ')..'|'..cont
		else
			ins[i] = '|'..v
		end
	end
end
	local outses = {}
for _, name in ipairs(names) do
	local max_inner = MaxData[name]
	local outs = {}
	for i, v in ipairs(max_inner and max_inner.outs or {}) do
		local function normalize(v)
			if type(v) == 'string' then
				return v:gsub('{{#invoke:Tooltip|full|([^|]*)|([^}]*)}}', Tooltips.full)
			end
			if type(v) ~= 'table' then error('normalize(): expected string or table, got '..type(v)) end
			local suff = v.suff
			for kk, vv in pairs(v) do
				if type(kk) == 'string' and kk ~= 'suff' then
					table.insert(v, 'data-'..kk..'="'..vv:gsub('[\\"]','\\%0')..'"')
				end
			end
			return '<span '..table.concat(v, ' ')..'></span>'
			..(suff and suff:gsub('{{#invoke:Tooltip|full|([^|]*)|([^}]*)}}', Tooltips.full) or '')
		end
		outs[i] = '|'..normalize(v[1])..'||'..normalize(v[2])
	end
	table.insert(outses, '{| class="wikitable calc__block"\n|-\n!colspan=2|'..Tooltips.full(name, 'Ability')
		..'\n|-\n'..table.concat(outs, '\n|-\n')..'\n|}'..(max_inner and max_inner.post or ''))
end
	local max = ([=[
<div class="js-calc">
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
%s</div>]=]):format(
	Tooltips.full{'Ability Strength', 'Stats', r='Strength'},
	Tooltips.full{'Ability Duration', 'Stats', r='Duration'},
	Tooltips.full{'Ability Range', 'Stats', r='Range'},
	Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'},
	table.concat(ins, '\n|-\n'),
	table.concat(outses, '\n'),
nil)

	return max
end

p.main = p.ability

return p
