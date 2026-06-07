

local function jumpToImproved(character, marker, speed, time, sprite, start_sprite, land_sprite)
    character:jumpTo(marker, speed, time, sprite, start_sprite)
    local jump_startup = 5 / 30     --pulled from "Character:jumpTo"
    local jump_started = false
    Game.stage.timer:after(jump_startup, function()
        jump_started = true
        character.land_sprite = land_sprite
    end)
    -- Actually support cutscene:wait(). For some reason, it didn't before. /Some improvement./
    return function() return jump_started and not character.jumping end
end

---@type table<string, fun(cutscene:WorldCutscene, ...):...>
local boatCutscenes = {

    door105 = function(cutscene, event)
        if cutscene:gotoCutscene("boatCutscenes.suiteSceneCheck") then return end
        cutscene:mapTransition("boat/suite", "spawnInside")
        Assets.playSound("doortransition")
    end,

    suiteExit = function(cutscene, event)
        cutscene:mapTransition("boat/outerDeck")
        Assets.playSound("doortransition")
    end,

    suiteSceneCheck = function (cutscene, ...)
        local suiteScene = nil
        if Plot:isBefore("boat_act1_start") then
            suiteScene = "suiteScene1"
        elseif Plot:get() == PLOT.boat_act1_end then
            suiteScene = "suiteScene2"
        elseif Plot:get() == PLOT.boat_act3_coat then
            suiteScene = "suiteScene3"
        end
        if suiteScene then
            Assets.playSound("dooropen")
            cutscene:wait(cutscene:fadeOut())
            cutscene:loadMap("boat/suite", "spawnOutside")
            return true, cutscene:gotoCutscene("boatCutscenes", suiteScene)
        end
    end,


    suiteEnter = function(cutscene, event)
        -- Which cutscene, if any, should play when entering the suite.
        if cutscene:gotoCutscene("boatCutscenes.suiteSceneCheck") then return end
        cutscene:mapTransition("boat/suite", "spawnOutside")
        Assets.playSound("doortransition")
    end,

    masterKey = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local keyring = Game.inventory:getItemByID("keyring")
        cutscene:text(Game:locRaw("boatcutscenes_masterKey_1"))
        if keyring then
            cutscene:text(Game:locRaw("boatcutscenes_masterKey_2"))
            return
        end
        -- give key
        Game.inventory:tryGiveItem("keyring")
        Assets.playSound("item")
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_masterKey_3"))
        cutscene:text(Game:locRaw("boatcutscenes_masterKey_4"))
        Game.world.map:setFlag("roomLeaveCheck", true)
        cutscene:setSpeaker("susie")
        Game:getQuest("keyring"):complete()
    end,

    roomLeaveCheck = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        if Game.world.map:getFlag("roomLeaveCheck") then return end
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_roomLeaveCheck_1"), "nervous")
        cutscene:detachFollowers()
        cutscene:walkTo("kris", "spawnInside", 0.5)
        cutscene:walkTo("susie", "spawnInside", 0.5)
        cutscene:wait(0.5)
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,

    sit = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        if not susie.sitting then
            local old_layer = kris.layer
            local sus_x = susie.x
            local sus_y = susie.y

            cutscene:detachFollowers()
            susie:slideTo(500.00, 192, 0.5, "in-quad")
            susie:setSprite("chilling")
            kris:setLayer(5)

            Assets.playSound("bell_bounce_short")
            susie.sprite:flash()
            cutscene:wait(0.5)

            local angle = Utils.angle(sus_x, sus_y, susie.x, susie.y)

            Assets.playSound("grab")

            local sprite1 = Game.world:spawnObject(AfterImage(susie))
            local sprite2 = Game.world:spawnObject(AfterImage(susie))
            sprite1:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
            sprite2:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
            sprite1.alpha = 0.5
            sprite2.alpha = 0.5
            sprite1:fadeOutAndRemove(0.5)
            sprite2:fadeOutAndRemove(0.4)
            sprite1.physics.direction = angle
            sprite2.physics.direction = angle
            sprite1.physics.speed = 7
            sprite2.physics.speed = 8

            kris:setLayer(old_layer)

            susie.sitting = true
        else
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("boatcutscenes_sit_1"), "closed_grin")
        end
    end,

    susie_return = function(cutscene)
        local susie = cutscene:getCharacter("susie")
        if susie.sitting then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("boatcutscenes_susie_return_1"), "teeth_b")

            susie:setFacing("down")
            Assets.playSound("jump")
            jumpToImproved(susie, "susie3", 20, 1, "jump_ball", "chilling", "landed")
            cutscene:wait(0.9)
            Assets.playSound("impact")
            cutscene:wait(0.1)
            susie.sprite:play(0.2, false)
            cutscene:wait(0.5)
            susie:resetSprite()
            cutscene:look(susie, "left")
            cutscene:attachFollowers()
            cutscene:interpolateFollowers()
            cutscene:alignFollowers()

            cutscene:wait(2)

            susie.sitting = false
        end
    end,

    funny = function(cutscene, event)
        function ScreenText(str)
            local text = DialogueText("[speed:0.5]" .. str, 0, 0, 320, 120, { auto_size = true, style = "GONER" })
            text:setOriginExact(text.text_width / 2, text.text_height / 2)
            text:setScreenPos(320, 100)
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:spawnObject(text, 100)
            cutscene:wait(function()
                return not text:isTyping() and Input.pressed("confirm")
            end)
            text:remove()
        end

        if event.interact_count == 1 then
            ScreenText("The Evergroves...")
            ScreenText("...a place where anybody can be anything...")
            ScreenText("It may be getting nearer to the end of your adventure...")
        else
            ScreenText("DETERMINATION fills your SOUL.")
        end
    end,


    lockedDoor = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text(Game:locRaw("boatcutscenes_lockedDoor_1"))
        cutscene:text(Game:locRaw("boatcutscenes_lockedDoor_2"))
    end,

    chasingpirates = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_chasingpirates_1"), "stupid")
    end,

    lockedDoor1 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text(Game:locRaw("boatcutscenes_lockedDoor1_1"))
        cutscene:text(Game:locRaw("boatcutscenes_lockedDoor1_2"))
    end,

    outsideStair = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text(Game:locRaw("boatcutscenes_outsideStair_1"))
        local kris = cutscene:getCharacter("kris")
        cutscene:walkToSpeed("kris", 703, kris.y)
        
    end,
    scientistblock = function(cutscene, event)
        if Plot:isBefore("boat_act3_mapswitch") and not Plot:isBefore("boat_act2_mapswitch") then
            local scientist = cutscene:getCharacter("boatnpcs/scientist")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("boatcutscenes_scientistblock_1"), nil, scientist)
            local kris = cutscene:getCharacter("kris")
            cutscene:walkToSpeed("kris", kris.x, kris.y+20)
        end;
    end,
    getKey104 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room104", true)
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_getKey104_1"))
    end,

    getKey103 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room103", true)
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_getKey103_1"))
    end,

    getKey102 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room102", true)
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_getKey102_1"))
    end,

    getKey101 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room101", true)
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_getKey101_1"))
    end,

    getBoilerKey = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("boilerRoom", true)
        Mod:playJingle("discovery")
        cutscene:text(Game:locRaw("boatcutscenes_getBoilerKey_1"))
    end,

    door104 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room104") then
            cutscene:mapTransition("boat/room104", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door103 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room103") then
            cutscene:mapTransition("boat/room103", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door102 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room102") then
            cutscene:mapTransition("boat/room102", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door101 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room101") then
            cutscene:mapTransition("boat/room101", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
    end
end,

    doorBoilerRoom = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("boilerRoom") then
            cutscene:mapTransition("boat/boilerRoom", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    doorKitchen = function(cutscene, event)
        cutscene:mapTransition("boat/diningHall", "spawnKitchen")
        Assets.playSound("doortransition")
    end,

    goldTable = function(cutscene, event)
        cutscene:text(Game:locRaw("boatcutscenes_goldTable_1"))
        cutscene:text(Game:locRaw("boatcutscenes_goldTable_2"))
        cutscene:text(
        Game:locRaw("boatcutscenes_goldTable_3"))
    end,

    -- peak. this is peak.
    -- i know it's probably a mess but don't touch it... im proud of it......
    -- (and it's very WIP)
    ---@param cutscene WorldCutscene
    ---@param event Event.slotmachine
    gambling = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")

        cutscene:text(Game:locRaw("boatcutscenes_gambling_1"))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_gambling_2"), "surprise_smile")
        cutscene:showShop()
        local choice = cGame:locRaw("boatcutscenes_gambling_2_opt_1")chGame:locRaw("boatcutscenes_gambling_2_opt_2")Absolutely not!!!" })
        if choice == 2 then
            cutscene:hideShop()
            cutscene:text(Game:locRaw("boatcutscenes_gambling_3"), "teeth")
            cutscene:text(Game:locRaw("boatcutscenes_gambling_4"), "nervous_side")
        else
            return cutscene:gotoCutscene("boatCutscenes.gamblingMain", event)
        end
    end;
    gamblingMain = function(cutscene, event)
        if Game.money > 49 then
            Game.money = Game.money - 50
            Assets.playSound("locker")
            local rng = love.math.random(1, 25)
            event.sprite:setAnimation({ "slotSpin", 0.1, true })

            if rng <= 7 then
                cutscene:hideShop()
                Assets.playSound("slots")
                cutscene:wait(2.8)
                cutscene:wait(event:winner())
                cutscene:setSpeaker(nil)
                Assets.playSound("item")
                cutscene:text(
                Game:locRaw("boatcutscenes_gamblingMain_1"))
                cutscene:setSpeaker("susie")
                cutscene:hideShop()
                Game:setFlag("gamblingWon", true)
                cutscene:text(Game:locRaw("boatcutscenes_gamblingMain_2"), "surprise_smile",
                    { reactions = { { "You better share...", "right", "bottom", "teeth", "susie_depths" }, } })
                Game:setFlag("drinkTicket", true)
                    
            else
                cutscene:hideShop()
                Assets.playSound("slots")
                cutscene:wait(2.8)
                cutscene:wait(event:loser())
                cutscene:setSpeaker(nil)
                Assets.playSound("error")
                cutscene:text(Game:locRaw("boatcutscenes_gamblingMain_3"))
                cutscene:showShop()
                event.sprite:setSprite("slotSpinLose_11")
                cutscene:text(Game:locRaw("boatcutscenes_gamblingMain_4"))
                local choice2 = cGame:locRaw("boatcutscenes_gamblingMain_4_opt_1")chGame:locRaw("boatcutscenes_gamblingMain_4_opt_2")Absolutely not!!!" })
                if choice2 == 1 then
                    cutscene:setSpeaker("susie")
                    return cutscene:gotoCutscene("boatCutscenes.gamblingMain", event)
                else
                    cutscene:hideShop()
                    cutscene:setSpeaker("susie")
                    cutscene:text(Game:locRaw("boatcutscenes_gamblingMain_5"), "nervous")
                end
            end
        else
            cutscene:text(Game:locRaw("boatcutscenes_gamblingMain_6"), "nervous")
            cutscene:hideShop()
        end
    end,

    sparkGuy = function(cutscene, event)
        if event.interact_count == 1 then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_1"), nil, spark)
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_2"), nil, spark)
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_3"), nil, spark)
        elseif event.interact_count == 2 then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_4"), nil, spark) 
        elseif Game:getFlag("spokeToBartender", true) then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_5"), nil, spark) 
            cutscene:text(Game:locRaw("boatcutscenes_sparkGuy_6"), nil, spark) 
        end
    end,


    stairwellScene = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local detective = cutscene:getCharacter("boatnpcs/detective")
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:fadeOut(0)
        cutscene.world.fader.alpha = 1 -- Make the fadeout instant
        cutscene:wait(1)
        cutscene:detachFollowers()
        cutscene:fadeIn(1.5)
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 3, "up")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 3, "up")
        cutscene:wait(2)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_1"), nil, flower)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_2"), nil, flower)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_3"), nil, screenguy_angry)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_4"), nil, flower)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_5"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_6"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_7"), nil, detective)
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_8"), "nervous")
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_9"), "sus_nervous")
        cutscene:setSpeaker(detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_10"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_11"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_12"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_13"), nil, detective)
        Assets.playSound("item")
        Game:getPartyMember("kris"):setFlag("cool_hat", true)
        kris:resetSprite()
        cutscene:setSpeaker(nil)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_14"))
        cutscene:wait(1)
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_15"), "teeth")
        cutscene:setSpeaker(detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_16"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_17"), nil, detective)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_18"), nil, detective)
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_19"), "teeth_smile")
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_20"), "shy")
        Assets.playSound("wing")
        cutscene:look(kris, "down")
        cutscene:wait(2)
        cutscene:text(Game:locRaw("boatcutscenes_stairwellScene_21"), "teeth")
        cutscene:fadeOut(1)
        Plot:set("boat_act1_mapswitch")
        cutscene:wait(1)
        cutscene:loadMap("boat/stairwell", "spawnStairs")
        cutscene:wait(1)
        cutscene:fadeIn(1.5)
        Game:getQuest("mystery"):unlock()
    end,

    paddle = function(cutscene, event)
        Game.world.map:getEvent(98):remove()
        Assets.playSound("item")
        cutscene:text(Game:locRaw("boatcutscenes_paddle_1"))
        cutscene:text(Game:locRaw("boatcutscenes_paddle_2"))
        cutscene:text(Game:locRaw("boatcutscenes_paddle_3"))
        Plot:set("boat_act1_paddle")
    end,

    neutralScreen1 = function(cutscene, screenguy_neutral)
        cutscene:text(Game:locRaw("boatcutscenes_neutralScreen1_1"), nil, screenguy_neutral)
        cutscene:text(Game:locRaw("boatcutscenes_neutralScreen1_2"), nil, screenguy_neutral)
    end,

    maid = function(cutscene, event)
        local maid = cutscene:getCharacter("boatnpcs/maid")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("boatcutscenes_maid_1"), nil, maid)
            cutscene:text(Game:locRaw("boatcutscenes_maid_2"), nil, maid)
            cutscene:text(Game:locRaw("boatcutscenes_maid_3"), nil,
                maid)
        else
            cutscene:text(Game:locRaw("boatcutscenes_maid_4"), nil, maid)
        end
    end,


    bartender = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text(Game:locRaw("boatcutscenes_bartender_1"), nil, bartender)
        return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
    end;
    bartenderMain = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        local choice = cGame:locRaw("boatcutscenes_bartender_1_opt_1")({Game:locRaw("boatcutscenes_bartender_1_opt_2")ckGame:locRaw("boatcutscenes_bartender_1_opt_3")deGame:locRaw("boatcutscenes_bartender_1_opt_4")ol Guy", "Nothing" })
        if choice == 1 and not Game:getFlag("drinkTicket")then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_1"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_2"), nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 1 and Game:getFlag("drinkTicket") then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_3"), nil, bartender)
            Assets.playSound("item")
            Game.inventory:tryGiveItem("dualDrink")
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_4"))
        end
        if choice == 2 then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_5"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_6"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_7"), nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        end
        if choice == 3 and Plot:between("boat_act2_mapswitch", "boat_act3_mapswitch") then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_8"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_9"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_10"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_11"), nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 3 then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_12"), nil, bartender)
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_13"), nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 3 and Game:getFlag("sparkGuySpokenTo") then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_14"), nil, bartender)
            Assets.playSound("item")
            Game.inventory:tryGiveItem("dualDrink")
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_15"))
        end
        if choice == 4 then
            cutscene:text(Game:locRaw("boatcutscenes_bartenderMain_16"), nil, bartender)
            Game:setFlag("spokeToBartender", true)
        end
    end,

    suiteScene1 = function(cutscene, event)
        cutscene.world:getEvent("savepoint").visible = false
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("spawnOutside")
        cutscene:slideTo(kris, x, y, 0.1)
        local x, y = cutscene:getMarker("spawnOutsideSusie")
        cutscene:slideTo(susie, x, y, 0.1)




        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:look(susie, "down")
        cutscene:look(kris, "down")
        cutscene:fadeIn(1.5)
        Assets.playSound("doorclose")
        cutscene:wait(2)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_1"), "surprise")

        local x, y = cutscene:getMarker("susie0")
        cutscene:walkTo(susie, x, y, 2, "right")
        local x, y = cutscene:getMarker("spawnOutsideSusie")
        cutscene:walkTo(kris, x, y, 1, "down")
        cutscene:wait(3)
        cutscene:look(susie, "left")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "left")
        cutscene:look(kris, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_2"), "closed_grin")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_3"), "sincere_smile")
        cutscene:look(susie, "up")
        Game.world.music:play("suite")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_4"), "nervous")
        cutscene:wait(2)
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_5"), "neutral")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_6"), "annoyed_down")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_7"), "nervous_side")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_8"), "nervous")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_9"), "nervous")
        cutscene:wait(1)
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 1, "right")
        cutscene:wait(1.2)
        local x, y = cutscene:getMarker("susie2")
        cutscene:walkTo(susie, x, y, 1, "up")
        cutscene:wait(1.2)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_10"), "annoyed")
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_11"), "suspicious")
        cutscene:look(susie, "down")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_12"), "shy_down")
        cutscene:wait(2)
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_13"), "smirk")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_14"), "stupid")
        local x, y = cutscene:getMarker("susie3")
        cutscene:walkTo(susie, x, y, 3, "right")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(kris, x, y, 4, "right")
        cutscene:wait(1)
        local x, y = cutscene:getMarker("susie3")
        print(x)
        Game.world.camera:panTo("susie3", 4)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_15"), "neutral")
        local x, y = cutscene:getMarker("couch")
        cutscene:walkTo(susie, x, y, 1, "up")
        cutscene:wait(1)
        Assets.playSound("bump")
        susie:setSprite("chilling")
        cutscene:shakeCharacter(susie)
        cutscene:wait(1.5)
        cutscene:look(kris, "up")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_16"), "smile")
        kris:setSprite("sit")
        Assets.playSound("noise")
        cutscene:shakeCharacter(kris)
        cutscene:wait(1)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_17"), "teeth_smile")
        Game.world.music:fade(0, 3)
        cutscene:fadeOut(4)
        cutscene:wait(5)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_18"), "teeth")

        -- scream noise
        Plot:set("boat_act1_start")
        cutscene:titleCard(1, "A PECULIAR HAPPENSTANCE")
        kris:setPosition(cutscene:getMarker("kris2"))
        kris:setSprite("fell")
        cutscene.world:getEvent("savepoint").visible = true
        cutscene:fadeIn(1.5)
        cutscene:wait(2)
        Assets.playSound("scream")
        cutscene:wait(1)
        Assets.playSound("bump")
        cutscene:shakeCharacter(kris)
        kris:setSprite("sit")
        cutscene:wait(1)

        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_19"), "surprise")
        cutscene:shakeCharacter(susie)
        Assets.playSound("bump")
        Assets.playSound("noise")
        local x, y = cutscene:getMarker("susie3")
        susie:resetSprite()
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:look(susie, "down")
        cutscene:wait(0.5)

        cutscene:wait(1)
        cutscene:look(susie, "left")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "right")
        cutscene:wait(2)
        local x, y = cutscene:getMarker("susie4")
        cutscene:walkTo(susie, x, y, 1, "right")
        cutscene:wait(1.5)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene1_20"), "shy_b")
        kris:resetSprite()
        Assets.playSound("bump")
        Assets.playSound("noise")
        cutscene:shakeCharacter(kris)
        cutscene:look("kris", "left")
        cutscene:walkTo(susie, "susie5", 2, "right", true)
        cutscene:wait(1)
        cutscene:wait(cutscene:walkTo(kris, "kris3", 1))
        Assets.playSound("noise")
        cutscene:wait(0.5)
        cutscene:look(kris, "down")

        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
    end,

    suiteScene2 = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        cutscene.world:getEvent("savepoint").visible = false

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("fakeSpawn")
        cutscene:slideTo(susie, x, y, 0.1)
        local x, y = cutscene:getMarker("fakeSpawn1")
        cutscene:slideTo(kris, x, y, 0.1)

        local x, y = cutscene:getMarker("susieTalk")
        cutscene:walkTo(susie, x, y, 5, "right")
        local x, y = cutscene:getMarker("krisTalk")
        cutscene:walkTo(kris, x, y, 5, "right")


        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:fadeIn(2.5)
        Assets.playSound("doorclose")
        
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_1"), "closed_grin")
        cutscene:look(kris, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_2"), "smirk")
        cutscene:look(susie, "down")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_3"), "nervous")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_4"), "smile")
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_5"), "shy_down")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_6"), "teeth_smile")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_7"), "stupid")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_8"), "nervous")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_9"), "nervous_side")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_10"), "suspicious")
        cutscene:shakeCharacter(susie)
        Assets.playSound("bump")
        susie:setSprite("away_scratch")
        susie.sprite:play(0.3, loop)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_11"), "nervous")
        cutscene:wait(1)
        susie:resetSprite()
        cutscene:shakeCharacter(susie)
        cutscene:look(susie, "right")
        Assets.playSound("noise")
        cutscene:wait(1)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_12"), "nervous")
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_13"), "nervous_side")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_14"), "neutral")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_15"), "neutral_side")
        cutscene:look(susie, "down")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_16"), "nervous")
        cutscene:wait(2)
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_17"), "neutral_side")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene2_18"), "teeth_smile")
        cutscene:fadeOut(4)
        -- scream noise
        cutscene.world.map:setFlag("scene2_played", true)
        cutscene:titleCard(2, "THE DOMINO EFFECT")
        Plot:set("boat_act2_mapswitch")
        cutscene.world:getEvent("savepoint").visible = true
        
        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
        cutscene:fadeIn(4)

    end,

    suiteScene3 = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        cutscene.world:getEvent("savepoint").visible = false

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("fakeSpawn")
        cutscene:slideTo(susie, x, y, 0.1)
        local x, y = cutscene:getMarker("fakeSpawn1")
        cutscene:slideTo(kris, x, y, 0.1)

        local x, y = cutscene:getMarker("susieTalk")
        cutscene:walkTo(susie, x, y, 5, "right")
        local x, y = cutscene:getMarker("krisTalk")
        cutscene:walkTo(kris, x, y, 5, "right")


        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:fadeIn(2.5)
        Assets.playSound("doorclose")
        
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_1"), "nervous")
        cutscene:look(kris, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_2"), "smirk")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_3"), "neutral_side")
        cutscene:look(susie, "down")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_4"), "suspicious")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_5"), "neutral")
        cutscene:look(susie, "left")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_6"), "nervous_side")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_7"), "suspicious")
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_8"), "smirk")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_9"), "nervous")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_10"), "neutral_side")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_11"), "nervous_side")
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_12"), "nervous_side")
        cutscene:wait(2)
        cutscene:look(susie, "right")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_13"), "smile")
        cutscene:text(Game:locRaw("boatcutscenes_suiteScene3_14"), "smile")
        cutscene:fadeOut(4)
        -- scream noise
        cutscene.world.map:setFlag("scene3_played", true)
        Plot:set("boat_act3_start")
        cutscene:titleCard(3, "BOILING OVER")
        cutscene.world:getEvent("savepoint").visible = true
        
        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
        cutscene:fadeIn(4)
    end,

    funnypot = function (cutscene, event)
        local pot = cutscene.world:getEvent(3)
        if event.interact_count > 1 or not pot then
            cutscene:text(Game:locRaw("boatcutscenes_funnypot_1"))
            return
        end
        pot.physics.gravity = -1
        pot.tile = 69 -- You can't make this shit up
        pot:setFlag("dont_load", true)
    end,
}






local merge = {
    ["boat/act1npcs"] = modRequire("scripts.world.cutscenes.boat.act1npcs"),
    ["boat/act2npcs"] = modRequire("scripts.world.cutscenes.boat.act2npcs"),
    ["boat/act3npcs"] = modRequire("scripts.world.cutscenes.boat.act3npcs"),
    ["boat/opening"] = modRequire("scripts.world.cutscenes.boat.opening"),
}

local cutscene_ids = {}
for k in pairs(boatCutscenes) do
    cutscene_ids[k] = true
end

for groupname, group in pairs(merge) do
    for key, value in pairs(group) do
        if cutscene_ids[key] then
            Kristal.Console:warn("While loading boatCutscenes: Duplicate cutscene " .. key .. ", defined in " .. groupname)
        else
            cutscene_ids[key] = true
        end
    end
end

setmetatable(boatCutscenes, {
    __index = function (self, key)
        for groupname, group in pairs(merge) do
            if group[key] then
                Kristal.Console:warn(("Running \"%s.%s\" instead of \"%s.%s\"."):format(groupname, key, "boatCutscenes", key))
                return group[key]
            end
        end
    end
})


return boatCutscenes
