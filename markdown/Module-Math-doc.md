---
title: "Module:Math/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Math/doc"
wiki_timestamp: "2021-04-15T16:07:37Z"
---

**Math** is an extension of the math STL, containing additional functionality and support. All Math, non-[STL](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Math_library), functions are capable of evaluating mathemetical expression strings and provide friendlier error messages than the default `error()` function. While more powerful than their STL counterparts, Math's functions comes at the cost of performance. If complex math is done within long looping applications or Lua expense needs to be kept low, consider using the STL functions instead.

Math can be invoked directly (`{{#invoke:Math|function|...}}`), invoked from a template (`{{template|function|...}}`), or used within other modules.

All math STL objects can be accessed by adding two underscores before the name, e.g.  
 `math.__abs(-7)` - Original math STL abs function  
 `math.abs(-7)` - Math's abs function with error checking and string evaluation

All bit32 STL objects can be accessed by adding two underscores before the name (without the 'b'), e.g.  
 `math.__xor(1, 0)` - Original bit32 STL bxor function

On this Wiki, Math is used in:

* [Module:Acquisition](/w/Module:Acquisition "Module:Acquisition")
* [Module:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank")
* [Module:Shared](/w/Module:Shared "Module:Shared")
* [Module:Warframes](/w/Module:Warframes "Module:Warframes")
* [Module:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox")
* [Module:Weapons](/w/Module:Weapons "Module:Weapons")
* [Module:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox")
* [Template:Math](/w/Template:Math "Template:Math")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
  + [1.3 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Math|function|input1|input2|...}}`

### Template

In template: `{{#invoke:Math|__main}}`  
In articles: `{{template|function|input1|input2|...}}`

### Module

```lua
local p = {}
local math = require('Module:Math')

local pi = math.pi
local absSTL = math.__abs

local function func(input)
    -- ...
    -- input -> stuff
    -- ...
    return math.eval(stuff)
end
```

## Documentation

### Package items

`math.eval(num)` (function)
:   Evaluates input
:   **Parameter**: `num` The input expression (string)
:   **Returns**: eval(num) (number)

`math.formatnum(num, code, noCommafy)` (function)
:   Evaluates and formats input
:   **Parameters**:

    * `num` The input expression (number, string)
    * `code` A language code | default 'en' (string; optional)
    * `noCommafy` Use comma separators | default false (boolean; optional)
:   **Returns**:

    * formatnum(num) (string)
    * formatnum(num, 'ar') (string)
    * formatnum(num, "", true) (string)
    * etc. (string)

`math.abs(num)` (function)
:   Evaluates input and returns the magnitude
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: abs(num) (number)

`math.acos(num)` (function)
:   Evaluates input and returns the acos
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: acos(num) (number)

`math.add(n, m)` (function)
:   Evaluates inputs and returns the sum
:   **Parameters**:

    * `n` An input value (table, boolean, number, string)
    * `m` A second input value (table, boolean, number, string)
:   **Returns**: add(n, m) (table, boolean, number, string)

`math.asin(num)` (function)
:   Evaluates input and returns the asin
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: asin(num) (number)

`math.atan(num, den)` (function)
:   Evaluates inputs and returns the atan
:   **Parameters**:

    * `num` The input value (number, string)
    * `den` A second input value | default 1 (number, string; optional)
:   **Returns**:

    * atan(num) (number)
    * atan(num / den) (number)

`math.binomial(p, n, r)` (function)
:   Returns the binomial probability of three inputs
:   **Parameters**:

    * `p` The probability of success (string, number)
    * `n` Total number of trials (string, number)
    * `r` Number of successes (string, number)
:   **Returns**: Binomial of p, n, and r (number)

`math.ceil(num)` (function)
:   Evaluates input and returns the ceil
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: ceil(num) (number)

`math.cos(num)` (function)
:   Evaluates input and returns the cos
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: cos(num) (number)

`math.cosh(num)` (function)
:   Evaluates input and returns the cosh
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: cosh(num) (number)

`math.deg(num)` (function)
:   Evaluates input and converts into degrees
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: deg(num) (number)

`math.div(n, m)` (function)
:   Evaluates inputs and returns the quotient
:   **Parameters**:

    * `n` An input value (table, boolean, number, string)
    * `m` A second input value (table, boolean, number, string)
:   **Returns**: div(n, m) (table, boolean, number, string)

`math.ex(frame)` (function)
:   Evaluates inputs and returns the expected value
:   **Parameter**: `frame` inputs (table)
:   **Returns**: Expectation range of inputs (string)

`math.exp(num)` (function)
:   Evaluates input and returns the exp
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: exp(num) (number)

`math.floor(num)` (function)
:   Evaluates input and returns the floor
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: floor(num) (number)

`math.frac(num, factor, epsilon)` (function)
:   Evaluates inputs and returns closest fraction
:   **Parameters**:

    * `num` The input value (number, string)
    * `factor` The value to factor out | default '1' (string; optional)
    * `epsilon` Number of decimal places to be accurate to | default -5 (10^-5) (number, string; optional)
:   **Returns**: Closest fraction in LaTeX (string)

`math.gamma(num)` (function)
:   Evaluates input and returns the factorial
:   **Parameter**: `num` The input value (number, string)
:   **Returns**:

    * (num - 1)! (number)
    * (num - 1)! scientific notation if larger than 107 (string)

`math.gcd(num1, num2)` (function)
:   Evaluates inputs and return greatest common divider
:   **Parameters**:

    * `num1` The first input value (number, string)
    * `num2` The second input value (number, string)
:   **Returns**: GCD(num1, num2) (number)

`math.ln(num)` (function)
:   Evaluates input and returns the natural log
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: ln(num) (number)

`math.log(num, base)` (function)
:   Evaluates inputs and returns the log (base x)
:   **Parameters**:

    * `num` The input value (number, string)
    * `base` The logarithm base | default 10 (number, string; optional)
:   **Returns**:

    * log(num) (number)
    * log(num, base) (number)

`math.max(nums)` (function)
:   Evaluates inputs and returns the maximum value
:   **Parameter**: `nums` The input values (table)
:   **Returns**:

    * max(num1, num2, num3, ...) (number)
    * max(nums) (number)

`math.min(nums)` (function)
:   Evaluates inputs and returns the minimum value
:   **Parameter**: `nums` The input values (table)
:   **Returns**:

    * min(num1, num2, num3, ...) (number)
    * min(nums) (number)

`math.mod(num, den)` (function)
:   Evaluates inputs and returns the modulo
:   **Parameters**:

    * `num` The dividend (number, string)
    * `den` The divider (number, string)
:   **Returns**: num % den (number)

`math.modf(num)` (function)
:   Evaluates input and returns the integral, fractional, or both parts
:   **Parameters**:

    * `num` The input value (number, string)
      + `frame.int` Returns the integer | default false (boolean; optional)
      + `frame.dec` Returns the decimal | default true (boolean; optional)
:   **Returns**:

    * modf(num) (number)
    * modf(num, int=true) (number)
    * modf(num, int=true, dec=true) (returns both) (number)

`math.mul(n, m)` (function)
:   Evaluates inputs and returns the product
:   **Parameters**:

    * `n` An input value (table, boolean, number, string)
    * `m` A second input value (table, boolean, number, string)
:   **Returns**: mul(n, m) (table, boolean, number, string)

`math.ncr(n, r)` (function)
:   Evaluates inputs and returns the combitorial
:   **Parameters**:

    * `n` The input value (number, string)
    * `r` The second input value (number, string)
:   **Returns**: nCr(n, r) (number)

`math.ng(frame)` (function)
:   Evaluates inputs and returns the nearly guaranteed value
:   **Parameter**: `frame` Inputs (table)
:   **Returns**: Nearly guaranteed range of inputs (string)

`math.npr(n, r)` (function)
:   Evaluates inputs and returns the permutation
:   **Parameters**:

    * `n` The input value (number, string)
    * `r` The second input value (number, string)
:   **Returns**: nPr(n, r) (number)

`math.percentage(num)` (function)
:   Evaluates inputs and returns as a percent
:   **Parameter**: `num` The input value (number)
:   **Returns**: number represented as a percentage (string)

`math.pow(base, exponent)` (function)
:   Evaluates inputs and returns the power of one to the other
:   **Parameters**:

    * `base` The input value (number, string)
    * `exponent` The second input value (number, string)
:   **Returns**: baseexponent (number)

`math.rad(num)` (function)
:   Evaluates input and converts into radians
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: rad(num) (number)

`math.rand(low, upp)` (function)
:   Evaluates input and converts into radians
:   **Parameters**:

    * `low` The lower bound of random values | default 0 (number, string; optional)
    * `upp` The upper bound of random values | default 1 or low if it exists (number, string; optional)
      + `frame.seed` The seed to randomize from | default current OS time (number, string; optional)
:   **Returns**:

    * rand() [0 - 1] (number)
    * rand(low) [0 - low] (number)
    * rand(low, upp) [low - upp] (number)
    * rand(seed = 0) (number)
    * etc. (number)

`math.replace(str)` (function)
:   Replaces and deletes all non-expression characters in a string
:   **Parameter**: `str` expression (string)
:   **Returns**: An evaluatable expression (string)

`math.replaceWithSymbol(str)` (function)
:   Replaces constants with their symbol
:   **Parameter**: `str` expression (string)
:   **Returns**: #e, #gamma, #phi, and #pi replaced with e, γ, φ, and π (string)

`math.round(num, multiple, percent, degree)` (function)
:   Evaluates input and rounds to specified multiple
:   **Parameters**:

    * `num` The input value (number, string)
    * `multiple` The multiple to round to | default 0.0001 (number, string; optional)
    * `percent` Convert input from decimal to percentage | default false (boolean; optional)
    * `degree` Convert input into degrees | default false (boolean; optional)
:   **Returns**:

    * round(num) (string)
    * round(num, 0.125) (string)
    * round(num, "", true, false) (string)
    * etc. (string)

`math.sin(num)` (function)
:   Evaluates input and returns the sin
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: sin(num) (number)

`math.sinh(num)` (function)
:   Evaluates input and returns the sinh
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: sinh(num) (number)

`math.sqrt(num)` (function)
:   Evaluates input and returns the sqrt
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: sqrt(num) (number)

`math.sub(n, m)` (function)
:   Evaluates inputs and returns the difference
:   **Parameters**:

    * `n` An input value (table, boolean, number, string)
    * `m` A second input value (table, boolean, number, string)
:   **Returns**: sub(n, m) (table, boolean, number, string)

`math.sum(nums)` (function)
:   Evaluates inputs and returns the summation
:   **Parameter**: `nums` inputs (table)
:   **Returns**:

    * sum(num1, num2, num3, ...) (number)
    * sum(nums) (number)

`math.tan(num)` (function)
:   Evaluates input and returns the tan
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: tan(num) (number)

`math.tanh(num)` (function)
:   Evaluates input and returns the tanh
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: tanh(num) (number)

`math.trunc(num)` (function)
:   Evaluates input and returns the truncation
:   **Parameter**: `num` The input value (number, string)
:   **Returns**: trunc(num) (number)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

