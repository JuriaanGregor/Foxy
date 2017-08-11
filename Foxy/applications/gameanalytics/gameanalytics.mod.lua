--[[
    Gameanalytics.lua
    ================================================================
    @author             	Velibor (@Velibor at ROBLOX)
    @version            	1.0
    @description        	Gameanalytics SDK
    @last edited on     	11 Aug 2017
	@type 					ModuleScript
]]

--[[
	Import
	----------------------------------------------------------------
]]
	
	-- Require our shared enviroment 
	local shared 		=	require(game:GetService("ServerScriptService"):WaitForChild("Foxy"):WaitForChild("libraries"):WaitForChild("shared"));

	-- Require the settings that are required for this application 
	local settings 		=	require(shared.applications.gameanalytics.settings);

	-- Require our Class library 
	local class 		=	require(shared.modules.class);

	-- Require our Web class that allow us to send request to the outside securely :) 
	local web 			=	require(shared.modules.web);

	-- Require our Encryption builder 
	local auth 			=	require(shared.modules.encryption.builders.hmac);

--[[
	Variables
	----------------------------------------------------------------
]]

	local TRACKERS 		=	{};

--[[
	Functions
	----------------------------------------------------------------
]]
	local function init()

		-- TODO Create the remotes needed
		-- TODO Init the main request pool 
	end 

	local function encrypt(body)
		return auth:build(body, shared["AUTH_KEY"])
	end 

	local function prepare(body) 
	end 

	local function add(category, arguments)
		print(string.format("[Tracker] Succesfully added %s", category));
	end 

--[[
	Class
	----------------------------------------------------------------
]]

	-- Create our new Tracker class to keep track of all the Tracks 
	local tracker 			=	class("tracker");

	function tracker:init(userId)

		-- Search or the Tracker is already in the system 
		for _,this in pairs(TRACKERS) do 
			if this["user_id"] == userId then 
				for i,v in pairs(this) do 
					self[i] =	v;
				end 
			end 
		end 

		-- Create a new Tracker 
		self["user_id"]		=	userId
		self["state"]		=	"active"
		self["id"]			=	game:GetService("HttpService"):GenerateGUID()
		self["bucket"]		=	{}

		table.insert(TRACKERS, self);
	end 

	function tracker:__tostring()
		assert(type(self["user_id"]) == "number", "[Foxy - Gameanalytics][self] self is invalid.");

		return string.format("[Tracker - %s] bucket items : %s, state : %s", self.id, #self.bucket, self.state);
	end 

	function tracker:destroy()
		assert(type(self["user_id"]) == "number", "[Foxy - Gameanalytics][self] self is invalid.");	

		for _,this in pairs(TRACKERS) do 
			if this["user_id"] == self["user_id"] then 
				this.state 	=	"removal";
			end 
		end 

		print(string.format("[Foxy] Tracker has been destroyed"))
	end 

	function tracker:add(category, arguments)
		assert(type(self["user_id"]) == "number", "[Foxy - Gameanalytics][self] self is invalid.");	

		-- Only allow events to be added if the state of the tracker is 'active'
		if self.state == "active" then 
			if category == "connected" then
				add("start");
			elseif category == "disconnected" then 
				self["state"]			=	"suspended";
				add("disconnected");
			elseif category == "transaction" then 
				add("transaction", arguments);
			elseif category == "resource" then 
				add("resource", arguments);
			elseif category == "progression" then 
				add("progression", arguments);
			elseif category == "design" then 
				add("design", arguments);
			elseif category == "error" then 
				add("error", arguments);
			end 
		end  
	end 

--[[
	Init 
	----------------------------------------------------------------
]]

	init();

--[[
	Threads
	----------------------------------------------------------------
]]

--[[
	Network
	----------------------------------------------------------------
]]


--[[
	Events
	----------------------------------------------------------------
]]

	game:GetService("Players").PlayerAdded:connect(function(newPlayer)
		local userId 		=	newPlayer.userId;

		-- Create a new Tracker and add a new connected event.
		local track 		=	tracker:new(userId);
		track:add("connected");

		-- Small debug
		print(string.format("[Foxy] Tracker has been created for %s", userId));
	end)

	game:GetService("Players").PlayerRemoving:connect(function(oldPlayer)
		local userId 		=	oldPlayer.userId;

		-- Create a new Tracker and add a disconnect event 
		local track 		=	tracker:new(userId);
		track:add("disconnected");

		-- Send all the remaining data over to GA.
		track:send();

		-- Mark the tracker ready for removal
		track:destroy();
	end)

--[[
	Return
	----------------------------------------------------------------
]]

	return tracker;
