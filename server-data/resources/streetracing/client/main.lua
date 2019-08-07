ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterCommand('startrace', function(source, args, raw)
    if source == 0 then
        print('streetrace: You can\'t use this command from RCON!')
    end
    TriggerEvent("StartStreetRace", args[1])
end, false)

AddEventHandler("StartStreetRace", function(wager)
    local player = PlayerPedId()
    local xPlayer = ESX.GetPlayerFromId(-1)
    local cashBalance = xPlayer.getMoney()

    if IsPedInAnyVehicle(player, false) then
        if cashBalance >= wager then

        end
    else
        
    end
end)