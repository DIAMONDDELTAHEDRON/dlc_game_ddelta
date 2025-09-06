return {
    play = function(cutscene, event)

        local function openMenulol(menu, layer)
            local self = Game.world
            if self.menu then
                self.menu:remove()
                self.menu = nil
            end

            if not menu then
                menu = self:createMenu()
            end

            self.menu = menu
            if self.menu then
                self.menu.layer = layer and self:parseLayer(layer) or WORLD_LAYERS["ui"]

                if self.menu:includes(AbstractMenuComponent) then
                    self.menu.close_callback = function ()
                        self:afterMenuClosed()
                    end
                elseif self.menu:includes(Component) then
                    -- Sigh... traverse the children to find the menu component
                    for _, child in ipairs(self.menu:getComponents()) do
                        if child:includes(AbstractMenuComponent) then
                            child.close_callback = function ()
                                self:afterMenuClosed()
                            end
                            break
                        end
                    end
                end

                self:addChild(self.menu)
                self:setState("MENU")
            end
            return self.menu
        end

        local br = {}

        br[1] = {}
        br[1].actor = Game.world.player.actor.id
        br[1].x = Game.world.player.x
        br[1].y = Game.world.player.y

        for i, c in ipairs(Game.world.followers) do
            local i = i + 1
            br[i] = {}
            br[i].actor = c.actor.id
            br[i].x = c.x
            br[i].y = c.y
        end

        Game:setFlag("board_actors", br)
        --Game:setFlag("walk_history", Game.world.player.history)

        Game.world:loadMap("test_map")


        Game.world.player:setActor("board_kris")
        Game.world.player.force_walk = true

        for i, c in ipairs(Game.world.followers) do
            if i == 1 then
                c:setActor("board_susie")
            elseif i == 2 then
                c:setActor("board_ralsei")
            elseif i == 3 then
                c:setActor("board_noelle")
            else
                c:setActor("board_kris")--temp
            end
        end

        Game.board = openMenulol(room_board())
        Game.world:closeMenu()

        Game.world.camera.x = 576
        Game.world.camera.y = 688

        Game.world.can_open_menu = false


    --currently disabled because: dont know how to feel about it

    --local save = Game:getFlag("sword_save")

    --local cam = Game.world.camera
    --if save then
    --    Game.world.player.x = save.player_x
    --    Game.world.player.y = save.player_y
    --    cam.x = save.cam_x
    --    cam.y = save.cam_y
    --end

    end,

    shop_enter = function(cutscene, event)
        Game.world.player.x = 192
        Game.world.player.y = 240
        Game.world.camera.x, Game.world.camera.y = 192, 176
    end,

    shop_exit = function(cutscene, event)
        Game.world.player.x = 480
        Game.world.player.y = 880
        Game.world.camera.x, Game.world.camera.y = 576, 944
    end,
}
