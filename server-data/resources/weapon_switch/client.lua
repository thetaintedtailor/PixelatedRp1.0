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
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
			loadAnimDict( "reaction@intimidation@1h" )
			loadAnimDict( "weapons@pistol_1h@gang" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
					DisablePlayerFiring(GetPlayerPed(-1), true)
					Citizen.Wait(2500)
					DisablePlayerFiring(GetPlayerPed(-1), false)
					ClearPedTasks(ped)

					Citizen.Wait(100)					
					holstered = false
				end
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
					DisablePlayerFiring(GetPlayerPed(-1), true)
					Citizen.Wait(1500)
					DisablePlayerFiring(GetPlayerPed(-1), false)			
					ClearPedTasks(ped)

					holstered = true
				end
			end
		end
	end
end)


function CheckWeapon(ped)
	for i = 1, #Config.WeaponList do
		if Config.WeaponList[i] == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end