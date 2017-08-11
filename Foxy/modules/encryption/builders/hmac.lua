local shared 			=  	require(game:GetService("ServerScriptService"):WaitForChild("Foxy"):WaitForChild("libraries"):WaitForChild("shared"));

local base 				= 	shared.modules.encryption;
local lockbox 			=  	require(base.lockbox);

lockbox.bit   			=  	require(base.bit).bit;

-- Import our files
local array 			= 	require(base.util.array)
local stream 			= 	require(base.util.stream)
local base64 			= 	require(base.util.base64)
local hmac 				= 	require(base.mac.hmac)
local sha256 			= 	require(base.digest.sha2_256);

-- Create our Module
local builder 			=	{};

function builder:build(key, body)
	local hmacBuilder = hmac()
		.setBlockSize(64)
		.setDigest(sha256)
		.setKey(array.fromString(key))
		.init()
		.update(stream.fromString(body))
		.finish()
	return base64.fromArray(hmacBuilder.asBytes())
end

return builder;
