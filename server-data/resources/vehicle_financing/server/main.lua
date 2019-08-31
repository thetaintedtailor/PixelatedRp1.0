ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('finance_vehicle:addNewVehicle')
AddEventHandler('finance_vehicle:addNewVehicle', function(playerId, vehicleProps, price)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local payments = math.floor(price / 14)

    MySQL.Async.execute('INSERT INTO financed_vehicles (owner, plate, vehicle, purchase_price, payment_cost, remaining_balance) VALUES (@owner, @plate, @vehicle, @purchase_price, @payment_cost, @remaining_balance)',
    {
		['@owner']              = xPlayer.identifier,
		['@plate']              = vehicleProps.plate,
        ['@vehicle']            = json.encode(vehicleProps),
        ['@purchase_price']     = price,
        ['@payment_cost']       = payments,
        ['@remaining_balance']  = price - payments
    }, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', playerId, _U('vehicle_belongs', vehicleProps.plate))
    end)
end)

ESX.RegisterServerCallback('vehicle_financing:financeVehicle', function(source, cb, vehicleModel)
    local xPlayer = ESX.GetPlayerFromId(source)
    local vehicleData = nil

    for i=1, #Vehicles, 1 do
		if Vehicles[i].model == vehicleModel then
			vehicleData = Vehicles[i]
			break
		end
    end
    
    local payment = vehicleData.price / 14

    if xPlayer.getBank() >= payment then
        xPlayer.removeBank(PlaySoundFromEntity())
        cb(true)
    elseif xPlayer.getAccount('bank').money >= payment then
        xPlayer.removeAccountMoney('bank', payment)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('vehicle_financing:getfinancedvehicles', function(source, cb)
    local financedCars = {}

    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE owner = @owner', {
        ['@owner'] = GetPlayerIdentifiers(source)[1]
    }, function(data)
        for _,v in pairs(data) do 
            local vehicle = json.decode(v.vehicle)
            table.insert(financedCars, { vehicle = vehicle, plate = v.plate, purchasePrice = v.purchase_price, paymentCost = v.payment_cost, remainingBalance = v.remaining_balance, paymentsBehind = v.payments_behind })
        end
        cb(financedCars)
    end)
end)
