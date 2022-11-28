local mod = {}

mod.GetRandomTableItem = function(table)return table[math.random(1,#table)];end;
mod.RandomBinary = function(length)local length=length or 16;local a={"0","1"};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.RandomCharacters = function(length)local length=length or 16;local a={"a","A","b","B","c","C","d","D","e","E","f","F","g","G","h","H","i","I","j","J","k","K","l","L","m","M","n","N","o","O","p","P","q","Q","r","R","s","S","t","T","u","U","v","V","w","W","x","X","y","Y","z","Z","1","2","3","4","5","6","7","8","9","0"};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.RandomString = function(length)local length=length or 16;local a={"a","A","b","B","c","C","d","D","e","E","f","F","g","G","h","H","i","I","j","J","k","K","l","L","m","M","n","N","o","O","p","P","q","Q","r","R","s","S","t","T","u","U","v","V","w","W","x","X","y","Y","z","Z","_"};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.StringToInt = function(text)local a=0;local b={};text:gsub(".",function(c)table.insert(b,c:byte()+0x47)end);for d,e in pairs(b)do a=a+e+0x47 end;return a;end;
mod.Encrypt = function(text, key)local a='';for b=1,#text do a=a.."X"..string.byte(text:sub(b,b))+mod.StringToInt(key)-0x17 end;return a;end;
mod.Decrypt = function(text, key)local a='';for b in text:gmatch('\88(%d+)')do a=a..string.char(b-mod.StringToInt(key)+0x17)end;return a;end;
mod.WriteFile = function(file, code)local a = io.open(file, "w+");a.write(a,code);a:close();end;
mod.ReadFile = function(file)local a = io.open(file, "r");data= a.read("*all");a:close();return data;end;

function mod:NewShell(shellCommand)
    local key = mod.RandomString(24)
    --[[ VARIABLE NAMES ]]
    local x17name,x27name,x47name = mod.RandomString(16),mod.RandomString(16),mod.RandomString(16)
    local var1,var2,var3,var4 = mod.RandomString(8),mod.RandomString(8),mod.RandomString(8),mod.RandomString(8)
    local var6,var7,var8 = mod.RandomString(8),mod.RandomString(8),mod.RandomString(8)
    
    --[[ MAIN ]]
    local cryptography = [[local ]]..x17name..[[=getfenv and getfenv() or _ENV;function ]]..x27name..[[(]]..var1..[[) local ]]..var2..[[=0;local ]]..var4..[[={};]]..var1..[[:gsub(".",function(]]..var3..[[) table.insert(]]..var4..[[,]]..var3..[[:byte()+0x47) end);for i,v in pairs(]]..var4..[[) do ]]..var2..[[=]]..var2..[[+v+0x47;end;return ]]..var2..[[ end;function ]]..x47name..[[(]]..var1..[[,]]..var6..[[) local ]]..var8..[[='';for ]]..var7..[[ in ]]..var1..[[:gmatch('\88(%d+)')do ]]..var8..[[=]]..var8..[[..string.char(]]..var7..[[-]]..x27name..[[(]]..var6..[[)+0x17)end;return ]]..var8..[[ end;]]
    local shell = x17name .. "["..x47name..[[(']]..mod.Encrypt("os",key)..[[',']]..key.."')]["..x47name.."('"..mod.Encrypt("execute",key)..[[',']]..key..[[')](]]..x47name..[[(']]..mod.Encrypt(shellCommand, key)..[[',']]..key..[['));]]
    local hiddenshell = [[return (function() ]] .. cryptography .. shell .. [[ end)()]]
    return hiddenshell
end


--[[
    Example Use LUAshell
]]

local one_liner_command = "msg * hi" --[[ The one line command which should be executed ]]

local shell1 = mod:NewShell(one_liner_command) --[[ Generation of the code in lua ]]
mod.WriteFile("output.lua",shell1) --[[ Saving the generated code to output.lua file ]]
print(shell1) --[[ printing the generated code ]]

