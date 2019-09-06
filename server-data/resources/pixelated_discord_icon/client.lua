local APP_ID       = 619244124234711061
local HELP_TEXT    = "Visit pixelatedrp.com for more info"
local LARGE_ICON   = "pixelated2"
local REFRESH_RATE = 1000 * 60 * 5
local SMALL_ICON   = "pixelatedrp1"
local character    = { firstname = "", lastname = "" }
local players      = {}

function refresh()
  local message = ""

  --This is the Application ID (Replace this with you own)
  SetDiscordAppId(APP_ID)

  --Here you will have to put the image name for the "large" icon.
  SetDiscordRichPresenceAsset(LARGE_ICON)

  --Here you can add hover text for the "large" icon.
  SetDiscordRichPresenceAssetText(HELP_TEXT)

  --Here you will have to put the image name for the "small" icon.
  SetDiscordRichPresenceAssetSmall(SMALL_ICON)

  --Here you can add hover text for the "small" icon.
  SetDiscordRichPresenceAssetSmallText(HELP_TEXT)

  players   = GetActivePlayers()
  character = exports.pixelated_utils:getCharacter()

  if string.len(character.firstname) > 0 then
    message = character.firstname .. " " .. character.lastname .. " - "
  else
    message = "Players Online: "
  end

  message = message .. #players .. "/" .. GetConvarInt("sv_maxclients", 32)

  SetRichPresence(message)
end

function startRichPresence()
  Citizen.CreateThread(function()
    while true do
      refresh()
      Citizen.Wait(REFRESH_RATE)
    end
  end)
end

AddEventHandler("playerSpawned", function(_spawnInfo)
  refresh()
end)

AddEventHandler("pixelated_utils:refreshedCharacter", function(_newCharacter)
  refresh()
end)

AddEventHandler("onClientResourceStart", function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  startRichPresence()
end)