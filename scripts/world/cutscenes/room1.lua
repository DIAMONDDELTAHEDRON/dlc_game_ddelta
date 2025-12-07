return {
    read = function(cutscene, event)
        cutscene:text("* Welcome to .[wait:10]\n* Just have some good ol' fun.")
        cutscene:text("* Feel free to add what you like to this dlc.")
        cutscene:text("* If you need help with sprites, message SadDiamondMan.")
        cutscene:text("* Enjoy.")
        --* Welcome to plug'n play.
        --* Welcome to the game corner.
        --* Welcome to the play area.
        --* Welcome to the prize corner.
        --* Games. Unlimited Games. But no more Games
    end,
    ---@param cutscene WorldCutscene
    ramb = function(cutscene, event)
        local rambhello = Game:getFlag("rambhelloestokris")
        local player = Game.world.player
        local name = string.lower(player.party)
        local susie = cutscene:getCharacter("susie")
        local len = cutscene:getCharacter("len")
        if rambhello then
            if susie and not Game:hasUnlockedPartyMember("ralsei") then
                local tolerance = Game:getFlag("lenrambtalk")
                if name == "len" and tolerance then
                    if tolerance >= 1 and tolerance < 10 then
                        cutscene:text("* (That won't work with Susie on the party)", "neutral_opened_b", len)
                    elseif tolerance >= 10 and tolerance < 20 then
                        cutscene:text("* (...)", "neutral_opened_b", len)
                    elseif tolerance >= 20 and tolerance < 30 then
                        cutscene:text("* (???)", "neutral_opened_b", len)
                    elseif tolerance >= 30 and tolerance < 40 then
                        cutscene:text("* (You won't get anything from this)", "neutral_opened_b", len)
                    elseif tolerance == 50 then
                        Assets.playSound("boowomp")
                        cutscene:text("* (You got the annoying sound...[wait:20] whoops!)")
                    end
                    Game:addFlag("lenrambtalk", 1)
                    return
                end
                cutscene:text("* We don't have time for this![wait:3]\n* We need to find Ralsei!", "teeth_b", susie)
                if name ~= "len" then return end
                Game:addFlag("lenrambtalk", 1)
                return
            end
            cutscene:text("* What's up,[wait:1] luv?")
            local choice = cutscene:choicer({"This place", "The roaring", "Kris", "Nevermind"})
            if choice == 1 then
                cutscene:text("* This place isn't in its full glory, i know...")
                cutscene:text("* It didn't use to be like this before...")
                cutscene:text("* All i remember is waking up on the counter with this eeiry dark feeling in the air...")
                cutscene:text("* I explored the rooms but there's not a lot in here...")
                cutscene:text("* Who knows what's it going to be of this place in the future")
            elseif choice == 2 then
                cutscene:text("* The roaring?\n * Is that some kind of band?")
                cutscene:text("* Seriously tho, the sound of fountains was audible even from the green room...")
                cutscene:text("* Aside from that,[wait:1] i don't remember anything else\n")
                cutscene:text("* Well except for this dark room...[wait:3]\nit was a really [color:yellow]Dark Place[color:reset]")
                cutscene:text("* ... All i can remember from that place is the darkness")
                cutscene:text("* Shortly after,[wait:3] i woke up.[wait:5] this [color:yellow]Dark Place[color:reset] [wait:2]really has its [color:yellow]Legacy[color:reset] [wait:2]huh?")
            elseif choice == 3 then
                cutscene:text("* Kris?")
                cutscene:text("* Why don't you ask them how they're like?")
                if not Game:hasUnlockedPartyMember("Kris") then
                    cutscene:text("* ...When you find them,[wait:1] that is")
                end
            elseif choice == 4 then
                cutscene:text("* Take care, luv")
            end
            return
        end

        if name == "len" then
            cutscene:text("* You look a lot like someone i know...")
            cutscene:text("* You're [color:blue]" .. name .. "[color:reset] right?")
            cutscene:text("* Do you happen to know Kris by any chance?")
            if susie then
                cutscene:text("* Hey! i remember you", "surprise", susie)
                cutscene:text("* Ramb right?", "surprise_smile", susie)
                cutscene:text("* Man i can't believe you actually sur-[auto=true]", "smile", susie)
                cutscene:text("* Uh didn't die", "sus_nervous", susie)
                cutscene:text("* I remember you too,\nyou played those tenna games with Kris right?")
                cutscene:text("* Yeah, Ralsei was there too", "small_smile", susie)
                if not Game:hasUnlockedPartyMember("ralsei") then
                    cutscene:text("* ...[wait:3]Talking about Ralsei,\ndo you know where he is at?", "neutral", susie)
                    cutscene:text("* Nope,[wait:2] i've been all alone here by myself...[wait:5] and that dummy")
                    cutscene:text("* Damn so he's not here either...", "annoyed_down", susie)
                    cutscene:text("* ...[wait:5] Lets move,[wait:2] maybe we can find any clues of his wherabouts", "neutral", susie)
                else
                    cutscene:text("* Good times...", "sincere_smile", susie)
                    cutscene:text("* ...[wait:5]Well,[wait:3] if we ignore the fact that we were force to play", "nervous", susie)
                    cutscene:text("* Tenna's game's were never fun to play...")
                    cutscene:text("* True,[wait:7] true...", "sincere_smile", susie)
                    cutscene:text("* ...[wait:5]Arright, we should get going", "sincere_smile", susie)
                end
            else
                local choice = cutscene:choicer({"Yes", "No"})
                if choice == 1 then
                    cutscene:text("* Ah[wait:1] so you must be a friend")
                    cutscene:text("* Kris has been making a lot of friends lately...")
                    cutscene:text("* You don't look like you're having too much fun in here either,")
                    cutscene:text("* if only you could see them play...")
                    cutscene:text("* I've never seen them[wait:2] soo [wait:2]focused[wait:2] on a game...")
                else
                    cutscene:text("* Im sure you'll meet them soon[wait:1]\nbecause after all...[wait:2] what's a game without a good challenge?")
                end
                cutscene:text("* Oh im stuttering again...[wait:1]\njust make yourself at home luv")
            end
        end
        cutscene:text("* Friend or not,[wait:1] you're welcome here")
        if not Game:hasUnlockedPartyMember("Kris") then
            cutscene:text("* ...[wait:6]Also if you happen to see Kris around... ")
            cutscene:text("* Tell them i said hi[wait:1]\n* Ok[wait:2] luv?")
            Game:setFlag("rambhelloestokris", true)
        end
        cutscene:text("* ...")
    end,

    shadow_dude = function(cutscene, event)
        if Game.world.map.wife then
            cutscene:text("* I miss her so much.")
        else
            cutscene:text("* They call me [color:black]Shadow Dude[color:reset].")
            cutscene:text("* My life hasn't been the same ever since my wife left[wait:30] for work this morning.")
            Game.world.map.wife = true
        end
    end,
}
