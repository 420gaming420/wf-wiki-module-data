-- Table with a subtable and function.
assert(inspect({a={f=tostring}}) == [[{
  a = {
    f = <function 1>
  }
}]])
