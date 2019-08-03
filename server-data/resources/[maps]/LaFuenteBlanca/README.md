# LaFuenteBlanca
Open interior for La Fuente Blanca, Madrazo ranch

Simple drag and drop resource for fivem

Drag twiztedblanca to your resource folder open server.cfg and add 

start twiztedblanca

start your server.

If you want lockable doors, download esx_doorlock and add
```
-- blanca main
    {
        objName = 'v_ilev_ra_door4r',
        objYaw = 90.0,
        objCoords  = vector3(1395.998, 1141.85, 114.64),
        textCoords = vector3(1395.998, 1141.85, 114.64),
        authorizedJobs = { 'cartel' },
        locked = true
    },
    {
        objName = 'v_ilev_ra_door4l',
        objYaw = -90.0,
        objCoords  = vector3(1395.998, 1141.85, 114.64),
        textCoords = vector3(1395.998, 1141.85, 114.64),
        authorizedJobs = { 'cartel' },
        locked = true
    },
-- Glassdoors blanca side
    {
        objName = 'v_ilev_ra_door1_l',
        objYaw = -180.0,
        objCoords  = vector3(1400.42, 1128.18, 114.33),
        textCoords = vector3(1400.42, 1128.18, 114.33),
        authorizedJobs = { 'cartel' },
        locked = true
    },
    {
        objName = 'v_ilev_ra_door1_r',
        objYaw = 180.0,
        objCoords  = vector3(1400.42, 1128.18, 114.33),
        textCoords = vector3(1400.42, 1128.18, 114.33),
        authorizedJobs = { 'cartel' },
        locked = true
    },
--  Glassdoors blanca front
    {
        objName = 'v_ilev_ra_door1_r',
        objYaw = 90.0,
        objCoords  = vector3(1390.68, 1132.16, 114.33),
        textCoords = vector3(1390.68, 1132.16, 114.33),
        authorizedJobs = { 'cartel' },
        locked = true
    },
    {
        objName = 'v_ilev_ra_door1_l',
        objYaw = 90.0,
        objCoords  = vector3(1390.68, 1132.16, 114.33),
        textCoords = vector3(1390.68, 1132.16, 114.33),
        authorizedJobs = { 'cartel' },
        locked = true
    },
```
