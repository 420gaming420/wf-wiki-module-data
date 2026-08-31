-- 
--------------------------------------------------------------------------------
-- Infobox template module for [[w:c:dev]] documentation.
--
-- @see [[Category:Infobox templates]]
-- @usage {{#invoke:Infobox}}
-- @module infobox
-- @alias p
-- @version 1.1.2
-- @author Speedit
-- @author DarthKitty
--
-- @todo Fill holes in the documentation by replacing question marks.
-- @todo Use the already loaded data for sorting category data by name
--       instead of re-reading the page with mw.title.new in p.categoryDoc
--------------------------------------------------------------------------------
local p = {}
local yesno = require('Module:Yesno')
local userError = require('Module:UserError')
local wdsButton = require('Module:WDSButton')
local i18n = require('Module:I18n').loadMessages(
    'Infobox',
    'Common',
    'TestHarness'
)
local entrypoint = require('Module:Entrypoint')
local data = mw.loadData('Dev:Infobox/data') -- TODO: Unused on the wiki; contains category mappings unique to the Fandom Dev wiki; decouple code from accessing this table to prevent things from breaking when wiki is forked
local title = mw.title.getCurrentTitle()

--------------------------------------------------------------------------------
-- Date formatter utility.
--
-- @see [[Template:FormatDate]]
--
-- @param {string} d
--     Unprocessed date.
-- @param {string} f
--     Date format to use.
-- @returns {string}
--     Formatted, localised date.
--------------------------------------------------------------------------------
local function dtfm(d, f)
    return mw.getCurrentFrame():expandTemplate{
        title = 'FormatDate',
        args = {
            [1] = d,
            dateformat = f,
            uselang = i18n:getLang()
        }
    }
end

--------------------------------------------------------------------------------
-- Breadcrumb link generator.
--
-- @param {string} t
--     Breadcrumb part.
-- @param {table} parts
--     Collection of title parts.
-- @returns {string}
--     Breadcrumb chunk.
--------------------------------------------------------------------------------
local function crumbpart(parts)
    local d = #parts

    return table.concat({
        (d == 1 and '< ' or ' | '),
        '[[',
        table.concat(parts, '/'),
        '|',
        parts[d],
        ']]'
    })
end

--------------------------------------------------------------------------------
-- Infobox breadcrumb generator for mobile.
--
-- @see [[Template:Breadcrumb]]
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Breadcrumb designed for mobile.
--------------------------------------------------------------------------------
function p.breadcrumbs(frame)
    local parts = {}
    local ret = mw.html.create('center')

    for t in tostring(title.fullText):gmatch('[^/]+') do
        table.insert(parts, t)
        ret:wikitext(crumbpart(parts))
    end

    return frame:preprocess(tostring(ret))
end

--------------------------------------------------------------------------------
-- Infobox data argument handler. Substitutes '$n' arguments with version
-- numbers.
--
-- @example `{{#invoke:infobox|data|{{{Data}}}|ucfirst=1}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @param {string} frame.args[1]
--     Infobox data input.
-- @param {string} frame.args.ucfirst
--     Capitalization boolean.
-- @throws {string}
--     'missing argument from Module:Infobox in p.data'
-- @returns {string}
--     Argument-substituted infobox data.
--------------------------------------------------------------------------------
function p.data(frame)
    if not (frame.args or {})[1] then
        error('missing argument from Module:Infobox in p.data')
    end

    local tArgs = frame:getParent().args
    local ret = frame.args[1]
    local uc1 = yesno(mw.text.trim(frame.args.ucfirst or ''))

    if not string.find(ret, '%$') then
        return ret
    end

    -- Argument substitution.
    local function repl(d)
        local rsub = d == '1'
            and (tArgs.Submodule or i18n:msg('original'))
            or (tArgs['Submodule' .. d] or i18n:msg('version', d))

        return uc1
            and rsub:gsub('^%l', mw.ustring.upper)
            or rsub
    end

    ret = ret:gsub('%$(%d+)', repl)

    return ret
end

--------------------------------------------------------------------------------
-- Infobox date list generator with version numbers.
--
-- @example `{{#invoke:infobox|date}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @param {string} frame.args
--     Invocation arguments.
-- @param {string} frame.args.ext
--     Code type.
-- @param {table} frame:getParent().args
--     Template arguments.
-- @returns {string}
--     Formatted multi-line date string.
--------------------------------------------------------------------------------
function p.date(frame)
    local tArgs = frame:getParent().args
    local dateFmt = tArgs.dateformat or ''
    local ret = ''

    if tArgs.Updated and #tArgs.Updated > 0 then
        -- Generated first formatted date.
        ret = dtfm(tArgs.Updated, dateFmt)

        if tArgs.Submodule or tArgs.Updated2 then
            -- Append first version tag.
            local sub1 = tArgs.Submodule or i18n:msg('original')

            if sub1 ~= '' then
                ret = ret .. ' (' .. sub1 .. ')'
            end
        end

        -- Handle further versions.
        for d = 2, math.huge do
            local p = tArgs['Updated' .. d]

            if not p then
                break
            end

            local s = tArgs['Submodule' .. d] or i18n:msg('version', d)

            ret = (d == 2 and '* ' or '') .. ret
                .. '\n* '
                .. dtfm(p, dateFmt)
                .. ' (' .. s .. ')'
        end

    -- Default date field.
    elseif tArgs.Code then
        -- @todo Use DPL template to extract main code page?
        local ext = frame.args.ext or 'js'
        local suffix = '.' .. ext

        if ext ~= 'css' then
            suffix = '/code' .. suffix
        end

        local u = frame:expandTemplate{
            title = 'Updated',
            args = {
                'MediaWiki:' .. title.baseText .. suffix
            }
        }

        ret = dtfm(u, dateFmt)
    end

    return ret
end

--------------------------------------------------------------------------------
-- Category formatter.
--
-- @param {table} tbl
--     Array of text items to be returned.
-- @param {string} cat
--     Category name.
-- @param {string} sortkey
--     Category sortkey.
--------------------------------------------------------------------------------
local function category(tbl, cat, sortkey)
    table.insert(tbl, '[[Category:')
    table.insert(tbl, cat)

    if sortkey and sortkey ~= '' then
        table.insert(tbl, '|')
        table.insert(tbl, sortkey)
    end

    table.insert(tbl, ']]')
end

--------------------------------------------------------------------------------
-- Returns error for missing description param in infobox.
--
-- @returns {string}
--     Error message and trancking category
--------------------------------------------------------------------------------
function p.description()
    return userError('Description missing', 'Content without description')
end

--------------------------------------------------------------------------------
-- Infobox category generator for type subcategorization.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Type categories corresponding to `Type` infobox argument.
--------------------------------------------------------------------------------
function p.categories(frame)
    local ret = {}
    local typ = frame.args[1]
    local tArgs = p.getParent(frame).args
    local catKeys = tArgs.Type

    if
        mw.ustring.lower(tArgs.Status or '') == 'archive' or
        not data.categories[typ or ''] or
        title.namespace ~= 0
    then
        return ''
    end

    local sortkey = tArgs.Title or title.prefixedText

    category(ret, typ, sortkey)
    table.insert(ret, '[[:Category:')
    table.insert(ret, typ)
    table.insert(ret, '|')
    table.insert(ret, typ)
    table.insert(ret, ']]')

    -- Maintenance category
    local REPORTCAT = 'Content without type categorization'
    local TYPEDOC = ':Category:' .. REPORTCAT .. '#Documentation'

    if catKeys then
        for v in mw.text.gsplit(mw.ustring.lower(catKeys), '%s*,%s*') do
            local cat = data.categories[typ][mw.text.trim(v)]

            if cat then
                category(ret, cat, sortkey)
            end
        end
    elseif typ == 'JavaScript' then
        table.insert(ret, '<br />')
        table.insert(ret, userError('Type categorization missing', REPORTCAT))
        table.insert(ret, ' ([[:' .. TYPEDOC .. '|')
        table.insert(
            ret,
            mw.message.new('oasis-more'):useDatabase(false):plain()
        )
        table.insert(ret, ']])')
    end

    return table.concat(ret)
end

--------------------------------------------------------------------------------
-- Category documentation generator.
--
-- @param {table} frame
--     Frame invocation object.
-- @param {table} frame.args
--     Frame argument table.
-- @param {string} frame.args[1]
--     Infobox type corresponding to [[Module:Infobox/data]].
-- @returns {string}
--     Table of types against descriptions.
--------------------------------------------------------------------------------
function p.categoryDoc(frame)
    local typ = frame.args[1] or ''
    local ret = mw.html.create('table'):attr {
        ['class'] = 'WikiaTable',
        ['border'] = '1',
        ['id'] = 'types'
    }
    
    ret:tag('tr')
        :tag('th'):wikitext(i18n:msg('type'))
        :done()
        :tag('th'):wikitext(i18n:msg('description'))
        :done()

    if
        not data.categories[typ] or
        not data.descriptions[typ]
    then
        return ret
    end

    -- Extract categories from data.
    local catData = {}
    local catNames = {}

    for k, n in pairs(data.categories[typ]) do
        if not catData[n] then
            catNames[#catNames + 1] = n
            catData[n] = {k}
        else
            catData[n][#catData[n] + 1] = k
        end

        if
            not catData[n].description and
            data.descriptions[typ][k]
        then
            catData[n].description = data.descriptions[typ][k]
        end
    end

    -- Sort category data by name.
    local dataContent = mw.title.new('Module:Infobox/data'):getContent()

    local function sortKey(a, b)
        local i1, i2 =
            dataContent:find('"' .. a .. '"'),
            dataContent:find('"' .. b .. '"')
        return i1 < i2
    end

    table.sort(catNames, sortKey)

    -- Render documentation table.
    local cat, catRow, catKeys, desc

    for i, n in ipairs(catNames) do
        cat = catData[n]
        catRow = ret:tag('tr')
        catKeys = catRow:tag('td')

        -- Handle multiple keys.
        if #cat >= 2 then
            catKeys = catKeys:tag('ul')

            for i, k in ipairs(cat) do
                catKeys
                    :tag('li'):tag('code')
                    :wikitext(k)
            end
        else
            catKeys
                :tag('code')
                :wikitext(cat[1])
        end

        -- Add description.
        desc = cat.description:gsub('^%l', mw.ustring.upper) .. '.'

        catRow:tag('td')
            :wikitext('[[:Category:' .. n .. ']]')
            :tag('p'):wikitext(desc)
    end

    return tostring(ret)
end

--------------------------------------------------------------------------------
-- Category description generator. Used on category pages to describe pages.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Category description followed by parent category link.
--------------------------------------------------------------------------------
function p.categoryDesc(frame)
    local typ = frame.args[1] or ''
    local key = frame.args[2] or ''
    local ret = data.messages.description

    local desc = (data.descriptions[typ] or {})[key]

    if not desc then
        error('misconfigured arguments in p.categoryDesc from Module:Install')
    end

    ret = ret:gsub('$1', desc) .. '[[Category:' .. typ .. '|{{SUBPAGENAME}}]]'

    return frame:preprocess(ret)
end

--------------------------------------------------------------------------------
-- Alias mapper for {{t|Infobox Lua}} `Type` argument.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Lua type (`'invocable'` or `'meta'`).
--------------------------------------------------------------------------------
function p.luaType(frame)
    local tArgs = frame:getParent().args
    local typ = tArgs.Type or tArgs.type

    return typ
        and data.luaTypes[typ:lower()]
        or ''
end

--------------------------------------------------------------------------------
-- Test suite status.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Test suite status badge.
--------------------------------------------------------------------------------
function p.luaSuite(frame)
    local page =
        frame:getParent().Code or
        mw.language.fetchLanguageName(title.baseText) == ''
            and title.baseText
            or title.baseText:match('/*([^/]+)$')
	
    -- DPL query for categories
    local query = table.concat({
        '{{#dpl:',
        '| debug = 0',
        '| mode = userformat',
        '| allowcachedresults = 1',
        '| category = Lua test suites',
        '| titleregexp = ^' .. mw.uri.encode(page, 'WIKI') .. '/testcases/doc$',
        '| addcategories = true',
        '| format = ,%CATNAMES%,,',
        '}}'
    }, '\n')
	
    -- Fetch category data.
    local cats = mw.text.split(frame:preprocess(query), ',')
    local i18n_key = data.luaStatus[cats[1] or ''] or 'unknown'
    
    if frame.args[1] == 'true' then i18n_key = 'passed';
    elseif frame.args[1] == 'false' then i18n_key = 'failed'; end
    
    local badge = mw.html.create('div')
        :addClass('plainlinks')
        :wikitext(
            '[' ..
            mw.site.server ..
            mw.uri.fullUrl('Module:' .. page .. '/testcases').path ..
            ' ' ..
            wdsButton._badge(i18n:msg(i18n_key), i18n_key) ..
            ']'
        )
	
    return tostring(badge)
end

--------------------------------------------------------------------------------
-- Template wrapper for [[Template:Infobox]].
--
-- @usage `{{#invoke:infobox|main}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string|nil}
--     Package function output.
--------------------------------------------------------------------------------
p.main = entrypoint(p)

--------------------------------------------------------------------------------
-- Returns topmost parent frame.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {table}
--     Highest parent frame.
--------------------------------------------------------------------------------
function p.getParent(frame)
    local cf = frame
    local pf = frame:getParent()

    if pf then
        return p.getParent(pf)
    else
        return cf
    end
end

return p
