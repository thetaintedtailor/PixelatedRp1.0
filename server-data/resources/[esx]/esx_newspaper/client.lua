ESX = nil
local display = false
playerPropList = {}

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
        ShowInfo('~w~ Press ~INPUT_CONTEXT~ to throw newspaper away', 0)


        Citizen.CreateThread(function()
          RequestAnimDict('missmic3')
          while not HasAnimDictLoaded('missmic3') do
            Citizen.Wait(0)
          end

          while display == true do
            TaskPlayAnim(GetPlayerPed(-1), 'missmic3' ,'newspaper_idle_loop_dave' ,8.0, -8.0, -1, 59, 0, false, false, false )
            Citizen.Wait(3000)
          end
        end)

        if (IsControlJustPressed(1, 20)) then
          display = false
          TriggerEvent('esx_newspaper:theNewspaper', false)
          Citizen.Wait(3000)
          DeleteObject(object)
          ClearPedTasks(GetPlayerPed(-1))
        end

      end
    end)
  end)
end)

RegisterCommand('newspaper', function(source, args)
  local player = PlayerPedId()
  local ad = "missmic3"
  
  local prop_name = prop_name or 'prop_cs_newspaper'
  local prop;
  
  if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
    loadAnimDict( ad )
    if ( IsEntityPlayingAnim( player, ad, "newspaper_idle_loop_dave", 3 ) ) then 
      TaskPlayAnim( player, ad, "newspaper_idle_outro_dave", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
      Wait (100)
      ClearPedSecondaryTask(PlayerPedId())
      DetachEntity(prop, 1, 1)
      DeleteObject(prop)
    else
      local x,y,z = table.unpack(GetEntityCoords(player))
      prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
      AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.05, 0.3, -0.4, 0.0, 100.0, 10.0, true, true, false, true, 1, true) -- newspaper
      --AttachEntityToEntity(object, playerPed, boneIndex, 0.05, 0.3, -0.4, 0.0, 100.0, 10.0, true, true, false, true, 1, true)
      TaskPlayAnim( player, ad, "newspaper_idle_loop_dave", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
      table.insert(playerPropList, prop)
    end     
  end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end
