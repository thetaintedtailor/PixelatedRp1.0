Weed = Narcotic:new()

function Weed:use()
    local playerPed     = GetPlayerPed(-1)
    local currentHealth = GetEntityHealth(playerPed)

    if currentHealth >= Config.WeedHealthThreshold then
        local newHealth = math.min(GetEntityMaxHealth(playerPed), currentHealth + math.random(Config.MinWeedHealth, Config.MaxWeedHealth))
        SetEntityHealth(playerPed, newHealth)
    end
end