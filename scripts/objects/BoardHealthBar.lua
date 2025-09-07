---@class BoardHealthBar : Object
---@overload fun(...) : BoardHealthBar
local BoardHealthBar, super = Class(Object)

function BoardHealthBar:init(x, y, party)
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

function BoardHealthBar:update()
    super.update(self)
end

function BoardHealthBar:h()
    return self.party.health
end

function BoardHealthBar:draw()
    super.draw(self)

    love.graphics.setColor(self.party:getColor())
    love.graphics.rectangle( "fill", 14, 12, ((self:h()/50)/self.div) * 50, 6)
end

return BoardHealthBar