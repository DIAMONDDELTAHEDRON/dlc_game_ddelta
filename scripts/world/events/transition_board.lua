local transition_board, super = Class(Event)

function transition_board:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    --self:setOrigin(0.5, 0.5)
    --self:setSprite("transition_board", 0.25)
    self.data = data
    self.marker = self.data.properties['marker'] or nil
    self.solid = false
    --self.hitbox = {0, 0, data.width, data.height}
end

function transition_board:onCollide(chara)
    if not chara.is_player then return end
    Assets.playSound("board/escaped")

    local grid_w = 192 * 2
    local grid_h = 256

    local x, y = Game.world.map:getMarker(type(self.marker) == "table" and self.data.properties.marker.id or self.marker)

    Game.world.camera.x = math.floor(x / grid_w) * grid_w + 192
    Game.world.camera.y = math.floor(y / grid_h) * grid_h + 176
    
    local music = self.data.properties.music
    if music and (Game.world.music.current ~= music) then
       Game.world.music:play(music)
    end

    chara.x, chara.y = x, y
end

function transition_board:draw()
    super.draw(self)
end

return transition_board