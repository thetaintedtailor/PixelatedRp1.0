Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		--- npc drops ---
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))

		--- no vehicle rewards --
		DisablePlayerVehicleRewards(PlayerId())
	end
end)