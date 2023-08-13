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

### Toggle
```lua
local Toggle = Page:CreateToggle("Anchored")
```

You can also set the starting state of the toggle

```lua
local Toggle = Page:CreateToggle("UnAnchored", true)
```

It includes an event, and a value

A value for the state of the toggle

```lua
local Value = Toggle.Value
```

And also an event for whenever its toggled

```lua
Toggle.Toggled:Connect(function(NewValue)
	game.Players.LocalPlayer.Character.PrimaryPart.Anchored = NewValue
end)
```

Instance

```lua
Toggle.Instance
```

### Textbox
```lua
local Textbox = Page:CreateTextbox("Username")
```
A textbox is a box with text that can be edited by the user

Theres 2 variables it can take: The text, and the starting textbox text

```lua
local Textbox = Page:CreateTextbox("Username", "Robloxian1234")
```

It has an event, and 2 variables

An event for when its changed (the user types a letter/deletes a letter, etc.)

```lua
Textbox.Changed:Connect(function()
	print(Textbox.Value)
end)
```

A variable for the current text of the textbox

```lua
print(Textbox.Value)
```

and of course, the Instance itself

```lua
Textbox.Instance
```

### Bind
```lua
local Bind = Page:CreateBind("Interact")
```
A bind is just a keybind the user can change

It can take 2 variables, The text, and the start bind
```lua
local Bind = Page:CreateBind("Interact", Enum.Keycode.E)
```

The bind can either be Enum.KeyCode or Enum.UserInputType (KeyCode for Keyboard, UserInputType for stuff like the mouse)

It has an Event, A Variable, And the Instance itself

The event is for whenever the keybind changes
```lua
Bind.Changed:Connect(function(NewBind)
	print(NewBind)
end)
```

The variable is the current binded key
```lua
print(Bind.Value)
```

and of course, the Instance itself 😔
```lua
Bind.Instance
```

## Extra stuff

Heres some extra stuff

### Extra Window Functions
```lua
Window:ChangeColor()
```
The change color function intakes the same Color table as when creating the window (Back at Setting up the window)
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

### Instance variables
The instance variables are of no use without knowing what you can find in them
So heres a list! (Unfinished)
```
Window.Instace 			(ScreenGui)
	.Frame 			(Inside are all the page buttons)
		.UIListLayout	(The thing that positions all the buttons)
	.FramePositioning	(The thing that positions all the pages)

Page.Instances					(Table)
	.Page					(The page itself)
		.UICorner			(The thing that makes the corners smooth)
		.UIGradient			(The thing that adds the faint gradient)
		.ScrollingFrame			(The thing that makes it so you can scroll when the contents are too big for the page)
			.UIListLayout		(The thing that positions all the elements)
	.Button					(The button)
		.UICorner			(The thing that makes the corners smooth)
		.UIGradient			(The thing that adds the faint gradient)
		.Text				(For when you input text as the page name)
		.Image				(For when you input a rbxassetid as the page name)
```
