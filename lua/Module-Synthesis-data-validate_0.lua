--- Validation functions for Module:Synthesis/data
-- @module      Synthesis/data/validate
-- @alias       p
-- @require     [[Module:Synthesis/data]], [[Module:Table]]
-- 

local p = {}

-- Load directly (sub-module returns the Synthesis data table)
local ModData = mw.loadData('Module:Synthesis/data')
local Table = require('Module:Table')

-- List of keys every Synthesis entry must have
local REQUIRED_KEYS = {
    'Locations',
    'IsImprint',
    'Size'
}

-- Type specification map for all supported fields
local DATA_TYPE_MAP = {
    _IgnoreEntry = 'boolean',
    Locations = 'table',
    IsImprint = 'boolean',
    Size = 'string',
    ScanPoints = 'number',
    Standing = 'number',
}

-- Allowed values for the Size field
local VALID_SIZES = {
    ['Small'] = true,
    ['Big'] = true
}

--- Checks if each Synthesis entry has all mandatory keys.
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
        return '<span style="color:green; font-weight:bold;">No missing required keys found in Module:Synthesis/data!</span>'
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

                if key == "Locations" and type(value) == "table" then
                    for i, loc in ipairs(value) do
                        if type(loc) ~= "string" then
                            local errorMsg = '# "[[%s]]" has invalid type <code>%s</code> for Locations entry #%d (expected string)'
                            table.insert(errors, string.format(errorMsg, entryName, type(loc), i))
                        end
                    end
                end
            end
        end
    end

    if #errors == 1 then
        return '<span style="color:green; font-weight:bold;">All data types are valid in Module:Synthesis/data!</span>'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

--- Validates values for specific fields (Size, Locations, ScanPoints, Standing).
--  @function       p.validateFieldValues
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of value logic errors
function p.validateFieldValues(frame)
    local errors = { '<strong class="error">p.validateFieldValues(frame): There are a total of %d value errors</strong>' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            -- 1. Validate Size value
            if entryData.Size and not VALID_SIZES[entryData.Size] then
                local errorMsg = '# "[[%s]]" has invalid Size <code>%s</code> (expected "Small" or "Big")'
                table.insert(errors, string.format(errorMsg, entryName, tostring(entryData.Size)))
            end

            -- 2. Validate Locations entries are non-empty, trimmed strings
            -- NOTE: deliberately does NOT use "#entryData.Locations" to check emptiness.
            -- Tables returned by mw.loadData can report a length of 0 via the
            -- "#" operator even when ipairs(...) finds elements just fine (undefined
            -- behaviour of "#" on non-strict sequences per the Lua manual). Module:Synthesis
            -- itself works around this by rebuilding a fresh table through ipairs before
            -- ever calling "#" on it, so the validator does the same: count with ipairs.
            if entryData.Locations and type(entryData.Locations) == "table" then
                local locCount = 0
                for i, loc in ipairs(entryData.Locations) do
                    locCount = locCount + 1
                    if type(loc) == "string" then
                        local trimmed = mw.text.trim(loc)
                        if trimmed == '' then
                            local errorMsg = '# "[[%s]]" has an empty Locations entry #%d'
                            table.insert(errors, string.format(errorMsg, entryName, i))
                        elseif trimmed ~= loc then
                            -- Untrimmed entries silently break exact-match lookups against
                            -- [[Module:Missions/data]], so this is flagged rather than auto-fixed
                            local errorMsg = '# "[[%s]]" has an untrimmed Locations entry #%d: <code>"%s"</code>'
                            table.insert(errors, string.format(errorMsg, entryName, i, loc))
                        end
                    end
                end
                if locCount == 0 then
                    local errorMsg = '# "[[%s]]" has an empty Locations table'
                    table.insert(errors, string.format(errorMsg, entryName))
                end
            end

            -- 3. Validate ScanPoints is a positive number when present
            if entryData.ScanPoints ~= nil and (type(entryData.ScanPoints) ~= "number" or entryData.ScanPoints <= 0) then
                local errorMsg = '# "[[%s]]" has invalid ScanPoints <code>%s</code> (expected a positive number)'
                table.insert(errors, string.format(errorMsg, entryName, tostring(entryData.ScanPoints)))
            end

            -- 4. Validate Standing is a number when present (negative is allowed: it means "Unknown")
            if entryData.Standing ~= nil and type(entryData.Standing) ~= "number" then
                local errorMsg = '# "[[%s]]" has invalid Standing <code>%s</code> (expected a number)'
                table.insert(errors, string.format(errorMsg, entryName, tostring(entryData.Standing)))
            end
        end
    end

    if #errors == 1 then
        return '<span style="color:green; font-weight:bold;">All field values logic are valid in Module:Synthesis/data!</span>'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

return p
