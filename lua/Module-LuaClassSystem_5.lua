local BaseClass = LCS.class()
BaseClass.values = {1, 2, 3}

function BaseClass:sum()
    local sum = 0
    for _, v in ipairs(self.values) do
        sum = sum + v
    end
    
    return sum
end

print(BaseClass:new():sum()) -- prints 6

local DerivedClass = BaseClass:extends()
table.insert(DerivedClass.values, 4)

print(DerivedClass:new():sum()) -- prints 10. Note that :sum() is not defined in the derived class
print(BaseClass:new():sum()) -- ...also prints 10 now
