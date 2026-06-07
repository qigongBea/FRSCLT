return {
  
doorInteract = function(cutscene, event)
  local interactionsDoor = Game:getFlag("interactedDoor", 0)
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie")
  if interactionsDoor <= 5 then
    cutscene:playSound("bump")
    cutscene:shakeCamera()
    cutscene:wait(1)
    cutscene:text(Game:locRaw("depthscutscenes_doorInteract_1"))	
  elseif interactionsDoor <= 7 then
		cutscene:setSpeaker("susie")
    cutscene:text(Game:locRaw("depthscutscenes_doorInteract_2"), "sus_nervous")	
  end
  Game:setFlag("interactedDoor", interactionsDoor + 1)	
end,

sign1 = function(cutscene, event)
  
  cutscene:text(Game:locRaw("depthscutscenes_sign1_1"))	
        
  end,

eggGuy = function(cutscene, event)
  local eggGuy = cutscene:getCharacter("eggGuy")
  eggGuy:setSprite("talk")
  cutscene:setSpeaker(eggGuy)
  cutscene:text(Game:locRaw("depthscutscenes_eggGuy_1"), eggGuy)
  cutscene:text(Game:locRaw("depthscutscenes_eggGuy_2"), eggGuy)
  cutscene:text(Game:locRaw("depthscutscenes_eggGuy_3"), eggGuy)
  cutscene:text(Game:locRaw("depthscutscenes_eggGuy_4"), eggGuy)
  eggGuy:setSprite("idle")
end,

unused = function(cutscene, event)
  Assets.playSound("noise")
  cutscene:text(Game:locRaw("depthscutscenes_unused_1"))
end,
oil = function(cutscene, event)
  cutscene:text(Game:locRaw("depthscutscenes_oil_1"))
end,

unused1 = function(cutscene, event)
  cutscene:text(Game:locRaw("depthscutscenes_unused1_1"))

end,

door1 = function(cutscene, event)
  
  cutscene:text(Game:locRaw("depthscutscenes_door1_1"))	
          
  end,

terminal = function(cutscene, event)
  if Plot:isBefore("depths_powered3") then --note: make powered3 1 after update done
    local img3 = Game.world.map:getImageLayer("powered")
    local platform = cutscene:getCharacter("platform")
    cutscene:playSound("noise")
    cutscene:playSound("bell")
    cutscene:shakeCamera()
    img3.visible = true
    cutscene:wait(1)
    platform:setSprite("idle_online")
    cutscene:wait(0.5)
    cutscene:text(Game:locRaw("depthscutscenes_terminal_1"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal_2"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal_3"))
    Plot:set("depths_powered3") --make 1 after all of depths update is done.
  else
    cutscene:text(Game:locRaw("depthscutscenes_terminal_4"))
  end
end,
terminal_update = function(cutscene, event)
  if not Plot:isBefore("depths_powered1") then --note: make powered3 1 after update done
    local img3 = Game.world.map:getImageLayer("powered")
    local platform = cutscene:getCharacter("platform")
    cutscene:playSound("noise")
    cutscene:playSound("bell")
    cutscene:shakeCamera()
    img3.visible = true
    cutscene:wait(1)
    platform:setSprite("idle_online")
    cutscene:wait(0.5)
    cutscene:text(Game:locRaw("depthscutscenes_terminal_update_1"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal_update_2"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal_update_3"))
    Plot:set("depths_powered3") --make 1 after all of depths update is done.
  else
    cutscene:text(Game:locRaw("depthscutscenes_terminal_update_4"))
  end
end,
terminal2 = function(cutscene, event)
  if Plot:isBefore("depths_powered2") then
    local img3 = Game.world.map:getImageLayer("powered")
    local platform = cutscene:getCharacter("platform")
    cutscene:playSound("noise")
    cutscene:playSound("bell")
    cutscene:shakeCamera()
    img3.visible = true
    cutscene:wait(1)
    platform:setSprite("idle_online")
    cutscene:wait(0.5)
    cutscene:text(Game:locRaw("depthscutscenes_terminal2_1"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal2_2"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal2_3"))
    Plot:set("depths_powered2")
  else
    cutscene:text(Game:locRaw("depthscutscenes_terminal2_4"))
  end
end,
terminal3 = function(cutscene, event)
  if Plot:isBefore("depths_powered3") then
    local img3 = Game.world.map:getImageLayer("powered")
    local platform = cutscene:getCharacter("platform")
    cutscene:playSound("noise")
    cutscene:playSound("bell")
    cutscene:shakeCamera()
    img3.visible = true
    cutscene:wait(1)
    platform:setSprite("idle_online")
    cutscene:wait(0.5)
    cutscene:text(Game:locRaw("depthscutscenes_terminal3_1"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal3_2"))	
    cutscene:text(Game:locRaw("depthscutscenes_terminal3_3"))
    Plot:set("depths_powered3")
  else
    cutscene:text(Game:locRaw("depthscutscenes_terminal3_4"))
  end
end,

kriswakeup = function(cutscene, event)
  local kris = cutscene:getCharacter("kris")
  kris:setSprite("fell")
  cutscene:wait(3)
  cutscene:shakeCharacter("kris")
  kris:setSprite("sit")
  cutscene:wait(2.5)
  cutscene:shakeCharacter("kris")
  cutscene:wait(1)
  cutscene:shakeCharacter("kris")
  cutscene:wait(0.2)
  kris:resetSprite()
  cutscene:look(kris, "right")
end,

platform1 = function(cutscene, event) 
  local platform = cutscene:getCharacter("platform")
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie") or kris
  local noelle = cutscene:getCharacter("noelle") or kris

  local x, y = cutscene:getMarker("markerplatform")
  cutscene:shakeCamera()
  
  cutscene:playSound("noise")
  cutscene:playSound("bell")
  local rumble = Assets.playSound("rumble")
  platform:setSprite("left")
	rumble:setLooping(true)
  cutscene:slideToSpeed(kris, x, kris.y, 4)
  cutscene:slideToSpeed(susie, x - 5, susie.y, 4)
  cutscene:slideToSpeed(noelle, x, susie.y, 4)
  cutscene:slideToSpeed(platform, x, y, 4)
  cutscene:wait(3.1)
  cutscene:playSound("impact")
  Assets.stopSound("rumble")
  cutscene:shakeCamera()
  kris:resetSprite()
  susie:resetSprite()
  platform:setSprite("idle_online")
end,


platform2 = function(cutscene, event) 
  if not Plot:isBefore("depths_powered3") then
    local platform = cutscene:getCharacter("platform")
    local kris = cutscene:getCharacter("kris")
    local susie = cutscene:getCharacter("susie") or kris
    local noelle = cutscene:getCharacter("noelle") or kris
    local x, y = cutscene:getMarker("markerbridge")
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    cutscene:playSound("bell")
    local rumble = Assets.playSound("rumble")
    platform:setSprite("right")
    rumble:setLooping(true)
    cutscene:slideToSpeed(kris, x, kris.y, 4)
    cutscene:slideToSpeed(susie, x - 5, susie.y, 4)
    cutscene:slideToSpeed(platform, x, y, 4)
    cutscene:slideToSpeed(noelle, x, susie.y, 4)
    cutscene:wait(3.1)
    cutscene:playSound("impact")
    Assets.stopSound("rumble")
    cutscene:shakeCamera()
    kris:resetSprite()
    susie:resetSprite()
    platform:setSprite("idle_online")
  else
    cutscene:text(Game:locRaw("depthscutscenes_platform2_1"))	       
  end
end,

krisSlip = function(cutscene, event)
  if Plot:isBefore("depths_slip") then
    local kris = cutscene:getCharacter("kris")
    local susie = cutscene:getCharacter("susie")
    cutscene:detachFollowers()
    Assets.playSound("noise")
    cutscene:fadeOut(0.0001, { music = true })
    cutscene:text(Game:locRaw("depthscutscenes_krisSlip_1"))	       
    local x, y = cutscene:getMarker("krisfallen")
    cutscene:walkTo(kris, x, y, 1, "up")
    kris:setSprite("grab")
    cutscene:wait(2)
    local x, y = cutscene:getMarker("susie1")
    cutscene:walkTo(susie, x, y, 1, "up")
    susie:setSprite("grab")
    cutscene:wait(2)
    --noelle text starts here
    local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
    text.parallax_x = 0
    text.parallax_y = 0
    text.layer = WORLD_LAYERS["textbox"]
    Game.world:addChild(text)
    
    text.alpha = 0
    local textWait = function() return text:isDone() end



    Game.world.timer:tween(3, text, { alpha = 1 })
    cutscene:wait(1)
    Assets.playSound("item")
    cutscene:wait(0.5)
    text:setText("[speed:0.5][color:#ff8a90][instant]CONNECTION FAULTY. . .")
    text:setText("[speed:0.5][color:#909090][voice:noelle]Hello.[wait:5] This is Noelle.[wait:5] I-[wait:5]I've found a recorder down here...")
    cutscene:wait(3)
    Game.world.music:play("noelle")
    Game.world.music:setLooping(false)
    cutscene:wait(3)
    text:setText("[speed:0.5][color:#909090][voice:noelle]At the time I'm recording this,[wait:5] I'm in a place I don't know...")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I don't really know how to put this into words,[wait:5]\nBut it feels like I'm deep...[wait:5] [shake:1]\nREALLY deep.")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]It feels weird,[wait:5] y'know?[wait:5] I feel like I'm right at home...")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]...")
    cutscene:wait(3.5)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I came here with a couple friends...[wait:10]\nAnd I'm scared. ")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I-I'm scared that they'll forget me...\nThey'll escape and I'll\nbe stuck here... forever...[wait:10]")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Missing...[wait:10]\nMissing,[wait:5] to the point where everyone in town has \nforgotten about me. ")
    cutscene:wait(11)
    text:setText("[speed:0.5][color:#909090][voice:noelle]And that,[wait:5]it scares me.\nI-I'll feel like the only one\nwho remembers myself...\n[wait:10]Just like her... ")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle][shake:1]December.")
    cutscene:wait(6)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Oh,[wait:5] who am I kidding...[wait:5]\nNot like Kris is gonna hear...")
    cutscene:wait(3)
    Assets.playSound("wing")
    cutscene:wait(2)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Kris...[wait:5] where are you...?")
    cutscene:wait(3)
    Assets.playSound("noise")
    text:setText("[speed:0.5][color:#909090][voice:noelle]Kris...")
    cutscene:wait(3)
    text:setText("")
    Game.world.music:fade(0, 1)
    --end noelle text
    Game.world.music:play("depths")
    cutscene:fadeIn(0.1, { music = true })
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_1"), "angry")

    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:wait(0.5)
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:wait(0.5)
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")

    local x, y = cutscene:getMarker("susie2")
    cutscene:slideToSpeed(susie, x, y, 6)
    cutscene:shakeCamera()
    cutscene:playSound("impact")
    

    local x, y = cutscene:getMarker("kris1")
    cutscene:walkTo(kris, x, y, 0.3, "up")
    kris:setSprite("fell")
    cutscene:playSound("noise")
    cutscene:wait(0.5)

    
    cutscene:playSound("wing")
    susie:setSprite("up_1")
    cutscene:wait(0.3)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_2"), "sad_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_3"), "sad_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_4"), "surprise_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_5"), "nervous")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_6"), "annoyed_down")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_7"), "sus_nervous")
    kris:setSprite("sit")
    cutscene:playSound("bump")
    cutscene:shakeCharacter("kris")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_8"), "nervous")
    susie:setSprite("left_1")
    cutscene:playSound("wing")
    cutscene:wait(1)
    susie:setSprite("right_1")
    cutscene:playSound("wing")
    cutscene:wait(1)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_9"), "nervous")
    cutscene:wait(1)
    susie:setSprite("up_1")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_10"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_11"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_12"), "nervous_side")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_13"), "nervous_side")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_14"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_15"), "teeth_b")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_16"), "teeth_smile")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_17"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_18"), "neutral" )
    kris:resetSprite()
    cutscene:playSound("bump")
    cutscene:shakeCharacter("kris")
    local x, y = cutscene:getMarker("kris2")
    cutscene:walkTo(kris, x, y, 3, "down")
    cutscene:wait(3.5)
    susie:resetSprite()
    cutscene:attachFollowers()
    cutscene:text(Game:locRaw("depthscutscenes_textWait_19"), "nervous" )
    SetPlot("depths_slip")
  end;
end,

krisSlipOld = function(cutscene, event)
  if Plot:isBefore("depths_slip") then
    local kris = cutscene:getCharacter("kris")
    local susie = cutscene:getCharacter("susie")
    cutscene:detachFollowers()
    Assets.playSound("noise")
    cutscene:fadeOut(0.0001, { music = true })
    cutscene:text(Game:locRaw("depthscutscenes_krisSlipOld_1"))	       
    local x, y = cutscene:getMarker("krisfallen")
    cutscene:walkTo(kris, x, y, 1, "up")
    kris:setSprite("grab")
    cutscene:wait(2)

    local x, y = cutscene:getMarker("susie1")
    cutscene:walkTo(susie, x, y, 1, "up")
    susie:setSprite("grab")
    cutscene:wait(2)
    --noelle text starts here
    local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
    text.parallax_x = 0
    text.parallax_y = 0
    text.layer = WORLD_LAYERS["textbox"]
    Game.world:addChild(text)
    
    text.alpha = 0
    local textWait = function() return text:isDone() end



    Game.world.timer:tween(3, text, { alpha = 1 })
    cutscene:wait(1)
    Assets.playSound("item")
    cutscene:wait(0.5)
  
    text:setText("[speed:0.5][color:#909090][voice:noelle]Hello.[wait:5] This is Noelle.[wait:5] I-[wait:5]I've found a recorder down here...")
    cutscene:wait(3)
    Game.world.music:play("noelle")
    Game.world.music:setLooping(false)
    cutscene:wait(3)
    text:setText("[speed:0.5][color:#909090][voice:noelle]At the time I'm recording this,[wait:5] I'm in a place I don't know...")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I don't really know how to put this into words,[wait:5]\nBut it feels like I'm deep...[wait:5] [shake:1]\nREALLY deep.")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]It feels weird,[wait:5] y'know?[wait:5] I feel like I'm right at home...")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]...")
    cutscene:wait(3.5)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I came here with a couple friends...[wait:10]\nAnd I'm scared. ")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]I-I'm scared that they'll forget me...\nThey'll escape and I'll\nbe stuck here... forever...[wait:10]")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Missing...[wait:10]\nMissing,[wait:5] to the point where everyone in town has \nforgotten about me. ")
    cutscene:wait(11)
    text:setText("[speed:0.5][color:#909090][voice:noelle]And that,[wait:5]it scares me.\nI-I'll feel like the only one\nwho remembers myself...\n[wait:10]Just like her... ")
    cutscene:wait(9)
    text:setText("[speed:0.5][color:#909090][voice:noelle][shake:1]December.")
    cutscene:wait(6)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Oh,[wait:5] who am I kidding...[wait:5]\nNot like Kris is gonna hear...")
    cutscene:wait(3)
    Assets.playSound("wing")
    cutscene:wait(2)
    text:setText("[speed:0.5][color:#909090][voice:noelle]Kris...[wait:5] where are you...?")
    cutscene:wait(3)
    Assets.playSound("noise")
    text:setText("[speed:0.5][color:#909090][voice:noelle]Kris...")
    cutscene:wait(3)
    text:setText("")
    Game.world.music:fade(0, 1)
    --end noelle text
    Game.world.music:play("depths")
    cutscene:fadeIn(0.1, { music = true })
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_20"), "angry")

    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:wait(0.5)
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")
    cutscene:wait(0.5)
    cutscene:shakeCharacter("kris")
    cutscene:playSound("bump")

    local x, y = cutscene:getMarker("susie2")
    cutscene:slideToSpeed(susie, x, y, 6)
    cutscene:shakeCamera()
    cutscene:playSound("impact")
    

    local x, y = cutscene:getMarker("kris1")
    cutscene:walkTo(kris, x, y, 0.3, "up")
    kris:setSprite("fell")
    cutscene:playSound("noise")
    cutscene:wait(0.5)

    
    cutscene:playSound("wing")
    susie:setSprite("up_1")
    cutscene:wait(0.3)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_21"), "sad_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_22"), "sad_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_23"), "surprise_frown")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_24"), "nervous")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_25"), "annoyed_down")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_26"), "sus_nervous")
    kris:setSprite("sit")
    cutscene:playSound("bump")
    cutscene:shakeCharacter("kris")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_27"), "nervous")
    susie:setSprite("left_1")
    cutscene:playSound("wing")
    cutscene:wait(1)
    susie:setSprite("right_1")
    cutscene:playSound("wing")
    cutscene:wait(1)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_28"), "nervous")
    cutscene:wait(1)
    susie:setSprite("up_1")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_29"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_30"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_31"), "nervous_side")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_32"), "nervous_side")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_33"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_34"), "teeth_b")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_35"), "teeth_smile")
    cutscene:wait(2)
    cutscene:text(Game:locRaw("depthscutscenes_textWait_36"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_textWait_37"), "neutral" )
    kris:resetSprite()
    cutscene:playSound("bump")
    cutscene:shakeCharacter("kris")
    local x, y = cutscene:getMarker("kris2")
    cutscene:walkTo(kris, x, y, 3, "down")
    cutscene:wait(3.5)
    susie:resetSprite()
    cutscene:attachFollowers()
    cutscene:text(Game:locRaw("depthscutscenes_textWait_38"), "nervous" )
    SetPlot("depths_slip")
  end;
end,

meetPirates = function(cutscene, event)
  if Plot:isBefore("depths_pirates") then
    local kris = assert(cutscene:getCharacter("kris"), "no kris???")
    local susie = cutscene:getCharacter("susie")
    local pKris = cutscene:getCharacter("pirates/kris")
    local pSusie = cutscene:getCharacter("pirates/susie")
    local pRalsei = cutscene:getCharacter("pirates/ralsei")
    local pNoelle = cutscene:getCharacter("pirates/noelle")
    Game.world.fader.alpha = 1
    cutscene:wait(1)
    Assets.playSound("bell")
    cutscene:wait(1)
    Assets.playSound("bell")
    cutscene:wait(1)
    Assets.playSound("bell")
    cutscene:wait(0.3)
    Assets.playSound("bell")
    cutscene:wait(0.3)
    Assets.playSound("bell")
    cutscene:wait(0.1)
    Assets.playSound("bell")
    cutscene:wait(0.1)
    Assets.playSound("bell")
    cutscene:wait(1)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_1"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_2"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_3"), pSusie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_4"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_5"), pKris)
    cutscene:setSpeaker(susie)
    Game.world.music:play("pirates")
    Game.world.music:setLooping(true)
    cutscene:fadeIn(1.5, { music = true })
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_6"), "closed_grin")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_7"), pNoelle)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_8"), "nervous_side")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_9"), "agitated")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_10"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_11"), pRalsei)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_12"), "stupid")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_13"), pSusie)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_14"), "suspicious")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_15"), "closed_grin")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_16"), pKris)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_17"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_18"), pNoelle)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_19"), "sus_nervous")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_20"), pSusie)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_21"), "stupid")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_22"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_23"), pNoelle)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_24"), pKris)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_25"), pSusie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_26"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_27"), pNoelle)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_28"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_29"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_30"), {auto = true})
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_31"), "teeth")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_32"), "suspicious")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_33"), "teethb")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_34"), "suspicious")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_35"), pKris)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_36"), "surprise_frown")
    cutscene:setSpeaker()
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_37"), pRalsei)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_38"), pRalsei)
    Assets.playSound("jump")
    cutscene:jumpTo(pRalsei, "piratesOutside", 2, 0.6, "jump_ball", "land")
    cutscene:jumpTo(pKris, "piratesOutside", 2, 0.6, "jump_ball", "land")
    cutscene:jumpTo(pSusie, "piratesOutside", 2, 0.6, "jump_ball", "land")
    cutscene:jumpTo(pNoelle, "piratesOutside", 2, 0.6, "jump_ball", "land")
    cutscene:wait(1)
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_39"), "teeth")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_40"), "sus_nervous")
    cutscene:text(Game:locRaw("depthscutscenes_meetPirates_41"), "sus_nervous")
    SetPlot("depths_pirates")
    Game:getQuest("cruise"):unlock()
  end;
end,

bridgeDeploy = function(cutscene, event)
  if Plot:isBefore("depths_bridge") then
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_1"))
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_2"))
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_3"))
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_4"))
    local choice = Game:locRaw("depthscutscenes_bridgeDeploy_4_opt_1")enGame:locRaw("depthscutscenes_bridgeDeploy_4_opt_2")oicer({"Yes", "No"})
    
    if choice == 1 then
      cutscene:playSound("impact")
      cutscene:shakeCamera()
      cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_5"))
      cutscene:wait(2)
      local img = Game.world.map:getImageLayer("bridge1")
      local img1 = Game.world.map:getImageLayer("bridge2")
      local img2 = Game.world.map:getImageLayer("bridge3")
      cutscene:shakeCamera()
      cutscene:playSound("noise")
      img.visible = true
      cutscene:wait(0.5)
      cutscene:shakeCamera()
      cutscene:playSound("noise")
      img1.visible = true
      cutscene:wait(0.5)
      cutscene:shakeCamera()
      cutscene:playSound("noise")
      img2.visible = true
      SetPlot("depths_bridge")
    else
      cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_6"))
    end
  else
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeploy_7"))
  end
end,

bridgeDeployUnresponsive = function(cutscene, event)
  cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_1"))
  cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_2"))
  cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_3"))
  cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_4"))
  local choice = Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_4_opt_1")enGame:locRaw("depthscutscenes_bridgeDeployUnresponsive_4_opt_2")oicer({"Yes", "No"})
  
  if choice == 1 then
    cutscene:playSound("impact")
    cutscene:shakeCamera()
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_5"))
    cutscene:wait(2)
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    cutscene:wait(0.5)
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    cutscene:wait(0.5)
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    cutscene:text(Game:locRaw("depthscutscenes_bridgeDeployUnresponsive_6"))
  end
end,




jump = function (cutscene)
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie")
  local x, y = cutscene:getMarker("midair")
  cutscene:detachFollowers()
  cutscene:slideTo(kris, x, y, 0.3)
  cutscene:slideTo(susie, x, y, 0.3)
  kris:setSprite("ball")
  susie:setSprite("ball")
  kris.sprite:play(0.3, loop)
  susie.sprite:play(0.3, loop)
  cutscene:playSound("jump")
  cutscene:wait(0.2)
  local x, y = cutscene:getMarker("camfocus")
  cutscene:slideTo(kris, x, y, 0.3)
  local x2, y2 = cutscene:getMarker("susie1")
  cutscene:slideTo(susie, x2, y2, 0.3)
  cutscene:wait(0.3)
  kris:setSprite("landed_2")
  susie:setSprite("landed_2")
  cutscene:playSound("impact")
  cutscene:shakeCamera()
  cutscene:wait(1)
  kris:resetSprite()
  susie:resetSprite()
  cutscene:shakeCharacter(kris)
  cutscene:shakeCharacter(susie)
  cutscene:playSound("noise")
end,


signoutside = function (cutscene)
  cutscene:text(Game:locRaw("depthscutscenes_signoutside_1"))
  cutscene:text(Game:locRaw("depthscutscenes_signoutside_2"))
  love.window.setTitle("DELTARUNE Chapter 6")

end,

savecutscene = function (cutscene)
  cutscene:text(Game:locRaw("depthscutscenes_savecutscene_1"))
  cutscene:text(Game:locRaw("depthscutscenes_savecutscene_2"))
end,


sans = function (cutscene)
  local interactionsSans = Game:getFlag("interactedSans", 0)
  local sans = cutscene:getCharacter("sans")
  local susie = cutscene:getCharacter("susie")
  if interactionsSans < 1 then
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_sans_1"), "teeth_b")
    cutscene:text(Game:locRaw("depthscutscenes_sans_2"), "nervous_side")
    cutscene:text(Game:locRaw("depthscutscenes_sans_3"), "surprise")
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_4"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_5"), "eyes_closed")
    cutscene:text(Game:locRaw("depthscutscenes_sans_6"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_7"), "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_sans_8"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_sans_9"), "annoyed")
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_10"), "joking")
    cutscene:text(Game:locRaw("depthscutscenes_sans_11"), "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_sans_12"), "teeth")
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_13"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_14"), "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_sans_15"), "teeth_smile")
  elseif interactionsSans == 1 then
    cutscene:setSpeaker(susie)
    cutscene:text(Game:locRaw("depthscutscenes_sans_16"), "nervous")
    cutscene:text(Game:locRaw("depthscutscenes_sans_17"), "shy")
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_18"), "look_left")
    Assets.playSound("item")
    cutscene:setSpeaker()
    Game.inventory:tryGiveItem("shoppinglist")
    cutscene:text(Game:locRaw("depthscutscenes_sans_19"))
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_20"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_21"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_22"), "wink")
    Assets.playSound("ominous")
    Game.world.music:stop()
  elseif interactionsSans >= 2 then
    cutscene:setSpeaker(sans)
    cutscene:text(Game:locRaw("depthscutscenes_sans_23"), "neutral")
    cutscene:text(Game:locRaw("depthscutscenes_sans_24"), "wink")
  end
  Game:setFlag("interactedSans", interactionsSans + 1)	
end,

sailor = function (cutscene)
  local img = Game.world.map:getImageLayer("stars big")
  local img1 = Game.world.map:getImageLayer("stars medium")
  local img2 = Game.world.map:getImageLayer("stars small")
  local img3 = Game.world.map:getImageLayer("dock")
  local img4 = Game.world.map:getImageLayer("dockL")
  local img5 = Game.world.map:getImageLayer("mangroves")
  local sailor = cutscene:getCharacter("sailor")
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie")
  cutscene:detachFollowers()

  cutscene:setSpeaker(sailor)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_1"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_2"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_3"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_4"))
  cutscene:wait(1)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_5"))
  local choice = Game:locRaw("depthscutscenes_sailor_5_opt_1")icer({"Evergroves"})

  
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_6"), "nervous")
  cutscene:setSpeaker()
  cutscene:text(Game:locRaw("depthscutscenes_sailor_7"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_8"))

  sailor:setSprite("paddle")
  local swoosh = Assets.playSound("swoosh")
  swoosh:setLooping(true)
  cutscene:after(function()
    swoosh:setLooping(false)
  end)
  sailor.sprite:play(0.3, loop)

  img3:setScale(1) -- sets the scale of the sprite
  img3.physics.speed_x = 0.40 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  cutscene:wait(6)
  
  cutscene:text(Game:locRaw("depthscutscenes_sailor_9"))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_10"), "closed_grin")
  cutscene:setSpeaker()
  cutscene:text(Game:locRaw("depthscutscenes_sailor_11"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_12"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_13"))

  cutscene:wait(2)
  
  cutscene:look(kris, "left")
  cutscene:look(susie, "down")
  cutscene:playSound("wing")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_14"))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_15"), "annoyed_down")
  cutscene:setSpeaker()
  cutscene:text(Game:locRaw("depthscutscenes_sailor_16"))
  
  cutscene:text(Game:locRaw("depthscutscenes_sailor_17"))
  kris:resetSprite()
  cutscene:text(Game:locRaw("depthscutscenes_sailor_18"))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_19"), "smile")
  cutscene:setSpeaker()
  cutscene:wait(2)
  
  local x, y = cutscene:getMarker("kris1")
  local x2, y2 = cutscene:getMarker("susie1")
  cutscene:walkTo(kris, x, y, 2, "left")
  cutscene:walkTo(susie, x2, y2, 2, "left")
  cutscene:wait(2.5)
  cutscene:shakeCharacter("kris")
  cutscene:shakeCharacter("susie")
  kris:setSprite("chilling")
  susie:setSprite("down_happy")
  kris.sprite:play(0.3, loop)
  cutscene:playSound("noise2")
  cutscene:wait(0.5)
  cutscene:wait(3)

  cutscene:text(Game:locRaw("depthscutscenes_sailor_20"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_21"))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_22"), "neutral_side")
  cutscene:setSpeaker()
  cutscene:text(Game:locRaw("depthscutscenes_sailor_23"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_24"))
  cutscene:text(Game:locRaw("depthscutscenes_sailor_25"))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_26"), "neutral_side")
  cutscene:setSpeaker()
  cutscene:wait(3)
  cutscene:text(Game:locRaw("depthscutscenes_sailor_27"))


  img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img:setScale(1) -- sets the scale of the sprite
  img.physics.speed_x = 0.18 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img1.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img1:setScale(1) -- sets the scale of the sprite
  img1.physics.speed_x = 0.25 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img2.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img2:setScale(1) -- sets the scale of the sprite
  img2.physics.speed_x = 0.30 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.


  img5.wrap_texture_x = false -- this infinitely wraps the texture horizontally when set to true
  img5:setScale(1) -- sets the scale of the sprite
  img5.physics.speed_x = 0.04 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
  text.parallax_x = 0
  text.parallax_y = 0
  text.layer = WORLD_LAYERS["textbox"]
  Game.world:addChild(text)
  
  text.alpha = 0
  local textWait = function() return text:isDone() end

  Game.world.timer:tween(1, text, { alpha = 1 })
 
  local x, y = cutscene:getMarker("cameratarget2")
  
  
  cutscene:panTo("cameratarget2", 13) --pan camera to marker named "camera_target" over 2 seconds
  cutscene:wait(4)

  local song = Assets.playSound("seasong")
  song:setLooping(false)

  cutscene:wait(17)
  
  text:setText("[voice:none]My [wait:40]new [wait:8.5]life, [wait:37]be[wait:9]low [wait:10]the [wait:9]stars. ")
  cutscene:wait(7.5)
  text:setText("[voice:none]My[wait:9] world[wait:30] has[wait:8] changed-[wait:45] \nand[wait:1] it's[wait:2] stran[wait:7]ger[wait:2] than[wait:8] be[wait:2]fore.[wait:4]")
  cutscene:wait(8.4)
  text:setText("[voice:none]Ev[wait:40]en [wait:8.5]still [wait:37]I [wait:9]row [wait:10]a[wait:9]long. ")
  cutscene:wait(6.5)
  text:setText("[voice:none]My [wait:9]world [wait:40]is [wait:9]changed, \n[wait:40]and[wait:10] I,")
  cutscene:wait(5.9)
  text:setText("[voice:none]I [wait:2]don't [wait:2]mind, [wait:8]I've \n[wait:5]got [wait:2]my [wait:3]raft [wait:3]with [wait:2]me! ")
  cutscene:wait(7)
  text:setText("")


  cutscene:wait(2)
  img4.physics.speed_x = 0.00 -- used to be 0.40 / automatic scroll speed of the background. Change the number whatever you think is most suitable.
  cutscene:text(Game:locRaw("depthscutscenes_textWait_39"))
  cutscene:text(Game:locRaw("depthscutscenes_textWait_40"))
  cutscene:text(Game:locRaw("depthscutscenes_textWait_41"))
  local x, y = cutscene:getMarker("cameratarget3")
  cutscene:wait(cutscene:fadeOut(1.5))
  cutscene:wait(5)
  cutscene:playSound("noise2")
  cutscene:text(Game:locRaw("depthscutscenes_textWait_42"))
  cutscene:text(Game:locRaw("depthscutscenes_textWait_43"))
  kris:resetSprite()
  susie:resetSprite()
  sailor:resetSprite()
  cutscene:attachFollowers()
  cutscene:mapTransition("evergroveLeadup", 38.23, 323.96)
  cutscene:wait(cutscene:fadeIn(1.5))
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_textWait_44"), "sad_frown")
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_textWait_45"), "agitated")
  cutscene:text(Game:locRaw("depthscutscenes_textWait_46"), "nervous_side")
  cutscene:wait(1)
end,



susieTest = function(cutscene)
  local susie = cutscene:getCharacter("susie")

  local img = Game.world.map:getImageLayer("overlay2")
  local alpha_fx = img:addFX(RecolorFX(), "AlphaFX")
  Game.world.timer:tween(0, alpha_fx, {color = {1, 1, 1, 0}})


  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_susieTest_1"), "blush")
  cutscene:text(Game:locRaw("depthscutscenes_susieTest_2"), "teeth")

  Game.world.timer:tween(0.1, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(1)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})

  cutscene:wait(4)

  cutscene:text(Game:locRaw("depthscutscenes_susieTest_3"), "blush")

  cutscene:wait(2)

  cutscene:playSound("noise")
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie3")
  cutscene:slideTo(susie, x, y, 0.1)
  cutscene:wait(0.5)
  cutscene:playSound("noise")
  cutscene:fadeIn(0)

  cutscene:wait(1)
  cutscene:text(Game:locRaw("depthscutscenes_susieTest_4"), "teeth_b")
  
end,




december = function(cutscene)
  
  local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
  text.parallax_x = 0
  text.parallax_y = 0
  text.layer = WORLD_LAYERS["textbox"]
  Game.world:addChild(text)
  cutscene:fadeOut(3)
  
  text.alpha = 0
  local textWait = function() return text:isDone() end



  Game.world.timer:tween(3, text, { alpha = 1 })
  cutscene:wait(3)
  Assets.playSound("item")
  cutscene:wait(2)
 
  text:setText("[speed:0.5][color:#909090][voice:noelle]Hello.[wait:5] This is Noelle.[wait:5] A-again...")
  cutscene:wait(3)
  Game.world.music:play("noelle")
  Game.world.music:setLooping(false)
  cutscene:wait(3)
  text:setText("[speed:0.5][color:#909090][voice:noelle]At the time I'm recording this,[wait:5] I'm in the basement.")
  cutscene:wait(7)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I don't really know how to put this into words,[wait:5] but I've been missing you more recently.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I guess coming across the old Christmas card I made you certainly didn't help, haha[wait:5].[wait:5].[wait:5].")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]...")
  cutscene:wait(3.5)
  text:setText("[speed:0.5][color:#909090][voice:noelle]My friend and I are looking for Kris.[wait:10] They just...[wait:10] Vanished.[wait:10]\nAnd I'm really scared. ")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I-I'm scared that they'll be missing without a trace.[wait:10]")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Missing...[wait:10]\nMissing,[wait:5] to the point where everyone in town has \nforgotten about them. ")
  cutscene:wait(11)
  text:setText("[speed:0.5][color:#909090][voice:noelle]And that,[wait:5]\nI-I'll feel like the only one\nwho remembers them...\n[wait:10]The only one who still cares to look. ")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]It's just,\n[wait:40][color:#494B48]Sigh... ")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Every day I am reminded of you.[wait:10]\nBut every day I lose any bit of hope I'll see you again.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I probably sound pathetic saying all of this...\n[wait:10]I just,[wait:5] r-really hope you're \nokay.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I still like to believe \nyou're out there,[wait:5] safe.[wait:10]\nSomewhere,[wait:5] in this scary world.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]On one of the adventures we used to go on together.")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]S-somewhere with pretty lights,[wait:5] somewhere you always wanted to take us.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]But sometimes,[wait:5] I swear-[wait:10]\nI'll see you.\n[wait:10]In the corner of my eye,\njust for a brief moment,")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]With that familiar smile,[wait:5]\nas if you never left my side...")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#494B48][voice:noelle]It's honestly terrifying...")
  cutscene:wait(6)
  Assets.playSound("dooropen")
  text:setText("[speed:0.5][color:#909090][voice:noelle]Terrifying,[wait:5] because I know it's not really you.[wait:10]\n[color:#494B48][shake:1]It never is.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]B-but even still,[wait:5] I try to stay hopeful.\n[wait:10]Hopeful I'll get to see you\nagain.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]That's what people know me for,[wait:5] anyways.")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Well,\n[wait:5]I suppose I should probably go now.[wait:10]\nMy friend is waiting for me.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I think you'd really like to \nmeet her.[wait:10]\nShe's wonderful really,[wait:5] but...")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]In the chance you're hearing \nthis,[wait:5] just know that-")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I miss you,[wait:5] December.")
  cutscene:wait(6)
  text:setText("")
  cutscene:wait(1)
  Assets.playSound("wing")
  cutscene:wait(1)
  Assets.playSound("item")
  cutscene:wait(2)
  text:setText("[speed:0.5][color:#909090]Gosh.[wait:10] Who am I kidding...")
  cutscene:wait(2)
  Assets.playSound("wing")
  cutscene:wait(1)
  Assets.playSound("noise")
  cutscene:wait(6)
  
 
end,

testNoelle = function(cutscene)
  Game.world.camera:panTo("focus", 0.5)
  
  local flashlight = cutscene:getCharacter("flashlight")
  flashlight:setSprite("beam")
  local noelle = cutscene:getCharacter("noelle_lw")
  local susie = cutscene:getCharacter("susie")

  cutscene:text(Game:locRaw("depthscutscenes_testNoelle_1"))
  noelle:setSprite("flashlight")
  Assets.playSound("noise")
 

  cutscene:text(Game:locRaw("depthscutscenes_testNoelle_2"))
  flashlight:setSprite("off")
  noelle:resetSprite()



end,


knight = function(cutscene)

  

  local susie = cutscene:getCharacter("susie")
  
  local kris = cutscene:getCharacter("kris")
  local knight = cutscene:getCharacter("knight")
  cutscene:detachFollowers()

  local x, y = cutscene:getMarker("spawn")
  cutscene:slideTo(kris, x, y, 0.1)
  kris:setSprite("chair_1")
  cutscene:setSpeaker(knight)
  
  Game.world.camera:panTo("focus", 0.5)

  local x, y = cutscene:getMarker("offscreen")
  cutscene:slideTo(susie, x, y, 0.1)

  cutscene:wait(2)
  Game:setFlag("special_textbox", true)
  Game.world.music:play("knight")
  Game.world.music:setLooping(false)
  cutscene:text(Game:locRaw("depthscutscenes_knight_1"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_2"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_3"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_4"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_5"), "stare")
  cutscene:wait(3)
  cutscene:text(Game:locRaw("depthscutscenes_knight_6"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_7"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_8"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_9"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_10"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_11"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_12"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_13"), "stare")
  cutscene:wait(1.5)
  --have the knight turn around here
  knight:setSprite("down")
  cutscene:wait(1.5)
  cutscene:text(Game:locRaw("depthscutscenes_knight_14"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_15"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_16"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_17"), "stare")
  cutscene:wait(1.5)
  cutscene:text(Game:locRaw("depthscutscenes_knight_18"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_19"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_20"), "stare")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_knight_21"), "stare")
  cutscene:shakeCharacter("kris")
  Assets.playSound("bump")
  cutscene:wait(1)
  kris:setSprite("chair")
  kris.sprite:play(0.4)
  cutscene:wait(1.6)
  kris:setSprite("chair_4")
  
  Game:setFlag("special_textbox", false)
  local choice = Game:locRaw("depthscutscenes_knight_21_opt_1")ceGame:locRaw("depthscutscenes_knight_21_opt_2")"You're a failure"})
  Game:setFlag("special_textbox", true)
  cutscene:wait(0.5)
  cutscene:text(Game:locRaw("depthscutscenes_knight_22"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_23"), "stare")
  cutscene:wait(1.5)
  cutscene:text(Game:locRaw("depthscutscenes_knight_24"), "stare")
  
  
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_knight_25"), "stare")
  Game:setFlag("special_textbox", false)
  local choice = Game:locRaw("depthscutscenes_knight_25_opt_1")oiGame:locRaw("depthscutscenes_knight_25_opt_2")ing", "Don't care"})
  Game:setFlag("special_textbox", true)
  cutscene:text(Game:locRaw("depthscutscenes_knight_26"), "stare")
  cutscene:text(Game:locRaw("depthscutscenes_knight_27"), "stare")
  Game:setFlag("special_textbox", false)

  Game.world.camera:panTo("focus2", 10)
  cutscene:fadeOut(7)

  cutscene:wait(2)
  kris:setSprite("chair_3")
  cutscene:wait(9999999)
  
end,

spriteTest = function(cutscene)
  local susie = cutscene:getCharacter("susie")
  susie:setSprite("hitting")
  susie.sprite:play(0.1)
  cutscene:wait(2)
  susie:setSprite("dork")
end,

waiting = function(cutscene)
  local susie = cutscene:getCharacter("susie")
  local noelle = cutscene:getCharacter("noelle")
  
  local img = Game.world.map:getImageLayer("overlay2")

  local alpha_fx = img:addFX(RecolorFX(), "AlphaFX")
  Game.world.timer:tween(0.1, alpha_fx, {color = {1, 1, 1, 0}})
  Game.world.camera:panTo("focus", 0.5)
  

  
 
  local x, y = cutscene:getMarker("susie1")
  cutscene:slideTo(susie, x, y, 0.1)
  cutscene:wait(0.5)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("susie1")
  cutscene:walkTo(susie, x, y, 2, "left")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("susie1")
  cutscene:walkTo(susie, x, y, 2, "left")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  cutscene:setSpeaker(susie)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_1"), "neutral_side")
  local x, y = cutscene:getMarker("susie1")
  cutscene:wait(1)
  cutscene:playSound("noise")
  Game.world.music:pause()
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie2")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  cutscene:wait(1)
  susie:setSprite("chilling")
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  cutscene:wait(4)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_2"), "annoyed1")
  cutscene:wait(1)
  cutscene:playSound("noise")
  cutscene:fadeOut(0)
  Game.world.music:pause()
  local x, y = cutscene:getMarker("susie3")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  
  cutscene:wait(1)
  
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  susie:setSprite("sit")
  cutscene:wait(2)
  susie.sprite:play(0.1)
  cutscene:playSound("wing")
  cutscene:wait(0.5) 
  cutscene:playSound("bump")
  cutscene:shakeCharacter(susie)
  susie:setSprite("sit_8")

  
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_3"), "nervous")
  cutscene:text(Game:locRaw("depthscutscenes_waiting_4"), "nervous_side")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_5"), "annoyed_down")
  cutscene:wait(1)
  
  Game.world.timer:tween(0.01, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(0.5)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_6"), "agitated")
  cutscene:wait(3)
  cutscene:shakeCharacter(susie)
  cutscene:playSound("bump")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_7"), "stupid")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_8"), "annoyed_down")


  cutscene:playSound("noise")
  Game.world.music:stop()
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie4")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  
  cutscene:wait(2)
  
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  susie:setSprite("chill")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_9"), "nervous")
  cutscene:wait(2)
  Game.world.timer:tween(0.01, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(0.5)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})
  cutscene:wait(1)
  susie:resetSprite()
  cutscene:playSound("wing")
  cutscene:text(Game:locRaw("depthscutscenes_waiting_10"), "teeth")
  cutscene:wait(0.5)
  
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 0.3, "right")
  cutscene:wait(0.5)
  susie:setSprite("hitting")
  susie.sprite:play(0.1)
  cutscene:playSound("bump")
  cutscene:wait(0.4) 
  cutscene:playSound("bump")
  cutscene:wait(0.1) 
  cutscene:playSound("phoneM")
  susie:resetSprite()
  cutscene:look(susie, "up")
  cutscene:wait(1)
  cutscene:playSound("phoneM")
  cutscene:wait(2)
  cutscene:text(Game:locRaw("depthscutscenes_waiting_11"), "surprise_frown")
  cutscene:wait(1)
  local x, y = cutscene:getMarker("door2")
  cutscene:walkTo(susie, x, y, 1, "up")
  cutscene:wait(1)
  susie:setSprite("dork")
  cutscene:gotoCutscene("depthsCutscenes.december")


  

end,

noelleTest = function(cutscene)
  
  
  Game.world:loadMap("noelles house/basement/basement")
  cutscene:fadeIn(3)
  
  

  local flashlight = cutscene:getCharacter("flashlight")
  
  local noelle = cutscene:getCharacter("noelle_lw")
  local susie = cutscene:getCharacter("susie")

  local x, y = cutscene:getMarker("susie1")
  
  cutscene:slideTo(susie, x, y, 0.1)
  Game.world.camera:panTo("focus", 0.5)

  cutscene:look(noelle, "left")
  cutscene:look(susie, "right")
  flashlight:setSprite("beam")
  noelle:setSprite("flashlight")
  cutscene:setSpeaker("susie")
  cutscene:wait(5)
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_1"), "nervous_side")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_2"), "nervous")


  cutscene:setSpeaker("noelle")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_3"), "what_smile")
  flashlight:setSprite("beamb")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_4"), "what_smile_b")

  cutscene:wait(1)
  Assets.playSound("noise")
  flashlight:setSprite("off")
  cutscene:wait(2)
  noelle:resetSprite()
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_5"), "sad_side", "noelle")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_6"), "sus_nervous", "susie")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_7"), "stupid", "susie")

  
  local x, y = cutscene:getMarker("noelle2")
  
  cutscene:walkTo(noelle, x, y, 1, "left")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_8"), "sad_smile", "noelle")
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_9"), "sad_smile_b", "noelle")
  cutscene:wait(1)
  cutscene:look(noelle, "right")
  cutscene:wait(1)
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_10"), "sad_smile_b", "noelle")
  cutscene:wait(0.5)
  cutscene:look(noelle, "left")
  local x, y = cutscene:getMarker("noelle3")
  
  cutscene:walkTo(noelle, x, y, 2, "left")
  local x, y = cutscene:getMarker("susie2")
  
  cutscene:walkTo(susie, x, y, 1, "down")
  cutscene:wait(2)
  
  local x, y = cutscene:getMarker("noelle4")
  
  
  cutscene:walkTo(noelle, x, y, 2, "up")
  cutscene:wait(0.5)
  cutscene:look(susie, "left")
  cutscene:wait(1.5)
  noelle:setSprite("gough")
  cutscene:wait(1)
  cutscene:look(susie, "right")
  cutscene:wait(1)
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_11"), "teeth", "susie")
  cutscene:wait(1.5)
  Assets.playSound("phone")
  cutscene:wait(0.5)
  Assets.playSound("phone")
  cutscene:wait(1.5)
  
  cutscene:text(Game:locRaw("depthscutscenes_noelleTest_12"), "nervous", "susie")
  
  cutscene:wait(2)

  

end
}
