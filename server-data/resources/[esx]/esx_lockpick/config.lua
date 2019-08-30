Config						          = {}
Config.InfiniteLocks		    = false  -- Should one lockpick last forever?
Config.LockTime			        = 30     -- In seconds, how long should lockpicking take?
Config.AlarmTime            = 60     -- Second to have the alarm activated once vehicle is lockpicked
Config.JammedHandbrakeTime  = 30     -- Second to have the handbrake jammed
Config.IgnoreAbort			    = true   -- Remove lockpick from inventory even if user aborts lockpicking?
Config.AllowMecano			    = true   -- Allow mechanics to use this lockpick?
Config.NPCVehiclesLocked    = true   -- Locks all vehicles (MUST HAVE SOME SORT OF LOCKSYSTEM FOR OWNED CAR) Will be adding a check for owned vehicle in the future. 
Config.Locale				        = 'en'   -- Change the language. Currently only en  but will add fr soon.
Config.percentage           = 75	   -- Chance of lockpick success
Config.CallCops             = true   -- Set to true if you want cops to be alerted when lockpicking a vehicle no matter what the outcome is.
Config.CallCopsPercent      = 90     -- When spotted by a local, the chance that cops are called
Config.CallCopsDistance     = 20     -- How close a local must be before they "witness" a breakin and call 911
Config.OnstarPercent        = 20     -- When not spotted by a local, the chance that cops are called
Config.chance               = 15     -- chance of vehicle being unlocked in percentage

Config.blacklist = { -- vehicles that will always be locked when spawned naturally
  "T20",
  "police",
  "police2",
  "sheriff3",
  "sheriff2",
  "sheriff",
  "riot",
  "fbi",
  "hwaycar2",
  "hwaycar3",
  "hwaycar10",
  "hwaycar",
  "polf430",
  "policeb",
  "police7",
  "RHINO",
  "1200rt",
  "srt8police",
  "2015polstang",
  "SFTSU",
  "SFBC1",
  "SFBC2",
  "SFBC3",
  "SFBC4",
  "SFBC5",
  "SFUM1",
  "SFUM2",
  "POLICE3",
  "POLICE8",
  "POLICE5",
  "POLICE6"
}

Config.job_whitelist = {
  "police",
  "offpolice"
}
