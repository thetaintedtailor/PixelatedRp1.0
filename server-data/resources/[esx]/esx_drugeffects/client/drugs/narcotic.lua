Narcotic = {}

function Narcotic:new(object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

-- Override in subclasses for drug-specific behavior
function Narcotic:use()
end

-- Override in subclasses for drug-specific behavior
function Narcotic:wearOff()
end