ESX = nil
local hasAlreadyEnteredMarker = false
local withBeds = false
local showMarker = true

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        ESX.TriggerServerCallback('pillbox_reception:checkEMS', function(marker)
            showMarker = marker
        end)
        Citizen.Wait(30000)
    end
end)


Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    while true do
        Citizen.Wait(1)
        if showMarker == false then
            goto continue
        end
        if playerPed == nil then
            playerPed = PlayerPedId()
        end
        local coords = GetEntityCoords(playerPed)

		for k, v in pairs(Config.Locations) do
            if GetDistanceBetweenCoords(coords, v.Coords, true) <= Config.MarkerDrawDistance then
				DrawMarker(v.MarkerType, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 20, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(coords, v.Coords, true) <= 2 then
                    local health = GetEntityHealth(playerPed)
                    local cost = health * v.CostPerHPPoint
                    if IsControlJustReleased(0, 38) or IsDisabledControlJustPressed(0, 38) then
                        if health <= Config.TreatmentThreshold then
                            ESX.TriggerServerCallback('pillbox_reception:checkmoney', function(hasMoney)
                                if hasMoney == true then
                                    TriggerServerEvent('pillbox_reception:pay', cost)
                                    LayInBed(v.BedLocation.x, v.BedLocation.y, v.BedLocation.z, 160.0)
                                    ESX.ShowNotification('Thank you for coming to Pillbox Medical, hope we don\'t see you again.')
                                else
                                    ESX.ShowNotification('You cannot afford the local medical treatment.')
                                end
                            end, cost)
                        end
                    end
                    if health <= Config.TreatmentThreshold then
                        ESX.ShowHelpNotification('Press ~r~E~s~ to see a local Doctor for ~g~$' .. cost .. '~s~')
                    else
                        ESX.ShowHelpNotification('You do not need medical attention.')
                    end
                end
            end
        end
        ::continue::
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	for k, v in pairs(Config.Locations) do
        ESX.Game.SpawnObject('v_med_emptybed', v.BedLocation)
    end
end)

function LayInBed(x, y, z, heading)
    local playerPed = GetPlayerPed(-1)
    SetEntityCoords(playerPed, x, y, z + 0.6)
    Citizen.Wait(1000)
    RequestAnimDict('misslamar1dead_body')
    while not HasAnimDictLoaded('misslamar1dead_body') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(playerPed, 'misslamar1dead_body', 'dead_idle' ,8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityHeading(playerPed, heading + 180.0)
    withBeds = true
    SetEntityHealth(playerPed, 200)

    Citizen.CreateThread(function()
        while withBeds do
            Citizen.Wait(0)
            ESX.ShowHelpNotification('Press ~g~Z~s~ to get back up')
            if IsControlJustReleased(0, 20) then
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
                local playerPos = GetEntityCoords(playerPed)
                SetEntityCoords(playerPed, playerPos.x, playerPos.y, playerPos.z + 0.1)
                withBeds = false
            end
        end
    end)
end