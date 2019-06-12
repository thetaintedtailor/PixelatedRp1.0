ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_sopletare:getItem')
AddEventHandler('esx_sopletare:getItem', function()

    local luck = math.random(1, 15)

    if luck == 1 then

        local items = { -- add whatever items you want here
            'bionictrigger',
            'shotgunbody',
            'clip',
            'firingpin',
            'arbarrel',
            'bobbypen',
            'choke',
            'gunpowder',
            'ring',
            'rubberband',
            'silverchain',
            'stud',
            'apbody',
            'pistolbody',
            'smgbody',
            'upper',
            'coke_pooch',
            'weed_pooch',
            'meth_pooch',
            'opium_pooch',
            'spring',
            'shotgunbarrel',
            'pistolbarrel',
            'smgbarrel',
            'toolbox',
            'battery',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You found ' .. quantity .. ' ' .. itemfound, 'success', 2500)

    elseif luck == 15 then

        local weapons = { -- add whatever weapons you want here
            'WEAPON_KNIFE',
            'WEAPON_MACHETE',
            'WEAPON_SWITCHBLADE',
            'WEAPON_HATCHET',
            'WEAPON_GOLFCLUB',
            'WEAPON_HAMMER',

        }

        local player = ESX.GetPlayerFromId(source)
        local randomWeapons = weapons[math.random(#weapons)]
        local quantity = math.random(#weapons)
        local weaponfound = ESX.GetWeaponLabel(randomWeapons)

        player.addWeapon(randomWeapons, quantity)
        sendNotification(source, 'You found a ' .. weaponfound, 'success', 2500)
    else
        sendNotification(source, 'You found nothing, get a job you fucking bum', 'error', 2000)
    end
end)