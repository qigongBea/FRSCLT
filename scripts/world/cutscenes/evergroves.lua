---@type table<string, fun(cutscene:WorldCutscene)>
local evergroves = {
    lift1 = function (cutscene)
        ---@type Event.eglift
        local lift = cutscene:getEvent("eglift")
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")

        cutscene:text(Game:locRaw("evergroves_lift1_1"))
        if Game:locRaw("evergroves_lift1_1_opt_1")enGame:locRaw("evergroves_lift1_1_opt_2")oicer({"Yes", "No"}) == 2 then
            return
        end

        
        cutscene:detachFollowers()
        kris:walkTo("krlift", 1)
        susie:walkTo("suslift", 1)
        cutscene:wait(2)
        local kxo, kyo = kris.x - lift.x, kris.y - lift.y

        kris:setLayer(lift.layer + 0.01)
        susie:setLayer(lift.layer + 0.01)

        local yoffset, duration = 120, 5
        lift.lift:slideTo(lift.lift.x, lift.lift.y + yoffset, duration)
        kris:slideTo(kris.x, kris.y + yoffset, duration)
        susie:slideTo(susie.x, susie.y + yoffset, duration)
        cutscene:wait(cutscene:fadeOut(duration+0.1), {music = true})

        cutscene:gotoCutscene("evergroves.lift2")
    end;

    lift2 = function (cutscene)
        cutscene:loadMap("evergroves/start", "krlift")
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        ---@type Event.eglift_2
        local lift = cutscene:getEvent("eglift_2")

        cutscene:detachFollowers()
        susie:setPosition(cutscene:getMarker("suslift"))
        Game:setFlag("got_money", false)
        cutscene:fadeIn(3)
        Game.world.music:play("mus_evergroves_lift", 0)
        Game.world.music:fade(1, 10)

        lift.lift1:slideTo(lift.lift1.x, lift.lift1.y + 860, 100)
        lift.lift2:slideTo(lift.lift2.x, lift.lift2.y + 860, 100)
        kris:slideTo(kris.x, kris.y + 860, 100)
        susie:slideTo(susie.x, susie.y + 860, 100)
        cutscene:wait(5)
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("evergroves_lift2_1"), "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_2"), "neutral_side", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_3"), "shy_down", susie, {auto=true, skip=false})
        cutscene:wait(5)
        susie:setFacing("right")
        cutscene:text(Game:locRaw("evergroves_lift2_4"), "shy_down", susie, {auto=true, skip=false})
        susie:setFacing("left")
        cutscene:text(Game:locRaw("evergroves_lift2_5"), "neutral", susie, {auto=true, skip=false})
        cutscene:wait(5)
        susie:setFacing("up")
        cutscene:text(Game:locRaw("evergroves_lift2_6"), "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_7"), "neutral", susie, {auto=true, skip=false})
        cutscene:wait(10)
        cutscene:look("susie", "right")
        cutscene:text(Game:locRaw("evergroves_lift2_8"), "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_9"), "shy_down", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_10"), "shy_down", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_11"), "annoyed_down", susie, {auto=true, skip=false})
        cutscene:look("susie", "up")
        cutscene:text(Game:locRaw("evergroves_lift2_12"), "neutral_side", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_13"), "neutral", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_14"), "neutral", susie, {auto=true, skip=false})
        cutscene:text(Game:locRaw("evergroves_lift2_15"), "annoyed_down", susie, {auto=true, skip=false})

        lift.lift1:slideTo(lift.lift1.x, 860, 5)
        lift.lift2:slideTo(lift.lift2.x, 886, 5)
        kris:slideTo(kris.x, 864, 5)
        susie:slideTo(susie.x, 864, 5)
        cutscene:wait(function ()
            return lift.lift1.y >= 860
        end)
        Game.world.music:setVolume(0)
        Assets.playSound("impact")
        cutscene:wait(3)
        cutscene:look("susie", "down")
        cutscene:look("kris", "down")
        cutscene:text(Game:locRaw("evergroves_lift2_16"), "neutral")
        cutscene:text(Game:locRaw("evergroves_lift2_17"), "shy_down")
        cutscene:wait(3)
        cutscene:text(Game:locRaw("evergroves_lift2_18"), "smile")
        cutscene:text(Game:locRaw("evergroves_lift2_19"), "sincere")
        cutscene:text(Game:locRaw("evergroves_lift2_20"), "sincere_smile")
        Game.money = Game.money + 10000
        Assets.playSound("swing")
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        cutscene:look("kris", "right")
        cutscene:look("susie", "right")
        cutscene:wait(0.05)
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        cutscene:look("kris", "right")
        cutscene:look("susie", "right")
        cutscene:wait(0.05)
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        Assets.playSound("bell")
        susie:setSprite("pose")
        kris:setSprite("pose")
        cutscene:wait(1)
        
        cutscene:look("kris", "down")
        kris:resetSprite()
        susie:resetSprite()

        kris:walkTo(kris.x, kris.y+30, 2)
        susie:walkTo(susie.x, susie.y+30, 2)

        cutscene:wait(2)

        Game.world.music:play("mus_evergroves", 0)
        Game.world.music:fade(1, 1)

        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end;

    shop = function (cutscene)
        Assets.playSound("dooropen")
        Game.world:shopTransition("sailorShop")
    end,
    leave = function (cutscene)
        Assets.playSound("dooropen")
        Game.world:mapTransition("evergroves/path1", "spawn2")
    end,
    sign1 = function(cutscene, event)
        cutscene:text(Game:locRaw("evergroves_sign1_1"))	
        cutscene:text(Game:locRaw("evergroves_sign1_2"))	
        cutscene:text(Game:locRaw("evergroves_sign1_3"))	
        cutscene:text(Game:locRaw("evergroves_sign1_4"))	
        cutscene:text(Game:locRaw("evergroves_sign1_5"))	        
    end,
    sign2 = function(cutscene, event)

        cutscene:text(Game:locRaw("evergroves_sign2_1"))	
        cutscene:text(Game:locRaw("evergroves_sign2_2"))	
        cutscene:text(Game:locRaw("evergroves_sign2_3"))	
        cutscene:text(Game:locRaw("evergroves_sign2_4"))	
        cutscene:text(Game:locRaw("evergroves_sign2_5"))
    end,
    sign3 = function(cutscene, event)
        cutscene:text(Game:locRaw("evergroves_sign3_1"))	
        cutscene:text(Game:locRaw("evergroves_sign3_2"))	
        cutscene:text(Game:locRaw("evergroves_sign3_3"))	
        cutscene:text(Game:locRaw("evergroves_sign3_4"))	
        cutscene:text(Game:locRaw("evergroves_sign3_5"))	
        cutscene:text(Game:locRaw("evergroves_sign3_6"))
        cutscene:text(Game:locRaw("evergroves_sign3_7"))
    end,
    dockStation = function(cutscene, event)
        cutscene:text(Game:locRaw("evergroves_dockStation_1"))	
        cutscene:text(Game:locRaw("evergroves_dockStation_2"))	
    end,
    dock1 = function(cutscene, event)
        cutscene:text(Game:locRaw("evergroves_dock1_1"))	
        cutscene:text(Game:locRaw("evergroves_dock1_2"))	
        cutscene:text(Game:locRaw("evergroves_dock1_3"))	
    end,
    demoend = function(cutscene, event)
        cutscene:text(Game:locRaw("evergroves_demoend_1"))	
        cutscene:text(Game:locRaw("evergroves_demoend_2"))	
    end,
}

return evergroves
