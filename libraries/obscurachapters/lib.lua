local lib = {}

function lib:init()
    if Kristal.getLibConfig("afilemenu", "hookOverlay") then
        Utils.hook(Kristal.Overlay, "update", function (orig, self)
            local do_orig = true
            if love.keyboard.isDown("escape") and not self.quit_release then
                if Kristal.Config and Kristal.Config["instantQuit"] then
                    if Mod ~= nil then
                        self.quit_release = true
                        if Kristal.getModOption("hardReset") then
                            love.event.quit("restart")
                        else
                            Kristal.returnToMenu()
                        end
                    else
                        love.event.quit()
                    end
                else
                    if self.quit_alpha < 1 then
                        self.quit_alpha = math.min(1, self.quit_alpha + DT / 0.75)
                    end
                    self.quit_timer = self.quit_timer + DT
                    if self.quit_timer > 1.2 then
                        if Game.world and Game.world.map and Game.world.map.id == "chapter_select" then
                            if Kristal.getModOption("hardReset") then
                                love.event.quit("restart")
                            else
                                Kristal.returnToMenu()
                            end
                        else
                            Game:load(nil,nil,true)
                        end
                        self.quit_timer = 0
                        self.quit_alpha = 0
                        self.quit_release = true
                        do_orig = false
                    else
                        self.quit_timer = self.quit_timer - DT
                    end
                end
            else
                self.quit_timer = 0
                if self.quit_alpha > 0 then
                    self.quit_alpha = math.max(0, self.quit_alpha - DT / 0.25)
                end
            end
    
            if self.quit_release and not love.keyboard.isDown("escape") then
                self.quit_release = false
            end
            if do_orig then
                orig(self)
            end
        end)
    end
end

return lib
