local InfoboxBuilder = require('Module:InfoboxBuilder')
--...
local sampleInfobox = Infobox('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title('Item Name')
	:image('Panel.png')
    :group()
    	:header('General Information')
			:row('type', 'Type', 'Resource')
			:row('rarity', 'Rarity', 'Rare')
		:done()
	:done()

mw.log(sampleInfobox)
--[=[
The above prints:
<div class="infobox"><div class="title">Item Name</div>[[File:Panel.png|300px|class=main-image]]<div class="group"><div class="header">General Information</div><div class="row"><div class="label left">Type</div><div class="value right">Resource</div></div><div class="row"><div class="label left">Rarity</div><div class="value right">Rare</div></div></div></div>

Prettified:
<div class="infobox">
	<div class="title">Item Name</div>
	[[File:Panel.png|300px|class=main-image]]
	<div class="group">
		<div class="header">General Information</div>
		<div class="row">
			<div class="label left">Type</div>
			<div class="value right">Resource</div>
		</div>
		<div class="row">
			<div class="label left">Rarity</div>
			<div class="value right">Rare</div>
		</div>
	</div>
</div>
--]=]
