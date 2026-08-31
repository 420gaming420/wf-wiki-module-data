---
title: "Module:Docbunto/cli"
wiki_url: "https://wiki.warframe.com/w/Module/Docbunto/cli"
wiki_timestamp: "2022-09-23T22:24:21Z"
---

Command line interface (CLI) of [Module:Docbunto](/w/Module:Docbunto "Module:Docbunto"). Forked from <https://dev.fandom.com/wiki/Module:Docbunto/cli>

## Usage

[[edit source](/w/Module:Docbunto/cli/doc?action=edit&section=T-1 "Edit section's source code: Usage")]

Commands can be executed using the debug console which can only be accessed at the bottom of Module:Docbunto/cli's edit page (<https://wiki.warframe.com/w/Module:Docbunto/cli?action=edit>).

For a list of available commands and arguments, type:

```lua
=p "help"
```

## Code

[[edit source](/w/Module:Docbunto/cli/doc?action=edit&section=T-2 "Edit section's source code: Code")]

---

```lua
local docbunto = require('Dev:Docbunto')
local CommandLine = require('Dev:CLI')

local commands = {}

function commands.build(args)
    local ft = require('Dev:FrameTools')
    mw.log(docbunto.main(ft.makePseudoFrame({}, args, {})))
end

function commands.taglet(args)
    local file = args.file or table.remove(args, 1)
    mw.log(require('Dev:Json').encode(docbunto.taglet(file, args), { indent = true }))
end

return CommandLine:new{
    description = 'Docbunto, an automatic documentation generator for Scribunto modules.',
    commands = commands,
    words = {
        build = {
            description = 'Build unprocessed module documentation - useful for testcases.',
            options = { 1, 'all', 'boilerplate', 'code', 'colon', 'simple', 'sort', 'ulist' }
        },
        taglet = {
            description = 'Dumps a JSON representation of a module documentation taglet to console.',
            options = { 1, 'boilerplate', 'colon', 'sort' }
        }
    },
    options = {
        { name = 1, alias = 'file', description = 'Module name without namespace.', type = 'string', required = true },
        { name = 'all', alias = 'a', description = 'Include local items in documentation.' },
        { name = 'boilerplate', alias = 'b', description = 'Boilerplate comment removal in source files.' },
        { name = 'code', alias = 'C', description = 'Only document Docbunto code items.' },
        { name = 'colon', alias = 'c', description = 'Colon mode.' },
        { name = 'simple', alias = 'S', description = 'Limit documentation to descriptions only.' },
        { name = 'sort', alias = 's', description = 'Sort documentation items in alphabetical order.' },
        { name = 'ulist', alias = 'u', description = 'Indent documentation items as unordered lists.' },
    }
}
```

