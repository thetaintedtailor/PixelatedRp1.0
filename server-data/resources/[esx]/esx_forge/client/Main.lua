local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil
local ironQTE					= 0
local steelQTE 			        = 0
local carbonQTE 			    = 0
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_forge:hasEnteredMarker', function(zone)

	ESX.UI.Menu.CloseAll()
	
	if zone == 'exitMarker' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('exit_marker')
		CurrentActionData = {}
    end
    
    if zone == 'IronProcessing' then
		if ironQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_iron')
			CurrentActionData = {}
		end
    end
end)   

AddEventHandler('esx_forge:hasExitedMarker', function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
    
    TriggerServerEvent('esx_forge:stopTransformIron')
    
end)


    -- Render markers
Citizen.CreateThread(function()
	print(Config.MarkerColor.r)
    while true do

        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
        end

	end

end)

-- Render Blips
Citizen.CreateThread(function()
  if Config.DisableBlip == false then
	for i=1, #Config.Map, 1 do
		
		local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		SetBlipSprite (blip, Config.Map[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.Map[i].color)
		SetBlipScale  (blip, Config.Map[i].scale)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Map[i].name)
		EndTextCommandSetBlipName(blip)
	end
  end
end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_forge:ReturnInventory')
AddEventHandler('esx_forge:ReturnInventory', function(ironNbr, steelpNbr, carbonNbr, jobName, currentZone)
	ironQTE  = ironNbr
    steelQTE = steelpNbr
    carbonQTE = carbonNbr
	myJob    = jobName
	TriggerEvent('esx_forge:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_forge:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_forge:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_forge:hasEnteredMarker', 'exitMarker')
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'exitMarker' then
					TriggerEvent('esx_forge:hasExitedMarker', lastZone)
					Citizen.Wait(1000)
				elseif CurrentAction == 'IronProcessing' then
					TriggerServerEvent('esx_forge:startTransformIron')
					TriggerEvent('esx_forge:TransformIronAnimation')
				else
					isInZone = false
				end
				CurrentAction = nil
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed( -1 )
			if IsControlJustPressed(0, 32) or IsControlJustPressed(0, 33) then
				TriggerServerEvent('esx_forge:stopTransformIron')
		end
	end
end)

RegisterNetEvent('esx_forge:TransformIronAnimation')
AddEventHandler('esx_forge:TransformIronAnimation', function()
    local ped = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(playerPed, true))
    if not IsEntityPlayingAnim(ped, "anim@amb@business@weed@weed_sorting_seated@", "sorter_right_sort_v3_sorter02", 3) then
        RequestAnimDict("anim@amb@business@weed@weed_sorting_seated@")
        while not HasAnimDictLoaded("anim@amb@business@weed@weed_sorting_seated@") do
            Citizen.Wait(100)
        end
		SetEntityCoords(PlayerPedId(), 1037.53, -3205.37, -39.18)
        SetEntityHeading(PlayerPedId(), 269.5)
        Wait(100)

        TaskPlayAnim(ped, "anim@amb@business@weed@weed_sorting_seated@", "sorter_right_sort_v3_sorter02", 8.0, -8, -1, 49, 0, 0, 0, 0)
        Wait(2000)
        while IsEntityPlayingAnim(ped, "anim@amb@business@weed@weed_sorting_seated@", "sorter_right_sort_v3_sorter02", 3) do
            Wait(1)
            if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
                ClearPedTasksImmediately(ped)
                break
            end
        end
    end
end)