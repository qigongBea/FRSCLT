return {

    hospitalpiano = function(cutscene, event)

        cutscene:text(Game:locRaw("hometown_hospitalpiano_1"))
        cutscene:text(Game:locRaw("hometown_hospitalpiano_2"))
        cutscene:text(Game:locRaw("hometown_hospitalpiano_3"))
        local opinion = Game:locRaw("hometown_hospitalpiano_3_opt_1")enGame:locRaw("hometown_hospitalpiano_3_opt_2")oicer({"Yes", "No"})
            if opinion == 1 then
                Assets.playSound("piano")
                cutscene:text(Game:locRaw("hometown_hospitalpiano_4"))
            else
                cutscene:text(Game:locRaw("hometown_hospitalpiano_5"))
                
            end
        
    end,

    asgorefridge = function(cutscene, event)
        
        cutscene:text(Game:locRaw("hometown_asgorefridge_1"))
        local opinion = Game:locRaw("hometown_asgorefridge_1_opt_1")"\Game:locRaw("hometown_asgorefridge_1_opt_2")FrGame:locRaw("hometown_asgorefridge_1_opt_3")n't", "See photos"})
            if opinion == 1 then
              cutscene:text(Game:locRaw("hometown_asgorefridge_2"))
            elseif opinion == 3 then 
              cutscene:text(Game:locRaw("hometown_asgorefridge_3"))
              cutscene:text(Game:locRaw("hometown_asgorefridge_4"))
              cutscene:text(Game:locRaw("hometown_asgorefridge_5"))
              cutscene:text(Game:locRaw("hometown_asgorefridge_6"))
            else
              cutscene:text(Game:locRaw("hometown_asgorefridge_7"))  
            end

    end,

    librarybook1 = function(cutscene, event)

      cutscene:text(Game:locRaw("hometown_librarybook1_1"))
      cutscene:text(Game:locRaw("hometown_librarybook1_2"))
      local opinion = Game:locRaw("hometown_librarybook1_2_opt_1")LoGame:locRaw("hometown_librarybook1_2_opt_2")ck", "Look inside"})
        if opinion == 1 then
          cutscene:text(Game:locRaw("hometown_librarybook1_3"))
          cutscene:text(Game:locRaw("hometown_librarybook1_4"))
        else
          cutscene:text(Game:locRaw("hometown_librarybook1_5"))
          cutscene:text(Game:locRaw("hometown_librarybook1_6"))
        end

    end,

    librarybook2 = function(cutscene, event)

      cutscene:text(Game:locRaw("hometown_librarybook2_1"))
      local opinion = Game:locRaw("hometown_librarybook2_1_opt_1")neGame:locRaw("hometown_librarybook2_1_opt_2")r({"Read", "Don't"})
        if opinion == 1 then
          cutscene:text(Game:locRaw("hometown_librarybook2_2"))
          cutscene:text(Game:locRaw("hometown_librarybook2_3"))
          cutscene:text(Game:locRaw("hometown_librarybook2_4"))
          cutscene:text(Game:locRaw("hometown_librarybook2_5"))
        else
          
        end

    end,

    papyrushouse = function(cutscene, event)

      Assets.playSound("knock")
      cutscene:text(Game:locRaw("hometown_papyrushouse_1"))
      cutscene:text(Game:locRaw("hometown_papyrushouse_2"))
      cutscene:text(Game:locRaw("hometown_papyrushouse_3"))

    end,

    sansplin = function(cutscene, event)

      Assets.playSound("bell")

    end,

    iceesoda = function(cutscene, event)

      cutscene:text(Game:locRaw("hometown_iceesoda_1"))
      local opinion = Game:locRaw("hometown_iceesoda_1_opt_1")chGame:locRaw("hometown_iceesoda_1_opt_2")({"Inspect", "Not"})
        if opinion == 1 then
          cutscene:text(Game:locRaw("hometown_iceesoda_2"))
          cutscene:text(Game:locRaw("hometown_iceesoda_3"))
          cutscene:text(Game:locRaw("hometown_iceesoda_4"))
          cutscene:text(Game:locRaw("hometown_iceesoda_5"))
          cutscene:text(Game:locRaw("hometown_iceesoda_6"))
          cutscene:text(Game:locRaw("hometown_iceesoda_7"))
          cutscene:text(Game:locRaw("hometown_iceesoda_8"))
          cutscene:text(Game:locRaw("hometown_iceesoda_9"))
        else

        end

    end

}