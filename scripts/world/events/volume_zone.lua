local VolumeZone, super = Class(Event)

function VolumeZone:init(data)
    super.init(self, data)

    self.min_vol  = 0.1
    self.max_vol  = 1.0
    self.max_dist = 9000
end

function VolumeZone:update()
    super.update(self)

    -- destroy itself if any cutscene starts
    if Game.world.cutscene then
        self:remove()
        return
    end

    local player = Game.world.player
    local music = Game.world.music

    if not music then
        return
    end

    local dist = Utils.dist(self.x, self.y, player.x, player.y)
    local t = 1 - math.min(dist / self.max_dist, 1)

    -- easing
    t = t ^ 6

    local vol = self.min_vol + (self.max_vol - self.min_vol) * t
    music.volume = vol
end

return VolumeZone
