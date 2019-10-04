Config = {}

-- E key by default
Config.actionKey = 51

-- markers AKA Teleporters
Config.zones = {
	
	WeedEnter = {           --This is the entrance where you go to enter the weed warehouse
		x = -1724.68,
		y = 234.16,
		z = 58.47,
		w = 2.0,
		h = 1.0,
		visible = false, -- Set this to true to make the marker visible. False to disable it.
		t = 29,          -- This is the marker. You can change it https://docs.fivem.net/game-references/markers
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},
	
	WeedExit = {          --This is the exit where you go to exit the weed warehouse
		x = 1038.863,
		y = -3197.662,
		z = -38.17,
		w = 2.0,
		h = 1.0,
		visible = false,
		t = 29,
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},
	
	
	MethEnter = {
		x = 988.5,
		y = -1665.36,
		z = 37.25,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	
	MethExit = {
		x = 1011.70,
		y = -3202.53,
		z = -38.99,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	CokeEnter = {
		x = 2916.61,
		y = 4643.52,
		z = 48.54,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	CokeExit = {
		x = 1103.613,
		y = -3196.25,
		z = -38.993
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	ComedyClubEnter = {
		x = -430.09, 
		y = 261.65, 
		z = 82.090,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 25,
		color = {
			r = 240,
			g = 253,
			b = 239
		}
	},

	ComedyClubExit = {
		x = -458.82, 
		y = 284.86, 
		z = 77.62,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 25,
		color = {
			r = 240,
			g = 253,
			b = 239
		}
	},

	HumaneBasementExit = {
		x = 3540.63, 
		y = 3675.49, 
		z = 20.10,
		w = 3.0,
		h = 1.0,
		visible = true,
		t = 25,
		color = {
			r = 51,
			g = 153,
			b = 255
		}
	},
}

-- Landing point, keep the same name as markers
Config.point = {

	WeedEnter = {           --This is where you land when you use the entrance teleport.
		x = 1066.009,
		y = -3183.386,
		z = -39.164
	},
	
	WeedExit = {             --This is where you land when you use the exit teleport.
		x = -1720.94,
		y = 223.42,
		z = 61.74
	},

	MethEnter = {
		x = 998.629,
		y = -3199.545,
		z = -36.394
	},
	
	MethExit = {
		x = 975.17,
		y = -1689.54,
		z = 29.28
	},

	CokeEnter = {
		x = 1088.636,
		y = -3188.551, 
		z = -38.993
	},
	
	CokeExit = {
		x = 2911.12,
		y = 4639.86,
		z = 48.54,
	},

	ComedyClubEnter = {
		x = -458.790, 
		y = 284.750, 
		z = 78.521
	},

	ComedyClubExit = {
		x = -430.142, 
		y = 261.665, 
		z = 82.500,
	},

	HumaneBasementExit = {
		x = 3601.17, 
		y = 3702.59, 
		z = 35.64,
	}
}


-- Automatic teleport list (no need to puseh E key in the marker)
Config.auto = {
	'WeedEnter',
	'WeedExit',
	'MoneyWashEnter',
	'MoneyWashExit',
	'CokeEnter',
	'CokeExit',
	'MethEnter',
	'MethExit'
}