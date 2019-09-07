Config              = {}
Config.DrawDistance = 75.0
Config.CopsRequired = 1
Config.BlipUpdateTime = 7200 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 60
Config.Locale = 'en'
Config.PoliceBlipColor = 1
Config.ShowBlip = false

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = -525.17, y = -2902.26, z = 5.00},
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1,
		Colour    = 6, --BLIP
		Id        = 229, --BLIP
	},
}

Config.VehicleSpawnPoint = {
	Pos   = {x = -525.17, y = -2902.26, z = 6},
    Size  = {x = 3.0, y = 3.0, z = 1.0},
    Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 2130.68, y = 4781.32, z = 39.87},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(3500,6000),
		Cars = {'gtrnismo17', '370z', '911r', 'mgt', 'jester2', 'cyclone'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos      = {x = 3333.51, y = 5159.91, z = 17.20},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(3500,6000),
		Cars = {'sultanrs','osiris','visione','ruston','turismor'},--'sultanrs','osiris','visione','ruston','turismor'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = -437.56, y = 6254.53, z = 29.02},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(4500,8000),
		Cars = {'gtrnismo17', '370z', '911r', 'mgt', 'jester2', 'cyclone'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = -2177.51, y = 4269.51, z = 47.93},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(4000,6500),
		Cars = {'sultanrs','osiris','visione','ruston','turismor'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = 895.02, y = 3603.87, z = 31.72},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(3000,5000),
		Cars = {'gtrnismo17', '370z', '911r', 'mgt', 'jester2', 'cyclone'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--Chiliad Compound
	Delivery14 = {
		Pos      = {x = -1093.85, y = 4945.77, z = 216.93},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 0, g = 204, b = 0},
		Type  = 1,
		Payment  = 4000, --math.random(3000,5000),
		Cars = {'gtrnismo17', '370z', '911r', 'mgt', 'jester2', 'cyclone'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--Vinewood Radio Tower
	Delivery15 = {
		Pos      = {x = 669.9944, y = 1278.904, z = 359.5},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(3000,5000),
		Cars = {'sultanrs','osiris','visione','ruston','turismor'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--The Lost MC mobilehome park
	Delivery16 = {
		Pos      = {x = 61.55041, y = 3689.627, z = 39.25, },
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1,
		Payment  = 3000, --math.random(3000,5000),
		Cars = {'gtrnismo17', '370z', '911r', 'mgt', 'jester2', 'cyclone'},--'sultanrs','osiris','cyclone','ruston','turismor'},
	},
}