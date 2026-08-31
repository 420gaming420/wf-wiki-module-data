--WARFRAME Wiki Wordhunt Table
--http://warframe.wikia.com/
--Written by User:ChickenBar
--To be used in Grineer Language article.
--Currently a proof of concept. Bullet list still has better readability.

local p = {}

local script = require( "Module:FactionScript" )

function p.grineerhunt( frame )
    local i=1
    local table_gen = {}
    local t = mw.html.create('table'):attr('class','bigmodtable')
        :tag('tr')
        :tag('th'):wikitext('Grineer'):attr('width','33%'):done()
        :tag('th'):wikitext('English'):attr('width','33%'):done()
        :tag('th'):wikitext('Location'):attr('width','34%'):done()
        :done()
    while frame.args[i] ~= nil do
        t:tag('tr')
            :tag('td'):wikitext(script._grineer(frame.args[i])):done()
            :tag('td'):wikitext(frame.args[i]):done()
            :tag('td'):wikitext(frame.args[i+1]):done()
        :done()
        i=i+2
    end
    return tostring(t)
end

function p.corpushunt( frame )
    local i=1
    local table_gen = {}
    local t = mw.html.create('table'):attr('class','bigmodtable')
        :tag('tr')
        :tag('th'):wikitext('Corpus'):attr('width','33%'):done()
        :tag('th'):wikitext('English'):attr('width','33%'):done()
        :tag('th'):wikitext('Location'):attr('width','34%'):done()
        :done()
    while frame.args[i] ~= nil do
        t:tag('tr')
            :tag('td'):wikitext(script._corpus(frame.args[i])):done()
            :tag('td'):wikitext(frame.args[i]):done()
            :tag('td'):wikitext(frame.args[i+1]):done()
        :done()
        i=i+2
    end
    return tostring(t)
end
    
return p
