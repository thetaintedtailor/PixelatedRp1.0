ActiveRaces = {}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('streetracing:getCash', function(source, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getMoney())
end)