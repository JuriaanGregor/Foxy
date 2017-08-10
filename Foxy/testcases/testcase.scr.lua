local root 				=	game:GetService("ServerScriptService"):WaitForChild("Foxy");
local builders 			=	root:WaitForChild("builders");
local builder 			=	require(builders["hmac_builder"]);
local Stream 			=	require(root.modules.encryption.util.stream);

-- Try our testcase 
local key 				=	"key";
local body 				=	"Hello world";
local result 			=	builder:build(key, body);
print(result);
