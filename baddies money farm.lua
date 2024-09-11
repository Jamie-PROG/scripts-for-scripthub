getgenv().config = {
    fps = 60,
    gui = true,
    checkPlayersNearby = false, -- will go away if someone is nearby (leave true if you want to be more stealthy)
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/db9befd2b15e75158d05001e9a430dc2.lua"))()
