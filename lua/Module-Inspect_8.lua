-- <code>options.newline</code> & <code>options.indent</code>.
assert(inspect(
    t,
    {newline='@', indent="++"}),
    "{@++a = {@++++b = 1@++}@}"
)
