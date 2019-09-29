ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent('coffee:buyCoffee')
AddEventHandler('coffee:buyCoffee', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem('coffee')

    if xPlayer.getMoney() >= Config.Price and (sourceItem.count + 1) <= sourceItem.limit then
        xPlayer.removeMoney(Config.Price)
        xPlayer.addInventoryItem('coffee', 1)
        TriggerClientEvent('esx:showNotification', _source, 'You bought a coffee!')
    else
        TriggerClientEvent('esx:showNotification', _source, "You can't afford it or have too many!")
    end
end)

RegisterServerEvent('coffee:buyTea')
AddEventHandler('coffee:buyTea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem('tea')

    if xPlayer.getMoney() >= Config.Price and (sourceItem.count + 1) <= sourceItem.limit then
        xPlayer.removeMoney(Config.Price)
        xPlayer.addInventoryItem('tea', 1)
        TriggerClientEvent('esx:showNotification', _source, 'You bought a cup of tea.')
    else
        TriggerClientEvent('esx:showNotification', _source, "You can't afford it or have too many!")
    end
end)