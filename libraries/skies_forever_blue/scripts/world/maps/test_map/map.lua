local test_map, super = Class(Map)

-- Define your grid size (how wide/tall each camera section is)
local GRID_WIDTH = 192
local GRID_HEIGHT = 176

function test_map:onEnter()
    super.onEnter(self)


    local cam = Game.world.camera
    cam.keep_in_bounds = false
    cam.state = "STATIC"
    cam.x = 0
    cam.y = 0

    self.speedy = 8
    self.speedx = 8
end

function test_map:onExit()
    super.onExit(self)

    Game.world.camera.keep_in_bounds = true
    Game.lock_movement = false

    local save = {}


    local cam = Game.world.camera

    save.player_y = Game.world.player.y
    save.cam_y = cam.y
    save.player_x = Game.world.player.x
    save.cam_x = cam.x

    Game:setFlag("sword_save", save)

end


function test_map:swap_grid(x, y)
    Game.stage.timer:tween(0.5, Game.world.camera, {y = y, x = x}, 'linear', function()
        Game.world.camera.y = y
        Game.world.camera.x = x
        self.swapping_grid = nil
        Game.lock_movement = false
    end)
end

function test_map:update()
    super.update(self)
    if Game.world.player then
        local px = Game.world.player.x
        local py = Game.world.player.y
        local grid_w = 192 * 2
        local grid_h = 256
        --Game.world.camera.x = math.floor(px / grid_w) * grid_w + 192
        --Game.world.camera.y = math.floor(py / grid_h) * grid_h + 176

        local xa = math.floor((px + 15) / grid_w) * grid_w + 192
        local ya = math.floor((py + 14) / grid_h) * grid_h + 176

        local xb = math.floor((px - 15) / grid_w) * grid_w + 192
        local yb = math.floor((py - 16) / grid_h) * grid_h + 176
        
        if not self.swapping_grid then
            if (yb ~= ya) or (xb ~= xa) then
                local x = math.floor(px / grid_w) * grid_w + 192
                local y = math.floor(py / grid_h) * grid_h + 176
                if x ~= xb then
                    x = xb
                    self:snap("right", Game.world.player.x - 32, Game.world.player.y)
                elseif x ~= xa then
                    x = xa
                    self:snap("left", Game.world.player.x + 32, Game.world.player.y)
                end
                if y ~= yb then
                    y = yb
                    self:snap("bottom", Game.world.player.x, Game.world.player.y - 32)
                elseif y ~= ya then
                    y = ya
                    self:snap("top", Game.world.player.x, Game.world.player.y + 32)
                end
                self.swapping_grid = true
                Game.lock_movement = true
                self:swap_grid(x, y)
            end
        end

    end
end

function test_map:getArea(x, y)
    local w = 192 * 2
    local h = 256

    local col = math.floor(x / w)
    local row = math.floor(y / h)
    return col, row
end

function test_map:snap(dir, x, y)
    local c, r = self:getArea(x, y)
    if dir == "left" then
        Game.world.player.x = (c*384) + 16
    elseif dir == "right" then
        Game.world.player.x = (c*384) + 368
    elseif dir == "top" then
        Game.world.player.y = (r*256) + 16
    elseif dir == "bottom" then
        Game.world.player.y = (r*256) + 240
    end
end

return test_map
