ESX  							= nil
local CurrentAction 			= nil
local CurrentActionMsg 			= ''
local HasAlreadyEnteredMarker 	= false
local menuIsShowed 				= false
local isInMarker 				= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('Rb:hasEnteredMarker', function(zone)

    if zone == 'Boatreturn1' then
    	CurrentAction = zone
    end
	
	if zone == 'Boatreturn2' then
    	CurrentAction = zone
    end
	
	if zone == 'Boatreturn3' then
    	CurrentAction = zone
    end
	
	if zone == 'Boatreturn4' then
    	CurrentAction = zone
    end
	
	if zone == 'Boatreturn5' then
    	CurrentAction = zone
    end
	
	if zone == 'Boatreturn6' then
    	CurrentAction = zone
    end

end)

AddEventHandler('Rb:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

--Show Markers
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

--Enter/Exit markers
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false

		for zone, data in pairs(Config.zones) do
			if GetDistanceBetweenCoords(coords, data.x, data.y, data.z, true) < (data.w / 2) then
				isInMarker  = true
				break
			end
		end

		if isInMarker and not HasAlreadyEnteredMarker
			HasAlreadyEnteredMarker = true
			TriggerEvent('Rb:hasEnteredMarker')
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('Rb:hasExitedMarker')
		end

	end
end)

-- Return boat
Citizen.CreateThread(function()
    while true do

		AddEventHandler('esx_jobs:action', function(job, zone)
			menuIsShowed = true
			if zone.Type == "vehdelete" then
				local looping = true
		
				for k,v in pairs(Config.Zones) do
					for l,w in pairs(v.Zones) do
						if w.Type == "vehdelete" then
							local playerPed = PlayerPedId()
		
							if IsPedInAnyVehicle(playerPed, false) then
		
								local vehicle = GetVehiclePedIsIn(playerPed, false)
								local driverPed = GetPedInVehicleSeat(vehicle, -1)
		
								if playerPed == driverPed then
		
									DeleteVehicle(GetVehiclePedIsIn(playerPed, false))
		
									if w.Teleport ~= 0 then
										ESX.Game.Boatreturn(playerPed, w.Teleport)
									end
								end
							end
						end
					end
				end
			end						

            
            
        end

    end
end)               