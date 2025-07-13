---@class room_board : Object
---@overload fun(...) : room_board
local room_board, super = Class(Object)

function room_board:init()
    super.init(self)

    self.quit_timer = 0
    Game.world.in_game = true

    self.parallax_x = 0
    self.parallax_y = 0

    self.font = Assets.getFont("8bit")

    local q = "world/maps/tvland/board/gameshow_"

    self.wall = Sprite(q.."wall")
    self:addChild(self.wall)
    self.wall:setScale(2)

    self.console = Sprite(q.."console") --356 --322 --34
    self:addChild(self.console)
    self.console:setScale(2)
    self.console.x = 270
    self.console.y = 322


    local br = Game:getFlag("board_actors")

    self.kris = NPC(br[1].actor, br[1].x, br[1].y)
    self.kris.world = Game.world

    self:addChild(self.kris)
    self.kris:setFacing("up")

    self.couch = Sprite(q.."couch")
    self:addChild(self.couch)
    self.couch:setScale(2)
    self.couch.y = 452
    self.couch.layer = 1

    self.playerpodiums = Sprite(q.."playerpodiums")
    self:addChild(self.playerpodiums)
    self.playerpodiums:setScale(2)
    self.playerpodiums.x = 128
    self.playerpodiums.y = 474 - 36
    self.playerpodiums.layer = 1


    -- x + 94 for every other health bar

    self.player_one = board_healthbar(128, 32, Game.world.player.actor)
    self:addChild(self.player_one)


    self.score = board_score((128 + 92 * #Game.party) + 2, 32)
    self:addChild(self.score)

end

function room_board:update()
    super.update(self)

    if self.quit_timer >= 90 then
        self:quit()
    end

    if Input.down("menu") then
        self.quit_timer = self.quit_timer + DTMULT*2
    elseif self.quit_timer > 0 then
        self.quit_timer = self.quit_timer - DTMULT*3
    elseif self.quit_timer < 0 then
        self.quit_timer = 0
    end
end

function room_board:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("Hold [MENU] to EXIT", 150, 28 - 18)

    local last = love.graphics.getLineWidth()
    love.graphics.setLineWidth(5)
    love.graphics.arc( "line", "open", 120, 40 - 18, 15, 0, self.quit_timer/14 )
    love.graphics.setLineWidth(last)   

end

function room_board:quit()

    Game.world:loadMap("floortv/board")

    local br = Game:getFlag("board_actors")
    Game.world.player.y = br[1].y
    Game.world.player.x = br[1].x
    Game.world.can_open_menu = true
    Game.world.in_game = nil
    Game.world.player:setFacing("up")
end

return room_board