local help_pippins, super = Class(BoardEvent)

function help_pippins:init(data)
    super.init(self, data.x, data.y, data.width, data.height)
    self.data = data

    self.name = "HELP!"

    self.solid = true

    self.shop = self.data.properties['shop'] or nil

    self.price = "100"

    self.spr = Sprite("sword/npcs/pippins")
    self.spr:setScale(2)
    self:addChild(self.spr)
    self.hitbox = {0, 0, 32, 32}
end

function help_pippins:onInteract(player, dir)

    local i = Game.world.board.ui.inventory_bar
    local p = Game.world.board.player
    local cutscene = Game.world:startCutscene(function(c)

        if self.price and self.shop then
            if Game:getFlag("points") >= tonumber(self.price) then
                Game.world.board.ui:addScore(-self.price)
            else
                Assets.playSound("error")
                return
            end
        end

        Assets.playSound("board/itemget")

        self.spr:slideTo(self.spr.x, self.spr.y - 32, 1)
        p:spin(2)
        c:wait(0.5)
        p:spin(0)
        p:setSprite("item")
        c:wait(1.5)
        self.price = nil
        self.name = "SUCKER"
        self.spr:slideTo(self.spr.x - 108, self.spr.y, 0.5)
        c:wait(1)
        p:resetSprite()
    end)
    cutscene:after(function()
        --maybe do stuff here?
    end)

    return true
end

function help_pippins:draw()
    super.draw(self)

    if self.shop then
        local shop = Game.world.board:getEvent(self.shop.id)
        if shop.text_active then
            if not shop.dialogue_text:isTyping() then
                love.graphics.setFont(Assets.getFont("8bit"))
                love.graphics.setColor(1, 1, 1)

                love.graphics.printfOutline(self.name, (16 - #self.name * 8), 32, 2)
                if self.price then
                    love.graphics.printfOutline(self.price, (16 - #self.price * 8), 48, 2)
                else
                end

            end
        end
    end
end

return help_pippins