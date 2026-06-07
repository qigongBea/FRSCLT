return {
  
elevatorcutscene = function(cutscene, event)
	if Game:getFlag("elevator2done", false) == false then
		local img = Game.world.map:getImageLayer("Image Layer 1")
		local img2 = Game.world.map:getImageLayer("loop")

		cutscene:playSound("bell")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_1"))

		img.wrap_texture_x = false -- this infinitely wraps the texture horizontally when set to true
		img2.wrap_texture_y = true -- this infinitely wraps the texture vertically when set to true
		img:setScale(1) -- sets the scale of the sprite
		img2:setScale(1) -- sets the scale of the sprite

		img:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
		img2:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
		
		cutscene:wait(2)
		img.physics.speed_y = 0.1 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
		img2.physics.speed_y = 0.1 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
		
		cutscene:detachFollowers()
		local x = event.x + event.width/2
		local y = event.y + event.height/2

		
		local rect = Rectangle(240, 440, 100, 200) -- i made up these numbers you'll have to adjust them however you need
		rect.color = {0, 0, 0} -- set its color to black (it's white by default)
		Game.world:spawnObject(rect, "objects") -- add the rectangle to the world. for most things you would use "addChild(rect)" instead, but World has a special "spawnObject" function to handle setting its layer correctly too
		local sound = Assets.newSound("elevator")
		sound:setVolume(0.5)
		sound:setPitch(0.8)
		sound:setLooping(true)
		sound:play()


		
		Game:setFlag("elevatorstart", 1)
		cutscene:playSound("impact")
		cutscene:shakeCamera()

		local susie = cutscene:getCharacter("susie")
		local ralsei = cutscene:getCharacter("ralsei")
		local kris = cutscene:getCharacter("kris")
		if susie then
		--happy

		cutscene:wait(2)
		
		
		local x, y = cutscene:getMarker("susie")
		cutscene:walkTo(susie, x, y + 20, 0.5, "right", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		susie:setSprite("wall_right")
		end)
		
		local x, y = cutscene:getMarker("kris")
		cutscene:walkTo(kris, x, y + 20, 1, "right", true)
		Game.world.timer:after(3, function()
		cutscene:playSound("bump")
		kris:setSprite("sit")
		end)
		
		local x, y = cutscene:getMarker("ralsei")
		cutscene:walkTo(ralsei, x, y + 20, 1, "right", true)
		cutscene:wait(2)
		ralsei:setAnimation({"sit", 0.4, next="sitting"})
		cutscene:playSound("swallow")
		ralsei.sprite:play(0.1, false)
		
		cutscene:wait(2)
		
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_2"), "surprise" )
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_3"), "smile" )
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_4"), "smirk" )
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_5"), "closed_grin")
		cutscene:wait(2)
		ralsei:setSprite("yawn")
		cutscene:setSpeaker(ralsei)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_6"), "yawn")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_7"), "sleepy")
		cutscene:wait(1)
		ralsei:setAnimation({"eep", 0.4, next="sleep"})
		ralsei:setSprite("sleep")
		ralsei.sprite:play(0.3, loop)
		cutscene:wait(4)
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_8"), "susie_dream_smile")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_9"), "shy")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_10"), "teeth_smile" )
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_11"), "suspicious")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_12"), "neutral")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_13"), "neutral_side")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_14"), "suspicious")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_15"), "neutral_side")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_16"), "suspicious")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_17"), "nervous_side")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_18"), "neutral_side")
		cutscene:wait(5)
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_19"), "sus_nervous")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_20"), "teeth")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_21"), "annoyed_down")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_22"), "sad")
		cutscene:wait(2)
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_23"), "stupid")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_24"), "teeth")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_25"), "teeth_b")
		cutscene:wait(0.5)
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_26"), "sus_nervous")
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("up")
		local x, y = cutscene:getMarker("susie2")
		cutscene:wait(cutscene:walkTo(susie, x, y, 0.3, "up", true))
		susie:setSprite("point_up")
		susie.sprite:play(0.4, loop)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_27"), "angry_c")
		cutscene:wait(0.7)
		susie:setSprite("point_up_turn")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_28"), "nervous")
		cutscene:wait(1)
		susie:setSprite("right_1")
		cutscene:wait(0.5)
		susie:setSprite("down_1")
		cutscene:wait(1.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		susie.sprite:setWalkSprite()
		susie:setSprite("downed")
		cutscene:wait(2)
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_29"), "annoyed_down")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_30"), "nervous")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_31"), "nervous_side")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_32"), "stupid")
		cutscene:wait(3)
		susie:setSprite("down_happy")
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_33"), "smile")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_34"), "susie_dream_grin")
		cutscene:wait(1)
		susie:setSprite("downed")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_35"), "shy_down")
		cutscene:wait(6)
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("right")
		local x, y = cutscene:getMarker("susie3")
		cutscene:wait(cutscene:walkTo(susie, x, y, 0.2, "right", true))
		susie:setSprite("exasperated_right")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_36"), "teeth")
		susie:setSprite("right_1")
		ralsei:setSprite("yawn")
		cutscene:setSpeaker(ralsei)
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_37"), "sleepy")
		cutscene:wait(0.2)
		ralsei:setSprite("surprised_down")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_38"), "shock")
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("up")
		ralsei.sprite:setWalkSprite("walk")
		ralsei.sprite:setFacing("up")
		kris.sprite:setWalkSprite("walk")
		kris.sprite:setFacing("down")
		local x1, y1 = cutscene:getMarker("susie4")
		local x2, y2 = cutscene:getMarker("ralsei2")
		local x3, y3 = cutscene:getMarker("kris2")
		cutscene:walkTo(susie, x1, y1, 1, "up", true)
		cutscene:walkTo(ralsei, x2, y2, 1, "up", true)
		cutscene:walkTo(kris, x3, y3, 1, "down", true)
		Game.world.timer:after (10, function()
			img.physics.speed_y = 0.0
			img2.physics.speed_y = 0.0
			rect:remove()
			cutscene:playSound("grab")
			cutscene:shakeCamera()
			sound:stop()
			kris:resetSprite()
			susie:resetSprite()
			ralsei:resetSprite()
			Game:setFlag("elevator2done", true)		
			cutscene:alignFollowers()
			
			cutscene:attachFollowers()
		end)	
			
		end
	else
		cutscene:playSound("bell")
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_39"))
		cutscene:text(Game:locRaw("elevator_elevatorcutscene_40"))
	end
end
}