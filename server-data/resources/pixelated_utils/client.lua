local currentCharacter = { firstname = "", lastname = "" }
local fetchInProgress  = false
local lastFetched      = GetGameTimer()
local timeout          = 1000 * 60 * 10

-- Exported function for grabbing the current character data and maybe recaching
function getCharacter()
  if string.len(currentCharacter.firstname) == 0 or GetGameTimer() > (lastFetched + timeout) then
    refreshCharacter()
  end

  return currentCharacter
end

function refreshCharacter()
  if not fetchInProgress then
    fetchInProgress = true
    TriggerServerEvent("pixelated_utils:gettingCharacter")
  end
end

-- Callback for dealing with the located character data after the server finds it.
RegisterNetEvent("pixelated_utils:gotCharacter")
AddEventHandler("pixelated_utils:gotCharacter", function(data)
  if data ~= nil and data.firstname ~= nil then
    currentCharacter = data
    lastFetched = GetGameTimer()
    TriggerEvent("pixelated_utils:refreshedCharacter", currentCharacter)
  end

  fetchInProgress = false
end)

AddEventHandler("playerSpawned", function(_spawnInfo)
  refreshCharacter()
end)

AddEventHandler("pixelated_utils:refreshCharacter", function()
  refreshCharacter()
end)

AddEventHandler("onClientResourceStart", function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  refreshCharacter()
end)