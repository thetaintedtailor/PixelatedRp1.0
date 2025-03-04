ESX               = nil

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

local isRunningWorkaround = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle
	local isInVehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
		isInVehicle = true
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 7)
		isInVehicle = false
	end

	if not DoesEntityExist(vehicle) then
		ESX.ShowNotification("No vehicles to lock nearby.")
		return
	end

	local lockStatus = GetVehicleDoorLockStatus(vehicle)

	if isInVehicle then -- You can lock/unlock any vehicle you're already in
		if lockStatus == 1 then -- unlocked
			Lock(vehicle)
		elseif (lockStatus == 4 or lockStatus == 2 or lockStatus == 7) then -- locked
			Unlock(vehicle)
		end
	else
		ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

			if isOwnedVehicle then
				if lockStatus == 1 then -- unlocked
					Lock(vehicle)
				elseif (lockStatus == 2 or lockStatus == 4 or lockStatus == 7) then -- locked
					Unlock(vehicle)
				end
			else 
				ESX.ShowNotification("You do not own this vehicle.")
			end

		end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
	end
end

function Lock(vehicle)
	SetVehicleDoorsLocked(vehicle, 2)
	PlayVehicleDoorCloseSound(vehicle, 1)

	TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_locked') } })
end

function Unlock(vehicle)
	SetVehicleDoorsLocked(vehicle, 1)
	PlayVehicleDoorOpenSound(vehicle, 0)

	TriggerEvent('chat:addMessage', { args = { _U('message_title'), _U('message_unlocked') } })
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if IsControlJustReleased(0, Keys['U']) and IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
	
		-- D-pad down on controllers works, too!
		--[[elseif IsControlJustReleased(0, 173) and not IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
		end]]
		end
	end
end)
