---
title: "Module:NightwaveActs/doc"
wiki_url: "https://wiki.warframe.com/w/Module/NightwaveActs/doc"
wiki_timestamp: "2021-08-31T20:39:48Z"
---

[![](/images/Lotusiconsmall.png?17208)](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators")

*Please do not use this article for critical in-game information!  
Use [NightwaveActs.json](/w/NightwaveActs.json "NightwaveActs.json") instead 20:39, 31 August 2021 (UTC)*

This article is [archived](/w/Category:Archived "Category:Archived"). The content was relevant to an **obsolete** version of Warframe, and has since been removed, retrieved, and/or revamped.

JSON data to be parsed by [MediaWiki:NightwaveActs.js](/w/MediaWiki:NightwaveActs.js "MediaWiki:NightwaveActs.js") to map out act name to associated image in wiki. To be used with [Template:NightwaveActs](/w/Template:NightwaveActs "Template:NightwaveActs").

Keys are in alphabetical order and values are hexidecimal values with image name to be concatenated to the following URL:

```lua
https://vignette.wikia.nocookie.net/warframe/images/
```

## Notes

[[edit source](/w/Module:NightwaveActs/doc?action=edit&section=1 "Edit section's source code: Notes")]

* Some acts don't have image so their values are links to a placeholder image (i.e. `"4/47/Placeholder.png"`)
* Keys and values must be double quoted (`""`)
* No trailing comma after last element of each JSON object
* TODO: Check if ?action=raw can be used instead of ?action=parse in MediaWiki API. If that is the case, we can replace the JSON delimiters.

## See Also

[[edit source](/w/Module:NightwaveActs/doc?action=edit&section=2 "Edit section's source code: See Also")]

* [Module:NightwaveActs/dev](/w/Module:NightwaveActs/dev "Module:NightwaveActs/dev") - for development

