return {
  
goldTable = function(cutscene, event)
  cutscene:text(Game:locRaw("sotwwcutscene_goldTable_1"))
  cutscene:text(Game:locRaw("sotwwcutscene_goldTable_2"))
  cutscene:text(Game:locRaw("sotwwcutscene_goldTable_3"))
end,

threshold = function(cutscene, event)
  local soul = cutscene:getCharacter("kris")
  local x, y = cutscene:getMarker("soul1")
  Game.world.music:setVolume(1)
	cutscene:wait(cutscene:walkTo(soul, x, y, 5, "right"))
  Game.world.music:fade(0, 2)
  cutscene:wait(2)
  Game.world.music:play("kristalk")
  Game.world.music:fade(1, 1)
  cutscene:wait(2)
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_1"))
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_2"))
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_3"))
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_4"))
  cutscene:wait(2)
  local choice = Game:locRaw("sotwwcutscene_threshold_4_opt_1")icGame:locRaw("sotwwcutscene_threshold_4_opt_2")", "Please, Kris."})
  if choice == 1 then
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_5"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_6"))
  else
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_7"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_8"))
  end
  local choice = Game:locRaw("sotwwcutscene_threshold_8_opt_1")abGame:locRaw("sotwwcutscene_threshold_8_opt_2")nsave the\nworld."})
  if choice == 1 then
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_9"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_10"))
  else
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_11"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_12"))
  end
  local choice = Game:locRaw("sotwwcutscene_threshold_12_opt_1")reGame:locRaw("sotwwcutscene_threshold_12_opt_2")t\nto be a\nhero."})
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_13"))
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_14"))
  local choice = Game:locRaw("sotwwcutscene_threshold_14_opt_1")neGame:locRaw("sotwwcutscene_threshold_14_opt_2")e the\nsame goal."})
  if choice == 1 then
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_15"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_16"))
      local choice = Game:locRaw("sotwwcutscene_threshold_16_opt_1")erGame:locRaw("sotwwcutscene_threshold_16_opt_2").", "I want to..."})
      cutscene:fadeOut(0)
      Assets.playSound("locker")
  else
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_17"))
      local choice = Game:locRaw("sotwwcutscene_threshold_17_opt_1")erGame:locRaw("sotwwcutscene_threshold_17_opt_2")", "My goal is..."})
      cutscene:fadeOut(0)
      Assets.playSound("locker")
      cutscene:wait(1)
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_18"))
      cutscene:text(Game:locRaw("sotwwcutscene_threshold_19"))
      local choice = Game:locRaw("sotwwcutscene_threshold_19_opt_1")chGame:locRaw("sotwwcutscene_threshold_19_opt_2")'m not", "I'm not"})
  end
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_20"))
  cutscene:wait(Game.world.music:fade(0, 0.5))
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_21"))
  cutscene:wait(1)
  Assets.playSound("charjoined")
  cutscene:text(Game:locRaw("sotwwcutscene_threshold_22"))
  Game.world:loadMap("reconnection", "spawn")
end,

}
