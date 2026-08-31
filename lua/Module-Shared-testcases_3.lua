--  
return {
	getArgs = {
		options = {
			mode = 'method',
			unpk = true,
			deep = true,
		},
		tests = {
			{ {}, 'attempt to index local \'frame\' (a nil value)', {err = true} },
			{ {''}, 'bad argument #1 to \'getArgs\' (table expected, got string)', {err = true} },
			{ { {"arg1", "arg2", arg3 = "3"} }, { "arg1", "arg2", arg3 = "3"} },
		},
	},
};
