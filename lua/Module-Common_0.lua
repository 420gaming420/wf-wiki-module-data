--- Common logic shared between [[w:c:dev]] Lua modules. Unused on the WARFRAME Wiki
--  except for storing shared localization messages on [[Module:Common/i18n]] subpage.
--  
--  Forked from https://dev.fandom.com/wiki/Module:Common
--  
--  @see                [[:Category:Infobox templates]]
--  @see                [[:Category:Installation templates]]
--  @module             common
--  @alias              p
--  
local p = {}

--  Module dependencies.
local entrypoint = require('Module:Entrypoint')

--- Computes the user-facing title of a documentation article.
--  This function is used to strip language subpages from the title, and/or
--  fetch title override arguments if necessary.
--  
--  @function           p.title
--  @param              {table} frame
--      Scribunto frame object.
--  @param              {table} frame.args
--      Invocation arguments table.
--  @param[opt]         {string} frame.args.Override
--      List of title override arguments delimited by `',%s+'`.
--  @returns            {string}
--      Title of article for infobox/installation template use.
--  @usage              {{common|title|Override = Code,code}}
function p.title(frame)
    local ret

    -- Support for template argument overrides.
    if
        frame.args and frame.args.Override and
        frame.getParent and frame:getParent()
    then
        local overrides = mw.text.split(frame.args.Override, ',%s+')
        for _, override in ipairs(overrides) do
            ret = title or frame:getParent().args[override]
        end
    end

    -- Determine infobox title from `wgTitle`.
    if not ret then
        local title = mw.title.getCurrentTitle()

        ret = #mw.language.fetchLanguageName(title.subpageText) == 0
            and title.text
            or  title.baseText

        if ret:find('^Global Lua Modules/') then
            ret = mw.text.split(ret, '/')[2]
        end
    end

    ret = ret
        :gsub('/testcases$', '')
        :gsub('/doc$', '')
        :gsub('/sandbox$', '')
        :gsub('/demo$', '')

    ret = mw.ustring.gsub(ret, '^%l', mw.ustring.upper)

    return ret
end

--  Template wrapper for [[Template:Common]].
--
--  @usage {{#invoke:common|main}}
--
--  @param {table} frame
--      Frame invocation object.
--  @returns {string|nil}
--      Package function output.
p.main = entrypoint(p)

return p
