local langLib = {}

function langLib:init()
    Game.langAvailable = {"en", "zh-CN"}  

    local saved_lang = "en"
    if Kristal and Kristal.Config and Kristal.Config["language"] then
        saved_lang = Kristal.Config["language"]
    end
    Game.lang = saved_lang

    Game:loadLang(Game.lang)
end

function langLib:postInit()
    Game.hasXtraConfig = (Utils.getAnyCase(Mod.libs, "xtractrl") and true) or false

    --Assets' hooks:
    --  Font & Texture & Frame
        HookSystem.hook(Assets, "getFont", function(orig, path, size)
            local lang_path = "lang/"..Game.lang.."/"..path
            return orig(lang_path, size) or orig(path, size)
        end)

        HookSystem.hook(Assets, "getTexture", function(orig, path)
            local lang_path = "lang/"..Game.lang.."/"..path
            return orig(lang_path) or orig(path)
        end)

        HookSystem.hook(Assets, "getTextureData", function(orig, path)
            local lang_path = "lang/"..Game.lang.."/"..path
            return orig(lang_path) or orig(path)
        end)

        HookSystem.hook(Assets, "getFrames", function(orig, path)
            local lang_path = "lang/"..Game.lang.."/"..path
            return orig(lang_path) or orig(path)
        end)

        HookSystem.hook(Assets, "getFrameIds", function(orig, path)
            local lang_path = "lang/"..Game.lang.."/"..path
            return orig(lang_path) or orig(path)
        end)


    --  Sound & Music & Video
        HookSystem.hook(Assets, "getSound", function(orig, sound)
            local lang_path = "lang/"..Game.lang.."/"..sound
            return orig(lang_path) or orig(sound)
        end)

        HookSystem.hook(Assets, "newSound", function(orig, sound)
            local lang_path = "lang/"..Game.lang.."/"..sound
            if Assets.sounds[lang_path] then
                return orig(lang_path)
            end
            return orig(sound)
        end)

        HookSystem.hook(Assets, "startSound", function(orig, sound)
            local lang_path = "lang/"..Game.lang.."/"..sound
            return orig(lang_path) or orig(sound)
        end)

        HookSystem.hook(Assets, "stopSound", function(orig, sound, actually_stop)
            local lang_path = "lang/"..Game.lang.."/"..sound
            return orig(lang_path) or orig(sound, actually_stop)
        end)

        HookSystem.hook(Assets, "playSound", function(orig, sound, volume, pitch)
            local lang_path = "lang/"..Game.lang.."/"..sound
            return orig(lang_path) or orig(sound, volume, pitch)
        end)

        HookSystem.hook(Assets, "stopAndPlaySound", function(orig, sound, volume, pitch, actually_stop)
            local lang_path = "lang/"..Game.lang.."/"..sound
            return orig(lang_path) or orig(sound, volume, pitch, actually_stop)
        end)

        HookSystem.hook(Assets, "getMusicPath", function(orig, music)
            local lang_path = "lang/"..Game.lang.."/"..music
            return orig(lang_path) or orig(music)
        end)

        HookSystem.hook(Assets, "getVideoPath", function(orig, video)
            local lang_path = "lang/"..Game.lang.."/"..video
            return orig(lang_path) or orig(video)
        end)

        HookSystem.hook(Assets, "newVideo", function(orig, video, load_audio)
            local lang_path = "lang/"..Game.lang.."/"..video
            if Assets.data.videos[lang_path] then
                return orig(lang_path, load_audio)
            else
                return orig(video, load_audio)
            end
        end)
        
    --UTF8 Upper & UTF8 Lower function
        HookSystem.hook(StringUtils, "upper", function(_, str)
            local accents = Kristal.getLibConfig("lang_lib", "lowerAndUpper", true)

            local result = ""
            for _, codepoint in utf8.codes(str) do
                local char = utf8.char(codepoint)
                local upper_char = accents[char] or char:upper()
                result = result .. upper_char
            end

            return result
        end)

        HookSystem.hook(StringUtils, "lower", function (_, str)
            local old_accents = Kristal.getLibConfig("lang_lib", "lowerAndUpper", true)
            
            local accents = {}
            for id, char in pairs(old_accents) do
                accents[char] = id
            end
            
            local result = ""
            for _, codepoint in utf8.codes(str) do
                local char = utf8.char(codepoint)
                local lower_char = accents[char] or char:lower()
                result = result .. lower_char
            end

            return result
        end)

    HookSystem.hook(Text, "init", function(orig, self, text, x, y, w, h, options)
        options = options or {}
        local variables = options["var"] or {}

        if options["var"] then
            if type(text) == "table" then
                for id, str in pairs(text) do
                    text[id] = Game:concat(str, variables)
                end
            else
                text = Game:concat(text, variables)
            end
        end

        orig(self, text, x, y, w, h, options)
    end)

    HookSystem.hook(BattleCutscene, "text", function(orig, self, text, portrait, actor, options)
        options = options or {}

        text = Game:concat(text, options["var"] or {})

        return orig(self, text, portrait, actor, options)
    end)

    for _, sprite in pairs(Game.stage:getObjects(Sprite)) do
        sprite.texture = Assets.getTexture(sprite.texture_path)
    end
end

function langLib:load(data)
    --Game.lang = data.lang or "en"
    --Game.langSelected = data.langSelected or 1
    Game:loadLang(Game.lang)

    return data
end

function langLib:save(data)
    --data.lang = Game.lang
    --data.langSelected = Game.langSelected
    
    return data
end

---Set the correct the lang dile to get.
---@param lang?      string      The id of the lang to get.
function Game:loadLang(lang)
    Game.langStr = {}

    lang = lang or "en"
    
    Game.lang = lang

    local path, found = "/lang/lang_"..lang..".json", false
    if love.filesystem.getInfo(Mod.info.path..path) then
        path = Mod.info.path..path
        found = true
    elseif love.filesystem.getInfo(langLib.info.path..path) then
        path = langLib.info.path..path --path..bidule
        found = true
    end

    if found then
        Game.langStr = JSON.decode(love.filesystem.read(path))
    end
end

---Get the localised text via an id. (Chapter 2+ accuracy)
---@param default       string      The default string of the text.
---@param id            string      The id of the translated string.
---@param var?          table       A tabl of variables.
---@return string       locStr      The translated string.
function Game:loc(default, id, var)
    if var and var ~= {} then
        return Game:concat(((id and Game.langStr[id]) or default or "---missing-string---"), var)
    end
    return (id and Game.langStr[id]) or default or "---missing-string---"
end

--- Get a localised text via an id. (Chapter 1 accuracy)
---@param id    string          The id od the string to get.
---@return string|nil   locStr  Return the string if found otherwise return nil
function Game:locRaw(id) return Game.langStr[id] or "---missing-string---" end


--- Get if a locolised text exist.
---@param id    string      The id od the string to get.
---@return boolean   hasStr Return the string if found otherwise return nil
function Game:hasStr(id) return Game.langStr[id] and true or false end


---Placed the correct var in a string. (Command: [var:var_id])
---@param str           string      The string to change.
---@param var           table       The table of variables to put. (Format: {var_id = var})
---@return string       concatStr   The string with the variable(s) placed.
function Game:concat(str, var)
    if not str then
        return ""
    end

    if not var or var == {} then
        return str
    end

    local str = str or ""
    local var = var

    local new_str = ""
    local command = ""
    local node = ""
    local is_command = false
    local is_node = false

    for i = 1, StringUtils.len(str) do
        local char = StringUtils.sub(str, i, i)

        if char == "[" then
            if not command == "" or is_command then
                new_str = new_str.."["
                command = ""
            end
            is_command = true


        end

        if not is_command then
            new_str = new_str..char
        else
            if not is_node then
                command = command..char
                if command == "[var:" then
                    is_node = true
                elseif not command == "[var:" then
                    is_command = false
                    is_node = false

                    new_str = new_str..command
                end
            else
                node = node..char
            end
        end
        
        if char == "]" then
            is_command = false
            is_node = false

            if node == "" then
                new_str = new_str..command
            else
                new_str = new_str..(var[StringUtils.sub(node, 1, -2)] or "")
            end

            command = ""
            node = ""
        end
    end
    
    new_str = new_str..((not StringUtils.contains(command, "[[var:]") and command) or "")

    return new_str
end

return langLib