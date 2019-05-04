function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
    --Example 2: AddTextEntry('f350', '2013 Ford F350')
    AddTextEntry('Light s15', 'Nissan Silvia S15'),
    AddTextEntry('RX7', 'Nissan Silvia S15'), 
    AddTextEntry('370Z', 'Nissan 370Z Nismo'),
    AddTextEntry('Caprice', "'74 Chevy Caprice"),
    AddTextEntry('GTR', 'Nissan GT-R Nismo'),
    AddTextEntry('na6', 'Mazda MX Miata'),
    AddTextEntry('rs5r', 'Audi RS 5'),
    AddTextEntry('rs6', 'Audi RS 6'),
    AddTextEntry('SSTI', 'Subaru WRX STI'),

    --Police cars
    AddTextEntry('R 1200RT', 'BMW R1200RT'),
    AddTextEntry('SRT8', 'Jeep SRT8'),
    AddTextEntry('Mustang', "'15 Mustang GT'"),
    AddTextEntry('SFTSU', 'Ranger'),
    AddTextEntry('SFBC1', 'SUV'),
    AddTextEntry('SFBC2', 'SUV2'),
    AddTextEntry('SFBC3', 'SUV3'),
    AddTextEntry('SFBC4', 'SFBC4'),
    AddTextEntry('SFBC5', 'SFBC5'),
    AddTextEntry('SFUM1', 'SFUM1'),
    AddTextEntry('SFUM2', 'SFUM2'),
    AddTextEntry('SFUM1', 'SFUM1'),
end)