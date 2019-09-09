Config = {}

-- Weed restores a random amount of health between these numbers
Config.MinWeedHealth = 15
Config.MaxWeedHealth = 40

 -- Opium gives a random temporary amount of armor between these numbers
Config.MinOpiumArmor = 25
Config.MaxOpiumArmor = 75

-- The amount of "drug" status added by various items is a random amount between min and max
Config.HighAmounts = {
    weed_pooch = {
        min = 10000,
        max = 20000
    },

    opium_pooch = {
        min = 20000,
        max = 30000
    }
}