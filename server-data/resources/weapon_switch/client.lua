Config = {}

Config.WeaponList = {
	453432689, --pistol
	-1716189206, --knife
	2508868239, --bat
	324215364, --Microsmg
	3220176749, --AR
	2210333304, --Carbine
	2937143193, --ADVAR
	487013001, --Pump
	911657153, --Stungun
	100416529, --sniper


}

Config.PedAbleToWalkWhileSwapping = true
Config.UnarmedHash = -1569615261

Citizen.CreateThread(function()
	local animDict = 'reaction@intimidation@1h'

	local animIntroName = 'intro'
	local animOutroName = 'outro'

	local animFlag = 0

	RequestAnimDict(animDict)
	  
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end

	local lastWeapon = nil

	while true do
		Citizen.Wait(0)

		if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			if Config.PedAbleToWalkWhileSwapping then
				animFlag = 48
			else
				animFlag = 0
			end

			for i=1, #Config.WeaponList do
				if lastWeapon ~= nil and lastWeapon ~= Config.WeaponList[i] and GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.WeaponList[i] then
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.UnarmedHash, true)
					TaskPlayAnim(GetPlayerPed(-1), animDict, animIntroName, 8.0, -8.0, 2700, animFlag, 0.0, false, false, false)

					Citizen.Wait(1000)
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.WeaponList[i], true)
				end

				if lastWeapon ~= nil and lastWeapon == Config.WeaponList[i] and GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.UnarmedHash then
					TaskPlayAnim(GetPlayerPed(-1), animDict, animOutroName, 8.0, -8.0, 2100, animFlag, 0.0, false, false, false)

					Citizen.Wait(1000)
					SetCurrentPedWeapon(GetPlayerPed(-1), Config.UnarmedHash, true)
				end
			end
		end

		lastWeapon = GetSelectedPedWeapon(GetPlayerPed(-1))
	end
end)