local root 			= game:GetService("ServerScriptService"):WaitForChild("Foxy");
local module		= root.modules:WaitForChild("encryption");
local application 	= module:WaitForChild("modules"):WaitForChild("bitnumber");

if application then 
	return require(application);
else 
	error("[Foxy] Could not find a valid byte library. Please use the Plugin to install the correcy package.", 2);
end 
