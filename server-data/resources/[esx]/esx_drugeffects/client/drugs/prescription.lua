-- Prescription is the abstract base class for all legal drugs and should never be used directly.
Prescription = {}

function Prescription:new(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

function Prescription:animate()
    local player = PlayerPedId()
    local ad     = "mp_suicide"
    local anim   = "pill"

    while (not HasAnimDictLoaded(ad)) do
        RequestAnimDict(ad)
        Citizen.Wait(5)
    end

    TaskPlayAnim(player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
    Citizen.Wait(2750)
    ClearPedTasks(player)
end

-- Override in subclasses for drug-specific behavior
function Prescription:use()
end

-- Override in subclasses for drug-specific behavior
function Prescription:wearOff()
end