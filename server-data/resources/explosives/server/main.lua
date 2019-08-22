--ESX = nil

--TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Bomb = {
    valid = false,
    coords = nil,
    timer = 0
}

TriggerEvent('es:addGroupCommand', 'plantbomb', 'admin', function(source, args, user)
    local timer = tonumber(args[1])
    if timer == nil then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Requires the timer parameter."} })
        return
    end

    if Bomb.valid == false then
        TriggerClientEvent('explosives:plantbomb', source, tonumber(args[1]))
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "There is already an active bomb in the city."} })
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Insufficienct permissions!"} })
end, {help = "Plant a bomb, kaboom!", params = {{name = "timer", help = "How long before it explodes in seconds!"}}})

RegisterServerEvent('explosives:bombplanted')
AddEventHandler('explosives:bombplanted', function(c, t)
    Bomb = {
        valid = true,
        coords = c,
        timer = t
    }
end)

Citizen.CreateThread(function()
    while true do
        if Bomb.valid == false then
            goto continue
        end
        Bomb.timer = Bomb.timer - 1
        TriggerClientEvent('explosives:bombtick', -1)
        if Bomb.timer <= 0 then
            TriggerClientEvent('explosives:bombexploded', -1, Bomb.coords)
            Bomb.valid = false
         end
        ::continue::
        Citizen.Wait(1000)
    end
end)