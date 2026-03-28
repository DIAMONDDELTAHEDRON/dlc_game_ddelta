return {
    play = function(cutscene, event)
        if Game.world.board then return end --This is such a hacky way to do this

        local c = cutscene:choicer({"Play", "Don't"})
        if c == 1 then
			local event = event or {}
			local data = event.data or {}
			local p = data.properties or {}
			local board = p.map or p.board or "world_test_map"
			-- Index starts at 0, (2 == 3, 1 == 2, etc)
			local x = p.x or 2
			local y = p.y or 0

            cutscene:detachFollowers()
            Assets.playSound("jump")

			local offx = {}
			offx["kris"] = 5
			offx["hero"] = 2
			offx["susie"] = 2
			offx["ralsei"] = 2
			offx["dess"] = 2
			local offy = {}
			offy["susie"] = 10
			offy["ralsei"] = 10
			offy["dess"] = 10
            Game.world.player:jumpTo(262 + (offx[Game.world.player.actor.id] and offx[Game.world.player.actor.id] or 0), 472 + (offy[Game.world.player.actor.id] and offy[Game.world.player.actor.id] or 0), 20, 0.5, "ball", "landed")
            local f = Game.world.followers
            if f[1] then
                f[1]:jumpTo(162 + (offx[f[1].actor.id] and offx[f[1].actor.id] or 0), 472 + (offy[f[1].actor.id] and offy[f[1].actor.id] or 0), 20, 0.5, "ball", "landed")
            end

            if f[2] then
                f[2]:jumpTo(362 + (offx[f[2].actor.id] and offx[f[2].actor.id] or 0), 472 + (offy[f[2].actor.id] and offy[f[2].actor.id] or 0), 20, 0.5, "ball", "landed")
            end

            if f[3] then
                f[3]:jumpTo(462 + (offx[f[3].actor.id] and offx[f[3].actor.id] or 0), 472 + (offy[f[3].actor.id] and offy[f[3].actor.id] or 0), 20, 0.5, "ball", "landed")
            end

            cutscene:wait(0.6)
            
            for i, b in ipairs(Game.world.followers) do
                b:setFacing("up")
            end

            Game.world.player:resetSprite()
            cutscene:wait(0.5)
            local board = BoardWorld(board, 0, x, y)
            Game.world.player.active = false
            Game.world:addChild(board)
			Game.world.music:stop()
			board = Game.world.board
			board.ui.healthbars[1].y = -32
			if board.ui.healthbars[2] then
				board.ui.healthbars[2].y = -32
			end
			if board.ui.healthbars[3] then
				board.ui.healthbars[3].y = -32
			end
			board.ui.score_bar.y = -32
			board.ui.inventory_bar.x = -48
			local end_ui_move = false
			if not p.no_ui then
				Game.world.timer:lerpVar(board.ui.inventory_bar, "x", -48, 80, 15, 3, "out")
				Game.world.timer:after(2/30, function()
					if board.ui.healthbars[2] then
						Game.world.timer:lerpVar(board.ui.healthbars[2], "y", -32, 32, 15, 3, "out")
					else
						Game.world.timer:lerpVar(board.ui.healthbars[1], "y", -32, 32, 15, 3, "out")
					end
				end)
				Game.world.timer:after(4/30, function()
					if board.ui.healthbars[2] then
						Game.world.timer:lerpVar(board.ui.healthbars[1], "y", -32, 32, 15, 3, "out")
					else
						Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
						end_ui_move = true
					end
				end)
				Game.world.timer:after(6/30, function()
					if not end_ui_move then
						if board.ui.healthbars[3] then
							Game.world.timer:lerpVar(board.ui.healthbars[3], "y", -32, 32, 15, 3, "out")
						else
							Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
							end_ui_move = true
						end
					end
				end)
				Game.world.timer:after(8/30, function()
					if not end_ui_move then
						Game.world.timer:lerpVar(board.ui.score_bar, "y", -32, 32, 15, 3, "out")
					end
				end)
			else
				board.ui.ui_enabled = false
			end
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
    play_sword = function(cutscene, event)
        if Game.world.board then return end
        cutscene:detachFollowers()
		local krx = 320
		local kry = 374
		local dist = MathUtils.round(math.abs(krx - Game.world.player.x) / 2)
		local walktime = dist
		if dist > 0 then
			Game.world.player:walkTo(krx, kry, dist/30)
		end
		cutscene:wait(walktime/30)
		Game.world.player:setPosition(krx, kry)
		Game.world.player:setFacing("up")
		cutscene:text("* (Looks like a game console.)")
		cutscene:text("* (Play it?)")
        local c = cutscene:choicer({"Yes", "No"})
        if c == 1 then
			local event = event or {}
			local data = event.data or {}
			local p = data.properties or {}
			local board = p.map or p.board or "sword_test_map"
			-- Index starts at 0, (2 == 3, 1 == 2, etc)
			local x = p.x or 2
			local y = p.y or 0
            Game.world.player:resetSprite()
            local board = BoardWorld(board, 1, x, y, 128, 32, 384, 288)
            Game.world.player.active = false
            Game.world:addChild(board)
			Game.world.music:stop()
			board = Game.world.board
			board.sword_yoff_active = false
			board.ui.ui_enabled = false
			board.player.visible = false
			for _,follower in ipairs(board.followers) do
				follower.visible = false
			end
			for _,screencol in ipairs(board:getEvents("screencolorchanger")) do
				screencol.active = false
			end
			local black = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
			black:setParallax(0)
			black:setColor(COLORS.black)
			black.alpha = 1
			black.layer = WORLD_LAYERS["top"] - 2
            Game.world.board:addChild(black)
			local starter = BoardConsoleStarter(-128, -32, 0)
			starter.layer = WORLD_LAYERS["top"] - 1
            Game.world.board:addChild(starter)
			cutscene:wait(function() 
				if starter and starter:isRemoved() then
					return true
				end
				return false
			end)
			if Game.world.board.doomed then
				Game.world.board.ui:remove()
				Game.world.board:remove()
				Game.world.player:setFacing("down")
				Game.world.player.active = true
			else
				black:remove()
				board.sword_yoff_active = true
				board.player.visible = true
				local squaretrans = BoardSquareTransition(-128, -64)
				squaretrans.layer = WORLD_LAYERS["top"] - 1
				Game.world.board:addChild(squaretrans)
				local start_color = board.map.data.properties.start_color and TiledUtils.parseColorProperty(board.map.data.properties.start_color) or ColorUtils.hexToRGB("#E2FF81")
				local steps = 8
				local delay = 15
				for i = 0, steps do
					Game.world.timer:after((delay * (i - 1))/30, function()
						board.screencolor = ColorUtils.mergeColor(COLORS.black, start_color, i / steps)
					end)
				end
				cutscene:wait(function() 
					if squaretrans and squaretrans.completed then
						return true
					end
					return false
				end)
				Game.world.board.drawui_sword = true
				for _,screencol in ipairs(board:getEvents("screencolorchanger")) do
					screencol.active = true
				end
				Game.world.music:play()
			end
            return
        else
            return
        end
    end,
	fakeplay = function(cutscene, event)
		local c = cutscene:choicer({"Play", "Don't"})
		if c ~= 1 then return end
		local event = event or {}
		local data = event.data or {}
		local properties = data.properties or {}
		local x = properties.x
		local y = properties.y
		local board = Game.world.board
		Assets.playSound("board/damage")
		board.crt_glitch = 6
		board.crt_glitchstrength = 10
		if x then
			board.player.x = x
			for _,follower in ipairs(board.followers) do
				follower.x = x
			end
		end
		if y then
			board.player.y = y
			for _,follower in ipairs(board.followers) do
				follower.y = y
			end
		end
	end,
    h = function(cutscene, event)
        cutscene:boardText("HHHHHHH HH HHH HHHH HHH HHHHHHHH HHHHHHHH!")
    end,
    pip_lost = function(cutscene, event)
        cutscene:boardText("I'M LOST.")
    end,
    board_3_door = function(cutscene, event)
        cutscene:boardText("MIKE DO CUTSCENE STUFF HERE WHEN THEY GET THE Q'S PLEASE!")
    end,
    arltr = function(cutscene, event)
        cutscene:boardText("[color:green]IF YOU STOPPED EXISTING.\nWOULD ANYONE NOTICE?")
    end,
}
