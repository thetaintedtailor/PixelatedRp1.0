local currentCharacter = { firstname = "", lastname = "" }
local fetchInProgress  = false
local lastFetched      = GetGameTimer()
local timeout          = 1000 * 60 * 10

-- Exported function for grabbing the current character data and maybe recaching
function getCharacter()
  if GetGameTimer() > (lastFetched + timeout) then
    refreshCharacter()
  end

  return currentCharacter
end

function refreshCharacter()
  if not fetchInProgress then
    fetchInProgress = true
    TriggerServerEvent("pixelated_utils:getCharacter")
  end
end

-- Callback for dealing with the located character data after the server finds it.
RegisterNetEvent("pixelated_utils:gotCharacter")
AddEventHandler("pixelated_utils:gotCharacter", function(data)
  currentCharacter = data
  lastFetched = GetGameTimer()
  fetchInProgress = false
end)

AddEventHandler("playerSpawned", function(_spawnInfo)
  refreshCharacter()
end)
