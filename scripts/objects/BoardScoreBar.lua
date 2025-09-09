---@class BoardScoreBar : Object
---@overload fun(...) : BoardScoreBar
local BoardScoreBar, super = Class(Object)

function BoardScoreBar:init(x, y)
    super.init(self)

    self.x = x or 0
    self.y = y or 0

    self.q = "sword/ui/"

    self.sprite = Sprite(self.q.."score")
    self:addChild(self.sprite)
    self.sprite:setScale(2)

    if not Game:getFlag("points") then Game:setFlag("points", 0) end

    self.font = Assets.getFont("8bit")
end

function BoardScoreBar:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(self.sprite.color[1], self.sprite.color[2], self.sprite.color[3])

    love.graphics.print("P", 10, 5)

    local p = Game:getFlag("points", 0)
    local m = #tostring(p)
    love.graphics.print(p, 94 - (16*m), 5)
end

return BoardScoreBar 