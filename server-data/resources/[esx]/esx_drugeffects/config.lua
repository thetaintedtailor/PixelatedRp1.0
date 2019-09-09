Config = {}

-- Weed restores a random amount of health between these numbers
Config.MinWeedHealth = 15
Config.MaxWeedHealth = 40

 -- Opium gives a random temporary amount of armor between these numbers
Config.MinOpiumArmor = 25
Config.MaxOpiumArmor = 75

 -- Meth gives a random temporary amount of armor between these numbers
Config.MinMethArmor = 5
Config.MaxMethArmor = 20

-- Meth gives a random temporary speed boost between these numbers (in percentages)
Config.MinMethSpeedPct = 5
Config.MaxMethSpeedPct = 20

-- Meth speed boost lasts for a random amount of seconds between these numbers
Config.MinMethSpeedDuration = 10
Config.MaxMethSpeedDuration = 30

-- Coke gives a random temporary speed boost between these numbers (in percentages)
Config.MinCokeSpeedPct = 10
Config.MaxCokeSpeedPct = 30

-- Meth speed boost lasts for a random amount of seconds between these numbers
Config.MinCokeSpeedDuration = 20
Config.MaxCokeSpeedDuration = 50

-- The amount of "drug" status added by various items is a random amount between min and max
Config.HighAmounts = {
    weed_pooch = {
        min = 10000,
        max = 20000
    },

    opium_pooch = {
        min = 20000,
        max = 30000
    },

    meth_pooch = {
        min = 15000,
        max = 50000
    },

    coke_pooch = {
        min = 30000,
        max = 60000
    }
}