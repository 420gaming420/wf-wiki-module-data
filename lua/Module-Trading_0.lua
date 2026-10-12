--- '''Trading''' is a helper module for constructing wikitext tables and lists pertaining to
--  item trading prerequisites and restrictions.<br />
--  
--  On this Wiki, Trading is used in:
--  * [[Template:TradingTable]]
--  * [[Template:TradingList]]
--  * [[Trading]]
--  
--  @module      trading
--  @alias       p
--  @author      [[User:Yazuh|Yazuh]]
--  @image       TradableIcon(xWhite).png
--  @require     [[Module:Delay]]
--  @require     [[Module:Tooltips]]
--  @require     [[Module:Weapons/data]]
--  @require     [[Module:Arcane/data]]
--  @release     stable
--  

local p = {}
local Delay = require('Module:Delay')
local Tooltip = require('Module:Tooltips')

local WeaponData = Delay.require([[Module:Weapons/data]])
local ArcaneData = Delay.require([[Module:Arcane/data]])["Arcanes"]

-- Tradable status labels mapping for sub-bullet listings
local TRADABLE_LABELS = {
    [1] = 'Unranked',
    [2] = 'Blueprints & Parts',
    [3] = 'Adversary Weapons',
    [4] = 'Crafted Components',
    [5] = 'Companion Weapons'
}

--- Formats a single MR group into wikitext (with main items and optional sub-bullets).
--  @function       formatMRGroupOutput
--  @param          {number} mr Mastery rank level
--  @param          {table} tradeGroups Table of items grouped by Tradable status key
--  @param          {string} slotLabel Optional slot name (e.g., "primary")
--  @param          {string} textArg Optional argument control ("no" to hide slot text)
--  @return         {string} Formatted wikitext lines
local function formatMRGroupOutput(mr, tradeGroups, slotLabel, textArg)
    local standardItems = tradeGroups[0]
    local hasSpecialTypes = false

    for tKey in pairs(tradeGroups) do
        if tKey > 0 then
            hasSpecialTypes = true
            break
        end
    end

	-- Build the dynamic prefix depending on slot inclusion and text config
	local prefix = ''
    if textArg ~= 'no' then
        local slotText = (slotLabel and textArg ~= 'semi') and string.format(" (<i>%s</i>)", slotLabel) or ''
        prefix = string.format("* <b>MR%s%s</b> : ", mr, slotText)
    end

    local listOutput = {}
    if not hasSpecialTypes then
        local allItems = standardItems or {}
        table.sort(allItems)
        table.insert(listOutput, prefix .. table.concat(allItems, ' • '))
    else
        local mainText = prefix
        if standardItems then
            table.sort(standardItems)
            mainText = mainText .. table.concat(standardItems, ' • ')
        end
        if mainText ~= '' then
            table.insert(listOutput, mainText)
        end

        local typeKeys = {}
        for tKey in pairs(tradeGroups) do
            if tKey > 0 then table.insert(typeKeys, tKey) end
        end
        table.sort(typeKeys)

        for _, tKey in ipairs(typeKeys) do
            local items = tradeGroups[tKey]
            table.sort(items)
            local label = TRADABLE_LABELS[tKey]
            if label then
                -- Sub-bullets always start with ** when prefix is enabled, or * if text=no
                local bullet = (textArg == 'no') and "* " or "** "
                table.insert(listOutput, bullet .. "<i>" .. label .. " :</i> " .. table.concat(items, ' • '))
            end
        end
    end

    return table.concat(listOutput, '\n')
end

--- Group items by Mastery Rank and Tradable status, building a structured wikitext list.
--  @function       buildListForCategory
--  @param          {table} dataCategory Sub-dataset containing item definitions
--  @param          {string} categoryName Identifier used for Tooltip rendering and logic handling
--  @return         {string} Formatted wikitext list
local function buildListForCategory(dataCategory, categoryName)
    local itemsByMR = {}
    local tooltipArg = (categoryName == 'Arcanes') and 'Arcane' or categoryName

    for name, data in pairs(dataCategory) do
        -- Exclude atmospheric archguns to avoid duplication
        if data.Slot ~= 'Archgun (Atmosphere)' then
            local mr = 0
            if categoryName == 'Arcanes' then
                if data.Rarity == 'Legendary' then mr = 11 end
            else
                mr = data.Mastery or 0
            end

            if mr > 0 then
                if not itemsByMR[mr] then itemsByMR[mr] = {} end
                
                local tradeType = data.Tradable or 0
                if not itemsByMR[mr][tradeType] then
                    itemsByMR[mr][tradeType] = {}
                end
                table.insert(itemsByMR[mr][tradeType], Tooltip.full(name, tooltipArg))
            end
        end
    end

    local mrList = {}
    for mr in pairs(itemsByMR) do table.insert(mrList, mr) end
    table.sort(mrList)

    local listOutput = {}
    for _, mr in ipairs(mrList) do
        local tradeGroups = itemsByMR[mr]

        if categoryName == 'Arcanes' then
            local allItems = {}
            for _, items in pairs(tradeGroups) do
                for _, item in ipairs(items) do table.insert(allItems, item) end
            end
            table.sort(allItems)
            table.insert(listOutput, '* <b>MR ' .. mr .. '</b>: ' .. table.concat(allItems, ' • '))
        else
            table.insert(listOutput, formatMRGroupOutput(mr, tradeGroups))
        end
    end

    return table.concat(listOutput, '\n')
end

--- Generates tradable item listings grouped by Mastery Rank or item type.
--  Supports "Weapons" (tabber per weapon slot) and "Arcanes" (Legendary arcanes by type).
--  @function       p.buildTradingPerRankTable
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Processed wikitext output
function p.buildTradingPerRankTable(frame)
    local weaponSlots = {
        { key = 'primary', label = 'Primary Weapons' },
        { key = 'secondary', label = 'Secondary Weapons' },
        { key = 'melee', label = 'Melee Weapons' },
        { key = 'archwing', label = 'Archwing Weapons' }
    }

    local args = frame.args
    if not args or not args.type then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local itemType = args and args.type
    local output = {}

    if itemType == 'Weapons' then
        table.insert(output, '<tabber>')
        for _, slot in ipairs(weaponSlots) do
            local slotData = WeaponData[slot.key]
            if slotData then
                local list = buildListForCategory(slotData, 'Weapons')
                if list ~= '' then
                    table.insert(output, '|-|' .. slot.label .. '=\n' .. list)
                end
            end
        end
        table.insert(output, '</tabber>')

    elseif itemType == 'Arcanes' then
        local arcanesByType, arcaneTypeNames = {}, {}
        for name, data in pairs(ArcaneData) do
            if data.Rarity == 'Legendary' then
                local aType = data.Type or 'Other'
                if not arcanesByType[aType] then
                    arcanesByType[aType] = {}
                    table.insert(arcaneTypeNames, aType)
                end
                table.insert(arcanesByType[aType], Tooltip.full(name, 'Arcane'))
            end
        end
        table.sort(arcaneTypeNames)

        if #arcaneTypeNames > 0 then
            table.insert(output, 'Only Legendary Arcanes require <b>[[Mastery Rank]] 11</b> to be traded:')
            for _, aType in ipairs(arcaneTypeNames) do
                local items = arcanesByType[aType]
                table.sort(items)
                table.insert(output, '* <b>' .. aType .. ' :</b> ' .. table.concat(items, ' • '))
            end
        end
    end

    return frame:preprocess(table.concat(output, '\n\n'))
end

--- Returns a formatted wikitext list of tradable items for a specific Mastery Rank.
--  Invocation syntax: {{#invoke:Trading|getItemsByMR|mr=1|type=primary|text=no}}
--  Supports type="weapons" (all slots merged) or specific slots ("primary", "secondary", "melee", "archwing").
--  @function       p.getItemsByMR
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Formatted wikitext output for the given MR
function p.getItemsByMR(frame)
    local args = frame.args
    if not args or not args.mr then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local targetMR = tonumber(args and args.mr)
    local filterType = (args and args.type or 'weapons'):lower()
    local textArg = (args and args.text or ''):lower()

    if not targetMR then
        return ''
    end

    local slotsToScan = {}
    local slotLabel = nil

    if filterType == 'weapons' then
        slotsToScan = { 'primary', 'secondary', 'melee', 'archwing' }
    elseif WeaponData[filterType] then
        slotsToScan = { filterType }
        slotLabel = filterType
    end

    local tradeGroups = {}
    for _, slotKey in ipairs(slotsToScan) do
        local slotData = WeaponData[slotKey]
        if slotData then
            for name, data in pairs(slotData) do
                if data.Slot ~= 'Archgun (Atmosphere)' then
                    local mr = data.Mastery or 0
                    if mr == targetMR then
                        local tradeType = data.Tradable or 0
                        if not tradeGroups[tradeType] then
                            tradeGroups[tradeType] = {}
                        end
                        table.insert(tradeGroups[tradeType], Tooltip.full(name, 'Weapons'))
                    end
                end
            end
        end
    end

    local hasItems = false
    for _ in pairs(tradeGroups) do
        hasItems = true
        break
    end

    if not hasItems then
        return ''
    end

    local result = formatMRGroupOutput(targetMR, tradeGroups, slotLabel, textArg)
    return frame:preprocess(result)
end

--- Returns a filtered wikitext list of items matching a specific tradability category.
--  Invocation syntax: {{#invoke:Trading|getItemsByTradability|type=unranked|text=no}}
--  @function       p.getItemsByTradability
--  @param          {table} frame Scribunto frame object containing invocation arguments
--  @return         {string} Formatted wikitext list
function p.getItemsByTradability(frame)
    local args = frame.args
    if not args or not args.type then
        local parent = frame:getParent()
        if parent then args = parent.args end
    end

    local targetTypeStr = (args and args.type or ''):lower()
    local targetSlot = (args and args.slot or 'weapons'):lower()
    local textArg = (args and args.text or ''):lower()

    -- Find the tradable numeric ID corresponding to the requested string label
    local targetTradableID = nil
    for id, label in pairs(TRADABLE_LABELS) do
        if label:lower() == targetTypeStr then
            targetTradableID = id
            break
        end
    end

    if not targetTradableID then
        return ''
    end

    local slotsToScan = {}
    if targetSlot == 'weapons' then
        slotsToScan = { 'primary', 'secondary', 'melee', 'archwing' }
    elseif WeaponData[targetSlot] then
        slotsToScan = { targetSlot }
    end

    -- Collect items matching the tradability criteria
    local itemsByMR = {}
    local allItemsFlat = {}

    for _, slotKey in ipairs(slotsToScan) do
        local slotData = WeaponData[slotKey]
        if slotData then
            for name, data in pairs(slotData) do
                if data.Slot ~= 'Archgun (Atmosphere)' then
                    local tradeType = data.Tradable or 0
                    if tradeType == targetTradableID then
                        local entry = Tooltip.full(name, 'Weapons')
                        if textArg == 'no' then
                            table.insert(allItemsFlat, entry)
                        else
                            local mr = data.Mastery or 0
                            if mr > 0 then
                                if not itemsByMR[mr] then
                                    itemsByMR[mr] = {}
                                end
                                table.insert(itemsByMR[mr], entry)
                            end
                        end
                    end
                end
            end
        end
    end

    -- If text=no, render a single flat list sorted alphabetically
    if textArg == 'no' then
        if #allItemsFlat == 0 then return '' end
        table.sort(allItemsFlat)
        return frame:preprocess('* ' .. table.concat(allItemsFlat, ' • '))
    end

    -- Standard behavior grouped by MR
    local mrList = {}
    for mr in pairs(itemsByMR) do table.insert(mrList, mr) end
    table.sort(mrList)

    if #mrList == 0 then
        return ''
    end

    local listOutput = {}
    for _, mr in ipairs(mrList) do
        local items = itemsByMR[mr]
        table.sort(items)
        table.insert(listOutput, string.format('* <b>MR%s</b> : %s', mr, table.concat(items, ' • ')))
    end

    return frame:preprocess(table.concat(listOutput, '\n'))
end

return p
