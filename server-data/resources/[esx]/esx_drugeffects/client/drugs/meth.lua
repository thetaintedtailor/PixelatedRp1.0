Meth = Narcotic:new()

function Meth:use()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = math.random(Config.MinMethArmor, Config.MaxMethArmor)

    self.speedAdded    = math.max(Config.MaxMethSpeedPct, (self.speedAdded or 0) + math.random(Config.MinMethSpeedPct, Config.MaxMethSpeedPct))
    self.speedDuration = (self.speedDuration or 0) + math.random(Config.MinMethSpeedDuration, Config.MaxMethSpeedDuration)
    self.armorAdded    = (self.armorAdded or 0) + armorAmount

    AddArmourToPed(playerPed, armorAmount)
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
            ESX.ShowNotification("You feel slower as the meth wears off") 
        end)
    end
end

function Meth:wearOff()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = GetPedArmour(playerPed) - self.armorAdded

    if armorAmount < 0 then
        armorAmount = 0
    end

    SetPedArmour(playerPed, armorAmount)

    self.armorAdded = 0
end