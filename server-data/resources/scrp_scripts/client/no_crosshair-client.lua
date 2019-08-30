Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(14) -- hide crosshair
		HideHudComponentThisFrame(9) -- Vanilla gta street name
		HideHudComponentThisFrame(7) -- Area Name
	end
end)