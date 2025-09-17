function Mod:init()
    --print("Loaded "..self.info.name.."!")

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

    if self.state == "GAMEPLAY" and not Game.world.board then
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


function Mod:getPf(i) --Get player facing and return a number
    local pf = Game.world.player.facing
    local a, b = 0, 0
    local n = 82
    if i then n = i end
        if pf == "up" then b = -n end
        if pf == "down" then b = n end
        if pf == "left" then a = -n end
        if pf == "right" then a = n end

    return a, b
end

function Mod:boardTile(x, y)
    local r = math.floor(x/32)
    local c = math.floor(y/32)
    local w, d = r*32, c*32
    return w, d
end
