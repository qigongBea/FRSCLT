Before everything:
    This Lib has an "Example Mod" available on the same download page if you want with a French language as example (Assets from the French Deltarune Patch Team at https://deltarune-fr.com/)

    The default lang is "en"/"English"

    This lib support all type of assets, from images to videos and even font.

    There is support with my other lib "XtraControl" (might be a bit weird/junky)

    No Tiles are not translated sadly and some funky things might need to be done for some assets such as in the DarkMenu (see example code).

    A special `StringUtils.lower` and `StringUtils.upper` are provided, lower/upper can be define in the lib config (Some character have already been provided for example/convenience sake)

    I may or may not update the lib to include more predeifned id (I'll update it if necessary)

    The code to switch lib is in optional since you can do whatever you want to make it switch between said lang. (I only provide the canvas (and some paint and ref) not the painting.)


Now, how does it works?

To add a new language:
    Modify the "Game.langAvailable" (in "lib.lua") or set "Game.langAvailable" to add your lang.

Your Lang.json go in and are named:
    lang/<lang_id>.json

The localization command is:
    Game:loc("<default_text>", "<text_id>", "{<var_id> = <var> (See the new command "var" below)})

Translated interaction/NPC are made as such:
    text<x>_<y> = <default_text>
    id<x>_<y>   = <text_id>

Translated assets go in and are named:
    <assets_type>/lang/<lang_id>/<og_assets_path>/<og_assets_name>

Custom command:
    Text: [var:var_id] | (in options) {var = {<var_id> = <var>}}
    Game:concat(str, var) | Alt to the var command.

Some things such as: DarkMenu, Inventory, Spell, PartyMember, Actor, Item, Recruit; have pre-made id that you can check in the hook of this lib and modify them at will.
But if you want they go as follow:
    DarkMenu:
        USE     = use_item
        TOSS    = toss_item
        KEY     = key_item

        Attack:         = attack_stat
        Defense:        = defense_stat
        Magic:          = magic_stat
        (No ability.)   = no_ability_stats

        ???             = no_power_stat

        ON              = on
        OFF             = off

        CONFIG          = config

        Controls        = controls_config
        Simplify VFX    = simp_vfx_config
        Fullscreen      = fullscreen_config
        Auto-Run        = auto_run_config
        Language        = lang_config
        Return to Title = back_title_config
        Back            = back_config

        English         = name

        Function        = function_config
        Key             = key_config
        Button          = button_config
        Gamepad         = gamepad_config
        Binds           = bind_id

        Reset to default    = reset_default_config
        Finish              = finish_config

        ---     = no_item_storage
        POCKET  = pocket_sotrage
        Page    = page_storage

    Inventory:
        * ([color:yellow][var:itemName][color:reset] was added to your [color:yellow][var:destinationName][color:reset].)           = inventory_giveItemTrue 
            var = {itemName = item:getName(), destinationName = destination.name}
        * (You have too many [color:yellow][var:destinationName][color:reset] to take [color:yellow][var:itemName][color:reset].)   = inventory_giveItemFalse
            var = {destinationName = destination.name, itemName = item:getName()}

        * ([color:yellow][var:itemName][color:reset] was added to your [color:yellow]LIGHT ITEMs[color:reset].)                     = inventory_tryGiveLightTrue"
            var = {itemName = item:getName()}
        * (You have too many [color:yellow]LIGHT ITEMs[color:reset] to take [color:yellow][var:itemName][color:reset].)             = inventory_tryGiveLightFalse
            var = {itemName = item:getName()}

        * ([color:yellow][var:itemName][color:reset] was added to your [color:yellow]BALL OF JUNK[color:reset].)                    = inventory_tryGiveDarkTrue
            var = {itemName = item:getName()}
        * (Your [color:yellow]BALL OF JUNK[color:reset] is too big to take [color:yellow][var:itemName][color:reset].)              = inventory_tryGiveDarkFalse
            var = {itemName = item:getName()}

    Data:
        PartyMember:
            self.name               = chara_<id>_name
            LV[var:lv] [var:title]  = chara_getTitle
                var = {lv = self:getLevel(), title = Game:loc(self.title, chara_<id>_title)}
            self.xact_name          = chara_<id>_xactName

        Actor:
            self.name or self.id = actor_<id>_name

        Spell:
            self.name                                   = spell_<id>_name
            self.cast_name or self:getName():upper()    = spell_<id>_castName

            self.description                            = spell_<id>_description
            self.effect                                 = spell_<id>_effect

            * [var:userName] cast [var:castName]!       = spell_castMessage
                var = {userName = user.chara:getName(), castName = self:getCastName()}

        Item:
            * \"[var:name]\" - [var:check] = item_check
                var = {name = self:getName(), check = self:getCheck()[1] or ""}
            * \"[var:name]\" - [var:check] = item_check
                var = {name = self:getName(), check = self:getCheck()}

            * (Recently, seems like weapons can't be thrown away so easily.) = item_tossWeapon

            (Check for special toss variant for the item.)
            * You bid a quiet farewell to the [var:name].                           = item_<id>_toss1 or item_toss1
                var = {name = self:getName()}
            * You put the [var:name] on the ground and gave it a little pat.        = item_<id>_toss2 or item_toss2
                var = {name = self:getName()}
            * You threw the [var:name] on the ground like the piece of trash it is. = item_<id>_toss3 or item_toss3
                var = {name = self:getName()}
            * You abandoned the [var:name].                                         = item_<id>_toss4 or item__toss4
                var = {name = self:getName()}
            * The [var:name] was thrown away.                                       = item_<id>_toss5 or item_toss5
                var = {name = self:getName()}

            self.name                               = item_<id>_name
            self.use_name or self:getName():upper() = item_<id>_useName

            self.description    = item_<id>_description
            self.effect         = item_<id>_effect
            self.check          = item_<id>_check

            [var:typeName]\n[shopName] = item_<id>_shopDesc
                var = {typeName = self:getTypeName(), shopName = Game:loc(self.shop, item_<id>_shopName)}

            * [var:charaName] used the [var:useName]! = item_<id>_battleText or item_battleText
                var = {charaName = user.chara:getName(), useName = self:getUseName()}

            reactions[user_id]              = item_<id>_<user_id>Reaction
            reactions[user_id][reactor_id]  = item_<id>_<user_id>/<reactor_id>Reaction

            ITEM        = itemType_item
            KEYITEM     = itemType_key
            WEAPON      = itemType_weapon
            UNKNOWN     = itemType_unknown

            * (You felt tense.)             = tensionItem_worldUse1
            * (... try using it in battle.) = tensionItem_worldUse2

        Recruit:
            self.name           = recruit_<id>_name
            self.description    = recruit_<id>_description
            self.element        = recruit_<id>_element
            self.like           = recruit_<id>_like
            self.dislike        = recruit_<id>_dislike