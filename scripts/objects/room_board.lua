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
    self.wall.debug_select = false


    self.console = Sprite(q.."console") --356 --322 --34
    self:addChild(self.console)
    self.console:setScale(2)
    self.console.x = 270
    self.console.y = 322

    local br = Game:getFlag("board_actors")
    self.npcs = {}

    for i, member in ipairs(Game.party) do
        if br[i] then
            local npc = NPC(br[i].actor, br[i].x, br[i].y)
            npc.world = Game.world
            self:addChild(npc)
            npc:setFacing("up")

            self.npcs[member.id] = npc
        end
    end

    --self.npcs["kris"]
    --self.npcs["susie"]

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
    self.healthbars = {}
    self.healthbars[1] = board_healthbar(128, 32, Game.world.player.actor)
    self:addChild(self.healthbars[1])

    for i, follower in ipairs(Game.world.followers) do
        local x = 128 + (94 * i)
        local b = i + 1
        self.healthbars[b] = board_healthbar(x, 32, follower.actor)
        self:addChild(self.healthbars[b])
    end


    self.score = board_score((128 + 92 * #Game.party) + (2 * #Game.party), 32)
    self:addChild(self.score)

end

function room_board:update()
    super.update(self)

    if self.quit_timer >= 90 then
        self:quit()
    end

    if Input.down("cancel") then
        self.quit_timer = self.quit_timer + DTMULT*2
    elseif self.quit_timer > 0 then
        self.quit_timer = self.quit_timer - DTMULT*3
    elseif self.quit_timer < 0 then
        self.quit_timer = 0
    end
    if Input.pressed("menu") and #Game.party == 1 and not Game.world.player.carry then
        self:swap_party()
    end
end

function room_board:swap_party()
    local charas = {"kris", "susie", "ralsei", "noelle"}
    local p = Game.world.player

    local id = p.actor.id:gsub("board_", "")
    for i, name in ipairs(charas) do
        if name == id then
            local next_index = (i % #charas) + 1
            p:setActor("board_" .. charas[next_index])
            break
        end
    end
    local b = self.healthbars[1]
    b:init(b.x, b.y, p.actor)
end

function room_board:draw()
    super.draw(self)

    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("Hold [CANCEL] to EXIT", 150, 28 - 18)

    local last = love.graphics.getLineWidth()
    love.graphics.setLineWidth(5)
    love.graphics.arc( "line", "open", 120, 40 - 18, 15, 0, self.quit_timer/14 )
    love.graphics.setLineWidth(last)   

end
function room_board:quit()
    Game.world:loadMap("floortv/board")

    local br = Game:getFlag("board_actors")

    Game.world.player.x = br[1].x
    Game.world.player.y = br[1].y
    Game.world.player:setFacing("up")

    Game.world:startCutscene(function(cutscene)
        cutscene:wait((Game.world.tv == "floortv/board"))

        for i, follower in ipairs(Game.world.followers) do
            local i = i + 1
            follower.x = br[i].x
            follower.y = br[i].y
            --follower:setFacing("up")
        end

        --Game.world.player.history = Game:getFlag("walk_history")

    end)

    Game.world.can_open_menu = true
    Game.world.in_game = nil
end

return room_board