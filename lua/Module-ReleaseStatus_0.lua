--- ReleaseStatus is used to render Lua module's release status as seen in [[Template:LuaBox]].
--  
--  To be used with [[Template:Status]].
--  
--  Forked from https://dev.fandom.com/wiki/Module:Release_status
--  
--  @module		releasestatus
--  @alias		p
--  @author		[[User:KockaAdmiralac|KockaAdmiralac]]
--  @require	[[Module:WDSButton]]
--  @require	[[Module:ReleaseStatus/data]]
--  @require	[[Module:I18n]]
--  @release	stable
-- 
local p = {}

local wdsButton = require('Module:WDSButton')
local data = mw.loadData('Module:ReleaseStatus/data')
local i18n = require('Module:I18n').loadMessages('ReleaseStatus', 'Common')
local title = mw.title.getCurrentTitle()

function p.status(frame)
    local tmp = mw.ustring.lower(frame:getParent().args[1] or '')
    local status = data[tmp] and tmp or 'unknown'
    local html = wdsButton._badge(i18n:msg(status), status)
    local cat = data[status]
    if cat and title.namespace == 0 then
        html = '[[:Category:' .. cat .. '|' .. html .. ']][[Category:' .. cat .. ']]'
    end
    return html
end

return p
