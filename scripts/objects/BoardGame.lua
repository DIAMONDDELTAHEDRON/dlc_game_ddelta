---@class BoardGame : Object
---@overload fun(...) : BoardGame
local BoardGame, super = Class(Object)

function BoardGame:init()
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
	
    --board character variables
    self.charas = {"kris", "susie", "ralsei", "noelle", "jamm"}
    self.chara_state = "none"

    --kris variables
    self.kris_has_sword = false
    self.swordbuffer = 0
    self.swordfacing = "down"

    --ralsei variables
    self.go_stoole = false
    self.stool = nil
    self.stoolbuff = 0
    self.unstoole = false


    -- x + 94 for every other health bar
    self.healthbars = {}
    self.healthbars[1] = BoardHealthBar(128, 32, Game.world.player.actor)
    self:addChild(self.healthbars[1])

    for i, follower in ipairs(Game.world.followers) do
        local x = 128 + (94 * i)
        local b = i + 1
        self.healthbars[b] = BoardHealthBar(x, 32, follower.actor)
        self:addChild(self.healthbars[b])
    end

    self.score = BoardScoreBar(410, 32)
    self:addChild(self.score)
	
    self.sword_route = false
end

function BoardGame:update()
    super.update(self)

    if self.quit_timer >= 90 then
        self:quit()
    end
	
    if Input.pressed("confirm") then
        self:characterAction()
    end

    if Input.down("cancel") then
        self.quit_timer = self.quit_timer + DTMULT*2
    elseif self.quit_timer > 0 then
        self.quit_timer = self.quit_timer - DTMULT*3
    elseif self.quit_timer < 0 then
        self.quit_timer = 0
    end

    if Input.pressed("menu") and #Game.party == 1 and self.chara_state == "none" and not self.sword_route then
        self:swapCharacter()
    end

    local p = Game.world.player
    local id = p.actor.id:gsub("board_", "")
    local name = id..""..id
	
    if name == id.."ralsei" then
        if self.stoolbuff > 0 then
            self.stoolbuff =  self.stoolbuff - (1 * DTMULT)
        end
    end
end

function BoardGame:characterAction() -- character abilities should mainly be handled here
    local p = Game.world.player
    local id = p.actor.id:gsub("board_", "")
    local name = id..""..id

    if name == id.."kris" then    -- nothing (unless you've obtained the sword.)
        return
    end
    if name == id.."susie" then   -- grab and throw
        return
    end
    if name == id.."ralsei" then  -- stool forme
        local can_stoole = true
        local stoolevolume = 0.6
		
        if self.chara_state == "none" and (self.stoolbuff <= 0 or self.go_stoole) then
            if can_stoole then
                self.go_stoole = false
				
                self.stool_x, self.stool_y = Mod:boardTile(p.x, p.y)
                p.x, p.y = self.stool_x + 16, self.stool_y + 16

                --creates a "pushblock_board" event
                self.stool = Game.world:spawnObject(Registry.createEvent("pushblock_board", {
                    x = self.stool_x, 
                    y =  self.stool_y, 
                    properties = { 
					    sprite = "sword/party/ralsei/stoolforme",
					    pushsound = "voice/ralsei"
                    }
                }))
                self.stool:setLayer(p.layer - 0.1)

                self.chara_state = "stoolforme"
                Assets.playSound("board/ralsei_cube", stoolevolume, 1)
                Game.lock_movement = true
                p.alpha = 0
                self.stoolbuff = 3
            end
        end

        if self.chara_state == "stoolforme" and (self.stoolbuff <= 0 or self.unstoole) then
            self.unstoole = false

            Assets.playSound("board/ralsei_cube", stoolevolume, 0.7)
            self.stool:remove()
            Game.lock_movement = false
            self.chara_state = "none"
            p.alpha = 1
            self.stoolbuff = 3
        end

        --particle effect when changing forms
        local puff = Sprite("sword/effects/smokepuff", 8, 16)
        puff:setColor(19/255, 210/255, 111/255, 1)
        puff:setOrigin(0.5, 0.5)
        puff:setLayer(p.layer + 0.1)
        p:addChild(puff)
        puff:play(1/30, false, function() puff:remove() end)
    end
    if name == id.."lancer" then  -- digging
        return
    end
    if name == id.."elnina" then  -- crying
        return
    end
    if name == id.."noelle" then  -- ice magic
        return
    end
    if name == id.."jamm" then    -- hookshot
        return
    end
end

function BoardGame:swapCharacter()   -- changes the current player character
    local p = Game.world.player

    local puff = Sprite("sword/effects/smokepuff", 8, 16)
    puff:setColor(201/255, 201/255, 201/255, 1)
    puff:setOrigin(0.5, 0.5)
    puff:setLayer(p.layer + 0.1)
    p:addChild(puff)
    puff:play(1/30, false, function() puff:remove() end)

    local id = p.actor.id:gsub("board_", "")
    for i, name in ipairs(self.charas) do
        if name == id then
            local next_index = (i % #self.charas) + 1
            p:setActor("board_" .. self.charas[next_index])

            Assets.playSound("voice/board", 1, 1.1 + (next_index / 10))
            Assets.playSound("voice/board", 1, 0.2 + (next_index / 10))
            Assets.playSound("board/splash", 0.4, 0.8)

            break
        end
    end
    local b = self.healthbars[1]
    b:init(b.x, b.y, p.actor)
end

function BoardGame:draw()
    super.draw(self)

    love.graphics.setFont(Assets.getFont("main"))
    love.graphics.setColor(1, 1, 1)

    love.graphics.printfOutline("Hold [CANCEL] to EXIT", 164, 5, 2)

    local last = love.graphics.getLineWidth()
    love.graphics.setLineWidth(5)
    love.graphics.arc( "line", "open", 120, (40-18), 15, 0, self.quit_timer/14 )
    love.graphics.setLineWidth(last)   
end

function BoardGame:quit()
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

return BoardGame