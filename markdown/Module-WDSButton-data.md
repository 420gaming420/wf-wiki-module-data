---
title: "Module:WDSButton/data"
wiki_url: "https://wiki.warframe.com/w/Module/WDSButton/data"
wiki_timestamp: "2022-09-24T02:55:41Z"
---

*Documentation for this module may be created at [Module:WDSButton/data/doc](/w/Module:WDSButton/data/doc?action=edit&redlink=1 "Module:WDSButton/data/doc (page does not exist)")*

```lua
-- 
--------------------------------------------------------------------------------
-- Color scheme data for [[Module:WDS Button]].
--------------------------------------------------------------------------------
local p = {}

-- Helper function to make the same data available under multiple aliases.
local function ColorScheme(fields)
    for _, alias in ipairs(fields.aliases) do
        if p[alias] then
            -- Users should never see this.
            error("duplicate alias `" .. alias .. "`")
        end

        p[alias] = fields
    end
end

ColorScheme {
    aliases = {"stable", "pass", "passed", "done"},
    backgroundColor = "#32cd32",
    textColor = "white",
}

ColorScheme {
    aliases = {"beta", "warn", "blocked"},
    backgroundColor = "#ffba01",
    textColor = "white",
}

ColorScheme {
    aliases = {"experimental", "delete"},
    backgroundColor = "#ff4500",
    textColor = "white",
}

ColorScheme {
    aliases = {"unstable", "error"},
    backgroundColor = "#900",
    textColor = "yellow",
}

ColorScheme {
    aliases = {"fail", "failed"},
    backgroundColor = "#900",
    textColor = "white",
}

ColorScheme {
    aliases = {"archive", "awaiting"},
    backgroundColor = "#0d47a1",
    textColor = "white",
}

ColorScheme {
    aliases = {"unmaintained", "broken"},
    backgroundColor = "#8b4513",
    textColor = "white",
}

ColorScheme {
    aliases = {"unknown", "nil", "default"},
    backgroundColor = "#aaa",
    textColor = "white",
}

return p
```

