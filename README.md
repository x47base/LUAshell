# LUAshell
This is a script, which can create for you shell-command-execution-scripts coded and hidden as lua code.

## Requirements
```md
+ Lua 5.4
```

## How to use
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
Here is a guide how to install lua 5.4: https://www.youtube.com/watch?v=QQxhoI-m55k 

# ! I'm not responsible for any damage done with this code generation tool !
## MIT License

