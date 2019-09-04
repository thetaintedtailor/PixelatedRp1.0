ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('binoculars:checkQuantity', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sourceItem = xPlayer.getInventoryItem('binoculars')

    if (sourceItem.count >= 1) then
        cb(true)
    else
        cb(false)
    end
end)