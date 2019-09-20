ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('pixelatedPlayerVehicleSales:displayVehicles')
AddEventHandler('pixelatedPlayerVehicleSales:displayVehicles', function(vehicles)
    local closestPlayer, distance = ESX.Game.GetClosestPlayer()
    print('Distance: ' .. distance)
    if closestPlayer ~= -1 or distance > Config.TransactionDistance then
        ESX.ShowNotification('No person close enough to sell a vehicle to.')
        return
    end

    local elements = {}
    local vehLabel = ""
    for _,v in pairs(vehicles) do
        local vehicle = json.decode(v.vehicle)
        vehLabel = GetDisplayNameFromVehicleModel(vehicle.model) .. ' | ' .. v.plate
        table.insert(elements, {label = vehLabel, value = v.plate})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'display_owned_vehicles', {
        title = 'Your Vehicles',
        align = 'center',
        elements = elements
    }, function(data, menu)
        menu.close()
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'asking_price', {
            title = 'Selling price?',
            align = 'center'
        }, function(data2, menu2)
            if data2.value ~= nil then
                menu2.close()
                local playerPed = PlayerPedId()
                local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
                local foundPlayers = false
                local elements = {}

                ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
                    for i = 1, #players, 1 do
                        if players[i] ~= PlayerId() then
                            foundPlayers = true

                            local serverId = GetPlayerServerId(players[i])
                            local playerName

                            if (connectedPlayers[serverId] ~= nil and string.len(connectedPlayers[serverId].name) > 0) then
                                playerName = connectedPlayers[serverId].name
                            else
                                playerName = GetPlayerName(players[i])
                            end

                            table.insert(elements, { label = playerName, value = GetPlayerServerId(players[i]) })
                        end
                    end
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'select_buyer', {
                        title = 'Select Buyer',
                        align = 'center',
                        elements = elements
                    }, function(data3, menu3)
                        menu3.close()
                        TriggerServerEvent('pixelatedPlayerVehicleSales:sendBuyerPrompt', data.current.value, data2.value, data3.current.value)
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                end)
            end
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('pixelatedPlayerVehicleSales:promptBuyer')
AddEventHandler('pixelatedPlayerVehicleSales:promptBuyer', function(vehModel, plate, price, seller, isFinanced)
    local titleString = ""
    if isFinanced == true then
        titleString = 'Buy Financed ' .. GetDisplayNameFromVehicleModel(vehModel) .. ' for $' .. price .. '?'
    else
        titleString = 'Buy ' .. GetDisplayNameFromVehicleModel(vehModel) .. ' for $' .. price .. '?'
    end
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'buy_vehicle_prompt', {
        title = titleString
    }, function(data, menu)
        menu.close()
        TriggerServerEvent('pixelatedPlayerVehicleSales:attemptSale', plate, price, seller, isFinanced)
    end, function(data, menu)
        menu.close()
        TriggerServerEvent('pixelatedPlayerVehicleSales:declinedSale', seller)
    end)
end)