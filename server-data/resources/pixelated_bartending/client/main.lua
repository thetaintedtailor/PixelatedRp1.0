ESX        = nil
Markers    = MarkerController:new()
WorldState = {}

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local current, elapsed, previous = nil, nil, GetGameTimer()

    WorldState.playerPed    = PlayerPedId()
    WorldState.playerCoords = GetEntityCoords(WorldState.playerPed)

    while true do
        current = GetGameTimer()
        elapsed = current - previous

        if elapsed >= 30000 then
            WorldState.playerPed    = PlayerPedId()
            WorldState.playerCoords = GetEntityCoords(WorldState.playerPed)
        end

        Markers:update(WorldState, elapsed)

        previous = current

        Citizen.Wait(10000)
    end
end)
