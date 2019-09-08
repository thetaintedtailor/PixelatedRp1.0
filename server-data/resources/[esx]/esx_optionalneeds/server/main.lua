ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterUsableItem('beer', function(source)
    local xPlayer      = ESX.GetPlayerFromId(source)
    local drunkAmount  = math.random(Config.MinDrunk, Config.MaxDrunk)
    local thirstAmount = math.random(Config.MinThirst, Config.MaxThirst)
    local hungerAmount = math.random(Config.MinHunger, Config.MaxHunger)

    xPlayer.removeInventoryItem('beer', 1)

    TriggerClientEvene('esx_status:add', source, 'drunk', drunkAmount)
    TriggerClientEvent('esx_status:add', source, 'thirst', thirstAmount)
    TriggerClientEvent('esx_status:remove', source, 'hunger', hungerAmount)
    TriggerClientEvent('esx_optionalneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
end)
