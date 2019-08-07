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
        Wait(3)
        if IsPedShooting(GetPlayerPed(-1)) and not (hasShot) then
            hasShot = true
            TriggerServerEvent('addGsrRecord', timer)
            StartTimer()
            Wait(5000)
        elseif IsPedShooting(GetPlayerPed(-1)) and (hasShot) then
            hasShot = true
            timer = Config.GsrTime
            TriggerServerEvent('timeUpdate', timer)
            Wait(5000)
        end
    end
end)

function StartTimer()
    Citizen.CreateThread(function()
        local currentTime = GetGameTimer()
        local lastTime = currentTime
        local lastUpdate = currentTime

        while hasShot do
            Wait(5000)

            currentTime = GetGameTimer()
            timer = timer - ((currentTime - lastTime) / 1000)
            lastTime = currentTime

            if ((currentTime - lastUpdate) > 30000) then
                TriggerServerEvent('timeUpdate', timer)
            end

            if timer <= 0 and (hasShot) then
                hasShot = false
            end
        end

        timer = Config.GsrTime
        TriggerServerEvent('removeGsrRecord')
    end)
end

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