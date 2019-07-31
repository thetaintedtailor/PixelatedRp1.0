Config              = {}
Config.MarkerType   = 1 -- Marker visible or not. -1 = hiden  Set to 1 for a visible marker. To have a list of avaible marker go to https://docs.fivem.net/game-references/markers/
Config.DrawDistance = 100.0 --Distance where the marker is visible from
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0} --Size of the marker
Config.MarkerColor  = {r = 0, g = 255, b = 0} --Color of the marker

Config.TimeToProcessIron  = 10  * 1000 --Amount of time to process iron

Config.Locale = 'en'

Config.Zones = {
	IronProcessing =	{x=1110.10,  y=-2011.03,  z=30.90},
}

Config.DisableBlip = false -- Set to true to disable blips. False to enable them.

Config.Map = {
    {name="Forge",      color=6, scale=1.6, id=378, x=-472.6,     y=-714.99,     z=81.18},
}