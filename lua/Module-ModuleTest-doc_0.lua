return {
    funcName = { -- Member being tested (p.funcName). Local functions and members starting with two underscores not tested (local function funcName and p.__funcName).
        options = {
        --  Important options to know (a mode type is non-optional)
            mode = 'invocation', -- Tests member as a Scribunto invocation ({{#invoke:ModuleName|funcName|1|2|3|arg1=arg1|arg2=arg2}})
            mode = 'method',     -- Tests member as a standalone Lua function (p.funcName({1, 2, 3, arg1, arg2}) or p.funcName(1, 2, 3, arg1, arg2))
            preprocess = true,   -- Preprocess expected text, false by default
            unpk = true,         -- Unpack the table argument in 'method' tests, false by default
            nowiki = false,      -- Apply nowiki formatting to report field, true by default
            
        --  Other options you likely won't use
            mode = 'table',      -- Tests method as a static Lua table
            template = true,     -- Skip to parent frame when applying test case arguments to parent frame first, false by default
            self = true,         -- Self-invoke the package function in 'method' tests, false by default
            deep = true,         -- Enable deep comparison for table cases in 'method' tests, false by default
        },
        tests = {
        --  { Input, Expected Output, {err = true, pp = true} },
            -- err: Whether a script error is expected in the test case, false by default
            -- pp:  Whether the expected output should be preprocessed before comparison, false by default
            
            -- 'invocation' mode
            { 'Hello World!', 'Hello World!' },
            { 'Hello|World', 'Hello' },
            
            -- 'method' mode
            { {'Hello World!'}, 'Hello World!' },
            { {'Hello', 'World'}, 'Hello' },
        }
    },
    funcName2 = {
        options = {
            mode = 'invocation',
            preprocess = true,   -- Preprocess expected text, false by default
        },
        tests = {
            { 'Hello World!', 'Hello World!' },
            { '1 + 2', '{{#expr: 1 + 2}}', {pp = true} },
        }
    },
    _funcName2 = {
        options = {
            mode = 'method',
            unpk = true,
        },
        tests = {
			{ {}, 'Not enough input arguments', {err = true} }
            { {'Hello World!'}, 'Hello World!' },
            { {'Hello', 'World'}, 'Hello' },
        }
    },
}
