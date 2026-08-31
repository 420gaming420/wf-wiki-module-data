local p = {}

local CosmeticsData = require('Module:Cosmetics/data')
local Table = require('Module:Table')

--- Checks if each name is in the proper format. Valid item image file name
--	formats: ItemName.png
--	@function		p.checkImageNames
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods with image names that do not follow wiki naming scheme
function p.checkImageNames(frame)
	local entryErrors = { '<strong class="error">p.checkImageName(frame): There are a total of %d image names that do not follow wiki naming scheme ItemName.png</strong>' }
	for itemName, entryData in Table.skpairs(CosmeticsData['Cosmetics']) do
		if (not entryData['_IgnoreEntry'] and entryData['Image'] ~= nil) then
			local imageName = entryData['Image']
			local itemNameInFile = string.gsub(itemName, '%s', '')	-- Removing whitespaces in name
			local imageNameWithNoEnding = string.gsub(imageName, '%.png', '')
			-- First check if image file is a .png then validate file name
			if (string.find(imageName, '%.png') == nil or itemNameInFile ~= imageNameWithNoEnding) then
				local errorMsg = '# "[[%s]]": "[[:File:%s|%s]]"'
				table.insert(entryErrors, string.format(errorMsg, itemName, imageName, imageName))
			end
		end
	end
	entryErrors[1] = string.format(entryErrors[1], #entryErrors - 1)
	return frame:preprocess(table.concat(entryErrors, '\n'))
end

return p
