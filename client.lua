local PlayerData              = {}
local isInMarker              = false



ESX                           = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

  ESX.PlayerData = ESX.GetPlayerData()

end)

AddEventHandler('easyteleport:teleport1', function(position1)
  if IsPedInAnyVehicle(GetPlayerPed(-1), true) and Config.EnableVehicleTeleport then
    SetEntityCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), position1.x, position1.y, position1.z)
    SetEntityHeading(GetVehiclePedIsUsing(GetPlayerPed(-1)), heading1.heading)
  else

    SetEntityCoords(GetPlayerPed(-1), position1.x, position1.y, position1.z)
    SetEntityHeading(GetPlayerPed(-1), position1.heading)
  end  

end)


AddEventHandler('easyteleport:teleport2', function(position2)
  if IsPedInAnyVehicle(GetPlayerPed(-1), true) and Config.EnableVehicleTeleport then
    SetEntityCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), position2.x, position2.y, position2.z)
    SetEntityHeading(GetVehiclePedIsUsing(GetPlayerPed(-1)), heading2.heading)
  else

    SetEntityCoords(GetPlayerPed(-1), position2.x, position2.y, position2.z)
    SetEntityHeading(GetPlayerPed(-1), position2.heading)
  end  

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	Citizen.Wait(5000)
end)


Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

            local coords = GetEntityCoords(GetPlayerPed(-1))

  
            for k,v in pairs(Config.Marker) do
                if (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) and Config.EnableJob and (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job.name) then

                  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)

                elseif (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) and not Config.EnableJob then

                  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)

                end
              
            end
          
    end
end)

  
Citizen.CreateThread(function()
 while true do
   Citizen.Wait(10)
   local coords      = GetEntityCoords(GetPlayerPed(-1))
   local position1   = nil
   local position2   = nil
   local zone        = nil

   
       for k,v in pairs(Config.Marker) do
         if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) and Config.EnableJob and (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Job.name) then

           isInMarker = true
           
           position1 = v.Teleport1
           position2 = v.Teleport2
           
           zone = v  

           break
         elseif (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) and not Config.EnableJob then

           isInMarker = true
           
           position1 = v.Teleport1
           position2 = v.Teleport2

           zone = v  

           break
         else

          isInMarker = false
         
          end
        end
          if isInMarker and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'teleport') and position2.works then
           
            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'teleport',
                   {
                    title    = zone.Name,
                    align    = 'top-right',
                    elements = {
                         {label = position1.msg,  value = 'teleport1'},
                         {label = position2.msg,  value = 'teleport2'},
                     },
                  },      

            function(data, menu)


                  if data.current.value == 'teleport1' then
                       TriggerEvent('easyteleport:teleport1', position1)
                       ESX.UI.Menu.CloseAll()
                  end

                  if data.current.value == 'teleport2' then
                      TriggerEvent('easyteleport:teleport2', position2)
                      ESX.UI.Menu.CloseAll()
                  end
              end,

            function(data, menu)
                  menu.close()
                  CurrentAction     = 'menu_teleport'
                  CurrentActionMsg  = ('Teleport menu')
                  CurrentActionData = {}
            end)

          elseif isInMarker and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'teleport') then

            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'teleport',
                   {
                    title    = zone.Name,
                    align    = 'top-right',
                    elements = {
                         {label = position1.msg,  value = 'teleport1'},
                     },
                  },      

            function(data, menu)
                  if data.current.value == 'teleport1' then
                       TriggerEvent('easyteleport:teleport1', position1)
                       ESX.UI.Menu.CloseAll()
                  end
              end,

            function(data, menu)
                  menu.close()
                  CurrentAction     = 'menu_teleport'
                  CurrentActionMsg  = ('Teleport menu')
                  CurrentActionData = {}
            end)

          elseif not isInMarker then

            ESX.UI.Menu.CloseAll()

          end
      end
end)



