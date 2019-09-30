ESX     = nil
Markers = MarkerController:new()

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local previous = GetGameTimer()
    local lag      = 0.0

    while true do
        Citizen.Wait(0)

        local current = GetGameTimer()
        local elapsed = current - previous

        previous = current
        lag = lag + elapsed

        while lag >= Markers.updateCadence do
            Markers:update()
            lag = lag - Markers.updateCadence
        end

        Markers:render()
    end
end)
