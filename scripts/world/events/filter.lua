---@class Event.filter : Event
local event, super = Class(Event, "filter")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
	self.texw = properties["texw"] or SCREEN_WIDTH
	self.texh = properties["texh"] or SCREEN_HEIGHT
	self.texx = properties["texx"] or 0
	self.texy = properties["texy"] or 0
    self.fx = self:createFX(properties)
    self.fx.parent = self
    if data.shape ~= "point" then
        self:addFX(MaskFX(self))
    end
end

function event:onAdd()
	self:setLayer(WORLD_LAYERS["above_events"])
end

function event:drawMask()
    if self.collider then
        self.collider:drawFill()
    else
        love.graphics.rectangle("fill", 0,0,self:getSize())
    end
end

function event:update()
    super.update(self)
    if self.fx then
        self.fx:update()
    end
end

--- *Override* Returns an instance of the desired DrawFX, depending on the properties.
---@return DrawFX?
function event:createFX(properties)
    local fxtype = (properties.type or "crt"):lower()
    if fxtype == "crt" then
        return ShaderFX("crt", {
			["vignette_scale"] = 0.2,
			["vignette_intensity"] = math.pow(1.5, 1.5 - 0.2) * 18,
			["chromatic_scale"] = 0.5,
			["filter_amount"] = 0.1,
			["time"] = function () return ((Kristal.getTime() * 30)/2) % 3 end,
			["texsize"] = {1/self.texw, 1/self.texh}
		}, true)
    end
end

function event:fullDraw(...)
    self.main_canvas = love.graphics.getCanvas() -- Usually SCREEN_CANVAS, but not always.
    super.fullDraw(self)
end

function event:draw()
    if not (self.fx and self.fx:isActive()) then
        return super.draw(self)
    end
    love.graphics.push()
    Draw.pushCanvasLocks()
    love.graphics.origin()
	love.graphics.translate(128, 64)
    local c = Draw.pushCanvas(self.texw, self.texh)
    Draw.drawCanvas(self.main_canvas, -128, -64)
    Draw.popCanvas(true)
    love.graphics.clear(0, 0, 0, 1)
    self.fx:draw(c)
    Draw.popCanvasLocks()
    love.graphics.pop()
	love.graphics.translate(0, 0)
    super.draw(self)
end

return event