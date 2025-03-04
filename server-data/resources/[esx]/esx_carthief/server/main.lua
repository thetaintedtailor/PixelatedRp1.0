ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local cooldown = 0

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addAccountMoney('bank', tonumber(payment))
	TriggerClientEvent('esx:showNotification', _source, '~g~$' .. payment .. ' has been deposted into your bank account. Thank you for the delivery.')
end)

ESX.RegisterServerCallback('esx_carthief:anycops',function(source, cb)
	local anycops = 0
	local playerList = ESX.GetPlayers()
	for i=1, #playerList, 1 do
		local _source = playerList[i]
		local xPlayer = ESX.GetPlayerFromId(_source)
		local playerjob = xPlayer.job.name
		if playerjob == 'police' then
			anycops = anycops + 1
		end
	end
	cb(anycops)
end)

ESX.RegisterServerCallback('esx_carthief:isActive',function(source, cb)
	cb(activity, cooldown)
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function(value, vehicle)
	activity = value
	if value == 1 then
		cooldown = Config.CooldownMinutes * 60000
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('esx_carthief:setcopnotification', xPlayers[i])
			end
		end
		TriggerEvent('pixelatedPoliceAlerts:sendAlert', 'car', '10-73:High Value GTA', 'A LoJack system has started pinging in a high value '.. vehicle ..' from the import docks.')
	else
		activitySource = 0
	end
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_carthief:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)

RegisterServerEvent('esx_carthief:stopalertcops')
AddEventHandler('esx_carthief:stopalertcops', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
		end
	end
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		--Remove blip for all cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
			end
		end
		--Set activity to 0
		activity = 0
		activitySource = 0
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)