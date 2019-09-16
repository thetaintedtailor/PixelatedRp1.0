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
    while true do
        local waitTime = 5000
        for _,v in pairs(Config.PaymentLocations) do 
            local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.Coords, true)
            if distance <= Config.MarkerDrawDistance then
                waitTime = 1
				DrawMarker(v.Sprite, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, true, false, false, false)
                if distance <= 1 then
                    if IsControlJustReleased(0, 38) then
                        OpenFinanceMenu()
                    end
                    ESX.ShowHelpNotification('Press ~r~E~s~ to make a car payment.')
                end
            end
        end
        Citizen.Wait(waitTime)
    end
end)

function OpenFinanceMenu()
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

function ListFinancedVehiclesMenu()
    local elements = {}

    ESX.TriggerServerCallback('vehicle_financing:getfinancedvehicles', function(vehicles)
        if #vehicles == 0 then
            ESX.ShowNotification('No financed vehicles')
        else
            for _,v in pairs(vehicles) do
                local labelVehicle 
                
                if v.paymentsBehind > 0 then
                    labelVehicle = ' ' .. v.vehicle .. ' | ' .. v.plate .. ' | Balance: $' .. v.remainingBalance .. ' | Late'
                else
                    labelVehicle = ' ' .. v.vehicle .. ' | ' .. v.plate .. ' | Balance: $' .. v.remainingBalance
                end

                table.insert(elements, {label = labelVehicle, value = v.plate})
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_selection_menu', {
            title = "Make Payment",
            align = 'center',
            elements = elements
        }, function(data,  menu)
            OpenVehicleActionChoice(data.current.value)
        end, function(data,menu)
            menu.close()
        end)
    end)
end

function OpenVehicleActionChoice(plate)
    ESX.UI.Menu.CloseAll()
    
    local elements = {}
    
    table.insert(elements, {label = 'Make Payment', value = 0})
    table.insert(elements, {label = 'Quit Lease', value = 1})
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'make_payment_menu', {
        title = "Car Action",
        align = 'center',
        elements = elements
        }, function(data, menu)
        if data.current.value == 0 then
            TriggerServerEvent('vehicle_financing:carpayment', plate)
        else
            menu.close()
            elements = {}
            
            table.insert(elements, {label = 'No', value = 0})
            table.insert(elements, {label = 'Yes', value = 1})

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cancel_lease_confirmation', {
                title = "Are you sure?",
                align = 'center',
                elements = elements
            }, function(data2, menu2)
                if data2.current.value == 0 then
                    menu2.close()
                    OpenFinanceMenu()
                else
                    menu2.close()
                    TriggerServerEvent('vehicle_financing:sellcar', plate)
                    ESX.ShowNotification('You\'ve ended the lease on vehicle with plate ~g~' .. plate)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end