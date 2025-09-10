---@class BoardEvent : Event
---@field world BoardWorld
local board_event, super = Class(Event, "BoardEvent")

function board_event:onAdd(parent)
    if parent.world then
        self.world = parent.world
    else
        self.world = Game.world.board
    end
end

return board_event