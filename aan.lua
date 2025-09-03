-- // Advanced GUI by AanZAPI (Modernized)
-- Modern, profesional, dan menarik ✨

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AanGUI"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Function buat kasih style tombol
local function styleBtn(btn, radius)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = true
    btn.TextScaled = true
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, radius or 8)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Thickness = 1
    stroke.Color = Color3.fromRGB(80,80,80)
    return btn
end

-- Toggle Button (kecil di sisi layar)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0,45,0,45)
ToggleBtn.Position = UDim2.new(0,12,0.5,-22)
ToggleBtn.Text = "🤖"
styleBtn(ToggleBtn, 12).Parent = ScreenGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 420)
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", MainFrame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(100,100,100)

-- Gradient effect
local grad = Instance.new("UIGradient", MainFrame)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45,45,55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25,25,25))
}
grad.Rotation = 90

-- Toggle logic
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "⚡ AanZAPI Control Panel"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -38, 0, 3)
CloseBtn.Text = "✖"
styleBtn(CloseBtn, 8).Parent = MainFrame
CloseBtn.TextColor3 = Color3.fromRGB(255,80,80)
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Fly Button
local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0.9, 0, 0, 45)
FlyBtn.Position = UDim2.new(0.05, 0, 0.13, 0)
FlyBtn.Text = "🚀 Aktifkan Fly"
styleBtn(FlyBtn).Parent = MainFrame

-- Tombol Naik & Turun
local UpBtn = Instance.new("TextButton")
UpBtn.Size = UDim2.new(0.43, 0, 0, 38)
UpBtn.Position = UDim2.new(0.05, 0, 0.28, 0)
UpBtn.Text = "⬆️ Naik"
styleBtn(UpBtn).Parent = MainFrame

local DownBtn = Instance.new("TextButton")
DownBtn.Size = UDim2.new(0.43, 0, 0, 38)
DownBtn.Position = UDim2.new(0.52, 0, 0.28, 0)
DownBtn.Text = "⬇️ Turun"
styleBtn(DownBtn).Parent = MainFrame

-- Atur Speed
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.9, 0, 0, 28)
SpeedLabel.Position = UDim2.new(0.05, 0, 0.42, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "⚡ Speed: 50"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.GothamSemibold
SpeedLabel.TextSize = 16
SpeedLabel.Parent = MainFrame

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0.43, 0, 0, 32)
PlusBtn.Position = UDim2.new(0.05, 0, 0.5, 0)
PlusBtn.Text = "+ Speed"
styleBtn(PlusBtn).Parent = MainFrame

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0.43, 0, 0, 32)
MinusBtn.Position = UDim2.new(0.52, 0, 0.5, 0)
MinusBtn.Text = "- Speed"
styleBtn(MinusBtn).Parent = MainFrame

-- Dropdown Teleport
local DropDown = Instance.new("TextButton")
DropDown.Size = UDim2.new(0.9, 0, 0, 45)
DropDown.Position = UDim2.new(0.05, 0, 0.62, 0)
DropDown.Text = "👥 Teleport Menu"
styleBtn(DropDown).Parent = MainFrame

-- Frame List Player
local ListFrame = Instance.new("ScrollingFrame")
ListFrame.Size = UDim2.new(0.9, 0, 0, 115)
ListFrame.Position = UDim2.new(0.05, 0, 0.78, 0)
ListFrame.CanvasSize = UDim2.new(0,0,0,0)
ListFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
ListFrame.ScrollBarThickness = 4
ListFrame.Visible = false
ListFrame.Parent = MainFrame
Instance.new("UICorner", ListFrame).CornerRadius = UDim.new(0, 8)
local lsStroke = Instance.new("UIStroke", ListFrame)
lsStroke.Thickness = 1
lsStroke.Color = Color3.fromRGB(60,60,60)

-- Refresh list player
local function refreshPlayers()
    for _,child in pairs(ListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local y = 0
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LP then
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, -5, 0, 32)
            Btn.Position = UDim2.new(0, 0, 0, y)
            Btn.Text = "📌 "..plr.Name
            styleBtn(Btn,6).Parent = ListFrame
            y = y + 36
            Btn.MouseButton1Click:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character:WaitForChild("HumanoidRootPart").CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
                end
            end)
        end
    end
    ListFrame.CanvasSize = UDim2.new(0,0,0,y)
end
Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)
refreshPlayers()

DropDown.MouseButton1Click:Connect(function()
    ListFrame.Visible = not ListFrame.Visible
end)

-- Fly System (logic sama kaya versi kamu, tinggal tempel)
local flying = false
local speed = 50
local bv
local flyY = 0
local upHeld, downHeld = false, false

local function startFly()
    local HRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.zero
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Parent = HRP

    RunService.RenderStepped:Connect(function()
        if flying and HRP and bv then
            local moveDir = LP.Character:FindFirstChild("Humanoid").MoveDirection
            if upHeld then
                flyY = speed
            elseif downHeld then
                flyY = -speed
            else
                flyY = 0
            end
            local vel = Vector3.new(moveDir.X*speed, flyY, moveDir.Z*speed)
            bv.Velocity = vel
        end
    end)
end

-- Tombol Naik / Turun logic (hold)
UpBtn.MouseButton1Down:Connect(function() if flying then upHeld = true end end)
UpBtn.MouseButton1Up:Connect(function() upHeld = false end)
DownBtn.MouseButton1Down:Connect(function() if flying then downHeld = true end end)
DownBtn.MouseButton1Up:Connect(function() downHeld = false end)

-- Speed control
PlusBtn.MouseButton1Click:Connect(function()
    speed = speed + 25
    SpeedLabel.Text = "⚡ Speed: "..speed
end)
MinusBtn.MouseButton1Click:Connect(function()
    speed = math.max(25, speed - 25)
    SpeedLabel.Text = "⚡ Speed: "..speed
end)

-- Toggle Fly
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "🟢 Fly Aktif" or "🔴 Fly Nonaktif"
    flyY = 0
    if flying then
        startFly()
    else
        if bv then bv:Destroy() bv = nil end
    end
end)
