--- Validation functions for Module:Honorias/data
-- @module      Honorias/data/validate
-- @alias       p
-- @require     [[Module:Honorias/data]], [[Module:Table]]
-- 

local p = {}

-- Load directly (sub-module returns honoriaData table)
local ModData = mw.loadData('Module:Honorias/data')
local Table = require('Module:Table')

-- List of keys every Honoria entry must have
local REQUIRED_KEYS = {
    'Name',
    'Link',
    'Position',
    'Introduced',
    'InternalName'
}

-- Type specification map for all supported fields
local DATA_TYPE_MAP = {
    _IgnoreEntry = 'boolean',
    Name = 'string',
    Link = 'string',
    Description = 'string',
    Position = 'string',
    Price = 'table',
    Introduced = 'string',
    InternalName = 'string',
    CodexSecret = 'boolean',
    ExcludeFromCodex = 'boolean',
    Tags = 'table'
}

-- Allowed values for specific string fields
local VALID_POSITIONS = {
    ['Prefix'] = true,
    ['Suffix'] = true,
    ['Suffix & Prefix'] = true
}

--- Checks if each Honoria entry has all mandatory keys.
--  @function       p.checkRequiredKeysExist
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of missing keys
function p.checkRequiredKeysExist(frame)
    local errors = { '<strong class="error">p.checkRequiredKeysExist(frame): There are a total of %d key-value errors</strong>' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            for _, requiredKey in ipairs(REQUIRED_KEYS) do
                if entryData[requiredKey] == nil or entryData[requiredKey] == '' then
                    local errorMsg = '# "[[%s]]" is missing required key <code>%s</code>'
                    table.insert(errors, string.format(errorMsg, entryName, requiredKey))
                end
            end
        end
    end

    if #errors == 1 then
        return '<span style="color:green; font-weight:bold;">No missing required keys found in Module:Honorias/data!</span>'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

--- Validates data types for all keys against DATA_TYPE_MAP.
--  @function       p.validateDataTypes
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of type mismatch errors
function p.validateDataTypes(frame)
    local errors = { '<strong class="error">p.validateDataTypes(frame): There are a total of %d type errors</strong>' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            for key, value in pairs(entryData) do
                if DATA_TYPE_MAP[key] == nil then
                    local errorMsg = '# "[[%s]]" contains an unsupported key <code>%s</code>'
                    table.insert(errors, string.format(errorMsg, entryName, key))
                elseif type(value) ~= DATA_TYPE_MAP[key] then
                    local errorMsg = '# "[[%s]]" contains a <code>%s</code> type instead of a <code>%s</code> type for <code>%s</code>'
                    table.insert(errors, string.format(errorMsg, entryName, type(value), DATA_TYPE_MAP[key], key))
                end
            end
        end
    end

    if #errors == 1 then
        return '<span style="color:green; font-weight:bold;">All data types are valid in Module:Honorias/data!</span>'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

--- Validates values for specific fields (Position, InternalName, Price values).
--  @function       p.validateFieldValues
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of value logic errors
function p.validateFieldValues(frame)
    local errors = { '<strong class="error">p.validateFieldValues(frame): There are a total of %d value errors</strong>' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            -- 1. Validate Position value
            if entryData.Position and not VALID_POSITIONS[entryData.Position] then
                local errorMsg = '# "[[%s]]" has invalid Position <code>%s</code> (expected "Prefix", "Suffix", or "Suffix & Prefix")'
                table.insert(errors, string.format(errorMsg, entryName, tostring(entryData.Position)))
            end

            -- 2. Validate InternalName path
            if entryData.InternalName and not string.match(entryData.InternalName, "^/Lotus/") then
                local errorMsg = '# "[[%s]]" has invalid InternalName <code>%s</code> (must start with /Lotus/)'
                table.insert(errors, string.format(errorMsg, entryName, entryData.InternalName))
            end

            -- 3. Validate Price table values
            if entryData.Price then
                for resource, amount in pairs(entryData.Price) do
                    if type(amount) ~= "number" or amount <= 0 then
                        local errorMsg = '# "[[%s]]" has invalid amount <code>%s</code> for resource <code>%s</code> in Price table'
                        table.insert(errors, string.format(errorMsg, entryName, tostring(amount), resource))
                    end
                end
            end
        end
    end

    if #errors == 1 then
        return '<span style="color:green; font-weight:bold;">All field values logic are valid in Module:Honorias/data!</span>'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

return p
