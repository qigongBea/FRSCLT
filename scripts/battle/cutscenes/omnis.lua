---@type table<string, fun(cutscene:BattleCutscene)>
local omnis_cutscenes = {
    deathapproaches = function(cutscene)
        Game.battle.music:pause()
        Game.battle:resetAttackers()

        local omnis = assert(Game.battle:getEnemyBattler("omnis_boss"))
        local ursula = Game.battle:getPartyBattler("ursula")
        local susie = Game.battle:getPartyBattler("susie")
        local kris = Game.battle:getPartyBattler("ursula")
        ursula:heal(math.huge)
        susie:heal(math.huge)
        kris:heal(math.huge)
        do

            cutscene:battlerText(omnis, "D-[wait:5]Damnit,[wait:5] looks like I made...")
            cutscene:battlerText(omnis, "... a m-miscalculation\nin your strength...")
            cutscene:text("* Well guess what,[wait:5] asshole?[wait:10]\n* It's over.[wait:10] So give us our friend back and-", "teeth_smile", "susie", { auto = true })
            cutscene:battlerText(omnis, "Y-You mean the final piece\nto my GALLERY...?[wait:5]\nHa... ha... ha...")

            Game.battle.music:play("gallery")
            Game.battle.music:resume()

            cutscene:battlerText(omnis, "I wouldn't give that\nup for my LIFE!")
            cutscene:text("* Then how about we take your life for real this time?", "smile", "susie")
            cutscene:text("* Omnis,[wait:5] you've taken my mansion and my kingdom...")
            cutscene:text("* ... and we're NOT letting you go this time.")
            cutscene:battlerText(omnis, "Well,[wait:5] let's see if\nyou can kill me...")
            cutscene:battlerText(omnis, "[noskip][speed:0.5][shake:1]While you're dead on\nthe floor.")
            Game.fader.alpha = 1
            Assets.playSound("noise")
            Game.battle.music:fade(0, 1)
        end

        Game.battle.battle_ui.encounter_text.skipping = true
        Game.fader.alpha = 1

        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")
        cutscene:wait(0.1)
        Assets.playSound("appear")

        cutscene:wait(0.5)

        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)
        Assets.playSound("swing")
        cutscene:wait(0.1)

        Game.fader.alpha = 0
        Game.battle.music:fade(1, 1)
        ursula:hurt(math.huge, true, nil)
        ursula.physics.friction = 0.5
        ursula.physics.speed_x = -8
        susie:hurt(math.huge, true, nil)
        susie.physics.friction = 0.5
        susie.physics.speed_x = -8
        cutscene:wait(2)
        do
            local omnis = Game.battle:getEnemyBattler("omnis_boss")
            cutscene:battlerText(omnis, "And now... it's time for these\nDepths to experience GREATNESS!")
            cutscene:battlerText(omnis, "The greatness of the DARK FOUNTAIN!")
        end
        omnis:slideTo(SCREEN_WIDTH/2, (300/2) + omnis.height)

        cutscene:wait(2)
        do
            cutscene:battlerText(omnis, "And you...[wait:5]\nyou get to\nwatch your\nbeloved world...")
            cutscene:battlerText(omnis, "[speed:0.5][noskip]Shatter into pieces!")
            Game.battle.music:fade(0, 1)
        end
        local omn_x = omnis.x
        local omn_y = omnis.y

        Game.battle.timer:tween(0.4, omnis, {scale_x = 0.5, y = omnis.y - 20}, "in-quad")
        cutscene:wait(0.1)
        Game.battle.timer:every(2/30, function() Assets.playSound("fountain_target") end, 8)
        cutscene:wait(0.1)
        local pillar = FMPillar(omn_x, omn_y, omnis)
        pillar.layer = omnis.layer - 1

        Game.battle.timer:tween(0.4, omnis, {scale_x = 2, scale_y = 0.2 , y = omnis.y + 20}, "out-elastic")

        cutscene:wait(0.1)

        pillar.timescale = 0.9
        local snd = Assets.stopAndPlaySound("fountain_make", 1, pillar.timescale)
        local tbl = {pitch = snd:getPitch()}
        pillar:setParent(Game.battle)

        cutscene:wait(0.1)

        Game.battle.timer:tween(0.5, omnis, {scale_x = 2, scale_y = 2}, "out-elastic")

        cutscene:wait(6.5)
        cutscene:wait(function() return pillar:isRemoved() end)
        local rumble = Assets.playSound("rumble")
        rumble:setLooping(true)
        Game.world.timer:every(0.3, function()
            cutscene:shakeCamera()
        end, 12)
        cutscene:wait(3)
        Assets.stopSound("rumble")
        Game.fader:fadeOut(nil, {speed = 0})
        Assets.playSound("locker")
        cutscene:wait(2)

        cutscene:after(function ()
            Game.battle:setState("VICTORY")
            local num = Game.save_id
            local base = "saves/" .. Mod.info.id
            love.filesystem.createDirectory(base)

            local reset_path = base .. "/reset.json"
            love.filesystem.write(reset_path, "1")

            Kristal.loadMod(Mod.info.id)
        end)
    end;
}

return omnis_cutscenes
