Ibuprofen = Prescription:new()

function Ibuprofen:use()
    local amountHealed = math.random(Config.IbuprofenMinHeal, Config.IbuprofenMaxHeal)
    TriggerEvent("esx_status:remove", "drunk", amountHealed)
end