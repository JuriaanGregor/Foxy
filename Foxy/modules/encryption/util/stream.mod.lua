local root 			=	game:GetService("ServerScriptService"):WaitForChild("Foxy");
local modules 		=	root:WaitForChild("modules");
local base 			=	modules:WaitForChild("encryption");

local Queue 		= 	require(base.util.queue);

local Stream 		= 	{};


Stream.fromString = function(str)
	local i=0;
	return function()
		i=i+1;
		if(i <= string.len(str)) then
			return string.byte(str,i);
		else
			return nil;
		end
	end
end


Stream.toString = function(stream)
	local array = {};
	local i=1;

	local byte = stream();
	while byte ~= nil do
		array[i] = string.char(byte);
		i = i+1;
		byte = stream();
	end

	return table.concat(array,"");
end


Stream.fromArray = function(array)
	local queue = Queue();
	local i=1;

	local byte = array[i];
	while byte ~= nil do
		queue.push(byte);
		i=i+1;
		byte = array[i];
	end

	return queue.pop;
end


Stream.toArray = function(stream)
	local array = {};
	local i=1;

	local byte = stream();
	while byte ~= nil do
		array[i] = byte;
		i = i+1;
		byte = stream();
	end

	return array;
end


local fromHexTable = {};
for i=0,255 do
	fromHexTable[string.format("%02X",i)]=i;
	fromHexTable[string.format("%02x",i)]=i;
end

Stream.fromHex = function(hex)
	local queue = Queue();

	for i=1,string.len(hex)/2 do
		local h = string.sub(hex,i*2-1,i*2);
		queue.push(fromHexTable[h]);
	end

	return queue.pop;
end



local toHexTable = {};
for i=0,255 do
	toHexTable[i]=string.format("%02X",i);
end

Stream.toHex = function(stream)
	local hex = {};
	local i = 1;

	local byte = stream();
	while byte ~= nil do
		hex[i] = toHexTable[byte];
		i=i+1;
		byte = stream();
	end

	return table.concat(hex,"");
end

return Stream;
