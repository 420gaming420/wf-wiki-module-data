-- Table with a metatable.
assert(inspect(setmetatable({a=1}, {b=2}) == [[{
  a = 1
  <metatable> = {
    b = 2
  }
}]]))
