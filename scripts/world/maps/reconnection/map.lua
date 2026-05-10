local map, super = Class(Map, "sotww")

function map:onEnter()
    super.onEnter(self)

    if Game.world.player then
        Game.world.player.visible = false
    end
end

return map
