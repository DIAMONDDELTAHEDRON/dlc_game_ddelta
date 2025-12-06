local TVTurnOff, super = Class(Object)

function TVTurnOff:init(x, y)
    super.init(self, x, y)

	self:setParallax(0,0)
	
	self.con = 0
	self.subcon = 0
	self.timer = 0
	self.timer2 = 0
		
	self.texture_1 = Assets.getTexture("effects/zapper/tvturnoff1")
	self.texture_2 = Assets.getTexture("effects/zapper/tvturnoff2")
	self.xscale1 = 10
	self.yscale1 = 10
	self.xscale2 = 0.1
	self.yscale2 = 0.1
end

function TVTurnOff:update()
	super.update(self)
	
	self.timer = self.timer + DTMULT
	if self.con == 0 then
		if self.timer >= 5 then
			self.con = 1
			self.timer = 0
		end
	elseif self.con == 1 then
		if self.timer >= 4 and self.subcon == 0 then
			Assets.playSound("tvturnoff")
			self.subcon = 1
		end
		if self.timer >= 8 then
			Assets.playSound("tvturnoff2")
			self.con = 2
			self.subcon = 0
			self.timer = 0
		end
	elseif self.con == 2 then
		self.timer2 = self.timer2 + DTMULT
		if self.timer >= 30 then
			self.con = 3
			self:remove()
		end
	end
end

function TVTurnOff:draw()
	super.draw(self)
	
    Draw.pushScissor()
	Draw.scissor(128-self.x, 64-self.y, 384, 256)
	if self.con > 0 and self.con < 3 then
		love.graphics.setColor(0,0,0,1)
		Draw.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	end
	love.graphics.setColor(1,1,1,1)
	if self.con == 0 then
		local alpha1 = MathUtils.lerp(0, 1, self.timer/5)
		love.graphics.setColor(1,1,1,alpha1)
		Draw.draw(self.texture_1, 320, 240, 0, 6, 10, 70, 119)
		love.graphics.setColor(1,1,1,1)
	elseif self.con == 1 then
		self.yscale1 = MathUtils.lerp(self.yscale1, 0.05, self.timer/8)
		Draw.draw(self.texture_1, 320, 240, 0, 6, self.yscale1, 70, 119)
		Draw.draw(self.texture_2, 320, 240, 0, 0.1, 0.1, 198, 193)
	elseif self.con == 2 then
		if self.timer <= 10 then
			self.xscale1 = MathUtils.lerp(self.xscale1, 0, self.timer/10)
			self.yscale1 = MathUtils.lerp(self.yscale1, 0.01, self.timer/10)
		end
		if self.timer2 <= 5 then
			self.xscale2 = MathUtils.lerp(self.xscale2, 0.4, self.timer2/5)
			self.yscale2 = MathUtils.lerp(self.yscale2, 0.4, self.timer2/5)
		else		
			self.xscale2 = MathUtils.lerp(self.xscale2, 0, (self.timer2-5)/5)
			self.yscale2 = MathUtils.lerp(self.yscale2, 0, (self.timer2-5)/5)
		end
		Draw.draw(self.texture_1, 320, 240, 0, self.xscale1, self.yscale1, 70, 119)
		Draw.draw(self.texture_2, 320, 240, 0, self.xscale2, self.yscale2, 198, 193)
	end
    Draw.popScissor()
end

return TVTurnOff