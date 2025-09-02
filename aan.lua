-- FINAL SCRIPT AAN HUB
-- Dibuat biar simple, UI bisa digeser + ada tombol Hide/Show
-- Fitur: Fly (naik/turun + atur speed), Teleport ke Player, Kill Player

-- UI Library sederhana
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local HideBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local FlyUpBtn = Instance.new("TextButton")
local FlyDownBtn = Instance.new("TextButton")
local SpeedSlider = Instance.new("TextBox")
local TeleportDropdown = Instance.new("TextButton")
local KillDropdown = Instance.new("TextButton")
local DropdownFrame = Instance.new("Frame")
local DropdownScrolling = Instance.new("ScrollingFrame")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- MainFrame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- Title
Title.Parent = MainFrame
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "🔥 AAN HUB 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

-- CloseBtn
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)

-- HideBtn (selalu muncul)
HideBtn.Parent = ScreenGui
HideBtn.Size = UDim2.new(0, 50, 0, 25)
HideBtn.Position = UDim2.new(0, 10, 0.8, 0)
HideBtn.Text = "Show"
HideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HideBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
HideBtn.Visible = false

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    HideBtn.Visible = true
end)

HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    HideBtn.Visible = false
end)

--------------------------------------------------------------------
-- FLY SYSTEM
--------------------------------------------------------------------
local flying = false
local flySpeed = 50
local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local bodyVel, bodyGyro

local function startFly()
    if flying then return end
    flying = true
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local hrp = char.HumanoidRootPart
    bodyVel = Instance.new("BodyVelocity")
    bodyVel.Velocity = Vector3.new(0,0,0)
    bodyVel.MaxForce = Vector3.new(1e5,1e5,1e5)
    bodyVel.Parent = hrp

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.CFrame = hrp.CFrame
    bodyGyro.MaxTorque = Vector3.new(1e5,1e5,1e5)
    bodyGyro.P = 1e5
    bodyGyro.Parent = hrp

    -- kontrol analog / WASD
    game:GetService("RunService").RenderStepped:Connect(function()
        if flying and bodyVel and bodyGyro then
            local camCF = workspace.CurrentCamera.CFrame
            local moveVec = Vector3.new()

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVec = moveVec + camCF.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVec = moveVec - camCF.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVec = moveVec - camCF.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVec = moveVec + camCF.RightVector
            end

            bodyVel.Velocity = moveVec * flySpeed
            bodyGyro.CFrame = camCF
        end
    end)
end

local function stopFly()
    flying = false
    if bodyVel then bodyVel:Destroy() bodyVel = nil end
    if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
end

-- FlyBtn
FlyBtn.Parent = MainFrame
FlyBtn.Size = UDim2.new(1, -20, 0, 30)
FlyBtn.Position = UDim2.new(0, 10, 0, 40)
FlyBtn.Text = "Fly: OFF"
FlyBtn.TextColor3 = Color3.fromRGB(255,255,255)
FlyBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)

FlyBtn.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
        FlyBtn.Text = "Fly: OFF"
    else
        startFly()
        FlyBtn.Text = "Fly: ON"
    end
end)

-- Tombol naik / turun
FlyUpBtn.Parent = MainFrame
FlyUpBtn.Size = UDim2.new(0.45, 0, 0, 25)
FlyUpBtn.Position = UDim2.new(0.05, 0, 0, 80)
FlyUpBtn.Text = "↑ Naik"
FlyUpBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
FlyUpBtn.TextColor3 = Color3.fromRGB(255,255,255)

FlyDownBtn.Parent = MainFrame
FlyDownBtn.Size = UDim2.new(0.45, 0, 0, 25)
FlyDownBtn.Position = UDim2.new(0.5, 0, 0, 80)
FlyDownBtn.Text = "↓ Turun"
FlyDownBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
FlyDownBtn.TextColor3 = Color3.fromRGB(255,255,255)

FlyUpBtn.MouseButton1Down:Connect(function()
    if flying and bodyVel then
        bodyVel.Velocity = bodyVel.Velocity + Vector3.new(0, flySpeed, 0)
    end
end)

FlyDownBtn.MouseButton1Down:Connect(function()
    if flying and bodyVel then
        bodyVel.Velocity = bodyVel.Velocity + Vector3.new(0, -flySpeed, 0)
    end
end)

-- Speed input
SpeedSlider.Parent = MainFrame
SpeedSlider.Size = UDim2.new(1, -20, 0, 25)
SpeedSlider.Position = UDim2.new(0, 10, 0, 115)
SpeedSlider.PlaceholderText = "Fly Speed (default 50)"
SpeedSlider.Text = ""
SpeedSlider.TextColor3 = Color3.fromRGB(255,255,255)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(40,40,40)

SpeedSlider.FocusLost:Connect(function()
    local val = tonumber(SpeedSlider.Text)
    if val then
        flySpeed = val
    end
end)

--------------------------------------------------------------------
-- TELEPORT & KILL PLAYER
--------------------------------------------------------------------
local function refreshPlayerList(action)
    DropdownScrolling:ClearAllChildren()
    local y = 0
    for _,plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 25)
            btn.Position = UDim2.new(0, 5, 0, y)
            btn.Text = plr.Name
            btn.TextColor3 = Color3.fromRGB(255,255,255)
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.Parent = DropdownScrolling

            btn.MouseButton1Click:Connect(function()
                if action == "teleport" then
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
                    end
                elseif action == "kill" then
                    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                        plr.Character.Humanoid.Health = 0
                    end
                end
                DropdownFrame.Visible = false
            end)
            y = y + 30
        end
    end
end

-- DropdownFrame
DropdownFrame.Parent = MainFrame
DropdownFrame.Size = UDim2.new(1, -20, 0, 150)
DropdownFrame.Position = UDim2.new(0, 10, 0, 150)
DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
DropdownFrame.Visible = false

DropdownScrolling.Parent = DropdownFrame
DropdownScrolling.Size = UDim2.new(1, 0, 1, 0)
DropdownScrolling.CanvasSize = UDim2.new(0,0,0,500)
DropdownScrolling.ScrollBarThickness = 5

-- Teleport Dropdown
TeleportDropdown.Parent = MainFrame
TeleportDropdown.Size = UDim2.new(1, -20, 0, 25)
TeleportDropdown.Position = UDim2.new(0, 10, 0, 150)
TeleportDropdown.Text = "Teleport ke Player"
TeleportDropdown.BackgroundColor3 = Color3.fromRGB(80,80,80)
TeleportDropdown.TextColor3 = Color3.fromRGB(255,255,255)

TeleportDropdown.MouseButton1Click:Connect(function()
    refreshPlayerList("teleport")
    DropdownFrame.Visible = true
end)

-- Kill Dropdown
KillDropdown.Parent = MainFrame
KillDropdown.Size = UDim2.new(1, -20, 0, 25)
KillDropdown.Position = UDim2.new(0, 10, 0, 180)
KillDropdown.Text = "Kill Player"
KillDropdown.BackgroundColor3 = Color3.fromRGB(150,0,0)
KillDropdown.TextColor3 = Color3.fromRGB(255,255,255)

KillDropdown.MouseButton1Click:Connect(function()
    refreshPlayerList("kill")
    DropdownFrame.Visible = true
end)
