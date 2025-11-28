local actor, super = Class(Actor, "board_npc")

function actor:init()
    super.init(self)
    self.name = "NPC"

    self.width = 16
    self.height = 16
    self.hitbox = {0.2, 8.2, 15.4, 7.4}
    self.soul_offset = {8, 16}
    self.path = "sword/npcs"
    self.default = "arltr"
    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil
    self.can_blush = false

    self.animations = {
    }
    self.mirror_sprites = {
        ["walk/down"] = "walk/up",
        ["walk/up"] = "walk/down",
        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }
    self.offsets = {
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},
    }

    self.health = 100
    self.healthMax = 100
    self.color = {0, 1, 0}
end

return actor