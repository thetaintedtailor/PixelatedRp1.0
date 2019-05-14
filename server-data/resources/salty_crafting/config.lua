Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["lockpick"] = { 
		{item = "bobbypin", quantity = 4 }, 
		{item = "rubberband", quantity = 1 },
	},
	
	-- Can be a weapon, must follow this format
	['WEAPON_CARBINERIFLE'] = { 
		{item = "upper", quantity = 1}, 
		{item = "lower", quantity = 1},
		{item = "barrel", quantity = 1},
		{item = "magazine", quantity = 1},
	}
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
	keyCode = 244
}
