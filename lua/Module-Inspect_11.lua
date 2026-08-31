--  
--- Inspect transforms Lua into a human-readable representation.
--  The objective here is human understanding (i.e. for debugging), not
--  serialization or compactness. The consistent reconstruction of Lua
--  values is not possible from the string representation, because of items
--  appearing as `<table>`, `<metatable>` or `<function>` in certain cases.
--  
--  Historically, this module could serve as a polyfill for the `mw.dumpObject`
--  function which was available in Scribunto core but was missing on Fandom.
--
--  That function is now available on Fandom as well, though the Inspect library
--  still provides a few additional features.
--  
--  Forked from https://dev.fandom.com/wiki/Module:Inspect which was a fork of https://github.com/kikito/inspect
--  
--  @script             inspect
--  @author             [[github::kikito|Enrique García Cota]] ([[github:kikito/inspect|Github]])
--  @author             [[User:DarthKitty|DarthKitty]]
--  @version            3.1.2+wikia:dev
--  @release            stable
--  @see                [[github:kikito/inspect.lua|Original module on Github.]]
local inspect = {}
inspect._VERSION = 'inspect.lua 3.1.2+wikia:dev'
inspect._URL = 'http://github.com/kikito/inspect.lua'
inspect._DESCRIPTION = 'human-readable representations of tables'
inspect._LICENSE = [[
    MIT LICENSE

    Copyright (c) 2013 Enrique García Cota

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

--  Global functions (optimisation).
local type, rawget, pcall, tostring = type, rawget, pcall, tostring
local char, format, rep = string.char, string.format, string.rep
local floor, huge, getmetatable = math.floor, math.huge, getmetatable
local sort, concat = table.sort, table.concat

local function rawpairs(t)
    return next, t, nil
end

--- Apostrophizes the string if it has quotes, but not aphostrophes.
--  Otherwise, it returns a regular quoted string.
local function smartQuote(str)
    if str:match('"') and not str:match("'") then
        return "'" .. str .. "'"
    end
    return '"' .. str:gsub('"', '\\"') .. '"'
end

--- Short (alphabetical) control character escape set.
--  @table              shortControlCharEscapes
--  @local
local shortControlCharEscapes = { -- \a => '\\a', \0 => nil
    ["\a"] = "\\a",  ["\b"] = "\\b", ["\f"] = "\\f", ["\n"] = "\\n",
    ["\r"] = "\\r",  ["\t"] = "\\t", ["\v"] = "\\v", ["\127"] = "\\127",
}

--- Long (numerical) control character escape set.
--  @table              longControlCharEscapes
--  @local
local longControlCharEscapes = {["\127"]="\127"} -- \a => nil, \0 => \000, 31 => \031
for i=0, 31 do
    local ch = char(i)
    if not shortControlCharEscapes[ch] then
        shortControlCharEscapes[ch] = "\\"..i
        longControlCharEscapes[ch]  = format("\\%03d", i)
    end
end
--longControlCharEscapes["\127"]="\\127"

--- Escapes string characters with backslashes.
local function escape(str)
    return (str:gsub("\\", "\\\\")
        :gsub("(%c)%f[0-9]", longControlCharEscapes)
        :gsub("%c", shortControlCharEscapes))
end

--- Whether identifier syntactic sugar can be used for key inspection.
local function isIdentifier(str)
    return type(str) == 'string' and str:match( "^[_%a][_%a%d]*$" )
end

--- Whether a key is part of a sequence.
local function isSequenceKey(k, sequenceLength)
    return type(k) == 'number'
        and 1 <= k
        and k <= sequenceLength
        and floor(k) == k
end

--- Order map for tables key types.
local defaultTypeOrders = {
    ['number']   = 1, ['boolean']  = 2, ['string'] = 3, ['table'] = 4,
    ['function'] = 5, ['userdata'] = 6, ['thread'] = 7
}

--- Sorts keys by type.
local function sortKeys(a, b)
    local ta, tb = type(a), type(b)

    -- strings and numbers are sorted numerically/alphabetically
    if ta == tb and (ta == 'string' or ta == 'number') then return a < b end

    local dta, dtb = defaultTypeOrders[ta], defaultTypeOrders[tb]
    -- Two default types are compared according to the defaultTypeOrders table
    if dta and dtb then return defaultTypeOrders[ta] < defaultTypeOrders[tb]
    elseif dta     then return true  -- default types before custom ones
    elseif dtb     then return false -- custom types after default ones
    end

    -- custom types are sorted out alphabetically
    return ta < tb
end

--- Custom length operator.
--  For implementation reasons, the behavior of rawlen & # is "undefined" when
--  tables aren't pure sequences. So we implement our own # operator.
local function getSequenceLength(t)
    local len = 1
    local v = rawget(t,len)
    while v ~= nil do
        len = len + 1
        v = rawget(t,len)
    end
    return len - 1
end

--- Getter for non-sequential key portion of a table.
local function getNonSequentialKeys(t)
    local keys, keysLength = {}, 0
    local sequenceLength = getSequenceLength(t)
    for k,_ in rawpairs(t) do
        if not isSequenceKey(k, sequenceLength) then
            keysLength = keysLength + 1
            keys[keysLength] = k
        end
    end
    sort(keys, sortKeys)
    return keys, keysLength, sequenceLength
end

--- Counter for table appearances for recursive loops in tables.
local function countTableAppearances(t, tableAppearances)
    tableAppearances = tableAppearances or {}

    if type(t) == 'table' then
        if not tableAppearances[t] then
            tableAppearances[t] = 1
            for k,v in rawpairs(t) do
                countTableAppearances(k, tableAppearances)
                countTableAppearances(v, tableAppearances)
            end
            countTableAppearances(getmetatable(t), tableAppearances)
        else
            tableAppearances[t] = tableAppearances[t] + 1
        end
    end

    return tableAppearances
end

--- Creates a copy of a Lua sequence.
local copySequence = function(s)
    local copy, len = {}, #s
    for i = 1, len do copy[i] = s[i] end
    return copy, len
end

--- Generates a path sequence to the index.
local function makePath(path, ...)
    local keys = {...}
    local newPath, len = copySequence(path)
    for i = 1, #keys do
        newPath[len + i] = keys[i]
    end
    return newPath
end

--- Recursive processing function for transformation.
local function processRecursive(process, item, path, visited)
    if item == nil then return nil end
    if visited[item] then return visited[item] end

    local processed = process(item, path)
    if type(processed) == 'table' then
        local processedCopy = {}
        visited[item] = processedCopy
        local processedKey

        for k,v in rawpairs(processed) do
            processedKey = processRecursive(process, k, makePath(path, k, inspect.KEY), visited)
            if processedKey ~= nil then
                processedCopy[processedKey] = processRecursive(process, v, makePath(path, processedKey), visited)
            end
        end

        local mt  = processRecursive(process, getmetatable(processed), makePath(path, inspect.METATABLE), visited)
        if type(mt) ~= 'table' then mt = nil end -- ignore not nil/table __metatable field
        setmetatable(processedCopy, mt)
        processed = processedCopy
    end
    return processed
end

--------------------------------------------------------------------------------
--  Inspector class, used for Lua value transformation.
--  @type               Inspector
--  @local
local Inspector = {}
local Inspector_mt = {__index = Inspector}

--- Inserts `...` into the inspector buffer.
--  @private
function Inspector:puts(...)
    local args   = {...}
    local buffer = self.buffer
    local len    = #buffer
    for i = 1, #args do
        len = len + 1
        buffer[len] = args[i]
    end
end

--- Used to indent the `f` buffer insertion.
--  @private
function Inspector:down(f)
    self.level = self.level + 1
    f()
    self.level = self.level - 1
end

--- Inserts a newline and starting indent into inspector buffer.
--  @private
function Inspector:tabify()
    self:puts(self.newline, rep(self.indent, self.level))
end

--- Whether a table/function is already present in buffer.
--  @private
function Inspector:alreadyVisited(v)
    return self.ids[v] ~= nil
end

--- Identifier getter for an identified table or function.
--  @private
function Inspector:getId(v)
    local id = self.ids[v]
    if not id then
        local tv = type(v)
        id              = (self.maxIds[tv] or 0) + 1
        self.maxIds[tv] = id
        self.ids[v]     = id
    end
    return tostring(id)
end

--- Inserts named (non-identifier) key into buffer.
--  @private
function Inspector:putKey(k)
    if isIdentifier(k) then return self:puts(k) end
    self:puts("[")
    self:putValue(k)
    self:puts("]")
end

--- Inserts string representation of table into buffer.
--  @private
function Inspector:putTable(t)
    if t == inspect.KEY or t == inspect.METATABLE then
        self:puts(tostring(t))
    elseif self:alreadyVisited(t) then
        self:puts('<table ', self:getId(t), '>')
    elseif self.level >= self.depth then
        self:puts('{...}')
    else
        if self.tableAppearances[t] > 1 then self:puts('<', self:getId(t), '>') end

        local nonSequentialKeys, nonSequentialKeysLength, sequenceLength = getNonSequentialKeys(t)
        local mt                = getmetatable(t)

        self:puts('{')
        self:down(function()
            local count = 0
            for i = 1, sequenceLength do
                if count > 0 then self:puts(',') end
                self:puts(' ')
                self:putValue(t[i])
                count = count + 1
            end

            for i = 1, nonSequentialKeysLength do
                local k = nonSequentialKeys[i]
                if count > 0 then self:puts(',') end
                self:tabify()
                self:putKey(k)
                self:puts(' = ')
                self:putValue(t[k])
                count = count + 1
            end

            if type(mt) == 'table' then
                if count > 0 then self:puts(',') end
                self:tabify()
                self:puts('<metatable> = ')
                self:putValue(mt)
            end
        end)

        if nonSequentialKeysLength > 0 or type(mt) == 'table' then -- result is multi-lined. Justify closing }
            self:tabify()
        elseif sequenceLength > 0 then -- array tables have one extra space before closing }
            self:puts(' ')
        end

        self:puts('}')
    end
end

--- Inserts string representation of value into buffer.
--  @private
function Inspector:putValue(v)
    local tv = type(v)

    if tv == 'string' then
        self:puts(smartQuote(escape(v)))
    elseif tv == 'number' or tv == 'boolean' or tv == 'nil' or
                 tv == 'cdata' or tv == 'ctype' then
        self:puts(tostring(v))
    elseif tv == 'table' then
        self:putTable(v)
    else
        self:puts('<', tv, ' ', self:getId(v), '>')
    end
end

--------------------------------------------------------------------------------
--  Transforms any Lua value into a human-readable representation.
--  @function           inspect.inspect
--  @alias              inspect
--  @param              {table|function|number|string|boolean} root
--                      Lua value to transform into string.
--  @param[opt]         {table} options
--                      Configuration options for transformation.
--  @param[opt]         {number} options.depth
--                      Maximum depth to print inside a table before table
--                      truncation occurs in the form `{...}`. Default:
--                      @{math.huge}.
--  @param[opt]         {number} options.newline
--                      Newline character to insert before dictionary keys.
--                      Default: `"\n"`.
--  @param[opt]         {number} options.indent
--                      Indentation to insert before keys or sequential values.
--                      Default: `"  "`.
--  @param[opt]         {function} options.process
--                      Returns the `item` if the inspected table is displayed.
--                      Signature: `function(item, path)`.
--                       ** `item` Either a key or value on the table/subtables.
--                       ** `path` Sequence representing root index keys used to
--                      reach `item`.
--                         *** Values have a regular list of keys. Example: to
--                      index `1` in `{a = {b = 1}}`, the path is `{'a', 'b'}`.
--                         *** Keys have a list of keys followed by the enum
--                      @{inspect.KEY}. Example: to index `c` in `{a = {b =
--                      {c=1}}}`, the path is `{'a', 'b', 'c', inspect.KEY
--                      }`.
--                         *** Metatables have a list of keys followed by the
--                      enum @{inspect.METATABLE}. Example: to index `{b=1}`'s
--                      metatable in `{a = {b=1}}`, the path's `{'a', {b=1},
--                      inspect.METATABLE}`.
--  @return             {string} Human-readable representation of `root`.
--                       * Primitives (`boolean` or `nil`) are converted into an
--                      executable string representation of the value.
--                       * Strings are converted into quoted strings with
--                      backslash escapes if they contain special characters.
--                       * Tables are converted into a human-readable
--                      representation. The keys will be sorted alphanumerically
--                      when possible.
--                         ** Array keys are rendered horizontally.
--                         ** Dictionary keys are rendered one element per line.
--                         ** Metatables are rendered with the `<metatable>`
--                        field.
--                         ** Repeated tables are serialised as `<%d>` first,
--                        then `<table %d>`.
--                         ** Recursive table loops are serialised as `<table
--                        %d>`.
--                       * Functions are serialised as `<function %d>`.
--  @usage
--  
--      -- Primitives.
--      assert(inspect(nil) == "nil")
--      assert(inspect(1) == "1")
--      assert(inspect("Hello") == '"Hello"')
--  
--  @usage
--  
--      -- Array-like table.
--      assert(inspect({1,2,3,4}) == "{ 1, 2, 3, 4 }")
--  
--  @usage
--  
--      -- Dictionary-like table.
--      assert(inspect({a=1,b=2}) == [[{
--        a = 1,
--        b = 2
--      }]])
--  
--  @usage
--  
--      -- Hybrid dictionary-array table.
--      assert(inspect({1,2,3,b=2,a=1}) == [[{ 1, 2, 3,
--        a = 1,
--        b = 2
--      }]])
--  
--  @usage
--  
--      -- Table with a subtable and function.
--      assert(inspect({a={f=tostring}}) == [[{
--        a = {
--          f = <function 1>
--        }
--      }]])
--  
--  @usage
--  
--      -- Table with a metatable.
--      assert(inspect(setmetatable({a=1}, {b=2}) == [[{
--        a = 1
--        <metatable> = {
--          b = 2
--        }
--      }]]))
--  
--  @usage
--  
--      -- Table with a recursive loop.
--      local a = {1, 2}
--      local b = {3, 4, a}
--      a[3] = b -- a references b, and b references a
--      assert(inspect(a) == "<1>{ 1, 2, { 3, 4, <table 1> } }")
--  
--  @usage
--  
--      -- `options.depth`.
--      assert(inspect(t5, {depth = 2}) == [[{
--        a = {
--          b = {...}
--        }
--      }]])
--  
--  @usage
--  
--      -- `options.newline` & `options.indent`.
--      assert(inspect(
--          t,
--          {newline='@', indent="++"}),
--          "{@++a = {@++++b = 1@++}@}"
--      )
--  
--  @usage
--  
--      -- `options.process` metatable removal.
--      local account = { 'peter', 'GlaHquq0' }
--      local account_mt = { __tostring = inspect }
--      setmetatable(account, account_mt)
--      
--      local remove_mt = function(item) -- removes specific metatable
--          if item ~= account_mt then return item end
--      end
--      
--      assert(inspect(t, {process = remove_mt}) == "{ 'peter', 'GlaHquq0' }")
--      
--      local remove_all_metatables = function(item, path)
--          if path[#path] ~= inspect.METATABLE then return item end
--      end
--      
--      assert(inspect(t, {process = remove_all_metatables}) == "{ 'peter', 'GlaHquq0' }")
--      
--  @usage
--  
--      -- `options.process` item filtering.
--      local anonymize_password = function(item, path)
--        if path[#path] == 2 then return item:gsub('.', '●') end
--        return item
--      end
--      
--      assert(inspect(info, {process = anonymize_password}) == "{ 'peter', '●●●●●●●●' }" )
--  
function inspect.inspect(root, options)
    options       = options or {}

    local depth   = options.depth   or huge
    local newline = options.newline or '\n'
    local indent  = options.indent  or '  '
    local process = options.process

    if process then
        root = processRecursive(process, root, {}, {})
    end

    local inspector = setmetatable({
        depth            = depth,
        level            = 0,
        buffer           = {},
        ids              = {},
        maxIds           = {},
        newline          = newline,
        indent           = indent,
        tableAppearances = countTableAppearances(root)
    }, Inspector_mt)

    inspector:putValue(root)

    return concat(inspector.buffer)
end

setmetatable(inspect, { __call = function(_, ...) return inspect.inspect(...) end })

--- Processing enumerable for a key in inspection paths.
--  @member             {table} inspect.KEY
inspect.KEY       = setmetatable({}, { __tostring = function() return 'inspect.KEY' end })

--- Processing enumerable for a metatable in inspection paths.
--  @member             {table} inspect.METATABLE
inspect.METATABLE = setmetatable({}, { __tostring = function() return 'inspect.METATABLE' end })

return inspect
