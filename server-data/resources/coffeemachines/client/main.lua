ESX = nil
local hasAlreadyEnteredMarker = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--Detect player in marker
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        for i = 1, #Config.Locations do
            if GetDistanceBetweenCoords(coords, Config.Locations[i].x, Config.Locations[i].y, Config.Locations[i].z, true) < 1 then
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('coffee:buyCoffee')
                end
                ESX.ShowHelpNotification('Press ~r~E~s~ to buy Coffee for ~g~$' .. Config.Price .. '~s~')
            end
        end
    end
end)