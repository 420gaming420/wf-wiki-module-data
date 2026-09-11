-- used for devshorts and devstreams --
local p = {}

function p.main(frame)
	--to let custom columns if needed , 4 by default / if not used
	-- left side is var name here , right side are the parameters sent from outside
    local MAX_COLUMNS = tonumber(frame.args.maxcolumns) or 4
    local Title = frame.args.title or "Participant(s)"
    local Width = frame.args.width or "90%"
    local Height = frame.args.height or "40px"
    local FloatPos = frame.args.floatpos or "none"
    local Margin_Left = frame.args.margin_left or "auto"
    local Margin_Right = frame.args.margin_right or "auto"
    local PicsSize = frame.args.pics_size or "125px"
    local CollapsedByDefault = frame.args.iscollapsed or "false"
    
    local output = {
        '{| class="wikitable mw-collapsible '..(CollapsedByDefault == "true" and "mw-collapsed" or "")..'" style="float:'..FloatPos..';margin-left:'..Margin_Left..'; margin-right:'..Margin_Right..';width:'..Width..';height:'..Height..';text-align:center;"','|-',
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
        args = { participants[i] , photosize = PicsSize}
            }
        )
    end

    table.insert(output, '|}')

    return table.concat(output, '\n')
end

return p
