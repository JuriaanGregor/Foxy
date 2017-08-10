local root 			=	game:GetService("ServerScriptService"):WaitForChild("Foxy");
local modules 		=	root:WaitForChild("modules");
local encryption 	=	modules:WaitForChild("encryption");


local array 		= 	require(encryption.util.array);
local stream 		= 	require(encryption.util.stream)
local base64 		= 	require(encryption.util.base64)
local hmac 			= 	require(encryption.mac.hmac)
local sha256 		= 	require(encryption.digest.sha2_256);


-- Create our Module
local builder 		=	{};

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
