ESX                 = nil
local IsAlreadyDrug = false
local DrugLevel     = -1
local CurrentDrug   = nil
local ActiveDrugs   = {}

function GetStoned(level, start)
  Citizen.CreateThread(function()
    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 1 then -- overdose
      SetEntityHealth(playerPed, 0)
      ClearTimecycleModifier()
      ResetScenarioTypesEnabled()
      ResetPedMovementClipset(playerPed, 0)
      SetPedMotionBlur(playerPed, false)
    else
      SetTimecycleModifier("spectator5")
      SetPedMotionBlur(playerPed, true)
      SetPedIsDrunk(playerPed, true)
    end

    if start then
      DoScreenFadeIn(800)
    end
  end)
end

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
      Wait(2500)

      TriggerEvent('esx_status:getStatus', 'drug', function(status)
        if status.val > 0 then
          local start = true
          local level = 0

          if IsAlreadyDrug then
            start = false
          end

          if status.val <= 999999 then
            level = 0
          else
            level = 1
          end

          if level ~= DrugLevel then
            GetStoned(level, start)
          end

          if CurrentDrug ~= nil then
            CurrentDrug:use()
            CurrentDrug = nil
          end

          IsAlreadyDrug = true
          DrugLevel     = level
        end

        if status.val == 0 then
          if IsAlreadyDrug then
            Normal()

            for item, drug in pairs(ActiveDrugs) do
              drug:wearOff()
            end

            ActiveDrugs = {}
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
    TriggerEvent("esx_status:getStatus", "drunk", function(status)
      if status.val <= 0 then
        DoScreenFadeOut(800)
        Wait(1000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        SetPedMotionBlur(GetPlayerPed(-1), false)
        SetPedIsDrunk(playerPed, false)
        DoScreenFadeIn(800)
      end
    end)
  end)
end

function DrugFromItem(item)
  if item == "weed_pooch" then
    return Weed:new()
  elseif item == "opium_pooch" then
    return Opium:new()
  elseif item == "meth_pooch" then
    return Meth:new()
  elseif item == "coke_pooch" then
    return Coke:new()
  elseif item == "crack" then
    return Crack:new()
  elseif item == "k3v" then
    return K3v:new()
  elseif item == "xanax" then
    return Xanax:new()
  elseif item == "vicodin" then
    return Vicodin:new()
  elseif item == "amoxicillin" then
    return Amoxicillin:new()
  elseif item == "ibuprofen" then
    return Ibuprofen:new()
  end
end

-- Triggered by server-side when a drug item is used
RegisterNetEvent('esx_drugeffects:onDrugs')
AddEventHandler('esx_drugeffects:onDrugs', function(drug)
  local playerPed = GetPlayerPed(-1)

  ActiveDrugs[drug] = ActiveDrugs[drug] or DrugFromItem(drug)
  CurrentDrug       = ActiveDrugs[drug]

  CurrentDrug:animate()
end)

function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Citizen.Wait(5)
  end
end