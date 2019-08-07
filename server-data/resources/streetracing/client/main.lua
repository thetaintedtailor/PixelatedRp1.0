ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterCommand('startrace', function(source, args, raw)
    if source == -1 then
        print('streetracing: You can\'t use this command from RCON!')
    end
    TriggerEvent("StartStreetRace", args[1])
end, false)

AddEventHandler("StartStreetRace", function(wager)
    local player = PlayerPedId()
    local wage = math.tointeger(wager)
    local cashBalance = 0

    if IsPedInAnyVehicle(player, false) then
        ESX.TriggerServerCallback('streetracing:getCash', function(amount)
          cashBalance = amount
        end)
        if cashBalance >= wage then
          sendNotification('Sending race to nearby citizens.', 'success', 2000)
        else
          sendNotification('You don\'t have enough cash for this wager.', 'error', 2000)
        end
    else
        sendNotification('You must be in a vehicle to use this command. Duh.', 'error', 2000)
    end
end)

sendNotification = function(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end