---@class WarningScript : Object
local WarningScript, super = Class(Object)

function WarningScript:init()
    super.init(self, 0, 0)

    self.current_warning = "This is a restoration to the discontinued DELTARUNE: Forecasted take. This may not feel \"full\" due to its origin as a non-playable web series, and the fact that this restoration is NOT finished!"

    self.animation_clock = -1
    self.old_time = os.time()
    self.active = false
    self.layer = WORLD_LAYERS["ui"]
end

function WarningScript:onAdd(parent)
    self.active = true
    self.container = Game.world.stage:addChild(Object(0, 0))
    self.container:setScaleOrigin(0.5, 0.5)

    self.alphafx = self.container:addFX(AlphaFX(1))

    local opts = {align="center", width=SCREEN_WIDTH}

    self.text_warn =
        self.container:addChild(Text("DISCLAIMER", 0, 70, opts))

    self.text_contents =
        self.container:addChild(Text(self.current_warning, 0, 100, opts))

    self.text_accept =
        self.container:addChild(Text("", 0, 340, opts))

    self:updateTexts()
end

function WarningScript:update()
    if self.animation_clock > 2 then
        self:remove()
        return
    elseif self.animation_clock >= 0 then
        self.animation_clock = self.animation_clock + DT

        local s = Utils.clampMap(self.animation_clock, 0, 1.3, 1, 0.2)
        self.container:setScale(s)

        self.alphafx.alpha =
            Utils.clampMap(self.animation_clock, 0, 1.3, 1, 0)
    end
end

function WarningScript:updateTexts()
    self.text_accept:setText(
        "Press " ..
        Input.getText("confirm") ..
        (Input.usingGamepad() and "" or " ") ..
        "to accept."
    )
end

function WarningScript:onKeyPressed(key, is_repeat)
    if Input.isConfirm(key) and not is_repeat and self.animation_clock < 0 then
        Assets.stopAndPlaySound("ui_select")
        Assets.stopAndPlaySound("ui_spooky_action")
        self.animation_clock = 0
        return true
    end
end

function WarningScript:draw()
    Draw.setColor(COLORS.black)
    Draw.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
end

function WarningScript:onRemove()
    if self.container then
        self.container:remove()
        self.container = nil
    end
end

return WarningScript
