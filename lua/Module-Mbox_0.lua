--- '''Mbox''' is a module for creating message boxes.
--
--  On this Wiki, Mbox is used in:
--  * [[Template:Ambox]]
--
--  @module		mbox
--  @alias		p
--  @author		[[w:c:dev:User:Technobliterator|Technobliterator]] (Lua conversion)
--  @author		[[w:c:dev:User:Jak Himself|Jak Himself]] (HTML and CSS)
--  @image		Panel.png
--  @require	[[Module:Arguments]]
--  @require	[[Module:I18n]]
--  @require	[[MediaWiki:Wikia.css]] (Ambox design)
--  @require	[[MediaWiki:Mbox.js]]
--  @release	stable
-- 
local Mbox = {}

local getArgs = require('Module:Arguments').getArgs
local i18n = require('Module:I18n').loadMessages('Mbox')

function Mbox.__main(frame)
    local args = getArgs(frame)

    -- styles
    local styles = {}
    styles['border-left-color'] = i18n:parameter('bordercolor', args)
    styles['background-color'] = i18n:parameter('bgcolor', args)

    -- images
    local image = i18n:parameter('image', args) or ''
    local imageadjust = ''
    if args.imageadjust then
        imageadjust = '|' .. args.imageadjust
    end
    local imagewidth = i18n:parameter('imagewidth', args) or '80px'
    local imagelink = '|link='
    local imagelinkarg = i18n:parameter('imagelink', args)
    if imagelinkarg then
        imagelink = imagelink .. imagelinkarg
    end

    local imagewikitext = '[[File:' .. image .. '|class=notpageimage|' .. imagewidth  .. imageadjust .. imagelink .. ']]'

    -- id for closure
    local id = i18n:parameter('id', args) or 'mbox'
    local typeclass = i18n:parameter('type', args)

    local container = mw.html.create('div')
        :addClass('mbox')
        :addClass('noexcerpt notpageimage')
        :attr('id', id)
        :addClass(typeclass and ('mbox-type-' .. typeclass))
        :addClass(i18n:parameter('class', args))
        :css(styles)
        :cssText(i18n:parameter('style', args))

    local content = container:tag('div')
        :addClass('mbox__content')
    local collapsed = i18n:parameter('collapsed', args)

    if image ~= '' then
        local image = content:tag('div')
            :addClass('mbox__content__image')
            :addClass('mw-collapsible')
            :attr('id', 'mw-customcollapsible-' .. id)
            :wikitext(imagewikitext)
            if collapsed then
                image:addClass('mw-collapsed')
            end
    end

    local contentwrapper = content:tag('div')
        :addClass('mbox__content__wrapper')
    local header = i18n:parameter('header', args)

    if header then
        contentwrapper:tag('div')
            :addClass('mbox__content__header')
            :addClass('mw-collapsible')
            :attr('id', 'mw-customcollapsible-' .. id)
            :wikitext(header)
    end

    local textarg = i18n:parameter('text', args)
    if textarg then
        local text = contentwrapper:tag('div')
            :addClass('mbox__content__text')
            :wikitext(textarg)
            if collapsed then
                text:addClass('mw-collapsed')
            end

        local comment = i18n:parameter('comment', args)
        if comment then
            text:tag('div')
                :addClass('mbox__content__text__comment')
                :addClass('mw-collapsible')
            	:attr('id', 'mw-customcollapsible-' .. id)
                :wikitext(comment)
        end
    end
    
    local asidearg = i18n:parameter('aside', args)
    if asidearg then
        local aside = content:tag('div')
            :addClass('mbox__content__aside')
            :addClass('mw-collapsible')
            :attr('id', 'mw-customcollapsible-' .. id)
            :wikitext(asidearg)
            if collapsed then
                aside:addClass('mw-collapsed')
            end
    end

    contentwrapper:tag('span')
        :addClass('mbox__min')
        :addClass('mw-customtoggle-' .. id)
        :attr('title', 'Minimize')
        
    contentwrapper:tag('span')
        :addClass('mbox__close')
        :attr('id', id)
        :attr('title', i18n:msg('dismiss'))

    return container
end

return Mbox
