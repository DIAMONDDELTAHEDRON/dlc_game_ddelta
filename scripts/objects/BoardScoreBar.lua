---@class BoardScoreBar : Object
---@overload fun(...) : BoardScoreBar
local BoardScoreBar, super = Class(Object)

function BoardScoreBar:init(x, y)
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

function BoardScoreBar:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("P", 10, 8)

    local p = Game:getFlag("POINTS", 0)
    local m = #tostring(p)
    love.graphics.print(p, 94 - (16*m), 8)
end

return BoardScoreBar 