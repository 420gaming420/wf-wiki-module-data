---
title: "Module:Honorias/data/validate"
wiki_url: "https://wiki.warframe.com/w/Module/Honorias/data/validate"
wiki_timestamp: "2026-09-04T10:53:54Z"
---

## Contents

* [1 Examples](#Examples)
  + [1.1 Checking for required keys](#Checking_for_required_keys)
  + [1.2 Validating data types of values](#Validating_data_types_of_values)
  + [1.3 Validating data types of values](#Validating_data_types_of_values_2)

## Examples

[[edit source](/w/Module:Honorias/data/validate/doc?action=edit&section=T-1 "Edit section's source code: Examples")]

`{{#invoke:Honorias/data/validate|checkRequiredKeysExist}}`

`{{#invoke:Honorias/data/validate|validateDataTypes}}`

`{{#invoke:Honorias/data/validate|validateFieldValues}}`

### Checking for required keys

[[edit source](/w/Module:Honorias/data/validate/doc?action=edit&section=T-2 "Edit section's source code: Checking for required keys")]

No missing required keys found in Module:Honorias/data!

### Validating data types of values

[[edit source](/w/Module:Honorias/data/validate/doc?action=edit&section=T-3 "Edit section's source code: Validating data types of values")]

All data types are valid in Module:Honorias/data!

### Validating data types of values

[[edit source](/w/Module:Honorias/data/validate/doc?action=edit&section=T-4 "Edit section's source code: Validating data types of values")]

All field values logic are valid in Module:Honorias/data!

---

```lua
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
    Tags = 'table',
    Rank = 'number'
}

-- Allowed values for specific string fields
local VALID_POSITIONS = {
    ['Prefix'] = true,
    ['Suffix'] = true,
    ['Suffix & Prefix'] = true
}

-- Allowed tags for the Tags field
local VALID_TAGS = {
	["Founder"] = true,				-- Exclusive for Founders
	["Nightwave"] = true,			-- Nora Night, Amir's Shockwave or any future Nightwave
	["Roathe"] = true,				-- Bought from Roathe at La Cathédrale 
	["Miscellaneous"] = true,		-- Other stuff
	["Follie's Hunt"] = true,		-- 
	["Archimedea"] = true,			-- 
	["Hunhow"] = true,				-- 
	["Quest"] = true,				-- 
	["Challenge"] = true,			-- 
	["KIM"] = true,					-- 
	["Open World"] = true,			-- 
	["Syndicate"] = true,			-- 
	["Mastery"] = true,				-- 
	["Descendia"] = true,			-- 
	["Adversary"] = true,			-- 
	["Boss Fight"] = true,			-- 
	["Perita"] = true,				-- 
	["Prime"] = true,				-- 
	["Focus"] = true,				-- 
	["Event"] = true,				-- 
	["Kuva"] = true,				-- 
	["Dog Days"] = true,			-- 
	["Technocyte Coda"] = true,		-- 
	["Tenet"] = true,				-- 
	["Insign"] = true,				-- 
	["Tektolyst Artifact"] = true,	-- 
}

--- Checks if each Honoria entry has all mandatory keys.
--  @function       p.checkRequiredKeysExist
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of missing keys
function p.checkRequiredKeysExist(frame)
    local errors = { 'p.checkRequiredKeysExist(frame): There are a total of %d key-value errors' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            for _, requiredKey in ipairs(REQUIRED_KEYS) do
                if entryData[requiredKey] == nil or entryData[requiredKey] == '' then
                    local errorMsg = '# "[[%s]]" is missing required key %s'
                    table.insert(errors, string.format(errorMsg, entryName, requiredKey))
                end
            end
        end
    end

    if #errors == 1 then
        return 'No missing required keys found in Module:Honorias/data!'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

--- Validates data types for all keys against DATA_TYPE_MAP.
--  @function       p.validateDataTypes
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of type mismatch errors
function p.validateDataTypes(frame)
    local errors = { 'p.validateDataTypes(frame): There are a total of %d type errors' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            for key, value in pairs(entryData) do
                if DATA_TYPE_MAP[key] == nil then
                    local errorMsg = '# "[[%s]]" contains an unsupported key %s'
                    table.insert(errors, string.format(errorMsg, entryName, key))
                elseif type(value) ~= DATA_TYPE_MAP[key] then
                    local errorMsg = '# "[[%s]]" contains a %s type instead of a %s type for %s'
                    table.insert(errors, string.format(errorMsg, entryName, type(value), DATA_TYPE_MAP[key], key))
                end

                if key == "Price" and type(value) == "table" then
                    for res, amt in pairs(value) do
                        local amtType = type(amt)
                        if amtType ~= "number" and amtType ~= "string" then
                            local errorMsg = '# "[[%s]]" has invalid type %s for resource %s in Price table'
                            table.insert(errors, string.format(errorMsg, entryName, amtType, res))
                        end
                    end
                end
            end
        end
    end

    if #errors == 1 then
        return 'All data types are valid in Module:Honorias/data!'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

--- Validates values for specific fields (Position, InternalName, Price values, Tags).
--  @function       p.validateFieldValues
--  @param          {table} frame Frame object passed by MediaWiki
--  @return         {string} Wikitext formatted list of value logic errors
function p.validateFieldValues(frame)
    local errors = { 'p.validateFieldValues(frame): There are a total of %d value errors' }

    for entryName, entryData in Table.skpairs(ModData) do
        if not entryData['_IgnoreEntry'] then
            -- 1. Validate Position value
            if entryData.Position and not VALID_POSITIONS[entryData.Position] then
                local errorMsg = '# "[[%s]]" has invalid Position %s (expected "Prefix", "Suffix", or "Suffix & Prefix")'
                table.insert(errors, string.format(errorMsg, entryName, tostring(entryData.Position)))
            end

            -- 2. Validate InternalName path
            if entryData.InternalName and not string.match(entryData.InternalName, "^/Lotus/") then
                local errorMsg = '# "[[%s]]" has invalid InternalName %s (must start with /Lotus/)'
                table.insert(errors, string.format(errorMsg, entryName, entryData.InternalName))
            end

            -- 3. Validate Price table values
            if entryData.Price then
                for resource, amount in pairs(entryData.Price) do
                    local isValid = false

                    if type(amount) == "number" and amount > 0 then
                        isValid = true
                    elseif type(amount) == "string" then
                        local strAmount = mw.text.trim(tostring(amount))
                        local cleanStr = string.gsub(strAmount, ",", "")
                        
                        if string.match(cleanStr, "^%d+$") then
                            local cleanAmount = tonumber(cleanStr)
                            if cleanAmount and cleanAmount > 0 then
                                isValid = true
                            end
                        end
                    end

                    if not isValid then
                        local errorMsg = '# "[[%s]]" has invalid amount %s for resource %s in Price table'
                        table.insert(errors, string.format(errorMsg, entryName, tostring(amount), resource))
                    end
                end
            end

            -- 4. Validate Tags table values
            if entryData.Tags then
                for _, tag in ipairs(entryData.Tags) do
                    if not VALID_TAGS[tag] then
                        local errorMsg = '# "[[%s]]" contains invalid tag %s in Tags table'
                        table.insert(errors, string.format(errorMsg, entryName, tostring(tag)))
                    end
                end
            end
        end
    end

    if #errors == 1 then
        return 'All field values logic are valid in Module:Honorias/data!'
    end

    errors[1] = string.format(errors[1], #errors - 1)
    return frame:preprocess(table.concat(errors, '\n'))
end

return p
```

