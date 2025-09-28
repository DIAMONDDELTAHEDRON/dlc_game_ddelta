---@class BoardPointsDisplay : Object
---@overload fun(...) : BoardPointsDisplay
local BoardPointsDisplay, super = Class(Object)

function BoardPointsDisplay:init(x, y, amount)
    super.init(self)

    self.x = x or 0
    self.y = y or 0
    self:setLayer(Game.world.board.player.layer + 0.01)

    self.amount = amount or 0
    self.timer = 0
    self.display_init = false
    self.onlyvisual = false

    Game.world.timer:after(1, function()
        self:remove()
	end)

    self.font = Assets.getFont("8bit")
--end

--function BoardPointsDisplay:update()
  --  super.update(self)

    if not self.display_init then
        --Utils.ease(self.y, self.y - 20, 6/30, "linear")
Game.stage.timer:tween(6/30, self, { y = (self.y - 20) })

        if not self.onlyvisual then
            Game.world.timer:after(7/30, function()
                if Game.world.board and Game.world.board.ui then
                    Game.world.board.ui:addScore(self.amount)
                end
            end)
        end
        
        self.display_init = true
	end
end

function BoardPointsDisplay:draw()
    super.draw(self)

    Draw.setColor(COLORS.white)

    local signer = "+"
    if self.amount < 0 then
        signer = ""
    end

    love.graphics.setFont(self.font)
    Draw.setColor(COLORS.black)
    love.graphics.printf(signer..self.amount, 0 - 2, 0, 0, "center")
    love.graphics.printf(signer..self.amount, 0 - 2, 0 - 2, 0, "center")
    love.graphics.printf(signer..self.amount, 0 - 2, 0 + 2, 0, "center")
    love.graphics.printf(signer..self.amount, 0 + 2, 0, 640, "center")
    love.graphics.printf(signer..self.amount, 0 + 2, 0 - 2, 0, "center")
    love.graphics.printf(signer..self.amount, 0 + 2, 0 + 2, 0, "center")
    love.graphics.printf(signer..self.amount, 0, 0, 640, "center")
    love.graphics.printf(signer..self.amount, 0, 0 - 2, 0, "center")
    love.graphics.printf(signer..self.amount, 0, 0 + 2, 0, "center")
    Draw.setColor(COLORS.white)

    if self.amount < 0 then
        Draw.setColor(Utils.hexToRgb"#473DE3")
    end



    --love.graphics.printf(signer..self.amount, 0, 0, 60)

    love.graphics.print(signer..self.amount, 0, 0)
    --love.graphics.printf(signer..self.amount, 0, 0, 50, "center")
    Draw.setColor(COLORS.white)
end

return BoardPointsDisplay 