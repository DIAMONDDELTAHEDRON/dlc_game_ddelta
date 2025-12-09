---@overload fun(...) : DockBoard
local DockBoard, super = Class(Event, "dock_board")

function DockBoard:init(data)
    super.init(self, data)

    local properties = data.properties or {}

    self.dir = data.properties['dir'] or "horz"

    self:setSprite("world/events/sword/dock_"..self.dir)
	self:setOrigin(0.5, 1)
	self:setPosition(self.x + self.width/2, self.y + self.height)
    self.solid = false
    self.color_mask = self:addFX(ColorMaskFX(ColorUtils.hexToRGB("#FFE167"), 0))
    self.color_mask.amount = 0
	self.siner = -40
end

function DockBoard:update()
	if not self.world.rafting then
		self.siner = -40
		self.color_mask.amount = 0
	else
		self.siner = self.siner + DTMULT
		local sinamout = (MathUtils.round(math.sin(self.siner / 15) * 4) / 4) + 0.2
		self.color_mask.amount = sinamout/2
	end
    super.update(self)
end

function DockBoard:onInteract(player, dir)
	if not self.world.rafting then return end
    local r = Game.world.board:getCameraTarget()
    local p = Game.world.board.player
    local cutscene = Game.world:startCutscene(function(c)
		Game.world.board.rafting = false
		local disembarktimer = 0
		local myx, myy = self.x, self.y
		if r.facing == "down" then
			myy = myy - 32
		end
		if r.facing == "up" then
			myy = myy + 32
		end
		if r.facing == "right" then
			myx = myx - 32
		end
		if r.facing == "left" then
			myx = myx + 32
		end
		c:wait(function()
			disembarktimer = disembarktimer + DTMULT
			if math.abs(r.x - myx) > 1 then
				if r.x < myx then
					r.x = r.x + 2 * DTMULT
				end
				if r.x > myx then
					r.x = r.x - 2 * DTMULT
				end
			else
				r.x = myx
			end
			if math.abs(r.y - myy) > 1 then
				if r.y < myy then
					r.y = r.y + 2 * DTMULT
				end
				if r.y > myy then
					r.y = r.y - 2 * DTMULT
				end
			else
				r.y = myy
			end
			if (r.x == myx and r.y == myy) or disembarktimer > 16 then
				return true
			end
			return false
		end)
		r:setPosition(myx, myy)
		r.engaged = false
		self.facing = "down"
		local jumptime = 10
		c:wait(1/30)
		Game.world.music:fade(0, jumptime/30)
		Game.world.timer:after(jumptime/30, function()
			Game.world.music:play(Game:getFlag("raft_last_music"))
			Game.world.music:seek(Game:getFlag("raft_last_music_time", 0))
			Game.world.music:setVolume(0)
			Game.world.music:fade(1, 1)
		end)
		p:jumpTo(self.x, self.y, 10, jumptime/30)
		Game.world.timer:after(jumptime/30, function()
			Assets.playSound("board/lift", 1, 1.4)
		end)
		for i,f in ipairs(Game.world.board.followers) do
			Game.world.timer:after((5*i)/30, function()
				f:jumpTo(self.x, self.y, 10, jumptime/30)
				Game.world.timer:after(jumptime/30, function()
					Assets.playSound("board/lift", 1, (1.4-(0.2*i)))
				end)
			end)
		end
		c:wait((11+jumptime)/30)
		Game.world.board:setCameraTarget(p)
    end)

    return true
end

return DockBoard