ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('picnic', function(source)
	TriggerClientEvent('esx_extraitems:picnic', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('picnic', 1)
end)

ESX.RegisterUsableItem('donut', function(source)
	TriggerClientEvent('esx_extraitems:donut', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('donut', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
end)

ESX.RegisterUsableItem('oxygen_mask', function(source)
	TriggerClientEvent('esx_extraitems:oxygen_mask', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('oxygen_mask', 1)
end)

ESX.RegisterUsableItem('sandwich', function(source)
	TriggerClientEvent('esx_extraitems:sandwich', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('sandwich', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 750000)
end)

ESX.RegisterUsableItem('rose', function(source)
	TriggerClientEvent('esx_extraitems:rose', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rose', 1)
end)

ESX.RegisterUsableItem('redgull', function(source)
	TriggerClientEvent('esx_extraitems:redgull', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('redgull', 1)
	TriggerClientEvent('esx_status:remove', source, 'thirst', 100000)
end)