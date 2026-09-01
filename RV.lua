-- RV HUB


local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RVHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(280, 300)
main.Position = UDim2.new(0.5, -140, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 110, 0)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 55)
title.BackgroundColor3 = Color3.fromRGB(110, 45, 0)
title.Text = "RV HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = main

local function createToggle(text, y)
    local enabled = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -30, 0, 42)
    button.Position = UDim2.fromOffset(15, y)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 15
    button.Font = Enum.Font.Gotham
    button.Text = text .. "    [ OFF ]"
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    button.MouseButton1Click:Connect(function()
        enabled = not enabled

        if enabled then
            button.Text = text .. "    [ ON ]"
            button.BackgroundColor3 = Color3.fromRGB(170, 70, 0)
        else
            button.Text = text .. "    [ OFF ]"
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        end
    end)
end

createToggle("Auto Farm", 70)
createToggle("Auto Chest", 120)
createToggle("Infinite Attack", 170)

local inventory = Instance.new("TextButton")
inventory.Size = UDim2.new(1, -30, 0, 42)
inventory.Position = UDim2.fromOffset(15, 225)
inventory.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
inventory.Text = "Inventory"
inventory.TextColor3 = Color3.new(1, 1, 1)
inventory.TextSize = 15
inventory.Font = Enum.Font.Gotham
inventory.Parent = main

local ic = Instance.new("UICorner")
ic.CornerRadius = UDim.new(0, 8)
ic.Parent = inventory
