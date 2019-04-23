# Commands
## in-game commands (parameterized)
### > addwl [ hex | dec ] [streamId]
    - ex: /addwl dec 12345678901234567
    
### > setjob [playerId] [jobName] [jobGrade]
    - ex: /setjob 21 mechanic 3
    
### > start [resourceName]
    - ex: /start esx_whitelistEnhanced
    
### > stop [resourceName]
    - ex: /stop esx_whitelistEnhanced
    
### > restart [resourceName]
    - ex: /restart esx_whitelistEnhanced

### > jail [playerId] [jailTimeMin]
    - ex: /jail 21 60
    
### > setjob [dynamic-in-game-id] [jobstring] [job-grade]
    - ex: /setjob 1 police 4
    
### revive [player-id]
    - ex: /revive 1
    
### car [car model] | cardel 
    - ex: /car police | police2 | police3 | policet | policeb
    - ex: /car fbi | fbi2
    - ex: /car ambulance | ambulance van
    - ex: /car buzzard | buzzard2 | seasparrow | polmav
    - ex: /cardel
    - models listed:
        .../server-data/resources/[esx]/esx_policejob/config.lua
        .../serverstsst-data/resources/[esx]/esx_ambulancejob/config.lua
        
## in-game commands (non-parameterized)
### revive yourself
    > /revive

### get current gps position
    > /getpos
    
### remove car
    > /cardel

### show car details
    > /carshow

## server CLI commands
### > add_principal indentifier.steam:[hex] group.[superadmin|admin]
    - ex: > add_principal indentifier.steam:<hex> group.superadmin


## in-game hot keys
    f6 = job menu
    f2 = inventory
    home = admin menu
        - bringto, goto
    f10 = scoreboard
    f = vehicle enter/steal/exit
    e = action menu (inside colored action sphere)
    v = change view
    #pad = air vehicle pitch/yaw 
    
## in-game common emotes (hit 't' + [type])
    - sit down: /e groundsit
    - lay down: /e bum
    - kneel: /e kneel
    - shrug shoulders: /e shrug
    - wall spy: /e wallspy
    - dance: /e ohsnap | ohsnap2 | disco | disco2
    - play dead: /e dead
    - do situps: /e situps
    - do pushup: /e pushups
    - do yoga: /e yoga
    - do cheer: /e cheer
    - shake head no: /e no
    - strip tease: /e st1 | st2
    - wall lean: /e leanwall | lean

# misc web refs
## github
    - https://github.com/ESX-PUBLIC
    - https://github.com/FiveM-Scripts
    - https://github.com/topics/fivem
    
## relevent
    - https://billing.low.ms/knowledgebase.php?action=displayarticle&id=24
    - http://rebelmafiagaming.com/forums/index.php?/topic/236-esx-8162018-current-server-commands/
    - https://www.unknowncheats.me/forum/fivem/290558-esx-triggerserverevent.html

## other
    - https://www.cfd-online.com/Forums/cfx/171576-working-cfx-command-line.html
    - https://pastebin.com/QuDYpGHz
    - https://sourceforge.net/projects/gtavnonsteamlauncher/
    - https://www.gta5-mods.com/tools/verify-game-files-without-steam
    - https://github.com/SaltyGrandpa/esx_nocarjack
    - https://github.com/SaltyGrandpa/FiveM-PlayerTrust

