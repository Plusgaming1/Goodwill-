# Goodwill Lib *3* Docs

Another version of goodwill lib another version of the documentation

## Gui Creation

### First, acquire the lib

```lua
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Plusgaming1/Goodwill-/main/Goodwill-Lib-3.lua"))();
```

### Next, setting up the window

```lua
local Window = Lib:CreateWindow()
```

If you want to change the colors and other settings, you can

```lua
local Window = Lib:CreateWindow({
	Background = Color3.fromRGB(255, 255, 255);
	TextColor = Color3.fromRGB(0, 0, 0);
	Secondary = Color3.fromRGB(0, 0, 0);
	ToggleColor = Color3.fromRGB(0, 255, 255);
	Rounding = UDim.new(0, 10);
	Transparency = 0.4;
})
```

Each one of the Options is optional, you can also just leave the table empty, or make it non-existant

You can also change the Options after creating the window

```lua
Window:ChangeColor({
	Background = Color3.fromRGB(255, 255, 255);
	TextColor = Color3.fromRGB(0, 0, 0);
	Secondary = Color3.fromRGB(0, 0, 0);
	ToggleColor = Color3.fromRGB(0, 255, 255);
	Rounding = UDim.new(0, 10);
	Transparency = 0.4;
})
```

## Creating a page

Once you've created the Window, its time to make some pages

```lua
local Page = Window:CreatePage("Page 1")
```

If you wanna make a page with a Image as the icon, just replace the name with the rbxassetid

```lua
local Page = Window:CreatePage("rbxassetid://13369885619")
```

You can also change the size of the page

```lua
local Page = Window:CreatePage("rbxassetid://13369885619", UDim2.new(0, 400, 0, 400))
```

a page also has 2 Instance variables

```lua
Page.Instances.Page:Destroy()
Page.Instances.Button:Destroy()
```

## Adding Labels, Buttons, Etc.

### Labels
```lua
local Label = Page:CreateLabel("I am a label and I am useless (jk)")
```
a Label has no functions except for the Instance itself

```lua
Label.Instance:Destroy()
```

### Buttons
```lua
local Button = Page:CreateButton("Click me to die")
```
A button has a event called Button.Clicked

```lua
Button.Clicked:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
```

And of course a button also has an instance variable

```lua
Button.Instance:Destroy()
```

### Sliders
Like most libs, you of course have sliders

```lua
local Slider = Page:CreateSlider("Speed")
```

It also has more inputs

Starting with Minimum Value
```lua
local Slider = Page:CreateSlider("Speed", -10)
```

Maximum Value
```lua
local Slider = Page:CreateSlider("Speed", -10, 5000)
```

And Starting Value
```lua
local Slider = Page:CreateSlider("Speed", -10, 5000, 1000)
```

It has a variable for the current Value
```lua
Slider.Value
```

It also has an event for when it has changed
```lua
Slider.Changed:Connect(function(NewValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = NewValue
end)
```

Instance variable to brrr

```lua
Slider.Instance:Destroy()
```
