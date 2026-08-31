---	'''FactionScript''' translates English phrases and sentences to [[WARFRAME]]-unique [[:Category:Language|languages]].<br />
--	
--	On this wiki, FactionScript is used in:
--	* [[Template:FactionScript]]
--	* [[Template:CorpusScript]]
--	* [[Template:GrineerScript]]
--- * [[Template:TennoScript]]
--	
--	Associated CSS stylesheet is stored on [[MediaWiki:FactionScript.css]].
--	
--	@module		factionscript
--	@alias		p
--	@author		[[User:ChickenBar|ChickenBar]]
--	@image		Tennobet2.png
--	@require	[[Module:FactionScript/data]]
--	@release	stable
--	

local p = {}

local CharData = mw.loadData( 'Module:FactionScript/data' )

--- Generates WARFRAME language glyph sequence for an English phrase/sentence.
--	@function		p.gen_script
--	@param			{string} faction WARFRAME language (e.g. 'grineer' or 'corpus')
--	@param			{string} human_words English phrase/sentence to be translated
--	@param[opt]		{number} size Image sizes in pixels; default 14 for Corpus language and 16 for Grineer
--	@return			{string} HTML of resultant glyph sequence
function p.gen_script(faction, human_words, size)
    local output_string = {}
    local human_words = string.lower(human_words)
    local human_length = string.len(human_words)
    local char_data
    local human_char
    local replacement
    
    if faction == 'corpus' then
        char_data = CharData['CorpusChar']
        if (size == '') or (size == nil) then size = '14' end
        for i=1, human_length do
            human_char = human_words:sub(i,i)
            replacement = char_data[human_char]
            if replacement then
                table.insert(output_string, get_img(replacement, size))
            else
            
            -- adding spaces between words
                table.insert(output_string,'&nbsp;&nbsp;&nbsp;')
            end
        end
    else
        char_data = CharData['GrineerChar']
        if (size == '') or (size == nil) then size = '16' end
        for i=1, human_length do
            human_char = human_words:sub(i,i)
            -- no letter "Q" in Grineer language, replace with "K" + "Q" characters
            if human_char == 'q' then
                table.insert(output_string,get_img(char_data['k'], size)..get_img(char_data['w'], size))
            
            -- no letter "X" in Grineer language, replace with "K" + "S" characters
            elseif human_char == 'x' then
                table.insert(output_string,get_img(char_data['k'], size)..get_img(char_data['s'], size))
            else
                replacement = char_data[human_char]
                if replacement then
                    table.insert(output_string, get_img(replacement, size))
                    
                -- adding spaces between words
                else
                    table.insert(output_string,'&nbsp;&nbsp;&nbsp;')
                end
            end
        end
    end
    return create_span(output_string, size)
end

--- Gets glyph image.
--	@function		p.get_img
--	@param			{string} image_name Image name
--	@param			{number} size Image size in pixels
--	@return			{string} Wikitext of image file
function get_img(image_name, size)
    return '[[File:'..image_name..'|x'..size..'px|link=]]'
end

--- Creates span elements for a string.
--	@function		p.create_span
--	@param			{string} output_string String to be wrapped around with span tags
--	@param			{number} size Image sizes in pixels
--	@return			{string} resultant HTML
function create_span(output_string, size)
    local span = mw.html.create('span')
    span:css('font-size', size..'px'):wikitext(table.concat(output_string))
    return tostring(span)
end

--- Creates [[Corpus Language]] translation of an English phrase/sentence.
--	@function		p.corpus
--	@param			{table} frame
--					* {string} string_input English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 14
--	@return			{string} HTML of resultant glyph sequence
function p.corpus(frame)
    local string_input = frame.args[1]
    local size = frame.args[2]
    return p.gen_script('corpus', string_input, size)
end

--- Creates [[Grineer Language]] translation of an English phrase/sentence.
--	@function		p.grineer
--	@param			{table} frame
--					* {string} string_input English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p.grineer(frame)
    local string_input = frame.args[1]
    local size = frame.args[2]
    return p.gen_script('grineer', string_input, size)
end

--- Creates [[Orokin Language]] translation of an English phrase/sentence.
--	@function		p._tenno
--	@param			{string} human_words English phrase/sentence to be translated
--	@param[opt]		{number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p._tenno(human_words, size)
	local human_words = string.lower(human_words)
	if (size == nil or size == '') then size='10' end
	local tennobet_list = {}    --list of tennobet pics of the chars
	local phonetic_list = {}    --list of phonetic types (vowel/consonant) of the chars
	local output_list = {}      --final output list
	
	-- converting "normal human spelling" to English phonetic spelling
	local i = string.len(human_words)
	
	while i > 0 do
    	local this_char = human_words:sub(i,i)
    	local prev_char = human_words:sub(i-1,i-1)
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
			if human_words:sub(i-2,i-2)..prev_char == "ay" then
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
				table.insert(tennobet_list,"&nbsp;")
				table.insert(phonetic_list,"unknown")
			    i=i-1
		end
    end

    -- building resultant sequence of Tennobet character images 
    local j = #phonetic_list      --size of phoetic_list
    
	while j > 0 do
	    if phonetic_list[j] == "c" then         --consonant
            local stack_consonant = mw.html.create('div')
            	:attr( 'class', 'tennoscript_C' )
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
	    	table.insert(output_list,tostring(stack_consonant))
		    j = j - 1
		elseif phonetic_list[j] == "v" then     --vowel
		    local stack_vowel = mw.html.create('div')
            	:attr( 'class', 'tennoscript_V' )
            repeat
                stack_vowel:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
                j = j - 1
            until phonetic_list[j] ~= "v"
		    table.insert(output_list,tostring(stack_vowel))
		elseif phonetic_list[j] == "s" then     --signs/numbers
            local stack_symbol = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_symbol))
		    j = j - 1
		elseif phonetic_list[j] == "p" then    --periods/commas
            local stack_ep = mw.html.create('div'):done()
            if (phonetic_list[j + 1] == "c" and (phonetic_list[j-1] == nil or phonetic_list[j-1] == "space")) then 
                stack_ep:attr( 'class', 'tennoscript_EPeriod' ):done()
            elseif (phonetic_list[j - 1] == "c" and (phonetic_list[j+1] == nil or phonetic_list[j+1] == "space")) then
                stack_ep:attr( 'class', 'tennoscript_SPeriod' ):done()
            else
                stack_ep:attr( 'class', 'tennoscript_S' ):done()
            end
            stack_ep:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j = j - 1
		elseif phonetic_list[j] == "r" then     --r
            local stack_ep = mw.html.create('div')
            	:attr( 'class', 'tennoscript_C' )
            	:css('text-align','center')
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j = j - 1
		elseif phonetic_list[j] == "space" then
            local stack_space = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:css('visibility','hidden')
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_space))
		    j = j - 1
        else 
            local stack_space = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:wikitext("&nbsp;"):done()
		    table.insert(output_list,tostring(stack_space))
		    j =	j - 1
	    end
	end
	return table.concat(output_list)
end

--- Creates [[Orokin Language]] translation of an English phrase/sentence.
--	@function		p.tenno
--	@param			{table} frame
--					* {string} human_words English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p.tenno(frame)
    local string_input = frame.args[1]
    local num_input = frame.args[2]
    return p._tenno(string_input,num_input)
end

return p
