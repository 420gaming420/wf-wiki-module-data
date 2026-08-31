---
title: "Module:TennoScript"
wiki_url: "https://wiki.warframe.com/w/Module/TennoScript"
wiki_timestamp: "2015-11-07T08:18:52Z"
---

*Documentation for this module may be created at [Module:TennoScript/doc](/w/Module:TennoScript/doc?action=edit&redlink=1 "Module:TennoScript/doc (page does not exist)")*

```lua
--WIP
--WARFRAME Wiki Tenno Language Conversion
--http://warframe.wikia.com/
--Written by User:ChickenBar and User:Brizingr5

local p = {}
 
local CharData = mw.loadData( 'Module:FactionScript/data' )

function p._tenno (humanwords,size)
	local humanwords = string.lower(humanwords)
	if (size == nil or size == '') then size='16' end
	local tennobet_list = {}    --list of tennobet pics of the chars
	local phonetic_list = {}    --list of phonetic types (vowel/consonant) of the chars
	local output_list = {}      --final output list
	local i=string.len(humanwords)
	while i>0 do
    	local this_char = humanwords:sub(i,i)
    	local prev_char = humanwords:sub(i-1,i-1)
		if this_char == "h" then
			if (prev_char == "t" or
				prev_char == "d" or
				prev_char == "s" or
				prev_char == "z" or
				prev_char == "c" or
				prev_char == "k" or
				prev_char == "i" or
				prev_char == "e" or
				prev_char == "u") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."h"][1])
				table.insert(phonetic_list,CharData["TennoChar"][prev_char.."h"][2])
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["h"][1])
				table.insert(phonetic_list,"c")
				i=i-1
			end
		elseif this_char == "g" then
			if prev_char == "n" then
				table.insert(tennobet_list,CharData["TennoChar"]["ng"][1])
				table.insert(phonetic_list,"c")
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["g"][1])
				table.insert(phonetic_list,"c")
				i=i-1
			end
		elseif  this_char == "e" then
			if humanwords:sub(i-2,i-2)..prev_char == "ay" then
				table.insert(tennobet_list,CharData["TennoChar"]["aye"][1])
				i=i-3
			elseif (prev_char == "e" or
					prev_char == "a") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."e"][1])
				i=i-2
			else 
				table.insert(tennobet_list,CharData["TennoChar"]["e"][1])
				i=i-1
			end
			table.insert(phonetic_list,"v")
		elseif this_char == ("w") then
			if (prev_char == "a" or
				prev_char == "o") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."w"][1])
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["oo"][1])
				i=i-1
			end
				table.insert(phonetic_list,"v")
		elseif this_char == ("o") then
			if prev_char == "o" then
				table.insert(tennobet_list,CharData["TennoChar"]["oo"][1])
				i=i-2
			else 
				table.insert(tennobet_list,CharData["TennoChar"]["o"][1])
				i=i-1
			end
				table.insert(phonetic_list,"v")
		elseif CharData["TennoChar"][this_char] == " " then
				table.insert(tennobet_list,CharData["TennoChar"]["."][1])
				table.insert(phonetic_list,"space")
			    i=i-1
		elseif CharData["TennoChar"][this_char] ~= nil then
				table.insert(tennobet_list,CharData["TennoChar"][this_char][1])
				table.insert(phonetic_list,CharData["TennoChar"][this_char][2])
			    i=i-1
		else
				table.insert(tennobet_list," ")
				table.insert(phonetic_list,"unknown")
			    i=i-1
		end
    end

    local j=#phonetic_list      --size of phoetic_list
    
	while j>0 do
	    if phonetic_list[j] == "c" then         --consonant
            local stack_consonant = mw.html.create('div')
            :attr( 'class', 'tennoscript_C' )
            :wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
	    	table.insert(output_list,tostring(stack_consonant))
		    j=j-1
		elseif phonetic_list[j] == "v" then     --vowel
		    local stack_vowel = mw.html.create('div')
            :attr( 'class', 'tennoscript_V' )
            repeat
                stack_vowel:wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
                j=j-1
            until phonetic_list[j] ~= "v"
		    table.insert(output_list,tostring(stack_vowel))
		elseif phonetic_list[j] == "s" then     --signs/numbers
            local stack_symbol = mw.html.create('div')
            :attr( 'class', 'tennoscript_S' )
            :wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
		    table.insert(output_list,tostring(stack_symbol))
		    j=j-1
		elseif phonetic_list[j] == "p" then    --periods/commas
            local stack_ep = mw.html.create('div'):done()
            if (phonetic_list[j+1] == "c" and (phonetic_list[j-1] == nil or phonetic_list[j-1] == "space")) then 
                stack_ep:attr( 'class', 'tennoscript_EPeriod' ):done()
            elseif (phonetic_list[j-1] == "c" and (phonetic_list[j+1] == nil or phonetic_list[j+1] == "space")) then
                stack_ep:attr( 'class', 'tennoscript_SPeriod' ):done()
            else
                stack_ep:attr( 'class', 'tennoscript_S' ):done()
            end
            stack_ep:wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j=j-1
		elseif phonetic_list[j] == "r" then     --r
            local stack_ep = mw.html.create('div')
            :attr( 'class', 'tennoscript_C' )
            :css('text-align','center')
            :wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j=j-1
		elseif phonetic_list[j] == "space" then
            local stack_space = mw.html.create('div')
            :attr( 'class', 'tennoscript_S' )
            :css('visibility','hidden')
            :wikitext("[[File:"..tennobet_list[j].."|link=]]"):done()
		    table.insert(output_list,tostring(stack_space))
		    j=j-1
        else 
            local stack_space = mw.html.create('div')
            :attr( 'class', 'tennoscript_S' )
            :wikitext(" "):done()
		    table.insert(output_list,tostring(stack_space))
		    j=j-1
	    end
	end
	return table.concat(output_list)
end

function p.tenno ( frame )
    local string_input = frame.args[1]
    local num_input = frame.args[2]
    return p._tenno(string_input,num_input)
end

return p
```

