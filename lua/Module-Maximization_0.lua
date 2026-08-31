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
--  @param			{table} frame Frame object with the ability name as the argument
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(frame)
	local name = frame.args and frame.args[1] or frame

	local max_inner = MaxData[name]
	local ins = {}
	for i, v in ipairs(max_inner and max_inner.ins or {}) do
		if type(v) == 'table' then
			local cont = v.cont or ''
			for kk, vv in pairs(v) do
				if type(kk) == 'string' and kk ~= 'cont' then
					table.insert(v, 'data-'..kk..'="'..vv:gsub('[\\"]','\\%0')..'"')
				end
			end
			ins[i] = '|'..table.concat(v, ' ')..'|'..cont
		else
			ins[i] = '|'..v
		end
	end
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
	local max = max_inner and ([=[
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
{| class="wikitable calc__block"
|-
!colspan=2|%s
|-
%s
|}</div>]=]):format(
	Tooltips.full{'Ability Strength', 'Stats', r='Strength'},
	Tooltips.full{'Ability Duration', 'Stats', r='Duration'},
	Tooltips.full{'Ability Range', 'Stats', r='Range'},
	Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'},
	table.concat(ins, '\n|-\n'),
	Tooltips.full(name, 'Ability'),
	table.concat(outs, '\n|-\n'),
nil)
	if max_inner and max_inner.post then max = max..max_inner.post end

	return max
end

p.main = p.ability

return p
