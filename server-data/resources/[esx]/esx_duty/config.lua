Config                            = {}
Config.DrawDistance               = 50.0
--language currently available EN and SV
Config.Locale                     = 'en'

Config.Zones = {

  PoliceDuty = {
    Pos   = { x = 439.825, y = -975.693, z = 29.691 },
    Size  = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },  
    Jobs = {'police', 'offpolice'}
  },

  PoliceDuty2 = {
    Pos   = { x = 1852.74, y = 3690.26, z = 33.29 },
    Size  = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },  
    Jobs = {'police', 'offpolice'}
  },

  PoliceDutyDownstairs = {
    Pos   = { x = 470.17, y = -980.87, z = 23.92 },
    Size  = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },  
    Jobs = {'police', 'offpolice'}
  },

  AmbulanceDuty = {
    Pos = { x = 316.43695068359, y = -589.00659179688, z = 42.291809082031 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },
    Jobs = {'ambulance', 'offambulance', 'police', 'offpolice', 'taxi', 'offtaxi', 'offmechanic', 'mechanic'}
  },

  TaxiDuty = {
    Pos = { x = 901.25, y = -174.24, z = 73.10 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },
    Jobs = {'taxi', 'offtaxi'}
  },

  BennysMechanicDuty = {
    Pos = { x = -199.86, y = -1320.59, z = 30.10 },
    Size = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 0, b = 100 },
    Jobs = {'mechanic', 'offmechanic'}
  },

  CentralMechanicDuty = {
    Pos = { x = -346.57, y = -133.52, z = 38.02 },
    Size = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 0, b = 100 },
    Jobs = {'mechanic', 'offmechanic'}
  },

  Route68MechanicDuty = {
    Pos = { x = 1172.12, y = 2637.56, z = 36.82 },
    Size = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 0, b = 100 },
    Jobs = {'mechanic', 'offmechanic'}
  },

  TheDenMechanicDuty = {
    Pos = { x = 726.13, y = -1071.90, z = 27.33 },
    Size = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 0, b = 100 },
    Jobs = {'mechanic', 'offmechanic'}
  },

  AirportMechanicDuty = {
    Pos = { x = -1149.05, y = -2000.37, z = 12.20 },
    Size = { x = 2.0, y = 2.0, z = 1.5 },
    Color = { r = 0, g = 0, b = 100 },
    Jobs = {'mechanic', 'offmechanic'}
  },
}