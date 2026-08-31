---	'''Cosmetics''' stores all cosmetic skin items in [[WARFRAME]].<br />
--	
--	
--	@module		cosmetics
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Cosmetics/data]]
--	@require	[[Module:Warframe/data]]
--	@require	[[Module:Weapon/data]]
--	@require	[[Module:Companion/data]]
--	@require	[[Module:Delay]]
--	@release	beta
--	

local p = {}

local Delay = require([[Module:Delay]])
-- Looking into item types to determine cosmetic compatibility
local WarframeData = Delay.require([[Module:Warframes/data]])
local WeaponData = Delay.require([[Module:Weapons/data]])
local CompanionData = Delay.require([[Module:Companions/data]])
local CosmeticData = Delay.require([[Module:Cosmetics/data]])

function p.buildSkinGallery(frame)
    local itemName = frame.args["name"] or ""
    local skins = CosmeticData["Users"][itemName] and 
    		CosmeticData["Users"][itemName]["Equipments"]["Skin"] or nil;

    if not skins then
        return "No skins found for item: " .. itemName
    end

    local result = {}
    local galleryLineTemplate = "%s|link=%s|alt=%s image|[[%s|%s]]"
    table.insert(result, itemName.."-specific skins")
    table.insert(result, "<gallery>")
    for _, skinName in ipairs(skins) do
    	local skinObject = CosmeticData["Cosmetics"][skinName]
        local line = galleryLineTemplate:format( 
        	skinObject.Image, skinObject.Link, skinObject.Name, skinObject.Link, skinObject.Name)
        table.insert(result, line)
    end
    table.insert(result, "</gallery>")
	
	local itemObject = WarframeData[itemName] or WeaponData[itemName] or CompanionData[itemName] or nil
	local itemType = itemObject and (itemObject["Class"] or itemObject["Type"]) or nil	-- Class is used in Weapon data; Type is used in rest
	
	if (itemType and skins[itemType] ~= nil) then
		table.insert(result, itemType.."-compatible skins")
		table.insert(result, "<gallery>")
		for _, skinName in ipairs(skins) do
			local skinObject = CosmeticData["Cosmetics"][itemType]
			local line = galleryLineTemplate:format(
        		skinObject.Image, skinObject.Link, skinObject.Name, skinObject.Link, skinObject.Name)
			table.insert(result, line)
		end
		table.insert(result, "</gallery>")
	end
	
    return frame:preprocess(table.concat(result, "\n"))
end

function p.buildAttachmentGallery(frame)
    local attachmentType = frame.args["name"] or ""
    local attachmentList = CosmeticData["Users"][attachmentType] and
    		CosmeticData["Users"][attachmentType]["Equipments"][attachmentType] or nil

    if not attachmentList then
        return "No cosmetic items found for type: " .. itemName
    end

    local result = {}
    table.insert(result, "<gallery>")
    for _, attachmentName in ipairs(attachmentList) do
    	local attachmentObject = CosmeticData["Cosmetics"][attachmentName]
        local line = string.format("%s|link=%s|alt=%s image|[[%s|%s]]", 
        	attachmentObject.Image, attachmentObject.Link, attachmentObject.Name, attachmentObject.Link, attachmentObject.Name)
        table.insert(result, line)
    end
    table.insert(result, "</gallery>")

    return frame:preprocess(table.concat(result, "\n"))
end

return p
