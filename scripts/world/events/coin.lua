local Coin, super = Class(Event)

function Coin:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("coin", 0.25)

    self.mouse_collider = CircleCollider(self, data.width, data.height, 20)
end

function Coin:onCollide(chara)
    Assets.playSound("item", 1, 1.2)

    --self:setFlag("dont_load", true)
    local p = Game:getFlag("POINTS", 0) + 10
    Game:setFlag("POINTS", p)

    self:remove()
end

function Coin:draw()
    super.draw(self)
    if DEBUG_RENDER then
        self.mouse_collider:draw(0, 0, 1, 1)
    end
end

return Coin