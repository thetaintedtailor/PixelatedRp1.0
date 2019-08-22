ESX = nil

ActiveBomb = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('explosives:plantbomb')
AddEventHandler('explosives:plantbomb', function(timer)
    local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)

	ESX.Game.SpawnObject('prop_ld_bomb', {
		x = x,
		y = y,
		z = z
	}, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        ActiveBomb = obj
    end)
    coords = table.pack(x, y, z)
    TriggerServerEvent('explosives:bombplanted', coords, timer)
end)

RegisterNetEvent('explosives:bombexploded')
AddEventHandler('explosives:bombexploded', function(coords)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer(coords)
    local x, y, z = table.unpack(coords)
    if closestPlayer ~= -1 then
        AddExplosion(x, y, z, 32, 2.0, true, false, 5.0)
    end
    if ActiveBomb ~= nil then
        ESX.Game.DeleteObject(ActiveBomb)
        ActiveBomb = nil
    end
end)

RegisterNetEvent('explosives:bombtick')
AddEventHandler('explosives:bombtick', function()
    local playerPed = GetPlayerPed(-1)
    if GetDistanceBetweenCoords(GetEntityCoords(playerPed), x, y, z, true) <= Config.BeepDistance then
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    end
end)