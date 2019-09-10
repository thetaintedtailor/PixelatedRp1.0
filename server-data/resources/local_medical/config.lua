Config = {}

Config.MinEMSToHide = 1
Config.MarkerColor = {r=0, g=255, b=0}
Config.MarkerDrawDistance = 40
Config.InteractionDistance = 2
Config.TreatmentThreshold = 5 --Amount of missing health required to seek treatment

Config.Locations = {
    Pillbox = {
        Coords = vector3(307.55, -594.85, 42.3),
        BedLocation = vector3(339.02, -592.25, 42.28),
        MarkerType = 25,
        MarkerSize = vector3(1.0,1.0,1.0),
        CostPerHPPoint = 10,
        LocationName = 'Pillbox Medical'
    },
    Grandmas = {
        Coords = vector3(2436.10, 4966.39, 45.91),
        BedLocation = vector3(2453.25, 4979.48, 51.50),
        MarkerType = 25,
        MarkerSize = vector3(1.0,1.0,1.0),
        CostPerHPPoint = 20,
        LocationName = 'Grandma\'s House'
    }
}