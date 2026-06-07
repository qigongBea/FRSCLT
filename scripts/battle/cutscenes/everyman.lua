return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    talk = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("everyman_talk_1"), "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text(Game:locRaw("everyman_talk_2"))

        enemy.hidden_mercy = enemy.hidden_mercy + 1
    end,
    talk2 = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("everyman_talk2_1"))
    end,
    directive = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("everyman_directive_1"), "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text(Game:locRaw("everyman_directive_2"))
        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.text = {
                "* The Guard seems to be at ease."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT ?? DF 0 \n* It's forgotten who it once was."
            attacker:setAnimation("grow")
        end
    end,
    failed = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text(Game:locRaw("everyman_failed_1"), "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text(Game:locRaw("everyman_failed_2"))
    end,
    cry = function(cutscene, battler, enemy)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text(Game:locRaw("everyman_cry_1"))
        cutscene:text(Game:locRaw("everyman_cry_2"))
        cutscene:text(Game:locRaw("everyman_cry_3"))

        enemy.hidden_mercy = enemy.hidden_mercy + 1
    end,
    comfort = function(cutscene, battler, enemy)
        
        cutscene:text(Game:locRaw("everyman_comfort_1"), "smile", "ralsei")

        Assets.playSound("bump")
        enemy:shake(2, 2)
        
        cutscene:text(Game:locRaw("everyman_comfort_2"), "smile_b", "ralsei")

        Assets.playSound("bump")
        enemy:shake(2, 2)

        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.name = "Strangeman"
            attacker.text = {
                "* Strangeman seems comforted."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT 20 DF 0 \n* It still has no mouth but it is happy."
            attacker:setAnimation("grow")
        end

        cutscene:text(Game:locRaw("everyman_comfort_3"))

    end,
}