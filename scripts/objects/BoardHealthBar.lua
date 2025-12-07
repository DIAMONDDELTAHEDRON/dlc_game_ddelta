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
	
	self.override_color = nil

    self.div = self.healthMax/50

end

function BoardHealthBar:update()
    super.update(self)
end

function BoardHealthBar:h()
    return self.party.health
end

function BoardHealthBar:getHealthColor()
	if self.override_color then
		return self.override_color
	elseif self.party.health_color then
        return self.party.health_color[1], self.party.health_color[2], self.party.health_color[3], self.party.health_color[4] or 1
    else
        return self.party:getColor()
    end
end

function BoardHealthBar:draw()
    super.draw(self)

    love.graphics.setColor(self:getHealthColor())
    love.graphics.rectangle( "fill", 14, 12, ((self:h()/50)/self.div) * 50, 6)
end

return BoardHealthBar