---@class CouchWriter : Object
---@overload fun(...) : CouchWriter
local CouchWriter, super = Class(Object)

function CouchWriter:init(x, y, text, speaker, options)
    super.init(self, x, y)
	self:setParallax(0)
	local options = options or {}
	self.text = text or "UNINTIALIZED STRING:\nUSE \"self.text\" WHEN MAKING THIS OBJECT"
	self.truetext = {}
	self.mycolor = options["color"] or nil
	self.speaker = speaker or "none"
	self.clearinit = 0
	self.cleartext = options["clear"] or 1
	self.drawtime = options["time"] or nil
	self.timer = 0
	self.talktimer = 0
	self.init = false
	self.myalpha = 1
	self.mysnd = options["sound"] or nil
	self.myfnt = options["font"] or "plain"
	self.quiz = false
	self.talkrate = options["rate"] or 2
	self.talklength = options["length"] or nil
	self.mode = 2
	self.autowrap = true
	self.force_autowrap = false
	self.autowraplength = 160
	self.separation = 16
	self.tailwidth = 8
	self.taillength = -1
	self.bubblewidth = -1
	self.bubbleheight = -1
	self.bubblepadding = 0
	self.outlinethickness = 2
	self.outlinecolor = COLORS.black
	self.textbubblecolor = COLORS.white
	self.textcolor = COLORS.black
	self.dropshadow = true
	self.force_traditional_writer = false
	self.tradwriter = nil
	self.modecon = 0
	self.specialtalk = options["specialtalk"] or nil
	self.reformat = false
	self.reorder_layer = true
	self.speaker_data = {}
	self.speaker_data["ralsei"] = {
		x = function(...)
			if Game.world:getCharacter("ralsei") then
				local x, _ = Game.world:getCharacter("ralsei"):getScreenPos()
				return x
			end
			return 362
		end,
		y = 350 + 4,
		quiz_x = function(...)
			if Game.world:getCharacter("ralsei") then
				local x, _ = Game.world:getCharacter("ralsei"):getScreenPos()
				return x
			end
			return 400
		end,
		color = ColorUtils.hexToRGB("#6FD213"),
		voice = "voice/ralsei",
		specialtalk = 0,
		talklength = 6
	}
	self.speaker_data["susie"] = {
		x = function(...)
			if Game.world:getCharacter("susie") then
				local x, _ = Game.world:getCharacter("susie"):getScreenPos()
				return x
			end
			return 164
		end,
		y = 350 + 4,	
		quiz_x = function(...)
			if Game.world:getCharacter("susie") then
				local x, _ = Game.world:getCharacter("susie"):getScreenPos()
				return x
			end
			return 100
		end,
		color = ColorUtils.hexToRGB("#740C83"),
		voice = "voice/susie",
		specialtalk = 0,
		talklength = 6
	}
	self.speaker_data["hero"] = {
		x = function(...)
			if Game.world:getCharacter("hero") then
				local x, _ = Game.world:getCharacter("hero"):getScreenPos()
				return x
			end
			return 258
		end,
		y = 350 + 16,	
		quiz_x = function(...)
			if Game.world:getCharacter("hero") then
				local x, _ = Game.world:getCharacter("hero"):getScreenPos()
				return x
			end
			return 250 -- placeholder
		end,
		color = ColorUtils.hexToRGB("#B35624"),
		voice = "voice/hero",
		specialtalk = 0,
		talklength = 6
	}
	self.speaker_data["dess"] = {
		x = function(...)
			if Game.world:getCharacter("dess") then
				local x, _ = Game.world:getCharacter("dess"):getScreenPos()
				return x
			end
			return 362
		end,
		y = 350 + 4,	
		quiz_x = function(...)
			if Game.world:getCharacter("dess") then
				local x, _ = Game.world:getCharacter("dess"):getScreenPos()
				return x
			end
			return 400
		end,
		color = ColorUtils.hexToRGB("#880015"),
		voice = "voice/dess",
		specialtalk = 0,
		talklength = 6
	}
	self.speaker_data["tenna"] = {
		x = 540,
		y = 310,
		quiz_x = 474 + 8,
		color = COLORS.yellow,
		voice = "voice/tenna",
		specialtalk = 1,
		talklength = 12
	}
	self.speaker_data["lancer"] = {
		x = nil,
		y = nil,
		quiz_x = nil,
		color = ColorUtils.hexToRGB("#5585BD"),
		voice = "voice/lancer",
		specialtalk = 0,
		talklength = 6
	}
	self.newlines = 1
end

function CouchWriter:update()
    super.update(self)
	if self.reformat then
		self.init = false
		self.reformat = false
	end
	if not self.init then
		self.font = Assets.getFont(self.myfnt)
		self.autowrap = true
		if StringUtils.contains(self.text, "\n") then
			self.autowrap = false
		end
		if self.autowrap then
			local spacelocation = 0
			local linelength = 0
			local stringlength = StringUtils.len(self.text)
			local savestring = self.text
			local autowrapchar = 22
			for i = 1, stringlength do
				local thischar = StringUtils.sub(savestring, i, i)
				if thischar == " " then
					spacelocation = i
				end
				linelength = linelength + 1
				if linelength >= autowrapchar and spacelocation >= 1 then
					self.text = StringUtils.sub(self.text, 1, spacelocation - 1) .. "\n" .. StringUtils.sub(self.text, spacelocation + 1)
					linelength = 0
					i = spacelocation
					spacelocation = -1
				end
			end
			self.autowrap = false
		end	
		local stringlength = StringUtils.len(self.text)
		for i = 1, stringlength do
			local thischar = StringUtils.sub(self.text, i, i)
			if thischar == "\n" then
				self.newlines = self.newlines + 1
			end
		end
		local truetext = self.text
		if self.force_autowrap then
			self.autowrap = true
			local spacelocation = 0
			local strwidth = 0
			local stringlength = StringUtils.len(truetext)
			local savestring = self.text
			for i = 1, stringlength do
				local thischar = StringUtils.sub(savestring, i, i)
				if thischar == " " then
					spacelocation = i
				end
				strwidth = strwidth + self.font:getWidth(thischar)
				if strwidth >= self.autowraplength and spacelocation >= 1 then
					truetext = StringUtils.sub(truetext, 1, spacelocation - 1) .. "\n" .. StringUtils.sub(truetext, spacelocation + 1)
					strwidth = 0
					i = spacelocation
					spacelocation = -1
				end
			end
		end
		self.truetext = StringUtils.split(truetext, "\n")
		if not self.speaker or self.speaker == "none" or self.speaker == "" then
			if not self.mysnd then
				self.mysnd = nil
			end
			if not self.mycolor then
				self.mycolor = COLORS.white
			end
			if not self.specialtalk then
				self.specialtalk = 0
			end
			if not self.talklength then
				self.talklength = 6
			end
		end
		if not self.mysnd and self.speaker_data[self.speaker].voice then
			self.mysnd = self.speaker_data[self.speaker].voice
		end
		if not self.mycolor and self.speaker_data[self.speaker].color then
			self.mycolor = self.speaker_data[self.speaker].color
		end
		if not self.specialtalk and self.speaker_data[self.speaker].specialtalk then
			self.specialtalk = self.speaker_data[self.speaker].specialtalk
		end
		if not self.talklength and self.speaker_data[self.speaker].talklength then
			self.talklength = self.speaker_data[self.speaker].talklength
		end
		if not self.drawtime then
			self.drawtime = StringUtils.len(self.text) * 4
		end
		if self.cleartext == 1 then
			for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
				if writer and writer ~= self then
					writer:remove()
				end
			end
		end
		if self.cleartext == 2 then
			for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
				if writer and writer ~= self and writer.speaker == self.speaker then
					writer:remove()
				end
			end
		end
		self.init = true
		if self.x == -1 and self.y == -1 then
			self.x = 320
			self.y = 430
			if self.quiz then
				self.y = 420
			end
			if self.quiz then
				if self.speaker_data[self.speaker].quiz_x then
					if type(self.speaker_data[self.speaker].quiz_x) == "function" then
						self.x = self.speaker_data[self.speaker].quiz_x()
					else
						self.x = self.speaker_data[self.speaker].quiz_x
					end
				end
			else
				if self.speaker_data[self.speaker].x then
					if type(self.speaker_data[self.speaker].x) == "function" then
						self.x = self.speaker_data[self.speaker].x()
					else
						self.x = self.speaker_data[self.speaker].x
					end
				end				
				if self.speaker_data[self.speaker].y then
					if type(self.speaker_data[self.speaker].y) == "function" then
						self.y = self.speaker_data[self.speaker].y()
					else
						self.y = self.speaker_data[self.speaker].y
					end
				end
				if self.speaker == "tenna" then
					local count = 0
					for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
						if writer and not writer:isRemoved() then
							count = count + 1
						end
					end	
					if count > 1 then			
						local doadjust = false
						for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
							if writer and writer.x >= 362 then
								doadjust = true
								break
							end
						end
						if doadjust then
							self.y = self.y - 16
						end
					end
				end
			end
		end
		if self.reorder_layer then
			self.layer = WORLD_LAYERS["above_events"]
			local count = 0
			for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
				if writer and not writer:isRemoved() then
					count = count + 1
				end
			end
			if count > 1 then
				self.layer = self.layer + count * 0.1
				for _, writer in ipairs(Game.stage:getObjects(CouchWriter)) do
					if writer and writer ~= self then
						if writer.layer < self.layer then
							writer.layer = self.layer + 0.2
						end
					end
				end
			end
			self.reorder_layer = false
		end
		if self.mode == 3 then
			self.init = false
		end
		if self.mode == 3 and not Game.world:isTextboxOpen() then
			local darktext = "[voice:"..self.mysnd.."]* " + self.text
			Game.world:showText(darktext)
			self.modecon = 1
			self.init = true
		end
	end
	if self.modecon == 1 then
		if not Game.world:isTextboxOpen() then
			self:remove()
		end
	end
end

function CouchWriter:draw()
    super.draw(self)
	if self.init then
		self.timer = self.timer + DTMULT
		self.talktimer = self.talktimer + DTMULT
		if self.specialtalk == 0 then
			if self.talktimer >= self.talkrate and self.timer < self.talklength then
				if self.mysnd then
					Assets.playSound(self.mysnd)
				end
				self.talktimer = 0
			end
		end
		if self.specialtalk == 1 then
			if self.talktimer >= self.talkrate and self.timer < self.talklength then
				local rand = MathUtils.randomInt(8) + 1
				local pitchrandom = 0.86 + MathUtils.random(0.35)
				local soundindex = "voice/tenna/tv_voice_short_"..rand
				for i = 1, 10 do
					Assets.stopSound("voice/tenna/tv_voice_short_"..i)
				end
				Assets.playSound(soundindex, 0.7, pitchrandom)
				self.talktimer = 0
			end
		end
		if self.timer >= self.drawtime then
			self.myalpha = MathUtils.lerp(self.myalpha, -0.1, 0.2 * DTMULT)
		end
		if self.myalpha <= 0 then
			self:remove()
		end
		if self.mode == 2 then
			love.graphics.setFont(self.font)
			self.bubblewidth = MathUtils.round(self.font:getWidth(self.text) / 2) + self.bubblepadding
			self.bubbleheight = MathUtils.round((self.font:getHeight(self.text) * self.newlines) / 2) + self.bubblepadding
			if self.autowrap then
				self.bubblewidth = math.min(self.font:getWidth(self.text) / 2, self.autowraplength / 2) + self.bubblepadding
				self.linecount = MathUtils.round(self.font:getWidth(self.text) / self.autowraplength)
				self.bubbleheight = (self.linecount * (self.separation / 2)) + self.bubblepadding + 8
				self.bubbleheight = math.max(self.bubbleheight, 8)
			end
			Draw.setColor(self.outlinecolor)
			love.graphics.circle("fill", -self.bubblewidth, -self.bubbleheight, 8 + self.outlinethickness)
			love.graphics.circle("fill", self.bubblewidth, -self.bubbleheight, 8 + self.outlinethickness)
			love.graphics.circle("fill", -self.bubblewidth, self.bubbleheight, 8 + self.outlinethickness)
			love.graphics.circle("fill", self.bubblewidth, self.bubbleheight, 8 + self.outlinethickness)
			love.graphics.rectangle("fill", -self.bubblewidth, -self.bubbleheight - 8 - self.outlinethickness, self.bubblewidth*2, (self.bubbleheight + 8 + self.outlinethickness) * 2)
			love.graphics.rectangle("fill", -self.bubblewidth - 8 - self.outlinethickness, -self.bubbleheight, (self.bubblewidth + 8 + self.outlinethickness) * 2, self.bubbleheight*2)
			if not self.quiz then
				love.graphics.setLineWidth(self.outlinethickness)
				love.graphics.line(10 + self.outlinethickness, self.bubbleheight, 0, self.bubbleheight + 20 + self.outlinethickness)
				love.graphics.line(-10 - self.outlinethickness, self.bubbleheight, 0, self.bubbleheight + 20 + self.outlinethickness)
			else
				love.graphics.setLineWidth(self.outlinethickness)
				love.graphics.line(10 + self.outlinethickness, -self.bubbleheight, 0, -self.bubbleheight - 20 + self.outlinethickness)
				love.graphics.line(-10 - self.outlinethickness, -self.bubbleheight, 0, -self.bubbleheight - 20 + self.outlinethickness)				
			end
			Draw.setColor(self.textbubblecolor)
			love.graphics.circle("fill", -self.bubblewidth, -self.bubbleheight, 8)
			love.graphics.circle("fill", self.bubblewidth, -self.bubbleheight, 8)
			love.graphics.circle("fill", -self.bubblewidth, self.bubbleheight, 8)
			love.graphics.circle("fill", self.bubblewidth, self.bubbleheight, 8)
			love.graphics.rectangle("fill", -self.bubblewidth, -self.bubbleheight - 8, self.bubblewidth*2, (self.bubbleheight + 8) * 2)
			love.graphics.rectangle("fill", -self.bubblewidth - 8, -self.bubbleheight, (self.bubblewidth + 8) * 2, self.bubbleheight*2)
			if not self.quiz then
				love.graphics.polygon("fill", 10, self.bubbleheight, -10, self.bubbleheight, 0, self.bubbleheight + 20)
			else
				love.graphics.polygon("fill", 10, -self.bubbleheight, -10, -self.bubbleheight, 0, -self.bubbleheight - 20)
			end
			Draw.setColor(COLORS.white)
			if self.force_traditional_writer then
				-- UNUSED wip
			else
				if self.dropshadow then
					Draw.setColor(self.mycolor, 0.25)
					for i, text in ipairs(self.truetext) do
						love.graphics.print(text, -(self.font:getWidth(text) / 2), -((self.font:getHeight(self.text) * self.newlines) / 2) + ((i-1) * self.separation) + 1)
						love.graphics.print(text, -(self.font:getWidth(text) / 2) + 1, -((self.font:getHeight(self.text) * self.newlines) / 2) + ((i-1) * self.separation))
						love.graphics.print(text, -(self.font:getWidth(text) / 2) + 1, -((self.font:getHeight(self.text) * self.newlines) / 2) + ((i-1) * self.separation) + 1)
					end
					Draw.setColor(0, 0, 0, 1)
					for i, text in ipairs(self.truetext) do
						love.graphics.print(text, -(self.font:getWidth(text) / 2), -((self.font:getHeight(self.text) * self.newlines) / 2) + ((i-1) * self.separation))
					end
				else
					Draw.setColor(self.mycolor)
					for i, text in ipairs(self.truetext) do
						love.graphics.print(text, -(self.font:getWidth(text) / 2), -(self.font:getHeight(text) + ((i-1) * self.separation) / 2))
					end
				end
			end
		end
	end
	Draw.setColor(1,1,1,1)
end

return CouchWriter