local activeRace = false

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
		Timer()
		TriggerClientEvent('jetskirace:start', source, count)
	else
		TriggerClientEvent('jetskirace:alreadyActive', source)
	end
end)

RegisterServerEvent('jetskirace:end')
AddEventHandler('jetskirace:end', function()
	activeRace = false
	TriggerClientEvent('jetskirace:end', source)
end)