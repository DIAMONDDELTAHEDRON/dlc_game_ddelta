---@overload fun(...) : HookPostBoard
local HookPostBoard, super = Class(Event, "hook_post_board")

function HookPostBoard:init(data, x, y)
    super.init(self, data, x, y, shape)

    local properties = data.properties or {}

    self:setSprite("world/events/sword/hook_post")
    self.solid = true
end

return HookPostBoard