local BoardHazard, super = Class(Event)

function BoardHazard:init(data)
    super.init(self, data)

    local properties = data and data.properties or {}

    self.sprite = properties["sprite"] or nil
    self.rand_frame = properties["randframe"] or false
	
	if self.sprite then
		self:setSprite(self.sprite)
		if self.rand_frame then
			self.sprite:setFrame(MathUtils.randomInt(1, (self.sprite.frames and #self.sprite.frames or 1) + 1))
		end
	end
    self.solid = properties["solid"] or true
	if self.solid then
		self.solid_collider = Hitbox(self, self.collider.x + 2, self.collider.y + 2, self.collider.width - 3, self.collider.height - 3)
	end
    self.damage = properties["damage"] or 5
    self.player_only = properties["player"] or true
    self.destroy_on_hit = properties["destroy"] or false
end

function BoardHazard:onCollide(chara)
	local can_hurt = true
	if self.player_only and not chara.is_player then
		can_hurt = false
	end
    if can_hurt then
		chara:hurt(self.damage, self)
		if self.destroy_on_hit then
			self:remove()
		end
		return true
	end
end

return BoardHazard