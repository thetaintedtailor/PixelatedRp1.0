ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clotheshop:saveOutfit')
AddEventHandler('esx_clotheshop:saveOutfit', function(label, skin)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_datastore:getDataStore', 'closet', xPlayer.identifier, function(store)
		local outfit = store.get('outfits')
		local count  = store.count('outfits')

		if outfit == nil then
			outfit = {}	
		end
		
		if count >= 10 then
			TriggerClientEvent('esx:showNotification', source, _U('outfit_limit'))
		elseif count >= 9 then
			table.insert(outfit, {
				label = label,
				skin  = skin
			})

			store.set('outfits', outfit)
			TriggerClientEvent('esx:showNotification', source, _U('saved_outfit'))
			TriggerClientEvent('esx:showNotification', source, _U('near_outfit_limit'))
		else
			table.insert(outfit, {
				label = label,
				skin  = skin
			})

			store.set('outfits', outfit)
			TriggerClientEvent('esx:showNotification', source, _U('saved_outfit'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_clotheshop:buyClothes', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.Price then
		xPlayer.removeMoney(Config.Price)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid', Config.Price))
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_clotheshop:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'closet', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)
