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
        
        local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('meth_pooch', 1)

    TriggerClientEvent('esx_status:add', _source, 'drug', 333000)
    TriggerClientEvent('esx_drugeffects:onMeth', source)
end)

ESX.RegisterUsableItem('coke_pooch', function(source)
        
        local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('coke_pooch', 1)

    TriggerClientEvent('esx_status:add', _source, 'drug', 499000)
    TriggerClientEvent('esx_drugeffects:onCoke', source)
end)

ESX.RegisterUsableItem('xanax', function(source)
        
        local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('xanax', 1)

    TriggerClientEvent('esx_status:remove', _source, 'drug', 249000)
end)

ESX.RegisterUsableItem('crack', function(source)
        
        local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('crack', 1)

    TriggerClientEvent('esx_status:add', _source, 'drug', 499000)
    TriggerClientEvent('esx_drugeffects:onCrack', source)
end)

ESX.RegisterUsableItem('k3v', function(source)
        
        local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('k3v', 1)

    TriggerClientEvent('esx_status:add', _source, 'drug', 499000)
    TriggerClientEvent('esx_drugeffects:onK3v', source)
end)

ESX.RegisterUsableItem('vicodin', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('vicodin', 1)

TriggerClientEvent('esx_status:add', _source, 'drug', 499000)
TriggerClientEvent('esx_drugeffects:onVicodin', source)
end)

ESX.RegisterUsableItem('amoxicillin', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('amoxicillin', 1)

TriggerClientEvent('esx_status:add', _source, 'drug', 0)
TriggerClientEvent('esx_drugeffects:onAmoxicillin', source)
end)

ESX.RegisterUsableItem('ibuprofen', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('ibuprofen', 1)

TriggerClientEvent('esx_status:add', _source, 'drug', 0)
TriggerClientEvent('esx_drugeffects:onIbuprofen', source)
end)

ESX.RegisterUsableItem('xanax', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('xanax', 1)

TriggerClientEvent('esx_status:add', _source, 'drug', 499000)
TriggerClientEvent('esx_drugeffects:onXanax', source)
end)