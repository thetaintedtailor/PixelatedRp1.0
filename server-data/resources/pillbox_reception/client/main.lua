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
    local playerPed = PlayerPedId()
    while true do
        Citizen.Wait(1)
        if playerPed == nil then
            playerPed = PlayerPedId()
        end
        local coords = GetEntityCoords(playerPed)

		for k, v in pairs(Config.Locations) do
            if GetDistanceBetweenCoords(coords, v.Coords, true) <= Config.MarkerDrawDistance then
				DrawMarker(v.MarkerType, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 20, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(coords, v.Coords, true) <= 2 then
                    if IsControlJustReleased(0, 38) or IsDisabledControlJustPressed(0, 38) then
                        TriggerServerEvent('pillbox_reception:heal')
                    end
                    local health = GetEntityHealth(playerPed)
                    print(health)
                    if health <= 195 then
                        local cost = health * v.CostPerHPPoint
                        ESX.ShowHelpNotification('Press ~r~E~s~ to see a local Doctor for ~g~$' .. cost .. '~s~')
                    else
                        ESX.ShowHelpNotification('You do not need medical attention.')
                    end
                end
            end
        end
    end
end)