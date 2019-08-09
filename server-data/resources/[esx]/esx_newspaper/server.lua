ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('newspaper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_newspaper:displayNewspaper', source)

	xPlayer.removeInventoryItem('newspaper', 1)
end)

