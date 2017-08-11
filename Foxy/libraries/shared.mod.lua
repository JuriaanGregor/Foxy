--[[
	Shared 
	================================================================
	@author 					Velibor (@Velibor on ROBLOX)
	@version 					1.0
	@description				Our general library that list all the shortcuts 
								and services.
	@type 						library
	@last edited on				28 May 2017																	
]]

	return 		{

				-- Services 
				players 				=	game:GetService("Players");
				serverscriptservice 	=	game:GetService("ServerScriptService");
				serverstorage 			=	game:GetService("ServerStorage");
				replicatedstorage 		=	game:GetService("ReplicatedStorage");

				-- Shortcuts 
				root 					=	game:GetService("ServerScriptService"):WaitForChild("Foxy");
				applications 			=	game:GetService("ServerScriptService").Foxy:WaitForChild("applications");
				modules					=	game:GetService("ServerScriptService").Foxy:WaitForChild("modules");
				libraries 				=	game:GetService("ServerScriptService").Foxy:WaitForChild("libraries");
				testcases 				=	game:GetService("ServerScriptService").Foxy:WaitForChild("testcases");
	}