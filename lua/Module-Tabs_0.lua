---	Scribuntu Lua port of `https://wiki.leagueoflegends.com/en-us/Template:Tabview`
--	to enable indefinite number of tabbed pages without having to manually build the Tabview template using ugly escaped wikitext.
--	To be used with [[Template:Tabs]].
--	
--	@classmod		Tabs
--	@author			Copilot
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@release	stable
--	

local Tabs = {}

---	Entrypoint to creating multiple up to 20 tabs, each tab containing transcluded articles.
--	Takes in two to multiple string arguments (max 40).
--	* tab<number> represents the display name of the tab
--	* content<number> represents the name of the transcluded page under the tab of the corresponding number
--	Does nothing if there is no tab or content argument.
--	Does nothing on direct invoke on articles. Must be used on a transcluded page like a template.
--	Does nothing if used in other Lua modules. Only supports #invoke from articles.
--	
--	@type		Tabs
--	@usage		On template page: {{#invoke:Tabs|createTabber}}
--	@usage		On article: {{Tabs|tab1=Display Name|content1=Page Name|tab2=Display Name|content2=Page Name}}
function Tabs.createTabber(frame)
    local args = frame:getParent().args
    local result = { '{{#tag:tabber'}

    for i = 1, 20 do
        local tab = args['tab' .. i]
        local content = args['content' .. i]

        if tab and content then
            table.insert(result, string.format('|%s=%s\n|-', tab, '{{:' .. content .. '}}'))
        else
            break
        end
    end
	table.insert(result, '}}')
	
    return frame:preprocess(table.concat(result, '\n'))
end

return Tabs
