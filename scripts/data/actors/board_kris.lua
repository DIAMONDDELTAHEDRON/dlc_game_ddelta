local actor, super = Class(Actor, "board_kris")

function actor:onSpriteInit(sprite)
    sprite:setOrigin(0, -0.5)
end

function actor:init()
    super.init(self)
    self.name = "Kris"

    self.width = 16
    self.height = 16
    self.hitbox = {0.2, 16.2, 15.4, 7.4}
    self.soul_offset = {8, 16}
    self.path = "sword/party/kris"
    self.default = "walk"
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

        ["item"] = {-1, 0},
    }

    self.health = 160
    self.healthMax = 160
    self.color = {0, 1, 1}
    self.health_color = Utils.hexToRgb("#8FFCD8")
	
	self.ability = "interact"	-- ???
end

return actor