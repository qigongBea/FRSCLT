return {
  
goldTable = function(cutscene, event)
  cutscene:text("* There's a plaque on the table.")
  cutscene:text("* \"A statue in honor of our beloved ping pong table.\"")
  cutscene:text("* - NOT FOR RECREATIONAL USE\n[wait:10]* - NOT FOR RECREATIONAL USE\n[wait:10]* - NOT FOR RECREATIONAL USE")
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
  cutscene:text("* Why.[wait:5].[wait:5].[wait:5] why are you here?")
  cutscene:text("* This is my only chance to get rid of you...[wait:10] but you're coming back to me?")
  cutscene:text("* I don't need you anymore.[wait:5]\n* And I don't care if you need me.")
  cutscene:text("* Your best chance is finding another person to puppet around all day.")
  cutscene:wait(2)
  local choice = cutscene:choicer({"I'm sorry.", "Please, Kris."})
  if choice == 1 then
      cutscene:text("* What're you even sorry for?[wait:5]\n* Controlling me?")
      cutscene:text("* You're not sorry.[wait:5] If you were you'd have stop controlling me days ago.")
  else
      cutscene:text("* Begging me won't work,[wait:5] I'm not just your little \"toy.\"")
      cutscene:text("* Just get out of here already.")
  end
  local choice = cutscene:choicer({"What about\nthe world?", "We need to\nsave the\nworld."})
  if choice == 1 then
      cutscene:text("* I can't do anything to save the world.[wait:5] I was never meant to be in this stupid prophecy.")
      cutscene:text("* Maybe YOU were,[wait:5] but not me...[wait:5]\n* I'm not a hero,[wait:5] I'm a coward.")
  else
      cutscene:text("* Who is WE?[wait:5] You wanna save the world?[wait:5] Do it.[wait:5] I was never meant to be in this stupid prophecy.")
      cutscene:text("* Maybe YOU were,[wait:5] but not me...[wait:5]\n* I'm not a hero,[wait:5] I'm a coward.")
  end
  local choice = cutscene:choicer({"You're not a\ncoward.", "You were meant\nto be a\nhero."})
  cutscene:text("* Thanks,[wait:5] I guess,[wait:5] but it's not like I can just save the world.")
  cutscene:text("* Nothing will change what you did to me...[wait:5] I will forever hate you for that.")
  local choice = cutscene:choicer({"You don't need\nto like me.", "We have the\nsame goal."})
  if choice == 1 then
      cutscene:text("* H-Huh?[wait:5] Why would it...[wait:10]\n* Why would it matter if I liked you or not?")
      cutscene:text("* What don't I need to like you for?")
      local choice = cutscene:choicer({"For us to...", "I want to..."})
      cutscene:fadeOut(0)
      Assets.playSound("locker")
  else
      cutscene:text("* What do you mean we have the same goal?[wait:5] Our goals are different. [shake:1]VERY[shake:0] different.")
      local choice = cutscene:choicer({"I want to...", "My goal is..."})
      cutscene:fadeOut(0)
      Assets.playSound("locker")
      cutscene:wait(1)
      cutscene:text("* ([shake:1]N-No... it can't be...[shake:0])")
      cutscene:text("* You're lying,[wait:5] aren't you?[wait:5]\n* You...[wait:5] you have to be...")
      local choice = cutscene:choicer({"I'm not", "I'm not"})
  end
  cutscene:text("* ...[wait:10] If it really means I get what I want...")
  cutscene:wait(Game.world.music:fade(0, 0.5))
  cutscene:text("* ...[wait:10] I'll help you.")
  cutscene:wait(1)
  Assets.playSound("charjoined")
  cutscene:text("[noskip]* [speed:0.13]Kris accepted you into their party.")
  Game.world:loadMap("reconnection", "spawn")
end,

}
