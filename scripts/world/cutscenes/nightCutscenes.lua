---@type table<string, fun(cutscene:WorldCutscene, ...):...>
local nightCutsenes = {
    susie = function(cutscene, event)
        Game.world.fader.alpha = 1
        cutscene:fadeOut(0.5, { music = true })
        cutscene:wait(1.5)
        Assets.playSound("phone")
        cutscene:wait(1.5)
        Assets.playSound("phone")
        cutscene:wait(1.5)
        Assets.playSound("phone")
        cutscene:wait(0.3)
        Assets.playSound("item")
        cutscene:wait(1)

        local function plainText(str)
            text = DialogueText("[voice:susie]" .. str, 0, 100, 640, 480,
                { align="center" })
            text.layer = WORLD_LAYERS["top"] + 100
            text.skip_speed = true
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:addChild(text)
        
            cutscene:wait(function()
                if text:isTyping() then
                    if Input.pressed("cancel") or Input.down("menu") then
                        text.state.skipping = true
                        text.state.waiting = 0
                        text.state.progress = math.huge
                    end
                    return false
                end
                return true
            end)
        
            cutscene:wait(function()
                return Input.pressed("confirm") or Input.down("menu")
            end)
        
            text:remove()
        end             

        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_1"))
        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_2"))
        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_3"))
        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_4"))
        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_5"))
        plainText(Game:locRaw("nightcutscenes_intro_susie_phoning_6"))
        Assets.playSound("item")
        cutscene:setSpeaker("kris")
        cutscene:wait(1)

        Game.world:loadMap("hometown/torielhouse/kris_room")
        local kris = assert(cutscene:getCharacter("kris"), "no kris???")
        local susie = cutscene:getCharacter("susie")
        kris:setSprite("laying_phone")
        kris:setPosition(Game.world.map:getMarker("krisstart"))
        kris:setFacing("left")
        Game.world.music:setVolume(0)

        cutscene:fadeIn(1.5, { music = true })
        cutscene:wait(2)
        kris:setSprite("putaway")
        kris.sprite:play(0.3)
        cutscene:wait(3)
        kris:setSprite("laying")
        cutscene:wait(2)
        kris:resetSprite()
        Assets.playSound("bump")

        -- Technically a deviation from original but it was weird to be able to walk on the bed
        cutscene:wait(0.5)
        cutscene:wait(cutscene:walkTo(kris, "kriswalkbed"))
        Game.world.menu = nil
        --Kristal.callEvent("createQuest", "Meet Susie", "susiemeet", "Susie found something strange. She's waiting by QC's for you.", 0)
        Game:getQuest("meetsusie"):unlock()
    end;

    chariel = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_chariel_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_chariel_2"))
    end;

    phone = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_phone_1"))
        Assets.playSound("phone1")
        cutscene:wait(5)
        cutscene:text(Game:locRaw("nightcutscenes_check_phone_2"))
    end;

    flowers = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_vase_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_vase_2"))
    end;

    TV = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_tv_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_tv_2"))
        cutscene:text(Game:locRaw("nightcutscenes_check_tv_3"))
    end;

    picture = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_picture_frame_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_picture_frame_2"))
    end;

    curtain = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_bathroom_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_bathroom_2"))
    end;

    cracks = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_flower_shop_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_flower_shop_2"))
    end;

    susieMeeting = function(cutscene, event)
        if Plot:isBefore("night_met_susie") then
            Game.world.music:fade(0, 1)
            local susie = assert(cutscene:getCharacter("susie_lw"), "tf you mean there's no susie??? how??")
            susie:setSprite("chill")
            local kris = cutscene:getCharacter("kris")
            local x, y = cutscene:getMarker("kris1")
            cutscene:walkTo(kris, x, y, 6, "down")
            cutscene:wait(4)
            Game.world.music:play("house")
            local x, y = cutscene:getMarker("susie1")
            cutscene:shakeCharacter(susie)
            susie:setSprite("angry_down")
            cutscene:slideTo(susie, x, y, 0.1)
            cutscene:wait(0.1)
            cutscene:shakeCharacter(susie)


            cutscene:setSpeaker(susie)
            Assets.playSound("scare")
            cutscene:wait(4)
            cutscene:look(kris, "left")
            cutscene:wait(1)
            cutscene:look(kris, "up")
            cutscene:wait(2)
            susie:setSprite("unhappy_left")
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_1"), "nervous_side")
            Assets.playSound("bump")
            susie:setSprite("away_scratch")
            susie.sprite:play(0.3, loop)
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_2"), "nervous_side")
            local x, y = cutscene:getMarker("susie2")
            susie:resetSprite()
            cutscene:walkTo(susie, x, y, 2, "down")
            cutscene:wait(1)
            cutscene:look(kris, "left")
            cutscene:wait(1.3)
            cutscene:look(susie, "right")
            cutscene:wait(0.3)
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_3"), "nervous_side")
            cutscene:look(susie, "down")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_4"), "nervous_side")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_5"), "smirk")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_6"), "smirk")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_7"),
                "nervous")
            cutscene:shakeCharacter("kris")
            Assets.playSound("bump")
            cutscene:wait(0.5)
            cutscene:look(susie, "right")
            cutscene:wait(2)
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_8"), "annoyed_down")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_9"), "annoyed")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_10"), "teeth_smile")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_11"), "closed_grin", { auto = true })
            local rumble = Assets.playSound("rumble")
            rumble:setLooping(true)
            susie:setSprite("shocked")
            cutscene:shakeCamera()
            susie:alert()
            kris:alert()
            Game.world.timer:every(0.3, function()
                cutscene:shakeCamera()
            end, 12)
            cutscene:wait(3)
            susie:resetSprite()
            Assets.stopSound("rumble")
            cutscene:wait(0.3)
            cutscene:wait(0.3)
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_12"), "suspicious")
            cutscene:text(
            Game:locRaw("nightcutscenes_night_met_susie_13"), "smirk")
            cutscene:wait(2)
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_14"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_15"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_night_met_susie_16"), "smile")


            Game:addPartyMember("susie")
            susie = susie:convertToFollower()
            SetPlot("night_met_susie")
            cutscene:attachFollowers()
            Game.world.music:play("hometown")
            Game.world.music:fade(1, 1)
            Game:getQuest("meetsusie"):complete()
            Game:getQuest("getnoelle"):unlock()
        else
            local susie = assert(cutscene:getCharacter("susie_lw"), "tf you mean there's no susie??? how??")
            susie:resetSprite()
        end; 
    end;


    damnitkris = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:wait(2)
        cutscene:setSpeaker("susie")
        susie:setSprite("turn_around")
        Assets.playSound("whip_hard")
        cutscene:wait(1.5)
        cutscene:text(Game:locRaw("nightcutscenes_susie_silly_1"), "teeth")
        susie:resetSprite()
    end;

    dumpstablook = function(cutscene, event)
        if event.interact_count == 1 then
            Assets.playSound("slurp")
            cutscene:text("* ") -- add slurp noise here
            cutscene:wait(0.03)
            cutscene:text(Game:locRaw("nightcutscenes_check_dumpstablook_1"))
            cutscene:text(Game:locRaw("nightcutscenes_check_dumpstablook_2"))
        else
            Assets.playSound("slurp")
            cutscene:wait(1)
        end
    end;

    happstablook = function(cutscene, event)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("nightcutscenes_check_happstablook_1"))
            cutscene:text(Game:locRaw("nightcutscenes_check_happstablook_2"))
            cutscene:text(Game:locRaw("nightcutscenes_check_happstablook_3"))
            cutscene:text(
            Game:locRaw("nightcutscenes_check_happstablook_4"))
        elseif event.interact_count == 2 then
            cutscene:text(Game:locRaw("nightcutscenes_check_happstablook_5"))
        elseif event.interact_count > 2 then
            cutscene:text(Game:locRaw("nightcutscenes_check_happstablook_6"))
        end
    end;


    madstablook = function(cutscene, event)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_1"))
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_2"))
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_3"))
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_4"))
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_5"))
        elseif event.interact_count == 2 then
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_6"))
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_7"))
        elseif event.interact_count >= 3 then
            cutscene:text(Game:locRaw("nightcutscenes_check_madstablook_8"))
        end
    end;


    catti = function(cutscene, event)
        cutscene:setSpeaker("alphys")
        cutscene:text(Game:locRaw("nightcutscenes_check_catti_1"), "catti_up")
        cutscene:text(Game:locRaw("nightcutscenes_check_catti_2"), "catti_down")
    end;

    mkid = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_mkid_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_mkid_2"))
    end;

    tem = function(cutscene, event)
        if event.interact_count == 1 then
            cutscene:text(Game:locRaw("nightcutscenes_check_tem_1"))
        elseif event.interact_count >= 2 then
            cutscene:text(Game:locRaw("nightcutscenes_check_tem_2"))
        end
    end;

    snowy = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_snowy_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_snowy_2"))
        cutscene:text(Game:locRaw("nightcutscenes_check_snowy_3"))
        cutscene:text(Game:locRaw("nightcutscenes_check_snowy_4"))
    end;
    
    jockington = function(cutscene, event)
        cutscene:text(Game:locRaw("nightcutscenes_check_jockington_1"))
        cutscene:text(Game:locRaw("nightcutscenes_check_jockington_2"))
    end;

    blocked = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("nightcutscenes_school_blocked_1"), "shy")
        cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y+30))
    end;

    blockedalph = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        cutscene:setSpeaker("alphys")
        cutscene:text(Game:locRaw("nightcutscenes_school_blocked_alphys_1"), "nervous_angry")
        cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y+30))
    end;

    school = function(cutscene, event)
        Game:setFlag("susieGone", true)
        local interactionsAlph = Plot:get() - 5000
        if interactionsAlph == 0 then
            Music:stop()
            local kris = cutscene:getCharacter("kris")
            local susie = cutscene:getCharacter("susie_lw") or cutscene:spawnNPC("susie_lw", 0, 0)
            kris.visible = false
            susie.visible = false
            local berdly = cutscene:getCharacter("berdly") or cutscene:spawnNPC("berdly_lw", 0, 0)


            local x, y = cutscene:getMarker("kris1")
            cutscene:walkTo(kris, x, y, 1, "down")
            cutscene:look(berdly, "up")

            local alphys = cutscene:getCharacter("alphys_lw")
            cutscene:setSpeaker(alphys)
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_1"), "smile")
            local img1 = Game.world.map:getImageLayer("dooropen")
            Assets.playSound("dooropen")
            img1.visible = true
            kris.visible = true
            cutscene:look(alphys, "right")

            cutscene:wait(1)
            local x, y = cutscene:getMarker("kris2")
            cutscene:walkTo(kris, x, y, 0.5, "down")
            cutscene:wait(0.5)
            Assets.playSound("doorclose")
            img1.visible = false
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_2"), "shock")
            cutscene:text(Game:locRaw("nightcutscenes_school_3"), "smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_4"), "nervous_angry")
            cutscene:wait(0.5)
            cutscene:look(alphys, "down")
            cutscene:wait(1.5)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_5"),
                "nervous_concern")
            cutscene:text(Game:locRaw("nightcutscenes_school_6"), "blush")
            cutscene:text(Game:locRaw("nightcutscenes_school_7"), "nervous_b")
            cutscene:wait(1)
            cutscene:look(alphys, "down")
            cutscene:wait(1)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_8"), "nervous_angry")
            local x, y = cutscene:getMarker("kris3")
            cutscene:walkTo(kris, x, y, 0.5, "down")
            cutscene:wait(0.5)
            local x, y = cutscene:getMarker("kris4")
            cutscene:walkTo(kris, x, y, 3, "left")
            cutscene:wait(3)
            cutscene:look(berdly, "left")
            cutscene:look(alphys, "down")
            local x, y = cutscene:getMarker("kris5")
            cutscene:walkTo(kris, x, y, 0.5, "down")
            cutscene:wait(0.5)
            local x, y = cutscene:getMarker("kris6")
            cutscene:walkTo(kris, x, y, 1, "right")
            cutscene:wait(1)
            Game.world.music:play("school")
            cutscene:look(kris, "down")
            Plot:set("nf_school_interact1Alph")
        elseif interactionsAlph == 1 then
            local kris = assert(cutscene:getCharacter("kris"))
            local alphys = cutscene:getCharacter("alphys_lw")
            cutscene:look(alphys, "right")
            cutscene:setSpeaker(alphys)
            cutscene:text(Game:locRaw("nightcutscenes_school_9"), "nervous", "alphys")
            cutscene:text(Game:locRaw("nightcutscenes_school_10"), "nervous_b", "alphys")
            cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y+20))
        elseif interactionsAlph == 2 then
            local alphys = cutscene:getCharacter("alphys_lw")
            cutscene:setSpeaker("alphys_lw")
            cutscene:look(alphys, "right")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_11"), "smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_12"), "nervous_angry")
            cutscene:text(Game:locRaw("nightcutscenes_school_13"), "nervous_concern")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_14"), "nervous")
            Plot:set("nf_school_interact3Alph")
            event:remove()
        elseif interactionsAlph == 4 then
            --not needed due to what the next one does
        elseif interactionsAlph == 5 then
            event:remove()
            --WHERE THE SUSIE FLAG SHOULD GO GRAHHHHHHHH
            Music:stop()
            local kris = cutscene:getCharacter("kris")
            local susie = cutscene:getCharacter("susie_lw")
            local berdly = cutscene:getCharacter("berdly_lw") or cutscene:spawnNPC("berdly_lw",0,0)
            cutscene:detachFollowers()
            cutscene:look(berdly, "up")
            kris.visible = false
            susie.visible = false
            local alphys = cutscene:getCharacter("alphys_lw")
            cutscene:setSpeaker("alphys_lw")
            cutscene:look(alphys, "down")
            local x, y = cutscene:getMarker("kris1")
            cutscene:walkTo(kris, x, y, 1, "down")
            local x, y = cutscene:getMarker("kris1")
            cutscene:walkTo(susie, x, y, 1, "down")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_15"), "smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_16"), "catti_down")
            cutscene:text(Game:locRaw("nightcutscenes_school_17"), "catti_up")
            --Kris and Susie walk in
            local img1 = Game.world.map:getImageLayer("dooropen")
            Assets.playSound("dooropen")
            img1.visible = true
            kris.visible = true
            cutscene:wait(1)
            local x, y = cutscene:getMarker("kris2")
            cutscene:walkTo(kris, x, y, 1, "down")
            cutscene:wait(1)
            local x, y = cutscene:getMarker("krisstand")
            cutscene:walkTo(kris, x, y, 1, "left")
            cutscene:wait(1)
            susie.visible = true
            local x, y = cutscene:getMarker("susie1")
            cutscene:walkTo(susie, x, y, 1.5, "down")
            cutscene:wait(0.7)
            Assets.playSound("doorclose")
            img1.visible = false



            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_18"), "shock")
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_school_19"), "smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_20"), "smile")
            cutscene:wait(1)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_school_21"), "sus_nervous")
            cutscene:text(Game:locRaw("nightcutscenes_school_22"), "sus_nervous")
            cutscene:text(Game:locRaw("nightcutscenes_school_23"), "nervous_side")
            cutscene:look(susie, "down")
            cutscene:text(Game:locRaw("nightcutscenes_school_24"), "nervous")
            cutscene:setSpeaker("alphys_lw")
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.5)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_25"), "shock_smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_26"), "blush")
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_school_27"), "nervous")
            cutscene:setSpeaker("susie")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_28"), "sus_nervous")
            cutscene:look(susie, "down")
            cutscene:text(Game:locRaw("nightcutscenes_school_29"), "nervous")
            cutscene:look(alphys, "right")
            cutscene:setSpeaker("alphys_lw")
            cutscene:wait(1)
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_school_30"), "concern")
            cutscene:text(Game:locRaw("nightcutscenes_school_31"), "nervous_concern")
            cutscene:text(Game:locRaw("nightcutscenes_school_32"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_school_33"), "nervous")
            cutscene:text(Game:locRaw("nightcutscenes_school_34"), "nervous_concern")
            cutscene:setSpeaker("susie")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_school_35"), "teeth_smile")
            --alphys looks around in panic
            cutscene:setSpeaker("alphys")
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.2)
            cutscene:look(alphys, "up")
            cutscene:wait(0.2)
            cutscene:look(alphys, "down")
            cutscene:wait(0.2)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_36"), "shock_smile")
            cutscene:text(Game:locRaw("nightcutscenes_school_37"), "nervous_angry")
            cutscene:text(Game:locRaw("nightcutscenes_school_38"), "nervous_b")
            local x, y = cutscene:getMarker("alphys1")
            cutscene:walkTo(alphys, x, y, 3, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_39"), "nervous_concern")
            cutscene:look(alphys, "down")
            Assets.playSound("wing")
            cutscene:wait(1)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_school_40"), "nervous")
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_school_41"), "nervous_side")
            cutscene:setSpeaker("alphys")
            cutscene:text(Game:locRaw("nightcutscenes_school_42"), "nervous")
            cutscene:text(Game:locRaw("nightcutscenes_school_43"), "nervous_angry")
            local x, y = cutscene:getMarker("alphys2")
            cutscene:walkTo(alphys, x, y, 2, "right")
            cutscene:wait(2)
            cutscene:text(Game:locRaw("nightcutscenes_school_44"), "nervous_angry")
            cutscene:look(alphys, "down")
            cutscene:text(Game:locRaw("nightcutscenes_school_45"), "nervous_b")
            Game:addPartyMember("alphys")
            alphys = alphys:convertToFollower()
            cutscene:attachFollowers()
            Game.world.music:play("school")
            cutscene:look(kris, "down")
            --Alphys joins party
            Plot:set("nf_school_interact6Alph")
        end
    end;


    berdly = function(cutscene, event)
        if Plot:isBefore("nf_school_interact2Alph") then
            local alphys = cutscene:getCharacter("alphys_lw")
            local berdly = cutscene:getCharacter("berdly_lw")
            local susie = cutscene:getCharacter("susie_lw")
            local kris = cutscene:getCharacter("kris")
            cutscene:setSpeaker("berdly")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_1"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_2"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_3"), "LMAO")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_4"), "smirk")
            local x, y = cutscene:getMarker("alphys1")
            cutscene:walkTo(alphys, x, y, 2, "right")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_5"), "smirk")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_6"), "LMAO")
            cutscene:look(alphys, "up")
            cutscene:wait(1)
            cutscene:look(berdly, "up")
            cutscene:wait(1)
            cutscene:look(berdly, "left")
            cutscene:wait(0.5)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_7"), "neutral")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_8"), "surprised")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_9"), "worried_smile", "berdly")
            local choice = cutscene:choicer({ "Yes", "No" })
            if choice == 1 then
                cutscene:text(Game:locRaw("nightcutscenes_check_berdly_10"), "surprised")
                cutscene:text(Game:locRaw("nightcutscenes_check_berdly_11"), "LMAO")
                cutscene:look(alphys, "down")
                cutscene:text(Game:locRaw("nightcutscenes_check_berdly_12"), "smirk", { auto = true })
            else
                cutscene:text(Game:locRaw("nightcutscenes_check_berdly_13"), "angry")
                cutscene:look(alphys, "down")
                cutscene:text(Game:locRaw("nightcutscenes_check_berdly_14"), "angry", { auto = true })
            end
            cutscene:setSpeaker("alphys")
            cutscene:look(berdly, "up")
            cutscene:look(kris, "up")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_15"), "concern_lw")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_16"), "nervous")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_17"), "nervous_concern", { auto = true })
            Music:stop()
            local img1 = Game.world.map:getImageLayer("dooropen")
            Assets.playSound("dooropen")
            img1.visible = true
            susie.visible = true
            local x, y = cutscene:getMarker("susie1")
            cutscene:wait(1)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_18"), "shock_smile")
            cutscene:walkTo(susie, x, y, 1, "down")
            cutscene:setSpeaker("susie")
            cutscene:wait(1.5)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_19"), "nervous_side")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_20"), "nervous")
            cutscene:wait(1)
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_21"), "smirk")
            local x, y = cutscene:getMarker("susie2")
            cutscene:walkTo(susie, x, y, 2, "left")
            cutscene:wait(2.5)
            Assets.playSound("bump")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_22"), "teeth_smile")
            cutscene:wait(0.5)
            cutscene:setSpeaker("alphys")
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:look(alphys, "down")
            cutscene:wait(0.3)
            cutscene:look(alphys, "right")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_23"), "nervous_b")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_24"), "nervous_blush")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_25"), "nervous_concern")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_26"), "nervous")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_27"), "nervous_b")
            cutscene:wait(1)
            cutscene:wait(0.5)
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "right")
            cutscene:wait(0.5)
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_28"), "sus_nervous")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_29"), "neutral")
            cutscene:setSpeaker("alphys")
            local x, y = cutscene:getMarker("susie1")
            cutscene:walkTo(susie, x, y, 3, "right")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_30"), "nervous_concern")
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_31"), "nervous_concern")
            cutscene:wait(1)
            cutscene:look(susie, "right")
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_32"), "suspicious")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_33"), "nervous_side")
            cutscene:look(susie, "right")
            cutscene:wait(2)
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_34"), "sincere")
            cutscene:wait(1)
            local x, y = cutscene:getMarker("susie3")
            cutscene:walkTo(susie, x, y, 2, "up")
            cutscene:wait(2)
            susie.visible = false
            Assets.playSound("doorclose")
            img1.visible = false
            cutscene:wait(2)
            cutscene:setSpeaker("alphys_lw")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_35"), "nervous_concern")
            cutscene:wait(2)
            cutscene:look(alphys, "down")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_36"), "smile")
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_37"), "neutral_L")
            Game.world.music:play("school")
            cutscene:look(kris, "down")
            Plot:set("nf_school_interact2Alph")
        else
            cutscene:text(Game:locRaw("nightcutscenes_check_berdly_38"), "LMAO", "berdly")
        end;
    end;


    outside = function(cutscene, event)
        local interactionsSus = Game:getFlag("interactedSus", 0)
        if interactionsSus == 0 then
            local susie = cutscene:getCharacter("susie_lw")

            local kris = cutscene:getCharacter("kris")

            cutscene:look(kris, "down")
            cutscene:look(susie, "left")
            cutscene:setSpeaker("susie")
            cutscene:wait(2)
            cutscene:look(kris, "right")
            cutscene:text(Game:locRaw("nightcutscenes_outside_1"), "nervous_side")

            cutscene:wait(0.5)
            --Spins in a circle looking around
            cutscene:look(susie, "down")
            cutscene:wait(0.3)
            cutscene:look(susie, "up")
            cutscene:wait(0.3)
            cutscene:look(susie, "right")
            cutscene:wait(0.3)
            cutscene:look(susie, "left")
            cutscene:wait(0.3)
            --Runs to kris
            cutscene:wait(1)
            local x, y = cutscene:getMarker("susie1")
            cutscene:walkTo(susie, x, y, 0.3, "left")
            cutscene:wait(0.4)
            --Susie starts shaking kris
            cutscene:shakeCamera()
            Assets.playSound("wing")
            susie.visible = false
            kris:setSprite("shake")
            kris.sprite:play(0.08)

            cutscene:text(Game:locRaw("nightcutscenes_outside_2"), "teeth_b")
            cutscene:text(Game:locRaw("nightcutscenes_outside_3"), "teeth")
            cutscene:shakeCamera()
            --Stop shaking
            Assets.playSound("bump")
            susie.visible = true
            kris:resetSprite()
            cutscene:look(susie, "left")
            cutscene:wait(1)
            --Turn down
            cutscene:look(susie, "down")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_outside_4"), "shy_b")
            cutscene:text(Game:locRaw("nightcutscenes_outside_5"), "shy_b")
            --Looks at kris
            --Starts shaking kris
            cutscene:shakeCamera()
            Assets.playSound("wing")
            susie.visible = false
            kris:setSprite("shake")
            kris.sprite:play(0.08)

            cutscene:text(Game:locRaw("nightcutscenes_outside_6"), "teeth_b")
            cutscene:shakeCamera()
            Assets.playSound("wing")
            cutscene:text(Game:locRaw("nightcutscenes_outside_7"), "teeth_b")
            --Cutscene choicer "Yes, No"
            cutscene:wait(1)
            kris:setSprite("shake")
            kris.sprite:play(1)
            cutscene:wait(1)
            kris:setSprite("shake")
            kris.sprite:play(2)
            cutscene:wait(1)
            kris:setSprite("shake")
            kris.sprite:play(3)
            susie.visible = true
            kris:resetSprite()
            cutscene:look(susie, "left")
            susie.visible = false
            cutscene:shakeCamera()
            Assets.playSound("wing")
            kris:setSprite("shake")
            kris.sprite:play(0.08)
            cutscene:text(Game:locRaw("nightcutscenes_outside_8"), "teeth")

            local choice = cutscene:choicer({ "Yes", "I don't remember you" })
            Assets.playSound("bump")
            susie.visible = true
            kris:resetSprite()
            cutscene:look(susie, "left")
            cutscene:wait(1)
            if choice == 2 then
                cutscene:text(Game:locRaw("nightcutscenes_outside_9"), "nervous")
                cutscene:wait(1)
            end
            cutscene:text(Game:locRaw("nightcutscenes_outside_10"), "nervous")
            cutscene:wait(1.5)
            susie:setSprite("exasperated")
            cutscene:shakeCamera()
            Assets.playSound("wing")
            cutscene:text(Game:locRaw("nightcutscenes_outside_11"), "teeth_b")
            --Cutscene choicer "Yes, No"
            local choice = cutscene:choicer({ "I'm alright", "No I'm not" })
            susie:resetSprite()
            if choice == 2 then
                cutscene:text(Game:locRaw("nightcutscenes_outside_12"), "nervous")
                cutscene:wait(1)
            else
                cutscene:text(Game:locRaw("nightcutscenes_outside_13"), "nervous_side")
            end
            cutscene:text(Game:locRaw("nightcutscenes_outside_14"), "sus_nervous")
            cutscene:text(Game:locRaw("nightcutscenes_outside_15"), "suspicious")
            cutscene:wait(1.5)
            cutscene:look(susie, "up")
            cutscene:wait(1.5)
            cutscene:look(susie, "down")
            cutscene:text(Game:locRaw("nightcutscenes_outside_16"), "annoyed")
            cutscene:look(susie, "left")
            cutscene:text(Game:locRaw("nightcutscenes_outside_17"), "annoyed_down")
            cutscene:text(Game:locRaw("nightcutscenes_outside_18"), "bangs_neutral")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_outside_19"), "annoyed_down")
            cutscene:text(Game:locRaw("nightcutscenes_outside_20"), "annoyed")
            Game:addPartyMember("susie")
            susie = susie:convertToFollower()
            cutscene:attachFollowers()
            Game.world.music:play("school", 1, 0.95)
            cutscene:look(kris, "down")
            Plot:set("nf_school_interact4Alph")
        end
        Game:setFlag("interactedSus", interactionsSus + 1)
    end;

    closet = function(cutscene, event)
        local susie = cutscene:getCharacter("susie_lw")
        if not Plot:isBefore("nf_school_interact5Alph") then
            cutscene:text(Game:locRaw("nightcutscenes_closet_1"), "nervous_side", "susie")
            return
        end
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("nightcutscenes_closet_2"), "surprise_frown")
        cutscene:text(Game:locRaw("nightcutscenes_closet_3"), "suspicious")
        cutscene:text(Game:locRaw("nightcutscenes_closet_4"), "nervous_side")
    end;

    classroom1 = function(cutscene, event)
        if not Game:hasPartyMember("alphys") then
            if not Plot:isBefore("nf_school_interact5Alph") then
                cutscene:text(Game:locRaw("nightcutscenes_classroom1_1"), "nervous_side", "susie")
                return
            end
            local susie = cutscene:getCharacter("susie_lw")
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_2"), "sad")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_3"), "suspicious")
            cutscene:wait(1)
            cutscene:look(susie, "left")
            cutscene:wait(0.5)
            cutscene:look(susie, "right")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_4"), "nervous_side")
            Plot:set("nf_school_interact5Alph")
        else
            local susie = cutscene:getCharacter("susie_lw")
            local kris = cutscene:getCharacter("kris")
            local alphys = cutscene:getCharacter("alphys")
            cutscene:detachCamera()
            cutscene:detachFollowers()
            Game.world.camera.keep_in_bounds = false
            local x, y = cutscene:getMarker("focus")
            print(x)
            Game.world.camera:panTo("focus", 0.5)
            local x, y = cutscene:getMarker("kris1")
            cutscene:walkTo(kris, x, y, 0.5, "up")
            local x, y = cutscene:getMarker("susie1")
            cutscene:walkTo(susie, x, y, 0.5, "up")
            local x, y = cutscene:getMarker("alphys1")
            cutscene:walkTo(alphys, x, y, 3, "up")
            cutscene:setSpeaker("alphys")
            cutscene:wait(2.5)
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_5"), "concern")
            Assets.playSound("wing")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_6"), "nervous")
            cutscene:wait(2)
            Assets.playSound("bump")
            cutscene:wait(1)
            cutscene:look(alphys, "down")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_7"), "nervous_b")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_8"), "neutral")
            cutscene:look(alphys, "up")
            cutscene:wait(0.5)
            Assets.playSound("bump")
            cutscene:shakeCharacter(alphys)
            cutscene:wait(2)

            cutscene:text(Game:locRaw("nightcutscenes_classroom1_9"), "nervous_concern", { auto = true })
            local obj = Game.world.map:getEvent(42)
            Assets.playSound("locker")
            obj.visible = true

            local obj2 = Game.world.map:getTileLayer("tile2")
            obj2.visible = true
            local obj3 = Game.world.map:getTileLayer("tile3")
            obj3.visible = true
            local obj6 = Game.world.map:getTileLayer("wall2")
            obj6.visible = true
            Game.world.music:play("door 2", 1.5, 1.0)
            cutscene:shakeCamera()
            cutscene:wait(2)
            local x, y = cutscene:getMarker("susie2")
            cutscene:walkTo(susie, x, y, 1, "up", true)
            local x, y = cutscene:getMarker("alphys2")
            cutscene:walkTo(alphys, x, y, 1, "up", true)
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_10"), "nervous_b")
            cutscene:look(susie, "left")
            cutscene:look(kris, "right")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_11"), "nervous_concern",
                { reactions = { { "Another \nDark World??", "right", "bottom", "nervous_side", "susie" }, } })
            cutscene:wait(1)
            cutscene:look(alphys, "down")
            cutscene:wait(0.5)
            cutscene:look(susie, "up")
            cutscene:look(kris, "up")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_12"), "nervous_b")

            local x, y = cutscene:getMarker("alphys3")
            cutscene:walkTo(alphys, x, y, 2, "up")
            local x, y = cutscene:getMarker("focus")
            print(x)
            Game.world.camera:panTo("focus1", 2.5)
            cutscene:wait(1.3)
            local obj4 = Game.world.map:getTileLayer("shadow")
            obj4.visible = true
            local obj5 = Game.world.map:getTileLayer("wall")
            obj5.visible = false
            local darken_fx = obj6:addFX(RecolorFX(), "darken")
            Game.world.timer:tween(2, darken_fx, { color = { 0, 0, 0, 1 } })
            local darken_fx = obj:addFX(RecolorFX(), "darken")
            Game.world.timer:tween(2, darken_fx, { color = { 0, 0, 0, 1 } })
            local darken_fx = obj3:addFX(RecolorFX(), "darken")
            Game.world.timer:tween(2, darken_fx, { color = { 0, 0, 0, 1 } })
            local obj7 = Game.world.map:getTileLayer("plaster")
            obj7.visible = false
            cutscene:wait(2.5)

            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:look(alphys, "down")
            cutscene:wait(0.3)
            cutscene:look(alphys, "right")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_13"), "shock_smile")
            cutscene:look(alphys, "up")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_14"), "concern")
            local x, y = cutscene:getMarker("alphys4")
            cutscene:walkTo(alphys, x, y, 1, "up", true)
            cutscene:look(susie, "left")
            cutscene:look(kris, "right")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_15"), "nervous_concern")
            cutscene:look(alphys, "down")
            cutscene:look(susie, "up")
            cutscene:look(kris, "up")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_16"), "nervous")
            cutscene:wait(1)
            local obj8 = Game.world.map:getTileLayer("tile2")
            local darken_fx = obj8:addFX(RecolorFX(), "darken")
            Game.world.timer:tween(2, darken_fx, { color = { 0, 0, 0, 1 } })
            local obj9 = Game.world.map:getEvent(21)
            local darken_fx = obj9:addFX(RecolorFX(), "darken")
            Game.world.timer:tween(2, darken_fx, { color = { 0, 0, 0, 1 } })
            local x, y = cutscene:getMarker("alphys5")
            cutscene:walkTo(alphys, x, y, 3, "left")
            Game.world.camera:panTo("focus2", 4)
            cutscene:wait(2)
            cutscene:setSpeaker("susie")
            local x, y = cutscene:getMarker("kris2")
            cutscene:walkTo(kris, x, y, 1, "up", true)
            cutscene:wait(1)
            cutscene:look(susie, "left")
            cutscene:look(kris, "right")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_17"), "surprise_frown")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_18"), "suspicious")
            cutscene:look(alphys, "right")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:setSpeaker("alphys")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_19"), "nervous_b")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_20"), "neutral_L")
            local x, y = cutscene:getMarker("alphys6")
            cutscene:walkTo(alphys, x, y, 3, "left")
            Game.world.camera:panTo("focus3", 4)
            cutscene:wait(3)
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "up")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_21"), "smirk")
            cutscene:look(kris, "up")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_22"), "nervous_side")
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:look(alphys, "down")
            cutscene:wait(0.3)
            cutscene:look(alphys, "right")
            cutscene:wait(1)
            cutscene:setSpeaker("alphys")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_23"), "nervous")
            cutscene:look(alphys, "left")
            cutscene:wait(1)
            cutscene:look(alphys, "right")
            cutscene:wait(1)
            cutscene:look(alphys, "down")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_24"), "nervous_concern")
            cutscene:wait(1)
            local x, y = cutscene:getMarker("alphys7")
            cutscene:walkTo(alphys, x, y, 7, "right")
            Game.world.camera:panTo("focus4", 8)
            cutscene:wait(4)
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_25"), "teeth")
            cutscene:wait(2.5)
            cutscene:look(alphys, "left")
            cutscene:wait(1)
            cutscene:setSpeaker("alphys")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_26"), "nervous_b",
                { reactions = { { "LITERALLY RIGHT\nHERE!!", "right", "bottom", "teeth_b", "susie" }, } })
            cutscene:setSpeaker("susie")
            cutscene:look(alphys, "left")
            cutscene:wait(1)
            cutscene:look(alphys, "down")
            cutscene:setSpeaker("alphys")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_27"), "nervous_angry")
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:look(alphys, "down")
            cutscene:wait(0.3)
            cutscene:look(alphys, "right")
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_28"), "nervous_angry", { auto = true })
            cutscene:shakeCamera()
            alphys:alert()
            alphys:setSprite("shock")
            local rumble = Assets.playSound("rumble")
            Music:stop()
            rumble:setLooping(true)
            cutscene:wait(1)
            alphys:resetSprite()
            local x, y = cutscene:getMarker("alphys8")
            cutscene:walkTo(alphys, x, y, 2, "down", true)
            cutscene:wait(3)
            Assets.playSound("locker")
            cutscene:shakeCamera()
            cutscene:wait(1)
            Assets.stopSound("rumble")
            alphys:setSprite("fall")
            alphys.sprite:play(0.05, loop)
            cutscene:shakeCamera()
            local x, y = cutscene:getMarker("alphys9")
            cutscene:slideTo(alphys, x, y, 1)
            cutscene:wait(2)
            Game.world.camera:panTo("focus1", 0.2)
            cutscene:wait(0.2)
            cutscene:setSpeaker("susie")
            obj4.visible = false
            cutscene:text(Game:locRaw("nightcutscenes_classroom1_29"), "teeth_b")
            cutscene:shakeCamera()

            cutscene:gotoCutscene("createTransitionCutscene.outskirts", {
                characters = {kris, susie}
            })
            Game.world.camera.keep_in_bounds = true
            cutscene:attachCamera()
        end
    end;

    alphyswarn = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        cutscene:setSpeaker("alphys")
        cutscene:text(Game:locRaw("nightcutscenes_alphyswarn_1"), "nervous_angry")
        cutscene:wait(cutscene:walkTo(kris, kris.x-20, kris.y))
    end;

    alphyswarnb = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        cutscene:setSpeaker("alphys")
        cutscene:text(Game:locRaw("nightcutscenes_alphyswarnb_1"), "nervous_angry")
        cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y-20))
    end;

    susiewarn = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        if Plot:isBefore("nf_school_interact5Alph") then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_susiewarn_1"), "shy")
            cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y-20))
        else
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_susiewarn_2"), "shy_b")
            cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y-20))
        end
    end;
    susiewarnb = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"))
        if Plot:isBefore("nf_school_interact5Alph") then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_susiewarnb_1"), "shy")
            cutscene:wait(cutscene:walkTo(kris, kris.x-20, kris.y))
        else
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_susiewarnb_2"), "shy_b")
            cutscene:wait(cutscene:walkTo(kris, kris.x-20, kris.y))
        end
    end;
    awakening = function(cutscene, event)
        if Plot:isBefore("nf_awakened") then
            local alphys = cutscene:getCharacter("alphys")
            local kris = cutscene:getCharacter("kris")
            local susie = cutscene:getCharacter("susie")
            cutscene:fadeOut(0)
            cutscene:detachFollowers()
            local x, y = cutscene:getMarker("alphys10")
            cutscene:slideTo(alphys, x, y, 2)

            local x, y = cutscene:getMarker("kris10")
            cutscene:slideTo(kris, x, y, 2)

            local x, y = cutscene:getMarker("susie10")
            cutscene:slideTo(susie, x, y, 2)

            Assets.playSound("fallen")
            Game.fader:fadeIn(0)
            susie:setSprite("down")
            alphys:setSprite("fallen")
            kris:setSprite("landed")
            cutscene:wait(1)
            cutscene:setSpeaker("alphys")
            cutscene:shakeCharacter("alphys")
            Assets.playSound("bump")
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_awakening_1"), "concern_dark")
            cutscene:wait(1)
            alphys:resetSprite()
            Assets.playSound("noise")
            cutscene:shakeCamera()
            cutscene:wait(1)
            cutscene:look(alphys, "left")
            cutscene:wait(0.3)
            cutscene:look(alphys, "up")
            cutscene:wait(0.3)
            cutscene:look(alphys, "down")
            cutscene:wait(0.3)
            cutscene:look(alphys, "right")
            cutscene:fadeOut(0)
            Assets.playSound("locker")
            cutscene:wait(1)
            local wait, box = cutscene:text(Game:locRaw("nightcutscenes_awakening_2"), {auto = true, wait = false})
            box.box.visible = false
            box.text.alpha = 0
            box.text:fadeTo(1,1)
            cutscene:wait(3)
            box.text:fadeTo(0,1)
            cutscene:wait(wait)
            cutscene:wait(2)
            Plot:set("nf_awakened")
            local path = "saves/" .. Mod.info.id .. "/chapter7.json"
            love.filesystem.write(path, "1")
            Kristal.loadMod(Mod.info.id)
        end
    end;

    test = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        cutscene:text(Game:locRaw("nightcutscenes_test_1"))
        Assets.stopSound("house")
        Assets.playSound("phone")
        cutscene:wait(2)
        cutscene:text(Game:locRaw("nightcutscenes_test_2"))
        cutscene:look(kris, "down")
        cutscene:wait(0.5)
        cutscene:look(kris, "left")
        cutscene:wait(0.5)
        cutscene:look(kris, "up")
        cutscene:wait(0.5)
        cutscene:look(kris, "right")
        cutscene:wait(0.5)
        cutscene:look(kris, "down")
    end;
    ---@param cutscene WorldCutscene
    gate = function(cutscene)
        if not Plot:isBefore("holidayhouse_enter") then
            cutscene:text(Game:locRaw("nightcutscenes_gate_1"))
            return
        end
        if Plot:isBefore("night_met_susie") then
            cutscene:text(Game:locRaw("nightcutscenes_gate_2"))
            return
        end
        if Game:getFlag("silly_mode") then
            return cutscene:gotoCutscene("nightCutscenes.gateSilly")
        end
        Plot:set("holidayhouse_enter")
        local kris = assert(cutscene:getCharacter("kris"))
        local susie = cutscene:getCharacter("susie")
        local noelle = cutscene:getCharacter("noelle")
        Game:addPartyMember("noelle")
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("nightcutscenes_gate_3"), "neutral")
        cutscene:text(Game:locRaw("nightcutscenes_gate_4"), "neutral")
        if cutscene:choicer({ Game:locRaw("nightcutscenes_gate_choice_1"), Game:locRaw("nightcutscenes_gate_choice_2") }) == 1 then
            cutscene:text(Game:locRaw("nightcutscenes_gate_5"), "smile")
            cutscene:detachFollowers()
            cutscene:detachCamera()
            kris:walkTo(susie.x - 20, susie.y, 0.5, "left")
            susie:walkTo(kris.x, kris.y, 0.5, "left")
            cutscene:wait(1)
            kris:walkTo(susie.x + 20, susie.y, 0.5)
            cutscene:wait(0.5)
            kris:slideTo(susie.x, susie.y - 80, 0.5)
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_gate_6"), "sincere_smile")
        else
            cutscene:text(Game:locRaw("nightcutscenes_gate_7"), "surprise_smile")
            cutscene:text(Game:locRaw("nightcutscenes_gate_8"), "stupid")
            cutscene:text(Game:locRaw("nightcutscenes_gate_9"), "smile")
            cutscene:detachFollowers()
            cutscene:detachCamera()
            kris:walkTo(susie.x - 20, susie.y, 0.5, "left")
            susie:walkTo(kris.x, kris.y, 0.5, "left")
            cutscene:wait(1)
            kris:walkTo(susie.x + 20, susie.y, 0.5)
            cutscene:wait(0.5)
            kris:slideTo(susie.x, susie.y - 80, 0.5)
            cutscene:wait(1)
            cutscene:text(Game:locRaw("nightcutscenes_gate_10"), "sincere_smile")
        end
        cutscene:setSpeaker()
        cutscene:wait(cutscene:fadeOut(1.5, { music = true }))
        cutscene:setSpeaker()
        cutscene:text(Game:locRaw("nightcutscenes_gate_11"))
        cutscene:setSpeaker(noelle)
        cutscene:text(Game:locRaw("nightcutscenes_gate_12"), "happy", "noelle")
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("nightcutscenes_gate_13"))
        cutscene:setSpeaker(noelle)
        cutscene:text(Game:locRaw("nightcutscenes_gate_14"), "happy", "noelle")
        cutscene:mapTransition("noelles house/living room/livingroom", 300, 465)
        Game.world.music:play("noellehouse")
        cutscene:fadeIn(1.5, { music = true })
    end;

    susieApartment = function (cutscene)
        if not Plot:isBefore("apartment_exit") then
            cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_1"))
            return
        elseif Plot:isBefore("holidayhouse_enter") then
            cutscene:setSpeaker("susie")
            cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_2"), "sad")
            return
        end
        -- All placeholder. Eventually, there will be a whole scene that plays. Hopefully. Mason note: no thanks.
        Plot:set("apartment_exit")
        local kris = assert(cutscene:getCharacter("kris"))
        local susie = cutscene:getCharacter("susie") or kris
        local noelle = cutscene:getCharacter("noelle") or susie
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_3"), "neutral")
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_4"), "annoyed")
        local rumble = Assets.playSound("rumble")
        rumble:setLooping(true)
        susie:setSprite("shocked")
        cutscene:shakeCamera()
        susie:alert()
        kris:alert()
        noelle:alert()
        Game.world.timer:every(0.3, function()
            cutscene:shakeCamera()
        end, 12)
        cutscene:wait(3)
        susie:resetSprite()
        Assets.stopSound("rumble")
        cutscene:wait(0.3)
        cutscene:wait(0.3)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_5"), "suspicious")
        cutscene:wait(cutscene:fadeOut())
        cutscene:wait(1)
        cutscene:setSpeaker(noelle)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_6"))
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_7"))
        cutscene:setSpeaker(noelle)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_8"))
        cutscene:wait(1)
        Assets.playSound("wing")
        cutscene:wait(1)
        Assets.playSound("wing")
        cutscene:wait(1)
        Assets.playSound("wing")
        cutscene:wait(1)
        Assets.playSound("wing")
        cutscene:wait(1)
        Assets.playSound("wing")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:wait(2)
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_9"))
        cutscene:wait(cutscene:fadeIn())
        cutscene:text(Game:locRaw("nightcutscenes_susie_apartment_10"), "sad")
        Game:getQuest("supplies"):complete()
        Game:getQuest("shelter"):unlock()
    end;

    noShelterYet = function (cutscene)
        if not Plot:isBefore("apartment_exit") then return end
        local kris = assert(cutscene:getCharacter("kris"))
        local susie = cutscene:getCharacter("susie")
        local noelle = cutscene:getCharacter("noelle")
        cutscene:text(Game:locRaw("nightcutscenes_no_shelter_yet_1"), "neutral_side")

        if Plot:isBefore("holidayhouse_enter") then
            cutscene:text("* But you couldn't find Noelle.", "nervous")
        else
            cutscene:text(Game:locRaw("nightcutscenes_no_shelter_yet_4"), "nervous")
        end
        cutscene:text(Game:locRaw("nightcutscenes_no_shelter_yet_5"))
        cutscene:wait(cutscene:walkTo(kris, kris.x, kris.y-20))
    end;

    ---@param cutscene WorldCutscene
    gateSilly = function(cutscene)
        local kris = assert(cutscene:getCharacter("kris"), "where kris???")
        local susie = assert(cutscene:getCharacter("susie"), "where susie???")
        cutscene:setSpeaker(susie)
        susie:setSprite("turn_around")
        Assets.playSound("whip_crack_only")
        cutscene:text(Game:locRaw("nightcutscenes_gate_silly_1"), "neutral", nil,
            {
                functions = {
                    endfunny = function()
                        susie:resetSprite()
                    end
                }
            })
        susie:resetSprite()
        cutscene:wait(2)
        cutscene:text(Game:locRaw("nightcutscenes_gate_silly_2"), "smile")
        cutscene:choicer({ "Hell Yeah", "Hell Yeah" })
        cutscene:text(Game:locRaw("nightcutscenes_gate_silly_3"), "smile")
        cutscene:detachFollowers()
        cutscene:detachCamera()
        kris:walkTo(susie.x - 20, susie.y, 0.5, "left")
        susie:walkTo(kris.x, kris.y, 0.5, "left")
        cutscene:wait(1)
        kris:walkTo(susie.x + 20, susie.y, 0.5)
        cutscene:wait(0.5)
        kris:slideTo(susie.x, susie.y - 80, 0.5)
        cutscene:wait(1)
        cutscene:text(Game:locRaw("nightcutscenes_gate_silly_4"), "surprise_frown")
        local carol_improvement = Sprite("sillymode/carol_improvement/a")
        carol_improvement:play(1 / 4)
        carol_improvement:setOrigin(1, 1)
        carol_improvement:setPosition(100, 370)
        Game.world:spawnObject(carol_improvement)
        carol_improvement.physics.speed_x = 4
        carol_improvement:setScale(0.5)
        cutscene:wait(function()
            return carol_improvement.x > (kris.x + 100)
        end)
        Mod.ghast_tear_real = true
        Game:load()
    end;
}

return nightCutsenes