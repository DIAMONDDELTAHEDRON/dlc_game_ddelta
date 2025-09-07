function Mod:init()
    --print("Loaded "..self.info.name.."!")

Utils.hook(PushBlock, "init", function(orig, self, x, y, shape, properties, sprite, solved_sprite)
    orig(self, x, y, shape, properties, sprite, solved_sprite)

    self.throw_reticle = Sprite("world/events/sword/throw_reticle")
    self.throw_reticle:setScale(2)
    
    local sprite_b = properties["sprite"] or sprite or "world/events/sword/pushableblock"
    self.carry = Sprite(sprite_b)
    self.carry.y = -5
end)

Utils.hook(PushBlock, "update", function(orig, self)
    orig(self)
    if self.state == "CARRIED" then

        local p = Game.world.player
        local pf = p.facing

        local a, b = 0, 0
        if pf == "up" then b = -82 end
        if pf == "down" then b = 82 end
        if pf == "left" then a = -82 end
        if pf == "right" then a = 82 end

        local c, r = Mod:getSquare(p.x + a, p.y + b)

        self.throw_reticle.x = c * 32
        self.throw_reticle.y = r * 32

        if Input.pressed("confirm") then

            p.actor.default = "walk"
            p:resetSprite()

            self.x, self.y = self.throw_reticle.x, self.throw_reticle.y
            Game.world:removeChild(self.throw_reticle)
            p:removeChild(self.carry)
            self:playPushSound()
            self.solid = true
            self.visible = true
            self.state = "IDLE"
            p.carry = nil
        end
    end
end)

Utils.hook(PushBlock, "onInteract", function(orig, self, chara, facing)
    if self.solid and chara.actor.id == "board_susie" then

        self:playPushSound()
        chara.actor.default = "walk_armsup"
        chara:resetSprite()
        chara.carry = true

        chara:addChild(self.carry)

        Game.world:addChild(self.throw_reticle)
        self.throw_reticle.layer = chara.layer

        self.solid = false
        self.visible = false
        self.state = "CARRIED"
        return true
    elseif chara.actor.id ~= "board_kris" then
        return true
    end
    self:playPushSound()

    if self.state ~= "IDLE" then return true end

    if not self:checkCollision(facing) then
        self:onPush(facing)
    else
        self:onPushFail(facing)
    end

    return true
end)


Utils.hook(World, "onKeyPressed", function(orig, self, key)
    if Kristal.Config["debug"] and Input.ctrl() then
        if key == "m" then
            if self.music then
                if self.music:isPlaying() then
                    self.music:pause()
                else
                    self.music:resume()
                end
            end
        end
        if key == "s" then
            local save_pos = nil
            if Input.shift() then
                save_pos = {self.player.x, self.player.y}
            end
            if Game:isLight() or Game:getConfig("smallSaveMenu") then
                self:openMenu(SimpleSaveMenu(Game.save_id, save_pos))
            else
                self:openMenu(SaveMenu(save_pos))
            end
        end
        if key == "n" then
            NOCLIP = not NOCLIP
        end
    end

    if Game.lock_movement then return end

    if self.state == "GAMEPLAY" then
        if Input.isConfirm(key) and self.player and not self:hasCutscene() then
            if self.player:interact() then
                Input.clear("confirm")
            end
        elseif Input.isMenu(key) and not self:hasCutscene() then
            self:openMenu(nil, WORLD_LAYERS["ui"] + 1)
            if not self.in_game then
                Input.clear("menu")
            end
        end
    elseif self.state == "MENU" then
        if self.menu and self.menu.onKeyPressed then
            self.menu:onKeyPressed(key)
        end
    end
end)

end

function Mod:getSquare(x, y)
    local r = math.floor(x/32)
    local c = math.floor(y/32)
    return r, c
end