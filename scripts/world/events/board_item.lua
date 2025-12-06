local board_item, super = Class(BoardEvent)

function board_item:init(data)
    super.init(self, data.x, data.y, data.width, data.height)
    self.data = data
    self.id = self.data.properties['id'] or "test_item"
    self.spr = self.data.properties['sprite'] or "sword/ui/inventory/test_item"
    self.name = self.data.properties['name'] or "NESS"
    self.solid = true
    self.slot = self.data.properties['slot'] or 0

    self.shop = self.data.properties['shop'] or nil

    self.price = self.data.properties['price'] or nil

    self:setSprite(self.spr)
    self.hitbox = {0, 0, 32, 32}
end

function board_item:onInteract(player, dir)

    local i = Game.world.board.ui.inventory_bar
    local p = Game.world.board.player
    local cutscene = Game.world:startCutscene(function(c)
        Assets.playSound("board/itemget")

        if self.price then
            Game.world.board.ui:addScore(-self.price)
            self.price = nil
        end

        self:slideTo(p.x - 16, p.y - 64 - 8, 0.5)
        p:spin(2)
        c:wait(0.5)
        p:spin(0)
        p:setSprite("item")
        c:boardText("YOU GOT THE [color:yellow]".. self.name .."[color:reset]!")
	c:resetBoardText()
        Assets.playSound("item")
        p:resetSprite()
        Game.world.board.ui:addItem(self, self.slot)
        self:remove()
    end)
    cutscene:after(function()
        --maybe do stuff here?
    end)

    return true
end

function board_item:draw()
    super.draw(self)

    if self.shop and self.price then
        local shop = Game.world.board:getEvent(self.shop.id)
        if shop.text_active then
            if not shop.dialogue_text:isTyping() then
                love.graphics.setFont(Assets.getFont("8bit"))
                love.graphics.setColor(1, 1, 1)

                love.graphics.printfOutline(self.name, (16 - #self.name * 8), 32, 2)
                if self.price == "0" then
                    love.graphics.printfOutline("FREE", -16, 48, 2)
                else
                    love.graphics.printfOutline(self.price, (16 - #self.price * 8), 48, 2)
                end

            end
        end
    end
end

return board_item