--- '''DamageTypes''' contains all the damage types used in [[WARFRAME]], their health/armor class advantages, and status effects.<br/>
--  
--  On this Wiki, DamageTypes is used in:
--  * [[Module:Tooltips/data]]
--  * [[Module:Tooltips/tip]]
--  * [[Damage]] and its subpages
--  
--  @module     damagetypes
--  @alias      p
--  @author     [[User:Flaicher|Flaicher]]
--  @author     [[User:Gigamicro|Gigamicro]]
--  @image      DamageModBundleIcon.png
--  @require    [[Module:DamageTypes/data]]
--  @require    [[Module:Icon/data]]
--  @require    [[Module:Tooltips]]
--  @release    stable
--  

-- TODO: Invalid property value for background-color: hsl(). Fix or remove them entirely for a simplier
-- table format that is readable on both light and dark theme.
local p = {}

local DamageData = mw.loadData([[Module:DamageTypes/data]])
-- local Icon = mw.loadData([[Module:Icon/data]])
local Tooltips = require([[Module:Tooltips]])

--- An array with damage elements in order to be iterated by as seen in the in-game arsenal.
--  @table      p.iterationOrderArray
p.iterationOrderArray = {
    "Impact", "Puncture", "Slash",
    "Cold", "Electricity", "Heat", "Toxin",
    "Blast", "Corrosive", "Gas",
    "Magnetic", "Radiation", "Viral",
    "True", "Void", "Tau"
}

--- Returns the wikitext file link of a damage icon.
--  @function       procIcon
--  @param          {string} proc Damage type
--  @param[opt]     {string} size Icon size
--  @return         {string} Resultant wikitext of image file
function p.procIcon(proc, size)
    return string.format('[[File:Dmg%sSmall64.png|%s]]', proc, size or '16x16px')
end

--- Builds a damage type modifier table for a damage type. Used on [[Template:DamageModifierTable]]
--  @function       p.damageTypeModifierTable
--  @param          {string} dt Damage type
--  @return         {string} A table of damage type modifiers of a damage type in wikitext
function p.damageTypeModifierTable(frame)
    local dt = frame.args and (frame.args[1] or frame.args) or frame
    -- local dtb = DamageData["Types"][dt] -- apparently unused?
    local dtt = DamageData["total"][dt]
    local pc = dtt and Tooltips.full(dt, 'DamageTypes', dtt)
     or '[[File:Spacer.png|32px]]&nbsp;<span class="error" title="Not found." style="border-bottom:1px dotted">'..dt..'</span>'
    dtt=dtt or {}
    body = {
        '{| class="healthtable wikitable" style="width:100%; text-align:center; margin: 1em auto 1em auto; font-family:\'Roboto\';"\n',
        insert = table.insert
    }
    for _, v in ipairs(DamageData["dictionary"]["FactionOrder"]) do
        body:insert(([=[
! style="border-block-width: 2px; border-block-color: %s;" | %s Health
! style="border-block-width: 2px; border-block-color: %s;" | %s Modifier
]=]):format(
                DamageData["dictionary"]["Factions"][v][2][1],
                Tooltips.full(v, 'Factions'),
                DamageData["dictionary"]["Factions"][v][2][1],
                pc
            )
        )
    end--faction headers
    
    local count = 0
    for _, v in ipairs(DamageData["dictionary"]["Types"]) do
        count = count % 4 + 1
        if count == 1 then body:insert '\n|-' end
        local val = dtt[v[1]]
        body:insert('\n|')
        body:insert(Tooltips.full(v[1], 'DamageTypes'))
        body:insert('\n|')
        if val then
            body:insert(('<span class="toolType" style="color:%s%s%s</span>'):format(
                    val > 0 and 'var(--positive-text-color);">+' or val < 0 and 'var(--negative-text-color);">' or 'var(--slight-dark-gray);" title="Bypasses">',
                    val == 0 and 'N/A' or val,
                    val == 0 and '' or '%'
                )
            )
        else
            body:insert('<span style="color:var(--slight-dark-gray);" title="No value">—</span>')
        end
    end
    body:insert('\n|}')
    return table.concat(body)
end

--- Builds a damage type modifier table for a health or armor type.
--  @function       p.healthTable
--  @param          {string} ht Health or armor type
--  @return         {string} A table of damage type modifiers of health or armor type in wikitext
function p.healthTable(frame)
    local ht = frame.args and (frame.args[1] or frame.args) or frame
    local htb = DamageData["Health"][ht]
    local htt = DamageData["total"][ht] or {}
    local body = {
([=[{| class="healthtable wikitable" align="right" style="width:33.333%%; text-align:center; font-family:'Roboto';"
! border="1" colspan="2" style="border-style: solid; border-color: #000000; background-color: #000000;" | [[Damage/%s|<span style="color: #FFFFFF;">%s</span>]]
]=]):format(ht, ht),
        insert = table.insert
    }
    for _, v in ipairs(DamageData["dictionary"]["Health"]) do
        local val = htt[v[1]]
        body:insert(('\n|-\n| style="background-color: hsl(%s, %s%%);" | %s\n| style="background-color: hsl(%s, %s%%);" | ')
            :format(
                htb.Color, v[2], 
                Tooltips.full(v[1], 'DamageTypes'), 
                htb.Color, v[2]
            )
        )
        if val then
            body:insert(('<span class="toolType" style="color:%%s">%s</span>')
                    :format(val == 0 and 'N/A' or '%+d%%')
                    :format(val > 0 and 'var(--positive-text-color)' or val == 0 and 'var(--slight-dark-gray)' or 'var(--negative-text-color)', val))
        else
            body:insert('<span style="color:var(--slight-dark-gray;" title="No value">—</span>')
        end
    end
    body:insert '\n|}'
    return table.concat(body)
end

--- Builds a damage type modifier list for a health or armor type.
--  @function       p.healthMod
--  @param          {string} ht Health or armor type
--  @return         {string} Damage type modifiers of health or armor type in wikitext
function p.healthMod(frame)
    local ht = frame.args and (frame.args[1] or frame.args) or frame
    local htt = DamageData["total"][ht]
    if not htt then return '' end
    local body = {}
    for _, v in ipairs(DamageData["dictionary"]["Health"]) do
        local val = htt[v[1]]
        if val and val ~= 0 then
            table.insert(body, ('%s<span class="toolType" style="color:%s">%s</span>'):format(
                Tooltips.icon(v[1], 'DamageTypes', 'y'),
                val > 0 and 'var(--positive-text-color)' or val == 0 and 'var(--slight-dark-gray)' or 'var(--negative-text-color)',
                (val > 0 and '+' or val == 0 and 'x' or '−'):rep( math.ceil( math.abs(val) * 4e-2 ) )--  +++ ++ + x − −− −−−
            ))
        end
    end
    local rev = function(s)
        s = s:match('>[−+x]+</span>'):sub(1, -8)--:gsub('</?span.->',''):
        local sign = 0
        if s:find('+') then
            sign = 1
        elseif s:find('−') then
            sign = -1
        end
        return s:len() * sign
    end
    table.sort(body, function(a,b) return rev(a) < rev(b) end)
    return '<span style=\'text-align:center;\'>'..table.concat(body, '&nbsp;&nbsp;')..'</span>'
end

return p
