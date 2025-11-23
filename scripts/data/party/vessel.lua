local character, super = Class(PartyMember, "vessel")

function character:init()
    super.init(self)

    -- Display name
    self.name = "Vessel"

    -- Actor (handles sprites)
    self:setActor("vessel")
    self:setLightActor("vessel_lw")
    if Game.chapter >= 6 and Game.chapter < 7 then
        self:setActor("vessel_mantle")
    end
    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "Creative Mind\nMakes use of\nwhat it's got."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {101/255, 255/255, 183/255}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "V-Action"

    -- Spells
    self:addSpell("heal_prayer")
    self:addSpell("sleep_mist")
    self:addSpell("ice_shock")

    -- Current health (saved to the save file)
    self.health = 230

    -- Base stats (saved to the save file)
    self.stats = {
        health = 230,
        attack = 3,
        defense = 2,
        magic = 0
    }

    -- Max stats from level-ups
    self.max_stats = {
        health = 300
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 1, 0}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {1, 1, 0.3}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {1, 1, 153/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {1, 1, 0}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 1, 0.5}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/vessel/head"
    -- Path to head icons used in battle
    self.head_icons = "party/vessel/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/vessel/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/slap_n"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1.5
    self.color = {200/255, 200/255, 200/255}
    -- Battle position offset (optional)
    self.battle_offset = {0, 0}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil

    -- Character flags (saved to the save file)
    self.flags = {
        ["iceshocks_used"] = 0,
        ["boldness"] = -12
    }
end



return character