local item, super = Class(LightEquipItem, "light/paintbrush")

function item:init(inventory)
    super.init(self)

    -- Display name
    self.name = "Paintbrush"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "It's my paintbrush."

    -- Light world check text
    self.check = Game:locRaw("paintbrush_item_check_1")

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    self.bonuses = {
        attack = 2,
        defense = 0
    }

end

function item:onWorldUse()
    Game.world:showText("* I look at my paintbrush.\n[wait:5]* It inspires me.")
    return false
end




function item:onToss()
    Game.world:startCutscene(function(cutscene)
        if Game.chapter == 1 then
            cutscene:text(Game:locRaw("paintbrush_line43_1"))
        else
            cutscene:text(Game:locRaw("paintbrush_line45_1")..
                          "* I don't want to let it go.")
        end
        cutscene:text(Game:locRaw("paintbrush_line48_1"))

        local dropped
        if Game.chapter == 1 then
            dropped = Game:locRaw("paintbrush_line48_1_opt_1")ceGame:locRaw("paintbrush_line48_1_opt_2")oicer({"No", "Yes"}) == 2
        else
            dropped = Game:locRaw("paintbrush_line48_1_opt_3")enGame:locRaw("paintbrush_line48_1_opt_4")oicer({"Yes", "No"}) == 1
        end

        if dropped then
            Game.inventory:removeItem(self)

            Assets.playSound("bageldefeat")
            cutscene:text(Game:locRaw("paintbrush_line61_1"))
            cutscene:text(Game:locRaw("paintbrush_line62_1"))
            cutscene:text(Game:locRaw("paintbrush_line63_1"))
        else
            cutscene:text(Game:locRaw("paintbrush_line65_1"))
        end
    end)
    return false
end


return item