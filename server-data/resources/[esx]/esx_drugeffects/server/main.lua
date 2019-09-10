ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function UseItem(source, name)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local highAmount = Config.HighAmounts[name]

    xPlayer.removeInventoryItem(name, 1)

    TriggerClientEvent('esx_status:add', source, 'drug', math.random(highAmount.min, highAmount.max))
    TriggerClientEvent('esx_drugeffects:onDrugs', source, name)
end

ESX.RegisterUsableItem('weed_pooch', function(source)
    UseItem(source, 'weed_pooch')
end)

ESX.RegisterUsableItem('opium_pooch', function(source)
    UseItem(source, 'opium_pooch')
end)

ESX.RegisterUsableItem('meth_pooch', function(source)
    UseItem(source, 'meth_pooch')
end)

ESX.RegisterUsableItem('coke_pooch', function(source)
    UseItem(source, 'coke_pooch')
end)

ESX.RegisterUsableItem('xanax', function(source)
    UseItem(source, 'xanax')
end)

ESX.RegisterUsableItem('crack', function(source)
    UseItem(source, 'crack')
end)

ESX.RegisterUsableItem('k3v', function(source)
    UseItem(source 'k3v')
end)

ESX.RegisterUsableItem('vicodin', function(source)
    UseItem(source 'vicodin')
end)

ESX.RegisterUsableItem('amoxicillin', function(source)
    UseItem(source 'amoxicillin')
end)

ESX.RegisterUsableItem('ibuprofen', function(source)
    UseItem(source 'ibuprofen')
end)