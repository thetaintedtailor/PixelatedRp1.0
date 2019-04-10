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
            
2) SHA: 


## database config (TODO:)

