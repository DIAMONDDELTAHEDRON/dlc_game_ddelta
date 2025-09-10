---@class CRTShaderFX: ShaderFX
local CRTShaderFX, super = Class(ShaderFX)

function CRTShaderFX:init(...)
    super.init(self, ...)
    self.canvas = love.graphics.newCanvas(384,256)
    self.quad = Assets.getQuad(128,64,self.canvas:getWidth(),self.canvas:getHeight(),SCREEN_CANVAS:getDimensions())
    -- self.vars.texsize = {self.canvas:getWidth(),self.canvas:getHeight()}
    local vars = {}
    for key, value in pairs(self.vars) do
        if self.shader:hasUniform(key) then
            vars[key] = value
        end
    end
    self.vars = vars
end

function CRTShaderFX:draw(texture)
    Draw.pushCanvas(self.canvas)
    Draw.draw(texture, self.quad)
    Draw.popCanvas()
    love.graphics.translate(128,64)
    -- Draw.draw(self.canvas)
    super.draw(self, self.canvas)
    -- super.draw(self, texture)
end

return CRTShaderFX