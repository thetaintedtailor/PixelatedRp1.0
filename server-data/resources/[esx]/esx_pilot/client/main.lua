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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local OnJob                     = false
local CurrentCustomer           = nil
local CurrentCustomerBlip       = nil
local DestinationBlip           = nil
local IsNearCustomer            = false
local CustomerIsEnteringVehicle = false
local CustomerEnteredVehicle    = false
local TargetCoords              = nil

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function DrawSub(msg, time)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(msg)
  DrawSubtitleTimed(time, 1)
end

function ShowLoadingPromt(msg, time, type)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING")
    AddTextComponentString(msg)
    N_0xbd12f8228410d9b4(type)
    Citizen.Wait(time)
    N_0x10d373323e5b9c0d()
  end)
end

function GetRandomWalkingNPC()

  local search = {}
  local peds   = ESX.Game.GetPeds()

  for i=1, #peds, 1 do
    if IsPedHuman(peds[i]) and IsPedWalking(peds[i]) and not IsPedAPlayer(peds[i]) then
      table.insert(search, peds[i])
    end
  end

  if #search > 0 then
    return search[GetRandomIntInRange(1, #search)]
  end

  print('Using fallback code to find walking ped')

  for i=1, 250, 1 do

    local ped = GetRandomPedAtCoord(0.0,  0.0,  0.0,  math.huge + 0.0,  math.huge + 0.0,  math.huge + 0.0,  26)

    if DoesEntityExist(ped) and IsPedHuman(ped) and IsPedWalking(ped) and not IsPedAPlayer(ped) then
      table.insert(search, ped)
    end

  end

  if #search > 0 then
    return search[GetRandomIntInRange(1, #search)]
  end

end

function ClearCurrentMission()

  if DoesBlipExist(CurrentCustomerBlip) then
    RemoveBlip(CurrentCustomerBlip)
  end

  if DoesBlipExist(DestinationBlip) then
    RemoveBlip(DestinationBlip)
  end

  CurrentCustomer           = nil
  CurrentCustomerBlip       = nil
  DestinationBlip           = nil
  IsNearCustomer            = false
  CustomerIsEnteringVehicle = false
  CustomerEnteredVehicle    = false
  TargetCoords              = nil

end

function StartPilotJob()

  ShowLoadingPromt(_U('taking_service') .. 'Pilot/Uber', 5000, 3)
  ClearCurrentMission()

  OnJob = true

end

function StopPilotJob()

  local playerPed = GetPlayerPed(-1)

  if IsPedInAnyVehicle(playerPed, false) and CurrentCustomer ~= nil then
    local vehicle = GetVehiclePedIsIn(playerPed,  false)
    TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)

    if CustomerEnteredVehicle then
      TaskGoStraightToCoord(CurrentCustomer,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z,  1.0,  -1,  0.0,  0.0)
    end

  end

  ClearCurrentMission()

  OnJob = false

  DrawSub(_U('mission_complete'), 5000)

end

function OpenPilotActionsMenu()

  local elements = {
    {label = _U('spawn_plane'), value = 'spawn_plane'},
    {label = _U('spawn_veh'), value = 'spawn_vehicle'},
    {label = _U('deposit_stock'), value = 'put_stock'},
    {label = _U('take_stock'), value = 'get_stock'}
  }

  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'pilot_actions',
    {
      title    = 'Pilot',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'put_stock' then
        OpenPutStocksMenu()
      end

      if data.current.value == 'get_stock' then
        OpenGetStocksMenu()
      end

	  if data.current.value == 'spawn_plane' then

        if Config.EnableSocietyOwnedVehicles then

          local elements = {}

          ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

            for i=1, #vehicles, 1 do
              table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
            end

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'vehicle_spawner',
              {
                title    = _U('spawn_veh'),
                align    = 'top-left',
                elements = elements,
              },
              function(data, menu)

                menu.close()

                local vehicleProps = data.current.value

                ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 750.0, function(vehicle)
                  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                  local playerPed = GetPlayerPed(-1)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                end)

                TriggerServerEvent('esx_society:removeVehicleFromGarage', 'pilot', vehicleProps)

              end,
              function(data, menu)
                menu.close()
              end
            )

          end, 'pilot')

        else

          menu.close()

          if Config.MaxInService == -1 then

            local playerPed = GetPlayerPed(-1)
            local coords    = Config.Zones.VehicleSpawnPoint.Pos

            ESX.Game.SpawnVehicle('volatus', coords, 750.0, function(vehicle)
              TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                local playerPed = GetPlayerPed(-1)
                local coords    = Config.Zones.VehicleSpawnPoint.Pos

                ESX.Game.SpawnVehicle('volatus', coords, 750.0, function(vehicle)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                end)

              else

                ESX.ShowNotification(_U('full_service') .. inServiceCount .. '/' .. maxInService)

              end

            end, 'pilot')

          end

        end

      end
	  
      if data.current.value == 'spawn_vehicle' then

        if Config.EnableSocietyOwnedVehicles then

          local elements = {}

          ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

            for i=1, #vehicles, 1 do
              table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
            end

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'vehicle_spawner',
              {
                title    = _U('spawn_veh'),
                align    = 'top-left',
                elements = elements,
              },
              function(data, menu)

                menu.close()

                local vehicleProps = data.current.value

                ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 750.0, function(vehicle)
                  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                  local playerPed = GetPlayerPed(-1)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                end)

                TriggerServerEvent('esx_society:removeVehicleFromGarage', 'pilot', vehicleProps)

              end,
              function(data, menu)
                menu.close()
              end
            )

          end, 'pilot')

        else

          menu.close()

          if Config.MaxInService == -1 then

            local playerPed = GetPlayerPed(-1)
            local coords    = Config.Zones.VehicleSpawnPoint.Pos

            ESX.Game.SpawnVehicle('baller4', coords, 750.0, function(vehicle)
              TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                local playerPed = GetPlayerPed(-1)
                local coords    = Config.Zones.VehicleSpawnPoint.Pos

                ESX.Game.SpawnVehicle('baller4', coords, 750.0, function(vehicle)
                  TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                end)

              else

                ESX.ShowNotification(_U('full_service') .. inServiceCount .. '/' .. maxInService)

              end

            end, 'pilot')

          end

        end

      end

      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'pilot', function(data, menu)
          menu.close()
        end)
      end

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'pilot_actions_menu'
      CurrentActionMsg  = _U('press_to_open')
      CurrentActionData = {}

    end
  )

end

function OpenMobilePilotActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_pilot_actions',
    {
      title    = 'Pilot',
      elements = {
        {label = _U('billing'), value = 'billing'}
      }
    },
    function(data, menu)

      if data.current.value == 'billing' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'billing',
          {
            title = _U('invoice_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('amount_invalid'))
            else

              menu.close()

              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('no_players_near'))
              else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_pilot', 'Pilot', amount)
              end

            end

          end,
          function(data, menu)
            menu.close()
          end
        )

      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_pilot:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = 'Pilot Stock',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_pilot:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('esx_pilot:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_pilot:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_pilot:hasEnteredMarker', function(zone)

  if zone == 'PilotActions' then
    CurrentAction     = 'pilot_actions_menu'
    CurrentActionMsg  = _U('press_to_open')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed,  false) then
      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('store_veh')
      CurrentActionData = { vehicle = vehicle }
    end

  end

end)

AddEventHandler('esx_pilot:hasExitedMarker', function(zone)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

  local specialContact = {
    name       = 'Pilot',
    number     = 'pilot',
    base64Icon = 'data:image/png;base64,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',
  }

  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

-- Create Blips
Citizen.CreateThread(function()

  local blip = AddBlipForCoord(Config.Zones.PilotActions.Pos.x, Config.Zones.PilotActions.Pos.y, Config.Zones.PilotActions.Pos.z)

  SetBlipSprite (blip, 43)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 1.0)
  SetBlipColour (blip, 39)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Aéroport")
  EndTextCommandSetBlipName(blip)

end)

-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'pilot' then

      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k,v in pairs(Config.Zones) do
        if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end

    end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'pilot' then

      local coords      = GetEntityCoords(GetPlayerPed(-1))
      local isInMarker  = false
      local currentZone = nil

      for k,v in pairs(Config.Zones) do
        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInMarker  = true
          currentZone = k
        end
      end

      if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
        HasAlreadyEnteredMarker = true
        LastZone                = currentZone
        TriggerEvent('esx_pilot:hasEnteredMarker', currentZone)
      end

      if not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('esx_pilot:hasExitedMarker', LastZone)
      end

    end

  end
end)

-- Pilot
Citizen.CreateThread(function()

  while true do

    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)

    if OnJob then

      if CurrentCustomer == nil then

        DrawSub(_U('drive_search_pass'), 10000)

        if IsPedInAnyVehicle(playerPed,  false) and GetEntitySpeed(playerPed) > 0 then

          local waitUntil = GetGameTimer() + GetRandomIntInRange(30000,  45000)

          while OnJob and waitUntil > GetGameTimer() do
            Citizen.Wait(0)
          end

          if OnJob and IsPedInAnyVehicle(playerPed,  false) and GetEntitySpeed(playerPed) > 0 then

            CurrentCustomer = GetRandomWalkingNPC()

            if CurrentCustomer ~= nil then

              CurrentCustomerBlip = AddBlipForEntity(CurrentCustomer)

              SetBlipAsFriendly(CurrentCustomerBlip, 1)
              SetBlipColour(CurrentCustomerBlip, 2)
              SetBlipCategory(CurrentCustomerBlip, 3)
              SetBlipRoute(CurrentCustomerBlip,  true)

              SetEntityAsMissionEntity(CurrentCustomer,  true, false)
              ClearPedTasksImmediately(CurrentCustomer)
              SetBlockingOfNonTemporaryEvents(CurrentCustomer, 1)

              local standTime = GetRandomIntInRange(60000,  180000)

              TaskStandStill(CurrentCustomer, standTime)

              ESX.ShowNotification(_U('customer_found'))

            end

          end

        end

      else

        if IsPedFatallyInjured(CurrentCustomer) then

          ESX.ShowNotification(_U('client_unconcious'))

          if DoesBlipExist(CurrentCustomerBlip) then
            RemoveBlip(CurrentCustomerBlip)
          end

          if DoesBlipExist(DestinationBlip) then
            RemoveBlip(DestinationBlip)
          end

          SetEntityAsMissionEntity(CurrentCustomer,  false, true)

          CurrentCustomer           = nil
          CurrentCustomerBlip       = nil
          DestinationBlip           = nil
          IsNearCustomer            = false
          CustomerIsEnteringVehicle = false
          CustomerEnteredVehicle    = false
          TargetCoords              = nil

        end

        if IsPedInAnyVehicle(playerPed,  false) then

          local vehicle          = GetVehiclePedIsIn(playerPed,  false)
          local playerCoords     = GetEntityCoords(playerPed)
          local customerCoords   = GetEntityCoords(CurrentCustomer)
          local customerDistance = GetDistanceBetweenCoords(playerCoords.x,  playerCoords.y,  playerCoords.z,  customerCoords.x,  customerCoords.y,  customerCoords.z)

          if IsPedSittingInVehicle(CurrentCustomer,  vehicle) then

            if CustomerEnteredVehicle then

              local targetDistance = GetDistanceBetweenCoords(playerCoords.x,  playerCoords.y,  playerCoords.z,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z)

              if targetDistance <= 10.0 then

                TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)

                ESX.ShowNotification(_U('arrive_dest'))

                TaskGoStraightToCoord(CurrentCustomer,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z,  1.0,  -1,  0.0,  0.0)
                SetEntityAsMissionEntity(CurrentCustomer,  false, true)

                TriggerServerEvent('esx_pilot:success')

                RemoveBlip(DestinationBlip)

                local scope = function(customer)
                  ESX.SetTimeout(60000, function()
                    DeletePed(customer)
                  end)
                end

                scope(CurrentCustomer)

                CurrentCustomer           = nil
                CurrentCustomerBlip       = nil
                DestinationBlip           = nil
                IsNearCustomer            = false
                CustomerIsEnteringVehicle = false
                CustomerEnteredVehicle    = false
                TargetCoords              = nil

              end

              if TargetCoords ~= nil then
                DrawMarker(1, TargetCoords.x, TargetCoords.y, TargetCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
              end

            else

              RemoveBlip(CurrentCustomerBlip)

              CurrentCustomerBlip = nil

              TargetCoords = Config.JobLocations[GetRandomIntInRange(1,  #Config.JobLocations)]

              local street = table.pack(GetStreetNameAtCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z))
              local msg    = nil

              if street[2] ~= 0 and street[2] ~= nil then
                msg = string.format(_U('take_me_to_near', GetStreetNameFromHashKey(street[1]),GetStreetNameFromHashKey(street[2])))
              else
                msg = string.format(_U('take_me_to', GetStreetNameFromHashKey(street[1])))
              end

              ESX.ShowNotification(msg)

              DestinationBlip = AddBlipForCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z)

              BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Destination")
              EndTextCommandSetBlipName(blip)

              SetBlipRoute(DestinationBlip,  true)

              CustomerEnteredVehicle = true

            end

          else

            DrawMarker(1, customerCoords.x, customerCoords.y, customerCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)

            if not CustomerEnteredVehicle then

              if customerDistance <= 30.0 then

                if not IsNearCustomer then
                  ESX.ShowNotification(_U('close_to_client'))
                  IsNearCustomer = true
                end

              end

              if customerDistance <= 100.0 then

                if not CustomerIsEnteringVehicle then

                  ClearPedTasksImmediately(CurrentCustomer)

                  local seat = 0

                  for i=4, 0, 1 do
                    if IsVehicleSeatFree(vehicle,  seat) then
                      seat = i
                      break
                    end
                  end

                  TaskEnterVehicle(CurrentCustomer,  vehicle,  -1,  seat,  2.0,  1)

                  CustomerIsEnteringVehicle = true

                end

              end

            end

          end

        else

          DrawSub(_U('return_to_veh'), 5000)

        end

      end

    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'pilot' and (GetGameTimer() - GUI.Time) > 300 then

        if CurrentAction == 'pilot_actions_menu' then
          OpenPilotActionsMenu()
        end

        if CurrentAction == 'delete_vehicle' then

          local playerPed = GetPlayerPed(-1)

          if Config.EnableSocietyOwnedVehicles then
            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'pilot', vehicleProps)
          else
            if GetEntityModel(CurrentActionData.vehicle) == GetHashKey('pilot') then
              if Config.MaxInService ~= -1 then
                TriggerServerEvent('esx_service:disableService', 'pilot')
              end
            end
          end

          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end

    end

    if IsControlPressed(0,  Keys['F6']) and Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'pilot' and (GetGameTimer() - GUI.Time) > 150 then
      OpenMobilePilotActionsMenu()
      GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0,  Keys['DELETE']) and (GetGameTimer() - GUI.Time) > 150 then

      if OnJob then
        StopPilotJob()
      else

        if PlayerData.job ~= nil and PlayerData.job.name == 'pilot' then

          local playerPed = GetPlayerPed(-1)

          if IsPedInAnyVehicle(playerPed,  false) then

            local vehicle = GetVehiclePedIsIn(playerPed,  false)

            if PlayerData.job.grade >= 3 then
              StartPilotJob()
            else
              if GetEntityModel(vehicle) == GetHashKey('volatus') then
                StartPilotJob()
              else
                ESX.ShowNotification(_U('must_in_pilot'))
              end
            end

          else

            if PlayerData.job.grade >= 3 then
              ESX.ShowNotification(_U('must_in_vehicle'))
            else
              ESX.ShowNotification(_U('must_in_pilot'))
            end

          end

        end

      end

      GUI.Time = GetGameTimer()

    end

  end
end)
