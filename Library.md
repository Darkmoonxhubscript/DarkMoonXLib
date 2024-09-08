# DarkMoon Lib
## Library loadstring
```lua
local DarkLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkmoonxhubscript/DarkMoonXLib/main/Source.lua"))()
```

library functions
```lua
DarkLib:settheme("theme Name") --https://github.com/Darkmoonxhubscript/DarkMoonXLib/blob/main/Themes.lua

DarkLib:SetTransparency(0.1) -- 0, 1

DarkLib:GetThemes() -- void, return = table

DarkLib:GetIcon("Icon Name")

-- ///////// 

DarkLib.info.PlaceName

DarkLib.info.Version
```

## Global Functions
```lua
Instance:Destroy()

Instance:Visible(false)
```

## Window
Create a Window
```lua
local Window = DarkLib:MakeWindow({
  Title = "DarkMoon X : Test",
  SubTitle = "by : darkmoonhub#0000",
  LoadText = "DarkMoon Hub",
  Flags = "DarkMoon.lua"
})
```
## Window Functions
Window Functions
```lua
--[[
  Window:Set("New Title or Image")
]]
```

## Notification
Create a Notification
```lua
local Notify = DarkLib:MakeNotify({
  Title = "Notification",
  Text = "This is a Notification",
  Time = 5
})
```
## Notify Functions
Notify Functions
```lua
--[[
  Notify:Wait() -- Wait for the notification to end
]]
```

## Tab
Create a Tab
```lua
local Tab = Window:MakeTab({Name = "Tab", Icon = "Home"})
```
## Tab Functions
Tab Functions
```lua
--[[
  Tab:Set("New Icon or Name")
]]
```

## Section
Create a Section
```lua
local Section = Tab:AddSection({"This is a Section"})
```
## Section Functions
Section Functions
```lua
--[[
  Section:Set("Section")
]]
```

## Paragraph
Create a Paragraph
```lua
local Paragraph = Tab:AddParagraph({"Paragraph", "this is a Paragraph"})
```
## Paragraph Functions
Paragraph Functions
```lua
--[[
  Paragraph:Set("New Text")
  
  Paragraph:Set("New Name", "New Text")
]]
```

## Label
Create a Text Label
```lua
local TextLabel = Tab:AddLabel({"Text", "This is a Text Label"})
```
## TextLabel Functions
TextLabel Functions
```lua
--[[
  TextLabel:Set("New Name")
]]
```

Create a Image Label
```lua
local ImageLabel = Tab:AddLabel({"Image", "This is a Image Label", "rbxassetid://"})
```
## ImageLabel Functions
ImageLabel Functions
```lua
--[[
  ImageLabel:Set("New Name", "New Image")
]]
```

## Button
Create a Button
```lua
local Button = Tab:AddButton({
  Name = "Button",
  Callback = function()
    
  end
})
```
## Button Functions
Button Functions
```lua
--[[
  Button:Callback(function()
    
  end)
  
  Button:Set("New Name")
]]
```

## Toggle
Create a Toggle
```lua
local Toggle = Tab:AddToggle({
  Name = "Toggle",
  Default = false,
  Callback = function(Value)
    
  end
})
```
## Toggle Functions
Toggle Functions
```lua
--[[
  Toggle:Set(false)
  
  Toggle:Callback(function(Value)
  
  end)
]]
```
## TextBox
Create a TextBox
```lua
Tab:AddTextBox({
  Name = "TextBox : ",
  Default = "1",
  PlaceholderText = "Enter a Number",
  ClearText = true,
  Callback = function(Value)
  
  end
})
```
## Dropdown
Create a Dropdown
```lua
local Dropdown = Tab:AddDropdown({
  Name = "Dropdown",
  Options = {"1", "2", "3"},
  Default = {"2"},
  MultSelect = false,
  Callback = function(Value)
    
  end
})
```
## Dropdown Functions
Dropdown Functions
```lua
--[[
  Dropdown:Set({New Options}, Void)
  -- Example : {
    Dropdown:Set({"one", "two", "three"}, true)
  }
  
  Dropdown:Callback(function(Value)
    
  end)
]]
```

## Slider
Create a Slider
```lua
local Slider = Tab:AddSlider({
  Name = "Slider",
  MinValue = 1,
  MaxValue = 10,
  Default = 5,
  Increase = 1,
  Callback = function(Value)
    
  end
})
```
## Slider Functions
Slider Functions
```lua
--[[
  Slider:Set(7)
  
  Slider:Callback(function(Value)
    
  end)
]]
```

## Extra
Create a `Discord Invite`
```lua
Tab:AddDiscordInvite({
  DiscordTitle = "DarkMoon Community",
  DiscordIcon = "rbxassetid://10734897102",
  DiscordLink = "https://discord.gg/YDXM43cBU6"
})
})
```

Create a `Minimize Button`
```lua
Window:AddMinimizeButton({
  Button = {
    Image = "rbxassetid://10734897102"
  },
  UICorner = {true,
    CornerRadius = UDim.new(0.5, 0)
  },
  UIStroke = {false, {
  }}
})
```
Create a `Dialog`
```lua
Window.Dialog:Create({
        Title = "Dialog",
        Confirm = {
          Text = "Confirm",
          Callback = function()
          
          end
        },
        Cancel = {
          Cancel = "Cancel"
        }
      })
```
