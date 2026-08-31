local p = {}
local InfoboxBuilder = require('Module:InfoboxBuilder')
local pagename = mw.title.getCurrentTitle().fullText

function p.main(frame)
	local args = frame:getParent().args
	
	local transmutable_row = '<div style="text-align:center;">[[Transmutation|'
	if args.transmutable then
		transmutable_row = transmutable_row .. frame:preprocess('{{text|red|Untransmutable}}') .. ']][[Category:Untransmutable Mods]]'
	else
		transmutable_row = transmutable_row .. frame:preprocess('{{text|green|Transmutable}}') .. ']][[Category:Transmutable Mods]]'
	end
	transmutable_row = transmutable_row .. '</div>'
	
	local tax_row = args.tax or ''
	
	if not args.tax then
		if args.rarity == 'Amalgam' then
			tax_row = '0 [[Category:Amalgam Mods]]'
		elseif args.rarity == 'Legendary' then
			tax_row = '1,000,000 [[Category:Primed Mods]]'
		elseif args.rarity == 'Rare' then
			tax_row = '8,000 [[Category:Rare Mods]]'
		elseif args.rarity == 'Uncommon' then
			tax_row = '4,000 [[Category:Uncommon Mods]]'
		elseif args.rarity == 'Common' then
			tax_row = '2,000 [[Category:Common Mods]]'
		end
		tax_row = tax_row .. frame:preprocess('{{Resource|Credits}}')
	else
		if args.tax ~= 'N/A' then
			tax_row = frame:preprocess('{{cc|'..args.tax..'}}')
		end
	end
	
	if args.droppedby then
		args.droppedby = args.droppedby .. '[[Category:Manual Mod Drops]]'
	end
	
	if args.autoDrops then
		args.autoDrops = args.autoDrops .. '[[Category:Manual Mod Drops]]'
	end
	
	return InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(args.name or pagename)
	:image(args.image or 'Mod.png')
	:caption(transmutable_row, transmutable_row)
    :group()
    	:header('Statistics')
			:row(nil, 'Introduced', args.introduced)
			:row(nil, '[[Polarity]]', args.polarity)
			:row(nil, 'Rarity', args.rarity)
			:row(nil, '[[Trade System|Trading Tax]]', tax_row)
			:row(nil, 'Dropped by', args.droppedby)
			:row(nil, 'Source', args.autoDrops)
		:done()
	:done()
end

return p
