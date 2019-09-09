Weed = Narcotic:new()

function Weed:use()
    local playerPed = GetPlayerPed(-1)
    local newHealth = math.min(GetEntityMaxHealth(playerPed), GetEntityHealth(playerPed) + math.random(Config.MinWeedHealth, Config.MaxWeedHealth))

    SetEntityHealth(playerPed, newHealth)
end