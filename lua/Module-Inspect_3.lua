-- Hybrid dictionary-array table.
assert(inspect({1,2,3,b=2,a=1}) == [[{ 1, 2, 3,
  a = 1,
  b = 2
}]])
