MarkerController = {}

function MarkerController:new(object)
    object = object or {}
    object.updateCadence = 10000
    object.markers = {}
    setmetatable(object, self)
    self.__index = self
    return object
end

function MarkerController:init(data)
    self.markers = data
end

function MarkerController:render()
    for i = 1, #self.markers, 1 do
        local markerCoords = vector3(self.markers[i].x, self.markers[i].y, self.markers[i].z)
        local distance     = self.markers[i].distance

        if distance and distance <= 100 then
            DrawMarker(Config.MarkerType,
                markerCoords,
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

        if distance and distance <= 1.2 then
            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to mix a drink.")
        end
    end
end

function MarkerController:update()
    if #self.markers <= 0 then
        return
    end

    self.playerPed    = PlayerPedId()
    self.playerCoords = GetEntityCoords(self.playerPed)

    local isInRange = false

    for i = 1, #self.markers, 1 do
        local markerCoords = vector3(self.markers[i].x, self.markers[i].y, self.markers[i].z)
        local distance     = GetDistanceBetweenCoords(self.playerCoords, markerCoords, true)

        self.markers[i].distance = distance

        if distance <= 100 then
            isInRange = true
        end
    end

    if isInRange then
        self.updateCadence = 2000
    end
end
