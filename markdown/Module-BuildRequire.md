---
title: "Module:BuildRequire"
wiki_url: "https://wiki.warframe.com/w/Module/BuildRequire"
wiki_timestamp: "2018-03-24T02:40:28Z"
---

*Documentation for this module may be created at [Module:BuildRequire/doc](/w/Module:BuildRequire/doc?action=edit&redlink=1 "Module:BuildRequire/doc (page does not exist)")*

```lua
--WIP
--This pulls data from [[Module:Weapons/data]].
local p = {}
local icons = require( "Module:Icon" )

function p.buildtable()
    local t = mw.html.create('table'):attr('class','foundrytable')
        :tag('tr')
        :tag('th'):wikitext('[[Foundry|Manufacturing]] Requirements'):attr('colspan','6'):done()
        :done()
        :tag('tr')
            :tag('td'):attr('rowspan','2'):css('height','50px'):css('width','50px'):wikitext('dayum'):done()
        :done()
            
            
        return tostring(t)
end
    
return p
--auto detect if it's prime, add drop locations by default

--[=[
{{BuildRequire
|buildcredits= 
|build1= 
|build1amount=
|build2= 
|build2amount=
|build3= 
|build3amount=
|build4= 
|build4amount=
|buildtime=
|buildrush=
|blueprint=
|market=
|lab=
|researchcredits=
|research1=
|research1amount=
|research2=
|research2amount=
|research3=
|research3amount=
|research4=
|research4amount=
|researchtime=
|prereq=
|blueprintmission      = 
|build1mission         = 
|build2mission         =
|build3mission         =
|build4mission         =
|blueprintmissionps4   = 
|build1missionps4      = 
|build2missionps4      =
|build3missionps4      =
|build4missionps4      =
|blueprintmissionxb1   = 
|build1missionxb1      = 
|build2missionxb1      =
|build3missionxb1      =
|build4missionxb1      =
}}

]=]
```

