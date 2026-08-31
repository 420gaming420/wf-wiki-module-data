--- Language list generator.
--  
--  See docs at https://dev.fandom.com/wiki/Template:Language_list for usage info
--  
--  Forked from https://dev.fandom.com/wiki/Module:Language_list
--  
--  @alias p
--  @author [[User:OneTwoThreeFall|OneTwoThreeFall]]
--  @require [[Module:Yesno]]
--  @release stable
--  
local p = {}
local yesno = require('Module:Yesno')

--- For manual filling up the language list
--  Used in [[Template:Language list]]
--  @function	p.makeLanguageList
--  @param		{table} frame Frame object
--	@return		{string} Resultant wikitext of list
function p.makeLanguageList(frame)
    local args = frame:getParent().args
    local settings = {
        collapse = yesno(args.collapse),
        nocat = args.nocat and args.nocat ~= 'false',
    }

    if args['source-js'] then
        return p.listFromJavascript(args['source-js'], settings)
    elseif args['source-json'] then
        return p.listFromJson(args['source-json'], settings)
    elseif args['source-lua'] then
        return p.listFromLua(args['source-lua'], settings)
    else
        return p.listToWikitext(args, settings)
    end
end

--- For automatic filling up the language list
--  with languages from [[I18n-js]] JSON data pages
--  Used in [[Template:Infobox JavaScript]]
--  @function		p.makeLanguageListAuto
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of list
function p.makeLanguageListAuto(frame)
    local args = frame.args
    local settings = {
        nocat = args.nocat and args.nocat ~= 'false',
    }

    -- Get the current title
    local title = mw.title.getCurrentTitle()
    if title.namespace ~= 0 then
        -- Return if not in main namespace
        return 'Namespace not supported.'
    else
        -- Get the translation data page
        local pagename = title.rootText
        if pagename == 'I18n-js' then
            pagename = 'I18nEdit'
        end

        local translateLink = ' [[Special:BlankPage/I18nEdit/' .. pagename .. '|' .. args[1] .. ']]'

        -- Only add categories to pages that aren't subpages
        if title.isSubpage then
            settings.nocat = true
        else
            translateLink = translateLink .. '[[Category:Scripts using I18n-js]]'
        end

        return p.listFromJson('MediaWiki:Custom-' .. pagename .. '/i18n.json', settings) .. translateLink
    end
end

--- For automatic filling up the language list
--  with languages from a JSON-like page
--  @function	p.listFromJson
--  @param		{string} title Page title
--	@param		{table} settings Table of optional arguments
--	@return		{string} Resultant wikitext of list
function p.listFromJson(title, settings)
    local page = mw.title.new(title)
    local start = '{\n([ \t]+)"'

    if page.exists then
        -- Get content of JSON page and find all languages in it
        local content = page:getContent()
        local indent = content:match(start)

        if indent == nil then
            return 'Error: Page "' .. title .. '" does not seem to be JSON-like.'
        end

        -- Return the language list
        return p.keysToList(content, indent, settings)
    else
        return 'Error: Page "' .. title .. '" does not exist.'
    end
end

--- For automatic filling up the language list
--  with languages from a JavaScript code page
--  @function	p.listFromJavascript
--  @param		{string} title Page title
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listFromJavascript(title, settings)
    local page = mw.title.new(title)
    local start = '\n([ \t]+)// ?[Ll]anguage list %- start'
    local stop = '// ?[Ll]anguage list %- stop'

    if page.exists then
        -- Get content of code page and find all languages in it
        local content = page:getContent()

        local startPos = content:find(start)
        local _, stopPos = content:find(stop, startPos)

        if startPos == nil or stopPos == nil then
            return 'Error: Page "' .. title .. '" does not contain language list delimiters.'
        end

        local langContent = content:sub(startPos, stopPos)
        local indent = content:match(start)

        -- Return the language list
        return p.keysToList(langContent, indent, settings)
    else
        return 'Error: Page "' .. title .. '" does not exist.'
    end
end

--- For automatic filling up the language list
--  with languages from a Lua module data page
--  @function	p.listFromLua
--  @param		{string} title Page title
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listFromLua(title, settings)
    local success, data = pcall(mw.loadData, title)

    if success then
        -- Collect all the keys from the module's exported table
        local list = {}

        for key, value in pairs(data) do
            if key ~= 'qqq' and key ~= 'qqx' then
                list[#list + 1] = key
            end
        end

        -- 'pairs' uses no fixed order, so sort the list alphabetically
        table.sort(list)

        -- Return the language list
        return p.listToWikitext(list, settings)
    else
        return 'Error: Module data page "' .. title .. '" could not be loaded.'
    end
end

--- Search JSON data or JavaScript object and add language keys to list
--  @function	p.keysToList
--  @param		{string} content Page content
--  @param		{string} indent Indentation
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.keysToList(content, indent, settings)
    -- Find all language codes
    local matches = content:gmatch('\n' .. indent .. '["\']?([a-z-]+)')
    local list = {}

    for lang in matches do
        if lang ~= 'qqq' and lang ~= 'qqx' then
            list[#list + 1] = lang
        end
    end

    -- Return the language list
    return p.listToWikitext(list, settings)
end

--- List generator
--  @function	p.listToWikitext
--  @param		{table} args Table of required arguments
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listToWikitext(args, settings)
    local list = mw.html.create('ul'):addClass('language-list')
    local link = args.link

    -- If collapse isn't set and there are 5 or more languages, automatically collapse the list
    if settings.collapse == nil and args[5] ~= nil then
        settings.collapse = true
    end

    -- add collapsible classes if requested
    if settings.collapse then
        list:addClass('mw-collapsible mw-collapsed')
    end

    for index, value in ipairs(args) do
        value = mw.text.trim(value)
        local listItem = list:tag('li')
        local lang = mw.language.fetchLanguageName(value)
        local text = (lang ~= '' and lang) or value

        -- use either a specific or generic link
        -- if generic, substitute $1 for the current language code
        if  args[value] then
            text = '[[' .. args[value] .. '|' .. text .. ']]'
        elseif link then
            text = '[[' .. mw.ustring.gsub(link, '$1', value) .. '|' .. text .. ']]'
        end

        listItem:wikitext(text)

        -- for recognised languages, append the language code in brackets and add category
    	local langObj = mw.language.getContentLanguage()
        if lang ~= '' then
            listItem:tag('small')
                :wikitext(' (' .. value .. ')')
            if not settings.nocat then
                listItem:wikitext('[[Category:Translated scripts/' .. langObj:ucfirst(lang) .. ']]')
            end
        end
    end

    return tostring(list)
end

return p
