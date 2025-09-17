---@class BoardUI : Object
---@overload fun(...) : BoardUI
local BoardUI, super = Class(Object)

function BoardUI:init()
    super.init(self)

    self.quit_timer = 0
    Game.world.in_game = true

    self.parallax_x = 0
    self.parallax_y = 0

    self.font = Assets.getFont("8bit")

    local br = Game:getFlag("board_actors")
	
    --board character variables
    self.charas = {"kris", "susie", "ralsei", "lancer", "noelle", "jamm"}
    self.chara_state = "none"
    self.layer = 22

    --kris variables
    self.kris_has_sword = false
    self.swordbuffer = 0
    self.swordfacing = "down"

    --susie variables
    self.grab = 0
    self.grabcon = 0
    self.grabbuffer = 0
    self.grabbed = 0
    self.grabmarker = nil
    self.doagrab = false

    --ralsei variables
    self.go_stoole = false
    self.stool = nil
    self.stoolbuff = 0
    self.unstoole = false

    --lancer variables
    self.digfreeze = 0
    self.digcon = 0
    self.digtime = 0


    -- x + 94 for every other health bar
    self.healthbars = {}
    self.healthbars[1] = BoardHealthBar(128, 32, Game.world.board.player.actor)
    self:addChild(self.healthbars[1])

    for i, follower in ipairs(Game.world.followers) do
        local x = 128 + (94 * i)
        local b = i + 1
        self.healthbars[b] = BoardHealthBar(x, 32, follower.actor)
        self:addChild(self.healthbars[b])
    end

    self.score_bar = BoardScoreBar(410, 32)
    self:addChild(self.score_bar)

    self.inventory_bar = BoardInventoryBar(80, 64)
    self:addChild(self.inventory_bar)
	
    self.sword_route = false
end

function BoardUI:update()
    super.update(self)

    if self.quit_timer >= 90 then
        self:quit()
    end
	
    if Input.pressed("confirm") and not Game.world:hasCutscene() and not Game.world.board:hasCutscene() then

        if self.chara_state ~= "none" then
            self:characterAction()
            Input.clear("confirm")
        end

        if Game.world.board.player:interact() then
            Input.clear("confirm")
        else
            self:characterAction()
        end
    end

    if Input.down("cancel") and not (Game.world:hasCutscene()) then
        self.quit_timer = self.quit_timer + DTMULT*2
    elseif self.quit_timer > 0 then
        self.quit_timer = self.quit_timer - DTMULT*3
    elseif self.quit_timer < 0 then
        self.quit_timer = 0
    end

    if Input.pressed("menu") and #Game.party == 1 and self.chara_state == "none" and not (Game.world:hasCutscene() or self.sword_route) then
        self:swapCharacter()
    end


    local p = Game.world.board.player
    local id = p.actor.id:gsub("board_", "")
    local name = id..""..id
	
    if name == id.."ralsei" then
        if self.stoolbuff > 0 then
            self.stoolbuff =  self.stoolbuff - (1 * DTMULT)
        end
    end
end


function BoardUI:characterAction() -- character abilities should mainly be handled here
    local p = Game.world.board.player
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
                p.x, p.y = self.stool_x + 16, self.stool_y + 32

                --creates a "pushblock_board" event
                self.stool = Game.world.board:spawnObject(Registry.createEvent("pushblock_board", {
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
                --Game.lock_movement = true
                p.alpha = 0
                self.stoolbuff = 3
            end
        end

        if self.chara_state == "stoolforme" and (self.stoolbuff <= 0 or self.unstoole) then
            self.unstoole = false

            Assets.playSound("board/ralsei_cube", stoolevolume, 0.7)
            self.stool:remove()
            --Game.lock_movement = false
            self.chara_state = "none"
            p.alpha = 1
            self.stoolbuff = 3
        end

        --particle effect when changing forms
        local puff = BoardSmokePuff(8, 16)
        puff:setColor(19/255, 210/255, 111/255, 1)
        puff:setOrigin(0.5, 0.5)
        puff:setLayer(p.layer + 0.1)
        p:addChild(puff)
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

function BoardUI:swapCharacter()   -- changes the current player character
    local p = Game.world.board.player

    local puff = BoardSmokePuff(8, 16)
    puff:setColor(201/255, 201/255, 201/255, 1)
    puff:setOrigin(0.5, 0.5)
    puff:setLayer(p.layer + 0.1)
    p:addChild(puff)

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

function BoardUI:addScore(score, sound)
    local scoreadder = self:addChild(BoardScoreAdder())
    scoreadder.scoreamount = score

    if sound then
        scoreadder.mysnd = sound
    end
end

function BoardUI:setScore(score)
    Game:setFlag("points", score)
end

function BoardUI:draw()
    super.draw(self)

    love.graphics.setFont(Assets.getFont("main"))
    love.graphics.setColor(1, 1, 1)

    love.graphics.printfOutline("Hold [CANCEL] to EXIT", 164, 5, 2)

    local last = love.graphics.getLineWidth()
    love.graphics.setLineWidth(5)
    love.graphics.arc( "line", "open", 120, (40-18), 15, 0, self.quit_timer/14 )
    love.graphics.setLineWidth(last)   
end

function BoardUI:quit()
end

return BoardUI