--[[
    Web
    ================================================================
    @author             	Velibor (@Velibor at ROBLOX)
    @version            	1.0
    @description        	Web 
    @last edited on     	11 Aug 2017
	@type 					ModuleScript
]]

--[[
	Import
	----------------------------------------------------------------
]]

	-- Require our shared enviroment 
	local shared 		=	require(game:GetService("ServerScriptService"):WaitForChild("Foxy"):WaitForChild("libraries"):WaitForChild("shared"));

	-- Require our Class library 
	local class 		=	require(shared.modules.class);

--[[
	Variables
	----------------------------------------------------------------
]]
	-- Services 
	local HttpService 	=	game:GetService("HttpService");

	-- Tables
	local REQUEST_POOL 	=	{};

--[[
	Functions
	----------------------------------------------------------------
]]

	local function add()
	end 

--[[
	Class
	----------------------------------------------------------------
]]
	
	-- Create our new Web class 
	local web 			=	class("web");

	function web:init(base_url)
	end 

	function web:post(url, body, headers, compressed)
	end 

	function web:get(url, headers)
	end  

	function web:generateId(curly)
		local random 		=	math.random;
		local curly 		=	(type(curly) == "boolean" and curly) or false;
		local template 		=	"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx";
		
		if (not curly) then 
			return string.gsub(template, '[xy]', function(c)
				   local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
	        	   return string.format('%x', v)
			end)
		else 
			return HttpService:GenerateGUID();
		end 
	end 

	function web:encode(data)
		if type(data) == "table" then 
			return HttpService:EncodeJSON(data);
		end 
	end 

	function web:decode(data)
		return HttpService:DecodeJSON(data);
	end 

--[[
	Threads
	----------------------------------------------------------------
]]

--[[
	Return
	----------------------------------------------------------------
]]
	
	return web;