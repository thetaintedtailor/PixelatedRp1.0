Weed = Narcotic:new()

function Weed:use()
    local playerPed     = GetPlayerPed(-1)
    local currentHealth = GetEntityHealth(playerPed)
    local maxHealth     = GetEntityMaxHealth(playerPed)

    if (currentHealth / maxHealth) >= 0.6 then
        local newHealth = math.min(maxHealth, currentHealth + math.random(Config.MinWeedHealth, Config.MaxWeedHealth))
        SetEntityHealth(playerPed, newHealth)
    end
end