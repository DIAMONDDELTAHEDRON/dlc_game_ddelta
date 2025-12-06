---@class BoardConsoleStarter : Object
---@overload fun(...) : BoardConsoleStarter
local BoardConsoleStarter, super = Class(Object)

function BoardConsoleStarter:init(x, y, standalone)
    super.init(self, x, y)
	self:setParallax(0)
    --self.texture = Assets.getTexture("sword/effects/startransition/" .. sprite) or Assets.getTexture("sword/effects/startransition/default")
	
	self.draw_green_intro = false
	self.draw_blue = false
	self.draw_green = false
	self.draw_stars = false
	self.draw_static = false
	self.drawlogo = false
	self.createstars = false
	self.screenlerp = false
	self.boxy = 0
	
	self.standalone = standalone or 0
end

function BoardConsoleStarter:onAdd(parent)
	super.onAdd(self, parent)
	Game.world.timer:script(function(wait)
		wait(1/30)
		Assets.playSound("tv_poweron2")
		self.draw_green_intro = true
		wait(30/30)
		self.draw_green_intro = false
		self.draw_blue = true
		wait(24/30)
		self.draw_blue = false
		self.draw_green = true
		wait(22/30)
		self.draw_blue = true
		self.draw_green = false
		wait(23/30)
		self.draw_blue = false
		if self.standalone ~= 1 then
			wait(10/30)
			if self.standalone == 2 then
				Assets.playSound("nes_intro_extended")
			else
				Assets.playSound("nes_intro")			
			end
			self.drawlogo = true
			self.logocolor = ColorUtils.mergeColor(COLORS.black, ColorUtils.hexToRGB("#1F289F"), 0)
			self.createstars = 1
		else
			self:remove()
		end
	end)
end

function BoardConsoleStarter:update()
    super.update(self)
end

function BoardConsoleStarter:draw()
    super.draw(self)
	if self.draw_blue then
		Draw.setColor(ColorUtils.hexToRGB("#3F48CC"))
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		Draw.setColor(1,1,1,1)
	end
	if self.draw_green then
		Draw.setColor(ColorUtils.hexToRGB("#B5E61D"))
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		Draw.setColor(1,1,1,1)
	end
	if self.draw_green_intro then
		if not self.screenlerp then
			Game.world.timer:lerpVar(self, "boxy", 0, 1, 20, 5, "in")
			self.screenlerp = true
		end
		Draw.setColor(COLORS.black)
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		Draw.setColor(ColorUtils.hexToRGB("#B5E61D"))
		love.graphics.rectangle("fill", 0, 176 - (self.boxy * 146), SCREEN_WIDTH, (self.boxy * 146) * 2)
		Draw.setColor(1,1,1,1)
	end
end

return BoardConsoleStarter