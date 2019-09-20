ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'sellvehicle', 'user', function(source, args, user)
    local vehicles = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', 
    {
        ['@owner'] = GetPlayerIdentifiers(source)[1]
    }, function(results)
        for _,v in pairs(results) do
            local vehicle = json.decode(v.vehicle)
            table.insert(vehicles, {vehicle = vehicle, plate = v.plate})
        end
    end)
    TriggerClientEvent('pixelatedPlayerVehicleSales:displayVehicles', source, vehicles)
end)

TriggerEvent('es:addGroupCommand', 'sellvehicle', 'user', function(source, args, user)
    if #args == 4 and args[1] == nil or args[2] == nil or args[3] == nil or args[4] == nil then
	    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Missing or invalid parameter in vehicle sale attempt.")
        return
    end

    local plate = tostring(args[1]) .. ' ' .. tostring(args[2])
    local price = tonumber(args[3])
    local id = tonumber(args[4])

    if plate == nil or price == nil or id == nil then
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Missing or invalid parameter in vehicle sale attempt.")
        return
    end

    if id == source then
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Can't sell to yourself. Duh.")
        return
    end
    
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', 
    {
        ['@owner'] = GetPlayerIdentifiers(source)[1],
        ['@plate'] = plate
    }, function(results)
        if #results == 0 then
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You do not own the vehicle you're trying to sell.")
            return
        end

        if #results > 1 then
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Two vehicles with the same owner and plate found. Open a support ticket and report it, please.")
            return
        end
        local isFinanced = false    
        MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE owner = @owner AND plate = @plate', 
        {
            ['@owner'] = GetPlayerIdentifiers(source)[1],
            ['@plate'] = plate
        }, function(results2)
            if #results2 > 0 then
                isFinanced = true
                --TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You cannot sell a financed vehicle to another player.")
                --return
            end
        end)

        local vehicle
        for _,v in pairs(results) do
            vehicle = json.decode(v.vehicle)
        end
        TriggerClientEvent('pixelatedPlayerVehicleSales:promptBuyer', id, vehicle.model, plate, price, source, isFinanced)
    end)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Starts the vehicle selling process.", params = 
     {name = 'Plate1',  help = 'First three characters of your plate.'},
     {name = 'Plate2', help = 'Second three characters of your plate.'},
     {name = 'Price',        help = 'How much to sell the vehicle for.'},
     {name = 'ID',  help = 'The ID of the player buying the vehicle.'}
})

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

RegisterServerEvent('pixelatedPlayerVehicleSales:failDistance')
AddEventHandler('pixelatedPlayerVehicleSales:failDistance', function(seller)
    TriggerClientEvent('esx:showNotification', source, 'You and the seller are too far apart.')
    TriggerClientEvent('esx:showNotification', seller, 'You and the buyer are too far apart.')
end)