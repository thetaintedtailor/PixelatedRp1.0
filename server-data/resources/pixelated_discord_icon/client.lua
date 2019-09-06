local APP_ID       = 619244124234711061
local HELP_TEXT    = "Visit pixelatedrp.com for more info"
local LARGE_ICON   = "pixelated2"
local REFRESH_RATE = 1000 * 60 * 5
local SMALL_ICON   = "pixelatedrp1"

Citizen.CreateThread(function()
  local character = {}
  local players   = {}

  while true do
    local message = ""

    --This is the Application ID (Replace this with you own)
    SetDiscordAppId(APP_ID)

    --Here you will have to put the image name for the "large" icon.
    SetDiscordRichPresenceAsset(LARGE_ICON)

    --(11-11-2018) New Natives:

    --Here you can add hover text for the "large" icon.
    SetDiscordRichPresenceAssetText(HELP_TEXT)

    --Here you will have to put the image name for the "small" icon.
    SetDiscordRichPresenceAssetSmall(SMALL_ICON)

    --Here you can add hover text for the "small" icon.
    SetDiscordRichPresenceAssetSmallText(HELP_TEXT)

    players   = GetActivePlayers()
    character = exports["pixelated_utils"].getCharacter()

    if string.len(character.firstname) > 0 then
      message = character.firstname .. " " .. character.lastname .. " - "
    else
      message = "Players Online: "
    end

    message = message .. #players .. "/" .. GetConvarInt("sv_maxclients", 32)

    SetRichPresence(message)

    --It updates every one minute just in case.
    Citizen.Wait(REFRESH_RATE)
  end
end)
