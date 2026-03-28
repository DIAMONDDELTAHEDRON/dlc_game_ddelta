---@class BoardSquareTransition : Object
---@overload fun(...) : BoardSquareTransition
local BoardSquareTransition, super = Class(Object)

function BoardSquareTransition:init(x, y)
    super.init(self, x, y)
	self:setParallax(0)
	self.timer = 0
	self.baramount = 7
	self.completed = false
	self.doom = false
	self.heart_tex = Assets.getFrames("sword/title/heart")
end

function BoardSquareTransition:draw()
    super.draw(self)
	self.timer = self.timer + DTMULT
	if self.timer >= 15 then
		self.baramount = self.baramount - 1
		self.timer = 0
	end
	if self.baramount > 0 then
		for i = 0, self.baramount - 1 do
			Draw.setColor(COLORS.black)
			love.graphics.rectangle("fill", 128, 64 + (32 * (7 - i)), SCREEN_WIDTH, 32)
			Draw.setColor(1,1,1,1)
			local heartsize = 1
			if heartsize == 1 then
				if i == 4 then
					Draw.draw(self.heart_tex[1], 312, 182, 0, 1, 1)
				end
				if i == 3 then
					Draw.draw(self.heart_tex[2], 312, 192, 0, 1, 1)
				end
			end
			if heartsize == 2 then
				if i == 4 then
					Draw.draw(self.heart_tex[1], 302, 172, 0, 2, 2)
				end
				if i == 3 then
					Draw.draw(self.heart_tex[2], 302, 192, 0, 2, 2)
				end
			end
		end
	else
		self.completed = true
		if not self.doom then
			self.doom = true
			Game.world.timer:after(10/30, function()
				self:remove()
			end)
		end
	end
end

return BoardSquareTransition