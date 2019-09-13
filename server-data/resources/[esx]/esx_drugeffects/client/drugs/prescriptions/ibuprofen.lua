Ibuprofen = Prescription:new()

function Ibuprofen:use()
    Citizen.Trace("using ibuprofen\n")
    TriggerEvent("esx_status:remove", "drunk", math.random(Config.IbuprofenMinHeal, Config.IbuprofenMaxHeal))
end