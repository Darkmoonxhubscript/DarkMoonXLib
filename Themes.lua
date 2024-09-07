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
  ["Grape"] = {
    ["Color Hub 1"] = Color3.fromRGB(70, 0, 90),
    ["Color Hub 2"] = Color3.fromRGB(80, 0, 100),
    ["Color Theme"] = Color3.fromRGB(150, 50, 255),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(200, 200, 200),
    ["Color Stroke"] = Color3.fromRGB(120, 0, 180),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.FredokaOne,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Bounce
  },
  ["Amoled"] = {
    ["Color Hub 1"] = Color3.fromRGB(0, 0, 0),
    ["Color Hub 2"] = Color3.fromRGB(10, 10, 10),
    ["Color Theme"] = Color3.fromRGB(0, 255, 100),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(150, 150, 150),
    ["Color Stroke"] = Color3.fromRGB(20, 20, 20),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.GothamBlack,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Sine
  },
  ["Ocean"] = {
    ["Color Hub 1"] = Color3.fromRGB(0, 50, 100),
    ["Color Hub 2"] = Color3.fromRGB(0, 70, 120),
    ["Color Theme"] = Color3.fromRGB(0, 200, 255),
    ["Color Text"] = Color3.fromRGB(240, 240, 255),
    ["Color Dark Text"] = Color3.fromRGB(200, 200, 255),
    ["Color Stroke"] = Color3.fromRGB(0, 100, 180),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.FredokaOne,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Circular
  },
  ["Sunset"] = {
    ["Color Hub 1"] = Color3.fromRGB(255, 100, 100),
    ["Color Hub 2"] = Color3.fromRGB(255, 140, 140),
    ["Color Theme"] = Color3.fromRGB(255, 200, 100),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(240, 240, 240),
    ["Color Stroke"] = Color3.fromRGB(255, 120, 120),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.Antique,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Bounce
  },
  ["Forest"] = {
    ["Color Hub 1"] = Color3.fromRGB(34, 139, 34),
    ["Color Hub 2"] = Color3.fromRGB(60, 179, 113),
    ["Color Theme"] = Color3.fromRGB(46, 139, 87),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(230, 230, 230),
    ["Color Stroke"] = Color3.fromRGB(34, 139, 34),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.Cartoon,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Elastic
  },
  ["Ice"] = {
    ["Color Hub 1"] = Color3.fromRGB(173, 216, 230),
    ["Color Hub 2"] = Color3.fromRGB(191, 239, 255),
    ["Color Theme"] = Color3.fromRGB(135, 206, 250),
    ["Color Text"] = Color3.fromRGB(0, 0, 0),
    ["Color Dark Text"] = Color3.fromRGB(50, 50, 50),
    ["Color Stroke"] = Color3.fromRGB(70, 130, 180),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.Cartoon,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Sine
  },
  ["Cyber"] = {
    ["Color Hub 1"] = Color3.fromRGB(0, 0, 50),
    ["Color Hub 2"] = Color3.fromRGB(0, 0, 70),
    ["Color Theme"] = Color3.fromRGB(0, 255, 255),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(200, 200, 200),
    ["Color Stroke"] = Color3.fromRGB(0, 180, 180),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.FredokaOne,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Linear
  },
  ["Neon"] = {
    ["Color Hub 1"] = Color3.fromRGB(0, 0, 0),
    ["Color Hub 2"] = Color3.fromRGB(10, 10, 10),
    ["Color Theme"] = Color3.fromRGB(255, 0, 255),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(150, 150, 150),
    ["Color Stroke"] = Color3.fromRGB(200, 0, 200),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.Arcade,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Back
  },
  ["Desert"] = {
    ["Color Hub 1"] = Color3.fromRGB(237, 201, 175),
    ["Color Hub 2"] = Color3.fromRGB(244, 164, 96),
    ["Color Theme"] = Color3.fromRGB(210, 180, 140),
    ["Color Text"] = Color3.fromRGB(50, 50, 50),
    ["Color Dark Text"] = Color3.fromRGB(100, 100, 100),
    ["Color Stroke"] = Color3.fromRGB(160, 82, 45),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.SourceSans,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Elastic
  },
  ["Fire"] = {
    ["Color Hub 1"] = Color3.fromRGB(255, 69, 0),
    ["Color Hub 2"] = Color3.fromRGB(255, 99, 71),
    ["Color Theme"] = Color3.fromRGB(255, 140, 0),
    ["Color Text"] = Color3.fromRGB(255, 255, 255),
    ["Color Dark Text"] = Color3.fromRGB(200, 200, 200),
    ["Color Stroke"] = Color3.fromRGB(178, 34, 34),
    ["Corner Radius"] = UDim.new(0, 5),
    ["Font"] = {
      Enum.Font.Cartoon,
      Enum.Font.GothamBold,
      Enum.Font.GothamMedium
    },
    ["Stroke Thickness"] = 1,
    ["Tween Style"] = Enum.EasingStyle.Bounce
  }
}

return Themes
