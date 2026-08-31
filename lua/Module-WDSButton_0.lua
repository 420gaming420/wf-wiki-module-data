-- 
--------------------------------------------------------------------------------
-- Shared library for (ab)using `wds-button`s.
--------------------------------------------------------------------------------
local p = {}
local getArgs = require("Module:Arguments").getArgs
local userError = require("Module:UserError")
local data = mw.loadData("Module:WDSButton/data")

--------------------------------------------------------------------------------
-- Creates a "badge"-like `wds-button`.
--
-- @param {string} text
--     The text to appear inside of the badge.
-- @param {string} colorSchemeName
--     The name of the color scheme to use.
-- @returns {string}
--     The badge.
--------------------------------------------------------------------------------
function p._badge(text, colorSchemeName)
    local colorScheme = data[colorSchemeName] or data.default
    local badge = mw.html.create("span")
        :addClass("wds-button")
        :css("background-color", colorScheme.backgroundColor)
        :css("border-color", colorScheme.backgroundColor)
        :css("color", colorScheme.textColor)
        :css("cursor", "inherit")
        :css("font-weight", "bold")
        :wikitext(text)

    return tostring(badge)
end

--------------------------------------------------------------------------------
-- Invocable version of `p._badge`.
--
-- @param {table} frame
--     Scribunto frame object.
-- @returns {string}
--     The badge.
--------------------------------------------------------------------------------
function p.badge(frame)
    local args = getArgs(frame)

    return p._badge(args[1], args[2])
end

--------------------------------------------------------------------------------
-- Creates a "bubble"-like `wds-button`.
--
-- @param {string} text
--     The text to appear inside of the bubble.
-- @param {string} colorSchemeName
--     The name of the color scheme to use.
-- @returns {string}
--     The bubble.
--------------------------------------------------------------------------------
function p._bubble(text, colorSchemeName)
    local colorScheme = data[colorSchemeName] or data.default
    local badge = mw.html.create("span")
        :addClass("wds-button")
        :addClass("wds-font-size-xxs")
        :css("background-color", colorScheme.backgroundColor)
        :css("border-color", colorScheme.backgroundColor)
        :css("color", colorScheme.textColor)
        :css("border-radius", "0.5em")
        :css("padding", "0 0.4em")
        :css("vertical-align", "middle")
        :wikitext(text)

    return tostring(badge)
end

--------------------------------------------------------------------------------
-- Invocable version of `p._bubble`.
--
-- @param {table} frame
--     Scribunto frame object.
-- @returns {string}
--     The bubble.
--------------------------------------------------------------------------------
function p.bubble(frame)
    local args = getArgs(frame)

    return p._bubble(args[1], args[2])
end

return p
