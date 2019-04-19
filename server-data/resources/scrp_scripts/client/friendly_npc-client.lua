-- https://forum.fivem.net/t/how-to-disable-aggressive-npcs-in-sandy-shores/62822/2

local relationshipTypes = {
	'DEALER',
	'COP',
	'PRIVATE_SECURITY',
	'SECURITY_GUARD',
	'ARMY',
	'MEDIC',
	'FIREMAN',
	'HATES_PLAYER',
	'NO_RELATIONSHIP',
	'SPECIAL',
	'MISSION2',
	'MISSION3',
	'MISSION4',
	'MISSION5',
	'MISSION6',
	'MISSION7',
	'MISSION8'
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)

		for _, group in ipairs(relationshipTypes) do
			SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(group)) -- could be removed
			SetRelationshipBetweenGroups(1, GetHashKey(group), GetHashKey('PLAYER'))
		end
	end
end)