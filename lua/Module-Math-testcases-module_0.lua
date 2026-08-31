local userError = require('Dev:User error');
local notEnoughOperands = userError('Not enough input arguments | $1');
local nw = false;

--[[
return {
	eval = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'eval(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'eval(num)')) },
			{ { '-10 + 50 - 10^2 * 5 / 6' }, '-43.333333333333' },
			{ { '{{text||15%|hover=Gram\'s base crit chance}} {{mul}} [1 + {{M|True Steel|120%}} + {{M|Blood Rush|60%}} {{mul}} ({{text||7|hover=Combo Multiplier}} - 1)]' }, '0.87' },
		},
	},
	formatnum = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'formatnum(num) or formatnum(num, code)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'formatnum(num) or formatnum(num, code)')) },
			{ { '-123456789.87654' }, '-123,456,789.87654' },
			{ { '-123456789.87654321|ar', '-١٢٣٬٤٥٦٬٧٨٩٫٨٧٦٥٤' },
			{ { '-123456789.87654', '', true }, '-123456789.87654' },
			{ { '-123456789.87654321', 'ar', true }, '-١٢٣٤٥٦٧٨٩.٨٧٦٥٤' },
		},
	},
	abs = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'abs(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'abs(num)')) },
			{ { '-123.456' }, '123.456' },
			{ { '123.456' }, '123.456' },
		},
	},
	acos = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'acos(num)')) },
			{ { '' } , (notEnoughOperands:gsub('$1', 'acos(num)')) },
			{ { '1' }, '0' },
		},
	},
	add = {
		options = {
			mode = 'method',
			nowiki = nw,
			unpk = true,
			deep = true,
		},
		tests = {
			{ {}, (notEnoughOperands:gsub('$1', 'add(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'add(n, m)')) },
			{ {nil, 0.456}, (notEnoughOperands:gsub('$1', 'add(n, m)')) },
			{ {123, 0.456}, 123.456 },
			{ {123, true}, 124 },
			{ {false, 123}, true },
			{ {true, true}, false },
			{ {123, '0.456'}, 123.456 },
			{ {'123', 0.456}, '123.456' },
			{ {'123', '0.456'}, '123.456' },
			{ {123, {0.4, 0.05, 0.006}}, 123.456 },
			{ {{123, 124, 125}, 0.456}, {123.456, 124.456, 125.456} },
			{ {{123, 124, 125}, {0.456, 0.789, 0.123}}, {123.456, 124.789, 125.123} },
		},
	},
	asin = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'asin(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'asin(num)')) },
			{ { '1' }, '1.5707963267949' },
		},
	},
	atan = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'atan(num) or atan(num, den)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'atan(num) or atan(num, den)')) },
			{ { '1' }, '0.78539816339745' },
		},
	},
	binomial = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '1/6' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '', '2' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '', '', '2' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '1/6', '2' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '1/6', '', '2' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '', '2', '2' }, (notEnoughOperands:gsub('$1', 'binomial(prob, n, r)')) },
			{ { '1/6', '6',' 1' }, '0.40187757201646' },
		},
	},
	ceil = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'ceil(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'ceil(num)')) },
			{ { '123.456' }, '124' },
			{ { '-123.456' }, '-123' },
		},
	},
	cos = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'cos(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'cos(num)')) },
			{ { '#pi/2' }, '0' },
		},
	},
	cosh = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'cosh(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'cosh(num)')) },
			{ { '#pi/2' }, '2.5091784786581' },
		},
	},
	deg = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'deg(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'deg(num)')) },
			{ { '#pi/4' }, '45' },
		},
	},
	div = {
		options = {
			mode = 'method',
			nowiki = nw,
			unpk = true,
			deep = true,
		},
		tests = {
			{ {}, (notEnoughOperands:gsub('$1', 'div(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'div(n, m)')) },
			{ {nil, 3}, (notEnoughOperands:gsub('$1', 'div(n, m)')) },
			{ {123, 3}, 41 },
			{ {123, true}, 123 },
			{ {false, 123}, 0 },
			{ {true, true}, 1 },
			{ {123, '3'}, 41 },
			{ {'123', 3}, '41' },
			{ {'123', '3'}, '41' },
			{ {123, {0.5, 1, 1.5}}, 41 },
			{ {{123, 126, 129}, 3}, {41, 42, 43} },
			{ {{123, 124, 125}, {3, 4, 5}}, {41, 31, 25} },
		},
	},
	ex = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'ex(prob1, prob2, prob3, ...)')) },
			{ '', (notEnoughOperands:gsub('$1', 'ex(prob1, prob2, prob3, ...)')) },
			{ '1/6', '5&nbsp;&ndash;&nbsp;6' },
			{ '0.3872|0.3872|0.2256', '6&nbsp;&ndash;&nbsp;7' },
		},
	},
	exp = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, '{{#expr:e}}' },
			{ { '' }, '{{#expr:e}}' },
			{ { '3' }, '{{#expr:e*e*e}}' },
			{ { '-3' }, '{{#expr:1/(e*e*e)}}' },
		},
	},
	floor = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'floor(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'floor(num)')) },
			{ { '123.456' }, '123' },
			{ { '-123.456' }, '-124' },
		},
	},
	frac = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'frac(num) or frac(num, factor, epsilon)')) },
			{ { '', (notEnoughOperands:gsub('$1', 'frac(num) or frac(num, factor, epsilon)')) },
			{ { '1/6' }, '\\frac{\\text{1}}{\\text{6}}\\!' },
			{ { '2.1142191999126', '#e' }, '\\frac{\\text{7}}{\\text{9}}\\!e' },
			{ { '9.8994949366117', '', '-10' }, '\\frac{\\text{39398990}}{\\text{3979899}}\\!' },
		},
	},
	gamma = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'gamma(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'gamma(num)')) },
			{ { '2' }, '1' },
			{ { '#pi' }, '2.2880378' },
			{ { '1/2' }, '1.7724538' },
		},
	},
	gcd = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'gcd(num1, num2)')) },
			{ { '', '6' }, (notEnoughOperands:gsub('$1', 'gcd(num1, num2)')) },
			{ { '15' }, (notEnoughOperands:gsub('$1', 'gcd(num1, num2)')) },
			{ { '15', '6' }, '3' },
		},
	},
	ln = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'ln(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'ln(num)')) },
			{ { '7' }, '{{#expr:ln(7)}}' },
		},
	},
	log = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'log(num) or log(num, base)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'log(num) or log(num, base)')) },
			{ { '7' }, '{{#expr:ln(7)/ln(10)}}' },
			{ { '7', '3' }, '{{#expr:ln(7)/ln(3)}}' },
		},
	},
	max = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'max(num1, num2, num3, ...)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'max(num1, num2, num3, ...)')) },
			{ { '-2', '-1', '0', '1', '2' }, '2' },
		},
	},
	min = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'min(num1, num2, num3, ...)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'min(num1, num2, num3, ...)')) },
			{ { '-2', '-1', '0', '1', '2' }, '-2' },
		},
	},
	mod = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'mod(num, den)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'mod(num, den)')) },
			{ { '67' }, (notEnoughOperands:gsub('$1', 'mod(num, den)')) },
			{ { '67', '5' }, '2' },
			{ { '-67', '5' }, '-2' },
			{ { '67', '-5' }, '2' },
			{ { '-67', '-5' }, '-2' },
			{ { '', '5' }, (notEnoughOperands:gsub('$1', 'mod(num, den)')) },
		},
	},
	modf = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'modf(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'modf(num)')) },
			{ { '-7' }, '-0' },
			{ { '2.33333333' }, '0.33333333' },
			{ { '-7', int='y' }, '-7' },
			{ { '2.33333333', int=true }, '2' },
			{ { '-7', int='y', dec='t' }, '-7-0' },
			{ { '2.33333333', int=true, dec=1 }, '20.33333333' },
		},
	},
	mul = {
		options = {
			mode = 'method',
			nowiki = nw,
			unpk = true,
			deep = true,
		},
		tests = {
			{ {}, (notEnoughOperands:gsub('$1', 'mul(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'mul(n, m)')) },
			{ {nil, 3}, (notEnoughOperands:gsub('$1', 'mul(n, m)')) },
			{ {41, 3}, 123 },
			{ {41, true}, 41 },
			{ {false, 41}, false },
			{ {true, true}, true },
			{ {41, '3'}, 123 },
			{ {'41', 3}, '123' },
			{ {'41', '3'}, '123' },
			{ {41, {0.5, 1, 1.5}}, 123 },
			{ {{41, 42, 43}, 3}, {123, 126, 129} },
			{ {{41, 31, 25}, {3, 4, 5}}, {123, 124, 125} },
		},
	},
	ncr = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'ncr(n, r)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'ncr(n, r)')) },
			{ { '7' }, (notEnoughOperands:gsub('$1', 'ncr(n, r)')) },
			{ { '7', '3' }, '35' },
			{ { '', '3' }, (notEnoughOperands:gsub('$1', 'ncr(n, r)')) },
		},
	},
	ng = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'ng(prob1, prob2, prob3, ...)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'ng(prob1, prob2, prob3, ...)')) },
			{ { '1/6' }, '38&nbsp;&#177;&nbsp;13' },
			{ { '0.3872', '0.3872', '0.2256' }, '27&nbsp;&#177;&nbsp;9' },
		},
	},
	npr = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'npr(n, r)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'npr(n, r)')) },
			{ { '7' }, (notEnoughOperands:gsub('$1', 'npr(n, r)')) },
			{ { '7', '3' }, '210' },
			{ { '', '3' }, (notEnoughOperands:gsub('$1', 'npr(n, r)')) },
		},
	},
	percentage = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'percentage(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'percentage(num)')) },
			{ { '0' }, '0%' },
			{ { '1' }, '100%' },
			{ { '1.00000000000001' }, '100%' },
			{ { '1.5' }, '150%' },
			{ { '0.5' }, '50%' },
			{ { '0.5000' }, '50%' },
			{ { '0.9999' }, '99.99%' },
			{ { '0.999999' }, '100%' },
		},
	},
	pow = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'pow(base, exponent)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'pow(base, exponent)')) },
			{ { '7' }, (notEnoughOperands:gsub('$1', 'pow(base, exponent)')) },
			{ { '7', '3' }, '{{#expr:7*7*7}}' },
			{ { '-7', '3' }, '{{#expr:-7*7*7}}' },
			{ { '7', '-3' }, '{{#expr:1/(7*7*7)}}' },
			{ { '-7', '-3' }, '{{#expr:-1/(7*7*7)}}' },
			{ { '', '3' }, (notEnoughOperands:gsub('$1', 'pow(base, exponent)')) },
		},
	},
	rad = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'rad(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'rad(num)')) },
			{ { '45' }, '{{#expr:45*pi/180}}' },
		},
	},
	rand = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ { '', '', seed=0 }, '0.90337034822599_0' },
			{ { '100', '', seed=0 }, '91_0' },
			{ { '-20', '50', seed=0 }, '44_0' },
			{ { '50', '-20', seed=0 }, '44_0' },
			{ { '', '100', seed=0 }, '0.90337034822599_0' },
		},
	},
	replace = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, '()' },
			{ { '		abs(15 + sqrt(1 - 15^2)	-	[(360° mod 2•#pi)	]	)		' },
            	'(abs(15+(1-15^2)-((360*3.1415926535898/180)mod(2*3.1415926535898))))' }
		},
	},
    replaceWithSymbol = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, '' },
			{ { 'abs(#phi + sqrt(1 - #e^2)	-	[(#gamma mod 2•#pi)	]	)' },
            	'abs(φ + sqrt(1 - e^2)	-	[(γ mod 2•π)	]	)' }
		},
	},
	round = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'round(num) or round(num, multiple)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'round(num) or round(num, multiple)')) },
			{ { '123.456' }, '123.456' },
			{ { '123.456', '0.5' }, '123.5' },
			{ { '-123.456', '0.5' }, '-123.5' },
			{ { '-12345678910111213.141516', '0.5' }, '-1.2345678910111E+16' },
			{ { '1', '0.1' }, '1' },
			{ { '0.5', '2' }, '0' },
			{ { '2.99', '2' }, '2'},
			{ { '3', '2' }, '4' },
			{ { '0.6', '0.01' }, '0.6' },
			{ { '80', '1' }, '80' },
		},
	},
	sin = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'sin(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'sin(num)')) },
			{ { '#pi/2' }, '1' },
		},
	},
	sinh = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'sinh(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'sinh(num)')) },
			{ { '#pi/2' }, '2.3012989023073' },
		},
	},
	sqrt = {
		options = {
			mode = 'method',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'sqrt(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'sqrt(num)')) },
			{ { '7' }, '{{#expr:7^0.5}}' },
			{ { '-7' }, '{{#expr:7^0.5}}' },
		},
	},
	sub = {
		options = {
			mode = 'method',
			nowiki = nw,
			unpk = true,
			deep = true,
		},
		tests = {
			{ {}, (notEnoughOperands:gsub('$1', 'sub(n, m)')) },
			{ {321}, (notEnoughOperands:gsub('$1', 'sub(n, m)')) },
			{ {nil, 123}, (notEnoughOperands:gsub('$1', 'sub(n, m)')) },
			{ {321, 123}, 198 },
			{ {321, true}, 320 },
			{ {false, 123}, false },
			{ {true, true}, true },
			{ {321, '123'}, 198 },
			{ {'321', 123}, '198' },
			{ {'321', '123'}, '198' },
			{ {321, {100, 20, 3}}, 198 },
			{ {{321, 322, 323}, 123}, {198, 199, 200} },
			{ {{321, 654, 987}, {123, 456, 789}}, {198, 198, 198} },
		},
	},
	sum = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'sum(num1, num2, num3, ...)')) },
			{ { '', '2', '3', '5', '', '11' }, '21' },
			{ { '0.3872', '0.3872', '0.2256' }, '1' },
		},
	},
	tan = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'tan(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'tan(num)')) },
			{ { '#pi/4' }, '1' },
		},
	},
	tanh = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'tanh(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'tanh(num)')) },
			{ { '#pi/4' }, '0.65579420263267' },
		},
	},
	trunc = {
		options = {
			mode = 'method',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'trunc(num)')) },
			{ { '' }, (notEnoughOperands:gsub('$1', 'trunc(num)')) },
			{ { '-123.456' }, '-123' },
		},
	},
};
]]--
