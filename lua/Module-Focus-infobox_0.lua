--	
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Lang = mw.language.new('en')	-- Using for number formatting
local FocusData = mw.loadData([[Module:Focus/data]])

-- Mapping internal icon text to file links as stored on the wiki
local ICON_TEXT_MAP = {
	['<DT_IMPACT>'] = '[[File:Impact_b.png|x16px|class=dark-invert]]',
	['<DT_PUNCTURE>'] = '[[File:Puncture_b.png|x16px|class=dark-invert]]',
	['<DT_SLASH>'] = '[[File:Slash_b.png|x16px|class=dark-invert]]',
	['<DT_FIRE>'] = '[[File:Heat_b.png|x16px|class=dark-invert]]',
	['<DT_FREEZE>'] = '[[File:Cold_b.png|x16px|class=dark-invert]]',
	['<DT_ELECTRICITY>'] = '[[File:Electricity_b.png|x16px|class=dark-invert]]',
	['<DT_POISON>'] = '[[File:Toxin_b.png|x16px|class=dark-invert]]',
	['<DT_EXPLOSION>'] = '[[File:Blast_b.png|x16px|class=dark-invert]]',
	['<DT_RADIATION>'] = '[[File:Radiation_b.png|x16px|class=dark-invert]]',
	['<DT_GAS>'] = '[[File:Gas_b.png|x16px|class=dark-invert]]',
	['<DT_MAGNETIC>'] = '[[File:Magnetic_b.png|x16px|class=dark-invert]]',
	['<DT_VIRAL>'] = '[[File:Viral_b.png|x16px|class=dark-invert]]',
	['<DT_CORROSIVE>'] = '[[File:Corrosive_b.png|x16px|class=dark-invert]]',
	['<DT_RADIANT>'] = '[[File:VoidTearIcon_b.png|x16px|class=dark-invert]]',
	['<DT_SENTIENT>'] = '[[File:Tau_b.png|x16px|class=dark-invert]]',
	['<AMMO_MUTATION>'] = '[[File:AmmoMutation.png|x16px|class=dark-invert]]',
	['<LINE_SEPARATOR>'] = '<hr />',
	['<ENERGY>'] = '[[File:IconEnergy.gif|x16px]]',
	['<SHIELD>'] = '[[File:IconShield.png|x16px]]',
	['<SECONDARY_FIRE>'] = '<SECONDARY_FIRE>'
}

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local focusData = FocusData.Ways[name];
	
	local formattedFocusDesc = focusData.Description
	local damageTypeName = formattedFocusDesc:match('<[A-Z_]+>')	-- Matching strings in the form of "<DT_TYPE>"
	if (damageTypeName ~= nil) then
		formattedFocusDesc = formattedFocusDesc:gsub(damageTypeName, ICON_TEXT_MAP[damageTypeName])
		
		-- Matching a second different icon text like in the case of Rending Strike mod
		if (formattedFocusDesc:match('<[A-Z_]+>') ~= nil) then
			damageTypeName = formattedFocusDesc:match('<[A-Z_]+>')
			formattedFocusDesc = formattedFocusDesc:gsub(damageTypeName, ICON_TEXT_MAP[damageTypeName])
		end
	end
	
	local Infobox = InfoboxBuilder('MediaWiki:Custom-General/i18n.json')
		:tag('title')
			:tag('default')
				:tag('b'):wikitext(name..'[[Category:Focus]]'):done()
			:done()
		:done()
		:tag('image'):attr('source', 'Image')
			:tag('default'):wikitext(focusData.Image or 'Panel.png'):done()
		:done()
		:group()
			:caption('CodexSecret', focusData.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
		:done()
		
		:group():header('%s', 'max-rank-description')
			:caption('Description', formattedFocusDesc)
		:done()

		:group():header('%s', 'general-information')
			:row('Type', '%s', focusData.Type and focusData.Type..'[[Category:'..focusData.Type..' Mods]]', 'type')
			:row('MaxRank', '%s', focusData.MaxRank, 'max-rank')
			:row('Introduced', '%s', focusData.Introduced and '{{ver|'..focusData.Introduced..'}}[[Category:Update '..focusData.Introduced:sub(1, (string.find(focusData.Introduced, '%.') or 0) - 1)..']]', 'introduced')
		:done()
	
	return frame:preprocess(tostring(Infobox))
end
}
