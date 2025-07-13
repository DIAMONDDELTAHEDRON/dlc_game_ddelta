---@class board_score : Object
---@overload fun(...) : board_score
local board_score, super = Class(Object)

function board_score:init(x, y)
    super.init(self)

    self.x = x or 0
    self.y = y or 0

    self.q = "sword/ui/"

    self.box = Sprite(self.q.."score")
    self:addChild(self.box)
    self.box:setScale(2)

    if not Game:getFlag("POINTS") then Game:setFlag("POINTS", 0) end

    self.font = Assets.getFont("8bit")

end

function board_score:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("P", 10, 8)
    
end

return board_score 