ESX             = nil
local hasShot   = false
local timer     = Config.GsrTime

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/gsr',  _U('help_gsr'),  {{name=_U('help_gsr_value'), help=_U('help_gsr')}})
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsPedShooting(GetPlayerPed(-1)) and not (hasShot) then
            hasShot = true
            TriggerServerEvent('addGsrRecord', timer)
        elseif IsPedShooting(GetPlayerPed(-1)) and (hasShot) then
            hasShot = true
            timer = Config.GsrTime
            TriggerServerEvent('timeUpdate', timer)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if (hasShot) and timer > 0 then
            timer = timer - 0.1
            timecheck(timer)
        end
        
        if timer <= 1 and (hasShot) then
            hasShot = false
            timer = Config.GsrTime
            TriggerServerEvent('removeGsrRecord')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and hasShot then
            if IsEntityInWater(GetPlayerPed(-1)) then
                hasShot = false
                TriggerServerEvent('removeGsrRecord')
                TriggerEvent('GSR:Notify', _U('gsr_cleaned'), "success")
            end
        end
    end
end)

function timecheck(time)
    if time < 3600 and time > 3500 then
        TriggerServerEvent('timeUpdate', time)
    elseif time < 100 then
        TriggerServerEvent('timeUpdate', time)
    end
end

RegisterNetEvent('GSR:Notify')
AddEventHandler('GSR:Notify', function(text, type)
    exports.pNotify:SetQueueMax("left", 1)
    exports.pNotify:SendNotification({
        text = text,
        type = type,
        timeout = 5000,
        layout = "centerLeft",
        queue = "left",
    })
end)