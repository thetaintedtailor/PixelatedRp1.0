ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("boatrental:end") -- deposit return
AddEventHandler("boatrental:end", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local deposit = 300

	xPlayer.addMoney(deposit)

	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Here is your deposit back! : "$" .. deposit .. ",
		type = "success",
		queue = "global",
		timeout = 4000,
		layout = "bottomRight"
	})
end)