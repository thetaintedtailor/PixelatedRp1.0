bedNames = { 'v_med_bed1', 'v_med_bed2'} -- Add more model strings here if you'd like
bedHashes = {}
animDict = 'misslamar1dead_body'
animName = 'dead_idle'
isOnBed = false

CreateThread(function()
    for k,v in ipairs(bedNames) do
        table.insert( bedHashes, GetHashKey(v))
    end
end)


Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        if isOnBed then
            ClearPedTasksImmediately(playerPed)
            isOnBed = false
            return
        end

	if (GetLastInputMethod(2) and IsControlJustPressed(1, 38) and IsControlPressed(1, 21)) and not IsPedInAnyVehicle(playerPed, true) then
        local playerPos = GetEntityCoords(playerPed, true)
        local bed = nil

        for k,v in ipairs(bedHashes) do
            bed = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 4.0, v, false, false, false)
            if bed ~= 0 then
                break
            end
        end

        if bed ~= nil and DoesEntityExist(bed) then
            if not HasAnimDictLoaded(animDict) then
                RequestAnimDict(animDict)
            end
            local bedCoords = GetEntityCoords(bed)

            SetEntityCoords(playerPed, bedCoords.x , bedCoords.y, bedCoords.z, 1, 1, 0, 0)
            SetEntityHeading(playerPed, GetEntityHeading(bed) + 180.0)
            TaskPlayAnim(playerPed,animDict, animName, 8.0, 1.0, -1, 45, 1.0, 0, 0, 0)

            isOnBed = true
        end
	end
end)


RegisterCommand('end', function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed, true)
    local bedHash = GetHashKey('v_med_bed1')
    CreateObject(bedHash, playerPos.x, playerPos.y + 1.0, playerPos.z - 0.95, true, true, true)
end, false)


