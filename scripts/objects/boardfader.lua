---@class BoardFader: Fader
local BoardFader, super = Class(Fader, "BoardFader")

function BoardFader:init()
    super.init(self)
    -- Because of course it's different.
    self.default_speed = 0.3
    self.speed = 0.3
end

function BoardFader:draw()
    Draw.setColor(self.color, 1)
    local width, height = 384,256
    local percentage = Utils.ceil(self.alpha, 1/6)
    love.graphics.rectangle("fill", 0, 0, width,height*0.5*percentage)
    love.graphics.rectangle("fill", 0, height*0.5 + (height*(1-percentage))/2, width,height)
    love.graphics.rectangle("fill", 0, 0, width*0.5*percentage,height)
    love.graphics.rectangle("fill", width*0.5 + (width*(1-percentage))/2, 0, width,height)
end

return BoardFader