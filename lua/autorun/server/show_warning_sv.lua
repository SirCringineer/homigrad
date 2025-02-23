util.AddNetworkString("ShowWelcomeWindow")

-- Check if the player has already joined the server before
hook.Add("PlayerInitialSpawn", "hg_WelcomeWindow", function(ply)
	if ply:IsBot() then return end

	local window_file = "homigrad/window_showed.txt"
	if not file.Exists(window_file, "DATA") then file.Write(window_file, "{}") end

	local window_file_content = file.Read(window_file, "DATA")
	local tbl = util.JSONToTable(window_file_content)

	if not tbl[ply:SteamID64()] then
		tbl[ply:SteamID64()] = true

		-- Send net message to client to show window
		net.Start("ShowWelcomeWindow")
		net.Send(ply)

		-- Add info that player saw the window
		file.Write(window_file, util.TableToJSON(tbl))
	end
end)