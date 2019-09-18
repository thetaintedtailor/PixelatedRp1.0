Meth = Narcotic:new()

function Meth:use()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = math.random(Config.MinMethArmor, Config.MaxMethArmor)

    DrugEffects.speedAdded    = math.min(Config.GlobalMaxSpeed, (DrugEffects.speedAdded or 0) + math.random(Config.MinMethSpeedPct, Config.MaxMethSpeedPct))
    DrugEffects.speedDuration = math.min(Config.GlobalMaxSpeedDuration, (DrugEffects.speedDuration or 0) + math.random(Config.MinMethSpeedDuration, Config.MaxMethSpeedDuration))
    self.armorAdded           = (self.armorAdded or 0) + armorAmount

    AddArmourToPed(playerPed, armorAmount)
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

function Meth:wearOff()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = GetPedArmour(playerPed) - self.armorAdded

    if armorAmount < 0 then
        armorAmount = 0
    end

    SetPedArmour(playerPed, armorAmount)

    self.armorAdded = 0
end