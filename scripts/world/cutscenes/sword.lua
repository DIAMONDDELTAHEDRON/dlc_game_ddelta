return {
    play = function(cutscene, event)
        if Game.world.board then return end --This is such a hacky way to do this

        local c = cutscene:choicer({"Play", "Don't"})
        if c == 1 then
            local board = BoardWorld("world_test_map", 2, 0)
            Game.world.player.active = false
            Game.world:addChild(board)
            return
        else
            return
        end
    end,
}
