-- RV HUB-- RV UI


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "RV_UI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(360, 110)
Main.Position = UDim2.new(0.5, -180, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Parent = gui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 55)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(210, 80, 0)
Stroke.Thickness = 2
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(75, 35)
Title.Position = UDim2.fromOffset(18, 10)
Title.BackgroundTransparency = 1
Title.Text = "RV"
Title.TextColor3 = Color3.fromRGB(255, 110, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = Main

local function createBox(name, x, default)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromOffset(115, 20)
    label.Position = UDim2.fromOffset(x, 15)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.Parent = Main

    local box = Instance.new("TextBox")
    box.Size = UDim2.fromOffset(115, 38)
    box.Position = UDim2.fromOffset(x, 40)
    box.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = tostring(default)
    box.Text = ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 15
    box.ClearTextOnFocus = false
    box.Parent = Main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 19)
    c.Parent = box

    return box
end

local WalkSpeed = createBox("Walk Speed", 105, 16)
local JumpPower = createBox("Jump Power", 235, 50)

-- Dragging
local dragging = false
local dragStart
local startPosition

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosition = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)local inventory =
