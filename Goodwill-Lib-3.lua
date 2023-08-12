--[[
Another version of the goodwill lib, this one having a whole
 new UI.

Its pretty simple to use, I'll make some documentation a bit
 later.
]]

local m = {}

local function lerp(x, y, z)
	return x + (y - x) * z
end

local uis = game:GetService("UserInputService")

local function map(value, istart, istop, ostart, ostop)
	return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))
end

local function converttonum(str)
	local nums = {
		["0"] = 0;
		["1"] = 1;
		["2"] = 2;
		["3"] = 3;
		["4"] = 4;
		["5"] = 5;
		["6"] = 6;
		["7"] = 7;
		["8"] = 8;
		["9"] = 9;
	}
	
	local numstr = ""
	
	for k, v in string.split(str, "") do
		if nums[v] then
			numstr = numstr.. nums[v]
		end
	end
	
	return tonumber(numstr)
end

local function generateRandomName(len)
	local alphabet = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+/*-.,?`~"

	local e = ""

	for i = 1,len do
		local r = math.random(1, string.len(alphabet))

		e = e.. string.sub(alphabet, r, r+1)
	end

	return e
end

local folder = nil

local function GetFolder()
	if folder then
		return folder
	else
		folder = Instance.new("Folder", game.ReplicatedStorage)
		folder.Name = generateRandomName(math.random(5, 20))
		return folder
	end
end

function m:CreateWindow(Colored)
	local Color = Colored or {}
	local Coloring = {
		Background = Color3.fromRGB(255, 255, 255);
		TextColor = Color3.fromRGB(0, 0, 0);
		Secondary = Color3.fromRGB(0, 0, 0);
		ToggleColor = Color3.fromRGB(0, 255, 255);
		Rounding = UDim.new(0, 10);
		Transparency = 0.4;
	}
	
	local function changeColo(Color)
		if Color.Background then
			Coloring.Background = Color.Background
		end
		if Color.TextColor then
			Coloring.TextColor = Color.TextColor
		end
		if Color.Secondary then
			Coloring.Secondary = Color.Secondary
		end
		if Color.ToggleColor then
			Coloring.ToggleColor = Color.ToggleColor
		end
		if Color.Rounding then
			Coloring.Rounding = Color.Rounding
		end
		if Color.Transparency then
			Coloring.Transparency = Color.Transparency
		end
	end
	
	changeColo(Color)
	
	local plr = game.Players.LocalPlayer
	local mouse = plr:GetMouse()
	
	local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
	
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	local Frame = Instance.new("ScrollingFrame", ScreenGui)
	Frame.Name = "Frame"
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.ClipsDescendants = false
	Frame.Position = UDim2.new(0, 20, 0, 20)
	Frame.Selectable = false
	Frame.Size = UDim2.new(0, 60, 1, -20)
	Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
	Frame.ScrollBarThickness = 4
	
	local UIListLayout = Instance.new("UIListLayout", Frame)
	
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)
	
	local FramePositioning = Instance.new("Frame", ScreenGui)
	
	FramePositioning.Name = "FramePositioning"
	FramePositioning.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FramePositioning.BackgroundTransparency = 1.000
	FramePositioning.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FramePositioning.BorderSizePixel = 0
	FramePositioning.Position = UDim2.new(0, 100, 0, 20)
	FramePositioning.Size = UDim2.new(1, -100, 1, -20)
	
	local a = {}
	a.Instance = ScreenGui
	
	local colorChange = Instance.new("BindableEvent", GetFolder())
	
	function a:ChangeColor(Colored)
		local Color = Colored or {}
		
		changeColo(Color)
		
		colorChange:Fire()
	end
	
	local colorChange = colorChange.Event
	
	function a:CreatePage(Name, Size)
		local Size = Size or UDim2.new(0, 400, 0, 300)
		
		local PageButton = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local Text = Instance.new("TextButton")
		local Image = Instance.new("ImageLabel")
		
		PageButton.Name = "Button"
		PageButton.Parent = Frame
		PageButton.Active = true
		PageButton.BackgroundColor3 = Coloring.Background
		PageButton.BackgroundTransparency = Coloring.Transparency
		PageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageButton.BorderSizePixel = 0
		PageButton.Selectable = true
		PageButton.Size = UDim2.new(0, 60, 0, 60)

		UICorner_2.CornerRadius = Coloring.Rounding
		UICorner_2.Parent = PageButton

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.47, Color3.fromRGB(203, 203, 203)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 140, 140))}
		UIGradient.Rotation = -45
		UIGradient.Parent = PageButton
		
		

		Text.Name = "Text"
		Text.Parent = PageButton
		Text.AnchorPoint = Vector2.new(0.5, 0.5)
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Text.BorderSizePixel = 0
		Text.Position = UDim2.new(0.5, 0, 0.5, 0)
		Text.Size = UDim2.new(1, -4, 1, -4)
		Text.Font = Enum.Font.GothamBold
		Text.Text = Name
		Text.TextColor3 = Coloring.TextColor
		Text.TextScaled = true
		Text.TextSize = 14.000
		Text.TextWrapped = true

		Image.Name = "Image"
		Image.Parent = PageButton
		Image.AnchorPoint = Vector2.new(0.5, 0.5)
		Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Image.BackgroundTransparency = 1.000
		Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Image.BorderSizePixel = 0
		Image.Position = UDim2.new(0.5, 0, 0.5, 0)
		Image.Size = UDim2.new(1, -4, 1, -4)
		
		local sus, err = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(converttonum(Name))
		end)
		
		if sus then
			Text.Text = ""
			Image.Image = Name
		end
		
		local Page = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local UIGradient_2 = Instance.new("UIGradient")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		
		if #FramePositioning:GetChildren() <= 0 then
			Page.Visible = true
			PageButton.BackgroundColor3 = PageButton.BackgroundColor3:Lerp(Color3.fromRGB(0, 0, 0), 0.1)
		else
			Page.Visible = false
		end
		Page.Name = "Page"
		Page.Parent = FramePositioning
		Page.Active = true
		Page.BackgroundColor3 = Coloring.Background
		Page.BackgroundTransparency = Coloring.Transparency
		Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Page.BorderSizePixel = 0
		Page.Selectable = true
		Page.Size = Size

		UICorner_3.CornerRadius = Coloring.Rounding
		UICorner_3.Parent = Page

		UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.47, Color3.fromRGB(203, 203, 203)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 140, 140))}
		UIGradient_2.Rotation = -45
		UIGradient_2.Parent = Page

		ScrollingFrame.Parent = Page
		ScrollingFrame.Active = true
		ScrollingFrame.AnchorPoint = Vector2.new(0, 0.5)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0, 0, 0.5, 0)
		ScrollingFrame.Size = UDim2.new(1, 0, 1, -4)
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.ScrollBarThickness = 4
		ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

		UIListLayout_2.Parent = ScrollingFrame
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 1)
		
		colorChange:Connect(function()
			PageButton.BackgroundColor3 = Coloring.Background
			Text.TextColor3 = Coloring.TextColor
			PageButton.BackgroundTransparency = Coloring.Transparency
			Page.BackgroundTransparency = Coloring.Transparency
			UICorner_2.CornerRadius = Coloring.Rounding
			UICorner_3.CornerRadius = Coloring.Rounding
			
			Page.BackgroundColor3 = Coloring.Background
		end)
		
		Text.MouseButton1Click:Connect(function()
			if Page.Visible == true then
				Page.Visible = false
				PageButton.BackgroundColor3 = Coloring.Background
			else
				for i, v in pairs(FramePositioning:GetChildren()) do
					if v:IsA("Frame") then
						v.Visible = false
					end
				end
				for i, v in pairs(Frame:GetChildren()) do
					if v:IsA("Frame") then
						v.BackgroundColor3 = Coloring.Background
					end
				end
				PageButton.BackgroundColor3 = PageButton.BackgroundColor3:Lerp(Color3.new(0,0,0), 0.1)
				Page.Visible = true
			end
		end)
		
		local b = {}
		b.Instances = {
			Page = Page;
			Button = PageButton;
		}
		
		function b:CreateButton(Text)
			local Button = Instance.new("Frame")
			local TextButton_2 = Instance.new("TextButton")
			local TextLabel_2 = Instance.new("TextLabel")
			local Line_2 = Instance.new("Frame")

			Button.Name = "Button"
			Button.Parent = ScrollingFrame
			Button.Active = true
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Selectable = true
			Button.Size = UDim2.new(1, 0, 0, 50)
			Button.ClipsDescendants = false

			TextButton_2.Parent = Button
			TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_2.BackgroundTransparency = 1.000
			TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.BorderSizePixel = 0
			TextButton_2.Size = UDim2.new(1, 0, 1, 0)
			TextButton_2.ZIndex = 2
			TextButton_2.Font = Enum.Font.SourceSans
			TextButton_2.Text = ""
			TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_2.TextSize = 14.000
			TextButton_2.ClipsDescendants = true

			TextLabel_2.Parent = Button
			TextLabel_2.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel_2.Size = UDim2.new(1, -10, 1, -25)
			TextLabel_2.Font = Enum.Font.GothamBold
			TextLabel_2.Text = Text
			TextLabel_2.TextColor3 = Coloring.TextColor
			TextLabel_2.TextScaled = true
			TextLabel_2.TextSize = 25.000
			TextLabel_2.TextWrapped = true
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

			Line_2.Name = "Line"
			Line_2.Parent = Button
			Line_2.AnchorPoint = Vector2.new(0, 1)
			Line_2.BackgroundColor3 = Coloring.Secondary
			Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line_2.BorderSizePixel = 0
			Line_2.Size = UDim2.new(1, 0, 0, 1)
			
			colorChange:Connect(function()
				TextLabel_2.TextColor3 = Coloring.TextColor
				Line_2.BackgroundColor3 = Coloring.Secondary
			end)

			local c = {}

			local event = Instance.new("BindableEvent", GetFolder())
			event.Name = "Clicked"

			c.Clicked = event.Event
			c.Instance = Button

			TextButton_2.MouseButton1Click:Connect(function()
				event:Fire()

				local circ = Instance.new("Frame", TextButton_2)
				circ.Position = UDim2.new(0, mouse.X - Button.AbsolutePosition.X, 0, mouse.Y - Button.AbsolutePosition.Y)
				circ.Size = UDim2.new(0,0,0,0)
				circ.AnchorPoint = Vector2.new(0.5, 0.5)
				circ.BackgroundColor3 = Coloring.Secondary
				circ.ZIndex = 2
				circ.BackgroundTransparency = 0.7

				local corner = Instance.new("UICorner", circ)
				corner.CornerRadius = UDim.new(1, 0)

				local i = 0
				repeat
					i += wait()/0.5
					i = math.clamp(i, 0, 1)
					local i2 = math.sin(i * (math.pi/2))
					circ.Size = UDim2.new(0,0,0,0):Lerp(UDim2.new(0, Button.AbsoluteSize.X * 1.50, 0, Button.AbsoluteSize.X * 1.5), i2)
					circ.BackgroundTransparency = lerp(0.7, 1, i2)
				until i >= 1

				circ:Destroy()
			end)

			return c
		end
		
		function b:CreateLabel(Text)
			local Label = Instance.new("Frame")
			local TextLabel_3 = Instance.new("TextLabel")
			--local Line_3 = Instance.new("Frame")

			Label.Name = "Label"
			Label.Parent = ScrollingFrame
			Label.Active = true
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Selectable = true
			Label.Size = UDim2.new(1, 0, 0, 50)

			TextLabel_3.Parent = Label
			TextLabel_3.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.BackgroundTransparency = 1.000
			TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_3.BorderSizePixel = 0
			TextLabel_3.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel_3.Size = UDim2.new(1, -10, 1, -25)
			TextLabel_3.Font = Enum.Font.GothamBold
			TextLabel_3.Text = Text
			TextLabel_3.TextColor3 = Coloring.TextColor
			TextLabel_3.TextScaled = true
			TextLabel_3.TextSize = 25.000
			TextLabel_3.TextWrapped = true
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

			--[[Line_3.Name = "Line"
			Line_3.Parent = Label
			Line_3.AnchorPoint = Vector2.new(0, 1)
			Line_3.BackgroundColor3 = Coloring.Secondary
			Line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line_3.BorderSizePixel = 0
			Line_3.Size = UDim2.new(1, 0, 0, 1)]]
			
			colorChange:Connect(function()
				TextLabel_3.TextColor3 = Coloring.TextColor
			end)

			local c = {}

			c.Instance = Label

			return c
		end
		
		function b:CreateSlider(Text, Min, Max, Start, Rounding)
			local Min = Min or 0
			local Max = Max or 100
			local Start = Start or 0
			
			local Rounding = Rounding or 1
			Rounding = math.max(Rounding, 0.0001)
			
			local Slider = Instance.new("Frame")
			local TextButton_3 = Instance.new("TextButton")
			local TextLabel_4 = Instance.new("TextLabel")
			local Slider_2 = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local Color = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local TextLabel_5 = Instance.new("TextLabel")
			local Line_4 = Instance.new("Frame")
			
			Slider.Name = "Slider"
			Slider.Parent = ScrollingFrame
			Slider.Active = true
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BackgroundTransparency = 1.000
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Selectable = true
			Slider.Size = UDim2.new(1, 0, 0, 50)

			TextButton_3.Parent = Slider
			TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_3.BackgroundTransparency = 1.000
			TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_3.BorderSizePixel = 0
			TextButton_3.Size = UDim2.new(1, 0, 1, 0)
			TextButton_3.ZIndex = 2
			TextButton_3.Font = Enum.Font.SourceSans
			TextButton_3.Text = ""
			TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_3.TextSize = 14.000

			TextLabel_4.Parent = Slider
			TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_4.BackgroundTransparency = 1.000
			TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_4.BorderSizePixel = 0
			TextLabel_4.Position = UDim2.new(0, 10, 0.1, 0)
			TextLabel_4.Size = UDim2.new(0.5, 0, 0.5, -5)
			TextLabel_4.Font = Enum.Font.GothamBold
			TextLabel_4.Text = Text
			TextLabel_4.TextColor3 = Coloring.TextColor
			TextLabel_4.TextScaled = true
			TextLabel_4.TextSize = 20.000
			TextLabel_4.TextWrapped = true
			TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

			Slider_2.Name = "Slider"
			Slider_2.Parent = Slider
			Slider_2.AnchorPoint = Vector2.new(0.5, 1)
			Slider_2.BackgroundColor3 = Coloring.ToggleColor
			Slider_2.BackgroundTransparency = 1.000
			Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider_2.BorderSizePixel = 0
			Slider_2.ClipsDescendants = true
			Slider_2.Position = UDim2.new(0.5, 0, 1, -5)
			Slider_2.Size = UDim2.new(0.9, 0, 0, 15)

			UICorner_4.CornerRadius = UDim.new(0, 4)
			UICorner_4.Parent = Slider_2

			Color.Name = "Color"
			Color.Parent = Slider_2
			Color.AnchorPoint = Vector2.new(0, 0.5)
			Color.BackgroundColor3 = Coloring.ToggleColor
			Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Color.BorderSizePixel = 0
			Color.Position = UDim2.new(0, 0, 0.5, 0)
			Color.Size = UDim2.new(map(Start, Min, Max, 0, 1), 0, 1, 0)

			UICorner_5.CornerRadius = UDim.new(0, 4)
			UICorner_5.Parent = Color

			TextLabel_5.Parent = Slider_2
			TextLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.BackgroundTransparency = 1.000
			TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_5.BorderSizePixel = 0
			TextLabel_5.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel_5.Size = UDim2.new(0.9, 0, 0.8, 0)
			TextLabel_5.Font = Enum.Font.GothamBold
			TextLabel_5.Text = Start
			TextLabel_5.TextColor3 = Coloring.TextColor
			TextLabel_5.TextScaled = true
			TextLabel_5.TextSize = 25.000
			TextLabel_5.TextWrapped = true

			Line_4.Name = "Line"
			Line_4.Parent = Slider
			Line_4.AnchorPoint = Vector2.new(0, 1)
			Line_4.BackgroundColor3 = Coloring.Secondary
			Line_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line_4.BorderSizePixel = 0
			Line_4.Size = UDim2.new(1, 0, 0, 1)
			
			local UIStroke = Instance.new("UIStroke", Slider_2)
			UIStroke.Thickness = 1
			UIStroke.Color = Coloring.Secondary
			
			colorChange:Connect(function()
				TextLabel_4.TextColor3 = Coloring.TextColor
				TextLabel_5.TextColor3 = Coloring.TextColor
				Color.BackgroundColor3 = Coloring.ToggleColor
				UIStroke.Color = Coloring.Secondary
				Line_4.BackgroundColor3 = Coloring.Secondary
			end)
			
			local held = false
			
			TextButton_3.MouseButton1Down:Connect(function()
				held = true
			end)
			TextButton_3.MouseButton1Up:Connect(function()
				held = false
			end)
			mouse.Button1Up:Connect(function()
				held = false
			end)
			uis.InputEnded:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					held = false
				end
			end)
			
			local event = Instance.new("BindableEvent", GetFolder())
			event.Name = "Changed"
			
			local c = {}

			c.Value = Start
			c.Changed = event.Event
			c.Instance = Slider
			
			mouse.Move:Connect(function()
				if held then
					local offX = (mouse.X - Slider_2.AbsolutePosition.X)/Slider_2.AbsoluteSize.X
					
					Start = math.clamp(math.round(map(offX, 0, 1, Min, Max)/Rounding)*Rounding, Min, Max)
					TextLabel_5.Text = Start
					
					c.Value = Start
					event:Fire()
				end
			end)
			
			game:GetService("RunService").RenderStepped:Connect(function(dt)
				Color.Size = Color.Size:Lerp(UDim2.new(map(Start, Min, Max, 0, 1), 0, 1, 0), 0.3)
			end)

			return c
		end
		
		function b:CreateBind(Text, StartBind)

			local Bind = StartBind or nil
			local Bind2 = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local TextLabel = Instance.new("TextLabel")
			local Bind_2 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Bind_3 = Instance.new("TextButton")
			local Line = Instance.new("Frame")

			Bind2.Name = "Bind"
			Bind2.Parent = ScrollingFrame
			Bind2.Active = true
			Bind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Bind2.BackgroundTransparency = 1.000
			Bind2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind2.BorderSizePixel = 0
			Bind2.Selectable = true
			Bind2.Size = UDim2.new(1, 0, 0, 50)

			TextButton.Parent = Bind2
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.ZIndex = 2
			TextButton.Font = Enum.Font.SourceSans
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000
			TextButton.ClipsDescendants = true

			TextLabel.Parent = Bind2
			TextLabel.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel.Size = UDim2.new(1, -70, 1, -25)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = Text
			TextLabel.TextColor3 = Coloring.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 25.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Bind_2.Name = "Bind"
			Bind_2.Parent = Bind2
			Bind_2.AnchorPoint = Vector2.new(1, 0.5)
			Bind_2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
			Bind_2.BackgroundTransparency = 1.000
			Bind_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind_2.BorderSizePixel = 0
			Bind_2.ClipsDescendants = true
			Bind_2.Position = UDim2.new(1, -20, 0.5, 0)
			Bind_2.Size = UDim2.new(0, 30, 0, 30)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Bind_2

			Bind_3.Name = "Bind"
			Bind_3.Parent = Bind_2
			Bind_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Bind_3.BackgroundTransparency = 1.000
			Bind_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind_3.BorderSizePixel = 0
			Bind_3.Size = UDim2.new(1, 0, 1, 0)
			Bind_3.Font = Enum.Font.Gotham
			Bind_3.Text = "Unbound"
			Bind_3.TextColor3 = Coloring.TextColor
			Bind_3.TextSize = 25.000
			Bind_3.TextWrapped = true
			local function UpdateBindSize()
				local txt = game:GetService("TextService")

				local size = txt:GetTextSize(Bind_3.Text, Bind_3.TextSize, Bind_3.Font, Vector2.new(math.huge, Bind_3.AbsoluteSize.Y))

				Bind_2.Size = UDim2.new(0, math.clamp(size.X+8, 30, math.huge), 0, 30)
			end
			if StartBind then
				Bind_3.Text = StartBind.Name
				UpdateBindSize()
			end

			Line.Name = "Line"
			Line.Parent = Bind2
			Line.AnchorPoint = Vector2.new(0, 1)
			Line.BackgroundColor3 = Coloring.Secondary
			Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line.BorderSizePixel = 0
			Line.Size = UDim2.new(1, 0, 0, 1)

			local UIStroke = Instance.new("UIStroke", Bind_2)
			UIStroke.Thickness = 1
			UIStroke.Color = Coloring.Secondary
			
			colorChange:Connect(function()
				TextLabel.TextColor3 = Coloring.TextColor
				Bind_3.TextColor3 = Coloring.TextColor
				UIStroke.Color = Coloring.Secondary
				Line.BackgroundColor3 = Coloring.Secondary
			end)

			local c = {}

			local event = Instance.new("BindableEvent", GetFolder())
			event.Name = "Changed"

			c.Changed = event.Event
			c.Bind = Bind
			c.Instance = Bind2

			local changing = false

			TextButton.MouseButton1Click:Connect(function()
				changing = not changing

				if changing then
					Bind_3.Text = "..."
					UpdateBindSize()
				else
					Bind_3.Text = Bind.Name
					UpdateBindSize()
				end

				local circ = Instance.new("Frame", TextButton)
				circ.Position = UDim2.new(0, mouse.X - TextButton.AbsolutePosition.X, 0, mouse.Y - TextButton.AbsolutePosition.Y)
				circ.Size = UDim2.new(0,0,0,0)
				circ.AnchorPoint = Vector2.new(0.5, 0.5)
				circ.BackgroundColor3 = Coloring.Secondary
				circ.ZIndex = 2
				circ.BackgroundTransparency = 0.7

				local corner = Instance.new("UICorner", circ)
				corner.CornerRadius = UDim.new(1, 0)

				local i = 0
				repeat
					i += wait()/0.5
					i = math.clamp(i, 0, 1)
					local i2 = math.sin(i * (math.pi/2))
					circ.Size = UDim2.new(0,0,0,0):Lerp(UDim2.new(0, Bind2.AbsoluteSize.X * 1.50, 0, Bind2.AbsoluteSize.X * 1.5), i2)
					circ.BackgroundTransparency = lerp(0.7, 1, i2)
				until i >= 1

				circ:Destroy()
			end)

			game:GetService("UserInputService").InputBegan:Connect(function(i)
				if changing then
					if i.KeyCode == Enum.KeyCode.Unknown then
						Bind = i.UserInputType
					else
						Bind = i.KeyCode
					end
					c.Bind = Bind
					changing = false
					Bind_3.Text = Bind.Name
					UpdateBindSize()
				end
			end)
			
			

			return c
		end
		
		function b:CreateTextbox(Text, StartBind)
			local StartBind = StartBind or ""
			
			local Textbox = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local Bind_2 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Bind_3 = Instance.new("TextBox")
			local Line = Instance.new("Frame")

			Textbox.Name = "Textbox"
			Textbox.Parent = ScrollingFrame
			Textbox.Active = true
			Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Textbox.BackgroundTransparency = 1.000
			Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Textbox.BorderSizePixel = 0
			Textbox.Selectable = true
			Textbox.Size = UDim2.new(1, 0, 0, 50)

			TextLabel.Parent = Textbox
			TextLabel.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel.Size = UDim2.new(1, -70, 1, -25)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = Text
			TextLabel.TextColor3 = Coloring.TextColor
			TextLabel.TextScaled = true
			TextLabel.TextSize = 25.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			Bind_2.Name = "Bind"
			Bind_2.Parent = Textbox
			Bind_2.AnchorPoint = Vector2.new(1, 0.5)
			Bind_2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
			Bind_2.BackgroundTransparency = 1.000
			Bind_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind_2.BorderSizePixel = 0
			Bind_2.ClipsDescendants = true
			Bind_2.Position = UDim2.new(1, -20, 0.5, 0)
			Bind_2.Size = UDim2.new(0, 30, 0, 30)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Bind_2

			Bind_3.Name = "Bind"
			Bind_3.Parent = Bind_2
			Bind_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Bind_3.BackgroundTransparency = 1.000
			Bind_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind_3.BorderSizePixel = 0
			Bind_3.Size = UDim2.new(1, 0, 1, 0)
			Bind_3.Font = Enum.Font.Gotham
			Bind_3.Text = StartBind
			Bind_3.TextColor3 = Coloring.TextColor
			Bind_3.TextSize = 25.000
			Bind_3.TextWrapped = true
			Bind_3.ZIndex = 3
			Bind_3.ClearTextOnFocus = false
			local function UpdateBindSize()
				local txt = game:GetService("TextService")

				local size = txt:GetTextSize(Bind_3.Text, Bind_3.TextSize, Bind_3.Font, Vector2.new(math.huge, Bind_3.AbsoluteSize.Y))

				Bind_2.Size = UDim2.new(0, math.clamp(size.X+8, 30, math.huge), 0, 30)
			end
			UpdateBindSize()

			Line.Name = "Line"
			Line.Parent = Textbox
			Line.AnchorPoint = Vector2.new(0, 1)
			Line.BackgroundColor3 = Coloring.Secondary
			Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line.BorderSizePixel = 0
			Line.Size = UDim2.new(1, 0, 0, 1)

			local UIStroke = Instance.new("UIStroke", Bind_2)
			UIStroke.Thickness = 1
			UIStroke.Color = Coloring.Secondary
			
			colorChange:Connect(function()
				TextLabel.TextColor3 = Coloring.TextColor
				Bind_3.TextColor3 = Coloring.TextColor
				UIStroke.Color = Coloring.Secondary
				Line.BackgroundColor3 = Coloring.Secondary
			end)

			local c = {}

			c.Changed = Bind_3.Changed
			c.Value = StartBind
			c.Instance = Textbox
			
			Bind_3.Changed:Connect(function(tahp)
				if tahp == "Text" then
					c.Value = Bind_3.Text
					UpdateBindSize()
				end
			end)

			return c
		end
		
		function b:CreateToggle(Text, Init)
			local Toggled = Init or false
			
			local Toggle = Instance.new("Frame")
			local TextButton_4 = Instance.new("TextButton")
			local TextLabel_6 = Instance.new("TextLabel")
			local Toggle_2 = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			local Color_2 = Instance.new("Frame")
			local UICorner_7 = Instance.new("UICorner")
			local Line_5 = Instance.new("Frame")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame
			Toggle.Active = true
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Selectable = true
			Toggle.Size = UDim2.new(1, 0, 0, 50)

			TextButton_4.Parent = Toggle
			TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_4.BackgroundTransparency = 1.000
			TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_4.BorderSizePixel = 0
			TextButton_4.Size = UDim2.new(1, 0, 1, 0)
			TextButton_4.ZIndex = 2
			TextButton_4.Font = Enum.Font.SourceSans
			TextButton_4.Text = ""
			TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_4.TextSize = 14.000
			TextButton_4.ClipsDescendants = true

			TextLabel_6.Parent = Toggle
			TextLabel_6.AnchorPoint = Vector2.new(0, 0.5)
			TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.BackgroundTransparency = 1.000
			TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_6.BorderSizePixel = 0
			TextLabel_6.Position = UDim2.new(0, 10, 0.5, 0)
			TextLabel_6.Size = UDim2.new(1, -70, 1, -25)
			TextLabel_6.Font = Enum.Font.GothamBold
			TextLabel_6.Text = Text
			TextLabel_6.TextColor3 = Coloring.TextColor
			TextLabel_6.TextScaled = true
			TextLabel_6.TextSize = 25.000
			TextLabel_6.TextWrapped = true
			TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.AnchorPoint = Vector2.new(1, 0.5)
			Toggle_2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
			Toggle_2.BackgroundTransparency = 1.000
			Toggle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle_2.BorderSizePixel = 0
			Toggle_2.ClipsDescendants = true
			Toggle_2.Position = UDim2.new(1, -20, 0.5, 0)
			Toggle_2.Size = UDim2.new(0, 30, 0, 30)

			UICorner_6.CornerRadius = UDim.new(0, 4)
			UICorner_6.Parent = Toggle_2

			Color_2.Name = "Color"
			Color_2.Size = UDim2.new(0,0,0,0)
			Color_2.Parent = Toggle_2
			Color_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Color_2.BackgroundColor3 = Coloring.ToggleColor
			Color_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Color_2.BorderSizePixel = 0
			Color_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			
			UICorner_7.CornerRadius = UDim.new(1, 0)
			UICorner_7.Parent = Color_2
			
			if Toggled == true then
				Color_2.Size = UDim2.new(1, 0, 1, 0)
				UICorner_7.CornerRadius = UDim.new(0, 4)
			end

			Line_5.Name = "Line"
			Line_5.Parent = Toggle
			Line_5.AnchorPoint = Vector2.new(0, 1)
			Line_5.BackgroundColor3 = Coloring.Secondary
			Line_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line_5.BorderSizePixel = 0
			Line_5.Size = UDim2.new(1, 0, 0, 1)
			
			local UIStroke = Instance.new("UIStroke", Toggle_2)
			UIStroke.Thickness = 1
			UIStroke.Color = Coloring.Secondary
			
			colorChange:Connect(function()
				TextLabel_6.TextColor3 = Coloring.TextColor
				Color_2.BackgroundColor3 = Coloring.ToggleColor
				UIStroke.Color = Coloring.Secondary
				Line_5.BackgroundColor3 = Coloring.Secondary
			end)

			local c = {}

			local event = Instance.new("BindableEvent", GetFolder())
			event.Name = "Toggled"
			
			c.Value = Toggled
			c.Toggled = event.Event
			c.Instance = Toggle
			
			local toggling = false
			local tween = nil
			local tween1 = nil

			TextButton_4.MouseButton1Click:Connect(function()
				if toggling then
					if tween then
						tween:Stop()
					end
					if tween1 then
						tween1:Stop()
					end
					toggling = false
				end
				
				Toggled = not Toggled
				
				spawn(function()
					if Toggled then
						tween = game:GetService("TweenService"):Create(Color_2, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 1, 0)})
						tween1 = game:GetService("TweenService"):Create(UICorner_7, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {CornerRadius = UDim.new(0, 4)})
						tween:Play()
						tween1:Play()
						toggling = true
						tween.Completed:Wait()
						if toggling then
							toggling = false
						end
					else
						tween = game:GetService("TweenService"):Create(Color_2, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)})
						tween1 = game:GetService("TweenService"):Create(UICorner_7, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CornerRadius = UDim.new(1, 0)})
						tween:Play()
						tween1:Play()
						toggling = true
						tween.Completed:Wait()
						if toggling then
							toggling = false
						end
					end
				end)
				
				c.Value = Toggled
				event:Fire(Toggled)

				local circ = Instance.new("Frame", TextButton_4)
				circ.Position = UDim2.new(0, mouse.X - TextButton_4.AbsolutePosition.X, 0, mouse.Y - TextButton_4.AbsolutePosition.Y)
				circ.Size = UDim2.new(0,0,0,0)
				circ.AnchorPoint = Vector2.new(0.5, 0.5)
				circ.BackgroundColor3 = Coloring.Secondary
				circ.ZIndex = 2
				circ.BackgroundTransparency = 0.7

				local corner = Instance.new("UICorner", circ)
				corner.CornerRadius = UDim.new(1, 0)

				local i = 0
				repeat
					i += wait()/0.5
					i = math.clamp(i, 0, 1)
					local i2 = math.sin(i * (math.pi/2))
					circ.Size = UDim2.new(0,0,0,0):Lerp(UDim2.new(0, Toggle.AbsoluteSize.X * 1.50, 0, Toggle.AbsoluteSize.X * 1.5), i2)
					circ.BackgroundTransparency = lerp(0.7, 1, i2)
				until i >= 1

				circ:Destroy()
			end)
			

			return c
		end
		
		return b
	end
	
	return a
end

return m
