local transition_board, super = Class(BoardEvent)

function transition_board:init(data)
    super.init(self, data.x, data.y, data.width, data.height)


    self.data = data
    self.marker = self.data.properties['marker'] or nil
    self.musicload = self.data.properties['musicload'] or "middle"
	self.transspeed = self.data.properties['speed'] or 1
	self.transpausetime = self.data.properties['pause'] or 2
	self.soundpitch = self.data.properties['pitch'] or 1
	self.swordremove = self.data.properties['nosword'] or false
	self.texture = self.data.properties['sprite'] or nil
	if self.texture then
		self:setSprite(self.texture)
		self.sprite:setScale((self.width / 16), (self.height / 16))
	end
    self.solid = true
    --self.hitbox = {0, 0, data.width, data.height}
end

function transition_board:onCollide(chara)
    if not chara.is_player or Game.lock_movement then return end
    Game.lock_movement = true
    local world = self.world or Game.world
    --world.map.swapping_grid = true
    Assets.playSound("board/escaped", 1, self.soundpitch)
    local layer = 100
    
	if self.musicload == "start" then
		local music = self.data.properties.music
		if music == "pause" then
			Game.world.music:pause()
		elseif music and ((Game.world.music.current == music and not Game.world.music.started) or (music == "resume" and not Game.world.music.started)) then
		    Game.world.music:resume()
		elseif music and (Game.world.music.current ~= music) then
		    Game.world.music:play(music)
		end
	end
	for _,screencol in ipairs(Game.world.board:getEvents("screencolorchanger")) do
		screencol.active = false
	end
    self.world.fader:transition(function ()
        self:teleportPlayer(chara)
    end, function ()
		if self.musicload == "end" then
			local music = self.data.properties.music
			if music == "pause" then
				Game.world.music:pause()
			elseif music and ((Game.world.music.current == music and not Game.world.music.started) or (music == "resume" and not Game.world.music.started)) then
				Game.world.music:resume()
			elseif music and (Game.world.music.current ~= music) then
				Game.world.music:play(music)
			end
		end
		for _,screencol in ipairs(Game.world.board:getEvents("screencolorchanger")) do
			screencol.active = true
		end
		Game.lock_movement = false
    end, self.transpausetime, {speed = self.transspeed})

end

function transition_board:teleportPlayer(chara)

    local grid_w = Game.world.board.game_width
    local grid_h = Game.world.board.game_height

    local x, y = Game.world.board.map:getMarker(type(self.marker) == "table" and self.data.properties.marker.id or self.marker)

    --chara.x, chara.y = x, y

    --Game.world.camera.x = math.floor(chara.x / grid_w) * grid_w + 192
    --Game.world.camera.y = math.floor(chara.y / grid_h) * grid_h + 176
    
	if self.musicload == "middle" then
		local music = self.data.properties.music
		if music == "pause" then
			Game.world.music:pause()
		elseif music and (Game.world.music.current == music and not Game.world.music.started) then
		    Game.world.music:resume()
		elseif music and (Game.world.music.current ~= music) then
		    Game.world.music:play(music)
		end
	end

    chara.x, chara.y = x, y

    for _, i in ipairs(Game.world.board.followers) do
        i.history = {}
        i.physics.move_path = nil
        i.pathing = false
        i.x = chara.x
        i.y = chara.y
    end

    local x, y = Game.world.board:getArea(x, y)
    self.world:moveCamera(x, y)
end

function transition_board:draw()
    super.draw(self)
end

return transition_board