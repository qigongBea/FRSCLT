---@class Chapter6Intro: Object
---@overload fun(...): Chapter6Intro
local Chapter6Intro, super = Class(Object)

function Chapter6Intro:init()
    super.init(self)
    self.logo_texture = Assets.getTexture("objects/bumper/deltarunelogo")
    self.gonerbg = AdvancedGonerBackground()
    self.gonerbg.initialized = true
    self.gonerbg.alpha = 1.8
    self:addChild(self.gonerbg)
    self.gonerbg:addFX(MaskFX(self))
    self.sound = love.audio.newSource(Assets.getMusicPath("bumper"), "stream")
    self.timer = self:addChild(Timer())
    
    self.palette_shader = Assets.newShader("palette")
    self.palette_shader:send("base_palette", {1,1,1,1}, {1,0,0,1})
    self.palette_shader:send("live_palette", {51/255, 8/255, 46/255, 1}, {176/255, 50/255, 70/255, 1})
    
    self.wave_shader = love.graphics.newShader([[
        extern number wave_sine;
        extern number wave_mag;
        extern number wave_height;
        extern vec2 texsize;
        vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
        {
            number i = texture_coords.y * texsize.y;
            number v = texture_coords.x * texsize.x;
            vec2 coords = vec2(texture_coords.x + (sin((i / wave_height) + (wave_sine / 30.0)) * wave_mag) / texsize.x, texture_coords.y + (sin((v / wave_height) + (wave_sine / 30.0)) * wave_mag) / texsize.y);
            return Texel(texture, coords) * color;
        }
    ]])

    self.text_chapter6 = {"CHAPTER"," 6"}
    self.text_chapter6_prog = 0
    self.orange = false
    self.font = Assets.getFont("main", 32)

    self.wave_mag = 400
    self.logo_alpha = 0
    
    local pad = 600
    self.canvas = love.graphics.newCanvas(self.logo_texture:getWidth() + pad, self.logo_texture:getHeight() + pad)
end

function Chapter6Intro:onAddToStage(stage)
    super.onAddToStage(self, stage)
    love.window.setTitle("")
    
    self.timer:tween(18, self, {wave_mag = 0, logo_alpha = 1}, "out-sine")
    
    self.timer:script(function (wait)
        local function waitmus(bar, beat)
            while (((self.sound:tell()/(60/130))/4)+1) < bar + (beat/4) do
                wait(0)
            end
        end
        wait(2)
        self.sound:play()
        waitmus(10, 1.5)
        self.gonerbg.visible = false
        self.visible = false
        waitmus(10, 2)
        self.visible = true
        self.orange = true
        love.window.setTitle("DELTARUNE")
        waitmus(10, 2.5)
        self.text_chapter6_prog = 1
        love.window.setTitle("DELTARUNE Chapter")
        waitmus(10, 3)
        self.text_chapter6_prog = 2
        love.window.setTitle("DELTARUNE Chapter 6")
    end)
end

function Chapter6Intro:drawMask()
    local old_alpha = self.logo_alpha
    if not self.gonerbg.visible then
        self.logo_alpha = 1
    end
    self:drawLogo()
    self.logo_alpha = old_alpha
end

function Chapter6Intro:drawLogo(x, y)
    local ox, oy = self.logo_texture:getWidth()/2, self.logo_texture:getHeight()
    local cx, cy = self.canvas:getWidth()/2, self.canvas:getHeight()/2 + (self.logo_texture:getHeight()/2)
    
    self.canvas:renderTo(function()
        love.graphics.clear(0,0,0,0)
        Draw.draw(self.logo_texture, cx, cy, 0, 1, 1, ox, oy)
    end)

    love.graphics.setShader(self.wave_shader)
    self.wave_shader:send("wave_sine", Kristal.getTime() * 20)
    self.wave_shader:send("wave_mag", self.wave_mag)
    self.wave_shader:send("wave_height", 40)
    self.wave_shader:send("texsize", {self.canvas:getWidth(), self.canvas:getHeight()})
    
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(r, g, b, a * self.logo_alpha)
    Draw.draw(self.canvas, (SCREEN_WIDTH/2) + (x or 0), (SCREEN_HEIGHT/2) + (y or 0), 0, 2, 2, cx, cy)
    love.graphics.setColor(r, g, b, a)
    love.graphics.setShader()
end

function Chapter6Intro:drawPartialText(x, y, sx, sy, ox, group, progress)
    love.graphics.push()
    love.graphics.translate(x, y)
    love.graphics.scale(sx, sy)
    local full_text = table.concat(group, "")
    local visible_text = table.concat(group, "", 1, progress)
    local text_width = self.font:getWidth(full_text)
    love.graphics.print(visible_text, -text_width*ox, 0)
    love.graphics.pop()
end

function Chapter6Intro:draw()
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setFont(self.font)
    if self.orange then
        Draw.setColor(1, 177/255, 94/255)
        local offsets = {-6, 0, 6}
        for _, ox in ipairs(offsets) do
            for _, oy in ipairs(offsets) do
                if ox ~= 0 or oy ~= 0 then
                    self:drawLogo(ox, oy)
                end
            end
        end
        love.graphics.setShader(self.palette_shader)
        Draw.setColor(1, 1, 1)
        self:drawLogo()
        love.graphics.setShader()
    else
        Draw.setColor(1, 1, 1)
        self:drawLogo()
    end
    self:drawPartialText(SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)+10, 2, 2, 0.5, self.text_chapter6, self.text_chapter6_prog)
    super.draw(self)
end

return Chapter6Intro