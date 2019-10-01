ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, 81) then
            if IsPedInAnyVehicle(ped) then 
                local ped = GetPlayerPed(-1)
                local pedLoc = GetEntityCoords(ped)
                local ray = StartShapeTestCapsule(pedLoc.x, pedLoc.y, pedLoc.z, pedLoc.x, pedLoc.y, pedLoc.z, 5.0, 10, ped, 7)
                local handle, wasHit, endCoods, surfaceNormal, vehicle = GetShapeTestResult(ray)
                if GetVehicleClass(vehicle) == 14 then
                    local anchored = false
                    if DecorExistOn(vehicle, 'anchored') then
                        anchored = DecorGetBool(vehicle, 'anchored')
                    else
                        DecorRegister('anchored', 2)
                        DecorSetBool(vehicle, 'anchored', anchored)
                    end
                    SetBoatAnchor(vehicle, not anchored)
                    DecorSetBool(vehicle, 'anchored', not anchored)
                    anchored =  DecorGetBool(vehicle, 'anchored')
                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                    if anchored then
                        TriggerEvent("pNotify:SendNotification",{
                            text = "Boat anchored!",
                            type = "success",
                            timeout = (3000),
                            layout = "bottomCenter",})
                    else
                        TriggerEvent("pNotify:SendNotification",{
                            text = "Boat unanchored!",
                            type = "success",
                            timeout = (3000),
                            layout = "bottomCenter",})
                    end
                    Citizen.Wait(5000)
                    ClearPedTasks(ped)
                end
            end
        end
        Citizen.Wait(0)
    end
end)