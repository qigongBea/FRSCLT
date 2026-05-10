--- SlideAreaReverse causes the party to slide UPWARD when entered.
--- `SlideAreaReverse` is an Event – naming an object `SlideAreaReverse`
--- on an objects layer creates this behavior.

---@class SlideAreaReverse : Event
local SlideAreaReverse, super = Class(Event)

function SlideAreaReverse:init(x, y, shape, properties)
    super.init(self, x, y, shape)

    properties = properties or {}
    self.lock_movement = properties["lock"] or false

    -- slide speed (pixels per frame)
    self.slide_speed = 10

    Kristal.Console:log("[SlideAreaReverse] Loaded")
end

function SlideAreaReverse:onCollide(chara)
    -- Enter from BELOW the area
    if (chara.last_y or chara.y) > self.y and chara.is_player then
        if chara.current_slide_area ~= self then
            if self:checkAgainstWall(chara) then return end
            Assets.stopAndPlaySound("noise")

            -- Do NOT use SLIDE state (it only moves down)
            chara:setState("WALK", false, self.lock_movement)
            chara.current_slide_area = self
        end
    end
end

function SlideAreaReverse:update()
    local player = Game.world.player
    if not player then return end

    local stopped = false

    Object.startCache()

    -- Move player UP while inside this slide area
    if player.current_slide_area == self then
        player.y = player.y - self.slide_speed
    end

    -- Stop when player exits ABOVE the area
    if player.y < self.y and not player:collidesWith(self.collider) then
        self.solid = true
        if player.current_slide_area == self then
            stopped = true
        end
    else
        self.solid = false
    end

    -- Stop if hitting a wall
    if not stopped and player.current_slide_area == self then
        stopped = self:checkAgainstWall(player)
    end

    Object.endCache()

    if stopped then
        player:setState("WALK")
        player.current_slide_area = nil
    end

    super.update(self)
end

function SlideAreaReverse:checkAgainstWall(chara)
    local hb = chara.collider
    if hb and hb:includes(Hitbox) then
        local extended_hitbox = Hitbox(
            chara,
            hb.x + 0.25,
            hb.y + 0.25,
            hb.width - 0.5,
            (hb.height - 0.5) * 1.5
        )

        if self.world:checkCollision(extended_hitbox) then
            return true
        end
    end
    return false
end

return SlideAreaReverse
