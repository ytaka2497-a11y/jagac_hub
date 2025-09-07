-- VehicleFly Package (Speed Toggle Example)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:FindFirstChild("VehicleFlyEvent") or Instance.new("RemoteEvent", ReplicatedStorage)
event.Name = "VehicleFlyEvent"

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "VehicleFlyGUI"

local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 100, 0, 40)
button.Position = UDim2.new(0, 20, 0, 200)
button.Text = "Fly"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextScaled = true

local label = Instance.new("TextLabel", gui)
label.Size = UDim2.new(0, 180, 0, 40)
label.Position = UDim2.new(0, 20, 0, 250)
label.Text = "VehicleFly OFF"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextScaled = true

local enabled = false
local flySpeed = 0.6

button.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        label.Text = "VehicleFly Speed: " .. tostring(flySpeed)
        event:FireServer(true, flySpeed)
    else
        label.Text = "VehicleFly OFF"
        event:FireServer(false, 0)
    end
end)

event.OnServerEvent:Connect(function(plr, toggle, speed)
    if toggle then
        print(plr.Name .. " started VehicleFly with speed " .. speed)
    else
        print(plr.Name .. " stopped VehicleFly")
    end
end)
