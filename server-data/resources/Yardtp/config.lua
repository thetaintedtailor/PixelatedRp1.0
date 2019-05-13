Config = {}

-- E key by default
Config.actionKey = 51

-- markers AKA Teleporters
Config.zones = {

	YardEnter = {
		x = 998.34,
		y = -3091.86,
		z = -38.00,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	YardExit = {
		x = 1636.34,
		y = 2565.27,
		z = 44.56,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	}
}

-- Landing point, keep the same name as markers
Config.point = {

	YardEnter = {
		x = 1636.52,
		y = 2561.99,
		z = 45.56
	},

	YardExit = {
		x = 1000.63,
		y = -3092.19,
		z = -39.00
	}
}


-- Automatic teleport list (no need to puseh E key in the marker)
Config.auto = {
	'YardEnter',
	'YardExit'
}
