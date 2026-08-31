-- ExportRecipes contains an array of tables
local ExportRecipes = mw.text.jsonDecode(mw.title.new("User:Cephalon Scientia/ExportRecipes en.json"):getContent())
local ppData = {}	-- ExportRecipes after processing data

for i, blueprint in pairs(ExportRecipes) do
	local uniqueName = blueprint["uniqueName"]
	ppData[uniqueName] = blueprint
	ppData[uniqueName]["secretIngredients"] = nil	-- All of these keys contain empty arrays
	
	-- Renaming keys to PascalCasing to match Lua table convention
	local temp = {}
	for key, value in pairs(ppData[uniqueName]) do
		temp[key:sub(1, 1):upper()..key:sub(2)] = value
	end
	ppData[uniqueName] = temp
end

return ppData
