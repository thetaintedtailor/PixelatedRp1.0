RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(58, 10, 97, 0.5); border-radius: 3px;"><i class="fas fa-comment"></i> {0} {1}</div>',
        args = { title, message }
    })
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(58, 10, 97, 0.5); border-radius: 3px;"><i class="fas fa-comment"></i> {0} {1}</div>',
        args = { title, message }
    })
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  'Send a tweet',  { { name = 'Message', help = 'The message to send' } } )
	TriggerEvent('chat:addSuggestion', '/atwt',  'Send an anonymous tweet',  { 
		{ name = 'Handle',  help = 'Handle you want to display' },
		{ name = 'Message', help = 'Message you want to send'   } 
	})
	TriggerEvent('chat:addSuggestion', '/ad',  'Post an ad',  { { name = 'Message', help = 'The message to send'  } } )
	TriggerEvent('chat:addSuggestion', '/me',   'Float text above you to emote',   { { name = 'Message', help = 'The message to send'  } } )
	TriggerEvent('chat:addSuggestion', '/do',   'Display a chat message of emotive actions to people within 20 feet',   { { name = 'Message', help = 'The message to send'  } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/atwt')
		TriggerEvent('chat:removeSuggestion', '/ad')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
	end
end)
