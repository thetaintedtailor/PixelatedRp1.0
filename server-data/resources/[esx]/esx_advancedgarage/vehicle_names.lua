function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
    --Example 2: AddTextEntry('f350', '2013 Ford F350')
    AddTextEntry('Light s15', 'Nissan Silvia S15')
    AddTextEntry('RX7', "'84 Mazda RX-7")
    AddTextEntry('370Z', 'Nissan 370Z Nismo')
    AddTextEntry('Caprice', "'74 Chevy Caprice")
    AddTextEntry('gtrnismo17', 'Nissan GT-R Nismo')
    AddTextEntry('na6', 'Mazda MX Miata')
    AddTextEntry('rs5', 'Audi RS 5')
    AddTextEntry('rs6', 'Audi RS 6')
    AddTextEntry('SSTI', 'Subaru WRX STI')
end)

