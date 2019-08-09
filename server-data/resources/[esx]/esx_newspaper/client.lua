ESX = nil
local display = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx_newspaper:theNewspaper')
AddEventHandler('esx_newspaper:theNewspaper', function(value)
  SendNUIMessage({
    type = "logo",
    display = value
  })
end)

-----

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

RegisterNetEvent("esx_newspaper:displayNewspaper")
AddEventHandler("esx_newspaper:displayNewspaper", function()
  Citizen.CreateThread(function()
	  local display = true

    ESX.UI.Menu.CloseAll()

	  TriggerEvent('esx_newspaper:theNewspaper', true)

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    local boneIndex = GetPedBoneIndex(playerPed, 57005)

    ESX.Game.SpawnObject('prop_cs_newspaper', {
      x = coords.x,
      y = coords.y,
      z = coords.z + 2
    }, function(object)

    AttachEntityToEntity(object, playerPed, boneIndex, 0.05, 0.3, -0.4, 0.0, 100.0, 10.0, true, true, false, true, 1, true)

    while display do
      Citizen.Wait(1)
      ShowInfo('~w~ Tryck ~INPUT_CONTEXT~ för att slänga tidningen', 0)
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('esx_newspaper:theNewspaper', false)
        Citizen.Wait(3000)
        DeleteObject(object)
      end

      Citizen.CreateThread(function()

        RequestAnimDict('missmic3')
    
        while not HasAnimDictLoaded('missmic3') do
          Citizen.Wait(0)
        end

        repeat
          TaskPlayAnim(GetPlayerPed(-1), 'missmic3' ,'newspaper_idle_loop_dave' ,8.0, -8.0, -1, 0, 0, false, false, false )
          Citizen.Wait(3000)
        until display == false
      end)
    end
    end)
  end)
end)