local function Teleport()
local Lowest = "playing" -- set to "ping" to find the lowest ping server

local HTTPService = game:GetService("HttpService")

local success, servers = pcall(function()
   return HTTPService:JSONDecode(game:HttpGet(
       "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?limit=100"
   )).data
end)

if not success then return end

local server = servers[1]

for i,svr in pairs(servers) do
   if svr[Lowest] < server[Lowest] then
       server = svr
   end
end

game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
