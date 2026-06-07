---@type table<string, fun(cutscene:PongCutscene,...)>
local pirates = {
    start = function (cutscene)
        cutscene:text([=[
[miniface:ralsei]Yer ship ain't made to take all
these cannonballs!
]=], nil, "pirates/ralsei")

        cutscene:text(Game:locRaw("pirates_start_1"), nil, "pirates/kris")

        cutscene:text(Game:locRaw("pirates_start_2"), "smile", "susie")

        cutscene:text(Game:locRaw("pirates_start_3"))

        cutscene:text(Game:locRaw("pirates_start_4"), "teeth_b", "susie")
        cutscene:text(Game:locRaw("pirates_start_5"), "teeth", "susie")

        cutscene:text(Game:locRaw("pirates_start_6"))
        cutscene:text(Game:locRaw("pirates_start_7"))
        cutscene:text(Game:locRaw("pirates_start_8"))
        cutscene:text(Game:locRaw("pirates_start_9"))
        cutscene:text(Game:locRaw("pirates_start_10"))
        cutscene:text(Game:locRaw("pirates_start_11"), nil, nil, {auto=true})

        cutscene:text(Game:locRaw("pirates_start_12"), "teeth", "susie")
        cutscene:text(Game:locRaw("pirates_start_13"), "teeth_b", "susie")

        cutscene:text(Game:locRaw("pirates_start_14"))
        cutscene:text(Game:locRaw("pirates_start_15"))
        
    end,

    playerGetHitA = function (cutscene)
        cutscene:text(Game:locRaw("pirates_playerGetHitA_1"), "angry", "susie")
        cutscene:text([=[
[miniface:noelle]YAAAHAHAHAHA
]=], nil, "pirates/noelle")

        cutscene:text([=[
[miniface:noelle]I'll be so glad to watch ye ship 
sink down below...
]=], nil, "pirates/noelle")

cutscene:text([=[
[miniface:susie]DID YA SEE THAT CAPTAIN?
[miniface:susie]I HIT EM,[wait:5] I JUST HIT EM!
]=], nil, "pirates/susie")
cutscene:text([=[
[miniface:ralsei]Aye I saw it, I saw it! 
[miniface:ralsei]Now KEEP SHOOTING AT THEM!!!
]=], nil, "pirates/ralsei")

    end,
    playerGetHitB = function (cutscene)
        cutscene:text(Game:locRaw("pirates_playerGetHitB_1"), "teeth", "susie")
        cutscene:text([=[
[miniface:noelle]YAAAHAHAHAHA,[wait:5]
[miniface:noelle]WE'RE WINNIN'!
]=], nil, "pirates/noelle")

cutscene:text([=[
[miniface:susie]DID YA SEE THAT CAPTAIN?[wait:5]
[miniface:susie]I HIT EM AGAIN,[wait:5] I HIT EM AGAIN!
]=], nil, "pirates/susie")
cutscene:text([=[
[miniface:ralsei]Aye,[wait:5] for the last time,[wait:5] I saw it![wait:5]
[miniface:ralsei]Just one more hit,[wait:5] scallywag!
]=], nil, "pirates/ralsei")

    end,
    
    enemyGetHitA = function (cutscene)
        cutscene:text(Game:locRaw("pirates_enemyGetHitA_1"), "teeth", "susie")
        cutscene:text([=[
[miniface:ralsei]Yarghhh,[wait:5] tis' but a scratch!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]Me ship has taken worse blows 
before!
]=], nil, "pirates/ralsei")
    end,

    enemyGetHitB = function (cutscene)
        cutscene:text([=[
[miniface:kris]Watch out Cap'n!
[miniface:ralsei]Calm down![wait:10] Calm down!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]Me ship ain't going down just yet!!
[miniface:ralsei]YAHAHA-[wait:5] huh
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]Is that-[wait:10]
[miniface:ralsei]SCALLYWAG,[wait:5] THE SHIP IS LEAKING!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT!
[miniface:ralsei]THE SHIP IS LEAKING!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT?!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]THE SHIP
[miniface:ralsei]IS BLOODY LEAKING!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT
[miniface:ralsei]FOR GOODNESS SAKE!!!!!!!!!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]It don't matter,[wait:5] we can 
keep going on a little more...
]=], nil, "pirates/ralsei")
    end,


    victory = function (cutscene)
        cutscene:text([=[
[miniface:ralsei]NO!!!!!
[miniface:ralsei]THIS CAN'T BE HAPPENING!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]ME SHIP, ME PRECIOUS SHIP!
]=], nil, "pirates/ralsei")
        cutscene:text(Game:locRaw("pirates_victory_1"), "teeth_smile", "susie")
        cutscene:text([=[
[miniface:ralsei]Don't ye see what ye have done!?[wait:10]
[miniface:ralsei]Ye stressing me parrot out!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:susie]DON'T WORRY BOSS IM HERE WITH YE
]=], nil, "pirates/susie")
cutscene:text([=[
[miniface:susie]EVEN THO YE MAROONED ME THAT ONE
TIME
]=], nil, "pirates/susie")
        cutscene:text([=[
[miniface:noelle]Would never ditch ye,[wait:5] Captain![wait:10]
[miniface:kris]Damn it!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:noelle]We were SO CLOSE!!!!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]There ain't nothing to do about
it now,[wait:5] me hearties...        
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]A good captain goes down with
his ship...
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]And so does a good crew...
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[image:face/mini/pirates/kris_1][image:face/mini/pirates/susie_1][image:face/mini/pirates/noelle_1] Aye aye, Captain...
[miniface:ralsei]Aye aye...
]=], nil, "pirates/ralsei")
    end,


    losery = function (cutscene)
        cutscene:text(Game:locRaw("pirates_losery_1"), "shock", "susie")
    end,
    ---@param losing_paddle PongPaddle?
    preroundstart = function (cutscene, losing_paddle)
        local player_won = losing_paddle == cutscene.game.left_paddle
        local player_hp = cutscene.game.right_paddle.health
        local enemy_hp = cutscene.game.left_paddle.health
        
        if not losing_paddle then
            cutscene:gotoCutscene("pirates.start")
        elseif player_won then
            if enemy_hp == 2 then
                cutscene:gotoCutscene("pirates.enemyGetHitA")
            elseif enemy_hp == 1 then
                cutscene:gotoCutscene("pirates.enemyGetHitB")
            end
        else
            if player_hp == 2 then
                cutscene:gotoCutscene("pirates.playerGetHitA")
            elseif player_hp == 1 then
                cutscene:gotoCutscene("pirates.playerGetHitB")
            end
        end
    end,


    ---@param losing_paddle PongPaddle?
    game_end = function (cutscene, losing_paddle)
        local player_won = losing_paddle == cutscene.game.left_paddle
        if player_won then
            cutscene:text([==[
[miniface:pirates/susie]fuck
[miniface:pirates/ralsei]fuck
]==])
            cutscene:text([==[
[miniface:pirates/noelle]fuck
[miniface:pirates/kris]fuck
]==])
            cutscene:text(Game:locRaw("pirates_game_end_1"), "sincere_smile", "susie")
        else
            cutscene:text(Game:locRaw("pirates_game_end_2"), "agitated", "susie")
        end
    end,
}

return pirates