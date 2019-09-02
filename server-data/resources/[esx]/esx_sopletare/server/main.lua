ESX = nil

JokeFinds = {
    'used condom',
    'dirty diaper',
    'junkie needle',
    'nude polaroid of Barlow\'s mom',
    'empty lube bottle',
    'used buttwipes',
    'half-eaten turkey sandwich',
    'dead hooker',
    'Grinkle\'s eye',
    'Punk\'s left testicle',
    'apple pie with a single hole in it',
    'dead opossum full of maggots',
    'rotten pickle',
    'bloody, autographed dildo signed \"Berries\"',
    'bloody, broken bat engraved with \"Sadia\"',
    'turned on, battery powered vibrator covered in ketchup',
    'turd',
    'dead gigolo',
    'torn apart sex doll',
    'birthday cake',
    'VHS of scrambled porn',
    'rusty nails',
    'plastic baggies filled with yellow liquid',
    'worn out copy of the Kama Sutra',
    'used pregnancy test(positive)',
    'spoopy halloween decorations'
}

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_sopletare:getItem')
AddEventHandler('esx_sopletare:getItem', function()

    local luck = math.random(1, 10)

    if luck == 1 then

        local items = { -- add whatever items you want here
            'bionictrigger',
            'clip',
            'firingpin',
            'bobbypen',
            'gunpowder',
            'ring',
            'rubberband',
            'silverchain',
            'stud',
            'pistolbody',
            'coke_pooch',
            'weed_pooch',
            'meth_pooch',
            'opium_pooch',
            'pistolbarrel',
            'toolbox',
            'battery',
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = 1
        local itemfound = ESX.GetItemLabel(randomItems)

        player.addInventoryItem(randomItems, quantity)
        sendNotification(source, 'You found ' .. quantity .. ' ' .. itemfound, 'success', 2500)

    elseif luck == 10 then

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
        local rand = math.random(1, 10)
        if rand <= 3 then
            sendNotification(source, 'You found a(n) ' .. JokeFinds[math.random(1, #JokeFinds)] .. '. Gross!', 'error', 2000)
        else
            sendNotification(source, 'You found nothing, get a job you bum', 'error', 2000)
        end
    end
end)