---
title: "Module:ChickenTest"
wiki_url: "https://wiki.warframe.com/w/Module/ChickenTest"
wiki_timestamp: "2021-06-10T15:39:16Z"
---

*Documentation for this module may be created at [Module:ChickenTest/doc](/w/Module:ChickenTest/doc?action=edit&redlink=1 "Module:ChickenTest/doc (page does not exist)")*

```lua
--WARFRAME Wiki Icon Module
--http://warframe.wikia.com/wiki/Template:Icon

local p = {}

local IconData = mw.loadData( 'Module:Icon/data' )

function p.Item(frame)
	local iconname = frame.args[1]
	local textexist = frame.args[2]
	local imagesize = frame.args.imgsize
	local link = ''
	if IconData["Items"][iconname] == nil then          
		return "Invalid"  
	else
		link = IconData["Items"][iconname]["link"]
                iconname = IconData["Items"][iconname]["icon"]
		if (imagesize == nil or imagesize == '') then
			imagesize = 'x26'                                 
		end
		if (textexist == 'text' or textexist == 'Text') then                           
			return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']] [['..link..'|'..frame.args[1]..']]'
		end
		return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
	end
end

function p.Pol( frame )
        local iconname = frame.args[1]
        local imagesize = frame.args.imgsize
        if IconData["Polarities"][iconname] == nil then          
              return "Invalid"  
        else
           iconname = IconData["Polarities"][iconname]
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x20'                                 
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link=Polarity]]'
        end
end

function p.Faction( frame )
        local iconname = frame.args[1]        
	local textexist = frame.args[2]          
        local color = frame.args[3]
        local imagesize = frame.args.imgsize
        local link = ''
        if IconData["Factions"][iconname] == nil then          
              return '[['..iconname..']]'  
        else
           link = IconData["Factions"][iconname]["link"]
           if color == 'white' then
              iconname = IconData["Factions"][iconname]["icon"][2]   --white icon
           else
	      iconname = IconData["Factions"][iconname]["icon"][1]   --black icon
	   end
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x20'                                 
           end
	   if (textexist == 'text' or textexist == 'Text') then                           
              return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']][['..link..']]'
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
        end
end

function p.Syndicate( frame )
        local iconname = frame.args[1]        
	local textexist = frame.args[2]          
        local color = frame.args[3]
        local imagesize = frame.args.imgsize
        local link = ''
        if IconData["Syndicates"][iconname] == nil then          
              return ""  
        else
           link = IconData["Syndicates"][iconname]["link"]
           if color == 'white' then
              iconname = IconData["Syndicates"][iconname]["icon"][2]   --white icon
           else
	      iconname = IconData["Syndicates"][iconname]["icon"][1]   --black icon
	   end
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x32'                                 
           end
	   if (textexist == 'text' or textexist == 'Text') then                           
              return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']][['..link..']]'                         
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
        end
end

function p._Prime( primename, partname, imagesize ) 
    local primename = string.gsub(" "..string.lower( primename ), "%W%l", string.upper):sub(2)
    local link = ''
    if IconData["Primes"][primename] == nil then          
        return "Unconfirmed Item"  
    else
           link = IconData["Primes"][primename]["link"]
           iconname = IconData["Primes"][primename]["icon"]
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x32'                                 
           end
	    if partname ~= nil then 
	        partname = string.gsub(" "..string.lower( partname ), "%W%l", string.upper):sub(2) 
            if primename == "Forma" then
                return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']] [['..link..'#Acquisition|'..primename.." "..partname..']]'
            else 
                return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']] [['..link..'#Acquisition|'..primename..' Prime '..partname..']]'                         
            end
        end
        return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
        end
end

function p.Resource( frame )
        local iconname = frame.args[1]        
	local textexist = frame.args[2]
        local imagesize = frame.args.imgsize
        local link = ''
        if IconData["Resources"][iconname] == nil then          
              return ""  
        else
           link = IconData["Resources"][iconname]["link"]
           iconname = IconData["Resources"][iconname]["icon"]
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x32'                                 
           end
	   if (textexist == 'text' or textexist == 'Text') then                           
              return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']] [['..link..'|'..frame.args[1]..']]'                         
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
        end
end

function p.Proc( frame )
        local iconname = frame.args[1]        
        local textexist = frame.args[2]          
        local color = frame.args[3]
        local imagesize = frame.args.imgsize
        local link = ''
        local textcolor = ''
        if IconData["Procs"][iconname] == nil then          
              return "Invalid"  
        else
           link = IconData["Procs"][iconname]["link"] 
           if color == 'white' then
              iconname = IconData["Procs"][iconname]["icon"][2]   --white icon
           else
	      iconname = IconData["Procs"][iconname]["icon"][1]   --black icon
	   end
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x18'                                 
           end
	   if (textexist == 'text' or textexist == 'Text') then  
              textcolor = IconData["Procs"][frame.args[1]]["color"]                 
              return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']] [['..link..'|'..frame.args[1]..']]'                      
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
        end
end

function p.Focus( frame )
    local iconname = frame.args[1]
    local textexist = frame.args[2]
    local color = frame.args[3]
    local icontype = frame.args[4]
    local imagesize = frame.args.imgsize
    if IconData["Focus"][iconname] == nil then          
        return "Invalid"  
    else
        if icontype == 'seal' then
            if color == 'white' then
                iconname = IconData["Focus"][iconname]["seal"][2]
            else
                iconname = IconData["Focus"][iconname]["seal"][1]
            end
        else
            if color == 'white' then
                iconname = IconData["Focus"][iconname]["icon"][2]
            else
                iconname = IconData["Focus"][iconname]["icon"][1]
            end
        end
            if (imagesize == nil or imagesize == '') then
              imagesize = 'x20'
           end
           if (textexist == 'text' or textexist == 'Text') then  
              textcolor = IconData["Focus"][frame.args[1]]["color"]                 
              return '[[File:'..iconname..'|'..imagesize..'px|sub|link=Focus]][[Focus|'..frame.args[1]..']]'
          end
          return '[[File:'..iconname..'|'..imagesize..'px|link=Focus]]'
      end
end

function p.Way( frame )
        local iconname = frame.args[1]
        local imagesize = frame.args.imgsize
        local link = ''
        if IconData["Ways"][iconname] == nil then          
              return "Missing  
Icon"  
        else
	        iconname = IconData["Ways"][iconname]
	    end
        if (imagesize == nil or imagesize == '') then
            imagesize = 'x18'
        end
	    return '[[File:'..iconname..'|'..imagesize..'px|link='..link..']]'
end
            

function p.HUD( frame )
        local iconname = frame.args[1]        
	local textexist = frame.args[2]          
        local color = frame.args[3]
        local imagesize = frame.args.imgsize
        local link = ''
        if IconData["Heads-Up Display"][iconname] == nil then          
              return '[['..iconname..']]'  
        else
           link = IconData["Heads-Up Display"][iconname]["link"]
           if color == 'white' then
              iconname = IconData["Heads-Up Display"][iconname]["icon"][2]   --white icon
           else
	      iconname = IconData["Heads-Up Display"][iconname]["icon"][1]   --black icon
	   end
           if (imagesize == nil or imagesize == '') then
              imagesize = 'x20'                                 
           end
	   if (textexist == 'text' or textexist == 'Text') then                           
              return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display]][[Heads-Up Display|'..link..']]'
           end
	   return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display]]'
        end
end

function p.Flag( frame )
        local iconname = frame.args[1]
        local tooltip = frame.args[2]
        local dest = frame.args[3]        
	local textexist = frame.args[4]
        if IconData["Flags"][iconname] == nil then          
              return "Invalid"  
        else
           iconname = IconData["Flags"][iconname]
           if tooltip == nil then
              tooltip = ''
           end
           if dest == nil then
              dest = ''
           end
	   if (textexist == 'text' or textexist == 'Text') then 
	      return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']] [['..dest..'|'..tooltip..']]'
           end
	   return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']]'
        end
end

local data_t = {
    item = "Items",
    polarity = "Polarities",
    faction = "Factions",
    syndicate = "Syndicates",
    prime = "Primes",
    resource = "Resources",
    proc = "Procs",
    focus = "Focus",
    way = "Ways",
    hud = "Heads-Up Display",
    flag = "Flags"
}

function p.gen_icon(icon_name, text_exist, img_size, link, icon_color, text_color)
    icon_data = IconData[data_t[icon_name]]
    if not icon_data[iconname] then          
		return '[['..iconname..']]'
	else
		return ''
	end
end
	    
    
    

function get_img(replacement, size, link, tooltip)
    tooltip = tooltip or ""
    return '[[File:'..replacement..'|'..tooltip..'|'..size..'px|link='..link..']]'
end

function p.Prime( frame )
    local primename_input = frame.args[1]
    local partname_input = frame.args[2]
    local imagesize_input = frame.args.imgsize
    return p._Prime(primename_input, partname_input, imagesize_input)
end
 
return p
```

