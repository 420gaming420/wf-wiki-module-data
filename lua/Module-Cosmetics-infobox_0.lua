---	'''Cosmetics/infobox''' builds the infobox on cosmetic pages and adds the 
--	appropriate category pages.<br />
--
--	@module		cosmetics
--	@alias		p
--	@author		[[User:Twilight053|Twilight053]]
--  @author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Cosmetics/data]]
--	@require	[[Module:TextIcons]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:InfoboxBuilder]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Version]]
--	@release	stable

local CosmeticData = require([[Module:Cosmetics/data]])
local TextIcons = require([[Module:TextIcons]])
local Tooltips = require ([[Module:Tooltips]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Vendor = require([[Module:Vendors]])
local Baro = require([[Module:Baro]])
local Version = require([[Module:Version]])

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name'])
	local cosmeticData = CosmeticData.Cosmetics[name]
	if cosmeticData == nil then
		error('buildInfobox(frame): "'..name..'" does not exist in [[Module:Cosmetics/data]]')
	end

	local description = TextIcons.getIcon(cosmeticData.Description,{class='icon'})
	
	-- Assemble applies to data.
	local appliesTo = ""
	for equipName, data in pairs(CosmeticData.Users) do
		local skins = data.Equipments and data.Equipments.Skin -- To validate if skin even have equipment or not
	
		if skins then
			for _, skinName in pairs(skins) do
				if skinName == name then 
					if appliesTo ~= "" then 
						appliesTo = appliesTo..'<br>'
					end
					
					if data.Type == "Weapons" then
						appliesTo = appliesTo..Tooltips.full(equipName, data.Type)
					elseif data.Type == "Weapon Class" then
						appliesTo = appliesTo..'[['..equipName..']]'
					end
					
					if data.Variants then
						for _, variantEquipName in pairs (data.Variants) do
							if data.Type == "Weapons" then
								appliesTo = appliesTo..'<br>'..Tooltips.full(variantEquipName, data.Type)
							elseif data.Type == "Weapon Class" then
								appliesTo = appliesTo..'<br>'..'[['..variantEquipName..']]'
							end
						end
					end
					
					break 
				end 
			end
		end
	end
	
	-- Assemble tennogen data.
	local showTennoGenInformation = false
	if (cosmeticData.Artists ~= nil or
		cosmeticData.SteamLink ~= nil or
		cosmeticData.Round ~= nil or
		cosmeticData.PcPrice ~= nil or
		cosmeticData.ConsolePrice ~= nil
	) then
		showTennoGenInformation = true;
	end
	
	-- Assemble vendor source data.
	local showVendorSources = false
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	local baroStr = Baro._buildBaroSourceStrings(name)
	if (vendorStr ~= "" or baroStr ~= "") then
		showVendorSources = true
	end
	
	-- Build Infobox.
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:Cosmetics]]')
		:image(cosmeticData.ContainerImage and { {image=cosmeticData.Image,label='Pickup'}, {image=cosmeticData.ContainerImage,label='Deposit'} }
			or cosmeticData.Image
			or 'Panel.png')
		:group()
			:caption('Tradable', cosmeticData.Tradable and "[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|<span style=\"color:var(--positive-text-color)\">Tradeable</span>]][[Category:Tradeable Cosmetics]]" or "[[Trading|<span style=\"color:var(--negative-text-color)\">Untradeable</span>]][[Category:Untradeable Cosmetics]]")
		:done()
		
		:group():header('Description')
			:caption('Description', description)
		:done()

		:group():header('%s', 'general-information')
			:srow('AppliesTo', 'Applies To', 'applies_to', appliesTo)
			:row('Type', '%s', cosmeticData.Type..'[[Category:'..cosmeticData.Type..'s]]', 'type')
			:row('SellPrice', '%s', '[[File:Credits64.png|x20px|link=Credits]] '..(cosmeticData.SellPrice and cosmeticData.SellPrice or 'Cannot Sell'), 'sell-price')
			:row('Introduced', '%s', cosmeticData.Introduced and Version._getVersionLink(cosmeticData.Introduced)..Version._getVersionCategory(cosmeticData.Introduced), 'introduced')
		:done()
		
	if (showTennoGenInformation) then
		Infobox:group():header('TennoGen Information'..'[[Category:TennoGen]]')
			:srow('Artists', 'Artists', 'artists', table.concat(cosmeticData.Artists or {}, ", "))
			:srow('SteamPage', 'Steam Page', 'steam_page', (cosmeticData.SteamLink and '['..cosmeticData.SteamLink..' Link]' or ''))
			:srow('Round', '[[TennoGen]] Round', 'round', (cosmeticData.Round and cosmeticData.Round or ''))
			:srow('PcPrice', 'PC Price', 'pc_price', (cosmeticData.PcPrice and cosmeticData.PcPrice or ''))
			:srow('ConsolePrice', 'Console Price', 'console_price', (cosmeticData.ConsolePrice and '[[File:Platinum64.png|x20px|link=Platinum]] '..(cosmeticData.ConsolePrice) or ''))
		:done()
	end

	if (showVendorSources) then
		Infobox:group():header('%s', 'vendor-sources')
			:_row():addClass('tabber-borderless'):wikitext(frame:callParserFunction('#tag:tabber',
				((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
				((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
			))
		:done()
	end

	Infobox:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Cosmetics/data|📝 %s]]', 'update-infobox-data')
	:done()
	
	return Infobox
end
}
