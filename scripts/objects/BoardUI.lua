---@class BoardUI : Object
---@overload fun(...) : BoardUI
local BoardUI, super = Class(Object)

function BoardUI:init()
    super.init(self)

    self.quit_timer = 0
    Game.world.in_game = true

    self.layer = 22
    self.parallax_x = 0
    self.parallax_y = 0

    self.font = Assets.getFont("8bit")

    -- x + 94 for every other health bar
    self.healthbars = {}
    self.healthbars[1] = BoardHealthBar(128, 32, Game.world.board.player.actor)
    self:addChild(self.healthbars[1])

    for i, follower in ipairs(Game.world.board.followers) do
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

    local p = Game.world.board.player
    if self.quit_timer >= 90 then
        self:quit()
    end
	
    if Input.pressed("confirm") and not Game.world:hasCutscene() then
        if p:interact() then
            Input.clear("confirm")
        else
            p:characterAction()
            Input.clear("confirm")
        end
    end

    if Input.down("cancel") and not (Game.world:hasCutscene()) then
        self.quit_timer = self.quit_timer + DTMULT*2
    elseif self.quit_timer > 0 then
        self.quit_timer = self.quit_timer - DTMULT*3
    elseif self.quit_timer < 0 then
        self.quit_timer = 0
    end

    if Input.pressed("menu") and #Game.party == 1 and p.chara_state == "none" and not (Game.world:hasCutscene() or self.sword_route or p.carry) then
        p:switchCharacter()
    end
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
    Game.world.board:remove()
    self:remove()
    Game.world.player.active = true
    Game.world.music:stop()
end

return BoardUI