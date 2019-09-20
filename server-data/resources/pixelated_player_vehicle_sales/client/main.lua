ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('pixelatedPlayerVehicleSales:displayVehicles')
AddEventHandler('pixelatedPlayerVehicleSales:displayVehicles', function(vehicles)
    local elements = {}

    for _,v in pairs(vehicles) do
        table.insert(elements, )
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'display_owned_vehicles', {
        title = 'Your Vehicles',
        align = 'center',
        elements = elements
    }, function(data, menu)
    
    end)
end)

RegisterNetEvent('pixelatedPlayerVehicleSales:promptBuyer')
AddEventHandler('pixelatedPlayerVehicleSales:promptBuyer', function(vehModel, plate, price, seller, isFinanced)
    print('Seller ID: ' .. seller)
    local buyerPedLoc = GetEntityCoords(GetPlayerPed(-1), true)
    print('Buyer location: ' .. buyerPedLoc)
    local sellerPed = GetPlayerPed(seller)
    print('Seller Ped: ' .. sellerPed)
    local sellerPedLoc = GetEntityCoords(sellerPed, true)
    print('Selling location: ' .. sellerPedLoc)
    local distance = GetDistanceBetweenCoords(buyerPedLoc, sellerPedLoc, true)
    print('Distance is: ' .. distance)

    if distance <= Config.TransactionDistance then
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
    else
        TriggerServerEvent('pixelatedPlayerVehicleSales:failDistance', seller)
    end
end)