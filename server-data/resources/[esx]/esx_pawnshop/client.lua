local Keys = {
 ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
 ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
 ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
 ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
 ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
 ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
 ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
 ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
 ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
   
ESX = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local blips = {
      {title="Pawn Shop", colour=69, id=434, x = 412.31, y = 314.11, z = 103.02}
}
 
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        DrawMarker(Config.MarkerType, Config.Pawnshop.x, Config.Pawnshop.y, Config.Pawnshop.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 255, 0, 0, 0, 0)
    end
end)

-- Enter/Exit Marker
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local isInMarker, letSleep = false, true

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pawnshop.x, Config.Pawnshop.y, Config.Pawnshop.z)

            if dist <= 1.5 then
                isInMarker, letSleep = true, false
				hintToDisplay('Press ~INPUT_CONTEXT~ to open ~b~the store~w~')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenPawnMenu()
                end		
            end

            if isInMarker and not HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = true
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('esx_pawnshop:hasExitedMarker')
                letSleep = true
            end

            if letSleep then
				Citizen.Wait(500)
			end
    end
end)

AddEventHandler('esx_shops:hasExitedMarker', function()
	ESX.UI.Menu.CloseAll()
end)

function OpenPawnMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawn_menu', {
        title = 'Pawnshop',
        align = 'right',
        elements = {
            {label = 'Sell Items', value = 'sellItems'},
            {label = 'Sell Weapons', value = 'sellWeapons'}
        }
    }, function(data, menu)
        if data.current.value == 'sellItems' then
            menu.close()
            OpenItemSaleMenu()
        elseif data.current.value == 'sellWeapons' then
            menu.close()
            OpenWeaponSaleMenu()
        end

        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

function OpenItemSaleMenu()
    local saleElements = {}

    for k,v in pairs (Config.SaleItems) do 
        table.insert(saleElements, {
            label = v.label,
            item = v.item,
            price = v.price,

        -- menu properties
			value      = 1,
			type       = 'slider',
			min        = 1,
			max        = 50
        })
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawn_sell_menu', {
            title    = 'What would you like to sell?',
            align = 'right',
            elements = saleElements
    }, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title = 'shop confirmation',
			align    = 'right',
			elements = {
                {label = 'yes', value = 'yes'},
                {label = 'no',  value = 'no'}
			}
		}, function(data2, menu2)
            if data2.current.value == 'yes' then
				TriggerServerEvent('esx_pawnshop:sellItem', data.current.label, data.current.item, data.current.price, data.current.value)
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
    end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenWeaponSaleMenu()
    local saleElements = {}

    for k,v in pairs (Config.SaleWeapons) do 
        table.insert(saleElements, {
            label = v.label,
            item = v.weapon,
            price = v.price,

        })
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawn_sell_menu', {
            title    = 'What would you like to sell?',
            align = 'right',
            elements = saleElements
    }, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title = 'shop confirmation',
			align    = 'right',
			elements = {
                {label = 'yes', value = 'yes'},
                {label = 'no',  value = 'no'}
			}
		}, function(data2, menu2)
            if data2.current.value == 'yes' then
				TriggerServerEvent('esx_pawnshop:sellWeapon', data.current.label, data.current.item, data.current.price)
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
    end,
        function(data, menu)
            menu.close()
        end
    )
end



