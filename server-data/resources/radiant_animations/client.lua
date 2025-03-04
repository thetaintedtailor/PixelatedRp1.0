--New custom animations based off DavesEmotes from @davewazere
--https://forum.fivem.net/t/release-daves-emotes/140216 
--Finger Pointing is taken from @Geekness and @Hallux
--https://forum.fivem.net/t/release-finger-pointing-by-geekness/103722
--Ragdoll is from here @callmejaf
--https://forum.fivem.net/t/release-toggle-ragdoll/53668
--Crouch is from wolfknights script @WolfKnight
--https://forum.fivem.net/t/release-crouch-script-1-0-1-now-button-based/14742


-- Commands
-- Salute: 		/e salute 		: Salute your commrads!
-- Bird 1: 		/e finger 		: One hand middle Finger
-- Bird 2: 		/e finger2 		: 2 hands middle finger
-- Surrender: 	/e surrender	: Kneeldown hands behind head surrender
-- Facepalm: 	/e facepalm		: Facepalm
-- Notes: 		/e notes		: Write down notes on paper
-- Brief:		/e brief		: Equip a tactical brief case
-- Brief2:		/e brief2		: Equip a leather brief case
-- Damn:		/e damn			: Throw your arms in disbelief
-- Fail:		/e fail			: Become visibly dissapointed
-- Shrug: 		/e shrug		: Shrug your shoulders
-- Gang1:		/e gang1		: Gang sign 1
-- Gang2:		/e gang2		: Gang sign 2
-- No:			/e no			: Shake your head no
-- Pickbutt:	/e pickbutt		: Pick your butt
-- Grab Crotch:	/e grabcrotch	: Grab your crotch
-- Peace:		/e peace		: Hold peace sign
-- Guard: 		/e guard		: Stand guard
-- Cigar:		/e cigar		: Place cigar in your mouth
-- Cigar2:		/e cigar2		: Place a burnt cigar in your mouth
-- Joint:		/e joint		: Place a joint in your mouth
-- Cig:			/e cig			: Place a cig in your mouth
-- Holdcigar:	/e holdcigar	: Hold a cigar in your hand 
-- Holdcig:		/e holdcig		: Hold a cig in your hand 
-- Holdjoint:	/e holdjoint	: Hold a joint in your hand
-- Dead:		/e dead			: Play dead
-- Holster:		/e holster		: Hand hovers over holster 
-- Slow Clap:	/e slowclap		: Slowly clap your hands
-- Carry a box:	/e box			: Pull out a box and walk around with it
-- Cheer		/e cheer		: Cheer
-- Bum:			/e bum			: Lay on the ground like a bum
-- Wall-lean:	/e leanwall		: Lean against a wall
-- crowd ctrl1:	/e copcrowd		: Calm down a crowd like a cop
-- Crowd ctrl2:	/e copcrowd2	: Control a scene like a cop
-- Cop idle:	/e copidle		: idle like a cop
-- Umbrella:	/e umb			: take out an umbrella
-- Flex: 		/e flex			: Flex your muscles
-- Liftweights: /e liftweights	: Arm curls
-- Yoga:		/e yoga			: Do some yoga
-- Pushups:		/e pushups		: Do some pushups
-- Situps:		/e situps		: Do some situps
-- Striptease1: /e st1 			: Striptease dance ver1
-- Striptease2: /e st2			: Striptease dance ver2
-- STOK: 		/e stok			: Striptease on knees
-- Stripidle1:  /e stripidle 	: Hooker idle ver1
-- Stripidle2:  /e stripidle2	: Hooker idle ver2
-- Stripidle3:  /e stripidle3	: Hooker idle ver3
-- Salsa:	 	/e salsa		: Salsa dance male ver
-- Salsa2:	 	/e salsa2		: Salsa dance female ver
-- Cat's Cradle: /e ccd			: Cat's cradle dance male ver
-- Cat's Cradle2: /e ccd2		: Cat's cradle dance female ver
-- Find the fish: /e ffd   		: Find the fish dance male ver
-- Find the fish2: /e ffd2  	: Find the fish dance female ver
-- Heartpump: 	/e heartpump 	: Heartpump dance male ver
-- Heartpump2: 	/e heartpump2 	: Heartpump dance female ver
-- Oh snap!: 	/e ohsnap		: Oh snap! dance male ver
-- Oh snap!2: 	/e ohsnap2		: Oh snap! dance female ver
-- Raiseroof: 	/e raiseroof	: Raise the Roof dance male ver
-- Raiseroof2: 	/e raiseroof2	: Raise the Roof dance female ver
-- Disco: 		/e disco		: Disco dance male ver
-- Disco2: 		/e disco2		: Disco dance female ver
-- Ground sit:	/e groundsit	: Sit on the ground
-- Lean: 		/e lean			: Lean against a wall (different variations, /e leanwall is the same anim every time)
-- SunbatheB: 	/e sunbatheb	: Lay down and sunbathe your back
-- SunbatheF: 	/e sunbathef	: Lay down and sunbathe your front
-- Clean:		/e clean		: Wipe with a rag
-- Selfie:		/e selfie		: Take a selfie with your phone
-- Smoke:		/e smoke		: Smoke a cigarette
-- Beer: 		/e beer			: Party with a beer
-- Kneel:		/e kneel		: Kneel
-- Binoculars:	/e binoculars	: Look through a pair of binoculars
-- Fishing: 	/e fishing		: Go fishing with a rod
-- Wallspy:		/e wallspy		: Put your ear against the wall 
-- Serveshots:	/e serveshots	: Act as if you're serving shots
-- Writhe: 		/e writhe		: Writhe on the ground as if injured


-- If you want ESX features enabled you can uncomment this stuff
--------------------------------------------------------------------------------------------- ESX SUPPORT ---------------------------------------------------------------------------------------------


--ESX 			    			= nil
--local PlayerData 				= {}

--Citizen.CreateThread(function()
--	while ESX == nil do
--		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--		Citizen.Wait(0)
--	end
--end)

--RegisterNetEvent('esx:playerLoaded')
--AddEventHandler('esx:playerLoaded', function(xPlayer)
--  PlayerData = xPlayer
--end)

--RegisterNetEvent('esx:setJob')
--AddEventHandler('esx:setJob', function(job)
--  PlayerData.job = job
--end)

------------------------------------------------------------------------------------------ END ESX SUPPORT ------------------------------------------------------------------------------------------

local radioActive 				= false
local radioButton				= 244 --- U by default  -- use 57 for f10
local handsUpButton				= 73 --- H by default -- use 73 for X
local Keys = {["X"] = 73, ["Z"] = 20, ["SHIFT"] = 209}

local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() and not IsPedInAnyVehicle(ped, true)) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                        exports['esx_animations']:RefreshAttitude()
                        exports['esx_optionalneeds']:UpdateClipset()
                    elseif ( crouched == false ) then
                        RequestAnimSet( "move_ped_crouched" )

                        while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                            Citizen.Wait( 100 )
                        end 

                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)

		if IsControlPressed(0, 19) and IsControlPressed(0, 73) then
			local player = PlayerPedId()
			local surrendered = false
			if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
				loadAnimDict( "random@arrests" )
				loadAnimDict( "random@arrests@busted" )

				if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
					TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (3000)
					TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
					surrendered = false
				else
					ClearPedTasks(player)
					TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (4000)
					TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (500)
					TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (1000)
					TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
					Wait(100)
					surrendered = true
				end     
			end

			Citizen.CreateThread(function() --disabling controls while surrendured
				while surrendered do
					Citizen.Wait(0)
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
						DisableControlAction(1, 140, true)
						DisableControlAction(1, 141, true)
						DisableControlAction(1, 142, true)
						DisableControlAction(0,21,true)
					end
				end
			end)
		end
	end
end)

Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 182) and IsInputDisabled(0) then --Start holding g
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)


RegisterCommand("e",function(source, args)
	local player = PlayerPedId()
	if tostring(args[1]) == nil then
		print("Invalid syntax, correct syntax is: /e <animation> ")
		return
	else
		if tostring(args[1]) ~= nil then
            local argString = tostring(args[1])
			local argh = string.lower(argString)
			
			if argh == 'surrender' then
				local surrendered = false
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( "random@arrests" )
					loadAnimDict( "random@arrests@busted" )
					if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
						TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (3000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
						surrendered = false
					else
						TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (4000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (500)
						TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (1000)
						TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
						Wait(100)
						surrendered = true
					end     
				end

				Citizen.CreateThread(function() --disabling controls while surrendured
					while surrendered do
						Citizen.Wait(0)
						if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
							DisableControlAction(1, 140, true)
							DisableControlAction(1, 141, true)
							DisableControlAction(1, 142, true)
							DisableControlAction(0,21,true)
						end
					end
				end)

			elseif argh == 'salute' then
				local ad = "anim@mp_player_intuppersalute"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (600)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger' then
				local ad = "anim@mp_player_intselfiethe_bird"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger2' then
				local ad = "anim@mp_player_intupperfinger"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'facepalm' then
				local ad = "anim@mp_player_intupperface_palm"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'notes' then
				local ad = "missheistdockssetup1clipboard@base"
				
				local prop_name = prop_name or 'prop_notepad_01'
				local secondaryprop_name = secondaryprop_name or 'prop_pencil_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true) -- notepad
						AttachEntityToEntity(secondaryprop, player, GetPedBoneIndex(player, 58866), 0.12, 0.0, 0.001, -150.0, 0.0, 0.0, true, true, false, true, 1, true) -- pencil
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'callphone' then
				local ad = "cellphone@"
				
				local prop_name = prop_name or 'prop_player_phone_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "cellphone_call_listen_base", 3 ) ) then 
				
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.02, -0.01, 105.0, -20.0, 90.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "cellphone_call_listen_base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
				
			elseif argh == 'umbrella' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'p_amb_brolly_01_s'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.005, -0.02, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'brief' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
				end
			elseif argh == 'brief2' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x01B79F17, 1, false, true);
				end
			elseif argh == 'damn' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_damn", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_damn", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'shrug' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_shrug_soft", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_shrug_soft", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'fail' then
				local ad = "random@car_thief@agitated@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "agitated_idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "agitated_idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang1' then
				local ad = "mp_player_int_uppergang_sign_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang2' then
				local ad = "mp_player_int_uppergang_sign_b"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_b", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'no' then
				local ad = "mp_player_int_upper_nod"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_nod_no", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_nod_no", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'pickbutt' then
				local ad = "mp_player_int_upperarse_pick"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_arse_pick", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_arse_pick", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'grabcrotch' then
				local ad = "mp_player_int_uppergrab_crotch"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_grab_crotch", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_grab_crotch", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'peace' then
				local ad = "mp_player_int_upperpeace_sign"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_peace_sign", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_peace_sign", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'cigar' then
				local cigar_name = cigar_name or 'prop_cigar_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.0001, 0.003, 55.0, 0.0, -85.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'cigar2' then
				local cigar_name = cigar_name or 'prop_cigar_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.0001, 0.003, 55.0, 0.0, -85.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'joint' then
				local cigar_name = cigar_name or 'p_cs_joint_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'cig' then
				local cigar_name = cigar_name or 'prop_amb_ciggy_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdcigar' then
				local cigar_name = cigar_name or 'prop_cigar_03' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.045, -0.05, -0.010, -75.0, 0.0, 65.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdcig' then
				local cigar_name = cigar_name or 'prop_amb_ciggy_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.035, -0.01, -0.010, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdjoint' then
				local cigar_name = cigar_name or 'p_cs_joint_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.035, -0.01, -0.010, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'dead' then
				local ad = "misslamar1dead_body"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "dead_idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "dead_idle", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'holster' then
				local ad = "move_m@intimidation@cop@unarmed"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'guard' then
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base_carrier", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base_carrier", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'box' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'hei_prop_heist_box'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'slowclap' then
				local ad = "anim@mp_player_intcelebrationmale@slow_clap"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "slow_clap", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "slow_clap", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'cheer' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_CHEERING', 0, false)   
					end   
				end

			elseif argh == 'bum' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 5.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'leanwall' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'copcrowd' then
				local ad = "amb@code_human_police_crowd_control@idle_a" --- insert the animation dic here
				local anim = "idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			elseif argh == 'copcrowd2' then
				local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
				local anim = "idle_d" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'cop' then
				local ad = "amb@code_human_wander_idles_cop@male@static" --- insert the animation dic here
				local anim = "static" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'flex' then
				local ad = "amb@world_human_muscle_flex@arms_at_side@base" --- insert the animation dic here
				local anim = "base" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'liftweights' then
				local ad = "amb@world_human_muscle_free_weights@male@barbell@base" --- insert the animation dic here
				local anim = "base" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'st1' then
				local ad = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1" --- insert the animation dic here
				local anim = "ld_girl_a_song_a_p1_f" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'st2' then
				local ad = "mini@strip_club@private_dance@part2" --- insert the animation dic here
				local anim = "priv_dance_p2" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'stok' then
				local ad = "mini@strip_club@private_dance@part3" --- insert the animation dic here
				local anim = "priv_dance_p3" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'stripidle' then
				local ad = "mini@strip_club@idles@stripper" --- insert the animation dic here
				local anim = "stripper_idle_02" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'stripidle2' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS', 0, 1)   
					end 
				end
			
			elseif argh == 'stripidle3' then
				local ad = "mini@strip_club@backroom@" --- insert the animation dic here
				local anim = "stripper_b_backroom_idle_b" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'salsa' then
				local ad = "anim@mp_player_intcelebrationmale@salsa_roll" --- insert the animation dic here
				local anim = "salsa_roll" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'salsa2' then
				local ad = "anim@mp_player_intcelebrationfemale@salsa_roll" --- insert the animation dic here
				local anim = "salsa_roll" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'ccd' then
				local ad = "anim@mp_player_intcelebrationmale@cats_cradle" --- insert the animation dic here
				local anim = "cats_cradle" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'ccd2' then
				local ad = "anim@mp_player_intcelebrationfemale@cats_cradle" --- insert the animation dic here
				local anim = "cats_cradle" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'ffd' then
				local ad = "anim@mp_player_intcelebrationmale@find_the_fish" --- insert the animation dic here
				local anim = "find_the_fish" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'ffd2' then
				local ad = "anim@mp_player_intcelebrationfemale@find_the_fish" --- insert the animation dic here
				local anim = "find_the_fish" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'heartpump' then
				local ad = "anim@mp_player_intcelebrationmale@heart_pumping" --- insert the animation dic here
				local anim = "heart_pumping" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'heartpump2' then
				local ad = "anim@mp_player_intcelebrationfemale@heart_pumping" --- insert the animation dic here
				local anim = "heart_pumping" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'ohsnap' then
				local ad = "anim@mp_player_intcelebrationmale@oh_snap" --- insert the animation dic here
				local anim = "oh_snap" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'ohsnap2' then
				local ad = "anim@mp_player_intcelebrationfemale@oh_snap" --- insert the animation dic here
				local anim = "oh_snap" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'raiseroof' then
				local ad = "anim@mp_player_intcelebrationmale@raise_the_roof" --- insert the animation dic here
				local anim = "raise_the_roof" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'raiseroof2' then
				local ad = "anim@mp_player_intcelebrationfemale@raise_the_roof" --- insert the animation dic here
				local anim = "raise_the_roof" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'disco' then
				local ad = "anim@mp_player_intcelebrationmale@uncle_disco" --- insert the animation dic here
				local anim = "uncle_disco" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'disco2' then
				local ad = "anim@mp_player_intcelebrationfemale@uncle_disco" --- insert the animation dic here
				local anim = "uncle_disco" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'groundsit' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_PICNIC', 0, false)   
					end   
				end
			
			elseif argh == 'lean2' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'world_human_leaning', 0, false)   
					end   
				end
			
			elseif argh == 'sunbatheb' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SUNBATHE_BACK', 0, false)   
					end   
				end
			
			elseif argh == 'sunbathef' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SUNBATHE', 0, false)   
					end   
				end
				
			elseif argh == 'clean' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'world_human_maid_clean', 0, false)   
					end   
				end
			
			elseif argh == 'selfie' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'world_human_tourist_mobile', 0, false)   
					end   
				end
				
			elseif argh == 'smoke' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SMOKING', 0, false)   
					end   
				end
			
			elseif argh == 'beer' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_PARTYING', 0, false)   
					end   
				end
			
			elseif argh == 'kneel' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'CODE_HUMAN_MEDIC_KNEEL', 0, false)   
					end   
				end
			
			elseif argh == 'binoculars' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_BINOCULARS', 0, false)   
					end   
				end
			
			elseif argh == 'fishing' then
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'world_human_stand_fishing', 0, false)   
					end   
				end
			
			elseif argh == 'wallspy' then
				local ad = "mini@safe_cracking" --- insert the animation dic here
				local anim = "idle_base" --- insert the animation name here
				local player = PlayerPedId()
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'serveshots' then
				local ad = "mini@drinking" --- insert the animation dic here
				local anim = "shots_barman_b" --- insert the animation name here
				local player = PlayerPedId()
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'yoga' then
				local ad = "amb@world_human_yoga@male@base" --- insert the animation dic here
				local anim = "base_a" --- insert the animation name here
				local player = PlayerPedId()
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'writhe' then
				local ad = "combat@damage@writheidle_a" --- insert the animation dic here
				local anim = "writhe_idle_a" --- insert the animation name here
				local player = PlayerPedId()
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			elseif argh == 'pushups' then
				local ad = "amb@world_human_push_ups@male@base" --- insert the animation dic here
				local anim = "base" --- insert the animation name here
				local player = PlayerPedId()
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'situps' then
				local ad = "amb@world_human_sit_ups@male@base" --- insert the animation dic here
				local anim = "base" --- insert the animation name here
				local player = PlayerPedId()
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			end 
		end
	end
end, false)


----Use /testanimation command, you can use this to easily test new animations---
RegisterCommand("testanim",function(source, args)

	local ad = "mp_suicide" --- insert the animation dic here
	local anim = "pill" --- insert the animation name here
	local player = PlayerPedId()
	

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		TriggerEvent('chatMessage', '^2 Testing Animation')
		if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
			ClearPedTasks(PlayerPedId())
		else
			TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
			Wait(2750)
			ClearPedTasks(PlayerPedId())
		end       
	end
end, false)

---- For testing screen fx
--RegisterCommand("startfx",function(source, args)
--	SetTimecycleModifier("stoned")
--	SetPedMotionBlur(playerPed, true)
--	SetPedIsDrunk(playerPed, true)
--end, false)
--
--RegisterCommand("stopfx",function(source, args)
--	SetPedMotionBlur(playerPed, false)
--	SetPedIsDrunk(playerPed, false)
--	ClearTimecycleModifier()
--end, false)

----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ functions -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function(prop_name, secondaryprop_name)
	while true do
		Citizen.Wait(500)
		if IsPedRagdoll(PlayerPedId()) then 
			local playerPed = PlayerPedId()
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		elseif IsControlJustReleased(0, Keys['Z']) then
			local playerPed = PlayerPedId()
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		end
	end
end)	

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['Z']) and IsInputDisabled(0) and not isDead then
			ClearPedTasks(PlayerPedId())
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		end
	end
end)