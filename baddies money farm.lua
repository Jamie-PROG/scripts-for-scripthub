-- Create the GUI and button
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(1, -210, 0.5, -25)  -- Position the button to the right side of the screen
toggleButton.AnchorPoint = Vector2.new(1, 0.5)  -- Anchor the button to the right center
toggleButton.Text = "Start Farming"
toggleButton.Parent = screenGui

-- Initialize farming state
getgenv().farm = false

-- Function to toggle farming
local function toggleFarming()
    getgenv().farm = not getgenv().farm
    toggleButton.Text = getgenv().farm and "Stop Farming" or "Start Farming"
end

-- Connect the button to the toggle function
toggleButton.MouseButton1Click:Connect(toggleFarming)

-- Main farming script
local cash = workspace.Cash
local dmg = workspace.Damageables

for _, v in next, getconnections(player.Idled) do 
    v:Disable() 
end

local function getMoney()
    for _, m in pairs(cash:GetChildren()) do
        if m.Name == "Cash" and (m.Position - player.Character.HumanoidRootPart.Position).magnitude <= 20 then
            player.Character.HumanoidRootPart.CFrame = m.CFrame
            wait(.2)
            fireproximityprompt(m.ProximityPrompt, 6)
            wait(.35)
        end
        if not getgenv().farm then
            break
        end
    end
end

while true do
    wait(1)
    if getgenv().farm then
        pcall(function()
            for _, a in ipairs(dmg:GetChildren()) do
                if not getgenv().farm then
                    break
                end
                if a.Damageable.Value > 0 then
                    player.Character.HumanoidRootPart.CFrame = a.Screen.CFrame * CFrame.new(0, 0, 2)
                    wait(1)
                    repeat
                        if not getgenv().farm then
                            break
                        end
                        player.Character.HumanoidRootPart.CFrame = a.Screen.CFrame * CFrame.new(0, 0, 2)
                        game:GetService("ReplicatedStorage"):WaitForChild("PUNCHEVENT"):FireServer(1)
                        wait(.5)
                    until a.Damageable.Value <= 0
                    wait(1)
                    getMoney()
                end
            end
        end)
    end
end
