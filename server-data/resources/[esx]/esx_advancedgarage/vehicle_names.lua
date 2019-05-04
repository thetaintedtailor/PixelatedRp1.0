function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
    --Example 2: AddTextEntry('f350', '2013 Ford F350')
    AddTextEntry('lgtS15', 'Nissan Silvia S15')
end)