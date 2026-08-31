function test()
    local base = {}
    base.__index = base
    base.__ipairs = function(self)
        local i = 0
        return function()
            i = i + 1
            local value = self.values[i]
            if value then return i, value; end
        end
    end

    local derived = {}
    derived.__index = base
    setmetatable(derived, base)

    local instance = { values = {100, 20, 3} }
    setmetatable(instance, derived)

    local sum = 0
    for i, v in ipairs(instance) do
        sum = sum + v
    end

    return sum
end

print(test()) -- if using Scribunto, works only in the debug console
