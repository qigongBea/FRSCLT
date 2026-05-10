local WorldCutscene, super = Class(WorldCutscene)

function WorldCutscene:text(text, portrait, actor, options)
    options = options or {}

    if options["var"] then
        text = Game:concat(text, options["var"])
    end

    super.text(self, text, portrait, actor, options)
end

return WorldCutscene