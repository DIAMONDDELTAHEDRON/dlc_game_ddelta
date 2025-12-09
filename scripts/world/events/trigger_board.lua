local Trigger, super = Class(Event, "trigger_board")

function Trigger:updateTrigger()
    if self.triggered then
        self:setFlag("triggered", true)
    end
end

function Trigger:trigger(obj)
    obj = obj or self.obj
    if self.triggered == true then return end
    if self.once then
        self.triggered = true
    end
    if self.sound then
        Assets.playSound(self.sound)
    end

    if self.setflag then
        Game:setFlag(self.setflag, self.setflagvalue)
    end

    if obj then
        local id = obj.id
        if id then
            obj = Game.world.board:getEvent(id)
        end
        if obj then
            if obj.solve then
                obj:solve()
            else
                if obj.remove then
                    obj:remove()
                end
            end
        end
    end
end

function Trigger:init(data)
    super.init(self, data)

    local properties = data.properties or {}
    self.properties = properties or {}
    self.obj = properties["object"] or properties["obj"]
    self.sound = properties["sound"]
    self.triggered = properties["triggered"] or false
    self.solid = properties["solid"] or false
    self.once = properties["once"] or true
    self.setflag = properties["setflag"]
    self.setflagvalue = properties["setflagvalue"] or true

    self:setScale(1)
    --self:setOrigin(0.5, 0.5)
    self:updateTrigger()
end

function Trigger:onAdd(parent)
    super.onAdd(self, parent)

    if self:getFlag("triggered") then
        self.triggered = true
        self:updateTrigger()
    end
end

function Trigger:checkBoardBoxes()
    for i,event in ipairs(Game.world.board:getEvents("pushblock_board")) do
        local id = event.id
        local x,y = event:getPosition()
        if self.x == x then
            if self.y == y then
                if event.onSolved then
                    event:onSolved()
                end
                event.solved = true
                event.lock_in_place = true
                self:trigger()
            end
        end
        -- print("i: " .. tostring(i) .. " id: " .. tostring(id) .. " x: " .. tostring(x) .. " y: " .. tostring(y))
    end
end

function Trigger:update()
    super.update(self)
    if self.triggered and self.triggered == true then return end

    self:checkBoardBoxes()
end

function Trigger:draw()
    super.draw(self)
end

return Trigger