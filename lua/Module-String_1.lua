---	'''String''' is an extension of the string STL which provides operations on 
--	string values.<br />
--	
--	 String can be invoked directly (`&#123;{#invoke:String|function|...}}`), 
--	 invoked from a template (`&#123;{template|function|...}}`), or used
--	 within other modules.<br />
--	
--	For additional functions that operate on strings, you can look into the mw.ustring and mw.text 
--	libraries that comes with Scribunto:<br />
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_library
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Text_library
--	
--	On this Wiki, String is used in:
--	* [[Module:Shared]]
--	
--	@module		string
--	@alias		p
--	@attribution  [[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution  [[User:Gigamicro|Gigamicro]]
--	@attribution  [[User:NoBrainz|NoBrainz]]
--	@image		Panel.png
--	@require	[[Module:Arguments]]
--	@require	[[Module:Entrypoint]]
--	@require	[[Module:UserError]]
--	@release	stable
--	

local p = {};

--  Module dependencies  -------------------------------------------------------
local args		 = require('Module:Arguments');
local entrypoint = require('Module:Entrypoint');
local userError  = require('Module:UserError');


-- Local functions  ------------------------------------------------------------
---	For getting frame or parent arguments. Extends args.getArgs() with
--	additional arguments other than the ones listed [https://dev.fandom.com/wiki/Global_Lua_Modules/Arguments here].
--	@function		p.getArgs
--	@param			{table} frame The input arguments
--	@param			{table} options Options for getting the args
--					* {boolean} noNil If true, does not replace empty strings, 
--								strings with only spaces/newlines with nil; default false
--	@return			{table} The arguments
local function getArgs(frame, options)
	if type(frame[1]) == 'table' and table.getn(frame) < 2 then frame = frame[1]; end
	if type(options) ~= 'table' then options = {options}; end
	
	local args = args.getArgs(frame, options);
	local tempArgs = {};
	
	local j = 1;
	tempArgs = {};
	if options.noNil then
		for i = 1, math.max(#frame, #args) do
			if type(args[i]) ~= 'number' then tempArgs[i] = args[i] or frame[i];
			elseif not(tempArgs[i]) and type(args[i]) ~= 'number' and frame.args then tempArgs[i] = frame.args[i];
			elseif args[i] then tempArgs[j] = args[i]; j = j + 1; end
		end
		args = tempArgs;
	end
	
	return args;
end


-- Member functions  -----------------------------------------------------------
---	Performs a case-sensitive check if a string is a substring of a string.
--	@function		p.contains
--	@param			{string} str A string
--	@param			{string} search The element that is being searched for
--	@param[opt]		{boolean} ignoreCase If false, search is case-sensitive; true otherwise; defaults to false
--	@return			{boolean} True if element exists in List, false otherwise
function p.contains(...)
	local args = getArgs({...});
	local str = args[1];
	local search = args[2];
	local ignoreCase = args[3];
	assert(str and search, 'String.contains(str, search [, ignoreCase]): not enough arguments');

	if ignoreCase then
		if type(str) == 'table' then
			for i = 1, #str do
				str[i] = string.lower(str[i]);
			end
		else
			str = string.lower(str);
		end
		search = string.lower(search);
	end
	
	local isSubstring;
	
	if type(str) == 'table' then
		for i = 1, #str do
			isSubstring = string.find(str[i], search);
			if isSubstring then
				return true;
			end
		end
	else
		isSubstring = string.find(str, search);
	end
	
	return isSubstring ~= nil;
end

---	Splits a string into substrings based on a separating character.
--	For example, split('Lith V1 Relic', '%s') would return { 'Lith', 'V1', 'Relic' }
--	@function		p.split
--	@param			{string} str Input string
--	@param[opt]		{string} sep A string separator using Lua's character sequences; default '%s', 
--								 note that separator will be trimmed of whitespace
--	@return			{table} A table with substrings of inputstr
function p.split(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	local sep = args[2];
	assert(str ~= nil, 'String.split(str [, sep]): not enough arguments')
	
	if sep == nil then sep = '%s'; end
	
	local t = {};
	if sep == '' then
		-- Extracting all characters from string
		str:gsub(".", function(c) table.insert(t, c) end);
	else
		for substr in string.gmatch(str, '([^'..sep..']+)') do
			table.insert(t, substr);
		end
	end
	
	return t;
end

---	Checks if a string begins with a certain substring.
--	For example calling startsWith ("Lith V1 Relic", "Lith") would return true.
--	@function		p.startsWith
--	@param			{string} str String to be checked
--	@param			{string} start Potential starting substring of str
--	@param			{boolean} ignoreCase If false, search is case-sensitive; true otherwise; defaults to false
--	@return			{boolean} True if a string begins with start, false otherwise
function p.startsWith(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	local start = args[2];
	local ignoreCase = args[3];
	assert(str and start, 'String.startsWith(str, start): not enough arguments');
	-- Technically all strings start with an empty string
	if start == "" then return true; end
	
	if ignoreCase then
		str = string.lower(str);
		start = string.lower(start);
	end
	
	return string.sub(str, 1, string.len(start)) == start;
end

-- TODO: Can just be a wrapper function around mw.text.trim()
---	Trims leading and trailing whitespace of a string.
--	Source: http://lua-users.org/wiki/StringTrim
--	@function		p.trim
--	@param			{string} str Input string
--	@return			{string} Trimed string
function p.trim(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	assert(str ~= nil, 'String.trim(str): not enough arguments');
	-- Replaces "^%s*(.-)%s*$" with "%1" in str
	-- ^%s*(.-)%s*$ matches:
	-- ^:beginning of string
	-- %s*:any number of spaces
	-- (.-):any number of any character, minimum possible, saved to %1
	-- %s* again
	-- $: end of string
	-- %1 inserts the content of the parentheses
	return str:gsub("^%s*(.-)%s*$", "%1");
end

---	Returns a string in title casing format.
--	Originally from [[Module:VoidByReward]] written by [[User:NoBrainz]].
--	Reworked on 11/9/2020 by [[User:Gigamicro]].
--	@function		p.titleCase
--	@param			{string} str Input string
--	@return			{string} Trimmed resultant string in title casing format
function p.titleCase(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	assert(str ~= nil, 'String.titleCase(str): not enough arguments');
	assert(type(str)=='string', 'String.titleCase: expected string, got '..type(s));
	return ({ 
		p.trim(str):gsub('(%S)(%S*)', 
			function(h,t) return h:upper()..t:lower() end 
		) 
	})[1];
end

-- functions above this point use getArgs{...} while those below do not

---	Converts newlines to HTML line breaks.
--	@function		p.newLinesToBreaks
--	@param			{string} str Input string
--	@return			{string} A string that has its carriage returns and newlines replaced with break tag
function p.newLinesToBreaks(str)
	assert(str ~= nil, 'String.newLinesToBreaks(str): not enough arguments');
	return (str:gsub('\r?\n', '<br />'));
end

-- TODO: Programmatically create this table
---	Mapping unprintable characters (1 byte) to printable ones (2 bytes).
--	Mapping control characters U+0000 to U+001F with Cyrillic characters U+0400 to U+041F.
--	Mapping U+007F to U+00FF with Cyrillic characters U+0420 to U+0482 and U+048A to U+04A7 (skipping accent marks)
--	Any characters between \127 and \255 inclusive are not printable to debug console for some reason
--	which is why this map is needed.
--	@table		p.UNPRINTABLE_CHARACTER_MAP
p.UNPRINTABLE_CHARACTER_MAP = {
	[0] = 'Ѐ',
	[1] = 'Ё',
	[2] = 'Ђ',
	[3] = 'Ѓ',
	[4] = 'Є',
	[5] = 'Ѕ',
	[6] = 'І',
	[7] = 'Ї',
	[8] = 'Ј',
	[9] = 'Љ',
	[10] = 'Њ',
	[11] = 'Ћ',
	[12] = 'Ќ',
	[13] = 'Ѝ',
	[14] = 'Ў',
	[15] = 'Џ',
	[16] = 'А',
	[17] = 'Б',
	[18] = 'В',
	[19] = 'Г',
	[20] = 'Д',
	[21] = 'Е',
	[22] = 'Ж',
	[23] = 'З',
	[24] = 'И',
	[25] = 'Й',
	[26] = 'К',
	[27] = 'Л',
	[28] = 'М',
	[29] = 'Н',
	[30] = 'О',
	[31] = 'П',
	[127] = 'Р',	-- Delete character
	[128] = 'С',
	[129] = 'Т',
	[130] = 'У',
	[131] = 'Ф',
	[132] = 'Х',
	[133] = 'Ц',
	[134] = 'Ч',
	[135] = 'Ш',
	[136] = 'Щ',
	[137] = 'Ъ',
	[138] = 'Ы',
	[139] = 'Ь',
	[140] = 'Э',
	[141] = 'Ю',
	[142] = 'Я',
	[143] = 'а',
	[144] = 'б',
	[145] = 'в',
	[146] = 'г',
	[147] = 'д',
	[148] = 'е',
	[149] = 'ж',
	[150] = 'з',
	[151] = 'и',
	[152] = 'й',
	[153] = 'к',
	[154] = 'л',
	[155] = 'м',
	[156] = 'н',
	[157] = 'о',
	[158] = 'п',
	[159] = 'р',
	[160] = 'с',
	[161] = 'т',
	[162] = 'у',
	[163] = 'ф',
	[164] = 'х',
	[165] = 'ц',
	[166] = 'ч',
	[167] = 'ш',
	[168] = 'щ',
	[169] = 'ъ',
	[170] = 'ы',
	[171] = 'ь',
	[172] = 'э',
	[173] = 'ю',
	[174] = 'я',
	[175] = 'ѐ',
	[176] = 'ё',
	[177] = 'ђ',
	[178] = 'ѓ',
	[179] = 'є',
	[180] = 'ѕ',
	[181] = 'і',
	[182] = 'ї',
	[183] = 'ј',
	[184] = 'љ',
	[185] = 'њ',
	[186] = 'ћ',
	[187] = 'ќ',
	[188] = 'ѝ',
	[189] = 'ў',
	[190] = 'џ',
	[191] = 'Ѡ',
	[192] = 'ѡ',
	[193] = 'Ѣ',
	[194] = 'ѣ',
	[195] = 'Ѥ',
	[196] = 'ѥ',
	[197] = 'Ѧ',
	[198] = 'ѧ',
	[199] = 'Ѩ',
	[200] = 'ѩ',
	[201] = 'Ѫ',
	[202] = 'ѫ',
	[203] = 'Ѭ',
	[204] = 'ѭ',
	[205] = 'Ѯ',
	[206] = 'ѯ',
	[207] = 'Ѱ',
	[208] = 'ѱ',
	[209] = 'Ѳ',
	[210] = 'ѳ',
	[211] = 'Ѵ',
	[212] = 'ѵ',
	[213] = 'Ѷ',
	[214] = 'ѷ',
	[215] = 'Ѹ',
	[216] = 'ѹ',
	[217] = 'Ѻ',
	[218] = 'ѻ',
	[219] = 'Ѽ',
	[220] = 'ѽ',
	[221] = 'Ѿ',
	[222] = 'ѿ',
	[223] = 'Ҁ',
	[224] = 'ҁ',
	[225] = '҂',
	[226] = 'Ҋ',
	[227] = 'ҋ',
	[228] = 'Ҍ',
	[229] = 'ҍ',
	[230] = 'Ҏ',
	[231] = 'ҏ',
	[232] = 'Ґ',
	[233] = 'ґ',
	[234] = 'Ғ',
	[235] = 'ғ',
	[236] = 'Ҕ',
	[237] = 'ҕ',
	[238] = 'Җ',
	[239] = 'җ',
	[240] = 'Ҙ',
	[241] = 'ҙ',
	[242] = 'Қ',
	[243] = 'қ',
	[244] = 'Ҝ',
	[245] = 'ҝ',
	[246] = 'Ҟ',
	[247] = 'ҟ',
	[248] = 'Ҡ',
	[249] = 'ҡ',
	[250] = 'Ң',
	[251] = 'ң',
	[252] = 'Ҥ',
	[253] = 'ҥ',
	[254] = 'Ҧ',
	[255] = 'ҧ',
}

---	Escapes any unprintable characters to its Lua 3-digit encoding equivalent
--	(e.g. embedded zeroes are "\000")
--	@function		p.escape
--	@param			{string} str Input string
--	@return			{string} A string with unprintable characters escaped
function p.escape(str)
	local result = {};
	local escapeChars = {
		[92] = true,	-- Backslash, also used to escape characters so should also be escaped to reduce confusion
	};
	for i = 1, #str do
		local character = str:sub(i, i);
		local code = string.byte(character);	-- ASCII number in decimal
		-- Only escape unprintable characters. ASCII 0 is null char
		-- and ASCII 31 is unit separator (control characters). Any characters between
		-- \127 and \255 inclusive are not printable to debug console for some reason.
		if (code >= 0 and code <= 31) or (code >= 127) or escapeChars[code] then
			character = "\\"..string.format("%03d", code)
		end
		table.insert(result, character);
	end
	return table.concat(result, '');
end

---	Mapping hex chars to equivalent 4b binary strings
--	octal is a little slower but cuts this table, just use ('%O'):format()
--	@table		p.hexquad
p.hexquad = {
	['0']='0000',['1']='0001',['2']='0010',['3']='0011',
	['4']='0100',['5']='0101',['6']='0110',['7']='0111',
	['8']='1000',['9']='1001',['A']='1010',['B']='1011',
	['C']='1100',['D']='1101',['E']='1110',['F']='1111',
}

---	Returns the binary representation of an unsigned integer,
--	ignoring any decimal places (no padded zeros and in big-endian).
--	@function		p.integerToBinary
--	@param			{string|number} x Input number
--	@return			{string} The binary representation of unsigned integer
function p.integerToBinary(x)
	x = tonumber(x) or error('p.integerToBinary(x): x could not be coerced into a number (is '..type(x)..')')
	if x < 0 then
		error('p.integerToBinary(x): Only accept unsigned integers')
		--could allow; would lead to 64bit 2s complement or w/e
	end
	return (('%X'):format(x):gsub('%x',p.hexquad):gsub('^00?0?',''))
end

---	Returns the binary representation of a character (no padded zeros and in big-endian).
--	@function		p.charToBinary
--	@param			{string} x Input string
--	@return			{string} The binary representation of character
function p.charToBinary(x)
	if type(x) ~= 'string' or #x ~= 1 then
		error('p.charToBinary(x): Only accept a single character');
	end
	return p.integerToBinary(x:byte())
end

---	Returns the binary representation of a string (with padded zeroes and in big-endian)
--	with each character separated by a space.
--	@function		p.stringToBinary
--	@param			{string} x Input string
--	@return			{string} The binary representation of string
function p.stringToBinary(x)
	if type(x) ~= 'string' then
		error('p.charToBinary(x): Only accept strings');
	end
	return x:gsub('.',function(char)
		return ('%X'):format(char:byte()):gsub('%x',p.hexquad)
	end)
end

--[[
join

Join all non empty arguments together; the first argument is the separator.
Usage:
{{#invoke:String|join|sep|one|two|three}}
]]
function p.join(frame)
	local args = {}
	local sep
	for _, v in ipairs( frame.args ) do
		if sep then
			if v ~= '' then
				table.insert(args, v)
			end
		else
			sep = v
		end
	end
	return table.concat( args, sep or '' )
end

--  All String STL functions  --------------------------------------------------
-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#String_library
p.byte = string.byte;
p.char = string.char;
p.dump = string.dump;
p.find = string.find;
p.format = string.format;
p.gmatch = string.gmatch;
p.gsub = string.gsub;
p.len = string.len;
p.lower = string.lower;
p.match = string.match;
p.rep = string.rep;
p.reverse = string.reverse;
p.sub = string.sub;
p.ulower = string.ulower;
p.upper = string.upper;
p.uupper = string.uupper;

p.__main = entrypoint(p);
return p;
