-- trying to see what is the best way to fo what i want for devshorts--
local p = {}

function p.main(frame)
	--to let custom columns if needed , 4 by default / if not used
    local MAX_COLUMNS = tonumber(frame.args.maxcolumns) or 4

    local output = {
        '{| class="wikitable mw-collapsible" style="margin-left:auto; margin-right:auto;width:90%;height:40px;text-align:center;"','|-',
        '! colspan="' .. MAX_COLUMNS .. '" | Participants'
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
        title = 'User:FAKIR/Template:DE_WhoIsWho',
        args = { participants[i] }
            }
        )
    end

    table.insert(output, '|}')

    return table.concat(output, '\n')
end

return p
