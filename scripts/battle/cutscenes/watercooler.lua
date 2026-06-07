return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    actcool = function(cutscene, battler, enemy)
        local offsets = {
            kris = {0, 0},
            susie = {0, 3},
            ralsei = {7, 0},
            ceroba = {-2, -3},
        }
        for _,battler in ipairs(Game.battle.party) do
            battler.start_x = battler.x
            battler.start_y = battler.y
            local offset = offsets[battler.chara.id] or {0, 0}
            battler:setCustomSprite("party/" .. battler.chara.id:lower() .. "/light/walk/right_1", offset[1] or 0, offset[2] or 0)
        end
        if Game.battle.party[1] then
            Game.battle.party[1].x = enemy.x - 70
            Game.battle.party[1].y = enemy.y - 50
        end
        if Game.battle.party[2] then
            Game.battle.party[2].x = enemy.x - 130
            Game.battle.party[2].y = enemy.y
        end
        if Game.battle.party[3] then
            Game.battle.party[3].x = enemy.x - 80
            Game.battle.party[3].y = enemy.y + 50
        end
        cutscene:text(Game:locRaw("watercooler_actcool_1"))
        enemy:addMercy(25)
        cutscene:text(Game:locRaw("watercooler_actcool_2"))
        for _,battler in ipairs(Game.battle.party) do
            battler.x = battler.start_x
            battler.y = battler.start_y
            battler:resetSprite()
        end
    end,

    flirt = function(cutscene, battler, enemy)
        local chance = love.math.random(1,3)
        if chance == 1 then
            cutscene:text(Game:locRaw("watercooler_flirt_1"))
        end
        if chance == 2 then
            cutscene:text(Game:locRaw("watercooler_flirt_2"))
        end
        if chance == 3 then
            cutscene:text(Game:locRaw("watercooler_flirt_3"))
        end

        if Game.party[2].health < 1 or (Game.party[2].health < 1 and Game.party[3].health < 1) then --there's probably a better way to check this
            enemy:addMercy(14)
        else
            enemy:addMercy(10)
        end

        Assets.playSound("bell_bounce_short")
        enemy.pinkflash = Sprite("battle/enemies/watercooler/spared", enemy.x, enemy.y)
        enemy.pinkflash:setOrigin(0.5, 1)
        enemy.pinkflash:setScale(2)
        Game.battle.timer:after(20/30, function()
            enemy.pinkflash:fadeOutAndRemove(10/30)
        end)
        enemy.pinkflash.layer = enemy.layer + 1
        Game.battle:addChild(enemy.pinkflash)
        local flash = FlashFade("battle/enemies/watercooler/spared", enemy.x, enemy.y)
        flash:setOrigin(0.5, 1)
        flash.layer = enemy.layer + 2
        flash:setScale(2)
        Game.battle:addChild(flash)
        cutscene:text(Game:locRaw("watercooler_flirt_4"))
        for _,battler in ipairs(Game.battle.party) do
            battler:resetSprite()
        end
    end
}