function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
    --Example 1: AddTextEntry('gameName', 'VEHICLE_NAME_HERE')
    --Example 2: AddTextEntry('f350', '2013 Ford F350')
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
    AddTextEntry('SFUM1', 'SFUM1')
end)