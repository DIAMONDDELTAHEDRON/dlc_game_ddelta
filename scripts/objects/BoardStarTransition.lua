---@class BoardStarTransition : Object
---@overload fun(...) : BoardStarTransition
local BoardStarTransition, super = Class(Object)

function BoardStarTransition:init(sprite, x, y, targx, targy, callback)
    super.init(self, x, y)

    self.texture = Assets.getTexture("sword/effects/startransition/" .. sprite) or Assets.getTexture("sword/effects/startransition/default")
	self.rand_frames = {
		Assets.getTexture("sword/effects/startransition/" .. Game.world.board.player.actor.id) or Assets.getTexture("sword/effects/startransition/board_kris"),
		Game.world.board.followers[1] and Assets.getTexture("sword/effects/startransition/" .. Game.world.board.followers[1].actor.id) or Assets.getTexture("sword/effects/startransition/board_susie"),
		Game.world.board.followers[2] and Assets.getTexture("sword/effects/startransition/" .. Game.world.board.followers[2].actor.id) or Assets.getTexture("sword/effects/startransition/board_ralsei"),
		Assets.getTexture("sword/effects/startransition/yellow")
	}
	self.time = 0
	self.distance = 120
	self.starcount = 6
	self.starrotation = 0
	self.transitiontime = 20
	self.targx = targx or self.x
	self.targy = targy or self.y
	self.randim = nil
	self.callback = callback or nil
	self.did_callback = false
end

function BoardStarTransition:onAdd(parent)
	super.onAdd(self, parent)
	Game.world.timer:tween(8/30, self, {x = self.targx, y = self.targy})
	Game.world.timer:tween(self.transitiontime/30, self, {distance = 0})
end

function BoardStarTransition:update()
    self.time = self.time + (1 * DTMULT)
	self.starrotation = self.starrotation + (12 * DTMULT)

    if self.time >= self.transitiontime and self.callback and not self.did_callback then
        self.callback()
		self.did_callback = true
    end
    if self.time >= self.transitiontime + 2 then
        self:remove()
    end

    super.update(self)
end

function BoardStarTransition:draw()
	for i = 0, self.starcount do
		if self.randim then
			self.randim = self.randim + DTMULT/30
			Draw.draw(self.rand_frames[((i + self.randim) % #self.rand_frames) + 1],
			MathUtils.round((math.cos(-math.rad(((i * 360) / self.starcount) + self.starrotation)) * self.distance) / 2) * 2,
			MathUtils.round((math.sin(-math.rad(((i * 360) / self.starcount) + self.starrotation)) * self.distance) / 2) * 2,
			0, 2, 2)
		else
			Draw.draw(self.texture,
			MathUtils.round((math.cos(-math.rad(((i * 360) / self.starcount) + self.starrotation)) * self.distance) / 2) * 2,
			MathUtils.round((math.sin(-math.rad(((i * 360) / self.starcount) + self.starrotation)) * self.distance) / 2) * 2,
			0, 2, 2)
		end
	end
    super.draw(self)
end

return BoardStarTransition