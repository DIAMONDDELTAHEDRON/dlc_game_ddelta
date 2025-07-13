---@class board_healthbar : Object
---@overload fun(...) : board_healthbar
local board_healthbar, super = Class(Object)

function board_healthbar:init(x, y, party)
    super.init(self)

    self.x = x or 0
    self.y = y or 0

    self.q = "sword/ui/"

    self.box = Sprite(self.q.."health")
    self:addChild(self.box)
    self.box:setScale(2)

    self.party = party
    self.healthMax = party.healthMax
    self.health = party.health

    self.div = self.healthMax/50

end

function board_healthbar:update()
    super.update(self)
end

function board_healthbar:h()
    return self.party.health
end

function board_healthbar:draw()
    super.draw(self)

    love.graphics.setColor(self.party:getColor())

    love.graphics.rectangle( "fill", 14, 12, ((self:h()/50)/self.div) * 50, 6)


end

return board_healthbar