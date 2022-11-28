# LUAshell
This is a script, which can create for you shell-command-execution-scripts coded and hidden as lua code.

## How to use

```lua
--[[
    Example Use NewShell
]]

local one_liner_command = "msg * hi" --[[ The one line command which should be executed ]]

local shell1 = mod:NewShell(one_liner_command) --[[ Generation of the code in lua ]]
mod.WriteFile("output.lua",shell1)
print(shell1)
```

## Images
![image](https://user-images.githubusercontent.com/72315013/204155178-33f102c4-783d-4442-99a9-14b77806bee3.png)

## Release
Comming Soon


# ! I'm not responsible for any damage done with this code generation tool !
## MIT License

