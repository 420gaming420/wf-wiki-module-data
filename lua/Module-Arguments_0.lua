local getArgs = require('Module:Arguments').getArgs
function p.main(frame)
    local args = getArgs(frame, {
        wrapper = 'Template:<TEMPLATE>'
    })
    -- Use the args table here.
    -- A common paradigm is <code>return p._main(args)</code>.
    -- This allows other Lua modules to access the
    -- main logic in a performant manner without a
    -- frame object.
end
