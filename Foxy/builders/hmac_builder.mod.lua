-- Setting up the path to the Encryption Application.
local Root				=  game:GetService("ServerScriptService").Foxy.modules.lockbox;
local lockbox 			=  require(Root.lockbox);

lockbox.bit   			=  require(Root.Parent.bit).bit;

-- Import our files
local array 			= require(lockbox.util.array)
local stream 			= require(lockbox.util.stream)
local base64 			= require(lockbox.util.base64)
local hmac 				= require(lockbox.mac.hmac)
local sha256 			= require(lockbox.digest.sha2_256);


-- Create our Module
local Builder 			=	{};

function Builder:build(key, body)
	local hmacBuilder = hmac()
		.setBlockSize(64)
		.setDigest(sha256)
		.setKey(array.fromString(key))
		.init()
		.update(stream.fromString(body))
		.finish()
	return base64.fromArray(hmacBuilder.asBytes())
end

return Builder;
