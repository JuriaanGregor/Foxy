local root 				=	game:GetService("ServerScriptService"):WaitForChild("Foxy");
local builders 			=	root:WaitForChild("builders");
local builder 			=	require(builders["hmac_builder"]);
local Stream 			=	require(root.modules.encryption.util.stream);

-- Try our testcase 
local key 				=	"16813a12f718bc5c620f56944e1abc3ea13ccbac=";
local body 				=	{
							platform = "ios",
							sdk_version = "rest api v2",
							os_version = "ios 8.2"
}
local result 			=	builder:build(key, game:GetService("HttpService"):JSONEncode(body));
print(result);
