-- Narcotic is the abstract base class for all illegal drugs and should never be used directly.
Narcotic = {}

function Narcotic:new(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

function Narcotic:animate()
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, true) then
        local ad    = "amb@code_human_in_car_mp_actions@smoke@std@ds@base" --- insert the animation dic here
        local anims = { "enter", "idle_a", "exit" }
        local x,y,z = table.unpack(GetEntityCoords(player))
        local prop  = CreateObject(GetHashKey("prop_sh_joint_01"), x, y, z+0.2,  true,  true, true)

        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, -0.05, 105.0, -20.0, 90.0, true, true, false, true, 1, true)

        for i = 0, #anims, 1 do
            TaskPlayAnim(playerPed, ad, anims[i], 8.0, 1.0, -1, 48, 0, 0, 0, 0 )
            Wait(2000)
        end

        DetachEntity(prop, 1, 1)
        ClearPedTasks(playerPed)
    else
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    end
end

-- Override in subclasses for drug-specific behavior
function Narcotic:use()
end

-- Override in subclasses for drug-specific behavior
function Narcotic:wearOff()
end