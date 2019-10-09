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


RegisterServerEvent('esx_pawnshop:buyBulletproof')
AddEventHandler('esx_pawnshop:buyBulletproof', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 35000) then
		xPlayer.removeMoney(35000)
		
		xPlayer.addInventoryItem('bulletproof', 1)
		
		notification("Du köpte en ~g~Skottsäker väst")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)


RegisterServerEvent('esx_pawnshop:buyDrill')
AddEventHandler('esx_pawnshop:buyDrill', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 45000) then
		xPlayer.removeMoney(45000)
		
		xPlayer.addInventoryItem('drill', 1)
		
		notification("Du köpte en ~g~borrmaskin")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)


RegisterServerEvent('esx_pawnshop:buyBlindfold')
AddEventHandler('esx_pawnshop:buyBlindfold', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 16214) then
		xPlayer.removeMoney(16214)
		
		xPlayer.addInventoryItem('blindfold', 1)
		
		notification("Du köpte en ~g~ögonbindel")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)


RegisterServerEvent('esx_pawnshop:buyFishingrod')
AddEventHandler('esx_pawnshop:buyFishingrod', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 2591) then
		xPlayer.removeMoney(2591)
		
		xPlayer.addInventoryItem('fishing_rod', 1)
		
		notification("Du köpte en ~g~fiskespö")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)

RegisterServerEvent('esx_pawnshop:buyAntibiotika')
AddEventHandler('esx_pawnshop:buyAntibiotika', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 1239) then
		xPlayer.removeMoney(1239)
		
		xPlayer.addInventoryItem('anti', 1)
		
		notification("Du köpte en ~g~antibiotika")
	else
		notification("Du har inte tillräckligt med ~r~pengar")
	end		
end)

RegisterServerEvent('esx_pawnshop:buyPhone')
AddEventHandler('esx_pawnshop:buyPhone', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 3400) then
		xPlayer.removeMoney(3400)
		
		xPlayer.addInventoryItem('phone', 1)
		
		notification("Du köpte en ny ~g~telefon")
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
    
    if itemCount > 0 then
        xPlayer.removeInventoryItem(itemToSell, quantity)
		xPlayer.addMoney(price * quantity)

		local msg = 'You sold ' .. quantity .. " " .. itemLabel .. "(s)"
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