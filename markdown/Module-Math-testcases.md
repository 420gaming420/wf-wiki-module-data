---
title: "Module:Math/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Math/testcases"
wiki_timestamp: "2023-05-19T18:15:57Z"
---

false

---

```lua
local userError = require('Dev:User error');
local i18n =  require('Module:I18n').loadMessages('Module:Math/i18n'):useUserLang();
local notEnoughOperands = userError(i18n:msg( { key = 'no-argument', args = { '$1' } } ));
local nw = false;

return {
	eval = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.eval(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.eval(num)')) },
			{ '-10 + 50 - 10^2 * 5 / 6', '-43.333333333333' },
			{ '{{text||15%|hover=Gram\'s base crit chance}} {{mul}} [1 + {{M|True Steel|120%}} + {{M|Blood Rush|60%}} {{mul}} ({{text||7|hover=Combo Multiplier}} - 1)]', '0.87' },
		},
	},
	formatnum = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.formatnum(num) or p.formatnum(num, code)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.formatnum(num) or p.formatnum(num, code)')) },
			{ '-123456789.87654', '−123,456,789.87654' },
			{ '-123456789.87654321|ar', '−١٢٣٬٤٥٦٬٧٨٩٫٨٧٦٥٤' },
			{ '-123456789.87654||true', '−123456789.87654' },
			{ '-123456789.87654321|ar|true', '−١٢٣٤٥٦٧٨٩.٨٧٦٥٤' },
		},
	},
	abs = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.abs(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.abs(num)')) },
			{ '-123.456', '123.456' },
			{ '123.456', '123.456' },
		},
	},
	acos = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.acos(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.acos(num)')) },
			{ '1', '0' },
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
			{ {}, (notEnoughOperands:gsub('$1', 'p.add(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'p.add(n, m)')) },
			{ {nil, 0.456}, (notEnoughOperands:gsub('$1', 'p.add(n, m)')) },
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
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.asin(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.asin(num)')) },
			{ '1', '1.5707963267949' },
		},
	},
	atan = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.atan(num) or p.atan(num, den)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.atan(num) or p.atan(num, den)')) },
			{ '1', '0.78539816339745' },
		},
	},
	binomial = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '1/6', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '|2', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '||2', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '1/6|2', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '1/6||2', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '|2|2', (notEnoughOperands:gsub('$1', 'p.binomial(p, n, r)')) },
			{ '1/6|6|1', '0.40187757201646' },
		},
	},
	ceil = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.ceil(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.ceil(num)')) },
			{ '123.456', '124' },
			{ '-123.456', '-123' },
		},
	},
	cos = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.cos(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.cos(num)')) },
			{ '#pi/2', '0' },
		},
	},
	cosh = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.cosh(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.cosh(num)')) },
			{ '#pi/2', '2.5091784786581' },
		},
	},
	deg = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.deg(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.deg(num)')) },
			{ '#pi/4', '45' },
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
			{ {}, (notEnoughOperands:gsub('$1', 'p.div(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'p.div(n, m)')) },
			{ {nil, 3}, (notEnoughOperands:gsub('$1', 'p.div(n, m)')) },
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
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.ex(prob1, prob2, prob3, ...)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.ex(prob1, prob2, prob3, ...)')) },
			{ '1/6', '5 – 6' },
			{ '0.3872|0.3872|0.2256', '6 – 7' },
		},
	},
	exp = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, '{{#expr:e}}' },
			{ '', '{{#expr:e}}' },
			{ '3', '{{#expr:e*e*e}}' },
			{ '-3', '{{#expr:1/(e*e*e)}}' },
		},
	},
	floor = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.floor(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.floor(num)')) },
			{ '123.456', '123' },
			{ '-123.456', '-124' },
		},
	},
	frac = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.frac(num) or p.frac(num, factor, epsilon)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.frac(num) or p.frac(num, factor, epsilon)')) },
			{ '1/6', '\\frac{\\text{1}}{\\text{6}}\\!' },
			{ '2.1142191999126|#e', '\\frac{\\text{7}}{\\text{9}}\\!e' },
			{ '9.8994949366117||-10', '\\frac{\\text{39398990}}{\\text{3979899}}\\!' },
		},
	},
	gamma = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.gamma(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.gamma(num)')) },
			{ '2', '1' },
			{ '#pi', '2.2880378' },
			{ '1/2', '1.7724538' },
		},
	},
	gcd = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.gcd(num1, num2)')) },
			{ '|6', (notEnoughOperands:gsub('$1', 'p.gcd(num1, num2)')) },
			{ '15', (notEnoughOperands:gsub('$1', 'p.gcd(num1, num2)')) },
			{ '15|6', '3' },
		},
	},
	ln = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.ln(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.ln(num)')) },
			{ '7', '{{#expr:ln(7)}}' },
		},
	},
	log = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.log(num) or p.log(num, base)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.log(num) or p.log(num, base)')) },
			{ '7', '{{#expr:ln(7)/ln(10)}}' },
			{ '7|3', '{{#expr:ln(7)/ln(3)}}' },
		},
	},
	max = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.max(num1, num2, num3, ...)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.max(num1, num2, num3, ...)')) },
			{ '-2|-1|0|1|2', '2' },
		},
	},
	min = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.min(num1, num2, num3, ...)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.min(num1, num2, num3, ...)')) },
			{ '-2|-1|0|1|2', '-2' },
		},
	},
	mod = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.mod(num, den)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.mod(num, den)')) },
			{ '67', (notEnoughOperands:gsub('$1', 'p.mod(num, den)')) },
			{ '67|5', '2' },
			{ '-67|5', '-2' },
			{ '67|-5', '2' },
			{ '-67|-5', '-2' },
			{ '|5', (notEnoughOperands:gsub('$1', 'p.mod(num, den)')) },
		},
	},
	modf = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.modf(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.modf(num)')) },
			{ '-7', '-0' },
			{ '2.33333333', '0.33333333' },
			{ '-7|int=y', '-7' },
			{ '2.33333333|int=true', '2' },
			{ '-7|int=y|dec=t', '-7-0' },
			{ '2.33333333|int=true|dec=1', '20.33333333' },
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
			{ {}, (notEnoughOperands:gsub('$1', 'p.mul(n, m)')) },
			{ {123}, (notEnoughOperands:gsub('$1', 'p.mul(n, m)')) },
			{ {nil, 3}, (notEnoughOperands:gsub('$1', 'p.mul(n, m)')) },
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
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.ncr(n, r)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.ncr(n, r)')) },
			{ '7', (notEnoughOperands:gsub('$1', 'p.ncr(n, r)')) },
			{ '7|3', '35' },
			{ '|3', (notEnoughOperands:gsub('$1', 'p.ncr(n, r)')) },
		},
	},
	ng = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.ng(prob1, prob2, prob3, ...)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.ng(prob1, prob2, prob3, ...)')) },
			{ '1/6', '38 ± 13' },
			{ '0.3872|0.3872|0.2256', '27 ± 9' },
		},
	},
	npr = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.npr(n, r)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.npr(n, r)')) },
			{ '7', (notEnoughOperands:gsub('$1', 'p.npr(n, r)')) },
			{ '7|3', '210' },
			{ '|3', (notEnoughOperands:gsub('$1', 'p.npr(n, r)')) },
		},
	},
	percentage = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.percentage(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.percentage(num)')) },
			{ '0', '0%' },
			{ '1', '100%' },
			{ '1.00000000000001', '100%' },
			{ '1.5', '150%' },
			{ '0.5', '50%' },
			{ '0.5000', '50%' },
			{ '0.9999', '99.99%' },
			{ '0.999999', '100%' },
		},
	},
	pow = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.pow(base, exponent)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.pow(base, exponent)')) },
			{ '7', (notEnoughOperands:gsub('$1', 'p.pow(base, exponent)')) },
			{ '7|3', '{{#expr:7*7*7}}' },
			{ '-7|3', '{{#expr:-7*7*7}}' },
			{ '7|-3', '{{#expr:1/(7*7*7)}}' },
			{ '-7|-3', '{{#expr:-1/(7*7*7)}}' },
			{ '|3', (notEnoughOperands:gsub('$1', 'p.pow(base, exponent)')) },
		},
	},
	rad = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.rad(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.rad(num)')) },
			{ '45', '{{#expr:45*pi/180}}' },
		},
	},
	rand = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ '||seed=0', '0.90337034822599_0' },
			{ '100||seed=0', '91_0' },
			{ '-20|50|seed=0', '44_0' },
			{ '50|-20|seed=0', '44_0' },
			{ '|100|seed=0', '0.90337034822599_0' },
		},
	},
	replace = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, '()' },
			{ '		abs(15 + sqrt(1 - 15^2)	-	[(360° mod 2•#pi)	]	)		',
				'(abs(15+(1-15^2)-(360*3.1415926535898/180)mod(2*3.1415926535898)))' }
		},
	},
	replaceWithSymbol = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, '' },
			{ 'abs(#phi + sqrt(1 - #e^2)	-	[(#gamma mod 2•#pi)	]	)',
				'abs(φ + sqrt(1 - e^2)	-	[(γ mod 2•π)	]	)' }
		},
	},
	round = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.round(num) or p.round(num, multiple)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.round(num) or p.round(num, multiple)')) },
			{ '123.456', '123.456' },
			{ '123.456|0.5', '123.5' },
			{ '-123.456|0.5', '−123.5' },
			{ '-12345678910111213.141516|0.5', '−1.2345678910111×1016 ' },
			{ '1|0.1', '1' },
			{ '0.5|2', '0' },
			{ '2.99|2', '2'},
			{ '3|2', '4' },
			{ '0.6|0.01', '0.6' },
			{ '80|1', '80' },
		},
	},
	sin = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.sin(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.sin(num)')) },
			{ '#pi/2', '1' },
		},
	},
	sinh = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.sinh(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.sinh(num)')) },
			{ '#pi/2', '2.3012989023073' },
		},
	},
	sqrt = {
		options = {
			mode = 'invocation',
			nowiki = nw,
			preprocess = true,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.sqrt(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.sqrt(num)')) },
			{ '7', '{{#expr:7^0.5}}' },
			{ '-7', '{{#expr:7^0.5}}' },
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
			{ {}, (notEnoughOperands:gsub('$1', 'p.sub(n, m)')) },
			{ {321}, (notEnoughOperands:gsub('$1', 'p.sub(n, m)')) },
			{ {nil, 123}, (notEnoughOperands:gsub('$1', 'p.sub(n, m)')) },
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
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.sum(num1, num2, num3, ...)')) },
			{ '|2|3|5||11', '21' },
			{ '0.3872|0.3872|0.2256', '1' },
		},
	},
	tan = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.tan(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.tan(num)')) },
			{ '#pi/4', '1' },
		},
	},
	tanh = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.tanh(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.tanh(num)')) },
			{ '#pi/4', '0.65579420263267' },
		},
	},
	trunc = {
		options = {
			mode = 'invocation',
			nowiki = nw,
		},
		tests = {
			{ nil, (notEnoughOperands:gsub('$1', 'p.trunc(num)')) },
			{ '', (notEnoughOperands:gsub('$1', 'p.trunc(num)')) },
			{ '-123.456', '-123' },
		},
	},
};
```

