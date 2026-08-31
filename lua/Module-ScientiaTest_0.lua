local p = {}

local I18n = require('Module:I18n').loadMessages('w:c:User:Cephalon Scientia/general-i18n.json'):useUserLang()

function p.test()
	return I18n:msg( { key = 'rarity' } )
end

return p
