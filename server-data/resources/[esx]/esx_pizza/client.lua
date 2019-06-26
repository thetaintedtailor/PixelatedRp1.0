
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


local nbPizza = 0
--CONFIGURATION--

local pizzeria = { x = -1285.73, y = -1387.15, z = 3.44} --Configuration marker for starting job
local pizzeriafin = { x = -1275.69, y = -1389.95, z = 3.37} --Configuration marker for finishing job
local spawnfuto = { x = -1283.80, y = -1392.99, z = 4.43 } --Configuration for futo spawn point

local livpt = { --Configure delivery points 
[1] = {name = "Vinewood Hills",x = -1220.50, y = 666.95 , z = 143.10},
[2] = {name = "Vinewood Hills",x = -1338.97, y = 606.31 , z = 133.37},
[3] = {name = "Rockford Hills",x = -1051.85, y = 431.66 , z = 76.06 },
[4] = {name = "Rockford Hills",x = -904.04 , y = 191.49 , z = 68.44 },
[5] = {name = "Rockford Hills",x = -21.58  , y = -23.70 , z = 72.24 },
[6] = {name = "Hawick"        ,x = -904.04 , y = 191.49 , z = 68.44 },
[7] = {name = "Alta"          ,x = 225.39  , y = -283.63, z = 48.34 },
[8] = {name = "Pillbox Hills" ,x = 5.62    , y = -707.72, z = 44.97 },
[9] = {name = "Mission Row"   ,x = 284.50  , y = -938.50 , z = 28.35},
[10] ={name = "Rancho"        ,x = 411.59  , y = -1487.54, z = 29.14},
[11] ={name = "Davis"         ,x = 85.19   , y = -1958.18, z = 20.12},
[12] ={name ="Chamberlain Hills",x = -213.00, y =-1617.35 , z =36.85},
[13] ={name ="La puerta"      ,x = -1015.65, y =-1515.05 ,z = 5.51},
[14] ={name ="Customer Location" ,x= -1004.788, y=-1154.824,z = 1.04603},
[15] ={name ="Customer Location" ,x= -1113.937, y=-1193.136,z = 1.327304},
[16] ={name ="Customer Location" ,x= -1075.903, y=-1026.452,z = 3.531562},
[17] ={name ="Customer Location" ,x= -1056.485, y=-1001.234,z = 1.139098},
[18] ={name ="Customer Location" ,x= -1090.886, y=-926.188,z = 2.130009},
[19] ={name ="Customer Location" ,x= -1075.903, y=-1026.452,z = 3.531562},
[20] ={name ="Customer Location" ,x= -1181.652, y=-988.6455,z = 1.134243},
[21] ={name ="Customer Location" ,x= -1151.11, y=-990.905,z = 1.038789},
[22] ={name ="Customer Location" ,x= -1022.788, y=-896.3149,z = 4.408271},
[23] ={name ="Customer Location" ,x= -1060.738, y=-826.829,z = 18.19866},
[24] ={name ="Customer Location" ,x= -968.6487, y=-1329.453,z = 4.644861},
[25] ={name ="Customer Location" ,x= -1185.5, y=-1386.238,z = 3.512149},
[26] ={name ="Customer Location" ,x= -1132.848, y=-1456.029,z = 3.872081},
[27] ={name ="Customer Location" ,x= -1125.602, y=-1544.203,z = 4.891256},
[28] ={name ="Customer Location" ,x= -1084.74, y=-1558.709,z = 3.60145},
[29] ={name ="Customer Location" ,x= -1098.367, y=-1679.272,z = 3.353804},
[30] ={name ="Customer Location" ,x= -1155.863, y=-1574.202,z = 7.844403},
[31] ={name ="Customer Location" ,x= -1122.675, y=-1557.524,z = 4.777201},
[32] ={name ="Customer Location" ,x= -1108.679, y=-1527.393,z = 5.765457},
[33] ={name ="Customer Location" ,x= -1273.549, y=-1382.664,z = 3.31341},
[34] ={name ="Customer Location" ,x= -1342.454, y=-1234.849,z = 4.920023},
[35] ={name ="Customer Location" ,x= -1351.21, y=-1128.669,z = 3.126104},
[36] ={name ="Customer Location" ,x= -1343.232, y=-1043.639,z = 6.803696},
[37] ={name ="Customer Location" ,x= -729.2556, y=-880.1547,z = 21.72747},
[38] ={name ="Customer Location" ,x= -831.3006, y=-864.8558,z = 19.72383},
[39] ={name ="Customer Location" ,x= -810.4093, y=-978.4364,z = 12.74061},
[40] ={name ="Customer Location" ,x= -683.8874, y=-876.8568,z = 23.52004},
[41] ={name ="Customer Location" ,x= -1031.316, y=-903.0217,z = 3.192086},
[42] ={name ="Customer Location" ,x= -1262.703, y=-1123.342,z = 7.192357},
[43] ={name ="Customer Location" ,x= -1225.079, y=-1208.524,z = 7.119214},
[44] ={name ="Customer Location" ,x= -1207.095, y=-1263.851,z = 5.878308},
[45] ={name ="Customer Location" ,x= -1086.787, y=-1278.122,z = 4.59411},
[46] ={name ="Customer Location" ,x= -886.1298, y=-1232.698,z = 4.506698},
[47] ={name ="Customer Location" ,x= -753.5927, y=-1512.016,z = 3.870816},
[48] ={name ="Customer Location" ,x= -696.3545, y=-1386.89,z = 4.346177},
[49] ={name ="Steamboat Beers" , x= -1209.70, y=-1384.15,z = 3.06},
[50] ={name ="Customer Location" , x= -1109.87, y=-1481.31,z = 3.90},
[51] ={name ="Customer Location" , x= -1135.79, y=-1468.75,z = 3.61},
[52] ={name ="Customer Location" , x= -1349.96, y=-1161.60,z = 3.51},
[53] ={name ="County Lifeguard" , x= -1482.54, y=-1030.33, z = 5.15},
[54] ={name ="Customer Location" , x= -1040.63, y=-1475.03, z = 4.58},
[55] ={name ="Customer Location" , x= -1130.35, y=-1496.31, z = 3.43},
[56] ={name ="Customer Location" , x= -1118.51, y=-1487.06, z = 3.70},
[57] ={name ="Customer Location" , x= -1117.59, y=-1439.53, z = 4.11},
}

local blips = {
  {title="Pizzeria", colour=36, id=103, x = -1285.73, y = -1387.15, z = 3.44}, --Configuration du point sur la carte
}

local coefflouze = 0.1 --Coeficient multiplicateur qui en fonction de la distance definit la paie

--INIT--

local isInJobPizz = false
local livr = 0
local plateab = "PIZJOBS"
local isToHouse = false
local isToPizzaria = false
local paie = 0

local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0

--THREADS--

Citizen.CreateThread(function() --Thread d'ajout du point de la pizzeria sur la carte

  for _, info in pairs(blips) do

    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

end)

Citizen.CreateThread(function() --Thread lancement + livraison depuis le marker vert
  while true do

    Citizen.Wait(0)

    if isInJobPizz == false then

      DrawMarker(1,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Press ~INPUT_CONTEXT~ to start delivering ~r~pizza",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
            notif = true
            isInJobPizz = true
            isToHouse = true
            livr = math.random(1, 57)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z
            distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
            paie = distance * coefflouze

            spawn_futo()
            goliv(livpt,livr)
            nbPizza = math.random(1, 6)

            TriggerServerEvent("pizza:itemadd", nbPizza)
        end
      end
    end

    if isToHouse == true then

      destinol = livpt[livr].name

      while notif == true do

        TriggerEvent("pNotify:SendNotification", {
          text = "Go to : " ..destinol.. " to deliver pizza",
          type = "info",
          queue = "global",
          timeout = 4000,
          layout = "bottomRight"
        })

        notif = false

        i = 1
      end

      DrawMarker(1,livpt[livr].x,livpt[livr].y,livpt[livr].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
        HelpText("Press ~INPUT_CONTEXT~ to deliver pizza",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then

          notif2 = true
          posibilidad = math.random(1, 100)
          afaitunepizzamin = true

          TriggerServerEvent("pizza:itemrm")
          nbPizza = nbPizza - 1

          if (posibilidad > 70) and (posibilidad < 90) then

            pourboire = math.random(100, 200)

            TriggerEvent("pNotify:SendNotification", {
              text = "$" .. pourboire .. " : You received a tip! ",
              type = "success",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })

            TriggerServerEvent("pizza:pourboire", pourboire)

          end

          RemoveBlip(liv)
          Wait(250)
          if nbPizza == 0 then
            isToHouse = false
            isToPizzaria = true
          else
            isToHouse = true
            isToPizzaria = false
            livr = math.random(1, 57)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z

            distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
            paie = distance * coefflouze

            goliv(livpt,livr)
          end


        end
      end
    end

    if isToPizzaria == true then

      while notif2 == true do
        SetNewWaypoint(pizzeria.x,pizzeria.y)

        TriggerEvent("pNotify:SendNotification", {
          text = "Go back to the Pizzeria for more deliveries!",
          type = "info",
          queue = "global",
          timeout = 4000,
          layout = "bottomRight"
        })

        notif2 = false

      end
      DrawMarker(1,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeria.x,pizzeria.y,pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 and afaitunepizzamin == true then
        HelpText("Press ~INPUT_CONTEXT~ for more deliveries",0,1,0.5,0.8,0.6,255,255,255,255)

        --if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("futo"))  then

          if IsControlJustPressed(1,38) then

            --if IsInVehicle() then

              afaitunepizzamin = false

              TriggerEvent("pNotify:SendNotification", {
                text = "$" .. paie .. " : Delivery Payment ",
                type = "success",
                queue = "global",
                timeout = 4000,
                layout = "bottomRight"
              })

              TriggerServerEvent("pizza:pourboire", paie)

              isInJobPizz = true
              isToHouse = true
              livr = math.random(1, 57)

              px = livpt[livr].x
              py = livpt[livr].y
              pz = livpt[livr].z

              distance = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
              paie = distance * coefflouze

              goliv(livpt,livr)
              nbPizza = math.random(1, 6)

              TriggerServerEvent("pizza:itemadd", nbPizza)
            --end
          end
       --end
      end
    end
    if IsEntityDead(GetPlayerPed(-1)) then

      isInJobPizz = false
      livr = 0
      isToHouse = false
      isToPizzaria = false

      paie = 0
      px = 0
      py = 0
      pz = 0
      RemoveBlip(liv)

    end
  end
end)



Citizen.CreateThread(function() -- Thread de "fin de service" depuis le point rouge
  while true do

    Citizen.Wait(0)

    if isInJobPizz == true then

      DrawMarker(1,pizzeriafin.x,pizzeriafin.y,pizzeriafin.z, 0, 0, 0, 0, 0, 0, 4.5001, 4.5001, 1.0001,255,0,0,200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(pizzeriafin.x, pizzeriafin.y, pizzeriafin.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Press ~INPUT_CONTEXT~ to stop delivering ~r~pizza",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
          TriggerServerEvent('pizza:deleteAllPizz')
          isInJobPizz = false
          livr = 0
          isToHouse = false
          isToPizzaria = false

          paie = 0
          px = 0
          py = 0
          pz = 0
          RemoveBlip(liv)
          SetWaypointOff()

          if afaitunepizzamin == true then

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )

            TriggerEvent("pNotify:SendNotification", {
              text = "You have stopped working.",
              type = "success",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })

            TriggerServerEvent("pizza:paiefinale")

            SetWaypointOff()

            afaitunepizzamin = false

          else

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )

            TriggerEvent("pNotify:SendNotification", {
              text = "You have stopped working",
              type = "error",
              queue = "global",
              timeout = 4000,
              layout = "bottomRight"
            })
          end
        end
      end
    end
  end
end)

--FONCTIONS--

function goliv(livpt,livr) -- Add waypoint according to the delivery destination
  liv = AddBlipForCoord(livpt[livr].x,livpt[livr].y, livpt[livr].z)
  SetBlipSprite(liv, 1)
  SetNewWaypoint(livpt[livr].x,livpt[livr].y)
end

function spawn_futo() -- Thread spawn futo

  Citizen.Wait(0)

  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('futo')

  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end

  local plateJob = math.random(1000, 9999)
  local spawned_car = CreateVehicle(vehicle, spawnfuto.x,spawnfuto.y,spawnfuto.z, 431.436, - 996.786, 25.1887, true, false)

  local plate = "PIZZ"..plateJob

  SetVehicleNumberPlateText(spawned_car, plate)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleLivery(spawned_car, 2)
  SetPedIntoVehicle(myPed, spawned_car, - 1)
  SetModelAsNoLongerNeeded(vehicle)

  Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) ) --Native qui del le vehicule
end

function IsInVehicle() --Fonction de verification de la presence ou non en vehicule du joueur
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Appuyez sur ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
