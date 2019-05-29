local vehicles = {
	{ hash="-475225213" }, -- police trainer
	{ hash="666014468" }, -- police cruiser
	{ hash="2038038420" }, -- police stanier
	{ hash="-1537810200" }, -- police buffalo
	{ hash="-1309990298" }, -- fbi buffalo
	{ hash="-64097686" }, -- fbi granger
	{ hash="-35776806" }, -- sheriff cruiser
	{ hash="-2007311232" }, -- sheriff buffalo
	--{ hash="-239432727" }, -- sheriff towtruck
	{ hash="-545384401" }, -- highway cruiser
	{ hash="-57703123" }, -- highway buffalo
	{ hash="2005531687" }, -- highway byke
}

Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(vehicles) do 
		SetVehicleModelIsSuppressed(v.hash, true)
	end
end)