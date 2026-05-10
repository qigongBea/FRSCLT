local map, super = Class(Map, "sotww")

function map:onEnter()
    super.onEnter(self)

    if Game.world.player then
        Game.world.player.visible = false
    end

    -- Spawn the video playback object
    local video = Game.stage:addChild(Mod:video("sotww", function()
        --local path = "saves/" .. Mod.info.id .. "/reset.json"
        --love.filesystem.write(path, "1")
        --Kristal.loadMod(Mod.info.id)
        --Plot:set("nf_school_init")
        local path = "saves/" .. Mod.info.id .. "/chapter7.json"
        love.filesystem.write(path, "1")
        Kristal.loadMod(Mod.info.id)
    end))
    video.y = 60
    video:play()
end

return map
