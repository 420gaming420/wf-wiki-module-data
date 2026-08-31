--- Arguments invocation argument extractor for Scribunto modules.
--  It is intended for use by other Lua modules, and should not be
--  called from an invocation (`#invoke`) directly.
--  
--  This module supports the following features:
--   * Trimming and blank argument removal.
--   * Argument inheritance between child and parent frames.
--   * Argument extraction for external modules and console input.
--   * Options to customise argument extraction behaviour.
--  
--  Forked from https://dev.fandom.com/wiki/Module:Arguments which is a fork of https://en.wikipedia.org/wiki/Module:Arguments
--  
--  @script             arguments
--  @release            stable
--  @note               The `args` table from the @{arguments.getArgs}
--                      function is a metatable for performance reasons.
--                      Thus, the table will not permit Lua table methods
--                      such as `#args`, @{next|next(args)}, and @{table}
--                      library functions.
--  @note               This module will eventually be adapted as a
--                      library in [[mw:gerrit:q/158323|MediaWiki
--                      core]], called as `require('getArgs')`. The core
--                      library will remove `options.parentOnly`.
--  @author             [[wikipedia:User:Mr. Stradivarius|Mr. Stradivarius]] (Wikipedia)
--  @author             [[wikipedia:User:Anomie|Anomie]] (Wikipedia)
--  @author             [[wikipedia:User:Jackmcbarn|Jackmcbarn]] (Wikipedia)
--  @author             [[User:Dessamator|Dessamator]]
--  @author             [[User:DarthKitty|DarthKitty]]
--  @attribution        [[wikipedia:Module:Arguments|Module:Arguments]] (Wikipedia)
--  @see                [[wikipedia:Module:Arguments|Original module on Wikipedia]]
--  @see                [[Module:Arguments/testcases|Test cases for this module]]
local arguments = {}

--  Module dependencies.
local i18n = require('Module:I18n').loadMessages('Arguments')
local util = require('libraryUtil')
local checkType = util.checkType

-- Four different value tidying functions.
-- This way, we don't have to check the options every time we call them.

--- Default value tidying function.
--  Trims parameter values automatically if they are defined strings.
--  Treats blank strings as `nil`.
--  @function           tidyValDefault
--  @param              {string|number} key MediaWiki parameter key.
--  @param              {string|nil} val MediaWiki parameter value,
--                      or nil if `key` is an empty string or nil.
--  @local
local function tidyValDefault(key, val)
    if type(val) == 'string' then
        val = val:match('^%s*(.-)%s*$')
        if val == '' then
            return nil
        else
            return val
        end
    else
        return val
    end
end

--- Value tidying function that trims values.
--  Trims parameter values automatically if they are defined strings.
--  @function           tidyValTrimOnly
--  @param              {string|number} key MediaWiki parameter key.
--  @param              {string|nil} val MediaWiki parameter value.
--  @local
local function tidyValTrimOnly(key, val)
    if type(val) == 'string' then
        return val:match('^%s*(.-)%s*$')
    else
        return val
    end
end

--- Value tidying function that removes blanks.
--  Removes blank values from the arguments table.
--  @function           tidyValRemoveBlanksOnly
--  @param              {string|number} key MediaWiki parameter key.
--  @param              {string|nil} val MediaWiki parameter value,
--                      or nil if `key` is whitespace or nil.
--  @local
local function tidyValRemoveBlanksOnly(key, val)
    if type(val) == 'string' then
        if val:find('%S') then
            return val
        else
            return nil
        end
    else
        return val
    end
end

--- Value tidying function that returns original value.
--  Effectively a NOOP function that does no value processing.
--  @function           tidyValNoChange
--  @param              {string|number} key MediaWiki parameter key.
--  @param              {string|nil} val MediaWiki parameter value.
--  @local
local function tidyValNoChange(key, val)
    return val
end

--- Parent template title match checker.
--  @function           matchesTitle
--  @param              {string|number|nil} given Local prefixed page
--                      title, or MediaWiki article ID (`wgArticleId`).
--  @param              {string} title Title of parent template.
--  @return             {boolean} Whether the `given` ID/title matches
--                      the title of the parent template.
local function matchesTitle(given, title)
    local tp = type( given )
    return (tp == 'string' or tp == 'number') and mw.title.new( given ).prefixedText == title
end

--- Default argument translation metatable.
--  @table              translate_mt
--  @local
local translate_mt = { __index = function(t, k) return k end }

--- Main argument extraction utility.
--  Arguments are memoized once fetched for optimal performance,
--  as with the `frame.args` metatable in Scribunto core.
--  
--  The default argument lookup behaviour uses the child frame arguments
--  first, then the parent frame arguments. There are numerous frame
--  options to change this behaviour.
--  
--  The default value tidying behaviour trims parameter values if they
--  are defined strings and treats blank strings as `nil`. This can be
--  customised in the `getArgs` options.
--  
--  @param              {frame|table} frame Scribunto frame object or
--                      Lua arguments table, passed from an invocation
--                      or Lua logic such as `frame:getParent()`.
--                      If this parameter does not have an `args` field
--                      and a `getParent` method, `frame` is assumed
--                      to be a Lua arguments table, such as the
--                      arguments from a named arguments call.
--  @param[opt]         {table} options Extraction/processing options.
--  @param[opt]         {boolean} options.trim
--                      Whether to trim the blank arguments present in
--                      the arguments table. Accepts `false` only.
--                      Default: `true`.
--  @param[opt]         {boolean} options.removeBlanks
--                      Whether to remove blank arguments from the
--                      arguments table. Does not shift sequential
--                      arguments removed by the processing stage.
--                      Accepts `false` only. Default: `true`.
--  @param[opt]         {function} options.valueFunc
--                      Custom value tidying function for use if the
--                      `trim` and `removeBlanks` options don't cover
--                      the developer's argument processing use case.
--  @param[opt]         {boolean} options.frameOnly
--                      Only read arguments from child frame (the
--                      `frame` parameter - usually invocation frame).
--  @param[opt]         {boolean} options.parentOnly
--                      Only read arguments from `frame` parent (the
--                      `frame` parameter - usually template frame).
--  @param[opt]         {boolean} options.parentFirst
--                      Argument lookup in the `frame` parent first,
--                      prioritised over the invocation frame arguments.
--  @param[opt]         {table} options.wrappers
--                      Individual value or array of values, listing
--                      wrapper title name(s) or article ID(s) to permit
--                      parent argument lookup from.
--  @param[opt]         {string|number} options.wrapper
--                      Alias of `options.wrappers` - contains title
--                      name or article ID to permit parent argument
--                      lookup from.
--  @param[opt]         {boolean} options.readOnly
--                      Whether to restrict write permissions to the
--                      arguments table. When set to a truthy value,
--                      an error will be thrown on any write attempt.
--  @param[opt]         {boolean} options.noOverwrite
--                      Whether to restrict overwrite attempts on
--                      existing argument keys in the arguments table.
--                      When set to a truthy value, an error will be
--                      thrown on any write attempt that would result
--                      in an existing argument being overwritten.
--  @param[opt]         {table} options.translate
--                      Map of parameter name aliases to their canonical
--                      argument parameter names.
--  @param[opt]         {table} options.backtranslate
--                      Map of canonical parameter names to their
--                      argument parameter aliases.
--                      Supersedes `options.translate` if both options
--                      are in use.
--  @error[opt,317]     'bad value assigned to option "valueFunc"
--                      (function expected, got $type)'
--  @error[opt,407]     'could not write to argument table key "$key";
--                      the table is read-only'
--  @error[opt,409]     'could not write to argument table key "$key";
--                      overwriting existing arguments is not permitted'
--  @return             {table} Arguments extracted from invocation.
--                      The argument data is embedded as a metatable in
--                      the exported table and cannot be accessed with
--                      the `#` operator or @{table} library methods.
--                      However, the exported table can be written to if
--                      the `options.readOnly` flag parameter is not
--                      truthy.
--  @usage
--      
--      local getArgs = require('Module:Arguments').getArgs
--      function p.main(frame)
--          local args = getArgs(frame, {
--              wrapper = 'Template:<TEMPLATE>'
--          })
--          -- Use the args table here.
--          -- A common paradigm is `return p._main(args)`.
--          -- This allows other Lua modules to access the
--          -- main logic in a performant manner without a
--          -- frame object.
--      end
--      
--  @note               Reference tags in the form of `<ref>` will
--                      generate phantom references when calling the
--                      @{pairs} iterator on the arguments table,
--                      **IF** the `<ref>` tag does not appear in the
--                      dependent module's wikitext output.
function arguments.getArgs(frame, options)
    checkType('getArgs', 1, frame, 'table', true)
    checkType('getArgs', 2, options, 'table', true)
    frame = frame or {}
    options = options or {}

    -- Set up argument translation.
    options.translate = options.translate or {}
    if getmetatable(options.translate) == nil then
        setmetatable(options.translate, translate_mt)
    end
    if options.backtranslate == nil then
        options.backtranslate = {}
        for k,v in pairs(options.translate) do
            options.backtranslate[v] = k
        end
    end
    if options.backtranslate and getmetatable(options.backtranslate) == nil then
        setmetatable(options.backtranslate, {
            __index = function(t, k)
                if options.translate[k] ~= k then
                    return nil
                else
                    return k
                end
            end
        })
    end

    -- Get the argument tables. If we were passed a valid frame object,
    -- get the frame arguments (fargs) and the parent frame arguments
    -- (pargs), depending on the options set and on the parent frame's
    -- availability. If we weren't passed a valid frame object, we are
    -- being called from another Lua module or from the debug console,
    -- so assume that we were passed a table of args directly, and
    -- assign it to a new variable (luaArgs).
    local fargs, pargs, luaArgs
    options.wrappers = options.wrappers or options.wrapper
    if
        type(frame.args) == 'table' and
        type(frame.getParent) == 'function'
    then
        -- The wrappers option makes Module:Arguments look up
        -- arguments in either the frame argument table or the
        -- parent argument table, but not both. This means that
        -- users can use either the #invoke syntax or a wrapper
        -- template without the loss of performance associated
        -- with looking arguments up in both the frame and the
        -- parent frame.
        -- The arguments will be fetched from the parent frame if
        -- the parent frame's title is present in options.wrapper;
        -- otherwise it will look up arguments in the frame object
        -- passed to getArgs.
        if options.wrappers then
            local parent = frame:getParent()
            if not parent then
                fargs = frame.args
            else
                local title = parent:getTitle():gsub('/sandbox$', '')
                local found = false
                if matchesTitle(options.wrappers, title) then
                    found = true
                elseif type(options.wrappers) == 'table' then
                    for _,v in pairs(options.wrappers) do
                        if matchesTitle(v, title) then
                            found = true
                            break
                        end
                    end
                end

                -- We test for false specifically here so that nil (the
                -- default) acts like true.
                if found or options.frameOnly == false then
                    pargs = parent.args
                end
                if not found or options.parentOnly == false then
                    fargs = frame.args
                end
            end
        -- When options.wrapper isn't set, check the other options.
        else
            if not options.parentOnly then
                fargs = frame.args
            end
            if not options.frameOnly then
                local parent = frame:getParent()
                pargs = parent and parent.args or nil
            end
        end
        if options.parentFirst then
            fargs, pargs = pargs, fargs
        end
    else
        luaArgs = frame
    end

    -- Set the order of precedence of the argument tables. If the variables are
    -- nil, nothing will be added to the table, which is how we avoid clashes
    -- between the frame/parent args and the Lua args.
    local argTables = {fargs}
    argTables[#argTables + 1] = pargs
    argTables[#argTables + 1] = luaArgs

    -- Generate the tidyVal function. If it has been specified by the user, we
    -- use that; if not, we choose one of four functions depending on the
    -- options chosen. This is so that we don't have to call the options table
    -- every time the function is called.
    local tidyVal = options.valueFunc
    if tidyVal then
        if type(tidyVal) ~= 'function' then
            error(i18n:msg('error-value-func', type(tidyVal)), 2)
        end
    elseif options.trim ~= false then
        if options.removeBlanks ~= false then
            tidyVal = tidyValDefault
        else
            tidyVal = tidyValTrimOnly
        end
    else
        if options.removeBlanks ~= false then
            tidyVal = tidyValRemoveBlanksOnly
        else
            tidyVal = tidyValNoChange
        end
    end

    -- Set up the args, metaArgs and nilArgs tables. args will be the one
    -- accessed from functions, and metaArgs will hold the actual arguments. Nil
    -- arguments are memoized in nilArgs, and the metatable connects all of them
    -- together.
    local args, metaArgs, nilArgs, metatable = {}, {}, {}, {}
    setmetatable(args, metatable)

    -- Accepts multiple tables as input and merges their keys and values
    -- into one table. If a value is already present it is not overwritten;
    -- tables listed earlier have precedence. We are also memoizing nil
    -- values, which can be overwritten if they are 's' (soft).
    local function mergeArgs(tables)
        for _, t in ipairs(tables) do
            for key, val in pairs(t) do
                if metaArgs[key] == nil and nilArgs[key] ~= 'h' then
                    local tidiedVal = tidyVal(key, val)
                    if tidiedVal == nil then
                        nilArgs[key] = 's'
                    else
                        metaArgs[key] = tidiedVal
                    end
                end
            end
        end
    end

    -- Define metatable behaviour. Arguments are memoized in the metaArgs table,
    -- and are only fetched from the argument tables once. Fetching arguments
    -- from the argument tables is the most resource-intensive step in this
    -- module, so we try and avoid it where possible. For this reason, nil
    -- arguments are also memoized, in the nilArgs table. Also, we keep a record
    -- in the metatable of when pairs and ipairs have been called, so we do not
    -- run pairs and ipairs on the argument tables more than once. We also do
    -- not run ipairs on fargs and pargs if pairs has already been run, as all
    -- the arguments will already have been copied over.

    -- Fetches an argument when the args table is indexed. First we check
    -- to see if the value is memoized, and if not we try and fetch it from
    -- the argument tables. When we check memoization, we need to check
    -- metaArgs before nilArgs, as both can be non-nil at the same time.
    -- If the argument is not present in metaArgs, we also check whether
    -- pairs has been run yet. If pairs has already been run, we return nil.
    -- This is because all the arguments will have already been copied into
    -- metaArgs by the mergeArgs function, meaning that any other arguments
    -- must be nil.
    metatable.__index = function (t, key)
        if type(key) == 'string' then
            key = options.translate[key]
        end
        local val = metaArgs[key]
        if val ~= nil then
            return val
        elseif metatable.donePairs or nilArgs[key] then
            return nil
        end
        for _, argTable in ipairs(argTables) do
            local argTableVal = tidyVal(key, argTable[key])
            if argTableVal ~= nil then
                metaArgs[key] = argTableVal
                return argTableVal
            end
        end
        nilArgs[key] = 'h'
        return nil
    end

    metatable.__newindex = function (t, key, val)
        -- This function is called when a module tries to add a new
        -- value to the args table, or tries to change an existing
        -- value.
        if type(key) == 'string' then
            key = options.translate[key]
        end
        if options.readOnly then
            error(i18n:msg('error-write-permission', tostring(key)), 2)
        elseif options.noOverwrite and args[key] ~= nil then
            error(i18n:msg('error-overwrite-permission', tostring(key)), 2)
        elseif val == nil then
            -- If the argument is to be overwritten with nil, we need to erase
            -- the value in metaArgs, so that __index, __pairs and __ipairs do
            -- not use a previous existing value, if present; and we also need
            -- to memoize the nil in nilArgs, so that the value isn't looked
            -- up in the argument tables if it is accessed again.
            metaArgs[key] = nil
            nilArgs[key] = 'h'
        else
            metaArgs[key] = val
        end
    end

    local function translatenext(invariant)
        local k, v = next(invariant.t, invariant.k)
        invariant.k = k
        if k == nil then
            return nil
        elseif type(k) ~= 'string' or not options.backtranslate then
            return k, v
        else
            local backtranslate = options.backtranslate[k]
            if backtranslate == nil then
                -- Skip this one. This is a tail call, so this
                -- won't cause stack overflow.
                return translatenext(invariant)
            else
                return backtranslate, v
            end
        end
    end

    -- This metamethod is called when pairs is run on the args table.
    metatable.__pairs = function ()
        if not metatable.donePairs then
            mergeArgs(argTables)
            metatable.donePairs = true
        end
        return translatenext, { t = metaArgs }
    end

    -- This custom `ipairs`-style iterator uses our __index metamethod.
    local function inext(t, i)
        local v = t[i + 1]
        if v ~= nil then
            return i + 1, v
        end
    end

    -- This metamethod is called when ipairs is run on the args table.
    metatable.__ipairs = function (t)
        return inext, t, 0
    end

    return args
end

return arguments
