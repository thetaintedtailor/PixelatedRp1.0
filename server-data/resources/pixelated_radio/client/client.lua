ESX = nil

-- TODO: Copied from TokoVoip config currently. Make it dynamic.
Channels = {
  {id = 1, name = "Off", jobs = {}},
  {id = 2, name = "Police Channel 1", jobs = {"police", "ambulance"}},
  {id = 3, name = "Police Channel 2", jobs = {"police", "ambulance"}},
  {id = 4, name = "EMS Channel 1", jobs = {"police", "ambulance"}},
  {id = 5, name = "EMS Channel 2", jobs = {"police", "ambulance"}},
  {id = 6, name = "CB Channel 1", jobs = {}},
  {id = 7, name = "CB Channel 2", jobs = {}},
  {id = 8, name = "CB Channel 3", jobs = {}},
  {id = 9, name = "Taxi Dispatch", jobs = {"taxi"}},
  {id = 10, name = "Mechanic Dispatch", jobs = {"mechanic"}}
}

local isRadioShowing = false
local currentChannel = Channels[1]
local playerData     = {}

function CanUseChannel(channel)
  if (#channel["jobs"] == 0) then return true end

  for i = 1, #channel["jobs"] do
    if (playerData.job ~= nil and playerData.job.name == channel["jobs"][i]) then
      return true
    end
  end

  return false
end

function GetNextChannel()
  for i = currentChannel["id"] + 1, #Channels do
    if (CanUseChannel(Channels[i])) then
      return Channels[i]
    end
  end

  return nil
end

function GetPreviousChannel()
  for i = currentChannel["id"] - 1, 1, -1 do
    if (CanUseChannel(Channels[i])) then
      return Channels[i]
    end
  end

  return nil
end

function ToggleRadio()
  isRadioShowing = not isRadioShowing;
  SendNUIMessage({type = "pixelated.radio", display = isRadioShowing})

  if (isRadioShowing) then
    SendNUIMessage({type = "pixelated.radio", text = currentChannel["name"]})

    Citizen.CreateThread(function()
      while (isRadioShowing) do
        Citizen.Wait(5)

        local newChannel

        if (IsControlJustPressed(0, 174)) then
          newChannel = GetPreviousChannel()
        elseif (IsControlJustPressed(0, 175)) then
          newChannel = GetNextChannel()
        end

        if (newChannel ~= nil and newChannel ~= currentChannel) then
          if (newChannel["id"] == 1) then
            -- Subtract 1 because Lua is 1-based instead of 0-based and I forgot that like a dumbass
            exports.tokovoip_script:removePlayerFromRadio(currentChannel["id"] - 1)
          else
            if (currentChannel["id"] ~= 1) then exports.tokovoip_script:removePlayerFromRadio(currentChannel["id"] - 1) end
            exports.tokovoip_script:addPlayerToRadio(newChannel["id"] - 1)
          end

          currentChannel = newChannel
          SendNUIMessage({type = "pixelated.radio", text = newChannel["name"]})
          PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end
      end
    end)
  end
end

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  ESX.TriggerServerCallback('esx:getPlayerData', function(data)
    playerData = data
  end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  playerData.job = job
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(5)

      if IsControlPressed(0, 21) and IsControlJustPressed(0, 288) then -- shift + f1
          ToggleRadio()
      end
    end
end)