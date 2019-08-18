ESX = nil

TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)

ESX.RegisterServerCallback(
	"esx_inventoryhud:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler(
	"esx_inventoryhud:tradePlayerItem",
	function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				else
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					targetXPlayer.addInventoryItem(itemName, itemCount)
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end
)

TriggerEvent('es:addGroupCommand', 'openinventory', "admin", function(source, args, user)
	local target = tonumber(args[1])
	local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
		else
			TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
		end
end)

-- TriggerEvent('es:addGroupCommand', 'openinventory', "admin", function(source, args, user)
-- 	if args[1] then
-- 		local xPlayer = ESX.GetPlayerFromId(args[1])

-- 		if xPlayer then
-- 			TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, xPlayer)
-- 		else
-- 			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, _U('player_not_online'))
-- 		end
-- 	else
-- 		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, _U('id_not_number'))
-- 	end
-- end, function(source, args, user)
-- 	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, _U('no_permission'))
-- end)