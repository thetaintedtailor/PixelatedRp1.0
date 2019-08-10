Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 25 * 60000 -- 25 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			},

						{
				Spawner = vector3(1869.502, 3691.951, 33.75057),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(1868.855, 3695.369, 33.73057), heading = 276.1, radius = 6.0 },
					{ coords = vector3(1865.783, 3701.289, 33.73057), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	cadet = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', compnents = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	deputy = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	senior_officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	corporal = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	captain = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	commander = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	deputy_sheriff = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	deputy_chief = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	sheriff = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, nil, 4000, 8000, 5000, 2000, nil }, price = 1 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, nil, nil }, price = 1 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 1 },
		{ weapon = 'WEAPON_STUNGUN', price = 1 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 1 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	},

	cadet = {
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 }
	},

	officer = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8',label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		-- { model = 'SFBC3', 	label = 'BCSO Explorer', price = 1 }, Old style Explorer
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	deputy = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8',label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	senior_officer = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	corporal = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	sergeant = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	lieutenant = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	captain = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	commander = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	deputy_sheriff = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	deputy_chief = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	sheriff = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	},

	boss = {
		{ model = 'SFBC2', label = 'BCSO Charger', price = 1 },
		{ model = 'SFBC4', label = 'BCSO Crown Vic', price = 1 },
		{ model = 'SFBC5', label = 'BCSO Explorer', price = 1 },
		{ model = 'silv', label = 'BCSO Silverado', price = 1},
		{ model = '1200rt', label = 'LSPD 1200RT Motorcycle', price = 1 },
		{ model = 'police2',label = 'LSPD Charger', price = 1},
		{ model = 'police', label = 'LSPD Crown Vic', price = 1 },
		{ model = 'police3', label = 'LSPD Explorer', price = 1},
		{ model = 'police8', label = 'LSPD Impala', price = 1},
		{ model = '2015polstang', label = 'LSPD Mustang', price = 1 },
		{ model = 'policet', label = 'LSPD Van', price = 1 },
		{ model = 'pranger', label = 'Park Ranger SUV',price = 1 },
		{ model = 'pbus', label = 'Prison Bus',price = 1 },
		{ model = 'fbi', label = 'Unmarked Buffalo', price = 1},
		{ model = 'SFUM2', label = 'Unmarked Crown Vic', price = 1 },
		{ model = 'fbi2', label = 'Unmarked Granger',price = 1},
		{ model = 'SFUM1', label = 'Unmarked Tahoe', price = 1 },
		{ model = 'police4', label = 'Unmarked Vapid',price = 1}
	}
}

Config.AuthorizedHelicopters = {
	cadet = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	officer = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	deputy = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	senior_officer = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	corporal = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	sergeant = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	lieutenant = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	captain = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	commander = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	deputy_sheriff = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	deputy_chief = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	sheriff = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	},

	boss = {
		{
			model = 'polmav',
			label = 'Police Maverick',
			livery = 0,
			price = 1
		}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	cadet_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 52,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 6,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 34,  ['tshirt_2'] = 0,
			['torso_1'] = 84,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 48,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			['torso_1'] = 31,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 2,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	deputy_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 183,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 34,  ['tshirt_2'] = 0,
			['torso_1'] = 91,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 2,
			['pants_1'] = 31,   ['pants_2'] = 2,
			['shoes_1'] = 9,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	senior_officer_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	corporal_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 1,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 0,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 143,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	captain_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 143,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	commander_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 143,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	deputy_sheriff_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	deputy_chief_wear = {
		male = {
			['tshirt_1'] = 55,  ['tshirt_2'] = 0,
			['torso_1'] = 143,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 25,   ['pants_2'] = 8,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sheriff_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 57,  ['tshirt_2'] = 0,
			['torso_1'] = 143,   ['torso_2'] = 7,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}
