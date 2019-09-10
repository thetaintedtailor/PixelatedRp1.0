ESX = nil
local hasAlreadyEnteredMarker = false
local withBeds = false
local showMarker = true
local treated = false

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
    while true do
        Citizen.Wait(1)
        if showMarker == true then
            if playerPed == nil then
                playerPed = PlayerPedId()
            end
            CheckForPatient()
        end
    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	for k, v in pairs(Config.Locations) do
        ESX.Game.SpawnObject('v_med_emptybed', v.BedLocation, function(object)
            SetEntityAsMissionEntity(object, false, true)
        end)
    end
end)

RegisterNetEvent('pillbox_reception:treat')
AddEventHandler('pillbox_reception:treat', function()
    CheckForPatient()
end)

function CheckForPatient()
    for k, v in pairs(Config.Locations) do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(coords, v.Coords, true)
        if distance <= Config.MarkerDrawDistance then
            DrawMarker(v.MarkerType, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 20, false, true, 2, false, false, false, false)
            if distance <= Config.InteractionDistance then
                local health = GetEntityMaxHealth(playerPed) - GetEntityHealth(playerPed)
                local cost = health * v.CostPerHPPoint
                hasAlreadyEnteredMarker = true
                if health >= Config.TreatmentThreshold then
                    if IsControlJustReleased(0, 38) then
                        if treated == false then
                            treated = true
                            TreatPatient(v, health, cost)
                        end
                    elseif health >= 200 then
                        if treated == false then
                            treated = true
                            TreatPatient(v, health, cost)
                        end
                    end
                    ESX.ShowHelpNotification('Press ~r~E~s~ to see a local Doctor for ~g~$' .. cost .. '~s~')
                else
                    ESX.ShowHelpNotification('You do not need medical attention.')
                end
            else
                hasAlreadyEnteredMarker = false
            end
        end
    end
end

function TreatPatient(locationInfo, health, cost)
    if hasAlreadyEnteredMarker == true then
        if health >= Config.TreatmentThreshold then
            ESX.TriggerServerCallback('pillbox_reception:checkmoney', function(hasMoney)
            if hasMoney == true then
                TriggerServerEvent('pillbox_reception:pay', cost)
                LayInBed(locationInfo.BedLocation.x, locationInfo.BedLocation.y, locationInfo.BedLocation.z, 160.0)
                ESX.ShowNotification('Thank you for coming to '..locationInfo.LocationName..', hope we don\'t see you again. Your bill was ~g~$' .. cost )
            else
                ESX.ShowNotification('You cannot afford the local medical treatment.')
            end
            end, cost)
        end
    end
end

function LayInBed(x, y, z, heading)
    DoScreenFadeOut(800)
    local playerPed = GetPlayerPed(-1)
    Citizen.Wait(800)
    DetachEntity(playerPed, false, true)
    SetEntityHealth(playerPed, 200)
    SetEntityCoords(playerPed, x, y, z + 0.6)
    Citizen.Wait(1000)
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
    TriggerEvent('esx_status:set', 'drug', 0)
    StopScreenEffect('DeathFailOut')
    NetworkResurrectLocalPlayer(x, y, z + 0.6, heading, true, false)
    SetPlayerInvincible(playerPed, false)
    ESX.SetPlayerData('lastPosition', vector3(x, y, z))
	TriggerServerEvent('esx:updateLastPosition', vector3(x, y, z))
    Citizen.Wait(1000)
	TriggerEvent('playerSpawned', x, y, z)
    ClearPedBloodDamage(playerPed)
    
    Citizen.Wait(1000)
    RequestAnimDict('misslamar1dead_body')
    while not HasAnimDictLoaded('misslamar1dead_body') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(playerPed, 'misslamar1dead_body', 'dead_idle' ,8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityHeading(playerPed, heading + 180.0)
    treated = false
    DoScreenFadeIn(800)
end