local transition_board, super = Class(BoardEvent)

function transition_board:init(data)
    super.init(self, data.x, data.y, data.width, data.height)


    self.data = data
    self.marker = self.data.properties['marker'] or nil
    self.solid = true
    --self.hitbox = {0, 0, data.width, data.height}
end

function transition_board:onCollide(chara)
    if not chara.is_player or Game.lock_movement then return end
    Game.lock_movement = true
    local world = self.world or Game.world
    --world.map.swapping_grid = true
    Assets.playSound("board/escaped")
    local layer = 100
    
    self.world.fader:transition(function ()
        self:teleportPlayer(chara)
    end)

end

function transition_board:teleportPlayer(chara)

    local grid_w = 384
    local grid_h = 256

    local x, y = Game.world.board.map:getMarker(type(self.marker) == "table" and self.data.properties.marker.id or self.marker)

    --chara.x, chara.y = x, y

    --Game.world.camera.x = math.floor(chara.x / grid_w) * grid_w + 192
    --Game.world.camera.y = math.floor(chara.y / grid_h) * grid_h + 176
    
    local music = self.data.properties.music
    if music and (Game.world.music.current ~= music) then
       Game.world.music:play(music)
    end

    chara.x, chara.y = x, y

    local x, y = Game.world.board:getArea(x, y)
    self.world:moveCamera(x, y)

    Game.lock_movement = false

end

function transition_board:draw()
    super.draw(self)
end

return transition_board