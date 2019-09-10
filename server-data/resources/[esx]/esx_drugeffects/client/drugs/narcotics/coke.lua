Coke = Narcotic:new()

function Coke:use()
    local playerPed = GetPlayerPed(-1)

    DrugEffects.speedAdded    = math.min(Config.GlobalMaxSpeed, (DrugEffects.speedAdded or 0) + math.random(Config.MinCokeSpeedPct, Config.MaxCokeSpeedPct))
    DrugEffects.speedDuration = math.min(Config.GlobalMaxSpeedDuration, (DrugEffects.speedDuration or 0) + math.random(Config.MinCokeSpeedDuration, Config.MaxCokeSpeedDuration))

    SetRunSprintMultiplierForPlayer(PlayerId(), 1 + (DrugEffects.speedAdded / 100))

    if (not DrugEffects.isSprinting) then
        DrugEffects.isSprinting = true

        Citizen.CreateThread(function()
            local playerId = PlayerId()

            while DrugEffects.speedDuration > 0 do
                Citizen.Wait(1000)
                DrugEffects.speedDuration = DrugEffects.speedDuration - 1
            end

            DrugEffects.isSprinting = false
            SetRunSprintMultiplierForPlayer(playerId, 1.0)
            ESX.ShowNotification("You feel slower as the drugs wear off") 
        end)
    end
end