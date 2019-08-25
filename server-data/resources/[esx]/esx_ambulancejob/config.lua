Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 100  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(283.89, -578.62, 42.5), heading = 65.66 }

Config.Hospitals = {
	
	Pillbox = {

		Blip = {
			coords = vector3(292.3, -583.6, 43.2),
			sprite = 61,
			scale  = 1.2,
			color  = 38
		},

		AmbulanceActions = {
			vector3(310.4, -599.1, 42.3)
		},

		Pharmacies = {
			vector3(325.0, -580.5, 42.3)
		},

		Vehicles = {
			{
				Spawner = vector3(299.7, -579.5, 43.3),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(286.0, -595.7, 43.1), heading = 338.6, radius = 4.0 },
					{ coords = vector3(290.3, -597.3, 43.2), heading = 338.6, radius = 4.0 },
					{ coords = vector3(294.4, -585.6, 43.2), heading = 338.6, radius = 4.0 },
					{ coords = vector3(289.9, -583.9, 43.2), heading = 338.6, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(344.3, -580.7, 74.2),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.0, -588.2, 74.2), heading = 344.1, radius = 10.0 }
				}
			}
		},

		FastTravels = {
		},
		-- Prompted fast travels (below) are for ems only --
		FastTravelsPrompt = {
			{
				From = vector3(360.1, -585.0, 27.7),
				To = { coords = vector3(300.74, -597.94, 42.4), heading = 289.86 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 189, g = 207, b = 237, a = 100, rotate = false }
			},

			{
				From = vector3(298.801, -598.8, 42.2),
				To = { coords = vector3(356.2, -597.1, 27.9), heading = 253.5 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 189, g = 207, b = 237, a = 100, rotate = false }
			},

			{
				From = vector3(325.21, -598.68, 42.3),
				To = { coords = vector3(339.9, -586.7, 73.4), heading = 249.1 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 189, g = 207, b = 237, a = 100, rotate = false }
			},
			{
				From = vector3(339.3, -583.9, 73.2),
				To = { coords = vector3(338.90, -592.15, 42.32), heading = 340.42 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 189, g = 207, b = 237, a = 100, rotate = false }
			}
		}
	}
}

Config.AuthorizedVehicles = {

	trainee = {},
	psychologist = {},

	emt = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1
		}
	},

	paramedic = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1
		},
		{
			model = 'emsfpiu',
			label = 'Ford Explorer',
			price = 1
		}
	},

	doctor = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1
		},
		{
			model = 'emsfpiu',
			label = 'Ford Explorer',
			price = 1
		}
	},

	psychiatrist = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1
		},
		{
			model = 'emsfpiu',
			label = 'Ford Explorer',
			price = 1
		}
	},

	surgeon = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1,
		},
		{
			model = 'emsfpiu',
			label = 'Ford Explorer',
			price = 1
		}
	},

	boss = {
		{
			model = 'ambulance',
			label = 'Ambulance Van',
			price = 1
		},
		{
			model = 'emsfpiu',
			label = 'Ford Explorer',
			price = 1
		}
	}

}

Config.AuthorizedHelicopters = {
	trainee = {},
	psychologist = {},
	emt = {},
	paramedic = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 1
		},
		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 1
		}
	},

	doctor = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 1
		},
		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 1
		}
	},

	psychiatrist = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 1
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 1
		}
	},

	surgeon = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 1
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 1
		}
	},

	boss = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 1
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 1
		}
	}

}

Config.AuthorizedPharmacy = {
	Shared = {
		'bandage',
		'gauze',
		'medicaltape',
		'morphine',
	},
	trainee = {}, 
	psychologist = {}, 
	emt = {},
	paramedic = {
		'k3v',
		'vicodin',
		'ibuprofen',
		'amoxicillin',
		'xanax'
	},
	doctor = {
		'k3v',
		'vicodin',
		'ibuprofen',
		'amoxicillin',
		'xanax'
	},
	psychiatrist = {
		'k3v',
		'vicodin',
		'ibuprofen',
		'amoxicillin',
		'xanax'
	},
	surgeon = {
		'k3v',
		'vicodin',
		'ibuprofen',
		'amoxicillin',
		'xanax'
	},
	boss = {
		'k3v',
		'vicodin',
		'ibuprofen',
		'amoxicillin',
		'xanax'
	}
}