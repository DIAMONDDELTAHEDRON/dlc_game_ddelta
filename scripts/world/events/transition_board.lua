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
    if not chara.is_player or Game.lock_movement then return end
    Game.lock_movement = true
    Game.world.map.swapping_grid = true
    Assets.playSound("board/escaped")

    self.rec = Rectangle(0 + 128, -128 + 64, 384, 128) --top one
    local rec = self.rec
    rec.parallax_y, rec.parallax_x = 0, 0
    rec.layer = 1
    Game.world:addChild(rec)
    

    self.rec2 = Rectangle(0 + 128, 256 + 64, 384, 128) --bottom one
    local rec2 = self.rec2
    rec2.parallax_y, rec2.parallax_x = 0, 0
    rec2.layer = 1
    Game.world:addChild(rec2)


    Game.stage.timer:tween(0.25, rec2, {y = 128 + 64}, 'linear')
    Game.stage.timer:tween(0.25, rec, {y = 64}, 'linear', function()
        self:teleportPlayer(chara)
    end)


end

function transition_board:teleportPlayer(chara)

    local grid_w = 192 * 2
    local grid_h = 256

    local x, y = Game.world.map:getMarker(type(self.marker) == "table" and self.data.properties.marker.id or self.marker)

    chara.x, chara.y = x, y

    Game.world.camera.x = math.floor(chara.x / grid_w) * grid_w + 192
    Game.world.camera.y = math.floor(chara.y / grid_h) * grid_h + 176
    
    local music = self.data.properties.music
    if music and (Game.world.music.current ~= music) then
       Game.world.music:play(music)
    end

    chara.x, chara.y = x, y



    Game.stage.timer:tween(0.25, self.rec2, {y = 256 + 64}, 'linear', function()
        Game.world:removeChild(self.rec2)
        self.rec2 = nil
    end)
    Game.stage.timer:tween(0.25, self.rec, {y = -128 + 64}, 'linear', function()
        Game.world:removeChild(self.rec)
        self.rec = nil
        Game.lock_movement = false
        Game.world.map.swapping_grid = false
    end)

end

function transition_board:draw()
    super.draw(self)
end

return transition_board