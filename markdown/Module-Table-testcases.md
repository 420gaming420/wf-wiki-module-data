---
title: "Module:Table/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Table/testcases"
wiki_timestamp: "2021-09-27T20:12:54Z"
---

|  |  |
| --- | --- |
| Test suite status | Passed |
| Scribunto test cases | 10/10 |
| Code coverage | 1/17 |

**Unit test report for [Table](/w/Module:Table "Module:Table").**

* `Execution time: 0 ms`
* `Test cases failing:` `none`
* `Test members missing:`
  + `concat`
  + `contains`
  + `copyKeyValues`
  + `deepCopy`
  + `filter`
  + `indexCount`
  + `insert`
  + `invertIndex`
  + `loadData`
  + `pack`
  + `remove`
  + `shallowCopy`
  + `skpairs`
  + `sort`
  + `tableSort`
  + `unpack`

## Scribunto test cases

| `table.size`10/10 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Passing | ```lua table.size() ``` | Error  table.size(t): t must be a table | Error  table.size(t): t must be a table |  |
| Passing | ```lua table.size(1) ``` | Error  table.size(t): t must be a table | Error  table.size(t): t must be a table |  |
| Passing | ```lua table.size(true) ``` | Error  table.size(t): t must be a table | Error  table.size(t): t must be a table |  |
| Passing | ```lua table.size("Sample string") ``` | Error  table.size(t): t must be a table | Error  table.size(t): t must be a table |  |
| Passing | ```lua table.size({}) ``` | 0 | 0 |  |
| Passing | ```lua table.size({ "Apple", "Apricot", "Avocado", "Abiu", "Acai", "Acerola", "Ackee", "Arhat", "American Mayapple", "African Cherry Orange", "Amazon grape", "Araza", "Alligator apple", "Ambarella", "African Cucumber", "African Medlar", "African Moringa", "Agave Plant", "Aizen Fruit", "American Black Elderberry", "American Chestnut", "American Hazelnut Shrub", "American Red Raspberry", "Aprium", "Atemoya", "Atherton Raspberry" }) ``` | 26 | 26 |  |
| Passing | ```lua table.size({  Fruit = { "Apple", "Apricot", "Avocado", "Abiu", "Acai", "Acerola", "Ackee", "Arhat", "American Mayapple", "African Cherry Orange", "Amazon grape", "Araza", "Alligator apple", "Ambarella", "African Cucumber", "African Medlar", "African Moringa", "Agave Plant", "Aizen Fruit", "American Black Elderberry", "American Chestnut", "American Hazelnut Shrub", "American Red Raspberry", "Aprium", "Atemoya", "Atherton Raspberry" },  Vegetable = { "Ahipa", "Amaranth", "American groundnut", "Aonori", "Arracacha", "Arrowhead elephant ear", "Arugula", "Asiatic pennywort", "Asparagus", "Atibulnak", "Azuki bean" } }) ``` | 2 | 2 |  |
| Passing | ```lua table.size({  Abiu = "Fruit",  Acai = "Fruit",  Acerola = "Fruit",  Ackee = "Fruit",  ["African Cherry Orange"] = "Fruit",  ["African Cucumber"] = "Fruit",  ["African Medlar"] = "Fruit",  ["African Moringa"] = "Fruit",  ["Agave Plant"] = "Fruit",  ["Aizen Fruit"] = "Fruit",  ["Alligator apple"] = "Fruit",  ["Amazon grape"] = "Fruit",  Ambarella = "Fruit",  ["American Black Elderberry"] = "Fruit",  ["American Chestnut"] = "Fruit",  ["American Hazelnut Shrub"] = "Fruit",  ["American Mayapple"] = "Fruit",  ["American Red Raspberry"] = "Fruit",  Apple = "Fruit",  Apricot = "Fruit",  Aprium = "Fruit",  Araza = "Fruit",  Arhat = "Fruit",  Atemoya = "Fruit",  ["Atherton Raspberry"] = "Fruit",  Avocado = "Fruit" }) ``` | 26 | 26 |  |
| Passing | ```lua table.size({}) ``` | 0 | 0 |  |
| Passing | ```lua table.size({ "Apple", "Acerola", "American Mayapple", "Ambarella", "American Red Raspberry",  Abiu = "Fruit",  Acai = "Fruit",  Ackee = "Fruit",  ["African Cherry Orange"] = "Fruit",  ["African Cucumber"] = "Fruit",  ["African Medlar"] = "Fruit",  ["African Moringa"] = "Fruit",  ["Agave Plant"] = "Fruit",  ["Aizen Fruit"] = "Fruit",  ["Alligator apple"] = "Fruit",  ["Amazon grape"] = "Fruit",  ["American Black Elderberry"] = "Fruit",  ["American Chestnut"] = "Fruit",  ["American Hazelnut Shrub"] = "Fruit",  Apricot = "Fruit",  Aprium = "Fruit",  Araza = "Fruit",  Arhat = "Fruit",  Atemoya = "Fruit",  ["Atherton Raspberry"] = "Fruit",  Avocado = "Fruit" }) ``` | 26 | 26 |  |

---

```lua
-- local userError = require('Dev:User error');
-- local notEnoughArgs = '$1: not enough arguments';

-- { 'Apple', 'Apricot', 'Avocado', 'Abiu', 'Acai', 'Acerola', 'Ackee', 'Arhat', 'American Mayapple', 'African Cherry Orange', 'Amazon grape', 'Araza', 'Alligator apple', 'Ambarella', 'African Cucumber', 'African Medlar', 'African Moringa', 'Agave Plant', 'Aizen Fruit', 'American Black Elderberry', 'American Chestnut', 'American Hazelnut Shrub', 'American Red Raspberry', 'Aprium', 'Atemoya', 'Atherton Raspberry', 'Banana', 'Berry', 'Bayberry', 'Blueberry', 'Blackberry', 'Boysenberry', 'Bearberry', 'Bilberry', 'Barberry', 'Buffaloberry', 'Black cherry', 'Beach plum', 'Black raspberry', 'Black apple', 'Blue tongue', 'Bolwarra', 'Burdekin plum', 'Bramble', 'Broadleaf Bramble', 'Black mulberry', 'Blood orange', 'Babaco', 'Bael', 'Barbadine', 'Barbados cherry', 'Betel nut', 'Bilimbi', 'Bitter gourd', 'Black sapote', 'Bottle gourd', 'Brazil nut', 'Breadfruit', 'Burmese grape', 'Blackcurrant', 'Bignay', 'Beechnut', 'Bacuri Fruit', 'Balsam Apple', 'Batuan Fruit', 'Blood Lime', 'Brazilian Guava', 'Brush cherry', 'Cantaloupe', 'Chokeberry', 'Cranberry', 'Cloudberry', 'Crowberry', 'Conkerberry', 'Calabash', 'Calamansi', 'Calamondins', 'Canistel', 'Cape Gooseberry', 'Capuli Cherry', 'Carob Fruit', 'Cashew Apple', 'Cedar Bay Cherry', 'Cempedak', 'Ceylon Gooseberry', 'Charichuelo Fruit', 'Chayote Fruit', 'Cherimoya Fruit', 'cherry Fruit', 'Chokecherry', 'Citrofortunella', 'Clementines', 'Cluster Fig', 'Coco Plum', 'Common Apple Berry', 'Cornelian Cherry', 'Cucumber', 'Cupuacu', 'Damson', 'Date plum', 'Davidson's plum', 'Dead Man's Fingers', 'Dekopon', 'Desert fig', 'Desert lime', 'Dodder laurel', 'Double Coconut', 'Dragon Fruit', 'Duku fruit', 'Durian', 'Eastern Hawthorn', 'Elephant apple', 'Emu Apple', 'Emu berry', 'Fairchild tangerine', 'False mastic', 'Feijoa', 'Fibrous Satinash', 'Finger Lime', 'Florida strangler fig', 'Forest strawberries', 'Gac Fruit', 'Galia melon', 'Gambooge', 'Genip', 'Giant Granadilla', 'Golden apple', 'Goumi Fruit', 'Governor’s Plum', 'Granadilla', 'Grapefruit', 'Grapes', 'Grapple', 'Greengage', 'Ground Plum', 'Grumichama', 'Guanabana', 'Guarana', 'Guavaberry', 'Hackberry', 'Hardy-kiwi', 'Hawthorn', 'Honeydew', 'Honeysuckle', 'Horned melon', 'Huckleberry', 'Huito', 'Ice Cream Bean', 'Ilama', 'Illawarra Plum', 'Imbe fruit', 'Indian almond', 'Indian Fig', 'Indian Gooseberry', 'Indian jujube', 'Indian Prune', 'Jabotacaba', 'Jackfruit', 'Jambul fruit', 'Japanese Persimmon', 'Jatoba fruit', 'Jelly Palm', 'Jocote', 'Jostaberry', 'Jujube', 'Junglesop', 'Juniper berry', 'Kabosu Fruit', 'Kaffir lime', 'Kahikatea', 'Kakadu plum', 'Kapok', 'Karkalla', 'Karonda', 'Kei apple', 'Kepel', 'Keule', 'Kiwi', 'Korlan', 'Kumquat', 'Kundong', 'Kutjera', 'Kwai Muk', 'Lablab', 'Lady apple', 'Lakoocha', 'Langsat', 'Lapsi', 'Lardizabala', 'Lemato', 'Lemon aspen', 'Lemons', 'Leucaena', 'Lillypilly', 'Limeberry', 'Limequat', 'Lingonberry', 'Loganberry', 'Loquat', 'Lucuma', 'Lychee', 'Macadamia', 'Madrono', 'Malay Apple', 'Mamey Sapote', 'Mammee Apple', 'Mamoncillo', 'Mandarin', 'Mangaba', 'Mangosteen', 'Manila Tamarind', 'Manoao', 'Ma-praang', 'Maqui', 'Marang', 'Marionberry', 'Marula', 'Mayan Nut', 'Mayapple', 'Maypop', 'Melinjo', 'MelonPear', 'Midyim', 'Miracle fruit', 'Mock Strawberry', 'Monstera Delicisiosa', 'Mora de Castilla', 'Morinda', 'Mountain pepper', 'Mountain Soursop', 'Muscadine', 'Naartjie', 'Nageia', 'Nance', 'Naranjilla', 'Nectacotum', 'Nectarines', 'Neem', 'Nere', 'Nonda plum', 'Nungu', 'Nutmeg', 'Oil Palm', 'Olallieberry', 'Olive', 'Orangelo', 'Oranges', 'Oregon grape', 'Oroblanco', 'Ortanique', 'Otaheite gooseberry', 'Papaya', 'Passion Fruit', 'Peach', 'Peach palm', 'Peanut', 'Pears', 'Pecan', 'Pequi', 'Persian lime', 'Persimmon', 'Peumo', 'Phalsa', 'Physalis Fruit', 'Pigeon pea', 'Pigeon plum', 'Pigface', 'Pili Nut', 'Pine apple', 'Pineberry', 'Pink-flowered Native Raspberry', 'Plum', 'Plumcot', 'Pluot', 'Pomato', 'Pomegranate', 'Pulasan', 'Pummelo', 'Rambutan', 'Rangpur', 'Red Mombin', 'Riberry', 'Rollinia', 'Rose Apple', 'Safou', 'Salak', 'Santol', 'Sapodilla', 'Soncoya', 'Star Apple', 'Star Fruit', 'Strawberry guava', 'Sugar Apple', 'Sweet Orange', 'Sweet Pepper', 'Tamarind', 'Tangelo', 'Tangor', 'Tayberry', 'Tomato', 'Ugli', 'Vanilla', 'Velvet apple', 'Walnut', 'Watermelon', 'Wax jambu', 'White sapote', 'Youngberry', 'Yuzu' }

return {
	size = {
		options = {
			mode = 'method',
			unpk = true,
		},
		tests = {
			{ { nil }, 'table.size(t): t must be a table', {err = true} },
			{ { 1 }, 'table.size(t): t must be a table', {err = true} },
			{ { true }, 'table.size(t): t must be a table', {err = true} },
			{ { 'Sample string' }, 'table.size(t): t must be a table', {err = true} },
			{ { {} }, 0 },
			{ 
				{
					{
						'Apple', 'Apricot', 'Avocado', 'Abiu', 'Acai', 'Acerola', 'Ackee', 
						'Arhat', 'American Mayapple', 'African Cherry Orange', 'Amazon grape', 
						'Araza', 'Alligator apple', 'Ambarella', 'African Cucumber', 
						'African Medlar', 'African Moringa', 'Agave Plant', 'Aizen Fruit', 
						'American Black Elderberry', 'American Chestnut', 'American Hazelnut Shrub', 
						'American Red Raspberry', 'Aprium', 'Atemoya', 'Atherton Raspberry'
					}
				},
				26
			},
			{
				{
					{
						Fruit = {
							'Apple', 'Apricot', 'Avocado', 'Abiu', 'Acai', 'Acerola', 'Ackee', 
							'Arhat', 'American Mayapple', 'African Cherry Orange', 'Amazon grape', 
							'Araza', 'Alligator apple', 'Ambarella', 'African Cucumber', 
							'African Medlar', 'African Moringa', 'Agave Plant', 'Aizen Fruit', 
							'American Black Elderberry', 'American Chestnut', 'American Hazelnut Shrub', 
							'American Red Raspberry', 'Aprium', 'Atemoya', 'Atherton Raspberry'
						},
						Vegetable = {
							'Ahipa', 'Amaranth', 'American groundnut', 'Aonori', 'Arracacha', 
							'Arrowhead elephant ear', 'Arugula', 'Asiatic pennywort', 'Asparagus', 
							'Atibulnak', 'Azuki bean'
						},
					}
				},
				2
			},
			{
				{
					{
						Apple = 'Fruit',
						Apricot = 'Fruit',
						Avocado = 'Fruit',
						Abiu = 'Fruit',
						Acai = 'Fruit',
						Acerola = 'Fruit',
						Ackee = 'Fruit',
						Arhat = 'Fruit',
						['American Mayapple'] = 'Fruit',
						['African Cherry Orange'] = 'Fruit',
						['Amazon grape'] = 'Fruit',
						Araza = 'Fruit',
						['Alligator apple'] = 'Fruit',
						Ambarella = 'Fruit',
						['African Cucumber'] = 'Fruit',
						['African Medlar'] = 'Fruit',
						['African Moringa'] = 'Fruit',
						['Agave Plant'] = 'Fruit',
						['Aizen Fruit'] = 'Fruit',
						['American Black Elderberry'] = 'Fruit',
						['American Chestnut'] = 'Fruit',
						['American Hazelnut Shrub'] = 'Fruit',
						['American Red Raspberry'] = 'Fruit',
						Aprium = 'Fruit',
						Atemoya = 'Fruit',
						['Atherton Raspberry'] = 'Fruit'
					}
				},
				26
			},
			{
				{
					{
						Apple = nil,
						Apricot = nil,
						Avocado = nil,
						Abiu = nil,
						Acai = nil,
						Acerola = nil,
						Ackee = nil,
						Arhat = nil,
						['American Mayapple'] = nil,
						['African Cherry Orange'] = nil,
						['Amazon grape'] = nil,
						Araza = nil,
						['Alligator apple'] = nil,
						Ambarella = nil,
						['African Cucumber'] = nil,
						['African Medlar'] = nil,
						['African Moringa'] = nil,
						['Agave Plant'] = nil,
						['Aizen Fruit'] = nil,
						['American Black Elderberry'] = nil,
						['American Chestnut'] = nil,
						['American Hazelnut Shrub'] = nil,
						['American Red Raspberry'] = nil,
						Aprium = nil,
						Atemoya = nil,
						['Atherton Raspberry'] = nil
					}
				},
				0
			},
			{
				{
					{
						'Apple',
						Apricot = 'Fruit',
						Avocado = 'Fruit',
						Abiu = 'Fruit',
						Acai = 'Fruit',
						'Acerola',
						Ackee = 'Fruit',
						Arhat = 'Fruit',
						'American Mayapple',
						['African Cherry Orange'] = 'Fruit',
						['Amazon grape'] = 'Fruit',
						Araza = 'Fruit',
						['Alligator apple'] = 'Fruit',
						'Ambarella',
						['African Cucumber'] = 'Fruit',
						['African Medlar'] = 'Fruit',
						['African Moringa'] = 'Fruit',
						['Agave Plant'] = 'Fruit',
						['Aizen Fruit'] = 'Fruit',
						['American Black Elderberry'] = 'Fruit',
						['American Chestnut'] = 'Fruit',
						['American Hazelnut Shrub'] = 'Fruit',
						'American Red Raspberry',
						Aprium = 'Fruit',
						Atemoya = 'Fruit',
						['Atherton Raspberry'] = 'Fruit'
					}
				},
				26
			},
		},
	},
};
```

