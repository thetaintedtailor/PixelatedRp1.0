ESX						                      = nil
local CurrentAction		              = nil
local PlayerData		                = {}
local pedIsEntering                 = false -- if the player is in the process of lockpicking/jacking
local pedIsSeenEntering             = false -- whether a local is calling 911
local timer                         = 1     --in minutes - Set the time during the player is outlaw
local showOutlaw                    = true  --Set if show outlaw act on map
local blipTime                      = 35    --in second
local showcopsmisbehave             = true  --show notification when cops steal too
local timing                        = timer * 60000 --Don't touche it
local cancel                        = false
local playerPedCache                = {}

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)
--//////////////////////////////////////////////--
--                MAIN FUNCTION                 --
--//////////////////////////////////////////////--
RegisterNetEvent('esx_lockpick:onUse')
AddEventHandler('esx_lockpick:onUse', function()
  local playerPed	= GetPlayerPed(-1)
  local coords		= GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if DoesEntityExist(vehicle) then
      if Config.IgnoreAbort then
        TriggerServerEvent('esx_lockpick:removeKit')
      end

      Citizen.Wait(1000)

      pedIsEntering  = true

      RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
      while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
        Citizen.Wait(5)
      end
      TaskPlayAnim(GetPlayerPed(-1), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )			
      TriggerEvent("mythic_progressbar:client:progress", {
          name = "Lockpicking",
          duration = Config.LockTime * 1000,
          label = "Lockpicking In Progress",
          useWhileDead = false,
          canCancel = true,
          controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          },
          animation = {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            flags = 49,
          },
        }, function(status)
          if not status then
            cancel = false
            exports.pNotify:SendNotification({
                text = (_U('lockpicked_successful')), 
                type = "success", 
                timeout = 1000, 
                layout = "centerRight", 
                queue = "right",
                killer = false,
                animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
              })
          else
            cancel = true
          end
        end)

        Citizen.Wait(1000)

        Citizen.CreateThread(function()
          ThreadID = GetIdOfThisThread()
          CurrentAction = 'lockpick'
          local chance =	lockpickchance()
          if chance == true then
            if Config.CallCops then
              CheckForWitness()
            end

            Citizen.Wait(Config.LockTime * 1000)

            if CurrentAction ~= nil then
              if not cancel then
                SetVehicleAlarm(vehicle, true)
                SetVehicleAlarmTimeLeft(vehicle, Config.AlarmTime * 1000)
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                ClearPedTasksImmediately(playerPed)
                exports.pNotify:SendNotification({
                    text = (_U('vehicle_unlocked')), 
                    type = "success", 
                    timeout = 1000, 
                    layout = "centerRight", 
                    queue = "right",
                    killer = false,
                    animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
                  })
                SetVehicleNeedsToBeHotwired(vehicle, true)
                IsVehicleNeedsToBeHotwired(vehicle)
                TaskEnterVehicle(playerPed, vehicle, 10.0, -1, 1.0, 1, 0)
                Wait(2000)
                TriggerEvent("mythic_progressbar:client:progress", {
                    name = "Unjamming_Handbrakes",
                    duration = Config.JammedHandbrakeTime * 1000,
                    label = "Unjamming Handbrakes In Progress",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                      disableMovement = true,
                      disableCarMovement = true,
                      disableMouse = false,
                      disableCombat = true,
                    },
                    animation = {
                      animDict = "veh@std@ds@base",
                      anim = "hotwire",
                    },
                  }, function(status)
                    if not status then
                      pedIsEntering = false
                      exports.pNotify:SendNotification({
                          text = (_U('unjammed_handbrake')), 
                          type = "success", 
                          timeout = 1000, 
                          layout = "centerRight", 
                          queue = "right",
                          killer = false,
                          animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
                        })
                    end
                  end)
                end
              end
            else
              if Config.CallCops then
                CheckForWitness()
              end
              Citizen.Wait(Config.LockTime * 1000)
              ClearPedTasksImmediately(playerPed)
              ESX.ShowNotification(_U('picklock_failed'))

              if not Config.IgnoreAbort then
                TriggerServerEvent('esx_lockpick:removeKit')
              end
              
              CurrentAction = nil
              pedIsEntering = false

              TerminateThisThread()
            end
          end)
        end

        Citizen.CreateThread(function()
          Citizen.Wait(0)

          if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(_U('abort_hint'))
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustPressed(0, 178) then
              TerminateThread(ThreadID)
              ESX.ShowNotification(_U('aborted_lockpicking'))
              CurrentAction = nil
              pedIsEntering = false
            end
          end
        end)
      else
        ESX.ShowNotification(_U('no_vehicle_nearby'))
      end
end)
--//////////////////////////////////////////////--
--                LOCKPICK CHANCE               --
--//////////////////////////////////////////////--
function lockpickchance()
  return (math.random(100) <= Config.percentage)
end
--//////////////////////////////////////////////--
--                LOCK VEHICLES                 --
--//////////////////////////////////////////////--
local function has_value (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

function CheckForWitness()
  local pedWasReported = false

  if (math.random(100) <= Config.OnstarPercent) then
    TriggerServerEvent('esx_lockpick:Notify')
  else
    Citizen.CreateThread(function()
      while (pedIsEntering and not pedWasReported) do
        local pedLoc, distance

        local playerPed = PlayerPedId()
        local playerLoc = GetEntityCoords(playerPed, false)
        local foundPed  = nil

        for ped in EnumeratePeds() do
          if DoesEntityExist(ped) then
            pedLoc   = GetEntityCoords(ped, false)
            distance = GetDistanceBetweenCoords(playerLoc.x, playerLoc.y, playerLoc.z, pedLoc.x, pedLoc.y, pedLoc.z)

            if playerPed ~= ped and distance < Config.CallCopsDistance then
              foundPed = ped
              break
            end
          end
        end

        if (foundPed and math.random(100) <= Config.CallCopsPercent) then
          TaskTurnPedToFaceEntity(foundPed, playerPed, -1)
          Citizen.Wait(2000)
          TaskStartScenarioInPlace(foundPed, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true)
          TriggerServerEvent('esx_lockpick:Notify')
          pedWasReported = true
        end

        Citizen.Wait(10000)
      end
    end)
  end
end

Citizen.CreateThread(function()
  local playerPedId, veh, xPlayer, lock, lucky, blacklisted, pedd, plate

  while true do
    playerPedId = PlayerPedId()
    veh         = GetVehiclePedIsTryingToEnter(playerPedId)

    -- gets if player is entering vehicle
    if DoesEntityExist(veh) then
      -- gets vehicle player is trying to enter and its lock status
      xPlayer = ESX.GetPlayerData()
      lock    = GetVehicleDoorLockStatus(veh)

      -- Get the conductor door angle, open if value > 0.0
      --local doorAngle = GetVehicleDoorAngleRatio(veh, 0)

      -- normalizes chance
      if Config.chance >= 100 then
        Config.chance = 100
      elseif Config.chance <= 0 then
        Config.chance = 0
      end

      -- check if got lucky
      lucky = (math.random(100) < Config.chance)

      -- Set lucky if conductor door is open
      --[[ if doorAngle > 0.5 then
          lucky = true
        end ]]

      -- check if vehicle is in blacklist
      blacklisted = false
      for k,model in pairs(Config.blacklist) do
        if IsVehicleModel(veh, GetHashKey(model)) then
          blacklisted = true
          break
        end
      end

      -- gets ped that is driving the vehicle
      pedd  = GetPedInVehicleSeat(veh, -1)
      plate = GetVehicleNumberPlateText(veh)

      -- lock doors if not lucky or blacklisted
      if ((lock == 7) or (pedd ~= 0 and not IsPedPlayer(pedd))) then
        if has_value(Config.job_whitelist, xPlayer.job.name) then
          SetVehicleDoorsLocked(veh, 1)
          TriggerServerEvent('esx_lockpick:setVehicleDoorsForEveryone', {veh, 1, plate})
        else
          if not lucky or blacklisted then
            SetVehicleDoorsLocked(veh, 2)
            TriggerServerEvent('esx_lockpick:setVehicleDoorsForEveryone', {veh, 2, plate})
          else
            SetVehicleDoorsLocked(veh, 1)
            TriggerServerEvent('esx_lockpick:setVehicleDoorsForEveryone', {veh, 1, plate})
          end
        end
        Citizen.Wait(1000)
      end
    end
    Citizen.Wait(5)
  end
end)

Citizen.CreateThread(function()
  while true do
    playerPedCache = {}

    for i = 0, 255 do
      if NetworkIsPlayerActive(i) then
        playerPedCache[GetPlayerPed(i)] = i
      end
    end

    Citizen.Wait(30000)
  end
end)

function IsPedPlayer(ped)
  return playerPedCache[ped] ~= nil
end

RegisterNetEvent('esx_lockpick:setVehicleDoors')
AddEventHandler('esx_lockpick:setVehicleDoors', function(veh, doors)
  SetVehicleDoorsLocked(veh, doors)
end)
--//////////////////////////////////////////////--
--                 NOTIFICATION                 --
--//////////////////////////////////////////////--
GetPlayerName()

RegisterNetEvent('esx_lockpick:outlawLockNotify')
AddEventHandler('esx_lockpick:outlawLockNotify', function(alert)
  if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
    TriggerEvent('esx_lockpick:notify2', alert)
    PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
  end
end)

RegisterNetEvent("esx_lockpick:notify2")
AddEventHandler("esx_lockpick:notify2", function(msg)
  ESX.ShowAdvancedNotification(_U('911Call'), _U('911Lockpick'), msg, 'CHAR_CALL911', 7)
end)
--//////////////////////////////////////////////--
--                   NETWORK                    --
--//////////////////////////////////////////////--
Citizen.CreateThread(function()
  while true do
    Wait(100)
    if NetworkIsSessionStarted() then
      DecorRegister("IsLockOutlaw",  3)
      DecorSetInt(GetPlayerPed(-1), "IsLockOutlaw", 1)
      return
    end
  end
end)
--//////////////////////////////////////////////--
--           SUSPECT DESCRITION                 --
--//////////////////////////////////////////////--
Citizen.CreateThread( function()
  while true do
    Wait(1000)

    if pedIsSeenEntering then
      DecorSetInt(GetPlayerPed(-1), "IsLockOutlaw", 2)

      if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false then
        -- Do nothing
      elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave then
        Call911()
      else
        Call911()
      end
    end
  end
end)

function Call911()
  local plyPos  = GetEntityCoords(GetPlayerPed(-1),  true)
  local s1, s2  = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
  local street1 = GetStreetNameFromHashKey(s1)
  local street2 = GetStreetNameFromHashKey(s2)

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    local vehicle

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(plyPos.x, plyPos.y, plyPos.z, 5.0, 0, 71)
    end

    local vehName  = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local vehName2 = GetLabelText(vehName)
    local label    = vehName2 or vehName

    local sex = nil
    if skin.sex == 0 then
      sex = "male" --male/change it to your language
    else
      sex = "female" --female/change it to your language
    end
    TriggerServerEvent('esx_lockpick:InProgressPos', plyPos.x, plyPos.y, plyPos.z)
    if s2 == 0 then
      TriggerServerEvent('esx_lockpick:InProgressS1', street1, sex, label)
    elseif s2 ~= 0 then
      TriggerServerEvent('esx_lockpick:InProgress', street1, street2, sex, label)
    end
  end)

  Wait(3000)

  pedIsSeenEntering = false
end

--//////////////////////////////////////////////--
--              SUSPECT LOCATION                --
--//////////////////////////////////////////////--
RegisterNetEvent('esx_lockpick:location')
AddEventHandler('esx_lockpick:location', function(tx, ty, tz)
  if PlayerData.job.name == 'police' then
    local transT = 250
    local Blip = AddBlipForCoord(tx, ty, tz)
    SetBlipSprite(Blip,  10)
    SetBlipColour(Blip,  1)
    SetBlipAlpha(Blip,  transT)
    SetBlipAsShortRange(Blip,  false)
    while transT ~= 0 do
      Wait(blipTime * 4)
      transT = transT - 1
      SetBlipAlpha(Blip,  transT)
      if transT == 0 then
        SetBlipSprite(Blip,  2)
        return
      end
    end
  end
end)
--//////////////////////////////////////////////--
--               LOCKPICK CHECK                 --
--//////////////////////////////////////////////--
RegisterNetEvent('esx_lockpick:Enable')
AddEventHandler('esx_lockpick:Enable', function()
  pedIsSeenEntering = true
end)
