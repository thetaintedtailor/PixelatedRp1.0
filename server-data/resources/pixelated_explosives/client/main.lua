ESX = nil
ActiveBomb = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('explosives:plantbomb')
AddEventHandler('explosives:plantbomb', function(timer, wire)
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
        FreezeEntityPosition(obj, true)
        ActiveBomb = obj
    end)
    coords = {x = x, y = y, z = z}
    TriggerServerEvent('explosives:bombplanted', coords, timer, wire)
end)

RegisterNetEvent('explosives:bombexploded')
AddEventHandler('explosives:bombexploded', function(coords)
    AddExplosion(coords.x, coords.y, coords.z, 32, 2.0, true, false, 5.0)
    if ActiveBomb ~= nil then
        ESX.Game.DeleteObject(ActiveBomb)
        ActiveBomb = nil
    end
end)

RegisterNetEvent('explosives:bombtick')
AddEventHandler('explosives:bombtick', function(coords)
    local playerPed = GetPlayerPed(-1)
    local distance = GetDistanceBetweenCoords(GetEntityCoords(playerPed), coords.x, coords.y, coords.z, true)
    if distance <= Config.BeepDistance then
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    end
end)

RegisterNetEvent('explosives:carbombexploded')
AddEventHandler('explosives:carbombexploded', function()
    local ped = GetPlayerPed(-1)
    if IsPedInAnyVehicle(ped) then
        local location = GetEntityCoords(ped)
        AddExplosion(location.x, location.y, location.z, 32, 2.0, true, false, 5.0)
    end
end)

RegisterNetEvent('explosives:disarmattempt')
AddEventHandler('explosives:disarmattempt', function(loc, wire)
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), loc.x, loc.y, loc.z, true) <= Config.DisarmDistance then
        TriggerServerEvent('explosives:disarmlocation', wire)
    else
        ESX.ShowNotification('No bombs nearby.')
    end
end)

RegisterNetEvent('explosives:bombdisarmed')
AddEventHandler('explosives:bombdisarmed', function()
    if ActiveBomb ~= nil then
        ESX.Game.DeleteObject(ActiveBomb)
        ActiveBomb = nil
        ESX.ShowNotification('~g~You\'ve disarmed the bomb. Whew!')
    end
end)

RegisterNetEvent('explosives:faileddisarm')
AddEventHandler('explosives:faileddisarm', function()
    ESX.ShowNotification('~r~You cut the wrong wire, obviously.')
end)