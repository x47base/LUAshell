# 🔥 LUAshell [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/x47base/issues) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![HitCount](http://hits.dwyl.com/x47base/LUAshell.svg)](http://hits.dwyl.com/x47base/LUAshell) 

This is a script, which can create for you shell-command-execution-scripts coded and hidden as lua code.

## Requirements for the script
```md
+ Lua 5.4
```

## How to use the script
You set the command which should be executed into the variable `one_liner_command` and then you run the script with lua 5.4.
```lua
--[[
    Example Use LUAshell
]]

local one_liner_command = "msg * hi" --[[ The one line command which should be executed ]]

local shell1 = mod:NewShell(one_liner_command) --[[ Generation of the code in lua ]]
mod.WriteFile("output.lua",shell1)
print(shell1)
```

## Images
![image](https://user-images.githubusercontent.com/72315013/204155178-33f102c4-783d-4442-99a9-14b77806bee3.png)

## Common questions
### How to install Lua?
https://www.youtube.com/watch?v=QQxhoI-m55k 

## How the abuseable function works, which is being used here
Lua has a function called execute in it's function package os with which shell commands can be executed.
*-> Example:* `os.execute("msg * all")`

## Possibel Attacks which can be done with this abuseable function
```md
+ HTA Attack
+ Rundll32 Attack
+ Regsvr32 Attack
+ msiexec Attack
+ Wmic Attack
+ MSbuild Attack
+ Powershell Attack
+ ...
```

## How to become save before LUAshell attacks
For example you can just put this code at the start of the code which you want to test a script.
```lua
os.execute = print or error
```
```lua
os.execute = function(value)
    return error("[POSSIBLE-MALICIOUS-EXECUTION] Value: "..value)
end
```

# ! I'm not responsible for any damage done with this code generation tool !
## MIT License

