local Door, super = Class(Event, "door_board")

function Door:updateDoor()
    if self.open then
        -- Destroy the door object
        self.solid = false
        if self.box then
            if not self.opensprite then
                self.visible = false
            else
                self:setSprite(self.opensprite)
            end
        else
            self:setSprite(self.opensprite or "world/events/boarddoor/open")
        end
    else
        self.solid = true
        self.visible = true
        if self.box then
            self:setSprite(self.closedsprite or "world/events/boarddoor/closed_box")
        else
            self:setSprite(self.closedsprite or "world/events/boarddoor/closed")
        end
    end
end

function Door:init(data)
    super.init(self, data)

    local properties = data.properties or {}
    self.properties = properties or {}
    self.sound = properties["sound"]
    self.open = properties["open"] or false
    self.solid = true
    self.box = properties["box"] or false
    self.opensprite = properties["opensprite"]
    self.closedsprite = properties["sprite"]

    self:setScale(1)
    --self:setOrigin(0.5, 0.5)
    self:updateDoor()
end

function Door:solve()
    self.open = true
    self:trySolve(true)
    self:updateDoor()
end

function Door:unsolve()
    self.open = false
    self:updateDoor()
end

function Door:trySolve(c)
    if self.open ~= true then return end
    self:setSprite(self.opensprite or "world/events/boarddoor/closed")
    if c then
        self:setFlag("solved", true)
        if self.sound then
            Assets.playSound(self.sound)
        end
    end
end

function Door:onAdd(parent)
    super.onAdd(self, parent)

    if self:getFlag("solved") then
        self.open = true
        self:trySolve()
        self:updateDoor()
    end
end

function Door:update()
    super.update(self)
end

function Door:draw()
    super.draw(self)
end

function Door:onInteract(player, dir)
    if self.open then return end
    local cutscene = Game.world:startCutscene(function(c)
        c:boardText("The door is closed")
        c:resetBoardText()
    end)
end

return Door