local activeRace = false
local raceStarter = nil

function Timer()
	Citizen.CreateThread(function()
		local timer = 0
		repeat
			timer = timer + 1
			Citizen.Wait(1000)
		until timer == Config.Duration or activeRace == false
			TriggerClientEvent('jetskirace:end', -1)
			activeRace = false
	end)
end

RegisterServerEvent('jetskirace:start')
AddEventHandler('jetskirace:start', function(count)
	if not activeRace then
		activeRace = true
		raceStarter = source
		Timer()
		TriggerClientEvent('jetskirace:start', source, count)
	else
		TriggerClientEvent('jetskirace:alreadyActive', source)
	end
end)

RegisterServerEvent('jetskirace:end')
AddEventHandler('jetskirace:end', function()
	if source == raceStarter then
		activeRace = false
		raceStarter = nil
		TriggerClientEvent('jetskirace:end', source)
	else
		TriggerClientEvent('jetskirace:notOwner', source)
	end
end)