ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('pixelatedPlayerVehicleSales:promptBuyer')
AddEventHandler('pixelatedPlayerVehicleSales:promptBuyer', function(vehModel, plate, price, seller)
    local buyerPedLoc = GetEntityCoords(GetPlayerPed(-1))
    local sellerPedLoc = GetEntityCoords(GetPlayerPed(seller))

    if GetDistanceBetweenCoords(buyerPedLoc, sellerPedLoc, true) <= Config.TransactionDistance then
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'buy_vehicle_prompt', {
            title = 'Buy ' .. GetDisplayNameFromVehicleModel(vehModel) .. ' for $' .. price .. '?'
        }, function(data, menu)
            menu.close()
            TriggerServerEvent('pixelatedPlayerVehicleSales:attemptSale', plate, price, seller)
        end, function(data, menu)
            menu.close()
            TriggerServerEvent('pixelatedPlayerVehicleSales:declinedSale', seller)
        end)
    else
        TriggerServerEvent('pixelatedPlayerVehicleSales:failDistance', seller)
    end
end)