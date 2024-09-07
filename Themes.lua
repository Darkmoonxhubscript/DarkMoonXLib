local Themes = {
  ["Default"] = {
    ["Color Hub 1"] = Color3.fromRGB(18, 18, 18),
    ["Color Hub 2"] = Color3.fromRGB(25, 25, 25),
    ["Color Theme"] = Color3.fromRGB(30, 150, 240),
    ["Color Text"] = Color3.fromRGB(240, 240, 240),
    ["Color Dark Text"] = Color3.fromRGB(200, 200, 200),
    ["Color Stroke"] = Color3.fromRGB(80, 80, 80),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.GothamBlack,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Quad
  },
  ["White"] = {
    ["Color Hub 1"] = Color3.fromRGB(255, 255, 255),
    ["Color Hub 2"] = Color3.fromRGB(240, 240, 240),
    ["Color Theme"] = Color3.fromRGB(0, 150, 255),
    ["Color Text"] = Color3.fromRGB(0, 0, 0),
    ["Color Dark Text"] = Color3.fromRGB(50, 50, 50),
    ["Color Stroke"] = Color3.fromRGB(200, 200, 200),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.SourceSans,
      Enum.Font.SourceSansBold,
      Enum.Font.SourceSansLight
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Linear
  },
}

return Themes
