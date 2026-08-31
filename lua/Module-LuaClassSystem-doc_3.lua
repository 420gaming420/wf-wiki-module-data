local MyClass = LCS.class()

function MyClass:init()
    self.value = 10
end

function MyClass:runCountdownTick()
    if self.value > 0 then
        self.value = self.value - 1
    end
    
    return self.value
end

function MyClass:isReady()
    return self.value == 0
end

function MyClass:reset()
    self.value = 10
end

local object = MyClass:new()
for i = 1, 8 do
    object:runCountdownTick()
end
-- value is now 2

local one = object:runCountdownTick()
local zero = object:runCountdownTick()
assert(object:isReady())

object:reset() -- back to 10
