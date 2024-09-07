local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Player = Players.LocalPlayer

local redzLib = {
  info = {
    Version = "v1.2.2",
    PlaceName = MarketplaceService:GetProductInfo(game.PlaceId).Name
  },
  Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkmoonxhubscript/DarkMoonXLib/main/Icons.lua"))(),
  Flags = {},
  Save = {
    Theme = "Default",
    UISize = {550, 310},
    ScrollSize = 160,
    TransparencyHub = 0.1
  },
  Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkmoonxhubscript/DarkMoonXLib/main/Themes.lua"))() --[[
    I found this source on fluent but I don't know who created it
    source -- https://github.com/dawid-scripts/Fluent/blob/master/src/Icons.lua --
  ]],
  SaveForTheme = {
    Stroke = {},
    Buttons = {},
    Images = {},
    Text = {},
    DarkText = {},
    Frames = {},
    Corner = {},
    Theme = {},
    Toggle = {}
  }
}

local function GetIcon(GetName)
  if #GetName:split("") < 1 then return GetName end
  
  for iconName,rbxassetid in pairs(redzLib.Icons) do
    local Name1 = GetName:lower():gsub("lucide", ""):gsub("-", "")
    local Name2 = iconName:lower():gsub("lucide", ""):gsub("-", "")
    
    if Name1 == Name2 then
      return rbxassetid
    end
  end
  for iconName,rbxassetid in pairs(redzLib.Icons) do
    local Name1 = GetName:lower():gsub("lucide", ""):gsub("-", "")
    local Name2 = iconName:lower():gsub("lucide", ""):gsub("-", "")
    
    if Name2:find(Name1) then
      return rbxassetid
    end
  end
  return GetName
end

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 550

local function SetProps(Instance, props)
  if props and typeof(props) == "table" then
    table.foreach(props, function(prop, value)
      Instance[prop] = value
    end)
  end
  return Instance
end

local function SetChildren(Instance, children)
  if children and typeof(children) == "table" then
    table.foreach(children, function(a, b)
      b.Parent = Instance
    end)
  end
  return Instance
end

local function Create(InstanceName, parent, props, Children)
  local New = Instance.new(InstanceName)
  if parent and typeof(parent) == "Instance" then 
  New.Parent = parent SetProps(New, props)SetChildren(New, Children)
  else SetProps(New, parent)SetChildren(New, props)end
  return New
end

local function FindTable(table, val)
  for i,_ in pairs(table) do
    if i == val then
      return true
    end
  end
end

local function VerifyTheme(ThemeName)
  for name,__ in pairs(redzLib.Themes) do
    if name == ThemeName then
      return true
    end
  end
end

local function LoadSettings(FileName)
  if readfile and isfile and isfile(FileName) then
    local decode = HttpService:JSONDecode(readfile(FileName))
    
    if decode and typeof(decode) == "table" then
      if FindTable(decode, "ScrollSize") then redzLib.Save["ScrollSize"] = decode["ScrollSize"]end
      if FindTable(decode, "UISize") then redzLib.Save["UISize"] = decode["UISize"]end
      if FindTable(decode, "Theme") and VerifyTheme(decode["Theme"]) then redzLib.Save["Theme"] = decode["Theme"]end
      if FindTable(decode, "TransparencyHub")then redzLib.Save["TransparencyHub"] = decode["TransparencyHub"]end
    end
  end
end;LoadSettings("redz library V4.lua")

-- Theme local
local Theme = redzLib.Themes[redzLib.Save.Theme]

-- functions local
local function SaveSenttigs(FileName, save)
  if writefile then
    local json = HttpService:JSONEncode(save)
    writefile(FileName, json)
  end
end

local function CreateTween(Configs)
  local Instance = Configs[1] or Configs.Instance
  local Prop = Configs[2] or Configs.Prop
  local NewVal = Configs[3] or Configs.NewVal
  local Time = Configs[4] or Configs.Time or 0.5
  local TweenWait = Configs[5] or Configs.wait or false
  local TweenInfo = TweenInfo.new(Time, Theme["Tween Style"])
  
  local Tween = TweenService:Create(Instance, TweenInfo, {[Prop] = NewVal})
  Tween:Play()
  if TweenWait then
    Tween.Completed:Wait()
  end
  return Tween
end
local function MakeDrag(Instance)
	task.spawn(function()
		local DragStart, StartPos
		
		local function Update(Input)
			local delta = Input.Position - DragStart
			local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale)
			Instance.Position = Position
			-- CreateTween({Instance, "Position", Position, 0.1})
		end
		
    Instance.InputBegan:Connect(function(Input)
      if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        StartPos = Instance.Position
        DragStart = Input.Position
        
        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do RunService.Heartbeat:Wait()
          Update(Input)
        end
      end
    end)
	end)
	return Instance
end
local function insertTheme(instance, Theme)
  table.insert(redzLib.SaveForTheme[Theme], instance)
  if typeof(instance) == "table" then
    return instance[1]
  end
  return instance
end
local function Corner(props, Circle)
  local New = Create("UICorner", {
    CornerRadius = Circle and UDim.new(0.5, 0) or Theme["Corner Radius"]
  })SetProps(New, props)
  if not Circle then table.insert(redzLib.SaveForTheme.Corner, New)end
  return New
end
local function Stroke(props)
  local New = Create("UIStroke", {
    Color = Theme["Color Stroke"],
    Thickness = Theme["Stroke Thickness"],
    ApplyStrokeMode = "Border"
  })SetProps(New, props)
  table.insert(redzLib.SaveForTheme.Stroke, New)
  return New
end
local function Button(parent, props, childrens)
  local New = Create("TextButton", parent, {
    Text = "",
    AutoButtonColor = false,
    BackgroundColor3 = Theme["Color Hub 2"],
    BackgroundTransparency = Theme["Transparency"],
    Name = "Frame"
  }, {Corner()})SetProps(New, props)SetChildren(New, childrens)
  table.insert(redzLib.SaveForTheme.Buttons, New)
  return New
end
local function AddConnection(Instance, Connection, func)
  Instance[Connection]:Connect(function()func(Instance)end)
  return Instance
end
local function ConnectSave(Instance, func)
  Instance.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
      while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait()
      end
    end
    func()
  end)
end

-- ScreenGui
local ScreenGui = Create("ScreenGui", CoreGui, {
  Name = "redz library V4"
}, {
  Create("UIScale", {
    Scale = UIScale
  })
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then
  ScreenFind:Destroy()
end

task.spawn(function()
  local NotifyContainer = Create("Frame", ScreenGui, {
    Size = UDim2.new(0, 300, 1),
    Position = UDim2.fromScale(1),
    AnchorPoint = Vector2.new(1),
    BackgroundTransparency = 1
  }, {
    Create("UIPadding", {
      PaddingLeft = UDim.new(0, 25),
      PaddingTop = UDim.new(0, 25),
      PaddingBottom = UDim.new(0, 30)
    }), Create("UIListLayout", {
      Padding = UDim.new(0, 15),
        VerticalAlignment = "Bottom"
    })
  })
  
  function redzLib:MakeNotify(Configs)
    local NTitle = Configs[1] or Configs.Title or "Notification"
    local NText = Configs[2] or Configs.Text or "This is a notification"
    local NTime = Configs[3] or Configs.Time or 5
    
    local NFrame = Create("Frame", NotifyContainer, {
      Size = UDim2.new(2, 0, 0, 0),
      BackgroundTransparency = 1,
      AutomaticSize = "Y",
      Name = "Title"
    })
    
    local RealNFrame = insertTheme(Create("Frame", NFrame, {
      Size = UDim2.new(0.5, -25),
      BackgroundColor3 = Theme["Color Hub 1"],
      BackgroundTransparency = Theme["Transparency"],
      Position = UDim2.fromOffset(1),
      AutomaticSize = "Y",
      Active = true
    }, {
      Corner(),
      insertTheme(Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 15),
        Font = Theme["Font"][2],
        BackgroundTransparency = 1,
        Text = NTitle,
        TextSize = 12,
        Position = UDim2.new(0, 15, 0, 5),
        TextXAlignment = "Left",
        TextColor3 = Theme["Color Text"]
      }), "Text"),
      insertTheme(Create("TextLabel", {
        Size = UDim2.new(1, -25, 0, 0),
        Position = UDim2.new(0, 15, 0, 25),
        TextSize = 10,
        TextColor3 = Theme["Color Dark Text"],
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        AutomaticSize = "Y",
        Text = NText,
        Font = Theme["Font"][3],
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        TextWrapped = true
      }, {
        Create("Frame", {
          Size = UDim2.fromOffset(0, 8),
          Position = UDim2.fromScale(0, 1),
          BackgroundTransparency = 1
        })
      }), "DarkText")
    }), "Frames")
    
    local CloseNotify = Create("TextButton", RealNFrame, {
      Text = "X",
      Font = Enum.Font.FredokaOne,
      TextSize = 15,
      BackgroundTransparency = 1,
      TextColor3 = Color3.fromRGB(200, 200, 200),
      Position = UDim2.new(1, -5, 0, 2),
      AnchorPoint = Vector2.new(1, 0),
      Size = UDim2.fromOffset(15, 15)
    })
    
    local NotifyTimer = insertTheme(Create("Frame", RealNFrame, {
      Size = UDim2.new(1, 0, 0, 1.5),
      BackgroundColor3 = Theme["Color Stroke"],
      Position = UDim2.new(0, 2, 0, 20),
      BorderSizePixel = 0
    }, {
      Corner(),
      Create("Frame", {
        Size = UDim2.new(0, 0, 0, 5),
        Position = UDim2.new(0, 0, 1, 5),
        BackgroundTransparency = 1
      })
    }), "Stroke")
    
    local NotifyFinish, destroy
    
    CloseNotify.Activated:Connect(function()
      if not destroy and not NotifyFinish and NFrame then
        NotifyFinish = true
        CreateTween({RealNFrame, "Position", UDim2.new(0, -50), 0.15, true})
        CreateTween({RealNFrame, "Position", UDim2.new(1), 0.50, true})
        NFrame:Destroy()
        destroy = true
      end
    end)
    
    task.spawn(function()
      CreateTween({RealNFrame, "Position", UDim2.new(0, -50), 0.5, true})
      CreateTween({RealNFrame, "Position", UDim2.new(0, 0), 0.15, true})
      CreateTween({NotifyTimer, "Size", UDim2.new(0, 0, 0, 1.5), NTime, true})
      if not destroy and not NotifyFinish and NFrame then
        NotifyFinish = true
        CreateTween({RealNFrame, "Position", UDim2.new(0, -50), 0.15, true})
        CreateTween({RealNFrame, "Position", UDim2.new(1), 0.50, true})
        NFrame:Destroy()
        destroy = true
      end
    end)
    
    local Notify = {}
    function Notify:Destroy()destroy = true NFrame:Destroy()end
    function Notify:Visible(Bool)NFrame.Visible = Bool end
    function Notify:Wait()repeat task.wait()until not NFrame or NotifyFinish or destroy end
    return Notify
  end
end)

-- Themes
function redzLib:GetIcon(IconName)
  return GetIcon(IconName)
end
function redzLib:SetTransparency(NewVal)
  local NewVal = math.clamp(NewVal, 0, 0.5)
  redzLib.Save.TransparencyHub = NewVal
  
  local Save = redzLib.SaveForTheme
  table.foreach(Save.Frames, function(_,Intance)
    Intance.BackgroundTransparency = NewVal
  end)
  table.foreach(Save.Buttons, function(_,Intance)
    Intance.BackgroundTransparency = NewVal
  end)
end
function redzLib:CreateTheme(ThemeName, Configs)
  redzLib.Themes[ThemeName] = Configs
end
function redzLib:SetTheme(themeName)
  if not VerifyTheme(themeName) then return end
  
  Theme, redzLib.Save.Theme = redzLib.Themes[themeName], themeName
  Theme["Transparency"] = redzLib.Save.TransparencyHub
  
  local Save = redzLib.SaveForTheme
  SaveSenttigs("redz library V4.lua", redzLib.Save)
  
  table.foreach(Save.Frames, function(_,Intance)
    if not Intance then return end
    Intance.BackgroundColor3 = Theme["Color Hub 1"]
    Intance.BackgroundTransparency = Theme["Transparency"]
  end)
  table.foreach(Save.Buttons, function(_,Intance)
    if not Intance then return end
    Intance.BackgroundColor3 = Theme["Color Hub 2"]
    Intance.BackgroundTransparency = Theme["Transparency"]
  end)
  table.foreach(Save.Stroke, function(_,Intance)
    if not Intance then return end
    if Intance:IsA("ImageLabel") then
      Intance.ImageColor3 = Theme["Color Stroke"]
    elseif Intance:IsA("UIStroke") then
      Intance.Color = Theme["Color Stroke"]
      Intance.Thickness = Theme["Stroke Thickness"]
    else
      Intance.BackgroundColor3 = Theme["Color Stroke"]
    end
  end)
  table.foreach(Save.Corner, function(_,Intance)
    if not Intance then return end
    Intance.CornerRadius = Theme["Corner Radius"]
  end)
  table.foreach(Save.Text, function(_,Intance)
    if not Intance then return end
    if Intance:IsA("ImageLabel") then
      Intance.ImageColor3 = Theme["Color Text"]
    else
      Intance.TextColor3 = Theme["Color Text"]
    end
  end)
  table.foreach(Save.DarkText, function(_,Intance)
    if not Intance then return end
    Intance.TextColor3 = Theme["Color Dark Text"]
  end)
  table.foreach(Save.Theme, function(_,Intance)
    if not Intance then return end
    Intance.BackgroundColor3 = Theme["Color Theme"]
  end)
  table.foreach(Save.Toggle, function(_,table)
    if not table[1] then return end
    if table[2]:GetToggle() then
      if table[1]:IsA("Frame") then
        table[1].BackgroundColor3 = Theme["Color Theme"]
      else
        table[1].Color = Theme["Color Theme"]
      end
    else
      if table[1]:IsA("Frame") then
        table[1].BackgroundColor3 = Theme["Color Stroke"]
      else
        table[1].Color = Theme["Color Stroke"]
      end
    end
  end)
end
function redzLib:GetThemes()
  local Themes = {}
  table.foreach(redzLib.Themes, function(ThemeName)
    table.insert(Themes, ThemeName)
  end)
  return Themes
end

-- Window
function redzLib:Visible(Bool)ScreenGui.Enabled = Bool end
function redzLib:Destroy()SreenGui:Destroy()end
function redzLib:MakeWindow(Configs)
  local Minimized, WaitMinimize, SavedSize
  local WTitle = Configs[1] or Configs.Title or "redz library"
  local SubTitle = Configs[2] or Configs.SubTitle or "by : redz9999"
  local LoadTitle = Configs[3] or Configs.LoadText or SubTitle
  local DefaultTheme = Configs[4] or Configs.DefaultTheme or false
  local SaveCfg = Configs[5] or Configs.Flags or "redz Library v4 | Flags.lua"
  local Flags = redzLib.Flags
  
  if SaveCfg and typeof(SaveCfg) == "string" then
    SaveCfg = string.gsub(SaveCfg, "/", "|")
  end
  
  if DefaultTheme and typeof(DefaultTheme) == "string" and VerifyTheme(DefaultTheme) then
    redzLib:SetTheme(DefaultTheme)
  end
  
  local AnimFrame = insertTheme(Create("Frame", ScreenGui, {
    Position = UDim2.fromScale(0.5, 0.5),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = Theme["Color Hub 1"],
    ClipsDescendants = true
  }, {
    Corner()
  }), "Frames")
  
  local AnimText = insertTheme(Create("TextLabel", AnimFrame, {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = LoadTitle,
    Font = Theme["Font"][2],
    TextSize = 12,
    TextColor3 = Theme["Color Text"],
    TextTransparency = 1
  }), "Text")
  
  CreateTween({AnimFrame, "Size", UDim2.fromOffset(0, 25), 0.2, true})
  CreateTween({AnimFrame, "Size", UDim2.fromOffset(140, 25), 0.6, true})
  CreateTween({AnimText, "TextTransparency", 0, 0.4, true})
  task.wait(0.5)
  CreateTween({AnimText, "TextTransparency", 0, 0.4, true})
  CreateTween({AnimFrame, "Size", UDim2.fromOffset(0, 25), 0.4, true})
  AnimText:Destroy()
  AnimFrame:Destroy()
  
  local function SaveFile(Name, Value)
    if writefile then
      if SaveCfg and typeof(SaveCfg) == "string" then
        Flags[Name] = Value
        
        local encode = HttpService:JSONEncode(Flags)
        writefile(SaveCfg, encode)
      end
    end
  end
  
  local function LoadFile()
    if SaveCfg and typeof(SaveCfg) == "string" then
      if readfile and isfile and isfile(SaveCfg) then
        local decode = HttpService:JSONDecode(readfile(SaveCfg))
        
        if decode and typeof(decode) == "table" then
          Flags = decode
        end
      end
    end
  end;LoadFile()
  
  local MainFrame = MakeDrag(insertTheme(Create("Frame", ScreenGui, {
    Size = UDim2.fromOffset(unpack(redzLib.Save.UISize)),
    Position = UDim2.new(0.5, -redzLib.Save.UISize[1]/2, 0.5, -redzLib.Save.UISize[2]/2),
    Active = true,
    BackgroundColor3 = Theme["Color Hub 1"],
    BackgroundTransparency = Theme["Transparency"]
  }, {Corner()}), "Frames"))
  
  local Topbar = Create("Frame", MainFrame, {
    Size = UDim2.new(1, 0, 0, 28),
    BackgroundTransparency = 1
  })
  
  local MainScroll = Create("ScrollingFrame", MainFrame, {
    Size = UDim2.new(0, redzLib.Save.ScrollSize, 1, -Topbar.Size.Y.Offset),
    Position = UDim2.new(0, 0, 1, 0),
    AnchorPoint = Vector2.new(0, 1),
    ScrollBarThickness = 1,
    BackgroundTransparency = 1,
    CanvasSize = UDim2.new(),
    AutomaticCanvasSize = "Y"
  }, {
    Create("UIPadding", {
      PaddingLeft = UDim.new(0, 10),
      PaddingRight = UDim.new(0, 10),
      PaddingTop = UDim.new(0, 10),
      PaddingBottom = UDim.new(0, 10)
    }), Create("UIListLayout", {
      Padding = UDim.new(0, 5)
    })
  })
  
  local Containers = Create("Frame", MainFrame, {
    Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -Topbar.Size.Y.Offset),
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1
  })
  
  local ControlSize1, ControlSize2 = MakeDrag(Create("Frame", MainFrame, {
    Size = UDim2.new(0, 35, 0, 35),
    Position = MainFrame.Size,
    Active = true,
    Draggable = true,
    AnchorPoint = Vector2.new(0.8, 0.8),
    BackgroundTransparency = 1
  })), MakeDrag(Create("Frame", MainFrame, {
    Size = UDim2.new(0, 20, 1, -30),
    Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
    AnchorPoint = Vector2.new(0.5, 1),
    Active = true,
    BackgroundTransparency = 1
  }))
  
  local function ControlSize()
    local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
    ControlSize1.Position = UDim2.fromOffset(math.clamp(Pos1.X.Offset, 400, 1000), math.clamp(Pos1.Y.Offset, 200, 500))
    ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, 135, 250), 1, 0)
    
    MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -Topbar.Size.Y.Offset)
    Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -Topbar.Size.Y.Offset)
    MainFrame.Size = ControlSize1.Position
  end
  
  ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
  ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)
  
  ConnectSave(ControlSize1, function()
    if not Minimized then
      redzLib.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
      SaveSenttigs("redz library V4.lua", redzLib.Save)
    end
  end)
  ConnectSave(ControlSize2, function()
    redzLib.Save.ScrollSize = MainScroll.Size.X.Offset
    SaveSenttigs("redz library V4.lua", redzLib.Save)
  end)
  
  local DialogBackground = insertTheme(AddConnection(Create("TextButton", MainFrame, {
    BackgroundTransparency = 0.5,
    Text = "",
    BackgroundColor3 = Theme["Color Hub 2"],
    Visible = false,
    AutoButtonColor = false,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5)
  }, {
    Corner()
  }), "Activated", function(DialogBackground)
    CreateTween({DialogBackground, "Size", UDim2.new(), 0.2, true})
    DialogBackground.Visible = false
  end), "Stroke")
  
  local DialogFrame = insertTheme(Create("Frame", DialogBackground, {
    Size = UDim2.fromScale(0.65, 0.6),
    AnchorPoint = Vector2.new(0.5, 0.
