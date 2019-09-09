Crack = Narcotic:new()

function Crack:use()
    local playerPed = GetPlayerPed(-1)

    self.speedAdded    = math.max(Config.MaxCrackSpeedPct, (self.speedAdded or 0) + math.random(Config.MinCrackSpeedPct, Config.MaxCrackSpeedPct))
    self.speedDuration = (self.speedDuration or 0) + math.random(Config.MinCrackSpeedDuration, Config.MaxCrackSpeedDuration)

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
            ESX.ShowNotification("You feel slower as the crack wears off") 
        end)
    end
end