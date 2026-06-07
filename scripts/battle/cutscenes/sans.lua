return {
    ---@param cutscene BattleCutscene
    tomorrow = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("sans_tomorrow_1"))

        cutscene:battlerText(enemy, "tomorrow.")

        -- Susie text
        cutscene:setSpeaker("susie")
        cutscene:text(Game:locRaw("sans_tomorrow_2"), "orange/teeth_b")

        cutscene:setSpeaker(nil)
        cutscene:battlerText(enemy, "tomorrow.")
    end
}