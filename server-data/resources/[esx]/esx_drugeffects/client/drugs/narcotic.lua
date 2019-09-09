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
        -- Do something in a vehicle
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