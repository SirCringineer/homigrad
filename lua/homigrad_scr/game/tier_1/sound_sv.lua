-- As useless as sound_cl.lua
util.AddNetworkString("sound")
util.AddNetworkString("sound surface")

function sound.Emit(ent, sndName, level, volume, pitch, ignorePly, dsp)
	net.Start("sound")
	net.WriteTable({sndName, ent:GetPos(), ent:EntIndex(), level, volume, pitch, dsp})

	if ignorePly then net.SendOmit(ignorePly)
	else net.Broadcast() end
end


function sound.EmitSurface(ply, sndName)
	net.Start("sound surface")
		net.WriteString(sndName)
	net.Send(ply)
end