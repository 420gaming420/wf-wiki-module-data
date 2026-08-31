local p = {}

--  Module dependencies.
local title = mw.title.getCurrentTitle()
local i18n = require('Dev:I18n').loadMessages('Docbunto')
local references = mw.loadData('Dev:Docbunto/references')
local lexer = require('Dev:Lexer')
local unindent = require('Dev:Unindent')
local yesno = require('Dev:Yesno')

--  Module variables.
local DEV_WIKI = 'https://dev.fandom.com'
local DEFAULT_TITLE = title.text:gsub('^Module/', ''):gsub('/.*', '')
local frame, gsub, match

--  Docbunto variables & tag tokens.
local TAG_MULTI = 'M'
local TAG_ID = 'ID'
local TAG_SINGLE = 'S'
local TAG_TYPE = 'T'
local TAG_FLAG = 'N'
local TAG_MULTI_LINE = 'ML'

--  Docbunto processing patterns.
local DOCBUNTO_SUMMARY, DOCBUNTO_TYPE, DOCBUNTO_CONCAT
local DOCBUNTO_TAG, DOCBUNTO_TAG_VALUE, DOCBUNTO_TAG_MOD_VALUE

--  Docbunto private logic.

--- Pattern configuration function.
--  Resets patterns for each documentation build.
--  @function           configure_patterns
--  @param              {table} options Configuration options.
--  @param              {boolean} options.colon Colon mode.
--  @local
local function configure_patterns(options)
    -- Setup Unicode or ASCII character encoding (optimisation).
    gsub = options.unicode and mw.ustring.gsub or string.gsub
    match = options.unicode and mw.ustring.match or string.match
    DOCBUNTO_SUMMARY =
        options.iso639_th
            and '^[^ ]+'
            or
        options.unicode
            and '^[^.։。।෴۔።]+[.։。।෴۔።]?'
            or  '^[^.]+%.?'
    DOCBUNTO_CONCAT = ' '

    -- Setup parsing tag patterns with colon mode support.
    DOCBUNTO_TAG = options.colon and '^%s*(%w+):' or '^%s*@(%w+)'
    DOCBUNTO_TAG_VALUE = DOCBUNTO_TAG .. '(.*)'
    DOCBUNTO_TAG_MOD_VALUE = DOCBUNTO_TAG .. '%[([^%]]*)%](.*)'
    DOCBUNTO_TYPE = '^{({*[^}]+}*)}%s*'
end

function p.codeLint(frame)
    local modname = frame and frame.args[1] or DEFAULT_TITLE
    options = options or {}

    local filepath = mw.site.namespaces[828].name .. ':' .. modname
    local content = mw.title.new(filepath):getContent()

    -- Content checks.
    if not content then
        error(i18n:msg('no-content', filepath))
    end
    if
        not content:match('%-%-%-') and
        not content:match(options.colon and '%s+%w+:' or '%s+@%w+')
    then
        error(i18n:msg('no-markup', filepath))
    end

    -- Remove leading escapes.
    content = content:gsub('^%-%-+%s*<[^>]+>\n', '')

    -- Remove closing pretty comments.
    content = content:gsub('\n%-%-%-%-%-+(\n[^-]+)', '\n-- %1')

    -- Remove boilerplate block comments.
    if options.boilerplate then
        content = content:gsub('^%-%-%[=*%[\n.-\n%-?%-?%]%=*]%-?%-?%s+', '')
        content = content:gsub('%s+%-%-%[=*%[\n.-\n%-?%-?%]%=*]%-?%-?$', '')
    end

    -- Configure patterns for colon mode and Unicode character encoding.
    options.unicode = type(content:find('[^%w%c%p%s]+')) == 'number'
    options.iso639_th = type(content:find('\224\184[\129-\155]')) == 'number'
    configure_patterns(options)

    -- Content lexing.
    local lines = lexer(content)
    local tokens = {}
    local dummy_token = {
        data = '',
        posFirst = 1,
        posLast = 1
    }
    local token_closure = 0
    for _, line in ipairs(lines) do
        if #line == 0 then
            dummy_token.type = token_closure == 0
                and 'whitespace'
                or  tokens[#tokens].type
            table.insert(tokens, mw.clone(dummy_token))
        else
            for _, token in ipairs(line) do
                 if token.data:find('^%[=*%[$') or token.data:find('^%-%-%[=*%[$') then
                    token_closure = 1
                end
                if token.data:find(']=*]') then
                    token_closure = 0
                end
                table.insert(tokens, token)
            end
        end
    end
    
    local byLine = {}
    local indent = {}
    for line in string.gmatch(content, '([^\n]*)\n?') do
    	line = line:gsub('%s+$', ''):gsub('^%s+', ''):gsub('\t+$', ''):gsub('^\t+', '')	-- Removing trailing whitespace
		table.insert(byLine, table.concat(indent)..line)
    	-- Increase indentation level
    	-- for if/then, elseif/then, else
    	-- function(), for/do, while/do, repeat..until
    	local keywordIndex = line:find('function') or line:find('then') or line:find('else') or line:find('do') or line:find('repeat')
    	local commentIndex = line:find('--')
    	-- Need to also check if keyword is commented out (e.g. LuaDoc @function tokens)
    	if (keywordIndex ~= nil and (commentIndex == nil or (keywordIndex < commentIndex))) then
    		table.insert(indent, '\t')	
    	elseif (line == 'end' or string.find(line, 'until') ~= nil) then
    		table.remove(indent, 1)	-- Remove indentation level
    	end
	end
	
	return frame:preprocess(mw.dumpObject(byLine)..'<pre>\n'..table.concat(byLine, '\n')..'\n</pre>')
	
    -- -- Start documentation data.
    -- local documentation = {}
    -- documentation.filename = filepath
    -- documentation.description = ''
    -- documentation.code = content
    -- documentation.comments = {}
    -- documentation.tags = {}
    -- documentation.items = {}
    -- local line_no = 0
    -- local item_no = 0

    -- -- Taglet tracking variables.
    -- local start_mode = true
    -- local comment_mode = false
    -- local doctag_mode = false
    -- local export_mode = false
    -- local special_tag = false
    -- local factory_mode = false
    -- local return_mode = false
    -- local comment_tail = ''
    -- local tag_name = ''
    -- local new_item = false
    -- local new_tag = false
    -- local new_item_code = false
    -- local code_block = false
    -- local pretty_comment = false
    -- local comment_brace = false

    -- local t, i = tokens[1], 1

    -- pcall(function()

    -- while t do
    --     -- Taglet variable update.
    --     new_item = t.data:find('^%-%-%-') or t.data:find('^%-%-%[%[$')
    --     comment_tail = t.data:gsub('^%-%-+', '')
    --     tag_name = comment_tail:match(DOCBUNTO_TAG)
    --     tag_name = p.tags._alias[tag_name] or tag_name
    --     new_tag = p.tags[tag_name]
    --     pretty_comment =
    --         t.data:find('^%-+$')           or
    --         t.data:find('[^-]+%-%-+%s*$')  or
    --         t.data:find('</?nowiki>')      or
    --         t.data:find('</?pre>')
    --     comment_brace =
    --         t.data:find('^%-%-%[%[$') or
    --         t.data:find('^%-%-%]%]$') or
    --         t.data:find('^%]%]%-%-$')
    --     pragma_mode = tag_name == 'pragma'
    --     export_mode = tag_name == 'export'
    --     special_tag = pragma_mode or export_mode
    --     local tags, subtokens, sep

    --     -- Line counter.
    --     if t.posFirst == 1 then
    --         line_no = line_no + 1
    --     end

    --     -- Data insertion logic.
    --     if t.type == 'comment' then
    --         if new_item then comment_mode = true end

    --         -- Module-level documentation taglet.
    --         if start_mode then
    --             table.insert(documentation.comments, t.data)

    --             if comment_mode and not new_tag and not doctag_mode and not comment_brace and not pretty_comment then
    --                 sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
    --                     and '\n'
    --                     or  (#documentation.description ~= 0 and DOCBUNTO_CONCAT or '')
    --                 documentation.description = documentation.description .. sep .. mw.text.trim(comment_tail)
    --             end

    --             if new_tag and not special_tag then
    --                 doctag_mode = true
    --                 table.insert(documentation.tags, process_tag(comment_tail))

    --             elseif doctag_mode and not comment_brace and not pretty_comment then
    --                 tags = documentation.tags
    --                 if p.tags[tags[#tags].name] == TAG_MULTI then
    --                     sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
    --                         and '\n'
    --                         or  DOCBUNTO_CONCAT
    --                     tags[#tags].value = tags[#tags].value .. sep .. mw.text.trim(comment_tail)
    --                 elseif p.tags[tags[#tags].name] == TAG_MULTI_LINE then
    --                     tags[#tags].value = tags[#tags].value .. '\n' .. comment_tail
    --                 end
    --             end
    --         end

    --         -- Documentation item detection.
    --         if not start_mode and (new_item or (new_tag and tokens[i - 1].type ~= 'comment')) and not special_tag then
    --             table.insert(documentation.items, {})
    --             item_no = item_no + 1
    --             documentation.items[item_no].lineno = line_no
    --             documentation.items[item_no].code = ''
    --             documentation.items[item_no].comments = {}
    --             documentation.items[item_no].description = ''
    --             documentation.items[item_no].tags = {}
    --         end

    --         if not start_mode and comment_mode and not new_tag and not doctag_mode and not comment_brace and not pretty_comment then
    --             sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
    --                 and '\n'
    --                 or  (#documentation.items[item_no].description ~= 0 and DOCBUNTO_CONCAT or '')
    --             documentation.items[item_no].description =
    --                 documentation.items[item_no].description ..
    --                 sep ..
    --                 mw.text.trim(comment_tail)
    --         end

    --         if not start_mode and new_tag and not special_tag then
    --             doctag_mode = true
    --             table.insert(documentation.items[item_no].tags, process_tag(comment_tail))

    --         elseif not start_mode and doctag_mode and not comment_brace and not pretty_comment then
    --             tags = documentation.items[item_no].tags
    --             if p.tags[tags[#tags].name] == TAG_MULTI then
    --                 sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
    --                     and '\n'
    --                     or  DOCBUNTO_CONCAT
    --                 tags[#tags].value = tags[#tags].value .. sep .. mw.text.trim(comment_tail)
    --             elseif p.tags[tags[#tags].name] == TAG_MULTI_LINE then
    --                 tags[#tags].value = tags[#tags].value .. '\n' .. comment_tail
    --             end
    --         end

    --         if not start_mode and (comment_mode or doctag_mode) then
    --             table.insert(documentation.items[item_no].comments, t.data)
    --         end

    --         -- Export tag support.
    --         if export_mode then
    --             factory_mode = t.posFirst ~= 1
    --             if factory_mode then
    --                 documentation.items[item_no].exports = true
    --             else
    --                 documentation.exports = true
    --             end

    --             subtokens = {}
    --             while t and (not factory_mode or (factory_mode and t.data ~= 'end')) do
    --                 if factory_mode then
    --                     documentation.items[item_no].code =
    --                         documentation.items[item_no].code ..
    --                         (t.posFirst == 1 and '\n' or '') ..
    --                         t.data
    --                 end
    --                 t, i = tokens[i + 1], i + 1
    --                 if t and t.posFirst == 1 then
    --                     line_no = line_no + 1
    --                 end
    --                 if t and t.type ~= 'whitespace' and t.type ~= 'keyword' and t.type ~= 'comment' then
    --                     table.insert(subtokens, t)
    --                 end
    --             end

    --             local sep = {
    --                 ['{'] = true, ['}'] = true;
    --                 [','] = true, [';'] = true;
    --             }
    --             local increment = 0
    --             for index, subtoken in ipairs(subtokens) do
    --                 if
    --                     subtoken.type == 'ident' and
    --                     sep[subtokens[index + 1].data] and
    --                     (subtokens[index - 1].data == '=' or sep[subtokens[index - 1].data])
    --                 then
    --                     local t2, i2, alias = subtoken, index, ''
    --                     if subtokens[index - 1].data == '=' then
    --                         t2, i2 = subtokens[i2 - 2], i2 - 2
    --                     end
    --                     if not sep[subtokens[index - 1].data] then
	   --                     while not sep[t2.data] do
	   --                         alias = t2.data .. alias
	   --                         t2, i2 = subtokens[i2 - 1], i2 - 1
	   --                     end
    --                     end
    --                     if #alias == 0 then
    --                         increment = increment + 1
    --                         alias = '[' .. tostring(increment) .. ']'
    --                     end
    --                     export_item(documentation, subtoken.data, item_no, alias, factory_mode)
    --                 end
    --             end

    --             if not factory_mode then
    --                 break
    --             else
    --                 factory_mode = false
    --             end
    --         end

    --         -- Pragma tag support.
    --         if pragma_mode then
    --             tags = process_tag(comment_tail)
    --             options[tags.value] = yesno((next(tags.modifiers or {})), true)
    --             if options[tags.value] == nil then
    --                 options[tags.value] = true
    --             end
    --         end

    --     -- Data insertion logic.
    --     elseif comment_mode or doctag_mode then
    --         -- Package data post-processing.
    --         if start_mode then
    --             documentation.tags = hash_map(documentation.tags)
    --             documentation.name = extract_name(documentation, { project = true })
    --             documentation.info = extract_info(documentation)
    --             documentation.type = extract_type(documentation) or 'module'
    --             if #documentation.description ~= 0 then
    --                 documentation.summary = match(documentation.description, DOCBUNTO_SUMMARY)
    --                 documentation.description = gsub(documentation.description, DOCBUNTO_SUMMARY .. '%s*', '')
    --             end
    --             documentation.description = documentation.description:gsub('%s%s+', '\n\n')
    --             documentation.executable = p.tags._code_types[documentation.type] and true or false
    --             correct_subitem_tag(documentation)
    --             override_item_tag(documentation, 'name')
    --             override_item_tag(documentation, 'alias')
    --             override_item_tag(documentation, 'summary')
    --             override_item_tag(documentation, 'description')
    --             override_item_tag(documentation, 'class', 'type')
    --         end

    --         -- Item data post-processing.
    --         if item_no ~= 0 then
    --             documentation.items[item_no].tags = hash_map(documentation.items[item_no].tags)
    --             documentation.items[item_no].name = extract_name(documentation.items[item_no])
    --             documentation.items[item_no].type = extract_type(documentation.items[item_no])
    --             if #documentation.items[item_no].description ~= 0 then
    --                 documentation.items[item_no].summary = match(documentation.items[item_no].description, DOCBUNTO_SUMMARY)
    --                 documentation.items[item_no].description = gsub(documentation.items[item_no].description, DOCBUNTO_SUMMARY .. '%s*', '')
    --             end
    --             documentation.items[item_no].description = documentation.items[item_no].description:gsub('%s%s+', '\n\n')
    --             new_item_code = true
    --         end

    --         -- Documentation block reset.
    --         start_mode = false
    --         comment_mode = false
    --         doctag_mode = false
    --         export_mode = false
    --         pragma_mode = false
    --     end

    --     -- Don't concatenate module return value into item code.
    --     if t.data == 'return' and t.posFirst == 1 then
    --         return_mode = true
    --     end

    --     -- Item code concatenation.
    --     if item_no ~= 0 and not doctag_mode and not comment_mode and not return_mode then
    --         sep = #documentation.items[item_no].code ~= 0 and t.posFirst == 1 and '\n' or ''
    --         documentation.items[item_no].code = documentation.items[item_no].code .. sep .. t.data
    --         -- Code analysis on item head.
    --         if new_item_code and documentation.items[item_no].code:find('\n') then
    --             code_static_analysis(documentation.items[item_no])
    --             new_item_code = false
    --         end
    --     end

    --     t, i = tokens[i + 1], i + 1
    -- end

    -- documentation.lineno = line_no

    -- local package_name = (documentation.tags['alias'] or {}).value or documentation.name
    -- local package_alias = (documentation.tags['alias'] or {}).value or 'p'
    -- local export_ptn = '^%s([.[])'

    -- for _, item in ipairs(documentation.items) do
    --     if item.name == package_alias or (item.name and item.name:match('^' .. package_alias .. '[.[]')) then
    --         item.alias = item.name:gsub(export_ptn:format(package_alias), documentation.name .. '%1')
    --     end
    --     if
    --         item.name == package_name or
    --         (item.name and item.name:find(export_ptn:format(package_name))) or
    --         (item.alias and item.alias:find(export_ptn:format(package_name)))
    --     then
    --         item.export = true
    --     end
    --     if item.name and (item.name:find('[.:]') or item.name:find('%[[\'"]')) then
    --         item.hierarchy = mw.text.split((item.name:gsub('["\']?%]', '')), '[.:%[\'""]+')
    --     end
    --     item.type = item.type or ((item.alias or item.name or ''):find('[.[]') and 'member' or 'variable')
    --     correct_subitem_tag(item)
    --     override_item_tag(item, 'name')
    --     override_item_tag(item, 'alias')
    --     override_item_tag(item, 'summary')
    --     override_item_tag(item, 'description')
    --     override_item_tag(item, 'class', 'type')
    -- end

    -- -- Item sorting for documentation.
    -- table.sort(documentation.items, function(item1, item2)
    --     local inaccessible1 = item1.tags['local'] or item1.tags['private']
    --     local inaccessible2 = item2.tags['local'] or item2.tags['private']

    --     -- Send package items to the top.
    --     if item1.export and not item2.export then
    --         return true
    --     elseif item2.export and not item1.export then
    --         return false

    --     -- Send private items to the bottom.
    --     elseif inaccessible1 and not inaccessible2 then
    --         return false
    --     elseif inaccessible2 and not inaccessible1 then
    --         return true

    --     -- Optional alphabetical sort.
    --     elseif options.sort then
    --         return (item1.alias or item1.name) < (item2.alias or item2.name)

    --     -- Sort via source code order by default.
    --     else
    --         return item1.lineno < item2.lineno
    --     end
    -- end)

    -- end)

    -- return documentation
end

return p
