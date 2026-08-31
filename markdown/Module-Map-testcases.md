---
title: "Module:Map/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Map/testcases"
wiki_timestamp: "2023-05-26T06:01:20Z"
---

|  |  |
| --- | --- |
| Test suite status | Passed |
| Scribunto test cases | 0/0 |
| Code coverage | 0/1 |

**Unit test report for [Map](/w/Module:Map "Module:Map").**

* `Execution time: 0 ms`
* `Test cases failing:` `none`
* `Test members missing:`
  + `main`

## Scribunto test cases

---

```lua
return {
	Map = {
		options = {
			mode = 'invocation',
			nowiki = true,
			preprocess = true,
		},
		tests = {
			{
				'Duviri Joy Spiral|Yao Shrub',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Yao Shrub|Saggen Pearl',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Fragments',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Fragments|Yao Shrub',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Fragments|Puzzles',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Non-existant Category',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Non-existant Category|Yao Shrub',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|None',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|None|Yao Shrub',
				'

{{Map:Duviri Joy Spiral}}

'
			},
			{
				'Duviri Joy Spiral|Yao Shrub|None',
				'

{{Map:Duviri Joy Spiral}}

'
			}
		}
	}
}
```

