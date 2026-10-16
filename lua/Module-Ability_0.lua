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


--- Builds a tabber containing all channeled abilities sorted alphabetically.
--  @function		p.buildChanneledAbilitiesTabber
--  @param			{table} frame MediaWiki frame object
--  @return			{string} Wikitext containing the rendered tabber extension tag
function p.buildChanneledAbilitiesTabber(frame)
	local channeledAbilities = {}
	
	-- Get only Channeled Abilities
	for name, data in pairs(AbilityData["Ability"]) do
		if type(data) == "table" and data.IsChanneled then
			table.insert(channeledAbilities, name)
		end
	end
	
	table.sort(channeledAbilities)
	
	local tabs = {}
	for _, name in ipairs(channeledAbilities) do
		-- Format entries into tabs
		table.insert(tabs, name .. " =\n{{:" .. name .. "}}")
	end
	
	-- Assemble all tabs separated by the tabber delimiter
	local tabberContent = table.concat(tabs, "\n|-|\n")
	
	-- Return the tabber extension tag rendered by MediaWiki
	return frame:extensionTag{
		name = "tabber",
		content = "\n" .. tabberContent .. "\n"
	}
end


return p
