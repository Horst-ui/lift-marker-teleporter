Config                            = {}
Config.DrawDistance               = 100.0
Config.EnableVehicleTeleport      = false                  -- Allow to teleport with the vehicle your sitting in if true)  
Config.EnableJob                  = false                  -- Shows it only for a Job if true
Config.Job                        = {name = 'Jobname'}     -- The job which is allowed to see the Marker


--You can add more Teleport markers here

Config.Marker = {

    Point1 = {
        Pos = { x = 380.4, y = -15.17, z = 83.00 },
        Size = { x = 1.0, y = 1.0, z = 1.0 },
        Color = { r = 0, g = 0, b = 0 },
        Type = 20,
        Name = 'heading of the Teleport Menu',
        Teleport1 = { x = 415.04, y = -15.29, z = 99.10, heading = 252.31, msg = 'where it teleports you' },
        Teleport2 = { x = 388.03, y = 2.5,    z = 91.42, heading = 243.16, msg = 'where it teleports you', works = true },              -- If 'works = true' it adds this teleport function to the table (useful for lifts)
    },

-----------------

    Point2 = {
        Pos = { x = 415.04, y = -15.29, z = 99.65 },
        Size = { x = 1.0, y = 1.0, z = 1.0 },
        Color = { r = 0, g = 0, b = 0 },
        Type = 20,
        Name = 'heading of the Teleport Menu',
        Teleport1 = { x = 380.4, y = -15.17,  z = 82.20, heading = 28.67, msg = 'where it teleports you' },
        Teleport2 = { x = 380.4, y = -15.17,  z = 82.20, heading = 28.67, msg = 'where it teleports you', works = false },
    },

-----------------

    --Point3 = {
        --Pos = { x = 415.04, y = -15.29, z = 99.65 },
        --Size = { x = 1.0, y = 1.0, z = 1.0 },
        --Color = { r = 0, g = 0, b = 0 },
        --Type = 20,
        --Name = 'The heading of the Teleport Menu',
        --Teleport1 = { x = 380.4, y = -15.17,  z = 82.20, heading = 28.67, msg = 'where it teleports you' },
        --Teleport2 = { x = 380.4, y = -15.17,  z = 82.20, heading = 28.67, msg = 'where it teleports you', works = false },
    --},


}









