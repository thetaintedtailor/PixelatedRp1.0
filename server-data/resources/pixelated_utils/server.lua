-- Lookup and return the current character data
RegisterServerEvent("pixelated_utils:getCharacter")
AddEventHandler("pixelated_utils:getCharacter", function(source)
  local _source    = source
  local identifier = GetPlayerIdentifiers(source[1])
  local query      = "SELECT firstname, lastname FROM `users` WHERE `identifier` = @identifier"
  local params     = { ["@identifier"] = identifier }

  MySQL.Async.fetchAll(query, params, function(results)
    TriggerClientEvent("pixelated_utils:gotCharacter", source, results[1])
  end)
end)
