return {

    ---@param cutscene WorldCutscene
    connect = function(cutscene)
        Game.world.music:fade(0, 1)
        Game:setBorder("simple")
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        cutscene:fadeOut(0)
        local sound = Assets.newSound("noise")
        sound:play()
        cutscene:wait(5)
        local choice = cutscene:choicer({"Hello?", "Hello?"})
        cutscene:wait(2)
        --start gonerText
        local text

        local skip_hint = true


        local function gonerTextFade(wait)
            local this_text = text
            Game.world.timer:tween(1, this_text, { alpha = 0 }, "linear", function()
                this_text:remove()
            end)
            if wait ~= false then
                cutscene:wait(1)
            end
        end

        -- FIXME: actually use skippable
        local function gonerText(str, advance, skippable)
            text = DialogueText("[speed:0.5][spacing:6][style:GONER][voice:none]" .. str, 160, 100, 640, 480,
                { auto_size = true })
            text.layer = WORLD_LAYERS["top"]
            text.skip_speed = not skippable
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:addChild(text)

            if advance ~= false then
                cutscene:wait(function() return not text:isTyping() end)
                gonerTextFade(true)
            end
        end
        Kristal.saveGame()
        ---@type Music -- satisfy LLS
        local world_music = Game.world.music
        world_music:play("AUDIO_DRONE", 0.8)
        gonerText("HELLO.[wait:60]")
        gonerText("IT SEEMS YOU HAVE[wait:40]\nFOUND ME.[wait:60]")
        gonerText("I'VE BEEN AWAITING[wait:40]\nYOUR ARRIVAL.[wait:60]")
        gonerText("SO, KRIS.[wait:40]\nMAY WE BEGIN?[wait:60]")
        gonerText("EXCELLENT.[wait:60]")
        cutscene:wait(1)
        sound:play()
        Game.world.music:stop()
        Game.world.music:play("RECONNECTION", 1)
        --soul:setParallax(0, 0)
        --soul.layer = WORLD_LAYERS["above_textbox"]
        --soul.alpha = 50
        --soul.graphics.fade = 0.01
        --soul.graphics.fade_to = 1
        cutscene:wait(1.75)
        gonerText("YOUR WORLD'S TIME...[wait:40]\nIT IS OVER.\n[wait:60]")
        cutscene:wait(0.5)
        gonerText("BUT THERE IS[wait:40]\nONE MORE OPTION...[wait:60]")
        cutscene:wait(0.5)
        gonerText("YOU MUST BECOME[wait:40]\nA SAVIOR.[wait:60]")
        cutscene:wait(0.5)
        gonerText("A SAVIOR[wait:40]\nOF THE WAKING WORLD.[wait:60]")
        cutscene:wait(0.5)
        gonerText("THIS PLAN IS[wait:40]\nYOUR BEST OPTION.[wait:60]")
        cutscene:wait(0.5)
        gonerText("BUT IT COMES WITH[wait:40]\nCAVEATS.")
        cutscene:wait(0.5)
        gonerText("WILL YOU STILL[wait:40]\nACCEPT THIS DEAL?[wait:60]")
        cutscene:wait(0.5)
        cutscene:wait(0.5)

        local chosen = nil
        local choicer = GonerChoice(220, 360, {
            { { "YES", 0, 0 }, { "<<" }, { ">>" }, { "NO", 160, 0 } }
        }, function(choice)
            chosen = choice
        end)
        choicer:setSelectedOption(2, 1)
        choicer:setSoulPosition(80, 0)
        Game.stage:addChild(choicer)

        cutscene:wait(function() return chosen ~= nil end)

        gonerTextFade()

        if chosen == "YES" then
            gonerText("EXCELLENT.[wait:60]")
            gonerText("TRULY[wait:40]\nEXCELLENT.[wait:60]")

            cutscene:wait(0.75)
            gonerText("NOW.[wait:60]")
        else
            gonerText("NO...?[wait:60]")
            cutscene:wait(0.5)
            gonerText("HOW[wait:40]\nINTERESTING.[wait:60]")
            cutscene:wait(0.5)
            gonerText("THAT OUTCOME[wait:40]\nWAS NOT INTENDED...[wait:60]")
            cutscene:wait(0.5)
            gonerText("THEN LET ME[wait:40]\nPUT YOU OUT[wait:40]\nOF YOUR MISERY.[wait:60]")
            cutscene:wait(0.75)
            Game:gameOver(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
            return
        end

        cutscene:wait(0.5)
        gonerText("I BELIEVE WE MUST[wait:40]\nPART WAYS...[wait:60]")
        gonerText("THIS WILL BE[wait:40]\nOUR FINAL CONNECTION...[wait:60]")
        gonerText("REUNITE WITH THE\nHEROES...[wait:60]")
        gonerText("AND BANISH[wait:40]\nTHE ANGEL'S HEAVEN.[wait:60]")
        cutscene:wait(0.5)
        Assets.playSound("dtrans_lw")
        Game.world:loadMap("sotww", "spawn")
        cutscene:fadeIn(0)
    end;
}