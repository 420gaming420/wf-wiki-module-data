---	'''Module:Conservation''' contains all of [[WARFRAME]]'s [[Conservation]] data.<br />
--	
--	@module			conservation
--	@alias			p
--	@author			[[User:Ethanil239|Ethanil]]
--	@attribution	[[User:Gigamicro|gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image			PobberCommon.png
--	@require		[[Module:Conservation/data]]
--	@require		[[Module:Table]]
--	@release		stable
--	

local p = {}

local ConservationData = mw.loadData [[Module:Conservation/data]]
local Table = require [[Module:Table]]

---	Returns a specific animal table entry from /data
--	@function		p._getAnimal
--	@param			{string} animalName Animal name
--	@returns		{table} Animal table
function p._getAnimal(animalName)
	local animal = ConservationData["Animals"][animalName]
	if animal then return animal end
	error("p._getAnimal(animalName): "..animalName.." does not exist in [[Module:Conservation/data]]")
end

---	Builds a tab for the tabber function of the wiki.
--	@function		p.buildConservationTab
--	@param			{table} frame Frame object
--	@param[opt]		{table, string} animalEntry Table entry of animal or the name of animal
--	@returns		{string} Resultant wikitext of animaltab
function p.buildConservationTab(frame, animalEntry)
	local name = frame.args and frame.args[1] or frame
	
	assert(name, "p.buildConservationTab(frame): empty frame arguments")
	local animal = type(animalEntry) == "table" and animalEntry or p._getAnimal(name)
	
	local result = {}
	
	if animal.Codex and animal.Codex ~= "" and animal.Codex ~= "N/A" then
		table.insert(result, "{{Codex|"..animal.Codex.."}}")
	end
	table.insert(result, p.buildInfobox(tostring(name)))
	
	if animal.Intro and animal.Intro ~= "" and animal.Intro ~= "N/A" then
		table.insert(result, animal.Intro.."<br><br>")
	end
	
	if animal.Reward and animal.Reward ~= "" and animal.Reward ~= "N/A" then
		local reward = (animal.Reward):find("Standing") and "{{sc|%s}}" or ("%%sx %s"):format(animal.Reward)
		table.insert(result,(
			[=[When captured via [[Conservation]] they will reward the following:
			{{{!}} class="wikitable"
			{{!}}-
			! Perfect !! Good !! Bad
			{{!}}-
			{{!}} %s {{!}}{{!}} %s {{!}}{{!}} %s
			{{!}}}
		]=]):format(
			reward:format(animal.Perfect),
			reward:format(animal.Good),
			reward:format(animal.Bad),
		nil))
	end
	
	if animal.Notes and animal.Notes ~= "" and animal.Notes ~= "N/A" then
		table.insert(result, animal.Notes)
	end
	
	assert(result[1], "p.buildConservationTab(animalName): empty data entry")
	return animalEntry and table.concat(result, "\n") or frame:preprocess(table.concat(result, "\n"))
end

---	Builds a tabber for a conservation animal page.
--	@function		p.buildConservationTabber
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of tabber element
function p.buildConservationTabber(frame, subtabber)
	local name = frame.args and frame.args[1] or frame
	assert(name, "p.buildConservationTabber(frame): empty frame arguments")
	local animalsFromSpecies = {}
	for k, v in pairs(ConservationData["Animals"]) do
		if v.Family == name then
			animalsFromSpecies[k] = v
		end
	end
	local result = subtabber and { ("|-|%s={{#tag:tabber|"):format(name) } or { "<tabber>" }
	for i = 1, Table.size(animalsFromSpecies) do
		for k, v in pairs(animalsFromSpecies) do
			if i == v.Rarity then 
				if subtabber then
					table.insert(result, ("%s=%s {{!-}}{{!}}"):format(k, p.buildConservationTab(tostring(k), v)))
				else	
					table.insert(result, ("|-|%s=%s"):format(k, p.buildConservationTab(tostring(k), v))) 
				end
			end
		end
	end
	if subtabber then
		table.insert(result, "}}")
	else
		table.insert(result, "</tabber>{{clr}}")
	end
	return type(frame) == "string" and table.concat(result, "\n") or frame:preprocess(table.concat(result, "\n"))
end

function p.buildAllTabbers(frame)
	local origin = frame.args and frame.args[1] or frame or true
	local subtabber = frame.args and true or false
	local animals = ConservationData["Animals"]
	local species = {}
	local output = subtabber and "<tabber>" or ""
	for _, v in pairs(animals) do
		if v.Origin == origin or origin == true then
			species = { v.Family }
			output = output..p.buildConservationTabber(v.Family, subtabber)
			break
		end
	end
	for _, v in pairs(animals) do
		if v.Origin == origin or origin == true then
			local insert = true
			for _, value in pairs(species) do
				if value == v.Family then
					insert = false
				end
			end
			if insert then
				table.insert(species, v.Family)
				output = output..p.buildConservationTabber(v.Family, subtabber)
			end
		end
	end
	output = subtabber and output.."</tabber>" or output
	return frame:preprocess(output)
end

return p
