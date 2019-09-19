ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Bomb = {
    valid = false,
    coords = nil,
    timer = 0,
    wire = ""
}

TriggerEvent('es:addGroupCommand', 'plantbomb', 'admin', function(source, args, user)
    local timer = -1
    local cutWire = ""

    timer = tonumber(args[1])
    cutWire = string.lower(tostring(args[2]))

    if timer == nil then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Requires the timer parameter."} })
        return
    end

    if cutWire == nil then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Requires the wire parameter."} })
        return
    end

    local colorApproved = false
    for _,k in pairs(Config.WireColors) do
        if cutWire == string.lower(k) then
            colorApproved = true
        end
    end

    if colorApproved == false then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Invalid color supplied."}})
        return
    end

    if Bomb.valid == false then
        TriggerClientEvent('explosives:plantbomb', source, timer, cutWire)
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "There is already an active bomb in the city."}})
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Insufficient permissions!"}})
end, {help = "Plant a bomb, kaboom!", params = {
        {name = "timer", help = "How long before it explodes in seconds!"},
        {name = "wire",  help = "The color of the wire to cut to disarm."}
    }})

RegisterServerEvent('explosives:bombplanted')
AddEventHandler('explosives:bombplanted', function(c, t, w)
    Bomb = {
        valid = true,
        coords = c,
        timer = t,
        wire = w
    }
    TriggerClientEvent('explosives:setbombactive', -1, c)
    Citizen.CreateThread(function()
        while Bomb.valid do
            Bomb.timer = Bomb.timer - 1
            TriggerClientEvent('explosives:bombtick', -1, Bomb.coords)
            if Bomb.timer <= 0 then
                TriggerClientEvent('explosives:setbombinactive', -1)
                TriggerClientEvent('explosives:bombexploded', -1, Bomb.coords)
                Bomb.valid = false
            end
            Citizen.Wait(1000)
        end
    end)
end)

TriggerEvent('es:addGroupCommand', 'carbomb', "admin", function(source, args)
    local target = -1

    if args[1] ~= nil then
        target = tonumber(args[1])
    end

    TriggerClientEvent('explosives:carbombexploded', target)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1Explosives", "Insufficient permissions!"}})
end, {help = "Detonate the vehicle someone is in."})

RegisterServerEvent('explosives:disarmbomb')
AddEventHandler('explosives:disarmbomb', function(wire)
    if Bomb.valid == true then
        if wire == string.lower(Bomb.wire) then
            TriggerClientEvent('explosives:bombdisarmed', source, Bomb.coords)
            TriggerClientEvent('explosives:bombcleanup', source, Bomb.coords)
        else
            TriggerClientEvent('explosives:bombexploded', source, Bomb.coords)
            TriggerClientEvent('explosives:faileddisarm', source)
            TriggerClientEvent('explosives:bombcleanup', -1, Bomb.coords)
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem('bomb_defuse_kit', 1)
        end
        TriggerClientEvent('explosives:setbombinactive', -1)
        Bomb = {
            valid = false,
            coords = nil,
            timer = 0,
            wire = ""
        }
    end
end)

ESX.RegisterServerCallback('explosives:hasdefuse', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getInventoryItem('bomb_defuse_kit').count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)