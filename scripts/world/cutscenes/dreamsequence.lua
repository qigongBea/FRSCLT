return {

plaquecutscene = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local door = cutscene:getCharacter("door")
        if kris then
		
		cutscene:text(Game:locRaw("dreamsequence_plaquecutscene_1"))
		cutscene:text(Game:locRaw("dreamsequence_plaquecutscene_2"))
		cutscene:text(Game:locRaw("dreamsequence_plaquecutscene_3"))
		cutscene:text(Game:locRaw("dreamsequence_plaquecutscene_4"))
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_plaquecutscene_5"))
		cutscene:wait(2)
		door:setSprite("door_open")
		cutscene:playSound("impact")
		cutscene:shakeCamera()
		end
  end,
  
  
  
krisWakeup = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local door = cutscene:getCharacter("door")
        if kris then
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		kris:setSprite("fell")
		cutscene:wait(4)
		cutscene:playSound("bump")
		kris:resetSprite()
		end
  end,
  
  
krisSlide = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local x, y = cutscene:getMarker("kris_fall_1")
	 	
		cutscene:text(Game:locRaw("dreamsequence_krisSlide_1"))
		cutscene:text(Game:locRaw("dreamsequence_krisSlide_2"))
		local choice = Game:locRaw("dreamsequence_krisSlide_2_opt_1")enGame:locRaw("dreamsequence_krisSlide_2_opt_2")oicer({"Yes", "No"})
		cutscene:text(Game:locRaw("dreamsequence_krisSlide_3"))
		cutscene:wait(2)
		cutscene:playSound("rumble")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(1)
		cutscene:playSound("rumble")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(0.5)
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:playSound("rumble")
		kris:setSprite("trip")
		kris.sprite:play(0.4)
		cutscene:wait(0.5)
		
		
		kris:beginSlide()
		kris:setSprite("fall")
		kris.sprite:play(0.1, loop)
		cutscene:walkTo(kris, x, y, 15, "down")
		Game.world.timer:after(3, function()
		end)
  end,
  
  
  
dess = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local dess = cutscene:getCharacter("dess")
	
	 	
		cutscene:detachFollowers()
		
		cutscene:walkTo(kris, x, y, 15, "down")
		
		local x, y = cutscene:getMarker("kris1")
		cutscene:walkTo(kris, x, y + 20, 0.5, "right", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		kris:setSprite("fallen_1")
		end)
		
		local x, y = cutscene:getMarker("dess1")
		cutscene:walkTo(dess, x, y + 20, 0.5, "down", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		end)
		
		cutscene:wait(5)
		
		local x, y = cutscene:getMarker("dess2")
		cutscene:walkTo(dess, x, y + 20, 13, "down", true)
		Game.world.timer:after(1, function()
		end)
		cutscene:wait(14)
		
		cutscene:setSpeaker(dess)
		dess:setSprite("shock")
		cutscene:text(Game:locRaw("dreamsequence_dess_1"), "shocked")
		cutscene:text(Game:locRaw("dreamsequence_dess_2"), "smile")
		cutscene:text(Game:locRaw("dreamsequence_dess_3"), "sweat")
		dess:resetSprite()
		kris:setSprite("sitting")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_dess_4"), "smug")
		cutscene:text(Game:locRaw("dreamsequence_dess_5"), "smug")
		cutscene:wait(1)
		kris:resetSprite()
		cutscene:shakeCamera()
		cutscene:playSound("wing")
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_dess_6"), "smile")
		cutscene:text(Game:locRaw("dreamsequence_dess_7"), "determined")
		
		local x, y = cutscene:getMarker("dess3")
		cutscene:walkTo(dess, x, y + 20, 9, "right", true)
		Game.world.timer:after(1, function()
		end)
		
  end,
  
  
doorPushAway = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local dess = cutscene:getCharacter("dess")
	 local noelle = cutscene:getCharacter("noelle")
        if kris then
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_1"))
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_2"))
		local choice = Game:locRaw("dreamsequence_doorPushAway_2_opt_1")enGame:locRaw("dreamsequence_doorPushAway_2_opt_2")oicer({"Yes", "No"})
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_3"))
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_4"))
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_5"))
		local choice = Game:locRaw("dreamsequence_doorPushAway_5_opt_1")enGame:locRaw("dreamsequence_doorPushAway_5_opt_2")oicer({"Yes", "No"})
		cutscene:shakeCamera()
		kris:setSprite("fallen_1")
		cutscene:playSound("damage")
		cutscene:playSound("dtrans_flip")
		
		local x, y = cutscene:getMarker("slide")
		cutscene:walkTo(kris, x, y, 1, "down")
		
		cutscene:wait(1)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_6"))
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		kris:setSprite("fallen_2")
		cutscene:wait(1)
		kris:setSprite("fallen_3")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_7"))
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		kris:setSprite("fallen_1")
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_8"))
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		kris:setSprite("fallen_2")
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_9"))
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		kris:setSprite("fallen_3")
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_10"))
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		kris:setSprite("fallen_1")
		cutscene:playSound("damage")
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_11"))
		cutscene:wait(3)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_12"))
		
		cutscene:wait(2)
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_13"))
		kris:setSprite("fallen_2")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_doorPushAway_14"))
		kris:setSprite("fallen_3")
		
		
		
		cutscene:shakeCamera()
		
		
		end
  end,
  
  
  
flashback = function(cutscene)

Kristal.Console:log("test")
	
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	 local noelle = cutscene:getCharacter("noelle")
        if kris then
		cutscene:detachFollowers()
		local x, y = cutscene:getMarker("kris1")
		cutscene:walkTo(kris, x, y, 5, "left")
		
		local x, y = cutscene:getMarker("dess1")
		cutscene:walkTo(dess, x, y, 5, "down")
		
		local x, y = cutscene:getMarker("azzy1")
		cutscene:walkTo(asriel, x, y, 5, "down")
		
		local x, y = cutscene:getMarker("noelle1")
		cutscene:walkTo(noelle, x, y, 5, "right")
		
		cutscene:wait(5)
		
		dess:setSprite("shock")
		kris:setSprite("fallen_2")
		cutscene:wait(2)
		cutscene:shakeCharacter("kris")
		cutscene:playSound("bump")
		cutscene:wait(3)
		kris:setSprite("fallen_3")
		cutscene:shakeCharacter("kris")
		cutscene:playSound("bump")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_1"), "baby_frown")
		cutscene:wait(2)
		cutscene:playSound("wing")
		kris:setSprite("kris_zombie")
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_2"), "neutral_smile")
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_3"), "baby_frown")
		cutscene:text(Game:locRaw("dreamsequence_flashback_4"), "baby_frown")
		cutscene:text(Game:locRaw("dreamsequence_flashback_5"), "baby_frown")
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_6"), "neutral_smile" )
		cutscene:text(Game:locRaw("dreamsequence_flashback_7"), "smile", {auto = true})
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(2)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_8"), "baby_frown")
		cutscene:playSound("bump")
		cutscene:shakeCharacter("kris")
		cutscene:shakeCamera()
		cutscene:wait(2)
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_9"), "shocked", {auto = true})
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCharacter("kris")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:wait(0.5)
		kris:setSprite("scare")
		kris.sprite:play(0.1)
		noelle:setSprite("shock")
		noelle.sprite:play(0.1)
		cutscene:wait(0.7)
		noelle:setSprite("shock_6")
		kris:setSprite("scare_10")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_10"), "baby_frown")
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_11"), "concern")
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_12"), "baby_tearing")
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_13"), "shocked")
		cutscene:wait(1)
		cutscene:playSound("wing")
		cutscene:shakeCamera()
		noelle:setSprite("cry")
		dess:setSprite("displeased")
		noelle.sprite:play(1)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_14"), "baby_sobbing")
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_15"), "shocked")
		cutscene:text(Game:locRaw("dreamsequence_flashback_16"), "displeased")
		cutscene:text(Game:locRaw("dreamsequence_flashback_17"), "pissed")
		cutscene:text(Game:locRaw("dreamsequence_flashback_18"), "pissed")
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_19"), "snicker")
		cutscene:text(Game:locRaw("dreamsequence_flashback_20"), "snicker")
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_21"), "smug")
		cutscene:text(Game:locRaw("dreamsequence_flashback_22"), "angry_smirk")
		dess:setSprite("right_1")
		cutscene:wait(1)
		cutscene:shakeCamera()
		cutscene:playSound("wing")
		asriel:setSprite("blush")
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_23"), "flushed")
		cutscene:wait(0.5)
		dess:resetSprite()
		local x, y = cutscene:getMarker("dess2")
		cutscene:walkTo(dess, x, y, 1, "left")
		cutscene:wait(1)
		
		local x, y = cutscene:getMarker("dess3")
		cutscene:walkTo(dess, x, y, 1, "down")
		cutscene:wait(1)
		local x, y = cutscene:getMarker("dess4")
		cutscene:walkTo(dess, x, y, 1, "right")
		cutscene:wait(1)
		dess:setSprite("up_1")
		asriel:setSprite("down_jacketless_1")
		cutscene:setSpeaker(dess)
		dess:setSprite("wipe")
		dess.sprite:play(0.5)
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_24"), "flushed")
		cutscene:wait(1)
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_25"), "endearing")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_26"), "baby_tearing")
		cutscene:text(Game:locRaw("dreamsequence_flashback_27"), "baby_tearing")
		cutscene:setSpeaker(dess)
		cutscene:text(Game:locRaw("dreamsequence_flashback_28"), "endearing")
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_flashback_29"), "pissed")
		noelle:resetSprite()
		kris:setSprite("headshake")
		kris.sprite:play(0.5)
		cutscene:wait(2)
		cutscene:text(Game:locRaw("dreamsequence_flashback_30"), "smug")
		cutscene:wait(2)
		kris:setSprite("tounge")
		kris.sprite:play(0.5)
		cutscene:wait(1)
		kris:resetSprite()
		local x, y = cutscene:getMarker("runaway")
		cutscene:walkTo(kris, x, y, 2, "right")
		cutscene:wait(1)
		cutscene:text(Game:locRaw("dreamsequence_flashback_31"), "shocked")
		dess:resetSprite()
		cutscene:walkTo(dess, x, y, 2, "right")
		asriel:setSprite("right_jacketless_1")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text(Game:locRaw("dreamsequence_flashback_32"), "baby_neutral")
		cutscene:walkTo(noelle, x, y, 2, "right")
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text(Game:locRaw("dreamsequence_flashback_33"), "neutral_talking")
		asriel:setSprite("right_jacketless")
		asriel.sprite:play(0.2)
		cutscene:walkTo(asriel, x, y, 2, "right")
		cutscene:wait(5)
		cutscene:fadeOut(0)
		end
  end,
  
  

  
finale = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	 
	 local img = Game.world.map:getImageLayer("night")
	 local img1 = Game.world.map:getImageLayer("door")
	 local img2 = Game.world.map:getImageLayer("overlay")
	 img2.visible = true
	 cutscene:detachFollowers()
		 if kris then
		 cutscene:setSpeaker(dess)
		 
		 local x, y = cutscene:getMarker("dessoutside")
		 cutscene:walkTo(dess, x, y, 1, "up")
		 
		 local x, y = cutscene:getMarker("krisoutside")
		 cutscene:walkTo(kris, x, y, 1, "up")
		 
		 
		 cutscene:wait(5)
		 
		 local x, y = cutscene:getMarker("dessdoor")
		 cutscene:walkTo(dess, x, y, 15, "up")
		 cutscene:wait(0.3)
		 
		 local x, y = cutscene:getMarker("krisdoor")
		 cutscene:walkTo(kris, x, y, 15, "up")
		 
		 cutscene:wait(9)
		 
		 cutscene:text(Game:locRaw("dreamsequence_finale_1"), "smile")
		 cutscene:text(Game:locRaw("dreamsequence_finale_2"), "smile")
		 cutscene:text(Game:locRaw("dreamsequence_finale_3"), "endearing")
		 cutscene:look("dess", "right")
		 cutscene:text(Game:locRaw("dreamsequence_finale_4"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_5"), "endearing")
		 cutscene:text(Game:locRaw("dreamsequence_finale_6"), "determined")
		 cutscene:text(Game:locRaw("dreamsequence_finale_7"), "determined")
		 cutscene:text(Game:locRaw("dreamsequence_finale_8"), "sweat")
		 cutscene:text(Game:locRaw("dreamsequence_finale_9"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_10"), "smile")
		 cutscene:text(Game:locRaw("dreamsequence_finale_11"), "determined")
		 cutscene:text(Game:locRaw("dreamsequence_finale_12"), "glitch")
		 kris:setSprite("pensive_left")
		 cutscene:shakeCharacter("kris")
		 cutscene:playSound("bump")
		 
		 local x, y = cutscene:getMarker("dessvoid")
		 cutscene:walkTo(dess, x, y, 6, "up")
		 
		 cutscene:wait(5)
		 cutscene:playSound("rudehit")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCamera()
		 img.visible = false
		 
		 cutscene:wait(3)
		 cutscene:look("dess", "up")
		 
		 cutscene:wait(3)
		 
		 cutscene:text(Game:locRaw("dreamsequence_finale_13"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_14"), "pensive")
		 cutscene:text(Game:locRaw("dreamsequence_finale_15"), "endearing")
		 cutscene:wait(2)
		 cutscene:text(Game:locRaw("dreamsequence_finale_16"), "pensive")
		 cutscene:text(Game:locRaw("dreamsequence_finale_17"), "concern")
		 cutscene:text(Game:locRaw("dreamsequence_finale_18"), "distress")
		 cutscene:text(Game:locRaw("dreamsequence_finale_19"), "distress")
		 cutscene:text(Game:locRaw("dreamsequence_finale_20"), "disappointed")
		 cutscene:wait(2)
		 cutscene:text(Game:locRaw("dreamsequence_finale_21"), "pissed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_22"), "pissed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_23"), "pissed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_24"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_25"), "smile_shocked")
		 cutscene:text(Game:locRaw("dreamsequence_finale_26"), "smile")
		 cutscene:text(Game:locRaw("dreamsequence_finale_27"), "disappointed")
		 
		  
		 local x, y = cutscene:getMarker("desshug")
		 cutscene:walkTo(dess, x, y, 5, "up")
		 cutscene:wait(2)
		 
		 
		 cutscene:wait(3)
		 
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCamera()
		 kris:setSprite("sit_left")
		 cutscene:playSound("bump")
		 cutscene:text(Game:locRaw("dreamsequence_finale_28"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_29"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_30"), "endearing")
		 cutscene:text(Game:locRaw("dreamsequence_finale_31"), "disappointed")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text(Game:locRaw("dreamsequence_finale_32"), "kris/shaded_neutral")
		 cutscene:shakeCharacter("kris")
		 cutscene:playSound("bump")
		 cutscene:text(Game:locRaw("dreamsequence_finale_33"), "kris/shaded_crying")
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text(Game:locRaw("dreamsequence_finale_34"), "disappointed", {auto = true})
		 
		 cutscene:setSpeaker("kris")
		 cutscene:playSound("rudehit")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCharacter("dess")
		 cutscene:shakeCamera()
		 cutscene:text(Game:locRaw("dreamsequence_finale_35"), "kris/shaded_agony")
		
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text(Game:locRaw("dreamsequence_finale_36"), "shocked")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text(Game:locRaw("dreamsequence_finale_37"), "kris/shaded_agony")
		 cutscene:text(Game:locRaw("dreamsequence_finale_38"), "kris/shaded_crying")
		 cutscene:text(Game:locRaw("dreamsequence_finale_39"), "kris/shaded_crying", {auto = true})
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text(Game:locRaw("dreamsequence_finale_40"), "endearing")
		 cutscene:text(Game:locRaw("dreamsequence_finale_41"), "endearing")
		 cutscene:text(Game:locRaw("dreamsequence_finale_42"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_43"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_44"), "endearing")
		 cutscene:text(Game:locRaw("dreamsequence_finale_45"), "determined")
		 cutscene:text(Game:locRaw("dreamsequence_finale_46"), "smile")
		 cutscene:text(Game:locRaw("dreamsequence_finale_47"), "disappointed")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text(Game:locRaw("dreamsequence_finale_48"), "kris/shaded_crying")
		 cutscene:text(Game:locRaw("dreamsequence_finale_49"), "kris/shaded_neutral")
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text(Game:locRaw("dreamsequence_finale_50"), "disappointed")
		 cutscene:text(Game:locRaw("dreamsequence_finale_51"), "endearing")
		 cutscene:wait(2)
		 cutscene:text(Game:locRaw("dreamsequence_finale_52"), "smug")
		 cutscene:wait(2)
		 
		 img1.visible = false
		 img2.visible = true
		 cutscene:playSound("impact")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCharacter("dess")
		 cutscene:shakeCamera()
		 cutscene:wait(2)
		 
		 dess:setSprite("hug")
		 dess.sprite:play(0.5)
		 cutscene:wait(0.6)
		 dess:setSprite("hug3")
		 
		 cutscene:wait(4)
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text(Game:locRaw("dreamsequence_finale_53"), "kris/crying")
		 cutscene:text(Game:locRaw("dreamsequence_finale_54"), "kris/crying")
		 cutscene:wait(2)
		 
		 dess:setSprite("vanish")
		 dess.sprite:play(0.5)
		 cutscene:wait(5.6)
		 dess:setSprite("vanishaaaa")
		 local x, y = cutscene:getMarker("dessoutside")
		 cutscene:walkTo(dess, x, y, 1, "up")
		 kris:resetSprite()
		 
		end
  end,
  
  
exit = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	  if kris then
	  
		cutscene:fadeOut(0)
		local text = cutscene:text(Game:locRaw("dreamsequence_exit_1"),   {style="GONER"})
		text.box.visible = false
		cutscene:text(Game:locRaw("dreamsequence_exit_2"),  {style="GONER"})
		
		
		cutscene:wait(15)
		end
  end,
 

 

goner = function (cutscene)

        local text

        local function gonerTextFade(wait)
            local this_text = text
            Game.world.timer:tween(1, this_text, { alpha = 0 }, "linear", function ()
                this_text:remove()
            end)
            if wait ~= false then
                cutscene:wait(1)
            end
        end

        local function gonerText(str, advance)
            text = DialogueText("[speed:0.5][spacing:6][style:GONER][voice:none]" .. str, 160, 100, 640, 480,
                                { auto_size = true } )
            text.layer = WORLD_LAYERS["top"] + 100
            text.skip_speed = true
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:addChild(text)

            if advance ~= false then
                cutscene:wait(function () return not text:isTyping() end)
                gonerTextFade(true)
            end
        end

        cutscene:fadeOut(0.5, { music = true })
		
		cutscene:wait(1)
		
		local drone = Assets.playSound("AUDIO_DRONE")
		drone:setLooping(true)


		local background = GonerBackground()
		
        background.layer = WORLD_LAYERS["top"]
        Game.world:addChild(background)
		background.alpha = 0
		background:fadeTo(1, 2)

        gonerText("ARE WE ONCE AGAIN[wait:40]\nCONNECTED? [wait:80]")
		
		gonerText("IS OUR CONNECTION[wait:80]\nESTABLISHED? [wait:120]")
		
		gonerText("IT HAS BEEN[wait:80]\nQUITE SOME TIME. [wait:160]")
		gonerText("BUT AS I SEE IT [wait:160]")
		

		local soul = SoulAppearance(300, 540)
        soul.layer = WORLD_LAYERS["top"] + 100
        Game.world:addChild(soul)
        cutscene:wait(3)

		gonerText("YOU ARE READY[wait:80]\n TO KNOW THE TRUTH. [wait:160]")
		

		background.visible = false
		cutscene:wait(2)
		
        cutscene:text(Game:locRaw("dreamsequence_goner_1"))
		
    end,
	
	}