hl2dm.GetTeamName = tdm.GetTeamName

local playsound = false
function hl2dm.StartRoundCL()
    playsound = true
end

function hl2dm.HUDPaint_RoundLeft(white)
    local lply = LocalPlayer()
	local name,color = hl2dm.GetTeamName(lply)

	local startRound = roundTimeStart + 7 - CurTime()
    if startRound > 0 and lply:Alive() then
        if playsound then
            playsound = false
            surface.PlaySound("snd_jack_hmcd_deathmatch.mp3")
        end
        lply:ScreenFade(SCREENFADE.IN,Color(0,0,0,220),1,4)

        draw.DrawText( "You Are On Team: " .. name, "HomigradRoundFont", ScrW() / 2, ScrH() / 2, Color( color.r,color.g,color.b,math.Clamp(startRound - 0.5,0,1) * 255 ), TEXT_ALIGN_CENTER )
        draw.DrawText( "HL2 DM", "HomigradRoundFont", ScrW() / 2, ScrH() / 8, Color( 155,155,55,math.Clamp(startRound - 0.5,0,1) * 255 ), TEXT_ALIGN_CENTER )
        draw.DrawText( "Neutralise the enemy team, and take back what's yours!", "HomigradRoundFont", ScrW() / 2, ScrH() / 1.2, Color( 55,55,55,math.Clamp(startRound - 0.5,0,1) * 255 ), TEXT_ALIGN_CENTER )
        return
    end
end