ESX = nil

-- ESX base
TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

-- GSR Command
TriggerEvent('es:addCommand', 'gsr', function(source, args, user)
    Source = source
    
    local xPlayer = ESX.GetPlayerFromId(Source)
    local number = tonumber(args[1])
    
    if args[1] ~= nil and xPlayer.job.name == 'police' and type(number) == "number" then
        CancelEvent()
        local identifier = GetPlayerIdentifiers(number)[1]
        if identifier ~= nil then
            gsrcheck(source, identifier)
        end
    end

end)

AddEventHandler('esx:playerDropped', function(source)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    MySQL.Async.execute("DELETE FROM gsr WHERE identifier = @identifier",
        {
            ['@identifier'] = identifier,
        })
end)

-- Database Calls
MySQL.ready(function()
    MySQL.Async.execute('DELETE FROM gsr', {})
end)

RegisterNetEvent("removeGsrRecord")
AddEventHandler("removeGsrRecord", function()
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    MySQL.Async.execute("DELETE FROM gsr WHERE identifier = @identifier",
        {
            ['@identifier'] = identifier,
        })
end)

RegisterServerEvent('addGsrRecord')
AddEventHandler('addGsrRecord', function(timer)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    local time = timer
    MySQL.Async.execute("INSERT INTO gsr ( identifier, time) VALUES (@identifier, @time)",
        {
            ['@identifier'] = identifier,
            ['@time'] = time
        })
end)

RegisterServerEvent("timeUpdate")
AddEventHandler("timeUpdate", function(time)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    MySQL.Async.execute("UPDATE gsr SET time=@time WHERE identifier=@identifier",
        {
            ['@time'] = time,
            ['@identifier'] = identifier
        })
end)

function gsrcheck(source, identifier)
    local Source = source
    local identifier = identifier
    MySQL.Async.fetchAll('SELECT * FROM gsr WHERE identifier=@identifier', {['@identifier'] = identifier}, function(gotInfo)
        if gotInfo[1] ~= nil then
            TriggerClientEvent('GSR:Notify', Source, _U('gsr_positive'), "error")
        else
            TriggerClientEvent('GSR:Notify', Source, _U('gsr_negative'), "success")
        end
    end)
end
