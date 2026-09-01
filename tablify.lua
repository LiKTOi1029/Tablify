local Tablify = {}
Tablify.Operations = 
{
  ["NORMAL"] = function(Object, Delimiter)
	if type(Object) == "string" then
	  local ParsingString, ResultingTable, Len = "", {}, Object:len()
	  for Index = 1, Len, 1 do
		local Sub = Object:sub(Index, Index)
		if Index == Len then
		  ParsingString = ParsingString .. Sub
		  ResultingTable[#ResultingTable] = ParsingString
		  ParsingString = nil
		elseif Sub == " " then
		  ResultingTable[#ResultingTable] = ParsingString
		  ParsingString = ""
		else
		  ParsingString = ParsingString .. Sub
		end
	  end
	end
  end
}

function Tablify.Execute(Type, Object, Delimiter)
  if type(Type) ~= "string" then
	io.write("[TABLIFY]: The given type ", Type, " for the object ")
	io.write(tostring(Object), " with the given delimiter ", tostring(Delimiter), " must be a string")
	return false
  end
  Type = Type:upper()
  if Tablify.Operations[Type] then
	return Tablify.Operations[Type](Object, Delimiter)
  else return false end
end

return Tablify