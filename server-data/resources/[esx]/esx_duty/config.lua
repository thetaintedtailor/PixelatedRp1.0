Config                            = {}
Config.DrawDistance               = 100.0
--language currently available EN and SV
Config.Locale                     = 'en'

Config.Zones = {

  PoliceDuty = {
    Pos   = { x = 439.825, y = -975.693, z = 29.691 },
    Size  = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },  
    Type  = 27,
    Jobs = {'police', 'offpolice'}
  },

  AmbulanceDuty = {
    Pos = { x = 316.43695068359, y = -589.00659179688, z = 42.291809082031 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },
    Type = 27,
    Jobs = {'police', 'offpolice', 'ambulance', 'offambulance', 'taxi', 'offtaxi', 'mechanic', 'offmechanic'}
  },

  TaxiDuty = {
    Pos = { x = 901.25, y = -174.24, z = 73.10 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 255, b = 0 },
    Type = 27,
    Jobs = {'taxi', 'offtaxi'}
  },

  MechanicDuty = {
    Pos = { x = 336.43695068359, y = -600.00659179688, z = 42.291809082031 },
    Size = { x = 2.5, y = 2.5, z = 1.5 },
    Color = { r = 0, g = 0, b = 255 },
    Type = 27,
    Jobs = {'mechanic', 'offmechanic'}
  },
}