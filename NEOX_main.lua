-- NEOX v1.0 | No Key
-- UI demo only: buttons change their visual state; no Blox Fruits automation is included.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")
local old = playerGui:FindFirstChild("NEOX")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "NEOX"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local function corner(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object
end

local function stroke(object, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.Parent = object
end

-- Loading panel
local loading = Instance.new("Frame")
loading.Size = UDim2.fromOffset(310, 142)
loading.Position = UDim2.new(0.5, -155, 0.5, -71)
loading.BackgroundColor3 = Color3.fromRGB(12, 16, 28)
loading.Parent = gui
corner(loading, 14)
stroke(loading, Color3.fromRGB(0, 170, 255), 2)

local loadTitle = Instance.new("TextLabel")
loadTitle.BackgroundTransparency = 1
loadTitle.Size = UDim2.new(1, 0, 0, 66)
loadTitle.Position = UDim2.fromOffset(0, 10)
loadTitle.Text = "NEOX"
loadTitle.TextColor3 = Color3.fromRGB(0, 190, 255)
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextSize = 34
loadTitle.Parent = loading

local loadStatus = Instance.new("TextLabel")
loadStatus.BackgroundTransparency = 1
loadStatus.Size = UDim2.new(1, 0, 0, 24)
loadStatus.Position = UDim2.fromOffset(0, 68)
loadStatus.Text = "LOADING..."
loadStatus.TextColor3 = Color3.fromRGB(225, 235, 255)
loadStatus.Font = Enum.Font.GothamBold
loadStatus.TextSize = 14
loadStatus.Parent = loading

local track = Instance.new("Frame")
track.Size = UDim2.new(1, -36, 0, 9)
track.Position = UDim2.fromOffset(18, 108)
track.BackgroundColor3 = Color3.fromRGB(35, 43, 61)
track.Parent = loading
corner(track, 8)

local fill = Instance.new("Frame")
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(0, 190, 255)
fill.Parent = track
corner(fill, 8)

TweenService:Create(fill, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
    Size = UDim2.new(1, 0, 1, 0)
}):Play()
task.wait(1.6)
loading:Destroy()

-- Main window
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(430, 330)
main.Position = UDim2.new(0.5, -215, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(12, 16, 28)
main.Parent = gui
corner(main, 14)
stroke(main, Color3.fromRGB(0, 145, 255), 2)

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 62)
header.BackgroundColor3 = Color3.fromRGB(18, 25, 42)
header.Parent = main
corner(header, 14)

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -70, 1, 0)
title.Position = UDim2.fromOffset(18, 0)
title.Text = "NEOX  |  NO KEY"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(0, 190, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 23
title.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(34, 34)
close.Position = UDim2.new(1, -46, 0, 14)
close.BackgroundColor3 = Color3.fromRGB(42, 49, 68)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.Parent = header
corner(close, 8)
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1, -32, 0, 28)
subtitle.Position = UDim2.fromOffset(16, 70)
subtitle.Text = "Blox Fruits  •  Interface Demo"
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextColor3 = Color3.fromRGB(155, 170, 195)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.Parent = main

local items = {"Auto Farm Level", "Auto Quest", "Auto Boss", "Auto Race V4", "Auto Haki"}
for index, label in ipairs(items) do
    local y = 106 + (index - 1) * 42

    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -32, 0, 34)
    row.Position = UDim2.fromOffset(16, y)
    row.BackgroundColor3 = Color3.fromRGB(25, 32, 49)
    row.Parent = main
    corner(row, 8)

    local textLabel = Instance.new("TextLabel")
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, -82, 1, 0)
    textLabel.Position = UDim2.fromOffset(12, 0)
    textLabel.Text = label
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextColor3 = Color3.fromRGB(235, 240, 250)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 13
    textLabel.Parent = row

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.fromOffset(58, 24)
    toggle.Position = UDim2.new(1, -68, 0.5, -12)
    toggle.BackgroundColor3 = Color3.fromRGB(65, 72, 90)
    toggle.Text = "OFF"
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 11
    toggle.Parent = row
    corner(toggle, 12)

    local enabled = false
    toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        toggle.Text = enabled and "ON" or "OFF"
        toggle.BackgroundColor3 = enabled
            and Color3.fromRGB(0, 145, 220)
            or Color3.fromRGB(65, 72, 90)
    end)
end

local footer = Instance.new("TextLabel")
footer.BackgroundTransparency = 1
footer.Size = UDim2.new(1, -32, 0, 18)
footer.Position = UDim2.new(0, 16, 1, -22)
footer.Text = "NEOX v1.0  •  UI only"
footer.TextXAlignment = Enum.TextXAlignment.Left
footer.TextColor3 = Color3.fromRGB(0, 170, 235)
footer.Font = Enum.Font.Gotham
footer.TextSize = 11
footer.Parent = main
