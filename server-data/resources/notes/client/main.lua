ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('notes:writeNote')
AddEventHandler('notes:writeNote', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'write_note',
    {
        title = "Write a Note",
    }, function(data, menu)
        TriggerServerEvent('note:dropNote')
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)