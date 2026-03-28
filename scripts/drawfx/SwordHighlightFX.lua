---@class SwordHighlightFX : FXBase
---@overload fun(...) : HighlightFX
local SwordHighlightFX, super = Class(FXBase)

function SwordHighlightFX:init(alpha, color, settings, priority)
    super.init(self, priority)

    self.alpha = alpha or 0
    self.color = color or {1, 1, 1, 1}
    self.scale = settings["scale"] or 1
    self.thickness = settings["thickness"] or 1
    self.cutout = settings["cutout"]
	self.shadow_alpha = settings["shadow_alpha"] or 1

    self.cutout_shader = Kristal.Shaders["Mask"]
    self.shadow_offset = 1
end

function SwordHighlightFX:getAlpha()
    return self.alpha
end

function SwordHighlightFX:getShadowAlpha()
    return self.shadow_alpha
end

function SwordHighlightFX:getScale()
    return self.scale
end

function SwordHighlightFX:setColor(r, g, b, a)
    self.color = {r, g, b, a}
end

function SwordHighlightFX:getColor()
    return self.color[1], self.color[2], self.color[3]
end

function SwordHighlightFX:isActive()
    return super.isActive(self) and self:getAlpha() > 0
end

function SwordHighlightFX:draw(texture)
    local alpha = self:getAlpha()

    local object = self.parent

    local mult_x, mult_y = object:getFullScale()
    mult_x = mult_x * self.thickness
    mult_y = mult_y * self.thickness
	
	local sx, sy = self.parent:getFullScale()
	local ox, oy, ow, oh = self:getObjectBounds()
    local highlight = Draw.pushCanvas(texture:getWidth(), texture:getHeight())

	local last_shader = love.graphics.getShader()
    local shader = Kristal.Shaders["AddColor"]
	
    love.graphics.stencil((function()
        love.graphics.setShader(self.cutout_shader)
		Draw.drawCanvas(texture, 0, 1 * mult_x)
		if not self.cutout then
			Draw.drawCanvas(texture, ox, oy+oh + (self.shadow_offset * sy), 0, 1, -1, ox, oy+oh)
		end
        love.graphics.setShader(last_shader)
    end), "replace", 1)
    love.graphics.setStencilTest("less", 1)

    love.graphics.setShader(shader)
    shader:send("inputcolor", {self:getColor()})
    shader:send("amount", self.alpha)
	
    Draw.drawCanvas(texture)
    love.graphics.setStencilTest()
	
    love.graphics.setShader(last_shader)
    Draw.popCanvas()

    if not self.cutout then
		local shadow_alpha = self:getShadowAlpha()
		Draw.drawCanvas(texture)
		Draw.setColor(0.5, 0.5, 0.5, shadow_alpha)
		Draw.drawCanvas(texture, 0, 1 * mult_x)
		Draw.setColor(0, 0, 0, shadow_alpha * 0.8)
		Draw.drawCanvas(texture, ox, oy+oh + (self.shadow_offset * sy), 0, 1, -1, ox, oy+oh)
    end
    Draw.setColor(1, 1, 1, 1)
    Draw.drawCanvas(highlight)
    Draw.setColor(1, 1, 1, 1)
end

return SwordHighlightFX