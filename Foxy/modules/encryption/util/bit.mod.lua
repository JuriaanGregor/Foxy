local bitmodule 	= require(game:GetService("ServerScriptService").Foxy.Encryption.modules.bitnumber);
local root 			= game:GetService("ServerScriptService"):WaitForChild("Foxy");
local application	= root:WaitForChild("Encryption");

if application then 
	return require(application.modules.bitnumber);
else 
	error("[Foxy] Could not find a valid byte library. Please use the Plugin to install the correcy package.", 2);
end 

