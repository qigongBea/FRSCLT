return {
    susie_punch = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("dummy_susie_punch_1"))

        -- Hurt the target enemy for 1 damage
        Assets.playSound("damage")
        enemy:hurt(1, battler)
        -- Wait 1 second
        cutscene:wait(1)

        -- Susie text
        cutscene:text(Game:locRaw("dummy_susie_punch_2"), "nervous_side", battler.actor.id)

        if cutscene:getCharacter("ralsei") then
            -- Ralsei text, if he's in the party
            cutscene:text(Game:locRaw("dummy_susie_punch_3"), "blush_pleased", "ralsei")
        end
    end
}