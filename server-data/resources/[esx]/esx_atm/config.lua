Config              = {}

Config.ZDiff        = 2.0
Config.BlipSprite   = 431

Config.Locale = 'en'

Config.EnableBlips = false -- for some reason ATM blips are extremly buggy and will bug out the map

Config.ATMLocations = {
	{ ['x'] = -386.733,  ['y'] = 6045.953,  ['z'] = 31.501},
	{ ['x'] = -111.33,  ['y'] = 6467.42,  ['z'] = 31.784}, -- paleto blvd bank
	{ ['x'] = -112.47,  ['y'] = 6468.70,  ['z'] = 31.63}, -- paleto blvd bank
	{ ['x'] = -113.34,  ['y'] = 6469.92,  ['z'] = 31.63}, -- paleto blvd bank
	{ ['x'] = 155.4300,  ['y'] = 6641.991,  ['z'] = 31.784}, -- SW atm near paleto LSC
	{ ['x'] = 174.6720,  ['y'] = 6637.218,  ['z'] = 31.784}, -- SE atm near paleto LSC
	{ ['x'] = 1703.82,  ['y'] = 6426.28,  ['z'] = 32.64}, -- gas station: senora fwy, mt chiliad
	{ ['x'] = 1735.114,  ['y'] = 6411.035,  ['z'] = 35.164}, -- 24/7 atm senora fwy, mt chiliad
	{ ['x'] = 1702.842,  ['y'] = 4933.593,  ['z'] = 42.051}, -- LTD atm grapeseed main street
	{ ['x'] = 1967.333,  ['y'] = 3744.293,  ['z'] = 32.272}, -- 24/7 ATM niland ave, sandy shores
	{ ['x'] = 1175.01,  ['y'] = 2706.57,  ['z'] = 38.09}, -- Fleeca bank route 68, sandy shores
	{ ['x'] = 1176.57,  ['y'] = 2706.59,  ['z'] = 38.10}, -- Fleeca bank route 68, sandy shores
	{ ['x'] = 2564.399,  ['y'] = 2585.100,  ['z'] = 38.016}, -- rex's diner atm senora way, davis quartz
	{ ['x'] = 2559.49,  ['y'] = 350.92,  ['z'] = 108.050}, -- gas station atm palomino fwy, tataviam mountains
	{ ['x'] = 2558.051,  ['y'] = 389.4817,  ['z'] = 108.660}, -- 24/7 atm palomino fwy, tataviam mountains
	{ ['x'] = 1077.692,  ['y'] = -775.796,  ['z'] = 58.218}, -- atm west mirror drive, mirror park
	{ ['x'] = 1139.018,  ['y'] = -469.886,  ['z'] = 66.789}, -- SW atm mirror park bld, mirror park
	{ ['x'] = 1168.975,  ['y'] = -457.241,  ['z'] = 66.641}, -- NE atm mirror park blvd, mirror park
	{ ['x'] = 1153.884,  ['y'] = -326.540,  ['z'] = 69.245}, -- LTD atm west mirror drive, mirror park
	{ ['x'] = 235.86,  ['y'] = 219.32,  ['z'] = 106.29}, -- Vinewood bank west-side
	{ ['x'] = 236.76,  ['y'] = 217.45,  ['z'] = 106.29}, -- Vinewood bank west-side
	{ ['x'] = 237.78,  ['y'] = 215.75,  ['z'] = 106.29}, -- Vinewood bank west-side
	{ ['x'] = 265.002,  ['y'] = 214.21,  ['z'] = 106.28}, -- Vinewood bank east-side
	{ ['x'] = 264.31,  ['y'] = 212.24,  ['z'] = 106.28}, -- Vinewood bank east-side
	{ ['x'] = 263.35,  ['y'] = 210.27,  ['z'] = 106.28}, -- Vinewood bank east-side
	{ ['x'] = -164.40,  ['y'] = 232.53,  ['z'] = 94.92}, -- atm eclipse blvd, west vinewood
	{ ['x'] = -164.38,  ['y'] = 234.92,  ['z'] = 94.92}, -- atm eclipse blvd, west vinewood
	{ ['x'] = -1827.04,  ['y'] = 785.5159,  ['z'] = 138.020}, -- LTD atm banham canyon dr/north rockford dr, richman glen
	{ ['x'] = -1408.94,  ['y'] = -100.31,  ['z'] = 52.39}, -- atm cougar ave, rockford hills
	{ ['x'] = -1409.72,  ['y'] = -98.49,  ['z'] = 52.45}, -- atm cougar ave, rockford hills
	{ ['x'] = -1212.64,  ['y'] = -330.15,  ['z'] = 37.79}, -- Fleeca bank boulevard del perro, rockford hills
	{ ['x'] = -1214.14,  ['y'] = -330.96,  ['z'] = 37.79}, -- Fleeca bank boulevard del perro, rockford hills
	{ ['x'] = -2072.41,  ['y'] = -316.959,  ['z'] = 13.345}, -- gas station atm del perro fwy, pacific bluffs
	{ ['x'] = -2975.72,  ['y'] = 379.7737,  ['z'] = 14.992}, -- rob's liquor atm great ocean hwy, banham canyon
	{ ['x'] = -2963.02,  ['y'] = 483.29,  ['z'] = 15.70}, -- Fleeca bank great ocean hwy, banham canyon
	{ ['x'] = -2963.22,  ['y'] = 481.37,  ['z'] = 15.71}, -- Fleeca bank great ocean hwy, banham canyon
	{ ['x'] = -3144.13,  ['y'] = 1127.415,  ['z'] = 20.868}, -- atm great ocean hwy, chumash
	{ ['x'] = -1305.40,  ['y'] = -706.240,  ['z'] = 25.352}, -- astro cinema atm del perro fwy, del perro
	{ ['x'] = -717.614,  ['y'] = -915.880,  ['z'] = 19.268}, -- LTD atm ginger st, little seoul
	{ ['x'] = -526.566,  ['y'] = -1222.90,  ['z'] = 18.434}, -- gas station atm calais ave, little seoul
	{ ['x'] = 150.18,  ['y'] = -1040.27,  ['z'] = 29.37}, --Fleeca bank vespucci blvd, pillbox hill
	{ ['x'] = 148.32,  ['y'] = -1039.66,  ['z'] = 29.38}, --Fleeca bank vespucci blvd, pillbox hill
	{ ['x'] = -846.304,  ['y'] = -340.402,  ['z'] = 38.687}, -- atm heritage way, rockford hills
	{ ['x'] = -1212.85,  ['y'] = -330.36,  ['z'] = 37.79}, -- Fleeca bank boulevard del perro, rockford hills
	{ ['x'] = -1214.53,  ['y'] = -330.92,  ['z'] = 37.79}, -- Fleeca bank boulevard del perro, rockford hills
	{ ['x'] = -56.1935,  ['y'] = -1752.53,  ['z'] = 29.452}, -- LTD atm grove st, davis
	{ ['x'] = -273.001,  ['y'] = -2025.60,  ['z'] = 30.197}, -- Maze bank arena west-side atm, davis ave
	{ ['x'] = -261.692,  ['y'] = -2012.64,  ['z'] = 30.121}, -- maze bank arena east-side atm, davis ave
	{ ['x'] = 314.59,   ['y'] = -278.23,  ['z'] = 54.170}, -- Fleeca bank hawick ave/meteor st, alta
	{ ['x'] = 312.91,   ['y'] = -278.18,  ['z'] = 54.170}, -- Fleeca bank hawick ave/meteor st, alta
	{ ['x'] = -350.60,  ['y'] = -49.51,   ['z'] = 49.042}, -- Fleeca bank hawick ave, burton
	{ ['x'] = -352.28,  ['y'] = -48.76,   ['z'] = 49.05}, -- Fleeca bank hawick ave, burton
	{ ['x'] = -1570.197, ['y'] = -546.651,  ['z'] = 34.955}, -- atm bay city ave/blvd del perro, del perro
	{ ['x'] = -1571.37, ['y'] = -547.18,  ['z'] = 34.96}, -- atm bay city ave/blvd del perro, del perro
	{ ['x'] = 33.232,    ['y'] = -1347.849, ['z'] = 29.497}, -- 24/7 atm innocence blvd/elgin ave, strawberry
	{ ['x'] = 128.70,   ['y'] = -1291.40, ['z'] = 29.27}, -- vanilla unicorn atm olympic fwy, strawberry
	{ ['x'] = 129.36,   ['y'] = -1292.72, ['z'] = 29.27}, -- vanilla unicorn atm olympic fwy, strawberry
	{ ['x'] = 289.012,   ['y'] = -1256.545, ['z'] = 29.440}, -- gas station atm olympic fwy/strawberry ave, strawberry
	{ ['x'] = 1686.753,  ['y'] = 4815.809,  ['z'] = 42.008}, -- clothing store atm grapeseed main st/grapeseed ave, grapeseed
	{ ['x'] = -303.42,  ['y'] = -830.33,  ['z'] = 32.36}, -- atm vespucci blvd/peaceful st, pillbox hill
	{ ['x'] = -301.72,  ['y'] = -830.68,  ['z'] = 32.33}, -- atm vespucci blvd/peaceful st, pillbox hill
	{ ['x'] = 5.134,     ['y'] = -919.949,  ['z'] = 29.557}, -- atm power st/low power st, pillbox hill
	{ ['x'] = -283.48,  ['y'] = 6225.45,  ['z'] = 31.49}, -- atm duluoz ave/paleto blvd , paleto bay
	{ ['x'] = -133.50,  ['y'] = 6365.30,  ['z'] = 31.38}, -- atm paleto blvd/pyrite ave, paleto bay
	{ ['x'] = -96.62,  ['y'] = 6454.81,  ['z'] = 31.46}, -- atm paleto blvd/cascabel ave, paleto bay
	{ ['x'] = -95.03,  ['y'] = 6456.68,  ['z'] = 31.46}, -- atm paleto blvd/cascabel ave, paleto bay
	{ ['x'] = 1821.917,  ['y'] = 3683.483,  ['z'] = 34.244}, -- atm zancudo ave/mt view dr, sandy shores
	{ ['x'] = 540.0420,  ['y'] = 2671.007,  ['z'] = 42.177}, -- 24/7 atm route 68, harmony
	{ ['x'] = 381.2827,  ['y'] = 323.2518,  ['z'] = 103.270}, -- 24/7 atm clinton ave, downtown vinewood
	{ ['x'] = 285.64,  ['y'] = 143.77,  ['z'] = 104.970}, -- whirligig cinema atm vinewood blvd, downtown vinewood
	{ ['x'] = 157.7698,  ['y'] = 233.5450,  ['z'] = 106.450}, -- atm vinewood blvd, downtown vinewood
	{ ['x'] = -1205.35,  ['y'] = -325.579,  ['z'] = 37.870}, -- outside 24/7 vinewood blvd, downtown vinewood
	{ ['x'] = -2956.62,  ['y'] = 488.24,  ['z'] = 15.486}, -- outside fleeca bank atm great ocean hwy, banham canyon
	{ ['x'] = -2959.01,  ['y'] = 488.37,  ['z'] = 15.486}, -- outside fleeca bank atm great ocean hwy, banham canyon
	{ ['x'] = -3044.22,  ['y'] = 595.2429,  ['z'] = 7.595}, -- outside 24/7 ineseno blvd, banham canyon
	{ ['x'] = -3240.73,  ['y'] = 997.05,  ['z'] = 12.53}, -- outside 24/7 barbareno blvd, chumash
	{ ['x'] = -3241.11,  ['y'] = 1009.152,  ['z'] = 12.877}, -- 24/7 atm barbareno blvd, chumash
	{ ['x'] = -538.225,  ['y'] = -854.423,  ['z'] = 29.234}, -- vespucci blvd/calais ave, little seoul
	{ ['x'] = -712.93,  ['y'] = -819.48,  ['z'] = 23.768}, -- atm vespucci blvd/ginger st, little seoul
	{ ['x'] = -710.00,  ['y'] = -819.79,  ['z'] = 23.64}, -- atm vespucci blvd/ginger st, little seoul
	{ ['x'] = -255.74,  ['y'] = -716.21,  ['z'] = 33.48}, -- atm peaceful st/san andreas ave, pillbox hill
	{ ['x'] = -203.548,  ['y'] = -861.588,  ['z'] = 30.205}, -- atm vespucci blvd/alta st, pillbox hill
	{ ['x'] = 111.16,  ['y'] = -775.61,  ['z'] = 31.44}, -- atm san andreas ave, pillbox hill
	{ ['x'] = 114.31,  ['y'] = -776.94,  ['z'] = 31.42}, -- atm san andreas ave, pillbox hill
	{ ['x'] = 112.9290,  ['y'] = -818.710,  ['z'] = 31.386}, -- atm san andreas/elgin ave, pillbox hill
	{ ['x'] = 119.9000,  ['y'] = -883.826,  ['z'] = 31.191}, -- escapism travel atm elgin ave, pilbbox hill
	{ ['x'] = -254.112,  ['y'] = -692.483,  ['z'] = 33.616}, -- atm peaceful st/san andreas ave, pillbox hill
	{ ['x'] = -1415.909, ['y'] = -211.825,  ['z'] = 46.500}, -- tivoli cinema, morningwood blvd/cougar ave, morningwood
	{ ['x'] = -1430.122, ['y'] = -211.014,  ['z'] = 46.500}, -- tivoli cinema, morningwood blvd/cougar ave, morningwood
	{ ['x'] = 287.645,   ['y'] = -1282.646, ['z'] = 29.659}, -- gas station atm, capital blvd, strawberry
	{ ['x'] = 295.94,   ['y'] = -893.82,  ['z'] = 29.22}, -- atm strawberry ave/san andreas ave, mission row
	{ ['x'] = 295.28,   ['y'] = -896.01,  ['z'] = 29.21}, -- atm strawberry ave/san andreas ave, mission row
	{ ['x'] = -1316.30,  ['y'] = -835.15,   ['z'] = 16.96}, -- atm bay city ave/sandcastle way, del perro
	{ ['x'] = -1315.21,  ['y'] = -836.22,   ['z'] = 16.96}, -- atm bay city ave/sandcastle way, del perro
	{ ['x'] = 89.75,     ['y'] = 2.35,      ['z'] = 68.31}, -- atm spanish ave, downtown vinewood
	{ ['x'] = 2682.996,  ['y'] = 3286.561,  ['z'] = 55.241}, -- 24/7 atm senora fwy, grand senora desert
	{ ['x'] = -1390.800, ['y'] = -590.746,  ['z'] = 30.319}, -- bahama mama's atm, marathon ave, del perro
	{ ['x'] = -611.73999, ['y'] = -704.74749,  ['z'] = 31.23}, -- atm palomino ave/san andreas ave, little seoul
	{ ['x'] = -614.48986, ['y'] = -704.79864,  ['z'] = 31.23}, -- atm palomino ave/san andreas ave, little seoul
	{ ['x'] = -207.06, ['y'] = -1341.63,  ['z'] = 34.89}, -- atm Benny's
	{ ['x'] = -1140.17, ['y'] = -2006.30,  ['z'] = 13.18}, -- atm Airport LSCustoms
	{ ['x'] = 724.60, ['y'] = -1071.64,  ['z'] = 23.13}, -- atm 'The Den' LSCustoms
	{ ['x'] = -344.97, ['y'] = -123.05,  ['z'] = 39.01}, -- atm Central LSCustoms
}
