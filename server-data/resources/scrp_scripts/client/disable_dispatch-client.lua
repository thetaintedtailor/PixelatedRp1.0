
local noVehicleZones = {
	missionRow = {
		min = {x = 404.9, y = -1031.5, z = 26.84},
		max = {x = 492.8, y = -961.9, z = 28.94}
	}
}

Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	for k, v in pairs(noVehicleZones) do
		SetAllVehicleGeneratorsActiveInArea(v.min.x, v.min.y, v.min.z, v.max.x, v.max.y, v.max.z, false, false)
	end

	SetCreateRandomCops(false)
end)

Citizen.CreateThread(function()
	while true do
		ClearAreaOfPeds(983.51, -110.81, 74.24, 200.0)
		ClearAreaOfPeds(471.69, -990.60, 24.91, 80.0)
		Citizen.Wait(1000)
	end
end)