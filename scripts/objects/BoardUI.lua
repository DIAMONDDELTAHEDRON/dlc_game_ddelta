---@class BoardUI : Object
---@overload fun(...) : BoardUI
local BoardUI, super = Class(Object)

function BoardUI:init()
    super.init(self)

    self.quit_timer = 0
    Game.world.in_game = true

    self.layer = 22
    self.parallax_x = 0
    self.parallax_y = 0

    self.font = Assets.getFont("8bit")

    -- x + 94 for every other health bar
    self.healthbars = {}
    self.healthbars[1] = BoardHealthBar(128, 32, Game.world.board.player.actor)
    self:addChild(self.healthbars[1])

    for i, follower in ipairs(Game.world.board.followers) do
        local x = 128 + (94 * i)
        local b = i + 1
        self.healthbars[b] = BoardHealthBar(x, 32, follower.actor)
        self:addChild(self.healthbars[b])
    end

    self.score_bar = BoardScoreBar(410, 32)
    self:addChild(self.score_bar)

    self.inventory_bar = BoardInventoryBar(80, 64)
    self:addChild(self.inventory_bar)
	
    self.sword_route = false
    self.font = Assets.getFont("main")
    self.instruction_active = false
    self.instruction_lerp = 0
	self.timer_tex = Assets.getFrames("ui/timer/timer")
	self.canceltimer = 0
	self.canceltime = 30
end

function BoardUI:addItem(item, slot)
    self.inventory_bar:addItem(item, slot)
end

function BoardUI:update()
    super.update(self)

    local p = Game.world.board.player
    if self.canceltimer >= self.canceltime then
        self:quit()
    end
	
    if Input.pressed("confirm") and not Game.world:hasCutscene() then
        if p:interact() then
            Input.clear("confirm")
        else
            p:characterAction()
            Input.clear("confirm")
        end
    end
	
	local canceltimerprogress = true
	if canceltimerprogress then
		if Game.world:hasCutscene() then
			canceltimerprogress = false
		end
		
		if Game.lock_movement then
			canceltimerprogress = false
		end
		
		if Input.down("confirm") or Input.down("down") or Input.down("up") or Input.down("left") or Input.down("right") then
			canceltimerprogress = false
		end
	end

    if Input.down("cancel") and self.instruction_active then
        self.canceltimer = self.canceltimer + DTMULT
		
		if not canceltimerprogress then
			self.canceltimer = math.min(self.canceltimer, self.canceltime - 2)
		end
    else
        self.canceltimer = 0
    end

    if Input.pressed("menu") and #Game.party == 1 and p.chara_state == "none" and not (Game.world:hasCutscene() or self.sword_route or p.carry) then
        p:switchCharacter()
    end
end

function BoardUI:addScore(score, sound)
    local scoreadder = self:addChild(BoardScoreAdder())
    scoreadder.scoreamount = score

    if sound then
        scoreadder.mysnd = sound
    end
end

function BoardUI:setScore(score)
    Game:setFlag("points", score)
end

function BoardUI:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)
    if self.instruction_lerp > 0 or self.instruction_active then
		if self.instruction_lerp < 1 and self.instruction_active then
			self.instruction_lerp = math.min(self.instruction_lerp + 0.1 * DTMULT, 1)
		elseif not self.instruction_active then
			self.instruction_lerp = math.max(self.instruction_lerp - 0.1 * DTMULT, 0)
		end
		local easelerp = math.pow(self.instruction_lerp-1, 3) + 1
		local space = 28
		local margin = 20
		local yloc = SCREEN_HEIGHT - (space * 2) - margin
		local reddening = MathUtils.clamp(self.canceltimer / self.canceltime, 0, 1)
		local redcol = ColorUtils.mergeColor(COLORS.white, COLORS.red, reddening)
		local butmarg = -12
		for i = 1, 1 do
			local xloc = SCREEN_WIDTH + 100 - margin - (easelerp * 100)
			if Input.usingGamepad() then
				local buttspr = Input.getTexture("cancel")
				local butoffset = 4
				local str = " : Quit"
				local strwidth = self.font:getWidth(str)
				Draw.setColor(redcol[1], redcol[2], redcol[3], 1)
				love.graphics.printfOutline(str, xloc - strwidth, yloc + (space * i), 1)
				local butxpos = xloc - strwidth - buttspr:getWidth() + butmarg
				Draw.draw(buttspr, butxpos, yloc + (space * i) + butoffset, 0, 2, 2)
				local holdstr = "Hold "
				local holdstrwidth = self.font:getWidth(holdstr)
				love.graphics.printfOutline(holdstr, butxpos - holdstrwidth - 4, yloc + (space * i), 1)
				local spritexpos = butxpos - 4 - 28 - 1 - holdstrwidth + MathUtils.round(butmarg / 2)
				local spriteypos = yloc + (space * i) + 3
				Draw.setColor(redcol[1], redcol[2], redcol[3], self.canceltimer/8)
				if self.instruction_active then
					Draw.draw(self.timer_tex[1 + math.floor(MathUtils.clamp((28 - ((self.canceltimer / self.canceltime) * 28)), 0, 28))], spritexpos, spriteypos, 0, 2, 2)
				end
				Draw.setColor(1,1,1,1)
			else
				local str = "Hold "..Input.getText("cancel").." : Quit"
				local strwidth = self.font:getWidth(str)
				local spritexpos = 720 - easelerp * 100 - MathUtils.round(strwidth) - 28 - 8
				local spriteypos = yloc + (space * i) + 3
				Draw.setColor(redcol[1], redcol[2], redcol[3], self.canceltimer/8)
				if self.instruction_active then
					Draw.draw(self.timer_tex[1 + math.floor(MathUtils.clamp((28 - ((self.canceltimer / self.canceltime) * 28)), 0, 28))], spritexpos, spriteypos, 0, 2, 2)
				end
				Draw.setColor(redcol[1], redcol[2], redcol[3], 1)
				love.graphics.printfOutline(str, xloc - strwidth, yloc + (space * i), 1)
				Draw.setColor(1,1,1,1)
			end
		end
    end
end

function BoardUI:quit()
	self.instruction_active = false	
	Game.world.timer:lerpVar(self.inventory_bar, "x", 80, -48, 10, 3, "in")
	Game.world.timer:lerpVar(self.healthbars[1], "y", 32, -32, 10, 3, "in")
	if self.healthbars[2] then
		Game.world.timer:lerpVar(self.healthbars[2], "y", 32, -32, 10, 3, "in")
	end
	if self.healthbars[3] then
		Game.world.timer:lerpVar(self.healthbars[3], "y", 32, -32, 10, 3, "in")
	end
	Game.world.timer:lerpVar(self.score_bar, "y", 32, -32, 10, 3, "in")
	local tvturnoff = TVTurnOff(0, -48)
	tvturnoff.layer = self.layer + 1
    Game.world:addChild(tvturnoff)
	Game.world.timer:after(15/30, function()
		Game.world.board:remove()
		self:remove()
		Game.world.player.active = true
	end)
    Game.world.music:stop()
end

return BoardUI