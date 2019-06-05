ESX                  = nil
local IsAlreadyDrug = false
local DrugLevel     = -1

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'drug', 0, '#9ec617', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drug', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadyDrug then
            start = false
          end

          local level = 0

          if status.val <= 999999 then
            level = 0
          else
            overdose()
          end

          if level ~= DrugLevel then
          end

          IsAlreadyDrug = true
          DrugLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadyDrug then
            Normal()
          end

          IsAlreadyDrug = false
          DrugLevel     = -1

				end

			end)

		end

	end)

end)

--When effects ends go back to normal
function Normal()

  Citizen.CreateThread(function()
    
    local playerPed = GetPlayerPed(-1)
			
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    --ResetPedMovementClipset(playerPed, 0) <- it might cause the push of the vehicles
    SetPedMotionBlur(playerPed, false)
  end)

end

--In case too much drugs dies of overdose set everything back
function overdose()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)
	
    SetEntityHealth(playerPed, 0)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedMotionBlur(playerPed, false)

  end)

end

--Drugs Effects

--Weed
RegisterNetEvent('esx_drugeffects:onWeed')
AddEventHandler('esx_drugeffects:onWeed', function()
  
  local playerPed = GetPlayerPed(-1)

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    
    --Efects
    local player = PlayerId()
    SetEntityHealth(GetPlayerPed(-1),200)
end)

--Opium
RegisterNetEvent('esx_drugeffects:onOpium')
AddEventHandler('esx_drugeffects:onOpium', function()
  
  local playerPed = GetPlayerPed(-1)
  
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    
    --Efects
    local player = PlayerId()
    AddArmourToPed(playerPed, 100)
 end)

--Meth
RegisterNetEvent('esx_drugeffects:onMeth')
AddEventHandler('esx_drugeffects:onMeth', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)

   --Effects
    local player = PlayerId()  
    SetRunSprintMultiplierForPlayer(player, 1.3)
    AddArmourToPed(playerPed, 35)  
    Wait(30000)

    SetRunSprintMultiplierForPlayer(player, 1.0)
    ESX.ShowNotification('You feel slower') 
end)

--Coke
RegisterNetEvent('esx_drugeffects:onCoke')
AddEventHandler('esx_drugeffects:onCoke', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    
    --Efects
    local player = PlayerId()
    SetRunSprintMultiplierForPlayer(player, 1.3)
      
    Wait(30000)

    SetRunSprintMultiplierForPlayer(player, 1.0)
    ESX.ShowNotification('You feel slower') 
    
end)

--crack
RegisterNetEvent('esx_drugeffects:onCrack')
AddEventHandler('esx_drugeffects:onCrack', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)

    --Efects
    local player = PlayerId()
    local timer = 0
    while timer < 30 do
      print()
      SetRunSprintMultiplierForPlayer(player, 1.3)
      ResetPlayerStamina(player)
      Citizen.Wait(2000)
      timer = timer + 2  
    end
    Wait(5000)

    SetRunSprintMultiplierForPlayer(player, 1.0)
    ESX.ShowNotification('You feel slower')
      
end)

--k3v
RegisterNetEvent('esx_drugeffects:onK3v')
AddEventHandler('esx_drugeffects:onK3v', function()
  
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  local player = PlayerPedId()
  local ad = "mp_suicide"
  local anim = "pill"
  loadAnimDict(ad)

    TaskPlayAnim(player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
	  Wait(2750)
		ClearPedTasks(player)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)

    --Effects
    local playerId = PlayerId()
    local timer = 0
    while timer < 30 do
      print()
      SetRunSprintMultiplierForPlayer(playerId, 1.3)
      ResetPlayerStamina(playerId)
      Citizen.Wait(2000)
      timer = timer + 2  
    end
    Wait(5000)

    SetRunSprintMultiplierForPlayer(playerId, 1.0)
    ESX.ShowNotification('You feel slower')
    
    
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end