local MyClass = LCS.class()

-- These are functionally identical, and the former internally falls back to the latter.
local object1 = MyClass()
local object2 = MyClass:new()
