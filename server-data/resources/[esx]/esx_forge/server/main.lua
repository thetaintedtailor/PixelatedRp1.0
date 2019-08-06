ESX 						   = nil
local PlayersTransformingIron  = {}


Citizen.CreateThread(function() 
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
	end
end)

local function TransformIron(source)

	SetTimeout(Config.TimeToProcessIron, function()

		if PlayersTransformingIron[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local ironQuantity = xPlayer.getInventoryItem('iron').count
            local steelQuantity = xPlayer.getInventoryItem('steel').count
            local carbonQuantity = xPlayer.getInventoryItem('carbon').count

			if steelQuantity > 16 then
				TriggerClientEvent('esx:showNotification', source, _U('too_much_steel'))
			elseif ironQuantity < 5 then
                TriggerClientEvent('esx:showNotification', source, _U('not_enough_iron'))
            elseif carbonQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_carbon'))
			else
                xPlayer.removeInventoryItem('iron', 5)
                xPlayer.removeInventoryItem('carbon', 1)
				xPlayer.addInventoryItem('steel', 1)
				
				TransformIron(source)
			end

		end
	end)
end

RegisterServerEvent('esx_forge:startTransformIron')
AddEventHandler('esx_forge:startTransformIron', function()

	local _source = source

	PlayersTransformingIron[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('forging_in_progress'))

	TransformIron(_source)

end)

RegisterServerEvent('esx_forge:stopTransformIron')
AddEventHandler('esx_forge:stopTransformIron', function()

	local _source = source

	PlayersTransformingIron[_source] = false

end)

RegisterServerEvent('esx_forge:GetUserInventory')
AddEventHandler('esx_forge:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	Citizen.Trace("source = " .. source .. ", total players = " .. #ESX.Players .. "\n")
	
	TriggerClientEvent('esx_forge:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('steel').count, 
		xPlayer.getInventoryItem('iron').count,
		xPlayer.getInventoryItem('carbon').count, 
		xPlayer.job.name, 
		currentZone
	)
end)