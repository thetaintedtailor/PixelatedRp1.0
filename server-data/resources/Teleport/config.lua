Config = {}

-- E key by default
Config.actionKey = 51

-- markers AKA Teleporters
Config.zones = {
	
	WeedEnter = {           --This is the entrance where you go to enter the weed warehouse
		x = -539.21716308594,
		y = -1720.1965332031,
		z = 19.382791519165,
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
		x = 1301.3995361328,
		y = 4319.1743164063,
		z = 37.703685760498,
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
		x = 1012.136,
		y = -3202.527,
		z = -38.993,
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
		x = 374.94,
		y = -576.20,
		z = 18.48,
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
		z = -38.993,
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
}

-- Landing point, keep the same name as markers
Config.point = {

	WeedEnter = {           --This is where you land when you use the entrance teleport.
		x = 1066.009,
		y = -3183.386,
		z = -39.164
	},
	
	WeedExit = {             --This is where you land when you use the exit teleport.
		x = -534.21716308594,
		y = -1718.1965332031,
		z = 19.382791519165
	},

	MethEnter = {
		x = 998.629,
		y = -3199.545,
		z = -36.394
	},
	
	MethExit = {
		x = 1304.3995361328,
		y = 4319.1743164063,  
		z = 37.703685760498
	},

	CokeEnter = {
		x = 1088.636,
		y = -3188.551, 
		z = -38.993
	},
	
	CokeExit = {
		x = 370.70,
		y = -577.08, 
		z = 17.76
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