MarkerController = {}

function MarkerController:new(object)
    object = object or {}
    object.isDrawing     = false
    object.markers       = {}
    object.nearestMarker = nil

    setmetatable(object, self)
    self.__index = self
    return object
end

function MarkerController:init(data)
    self.playerPed = PlayerPedId()
    self.markers   = data

    for i = 1, #self.markers, 1 do
        self.markers[i].position = vector3(self.markers[i].x, self.markers[i].y, self.markers[i].z)
    end
end

function MarkerController:draw()
    if self.isDrawing then
        return
    end

    self.isDrawing = true

    Citizen.CreateThread(function()
        while self.isDrawing do
            Citizen.Wait(0)

            DrawMarker(Config.MarkerType,
                self.nearestMarker.position,
                0.0, 0.0, 0.0, -- direction
                0.0, 0.0, 0.0, -- rotation
                1.0, 1.0, 1.0, -- scale
                Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, -- rgba
                false, -- bob up/down
                true,  -- face camera
                2,     -- ?
                false, -- rotate only on heading
                false, -- textureDict
                false, -- textureName
                false) -- draw on intersecting entities
        end
    end)
end

-- @param lag time since the last update (in ms)
function MarkerController:update(lag)
    if #self.markers <= 0 then
        return
    end

    if lag >= 30000 then
        self.playerPed = PlayerPedId()
    end

    self.playerCoords = GetEntityCoords(self.playerPed)

    for i = 1, #self.markers, 1 do
        self.markers[i].distance = GetDistanceBetweenCoords(self.playerCoords, self.markers[i].position, true)

        if i == 1 or self.markers[i].distance <= self.markers[i - 1].distance then
            self.nearestMarker = self.markers[i]
        end
    end

    if self.nearestMarker.distance <= 20 then
        self:draw()
    else
        self.isDrawing = false
    end
end
