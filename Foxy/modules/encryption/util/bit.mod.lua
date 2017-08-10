local root 			= game:GetService("ServerScriptService"):WaitForChild("Foxy");
local module		= root.modules:WaitForChild("encryption");
local application 	= module:WaitForChild("modules"):WaitForChild("bitnumber");

if application then
	local e 		= require(application);
	if e.rol and not e.lrotate then
		e.lrotate 	= e.rol
	end
	if e.ror and not e.rrotate then
		e.rrotate 	= e.ror
	end 
	return e;
else 
	error("[Foxy] Could not find a valid byte library. Please use the Plugin to install the correcy package.", 2);
end 
