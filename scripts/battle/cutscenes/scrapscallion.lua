---@type table<string, fun(cutscene:BattleCutscene, battler:PartyBattler?, enemy:EnemyBattler?)>
local scrapscallion = {
    susie_punch = function (cutscene, battler, enemy)
        cutscene:text(Game:locRaw("scrapscallion_susie_punch_1"))
        Assets.playSound("damage")
        enemy:shake()
        enemy:addMercy(4)
        cutscene:wait(1)
        cutscene:text(Game:locRaw("scrapscallion_susie_punch_2"))
    end
}

return scrapscallion