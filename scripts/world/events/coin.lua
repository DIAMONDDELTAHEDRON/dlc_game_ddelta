local Coin, super = Class(Event)

function Coin:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/sword/coin")
end

function Coin:onCollide(chara)
    Assets.stopAndPlaySound("item", 1, 1.2)

    local pointsDisplay = Game.world:spawnObject(BoardPointsDisplay(self.x, self.y, 10))
    pointsDisplay:setLayer(Game.world.player.layer + 0.1)
    self:remove()
end

return Coin