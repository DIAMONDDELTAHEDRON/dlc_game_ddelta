local Keypad, super = Class(Event, "keypad")

function Keypad:updatePad(guess)
    if guess then
        local gt = type(guess)
        local len = guess

        if gt == "string" then
            len = string.len(guess)
        elseif gt == "table" then
            len = #guess
        end

        if len > 5 then
            len = 5
        end

        self:setSprite("world/events/keypad/" .. len)
        return
    end

    if self.open then
        -- Destroy the door object
        self.solid = false
        self.visible = false
        local door = self.door

        if door then
            local id = door.id
            if id then
                Game.world.map:getEvent(id):remove()
            else
                door:remove()
            end
        end
    else
        self:setSprite("world/events/keypad/idle")
    end
end

function Keypad:init(data)
    super.init(self, data)
    self:setSprite("world/events/keypad/idle")

    local properties = data.properties or {}
    self.properties = properties or {}
    self.open = false
    self.solid = true
    self.sound = properties["sound"] or "bell"
    self.errorsound = properties["errorsound"] or "error"
    self.door = properties["door"] or properties["object"] or properties["obj"]
    self.numbers = properties["numbers"] or 4
    self.padnumbers = properties["padnumbers"] or properties["pad"] or self.numbers
    self.pass = properties["pass"] or properties["password"] or 1234

    self:setScale(1)
    self:setOrigin(0.5, 1)
    self:updatePad()
end

function Keypad:tryOpen(c)
    if self.open == true then
        self:setSprite("world/events/keypad/success")
        if c then
            if self.sound then
                Assets.playSound(self.sound)
            end
            c:text("* (Correct!)")
        end
    else
        self:setSprite("world/events/keypad/error")
        if c then
            if self.errorsound then
                Assets.playSound(self.errorsound)
            end
            c:text("* (Wrong!)")
        end
    end
end

function Keypad:onAdd(parent)
    super.onAdd(self, parent)

    if self:getFlag("unlocked") then
        self.open = true
        self:tryOpen()
        self:updatePad()
    end
end

function Keypad:update()
    super.update(self)
end

function Keypad:draw()
    super.draw(self)
end

function Keypad:onInteract(player, dir)
    if self.open then return end
    local cutscene = Game.world:startCutscene(function(c)
        c:text("* (It appears to be some kind of keypad)\n* (Input code?)")
        local keychoice = c:choicer({"Yes", "No"})
        if keychoice == 2 then return end

        local numbers = self.numbers
        local padnumbers = self.padnumbers
        local pass = self.pass
        local guess = ""

        local numberchoices = {}
        for i = 1,numbers do
            table.insert(numberchoices, tostring(i))
        end

        for i = 1,padnumbers do
            local wguess = c:choicer(numberchoices)
            Assets.playSound("voice/board")
            self:updatePad(i)
            guess = guess .. wguess
        end

        c:wait(0.2)
        Assets.playSound("item")
        self:updatePad()
        c:wait(1)

        if tonumber(guess) == pass then
            self.open = true
        else
            self.open = false
        end

        self:tryOpen(c)
        if self.open then
            Assets.playSound("bluh")
            self:setFlag("unlocked", true)
        end
        self:updatePad()
    end)
end

return Keypad