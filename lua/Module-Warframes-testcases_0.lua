local userError = require('Dev:User error');
local missingOperand1 = userError('Must provide a numeric value to $1');
local missingOperand2 = userError('Must provide a second numeric value to $1');
local missingOperand3 = userError('Must provide a third numeric value to $1');
local missingOperand4 = userError('Must provide numeric values to $1');

return {
	getWarframeCount = {
		options = {
			mode = 'method',
			preprocess = true
		},
		tests = {
		},
	},
};
