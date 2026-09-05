local Tablify = {}
Tablify.Operations = 
{
  ["NORMAL"] = function(Object, Delimiter)
	if type(Object) == "string" then
	  local ParsingString, ResultingTable, Len = "", {}, Object:len()
	  Delimiter = tostring(Delimiter)
	  for Index = 1, Len, 1 do
		local Sub = Object:sub(Index, Index)
		if Index == Len then
		  ParsingString = ParsingString .. Sub
		  ResultingTable[Index] = ParsingString
		  ParsingString = nil
		elseif Sub == Delimiter then
		  ResultingTable[Index] = ParsingString
		  ParsingString = ""
		else
		  ParsingString = ParsingString .. Sub
		end
	  end
	  return ResultingTable
	elseif type(Object) == "number" then
	  local ParsingString, ResultingTable, Object = "", {}, tostring(Object)
	  Delimiter = tostring(Delimiter)
	  local Len = Object:len()
	  for Index = 1, Len, 1 do
		local Sub = Object:sub(Index, Index)
		if Index == Len then
		  ParsingString = ParsingString .. Sub
		  ResultingTable[Index] = tonumber(ParsingString)
		  ParsingString = nil
		elseif Sub == Delimiter then
		  ResultingTable[Index] = ParsingString
		  ParsingString = ""
		else
		  ParsingString = ParsingString .. Sub
		end
	  end
	  return ResultingTable
	end
	
	return false -- There are no matching Object types for Type input
  end,
  ["INDIVIDUAL"] = function(Object)
	if type(Object) == "string" then 
	  local ParsingString, ResultingTable, Object = "", {}, tostring(Object)
	  local Len = Object:len()
	  for Index = 1, Len, 1 do
		local Sub = Object:sub(Index, Index)
		ResultingTable[Index] = Sub
	  end
	  return ResultingTable
	elseif type(Object) == "number" then
	  local ParsingString, ResultingTable, Object = "", {}, tostring(Object)
	  local Len = Object:len()
	  for Index = 1, Len, 1 do
		local Sub = tonumber(Object:sub(Index, Index))
		ResultingTable[Index] = Sub
	  end
	  return ResultingTable
	end
	
	return false -- There are no matching Object types for Type input
  end,
}

function Tablify.Execute(Type, Object, Delimiter)
  if type(Type) ~= "string" then
	io.write("[TABLIFY]: The given type ", Type, " for the object ")
	io.write(tostring(Object), " with the given delimiter ", tostring(Delimiter), " must be a string")
	return false
  end
  Type = Type:upper()
  if Tablify.Operations[Type] then
	if Delimiter then return Tablify.Operations[Type](Object, Delimiter)
	else Tablify.Operations[Type](Object) end
  else return false end
end

return Tablify