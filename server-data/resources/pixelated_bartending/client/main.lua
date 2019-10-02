ESX     = nil
Markers = MarkerController:new()

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local current, elapsed, previous = nil, nil, GetGameTimer()

    while true do
        current = GetGameTimer()
        elapsed = current - previous

        Markers:update(elapsed)

        previous = current

        Citizen.Wait(10000)
    end
end)
