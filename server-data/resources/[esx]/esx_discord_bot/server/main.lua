ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Send the message to your discord server
function sendToDiscord (name,message,color,hook)
  local DiscordWebHook = hook
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"] =message,
        ["type"]  ="rich",
        ["color"] =color,
        ["footer"]=  {
          ["text"]  = "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

-- Send the first notification
sendToDiscord(_U('server'),_U('server_start'),Config.green, Config.serverHook)

-- Event when a player is writing
AddEventHandler('chatMessage', function(author, color, message)
  if(settings.LogChatServer)then
      local player = ESX.GetPlayerFromId(author)
     sendToDiscord(_U('server_chat'), player.name .." : "..message,Config.grey, Config.chatHook)
  end
end)

-- Event when a player is connecting
RegisterServerEvent("esx:playerconnected")
AddEventHandler('esx:playerconnected', function()
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_connecting'), GetPlayerName(source) .." ".. _('user_connecting'),Config.grey, Config.chatHook)
  end
end)

-- Event when a player is disconnecting
AddEventHandler('playerDropped', function(reason)
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_disconnecting'), GetPlayerName(source) .." ".. _('user_disconnecting') .. "("..reason..")",Config.grey, Config.chatHook)
  end
end)

RegisterServerEvent("esx:sentanonymoustweet")
AddEventHandler("esx:sentanonymoustweet", function(name,handle,msg)
  sendToDiscord('Anonymous Tweet', name .. ' used the handle ' .. handle .. ' to send an anonymous tweet containing: ' .. msg, Config.blue, Config.chatHook)
end)

RegisterServerEvent("esx:senttweet")
AddEventHandler("esx:senttweet", function(name,msg)
  sendToDiscord('Tweet', name .. ' sent a tweet containing: ' .. msg, Config.blue, Config.chatHook)
end)

RegisterServerEvent("esx:sentad")
AddEventHandler("esx:sentad", function(name,msg)
  sendToDiscord('Ad', name .. ' sent an ad containing: ' .. msg, Config.blue, Config.chatHook)
end)


-- Add event when a player give an item
--  TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount) -> ESX_extended
RegisterServerEvent("esx:giveitemalert")
AddEventHandler("esx:giveitemalert", function(name,msg)
  if(settings.LogItemTransfer)then
   sendToDiscord(_U('server_item_transfer'),name.._('user_gives_to')..nametarget.." "..amount .." "..itemname,Config.orange, Config.moneyHook)
  end
end)

-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneyalert")
AddEventHandler("esx:givemoneyalert", function(name,nametarget,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscord(_U('server_money_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." dollars",Config.orange, Config.moneyHook)
  end
end)

--Add event for when an item was sold
RegisterServerEvent("esx:itemsoldalert")
AddEventHandler("esx:itemsoldalert", function(name, item, amount)
  if(settings.LogItemSelling)then
    local time = os.date("*t", os.time())
    sendToDiscord('Item Sold', name .. " sold " .. amount .. " " .. item .. ' at ' .. time.hour .. ':' .. time.min .. ':'..time.sec, Config.orange, Config.moneyHook)
  end
end)


-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneybankalert")
AddEventHandler("esx:givemoneybankalert", function(name,nametarget,amount)
  if(settings.LogMoneyBankTransfert)then
   sendToDiscord(_U('server_moneybank_transfer'),name.." ".. _('user_gives_to') .." "..nametarget.." "..amount .." dollars", Config.orange, Config.moneyHook)
  end
end)

-- Add event when a player give weapon
--  TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel) -> ESX_extended
RegisterServerEvent("esx:giveweaponalert")
AddEventHandler("esx:giveweaponalert", function(name,nametarget,weaponlabel)
  if(settings.LogWeaponTransfer)then
    sendToDiscord(_U('server_weapon_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..weaponlabel,Config.orange, Config.moneyHook)
  end
end)

-- Add event when a player is washing money
--  TriggerEvent("esx:washingmoneyalert",xPlayer.name,amount) -> ESX_society
RegisterServerEvent("esx:washingmoneyalert")
AddEventHandler("esx:washingmoneyalert", function(name,amount)
  sendToDiscord(_U('server_washingmoney'),name.." ".._('user_washingmoney').." ".. amount .." dollars",Config.orange, Config.moneyHook)
end)

-- Event when a player is in a blacklisted vehicle
RegisterServerEvent("esx:enterblacklistedcar")
AddEventHandler("esx:enterblacklistedcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_blacklistedvehicle'),xPlayer.name.." ".._('user_entered_in').." ".. model ,Config.red, Config.theftHook)
end)

-- Event when a player (not policeman) is in a police vehicle
RegisterServerEvent("esx:enterpolicecar")
AddEventHandler("esx:enterpolicecar", function(model)
 	 local xPlayer = ESX.GetPlayerFromId(source)
 	 sendToDiscord(_U('server_policecar'),xPlayer.name.." ".._('user_entered_in').." ".. model , Config.blue, Config.theftHook)
end)

-- Event when a player is jacking a car
RegisterServerEvent("esx:jackingcar")
AddEventHandler("esx:jackingcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_carjacking'),xPlayer.name.." ".._('client_carjacking').." ".. model,Config.purple, Config.theftHook)
end)

-- Event when a player is killing an other one
RegisterServerEvent('esx:killerlog')
AddEventHandler('esx:killerlog', function(t,killer, kilerT) -- t : 0 = NPC, 1 = player
  local xPlayer = ESX.GetPlayerFromId(source)
  if(t == 1) then
     local xPlayer = ESX.GetPlayerFromId(source)
     local xPlayerKiller = ESX.GetPlayerFromId(killer)

     if(xPlayerKiller.name ~= nil and xPlayer.name ~= nil)then
       if(kilerT.killerinveh) then
         local model = kilerT.killervehname
            sendToDiscord(_U('server_kill'), xPlayerKiller.name .." ".._('user_kill').." "..xPlayer.name.." ".._('with').." "..model,Config.red, Config.deathHook)
       else
            sendToDiscord(_U('server_kill'), xPlayerKiller.name .." ".._('user_kill').." "..xPlayer.name,Config.red, Config.deathHook)
       end
    end
  else
     sendToDiscord(_U('server_kill'), xPlayer.name .." ".. _('user_kill_environnement'),Config.red, Config.deathHook)
  end
end)
