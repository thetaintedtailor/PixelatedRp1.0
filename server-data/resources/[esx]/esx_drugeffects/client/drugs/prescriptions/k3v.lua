K3v = Prescription:new()

function K3v:use()
    local playerPed = GetPlayerPed(-1)

    self.speedAdded    = math.max(Config.MaxK3vSpeedPct, (self.speedAdded or 0) + math.random(Config.MinK3vSpeedPct, Config.MaxK3vSpeedPct))
    self.speedDuration = (self.speedDuration or 0) + math.random(Config.MinK3vSpeedDuration, Config.MaxK3vSpeedDuration)

    SetRunSprintMultiplierForPlayer(PlayerId(), 1 + (self.speedAdded / 100))

    if (not self.isSprinting) then
        self.isSprinting = true

        Citizen.CreateThread(function()
            local playerId = PlayerId()

            while self.speedDuration > 0 do
                Citizen.Wait(1000)
                self.speedDuration = self.speedDuration - 1
                ResetPlayerStamina(playerId)
            end

            self.isSprinting = false
            SetRunSprintMultiplierForPlayer(playerId, 1.0)
            ESX.ShowNotification("You feel slower as the K3V wears off") 
        end)
    end
end