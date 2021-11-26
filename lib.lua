local flags = {}
local utility = {}
local library = {}
local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")
function utility.new(ins,props)
	local object = Instance.new(ins)
	for _,v in next, props do
		object[_] = v
	end
	return object
end

function library:window(name,name2)
	local sg = utility.new("ScreenGui",{Name = "kash", Parent = game.Players.LocalPlayer.PlayerGui, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	local mainframe = utility.new("Frame",{Name = "mainframe", Parent = sg, BackgroundColor3 = Color3.fromRGB(35, 34, 35), BorderColor3 = Color3.fromRGB(0, 0, 0), Position = UDim2.new(0,600,0,200), Size = UDim2.new(0, 448, 0, 356)})
	local container = utility.new("Frame",{Name = "container", Parent = mainframe, BackgroundColor3 = Color3.fromRGB(31, 31, 31), BorderColor3 = Color3.fromRGB(17, 86, 31), Position = UDim2.new(0, 1, 0, 2), Size = UDim2.new(0, 446, 0, 353)})
	local container_2 = utility.new("Frame",{Name = "container2", Parent = container, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 55), Size = UDim2.new(0, 444, 0, 298)})
	local title = utility.new("TextLabel",{Name = "Title", Parent = container, BackgroundColor3 = Color3.fromRGB(31, 31, 31), BorderSizePixel = 0, Position = UDim2.new(0.0133928964, 0, 0, 0), Size = UDim2.new(0, 439, 0, 26), Font = Enum.Font.SourceSans, Text = '<b><font color=\"#26D469\">'..name..'</font></b> '..name2, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, RichText = true})
	
	local titlebar = utility.new("Frame",{Name = "bar", Parent = title, BackgroundColor3 = Color3.fromRGB(17, 86, 31), BorderSizePixel = 0, Position = UDim2.new(0, -6, 0, 26), Size = UDim2.new(0, 447, 0, 1)})
	local tabs = utility.new("Frame",{Name = "tabs", Parent = container, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.0764872506, 0), Size = UDim2.new(0, 446, 0, 28)})
	
	local layout  = utility.new("UIListLayout",{Parent = tabs, FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder})
	
	local tabhand = {}
	function tabhand:setpage(name)
		container_2[name].Visible = true
	end
	function tabhand:tab(name)
		local tab = utility.new("TextButton",{Name = name, Parent = tabs, BackgroundColor3 = Color3.fromRGB(26, 26, 26), BorderColor3 = Color3.fromRGB(17, 86, 31), Position = UDim2.new(0.6013363, 0, 0, 0), Size = UDim2.new(0, 223, 0, 24), AutoButtonColor = false, Font = Enum.Font.SourceSansSemibold, Text = name, TextColor3 = Color3.fromRGB(38, 212, 105), TextSize = 16})
		local newpage = utility.new("ScrollingFrame",{Name = name, Parent = container_2, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Selectable = false, Size = UDim2.new(0, 444, 0, 298), ScrollBarThickness = 0})
		local left = utility.new("Frame",{Name = "left", Parent = newpage, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 11, 0, 8), Size = UDim2.new(0, 211, 0, 300)})
		local right = utility.new("Frame",{Name = "right", Parent = newpage, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 232, 0, 8), Size = UDim2.new(0, 211, 0, 300)})
		local layout = utility.new("UIListLayout",{Name = "layout", Parent = left, Padding = UDim.new(0,10)})
		local layout2 = utility.new("UIListLayout",{Name = "layout", Parent = right, Padding = UDim.new(0,10)})
		local dants = 0
		for _,v in next, tabs:GetChildren() do
			dants = dants + 1
		end
		for _,v in next, tabs:GetChildren() do
			if v:IsA("TextButton") then
				v.Size = UDim2.new(0, 446/(dants-1), 0, 24)
			end
		end
		tab.MouseButton1Click:connect(function()
			for _,v in next, container_2:GetChildren() do
				v.Visible = false
			end
			newpage.Visible = true
		end)
		for _,v in next, container_2:GetChildren() do
			v.Visible = false
		end
		newpage.Visible = true
		local sectionhand = {}
		function sectionhand:section(name,side)
			local section = utility.new("Frame",{Name = name, Parent = newpage[side], BackgroundColor3 = Color3.fromRGB(31, 31, 31), Position = UDim2.new(0, 531, 0, 23), Size = UDim2.new(0, 202, 0, 68), ZIndex = 2, BorderColor3 = Color3.fromRGB(21, 21, 21),AutomaticSize = Enum.AutomaticSize.XY})
			local itemcontainer = utility.new("Frame",{Name = "container", Parent = section, BackgroundColor3 = Color3.fromRGB(31, 31, 31), BorderColor3 = Color3.fromRGB(8, 8, 8), BorderSizePixel = 0, Position = UDim2.new(0, 13, 0, 14), Size = UDim2.new(0, 179, 0, 53),AutomaticSize = Enum.AutomaticSize.XY})
			local itemlayout = utility.new("UIListLayout",{Name = "itemlayout",Parent = itemcontainer,SortOrder = Enum.SortOrder.LayoutOrder,Padding = UDim.new(0, 7)})
			local bar = utility.new("Frame",{Name = "bar",Parent = section,BackgroundColor3 = Color3.fromRGB(17, 86, 31),BorderSizePixel = 0,Position = UDim2.new(0, 1, 0, 0),Size = UDim2.new(0, 200, 0, 2)})	
			local title = utility.new("TextLabel",{Name = "title", Parent = bar,BackgroundColor3 = Color3.fromRGB(31, 31, 31), BorderSizePixel = 0,Position = UDim2.new(0.0399999991, 0, -3, 0),Size = UDim2.new(0, 27, 0, 10), ZIndex = 3, Font = Enum.Font.SourceSans, Text = name, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
			local itemshandler = {}
			function itemshandler:button(name,callback)
				callback = callback or function() end
				local button = utility.new("TextButton",{Name = "button",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BorderColor3 = Color3.fromRGB(17, 86, 31),Size = UDim2.new(0, 175, 0, 18),AutoButtonColor = false,Font = Enum.Font.SourceSans,TextColor3 = Color3.fromRGB(247, 247, 247),TextSize = 14})
				button.MouseButton1Click:connect(function()
					callback()
				end)
			end
			function itemshandler:toggle(name,default,callback,flag)
                default = default or false
                flag = flag or name or ""
				callback = callback or function() end
				local togcontainer = utility.new("Frame",{Name = "togglecontainer",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,BorderSizePixel = 0,Size = UDim2.new(0, 175, 0, 23)})
				local togbutton = utility.new("TextButton",{Name = "toggle",Parent = togcontainer,BackgroundColor3 = Color3.fromRGB(18, 18, 18),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(0, 0, 0, 5),Size = UDim2.new(0, 11, 0, 11),AutoButtonColor = false,Font = Enum.Font.SourceSans,Text = "",TextColor3 = Color3.fromRGB(0, 0, 0),TextSize = 14})
				local togtitle = utility.new("TextLabel",{Name = "togglename", Text = name,Parent = togcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Position = UDim2.new(0.1, 0, 0, 0),Size = UDim2.new(0, 150, 0, 23),Font = Enum.Font.SourceSans,TextColor3 = Color3.fromRGB(247, 247, 247),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
				local togval = false
                if flag ~= "" then
                    flags[flag] = default
                end
                togval = default
                if togval then
                    togbutton.BackgroundColor3 = Color3.fromRGB(33, 135, 0)
                else
                    togbutton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                end
                callback(togval)
				togbutton.MouseButton1Click:connect(function()
					togval = not togval
                    if flag ~= "" then
                        flags[flag] = togval
                    end
					callback(togval)
					if togval then
						togbutton.BackgroundColor3 = Color3.fromRGB(33, 135, 0)
					else
						togbutton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					end
				end)
			end
			function itemshandler:dropdown(name,values,default,callback,flag)
                flag = flag or name or ""
				if default then
					callback(default)
				else
					default = default or ""
				end
				local dropcontainer = utility.new("Frame",{Name = "dropcontainer",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Position = UDim2.new(0, 0, 0.467741936, 0),Size = UDim2.new(0, 175, 0, 33)})
				local droptitle = utility.new("TextLabel",{Name = "droptitle",Parent = dropcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Position = UDim2.new(-0.02, 0, 0, -3),Size = UDim2.new(0, 179, 0, 13),Font = Enum.Font.SourceSans,TextColor3 = Color3.fromRGB(186, 186, 186),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left,Text = name})
				local dropbubtton = utility.new("Frame",{Name = "dropbutton",Parent = dropcontainer,Active = true,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(0, 0, 0, 13),Selectable = true,Size = UDim2.new(0, 175, 0, 19)})	
				local current = utility.new("TextButton",{Name = "current",Parent = dropbubtton,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Position = UDim2.new(0.034285713, 0, 0, 0),Size = UDim2.new(0, 169, 0, 19),Font = Enum.Font.SourceSans,Text = " - "..default,TextColor3 = Color3.fromRGB(255, 255, 255),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
				local instances = utility.new("Frame",{Name = "instance",Parent = dropbubtton,BackgroundColor3 = Color3.fromRGB(31, 31, 31),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(0, 0, 0, 20),Size = UDim2.new(0, 175, 0, 20),AutomaticSize = Enum.AutomaticSize.XY,Visible = false,ZIndex = 6})
				local droplayout = utility.new("UIListLayout",{Parent = instances,SortOrder = Enum.SortOrder.LayoutOrder,Padding = UDim.new(0, 2)})
				local droptog = false
                if flag ~= "" then
                    flags[flag] = default
                end
				for _,v in next, values do
					local textbutton = utility.new("TextButton",{Name = tostring(v),Parent = instances,BackgroundColor3 = Color3.fromRGB(31, 31, 31),BackgroundTransparency = 0,Position = UDim2.new(0.034285713, 0, 0, 0),Size = UDim2.new(0, 169, 0, 21),Font = Enum.Font.SourceSans,TextColor3 = Color3.fromRGB(241, 241, 241),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left,BorderColor3 = Color3.fromRGB(17, 86, 31),Text = " "..tostring(v),ZIndex = 7})
					textbutton.MouseButton1Click:connect(function()
						current.Text = " - "..textbutton.Name
                        if flag ~= "" then
                            flags[flag] = v
                        end
						callback(v)
					end)
				end
				current.MouseButton1Click:connect(function()
					droptog = not droptog
					if droptog then
						instances.Visible = true
					else
						instances.Visible = false
					end
				end)
			end
			function itemshandler:slider(name,min,default,max,callback,flag)
                flag = flag or name or ""
				default = default or  50
				min = min or 0
				max = max or 100
				callback = callback or function() end
				local val = default
				
				local slidecontainer = utility.new("Frame",{Name = "slidecontainer",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Size = UDim2.new(0, 179, 0, 29)})
				local slidertitle = utility.new("TextLabel",{Name = "slidetitle",Parent = slidecontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Position = UDim2.new(0, 0, 0, 0),Size = UDim2.new(0, 170, 0, 6),Font = Enum.Font.SourceSans,Text = name,TextColor3 = Color3.fromRGB(239, 239, 239),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
				local slider = utility.new("TextButton",{Name = "sliderbutton",Parent = slidecontainer,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(0, 0, 0, 13),Size = UDim2.new(0, 175, 0, 13),AutoButtonColor = false,Text = val,Font = Enum.Font.GothamBlack,TextSize = 10,TextColor3 = Color3.fromRGB(255, 255, 255),ZIndex = 5})
				local bar = utility.new("Frame",{Name = "bar",Parent = slider,BackgroundColor3 = Color3.fromRGB(34, 59, 31),BackgroundTransparency = 0.5,BorderSizePixel = 0,Size = UDim2.new(0, 0, 0, 19)})
				
                if flag ~= "" then
                    flags[flag] = default
                end

				slider.MouseButton1Down:connect(function()
					val = math.floor((((tonumber(max)-tonumber(min))/175)*bar.AbsoluteSize.X)+tonumber(min)) or 0
					pcall(function()
						callback(val)
					end)
					bar.Size = UDim2.new(0,math.clamp(mouse.X-bar.AbsolutePosition.X,0,175),0,13)
					slider.Text = val
					movecon = mouse.Move:connect(function()
						val = math.floor((((tonumber(max)-tonumber(min))/175)*bar.AbsoluteSize.X)+tonumber(min))
						pcall(function()
							callback(val)
						end)
						bar.Size = UDim2.new(0,math.clamp(mouse.X-bar.AbsolutePosition.X,0,175),0,13)
						slider.Text = val
					end)
					movrel = uis.InputEnded:connect(function(k)
						if k.UserInputType == Enum.UserInputType.MouseButton1 then
							val = math.floor((((tonumber(max)-tonumber(min))/175)*bar.AbsoluteSize.X)+tonumber(min))
							pcall(function()
								callback(val)
							end)
							bar.Size = UDim2.new(0,math.clamp(mouse.X-bar.AbsolutePosition.X,0,175),0,13)
							slider.Text = val
                            if flag ~= "" then
                                flags[flag] = val
                            end
							movecon:Disconnect()
							movrel:Disconnect()
						end
					end)
				end)
			end
			function itemshandler:keybind(name,default,callback,flag)
                if flag ~= "" then
                    flags[flag] = default
                end
                flag = flag or name or ""
				default = default or "None"
				local val = default
				local cuts = {
					["LeftShift"] = "LSHIFT",
					["RightShift"] = "RSHIFT",
					["LeftControl"] = "LCTRL",
					["RightControl"] = "RCTRL",
					["LeftAlt"] = "LALT",
					["RightAlt"] = "RALT",
					["MouseButton1"] = "M1",
					["MouseButton2"] = "M2",
					["MouseButton3"] = "M3"
				}
				local toggle = utility.new("TextButton",{Name = "toggle",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(18, 18, 18),BorderColor3 = Color3.fromRGB(17, 86, 31),Size = UDim2.new(0, 12, 0, 12),Text = "",AutoButtonColor = false})
				local keybind = utility.new("TextButton",{Name = "keybind",Parent = toggle,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BackgroundTransparency = 1,BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(1.41699982, 0, 0, 0),Size = UDim2.new(0, 117, 0, 12),Font = Enum.Font.GothamBold,Text = name,TextColor3 = Color3.fromRGB(220, 220, 220),TextSize = 11,TextXAlignment = Enum.TextXAlignment.Left})
				local currentkey = utility.new("TextButton",{Name = "currentkey",Parent = toggle,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(11.6669998, 0, 0, 0),Size = UDim2.new(0, 38, 0, 12),Font = Enum.Font.SourceSans,TextColor3 = Color3.fromRGB(255, 255, 255),TextSize = 11,Text = "["..val.."]"})
				
				local tog = false
				toggle.MouseButton1Click:connect(function()
					tog = not tog
					if tog then
						toggle.BackgroundColor3 = Color3.fromRGB(33, 135, 0)
					else
						toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
					end
				end)
				
				function utility:keyset(value)
					if value == "None" then
						currentkey.Text = "["..value.."]"
						val = value
					end
					currentkey.Text = "["..(cuts[value] or value).."]"
					val = value
                    if flag ~= "" then
                        flags[flag] = value
                    end
				end
				
				currentkey.MouseButton1Click:connect(function()
					currentkey.Text = "[...]"
					local key,pros = uis.InputBegan:wait()
					if key.KeyCode.Name ~= "Unknown" then
						utility:keyset(key.KeyCode.Name)
					end
				end)
				keybind.MouseButton1Click:connect(function()
					currentkey.Text = "[...]"
					local key,pros = uis.InputBegan:wait()
					if key.KeyCode.Name ~= "Unknown" then
						utility:keyset(key.KeyCode.Name)
					end
				end)
				uis.InputBegan:connect(function(key)
					if key.KeyCode.Name == val and tog == true then
						callback()
					end
				end)
			end
			function itemshandler:label(text,left)
				left = left or false
				local label = utility.new("TextLabel",{Parent = itemcontainer,BackgroundTransparency = 1,Size = UDim2.new(0, 175, 0, 17),Font = Enum.Font.SourceSansBold,Text = text,TextColor3 = Color3.fromRGB(234, 234, 234),TextSize = 14})
				if left == true then
					label.TextXAlignment = Enum.TextXAlignment.Left
				end
			end
			function itemshandler:colorpicker(text,default,callback,flag)
                flag = flag or text or ""
				local oncp = false
				local ondark = false
				local color = {1,1,1}
				local h, s, v = Color3.toHSV(default)
				local colorpicker = utility.new("TextLabel",{Name = "colorpicker",Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Size = UDim2.new(0, 132, 0, 17),Font = Enum.Font.SourceSansBold,Text = name,TextColor3 = Color3.fromRGB(234, 234, 234),TextSize = 14,TextXAlignment = Enum.TextXAlignment.Left})
				local button = utility.new("TextButton",{Name = "button",Parent = colorpicker,BackgroundColor3 = default,BorderColor3 = Color3.fromRGB(17, 86, 31),BorderSizePixel = 3,Position = UDim2.new(1.08333337, 0, 0, 0),Size = UDim2.new(0, 36, 0, 18),Font = Enum.Font.SourceSans,Text = "",TextColor3 = Color3.fromRGB(0, 0, 0),TextSize = 14})
				local rgb = utility.new("ImageButton",{Visible = false,Name = "rgb",Parent = button,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BorderColor3 = Color3.fromRGB(17, 86, 31),BorderSizePixel = 2,Position = UDim2.new(1.25, 0, 0, 0),Size = UDim2.new(0, 124, 0, 124),Image = "rbxassetid://6523286724"})
				local darkness = utility.new("ImageButton",{Visible = false,Name = "darkness",Parent = button,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BorderColor3 = Color3.fromRGB(17, 86, 31),BorderSizePixel = 2,Position = UDim2.new(4.86111116, 0, 0, 0),Size = UDim2.new(0, 15, 0, 124),Image = "rbxassetid://6523291212"})
				local darkc = utility.new("ImageLabel",{Name = "darkcircle",Parent = darkness,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Size = UDim2.new(0, 14, 0, 14),Image = "rbxassetid://3926309567",ImageColor3 = Color3.fromRGB(0, 0, 0),ImageRectSize = Vector2.new(48, 48),ImageRectOffset = Vector2.new(628, 420),ImageTransparency = 1})
				local rgbc = utility.new("ImageLabel",{Name = "rgbcircle",Parent = rgb,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Size = UDim2.new(0, 14, 0, 14),Image = "rbxassetid://3926309567",ImageColor3 = Color3.fromRGB(0, 0, 0),ImageRectSize = Vector2.new(48, 48),ImageRectOffset = Vector2.new(628, 420),ImageTransparency = 1})
				
                if flag ~= "" then
                    flags[flag] = default
                end

				local function zigzag(x) return math.acos(math.cos(x*math.pi))/math.pi end
				local function cp()
					if oncp then
						local x,y = mouse.X - rgb.AbsolutePosition.X,mouse.Y - rgb.AbsolutePosition.Y
						local maxX,maxY = rgb.AbsoluteSize.X,rgb.AbsoluteSize.Y
						if x< 0 then x = 0 end
						if x>maxX then x=maxX end
						if y<0 then y = 0 end
						if y>maxY then y = maxY end
						x = x/maxX
						y = y/maxY
						local cx = rgbc.AbsolutePosition.X/2
						local cy = rgbc.AbsolutePosition.Y/2
						rgbc.Position = UDim2.new(x,-cx,y,-cy)
						color = {1-x,1-y,color[3]}
						local realcolor = Color3.fromHSV(color[1],color[2],color[3])
						button.BackgroundColor3 = realcolor
						callback(realcolor)
					end
					if ondark then
						local y = mouse.Y - darkness.AbsolutePosition.Y
						local maxY = darkness.AbsoluteSize.Y
						if y<0 then y = 8 end
						if y>maxY then y = maxY end
						y = y/maxY
						local cy = darkc.AbsoluteSize.Y/2
						darkc.Position = UDim2.new(0.5,0,y,-cy)
						darkc.ImageColor3 = Color3.fromHSV(0,0,y)
						color = {color[1],color[2],1-y}
						local realcolor = Color3.fromHSV(color[1],color[2],color[3])
						button.BackgroundColor3 = realcolor
						callback(realcolor)
					end
				end
				local function setcolor(tbl)
					local cx = rgbc.AbsoluteSize.X/2
					local cy = rgbc.AbsoluteSize.Y/2
					color = {tbl[1],tbl[2],tbl[3]}
					rgbc.Position = UDim2.new(color[1],-cx,color[2]-1,-cy)
					local realcolor = Color3.fromHSV(color[1],color[2],color[3])
					button.BackgroundColor3 = realcolor
                    if flag ~= "" then
                        flags[flag] = tbl
                    end
					callback(realcolor)
				end
				mouse.Move:connect(cp)
				rgb.MouseButton1Down:connect(function()
					oncp = true
				end)
				darkness.MouseButton1Down:connect(function()
					ondark = true
				end)
				uis.InputEnded:connect(function(key)
					if key.UserInputType.Name == "MouseButton1" then
						if ondark then ondark = false end
						if oncp then oncp = false end
					end
				end)
				setcolor({h,s,v})
				local tog = false
				button.MouseButton1Click:connect(function()
					tog = not tog
					if tog then
						rgb.Visible = true
						darkness.Visible = true
					else
						rgb.Visible = false
						darkness.Visible = false
					end
				end)
			end
			function itemshandler:textbox(name,default,callback,flag)
                flag = flag or name or ""
				default = default or ""
				local label = utility.new("TextLabel",{Parent = itemcontainer,BackgroundColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,Size = UDim2.new(0, 175, 0, 14),Font = Enum.Font.SourceSans,Text = name,TextColor3 = Color3.fromRGB(255, 255, 255),TextSize = 14,TextStrokeColor3 = Color3.fromRGB(191, 191, 191),TextXAlignment = Enum.TextXAlignment.Left})
				local textbox = utility.new("TextBox",{Parent = label,BackgroundColor3 = Color3.fromRGB(25, 25, 25),BorderColor3 = Color3.fromRGB(17, 86, 31),Position = UDim2.new(0, 0, 1.10000002, 0),Size = UDim2.new(0, 175, 0, 14),Font = Enum.Font.SourceSansBold,PlaceholderColor3 = Color3.fromRGB(178, 178, 178),Text = default,TextColor3 = Color3.fromRGB(209, 209, 209),TextSize = 14})
				
                if flag ~= "" then
                    flags[flag] = default
                end
                
                textbox.FocusLost:connect(function(p)
					if not p then return end
                    if flag ~= "" then
                        flags[flag] = textbox.Text
                    end
					callback(textbox.Text)
				end)
			end
			return itemshandler
		end
		return sectionhand
	end
	return tabhand
end
return library
