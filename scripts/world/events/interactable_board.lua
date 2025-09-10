local InteractableBoard, super = Class(Interactable)

function InteractableBoard:init(data)
    super.init(self, data)

    local properties = data and data.properties or {}

    self.solid = properties["solid"] or false

    self.cutscene = properties["cutscene"]
    self.script = properties["script"]
    self.text = Utils.parsePropertyMultiList("text", properties)

    self.set_flag = properties["setflag"]
    self.set_value = properties["setvalue"]

    self.once = properties["once"] or false

    self.interact_count = 0
end

function InteractableBoard:onInteract(player, dir)
    self.interact_count = self.interact_count + 1

    if self.script then
        Registry.getEventScript(self.script)(self, player, dir)
    end
    local cutscene
    if self.cutscene then
        cutscene = Game.world:startCutscene(self.cutscene, self, player, dir)
    else
        cutscene = self.world:startCutscene(function(c)
            local text = self.text
            local text_index = Utils.clamp(self.interact_count, 1, #text)
            if type(text[text_index]) == "table" then
                text = text[text_index]
            end
            for _,line in ipairs(text) do
                c:boardText(line)
            end
			c:resetBoardText()
        end)
    end
    cutscene:after(function()
        self:onTextEnd()
    end)

    if self.set_flag then
        Game:setFlag(self.set_flag, (self.set_value == nil and true) or self.set_value)
    end

    self:setFlag("used_once", true)
    if self.once then
        self:remove()
    end

    return true
end

return InteractableBoard