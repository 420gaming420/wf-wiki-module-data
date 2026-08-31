--- '''Gallery''' provides consistent formatting and a simplified interface for
--  generating galleries of WARFRAME's content on the wiki. Generated galleries 
--  should always have a caption beneath images for accessibility.
--  
--  Gallery can be invoked directly (`&#123;{#invoke:Gallery|function|...}}`), 
--  invoked from a template (`&#123;{template|function|...}}`), or used
--  within other modules.
--  
--  If you want to see the raw wikitext output from calling this module's functions,
--	`&#123;{#invoke:}}` this Module, on [[Special:ExpandTemplates]].
--  
--	On this Wiki, Gallery is used in:
--	* [https://wiki.warframe.com/w/Special:WhatLinksHere?hidelinks=1&target=Module%3AGallery&namespace=0 Pages that `&#123;{#invokes:}}` this module]
--	
--  @module		gallery
--  @alias		p
--  @author		
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gat235|Gat235]]
--  @image		
--  @require	[[Module:Mods/data]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:TennoGen/data]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Shared]]
--  @release	unmaintained
--  

-- TODO: Put this project on hold b/c I think it will cause more issues than it solves
-- regarding Lua memory usage for our scripts. In other words, we will NOT be replacing
-- all gallery tags with this module. The main thing we should do is to standardize
-- the file names of media uploaded to the wiki and always replace existing file rather
-- than create a new file if something is outdated. - 2021-06-15 [[User:Cephalon Scientia]]

-- TODO: Explore the idea of using DPL queries on specific categories to generate a list of items
-- with a specific property and use that to auto-generate galleries similar to 
-- https://genshin-impact.fandom.com/wiki/Template:Artifacts_by_Category_Table but also using modules
local p = {}

local Weapon = require [[Module:Weapons]]
local Tooltip = require [[Module:Tooltips]]
local Shared = require [[Module:Shared]]

local ModData = mw.loadData [[Module:Mods/data]] ['Mods']
local WeaponData = mw.loadData [[Module:Weapons/data]]
local WarframeData = mw.loadData [[Module:Warframes/data]]
local TennoGenData = mw.loadData [[Module:TennoGen/data]]

p.DEFAULT_GALLERY_PARAMS = 'captionposition="below" captionalign="center"'..
	'hideaddbutton="true" spacing="small" position="center" bordersize="none"'..
	'bordercolor="#FFFFFF" navigation="true"'

-- TODO: Should this module only contain an exported constant DEFAULT_GALLERY_PARAMS
-- to standardize the styling of all galleries made in other modules? In other words,
-- should buildGallery() functions be moved to the appropriate module instead? There
-- is really nothing unique about this module that the functions require other than
-- the constant that standardizes gallery formats.

---	Builds a gallery that displays mods.
--	@function		p.buildModGallery
--	@param			{table} frame The input arguments, each param represents 
--							a mod that is to be displayed in a gallery format; assumes 
--							parameters passed in are valid mod names and exist in M:Mods/data
--	@return			{string} Gallery result in wikitext
function p.buildModGallery(frame)
    local gallery = {'<gallery '..p.DEFAULT_GALLERY_PARAMS..'>'}
    
    -- TODO: edit functionality of ipairs so it traverses in alphabetical order
    for _, modName in ipairs(frame.args or frame) do
        local modTable = ModData[modName]
        table.insert(gallery, table.concat({
        	'\n', modTable.Image, '|', 
    		Tooltip.getFullTooltip({ args={ modName, 'Mods' } }), '|link=', modTable.Link or modTable.Name
        })
        )
    end
    table.insert(gallery, '\n</gallery>')
    
	gallery = table.concat(gallery)
    -- preprocess() needed to properly process gallery tags in string for display
    -- on the wiki
    gallery = frame:preprocess(gallery)
    return gallery
end

---	Builds a gallery that displays weapons.
--	@function		p.buildWeaponGallery
--	@param			{table} frame The input arguments, each param represents 
--							a mod that is to be displayed in a gallery format; assumes 
--							parameters passed in are valid weapon names and exist in M:Weapons/data
--	@return			{string} Gallery result in wikitext
function p.buildWeaponGallery(frame)
	local gallery = {'<gallery '..p.DEFAULT_GALLERY_PARAMS..'>'}
	
    for _, weaponName in ipairs(frame.args or frame) do
        local weaponTable = Weapon._getWeapon(weaponName)
        table.insert(gallery, table.concat({
        	'\n', weaponTable.Image, '|', 
    		Tooltip.getFullTooltip( { args={ weaponName, 'Weapons' } } ), '|link=', weaponTable.Link or weaponTable.Name
        }))
    end
    table.insert(gallery, '\n</gallery>')
    
	gallery = table.concat(gallery)
	return frame:preprocess(gallery)
end

---	Builds a generalized gallery that displays many different WARFRAME items.
--	@function		p.buildGallery
--	@param			{table} frame The input arguments of WARFRAME items to display
--	@return			(string} Gallery result in wikitext
function p.buildGallery(frame)
	assert(frame.args ~= nil, 'p.buildGallery(): no input arguments')
	
	local gallery = {'<gallery '..p.DEFAULT_GALLERY_PARAMS..'>'}
	
	-- TODO: Implement logic for generating a generalized gallery, must support
	-- both weapons, mods, enemies, and more by name only
	
	-- Issue arises where there are multiple items with the same name but in 
	-- different /data e.g. Exalted Blade weapon vs the stance mod
	for _, itemName in ipairs(frame.args) do
		local image = Tooltip.getImage( { args={ itemName } } )	-- [[File:ExcaliburIcon272.png|19px|link=Excalibur]]
		image = string.match(image, 'File:(.+.png)')	-- hacky way of getting image file name
		local tooltip = Tooltip.getFullTooltip( { args={ itemName } } )
		
		table.insert(gallery, ("%s|link=%s|%s"):format(
	                image,
	                itemName,
	                tooltip)
	            )
    end
	table.insert(gallery, '</gallery>')
	
	gallery = table.concat(gallery, '\n')
	return frame:preprocess(gallery)
end

---	Builds a gallery for a non-TennoGen cosmetics.
--	@function		p.buildCosmeticGallery
--	@param			{string} frame 
--	@return			{string} Gallery of a specific cosmetic type in wikitext
function p.buildCosmeticGallery(frame)
	local cosmeticType = frame.args[1]
	local gallery = {'<gallery '..p.DEFAULT_GALLERY_PARAMS..'>'}
	
	table.insert(gallery, '\n</gallery>')
	gallery = table.concat(gallery)
	return frame:preprocess(gallery)
end

return p
