---@type table<string, fun(cutscene:WorldCutscene, ...)>
local opening = {
    


    sparkOpening = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        cutscene:setSpeaker(spark)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("opening_sparkOpening_1"), nil, spark)
            cutscene:text(Game:locRaw("opening_sparkOpening_2"), nil, spark)
            cutscene:text(Game:locRaw("opening_sparkOpening_3"), nil, spark)
            cutscene:text(Game:locRaw("opening_sparkOpening_4"), nil, spark)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            event.interact_count = 2
            cutscene:text(Game:locRaw("opening_sparkOpening_5"), nil, spark)
            cutscene:text(Game:locRaw("opening_sparkOpening_6"), nil, spark)
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("opening_sparkOpening_7"), nil, spark)
        end
    end,

    bartenderOpening = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("opening_bartenderOpening_1"), nil, bartender)
            cutscene:text(Game:locRaw("opening_bartenderOpening_2"), nil, bartender)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            cutscene:text(Game:locRaw("opening_bartenderOpening_3"), nil, bartender)
            cutscene:text(Game:locRaw("opening_bartenderOpening_4"), nil, bartender)
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("opening_bartenderOpening_5"), nil, bartender)
            cutscene:text(Game:locRaw("opening_bartenderOpening_6"), nil, bartender)
        end
    end,


    gamblerOpening = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("opening_gamblerOpening_1"), nil, legsDefault)
            cutscene:text(Game:locRaw("opening_gamblerOpening_2"), nil, legsDefault)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            cutscene:text(Game:locRaw("opening_gamblerOpening_3"), nil, legsDefault)
            cutscene:text(Game:locRaw("opening_gamblerOpening_4"), nil, legsDefault)
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("opening_gamblerOpening_5"), nil, legsDefault)
        end
    end,

    captainOpening = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local captain = cutscene:getCharacter("boatnpcs/captain")
        cutscene:setSpeaker(captain)
        if event.interact_count == 1 then
            if Plot:isBefore("boat_leadup_scrap") then 
                cutscene:text(Game:locRaw("opening_captainOpening_1"))
                cutscene:setSpeaker("susie")
                cutscene:look(susie, "up")
                cutscene:text(Game:locRaw("opening_captainOpening_2"), "annoyed")
                cutscene:setSpeaker(captain)
                cutscene:text(Game:locRaw("opening_captainOpening_3"))
                cutscene:text(Game:locRaw("opening_captainOpening_4"))
                cutscene:look(susie, "left")
                cutscene:wait(1)
                cutscene:setSpeaker("susie")
                cutscene:look(susie, "up")
                cutscene:text(Game:locRaw("opening_captainOpening_5"), "teeth")
                cutscene:text(Game:locRaw("opening_captainOpening_6"), "teeth_b")
                cutscene:setSpeaker(captain)
                cutscene:text(Game:locRaw("opening_captainOpening_7"))
                cutscene:text(Game:locRaw("opening_captainOpening_8"))
                cutscene:text(Game:locRaw("opening_captainOpening_9"))
                cutscene:text(Game:locRaw("opening_captainOpening_10"))
                cutscene:wait(2)
                cutscene:text(Game:locRaw("opening_captainOpening_11"))
                cutscene:setSpeaker("susie")
                cutscene:text(Game:locRaw("opening_captainOpening_12"), "teeth")
                cutscene:setSpeaker(captain)
                cutscene:text(Game:locRaw("opening_captainOpening_13"))
                cutscene:text(Game:locRaw("opening_captainOpening_14"))
                cutscene:text(Game:locRaw("opening_captainOpening_15"))
                cutscene:text(Game:locRaw("opening_captainOpening_16"))
                cutscene:text(Game:locRaw("opening_captainOpening_17"))
            elseif Plot:isBefore("boat_leadup_keyget") then 
                cutscene:text(Game:locRaw("opening_captainOpening_18"))
                Assets.playSound("item")
                cutscene:setSpeaker(nil)
                cutscene:text(Game:locRaw("opening_captainOpening_19"))
                SetPlot("boat_leadup_keyget")
                cutscene:setSpeaker(captain)
                cutscene:text(Game:locRaw("opening_captainOpening_20"))
                event.interact_count = 2
                cutscene:wait(Game.world:mapTransition(Game.world.map.id, Game.world.player.x, Game.world.player.y))
                Game:getQuest("cruise"):complete()
                Game:getQuest("keyring"):unlock()
            end
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count ~= 3 then
            if Plot:isBefore("boat_leadup_keyget") then 
                cutscene:text(Game:locRaw("opening_captainOpening_21"))
                Assets.playSound("item")
                cutscene:setSpeaker(nil)
                cutscene:text(Game:locRaw("opening_captainOpening_22"))
                SetPlot("boat_leadup_keyget")
                cutscene:setSpeaker(captain)
                cutscene:text(Game:locRaw("opening_captainOpening_23"))
                event.interact_count = 2
                cutscene:wait(Game.world:mapTransition(Game.world.map.id, Game.world.player.x, Game.world.player.y))
                Game:getQuest("cruise"):complete()
                Game:getQuest("keyring"):unlock()
            else
                cutscene:setSpeaker(captain)
                event.interact_count = 3
                cutscene:text(Game:locRaw("opening_captainOpening_24"))
            end
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count == 3 then
            cutscene:setSpeaker(captain)
            event.interact_count = 3
            cutscene:text(Game:locRaw("opening_captainOpening_25"))
        elseif event.interact_count == 2 then
            cutscene:text(Game:locRaw("opening_captainOpening_26"))
            event.interact_count = 1
        end
    end,
    scrapscallionEncounter = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local scrapscallion = cutscene:getCharacter("scrapscallion")
        cutscene:setSpeaker("susie")
        cutscene:detachFollowers()
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 1, "up")
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 1, "up")
        cutscene:wait(1)
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_1"), "nervous")
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_2"), "nervous_side")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "right")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "left")
        cutscene:wait(1)
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_3"), "smile")

        susie:setSprite("shock_up")
        local x, y = cutscene:getMarker("susie2")
        cutscene:shakeCharacter("susie")
        cutscene:slideTo(susie, x, y, 0.1)
        Assets.playSound("locker")
        cutscene:shakeCharacter("scrapscallion")
        cutscene:wait(0.2)
        local x, y = cutscene:getMarker("susie1")
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        susie:resetSprite()
        cutscene:wait(1)
        Assets.playSound("wing")
        susie:setSprite("away_turn")
        cutscene:shakeCharacter("susie")
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_4"), "nervous")
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_5"), "nervous_side")
        cutscene:look(susie, "up")
        susie:resetSprite()
        cutscene:wait(2)
        cutscene:wait(1)
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_6"), "nervous", { auto = true })
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.2)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.2)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("noise")
        scrapscallion:setSprite("idle")
        scrapscallion.sprite:play(0.3, loop)
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_7"), "shock_nervous")
        cutscene:text(Game:locRaw("opening_scrapscallionEncounter_8"), "teeth_b")

        cutscene:attachFollowers()
        Game.world.map:setFlag("enemyDefeated", true)
        SetPlot("boat_leadup_scrap")
        cutscene:startEncounter("scrapscallion", nil, event)
        Game.world.map:getEvent(2):remove()
    end,
}

return opening