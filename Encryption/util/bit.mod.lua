local bitmodule 	= require(game:GetService("ServerScriptService").Foxy.Encryption.modules.bitnumber);
local root 			= game:GetService("ServerScriptService"):WaitForChild("Foxy");
local application	= root:WaitForChild("Encryption");

if application then 
	return require(application.modules.bitnumber);
end 

