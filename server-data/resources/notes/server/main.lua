ESX   = nil
Notes = {}
NotesID = 1
NoteCount = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'note', function(source, args, user)
	if NoteCount < Config.MaxNotes then
		TriggerClientEvent('notes:writeNote', source)
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Max notes reached on server. Try again later.' } })
	end
end, {help = "Write a note and leave it on the ground"})

RegisterServerEvent('notes:dropNote')
AddEventHandler('notes:dropNote', function(message)
	local _source = source
	local pickupId = (NotesID == 65635 and 0 or NotesID + 1)
	Notes[pickupId] = {
		id = pickupId,
		message = message
	}
	TriggerClientEvent('notes:createNotes', -1, pickupId, message, _source)
	TriggerClientEvent('esx:showNotification', _source, "You've dropped a note.")
	TriggerEvent('esx:droppednote', ESX.GetPlayerFromId(_source).name, message)
	NoteCount = NoteCount + 1
	NotesID = pickupId
end)

RegisterServerEvent('notes:pickup')
AddEventHandler('notes:pickup', function(id)
	TriggerClientEvent('chat:addMessage', source, { args = { '^2The note reads', tostring(Notes[id].message) } })
	TriggerClientEvent('notes:deleteNote', -1, id)
	NoteCount = NoteCount - 1
end)