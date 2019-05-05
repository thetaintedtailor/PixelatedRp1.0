RegisterNUICallback('win', function(data, cb)
    -- Do something here
    TriggerServerEvent('esx_blackjack:win', tonumber(data))
    cb('ok')
end)

RegisterNUICallback('lose', function(data, cb)
    -- Do something here
    TriggerServerEvent('esx_blackjack:win', tonumber(data))
    cb('ok')
end)