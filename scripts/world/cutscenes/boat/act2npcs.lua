---@type table<string, fun(cutscene:WorldCutscene,...)>
local act2npcs = {
    maidKris = function(cutscene, event)
        local maidKris = cutscene:getCharacter("boatnpcs/maidKris")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_maidKris_1"), nil, maidKris)
        else
            cutscene:text(Game:locRaw("act2npcs_maidKris_2"), nil, maidKris)
        end
    end,
    
    flower2 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        cutscene:setSpeaker(flower)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_flower2_1"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_2"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_3"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_4"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_5"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_6"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_7"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_8"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_9"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_10"), nil, flower)
        else
            cutscene:text(Game:locRaw("act2npcs_flower2_11"), nil, flower)
            cutscene:text(Game:locRaw("act2npcs_flower2_12"), nil, flower)
        end
    end,

    sad2 = function(cutscene, event)
        local screenguy_sad = cutscene:getCharacter("boatnpcs/screenguy_sad")
        cutscene:text(Game:locRaw("act2npcs_sad2_1"), nil, screenguy_sad)
        cutscene:text(Game:locRaw("act2npcs_sad2_2"), nil, screenguy_sad)
    end,

    neutral2 = function(cutscene, event)
        local screenguy_neutral = cutscene:getCharacter("boatnpcs/screenguy_neutral")
        cutscene:text(Game:locRaw("act2npcs_neutral2_1"), nil, screenguy_neutral)
        cutscene:text(Game:locRaw("act2npcs_neutral2_2"), nil, screenguy_neutral)
    end,

    angry2 = function(cutscene, event)
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:text(Game:locRaw("act2npcs_angry2_1"), nil, screenguy_angry)
        cutscene:text(Game:locRaw("act2npcs_angry2_2"), nil, screenguy_angry)
    end,

    chefRalsei = function(cutscene, event)
        local chef = cutscene:getCharacter("boatnpcs/chef")
        
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_chefRalsei_1"), nil, chef)
        else
            cutscene:text(Game:locRaw("act2npcs_chefRalsei_2"), nil, chef)
        end
    end,

    
    legsCrying2 = function(cutscene, event) 
        local susie = cutscene:getCharacter("susie")
        local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
        cutscene:text(Game:locRaw("act2npcs_legsCrying2_1"), nil, legsCrying)
        cutscene:text(Game:locRaw("act2npcs_legsCrying2_2"), nil, legsCrying)
        cutscene:text(Game:locRaw("act2npcs_legsCrying2_3"), nil, legsCrying)
    end,

    detective2 = function(cutscene, event)
        local detective = cutscene:getCharacter("boatnpcs/detective")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_detective2_1"), nil, detective)
            cutscene:text(Game:locRaw("act2npcs_detective2_2"), nil, detective)
            cutscene:text(Game:locRaw("act2npcs_detective2_3"), nil, detective)
        else
            cutscene:text(Game:locRaw("act2npcs_detective2_4"), nil, detective)
        end
    end,

    gambler2 = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        local susie = cutscene:getCharacter("susie")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_gambler2_1"), nil, legsDefault)
            cutscene:text(Game:locRaw("act2npcs_gambler2_2"), nil, legsDefault)
        else
            cutscene:text(Game:locRaw("act2npcs_gambler2_3"), nil, legsDefault)
        end
    end,

    captain2 = function(cutscene, event)
        local captain = cutscene:getCharacter("boatnpcs/captain")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_captain2_1"), nil, captain)
            cutscene:text(Game:locRaw("act2npcs_captain2_2"), nil, captain)
            cutscene:text(Game:locRaw("act2npcs_captain2_3"), nil, captain)
            cutscene:text(Game:locRaw("act2npcs_captain2_4"), nil, captain)
            cutscene:text(Game:locRaw("act2npcs_captain2_5"), nil, captain)
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("act2npcs_captain2_6"), nil, captain)
            cutscene:text(Game:locRaw("act2npcs_captain2_7"), nil, captain)
        end
    end,

    keymaster = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_keymaster_1"), nil, screenguy_happy)
            cutscene:text(Game:locRaw("act2npcs_keymaster_2"), nil, screenguy_happy)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_keymaster_3"), "nervous")
            cutscene:text(Game:locRaw("act2npcs_keymaster_4"), "nervous")
            cutscene:text(Game:locRaw("act2npcs_keymaster_5"), "stupid")
            cutscene:text(Game:locRaw("act2npcs_keymaster_6"), "suspicious")
            cutscene:setSpeaker(screenguy_happy)
            cutscene:text(Game:locRaw("act2npcs_keymaster_7"), nil, screenguy_happy)
            cutscene:setSpeaker(nil)
            cutscene:text(Game:locRaw("act2npcs_keymaster_8"), nil, screenguy_happy)
            cutscene:gotoCutscene("boatCutscenes.getKey103")
            cutscene:setSpeaker(screenguy_happy)
            cutscene:text(Game:locRaw("act2npcs_keymaster_9"), nil, screenguy_happy)
            cutscene:text(Game:locRaw("act2npcs_keymaster_10"), nil, screenguy_happy)
            cutscene:text(Game:locRaw("act2npcs_keymaster_11"), nil, screenguy_happy)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_keymaster_12"), "suspicious")
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("act2npcs_keymaster_13"), nil, screenguy_happy)
        end
    end,

    bowtie1 = function(cutscene, event)
        local bowtie = cutscene:getCharacter("boatnpcs/legsBowtie")
        cutscene:setSpeaker(bowtie)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_bowtie1_1"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_2"), nil, bowtie)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_bowtie1_3"), "suspicious")
            cutscene:text(Game:locRaw("act2npcs_bowtie1_4"), "neutral_side")
            cutscene:setSpeaker("captain")
            cutscene:text(Game:locRaw("act2npcs_bowtie1_5"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_6"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_7"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_8"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_9"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_10"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_11"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_12"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_13"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_14"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_15"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_16"), nil, bowtie)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_bowtie1_17"), "surprise")
            Game:setFlag("scientistGuy", true)
        else
            cutscene:text(Game:locRaw("act2npcs_bowtie1_18"), nil, bowtie)
            cutscene:text(Game:locRaw("act2npcs_bowtie1_19"), nil, bowtie)
            
        end
    end,

    sparkGuy1 = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("act2npcs_sparkGuy1_1"), nil, spark)
            cutscene:text(Game:locRaw("act2npcs_sparkGuy1_2"), nil, spark)
            Game:setFlag("sparkGuySpokenTo", true)
            
        elseif event.interact_count == 2 then
            cutscene:text(Game:locRaw("act2npcs_sparkGuy1_3"), nil, spark) 
        end
    end,

    scientist1 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        if not Game:getFlag("scientistGuy") and not Game:getFlag("spokenToScientist") then
            cutscene:text(Game:locRaw("act2npcs_scientist1_1"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_2"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_3"), "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_4"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_5"), "suspicious")
            cutscene:text(Game:locRaw("act2npcs_scientist1_6"), "nervous")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_7"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_8"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_9"), "annoyed")
            cutscene:text(Game:locRaw("act2npcs_scientist1_10"), "neutral")     
        elseif Game:getFlag("scientistGuy") and not Game:getFlag("spokenToScientist") then
            cutscene:text(Game:locRaw("act2npcs_scientist1_11"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_12"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_13"), "annoyed")
            cutscene:text(Game:locRaw("act2npcs_scientist1_14"), "neutral")
            cutscene:text(Game:locRaw("act2npcs_scientist1_15"), "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_16"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_17"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_18"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_19"), "smile")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_20"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_21"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_22"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_23"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_24"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_25"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_26"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_27"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_28"), nil, scientist, { auto = true })
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_29"), "annoyed")
            cutscene:shakeCharacter("susie")
            Assets.playSound("bump")
            susie:setSprite("exasperated_left")
            cutscene:text(Game:locRaw("act2npcs_scientist1_30"), "teeth")
            cutscene:text(Game:locRaw("act2npcs_scientist1_31"), "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_32"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_33"), nil, scientist)
            cutscene:setSpeaker("susie")
            susie:resetSprite()
            cutscene:text(Game:locRaw("act2npcs_scientist1_34"), "suspicious")
            cutscene:shakeCharacter("susie")
            Assets.playSound("noise")
            susie:setSprite("exasperated_right")
            cutscene:text(Game:locRaw("act2npcs_scientist1_35"), "teeth")
            susie:resetSprite()
            Assets.playSound("bump")
            cutscene:text(Game:locRaw("act2npcs_scientist1_36"), "nervous")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_37"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_38"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_39"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_40"), "smirk")
            cutscene:text(Game:locRaw("act2npcs_scientist1_41"), "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_42"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_43"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_44"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_45"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_46"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_47"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_48"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_49"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_50"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_51"), nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_52"), "teeth")
            cutscene:text(Game:locRaw("act2npcs_scientist1_53"), "teeth_b")
            cutscene:text(Game:locRaw("act2npcs_scientist1_54"), "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_55"), nil, scientist)
            cutscene:setSpeaker(nil)
            cutscene:gotoCutscene("boatCutscenes.getBoilerKey")
            Game:setFlag("spokenToScientist", true)
        end
        if not Plot:isBefore("boat_act2_scrap") then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("act2npcs_scientist1_56"), "annoyed")
            cutscene:setSpeaker(scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_57"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_58"), nil, scientist)
            cutscene:text(Game:locRaw("act2npcs_scientist1_59"), nil, scientist)
            cutscene:setSpeaker(nil)
            cutscene:gotoCutscene("boatCutscenes.getKey102")
        end
    end,

    nook = function(cutscene, event)
        cutscene:text(Game:locRaw("act2npcs_nook_1"))
    end,

    microscope = function(cutscene, event)
        cutscene:text(Game:locRaw("act2npcs_microscope_1"))
        cutscene:text(Game:locRaw("act2npcs_microscope_2"))
        cutscene:text(Game:locRaw("act2npcs_microscope_3"))
    end,

    brokenMachine = function(cutscene, event)
        cutscene:text(Game:locRaw("act2npcs_brokenMachine_1"))
        cutscene:text(Game:locRaw("act2npcs_brokenMachine_2"))
    end,

    lab = function(cutscene, event)
        cutscene:text(Game:locRaw("act2npcs_lab_1"))
        cutscene:text(Game:locRaw("act2npcs_lab_2"))
        cutscene:text(Game:locRaw("act2npcs_lab_3"))
        
    end,

    coat = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:text(Game:locRaw("act2npcs_coat_1"))
        cutscene:text(Game:locRaw("act2npcs_coat_2"))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act2npcs_coat_3"), "nervous")
        cutscene:text(Game:locRaw("act2npcs_coat_4"), "suspicious")
        cutscene:text(Game:locRaw("act2npcs_coat_5"), "surprise")
        cutscene:wait(1)
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "right")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "left")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "up")
        cutscene:text(Game:locRaw("act2npcs_coat_6"), "suspicious")
        cutscene:text(Game:locRaw("act2npcs_coat_7"), "neutral")
        Plot:set("boat_act3_coat")
    end,

    speaker = function(cutscene, event)
        Game.world.music:pause()
        Assets.playSound("intercom_on")
        cutscene:wait(2)
        cutscene:text([=[
[miniface:speaker]H-Hello,[wait:5] It's ye Captain speakin'!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]There's a bit of a storm on 
the way...
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]It's me advision to stay 
inside for the day!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]Toodles!
        ]=], some_args)
        Assets.playSound("intercom_off")
        cutscene:wait(2)
        Game.world.music:resume()
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("act2npcs_speaker_1"), "suspicious")
        cutscene:text(Game:locRaw("act2npcs_speaker_2"), "nervous")
        cutscene:text(Game:locRaw("act2npcs_speaker_3"), "smile")
        Plot:set("boat_act3_mapswitch")
        
    end,


    room102Visited = function(cutscene, event)
        Game:setFlag("room102Flag", true)
    end



    

}

return act2npcs