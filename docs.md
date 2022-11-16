# Goodwill-Lib Docs Introduction

Goodwill-Lib is a library that simplifies the creation of UI for scripts

Lets just get to the point this just explains how the script works

# Activity

November 16th: Updated Docs for Version 2


# Gui Creation

## Setup

To setup the gui, you first need to require the Lib

```lua
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Plusgaming1/Goodwill-/main/Goodwill-Lib"))()
```

After that, you need to create the window.

```lua
local Window = Lib:CreateWindow(
  "Goodwill - Lib", --The name of the window
  Enum.KeyCode.LeftAlt, --The button that closes the window
  Enum.KeyCode.LeftAlt,  --The button that opens the window
  ThemeSettings --The theme settings (This is optional, If you dont wanna mess with this horrible thing, dont (This will help you add stuff like a light mode toggle (you monster)))
)
```

ThemeSettings consists of:
```lua
--(Note, if theres a * before the start, its optional)
Module:CreateWindow(DisplayName<String>, CloseKey<Enum.KeyCode>, OpenKey<Enum.KeyCode>, ThemeSetting<Table: {
	*WindowScale<Vector2> (Window Scale Multiplier) = Vector2.new(SizeXMultiplier*100, SizeYMultiplier*100). Default: Vector2.new(100, 100),
	*ScrollSpeed<Number> (How fast it takes to swithc between windows) = ScrollSpeed. Default: 1,
	*MainColor<Color3> (Background Color) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(20, 20, 20),
	*SelectionColor<Color3> (Color of the SideBar Selection Frame) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(0, 0, 255),
	*Rounding<UDim> (Rounding of the Main Frame) = UDim.new(Scale, Offset). Default: UDim.new(0, 0),
	*PrimaryColor<Color3> (Color of the page Modules (Aka Buttons)) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(0, 0, 0),
	*SecondaryColor<Color3> (Secondary 1 Color of the page Modules) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(80, 0, 80),
	*Secondary2Color<Color3> (Secondary 2 Color of the page Modules) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(150, 0, 150),
	*TextColor<Color3> (Color of all the text) = Color3.fromRGB(R, G, B). Default: Color3.fromRGB(255, 255, 255),
}>)
```

But after creating the window, you need to create a ScreenGui to place it inside of

```lua
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.DisplayOrder = 1000
ScreenGui.Name = "GoodwillLib"
ScreenGui.ResetOnSpawn = false

Window.Frame.Parent = ScreenGui
```

## Pages

After creating the window, you can make different pages (Like one page will be for combat, the other for settings, etc.)

```lua
local MyPage = Window:CreatePage("My Main Page")
```

After creation of a page, you can add 5 types of buttons:
  Toggle
  Slider
  Label
  TextBox
  and Button

```lua
local MyToggle = MyPage:CreateToggle("ToggleName", "Display Toggle Text", false --[[Start Value]])
local MySlider = MyPage:CreateSlider("SliderName", "Display Slider Text", 5 --[[Minimum]], 20 --[[Maximum]], 5 --[[Start Value]])
local MyLabel = MyPage:CreateLabel("Label name", "Label Display Text")
local MyTextBox = MyPage:CreateTextBox("TextboxName" --[[Place Holder Text]], "Text Box Display Text" -- [[Display Text]], "Test" -- [[Start Value]])
local MyButton = MyPage:CreateButton("ButtonName", "Button Display Text", "Click me" --[[Button Text]])
```

Now, just creating the buttons doesnt really have much of use, so lets do something when they're changed

```lua
MyToggle.Toggled:Connect(function(NewValue)
  print("My Toggle is now ".. NewValue)
end)

MySlider.Moved:Connect(function(NewValue, Min, Max)
  print("Slider moved to ".. NewValue)
end)

MyTextBox.Changed:Connect(function(NewText)
  print("TextBox is now ".. NewText)
end)

MyButton.Clicked:Connect(function()
  print("Button Pressed")
end)
```

Now if we want, we can create a second page

```lua
local MySettings = Window:CreatePage("My Settings Page")
```

And then we can do the same thing with this one

```lua
local SettingsToggle1 = MySettings:CreateToggle("Impossible", "Cant turn this on.", false)
local SettingsToggle2 = MySettings:CreateToggle("Create", "Hello, I create a new button", false)
```

And then add some behavior

```lua
SettingsToggle1.Toggled:Connect(function(Value)
  if Value == true then
    wait(1)
    SettingsToggle1.Change(false)
  end
end)

SettingsToggle2.Toggled:Connect(function(Value)
  if Value == true then
    repeat
      wait(1)
      MySettings:CreateButton("Name", "Hello I do nothing", "Dont press")
    until SettingsToggle2.Value == false
  end
end
```

More is coming soon to the script, and the Docs
