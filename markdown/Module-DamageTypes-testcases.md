---
title: "Module:DamageTypes/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/DamageTypes/testcases"
wiki_timestamp: "2021-05-11T17:11:28Z"
---

|  |  |
| --- | --- |
| Test suite status | Passed |
| Scribunto test cases | 0/0 |
| Code coverage | 0/5 |

**Unit test report for [DamageTypes](/w/Module:DamageTypes "Module:DamageTypes").**

* `Execution time: 0 ms`
* `Test cases failing:` `none`
* `Test members missing:`
  + `damageTypeModifierTable`
  + `healthMod`
  + `healthTable`
  + `iterationOrderArray`
  + `procIcon`

## Scribunto test cases

## Visual test cases

```lua
{{#invoke:DamageTypes|damagetable|Impact}}
```

**Script error: The function "damagetable" does not exist.**

---

```lua
{{#invoke:DamageTypes|healthtable|Ferrite Armor}}
```

**Script error: The function "healthtable" does not exist.**

## Scribunto tests code

---

```lua
return {
	damagetable = {
		options = {
			mode = 'invocation',
		},
		tests = {

		},
	},
	healthtable = {
		options = {
			mode = 'invocation',
		},
		tests = {

		},
	},
	tabbertable = {
		options = {
			mode = 'invocation',
		},
		tests = {

		},
	},
}
```

