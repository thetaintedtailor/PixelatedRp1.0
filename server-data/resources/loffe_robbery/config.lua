Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
    -- {coords = vector3(x, y, z), heading = peds heading, money = {min, max}, cops = amount of cops required to rob, blip = true: add blip on map false: don't add blip, name = name of the store (when cops get alarm, blip name etc)}
    {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1221.99, -908.36, 12.33-0.98), heading = 30.51, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1486.33, -377.56, 40.16-0.98), heading = 135.21, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-46.98, -1758.60, 29.42-0.98), heading = 54.04, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1134.15, -982.46, 46.42-0.98), heading = 275.90, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1164.91, -322.84, 69.21-0.98), heading = 101.85, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(373.04, 328.48, 103.57-0.98), heading = 254.07, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1165.95, 2710.83, 38.16-0.98), heading = 182.16, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(549.40, 2669.08, 42.16-0.98), heading = 93.39, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1959.95, 3739.96, 32.34-0.98), heading = 298.91, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1392.70, 3606.50, 34.98-0.98), heading = 197.47, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-1819.92, 794.15, 138.09-0.98), heading = 135.25, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-2966.13, 390.96, 15.04-0.98), heading = 87.53, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3041.01, 583.85, 7.91-0.98), heading = 17.00, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-3244.25, 1000.08, 12.83-0.98), heading = 354.07, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2557.52, 380.77, 108.62-0.98), heading = 0.42, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(2676.06, 3280.43, 55.24-0.98), heading = 328.28, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1697.10, 4923.57, 42.06-0.98), heading = 326.84, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(1728.65, 6417.00, 35.04-0.98), heading = 244.30, money = {200, 800}, cops = 1, blip = true, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You stole:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}