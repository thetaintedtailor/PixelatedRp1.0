Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["medikit"] = { 
		{item = "morphine", quantity = 4 }, 
		{item = "gauze", quantity = 4 },
		{item = "medicaltape", quantity = 2 }, 
		{item = "bandage", quantity = 10 },
	},

	["lockpick"] = { 
		{item = "rubberband", quantity = 4 }, 
		{item = "bobbypin", quantity = 1 },
	},

	["clip"] = { 
		{item = "gunpowder", quantity = 1 }, 
		{item = "brass", quantity = 1 },
	},

	["diamondnecklace"] = { 
		{item = "diamond", quantity = 4 }, 
		{item = "silverchain", quantity = 1 },
	},

	["diamondearrings"] = { 
		{item = "diamond", quantity = 4 }, 
		{item = "stud", quantity = 1 },
	},

	["diamondring"] = { 
		{item = "diamond", quantity = 4 }, 
		{item = "ring", quantity = 1 },
	},
	
	-- Can be a weapon, must follow this format
	['WEAPON_CARBINERIFLE'] = { 
		{item = "upper", quantity = 1}, 
		{item = "lower", quantity = 1},
		{item = "arbarrel", quantity = 1},
		{item = "bionictrigger", quantity = 1},
		{item = "firingpin", quantity = 1},
		{item = "spring", quantity = 1},
	},

	['WEAPON_PUMPSHOTGUN'] = { 
		{item = "shotgunbody", quantity = 1},
		{item = "choke", quantity = 1},
		{item = "shotgunbarrel", quantity = 1},
		{item = "bionictrigger", quantity = 1},
		{item = "firingpin", quantity = 1},
		{item = "spring", quantity = 1},
	},

	['WEAPON_APPISTOL'] = { 
		{item = "apbody", quantity = 1},
		{item = "pistolbarrel", quantity = 1},
		{item = "bionictrigger", quantity = 1},
		{item = "firingpin", quantity = 1},
		{item = "spring", quantity = 1},
	},

	['WEAPON_MICROSMG'] = { 
		{item = "smgbody", quantity = 1},
		{item = "smgbarrel", quantity = 1},
		{item = "bionictrigger", quantity = 1},
		{item = "firingpin", quantity = 1},
		{item = "spring", quantity = 1},
	},

	['WEAPON_PISTOL'] = { 
		{item = "pistolbody", quantity = 1},
		{item = "pistolbarrel", quantity = 1},
		{item = "bionictrigger", quantity = 1},
		{item = "firingpin", quantity = 1},
	},
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = false,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = true,
	keyCode = 56
}
