ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('turtlebait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('vg_fishing:setbait', _source, "turtle")
		
		xPlayer.removeInventoryItem('turtlebait', 1)
		TriggerClientEvent('vg_fishing:message', _source, "~g~You attach the turtle bait onto your fishing rod")
	else
		TriggerClientEvent('vg_fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('fishbait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('vg_fishing:setbait', _source, "fish")
		
		xPlayer.removeInventoryItem('fishbait', 1)
		TriggerClientEvent('vg_fishing:message', _source, "~g~You attach the fish bait onto your fishing rod")
		
	else
		TriggerClientEvent('vg_fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('turtle', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 and xPlayer.getInventoryItem('fishingknife').count > 0 then
		TriggerClientEvent('vg_fishing:setbait', _source, "shark")
		
		xPlayer.removeInventoryItem('turtle', 1)
		TriggerClientEvent('vg_fishing:message', _source, "~g~You attach the turtle meat onto the fishing rod")
	else
		TriggerClientEvent('vg_fishing:message', _source, "~r~Du benötigst eine Angel und ein Anglermesser!")
	end
	
end)

ESX.RegisterUsableItem('fishingrod', function(source)
	local _source = source
	TriggerClientEvent('vg_fishing:fishstart', _source)
end)

ESX.RegisterUsableItem('anchor', function(source)
	local _source = source
	TriggerClientEvent('vg_fishing:anchor', _source)
end)

RegisterServerEvent('vg_fishing:removeItem')
AddEventHandler('vg_fishing:removeItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ItemQuantity = xPlayer.getInventoryItem(item).count
	
	if ItemQuantity <= 0 then
		TriggerClientEvent('vg_fishing:message', source, 'Du hast nicht genug ' .. item)
	else   
		xPlayer.removeInventoryItem(item, count)
	end
end)

RegisterServerEvent('vg_fishing:addItem')
AddEventHandler('vg_fishing:addItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ItemQuantity = xPlayer.getInventoryItem(item).count
	
	if item == "fishingrod" then
		if ItemQuantity >= 2 then
			TriggerClientEvent('vg_fishing:message', source, '~r~Du kannst nicht mehr tragen')	
		else 
			BuyItem(xPlayer, Config.FishingrodPrice, item, count)
		end
	elseif item == "fishingknife" then
		if ItemQuantity >= 1 then
			TriggerClientEvent('vg_fishing:message', source, '~r~Du kannst nicht mehr tragen')	
		else 
			BuyItem(xPlayer, Config.FishingknifePrice, item, count)
		end
	elseif item == "fishbait" then
		if ItemQuantity >= 100 then
			TriggerClientEvent('vg_fishing:message', source, '~r~Du kannst nicht mehr tragen')	
		else 
			BuyItem(xPlayer, Config.FishbaitPrice, item, count)
		end
	elseif item == "turtlebait" then
		if ItemQuantity >= 100 then
			TriggerClientEvent('vg_fishing:message', source, '~r~Du kannst nicht mehr tragen')	
		else 
			BuyItem(xPlayer, Config.TurtlebaitPrice, item, count)
		end
	end
end)



RegisterNetEvent('vg_fishing:catch')
AddEventHandler('vg_fishing:catch', function(bait)
	
	local _source = source
	local weight = 2
	local rnd = math.random(1,100)
	xPlayer = ESX.GetPlayerFromId(_source)
	if bait == "turtle" then
		if rnd >= 78 then
			if rnd >= 94 then
				TriggerClientEvent('vg_fishing:setbait', _source, "none")
				TriggerClientEvent('vg_fishing:playSound', _source, "fishing_reelin")
				Citizen.CreateThread(function()
					Citizen.Wait(13000)
					TriggerClientEvent('vg_fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('vg_fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				end)
			else
				TriggerClientEvent('vg_fishing:setbait', _source, "none")
				TriggerClientEvent('vg_fishing:playSound', _source, "fishing_reelin")
				Citizen.CreateThread(function()
					Citizen.Wait(13000)
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					if xPlayer.getInventoryItem('turtle').count > 4 then
						TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more turtles")
					else
						TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a turtle\n~r~These are endangered species and are illegal to posses")
						xPlayer.addInventoryItem('turtle', 1)
						Citizen.CreateThread(function()
							Citizen.Wait(6000)
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
						end)
					end
				end)
			end
		else
			if rnd >= 75 then
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(4,9)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
						Citizen.Wait(6000)
						TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(2,6)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
						Citizen.Wait(6000)
						TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				TriggerClientEvent('vg_fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(4,11)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
						Citizen.Wait(6000)
						TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
				
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(1,6)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
					Citizen.Wait(6000)
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
			end
		end
		if bait == "none" then
			if rnd >= 70 then
				TriggerClientEvent('vg_fishing:message', _source, "~y~You are currently fishing without any equipped bait")
				if  xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(2,4)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
					Citizen.Wait(6000)
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end	
			else
				TriggerClientEvent('vg_fishing:message', _source, "~y~You are currently fishing without any equipped bait")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
					weight = math.random(1,2)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
						Citizen.Wait(6000)
						TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
			end
		end
		if bait == "shark" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('vg_fishing:setbait', _source, "none")
					Citizen.CreateThread(function()
						TriggerClientEvent('vg_fishing:playSound', _source, "fishing_reelin")
						Citizen.Wait(13000)
						TriggerClientEvent('vg_fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
						TriggerClientEvent('vg_fishing:break', _source)
						xPlayer.removeInventoryItem('fishingrod', 1)
					end)
				else
					if xPlayer.getInventoryItem('shark').count > 0  then
						Citizen.CreateThread(function()
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_reelin")
							Citizen.Wait(13000)
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
							TriggerClientEvent('vg_fishing:setbait', _source, "none")
							TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more sharks")
							Citizen.Wait(6000)
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
						end)
					else
						Citizen.CreateThread(function()
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_reelin")
							Citizen.Wait(13000)
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_catch")
							TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a shark!\n~r~These are endangered species and are illegal to posses")
							TriggerClientEvent('vg_fishing:spawnPed', _source)
							xPlayer.addInventoryItem('shark', 1)
							Citizen.Wait(6000)
							TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
						end)
					end
				end	
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('vg_fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('vg_fishing:message', _source, "~g~You caught a fish: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
					Citizen.CreateThread(function()
					Citizen.Wait(6000)
					TriggerClientEvent('vg_fishing:playSound', _source, "fishing_start")
					end)
				end
			end
		end	
	end
end)


RegisterServerEvent('vg_fishing:startSelling')
AddEventHandler('vg_fishing:startSelling', function(item)
local _source = source
local xPlayer  = ESX.GetPlayerFromId(_source)
	if item == "fish" then
		local FishQuantity = xPlayer.getInventoryItem('fish').count
		if FishQuantity <= 4 then
		TriggerClientEvent('vg_fishing:message', source, '~r~You dont have enough~s~ fish')			
	else   
		xPlayer.removeInventoryItem('fish', 5)
		local payment = Config.FishPrice.a
		payment = math.random(Config.FishPrice.a, Config.FishPrice.b) 
		xPlayer.addMoney(payment)	
	end

	end
	if item == "turtle" then
		local FishQuantity = xPlayer.getInventoryItem('turtle').count
		if FishQuantity <= 0 then
			TriggerClientEvent('vg_fishing:message', source, '~r~You dont have enough~s~ turtles')			
		else   
			xPlayer.removeInventoryItem('turtle', 1)
			local payment = Config.TurtlePrice.a
			payment = math.random(Config.TurtlePrice.a, Config.TurtlePrice.b) 
			xPlayer.addMoney(payment)
		end
	end
	if item == "shark" then
		local FishQuantity = xPlayer.getInventoryItem('shark').count
		if FishQuantity <= 0 then
			TriggerClientEvent('vg_fishing:message', source, '~r~You dont have enough~s~ sharks')			
		else   
			xPlayer.removeInventoryItem('shark', 1)
			local payment = Config.SharkPrice.a
			payment = math.random(Config.SharkPrice.a, Config.SharkPrice.b)
			xPlayer.addMoney(payment)
		end
	end
end)

RegisterServerEvent("vg_fishing:Anchor")
AddEventHandler("vg_fishing:Anchor", function(boatNetId)
	TriggerClientEvent("vg_fishing:Anchor", -1, boatNetId)
end)

function BuyItem(xPlayer, value, item, count)
	if xPlayer.getMoney() >= value then
		xPlayer.removeMoney(value)
		xPlayer.addInventoryItem(item, count)
		TriggerClientEvent('vg_fishing:message', source, '~g~Vielen Dank für deinen Einkauf!')
	else
		TriggerClientEvent('vg_fishing:message', source, '~r~Du hast nicht genug~s~ Geld')
	end
end

