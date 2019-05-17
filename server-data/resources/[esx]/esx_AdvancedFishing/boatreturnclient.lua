ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local boatrentalend = { x = 3863.3811035156, y = 4470.161621938, z = -0.47262713313103}, { x = -1616.1900634766, y = 5252.4506835938, z = 0.12119972705841}, { x = -3421.2475585938, y = 947.39935302734, z = -0.46575874090195}, { x = -715.21875, y = -1330.1292724609, z = 0.3856446146965}, { x = 1292.4088134766, y = 4220.8701171875, z = 30.477062225342}
local livr = 0
local px = 0
local py = 0
local pz = 0

Citizen.CreateThread(function() -- End boatrental
    while true do

        Citizen.Wait(0)

        if boatrental == true then

            DrawMarker(1,boatrentalend.x,boatrentalend.y,boatrentalend.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)

                if GetDistanceBetweenCoords(boatrentalend.x, boatrentalend.y, boatrentalend.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
                    HelpText("Press ~INPUT_CONTEXT~ to collect your deposit!",0,1,0.5,0.8,0.6,255,255,255,255)

                    if IsControlJustPressed(1,38) then
                        boatrental = false
                        livr = 0

                        px = 0
                        py = 0
                        pz = 0

                        if boatrental == false then

                            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

                            deleteCar( vehicleu )

                            TriggerEvent("pNotify:SendNotification", {
                            text = "You have returned the rental boat.",
                            type = "success",
                            queue = "global",
                            timeout = 4000,
                            layout = "bottomRight"
                            })

                            TriggerServerEvent("boatrental:end")

                        else

                            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

                            deleteCar( vehicleu )

                            TriggerEvent("pNotify:SendNotification", {
                            text = "You have returned the rental boat",
                            type = "error",
                            queue = "global",
                            timeout = 4000,
                            layout = "bottomRight"
                            })
                        end    
                    end
                end
            
            end
        end    
    end    
  
end)

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ply) then
        return true
    else
        return false
    end
end

function HelpText(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end