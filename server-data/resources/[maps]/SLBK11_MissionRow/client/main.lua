local Interior = GetInteriorAtCoords(440.84, -983.14, 30.69)

LoadInterior(Interior)

Citizen.CreateThread(function()
    while (true) do
        ClearAreaOfPeds(440.84, -983.14, 30.69, 300, 1)
        Citizen.Wait(0)
    end
end)