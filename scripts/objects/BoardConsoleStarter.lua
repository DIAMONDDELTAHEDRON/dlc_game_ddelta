---@class BoardConsoleStarter : Object
---@overload fun(...) : BoardConsoleStarter
local BoardConsoleStarter, super = Class(Object)

function BoardConsoleStarter:init(x, y, standalone)
    super.init(self, x, y)
	self.draw_children_above = 0
	self:setParallax(0)
    --self.texture = Assets.getTexture("sword/effects/startransition/" .. sprite) or Assets.getTexture("sword/effects/startransition/default")
	
	self.con = 0
	self.draw_green_intro = false
	self.draw_blue = false
	self.draw_green = false
	self.draw_stars = false
	self.draw_static = false
	self.drawlogo = false
	self.createstars = 0
	self.stars = {}
	self.startimer = 0
	self.screenlerp = false
	self.drawboxcolor = false
	self.controllerprompt = false
	self.draw_heart = false
	self.boxy = 0
	self.statictimer = 0
	self.timer = 0
	self.timercon = 0
	self.drawcolor = COLORS.black
	self.static_tex = Assets.getFrames("effects/static_effect")
	self.nocontroller_tex = Assets.getTexture("sword/title/nocontroller")
	self.title_tex = Assets.getTexture("sword/title/title")
	self.sword_tex = Assets.getTexture("sword/title/sword")
	self.heart_tex = Assets.getFrames("sword/title/heart")
	self.font = Assets.getFont("8bit")
	self.bar1 = nil
	self.bar2 = nil
	
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
		Game.world.board.screencolor = COLORS.black
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
			wait(44/30)
			self.drawboxcolor = true
			self.drawcolor = ColorUtils.hexToRGB("#1B2063")
			self.logocolor = ColorUtils.mergeColor(COLORS.black, ColorUtils.hexToRGB("#1F289F"), 0.4)
			wait(20/30)
			self.drawboxcolor = true
			self.drawcolor = ColorUtils.hexToRGB("#2F38B0")
			self.logocolor = ColorUtils.mergeColor(COLORS.black, ColorUtils.hexToRGB("#1F289F"), 1)
			wait(40/30)
			if self.standalone == 0 then
				self.createstars = 2
				Assets.stopSound("nes_intro")
				self.drawboxcolor = false
				self.drawlogo = false
				self.draw_blue = true
				self.controllerprompt = true
				Assets.playSound("board/nes_nocontroller")
				wait(60/30)
				local havecontroller = true
				if havecontroller then
					self.con = 12
				else
					wait(1/30)
					self.controllerprompt = false
					self.draw_static = true
					Assets.playSound("tv_static")
					wait(9/30)
					Assets.stopSound("tv_static")
					self.draw_blue = false
					self.draw_static = false
					self.drawlogo = false
					self.controllerprompt = false
					self.draw_green = false
					self.body = 0
					self.draw_green_intro = false
					self.screenlerp = false
					self.drawboxcolor = false
					self.drawcolor = COLORS.black
					self.startimer = 0
					self.starindex = 0
					self.logoalpha = 0
					Game.world.board.screencolor = COLORS.black
					Game.world.board.doomed = true
					Game.world.board.visible = false
					wait(30/30)
					self:remove()
				end
			end
		else
			self:remove()
		end
	end)
end

function BoardConsoleStarter:update()
    super.update(self)
	if Game.world.board and Game.world.board.type == 1 then
		if self.draw_blue then
			Game.world.board.screencolor = ColorUtils.hexToRGB("#3F48CC")
		end
		if self.draw_static then
			Game.world.board.screencolor = ColorUtils.hexToRGB("#ADC7EB")
		end
		if self.draw_green then
			Game.world.board.screencolor = ColorUtils.hexToRGB("#B5E61D")
		end
		if self.drawboxcolor then
			Game.world.board.screencolor = self.drawcolor
		end
		if self.draw_green_intro then
			Game.world.board.screencolor = ColorUtils.mergeColor(COLORS.black, ColorUtils.hexToRGB("#B5E61D"), self.boxy)
		end
		if self.con == 12 then
			if self.timer >= 15 and self.timercon == 0 then
				-- player sprite changes here
				Assets.playSound("wing", 0.25, 1)
				self.timercon = 1
			end
			if self.timer >= 45 and self.timercon == 1 then
				Assets.playSound("tv_poweron")
				Game.world.board.screencolor = COLORS.black
				self.draw_blue = false
				self.controllerprompt = false
				self.timercon = 2
			end
			if self.timer >= 75 and self.timercon == 2 then
				Game.world.player:resetSprite()
				self.timercon = 3
			end
		end
		for _,chara in ipairs(Game.stage:getObjects(Character)) do
			local hfx = chara:getFX("highlight")
			if hfx then
				hfx.alpha = Game.world.board.screenalpha
				hfx.color = Game.world.board.screencolor
			end
		end
	end
	if self.createstars == 1 then
		self.startimer = self.startimer + DTMULT
		if self.startimer >= 4 then
			local vxx = 128 + (32 * (MathUtils.randomInt(22) / 2))
			local vyy = 64 + (32 * (MathUtils.randomInt(14) / 2))
			local star = Sprite("sword/title/5x5shine", vxx, vyy)
			star:play(1 / 4, false, function() star:remove() end)
			star.scale_x = 2
			star.scale_y = 2
			star.layer = 1
			self:addChild(star)
			table.insert(self.stars, star)
			self.startimer = 0
		end
	end
	if self.createstars == 2 then
		for _, star in ipairs(self.stars) do
			if star then
				star:remove()
			end
		end
		self.createstars = 3
	end
end

function BoardConsoleStarter:draw()
    super.draw(self)
	if self.draw_blue then
		Draw.setColor(ColorUtils.hexToRGB("#3F48CC"))
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		Draw.setColor(1,1,1,1)
	end
	if self.draw_static then
		self.statictimer = self.statictimer + 0.5 * DTMULT
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		local staticalpha = 0.25
		local staticframe = (math.floor(self.statictimer) % #self.static_tex) + 1
		local staticframe2 = (math.floor(self.statictimer - 0.25) % #self.static_tex) + 1
		Draw.setColor(1,1,1,staticalpha)
		Draw.draw(self.static_tex[staticframe], 64, 32, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe], 64, 288, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe], 320, 32, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe], 320, 288, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe2], 64, 32, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe2], 64, 288, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe2], 320, 32, 0, 2, 2)
		Draw.draw(self.static_tex[staticframe2], 320, 288, 0, 2, 2)
		Draw.setColor(1,1,1,1)
	end
	if self.draw_green then
		Draw.setColor(ColorUtils.hexToRGB("#B5E61D"))
		love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		Draw.setColor(1,1,1,1)
	end
	if self.controllerprompt then
		Draw.setColor(1,1,1,1)
		love.graphics.setFont(self.font)
		local controllertext = "NO CONTROLLER"
		love.graphics.print(controllertext, 320 - self.font:getWidth(controllertext)/2, 178 - 21/2 - 3)
		Draw.draw(self.nocontroller_tex, 196, 150, 0, 2, 2)
	end
	if self.drawboxcolor then
		Draw.setColor(self.drawcolor)
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
		love.graphics.rectangle("fill", 0, 176 - (self.boxy * 146), SCREEN_WIDTH, math.max((self.boxy * 146) * 2, 1))
		Draw.setColor(1,1,1,1)
	end
	if self.drawlogo then
		Draw.setColor(self.logocolor)
		Draw.draw(self.title_tex, 172, 136, 0, 2, 2)
		Draw.setColor(1,1,1,1)
	end
	if self.con == 12 then
		self.timer = self.timer + DTMULT
		local draw1 = false
		local draw2 = false
		local draw3 = false
		local draw4 = false
		local draw5 = false
		local draw6 = false
		local draw7 = false
		local draw8 = false
		if self.timer >= 45 and self.timer < 52 then
			draw1 = true
		end
		if self.timer >= 52 and self.timer < 61 then
			draw2 = true
		end
		if self.timer >= 61 and self.timer < 68 then
			draw3 = true
		end
		if self.timer >= 68 and self.timer < 74 then
			draw4 = true
		end
		if self.timer >= 74 and self.timer < 85 then
			draw5 = true
		end
		if self.timer >= 85 and self.timer < 90 then
			draw6 = true
		end
		if self.timer >= 90 and self.timer < 96 then
			draw7 = true
		end
		if self.timer >= 96 and self.timer < 134 then
			draw8 = true
		end
		if self.timer >= 134 and self.timercon == 3 then
			if self.bar1 then
				self.bar1:remove()
			end
			if self.bar2 then
				self.bar2:remove()
			end
			self.draw_heart = true
		end
		if self.timer >= 208 then
			self:remove()
		end	
		Draw.setColor(ColorUtils.hexToRGB("#B5E61D"))
		if draw1 then
			love.graphics.rectangle("fill", 128 + (32 * 0), 64 + (32 * 4), (32 * (6 - 0)), (32 * (12 - 4)))
		end
		if draw2 then
			love.graphics.rectangle("fill", 128 + (32 * 6), 64 + (32 * -1), (32 * (12 - 6)), (32 * (4 + 1)))
		end
		if draw3 then
			love.graphics.rectangle("fill", 128 + (32 * 0), 64 + (32 * -1), (32 * (6 - 0)), (32 * (4 + 1)))
		end
		if draw4 then
			love.graphics.rectangle("fill", 128 + (32 * 6), 64 + (32 * 4), (32 * (12 - 6)), (32 * (12 - 4)))
		end
		if draw5 then
			love.graphics.rectangle("fill", 128 + (32 * 0), 64 + (32 * 5), (32 * (12 - 0)), (32 * (12 - 5)))
		end
		if draw6 then
			love.graphics.rectangle("fill", 128 + (32 * 0), 64 + (32 * -1), (32 * (12 - 0)), (32 * (3 + 1)))
		end
		if draw7 then
			love.graphics.rectangle("fill", 128 + (32 * 0), 64 + (32 * 2), (32 * (12 - 0)), (32 * (6 - 2)))
		end
		if draw8 then
			love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
			local maxspeed = -24
			local speedtime = 30
			local waittime = 8
			if self.bar1 then
				if self.bar1.y < 16 then
					self.bar1.y = self.bar1.y + 336
				end
			else
				self.bar1 = Sprite("bubbles/fill", 128 + (32 * 0), 120)
				self.bar1:setColor(COLORS.black)
				self.bar1.scale_x = 384
				self.bar1.scale_y = 16
				self.bar1.layer = 1
				self.bar1.physics.gravity = -1
				self:addChild(self.bar1)
			end
			if self.bar2 then
				if self.bar2.y < 16 then
					self.bar2.y = self.bar2.y + 336
				end
			else
				self.bar2 = Sprite("bubbles/fill", 128 + (32 * 0), 312)
				self.bar2:setColor(COLORS.black)
				self.bar2.scale_x = 384
				self.bar2.scale_y = 16
				self.bar2.layer = 1
				self.bar2.physics.gravity = -1
				self:addChild(self.bar2)
			end
		end
		Draw.setColor(1,1,1,1)
		if self.draw_heart then
			local heartsize = 1
			if heartsize == 1 then
				Draw.draw(self.heart_tex[1], 312, 182, 0, 1, 1)
				Draw.draw(self.heart_tex[2], 312, 192, 0, 1, 1)
			end
			if heartsize == 2 then
				Draw.draw(self.heart_tex[1], 302, 172, 0, 2, 2)
				Draw.draw(self.heart_tex[2], 302, 192, 0, 2, 2)
			end
		end
	end
end

return BoardConsoleStarter