local board, super = Class(Map)

function board:init(world, data)
    super.init(self, world, data)
	self.screencolor = COLORS.black
	self.screenalpha = 0.5
end

function board:onEnter()
    super.onEnter(self)
	self:getEvent(9):setColor(ColorUtils.mergeColor(COLORS.black, COLORS.white, 0.5))
    for _,chara in ipairs(Game.stage:getObjects(Character)) do
		chara:addFX(SwordHighlightFX(self.screenalpha, self.screencolor, {}), "highlight")
    end
end

function board:onExit()
    super.onExit(self)
end

function board:update()
    super.update(self)
	if not Game.world.board then
		for _,chara in ipairs(Game.stage:getObjects(Character)) do
			local hfx = chara:getFX("highlight")
			if hfx then
				hfx.alpha = self.screenalpha
				hfx.color = self.screencolor
			end
		end
	end
end

function board:drawCharacter(object)
    love.graphics.push()
    object:preDraw()
    object:draw()
    object:postDraw()
    love.graphics.pop()
end

function board:draw()
	local board = Game.world.board
    love.graphics.stencil(function()
		local last_shader = love.graphics.getShader()
		love.graphics.setShader(Kristal.Shaders["Mask"])
		self:drawCharacter(Game.world.player)
		love.graphics.rectangle("fill", -20, 380, SCREEN_WIDTH + 40, 120)
		love.graphics.setShader(last_shader)
	end, "replace", 1)
    love.graphics.setStencilTest("less", 1)
	if board and board.type == 1 then
		Draw.setColor(board.screencolor, board.screenalpha)
		love.graphics.setBlendMode("add")
		Draw.draw(board.tvglow_tex, 0, 320, 0, 2, 2)
		love.graphics.setBlendMode("alpha")
		Draw.setColor(1,1,1,1)
	end
	love.graphics.setStencilTest()
	super.draw(self)
end

return board