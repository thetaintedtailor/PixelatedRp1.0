-- Lookup and return the current character data
RegisterServerEvent("pixelated_utils:gettingCharacter")
AddEventHandler("pixelated_utils:gettingCharacter", function()
  local _source    = source
  local identifier = GetPlayerIdentifiers(_source)[1]
  local query      = "SELECT firstname, lastname FROM `users` WHERE `identifier` = @identifier"
  local params     = { ["@identifier"] = identifier }

  MySQL.Async.fetchAll(query, params, function(results)
    TriggerClientEvent("pixelated_utils:gotCharacter", _source, results[1])
  end)
end)
