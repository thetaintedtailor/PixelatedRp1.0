local bars = {}

AddEventHandler("onClientResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    TriggerServerEvent("pixelated_bartending:loading")
end)

RegisterNetEvent("pixelated_bartending:loaded")
AddEventHandler("pixelated_bartending:loaded", function(data)
    bars = data

    Citizen.Trace("Got " .. #data .. " bars\n")
    for k, v in pairs(data) do
        Citizen.Trace("k = " .. k .. ", v = " .. v .. "\n")
    end
end)