---@class ChapterSelect: Object
local ChapterSelect, super = Class(Object)

---@class ChapterSelect.Chapter
---@class ChapterSelect.Intermission
---@field sound string|love.sound
---@field image string|love.Image
---@field unlocked boolean?
---@field instant boolean?
---@field mod string?
---@field name string
---@field index integer
---@field shadow_crystal_flag string
---@field slots ChapterSelect.SaveSlot[]?

---@class ChapterSelect.SaveSlot
---@field normal_file boolean
---@field completion_file boolean
---@field shadow_crystal boolean

function ChapterSelect:init()
    super.init(self,0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
    self.font = Assets.getFont("main")
    self.smfont = Assets.getFont("main",16)
    self:loadChapters()
    self.info = {
        Kristal.getLibConfig("obscurachapters", "infoAuthor") or ("By: " .. (Mod.info.author or "Unknown")),
        Kristal.getLibConfig("obscurachapters", "infoProject") or (
            Mod.info.name .. " " .. (Kristal.getLibConfig("obscurachapters", "infoVersion") or Mod.info.version)
        ),
    }
    self.selected_x = 1
    self.selected_y = 1
    self.heart = Assets.getTexture("player/heart_menu")
    self.scroll = -40
    self.last_scroll_target = self.scroll
    ---@type "SELECT" | "CHAPTER"
    self.state = "SELECT"
    self.star, self.empty_star = unpack(Assets.getFrames("chapters/star"))
    self.timer = self:addChild(Timer())
    self.alpha = 0
    self:fadeTo(1, 1)
    self.scroll_tween = self.timer:tween(1, self, {scroll = 0}, "out-quad", function ()
        self.last_scroll_target = 0
        self:updateScroll()
    end)
    -- create warning overlay
    self.warning = nil
    self.showing_warning = false
end
local intermission_reached = false
local developer_mode = false
function ChapterSelect:loadChapters()
    ---@type ChapterSelect.Chapter[]
    self.chapters = Kristal.getLibConfig("obscurachapters",
        "chapters",
        Kristal.getLibConfig("obscurachapters", "include_example")
    )
    for index, value in ipairs(self.chapters) do
        if type(value.image or "chapters/blank") == "string" then
            value.image = Assets.getTexture(value.image or "chapters/blank") or Assets.getTexture("chapters/blank")
        end
        value.index = value.index or index
        local mod = Kristal.Mods.getMod(value.mod)
        if mod then
            local save_path = "saves/drfc-in-too-deep-restored"
            value.slots = {}
            for i=1,3 do
                local slot = {
                    completion_file = nil ~= love.filesystem.getInfo(save_path.."/completion_"..i..".json"),
                    normal_file = nil ~= love.filesystem.getInfo(save_path.."/file_"..i..".json"),
                    shadow_crystal = false,
                }
                if slot.completion_file then
                    local data = JSON.decode(love.filesystem.read(save_path.."/completion_"..i..".json"))
                    slot.shadow_crystal = (data.flags[value.shadow_crystal_flag or ("shadow_crystal_"..index)])
                end
                table.insert(value.slots, slot)
            end
        end
    end
    for index, value in ipairs(self.chapters) do
        if value.mod and not Kristal.Mods.getMod(value.mod) then
            value.unlocked = false
            value.image = Assets.getTexture("chapters/blank")
            value.name = "- -"
        end
    end
end

function ChapterSelect:updateScroll()
    local duration = Utils.clampMap(self.alpha, 0,1, 1, 0.3)
    local prev_target = self.last_scroll_target
    local target = self:getScrollTarget()
    if prev_target == target then return end
    if self.scroll_tween then
        self.timer:cancel(self.scroll_tween)
        self.scroll_tween = nil
    end
    self.scroll_tween = self.timer:tween(duration, self, {scroll = target}, "out-quint")
    -- self.scroll = Utils.approach(self.scroll, self:getScrollTarget(), DT * 300)
end

function ChapterSelect:getScrollTarget()
    if self.selected_y > #self.chapters then return self.last_scroll_target end
    local scroll_target = self.scroll
    if self.selected_y <= 4 then
        scroll_target = 0
    elseif self.selected_y > #self.chapters - 4 then
        scroll_target = 60 * (#self.chapters - 7)
    else
        scroll_target = 60 * (self.selected_y - 4)
    end
    self.last_scroll_target = scroll_target
    return scroll_target
end

function ChapterSelect:draw()
    super.draw(self)
    local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.graphics.setFont(self.font)
    love.graphics.push()
    love.graphics.translate(49,15-self.scroll)
    for index, value in ipairs(self.chapters) do
        self:setChapterColor(index)
        self:drawChapter(index, value)
        love.graphics.translate(0,60)
    end
    love.graphics.pop()
    Draw.setColor(COLORS.black)
    love.graphics.push()
    -- love.graphics.translate(0, -self.scroll)
    if self.alpha < 1 then
    end
    Draw.rectangle("fill", 0,SCREEN_HEIGHT-52, SCREEN_WIDTH, 52)
    love.graphics.pop()
    if self:setColorSelect(1, #self.chapters + 1) then
        local prev = {love.graphics.getColor()}
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart, 180, 442, 0, 2,2)
        Draw.setColor(prev)
    end
    Draw.printAlign("Quit", 210, 434)
    if self:setColorSelect(2, #self.chapters + 1) then
        local prev = {love.graphics.getColor()}
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart, 322, 442, 0, 2,2)
        Draw.setColor(prev)
    end
    Draw.printAlign("Options", 352, 434)
    love.graphics.push()
    love.graphics.translate(6,1)
    self:drawShadowCrystals()
    love.graphics.pop()
    self:drawVersionInfo()
    Draw.popCanvas()
    Draw.setColor(self:getDrawColor())
    Draw.draw(canvas)
    --if self.showing_warning and self.warning then
        --self.warning:emit("draw")
    --end
end

function ChapterSelect:drawVersionInfo()
    love.graphics.push()
    love.graphics.translate(16,434)
    if intermission_reached then
        Draw.setColor(8/255, 24/255, 0/255, 255/255)
    else
        Draw.setColor(COLORS.gray)
    end
    love.graphics.setFont(self.smfont)
    love.graphics.print(self.info[1])
    local mod_version = Mod.info.version
    love.graphics.print(self.info[2], 0, 16)
    love.graphics.setFont(self.font)
    love.graphics.pop()
end

function ChapterSelect:onAdd(parent)
    super.onAdd(self, parent)
    self:updateShadowCrystals()
end

function ChapterSelect:updateShadowCrystals()
    local blank = {{}, {}, {}}
    self.shadow_slots = {}
    local max_shadow_chapters = 0
    for ch_id, ch in ipairs(self.chapters) do
        local chslots = {}
        table.insert(self.shadow_slots, chslots)
        for slot_id, slot in ipairs(ch.slots or blank) do
            table.insert(chslots, not not slot.shadow_crystal)
            if slot.shadow_crystal then
                max_shadow_chapters = ch_id
            end
        end
    end
    while #self.shadow_slots > max_shadow_chapters do
        table.remove(self.shadow_slots, #self.shadow_slots)
    end
end

function ChapterSelect:drawShadowCrystals()
    Draw.setColor(COLORS.white)
    love.graphics.translate(580 - (#self.shadow_slots * 20),425)
    for ch_id, value in ipairs(self.shadow_slots) do
        for slot_id, slot in ipairs(value) do
            local x,y = ch_id * 20, slot_id * 10
            if slot then
                Draw.draw(Assets.getTexture("chapters/crystal"), x,y)
            else
                Draw.draw(Assets.getTexture("chapters/dot"), x+1,y+3)
            end
        end
    end
end

function ChapterSelect:setColorSelect(x,y)
    if (x == nil or self.selected_x == x) and (y == nil or self.selected_y == y) then
        if intermission_reached then
            Draw.setColor(69/255, 216/255, 0/255, 255/255)
        else
            Draw.setColor(COLORS.yellow)
        end
        return true
    else
        if intermission_reached then
            Draw.setColor(17/255, 53/255, 0/255, 255/255)
        else
            Draw.setColor(COLORS.white)
        end
        return false
    end
end

function ChapterSelect:setChapterColor(y)
    if self.selected_y == y then
        if intermission_reached then
            Draw.setColor(69/255, 216/255, 0/255, 255/255)
        else
            Draw.setColor(COLORS.yellow)
        end
        return true
    elseif self.chapters[y] and self.chapters[y].unlocked == false then
        if intermission_reached then
            Draw.setColor(8/255, 24/255, 0/255, 255/255)
        else
            Draw.setColor(COLORS.gray)
        end
    else
        if intermission_reached then
            Draw.setColor(17/255, 53/255, 0/255, 255/255)
        else
            Draw.setColor(COLORS.white)
        end
        return false
    end
end

function ChapterSelect:onKeyPressed(key)
    if not Kristal.getLibConfig("obscurachapters", "interactable_while_fading") and self.alpha < 1 then
        return
    end
    --if self.showing_warning then
        --self.warning:emit("keypressed", key, false)
        --return
    --end
    if self.state == "SELECT" then
        self:onKeyPressedSelect(key)
    else
        self:onKeyPressedChapter(key)
    end
end

function ChapterSelect:onKeyPressedChapter(key)
    local old_sel_x = self.selected_x
    if Input.is("right", key) then
        self.selected_x = self.selected_x + 1
    elseif Input.is("left", key) then
        self.selected_x = self.selected_x - 1
    end
    self.selected_x = Utils.clamp(self.selected_x, 1, 2)
    if old_sel_x ~= self.selected_x then Assets.playSound("ui_move") end
    if Input.isConfirm(key) and self.selected_x == 1 then
        self:startEnterChapter(self.chapters[self.selected_y])
    elseif Input.isCancel(key) or Input.isConfirm(key) then
        Assets.playSound("ui_cancel")
        self.selected_x = 1
        self.state = "SELECT"
    end
end

---@param chapter ChapterSelect.Chapter
function ChapterSelect:startEnterChapter(chapter)
    local texture = love.graphics.newImage(Draw.captureObject(self, "none"):newImageData())
    local transition = Game.world:addChild(ChapterTransitionEffect(chapter, texture))
    if chapter.instant then
        transition.clock = 1000
    end
    Game.world.music:stop()
    Game.world:closeMenu()
end

function ChapterSelect:isValidSelection()
    return self.chapters[self.selected_y] == nil or self.chapters[self.selected_y].unlocked ~= false
end

function ChapterSelect:close()
    self:remove()
end

function ChapterSelect:onKeyPressedSelect(key)
    local old_sel_x = self.selected_x
    local old_sel_y = self.selected_y
    if Input.is("down", key) then
        repeat
            self.selected_y = self.selected_y + 1
        until self:isValidSelection()
    elseif Input.is("up", key) then
        repeat
            self.selected_y = self.selected_y - 1
        until self:isValidSelection()
    elseif Input.is("left", key) then
        self.selected_x = 1
    elseif Input.is("right", key) then
        self.selected_x = 2
    end
    if self.selected_y ~= (#self.chapters + 1) then
        self.selected_x = 1
    end
    self.selected_y = Utils.clampWrap(self.selected_y, 1, #self.chapters + 1)
    if old_sel_x ~= self.selected_x or old_sel_y ~= self.selected_y then Assets.playSound("ui_move") end
    if Input.isConfirm(key) then
        if self.selected_y <= #self.chapters then
            self:handleChapter(self.selected_y)
        elseif self.selected_x == 1 then
            Assets.playSound("ui_select")
            Game.fader:fadeOut(function()
                if TARGET_MOD and AUTO_MOD_START then
                    love.event.quit(0)
                else
                    Kristal.returnToMenu()
                end
            end, {speed = .5})
            Game.state = "EXIT"
        else
            Assets.playSound("ui_select")
            Game.world:closeMenu()
            Game.world:loadMap("options")
        end
    end
    self:updateScroll()
end

function ChapterSelect:handleChapter(position)
    local chapter = self.chapters[position]
    if chapter.sound and not chapter.mod then
        Assets.stopAndPlaySound(chapter.sound)
        return
    elseif not (chapter.mod or chapter.room) then return end
    Assets.playSound("ui_select")
    self.state = "CHAPTER"
end

---@param index integer
---@param chapter ChapterSelect.Chapter
function ChapterSelect:drawChapter(index, chapter)
    love.graphics.print("Chapter "..chapter.index, 1, 1)
    Draw.draw(chapter.image, 504, -5, 0, 2, 2)
    if self.state == "CHAPTER" and self.selected_y == index then
        local first = self:setColorSelect(1)
        love.graphics.print("Play", 201, 1)
        self:setColorSelect(2)
        love.graphics.print("Do Not", 381,1)
        Draw.setColor(Game:getSoulColor())
        Draw.draw(self.heart, first and 171 or 351, 9, 0, 2,2)
        
    else
        Draw.printAlign(chapter.name, 311, 1, "center")
        Draw.setColor(Game:getSoulColor())
        if self.selected_y == index then
            Draw.draw(self.heart, -29, 9, 0, 2,2)
        end
        love.graphics.scale(1)
    end
    love.graphics.push()
    love.graphics.translate(131, 1)
    Draw.setColor(COLORS.white)
    for index, slot in ipairs(chapter.slots or {}) do
        if slot.completion_file then
            if slot.normal_file then
                Draw.draw(self.star)
            else
                Draw.draw(self.empty_star)
            end
        end
        love.graphics.translate(0, 12)
    end
    love.graphics.pop()
    Draw.setColor({43/255, 43/255, 43/255})
    love.graphics.setLineWidth(2)
    love.graphics.line(-49,49,SCREEN_WIDTH-49,49)
end

-- === PATCH START ===
if developer_mode then
    Kristal.Console:warn("Developer Mode: Press L to toggle Intermission.")
    function ChapterSelect:toggleIntermission()
        intermission_reached = not intermission_reached

        local ch = self.chapters and self.chapters[6]
        if not ch then return end

        if intermission_reached then
            ch.name  = "Intermission"
            ch.image = Assets.getTexture("chapters/ch6.5")
            ch.sound = "rewind"
            Kristal.Console:log("[Forecasted] Intermission Enabled.")
            self:applyIntermissionWhiteout()
            Kristal.Console:log("[Forecasted] Whiteout Enabled.")
        else
            ch.name  = "In Too Deep"
            ch.image = Assets.getTexture("chapters/ch6")
            ch.sound = "ch6"
            Kristal.Console:log("[Forecasted] Intermission Disabled.")
            self:clearIntermissionWhiteout()
            Kristal.Console:log("[Forecasted] Whiteout Cleared.")
        end
    end

    local _old_onKeyPressed = ChapterSelect.onKeyPressed
    function ChapterSelect:onKeyPressed(key)
        if key == "l" then
            self:toggleIntermission()
            return
        end
        _old_onKeyPressed(self, key)
    end
else
    function ChapterSelect:toggleIntermission()
        local save_path = "saves/drfc-in-too-deep-restored"
        local reset_file = love.filesystem.getInfo(save_path .. "/reset.json") ~= nil
        intermission_reached = reset_file

        local ch = self.chapters and self.chapters[6]
        if not ch then return end

        if intermission_reached then
            ch.name  = "Intermission"
            ch.image = Assets.getTexture("chapters/ch6.5")
            ch.sound = "rewind"
            Kristal.Console:log("[Forecasted] Intermission Enabled (Auto).")
            self:applyIntermissionWhiteout()
            Kristal.Console:log("[Forecasted] Whiteout Enabled (Auto)")
        else
            ch.name  = "In Too Deep"
            ch.image = Assets.getTexture("chapters/ch6")
            ch.sound = "ch6"
            Kristal.Console:log("[Forecasted] Intermission Disabled (Auto).")
            self:clearIntermissionWhiteout()
            Kristal.Console:log("[Forecasted] Whiteout Cleared (Auto)")
        end
    end

    -- Automatically call toggleIntermission on init
    local _old_init = ChapterSelect.init
    function ChapterSelect:init(...)
        if _old_init then _old_init(self, ...) end
        self:toggleIntermission()
    end
end

-- Store original data so it can be restored
local original_chapter_data = {}

function ChapterSelect:applyIntermissionWhiteout()
    if not self.chapters then return end

    for i, ch in ipairs(self.chapters) do
        -- Save originals the first time
        if not original_chapter_data[i] then
            original_chapter_data[i] = {
                name  = ch.name,
                image = ch.image,
            }
        end

        if i ~= 7 and i ~= 6 then
            ch.name  = "--"
            ch.image = Assets.getTexture("chapters/whiteout")
            ch.unlocked = false
        elseif i == 7 then
            ch.name  = "DELTARUNE"
            ch.image = Assets.getTexture("chapters/blackout")
        end
    end
end

function ChapterSelect:clearIntermissionWhiteout()
    if not self.chapters then return end

    for i, ch in ipairs(self.chapters) do
        local old = original_chapter_data[i]
        if old then
            if i ~= 6 then
                ch.name  = old.name
                ch.image = old.image
            end
            if i ~= 7 then
                ch.unlocked = true
            else
                ch.unlocked = false
            end
        end
    end
end

-- === PATCH END ===

function ChapterSelect:close()
    self:remove()
end

return ChapterSelect