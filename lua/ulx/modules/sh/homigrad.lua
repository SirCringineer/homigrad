function ulx.balls(calling_ply, target_plys)
	for i = 1, #target_plys do
		local v = target_plys[i]
		v:SetHealth(v:GetMaxHealth())
	end

	ulx.fancyLogAdmin(calling_ply, "#A healed #T", target_plys)
end

local balls = ulx.command("Fun", "ulx balls", ulx.balls, "!balls")
balls:addParam{
	type = ULib.cmds.PlayersArg
}

balls:defaultAccess(ULib.ACCESS_ADMIN)
balls:help("Heals target(s).")