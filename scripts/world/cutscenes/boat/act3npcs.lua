---@type table<string, fun(cutscene:WorldCutscene, event:Script|NPC):...>
local act3npcs = {
    -- Use with `local victory = cutscene:gotoCutscene("boat/act3npcs.ponggame")` in another cutscene.
    ponggame = function (cutscene)
        local world = cutscene.world
        world.camera.keep_in_bounds = false
        world.camera:setAttached(false,false)
        local boatsprite = Sprite("objects/pongMinigame/playerHit")
        boatsprite:setScale(32)
        boatsprite:setPosition(-344,-200)
        boatsprite.origin_x = 0.5
        Game.world:spawnObject(boatsprite, WORLD_LAYERS["above_events"])
        boatsprite.alpha = 0
        local done = false
        local cam_x, cam_y = world.camera:getPosition()
        world.timer:tween(4, world.camera, {zoom_x = 1/16, zoom_y = 1/16}, "out-quad")
        world.timer:tween(4, world.camera, {x = -3780, y = 1083}, "in-quart", function ()
            done = true
            cutscene:tryResume()
        end)
        boatsprite:fadeTo(1,4)
        cutscene:wait(function () return done end)
        local layers = Utils.filter(world.map.tile_layers, function (v) return v.visible end)
        local events = Utils.filter(world.map.events, function (v) return v.visible end)
        for _, layer in ipairs(layers) do
            layer.visible = false
        end
        for _, event in ipairs(events) do
            event.visible = false
        end
        world.player.visible = false
        for _, chara in ipairs(world.followers) do
            chara.visible = false
        end
        Mod.shared_gonerbg.visible = true

        boatsprite.visible = false
        local minigame = Game.stage:addChild(PongMinigame())
        local victory = minigame:await(cutscene)
        boatsprite.visible = true
        boatsprite:fadeOutAndRemove(4)
        for _, layer in ipairs(layers) do
            layer.visible = true
        end
        for _, event in ipairs(events) do
            event.visible = true
        end
        for _, chara in ipairs(world.followers) do
            chara.visible = true
        end
        world.player.visible = true
        minigame:remove()

        done = false
        world.timer:tween(4, world.camera, {zoom_x = 1, zoom_y = 1}, "in-quad")
        world.timer:tween(4, world.camera, {x = cam_x, y = cam_y }, "out-quart", function ()
            done = true
            cutscene:tryResume()
        end)
        cutscene:wait(function () return done end)
        world.camera:setAttached(true)
        world.camera.keep_in_bounds = true
        return victory
    end,

    pongStart = function(cutscene, event)
        if Plot:isAfter("boat_end") then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_pongStart_1"))
            return
        end
        local susie = cutscene:getCharacter("susie")
        cutscene:setSpeaker("susie")
        cutscene:detachFollowers()
        cutscene:text(Game:locRaw("act3npcs_pongStart_2"), "smirk")
        cutscene:text(Game:locRaw("act3npcs_pongStart_3"), "smile")
        cutscene:text(Game:locRaw("act3npcs_pongStart_4"), "smile")
        cutscene:text(Game:locRaw("act3npcs_pongStart_5"), "teeth_b")
        local susx, susy = susie:getPosition()
        cutscene:walkTo(susie, "susie1", 1, "left")
        cutscene:wait(1)
        cutscene:walkTo(susie, "susie2", 2, "up")
        cutscene:wait(2)
        cutscene:look(susie, "left")
        cutscene:gotoCutscene("boatCutscenes.ponggame")
        Plot:set(PLOT.boat_end)
        cutscene:wait(cutscene:walkTo(susie, "susie1", 2, "down"))
        cutscene:wait(cutscene:walkTo(susie, susx, susy, 1, "right"))
        cutscene:wait(cutscene:attachFollowers())
        cutscene:gotoCutscene("boatCutscenes.pongFinish")
        
    end,


    pongFinish = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_1"), "smirk")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_2"), "stupid")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_3"), "smirk")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_4"), "nervous_side")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_5"), "sincere_smile")
        cutscene:wait(cutscene:fadeOut(1.5, { music = true }))
        Game:getPartyMember("kris"):setFlag("cool_hat", false)
        cutscene:mapTransition("boat/suite", 540, 228)
        cutscene:wait(5)
        Assets.playSound("intercom_on")
        cutscene:setSpeaker()
        cutscene:wait(2)
        cutscene:text([=[
[miniface:speaker]Hello,[wait:5] It's ye Captain speakin' again!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]For anybody who's still on
me ship,[wait:5] this is your final wake-up call!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]It's me advision to get 
off the boat,[wait:5] as we've reached 
our stop,[wait:5] The Evergroves!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]Toodles![wait:5] Hope you had a nice 
stay on the Evergroves Cruise!
        ]=], some_args)
        Assets.playSound("intercom_off")
        cutscene:wait(2)
        cutscene:wait(cutscene:fadeIn(1.5, { music = true }))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_6"), "suspicious")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_7"), "nervous")
        cutscene:text(Game:locRaw("act3npcs_pongFinish_8"), "smile")
        Game:getQuest("mystery"):complete()
    end,

    stain = function(cutscene, event)
        cutscene:text(Game:locRaw("act3npcs_stain_1"))
        cutscene:text(Game:locRaw("act3npcs_stain_2"))
        cutscene:text(Game:locRaw("act3npcs_stain_3"))
    end,


    oilLicker1 = function(cutscene, event)
        local oilLicker = cutscene:getCharacter("boatnpcs/oilLicker")
        -- oilLicker.sprite:play(0.04, loop)
    end,

    fridge = function(cutscene, event)
        if not Plot:between("boat_act3_mapswitch", "boat_end") then
            cutscene:text(Game:locRaw("act3npcs_fridge_1"))
            cutscene:text(Game:locRaw("act3npcs_fridge_2"))
        else
            cutscene:text(Game:locRaw("act3npcs_fridge_3"))
            cutscene:text(Game:locRaw("act3npcs_fridge_4"))
            Game:setFlag("foodGrabbed", true)
        end
    end,


    chatter = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:text(Game:locRaw("act3npcs_chatter_1"))
        cutscene:text(Game:locRaw("act3npcs_chatter_2"))
        cutscene:text(Game:locRaw("act3npcs_chatter_3"))
        cutscene:text(Game:locRaw("act3npcs_chatter_4"))
        cutscene:setSpeaker("susie")
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("act3npcs_chatter_5"), "surprise")
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("act3npcs_chatter_6"), "smirk")
        
    end,

    boilerHit = function(cutscene, event)
        cutscene:detachFollowers()
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 3, "up")
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 3, "up")
        cutscene:setSpeaker("susie")
        cutscene:wait(4)
        cutscene:text(Game:locRaw("act3npcs_boilerHit_1"), "nervous")
        cutscene:text(Game:locRaw("act3npcs_boilerHit_2"), "suspicious")
        cutscene:text(Game:locRaw("act3npcs_boilerHit_3"), "neutral_side")
        cutscene:text(Game:locRaw("act3npcs_boilerHit_4"), "teeth")
        cutscene:text(Game:locRaw("act3npcs_boilerHit_5"), "teeth_b")
        susie:setSprite("shock_up")
        local x, y = cutscene:getMarker("susieHit")
        cutscene:shakeCharacter("susie")
        cutscene:slideTo(susie, x, y, 0.1)
        Assets.playSound("locker")
        cutscene:wait(0.2)
        local x, y = cutscene:getMarker("susie1")
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:wait(0.2)
        susie:resetSprite()
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:wait(0.5)
        cutscene:text(Game:locRaw("act3npcs_boilerHit_6"), "surprise")
        cutscene:shakeCharacter("susie")
        susie:setSprite("shock_behind")
        Assets.playSound("wing")
        cutscene:text(Game:locRaw("act3npcs_boilerHit_7"), "suspicious")
        susie:resetSprite()
        cutscene:look(susie, "right")
        cutscene:wait(0.2)
        cutscene:look(susie, "down")
        cutscene:wait(0.2)
        cutscene:look(susie, "left")
        cutscene:wait(0.2)
        cutscene:text(Game:locRaw("act3npcs_boilerHit_8"), "smile")
        cutscene:setSpeaker(nil)
        cutscene:gotoCutscene("boatCutscenes.getKey101")
        cutscene:attachFollowers()

        
    end,

    scientist2 = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"), "no kris???")
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        if not Game:getFlag("foodGrabbed") and event.interact_count == 1 then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_1"), "teeth")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_2"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_3"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_4"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_5"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_6"), nil, scientist)
            -- susie look around
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_7"), "teeth")
            cutscene:text(Game:locRaw("act3npcs_scientist2_8"), "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_9"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_10"), "nervous")
            cutscene:text(Game:locRaw("act3npcs_scientist2_11"), "smirk")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_12"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_13"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_14"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_15"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_16"), "teeth")
            cutscene:text(Game:locRaw("act3npcs_scientist2_17"), "angry")
            cutscene:text(Game:locRaw("act3npcs_scientist2_18"), "angry")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_19"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_20"), "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_21"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_22"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_23"), nil, scientist, { reactions = { { "OH MY GOD.", "right", "bottom", "teeth", "susie_depths" }, } })
    
            cutscene:text(Game:locRaw("act3npcs_scientist2_24"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_25"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_26"), "stupid")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_27"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act3npcs_scientist2_28"), "nervous")
            cutscene:text(Game:locRaw("act3npcs_scientist2_29"), "smirk")
        elseif not Game:getFlag("foodGrabbed") then
            -- This is placeholder but it doesn't matter because funnyFeline won't interact twice here
            cutscene:text(Game:locRaw("act3npcs_scientist2_30"), nil, scientist)
        elseif not Plot:isBefore("boat_act3_scientist_foodgive") then
            return cutscene:gotoCutscene("boat/act3npcs.scientist3")
        elseif Game:getFlag("foodGrabbed") then
            cutscene:text(Game:locRaw("act3npcs_scientist2_31"), nil, scientist)
            cutscene:text(Game:locRaw("act3npcs_scientist2_32"), nil, scientist)
            cutscene:slideTo(scientist, "foodGrabbedMove", 2, nil)
            kris:setFacing("down")
            susie:setFacing("down")
            cutscene:walkTo(kris, "krissafeguard", 0.5)
            cutscene:walkTo(susie, "susiesafeguard", 0.5)
            kris:setFacing("up")
            susie:setFacing("up")
            cutscene:shakeCharacter(scientist)
            Assets.playSound("noise")
            cutscene:wait(2)
            cutscene:shakeCharacter(scientist)
            Assets.playSound("noise")
            Plot:set("boat_act3_scientist_foodgive")
        end
    end,

    bartender3 = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text(Game:locRaw("act3npcs_bartender3_1"), nil, bartender)
        cutscene:text(Game:locRaw("act3npcs_bartender3_2"), nil, bartender)
        cutscene:text(Game:locRaw("act3npcs_bartender3_3"), nil, bartender)
        cutscene:text(Game:locRaw("act3npcs_bartender3_4"), nil, bartender)
        cutscene:text(Game:locRaw("act3npcs_bartender3_5"), nil, bartender)
    end,

    
    keymaster3 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_keymaster3_1"), nil, screenguy_happy)
            cutscene:text(Game:locRaw("act3npcs_keymaster3_2"), nil, screenguy_happy)
            cutscene:text(Game:locRaw("act3npcs_keymaster3_3"), nil, screenguy_happy)
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("act3npcs_keymaster3_4"), nil, screenguy_happy)
        end
    end,

    spark3 = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_spark3_1"), nil, spark)
            cutscene:text(Game:locRaw("act3npcs_spark3_2"), nil, spark)
            cutscene:text(Game:locRaw("act3npcs_spark3_3"), nil, spark)
            
        elseif event.interact_count == 2 then
            cutscene:text(Game:locRaw("act3npcs_spark3_4"), nil, spark)
        end
    end,

    neutral3 = function(cutscene, event)
        local screenguy_neutral = cutscene:getCharacter("boatnpcs/screenguy_neutral")
        cutscene:text(Game:locRaw("act3npcs_neutral3_1"), nil, screenguy_neutral)
        cutscene:text(Game:locRaw("act3npcs_neutral3_2"), nil, screenguy_neutral)
        cutscene:text(Game:locRaw("act3npcs_neutral3_3"), nil, screenguy_neutral)
    end,

    bowtie3 = function(cutscene, event)
        local bowtie = cutscene:getCharacter("boatnpcs/legsBowtie")
        cutscene:setSpeaker(bowtie)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_bowtie3_1"), nil, bowtie)
            cutscene:text(Game:locRaw("act3npcs_bowtie3_2"), nil, bowtie)
            cutscene:text(Game:locRaw("act3npcs_bowtie3_3"), nil, bowtie)
        else
            cutscene:text(Game:locRaw("act3npcs_bowtie3_4"), nil, bowtie)
            cutscene:text(Game:locRaw("act3npcs_bowtie3_5"), nil, bowtie)
        end
    end,

    awakeguy = function(cutscene, event)
        local awakeguy = cutscene:getCharacter("boatnpcs/awakeguy")
        local susie = cutscene:getCharacter("susie")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_awakeguy_1"), nil, awakeguy)
            cutscene:text(Game:locRaw("act3npcs_awakeguy_2"), nil, awakeguy)
            cutscene:text(Game:locRaw("act3npcs_awakeguy_3"), "nervous", susie)
            cutscene:text(Game:locRaw("act3npcs_awakeguy_4"), nil, awakeguy)
            cutscene:text(Game:locRaw("act3npcs_awakeguy_5"), nil, awakeguy)
            cutscene:text(Game:locRaw("act3npcs_awakeguy_6"), "stupid", susie)
        end
    end,


    flower3 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_flower3_1"), nil, flower)
            cutscene:text(Game:locRaw("act3npcs_flower3_2"), nil, flower)
            
        else
            cutscene:text(Game:locRaw("act3npcs_flower3_3"), nil, flower)
           
        end
    end,

    detective3 = function(cutscene, event)
        local detective = cutscene:getCharacter("boatnpcs/detective")
        cutscene:text(Game:locRaw("act3npcs_detective3_1"), nil, detective)
        cutscene:text(Game:locRaw("act3npcs_detective3_2"), nil, detective)
        cutscene:text(Game:locRaw("act3npcs_detective3_3"), nil, detective)
    end,

    tableguy3 = function(cutscene, event)
        local tableguy = cutscene:getCharacter("boatnpcs/tableguy")
        cutscene:text(Game:locRaw("act3npcs_tableguy3_1"), nil, tableguy)
        cutscene:text(Game:locRaw("act3npcs_tableguy3_2"), nil, tableguy)
        cutscene:text(Game:locRaw("act3npcs_tableguy3_3"), nil, tableguy)

    end,


    legsCrying3 = function(cutscene, event) 
        local susie = cutscene:getCharacter("susie")
        local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
        cutscene:text(Game:locRaw("act3npcs_legsCrying3_1"), nil, legsCrying)
        cutscene:text(Game:locRaw("act3npcs_legsCrying3_2"), nil, legsCrying)
        cutscene:text(Game:locRaw("act3npcs_legsCrying3_3"), nil, legsCrying)
        cutscene:text(Game:locRaw("act3npcs_legsCrying3_4"), nil, legsCrying)
        cutscene:text(Game:locRaw("act3npcs_legsCrying3_5"), nil, legsCrying)
    end,


    casinoNoelle = function(cutscene, event)
        local casinoNoelle = cutscene:getCharacter("boatnpcs/casinoNoelle")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_casinoNoelle_1"), nil, casinoNoelle)
            cutscene:text(Game:locRaw("act3npcs_casinoNoelle_2"), nil, casinoNoelle)
            cutscene:text(Game:locRaw("act3npcs_casinoNoelle_3"), nil, casinoNoelle)
        else
            cutscene:text(Game:locRaw("act3npcs_casinoNoelle_4"), nil, casinoNoelle) 
        end
    end,

    securitySusie = function(cutscene, event)
        local securitySusie = cutscene:getCharacter("boatnpcs/securitySusie")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act3npcs_securitySusie_1"), nil, securitySusie)
            cutscene:text(Game:locRaw("act3npcs_securitySusie_2"), nil, securitySusie)
            cutscene:text(Game:locRaw("act3npcs_securitySusie_3"), nil, securitySusie)
            cutscene:text(Game:locRaw("act3npcs_securitySusie_4"), nil, securitySusie)
        else
            cutscene:text(Game:locRaw("act3npcs_securitySusie_5"), nil, securitySusie) 
        end
    end,

    

    scientist3 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        cutscene:text(Game:locRaw("act3npcs_scientist3_1"), nil, scientist)
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act3npcs_scientist3_2"), "nervous")
    end,

    pirates = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local pKris = cutscene:getCharacter("pirates/kris")
        local pSusie = cutscene:getCharacter("pirates/susie")
        local pRalsei = cutscene:getCharacter("pirates/ralsei")
        local pNoelle = cutscene:getCharacter("pirates/noelle")
        cutscene:detachFollowers()
        kris:setPosition(cutscene:getMarker("kris0"))
        susie:setPosition(cutscene:getMarker("susie0"))
        cutscene:wait(0.1)
        cutscene:walkTo(susie, "susie1", 3, "up")
        cutscene:walkTo(kris, "kris1", 3, "up")
        Assets.playSound("ponggame")
        cutscene:wait(6)
        pKris.sprite:pause()
        pRalsei.sprite:pause()
        local sprite = Game.world:getEvent(79)
        cutscene:wait(function()
            return sprite.frame == 1
        end)
        sprite:remove()
        Assets.playSound("hitfloor")
        cutscene:wait(4)
        pKris:resetSprite()
        pRalsei:resetSprite()
        cutscene:wait(1)
        Game.world.music:play("pirates", 1)
        cutscene:text(Game:locRaw("act3npcs_pirates_1"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_2"), "teeth", susie)
        Assets.playSound("jump")
        cutscene:jumpTo(pRalsei, "pRalsei1", 2, 0.2, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_3"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_4"), pSusie)
        cutscene:walkTo(pSusie, "pSusie0", 0.3, "down")
        cutscene:wait(0.5)
        Assets.playSound("jump")
        cutscene:jumpTo(pSusie, "pSusie1", 2, 0.6, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pSusie)
        cutscene:wait(0.5)
        cutscene:text(Game:locRaw("act3npcs_pirates_5"), pNoelle)
        cutscene:walkTo(pNoelle, "pNoelle0", 0.3, "down")
        cutscene:wait(0.6)
        Assets.playSound("jump")
        cutscene:jumpTo(pNoelle, "pNoelle1", 2, 0.6, "jump_ball", "land")
        cutscene:wait(0.6)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pNoelle)
        cutscene:wait(0.5)
        cutscene:text(Game:locRaw("act3npcs_pirates_6"), pKris)
        Assets.playSound("jump")
        cutscene:jumpTo(pKris, "pKris1", 2, 0.2, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pKris)
        cutscene:wait(0.5)
        cutscene:text(Game:locRaw("act3npcs_pirates_7"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_8"), pKris)
        cutscene:text(Game:locRaw("act3npcs_pirates_9"), "smile", susie)
        cutscene:look(pRalsei, "left")
        cutscene:wait(0.2)
        cutscene:look(pRalsei, "right")
        cutscene:text(Game:locRaw("act3npcs_pirates_10"), pRalsei)
        cutscene:look(pKris, "right")
        Assets.playSound("wing")
        cutscene:look(pNoelle, "right")
        Assets.playSound("wing")
        cutscene:text(Game:locRaw("act3npcs_pirates_11"), pKris)
        cutscene:text(Game:locRaw("act3npcs_pirates_12"), pRalsei)
        cutscene:look(pSusie, "left")
        cutscene:text(Game:locRaw("act3npcs_pirates_13"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_14"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_15"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_16"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_17"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_18"), pSusie)
        cutscene:look(pRalsei, "down")
        cutscene:text(Game:locRaw("act3npcs_pirates_19"), pRalsei)
        cutscene:look(pRalsei, "right")
        cutscene:shakeCharacter(pRalsei)
        Assets.playSound("wing")
        cutscene:look(pKris, "left")
        cutscene:shakeCharacter(pKris)
        cutscene:look(pNoelle, "left")
        cutscene:shakeCharacter(pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_20"), pRalsei)
        cutscene:look(pRalsei, "down")
        cutscene:text(Game:locRaw("act3npcs_pirates_21"), pRalsei)
        cutscene:look(pRalsei, "right")
        Assets.playSound("wing")
        cutscene:text(Game:locRaw("act3npcs_pirates_22"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_23"), pSusie)
        cutscene:text(Game:locRaw("act3npcs_pirates_24"), pSusie)
        cutscene:shakeCharacter(pRalsei)
        Assets.playSound("wing")
        cutscene:text(Game:locRaw("act3npcs_pirates_25"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_26"), pSusie)
        susie:setSprite("exasperated_right")
        Assets.playSound("bump")
        cutscene:shakeCharacter(susie)
        cutscene:look(pNoelle, "down")
        cutscene:look(pKris, "down")
        cutscene:look(pRalsei, "down")
        cutscene:look(pSusie, "down")
        Assets.playSound("wing")
        cutscene:text(Game:locRaw("act3npcs_pirates_27"), "teeth_b", susie)
        susie:resetSprite()
        cutscene:shakeCharacter(susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_28"), "smirk", susie)
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("act3npcs_pirates_29"), "smile", susie)
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("act3npcs_pirates_30"), pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_31"), pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_32"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_33"), pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_34"), pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_35"), pNoelle)
        cutscene:text(Game:locRaw("act3npcs_pirates_36"), "suspicious", susie)
        susie:setSprite("exasperated_right")
        Assets.playSound("wing")
        cutscene:shakeCharacter(susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_37"), "teeth", susie)
        susie:resetSprite()
        cutscene:text(Game:locRaw("act3npcs_pirates_38"), "teeth_b", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_39"), "teeth_b", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_40"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_41"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_42"), pRalsei)
        cutscene:look(pKris, "left")
        cutscene:look(pNoelle, "left")
        cutscene:text(Game:locRaw("act3npcs_pirates_43"), pKris)
        cutscene:text(Game:locRaw("act3npcs_pirates_44"), "closed_grin", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_45"), "teeth_smile", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_46"), pRalsei)
        cutscene:text(Game:locRaw("act3npcs_pirates_47"), pRalsei)
        cutscene:walkTo(pRalsei, "pRalsei2", 0.5, "right")
        cutscene:wait(0.2)
        
        cutscene:walkTo(pSusie, "pSusie2", 0.5, "down")
        cutscene:wait(0.3)
        cutscene:look(pRalsei, "up")
        cutscene:wait(0.5)
        cutscene:look(pSusie, "up")
        cutscene:walkTo(pRalsei, "gangOutside", 0.7, "up")
        Game.world.map:getEvent(53):shake()
        Game.world.map:getEvent(53):slideTo("pongOutside", 0.5)
        cutscene:wait(0.2)
        Game.world.map:getEvent(55):slideTo("pileOffscreen", 0.2)
        Game.world.map:getEvent(53):setLayer(0.4)
        pRalsei:setLayer(0.4)
        Game.world.map:getTileLayer("window").visible = false
        Assets.playSound("windowBreak")
        cutscene:wait(2)
        Assets.playSound("splash")
        cutscene:look(pSusie, "up")
        cutscene:look(pKris, "up")
        cutscene:look(pNoelle, "up")

        cutscene:text(Game:locRaw("act3npcs_pirates_48"), pRalsei)
        
        cutscene:walkTo(pNoelle, "gangOutside", 0.7, "up")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        pNoelle:setLayer(0.4)
        cutscene:walkTo(pKris, "gangOutside", 0.7, "up")
        cutscene:wait(0.4)
        Assets.playSound("wing")
        pKris:setLayer(0.4)
        cutscene:walkTo(pSusie, "gangOutside", 0.7, "up")
        cutscene:wait(0.4)
        Assets.playSound("wing")
        pSusie:setLayer(0.4)
        cutscene:wait(2)
        Assets.playSound("splash")
        cutscene:wait(0.4)
        Assets.playSound("splash")
        cutscene:wait(0.4)
        Assets.playSound("splash")
        Game.world.music:fade(0, 2)
        
        cutscene:wait(2)
        Game.world.music:stop()
        
        cutscene:text(Game:locRaw("act3npcs_pirates_49"), "surprise", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_50"), "teeth_b", susie)
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("act3npcs_pirates_51"), "teeth", susie)
        cutscene:text(Game:locRaw("act3npcs_pirates_52"), "teeth", susie)
        cutscene:attachFollowers()
        Game.world.music:play("creepychase", 1)
        Game:setFlag("room101_confrontation", true)
        Plot:set("boat_act3_room101_confrontation")
        Game:saveQuick()
    end,

}

return act3npcs