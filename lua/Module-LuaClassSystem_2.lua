local MyClass = LCS.class()

function MyClass:init(length)
    local length = tonumber(length) or 0
    
    self.array = {}
    for i = 1, length do
        self.array[i] = math.sqrt(i)
    end
end

local object1 = MyClass:new(4)
print(object1.array[2]) -- prints sqrt(2), approximately 1.414
print(object1.array[4]) -- prints 2
