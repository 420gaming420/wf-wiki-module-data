---	'''Ability''' stores [[Warframe]] and other player avatar abilities.
--	
--	On this Wiki, Ability is used in:
--	* [[Module:Tooltips]]
--	
--	@module		ability
--	@alias		p
--	@author		[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Ability/Conclave/data]]
--	@require	[[Module:Table]]
--	@release	stable
--	

local p = {}

local AbilityData = mw.loadData [[Module:Ability/data]]
local ConclaveData = mw.loadData [[Module:Ability/Conclave/data]]

function p.Modifier(frame)--(value, modifier)
	--0 eff = 2x price
	--max 175 eff
	--175 eff = .25x price
	--(2-(eff/100))x price
	--all others: ((str/dur/rng)/100)x damage/duration/range
	return (pcall(function() return (frame.args[2]/100)*frame.args[1] end) and (frame.args[2]/100)*frame.args[1]) or frame.args[1]
end

function p.EfficiencyModifier(frame)--(value, modifier)
	return (pcall(function() return (2-(math.min(frame.args[2], 175)/100))*frame.args[1] end) and (2-(math.min(frame.args[2], 175)/100))*frame.args[1]) or frame.args[1]
end

return p
