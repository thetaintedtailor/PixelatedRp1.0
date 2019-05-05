# Developer & API notes
## Lua general
    - get current time
        local funcname = os.time() .. '_[dm4c:weaponChanged]'
    - exception handling example
        if pcall(IsPedReloading(playerPed)) then
            -- no errors while running `foo'
            while IsPedReloading(playerPed) do
                Citizen.Wait(10)
            end
        else
            local pass = 1
            -- `foo' raised an error: take appropriate actions
        end
        
## hot / live updates
    update resource (w/ __resources.lua file update)
        > refresh; restart <resource-name>
    
    update resuorce (w/o __resources.lua file update)
        > restart <resource-name>
        
## global keys
    - MP0_STAMINA
    - MP0_STRENGTH
    
## Classes
    - player.lua
        self.setMoney = function(money)
        self.setAccountMoney = function(acc, money)
        self.setJob = function(name, grade)
        self.addWeapon = function(weaponName, ammo)
        self.removeWeapon = function(weaponName, ammo)
        self.hasWeapon = function(weaponName)
        
## ESX
### server side
    - shared object 
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    - player
        local xPlayer = ESX.GetPlayerFromId(_source)
    - weapons
        local weapons = ESX.GetWeaponList()
        local weaponLabel = ESX.GetWeaponLabel(weaponName)
    - save ref: .../server-data/resources/[esx]/es_extended/server/functions.lua
        ESX.SavePlayer = function(xPlayer, cb)
        ESX.SavePlayers = function(cb)

### client side
    .../server-data/resources/[esx]/es_extended/client/functions.lua
        ESX.ShowAdvancedNotification = function(title, subject, msg, icon, iconType)
        ESX.ShowHelpNotification = function(msg)
        ESX.ShowNotification = function(msg)

    ESX.Game.Teleport(PlayerPedId(), JailLocation)

### server callback
    - server side
        ESX.RegisterServerCallback('dm4c:clipfull', function(source, cb, activeAmmoCnt, currWeapon)
            cb(success, msg, _source)
        end)
        
        - client side (note: client does NOT block until callback is returned)
        ESX.TriggerServerCallback('dm4c:clipfull', function(hasCash, msg, reloadPlayID)
            if hasCash then
                showHelpNotification("hasCash is true", 3)
            else
                showHelpNotification(msg, 3)
            end
        end, activeAmmoCnt, currWeapon)

## MySql queries
### show users' name, steamID, cash (money), bank, ammo (black money)
    - display: name, steamID, cash, bank, ammo_cash, 
    mysql> select users.name,users.identifier, users.money, bank, user_accounts.money as ammo from users, user_accounts where users.identifier = user_accounts.identifier;

    - display: name, steamID, cash, bank, ammo_cash, is_dead
    mysql> select users.name,users.identifier, users.money, bank, user_accounts.money as ammo, is_dead from users, user_accounts where users.identifier = user_accounts.identifier;

## MySql in lua (server side)
    ex: mysql call from lua
        MySQL.Async.fetchAll('SELECT * FROM `jobs` WHERE `name` = @name', {
            ['@name'] = name
        }, function(result)

            self.job['id']    = result[1].id
            self.job['name']  = result[1].name
            self.job['label'] = result[1].label
        end)

## client side native/global functions
### unsorted
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
    DoScreenFadeIn(500)
    DisablePlayerVehicleRewards(PlayerId())
    ClearPedBloodDamage(ped)
    SetPlayerInvincible(ped, false)
    success, vec3 = GetSafeCoordForPed(vector.x, vector.y, vector.z, false, 28)
    SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo
    GetHashKey(weaponName)
    PlayerId()
    GetPlayerWantedLevel(playerId)
    SetPlayerWantedLevel(playerId, 0, false)
    SetPlayerWantedLevelNow(playerId, false)
    
### globalizing functions (export functions)
    - added 'exprt' command to __resource.lua of function you want to be global
        __resource.lua in dm4c_wallet
            export 'cash2ammo' -- for client_scripts
            export_server 'cash2ammo' -- for server_scripts

    - invoke function from another .lua file
        server.lua in dm4c_ammo
            exports.dm4c_wallet:cash2ammo(_source, activeAmmoCnt, xPlayer)
            
### player id 
    - get dynamic server side player ID (displayed in lower left corner)
        _source == GetPlayerServerId(PlayerId())
    - get client side player ID from server side event handler 'source'
        PlayerId() == GetPlayerFromServerId(_source)

### notification
    #ref: https://forum.fivem.net/t/common-ways-to-display-help-text/292363
        function showHelpNotification(text, durSec)
            BeginTextCommandDisplayHelp("STRING")
            AddTextComponentSubstringPlayerName(text)

            -- shape (always 0), loop (bool), makeSound (bool), duration (0 for loop)
            -- EndTextCommandDisplayHelp(0, 1, 1, 0)

            -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
            EndTextCommandDisplayHelp(0, 0, 1, durSec * 1000)
            
            -- shape (always 0), loop (bool), makeSound (bool), duration (-1 for 10sec i think)
            -- EndTextCommandDisplayHelp(0, 0, 1, -1)
        end

### coordinates & spawning
    - check if coordinate is available
    ex:
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        while not HasCollisionLoadedAroundEntity(entity) do
            RequestCollisionAtCoord(coords.x, coords.y, coords.z)
            Citizen.Wait(0)
        end
        SetEntityCoords(entity, coords.x, coords.y, coords.z)
    
### ESX.Game.GetClosestPlayer()
    ex:
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
### IsPedArmed()
    - checks is player (or ped) is armed
        pass 7 to include slapper weapons
        pass 4 to exclude slapper weapons
    ex:
        local armed = IsPedArmed(PlayerPedId(), 7)
        local armed = IsPedArmed(PlayerPedId(), 4)

### TriggerClientEvent()
    - set cash display
        TriggerClientEvent('es:activateMoney', self.source , self.money)
    - set bank display
        TriggerClientEvent('esx:setAccountMoney', self.source, account)
        
### StatSetInt()
    - set user status
        StatSetInt("MP0_STAMINA", 100, true)
        StatSetInt("MP0_STRENGTH", 100, true)
        
## server side global functions
### RegisterCommand()
    - register command instruction w/ function to run
    ex:
        RegisterCommand('setadmin', function(source, args, raw)
        
### DropPlayer()
    - server side function
    ex:
        DropPlayer(source, _U('afk_kicked_message'))
        
### PlayerId()
    - gets 'this' player's id (validated from client.lua)
    - PlayerId() == source (on server side event handler)
    ex: 
        local player = PlayerId()
   
## event handlers
### RegisterCommand()
    ex:
        RegisterCommand("anonym", function(source, args, raw)
            local msg = table.concat(args, ' ')
            TriggerClientEvent('chatMessage', -1, "^2Anonymous Message:", { 255, 255, 255 }, msg)
        end, false)

### TriggerServerEvent
    ex:
        TriggerServerEvent('ResetStamina')

### TriggerClientEvent
    ex:
        TriggerClientEvent('esx:removeWeapon', self.source, weaponName, ammo)

### TriggerEvent()
    ex:
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

### RegisterClientEvent
    ex:
        RegisterNetEvent('esx:removeWeapon')

### RegisterServerEvent
    ex:
        RegisterServerEvent('ResetStamina')
        
### AddEventHandler 
    - 'source' param in event handler function seems to be auto-included
    - 'source' == PlayerId()
    ex:
        AddEventHandler('es:playerLoaded', function(source, _player)
            local _source = source
            playerName   = GetPlayerName(_source)
    ex:
        AddEventHandler('es:playerLoaded', function(_player)
            local _source = source
            playerName   = GetPlayerName(_source)
        
    ex: 
        AddEventHandler('es:firstJoinProper', function()
            local Source = source

