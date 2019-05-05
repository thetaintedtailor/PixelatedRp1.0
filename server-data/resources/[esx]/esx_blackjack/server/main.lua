--xPlayer.addMoney(money)

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_blackjack:win')
AddEventHandler('esx_blackjack:win', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addMoney(amount)
end)

RegisterServerEvent('esx_blackjack:lose')
AddEventHandler('esx_blackjack:lose', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addMoney(amount)
end)