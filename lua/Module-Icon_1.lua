--- '''Icon''' returns the in-game icon of a particular item.<br/>
--	
--	On this Wiki, Icon is used in:
--	* [[Module:DropTables]]
--	* [[Template:Icon]]
--	
--	@module	 icon
--	@alias		p
--	@author	 [[User:ChickenBar|ChickenBar]]
--	@attribution	[[User:94Connor949|94Connor949]]
--	@attribution	[[User:Hayframe|Hayframe]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Rngd444|Rngd444]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:Icon/data]]
--	@release	stable
--	

local p = {}

local IconData = mw.loadData [[Module:Icon/data]]
local Tooltips= require [[Module:Tooltips]]

-- TODO: Lots of the functions share similar code when grabbing arguments from the frame and building the icon's wikitext.
-- Refactor this functionality into a single function.

--- Returns the icon for an item.
--	@function		 Item
--	@param			{string} iconname Item name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p.Item(frame)
	local iconname = frame.args[1]
	local textexist = frame.args[2]
	local imagesize = frame.args.imgsize

	return p._Item(iconname, textexist, imagesize)
end

--- Returns the icon for an item.
--	@function		 _Item
--	@param			{string} iconname Item name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p._Item(iconname, textexist, imagesize)
	if iconname=='' or not iconname then error 'No icon name' end
	if (tonumber(imagesize) or 0) <= 32 then
		local success, ttt = pcall(Tooltips['icon'..string.lower(textexist or '')], iconname, 'Resources')
		if success and not ttt:find 'error' then
			return ttt
		end
		mw.log(ttt)
	end
	iconname = string.gsub(" "..string.lower( iconname ), "%W%l", string.upper):sub(2)
	local itemData = IconData["Items"][iconname]
	assert(itemData ~= nil, 
		'p._Item(iconname, textexist, imagesize): Invalid icon name "'..(iconname or '')
		..'" (do you need to update [[Module:Icon/data]] or [[Module:Resources/data]]?) [[Category:Icon Module error]]')
	
	local link = itemData["Link"]
    local title = itemData["Name"]
    local image = itemData["Image"]
    local cssClasses = itemData["CssClasses"]
	if (imagesize == nil or imagesize == '') then
		imagesize = 'x26'
	end

	local imgText = '[[File:'..image..'|'..imagesize..'px'
	if(link ~= nil) then
		imgText = imgText..'|link='..link
	end
	if(cssClasses ~= nil) then
		imgText = imgText..'|class=icon '..cssClasses
	end
	if(title ~= nil) then
		imgText = imgText..'|'..title
	end
	imgText = imgText..']]'

	if (textexist == 'text' or textexist == 'Text') then
		if (link ~= nil) then
			if (title ~= nil) then
				return imgText..'&nbsp;[['..link..'|'..title..']]'
			else
				return imgText..'&nbsp;[['..link..']]'
			end
		elseif (title ~= nil) then
			return imgText..'&nbsp;'..title
		else
			return imgText
		end
	end
	return imgText
end

--- Returns the icon for a HUD element.
--	@function		 HUD
--	@param			{string} iconname HUD element name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x20'
--	@return		 {string} The icon's image in wikitext
function p.HUD(frame)
	local iconname = frame.args[1]
	local textexist = frame.args[2]

	local imagesize = frame.args.imgsize
	local link = ''
	if IconData["Heads-Up Display"][iconname] == nil then
		return '[['..iconname..']]'
	end
	
	link = IconData["Heads-Up Display"][iconname]["Link"]
	iconname = IconData["Heads-Up Display"][iconname]["Image"]

	if (imagesize == nil or imagesize == '') then
		imagesize = 'x20'
	end
	if (textexist == 'text' or textexist == 'Text') then
		return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display|class=icon dark-invert]]&nbsp;[[Heads-Up Display|'..link..']]'
	end
	return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display|class=icon dark-invert]]'
end

--- Returns the icon for a real-world country flag.
--	@function		 Flag
--	@param			{string} iconname HUD element name
--	@param			{string} tooltip If set to 'Text' or 'text', text is added after icon
--	@param			{string} dest Name of a destination article for linking purposes
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@return		 {string} The icon's image in wikitext
function p.Flag(frame)
	local iconname = frame.args[1]
	local tooltip = frame.args[2]
	local dest = frame.args[3]
	local textexist = frame.args[4]
	assert(IconData["Flags"][iconname] ~= nil, 
		'p.Focus(frame): Invalid icon name "'..(iconname or '')..'" [[Category:Icon Module error]]')
		
	iconname = IconData["Flags"][iconname]
	if tooltip == nil then
		tooltip = ''
	end
	if dest == nil then
		dest = ''
	end
	if (textexist == 'text' or textexist == 'Text') then
		return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']]&nbsp;[['..dest..'|'..tooltip..']]'
	end
	return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']]'
end

--- Returns the icon for a HUD buff or debuff.
--	@function		 Buff
--	@param			{string} iconname Buff name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x40'
--	@return		 {string} The icon's image in wikitext
function p.Buff(frame)
	local iconname = frame.args[1]
	local imagesize = frame.args.imgsize
	local link = IconData["Buff"][iconname]["Link"]
	local iconFile = ""

	assert(IconData["Buff"][iconname] ~= nil, 
		'p.Buff(frame): Invalid icon name "'..iconname..'" [[Category:Icon Module error]]')
	

	iconFile = IconData["Buff"][iconname]["Image"]

	if (imagesize == nil or imagesize == '') then
		imagesize = 'x40'
	end
	return '[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|class=icon light-invert]]'
end

--- Returns the icon for a Clan tier.
--	@function		 Clan
--	@param			{string} iconname Clan tier name
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p.Clan(frame)
	local iconname = frame.args[1]
	local imagesize = frame.args.imgsize

	return p._Clan(iconname, imagesize)
end

--- Returns the icon for a Clan tier.
--	@function		 _Clan
--	@param			{string} iconname Clan tier name
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p._Clan(iconname, imagesize)
	local link = IconData["Clan"][iconname]["Link"]
	local iconFile = ""

	assert(IconData["Clan"][iconname] ~= nil, 
		'p._Clan(iconname, imagesize): Invalid icon name "'..iconname..'" [[Category:Icon Module error]]')
		
	iconFile = IconData["Clan"][iconname]["Image"]
	if (imagesize == nil or imagesize == '') then
		imagesize = 'x26'
	end
	return '[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|'..iconname..' Clan|class=icon]]'
end

return p
