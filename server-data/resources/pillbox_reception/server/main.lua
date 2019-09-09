ESX = nil
local emsOnDuty = 0
local bedSpawned = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(player)
    if bedSpawned == false then
        TriggerClientEvent('pillbox_reception:spawnbed', source)
        bedSpawned = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        local xPlayers = ESX.GetPlayers()
        
        emsOnDuty = 0
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'ambulance' then
                emsOnDuty = emsOnDuty + 1
            end
        end
    end
end)

ESX.RegisterServerCallback('pillbox_reception:checkEMS', function(source, cb)
    if emsOnDuty >= Config.MinEMSToShow then
        cb(false)
    else
        cb(true)
    end
end)

ESX.RegisterServerCallback('pillbox_reception:checkmoney', function(source, cb, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getBank() >= amount then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('pillbox_reception:pay')
AddEventHandler('pillbox_reception:pay', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', amount)
end)