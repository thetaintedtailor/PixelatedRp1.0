AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)

RegisterCommand('atwt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local handle = tostring(args[1])
	table.remove(args, 1)
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	--if Config.EnableESXIdentity then name = GetCharacterName(source) end
	TriggerEvent('esx:sentanonymoustweet', name, handle, tostring(args))

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', handle), tostring(args)}, color={0,153,204} })
end, false)


RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	TriggerEvent('esx:senttweet', name, tostring(args))
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), tostring(args)}, color={0,153,204} })
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	TriggerEvent('esx:sentad', name, tostring(args))
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ad_prefix', name), tostring(args)}, color={163,0,0} })
end, false)

RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('do_prefix', name), args, { 0, 0, 255 })
	--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
