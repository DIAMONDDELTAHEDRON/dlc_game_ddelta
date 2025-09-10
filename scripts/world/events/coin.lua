local Coin, super = Class(Event)

function Coin:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/sword/coin")
end

function Coin:onRemove(parent)
    if self.data then
        --if not self.world then return end
        if self.world.map.events_by_name[self.data.name] then
            Utils.removeFromTable(self.world.map.events_by_name[self.data.name], self)
        end
        if self.world.map.events_by_id[self.data.id] then
            Utils.removeFromTable(self.world.map.events_by_id[self.data.id], self)
        end
    end
    --if parent:includes(World) or parent.world then
        self.world = nil
    --end
end

function Coin:onAdd(parent)
    if parent.world then
        self.world = parent.world
    else
        self.world = Game.world.board
    end
end

function Coin:onCollide(chara)
    Assets.stopAndPlaySound("item", 1, 1.2)

    local pointsDisplay = Game.world.board:spawnObject(BoardPointsDisplay(self.x, self.y, 10))
    pointsDisplay:setLayer(Game.world.board.player.layer + 0.1)
    self:remove()
end

return Coin