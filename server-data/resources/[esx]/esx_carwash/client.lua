ESX  							= nil
local CurrentAction 			= nil
local CurrentActionMsg 			= ''
local HasAlreadyEnteredMarker 	= false
local LastZone 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for zone, data in pairs(Config.zones) do

			if data.visible then

				if GetDistanceBetweenCoords(coords, data.x, data.y, data.z, true) < 100.0 then
					DrawMarker(
						data.t, 
						data.x, 
						data.y, 
						data.z,						
						0.0, 
						0.0, 
						0.0, 
						0, 
						0.0, 
						0.0, 
						data.w, 
						data.w, 
						data.h, 
						data.color.r, 
						data.color.g, 
						data.color.b, 
						255, 
						false, 
						true, 
						2, 
						false, 
						false, 
						false, 
						false
					)
				end

			end

		end

	end
end)
