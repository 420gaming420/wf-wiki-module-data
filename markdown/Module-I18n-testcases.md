---
title: "Module:I18n/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/I18n/testcases"
wiki_timestamp: "2022-09-23T22:24:19Z"
---

|  |  |
| --- | --- |
| Test suite status | Failed |
| Scribunto test cases | 6/12 |
| Code coverage | 4/4 |

**Unit test report for [I18n](/w/Module:I18n "Module:I18n").**

* `Execution time: 2.1 ms`
* `Test cases failing:`
  + `getLang`
  + `getMsg`
* `Test members missing:` `none`

## Scribunto test cases

| `i18n.getLang`3/4 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Failing | ```lua {{#invoke:i18n|getLang}} ``` | ⧼lang⧽ | en | 1 "" vs. "`e`" |
| Passing | ```lua {{#invoke:i18n|getLang|uselang=en}} ``` | en | en |  |
| Passing | ```lua {{#invoke:i18n|getLang|uselang=es}} ``` | es | es |  |
| Passing | ```lua {{#invoke:i18n|getLang}}  {{i18n|uselang=es}} ``` | es | es |  |

| `i18n.getMsg`2/7 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Passing | ```lua {{#invoke:i18n|getMsg}} ``` | Error  missing arguments in i18n.getMsg | Error  missing arguments in i18n.getMsg |  |
| Failing | ```lua {{#invoke:i18n|getMsg|documentation|documentation-heading}} ``` | **Lua error: bad argument #1 to 'mw.loadJsonData' ('Module:Documentation/i18n' is not a valid JSON page).** | Error  bad argument #1 to 'mw.loadJsonData' ('Module:Documentation/i18n' is not a valid JSON page) | error |
| Failing | ```lua {{#invoke:i18n|getMsg|talk header|title}} ``` | **Lua error: bad argument #1 to 'mw.loadJsonData' ('Module:Talk header/i18n' is not a valid JSON page).** | Error  bad argument #1 to 'mw.loadJsonData' ('Module:Talk header/i18n' is not a valid JSON page) | error |
| Failing | ```lua {{#invoke:i18n|getMsg|install|css-import|uselang=en}} ``` | @import statement | Error  bad argument #1 to 'mw.loadJsonData' ('Module:Install/i18n' is not a valid JSON page) | error |
| Failing | ```lua {{#invoke:i18n|getMsg|install|add-to-importjs|uselang=de}} ``` | Füge diese Zeile zu **MediaWiki:ImportJS** hinzu: | Error  bad argument #1 to 'mw.loadJsonData' ('Module:Install/i18n' is not a valid JSON page) | error |
| Failing | ```lua {{#invoke:i18n|getMsg|install|title|チャット|uselang=ja}} ``` | チャットの導入方法 | Error  bad argument #1 to 'mw.loadJsonData' ('Module:Install/i18n' is not a valid JSON page) | error |
| Passing | ```lua {{#invoke:i18n|getMsg|common|stylesheet|2|uselang=es}} ``` | hojas de estilo | hojas de estilo |  |

| `i18n.main`1/1 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Passing | ```lua {{#invoke:i18n|main}} ``` | Error  you must specify a function to call | Error  you must specify a function to call |  |

---

```lua
-- Unit tests for I18n-lua library.
-- @see    Unit test report:
--         https://dev.wikia.com/wiki/Module_talk:I18n/testcases
-- @submodule
return {
    getLang = {
        options = {
            mode       = 'invocation',
            preprocess = true,
            nowiki     = false
        },
        tests = {
            {                   nil, '{{#ifeq:{{int:lang}}|(lang)|qqx|{{int:lang}}}}' },
            {          'uselang=en',                                             'en' },
            {          'uselang=es',                                             'es' },
            { { nil, 'uselang=es' },                                             'es' }
        }
    },
    getMsg = {
        options = {
            mode       = 'invocation',
            nowiki     = false
        },
        tests = {
            {
                nil,
                'missing arguments in i18n.getMsg',
                { err = true }
            },
            {
                'documentation|documentation-heading',
                '{{#invoke:i18n|getMsg|documentation|documentation-heading}}',
                { pp = true }
            },
            {
                'talk header|title',
                '{{i18n|getMsg|talk header|title}}',
                { pp = true }
            },
            {
                'install|css-import|uselang=en',
                '@import statement'
            },
            {
                'install|add-to-importjs|uselang=de',
                'Füge diese Zeile zu \'\'\'MediaWiki:ImportJS\'\'\' hinzu:'
            },
            {
                'install|title|チャット|uselang=ja',
                'チャットの導入方法'
            },
            {
                'common|stylesheet|2|uselang=es',
                'hojas de estilo'
            }
        }
    },
    main = {
        options = {
            mode = 'invocation',
            nowiki = true
        },
        tests = {
            { nil, 'you must specify a function to call', { err = true } }
        }
    }
}
--
```

