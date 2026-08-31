---	'''Math''' is an extension of the math STL, containing additional functionality 
--	and support. All Math, non-[https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Math_library STL], functions 
--	are capable of evaluating mathemetical expression strings and provide 
--	friendlier error messages than the default `error()` function. While more 
--	powerful than their STL counterparts, Math's functions comes at the cost of 
--	performance. If complex math is done within long looping applications or Lua 
--	expense needs to be kept low, consider using the STL functions instead.
--	
--	Math can be invoked directly (`&#123;{#invoke:Math|function|...}}`), 
--	invoked from a template (`&#123;{template|function|...}}`), or used
--	within other modules.
--	
--	All math STL objects can be accessed by adding two underscores before the name, e.g.<br />
--	`math.__abs(-7)` - Original math STL abs function<br />
--	`math.abs(-7)` - Math's abs function with error checking and string evaluation<br />
--	
--	All bit32 STL objects can be accessed by adding two underscores before the name (without the 'b'), e.g.<br />
--	`math.__xor(1, 0)` - Original bit32 STL bxor function
--	
--	On this Wiki, Math is used in:
--	* [[Module:Acquisition]]
--	* [[Module:MasteryRank]]
--	* [[Module:Shared]]
--	* [[Module:Warframes]]
--	* [[Module:Warframes/infobox]]
--	* [[Module:Weapons]]
--	* [[Module:Weapons/infobox]]
--	* [[Template:Math]]
--	
--	@module		math
--	@alias		p
--	@author		[[User:FINNER|FINNER]]
--	@image		MathLogo.png
--	@require	[https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Loadable_libraries bit32]
--	@require	[[w:c:dev:Module:Arguments|Module:Arguments]]
--	@require	[[w:c:dev:Module:Entrypoint|Module:Entrypoint]]
--	@require	[[w:c:dev:Module:User error|Module:User error]]
--	@require	[[w:c:dev:Module:I18n|Module:I18n]]
--	@release	stable
--	
local p = {};

--  Module dependencies  -------------------------------------------------------
local bit		 = require('bit32');
local args		 = require('Dev:Arguments');
local entrypoint = require('Dev:Entrypoint');
local userError  = require('Dev:User error');
-- i18n messages will be in locale as set by client (My Preferences -> Internationalisation)
-- (see mw.config.get("wgUserLanguage") in browser console)
local i18n =  require('Module:ScientiaTest').loadMessages('Module:Math/i18n'):useUserLang();

--  Module variables  ----------------------------------------------------------
local patts = {"'", "°",		"%%",   "−",  "&minus;", "÷", "•",  "×",  "&times;", "{{", "}}", "{",  "}",  "%[", "%]",	 "e%+",	"e%-",	 "γ",  "φ",  "π",  "#e", "#gamma", "#phi", "#pi", "%)%(",   "<sup>", "</sup>", "trunc%(", "floor%(", "ceil%(", "exp%(", "not%(", "abs%(", "asin%(", "acos%(", "atan%(", "sin%(", "cos%(", "tan%(", "ln%(", "mod", "true", "false"};
local reps  = {"",  "%*#¡/180", "/100", "%-", "%-",	  "/", "%*", "%*", "%*",	  "%(", "%)", "%(", "%)", "%(", "%)", "%*10%^", "%*10%^-", "#£", "#¢", "#¡", "#¤", "#£",	 "#¢",   "#¡",  "%)%*%(", "%^%(",  "%)",	 "¥",	   "¦",	   "§",	  "¨",	 "©",	 "ª",	 "«",	  "¬",	  "®",	  "¯",	 "µ",	 "¸",	 "¶",	"%%",  1,		0};
local patts2 = {"#¤", "#£",	 "#¢",   "#¡",  "¥",	   "¦",	   "§",	  "¨",	 "©",	 "ª",	 "«",	  "¬",	  "®",	  "¯",	 "µ",	 "¸",	 "¶",	"%%"};
local reps2  = {"#e", "#gamma", "#phi", "#pi", "trunc%(", "floor%(", "ceil%(", "exp%(", "not%(", "abs%(", "asin%(", "acos%(", "atan%(", "sin%(", "cos%(", "tan%(", "ln%(", "%)mod%("};

--  Mathematical constants  ----------------------------------------------------
p.e   = math.exp(1);
p.gam = 0.57721566490153;
p.inf = math.huge;
p.phi = (1 + math.sqrt(5))/2;
p.pi  = math.pi;


-- Local functions  ------------------------------------------------------------
local function eval(str)
	if string.lower(str) == 'true' then
		return 1;
	elseif string.lower(str) == 'false' then
		return 0;
	end
	return mw.ext.ParserFunctions.expr(str);
end

local function formatnum(num, options)
	if options and options.code and mw.language.isValidCode(options.code) then
		return mw.getLanguage(options.code):formatNum(num, options);
	end
	return mw.language.getContentLanguage():formatNum(num, options);
end

local function replace(str)
	str = tostring(str):lower()
	local i, j;
	
	i = str:find("%[%[(%a+):");
	_, j = str:find("%]%]&(%a+);");
	while (i ~= nil) do
		str = str:sub(0, i-1)..str:sub(j+1, #str);
		i = str:find("%[%[(%a+):");
		_, j = str:find("%]%]&(%a+);");
	end
	
	i = str:find("%[%[(%a+)");
	j = ({str:find("(%a+)|")})[2] or ({str:find("(%a+) %(mod%)|")})[2];
	while (i ~= nil) do
		str = str:sub(0, i+1)..str:sub(j+1, #str);
		i = str:find("%[%[(%a+)");
		j = ({str:find("(%a+)|")})[2] or ({str:find("(%a+) %(mod%)|")})[2];
	end
	
	str = str:gsub("%s+", "");
	for i = 1, #patts do
		str = str:gsub(patts[i], reps[i]);
	end
	
	i = str:find("<");
	j = str:find(">");
	while (i ~= nil) do
		str = str:sub(0, i-1)..str:sub(j+1, #str);
		i = str:find("<");
		j = str:find(">");
	end
	
	str = str:gsub("%a+", "");
	for i = 1, #patts2 do
		str = str:gsub(patts2[i], reps2[i]);
	end
	
	str = str:gsub("#e", p.e):gsub("#gamma", p.gam):gsub("#phi", p.phi):gsub("#pi", p.pi);
	
	for i = 0, 9 do
		str = str:gsub(i.."%(", i.."%*%("):gsub("%)"..i, "%)%*"..i);
	end
	
	patterns = {":", ";", "&", "|", "=", "\"", "\\", ",", "%?", "_", "`", "#", "%(%)"}
	for i = 1, #patterns do
		str = str:gsub(patterns[i], "");
	end
	
	return str;
end

local function replaceWithSymbol(str)
	str = str:gsub("#e", "e"):gsub("#gamma", "γ"):gsub("#phi", "φ"):gsub("#pi", "π");
	return str;
end

local function round(num, to)
	local total = num + to / 2;
	local val = total - (total % to);
	return val;
end

local function operation(v1, v2, op)
	local v3 = {};
	local v1T = type(v1);
	local v2T = type(v2);
	local k1, k2 = v1, v2;
	
	if v1T == 'function' or v2T == 'function' then return; end
	if v1 == nil then k1 = 0; elseif v1T == 'string' then k1 = tonumber(eval(v1)) or 0; end
	if v2 == nil then k2 = 0; elseif v2T == 'string' then k2 = tonumber(eval(v2)) or 0; end
	
	if v1T == v2T and v1T == 'number' then
		return op(v1, v2);
	end
	if v1T == v2T and v1T == 'string' then
		return tostring(op(k1, k2));
	end
	if v1T == v2T and v1T == 'table' then
		for i = 1, math.max(table.maxn(v1), table.maxn(v2)) do
			table.insert(v3, table.maxn(v3) + 1, operation(v1[i], v2[i], op));
		end
		return v3;
	end
	
	if v1T ~= v2T then
		if v1T == 'table' then
			for i = 1, table.maxn(v1) do
				table.insert(v3, table.maxn(v3) + 1, operation(v1[i], v2, op));
			end
			return v3;
		end
		if v1T == 'number' then
			if v2T == 'table' then k2 = p.sum(v2); end
			return op(v1, k2);
		end
		if v1T == 'string' then
			if v2T == 'table' then k2 = p.sum(v2); end
			return tostring(op(k1, k2));
		end
	end
	
	return op(k1, k2)
end

local function trunc(num)
	local int, dec = math.modf(num);
	return int;
end

local function gcd(a, b)
	a = math.floor(a); b = math.floor(b);
	if b == 0 then
		return a;
	end
	return gcd(b, a % b);
end

local function findFrac(val, factor, str, epsilon)
	epsilon = epsilon + math.ceil(math.log10(val/factor));
	local num = val/factor - math.floor(val/factor);
	num = math.abs(round(num, 10^epsilon));
	
	local inverse = false;
	if num > (1 - num) then
		num = 1 - num;
		inverse = true;
	end
	
	local currError = 1;
	local midNum = 1; local midDen = math.floor(1/num);
	
	 if num <= (10^epsilon) then
		currError = 0;
		midNum = 0; midDen = 1;
	end
	
	local gcDen = 0;
	while currError > (10^epsilon) do
		if num < midNum/midDen then
			midDen = midDen + 1;
		elseif num > midNum/midDen then
			midNum = 10*midNum;
			midDen = 10*(midDen - 1);
		end
		
		currError = math.abs(midNum/midDen - num)/num;
		currError = trunc(currError*10^-epsilon)*10^epsilon;
	end
	
	if num > (10^epsilon) then
		gcDen = gcd(midNum, midDen);
		midNum = midNum/gcDen; midDen = midDen/gcDen;
	end
	
	if inverse then
		midNum = midDen - midNum;
	end
	
	num = math.floor(math.abs(round(val/factor, 10^epsilon)))*midDen;
	
	if (midDen == 1) then
		if (num + midNum) == 1 and str ~= '' then
			num = str;
		else
			num = '\\text{'..(num + midNum)..'}'..str;
		end
	else
		midDen = '}{\\text{'..midDen..'}}';
		if (num + midNum) == 1 and str ~= '' then
			num = '\\frac{'..str..midDen;
		else
			num = '\\frac{\\text{'..(num + midNum)..'}'..midDen..'\\!'..str;
		end
	end
	
	if (val < 0) then num = '-'..num; end
	
	return num;
end

local function asin(num)
	local val = math.asin(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function acos(num)
	local val = math.acos(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function atan(num, den)
	local val = math.atan2(num, den);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end

local function sin(num)
	local val = math.sin(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function cos(num)
	local val = math.cos(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function tan(num)
	local val = math.tan(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end

local function sinh(num)
	local val = math.sinh(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function cosh(num)
	local val = math.cosh(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end
local function tanh(num)
	local val = math.tanh(num);
	if math.abs(val) <= 10^-14 then val = 0; end
	return val;
end

local function rand(low, upp, seed)
	math.randomseed(seed);
	local randomtable = {};
	
	if low == 0 and upp == 1 then
		for i = 1, 97 do
			randomtable[i] = math.random();
		end
	else
		for i = 1, 97 do
			randomtable[i] = math.random(low, upp);
		end
	end
	
	local i = math.ceil(97 * math.random());
	
	return randomtable[i];
end

local function func(x, z)
	local power = (z-1)*math.log10(x/(1-x)) - (x/(1-x))/math.log(10) - 2*math.log10(1-x);
	return power;
end
local function log_sum(old_pows)
	local n = table.getn(old_pows);
	if n == 1 then
		return old_pows[1];
	end
		
	local pows = {};
	local j = 1;
	for i = 1, math.floor(n/2) do
		pows[i] = old_pows[j] + math.log10(1 + 10^(old_pows[j+1] - old_pows[j]));
		j = j + 2;
	end
	if n % 2 == 1 then
		pows[math.floor(n/2)+1] = old_pows[n];
	end

	return log_sum(pows);
end
local function gamma_(z)
	if z <= 1 then
		return gamma_(z+1) - math.log10(z);
	end
		
	local n = 100000;
	local d = 1/n;

	local pows_ = {};
	local pows = {};
	local j = 1;
	local k = n-1;
	pows_[1] = func(d, z) - math.log10(n);
	for i = 2, n-1 do
		pows_[i] = func(i*d, z) - math.log10(n);
		if (pows_[i] >= -323) and (pows_[i-1] < -323) then
			j = i;
		end
		if (pows_[i] < -323) and (pows_[i-1] >= -323) then
			k = i-1;
			break;
		end
	end
	for i = 1, k-j+1 do
		pows[i] = pows_[i+j-1];
	end

	local power = log_sum(pows);
	return power;
end
local function gamma(z)
	local power = gamma_(z);
	
	if math.abs(power + 0) > 7 then
		if (power + 0) < 0 then
			return round(10^(power - math.floor(power)), 10^-7), 'E', math.floor(power + 0);
		else
			return round(10^(power - math.floor(power)), 10^-7), 'E+', math.floor(power + 0);
		end
	else
		return round(10^(power + 0), 10^-7);
	end
end

local function ncr(n, r)
	-- Error Checks --
	if (n < 0) then
		n = 0;
	end
	if (r > n) then
		r = n;
	end
	
	local val = 1;
	
	-- Special Cases --
	if (r <= 0 or r >= n) then
		return val;
	elseif (r == 1 or r == n - 1) then
		val = n;
		return val;
	end
	
	-- n! / r!(n-r)! --
	local total = n - r;
	local minimum = r + 1;
	local j = total;
	if (total > r) then
		minimum = total + 1;
		j = r;
	end
	
	for i = n, minimum, -1 do
		val = val * i / j;
		if (j >= 2) then
			j = j - 1;
		end
	end
	
	return val;
end

local function npr(n, r)
	-- Error Checks --
	if (n < 0) then
		n = 0;
	end
	if (r > n) then
		r = n;
	end
	
	local val = 1;
	
	-- Special Cases --
	if (r <= 0) then
		return val;
	elseif (r == 1) then
		val = n;
		return val;
	end
	
	-- n! / (n-r)! --
	local total = n - r;
	local minimum = total + 1;
	
	for i = n, minimum, -1 do
		val = val * i;
	end
	
	return val;
end

local function binomial(p, n, r)
	if p < 0 then
		p = 0;
	elseif p > 1 then
		p = 1;
	end
	
	local c = ncr(n, r);
	local val = c*(p^r)*(1-p)^(n-r);
	return val;
end

function sum(array)
	local s = 0;
	if type(array) ~= 'table' then return array; end
	for i = 1, #array do
		s = s + array[i];
	end

	return s;
end
local function getProbs(array)
	local probs = {};
	local num;
	
	local i = 1;
	local j = 1;
	while array[i] ~= nil do
		num = array[i] + 0;
		if num > 0 then
			probs[j] = num;
			j = j + 1;
		end
		i = i + 1;
	end
	
	local sumP = sum(probs);
	
	if sumP > 1 then
		for i = 1, #probs do
			probs[i] = probs[i]/sumP;
		end
	end
	
	return probs;
end

local function expected(array)
	local probs = getProbs(array);
	local terms, totalProb;
	local runs = 0;
	
	for i = 1, math.pow(2, #probs) - 1 do
		totalProb = 0;
		terms = 0;

		for j = 0, #probs - 1 do
			if math.pow(2, j) > i then
				break;
			end

			if bit.band(i, math.pow(2, j)) ~= 0 then
				totalProb = totalProb + probs[j + 1];
				terms = terms + 1;
			end
		end

		if terms % 2 == 1 then
			runs = runs + 1 / totalProb;
		else
			runs = runs - 1 / totalProb;
		end
	end
	
	return runs;
end

local function func2(probs, dp, x)
	local ngFunction = 0;
	
	for i = 1, #probs do
		ngFunction = ngFunction + (1 - probs[i])^x;
	end
	
	return 1 - dp - ngFunction;
end
local function IQI(probs, dp, x_guess_one, x_guess_two, x_guess_three, error_desired, max_iterations)
	local x_old_old = x_guess_one;
	local x_old = x_guess_two;
	local x_current = x_guess_three;
	local error_approx = error_desired + 1;
	local num_iterations = 0;

	if func2(probs, dp, x_old_old) == 0 then
		x_root = x_old_old;
	elseif func2(probs, dp, x_old) == 0 then
		x_root = x_old;
	elseif func2(probs, dp, x_current) == 0 then
		x_root = x_current;
	else
		while (error_approx > error_desired) and (num_iterations < max_iterations) do
			num_iterations = num_iterations + 1;
			y_old_old = func2(probs, dp, x_old_old);
			y_old = func2(probs, dp, x_old)
			y_current = func2(probs, dp, x_current)
			x_new = (y_old*y_old_old/((y_current - y_old)*(y_current - y_old_old)))*x_current + (y_current*y_old_old/((y_old - y_current)*(y_old - y_old_old)))*x_old + (y_current*y_old/((y_old_old - y_current)*(y_old_old - y_old)))*x_old_old;

			if x_new ~= 0 then
				error_approx = math.abs((x_new - x_current)/x_new) * 100;
			end

			x_old_old = x_old;
			x_old = x_current;
			x_current = x_new;
		end
		x_root = x_new;
	end

	return x_root;
end
local function nearlyGuaranteed(array)
	local probs = getProbs(array);
	
	local range = 1;
	if table.getn(probs) ~= 1 or probs[1] ~= 1 then
		local nine9 = IQI(probs, 0.99, 0, 1, 2, 0.000001, 1000);
		local nine99 = IQI(probs, 0.999, 0, 1, 2, 0.000001, 1000);
		local nine999 = IQI(probs, 0.9999, 0, 1, 2, 0.000001, 1000);
	
		range = formatnum(round(nine99, 1))..'&nbsp;&#177;&nbsp;'..formatnum(round((nine999 - nine9)/2, 1));
	end
	return range;
end

local function getArgs(frame, options)
	if type(frame[1]) == 'table' and table.getn(frame) < 2 then frame = frame[1]; end
	if type(options) ~= 'table' then options = {options}; end
	
	local args = args.getArgs(frame, options);
	local tempArgs = {};
	local str;
	if not(options.noReplace) then
		for i, v in pairs(args) do
			if type(i) ~= 'number' or type(v) ~= 'string' then tempArgs[i] = v;
			else
				str = '('..replace(v)..')';
				if options.noEval then tempArgs[i] = str;
				elseif options.type then tempArgs[i] = eval(str);
				else tempArgs[i] = tonumber(eval(str)); end
			end
		end
		args = tempArgs;
	end
	
	local j = 1;
	tempArgs = {};
	if options.noNil then
		for i, v in pairs(args) do
			if type(i) ~= 'number' then tempArgs[i] = v;
			elseif v then tempArgs[j] = v; j = j + 1; end
		end
		args = tempArgs;
	end
	
	return args;
end


--  Member functions  ----------------------------------------------------------

--- Evaluates input
--  @function		p.eval
--  @param			{string} num The input expression
--  @return			{number} eval(num)
function p.eval(...)
	local args = getArgs({...}, {noEval = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.eval(num)' } } )); end
	return eval(args[1]);
end

--- Evaluates and formats input
--  @function		p.formatnum
--  @param			{number, string} num The input expression
--  @param[opt]		{string} code A language code | default 'en'
--  @param[opt]		{boolean} noCommafy Use comma separators | default false
--  @return			{string} formatnum(num)
--  @return			{string} formatnum(num, 'ar')
--  @return			{string} formatnum(num, "", true)
--  @return			{string} etc.
function p.formatnum(...)
	local args = getArgs({...}, {noReplace = true});
	local options = {};
	options.code = args[2] or 'en';
	options.noCommafy = args[3] or false;
	
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.formatnum(num) or p.formatnum(num, code)' } } )); end
	return formatnum(args[1], options);
end

--- Evaluates input and returns the magnitude
--  @function		p.abs
--  @param			{number, string} num The input value
--  @return			{number} abs(num)
function p.abs(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.abs(num)' } } )); end
	return math.abs(args[1]);
end

--- Evaluates input and returns the acos
--  @function		p.acos
--  @param			{number, string} num The input value
--  @return			{number} acos(num)
function p.acos(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.acos(num)' } } )); end
	return acos(args[1]);
end

--- Evaluates inputs and returns the sum
--  @function		p.add
--	@param			{table, boolean, number, string} n An input value
--	@param			{table, boolean, number, string} m A second input value
--  @return			{table, boolean, number, string} add(n, m)
function p.add(...)
	local args = getArgs({...}, {type = true});
	if args[1] == nil or args[2] == nil then return userError(i18n:msg( { key = 'no-argument', args = { 'p.add(n, m)' } } )); end
	
	local function add(a, b)
		local t1, t2, k1, k2;
			
		k1 = a; k2 = b;
		t1 = type(a); t2 = type(b);
		if t1 == 'boolean' then k1 = a and 1 or 0; end
		if t2 == 'boolean' then k2 = b and 1 or 0; end
	
		if t1 == t2 and t1 == 'boolean' then
			if bit.bxor(k1, k2) == 1 then return true; end
			return false;
		end
		if t1 == 'boolean' then
			if t2 == 'table' then k2 = p.sum(b); end
			if math.abs(k2) > 1 or bit.bxor(k1, k2) == 1 then
				return true;
			end
			return false;
		end
			
		return k1 + k2;
	end
	
	return operation(args[1], args[2], add);
end

--- Evaluates input and returns the asin
--  @function		p.asin
--  @param			{number, string} num The input value
--  @return			{number} asin(num)
function p.asin(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.asin(num)' } } )); end
	return asin(args[1]);
end

--- Evaluates inputs and returns the atan
--  @function		p.atan
--  @param			{number, string} num The input value
--  @param[opt]		{number, string} den A second input value | default 1
--  @return			{number} atan(num)
--  @return			{number} atan(num / den)
function p.atan(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.atan(num) or p.atan(num, den)' } } )); end
	return atan(args[1], args[2] or 1);
end

--- Returns the binomial probability of three inputs
--  @function		p.binomial
--  @param			{string, number} p The probability of success
--  @param			{string, number} n Total number of trials
--  @param			{string, number} r Number of successes
--  @return			{number} Binomial of p, n, and r
function p.binomial(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) or not(args[3]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.binomial(p, n, r)' } } )); end
	return binomial(args[1], args[2], args[3]);
end

--- Evaluates input and returns the ceil
--  @function		p.ceil
--  @param			{number, string} num The input value
--  @return			{number} ceil(num)
function p.ceil(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.ceil(num)' } } )); end
	return math.ceil(args[1]);
end

--- Evaluates input and returns the cos
--  @function		p.cos
--  @param			{number, string} num The input value
--  @return			{number} cos(num)
function p.cos(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.cos(num)' } } )); end
	return cos(args[1]);
end

--- Evaluates input and returns the cosh
--  @function		p.cosh
--  @param			{number, string} num The input value
--  @return			{number} cosh(num)
function p.cosh(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.cosh(num)' } } )); end
	return cosh(args[1]);
end

--- Evaluates input and converts into degrees
--  @function		p.deg
--  @param			{number, string} num The input value
--  @return			{number} deg(num)
function p.deg(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.deg(num)' } } )); end
	return math.deg(args[1]);
end

--- Evaluates inputs and returns the quotient
--  @function		p.div
--	@param			{table, boolean, number, string} n An input value
--	@param			{table, boolean, number, string} m A second input value
--  @return			{table, boolean, number, string} div(n, m)
function p.div(...)
	local args = getArgs({...}, {type = true});
	if args[1] == nil or args[2] == nil then return userError(i18n:msg( { key = 'no-argument', args = { 'p.div(n, m)' } } )); end
	
	local function div(a, b)
		local t1, t2, k1, k2;
			
		k1 = a; k2 = b;
		t1 = type(a); t2 = type(b);
		if t1 == 'boolean' then k1 = a and 1 or 0; end
		if t2 == 'boolean' then k2 = b and 1 or 0; end
			
		return k1 / k2;
	end
	
	return operation(args[1], args[2], div);
end

--- Evaluates inputs and returns the expected value
--  @function		p.ex
--  @param			{table} frame inputs
--  @return			{string} Expectation range of inputs
function p.ex(...)
	local args = getArgs({...}, {noNil = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.ex(prob1, prob2, prob3, ...)' } } )); end
	local runs = expected(args);
	
	if math.floor(runs) == math.ceil(runs) or (args["range"] ~= nil and args["range"] ~= '') then
		return formatnum(runs);
	end
	return formatnum(math.floor(runs))..'&nbsp;&ndash;&nbsp;'..formatnum(math.ceil(runs));
end

--- Evaluates input and returns the exp
--  @function		p.exp
--  @param			{number, string} num The input value
--  @return			{number} exp(num)
function p.exp(...)
	local args = getArgs({...});
	return math.exp(args[1] or 1);
end

--- Evaluates input and returns the floor
--  @function		p.floor
--  @param			{number, string} num The input value
--  @return			{number} floor(num)
function p.floor(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.floor(num)' } } )); end
	return math.floor(args[1]);
end

--- Evaluates inputs and returns closest fraction
--  @function		p.frac
--  @param			{number, string} num The input value
--  @param[opt]		{string} factor The value to factor out | default '1'
--  @param[opt]		{number, string} epsilon Number of decimal places to be accurate to | default -5 (10^-5)
--  @return			{string} Closest fraction in LaTeX
function p.frac(...)
	local args = getArgs({...}, {noReplace = true});
	local factor = args[2] or '1';
	
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.frac(num) or p.frac(num, factor, epsilon)' } } )); end
	local num = args[1];
	local epsilon = args[3] or -5;
	
	local str = '';
	if factor == '#e' then
		str = 'e';
	elseif factor == '#gamma' then
		str = '\\gamma';
	elseif factor == '#phi' then
		str = '\\varphi';
	elseif factor == '#pi' then
		str = '\\pi';
	elseif factor == '1' or factor == 'y' or factor == '' then
		str = '';
		factor = 1;
	else
		str = '\\text{('..(replace(factor) + 0)..')}';
	end
	
	factor = replace(factor) + 0;
	if factor == 0 then
		factor = 1;
	end
	
	if num ~= 0 then
		return findFrac(num, factor, str, epsilon);
	end
	return 0;
end

--- Evaluates input and returns the factorial
--  @function		p.gamma
--  @param			{number, string} num The input value
--  @return			{number} (num - 1)!
--  @return			{string} (num - 1)! scientific notation if larger than 10^7
function p.gamma(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.gamma(num)' } } )); end
	return gamma(args[1]);
end

--- Evaluates inputs and return greatest common divider
--  @function		p.gcd
--  @param			{number, string} num1 The first input value
--  @param			{number, string} num2 The second input value
--  @return			{number} GCD(num1, num2)
function p.gcd(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.gcd(num1, num2)' } } )); end
	return gcd(args[1], args[2]);
end

--- Evaluates input and returns the natural log
--  @function		p.ln
--  @param			{number, string} num The input value
--  @return			{number} ln(num)
function p.ln(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.ln(num)' } } )); end
	return math.log(args[1]);
end

--- Evaluates inputs and returns the log (base x)
--  @function		p.log
--  @param			{number, string} num The input value
--  @param[opt]		{number, string} base The logarithm base | default 10
--  @return			{number} log(num)
--  @return			{number} log(num, base)
function p.log(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.log(num) or p.log(num, base)' } } )); end
	return math.log(args[1]) / math.log(args[2] or 10);
end

--- Evaluates inputs and returns the maximum value
--  @function		p.max
--  @param			{table} nums The input values
--  @return			{number} max(num1, num2, num3, ...)
--  @return			{number} max(nums)
function p.max(...)
	local i = 1;
	local maxVal = -p.inf;
	local args = getArgs({...}, {noNil = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.max(num1, num2, num3, ...)' } } )); end
	
	while args[i] ~= nil do
		maxVal = math.max(maxVal, args[i]);
		i = i + 1;
	end
	
	return maxVal;
end

--- Evaluates inputs and returns the minimum value
--  @function		p.min
--  @param			{table} nums The input values
--  @return			{number} min(num1, num2, num3, ...)
--  @return			{number} min(nums)
function p.min(...)
	local i = 1;
	local minVal = p.inf;
	local args = getArgs({...}, {noNil = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.min(num1, num2, num3, ...)' } } )); end
	
	while args[i] ~= nil do
		minVal = math.min(minVal, args[i]);
		i = i + 1;
	end
	
	return minVal;
end

--- Evaluates inputs and returns the modulo
--  @function		p.mod
--  @param			{number, string} num The dividend
--  @param			{number, string} den The divider
--  @return			{number} num % den
function p.mod(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.mod(num, den)' } } )); end
	return math.fmod(args[1], args[2]);
end

--- Evaluates input and returns the integral, fractional, or both parts
--  @function		p.modf
--  @param			{number, string} num The input value
--  @param[opt]		{boolean} frame.int Returns the integer | default false
--  @param[opt]		{boolean} frame.dec Returns the decimal | default true
--  @return			{number} modf(num)
--  @return			{number} modf(num, int=true)
--  @return			{number} modf(num, int=true, dec=true) (returns both)
function p.modf(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.modf(num)' } } )); end
	local int, dec = math.modf(args[1]);
	if args["int"] and not(args["dec"]) then return int; end
	if args["int"] and args["dec"] then return int, dec; end
	return dec;
end

--- Evaluates inputs and returns the product
--  @function		p.mul
--	@param			{table, boolean, number, string} n An input value
--	@param			{table, boolean, number, string} m A second input value
--  @return			{table, boolean, number, string} mul(n, m)
function p.mul(...)
	local args = getArgs({...}, {type = true});
	if args[1] == nil or args[2] == nil then return userError(i18n:msg( { key = 'no-argument', args = { 'p.mul(n, m)' } } )); end
	
	local function mul(a, b)
		local t1, t2, k1, k2;
			
		k1 = a; k2 = b;
		t1 = type(a); t2 = type(b);
		if t1 == 'boolean' then k1 = a and 1 or 0; end
		if t2 == 'boolean' then k2 = b and 1 or 0; end
	
		if t1 == t2 and t1 == 'boolean' then
			if k1 == 0 or k2 == 0 then return false; end
			return true;
		end
		if t1 == 'boolean' then
			if t2 == 'table' then k2 = p.sum(b); end
			if k1 == 0 or k2 == 0 then return false; end
			return true;
		end
			
		return k1 * k2;
	end
	
	return operation(args[1], args[2], mul);
end

--- Evaluates inputs and returns the combitorial
--  @function		p.ncr
--  @param			{number, string} n The input value
--  @param			{number, string} r The second input value
--  @return			{number} nCr(n, r)
function p.ncr(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.ncr(n, r)' } } )); end
	return ncr(args[1], args[2]);
end

--- Evaluates inputs and returns the nearly guaranteed value
--  @function		p.ng
--  @param			{table} frame Inputs
--  @return			{string} Nearly guaranteed range of inputs
function p.ng(...)
	local args = getArgs({...}, {noNil = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.ng(num1, num2, num3, ...)' } } )); end
	return nearlyGuaranteed(args);
end

--- Evaluates inputs and returns the permutation
--  @function		p.npr
--  @param			{number, string} n The input value
--  @param			{number, string} r The second input value
--  @return			{number} nPr(n, r)
function p.npr(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.npr(n, r)' } } )); end
	return npr(args[1], args[2]);
end

--- Evaluates inputs and returns as a percent
--  @function		p.percentage
--  @param			{number} num The input value
--  @return			{string} number represented as a percentage
function p.percentage(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.percentage(num)' } } )); end
	if not(args[2]) then args[2] = 0.01; end
	return formatnum(round(args[1] * 100, args[2]))..'%';
end

--- Evaluates inputs and returns the power of one to the other
--  @function		p.pow
--  @param			{number, string} base The input value
--  @param			{number, string} exponent The second input value
--  @return			{number} base^exponent
function p.pow(...)
	local args = getArgs({...});
	if not(args[1]) or not(args[2]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.pow(base, exponent)' } } )); end
	if args[2] == 0.5 then return math.sqrt(math.abs(args[1])); end
	if args[2] > 0 and args[2] < 1 then args[1] = math.abs(args[1]); end
	return math.pow(args[1], args[2]);
end

--- Evaluates input and converts into radians
--  @function		p.rad
--  @param			{number, string} num The input value
--  @return			{number} rad(num)
function p.rad(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.rad(num)' } } )); end
	return math.rad(args[1]);
end

--- Evaluates input and converts into radians
--  @function		p.rand
--  @param[opt]		{number, string} low The lower bound of random values | default 0
--  @param[opt]		{number, string} upp The upper bound of random values | default 1 or low if it exists
--  @param[opt]		{number, string} frame.seed The seed to randomize from | default current OS time
--  @return			{number} rand() [0 - 1]
--  @return			{number} rand(low) [0 - low]
--  @return			{number} rand(low, upp) [low - upp]
--  @return			{number} rand(seed = 0)
--  @return			{number} etc.
function p.rand(...)
	local args = getArgs({...});
	local seed = tonumber(eval(replace(args.seed or '')));
	if not(seed) then seed = os.time(); end
	if not(args[1]) then args[2] = 1; args[1] = 0; end
	if not(args[2]) then args[2] = args[1]; args[1] = 1; end
	
	mw.log(args[3])
	if args[3] then
		if args[1] == args[2] then
			return args[1]
		end
		return rand(math.min(args[1], args[2]), math.max(args[1], args[2]), seed);
	else
		if args[1] == args[2] then
			return args[1]..'_'..seed
		end
		return rand(math.min(args[1], args[2]), math.max(args[1], args[2]), seed)..'_'..seed;
	end
end

--- Replaces and deletes all non-expression characters in a string
--  @function		p.replace
--  @param			{string} str expression
--  @return			{string} An evaluatable expression
function p.replace(frame)
	return '('..replace(frame.args[1] or '')..')';
end

--- Replaces constants with their symbol
--  @function		p.replaceWithSymbol
--  @param			{string} str expression
--  @return			{string} #e, #gamma, #phi, and #pi replaced with e, γ, φ, and π
function p.replaceWithSymbol(frame)
	return replaceWithSymbol(frame.args[1] or '');
end

--- Evaluates input and rounds to specified multiple
--  @function		p.round
--  @param			{number, string} num The input value
--  @param[opt]		{number, string} multiple The multiple to round to | default 0.0001
--  @param[opt]		{boolean} percent Convert input from decimal to percentage | default false
--  @param[opt]		{boolean} degree Convert input into degrees | default false
--  @return			{string} round(num)
--  @return			{string} round(num, 0.125)
--  @return			{string} round(num, "", true, false)
--  @return			{string} etc.
function p.round(...)
	local args = getArgs({...});
	
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.round(num) or p.round(num, multiple)' } } )); end
	if args[1] == math.huge then return 'inf'; end
	if math.abs(args[1]) <= 10^-14 then return '0'; end
	
	if args[3] == true then args[1] = string.format(100*args[1]); end
	if args[4] == true then args[1] = string.format(math.deg(args[1])); end
	
	local num = round(args[1], args[2] or 0.0001);
	
	if math.abs(num) <= 10^-14 then return '0'; end
	
	local power = math.log10(math.abs(num));
	if power >= 0 then
		power = math.floor(power);
	else
		power = math.ceil(power);
	end
	
	if power <= -5 or power >= 14 then
		num = num * 10^(-power);
		if power >= 0 then
			return num..'E+'..power;
		end
		return num..'E-'..-power;
	end
	return formatnum(num);
end

--- Evaluates input and returns the sin
--  @function		p.sin
--  @param			{number, string} num The input value
--  @return			{number} sin(num)
function p.sin(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.sin(num)' } } )); end
	return sin(args[1]);
end

--- Evaluates input and returns the sinh
--  @function		p.sinh
--  @param			{number, string} num The input value
--  @return			{number} sinh(num)
function p.sinh(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.sinh(num)' } } )); end
	return sinh(args[1]);
end

--- Evaluates input and returns the sqrt
--  @function		p.sqrt
--  @param			{number, string} num The input value
--  @return			{number} sqrt(num)
function p.sqrt(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.sqrt(num)' } } )); end
	return math.sqrt(math.abs(args[1]));
end

--- Evaluates inputs and returns the difference
--  @function		p.sub
--	@param			{table, boolean, number, string} n An input value
--	@param			{table, boolean, number, string} m A second input value
--  @return			{table, boolean, number, string} sub(n, m)
function p.sub(...)
	local args = getArgs({...}, {type = true});
	if args[1] == nil or args[2] == nil then return userError(i18n:msg( { key = 'no-argument', args = { 'p.sub(n, m)' } } )); end
	
	local function sub(a, b)
		local t1, t2, k1, k2;
			
		k1 = a; k2 = b;
		t1 = type(a); t2 = type(b);
		if t1 == 'boolean' then k1 = a and 1 or 0; end
		if t2 == 'boolean' then k2 = b and 1 or 0; end
	
		if t1 == t2 and t1 == 'boolean' then
			if bit.bxor(k1, 1 - k2) == 1 then return true; end
			return false;
		end
		if t1 == 'boolean' then
			if t2 == 'table' then k2 = p.sum(b); end
			if math.abs(k2) > 1 or bit.bxor(k1, 1 - k2) == 0 then
				return false;
			end
			return true;
		end
			
		return k1 - k2;
	end
	
	return operation(args[1], args[2], sub);
end

--- Evaluates inputs and returns the summation
--  @function		p.sum
--  @param			{table} nums inputs
--  @return			{number} sum(num1, num2, num3, ...)
--  @return			{number} sum(nums)
function p.sum(...)
	local args = getArgs({...}, {noNil = true});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.sum(num1, num2, num3, ...)' } } )); end
	
	local i = 1;
	local sum = 0;
	while args[i] ~= nil do
		sum = operation(sum, (args[i] or 0), p.add);
		i = i + 1;
	end

	return sum;
end

--- Evaluates input and returns the tan
--  @function		p.tan
--  @param			{number, string} num The input value
--  @return			{number} tan(num)
function p.tan(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.tan(num)' } } )); end
	return tan(args[1]);
end

--- Evaluates input and returns the tanh
--  @function		p.tanh
--  @param			{number, string} num The input value
--  @return			{number} tanh(num)
function p.tanh(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.tanh(num)' } } )); end
	return tanh(args[1]);
end

--- Evaluates input and returns the truncation
--  @function		p.trunc
--  @param			{number, string} num The input value
--  @return			{number} trunc(num)
function p.trunc(...)
	local args = getArgs({...});
	if not(args[1]) then return userError(i18n:msg( { key = 'no-argument', args = { 'p.trunc(num)' } } )); end
	return trunc(args[1]);
end


--  All Math STL functions  ----------------------------------------------------
-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Math_library
p.__abs = math.abs;
p.__acos = math.acos;
p.__asin = math.asin;
p.__atan = math.atan;
p.__atan2 = math.atan2;
p.__ceil = math.ceil;
p.__cos = math.cos;
p.__cosh = math.cosh;
p.__deg = math.deg;
p.__exp = math.exp;
p.__floor = math.floor;
p.__fmod = math.fmod;
p.__frexp = math.frexp;
p.__huge = math.huge;
p.__ldexp = math.ldexp;
p.__log = math.log;
p.__log10 = math.log10;
p.__log = math.log;
p.__max = math.max;
p.__min = math.min;
p.__mod = math.mod;
p.__modf = math.modf;
p.__pi = math.pi
p.__pow = math.pow;
p.__rad = math.rad;
p.__random = math.random;
p.__randomseed = math.randomseed;
p.__sin = math.sin;
p.__sinh = math.sinh;
p.__sqrt = math.sqrt;
p.__tan = math.tan;
p.__tanh = math.tanh;

--  All bit32 STL functions  ----------------------------------------------------
-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32
p.__and = bit.band;
p.__arshift = bit.arshift;
p.__extract = bit.extract;
p.__lrotate = bit.lrotate;
p.__lshift = bit.lshift;
p.__not = bit.bnot;
p.__or = bit.bor;
p.__replace = bit.replace;
p.__rrotate = bit.rrotate;
p.__rshift = bit.rshift;
p.__test = bit.btest;
p.__xor = bit.bxor;

p.__main = entrypoint(p);

return p;
