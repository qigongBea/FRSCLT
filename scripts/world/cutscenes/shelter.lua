return {

sword = function(cutscene, event)
    local swordE = cutscene:getCharacter("sword")

    cutscene:text(Game:locRaw("sheltercutscene_sword_1"))
    cutscene:text(Game:locRaw("sheltercutscene_sword_2"))
    local choice = cutscene:choicer({"Yes", "No"})
    
    if choice == 1 then
        cutscene:text(Game:locRaw("sheltercutscene_sword_3"))
        swordE:remove()
        Assets.playSound("item")
        cutscene:wait(1)
        cutscene:text(Game:locRaw("sheltercutscene_sword_4"))
        event:setFlag("dont_load", true)

    elseif choice == 2 then 
        cutscene:text(Game:locRaw("sheltercutscene_sword_5"))
        Cutscene:endCutscene()
    end
end;

smasheddoor = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_smasheddoor_1"))
end;

lockeddoor = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_lockeddoor_1"))
end;

boxes = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_boxes_1"))
end;

computer = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_computer_1"))
end;
lockdown = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_lockdown_1"))
    cutscene:setSpeaker("susie")
    cutscene:text(Game:locRaw("sheltercutscene_lockdown_2"), "sad")
end;
shopinterest = function(cutscene, event)
    cutscene:setSpeaker("susie")
    cutscene:text(Game:locRaw("sheltercutscene_shopinterest_1"), "sad")
end;
documents = function(cutscene, event)
    cutscene:text(Game:locRaw("sheltercutscene_documents_1"))
    cutscene:text(Game:locRaw("sheltercutscene_documents_2"))
    cutscene:setSpeaker("susie")
    cutscene:text(Game:locRaw("sheltercutscene_documents_3"), "sad")
end;
gatewayEnter = function(cutscene, event)
    if Plot:isBefore("gateway_enter") then
        local kris = assert(cutscene:getCharacter("kris"))
        local susie = cutscene:getCharacter("susie") or kris
        local noelle = cutscene:getCharacter("noelle") or susie
        Kristal.Console:log("device_used")   
        cutscene:setSpeaker(susie)
        cutscene:text(Game:locRaw("sheltercutscene_gateway_enter_1"), "neutral_side")
        cutscene:text(Game:locRaw("sheltercutscene_gateway_enter_2"), "nervous")
        cutscene:text(Game:locRaw("sheltercutscene_gateway_enter_3"), "neutral")
        cutscene:text(Game:locRaw("sheltercutscene_gateway_enter_4"), "neutral_side")
        cutscene:text(Game:locRaw("sheltercutscene_gateway_enter_5"), "smile") 
        SetPlot("gateway_enter")
    end;
end;
firstTerminal = function(cutscene)
    if Plot:isBefore("gateway_terminal1") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("sheltercutscene_first_terminal_1"), "nervous")
        cutscene:text(Game:locRaw("sheltercutscene_first_terminal_2"), "smile") 
        cutscene:setSpeaker()
        Assets.playSound("item")
        cutscene:text(Game:locRaw("sheltercutscene_first_terminal_3"))
		SetPlot("gateway_terminal1")
    end
end,
finalTerminal = function(cutscene)
    if Plot:isBefore("gateway_lockdown_off") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
		cutscene:setSpeaker(susie)
		cutscene:text(Game:locRaw("sheltercutscene_final_terminal_1"), "nervous")
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_2"), "smile") 
        cutscene:setSpeaker()
        Assets.playSound("item")
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_3"))
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_4"))
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_5"))
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_6"))
        cutscene:text(Game:locRaw("sheltercutscene_final_terminal_7"))
        SetPlot("gateway_lockdown_off")
    end
end,
getHeal = function(cutscene)
    if Plot:isBefore("gateway_lockdown_off") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
        Assets.playSound("item")
        cutscene:text(Game:locRaw("sheltercutscene_get_heal_1"))
        cutscene:text(Game:locRaw("sheltercutscene_get_heal_2"))
    end
end;
}