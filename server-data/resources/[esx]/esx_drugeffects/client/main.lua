ESX                 = nil
DrugEffects         = {}
local IsAlreadyDrug = false
local DrugLevel     = -1
local CurrentDrug   = nil
local ActiveDrugs   = {}

function CheckOverdose(value)
  local playerPed = GetPlayerPed(-1)
  local chance    = 0.05 * (25 ^ (value / 1000000)) - 0.12 -- y = a(b^x)+c w/ assumed status max of 1 mil

  if math.random() < chance then
    ESX.ShowNotification("You have ~r~passed out~s~!")
    SetEntityHealth(playerPed, 0)
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    StopScreenEffect("DrugsTrevorClownsFightIn")
    StopScreenEffect("DrugsTrevorClownsFightOut")
  end
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
    TriggerEvent("esx_status:set", "drug", 0)

    local lastValue = 0

    while true do
      Wait(2500)

      TriggerEvent('esx_status:getStatus', 'drug', function(status)
        if CurrentDrug ~= nil then
          CurrentDrug:use()
          CurrentDrug = nil
        end

        if status.val > 0 then
          local start = true

          if IsAlreadyDrug then
            start = false
          end

          if start or not GetScreenEffectIsActive("DrugsTrevorClownsFightIn") then
            StartScreenEffect("DrugsTrevorClownsFightIn", 0, true)
          end

          if status.val > lastValue then -- we just used
            CheckOverdose(status.val)
          end

          IsAlreadyDrug = true
        elseif status.val <= 0 then
          if IsAlreadyDrug then
            Normal()

            for item, drug in pairs(ActiveDrugs) do
              drug:wearOff()
            end

            ActiveDrugs = {}
          end

          IsAlreadyDrug = false
        end

        lastValue = status.val
      end)
    end
  end)
end)

--When effects ends go back to normal
function Normal()
  Citizen.CreateThread(function()
    local playerPed = GetPlayerPed(-1)

    TriggerEvent("esx_status:getStatus", "drunk", function(status)
      if status.val <= 0 then
        ResetScenarioTypesEnabled()
        StartScreenEffect("DrugsTrevorClownsFightOut", 0, false)
        StopScreenEffect("DrugsTrevorClownsFightIn")
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
