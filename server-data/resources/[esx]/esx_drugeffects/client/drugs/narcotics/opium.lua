Opium = Narcotic:new()

function Opium:use()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = math.random(Config.MinOpiumArmor, Config.MaxOpiumArmor)

    self.armorAdded = (self.armorAdded or 0) + armorAmount

    AddArmourToPed(playerPed, armorAmount)
end

function Opium:wearOff()
    local playerPed   = GetPlayerPed(-1)
    local armorAmount = GetPedArmour(playerPed) - self.armorAdded

    if armorAmount < 0 then
        armorAmount = 0
    end

    SetPedArmour(playerPed, armorAmount)

    self.armorAdded = 0
end