ESX = nil
IsBombActive = nil
BombLocation = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        if IsBombActive == true and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), BombLocation.x, BombLocation.y, BombLocation.z) <= Config.BeepDistance then
            local textLoc = vector3(BombLocation.x, BombLocation.y, BombLocation.z + 0.2)
            ESX.Game.Utils.DrawText3D(textLoc, '~r~[E]~s~ Attempt Bomb Defuse', 1)
            if IsControlJustPressed(0, 38) then
                ESX.TriggerServerCallback('explosives:hasdefuse', function(hasDefuse, wireOptions)
                    if hasDefuse == true then
                        TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wire_to_cut',{
                            title = "Pick your Wire" .. wireOptions
                        }, function(data, menu)
                            local wire = string.lower(tostring(data.value))
                            if wire == nil then
                                ESX.ShowNotification('Please supply a wire color to cut.')
                            else
                                menu.close()
                                TriggerServerEvent('explosives:disarmbomb', wire)
                            end
                        end)
                    else
                        ESX.ShowNotification('You need a ~g~Bomb Defusing Kit~s~ in order to attempt this.')
                    end
                end)
            end
        end
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
    end)
    coords = {x = x, y = y, z = z}
    TriggerServerEvent('explosives:bombplanted', coords, timer, wire)
end)

RegisterNetEvent('explosives:setbombactive')
AddEventHandler('explosives:setbombactive', function(coords)
    BombLocation = coords
    IsBombActive = true
end)

RegisterNetEvent('explosives:setbombinactive')
AddEventHandler('explosives:setbombinactive', function()
    BombLocation = nil
    IsBombActive = false
end)


RegisterNetEvent('explosives:bombexploded')
AddEventHandler('explosives:bombexploded', function(coords)
    AddExplosion(coords.x, coords.y, coords.z, 32, 2.0, true, false, 5.0)
    local bomb = ESX.Game.GetClosestObject('prop_ld_bomb', coords)
    ESX.Game.DeleteObject(bomb)
end)

RegisterNetEvent('explosives:bombtick')
AddEventHandler('explosives:bombtick', function(coords)
    local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), coords.x, coords.y, coords.z, true)
    if distance <= Config.BeepDistance then
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
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
AddEventHandler('explosives:bombdisarmed', function(coords)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    local bomb = ESX.Game.GetClosestObject('prop_ld_bomb', coords)
    ESX.Game.DeleteObject(bomb)
    ESX.ShowNotification('~g~You\'ve disarmed the bomb. Whew!')
end)

RegisterNetEvent('explosives:faileddisarm')
AddEventHandler('explosives:faileddisarm', function()
    ESX.ShowNotification('~r~You cut the wrong wire, obviously.')
end)

RegisterNetEvent('explosives:carbombexploded')
AddEventHandler('explosives:carbombexploded', function()
    local ped = GetPlayerPed(-1)
    if IsPedInAnyVehicle(ped) then
        local location = GetEntityCoords(ped)
        AddExplosion(location.x, location.y, location.z, 32, 2.0, true, false, 5.0)
    end
end)
