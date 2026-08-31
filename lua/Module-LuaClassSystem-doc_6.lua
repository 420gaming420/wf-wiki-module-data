local Counter = LCS.class()

function Counter:init()
    self.value = 0
end

local DoubleCounter = Counter:extends()

function DoubleCounter:init()
    self:super('init')
    self.value2 = 0
end
