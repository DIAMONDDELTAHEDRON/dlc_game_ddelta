local actor, super = Class(Actor, "ramb")


function actor:onSpriteInit(sprite)
    self.face = Sprite(self.path.. "/clearly_1")
    self.face.y = -19
    sprite:addChild(self.face)


    if Game.world.map.id == "room1" then
        self.face:setSprite("npcs/ramb/look", 1, true)
    end
end
--Game.world:getCharacter("ramb").actor.face:setSprite("npcs/ramb/look")

function actor:setFace(face)
    self.face:setSprite(self.path.. "/" .. face)
end

function actor:init()
    super.init(self)
    self.name = "Ramb"

    self.width = 25
    self.height = 32

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 22, 25, 10}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/ramb"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"
    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil
    self.can_blush = false


    -- Table of sprite animations
    self.animations = {
        ["glass"] = {"glass", 1/4, true},

        ["idle"] = {"idle"},
    }
    self.offsets = {

        ["idle"] = {0, 19},

        ["glass"] = {0, 19},
    }
end

return actor