---	'''Localization''' retrieves and stores [[WARFRAME]]'s localized messages as found in [[Public Export]].<br/>
--	
--	@module		localization
--	@alias		p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@release	stable
--	

local p = {}

local SUPPORTED_FILES = {
	["Suits.json"] = true,
}

--- Returns the table of localized messages of a particular message path.
--  @function       p._getLocalizationMessages
--  @param          {string} fileName Name of subpage as stored on the wiki (e.g. "Suits.json" for [[Module:Localization/Suits.json]])
--  @param          {string} messagePath Name of key for associated messages
--  @return         {table} Table of localized messages using WARFRAME's language codes
function p._getLocalizationMessages(fileName, messagePath)
	jsonAsLuaTable = mw.loadJsonData("Module:Localization/" .. fileName)
	
	return jsonAsLuaTable[messagePath]
end

--- Returns associated localized message for a specific locale. For internal module use.
--  @function       p._getLocaleStringByPath
--  @param          {string} locale Supported WARFRAME locale, see [[Localization]] for details
--	@param			{string} pathName Path of localization message
--  @return         {string} Localized string
function p._getLocaleStringByPath(locale, pathName)
	local localizedStr = nil
	for fileName, _ in pairs(SUPPORTED_FILES) do
		-- Need to encode b/c sometimes item descriptions have special markup that may intefere with wikitext parser (e.g. Warframe passives)
		localizedStr = mw.text.encode(p._getLocalizationMessages(fileName, pathName)[locale])
		localizedStr = localizedStr:gsub("|", "&#124;")	-- mw.text.encode doesn't apply to vertical bars
		if localizedStr ~= nil then
			break
		end
	end
	if localizedStr == nil then
		return error('M:Localization._getLocaleStringByPath(): Cannot find associated ' .. locale .. ' locale string for "' .. pathName '".')	
	end
	return localizedStr
end

--- Returns associated localized message for a specific locale.
--  @function       p._getLocaleStringByPath
--  @param          {object} frame Frame object; contains the localization path and the locale to find the translation for
--  @return         {string} Localized string
function p.getLocaleStringByPath(frame)
	local pathName = frame.args["path"]
	local locale = frame.args["locale"]
	return p._getLocaleStringByPath(locale, pathName)
end

return p
