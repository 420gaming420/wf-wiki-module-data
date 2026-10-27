---	'''Localization''' retrieves and stores [[WARFRAME]]'s localized messages as found in [[Public Export]].<br/>
--	
--	@module		localization
--	@alias		p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution    [[User:Akzani|Akzani]]
--	@image		
--	@release	stable
--	

local p = {}
local TextIcons = require([[Module:TextIcons]])

local SUPPORTED_FILES = {
	["Suits.json"] = true,
}

-- Exceptions for when Suits.json and InternalName in Warframes/data don't match.
local PASSIVE_NAME_EXCEPTIONS = {
    ["Infest"] = "Infestation", -- Nidus
}

-- Exceptions for path naming convention.
local PASSIVE_PATH_EXCEPTIONS = {
	["PacifistPassiveDesc"] = "Baruuk",
	["FrumentariusPassiveDesc"] = "Cyte-09",
	["PagemasterPassiveDesc"] = "Dante",
    ["PassiveAbilityBard"] = "Octavia",
    ["QorvexPassiveDesc"] = "Qorvex",
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

--- Resolves internal PH markup (e.g. DURATION) in localized Warframe passive descriptions using values from [[Module:Warframes/data]].
--  @function       resolvePassivePlaceholders
--  @param          {string} text Passive description containing PH markup
--  @param          {string} pathName Path of localization message
--  @return         {table} Values mapped to their PH markup, or nil if resolution fails
--  @local
local function resolvePassivePlaceholders(text, pathName)
	local frameName = pathName:match("^/Lotus/Language/Suits/(.-)PassiveAbility")

	local pathKey = pathName:match("^/Lotus/Language/Suits/(.+)$")

	if pathKey and PASSIVE_PATH_EXCEPTIONS[pathKey] then
		frameName = PASSIVE_PATH_EXCEPTIONS[pathKey]
	end

	if not frameName then
		return text, nil
	end

	local data = mw.loadData("Module:Warframes/data")
	local warframes = data.Warframes

	if not warframes then
		return text, nil
	end

	local warframe = warframes[frameName]

	-- If frameName from Suits.json fails, uses "InternalName" from Warframes/data (e.g. "Grendel" > "Devourer").
	if not warframe then
		local internalCodename =
		PASSIVE_NAME_EXCEPTIONS[frameName] or frameName

		local expectedPath =
		    "/Lotus/Powersuits/" .. internalCodename .. "/"

		for _, candidate in pairs(warframes) do
			local internalName = candidate.InternalName

			if internalName
				and internalName:find(expectedPath, 1, true)
				and candidate.Passive then
				warframe = candidate
				break
			end
		end
	end

	if not warframe or not warframe.Passive then
		return text, nil
	end

	local placeholders = {}
	local numbers = {}

	-- !!The following assumes that relevant descriptions in Suits.json and Warframes/data match closely, it is important for pairing values to PH markups.
	-- Extract PH names from Suits.json in order of appearance.
	for name in text:gmatch("|([%w_]+)|") do
        placeholders[#placeholders + 1] = name
	end

	-- Extract numeric values from Warframes/data in order of appearance.
	local passiveText = warframe.Passive

	-- Accounting for the "09" throwing off Cyte-09's entry.
	if frameName == "Cyte-09" then
		passiveText = passiveText:gsub("Cyte%-09", "")
	end

	for number in passiveText:gmatch("%d+%.?%d*") do
		numbers[#numbers + 1] = number
	end

	if #placeholders == 0 or #placeholders ~= #numbers then
        return text, nil
	end

	local values = {}

	-- Maps PH names to numeric values by position in their respective sequences.
	-- These mappings are subsequently applied by PH name (e.g. DURATION), regardless of their order in localizations since PH names are standardized.
	for i, name in ipairs(placeholders) do
        local value = numbers[i]

        if values[name] and values[name] ~= value then
            return text, nil
        end

        values[name] = value
	end

	return text, values
end

--- Returns associated localized message for a specific locale. For internal module use.
--  @function       p._getLocaleStringByPath
--  @param          {string} locale Supported WARFRAME locale, see [[Localization]] for details
--	@param			{string} pathName Path of localization message
--  @return         {string} Localized string
function p._getLocaleStringByPath(locale, pathName)
	local localizedStr = nil
	for fileName, _ in pairs(SUPPORTED_FILES) do
		local messages = p._getLocalizationMessages(fileName, pathName)
		if messages and messages[locale] then
			local text = messages[locale]

			-- Resolves PH passive values (replace .en with relevant language code to match Warframes/data).
			if messages.en then
			    local _, values = resolvePassivePlaceholders(messages.en, pathName)

			    if values then
			        text = text:gsub("|([%w_]+)|", function(name)
			            return values[name] or ("|" .. name .. "|")
			        end)
			    end
			end

			local tokens = {}

			-- Preserve TextIcon markup as tokens while encoding.
			text = text:gsub("<[%w_]+>", function(token)
				tokens[#tokens + 1] = token
				return "BeginToken" .. #tokens .. "End"
			end)

			-- Need to encode b/c sometimes item descriptions have special markup that may intefere with wikitext parser (e.g. Warframe passives)
			text = mw.text.encode(text)
			text = text:gsub("|", "&#124;")

			-- Restore tokens.
			text = text:gsub("BeginToken(%d+)End", function(index)
				return tokens[tonumber(index)]
			end)

			localizedStr = TextIcons.getIcon(text, {class = "icon"})

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
