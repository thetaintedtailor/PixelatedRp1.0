


local PlayerData = {}

ESX = nil



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local shotTimeout = 5000

--Detect a gunshot and spawn a shell casing
Citzen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        ped = GetPlayerPed(-1)
		if IsPedShooting(ped) then
			local wep = {GetSelectedPedWeapon(ped)}
			TriggerServerEvent('forensics:weaponFired', 
		end
end)