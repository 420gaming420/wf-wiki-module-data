---
title: "Module:Yesno/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Yesno/testcases"
wiki_timestamp: "2022-09-23T22:24:51Z"
---

---

```lua
local yesno = require('Module:Yesno')
local ScribuntoUnit = require('Module:ScribuntoUnit')
local suite = ScribuntoUnit:new()

--------------------------------------------------------------------------------
-- Basic tests
--------------------------------------------------------------------------------

function suite:testYes()
	self:assertEquals(true, yesno('yes'))
end

function suite:testY()
	self:assertEquals(true, yesno('y'))
end

function suite:testTrueText()
	self:assertEquals(true, yesno('true'))
end

function suite:testTrue()
	self:assertEquals(true, yesno(true))
end

function suite:testOneText()
	self:assertEquals(true, yesno('1'))
end

function suite:testOne()
	self:assertEquals(true, yesno(1))
end

function suite:testNo()
	self:assertEquals(false, yesno('no'))
end

function suite:testN()
	self:assertEquals(false, yesno('n'))
end

function suite:testFalseText()
	self:assertEquals(false, yesno('false'))
end

function suite:testFalse()
	self:assertEquals(false, yesno(false))
end

function suite:testZero()
	self:assertEquals(false, yesno(0))
end

function suite:testZeroText()
	self:assertEquals(false, yesno('0'))
end

function suite:testNil()
	self:assertEquals(nil, yesno(nil))
end

--------------------------------------------------------------------------------
-- Capitalisation tests
--------------------------------------------------------------------------------

function suite:testYesCaps()
	self:assertEquals(true, yesno('Yes'))
	self:assertEquals(true, yesno('YES'))
	self:assertEquals(true, yesno('yEs'))
end

function suite:testYCaps()
	self:assertEquals(true, yesno('Y'))
end

function suite:testTrueTextCaps()
	self:assertEquals(true, yesno('True'))
	self:assertEquals(true, yesno('TRUE'))
	self:assertEquals(true, yesno('trUE'))
end

function suite:testNoCaps()
	self:assertEquals(false, yesno('No'))
	self:assertEquals(false, yesno('NO'))
	self:assertEquals(false, yesno('nO'))
end

function suite:testNCaps()
	self:assertEquals(false, yesno('N'))
end

function suite:testFalseTextCaps()
	self:assertEquals(false, yesno('False'))
	self:assertEquals(false, yesno('FALSE'))
	self:assertEquals(false, yesno('fALSe'))
end

--------------------------------------------------------------------------------
-- Number conversion tests
--------------------------------------------------------------------------------

function suite:testOneTextConversion()
	self:assertEquals(true, yesno('1.0'))
	self:assertEquals(true, yesno('001'))
end

function suite:testZeroTextConversion()
	self:assertEquals(false, yesno('0.0'))
	self:assertEquals(false, yesno('000'))
end

--------------------------------------------------------------------------------
-- Test no default set
--------------------------------------------------------------------------------

function suite:testStringNoDefault()
	self:assertEquals(nil, yesno('foo'))
end

function suite:testNumberNoDefault()
	self:assertEquals(nil, yesno(100))
end

function suite:testTableNoDefault()
	self:assertEquals(nil, yesno({}))
end

function suite:testFunctionNoDefault()
	self:assertEquals(nil, yesno(function() return true end))
end

function suite:testBlankStringNoDefault()
	self:assertEquals(nil, yesno(''))
end

--------------------------------------------------------------------------------
-- Test default set
--------------------------------------------------------------------------------

function suite:testStringDefaultSet()
	self:assertEquals('default', yesno('foo', 'default'))
end

function suite:testNumberDefaultSet()
	self:assertEquals('default', yesno(100, 'default'))
end

function suite:testTableDefaultSet()
	self:assertEquals('default', yesno({}, 'default'))
end

function suite:testFunctionDefaultSet()
	self:assertEquals('default', yesno(function() return true end, 'default'))
end

function suite:testBlankStringDefaultSet()
	self:assertEquals('default', yesno('', 'default'))
end

--------------------------------------------------------------------------------
-- Test default precedence with true, false, and nil
--------------------------------------------------------------------------------

function suite:testYesDefaultPrecedence()
	self:assertEquals(true, yesno('yes', 'default'))
end

function suite:testYDefaultPrecedence()
	self:assertEquals(true, yesno('y', 'default'))
end

function suite:testTrueTextDefaultPrecedence()
	self:assertEquals(true, yesno('true', 'default'))
end

function suite:testTrueDefaultPrecedence()
	self:assertEquals(true, yesno(true, 'default'))
end

function suite:testOneTextDefaultPrecedence()
	self:assertEquals(true, yesno('1', 'default'))
end

function suite:testOneDefaultPrecedence()
	self:assertEquals(true, yesno(1, 'default'))
end

function suite:testNoDefaultPrecedence()
	self:assertEquals(false, yesno('no', 'default'))
end

function suite:testNDefaultPrecedence()
	self:assertEquals(false, yesno('n', 'default'))
end

function suite:testFalseTextDefaultPrecedence()
	self:assertEquals(false, yesno('false', 'default'))
end

function suite:testFalseDefaultPrecedence()
	self:assertEquals(false, yesno(false, 'default'))
end

function suite:testZeroDefaultPrecedence()
	self:assertEquals(false, yesno(0, 'default'))
end

function suite:testZeroTextDefaultPrecedence()
	self:assertEquals(false, yesno('0', 'default'))
end

function suite:testNilDefaultPrecedence()
	self:assertEquals(nil, yesno(nil, 'default'))
end

return suite
```

