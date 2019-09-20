ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'sellvehicle', 'user', function(source, args, user)
    local vehicles = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', 
    {
        ['@owner'] = GetPlayerIdentifiers(source)[1]
    }, function(results)
        for _,v in pairs(results) do
            --local vehicle = json.decode(v.vehicle)
            table.insert(vehicles, {vehicle = v.vehicle, plate = v.plate})
        end
        TriggerClientEvent('pixelatedPlayerVehicleSales:displayVehicles', source, vehicles)
    end)
end, {help = "Starts the vehicle selling process."})

RegisterServerEvent('pixelatedPlayerVehicleSales:sendBuyerPrompt')
AddEventHandler('pixelatedPlayerVehicleSales:sendBuyerPrompt', function(vehicle, plate, price, buyer)
    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE owner = @owner AND plate = @plate', 
    {
        ['@owner'] = GetPlayerIdentifiers(source)[1],
        ['@plate'] = plate
    }, function(results)
        local isFinanced = false    
        if #results > 0 then
            isFinanced = true
        end
        TriggerClientEvent('pixelatedPlayerVehicleSales:promptBuyer', buyer, vehicle, plate, price, source, isFinanced)
    end)
end)

RegisterServerEvent('pixelatedPlayerVehicleSales:attemptSale')
AddEventHandler('pixelatedPlayerVehicleSales:attemptSale', function(plate, price, seller, isFinanced)
    local xBuyer = ESX.GetPlayerFromId(source)
    local xSeller = ESX.GetPlayerFromId(seller)

    if xBuyer.getMoney() >= price then
        xBuyer.removeMoney(price)
        xSeller.addMoney(price)

        MySQL.Async.execute('UPDATE owned_vehicles SET owner = @newOwner WHERE owner = @owner AND plate = @plate',
        {
            ['@newOwner']   = GetPlayerIdentifiers(source)[1],
            ['@owner']      = GetPlayerIdentifiers(seller)[1],
            ['@plate']      = plate
        })

        if isFinanced == true then
            MySQL.Async.execute('UPDATE financed_vehicles SET owner = @newOwner WHERE owner = @owner AND plate = @plate',
            {
                ['@newOwner']   = GetPlayerIdentifiers(source)[1],
                ['@owner']      = GetPlayerIdentifiers(seller)[1],
                ['@plate']      = plate
            })
        end

        TriggerClientEvent('esx:showNotification', source, 'You have purchased the vehicle successfully. Congrats on the new ride!')
        TriggerClientEvent('esx:showNotification', seller, 'You have sold the vehicle successfully. Better find a bank quick!')
    else
        TriggerClientEvent('esx:showNotification', source, 'You don\'t have the cash on you to complete this sale.')
        TriggerClientEvent('esx:showNotification', seller, 'The buyer does not have the cash on them to complete this sale.')
    end
end)

RegisterServerEvent('pixelatedPlayerVehicleSales:declinedSale')
AddEventHandler('pixelatedPlayerVehicleSales:declinedSale', function(seller)
    TriggerClientEvent('esx:showNotification', seller, 'The buyer has declined the sale.')
end)