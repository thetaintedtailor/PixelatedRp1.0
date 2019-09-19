ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterUsableItem('beer', function(source)
    local _source      = source
    local xPlayer      = ESX.GetPlayerFromId(_source)
    local drunkAmount  = math.random(Config.MinDrunk, Config.MaxDrunk)
    local thirstAmount = math.random(Config.MinThirst, Config.MaxThirst)
    local hungerAmount = math.random(Config.MinHunger, Config.MaxHunger)

    xPlayer.removeInventoryItem('beer', 1)

    TriggerClientEvent('esx_status:add', _source, 'drunk', drunkAmount)
    TriggerClientEvent('esx_status:add', _source, 'thirst', thirstAmount)
    TriggerClientEvent('esx_status:remove', _source, 'hunger', hungerAmount)
    TriggerClientEvent('esx_optionalneeds:onDrink', _source)
    TriggerClientEvent('esx:showNotification', _source, _U('used_beer'))
end)
