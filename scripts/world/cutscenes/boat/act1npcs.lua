---@type table<string, fun(cutscene:WorldCutscene,...)>
local act1npcs = {
    flower1 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        cutscene:setSpeaker(flower)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act1npcs_flower1_1"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_2"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_3"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_4"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_5"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_6"), nil, flower)
            
        else
            cutscene:text(Game:locRaw("act1npcs_flower1_7"), nil, flower)
            cutscene:text(Game:locRaw("act1npcs_flower1_8"), nil, flower)
        end
    end,

    happy1 = function(cutscene, event)
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        cutscene:text(Game:locRaw("act1npcs_happy1_1"), nil, screenguy_happy)
    end,

    sad1 = function(cutscene, event)
        local screenguy_sad = cutscene:getCharacter("boatnpcs/screenguy_sad")
        cutscene:text(Game:locRaw("act1npcs_sad1_1"), nil, screenguy_sad)
    end,

    angry1 = function(cutscene, event)
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:text(Game:locRaw("act1npcs_angry1_1"), nil, screenguy_angry)
    end,

    poster1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_poster1_1"))
        cutscene:text(Game:locRaw("act1npcs_poster1_2"))
    end,

    legsCrying1 = function(cutscene, event) 
        if Plot:isBefore("boat_act1_paddle") then
            local susie = cutscene:getCharacter("susie")
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_1"), nil, legsCrying)
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "down")
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_2"), "nervous")
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_3"), "nervous_side", { auto = true })
            legsCrying:setSprite("sobbing")
            legsCrying.sprite:play(0.3, loop)
            cutscene:shakeCharacter("susie")
            susie:setSprite("shock_right")
            Assets.playSound("bump")
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_4"), nil, legsCrying)
            cutscene:wait(0.5)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_5"), "sad")
            cutscene:wait(0.5)
            susie:resetSprite()
            cutscene:shakeCharacter("susie")
            cutscene:setSpeaker("susie")
            Assets.playSound("noise")
            cutscene:look(susie, "left")
            cutscene:wait(0.2)
            cutscene:look(susie, "right")
            cutscene:wait(0.2)
            cutscene:look(susie, "down")
            cutscene:wait(0.2)
            cutscene:wait(0.5)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_6"), "stupid")
        elseif not Mod:getKeyringFlag("room104") then
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            legsCrying:resetSprite()
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_7"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_8"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_9"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_10"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_11"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_12"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_13"), nil, legsCrying)
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_14"), nil, legsCrying)
            cutscene:gotoCutscene("boatCutscenes.getKey104")
        else
            -- is entirely unreachable for some reason...
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text(Game:locRaw("act1npcs_legsCrying1_15"), nil, legsCrying)
        end
    end,

    detective1 = function(cutscene, event)
        if not Game:getFlag("paddle") then
            local detective = cutscene:getCharacter("boatnpcs/detective")
            cutscene:text(Game:locRaw("act1npcs_detective1_1"), nil, detective)
            cutscene:text(Game:locRaw("act1npcs_detective1_2"), nil, detective)
            cutscene:text(Game:locRaw("act1npcs_detective1_3"), nil, detective)
            cutscene:text(Game:locRaw("act1npcs_detective1_4"))
            cutscene:text(Game:locRaw("act1npcs_detective1_5"), nil, detective)
        else
            local detective = cutscene:getCharacter("boatnpcs/detective")
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text(Game:locRaw("act1npcs_detective1_6"), nil, detective)
            cutscene:text(Game:locRaw("act1npcs_detective1_7"), nil, detective)
            cutscene:text(Game:locRaw("act1npcs_detective1_8"), nil, legsCrying)
            legsCrying:setSprite("sobbing")
            legsCrying.sprite:play(0.3, loop)
            cutscene:text(Game:locRaw("act1npcs_detective1_9"), nil, legsCrying)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_detective1_10"), "stupid")
            
        end
    end,

    tableguy1 = function(cutscene, event)
        local tableguy = cutscene:getCharacter("boatnpcs/tableguy")
        cutscene:text(Game:locRaw("act1npcs_tableguy1_1"), nil, tableguy)
        cutscene:text(Game:locRaw("act1npcs_tableguy1_2"), nil, tableguy)
    end,

    sleepingguy1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_sleepingguy1_1"))
        cutscene:text(Game:locRaw("act1npcs_sleepingguy1_2"))
    end,
    
    security1 = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"), "no kris???")
        local susie = cutscene:getCharacter("susie")
        local security = cutscene:getCharacter("boatnpcs/security")
        if not Game:getFlag("kitchenPermission") then
            cutscene:text(Game:locRaw("act1npcs_security1_1"), nil, security)
            cutscene:text(Game:locRaw("act1npcs_security1_2"), nil, security)
            cutscene:text(Game:locRaw("act1npcs_security1_3"), nil, security)
        elseif security:getFlag("move_out_of_way") then
            cutscene:text(Game:locRaw("act1npcs_security1_4"), nil, security)
        elseif Game:getFlag("kitchenPermission") then
            cutscene:text(Game:locRaw("act1npcs_security1_5"), nil, security)
            kris:setFacing("up")
            susie:setFacing("up")
            cutscene:walkTo(kris, "krissafeguard", 0.5)
            cutscene:walkTo(susie, "susiesafeguard", 0.5)
            kris:setFacing("down")
            susie:setFacing("down")
            cutscene:slideTo(security, "securityMove", 2, nil)
            cutscene:shakeCharacter(security)
            Assets.playSound("noise")
            cutscene:wait(2)
            cutscene:shakeCharacter(security)
            Assets.playSound("noise")
            security:setFlag("move_out_of_way", true)
        end
    end,

    captain1 = function(cutscene, event)
         if event.interact_count == 1 then
            local captain = cutscene:getCharacter("boatnpcs/captain")
            cutscene:text(Game:locRaw("act1npcs_captain1_1"), nil, captain)
            cutscene:text(Game:locRaw("act1npcs_captain1_2"), nil, captain)
            cutscene:text(Game:locRaw("act1npcs_captain1_3"), nil, captain)
            Assets.playSound("item")
            Game:setFlag("kitchenPermission", true)
            cutscene:text(Game:locRaw("act1npcs_captain1_4"))
        elseif event.interact_count >= 2 then
            local captain = cutscene:getCharacter("boatnpcs/captain")
            cutscene:text(Game:locRaw("act1npcs_captain1_5"), nil, captain)
        end
    end,

    room104interact1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_room104interact1_1"))
        cutscene:text(Game:locRaw("act1npcs_room104interact1_2"))
        cutscene:text(Game:locRaw("act1npcs_room104interact1_3"))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act1npcs_room104interact1_4"), "smile")
        cutscene:text(Game:locRaw("act1npcs_room104interact1_5"), "nervous_side")
    end,

    barrel1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_barrel1_1"))
        cutscene:text(Game:locRaw("act1npcs_barrel1_2"))
    end,

    bartender1 = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text(Game:locRaw("act1npcs_bartender1_1"), nil, bartender)
        cutscene:text(Game:locRaw("act1npcs_bartender1_2"), nil, bartender)
    end,

    drinks1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_drinks1_1"))
    end,

    boxes = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_boxes_1"))
        cutscene:text(Game:locRaw("act1npcs_boxes_2"))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act1npcs_boxes_3"), "surprise")
        cutscene:text(Game:locRaw("act1npcs_boxes_4"), "surprise_smile")
        cutscene:text(Game:locRaw("act1npcs_boxes_5"), "smile")
    end,

    room104interact2 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_room104interact2_1"))
    end,

    chef1 = function(cutscene, event)
        local chef = cutscene:getCharacter("boatnpcs/chef")
        
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act1npcs_chef1_1"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_2"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_3"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_4"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_5"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_6"), nil, chef)
            cutscene:text(Game:locRaw("act1npcs_chef1_7"), nil, chef)
            Game:setFlag("gamblingGuy", true)
            Plot:set("boat_act1_chef_talk")
        else
            cutscene:text(Game:locRaw("act1npcs_chef1_8"), nil, chef)
        end
    end,

    bed = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_bed_1"))
        cutscene:text(Game:locRaw("act1npcs_bed_2"))
        cutscene:text(Game:locRaw("act1npcs_bed_3"))
    end,

    bed1 = function(cutscene, event)
        cutscene:text(Game:locRaw("act1npcs_bed1_1"))
        cutscene:text(Game:locRaw("act1npcs_bed1_2"))
        cutscene:text(Game:locRaw("act1npcs_bed1_3"))
    end,

    gambler1 = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        local susie = cutscene:getCharacter("susie")
        if not Plot:isBefore("boat_act1_end") then
            cutscene:text(Game:locRaw("act1npcs_gambler1_1"), nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_2"), "stupid")
            cutscene:text(Game:locRaw("act1npcs_gambler1_3"), "nervous_side")
            return
        end
        if not not Plot:isBefore("boat_act1_chef_talk") and Plot:isBefore("boat_act1_gambler_spoken") then
            cutscene:text(Game:locRaw("act1npcs_gambler1_4"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_5"), nil, legsDefault)
        elseif not Plot:isBefore("boat_act1_chef_talk") and Plot:isBefore("boat_act1_gambler_spoken") then
            cutscene:text(Game:locRaw("act1npcs_gambler1_6"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_7"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_8"), nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_9"), "suspicious")
            cutscene:setSpeaker(legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_10"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_11"), nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_12"), "stupid")
            cutscene:setSpeaker(legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_13"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_14"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_15"), nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_16"), "smile")
            cutscene:text(Game:locRaw("act1npcs_gambler1_17"), "surprise")
            cutscene:setSpeaker(legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_18"), nil, legsDefault)
            Game.money = Game.money + 5000
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_19"), "surprise_smile")   
            Game:setFlag("spokenTo", true)
            Plot:set("boat_act1_gambler_spoken")
        end
        if Game:getFlag("gamblingWon") then
            cutscene:text(Game:locRaw("act1npcs_gambler1_20"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_21"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_22"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_23"), nil, legsDefault)
            cutscene:text(Game:locRaw("act1npcs_gambler1_24"), nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act1npcs_gambler1_25"), "suspicious")
            cutscene:text(Game:locRaw("act1npcs_gambler1_26"), "smile")
            cutscene:text(Game:locRaw("act1npcs_gambler1_27"), "stupid")
            cutscene:text(Game:locRaw("act1npcs_gambler1_28"), "nervous_side")
            Plot:set("boat_act1_end")
        end
    end

}

return act1npcs