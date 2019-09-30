AddEventHandler("onClientResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    TriggerServerEvent("pixelated_bartending:loading")
end)

RegisterNetEvent("pixelated_bartending:loaded")
AddEventHandler("pixelated_bartending:loaded", function(data)
    Markers:init(data)
end)
