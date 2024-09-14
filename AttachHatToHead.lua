-- Function to add an emote to the player's character
local function addEmote(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        -- Create a new Animation object for the emote
        local emote = Instance.new("Animation")
        emote.Name = "DanceEmote"  -- Name of the emote
        emote.AnimationId = "rbxassetid://1234567890"  -- Replace with the Asset ID of your emote

        -- Create an AnimationTrack to play the emote
        local animationTrack = humanoid:LoadAnimation(emote)
        animationTrack:Play()
        
        print("Emote added to player's character!")
    else
        warn("Humanoid not found in character!")
    end
end