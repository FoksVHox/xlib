local multirun_file = "xlib_extended/multirun.lua"
XLIB.Extended = true

if SERVER then
	if XLIB.Extended then
		AddCSLuaFile()
	else
		return
	end

	local lan = GetConVar("sv_lan")
	if lan:GetBool() then
		include(multirun_file)
	end
else
	if file.Exists(multirun_file, "LUA") then
		include(multirun_file)
	end
end

xloader("xlib_extended", function(f) include(f) end)

local devports = {
	["13337"] = true,
	["13338"] = true,
}
function IsTestServer()
	return GetGlobalBool("development_mode") and devports[game.GetIPAddress():Split(":")[2]]
end
