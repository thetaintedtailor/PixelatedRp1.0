ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

TriggerEvent('es:addCommand', 'note', function(source, args, user)
	TriggerClientEvent('notes:writeNote', source)
end, {help = "Suicide"})

RegisterServerEvent('note:dropNote')
AddEventHandler('note:dropNote', function()
	local _source = source
    ESX.CreatePickup('item_standard', 'note', 1, "A note", _source)
end)