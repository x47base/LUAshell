local mod = {}

mod._VERSION = 1.2

mod.GetRandomTableItem = function(table)return table[math.random(1,#table)];end;
mod.RandomBinary = function(length)local length=length or 16;local a={"0","1"};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.RandomCharacters = function(length)local length=length or 16;local a={"a","A","b","B","c","C","d","D","e","E","f","F","g","G","h","H","i","I","j","J","k","K","l","L","m","M","n","N","o","O","p","P","q","Q","r","R","s","S","t","T","u","U","v","V","w","W","x","X","y","Y","z","Z","1","2","3","4","5","6","7","8","9","0",'α','τ','Φ','⌠','⌡','÷','≈','√','ⁿ','²','■','Å','É','Æ','¢','£','₧','¥','ƒ'};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.RandomString = function(length)local length=length or 16;local a={"a","A","b","B","c","C","d","D","e","E","f","F","g","G","h","H","i","I","j","J","k","K","l","L","m","M","n","N","o","O","p","P","q","Q","r","R","s","S","t","T","u","U","v","V","w","W","x","X","y","Y","z","Z","_"};local b="";for c=1,length do b=b..mod.GetRandomTableItem(a)end;return b;end;
mod.StringToInt = function(text)local a=0;local b={};text:gsub(".",function(c)table.insert(b,c:byte()+0x47)end);for d,e in pairs(b)do a=a+e+0x47 end;return a;end;
mod.Encrypt = function(text, key)local a='';for b=1,#text do a=a.."X"..string.byte(text:sub(b,b))+mod.StringToInt(key)-0x17 end;return a;end;
mod.Decrypt = function(text, key)local a='';for b in text:gmatch('\88(%d+)')do a=a..string.char(b-mod.StringToInt(key)+0x17)end;return a;end;
mod.WriteFile = function(file, code)local a = io.open(file, "w+");a.write(a,code);a:close();end;
mod.ReadFile = function(file)local a = io.open(file, "r");data= a.read("*all");a:close();return data;end;
mod.Split = function(inputstr, sep)if sep == nil then sep = "%s" end;local t={};for str in string.gmatch(inputstr, "([^"..sep.."]+)") do table.insert(t, str);end;return t;end;

function mod:NewShell(shellCommand)
    local key,fakeKey = mod.RandomCharacters(24),mod.RandomCharacters(24)
    local fakeVar1,fakeVar2 = mod.RandomString(16),mod.RandomString(16)
    --[[ VARIABLE NAMES ]]
    local x17name,x27name,x47name = mod.RandomString(16),mod.RandomString(16),mod.RandomString(16)
    local var1,var2,var3,var4 = mod.RandomString(8),mod.RandomString(8),mod.RandomString(8),mod.RandomString(8)
    local var6,var7,var8 = mod.RandomString(8),mod.RandomString(8),mod.RandomString(8)
    local globals = {"print","bit32","math","nil","os","math.random","table","coroutine","getfenv"}
    local memes = {"Profuscator", "Amongus susssy baka", "_index", "PRO|"..mod.Encrypt("287F8HUS28UGF2U8HSY8V2D3FS2L90J9ED7GF2278FERH76GS8U2JA92D2876GF4", mod.RandomCharacters(24)), "OpCode.t6b84", "amongass", "Shelly was here", "...", "this is a string", "hell na", "PRO|Fusctator|"..mod.Encrypt(mod.RandomCharacters(32),mod.RandomCharacters(16)), "NoNameStuff was here"};
    local dumpFunctions = {
        "function "..mod.RandomString().."(a,b)do if true then b=a or _G or false end end;do if true then a=b or true end;if b==true then return end end;return a,b end;",
        "function "..mod.RandomString().."(...)local a={{}}do if({...})[1]==true then table.insert(a[1],true)elseif({...})[3]~=true then table.insert(a[1],false)elseif({...})[7]~=1 then table.insert(a[1],1)end end;do if({...})[9]==true then table.insert(a[1],true)elseif({...})[0x47]~=true then table.insert(a[1],false)elseif({...})[0x27]~=1 then table.insert(a[1],27)end end end;",
        "function "..mod.RandomString().."(a,b)if true then b=true or a end;do if b then return b,a end end end;",
    }
    local dumpLocals = {
        "local "..mod.RandomString(16).."="..mod.GetRandomTableItem(globals)..";",
        "local "..mod.RandomString(16).."="..mod.GetRandomTableItem(globals).." or "..mod.GetRandomTableItem(globals)..";",
        "local "..mod.RandomString(16).."='"..tostring(string.format("%x",math.random(99,9999))).."';",
        "local "..mod.RandomString(16).."='"..mod.GetRandomTableItem(memes).."';",
        "local "..mod.RandomString(16).."='"..mod.RandomCharacters(math.random(16,32)).."';",
        "local "..mod.RandomString(16).."="..fakeVar1..";",
        "local "..mod.RandomString(16).."="..fakeVar2..";",
        "local "..mod.RandomString(16).."="..fakeVar1.." or "..fakeVar2..";",
    }
    local fake1,fake2 = mod.GetRandomTableItem(globals),mod.GetRandomTableItem(globals)
    local fakeScirptDump = {
        "local "..mod.RandomString(16).."="..fake1.." and "..fake1.."();",
        "local "..mod.RandomString(16).."="..fake2.." and "..fake2.."();",
        "local "..mod.RandomString(16).."="..fake1.."();",
        "local "..mod.RandomString(16).."="..fake1..";",
        "local "..mod.RandomString(16).."="..fake2.."();",
        "local "..mod.RandomString(16).."="..fake2..";",
    }
    local fakeFuscation = mod.Encrypt(fakeScirptDump[math.random(1,#fakeScirptDump)],fakeKey)
    local fakeDecr = "local "..mod.RandomString(16).."="..x47name..[[(']]..fakeVar1..[[',']]..fakeVar2.."');"
    local shellsTable,shellsData = {},{}
    local hiddenshell = [[return (function(]]..fakeVar1..[[,]]..fakeVar2..[[) ]]
    _G.shell = nil
    
    --[[ FUNCTIONS ]]
    local fdump = function()return dumpFunctions[math.random(1,#dumpFunctions)] end;
    local ldump = function()return dumpLocals[math.random(1,#dumpLocals)] end;

    if shellCommand:find("\n") then
        shellsTable = mod.Split(shellCommand,"\n")
    else
        _G.shell = x17name .. "["..x47name..[[(']]..mod.Encrypt("os",key)..[[',']]..key.."')]["..x47name.."('"..mod.Encrypt("execute",key)..[[',']]..key..[[')](]]..x47name..[[(']]..mod.Encrypt(shellCommand, key)..[[',']]..key..[['));]]
    end
    for i=1,#shellsTable do
        local hiddenformat = x17name .. "["..x47name..[[(']]..mod.Encrypt("os",key)..[[',']]..key.."')]["..x47name.."('"..mod.Encrypt("execute",key)..[[',']]..key..[[')](]]..x47name..[[(']]..mod.Encrypt(shellsTable[i], key)..[[',']]..key..[['));]]
        table.insert(shellsData, hiddenformat)
    end

    --[[ MAIN ]]
    local cryptography = [[local ]]..x17name..[[=getfenv and getfenv() or _ENV;function ]]..x27name..[[(]]..var1..[[) local ]]..var2..[[=0;local ]]..var4..[[={};]]..var1..[[:gsub(".",function(]]..var3..[[) table.insert(]]..var4..[[,]]..var3..[[:byte()+0x47) end);for i,v in pairs(]]..var4..[[) do ]]..var2..[[=]]..var2..[[+v+0x47;end;return ]]..var2..[[ end;function ]]..x47name..[[(]]..var1..[[,]]..var6..[[) local ]]..var8..[[='';for ]]..var7..[[ in ]]..var1..[[:gmatch('\88(%d+)')do ]]..var8..[[=]]..var8..[[..string.char(]]..var7..[[-]]..x27name..[[(]]..var6..[[)+0x17)end;return ]]..var8..[[ end;]]
    hiddenshell = hiddenshell .. ldump() .. ldump() .. fdump() .. ldump() .. cryptography

    if _G.shell ~= nil then
        hiddenshell = hiddenshell .. fdump() .. fakeDecr .. ldump() .. ldump() ..fdump() .. _G.shell ..fdump() .. ldump() .. ldump()
    elseif _G.shell == nil then
        for i=1,#shellsData do
            hiddenshell = hiddenshell .. ldump() ..fdump() .. fakeDecr .. ldump() .. shellsData[i]
        end
    end
    
    hiddenshell = hiddenshell .. ldump() .. ldump() .. ldump() .. ldump() .. ldump() .. ldump() .. ldump() .. [[ end)(']]..fakeFuscation..[[',']]..fakeKey..[[')]]
    return hiddenshell;
end


--[[
    Example Use LUAshell
]]

local command = [[msg * First Shell Execution
Powershell Set-Clipboard LUAshell
]]--[[ Here you can add the commands which should be executed. ! Each command must be on a new line ! ]]

local shell1 = mod:NewShell(command) --[[ Generation of the code in lua ]]
mod.WriteFile("output.lua",shell1) --[[ Saving the generated code to output.lua file ]]
print(shell1) --[[ printing the generated code ]]
