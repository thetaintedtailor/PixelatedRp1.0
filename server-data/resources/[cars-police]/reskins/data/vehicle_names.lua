function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	-- POLICE
	AddTextEntry('0x79FBB0C5', 'LSPD Ford Crown Vic')
	-- POLICE2
	AddTextEntry('0x9F05F101', 'LSPD Dodge Charger')
	-- POLICE3
	AddTextEntry('0x71FA16EA', 'LSPD Ford Explorer')
	-- POLICE4
	AddTextEntry('0x8A63C7B9', 'Unmarked Police Vapid')
	-- POLICE5
	AddTextEntry('POLICE5', 'LSPD Ford Explorer') 		
	-- POLICE6
	AddTextEntry('0xB2FF98F0', 'LSPD Ford Explorer K-9') 	
	-- POLICE8
	AddTextEntry('0xD0AF544F', 'LSPD Chevy Impala')
end)