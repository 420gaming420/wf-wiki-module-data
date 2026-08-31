---	Adjusts the luminance of your baseline colors to ensure they meet the AAA 
--	or AA guidelines for text readability against a specific background color.
--	
--	To run this program in the debug console, first enter source editor and in
--	the debug console, enter `=p`.
--	To adjust the parameters, edit baselineColors, backgroundColor, and minContrastRatio local variables.
--	
--	Assisted with Copilot. Unused as of 2025-03-17; manually picking colors that are compatible with different
--	theming instead in [[MediaWiki:Common.css]] and [[MediaWiki:Vector-theme-light.css]]
--	
--	@module	DamageTypes.colorContrastAdjuster
--

-- RGB of damage types according to their respective Glyphs; opinionated on what is the "main" color
local baselineColors = {
    {239, 255, 255},	-- Impact
    {115, 103, 89},	-- Puncture
    {219, 167, 170},	-- Slash
    {254, 124, 18},	-- Heat
    {55, 109, 237},	-- Cold
    {110, 77, 146},	-- Electricity
    {109, 182, 40},	-- Toxin
    {126, 59, 60},	-- Blast
    {221, 203, 0},	-- Radiation
    {176, 177, 188},	-- Magnetic
    {225, 108, 170},	-- Viral
    {194, 210, 0},	-- Corrosive
    {246, 15, 19},	-- Tau
    {255, 206, 91},	-- True
    {0, 132, 137},	-- Void
}
-- local backgroundColor = {255, 255, 255} -- white background
local backgroundColor = {25, 38, 47}	-- From CSS variable: --theme-page-background-color: #19262f
local minContrastRatio = 7 -- AAA guidelines

-- Function to calculate the relative luminance of a color
local function luminance(r, g, b)
    local function channelLuminance(v)
    	-- Normalize the color value to the range [0, 1]
        v = v / 255
        
        -- Apply the luminance conversion formula
        -- If the value is less than or equal to 0.03928, use the linear approximation
        if v <= 0.03928 then
            return v / 12.92
        else
        	-- Otherwise, use the gamma corrected formula
            return ((v + 0.055) / 1.055) ^ 2.4
        end
    end
    
    -- Calculate the luminance of each color channel and apply the corresponding weights
    return 0.2126 * channelLuminance(r) + 0.7152 * channelLuminance(g) + 0.0722 * channelLuminance(b)
end

-- Function to calculate the contrast ratio between two colors
-- See https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html#dfn-contrast-ratio
local function contrastRatio(rgb1, rgb2)
    local lum1 = luminance(rgb1[1], rgb1[2], rgb1[3])
    local lum2 = luminance(rgb2[1], rgb2[2], rgb2[3])
    local brightest = math.max(lum1, lum2)
    local darkest = math.min(lum1, lum2)
    -- Calculate the contrast ratio by adding 0.05 to both luminance values to avoid 
    -- division by zero and account for perceptual differences in human vision
    return (brightest + 0.05) / (darkest + 0.05)
end

-- Function to adjust a color to meet the minimum contrast ratio
local function adjustColorToMeetContrast(rgb, bgRgb, minContrast)
	local steps = 100	-- Arbitrary number of steps to determine resultant color
    local factor = 1
    for i = 1, steps do
        -- Adjust the brightness of the baseline color by multiplying each component with the factor 
        -- and rounding to the nearest integer
        local adjustedColor = {
            math.min(255, math.max(0, math.floor(rgb[1] * factor + 0.5))),
            math.min(255, math.max(0, math.floor(rgb[2] * factor + 0.5))),
            math.min(255, math.max(0, math.floor(rgb[3] * factor + 0.5)))
        }
        if contrastRatio(adjustedColor, bgRgb) >= minContrast then
            return adjustedColor	-- Note this will return initial RGB if it already meets contrast ratio target
        end
        -- Incrementally decrease the brightness of the baseline color to find 
        -- a suitable color that meets the required contrast ratio.
        factor = factor - 0.01
    end
    return { -1, -1, -1 } -- If no adjustment found, return invalid result
end

-- Function to adjust a list of colors to meet the minimum contrast ratio
local function adjustColorsForContrast(colors, bgColor, minContrast)
    local adjustedColors = {}
    for i, color in ipairs(colors) do
        table.insert(adjustedColors, adjustColorToMeetContrast(color, bgColor, minContrast))
    end
    return adjustedColors
end

local adjustedColors = adjustColorsForContrast(baselineColors, backgroundColor, minContrastRatio)
local result = ""
for i, color in ipairs(adjustedColors) do
    result = result .. table.concat(color, ", ") .. "\n"
end

return result
