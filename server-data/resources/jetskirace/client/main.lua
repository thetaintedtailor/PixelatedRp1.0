ESX = nil
local existingBuoy = {}
local existingVehicles = {}
local hasAlreadyEnteredMarker = false
local isRaceActive = false
local raceTimer = 0

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function CleanupObjects()
    isRaceActive = false
    for i,v in ipairs(existingBuoy) do
        ESX.Game.DeleteObject(v)
    end

    for i,v in ipairs(existingVehicles) do
        ESX.Game.DeleteVehicle(v)
    end
end

--Draw Marker
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if GetDistanceBetweenCoords(coords, Config.JetskiRaceLocation.x, Config.JetskiRaceLocation.y, Config.JetskiRaceLocation.z, true) < 20 then
			DrawMarker(Config.MarkerType, Config.JetskiRaceLocation.x,Config.JetskiRaceLocation.y, Config.JetskiRaceLocation.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, false, false, false)	
        end
    end
end)

--Detect player in marker
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isInMarker = false

        if GetDistanceBetweenCoords(coords, Config.JetskiRaceLocation.x, Config.JetskiRaceLocation.y, Config.JetskiRaceLocation.z, true) < Config.PointMarker.x then
            isInMarker = true
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
			TriggerEvent('jetskirace:hasEnteredMarker')
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
			TriggerEvent('jetskirace:hasExitedMarker')
        end

        if not isInMarker then
            Citizen.Wait(500)
        else
            ESX.ShowHelpNotification('Press ~r~E~s~ to setup Jetski Race')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if hasAlreadyEnteredMarker == true and IsControlJustReleased(0, 38) then
            OpenParticipantMenu()
        end
    end
end)

function OpenParticipantMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jetski',
	{
		title      = ('Participant Count'),
		align      = 'right',
		elements   = {
			{label = ('One'), value = 1},
			{label = ('Two'),   value = 2},
			{label = ('Three'), value = 3},
            {label = ('Four'),   value = 4},
			{label = ('End Race'),   value = 5}
		}
    }, function(data, menu)
        if data.current.value == 5 then
            TriggerServerEvent('jetskirace:end')
        else
            TriggerServerEvent('jetskirace:start', data.current.value)
        end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('jetskirace:notOwner')
AddEventHandler('jetskirace:notOwner', function()
    sendNotification('You\'re not the race owner.', 'error', 3000)
    ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('jetskirace:alreadyActive')
AddEventHandler('jetskirace:alreadyActive', function()
    sendNotification('There is already a race active.', 'error', 3000)
    ESX.UI.Menu.CloseAll()
end)

AddEventHandler('jetskirace:hasExitedMarker', function()
    ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('jetskirace:end')
AddEventHandler('jetskirace:end', function(count)
    ESX.UI.Menu.CloseAll()
    CleanupObjects()
end)


RegisterNetEvent('jetskirace:start')
AddEventHandler('jetskirace:start', function(count)
    ESX.UI.Menu.CloseAll()
    CleanupObjects()

    existingBuoy = {}
    existingVehicles = {}

    for i=1,#Config.BuoyLocations do
        ESX.Game.SpawnObject('prop_dock_bouy_3', Config.BuoyLocations[i], function(buoy) 
            table.insert( existingBuoy, buoy)
        end)
    end

    for i=1,count do
        ESX.Game.SpawnVehicle('seashark', Config.JetskiSpawnLocations[i], Config.JetskiSpawnheading, function(shark)
            table.insert( existingVehicles, shark)
        end)
    end
end)

sendNotification = function(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "bazookan",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end