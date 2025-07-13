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

function test_map:update()
    super.update(self)
    if Game.world.player then
        local px = Game.world.player.x
        local py = Game.world.player.y
        local grid_w = 192 * 2
        local grid_h = 256
        --Game.world.camera.x = math.floor(px / grid_w) * grid_w + 192
        --Game.world.camera.y = math.floor(py / grid_h) * grid_h + 176

        local misc_x = math.floor(px / grid_w) * grid_w + 192
        local misc_y = math.floor(py / grid_h) * grid_h + 176
        
        if (misc_x ~= Game.world.camera.x) or (misc_y ~= Game.world.camera.y) then
            Game.lock_movement = true
        else
            Game.lock_movement = false
        end

        if misc_x > Game.world.camera.x then
            Game.world.camera.x = Game.world.camera.x + DTMULT*self.speedx
        elseif misc_x < Game.world.camera.x then
            Game.world.camera.x = Game.world.camera.x - DTMULT*self.speedx
        end

        if misc_y > Game.world.camera.y then
            Game.world.camera.y = Game.world.camera.y + DTMULT*self.speedy
        elseif misc_y < Game.world.camera.y then
            Game.world.camera.y = Game.world.camera.y - DTMULT*self.speedy
        end

    end
end

return test_map
