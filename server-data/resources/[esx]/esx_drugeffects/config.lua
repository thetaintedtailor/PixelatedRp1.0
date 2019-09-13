Config = {}

-- Global maximum for speed. Drugs can never make you go faster than 100 + this value (percentage)
Config.GlobalMaxSpeed = 40

-- Global maximum for speed duration. Drugs will never add additional speed longer than this number of seconds.
Config.GlobalMaxSpeedDuration = 45

-- Weed restores a random amount of health between these numbers
Config.MinWeedHealth = 15
Config.MaxWeedHealth = 40

-- Weed will not heal someone who's health is below this amount
Config.WeedHealthThreshold = 160

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

-- Coke speed boost lasts for a random amount of seconds between these numbers
Config.MinCokeSpeedDuration = 20
Config.MaxCokeSpeedDuration = 50

-- Crack gives a random temporary speed boost between these numbers (in percentages)
Config.MinCrackSpeedPct = 15
Config.MaxCrackSpeedPct = 40

-- Crack speed and stamina boosts lasts for a random amount of seconds between these numbers
Config.MinCrackSpeedDuration = 10
Config.MaxCrackSpeedDuration = 30

-- K3v gives a random temporary speed boost between these numbers (in percentages)
Config.MinK3vSpeedPct = 25
Config.MaxK3vSpeedPct = 33

-- K3v speed boost lasts for a random amount of seconds between these numbers
Config.MinK3vSpeedDuration = 25
Config.MaxK3vSpeedDuration = 35

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
        min = 40000,
        max = 60000
    },

    crack = {
        min = 30000,
        max = 70000
    },

    k3v = {
        min = 40000,
        max = 60000
    },

    xanax = {
        min = 10000,
        max = 30000
    },
    
    vicodin = {
        min = 40000,
        max = 60000
    },

    amoxicillin = {
        min = 0,
        max = 0
    },

    ibuprofen = {
        min = 0,
        max = 0
    }
}