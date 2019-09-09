Coke = Narcotic:new()

function Coke:use()
    local playerPed = GetPlayerPed(-1)

    self.speedAdded    = math.max(Config.MaxCokeSpeedPct, (self.speedAdded or 0) + math.random(Config.MinCokeSpeedPct, Config.MaxCokeSpeedPct))
    self.speedDuration = (self.speedDuration or 0) + math.random(Config.MinCokeSpeedDuration, Config.MaxCokeSpeedDuration)

    SetRunSprintMultiplierForPlayer(PlayerId(), 1 + (self.speedAdded / 100))

    if (not self.isSprinting) then
        self.isSprinting = true

        Citizen.CreateThread(function()
            while self.speedDuration > 0 do
                Citizen.Wait(1000)
                self.speedDuration = self.speedDuration - 1
            end

            self.isSprinting = false
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            ESX.ShowNotification("You feel slower as the coke wears off") 
        end)
    end
end