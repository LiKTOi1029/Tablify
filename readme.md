# Tablify
The Tablify module is a lua module that converts any given object with a (sometimes optional, sometimes not) 
delimiter and converts it into a table. Then it returns said table. This is used to cut down on programming 
time. If the Tablify operation fails for any reason, it will return the boolean value `false`.

## Usage
Implementing `tablify.lua` is extremely easy. You just `require` it in your script
```lua
local Tablify = require("tablify")
```
There is only one command in the entire Tablify module, `Tablify.Execute(Type, Object, Delimiter)`.

## Tablify.Execute
```lua
Tablify.Execute(Type, Object, Delimiter)
```
The `Type` parameter is always a string type. It tells the Tablify module *how* you want to convert an object 
into a table. Do you want it to just tablify character by character or do you want it to look for a specific 
delimiter (the delimiter as previously mentioned is not always required, sometimes it's an optional or totally 
irrelevant, unused value).\
\
The `Object` parameter is the object to convert to a table. This can be of any type except table and boolean type. 
As of right now, Tablify only converts other types into table types. Boolean types are also inconvenient to 
convert to table type as I do not believe there is any practical use to such function.\
\
The `Delimiter` parameter is the delimiter to use when converting the `Object` to a table. The `Delimiter` is 
only used depending on what kind of `Type` is being used. The `Delimiter` likewise is not included in the 
table conversion. It is a character that is discarded during conversion of any given `Object` and instead used 
to separate one part of `Object` from another part. Here is an example.\
\
Code:
```lua
local Tablify = require("tablify")
local Tablified = Tablify.Execute("NORMAL", "Hi;There", ";")
io.write(Tablified[1], "\t", Tablified[2])
```
Output: 
```
Hi	There
```
The return value is `false` if the tablification failed and the return value is of type `table` if the 
tablification succeeded.
## Types
These are all of the currently implemented types. Each type will have its own separate, individual explanation 
so as to make it easier to use this readme.md as a documentation in of itself.
### NORMAL
This type takes a mandatory `Delimiter` and `Object`. The `Object` must be either of type `number` or `string` 
and the `Delimiter` must be of either `number` type or `string` type. Be warned, the script automatically 
converts `Delimiter` data-type to correspond to `Object` data-type I.E. if `Object` is of `string` type, then 
`Delimiter` is converted into `string` type as well.\
Code: 
```lua
local Tablify = require("tablify")
local String = "This is a string"
local TablifiedString = Tablify.Execute("NORMAL", String, " ") -- Removes all instances of space and converts to table
local Integer = 163656
local TablifiedInteger = Tablify.Execute("NORMAL", Integer, 6) -- Removes all instances of 6 and converts to table
-- Now printing out all of the values
for i, v in ipairs(TablifiedString) do
  io.write(i, " : ", v, "\n")
end
for i, v in ipairs(TablifiedInteger) do
  io.write(i, " : ", v, "\n")
end
```
Output: 
```
1 : This
2 : is
3 : a
4 : string
1 : 1
2 : 3
3 : 5
```
Returns `false` if failed and returns Tablified `Object` if successful.
### individual
This type takes a mandatory `Object` and no `Delimiter`. The `Object` must be either of type `number` or `string` 
Code:
```lua
local Tablify = require("tablify")
local String = "Hello"
local TablifiedString = Tablify.Execute("INDIVIDUAL", String)
local Integer = 3.1415
local TablifiedInteger = Tablify.Execute("INDIVIDUAL", Integer)
-- Now printing out all of the values
for i, v in ipairs(TablifiedString) do
  io.write(i, " : ", v, "\n")
end
for i, v in ipairs(TablifiedInteger) do
  io.write(i, " : ", v, "\n")
end
```
Output:
```
1 : H
2 : e
3 : l
4 : l
5 : o
1 : 3
2 : .
3 : 1
4 : 4
5 : 1
6 : 5
```
Returns `false` if failed and returned Tablified `Object` if successful.