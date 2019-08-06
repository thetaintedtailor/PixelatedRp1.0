
RegisterCommand


RegisterCommand('startrace', function(source, args, raw)
    TriggerEvent("StartStreetRace")
end, false)