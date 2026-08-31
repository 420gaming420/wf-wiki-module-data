---
title: "Module:LuaClassSystem/doc"
wiki_url: "https://wiki.warframe.com/w/Module/LuaClassSystem/doc"
wiki_timestamp: "2023-01-05T23:03:30Z"
---

**LuaClassSystem** (LCS) is a Lua library for emulating some features of object-oriented programming (classes, inheritance) on top of Lua. The version used on [Leaguepedia](https://lol.fandom.com/wiki/Module:LuaClassSystem) is derived from [the original version on GitHub](https://github.com/Yonaba/Lua-Class-System) that hasn't been maintained since mid-2014.

## Contents

* [1 User documentation](#User_documentation)
  + [1.1 System requirements](#System_requirements)
  + [1.2 Importing](#Importing)
  + [1.3 Creating classes](#Creating_classes)
    - [1.3.1 Instance constructors](#Instance_constructors)
    - [1.3.2 Declaring methods](#Declaring_methods)
    - [1.3.3 Reserved names](#Reserved_names)
  + [1.4 Extending classes](#Extending_classes)
    - [1.4.1 Interacting with superclasses](#Interacting_with_superclasses)
    - [1.4.2 Abstract and final classes](#Abstract_and_final_classes)
  + [1.5 Checking types](#Checking_types)
  + [1.6 Advanced usage](#Advanced_usage)
    - [1.6.1 Types as parameters](#Types_as_parameters)
  + [1.7 Additional considerations](#Additional_considerations)
    - [1.7.1 Cloning](#Cloning)
    - [1.7.2 Two registries](#Two_registries)
* [2 Developer documentation](#Developer_documentation)
  + [2.1 Debug features](#Debug_features)
  + [2.2 Object registry data](#Object_registry_data)
  + [2.3 Class registry data](#Class_registry_data)
  + [2.4 Invariants](#Invariants)
* [3 Dev stories](#Dev_stories)
  + [3.1 Good First Bug](#Good_First_Bug)
  + [3.2 This is Super Fun](#This_is_Super_Fun)
  + [3.3 The Bloodthirster, Blade of the Ruined King... and pineapples, kittens, kittens, kittens!](#The_Bloodthirster,_Blade_of_the_Ruined_King..._and_pineapples,_kittens,_kittens,_kittens!)
* [4 Lua Module Navigation](#Lua_Module_Navigation)

## User documentation

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=1 "Edit section's source code: User documentation")]

This section of the documentation is intended for those who wish to use LCS in their modules.

### System requirements

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=2 "Edit section's source code: System requirements")]

Compatibility with the following environments is intended:

* MediaWiki Scribunto (both standalone Lua and LuaSandbox).
* Non-MediaWiki Lua 5.1 and all newer versions, including other standalone implementations based on these versions (for an incomplete list, see [the one on the LuaUsers wiki](http://lua-users.org/wiki/LuaImplementations)). Please note that none of these environments have yet been tested with the modified version, though they are expected to work because at least some of them work with the original version.

### Importing

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=3 "Edit section's source code: Importing")]

LuaClassSystem should be placed into a separate file (or, when using MediaWiki, a module) and imported with a `require()` call. The value returned by the call is a table with the following functionality:

* `_VERSION` – a string designating the current version of LCS. At the moment it's equal to `2.1.1`.
* `class` ([details](#Creating_classes)) – a table with the functionality to create new classes:
  + field `abstract` – a class constructor that creates an abstract class. Attempting to instantiate an abstract class is an error.
  + field `final` – a class constructor that creates a final class. Attempting to inherit from a final class is an error.
  + The table `class` itself is also callable as a class constructor that creates a regular class, i. e. one that is neither abstract nor final.
* `instanceOf` ([details](#Type_checking)) – a function that checks whether an object belongs to a given class. See [the documentation for `instanceOf`](#instanceOf) for details.
* `xtype` ([details](#Type_checking)) – a function that behaves like the builtin `type`, but returns `"object"` or `"class"` for LCS values. See [the documentation for `xtype`](#xtype) for details.
* `isObject` ([details](#Type_checking)) – a function that returns `true`/`false` depending on whether it is provided an LCS object.
* `isClass` ([details](#Type_checking)) – a function that returns `true`/`false` depending on whether it is provided an LCS class.
* `debug` – features intended to be used by people developing LCS itself. **They are not intended for non-developers.**

In code examples provided in the documentation, the table as listed above is referenced by the variable `LCS`. This can be achieved in Scribunto like: `local LCS = require("Module:LuaClassSystem")`.

### Creating classes

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=4 "Edit section's source code: Creating classes")]

LuaClassSystem can create base classes by means of any of the three class constructors:

* `LCS.class`, which produces a regular class.
* `LCS.class.abstract`, which produces an *abstract class* that can't be instantiated.
* `LCS.class.final`, which produces a *final class* that can't be extended.

All of the three class constructors are callable values with the same syntax. Class constructors may optionally accept a *member table* that will be used as the base for the class itself and all of its instances. The member table for the class is a deep copy of the one provided to the class constructor, and instances are created as deep copies of the class. Deep copies created in this manner copy references to LCS objects or classes instead of cloning the objects or classes. The member table may not contain functions directly.

The following code creates a class:

```lua
local MyClass = LCS.class()
```

#### Instance constructors

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=5 "Edit section's source code: Instance constructors")]

To create an instance of a class, use the `:new()` method of the class or call the class directly.

```lua
local MyClass = LCS.class()

-- These are functionally identical, and the former internally falls back to the latter.
local object1 = MyClass()
local object2 = MyClass:new()
```

You can have an instance constructor for a class that does more than merely creates an empty instance. For example, such a constructor could initialize some fields of the class. To do that, declare an `:init()` method for the class.

The `:init()` method is called as part of the `:new()` method, receives all values passed to `:new()`, and should not return any values. (Any values returned by `:init()` implementations will be ignored.) **Do not override the `:new()` method itself. See [Reserved names](#Reserved_names) for more information.**

The following code creates a class, declares a custom constructor for a class, and uses it to initialize a field.

```lua
local MyClass = LCS.class()

function MyClass:init(length)
    local length = tonumber(length) or 0
    
    self.array = {}
    for i = 1, length do
        self.array[i] = math.sqrt(i)
    end
end

local object1 = MyClass:new(4)
print(object1.array[2]) -- prints sqrt(2), approximately 1.414
print(object1.array[4]) -- prints 2
```

#### Declaring methods

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=6 "Edit section's source code: Declaring methods")]

Methods are declared on classes in the same manner as seen above with `init`.

```lua
local MyClass = LCS.class()

function MyClass:init()
    self.value = 10
end

function MyClass:runCountdownTick()
    if self.value > 0 then
        self.value = self.value - 1
    end
    
    return self.value
end

function MyClass:isReady()
    return self.value == 0
end

function MyClass:reset()
    self.value = 10
end

local object = MyClass:new()
for i = 1, 8 do
    object:runCountdownTick()
end
-- value is now 2

local one = object:runCountdownTick()
local zero = object:runCountdownTick()
assert(object:isReady())

object:reset() -- back to 10
```

#### Reserved names

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=7 "Edit section's source code: Reserved names")]

Some built-in class fields rely on internal functionality and/or implement such functionality. If users set these fields to other values, such functionality is likely to break, causing runtime errors. Classes should not have elements with the following names:

* `new`: used for instance creation.
* `extends`, `abstractExtends`, `finalExtends`: used for extending classes (see below).
* `super`: used when calling original versions of methods from superclasses.
* `getClass`, `getSubClasses`: built-in functionality.
* `__index`, `__call`: reserved metamethods, used for class system functionality.

### Extending classes

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=8 "Edit section's source code: Extending classes")]

Subclassing (inheritance) allows having a single source of shared functionality between multiple classes where the subclasses are "subtypes" of the base type. For example, this is a common approach in GUI libraries where "Component" or such is the base class that implements functionality common to all GUI components, and every subclass ("Button", "Image", "ScrollPane"...) implements its own functionality in addition to the common features.

Lua does not implement classes and inheritance natively (why libraries like LCS are needed), but it does implement features useful in construction of class systems (the `:method()` syntactic sugar, `__index` metamethods, and maybe others).

To create a subclass, call the `:extends()` method on the base class. The method takes an optional "member table" with functionality identical to that of class constructors.

```lua
local BaseClass = LCS.class()

local DerivedClass = BaseClass:extends()
```

Derived classes (subclasses) do not clone class fields. Methods and fields not specified in the subclass are accessible from the superclass via an `__index` fallback. Modifications performed to table fields through a subclass are replicated in superclasses:

```lua
local BaseClass = LCS.class()
BaseClass.values = {1, 2, 3}

function BaseClass:sum()
    local sum = 0
    for _, v in ipairs(self.values) do
        sum = sum + v
    end
    
    return sum
end

print(BaseClass:new():sum()) -- prints 6

local DerivedClass = BaseClass:extends()
table.insert(DerivedClass.values, 4)

print(DerivedClass:new():sum()) -- prints 10. Note that :sum() is not defined in the derived class
print(BaseClass:new():sum()) -- ...also prints 10 now
```

#### Interacting with superclasses

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=9 "Edit section's source code: Interacting with superclasses")]

Subclasses often override methods defined in their superclasses, and also need defer to the original implementation. This is what the `:super()` method is for.

Unlike some other Lua class system implementations, LCS does not require to retain a reference to the superclass to call an original version of a method from that superclass. Syntax like `SuperClass.super(self:method(args))` isn't needed and is replaced with `self:super('method', args)`. While using the function name (as a key to the superclass) as a string might look less aesthetically pleasing, it should be noted that in Lua, `.field` is syntactic sugar for `['field']`.

```lua
local Counter = LCS.class()

function Counter:init()
    self.value = 0
end

local DoubleCounter = Counter:extends()

function DoubleCounter:init()
    self:super('init')
    self.value2 = 0
end
```

Passing a method name that isn't overridden in the inheritance chain for the calling class is invalid. This is likely to produce an error.

```lua
local Counter = LCS.class()

function Counter:init()
    self.value = 0
end

local DoubleCounter = Counter:extends()

function DoubleCounter:init()
    self:super('meow') -- no cats involved (sadly), so Lua just crashes.
    self.value2 = 0
end
```

If the original method isn't overridden, there is no need to use `:super()`, and the method can be called directly.

#### Abstract and final classes

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=10 "Edit section's source code: Abstract and final classes")]

A feature inspired by some class system implementations such as the one in Java, abstract and final classes restrict some inheritance-related behavior.

Abstract classes do not allow creation of instances. To create an abstract class, use `LCS.class.abstract()`. To make a derived abstract class, use `BaseClass:abstractExtends()`. Note that the base class does not need to be abstract in the latter case.

Final classes do not allow creation of subclasses. To create a final class, use `LCS.class.final()`. To make a derived final class, use `BaseClass:finalExtends()`.

For hopefully obvious reasons, a class cannot be both abstract and final. It should not be possible to make such a class, but if one is made, the program is considered to be in an invalid state.

### Checking types

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=11 "Edit section's source code: Checking types")]

LCS exports some functions for checking types of objects in an LCS-aware manner.

`LCS.instanceOf` allows to check whether a given object is an instance of a given class or its direct or indirect superclass.

```lua
local Animal = LCS.class()
local Feline = Animal:extends()
local Cat = Feline:extends()
local Tiger = Feline:extends()

local flash = Cat()
assert(LCS.instanceOf(flash, Animal))
assert(LCS.instanceOf(flash, Feline))
assert(LCS.instanceOf(flash, Cat))
assert(not LCS.instanceOf(flash, Tiger))
```

`LCS.xtype` stands for e**x**tended `type` and works like `type()`, but returns `"object"` or `"class"` instead of `"table"` for known LCS objects and classes.

`LCS.isObject` and `LCS.isClass` return boolean values for whether the given value is a known LCS object or class respectively.

### Advanced usage

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=12 "Edit section's source code: Advanced usage")]

There are some nontrivial possibilities allowed by LCS. Here are some of them.

#### Types as parameters

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=13 "Edit section's source code: Types as parameters")]

An LCS class can accept another LCS class as a parameter and expect to be able to perform some operations with instances of that class. While not enforced in any way by LCS itself, this offers the possibility for informal "interface"/"trait" specifications. Alternatively, the parameter class may be expected to be a subclass of some superclass, the functionality of which is then used. Compare it to `T implements Interface` and `T extends BaseClass` in Java terminology.

### Additional considerations

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=14 "Edit section's source code: Additional considerations")]

#### Cloning

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=15 "Edit section's source code: Cloning")]

General-purpose cloning functions attempt to reconstruct LCS objects in a manner that does not make LCS aware of these new objects. Such cloned objects trigger state validity checks if used with some LCS internal methods. For example, calling `:new()` from a cloned class or `:super()` for a cloned object will cause an error because the class / object is not known to LCS.

`mw.clone()` is known to cause such errors.

LCS exports `LCS.deepCopy`, which is an LCS-aware deep copying / cloning function. References to stored objects or classes are preserved. In addition, this function disregards metatables on any non-LCS values in the original table. This makes it incidentally work on `mw.loadData()` tables (`mw.clone()` breaks on them because of the `__index`/`__newindex`-based write protection), but if any contained tables rely on metatables being preserved for correct operation, `LCS.deepCopy` is unsuitable.

#### Two registries

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=16 "Edit section's source code: Two registries")]

It is invalid for two LCS instances (each with its own registry) to exist simultaneously. This can happen, for example, if LCS is imported twice as two different modules. In such a case, a lot can go wrong, up to the point of the program crashing due to an attempt to deep-copy a recursive object.

## Developer documentation

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=17 "Edit section's source code: Developer documentation")]

### Debug features

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=18 "Edit section's source code: Debug features")]

`debug.isKnownObject`, `debug.isKnownClass`: same as `LCS.isObject` and `LCS.isClass` (but the debug versions came before). The debug versions also give errors if given something other than tables.

### Object registry data

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=19 "Edit section's source code: Object registry data")]

* `__superClass` (class): the class the object is an instance of

### Class registry data

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=20 "Edit section's source code: Class registry data")]

* `__superClass` (class|`false`): the superclass of this class, or `false` if this is a root class
* `__subClass` (map: class → `true`): stores weak references to direct subclasses as indexes so that indexing the table is enough to say whether some other class is a direct subclass of the current class.
* `__abstract` (boolean): `true` if this class is abstract
* `__final` (boolean): `true` if this class is final

### Invariants

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=21 "Edit section's source code: Invariants")]

If any of the following is broken, the LCS state is invalid, which incurs undefined behavior.

* No value may be registered as both a class and an object.
* No registry data value may be of an inappropriate type.
* There may be no inheritance loops.
* No class may be both abstract and final.
* Only one registry may exist in a single Lua state at any given time.
* All LCS classes and objects must be referenced in the LCS registry with valid data.

## Dev stories

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=22 "Edit section's source code: Dev stories")]

### Good First Bug

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=23 "Edit section's source code: Good First Bug")]

...except there wasn't anything good about it.

The first bug discovered with LuaClassSystem was rather damaging because it made some pages give errors that looked like the user was doing something wrong. Yet the code was just about exactly the same in two different pages, one of which worked fine, and the other gave the error. Running the code in the debug console also didn't show any errors.

I was randomly poking around the module for maybe an hour or two and eventually edited out the registry's `__mode` settings, hoping that they weren't the issue. They turned out to be the issue. I wasn't happy.

A bit of an explanation, because the feature I refer to is probably not in the spellbook of almost any Scribunto wizard. Lua uses a garbage collector to keep track of what values are created and which of them are still used. Unlike with manual memory management (like in C), this does not require the programmer to manually `malloc`/`free` in just the right ways to avoid very serious bugs (from memory leaks eventually crashing programs or player characters' heads turning into brown blobs... to anything like major security vulnerabilities). Garbage collection is not suitable for lower-level programming, but for high-level features such as Scribunto it's fine.

With garbage collectors, any object still referenced is considered used and is not collected. (Maybe also with some variations to prevent reference cycles from causing memory leaks.) As the LCS registry keeps track of all objects it creates by referencing them, it means Lua never stops "using" any LCS objects even if they are just tracked in the registry. In other terms, the registry causes a memory leak.

That's why weak references exist. Weak references allow to refer to an object in a manner that doesn't prevent the garbage collector from collecting it. In Lua, weak references are assigned as values of the `__mode` setting in the metatable. The value must be a string: if it contains `k`, the keys in the table are weak, and if it contains `v`, the values are weak. `__mode` may contain either or both letters.

The registry associates references to LCS objects / classes with tables storing internal data. As such, the keys should have been stored as weak references. But the original LCS assigned `__mode` as `v`, and since the internal tables weren't used elsewhere, any garbage collection (an event the programmer cannot predict or observe) wiped out every single entry in the registry, causing data corruption.

So this sequence of events caused an error:

1. User code creates a class.
2. Lua collects garbage. Suddenly the above class isn't a class any more! And the user has no idea.
3. User code attempts to instantiate the class that's no longer a class. LCS has checks against instantiating from non-classes (likely to guard against `Class.new()` instead of `Class:new()`), which get triggered and crash Lua with an error.

Oops.

### This is Super Fun

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=24 "Edit section's source code: This is Super Fun")]

Oh, that one wasn't *really* fun. That time I had to wait until I can mess with the staging environment so that I can safely break everything.

Spent five hours trying to understand why `:super()` wasn't working in some module. Turned out that many lines of code before, the table storing LCS objects got fed to a utility function called `safe` that did... I don't remember what it did, but part of what it did was cloning the table via `mw.clone()`. That turned out rather unsafe instead: the cloned objects weren't recognized as such by LCS, and while they worked normally for regular usage (modifying, calling methods) a `:super()` call down the line exposed the error.

### The Bloodthirster, Blade of the Ruined King... and pineapples, kittens, kittens, kittens!

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=25 "Edit section's source code: The Bloodthirster, Blade of the Ruined King... and pineapples, kittens, kittens, kittens!")]

That one was even worse. Didn't help that resolution was a priority due to active performance issues.

With UCP, Leaguepedia eventually got LuaSandbox to significantly improve Scribunto performance. Esports wikis had to delay LuaSandbox rollout due to an issue with a module producing incorrect output.

At first glance, `__ipairs`, a Lua 5.2 feature backported by Scribunto devs to the 5.1 baseline, stopped working. Yet after further investigation it became clear it stopped working only in some specific scenario.

I had the possibility of using a hacky workaround to maybe stop the issue, but:

1. the issue wouldn't be gone,
2. the workaround would have been tailored to one specific Leaguepedia module and might have caused other issues I wouldn't be able to easily detect.

So I tried poking around, like in the last case. I eventually hit upon that inheritance breaks `__ipairs`, and later that the `__ipairs` metamethod wasn't in the metatable itself, but with LCS, that metatable itself had a metatable, and the `__index` fallback for the first metatable had `__ipairs`. In other terms, originally with LuaStandalone the `__ipairs` backport used something like `(getmetatable(t) or {}).__ipairs`, while LuaSandbox used something like `rawget(getmetatable(t) or {}, '__ipairs')`. At the same time, LCS didn't propagate metavalues to subclasses, and so it quietly relied on non-`rawget` access to `__ipairs` to work.

I thought it was an error in LuaSandbox at first, but I consulted Lua docs, and found out metatable access must be raw. I admit I didn't know of that before, like I didn't know of a use for `__mode` before that first LCS issue.

By the way, this LCS-free snippet allows to check whether your interpreter has this problem:

```lua
function test()
    local base = {}
    base.__index = base
    base.__ipairs = function(self)
        local i = 0
        return function()
            i = i + 1
            local value = self.values[i]
            if value then return i, value; end
        end
    end

    local derived = {}
    derived.__index = base
    setmetatable(derived, base)

    local instance = { values = {100, 20, 3} }
    setmetatable(instance, derived)

    local sum = 0
    for i, v in ipairs(instance) do
        sum = sum + v
    end

    return sum
end

print(test()) -- if using Scribunto, works only in the debug console
```

This might *look* like it should print `123`, but it's wrong: because of the `rawget` requirement, the code should print `0`. If it prints `123`, watch out.

As an extra note, I found out this line: `base.__index = base` is needed to actually replicate LCS behavior and reproduce the issue. However, note that it makes `base` recursive. When debugging the issue, a mistake caused the creation of two simultaneous LuaClassSystem instances with two registries, something I predicted was the issue with the `clone` bug above (it wasn't; it can only happen if LCS is in two separate modules at the same time). This time it was, and I suspect due to some deep-cloning involved (and LCS' `deepCopy` not having any recursion protection, and relying on the registry being valid), it overflowed all available memory, crashing the interpreter.

## Lua Module Navigation

[[edit source](/w/Module:LuaClassSystem/doc?action=edit&section=26 "Edit section's source code: Lua Module Navigation")]

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

