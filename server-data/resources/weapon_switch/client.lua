Config = {}

Config.WeaponList = {
		--pistols--	
	453432689, --pistol
	1593441988, --combatpistol
	-1716589765, --pistol50
	-1076751822, --snspistol
	-771403250, --heavypistol
	137902532, --vintagepistol
	-598887786, --marksmanpistol
	-1045183535, --revolver
	584646201, --appistol
	1198879012, --flaregun
	911657153, --Stungun
		--melee--
	-102973651, --hatchet
	-581044007, --machete
	-1951375401, --flashlight
	---538741184, --switchblade
	1737195953, --nightstick
	1317494643, --hammer
	-2067956739, --crowbar
	1141786504, --golfclub
	-102323637, --brokenbottle
	-1834847097, --dagger
	-656458692, --knuckleduster
	-1716189206, --knife
	-1786099057, --bat
		--machineguns--
	324215364, --Microsmg
	-619010992, --machinepistol
	736523883, --SMG
	-270015777, --assaultsmg
	171789620, --combatpdw
	-1660422300, --MG
	2144741730, --combatmg
	1627465347, --gusenberg
		--Assaultrifles--
	-1074790547, --AR
	-2084633992, --carbinerifle
	-1357824103, --advancedrifle
	-1063057011, --specialcarbine
	2132975508, --bullpup
	1649403952, --compactrifle
		--Sniperrifles--
	100416529, --sniperrifle
	205991906, --heavysniper
	-952879014, --marksmanrifle
		--shotguns--
	487013001, --pumpshotgun
	2017895192, --SawnoffShotgun
	-1654528753, --BullpupShotgun
	-494615257, --AssaultShotgun
	-1466123874, --musket
	984333226, --heavyshotgun			
	-275439685, --doublebarrelshotgun
		--RPG/heavy--
	-1568386805, --Grenadelauncher
	-1312131151, --RPG
	1119849093, --minigun
	2138347493, --firework
	1834241177, --railgun
	1672152130, --hominglauncher
	1305664598, --grenadelaunchersmoke
		--throwables--	
	-1813897027, --grenade
	741814745, --stickybomb
	-1420407917, --proximitymine
	-1600701090, --bzgas
	615608432, --molotov
	101631238, --fireextinguisher
	883325847, --jerrycan
	1233104067, --flare
	600439132, --ball
	126349499, --snowball
	-37975472, --smokegrenade
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
		local ped = PlayerPedId()

		if not IsPedInAnyVehicle(ped, true) then
			if DoesEntityExist( ped ) and not IsEntityDead( ped ) and GetVehiclePedIsTryingToEnter(ped) == 0 and not IsPedInParachuteFreeFall (ped) then
				if Config.PedAbleToWalkWhileSwapping then
					animFlag = 48
				else
					animFlag = 0
				end

				for i=1, #Config.WeaponList do
					if lastWeapon ~= nil and lastWeapon ~= Config.WeaponList[i] and GetSelectedPedWeapon(ped) == Config.WeaponList[i] then
						SetCurrentPedWeapon(ped, Config.UnarmedHash, true)
						TaskPlayAnim(ped, animDict, animIntroName, 8.0, -8.0, 2700, animFlag, 0.0, false, false, false)

						Citizen.Wait(1000)
						SetCurrentPedWeapon(ped, Config.WeaponList[i], true)
					end

					if lastWeapon ~= nil and lastWeapon == Config.WeaponList[i] and GetSelectedPedWeapon(ped) == Config.UnarmedHash then
						TaskPlayAnim(ped, animDict, animOutroName, 8.0, -8.0, 2100, animFlag, 0.0, false, false, false)

						Citizen.Wait(1000)
						SetCurrentPedWeapon(ped, Config.UnarmedHash, true)
					end
				end 
			end
		else
			Citizen.Wait(100)
		end

		lastWeapon = GetSelectedPedWeapon(GetPlayerPed(-1))
	end
end)