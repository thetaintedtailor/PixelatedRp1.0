ESX                           = nil
Notes = {}
NotesID = 1

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'note', function(source, args, user)
	TriggerClientEvent('notes:writeNote', source)
end, {help = "Suicide"})

RegisterServerEvent('notes:dropNote')
AddEventHandler('notes:dropNote', function(message)
	local _source = source
	local pickupId = (NotesID == 65635 and 0 or NotesID + 1)
	Notes[pickupId] = {
		id = pickupId,
		message = message
	}
	TriggerClientEvent('notes:createNotes', -1, pickupId, message)
	TriggerClientEvent('esx:showNotification', _source, "You've dropped a note.")
	NotesID = pickupId
end)

RegisterServerEvent('notes:pickup')
AddEventHandler('notes:pickup', function(id)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2The note reads', tostring(Notes[id].message) } })
	TriggerClientEvent('notes:deleteNote', -1, id)
end)