# Pixelated1.0
Pixelated1.0 fivem RP


# Description
The most realistic economic RP on the internet (pegged to the USD)

# ES/ESX framework notes
    ## comand list reference
        .../server-data/resources/[esx]/es_extended/server/commands.lua
    ## object models
        .../server-data/resources/essentialmode/server/classes/player.lua
        .../server-data/resources/[esx]/es_extended/server/classes/player.lua
        # good usage examples
            .../server-data/resources/[esx]/es_extended/server/main.lua
    ## spawn, respawn, auto-spawn relation
        .../server-data/resources/[esx]/esx_ambulancejob/config.lua
        .../server-data/resources/[esx]/esx_ambulancejob/locales/en.lua
        .../server-data/resources/[system]/spawnmanager/spawnmanager.lua
        .../server-data/resources/[system]/baseevents/deathevents.lua
    ## vehicle speed relation
        .../server-data/resources/scrp_scripts/client/speed_limit-client.lua
        

# Platform & Library Notes
    ## physics & velocity engine reference:
        - https://gtamods.com/wiki/Handling.meta#fInitialDriveMaxFlatVel



# [cars-police] mapping notes
    ## view dir .../.server-data/resources/[esx]/esx_policejob/config.lua 
        - the Config.AuthorizedVehicles -> 'model' and 'label' fields are mapped to 
          the data (design) file names in 'model' and 'label' in
           .../server-data/resources/[cars-police]/.../stream/ 
        
        example: .../server-data/resources/[cars-police]/pc2/stream/2015polstang.yft
           - search for '2015polstang' in
             .../server-data/resources/[esx]/esx_policejob/config.lua


# 3rd Party mods (post-install integration)
    - https://github.com/ESX-Org/esx_whitelistEnhanced
    - https://github.com/ESX-PUBLIC/esx_jail
    - https://github.com/snyx95/esx_eden_garage
    - https://github.com/Krizfrost/-ESX--Money-Laundering
    - https://github.com/InZidiuZ/LegacyFuel
    - https://github.com/N3MTV/gcphone
    - https://forum.fivem.net/t/trundles-roleplay-animations-updated-10-26/171735
    - https://github.com/Nowimps8/nw_bahamaMama
    - https://github.com/Bob74/bob74_ipl/tree/2.0.7c
    - https://forum.fivem.net/t/release-finger-pointing-by-geekness/103722
    - https://github.com/iEns/RealisticVehicleFailure
    - https://github.com/SaltyGrandpa/model-menu
    - https://github.com/Stadus/esx_scoreboard
    - https://github.com/condolent/esx_repairkit
    - https://github.com/ESX-PUBLIC/esx_vehiclelock


# Previous Versioning note:
This is the 2nd repository created for this project in ~3 days utilizing zap-hosting as the server side hosting
- the zap-hosting server side was initial created with initial dependencies (i.e. ESX, etc) by @envy (PM) & @lous (dev from germany)
- changes to this integration would made manually via FTP
- changes include attempts to remove features and add features (mods)
- changes had include initial db & config value updates
- - i.e. payroll, salary, weapon defaults/disables, vehicle prices, etc.
- these changes had aslo rendered the server unsuitable for launch (broken) - - in the sense that the default installs had actually been working with less bugs
- hence, envy had determined that starting from scratch was the best course of action
- envy had then reset the server back to initial defaults (~9 hours ago)
- envy then reviewed all initial value changes with @house
- - only db & config value changes will be performed for beta initial launch
- - alpha testing scheduled for today @ 2pm ET
- - beta launch scheduled for today @ 4pm ET

**NOTE**:
- the last commit in the following repos contain the details of changes made during first server attempt (may need to stil ref some changes)
- - https://github.com/greenhouse/pixelatedrp
- - https://github.com/thetaintedtailor/Pixelated-RP-code
- in this commit:
- - deleted files = files added during first server attempt changes
- - added files = files removed during first server attempt changes
- - file changes = inverted file changes during first server attempt changes


# NEXT:
- after alpha testing is performed and verified that initial db & config values are correct and the service is running as expected, without the ‘additional’ bugs from the first server changes attempt ~3 days ago…
- - house will then proceed with additional mod integrations & bug fixes original planned

# Initial Mod integration (in priority):
- esx_jail
- whitelist approval by steam id
- research/review empty file ‘…/esx_whitelist/config.lua’

# Initial known BUG fixes required (priority order?):
Initial known BUG fixes required (priority order?):
- esx_ambulancejob: EMS can’t see victim
- - needs more testing by @envy
- - ‘seems’ to only occur when a dead victim makes distress call on themselves
- - @envy will test more

- esx_ambulancejob: config.lua (cannot update field ‘price’)
- - Config.AuthorizedVehicles -> changing to $1 does not reflect in game at runtime
- - Config.AuthorizedHelicopters -> changing to $1 does not reflect in game at runtime

- esx_policejob: config.lue -> Config.AuthorizedVehicles
- - user scrolling freezes when 2nd item is selected (label = 'Police Prison Bus’)
- - user cannot leave this menu and or do anything at all
- - current work around: Admin menu -> ‘Bring To’ button (brings user to specific location)

- esx_garage: when adding vehicle, can’t get it back
- - review …/resources/trafficadjuster/config.lua

- esx_ATM: ATM machines do not work around the map
- - needs further testing required by @envy

- esx_bankerjob: corrupt data file ‘main.lua’
- - need search forums on ESX GitHub (maybe look for earlier version)


# ADDITIONAL NOTES:
- the following paths are known to contain ‘stream/‘ directories that the zap-hosting server stores rendered imaging and video data (large file types that should not be included in git; i.e. ‘.ydr’, ‘.ytf’, etc.)
- all files within embedded 'stream/' folders are GTA textured dictionary or vector drawing/imaging based assets, etc.
- these are very large files and should not be maintained within the source code repository
- - if needed, these files should be maintained via ftp transfer (or other means)

## large file directories ($ ls -R /stream)
./resources/[car-mods]/CustomRims/stream:
./resources/[cars-ems]/LandRoverEms/stream:
./resources/[cars-police]/BMWpolicebike/stream:
./resources/[cars-police]/pc1/stream:
./resources/[cars-police]/pc2/stream:
./resources/[cars-police]/pc3/stream:
./resources/[cars-police]/pp1/stream:
./resources/[esx-custom]/esx_customshop/stream:
./resources/[esx-custom]/esx_mods/stream:
./resources/[esx]/esx_vehicleshop/stream:
./resources/[map-mods]/afterhours/stream:
./resources/[map-mods]/elm/stream:
./resources/[map-mods]/ipl/stream:
./resources/[packs]/ELBP/stream:
./resources/[packs]/ELCP/stream:
./resources/assets/stream:
