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


-----Sälj
RegisterServerEvent('esx_pawnshop:sellring')
AddEventHandler('esx_pawnshop:sellring', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local ring = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "ring" then
			ring = item.count
		end
	end
    
    if ring > 0 then
        xPlayer.removeInventoryItem('ring', 1)
        xPlayer.addMoney(32)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte någon ring att sälja !')
    end
end)

RegisterServerEvent('esx_pawnshop:sellrolex')
AddEventHandler('esx_pawnshop:sellrolex', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local rolex = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "rolex" then
			rolex = item.count
		end
	end
    
    if rolex > 0 then
        xPlayer.removeInventoryItem('rolex', 1)
        xPlayer.addMoney(32)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte någon rolex att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:sellkamera')
AddEventHandler('esx_pawnshop:sellkamera', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local kamera = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "kamera" then
			kamera = item.count
		end
	end
    
    if kamera > 0 then
        xPlayer.removeInventoryItem('kamera', 1)
        xPlayer.addMoney(32)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte någon kamera att sälja !')
    end
end)

RegisterServerEvent('esx_pawnshop:sellarmband')
AddEventHandler('esx_pawnshop:sellarmband', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local armband = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "armband" then
			armband = item.count
		end
	end
    
    if armband > 0 then
        xPlayer.removeInventoryItem('armband', 1)
        xPlayer.addMoney(32)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte något armband att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:sellhalsband')
AddEventHandler('esx_pawnshop:sellhalsband', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local halsband = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "halsband" then
			halsband = item.count
		end
	end
    
    if halsband > 0 then
        xPlayer.removeInventoryItem('halsband', 1)
        xPlayer.addMoney(32)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte något halsband att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:sellbottle')
AddEventHandler('esx_pawnshop:sellbottle', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local bottle = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "bottle" then
			bottle = item.count
		end
	end
    
    if bottle > 0 then
        xPlayer.removeInventoryItem('bottle', 1)
        xPlayer.addMoney(1)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte några tomflaskor att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:sellfishingrod')
AddEventHandler('esx_pawnshop:sellfishingrod', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local fishingrod = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "fishingrod" then
			fishingrod = item.count
		end
	end
  
    if fishingrod > 0 then
        xPlayer.removeInventoryItem('fishingrod', 1)
        xPlayer.addMoney(1)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte något fiskespö att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:selldrill')
AddEventHandler('esx_pawnshop:selldrill', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local drill = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "drill" then
			drill = item.count
		end
	end
    
    if drill > 0 then
        xPlayer.removeInventoryItem('drill', 1)
        xPlayer.addMoney(1)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte någon borrmaskin att sälja!')
    end
end)

RegisterServerEvent('esx_pawnshop:sellblindfold')
AddEventHandler('esx_pawnshop:sellblindfold', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local blindfold = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "blindfold" then
			blindfold = item.count
		end
	end
    
    if blindfold > 0 then
        xPlayer.removeInventoryItem('blindfold', 1)
        xPlayer.addMoney(1)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Du har inte någon ögonbindel att sälja!')
    end
end)


function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end