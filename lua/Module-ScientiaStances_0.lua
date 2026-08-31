-- Testing branch for User:Cephalon Scientia
-- Working on Module:Stances

-- This module is a Lua port of Template:StanceCombosV2, Template:ComboIcon, 
-- and Template:ComboIcon2 for the ease of editbility and expandability
-- of new and existing stance combos.

-- This module is meant to be used in conjunction with Template:StanceTable.
-- For best experience, view pages at 100% zoom to ensure correct formatting
-- of tables.

-- Fair warning: minimal input validation, especially for data in Module:Stances/data
-- Follow styling as shown in said page to avoid errors.

-- Note to future editors: minimize refactoring of HTML strings; it is better
-- to have multiple strings with similar HTML than a bunch of broken up
-- HTML that are built through if statements (harder to understand)

-- TODO: stagger 'proc' icon

-- hierarchy of function calls:
-- p.buildTable()
--      validateStanceData()
--      p.buildTableHelper()
--          buildComboRow() <- edit this if you want to add new combos or change row padding
--              findMaxNumberOfHits()
--              buildComboIcons()
--                  p.addComboIcon()
--                      buildComboCSSClasses() <- edit this if you want to change icon CSS classes/styling
--                      buildTopProcIconHTML() <- edit this if you want to change icon CSS classes/styling
--                      buildMeleeIcon()
--                      buildHitInfoHTML() <- edit this if you want to change CSS classes/styling
--          buildAttackTypeLegendRow()
--          buildAttackLegendRow()
--          buildMultiplierHitLegendRow()
--          buildProcLegendRow()

-- generic helper functions used:
-- SHARED.tableCount()
-- SHARED.hasKey()
-- SHARED.contains()
-- SHARED.titleCase()

local p = {}

local STANCES_DATA = mw.loadData( 'Module:ScientiaStances/data' )
local ICON = require( 'Module:Icon' )   -- needed for melee and proc icons
local tooltip = require('Module:Tooltips')
local SHARED = {}
------------------------START OF Module:Shared----------------------------------
-- pre : List is a table or a string
--       Item is the element that is being searched
--       IgnoreCase is a boolean; if false, search is case-sensitive
-- post: returns a boolean; true if element exists in List, false otherwise
SHARED.contains = function(List, Item, IgnoreCase)
    if (List == nil or Item == nil) then 
        return false 
    end
    if(IgnoreCase == nil) then 
        IgnoreCase = false 
    end
    
    if(type(List) == "table") then
        for key, value in pairs(List) do
            if (value == Item) then
                return true
            elseif (IgnoreCase and string.upper(value) == string.upper(Item)) then
                return true
            end
        end
    else
        local start = string.find(List, Item)
        return start ~= nil
    end
    return false
end

-- Returns the number of rows in a table
-- Originally snagged this from Module:VoidByReward written by User:NoBrainz
-- Note from User:Cephalon Scientia:
--      Length operator (#) doesn't work as expected for tables that have been
--      loaded into a module by mw.loadData().
--      Use this function to get all the rows in a table regardless of them
--      being keys, values, or tables
-- pre : table is a table with no explicit nil values
-- post: returns the size of table, ignoring keys with nil values and 
--       nil values themselves
--       if table is not of type 'table' then return nil
SHARED.tableCount = function(table)
    if (type(table) == 'table') then
        local count = 0
        for _ in pairs(table) do count = count + 1 end
        return count
    else
        return nil
    end
end

-- generic function that checks to see if a key exists in a given nested table
-- added by User:Cephalon Scientia
-- pre : table is a nested table
--       key is a string that represents a key name
--       length is a integer that represents the size of outer table; 
--       if omitted, length is set to size of outer table
-- post: returns a boolean; true if key exists in table, false otherwise or
--       if key contains a nil value
SHARED.hasKey = function(table, key, length)
    if (length == nil) then
        length = SHARED.tableCount(table)
    end
    
    -- iterating through outer table
    for i = 1, length, 1 do
        local elem = table[i]   -- storing one of inner tables into a variable
        if (elem[key] ~= nil) then
            return true
        end
    end
    return false
end

-- conveniently shifts BLAH to Blah
-- Handy when formatting data in ALL CAPS or all lower case
--Originally snagged this from Module:VoidByReward written by User:NoBrainz
SHARED.titleCase = function(str)
	return (str:gsub('(%S)(%S*)', function(h,t) return h:upper()..t:lower() end))
end
------------------------END OF Module:Shared------------------------------------

-- strings are case sensitive in accordance to the respective keys in
-- Module:ScientiaStances/data tables
-- they are in the order that they will appear in stance table
-- update this table if you plan to add a new combo type
local COMBO_NAMES = { 'Basic', 'Forward', 'ForwardBlock', 'Block', 
    'Heavy', 'Slide', 'Air', 'Wall', 'Ground' }
local PROC_NAMES = { 'Impact', 'Puncture', 'Slash', 'Blast', 'Lifted',
    'Knockdown', 'Ragdoll', 'Stagger', 'Finisher', 'Impair' }

-- names of procs that can trigger Condition Overload 
-- (i.e. true status procs; includes multi procs)
local STATUS_PROC_NAMES = { 'Impact', 'Puncture', 'Slash', 'Blast', 'Lifted', 
    'ImpPun', 'ImpSla', 'PunSla', 'ImpLif', 'PunLif', 'SlaLif',
    'ImpKno', 'PunKno', 'SlaKno', 'ImpRag', 'PunRag', 'SlaRag'
}

-- for hits that can proc multiple times
local MULTI_PROC_NAMES = { 'ImpPun', 'ImpSla', 'PunSla', 'ImpLif', 'PunLif',
    'SlaLif', 'ImpKno', 'PunKno', 'SlaKno', 'ImpRag', 'PunRag', 'SlaRag',
    'KnoRag', 'LifRag', 'KnoLif'
}

-- for use in ICON._Melee(); in pixels as used in File namespace 
-- (e.g. [[File:Test.png|imgsize=x20px]])
local COMBO_ICON_SIZE = 'x19'
local PROC_ICON_SIZE = 'x11'    -- for use in ICON._Proc()

-- iterates through a stance table to make sure all table values in each
-- Attacks table are the correct length and that no required values are missing
-- note: validation comes with a performance cost, pages will take longer to
--       load if it includes lots of stance tables
-- pre : stanceName is a string, title cased with no trailing whitespace
--       (e.g. 'Iron Phoenix')
-- post: returns true if all data is formatted correctly, otherwise returns 
--       a string that represents an error message
--       STANCES_DATA is not modified
local function validateStanceData(stanceName)
    -- deep copy of table in STANCES_DATA in order to modify its contents
    -- local stanceTable = SHARED.deepCopy(STANCES_DATA[stanceName])
    
    -- note: cannot edit contents of table
    local stanceTable = STANCES_DATA[stanceName]
    
    -- don't want to iterate over this key because this is implicitly
    -- checked at for loop that joins the tables at the end of
    -- Module:ScientiaStances/data
    -- stanceTable['WeaponType'] = nil
    
    local errorBegin = '<b><span style="color:red;">Error: '..stanceName..' combo '
    local errorEnd = ' in Module:ScientiaStances/data</span></b>'
    
    -- storing keys in table
    local keySet = { }
    local index = 1
    for key, value in pairs(stanceTable) do
        if (key ~= 'WeaponType' and key ~= 'ConclaveOnly') then
            keySet[index] = key
            index = index + 1
        end
    end
    
    for index, key in pairs(keySet) do
        if (not SHARED.contains(COMBO_NAMES, key)) then
            return errorBegin..'contains an unknown combo type ("'..key..'")'..errorEnd
        end
    end
    
    -- iterating over every combo type
    for comboType, comboTable in pairs(stanceTable) do
        if (comboType ~= 'WeaponType' and comboType ~= 'ConclaveOnly') then
            if (comboTable['Name'] == nil) then
                return errorBegin..'has a missing combo name'..errorEnd    
            end
            
            local attacksTable = comboTable['Attacks']
            -- attacks are not assigned to explicit keys
            for index, attack in pairs(attacksTable) do
            	-- Quick hacky check if Multiplier value is not a table for preserving look of module call in
            	-- [[User:Cephalon_Scientia/Blog_Drafts/Module:Stances—A_New_Look_and_Personality_(Stance_Tables_Remastered)#Module:ScientiaStances]]
                local multiplierLength = type(attack['Multiplier']) ~= 'table' and 1 or SHARED.tableCount(attack['Multiplier'])
                local numberOfHitsLength = type(attack['NumberOfHits']) ~= 'table' and 1 or SHARED.tableCount(attack['NumberOfHits'])
                local procLength = type(attack['Proc']) ~= 'table' and 1 or SHARED.tableCount(attack['Proc'])
                local diffLengthErrMsg = errorBegin..'needs all table values to be the same length in Attacks table (index '..index..') of '..comboType
                
                -- when length is nil that means key has nil value or doesn't exist
                -- in table; if so ignore them because those will be set to default
                -- values in p.addComboIcon()
                if (multiplierLength ~= nil) then
                    if (numberOfHitsLength ~= nil) then
                        if (procLength ~= nil) then
                            if (multiplierLength ~= numberOfHitsLength or multiplierLength ~= procLength or
                                numberOfHitsLength ~= procLength) then
                                return diffLengthErrMsg..' [multiplierLength ~= numberOfHitsLength or multiplierLength ~= procLength or numberOfHitsLength ~= procLength]'..errorEnd
                            end
                        -- procLength is nil
                        else
                            if (multiplierLength ~= numberOfHitsLength) then
                                return diffLengthErrMsg..' [multiplierLength ~= numberOfHitsLength]'..errorEnd
                            end
                        end
                    -- numberOfHitsLength is nil
                    else
                        if (procLength ~= nil) then
                            if (multiplierLength ~= procLength) then
                                return diffLengthErrMsg..' [multiplierLength ~= procLength]'..errorEnd
                            end
                        -- procLength is nil and numberOfHitsLength is nil
                        -- do no comparison because only one non-nil value
                        end
                    end
                -- multiplierLength is nil
                else
                    if (numberOfHitsLength ~= nil) then
                        if (procLength ~= nil) then
                            if (numberOfHitsLength ~= procLength) then
                                return diffLengthErrMsg..' [numberOfHitsLength ~= procLength]'..errorEnd
                            end
                        end
                        -- multiplierLength is nil and procLength is nil
                        -- do no comparison because only one non-nil value
                    end
                    -- multiplierLength is nil and numberOfHitsLength is nil
                    -- do no comparison because only one non-nil value
                end
            end
        end
    end
    return true     -- stance table passed tests
end

-- chooses which CSS class to use, CI2 or CI and adjust padding 
-- according to what elements are going to be displayed
-- pre : multiplier is a number table or a single number
--       numberOfHits is a number table or a single number
--       proc is a string table or a single string
-- post: returns the starting tags of two span elements, each containing a
--       CSS class unique to styling combo icons
local function buildComboCSSClasses(multiplier, numberOfHits, proc)
    -- when there is more than one unique hit with its own multiplier
    if (type(multiplier) == 'table' and SHARED.tableCount(multiplier) > 1) then
        -- if at least one of the hits applies a proc add more padding 
        -- to make space for proc icon
        if (type(proc) == 'table' and SHARED.tableCount(proc) > 1) then
            local hasMultiProcString = false
            for i = 1, SHARED.tableCount(proc), 1 do
                if (SHARED.contains(MULTI_PROC_NAMES, proc[i])) then
                    hasMultiProcString = true
                    break
                end
            end
            
            if (hasMultiProcString) then
                return '<span class="CI2" style="padding:1px 33px 1px 13px;"><span class="CI2-top-proc">'
            else
                return '<span class="CI2" style="padding:1px 23px 1px 13px;"><span class="CI2-top-proc">'
            end
        -- else add padding to just only account for number of hits
        -- and damage multiplier
        elseif (type(proc) == 'string' and SHARED.contains(MULTI_PROC_NAMES, proc)) then
            return '<span class="CI2" style="padding:1px 33px 1px 13px;"><span class="CI2-top-proc">'
        else
            return '<span class="CI2" style="padding:1px 13px;"><span class="CI2-top-proc">'
        end
    -- if attack has only one unique multiplier but has multiple hits, apply more left padding
    -- to account for hit count info
    elseif (type(multiplier) == 'number' and type(numberOfHits) == 'number' and numberOfHits > 1) then
        return '<span class="CI" style="padding:0px 8px 0px 13px;"><span class="CI-top-proc">'
    end
    return '<span class="CI"><span class="CI-top-proc">'
end

-- builds HTML string for the proc icon that sits on top of combo icon
-- pre : proc is a string table or a single string
-- post: returns the top span element that contains proc info of 
--       a single attack
--       if proc is a string table, return an empty string
local function buildTopProcIconHTML(proc)
    -- adding in proc info that sits on top of combo icon if exists
    -- attack that only guarantees a single proc
    if (type(proc) == 'string') then
        if (SHARED.contains(PROC_NAMES, proc)) then
            return '<span class="CI-top-proc1" style="left:4px; top:-20px">'..tooltip.getFullTooltip(proc, "DamageTypes")..'</span>'
        -- attack that only guarantees multiple procs
        elseif (SHARED.contains(MULTI_PROC_NAMES, proc)) then
            -- when attack has only one hit, proc icon will have two unique procs
            -- (e.g. 'ImpSla' from Module:Icon/data)
            -- adding no padding to left to accommodate for extra proc
            return '<span class="CI-top-proc1" style="top:-20px">'..tooltip.getFullTooltip(proc, "DamageTypes")..'</span>'
        end
    end
    return ''
end

-- pre : attackType is a string; can be one of the following (case sensitive):
--          'Default', 'Up', 'Block, or 'Heavy'
--       procType is a string; can be one of the following (case sensitive):
--          'Default', '360', or 'Slam'
--       proc is a string table or a single string
-- post: returns a melee icon based on proc type and proc info
local function buildMeleeIcon(attackType, procType, proc)
    -- if attack is not already a specific type (i.e. 'Slam' or '360')
    -- override 'Default' procType as long as proc isn't 'Knockdown',
    -- 'Ragdoll', 'Stagger', or 'Finisher' 
    -- (which are not really procs in the sense of status)
    if (procType == 'Default') then 
        if (type(proc) == 'string' and SHARED.contains(STATUS_PROC_NAMES, proc)) then
            procType = 'Proc'   -- overriding 'Default' value
        elseif (type(proc) == 'table') then
            for i = 1, SHARED.tableCount(proc), 1 do
                if (SHARED.contains(STATUS_PROC_NAMES, proc[i])) then
                    procType = 'Proc'
                    break
                end
            end
        end
    end
    return ICON._Melee and ICON._Melee(attackType, procType, COMBO_ICON_SIZE) or ''
end

-- builds HTML string for infomation that will sit below combo icon 
-- (i.e. damage muliplier, number of hits, and proc info)
-- pre : multiplier is a number table or a single number
--       numberOfHits is a number table or a single number
--       proc is a string table, a single string, or nil
-- post: returns span elements for displaying damage multiplier, number of hits,
--          and proc info
--       returns an empty string if parameters are at default values
--          (multiplier = 1, numberOfHits = 1, proc = nil)
local function buildHitInfoHTML(multiplier, numberOfHits, proc)
    local HTMLresult = ''
    -- adding in damage multiplier and number of hit info if exists
    -- if multiplier is type 'number', numberOfHits and proc params will 
    -- be of type 'number' too
    if (type(multiplier) == 'number' and multiplier ~= 1) then
        -- for multiple hits with the same multiplier
        if (numberOfHits > 1) then
            HTMLresult = HTMLresult..'<span class="CI2-multi2" style="left:-13px;">'..numberOfHits..'x&nbsp;'..(multiplier * 100)..'%</span>'
        
        -- for a single hit
        else
            HTMLresult = HTMLresult..'<span class="CI2-multi2" style="left:-1px;">'..(multiplier * 100)..'%</span>'
        end
    -- if multiplier is type 'table', numberOfHits and proc params will 
    -- be of type 'table' too
    elseif (type(multiplier) == 'table') then
        -- every hit uses a different CSS class than the others
        for hitNum = 1, SHARED.tableCount(multiplier), 1 do
            if (hitNum == 1) then
                HTMLresult = HTMLresult..'<span class="CI2-multi2" style="left:-13px;">'
            elseif (hitNum == 2) then
                -- overriding top attribute provided by class in order to increase spacing between
                -- damage multipliers
                HTMLresult = HTMLresult..'<span class="CI2-multi" style="left:-13px; top:26px;">'
            elseif (hitNum == 3) then
                HTMLresult = HTMLresult..'<span class="CI2-multi3" style="left:-13px; top:37px;">'
            elseif (hitNum == 4) then
                HTMLresult = HTMLresult..'<span class="CI2-multi4" style="left:-13px; top:48px;">'
            end
            HTMLresult = HTMLresult..numberOfHits[hitNum]..'x&nbsp;'..(multiplier[hitNum] * 100)..'%'
            
            -- adding proc icon if that particular hit procs
            if (proc ~= nil and proc[hitNum] ~= 'None') then
                HTMLresult = HTMLresult..' '..tooltip.getFullTooltip(proc[hitNum], "DamageTypes")
            end
            HTMLresult = HTMLresult..'</span>'
        end
    -- adding numberOfHits only
    elseif (numberOfHits ~= nil and numberOfHits > 1) then
        HTMLresult = HTMLresult..'<span class="CI-multi1">'..numberOfHits..'x</span>'
    end
    return HTMLresult
end

-- builds HTML for combo icon from top to down starting with proc info, icon
-- then damage multipliers/number of hits
-- following similar parameter name convention as ICON._Melee() function
-- pre : attackType is a string; can be one of the following (case sensitive):
--          'Default', 'Up', 'Block, 'Heavy', or nil
--       procType is a string; can be one of the following (case sensitive): 
--          'Default', '360', 'Slam', or nil
--       multiplier is a number table, a single number, or nil
--       numberOfHits is a number table, a single number, or nil
--       proc is a string table, a single string, or nil
-- post: returns a combo icon in the form of a string containing HTML 
--       based on Template:ComboIcon
function p.addComboIcon(attackType, procType, multiplier, numberOfHits, proc)
    -- initializing default values
    if (attackType == nil) then
        attackType = 'Default'
    end
    if (procType == nil) then
        procType = 'Default'
    end
    -- rarely multiplier is 1 for multi-hit attacks
    if (multiplier == nil and type(numberOfHits) == 'table') then
        multiplier = {}
        for i = 1, SHARED.tableCount(numberOfHits), 1 do
            multiplier[i] = 1
        end
    end
    if (numberOfHits == nil) then
        if (type(multiplier) == 'number') then
            numberOfHits = 1
            
        -- table with 1 as values (e.g. { 1, 1 })
        elseif (type(multiplier) == 'table') then
            numberOfHits = {}
            for i = 1, SHARED.tableCount(multiplier), 1 do
                numberOfHits[i] = 1
            end
        end
    end
    
    local comboIcon = ''
    
    comboIcon = comboIcon..buildComboCSSClasses(multiplier, numberOfHits, proc)
    comboIcon = comboIcon..buildTopProcIconHTML(proc)
    comboIcon = comboIcon..buildMeleeIcon(attackType, procType, proc)
    comboIcon = comboIcon..buildHitInfoHTML(multiplier, numberOfHits, proc)
    
    -- adding in damage multiplier and number of hit info if exists
    -- if (multiplier ~= nil) then
    --     -- for multiple different multipliers
    --     -- if multiplier is a table that implies numberOfHits is a table too
    --     -- double checking for sure
    --     if (type(multiplier) == 'table') then
    --         if (type(numberOfHits) == 'table') then
    --             -- hard coding indexes because length operator doesn't work properly
    --             -- should replace with for loop if a solution is found
    --             comboIcon = comboIcon..'<span class="CI2-multi2" style="left:-13px;">'..numberOfHits[1]..'x&nbsp;'..(multiplier[1] * 100)..'%</span>'
    --             comboIcon = comboIcon..'<span class="CI2-multi" style="left:-13px;">'..numberOfHits[2]..'x&nbsp;'..(multiplier[2] * 100)..'%</span>'
    --         end
    --     -- for only single damage multiplier
    --     else
    --         -- for a single hit
    --         if (numberOfHits == 1) then
    --             comboIcon = comboIcon..'<span class="CI2-multi2" style="left:-1px;">'..(multiplier * 100)..'%</span>'
    --         -- for multiple hits with the same multiplier
    --         else
    --             comboIcon = comboIcon..'<span class="CI2-multi2" style="left:-1px;">'..numberOfHits..'x&nbsp;'..(multiplier * 100)..'%</span>'
    --         end
    --     end
    -- -- when there is no multiplier info, only number of hits
    -- elseif (numberOfHits > 1) then
    --     comboIcon = comboIcon..'<span class="CI-multi1">'..numberOfHits..'x</span>'
    -- end
    
    return comboIcon..'</span></span>'
end

-- pre : attacksTable is a table that contains information on attacks within 
--       a particular combo
--       comboType is a string
-- post: returns combo icons in the form of strings containing HTML 
--       based on Template:ComboIcon
local function buildComboIcons(attacksTable, comboType)
    local attackType = ''
    if (comboType == 'Heavy') then
        attackType = 'Heavy'
    else
        attackType = 'Default'
    end
    
    local numberOfAttacks = SHARED.tableCount(attacksTable)
    if (numberOfAttacks == nil) then
        numberOfAttacks = 1
    end
    
    local comboIcons = ''
        
    for i = 1, numberOfAttacks, 1 do
        comboIcons = comboIcons..p.addComboIcon(attackType, attacksTable[i]['Type'], attacksTable[i]['Multiplier'], attacksTable[i]['NumberOfHits'], attacksTable[i]['Proc'])
    end
    
    -- concatenating a closing parenthesis
    if (comboType == 'Forward' or comboType == 'ForwardBlock' or comboType == 'Block') then
        comboIcons = comboIcons..')'
    end
    
    return comboIcons
end

-- pre : attacksTable is a table that contains attack information
-- post: returns a integer that represents the maximum number of 
--       unique hits within a combo
local function findMaxNumberOfHits(attacksTable)
    local length = SHARED.tableCount(attacksTable)
    local maxHits = 1
    
    -- iterating through Attacks table for a particular combo
    for i = 1, length, 1 do
        local attack = attacksTable[i]
        
        -- if 'Multiplier' key doesn't exist in table that means
        -- there is only one hit in that attack
        local multiplierTable = attack['Multiplier']
        if (multiplierTable ~= nil and type(multiplierTable) == 'table') then
            -- length of NumberOfHits tables relays the number of unique hits 
            -- (e.g. 2x 400% hit and 1x 200% hit will count as 2 unique hits)
            if (SHARED.tableCount(multiplierTable) > maxHits) then
                maxHits = SHARED.tableCount(multiplierTable)
            end
        end
    end
    return maxHits
end

-- builds combo row in the form of pipe syntax
-- pre : comboTable is a table that contains combo information
--       comboType is a string that represents the type of combo (e.g. 'Basic')
-- post: returns a table row for a single combo
local function buildComboRow(comboTable, comboType)
    -- putting all comboTable keys into variables
    local comboName = comboTable['Name']
    local attacksTable = comboTable['Attacks']
    
    -- first column of row differs from each combo type
    local comboRow = 
    '| id="'..comboName..'" style="padding: 0em 0.5em; line-height:100%;" | <b>'
    
    -- I realize there is duplicate code (similar strings) 
    -- but for the sake of visibility I will leave it unfactored
    -- building combo names and links with styling
    if (comboType == 'Basic') then
        comboRow = comboRow..comboName
    elseif (comboType == 'Forward') then
        comboRow = comboRow..comboName..'[[Stance|<span title="'..comboName..' unlocks at Rank 1" style="color:inherit; border-bottom:1px dotted #808080; padding:0em; cursor:help;">*</span>]]'
    elseif (comboType == 'ForwardBlock') then
        comboRow = comboRow..comboName..'[[Stance|<span title="'..comboName..' unlocks at Rank 2" style="color:inherit; border-bottom:1px dotted #808080; padding:0em; cursor:help;">*</span>]]'
    elseif (comboType == 'Block') then
        comboRow = comboRow..comboName..'[[Stance|<span title="'..comboName..' unlocks at Rank 3" style="color:inherit; border-bottom:1px dotted #808080; padding:0em; cursor:help;">*</span>]]'
    elseif (comboType == 'Heavy') then
        -- replicating article link and hover over text, similar to Template:Text
        comboRow = comboRow..'[[Melee 2.0#Heavy Attacks|<span title="Heavy Attack" style="color:#3a3a3a; border-bottom:1px dotted #808080; padding:0em;">'..comboName..'</span>]]'
    elseif (comboType == 'Slide') then
        comboRow = comboRow..'[[Melee 2.0#Slide Attack|<span title="Slide Attack" style="color:#3a3a3a; border-bottom:1px dotted #808080; padding:0em;">'..comboName..'</span>]]'
    elseif (comboType == 'Air') then
        comboRow = comboRow..'[[Melee 2.0#Aerial Attack|<span title="Aerial Attack" style="color:#3a3a3a; border-bottom:1px dotted #808080; padding:0em;">'..comboName..'</span>]]'
    elseif (comboType == 'Wall') then
        comboRow = comboRow..'[[Melee 2.0#Wall Attack|<span title="Wall Attack" style="color:#3a3a3a; border-bottom:1px dotted #808080; padding:0em;">'..comboName..'</span>]]'
    elseif (comboType == 'Ground') then
        comboRow = comboRow..'[[Finisher#Ground Finisher|<span title="Ground Finisher" style="color:#3a3a3a; border-bottom:1px dotted #808080; padding:0em;">'..comboName..'</span>]]'
    end
    
    comboRow = comboRow..'</b>\n'
    
    -- second column that contains combo icons
    -- padding may be variable for attacks with multiple hits in order to 
    -- fit all information on procs and damage multipliers
    local topPadding = 0.95     -- most combos have guaranteed procs so leave this unchanged
    local bottomPadding = 0.2
    local maxNumberOfHits = findMaxNumberOfHits(attacksTable)
    
    -- add padding if there are more than 1 unique hit in an attack 
    -- within the combo
    if (maxNumberOfHits > 1) then
        bottomPadding = (0.7 * maxNumberOfHits) + 0.6
        
    -- if all attacks in a combo have only one hit, add padding if at least
    -- one of them have a damage multiplier
    elseif (SHARED.hasKey(attacksTable, 'Multiplier')) then
        -- equilvalent to the above equation with maxNumberOfHits = 1
        bottomPadding = 1.25
    end
    
    comboRow = comboRow..'| style="padding: '..topPadding..'em 0.25em '..bottomPadding..'em 0.25em;" |'
    
    -- not checking for 'Basic' or 'Heavy' combos because those don't require
    -- additional input from the player (e.g. blocking, sliding, jumping, etc.)
    -- note that nil values are optional since Lua is dynamically typed but
    -- I want to be explicit for the sake of clarity
    if (comboType == 'Forward') then
        comboRow = comboRow..p.addComboIcon('Up', 'Default', nil, nil, nil)..'( '
    elseif (comboType == 'ForwardBlock') then
        comboRow = comboRow..'( '..p.addComboIcon('Up', 'Default', nil, nil, nil)..'<b>+</b>  '..p.addComboIcon('Block', 'Default', nil, nil, nil)..')( '
    elseif (comboType == 'Block') then
        comboRow = comboRow..p.addComboIcon('Block', 'Default', nil, nil, nil)..'( '
    elseif (comboType == 'Slide') then
        comboRow = comboRow..'[[Maneuvers#Sliding|Slide]] <b>+</b> '
    elseif (comboType == 'Air') then
        comboRow = comboRow..'[[Maneuvers#Jumping|In Air]] <b>+</b> '
    elseif (comboType == 'Wall') then
        comboRow = comboRow..'[[Maneuvers#Wall Dash|Wall Dash]] <b>+</b> '
    elseif (comboType == 'Ground') then
        comboRow = comboRow..'[[Knockdown|Knocked Down]] Enemy <b>+</b> '
    end
    
    comboRow = comboRow..buildComboIcons(attacksTable, comboType)..'\n'

    return comboRow..'|-\n'
end

-- post: returns table row for attack type legend
local function buildAttackTypeLegendRow()
    return
    '! colspan="2"  style="text-align:center; padding: 0.2em 0.5em 0.125em 0.5em;" | <small>'..p.addComboIcon('Default', '360', nil, nil, nil)..' 360° Attack&nbsp; '..p.addComboIcon('Default', 'Slam', nil, nil, nil)..' Slam Attack&nbsp; '..p.addComboIcon('Default', 'Proc', nil, nil, nil)..' Status Proc</small>\n'..
    '|-\n'
end

-- post: returns table row for attack legend
local function buildAttackLegendRow()
    return
    '<div class="mw-collapsible mw-collapsed" data-expandtext="Show" data-collapsetext="Hide">\n'..
    '&#8192;\'\'\'Melee Attacks\'\'\'\n'..
    '<div class="mw-collapsible-content">\n'..
    '{| style="margin: -0.5em 0em .8em 0.2em" |\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0em;" | <small>'..p.addComboIcon('Default', 'Default', nil, nil, nil)..' &nbsp; Melee &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0em;" | <small>'..p.addComboIcon('Block', 'Default', nil, nil, nil)..' &nbsp; [[Melee#Blocking|Block]] &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0em;" | <small>'..p.addComboIcon('Up', 'Default', nil, nil, nil)..' &nbsp; Forward &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0em;" | <small>'..p.addComboIcon('Heavy', 'Default', nil, nil, nil)..' &nbsp; Heavy Attack &nbsp; </small>\n'..
    '|}</div></div>\n'
end

-- post: returns table row for multipliers and hits legend
local function buildMultiplierHitLegendRow()
    return
    '<div class="mw-collapsible mw-collapsed" data-expandtext="Show" data-collapsetext="Hide">\n'..
    '&#8192;\'\'\'Multipliers and Hits\'\'\'\n'..
    '<div class="mw-collapsible-content">\n'..
    '{| style="margin: -0.5em 0em .8em 0.2em" |\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0.65em;" | <small>'..p.addComboIcon('Default', 'Default', 2, nil, nil)..' &nbsp; Attack does double damage &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.3em 0.1em 0.65em;" | <small>'..p.addComboIcon('Default', 'Default', nil, 2, nil)..' &nbsp; Attack hits twice &nbsp; </small>\n'..
    '|}</div></div>\n'
end

-- post: returns table row for proc legend
local function buildProcLegendRow()
  return
    '<div class="mw-collapsible mw-collapsed" data-expandtext="Show" data-collapsetext="Hide">\n'..
    '&#8192;\'\'\'Exclusive Procs\'\'\'\n'..
    '<div class="mw-collapsible-content">\n'..
    '{| style="margin: -0.5em 0em 0.2em 0.2em" |\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Knockdown", "DamageTypes")..' &nbsp; Knockdown &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Ragdoll", "DamageTypes")..' &nbsp; Ragdoll &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Stagger", "DamageTypes")..' &nbsp; Stagger &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Lifted", "DamageTypes")..' &nbsp; Lifted &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Finisher", "DamageTypes")..' &nbsp; Open to [[Finisher]]s &nbsp; </small>\n'..
    '|-\n'..
    '| colspan="1"  style="text-align:left; padding: 0.15em 0.2em 0.15em;" | <small>'..tooltip.getFullTooltip("Impair", "DamageTypes")..' &nbsp; Impair ([[Conclave|PvP]] only) &nbsp; </small>\n'..
    '|}</div></div>\n'
end

-- builds a wikitable, copying the style from Template:StanceCombosV2
-- invoke this function by parsing in a stance name as argument in title casing 
-- (e.g. {{#invoke:ScientiaStances|buildTable|Iron Phoenix}})
-- post: returns a stance wikitable; tables in Module:ScientiaStances/data are unmodified
--       returns error statements if missing arguments or if stance name doesn't
--       exist in table
function p.buildTable(frame)
    local stanceName = frame.args[1]
    local noHeader = frame.args[2]     -- section header
    
    -- unused code because Template:ScientiaStances already has default value
    -- for stanceName ('Test' combo)
    -- if (stanceName == '') then
    --     return '<b><span style="color:red;">Error: Stance name argument needed</span></b>'
    -- end
    
    -- removing leading and trailing whitespace from argument
    stanceName = string.gsub(stanceName, '^%s+' , '')
    stanceName = string.gsub(stanceName, '%s+$', '')
    
    stanceName = SHARED.titleCase(stanceName)
        
    if (STANCES_DATA[stanceName] == nil) then
        return '<b><span style="color:red">Error: Stance name not found</span></b>'
    end
    
    -- validating table formatting
    local errorMessage = validateStanceData(stanceName)  -- can be true or a string
    if (errorMessage ~= true) then
        return errorMessage
    end
    
    local header = '==Combos==\n'
    if (noHeader == 'true') then
        header = ''
    end
    
    return header..p.buildTableHelper(stanceName)
end

-- helper method for p.buildTable function
-- pre: stanceName is a valid stance name
-- post: returns a stance wikitable; tables in Module:ScientiaStances/data are unmodified
function p.buildTableHelper(stanceName)
    -- table header
    local result = 
    '{| class="foundrytable" style="font-family:Roboto; text-align:left; max-width:100%; margin:-6px 0px 0px 0px;"\n'..
    '|-\n'..
    '! style="text-align:center; padding: 0em 0.5em;" | [[Melee 2.0|Combo]] Name\n'..
    '! style="text-align:center; padding: 0em 0.5em;" | [[Stance#Melee Combos|Button Combination]]\n'..
    '|-\n'
    
    local stanceInfo = STANCES_DATA[stanceName]
    
    local i = 1
    local comboName = COMBO_NAMES[i]
    while (comboName ~= nil) do
        -- if combo type exists in stance table add a row for it
        if (stanceInfo[comboName] ~= nil) then
            result = result..buildComboRow(stanceInfo[comboName], comboName)
        end
        i = i + 1
        comboName = COMBO_NAMES[i]
    end
    
    -- bottom collapsible legends
    result = result..buildAttackTypeLegendRow()
    result = result..'| colspan="2" |\n'    -- this is needed for legend to fit table columns
    result = result..buildAttackLegendRow()
    result = result..buildMultiplierHitLegendRow()
    result = result..buildProcLegendRow()
    
    return result..'|}'
end

return p
