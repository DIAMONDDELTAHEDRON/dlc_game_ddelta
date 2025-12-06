return {
    play = function(cutscene, event)
        if Game.world.board then return end --This is such a hacky way to do this

        local c = cutscene:choicer({"Play", "Don't"})
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
            
            for i, b in ipairs(Game.world.followers) do
                b:setFacing("up")
            end

            Game.world.player:resetSprite()
            cutscene:wait(0.5)
            local board = BoardWorld("world_test_map", 2, 0)
            Game.world.player.active = false
            Game.world:addChild(board)
			Game.world.music:stop()
			board = Game.world.board
			board.ui.healthbars[1].y = -32
			board.ui.healthbars[2].y = -32
			board.ui.healthbars[3].y = -32
			board.ui.score_bar.y = -32
			board.ui.inventory_bar.x = -48
			local end_ui_move = false
			Game.world.timer:lerpVar(board.ui.inventory_bar, "x", -48, 80, 15, 3, "out")
			Game.world.timer:after(2/30, function()
				Game.world.timer:lerpVar(board.ui.healthbars[1], "y", -32, 32, 15, 3, "out")
			end)
			Game.world.timer:after(4/30, function()
				if board.ui.healthbars[2] then
					Game.world.timer:lerpVar(board.ui.healthbars[2], "y", -32, 32, 15, 3, "out")
				else
					Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
					end_ui_move = true
				end
			end)
			Game.world.timer:after(6/30, function()
				if board.ui.healthbars[3] and not end_ui_move then
					Game.world.timer:lerpVar(board.ui.healthbars[3], "y", -32, 32, 15, 3, "out")
				else				
					Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
					end_ui_move = true
				end
			end)
			Game.world.timer:after(8/30, function()
				if not end_ui_move then
					Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
				end
			end)
			board.player.visible = false
			for _,follower in ipairs(board.followers) do
				follower.visible = false
			end
			local black = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
			black:setParallax(0)
			black:setColor(COLORS.black)
			black.alpha = 1
			black.layer = WORLD_LAYERS["top"] - 2
            Game.world.board:addChild(black)
			local starter = BoardConsoleStarter(0, -48, 1)
			starter.layer = WORLD_LAYERS["top"] - 1
            Game.world.board:addChild(starter)
			cutscene:wait(function() 
				if starter and starter:isRemoved() then
					return true
				end
				return false
			end)
			cutscene:wait(0.25)
			for i = 0, 8 do
				black.y = black.y + 32
				cutscene:wait(0.125)
			end
			black:remove()
			local star_transitions = {}
            Assets.stopAndPlaySound("board/mantle_unknown_b")
            local star = BoardStarTransition(board.player.actor.id, board.camera.x, board.camera.y, board.player.x-board.player.width, board.player.y-board.player.height*2, function()
				Assets.playSound("board/unsummon")
				board.player.visible = true
			end)
			star.layer = WORLD_LAYERS["above_events"]-0.01
            Game.world.board:addChild(star)
			table.insert(star_transitions, star)
            cutscene:wait(0.5)
			for _,follower in ipairs(board.followers) do
				Assets.stopAndPlaySound("board/mantle_unknown_b")
				local star = BoardStarTransition(follower.actor.id, board.camera.x, board.camera.y, follower.x-follower.width, follower.y-follower.height*2, function()
					Assets.playSound("board/unsummon")
					follower.visible = true
				end)
				star.layer = WORLD_LAYERS["above_events"]-0.01
				Game.world.board:addChild(star)
				table.insert(star_transitions, star)
				cutscene:wait(0.5)
			end
			cutscene:wait(function() 
				local removed_transitions = #star_transitions
				for _,star in ipairs(star_transitions) do
					if star and star:isRemoved() then
						removed_transitions = removed_transitions - 1
					end
				end
				if removed_transitions <= 0 then
					return true
				end
				return false
			end)
			Game.world.music:play()
			Game.world.board.ui.instruction_active = true
            return
        elseif c == 4 then
            local board = BoardWorld("other_board", 2, 2)
            Game.world.player.active = false
            Game.world:addChild(board)
            return
        else
            return
        end
    end,
    h = function(cutscene, event)
        cutscene:boardText("HHHHHHH HH HHH HHHH HHH HHHHHHHH HHHHHHHH!")
    end,
    board_3_door = function(cutscene, event)
        cutscene:boardText("MIKE DO CUTSCENE STUFF HERE WHEN THEY GET THE Q'S PLEASE!")
    end,
    arltr = function(cutscene, event)
        cutscene:boardText("[color:green]IF YOU STOPPED EXISTING.\nWOULD ANYONE NOTICE?")
    end,
}
