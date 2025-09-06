return {
    read = function(cutscene, event)
        cutscene:text("* Welcome to .[wait:10]\n* Just have some good ol' fun.")
        --* Welcome to plug'n play.
        --* Welcome to the game corner.
        --* Welcome to the play area.
        --* Welcome to the prize corner.
        --* Games. Unlimited Games. But no more Games
    end,
    ramb = function(cutscene, event)
        cutscene:text("* ...")
    end,

    shadow_dude = function(cutscene, event)
        if Game.world.map.wife then
            cutscene:text("* I miss her so much.")
        else
            cutscene:text("* They call me [color:black]Shadow Dude[color:reset].")
            cutscene:text("* My life hasn't been the same ever since my wife left[wait:30] for work this morning.")
            Game.world.map.wife = true
        end
    end,
}
