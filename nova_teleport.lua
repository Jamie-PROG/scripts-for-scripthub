-- illremember's cool new bring script
-- requires 2 tools, replace TARGET name with person you want
TARGET = "Novegk"

lplayer = game:GetService("Players").LocalPlayer
for i,v in pairs(lplayer.Backpack:GetChildren())do
lplayer.Character.Humanoid:EquipTool(v)
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") then
v.Parent = lplayer.Character
wait()
v.Parent = game:GetService("Players")[TARGET].Character
end
end
wait(1)
local function getout(player,player2)
local char1,char2=player.Character,player2.Character
if char1 and char2 then
char1:MoveTo(char2.Head.Position)
end
end
getout(lplayer, lplayer)