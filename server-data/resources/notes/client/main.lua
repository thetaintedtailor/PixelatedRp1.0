ESX                           = nil
Notes = {}
NotesID = 1

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('notes:writeNote')
AddEventHandler('notes:writeNote', function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'write_note',
    {
        title = "Write a Note",
    }, function(data, menu)
        print(data)
        TriggerServerEvent('notes:dropNote', data.value)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('notes:createNotes')
AddEventHandler('notes:createNotes', function(id, message, player)
    SpawnNote(id, message, player)
end)

RegisterNetEvent('notes:deleteNote')
AddEventHandler('notes:deleteNote', function(id)
    ESX.Game.DeleteObject(Notes[id].obj)
    Notes[id] = nil
end)


function SpawnNote(id, message, player)
    local ped     = GetPlayerPed(GetPlayerFromServerId(player))
	local coords  = GetEntityCoords(ped)
	local forward = GetEntityForwardVector(ped)
    local x, y, z = table.unpack(coords + forward * -2.0)

	ESX.Game.SpawnLocalObject('prop_notepad_01', {
		x = x,
		y = y,
		z = z - 2.0,
	}, function(obj)
		SetEntityAsMissionEntity(obj, true, false)
		PlaceObjectOnGroundProperly(obj)

		Notes[id] = {
            id = id,
            obj = obj,
            message = message,
			label = 'A note',
			inRange = false,
			coords = {
				x = x,
				y = y,
				z = z
			}
		}
    end)
end

Citizen.CreateThread(function()
	while true do

        Citizen.Wait(0) --Must be here to draw the label later or it flickers
        
        -- if there's no nearby notes we can wait a bit to save performance
        --Happy Mailbox?
		if next(Notes) == nil then
			Citizen.Wait(500)
		end
        
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

		for k,v in pairs(Notes) do

			local distance = GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true)
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if distance <= Config.LabelDrawDistance then
				ESX.Game.Utils.DrawText3D({
					x = v.coords.x,
					y = v.coords.y,
					z = v.coords.z + 0.25
				}, v.label)
			end

			if (closestDistance == -1 or closestDistance > 3) and distance <= 1.0 and not v.inRange and not IsPedSittingInAnyVehicle(playerPed) then
                TriggerServerEvent('notes:pickup', v.id)
				PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
				v.inRange = true
			end
		end
	end
end)