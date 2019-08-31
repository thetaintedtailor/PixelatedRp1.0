ESX = nil
local hasAlreadyEnteredMarker = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--Detect player in marker
Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    while true do
        local coords = GetEntityCoords(playerPed)
        local waitTime = 5000
        
        for k,v in pairs(Config.PaymentLocations) do 
            local distance = GetDistanceBetweenCoords(coords, v.Coords, true)
            if distance < 20 then
                waitTime = 1
				DrawMarker(v.Sprite, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, false, false, false)
                if distance < 1 then
                    if IsControlJustReleased(0, 38) then
                        OpenFinanceMenu(vehicles)
                    end
                    ESX.ShowHelpNotification('Press ~r~E~s~ to make a payment for ~g~$' .. 1000 .. '~s~')
                end
            end
        end
        Citizen.Wait(waitTime)
    end
end)

function OpenFinanceMenu(vehicles)
    ESX.UI.Menu.CloseAll()

    local elements = {}

    table.insert(elements, {label = 'Make Payment', value = 'make_payment'})

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'finance_menu',{
        title = 'Vehicle Financing',
        align = 'center',
        elements = elements
    }, function(data, menu)
        menu.close()
        local action = data.current.value

        if action == 'make_payment' then
            ListFinancedVehiclesMenu(vehicles)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function ListFinancedVehiclesMenu(vehicles)
    ESX.TriggerServerCallback('vehicle_financing:getfinancedvehicles', function(vehicles)
        if #vehicles == 0 then
            ESX.ShowNotification('No financed vehicles')
        else
            for _,v in pairs(vehicles) do
                local hashVehicle = v.vehicle.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicle)
                local plate = v.plate
                local labelVehicle 
                
                if v.paymentsBehind ~= 0 then
                    labelVehicle = ' ' .. vehicleName .. ' | ' .. plate .. ' | Payment Due'
                else
                    labelVehicle = ' ' .. vehicleName .. ' | ' .. plate .. ' | Payment Not Due'
                end

                table.insert(elements, {label, labelVehicle, value = v})
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'make_payment_menu', {
            title = "Make Payment",
            align = 'center',
            elements = elements
        }, function(data,  menu)
            
        end, function(data,menu)
            menu.close()
        end)
    end)
end
]]