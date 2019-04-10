# Value Config (initial install)

## source code config
1) SHA: aae560b3cc7a28569e3cc7bac13b4e96f05c0fce
    - gta5-fivem/server-data/resources/[esx]/esx_ambulancejob/config.lua
        Config.ReviveReward               = 100
        Config.Locale                     = 'en'
        Config.RemoveItemsAfterRPDeath    = false
        Config.AuthorizedVehicles -> { <all embedded 'price' keys> } 
            price = 1
        Config.AuthorizedHelicopters { <all embedded 'price' keys> }
            price = 1
    - gta5-fivem/server-data/resources/[esx]/esx_clotheshop/config.lua
        Config.Locale = 'en'
        Config.Price = 50
    - gta5-fivem/server-data/resources/[esx]/esx_policejob/config.lua
        Config.Locale = 'en'
        Config.AuthorizedWeapons { <all 'WEAPON_APPISTOL' price keys> }
            price = 1000000
        Config.AuthorizedVehicles -> { <all embedded 'price' keys> } 
            price = 1
        Config.AuthorizedHelicopters { <all embedded 'price' keys> }
            price = 1
            
2) SHA: 6823dc66c0d6c0b81cb40202a7714c3f074a7179
    - gta5-fivem/server-data/resources/[esx]/esx_jobs/client/jobs/fisherman.lua
        Config.Jobs.fisherman.Zone.Delivery 
            price = 25
    - gta5-fivem/server-data/resources/[esx]/esx_weaponshop/config.lua
        Config.LicenseEnable = true -- only turn this on if you are using esx_license
        Config.LicensePrice  = 100

## database config 
    - (TODO:)

