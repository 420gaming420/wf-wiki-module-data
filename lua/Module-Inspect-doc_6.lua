-- Table with a recursive loop.
local a = {1, 2}
local b = {3, 4, a}
a[3] = b -- a references b, and b references a
assert(inspect(a) == "<1>{ 1, 2, { 3, 4, <table 1> } }")
