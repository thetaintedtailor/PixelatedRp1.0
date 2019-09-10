K3v = Prescription:new()

function K3v:use()
    local playerPed = GetPlayerPed(-1)

    DrugEffects.speedAdded      = math.min(Config.MaxK3vSpeedPct, (DrugEffects.speedAdded or 0) + math.random(Config.MinK3vSpeedPct, Config.MaxK3vSpeedPct))
    DrugEffects.speedDuration   = math.min(Config.GlobalMaxSpeedDuration, (DrugEffects.speedDuration or 0) + math.random(Config.MinK3vSpeedDuration, Config.MaxK3vSpeedDuration))
    DrugEffects.staminaDuration = math.min(Config.GlobalMaxSpeedDuration, (DrugEffects.staminaDuration or 0) + math.random(Config.MinK3vSpeedDuration, Config.MaxK3vSpeedDuration))

    SetRunSprintMultiplierForPlayer(PlayerId(), 1 + (DrugEffects.speedAdded / 100))

    -- Expire stamina boost
    if (not DrugEffects.hasInfiniteStamina) then
        DrugEffects.hasInfiniteStamina = true

        Citizen.CreateThread(function()
            local playerId = PlayerId()

            while DrugEffects.speedDuration > 0 do
                Citizen.Wait(1000)
                DrugEffects.staminaDuration = DrugEffects.staminaDuration - 1

                if DrugEffects.hasInfiniteStamina then
                    ResetPlayerStamina(playerId)
                end
            end

            DrugEffects.hasInfiniteStamina = false
            ESX.ShowNotification("You feel more tired as the drugs wear off")
        end)
    end

    -- Expire speed boost
    if (not DrugEffects.isSprinting) then
        DrugEffects.isSprinting = true

        Citizen.CreateThread(function()
            local playerId = PlayerId()

            while DrugEffects.speedDuration > 0 do
                Citizen.Wait(1000)
                DrugEffects.speedDuration = DrugEffects.speedDuration - 1

                if DrugEffects.infiniteStamina then
                    ResetPlayerStamina(playerId)
                end
            end

            DrugEffects.infiniteStamina = false
            DrugEffects.isSprinting = false
            SetRunSprintMultiplierForPlayer(playerId, 1.0)
            ESX.ShowNotification("You feel slower as the drugs wear off") 
        end)
    end
end