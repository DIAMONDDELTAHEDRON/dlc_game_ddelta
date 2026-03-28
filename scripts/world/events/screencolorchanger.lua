local ScreenColorChanger, super = Class(Event, "screencolorchanger")

function ScreenColorChanger:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
	self.colorchangetime = properties["time"] or 5
	self.color = properties["color"] and TiledUtils.parseColorProperty(data.properties["color"]) or ColorUtils.hexToRGB("#c5b759")
	self.init = 0
	self.force = nil
	self.roomstart = 0
	self.isactive = false
end

function ScreenColorChanger:update()
	super.update(self)
	local board = Game.world.board
	if not board then
		return
	end
	if self.roomstart < 60 then
		self.roomstart = self.roomstart + DTMULT
	end
	local player = Game.world.board.player
	local cx = board.camera.x - 384/2 - 128
	local cy = board.camera.y - 256/2 - 32
	local colfa, rowfa = board.future_area_column, board.future_area_row
	local cola, rowa = board.area_column, board.area_row
	local colb, rowb = board:getArea(self.x, self.y)
	if colfa == colb and rowfa == rowb and board.swapping_grid then
		self.isactive = true
	end
	if cola == colb and rowa == rowb then
		if board.swapping_grid then
			self.isactive = false
		else
			self.isactive = true
		end
	end
	if self.isactive and self.roomstart > 30 then
		if self.init == 0 then
			local skip = false
			self.init = 1
			if board.fader.state ~= "NONE" then
				self.init = 0
				self.skip = true
			end
			if self.force then
				self.colorchangetime = self.force
				skip = false
				self.force = nil
			end
			if not self.skip then
				self.colorchangetime = 16
				board.colorchange = self.colorchangetime
				board.colorchangetime = self.colorchangetime
				board.newcolor = self.color
			end
		end
	else
		self.init = 0
	end
end

return ScreenColorChanger