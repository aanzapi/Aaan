-- // Advanced GUI by AanZAPI (Final Update + Checkpoint Page)
-- Bisa digeser, ada tombol close (toggle kecil tetap ada)
-- Fly controllable (analog untuk maju mundur, tombol naik/turun ditekan lama biar smooth)
-- Atur kecepatan fly
-- Teleport player list
-- Checkpoint Menu Page

-- Services
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AanGUI"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0,40,0,40)
ToggleBtn.Position = UDim2.new(0,10,0.5,-20)
ToggleBtn.Text = "🤖"
ToggleBtn.TextSize = 22
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
ToggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner",ToggleBtn).CornerRadius = UDim.new(0,10)

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 400)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Page 2 Frame (Checkpoint)
local CheckpointFrame = Instance.new("Frame")
CheckpointFrame.Size = UDim2.new(0, 250, 0, 400)
CheckpointFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
CheckpointFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CheckpointFrame.Active = true
CheckpointFrame.Draggable = true
CheckpointFrame.Visible = false
CheckpointFrame.Parent = ScreenGui
Instance.new("UICorner", CheckpointFrame).CornerRadius = UDim.new(0, 10)

-- Toggle logic
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "  AanCode444🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 16
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Fly Button
local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0.9, 0, 0, 40)
FlyBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
FlyBtn.Text = "✈️ Fly"
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyBtn.Font = Enum.Font.SourceSansBold
FlyBtn.TextSize = 18
FlyBtn.Parent = MainFrame
Instance.new("UICorner", FlyBtn).CornerRadius = UDim.new(0, 6)

-- Tombol Naik & Turun
local UpBtn = Instance.new("TextButton")
UpBtn.Size = UDim2.new(0.43, 0, 0, 35)
UpBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
UpBtn.Text = "⬆️ Naik"
UpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UpBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
UpBtn.Font = Enum.Font.SourceSansBold
UpBtn.TextSize = 16
UpBtn.Parent = MainFrame
Instance.new("UICorner", UpBtn).CornerRadius = UDim.new(0, 6)

local DownBtn = Instance.new("TextButton")
DownBtn.Size = UDim2.new(0.43, 0, 0, 35)
DownBtn.Position = UDim2.new(0.52, 0, 0.3, 0)
DownBtn.Text = "⬇️ Turun"
DownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DownBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
DownBtn.Font = Enum.Font.SourceSansBold
DownBtn.TextSize = 16
DownBtn.Parent = MainFrame
Instance.new("UICorner", DownBtn).CornerRadius = UDim.new(0, 6)

-- Atur Speed
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.9, 0, 0, 25)
SpeedLabel.Position = UDim2.new(0.05, 0, 0.42, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "⚡ Speed: 50"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.SourceSansBold
SpeedLabel.TextSize = 16
SpeedLabel.Parent = MainFrame

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0.43, 0, 0, 30)
PlusBtn.Position = UDim2.new(0.05, 0, 0.48, 0)
PlusBtn.Text = "+ Speed"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
PlusBtn.Font = Enum.Font.SourceSansBold
PlusBtn.TextSize = 14
PlusBtn.Parent = MainFrame
Instance.new("UICorner", PlusBtn).CornerRadius = UDim.new(0, 6)

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0.43, 0, 0, 30)
MinusBtn.Position = UDim2.new(0.52, 0, 0.48, 0)
MinusBtn.Text = "- Speed"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinusBtn.Font = Enum.Font.SourceSansBold
MinusBtn.TextSize = 14
MinusBtn.Parent = MainFrame
Instance.new("UICorner", MinusBtn).CornerRadius = UDim.new(0, 6)

-- Teleport Menu
local DropDown = Instance.new("TextButton")
DropDown.Size = UDim2.new(0.9, 0, 0, 40)
DropDown.Position = UDim2.new(0.05, 0, 0.6, 0)
DropDown.Text = "👤 Teleport Menu"
DropDown.TextColor3 = Color3.fromRGB(255, 255, 255)
DropDown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DropDown.Font = Enum.Font.SourceSansBold
DropDown.TextSize = 18
DropDown.Parent = MainFrame
Instance.new("UICorner", DropDown).CornerRadius = UDim.new(0, 6)

-- Frame List Player
local ListFrame = Instance.new("ScrollingFrame")
ListFrame.Size = UDim2.new(0.9, 0, 0, 110)
ListFrame.Position = UDim2.new(0.05, 0, 0.75, 0)
ListFrame.CanvasSize = UDim2.new(0,0,0,0)
ListFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
ListFrame.ScrollBarThickness = 4
ListFrame.Visible = false
ListFrame.Parent = MainFrame
Instance.new("UICorner", ListFrame).CornerRadius = UDim.new(0, 6)

local function refreshPlayers()
    for _,child in pairs(ListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local y = 0
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LP then
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, -5, 0, 30)
            Btn.Position = UDim2.new(0, 0, 0, y)
            Btn.Text = plr.Name
            Btn.TextColor3 = Color3.fromRGB(255,255,255)
            Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Btn.Parent = ListFrame
            y = y + 35
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

-- Tombol ke Page 2
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.9, 0, 0, 40)
CheckBtn.Position = UDim2.new(0.05, 0, 0.87, 0)
CheckBtn.Text = "⛰️ Checkpoints"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CheckBtn.Font = Enum.Font.SourceSansBold
CheckBtn.TextSize = 18
CheckBtn.Parent = MainFrame
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 6)

CheckBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    CheckpointFrame.Visible = true
end)

-- =======================
-- PAGE 2 CHECKPOINT MENU
-- =======================

local Title2 = Instance.new("TextLabel")
Title2.Size = UDim2.new(1, -40, 0, 30)
Title2.BackgroundTransparency = 1
Title2.Text = " ⛰️ Checkpoints"
Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title2.Font = Enum.Font.SourceSansBold
Title2.TextSize = 18
Title2.Parent = CheckpointFrame

local BackBtn = Instance.new("TextButton")
BackBtn.Size = UDim2.new(0, 30, 0, 30)
BackBtn.Position = UDim2.new(1, -30, 0, 0)
BackBtn.Text = "🔙"
BackBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
BackBtn.Font = Enum.Font.SourceSansBold
BackBtn.TextSize = 16
BackBtn.BackgroundTransparency = 1
BackBtn.Parent = CheckpointFrame
BackBtn.MouseButton1Click:Connect(function()
    CheckpointFrame.Visible = false
    MainFrame.Visible = true
end)

-- ScrollingFrame list checkpoints
local CPList = Instance.new("ScrollingFrame")
CPList.Size = UDim2.new(0.9, 0, 0.85, 0)
CPList.Position = UDim2.new(0.05, 0, 0.12, 0)
CPList.CanvasSize = UDim2.new(0,0,0,0)
CPList.BackgroundColor3 = Color3.fromRGB(30,30,30)
CPList.ScrollBarThickness = 4
CPList.Parent = CheckpointFrame
Instance.new("UICorner", CPList).CornerRadius = UDim.new(0, 6)

-- Refresh checkpoints
local function refreshCheckpoints()
    for _,child in pairs(CPList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local y = 0
    for _,part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and string.find(part.Name:lower(),"checkpoint") then
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, -5, 0, 30)
            Btn.Position = UDim2.new(0, 0, 0, y)
            Btn.Text = part.Name
            Btn.TextColor3 = Color3.fromRGB(255,255,255)
            Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Btn.Parent = CPList
            y = y + 35
            Btn.MouseButton1Click:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,3,0)
                end
            end)
        end
    end
    CPList.CanvasSize = UDim2.new(0,0,0,y)
end
refreshCheckpoints()

-- Fly System
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
    speed = speed + 10
    SpeedLabel.Text = "⚡ Speed: "..speed
end)
MinusBtn.MouseButton1Click:Connect(function()
    speed = math.max(10, speed - 10)
    SpeedLabel.Text = "⚡ Speed: "..speed
end)

-- Toggle Fly
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "✅ Fly ON" or "❎ Fly OFF"
    flyY = 0
    if flying then
        startFly()
    else
        if bv then bv:Destroy() bv = nil end
    end
end)
