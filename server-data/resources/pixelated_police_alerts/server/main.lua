ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetAllCops()
    local playerList = ESX.GetPlayers()
    local cops = {}
	for i=1, #playerList, 1 do
        local _source = playerList[i]
        local xPlayer = ESX.GetPlayerFromId(_source)
        local playerjob = xPlayer.job.name
        if playerjob == 'police' then
            table.insert(cops, _source)
	    end
    end
    return cops
end

RegisterServerEvent('pixelatedPoliceAlerts:sendAlert')
AddEventHandler('pixelatedPoliceAlerts:sendAlert', function(icon, crime, message)
    if icon == nil then
        icon = 'exclamation'
    end

    for _,v in pairs(GetAllCops()) do
        TriggerClientEvent('chat:addMessage', v, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(185, 8, 8, 0.7); border-radius: 3px;"><i class="fas fa-{0}"></i> <b><font size="4">{1}</b></font> <i class="fas fa-{0}"></i><br> {2}</div>',
            args = { icon, crime, message }
        })
    end
end)
