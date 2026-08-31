local Counter = LCS.class()

function Counter:init()
    self.value = 0
end

local DoubleCounter = Counter:extends()

function DoubleCounter:init()
    self:super('meow') -- no cats involved (sadly), so Lua just crashes.
    self.value2 = 0
end
