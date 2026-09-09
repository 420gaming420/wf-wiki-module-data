---
title: "Module:DevstreamParticipantsList"
wiki_url: "https://wiki.warframe.com/w/Module/DevstreamParticipantsList"
wiki_timestamp: "2026-09-07T14:45:24Z"
---

*Documentation for this module may be created at [Module:DevstreamParticipantsList/doc](/w/Module:DevstreamParticipantsList/doc?action=edit&redlink=1 "Module:DevstreamParticipantsList/doc (page does not exist)")*

```lua
-- trying to see what is the best way to fo what i want for devshorts--
local p = {}

function p.main(frame)
	--to let custom columns if needed , 4 by default / if not used
    local MAX_COLUMNS = tonumber(frame.args.maxcolumns) or 4
    local Title = frame.args.title or "Participant(s)"
    local Width = frame.args.width or "90%"
    local Height = frame.args.height or "40px"
    local PicsSize = frame.args.picssize or "125px"
    
    local output = {
        '{| class="wikitable mw-collapsible" style="margin-left:auto; margin-right:auto;width:'..Width..';height:'..Height..';text-align:center;"','|-',
        '! colspan="' .. MAX_COLUMNS .. '" | ' .. Title
    }

    local participants = {}

    -- Param
    for _, name in ipairs(frame.args) do
        name = mw.text.trim(name)

        if name ~= "" then
            table.insert(participants, name)
        end
    end

    -- each line
    for i = 1, #participants do

        -- New line every MAX_COLUMNS
        if (i - 1) % MAX_COLUMNS == 0 then
            table.insert(output, '|-')
        end

-- Participant
table.insert(output,
    '| style="vertical-align:top;" | ' .. frame:expandTemplate{
        title = 'Template:DE-Employee_ListOfNamesAndFaces',
        args = { participants[i] , photosize=PicsSize}
            }
        )
    end

    table.insert(output, '|}')

    return table.concat(output, '\n')
end

return p
```

