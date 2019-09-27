ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('pixelatedPlayerVehicleSales:displayVehicles')
AddEventHandler('pixelatedPlayerVehicleSales:displayVehicles', function(vehicles)
    local closestPlayer, distance = ESX.Game.GetClosestPlayer()
    if closestPlayer == -1 or distance > Config.TransactionDistance then
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
                local elements = {}

                ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
                    for i = 1, #players, 1 do
                        if players[i] ~= PlayerId() then
                            local serverId = GetPlayerServerId(players[i])
                            local playerName

                            if (connectedPlayers[serverId] ~= nil and string.len(connectedPlayers[serverId].name) > 0) then
                                playerName = connectedPlayers[serverId].name
                            else
                                playerName = GetPlayerName(players[i])
                            end
                            table.insert(elements, { label = playerName, value = serverId })
                        end
                    end
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'select_buyer', {
                        title = 'Select Buyer',
                        align = 'center',
                        elements = elements
                    }, function(data3, menu3)
                        menu3.close()
                        TriggerServerEvent('pixelatedPlayerVehicleSales:sendBuyerPrompt', data.current.label, data.current.value, data2.value, data3.current.value)
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
        titleString = 'Buy Financed ' .. vehModel .. ' for $' .. price .. '?'
    else
        titleString = 'Buy ' .. vehModel .. ' for $' .. price .. '?'
    end
    local elements = {}
    table.insert(elements, {label = 'Yes', value = 'yes'})
    table.insert(elements, {label = 'No', value = 'no'})
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_vehicle_prompt', {
        title = titleString,
        align = 'center',
        elements = elements
    }, function(data, menu)
        menu.close()
        if data.current.value == 'yes' then
            TriggerServerEvent('pixelatedPlayerVehicleSales:attemptSale', plate, price, seller, isFinanced)
        else
            TriggerServerEvent('pixelatedPlayerVehicleSales:declinedSale', seller)
        end
    end, function(data, menu)
        menu.close()
        TriggerServerEvent('pixelatedPlayerVehicleSales:declinedSale', seller)
    end)
end)