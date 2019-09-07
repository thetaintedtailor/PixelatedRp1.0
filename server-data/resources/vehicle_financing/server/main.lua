ESX            = nil
local Vehicles = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	local vehicles = MySQL.Sync.fetchAll('SELECT * FROM vehicles')
	for i=1, #vehicles, 1 do
		local vehicle = vehicles[i]
        table.insert(Vehicles, vehicle)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    print('Loaded player, check for financing.')

    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE owner = @owner', {
        ['@owner'] = xPlayer.identifier,
    }, function(financedCars)
        print('Cars found, checking for overdue payments.')
        for i=1, #financedCars, 1 do
            print('Behind: ' .. financedCars[i].payments_behind)
            if financedCars[i].payments_behind >= Config.PaymentBehindRepo then
                local vehicleName = financedCars[i].vehicle
                local playerName = GetCharacterName(xPlayer.source)
                local color1 = Config.GetColor(vehicle.color1)
                local color2 = Config.GetColor(vehicle.color2)
                local description = playerName .. ' is behind on their payments. The bank would like their ' .. vehicleName ..' reposessed. Description - Primary Color: ' .. color1 .. ' - Secondary Color: ' .. color2 .. ' - Plate: ' .. vehicle.plate
                TriggerServerEvent('esx_addons_gcphone:startCall', 'mechanic', description)
            end
        end
    end)
end)


RegisterServerEvent('finance_vehicle:addNewVehicle')
AddEventHandler('finance_vehicle:addNewVehicle', function(vehicleProps, vehicle, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local payments = math.ceil(price / 14)

    MySQL.Async.execute('INSERT INTO financed_vehicles (owner, plate, purchase_price, payment_cost, remaining_balance, vehicle) VALUES (@owner, @plate, @purchase_price, @payment_cost, @remaining_balance, @vehicle)',
    {
		['@owner']              = xPlayer.identifier,
		['@plate']              = vehicleProps.plate,
        ['@purchase_price']     = price,
        ['@payment_cost']       = payments,
        ['@remaining_balance']  = price - payments,
        ['@vehicle']            = vehicle
    }, function (rowsChanged)
		TriggerClientEvent('esx:showNotification', _source, 'You have financed your new vehicle. Payments are ~g~$' .. payments .. '~s~ a day.')
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
    local price = tonumber(vehicleData.price)
    local totalCost = price + (price * Config.InterestRate)
    local payment = math.ceil(totalCost / 14)

    if xPlayer.getBank() >= payment then
        xPlayer.removeBank(payment)
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
    local player = GetPlayerIdentifiers(source)[1]

    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE owner = @owner', {
        ['@owner'] = player
    }, function(data)
        for _,v in pairs(data) do 
            table.insert(financedCars, { plate = v.plate, purchasePrice = v.purchase_price, paymentCost = v.payment_cost, remainingBalance = v.remaining_balance, paymentsBehind = v.payments_behind, vehicle = v.vehicle })
        end
        cb(financedCars)
    end)
end)

function AutoCarPayments(d, h, m)
    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles', {}, function(result)
        for i=1, #result, 1 do
            local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

            if result[i].remaining_balance >= result[i].payment_cost then
                if xPlayer then
                    if xPlayer.getAccount('bank').money >= result[i].payment_cost then
                        xPlayer.removeAccountMoney('bank', result[i].payment_cost)
                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You\'ve paid your car payment of ~g~$' .. tostring(result[i].payment_cost))
                        MySQL.Sync.execute('UPDATE financed_vehicles SET remaining_balance = @remaining_balance WHERE owner = @owner',
                        {
                            ['@remaining_balance'] = result[i].remaining_balance - result[i].payment_cost,
                            ['@owner'] = result[i].owner
                        })
                        if result[i].remaining_balance < Config.PaymentErrorThreshold then
                            TriggerClientEvent('esx:showNotification', xPlayer.source, 'You\'ve ~g~paid off~s~ one of your vehicles!')
                            MySQL.Sync.execute('DELETE FROM financed_vehicles WHERE plate = @plate', {
                                ['@plate'] = result[i].plate
                            })
                        end
                    else
                        MySQL.Sync.execute('UPDATE financed_vehicles SET payments_behind = payments_behind - @payments_behind WHERE owner = @owner',
                        {
                            ['@payments_behind'] = result[i].payments_behind + 1,
                            ['@owner'] = result[i].owner
                        })
                    end
                else
                    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
                        ['@identifier'] = result[i].owner
                    }, function(results)
                        
                    end)

                    MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE owner = @owner',
                    {
                        ['@bank'] = result[i].payment_cost,
                        ['@owner'] = result[i].owner
                    })

                    MySQL.Sync.execute('UPDATE financed_vehicles SET remaining_balance = remaining_balance - @payment_cost WHERE owner = @owner',
                    {
                        ['@payment_cost'] = result[i].payment_cost,
                        ['@owner'] = result[i].owner
                    })
                end
            else
                MySQL.Sync.execute('DELETE FROM financed_vehicles WHERE plate = @plate', {
                    ['@plate'] = result[i].plate
                })
            end
        end
    end)
end

RegisterServerEvent('vehicle_financing:carpayment')
AddEventHandler('vehicle_financing:carpayment', function(plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.fetchAll('SELECT * FROM financed_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        for i=1, #result, 1 do

            if xPlayer.getBank() >= result[i].payment_cost then
                xPlayer.removeBank(result[i].payment_cost)
                MySQL.Sync.execute('UPDATE financed_vehicles SET remaining_balance = @remaining_balance WHERE plate = @plate',
                {
                    ['@remaining_balance'] = result[i].remaining_balance - result[i].payment_cost,
                    ['@plate'] = plate
                })
                TriggerClientEvent('esx:showNotification', xPlayer.source, 'You\'ve paid your car payment of ~g~$' .. tostring(result[i].payment_cost))
                if result[i].remaining_balance <= Config.PaymentErrorThreshold then
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'You\'ve ~g~paid off~s~ one of your vehicles!')
                    MySQL.Sync.execute('DELETE FROM financed_vehicles WHERE plate = @plate', {
                        ['@plate'] = result[i].plate
                    })
                end
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source, 'You can\'t afford to make your car payment.')
            end
        end
    end)
end)

TriggerEvent('cron:runAt', 22, 0, AutoCarPayments)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		return ('%s %s'):format(result[1].firstname, result[1].lastname)
	else
		return GetPlayerName(source)
	end
end