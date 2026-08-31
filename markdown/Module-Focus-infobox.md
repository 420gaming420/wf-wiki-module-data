---
title: "Module:Focus/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Focus/infobox"
wiki_timestamp: "2022-04-25T17:14:27Z"
---

*Documentation for this module may be created at [Module:Focus/infobox/doc](/w/Module:Focus/infobox/doc?action=edit&redlink=1 "Module:Focus/infobox/doc (page does not exist)")*

```lua
--	
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Lang = mw.language.new('en')	-- Using for number formatting
local FocusData = mw.loadData([[Module:Focus/data]])

-- Mapping internal icon text to file links as stored on the wiki
local ICON_TEXT_MAP = {
	[''] = '[[File:Impact_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Puncture_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Slash_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Heat_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Cold_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Electricity_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Toxin_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Blast_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Radiation_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Gas_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Magnetic_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Viral_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Corrosive_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:VoidTearIcon_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:Tau_b.png|x16px|class=dark-invert]]',
	[''] = '[[File:AmmoMutation.png|x16px|class=dark-invert]]',
	[''] = '

---

',
	[''] = '[[File:IconEnergy.gif|x16px]]',
	[''] = '[[File:IconShield.png|x16px]]',
	[''] = ''
}

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local focusData = FocusData.Ways[name];
	
	local formattedFocusDesc = focusData.Description
	local damageTypeName = formattedFocusDesc:match('<[A-Z_]+>')	-- Matching strings in the form of ""
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
```

