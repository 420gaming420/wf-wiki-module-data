-- <code>options.depth</code>.
assert(inspect(t5, {depth = 2}) == [[{
  a = {
    b = {...}
  }
}]])
