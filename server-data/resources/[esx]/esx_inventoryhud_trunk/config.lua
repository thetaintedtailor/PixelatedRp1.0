local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = true -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = Keys["-"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 100000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
    --- FOOD ---
    bread = 250,
    chocolate = 500,
    cocacola = 500,
    croquettes = 250,
    cupcake = 250,
    hamburger = 250,
    protein_shake = 500,
    sandwich = 250,
    sportlunch = 250,

    --- FOOD ---

    --- DRINKS ---
    water = 500,
    coffe = 500,
    milk = 500,
    beer = 500,
    tequila = 500,
    vodka = 500,
    whisky = 500,
    wine = 500,
    icetea = 500,
    powerade = 500,
    --- DRINKS ---

    --- MEDS ---
    bandage = 100,
    medikit = 500,
    --- MEDS ---

    --- JOBS ---
    alive_chicken = 3000,
    clothe = 2500,
    copper = 1750,
    diamond = 2000,
    cutted_wood = 3000,
    essence = 3000,
    fabric = 1250,
    gold = 4750,
    iron = 2380,
    packaged_chicken = 1000,
    packaged_plank = 1000,
    petrol = 4160,
    petrol_raffin = 4160,
    slaughtered_chicken = 5000,
    stone = 14000,
    washed_stone = 14000,
    wood = 3000,
    wool = 2500,
    shark = 50000,
    turtle = 10000,
    --- JOBS ---

    --- MISC ---
    bulletproof = 2500,
    lighter = 100,
    cigarett = 100,
    gazbottle = 1000,
    scratchoff = 1,
    scratchoff_used = 1,
    gym_membership = 1,
    oxygen_mask = 1000,
    --- MISC ---

    --- TOOLS ---
    blowpipe = 1000,
    carokit = 1000,
    carotool = 1000,
    drill = 10000,
    fixkit = 1000,
    fixtool = 1000,
    lockpick = 1000,
    repairkit = 10000,
    --- TOOLS ---

    --- ILEGALS ---
    coke = 2000,
    coke_pooch = 3000,
    meth = 2000,
    meth_pooch = 3000,
    opium = 2000,
    opium_pooch = 3000,
    weed = 1250,
    weed_pooch = 3000,
    --- ILEGALS ---

    ---WEAPONS----
    clip = 1000,
    WEAPON_GRENADE = 10000,
    WEAPON_BZGAS = 10000,
    WEAPON_SMOKEGRENADE = 10000,
    WEAPON_RAILGUN = 10000,
    WEAPON_STICKYBOMB = 10000,
    WEAPON_KNIFE = 10000,
    WEAPON_NIGHTSTICK = 10000,
    WEAPON_HAMMER = 10000,
    WEAPON_BAT = 10000,
    WEAPON_GOLFCLUB = 10000,
    WEAPON_CROWBAR = 10000,
    WEAPON_PETROLCAN = 10000,
    WEAPON_FIREEXTINGUISHER = 10000,
    WEAPON_BALL = 10000,
    WEAPON_DAGGER = 10000,
    WEAPON_SWEAPON_SNOWBALLTUNGUN = 10000,
    WEAPON_GARBAGEBAG = 10000,
    WEAPON_HANDCUFFS = 10000,
    WEAPON_KNUCKLE = 10000,
    WEAPON_HATCHET = 10000,
    WEAPON_MACHETE = 10000,
    WEAPON_SWITCHBLADE = 10000,
    WEAPON_BATTLEAXE = 10000,
    WEAPON_POOLCUE = 10000,
    WEAPON_FLASHLIGHT = 10000,
    WEAPON_FLAREGUN = 10000,
    WEAPON_PISTOL = 10000,
    WEAPON_COMBATPISTOL = 10000,
    WEAPON_APPISTOL = 10000,
    WEAPON_PISTOL50 = 10000,
    WEAPON_COMBATPDW = 10000,
    WEAPON_MARKSMANPISTOL = 10000,
    WEAPON_SNSPISTOL = 10000,
    WEAPON_HEAVYPISTOL = 10000,
    WEAPON_REVOLVER = 10000,
    WEAPON_STUNGUN = 10000,
    WEAPON_FIREWORK = 10000,
    WEAPON_MINISMG = 10000,
    WEAPON_SMG = 10000,
    WEAPON_MICROSMG = 10000,
    WEAPON_ASSAULTSMG = 10000,
    WEAPON_PUMPSHOTGUN = 10000,
    WEAPON_AUTOSHOTGUN = 10000,
    WEAPON_DBSHOTGUN = 10000,
    WEAPON_ASSAULTSHOTGUN = 10000,
    WEAPON_SAWNOFFSHOTGUN = 10000,
    WEAPON_HEAVYSHOTGUN = 10000,
    WEAPON_MUSKET = 10000,
    WEAPON_COMPACTRIFLE = 10000,
    WEAPON_MARKSMANRIFLE = 10000,
    WEAPON_SPECIALCARBINE = 10000,
    WEAPON_ADVANCEDRIFLE = 10000,
    WEAPON_CARBINERIFLE = 10000,
    WEAPON_ASSAULTRIFLE = 10000,
    WEAPON_BALL = 10000,
    WEAPON_MG = 10000,
    WEAPON_COMBATMG = 10000,
    WEAPON_BULLPUPRIFLE = 10000,
    WEAPON_BULLPUPSHOTGUN = 10000,
    WEAPON_HEAVYSNIPER = 10000,
    WEAPON_SNIPERRIFLE = 10000,
    WEAPON_FLARE = 10000,
    ---WEAPONS----

    --- MONEY ---
    black_money = 1,
    bank = 1, 
    --- MONEY ---
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0 --Trains
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 50000, --Sedan
    [2] = 70000, --SUV
    [3] = 50000, --Coupes
    [4] = 50000, --Muscle
    [5] = 50000, --Sports Classics
    [6] = 50000, --Sports
    [7] = 50000, --Super
    [8] = 20000, --Motorcycles
    [9] = 100000, --Off-road
    [10] = 150000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 150000, --Boats
    [15] = 100000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 250000, --Commercial
    [21] = 0, --Trains
}

Config.VehiclePlate = {
	taxi        = "TAXI",
	cop         = "LSPD",
	ambulance   = "EMS0",
	mecano	    = "MECA",
}
