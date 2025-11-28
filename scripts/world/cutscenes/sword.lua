return {
    play = function(cutscene, event)
        if Game.world.board then return end --This is such a hacky way to do this

        local c = cutscene:choicer({"Play", "Map2", "Don't"})
        if c == 1 then


            cutscene:detachFollowers()
            Assets.playSound("jump")

            Game.world.player:jumpTo(258, 474, 20, 0.5, "ball", "landed")
            local f = Game.world.followers
            if f[1] then
                f[1]:jumpTo(162, 474, 20, 0.5, "ball", "landed")
            end

            if f[2] then
                f[2]:jumpTo(362, 474, 20, 0.5, "ball", "landed")
            end

            if f[3] then
                f[3]:jumpTo(462, 474, 20, 0.5, "ball", "landed")
            end

            cutscene:wait(0.6)

            local board = BoardWorld("world_test_map", 2, 0)
            Game.world.player.active = false
            Game.world:addChild(board)
            return
        elseif c == 2 then
            local board = BoardWorld("other_board", 2, 2)
            Game.world.player.active = false
            Game.world:addChild(board)
            return
        else
            return
        end
    end,
    alrtr = function(cutscene, event)
        cutscene:boardText("")
    end,
}
