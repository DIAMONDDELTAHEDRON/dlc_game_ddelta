---@class BoardInventoryBar : Object
---@overload fun(...) : BoardInventoryBar
local BoardInventoryBar, super = Class(Object)

function BoardInventoryBar:init(x, y)
    super.init(self)

    self.x = x or 0
    self.y = y or 0

    self.box = Sprite("sword/ui/inventory/bar")
    self:addChild(self.box)
    self.box:setScale(2)

    self.keycount = 0
    self.qcount = 0
    self.lancer = 0
    self.rouxlsblock = 0
    self.ninfriendo = 0
    self.b2drawninfriendo = true
    self.photo = 0
    self.b2camera = 0 -- NOTE TO SELF: never name a variable "self.camera" otherwise the game will crash lmao.
end

function BoardInventoryBar:draw()
    super.draw(self)
	
    local item_x, item_y = 8, 10
    local counter_x, counter_y = item_x + 18, item_y + 34

    -- uses board 1's y positions atm. 
    -- find a way to make obtainable items more customizable for custom boards.
    if self.keycount > 0 then
        Draw.draw(Assets.getTexture("world/events/sword/key_7"), item_x, item_y, 0, 2, 2)
        Draw.draw(Assets.getFrames("sword/ui/inventory/counter")[self.keycount], counter_x, counter_y, 0, 2, 2)
    end

    if self.qcount > 0 then
        Draw.draw(Assets.getTexture("sword/ui/inventory/q"), item_x, item_y + 48, 0, 2, 2)
        Draw.draw(Assets.getFrames("sword/ui/inventory/counter")[self.qcount], counter_x, counter_y + 48, 0, 2, 2)
    end

    if self.lancer ~= 0 or self.lancer > 0 then
        Draw.draw(Assets.getTexture("sword/party/lancer/walk/down"), item_x, item_y + 96, 0, 2, 2)
        Draw.draw(Assets.getFrames("sword/ui/inventory/counter")[self.lancer], counter_x, counter_y + 96, 0, 2, 2)
    end

    if self.rouxlsblock ~= 0 then
        Draw.draw(Assets.getTexture("world/events/sword/rouxlsblock"), item_x, item_y + 192, 0, 2, 2)
    end
end

return BoardInventoryBar 