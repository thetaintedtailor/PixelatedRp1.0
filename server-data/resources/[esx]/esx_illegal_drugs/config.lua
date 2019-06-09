Config              = {}
Config.MarkerType   = -1 -- Marker visible or not. -1 = hiden  Set to 1 for a visible marker. To have a list of avaible marker go to https://docs.fivem.net/game-references/markers/
Config.DrawDistance = 100.0 --Distance where the marker be visible from
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0} -- Size of the marker
Config.MarkerColor  = {r = 0, g = 255, b = 0} --Color of the marker

Config.RequiredCopsCoke  = 0 --Ammount of cop that need to be online to be able to harvest/process/sell coke
Config.RequiredCopsMeth  = 0 --Ammount of cop that need to be online to be able to harvest/process/sell meth
Config.RequiredCopsWeed  = 0 --Ammount of cop that need to be online to be able to harvest/process/sell weed
Config.RequiredCopsOpium = 0 --Ammount of cop that need to be online to be able to harvest/process/sell opium

Config.TimeToFarmWeed     = 10  * 1000 -- Ammount of time to harvest weed
Config.TimeToProcessWeed  = 10  * 1000 -- Ammount of time to process weed
Config.TimeToSellWeed     = 10  * 1000 -- Ammount of time to sell weed

Config.TimeToFarmOpium    = 10  * 1000 -- Ammount of time to harvest coke
Config.TimeToProcessOpium = 10  * 1000 -- Ammount of time to process coke
Config.TimeToSellOpium    = 10  * 1000 -- Ammount of time to sell coke

Config.TimeToFarmCoke     = 11  * 1000 -- Ammount of time to harvest coke
Config.TimeToProcessCoke  = 11  * 1000 -- Ammount of time to process coke
Config.TimeToSellCoke     = 11  * 1000 -- Ammount of time to sell coke

Config.TimeToFarmMeth     = 11  * 1000 -- Ammount of time to harvest meth
Config.TimeToProcessMeth  = 11  * 1000 -- Ammount of time to process meth
Config.TimeToSellMeth     = 11  * 1000 -- Ammount of time to sell meth

Config.Locale = 'en'

Config.Zones = {
	CokeField =			{x=1093.139,  y=-3195.673,  z=-39.131},
	CokeProcessing =	{x=1101.99,  y=-3193.78,  z=-37.99},
	--CokeDealer =		{x=977.38,   y=-103.95,   z=217.56},
	MethField =			{x=1005.721,  y=-3200.301,  z=-38.519},
	MethProcessing =	{x=1014.878,  y=-3194.871,  z=-38.993},
	--MethDealer =		{x=1391.93,     y=3605.77,   z=37.94},
	WeedField =			{x=1057.448,  y=-3197.646,  z=-39.138},
	WeedProcessing =	{x=1037.527,  y=-3205.368,  z=-38.17},
	--WeedDealer =		{x = 85.58,   y= -1959.34,  z= 20.13},
	OpiumField =		{x=-2163.93,  y=5192.19,   z=15.01},
	OpiumProcessing =	{x=3535.05,   y=3660.58,    z=28.12},
	--OpiumDealer =		{x=-3155.608, y=1125.368,   z=20.858}
}

Config.DisableBlip = true -- Set to true to disable blips. False to enable them.
Config.Map = {

    {name="Drugs Are Hidden",      color=6, scale=1.6, id=378, x=-472.6,     y=-714.99,     z=81.18},
  --{name="Coke Farm",             color=4, scale=0.8, id=501, x=1093.139,   y=-3195.673,  z=-39.131},
  --{name="Coke Processing",       color=4, scale=0.8, id=501, x=1101.837,   y=-3193.732,  z=-38.993},
  --{name="Coke Sales",            color=3, scale=0.8, id=501, x=959.117,    y=-121.055,   z=74.963},
  --{name="Meth Farm Entrance",    color=6, scale=0.8, id=499, x=1386.659,   y=3622.805,   z=35.012},
  --{name="Meth Farm",             color=6, scale=0.8, id=499, x=1005.721,   y=-3200.301,  z=-38.519},
  --{name="Meth Processing",       color=6, scale=0.8, id=499, x=1014.878,   y=-3194.871,  z=-38.993},
  --{name="Meth Sales",            color=3, scale=0.8, id=499, x=7.981,      y=6469.067,   z=31.528},
  --{name="Opium Farm Entrance",   color=6, scale=0.8, id=403, x=2433.804,   y=4969.196,   z=42.348},
  --{name="Opium Farm",            color=6, scale=0.8, id=403, x=2433.804,   y=4969.196,   z=42.348},
  --{name="Opium Processing",      color=6, scale=0.8, id=403, x=2434.43,    y=4964.18,    z=42.348},
  --{name="Opium Sales",           color=3, scale=0.8, id=403, x=-3155.608,  y=1125.368,   z=20.858},
  --{name="Weed Farm Entrance",    color=2, scale=0.8, id=140, x=1057.448,   y=-3197.646,  z=-39.138},
  --{name="Weed Farm",             color=2, scale=0.8, id=140, x=2221.858,   y=5614.81,    z=54.902},
  --{name="Weed Processing",       color=2, scale=0.8, id=140, x=1037.527,   y=-3205.368,  z=-38.17},
  --{name="Weed Sales",            color=3, scale=0.8, id=140, x=85.58,      y=-1959.34,   z=20.13}
}