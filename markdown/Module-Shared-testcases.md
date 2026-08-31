---
title: "Module:Shared/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Shared/testcases"
wiki_timestamp: "2021-04-15T19:44:07Z"
---

|  |  |
| --- | --- |
| Test suite status | Failed |
| Scribunto test cases | 1/3 |
| Code coverage | 1/7 |

**Unit test report for [Shared](/w/Module:Shared "Module:Shared").**

* `Execution time: 0.3 ms`
* `Test cases failing:`
  + `getArgs`
* `Test members missing:`
  + `Cache`
  + `assert`
  + `assertType`
  + `delayLoadData`
  + `delayRequire`
  + `upk`

## Scribunto test cases

| `p.getArgs`1/3 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Passing | ```lua p.getArgs() ``` | Error  attempt to index local 'frame' (a nil value) | Error  attempt to index local 'frame' (a nil value) |  |
| Failing | ```lua p.getArgs("") ``` | Error  bad argument #1 to 'getArgs' (table expected, got string) | Error  module 'Dev:Arguments' not found | 1 "`b`" vs. "`m`" |
| Failing | ```lua p.getArgs({ "arg1", "arg2",  arg3 = "3" }) ``` | { "arg1", "arg2", arg3 = "3"} | Error  module 'Dev:Arguments' not found | error |

---

```lua
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
```

