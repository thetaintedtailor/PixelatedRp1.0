Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Config.FishPrice = {a = 25, b = 29} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Config.TurtlePrice = {a = 38, b = 44} 
	Config.SharkPrice = {a = 125, b = 163} 

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellFish = {x = -3251.2, y = 991.5, z = 11.49} --Place where players can sell their fish
	Config.SellTurtle = {x = -701.78, y = -882.88, z = 23.78} --Place where players can sell their turtles 
	Config.SellShark = {x = -181.08 , y = 314.79, z = 97.80} --Place where players can sell their sharks

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	
    {x = -3426.7   ,y = 955.66 ,z = 7.35, xs = -3426.2  , ys = 942.4, zs = 1.1 },
	{x = -732.9     ,y = -1309.7 ,z = 4.0, xs = -725.7    , ys = -1351.5, zs = 0.5 },  
	{x = -1607.6      ,y =  5252.8 ,z = 3.0, xs = -1590.2      , ys = 5278.8, zs = 1.0 },
	{x = 3855.0        ,y =  4463.7 ,z = 1.6, xs = 3885.2       , ys =  4507.2, zs = 1.0 },
	{x = 1330.8        ,y =  4226.6 ,z = 32.9, xs = 1334.2         , ys =  4192.4, zs = 30.0 },
}

Config.BoatLicenseCost = 2000 -- How much does a boating license cost
Config.FishLicenseCost = 1000 -- How much does a fishing license cost
