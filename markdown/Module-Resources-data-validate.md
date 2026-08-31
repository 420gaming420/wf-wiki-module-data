---
title: "Module:Resources/data/validate"
wiki_url: "https://wiki.warframe.com/w/Module/Resources/data/validate"
wiki_timestamp: "2022-10-10T19:06:23Z"
---

*Documentation for this module may be created at [Module:Resources/data/validate/doc](/w/Module:Resources/data/validate/doc?action=edit&redlink=1 "Module:Resources/data/validate/doc (page does not exist)")*

```lua
local p = {}

local ResourceData = mw.loadData('Module:Resources/data')
local Table = require('Module:Table')

--- Checks if each mod image name is in the proper format. Valid item image file name
--	formats: ItemName.png
--	@function		p.checkImageNames
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of list of mods with image names that do not follow mod image naming scheme
function p.checkImageNames(frame)
	local entryErrors = { 'p.checkImageName(frame): There are a total of %d image names that do not follow mod image naming scheme ItemName.png' }
	for itemName, entryData in Table.skpairs(ResourceData['Resources']) do
		if (not entryData['_IgnoreEntry']) then
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
```

