
Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerLocalisation = GetEntityCoords(playerPed)
		ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
		ClearAreaOfPeds(983.51, -110.81, 74.24, 200.0)
		ClearAreaOfPeds(471.69, -990.60, 24.91, 80.0)
	end
end)