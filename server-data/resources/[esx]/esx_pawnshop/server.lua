ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterServerEvent('esx_pawnshop:buyFixkit')
AddEventHandler('esx_pawnshop:buyFixkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 8006) then
		xPlayer.removeMoney(8006)
		
		xPlayer.addInventoryItem('fixkit', 1)
		
		notification("Du köpte en ~g~Reparationslåda")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)


-----Sell items
RegisterServerEvent('esx_pawnshop:sellItem')
AddEventHandler('esx_pawnshop:sellItem', function(itemLabel, itemToSell, price, quantity)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local itemCount = 0

	local itemInInventory = xPlayer.getInventoryItem(itemToSell)

	if itemInInventory then
		itemCount = itemInInventory.count
	end
    
    if itemCount > 0 and itemCount >= quantity then
        xPlayer.removeInventoryItem(itemToSell, quantity)
		xPlayer.addMoney(price * quantity)

		local msg = 'You sold ' .. quantity .. " " .. itemLabel .. "(s)"
		TriggerClientEvent('esx:showNotification', xPlayer.source, msg)
	elseif itemCount < quantity then
		local msg = "You don't have enough " .. itemLabel .. "(s) to sell."
		TriggerClientEvent('esx:showNotification', xPlayer.source, msg)
	else 
		local msg = "You don't have any " .. itemLabel .. "(s) to sell!"
        TriggerClientEvent('esx:showNotification', xPlayer.source, msg)
    end
end)

RegisterServerEvent('esx_pawnshop:sellWeapon')
AddEventHandler('esx_pawnshop:sellWeapon', function(weaponLabel, weaponToSell, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weaponInInventory = xPlayer.getWeapon(weaponToSell)
	
	print(weaponInInventory, weaponToSell)
    if weaponInInventory then
        xPlayer.removeWeapon(weaponToSell)
		xPlayer.addMoney(price)

		local msg = 'You sold a(n) ' .. weaponLabel
		TriggerClientEvent('esx:showNotification', xPlayer.source, msg)
	else 
		local msg = "You don't have a(n) " .. weaponLabel .. " to sell!"
        TriggerClientEvent('esx:showNotification', xPlayer.source, msg)
    end
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end