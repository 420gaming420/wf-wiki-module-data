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
