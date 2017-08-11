local shared 			=	require(game:GetService("ServerScriptService"):WaitForChild("Foxy"):WaitForChild("libraries"):WaitForChild("shared"));

local base 				=	shared.modules.encryption;
local builders 			=	base:WaitForChild("builders");
local builder 			=	require(builders["hmac"]);

-- Try our testcase 
local key 				=	"16813a12f718bc5c620f56944e1abc3ea13ccbac=";
local body 				=	{
							platform = "ios",
							sdk_version = "rest api v2",
							os_version = "ios 8.2"
}
local result 			=	builder:build(key, game:GetService("HttpService"):JSONEncode(body));
print(result);
